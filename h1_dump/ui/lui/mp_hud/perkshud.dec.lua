local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function refreshAnimations( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetDvarBool( "g_oldschool" )
	local f1_local1 = Game.GetOmnvar( "ui_session_state" ) == "spectator"
	local f1_local2 = Game.GetPlayerClientnum() ~= Game.GetPlayerstateClientnum()
	local f1_local3 = 0
	for f1_local4 = 1, 3, 1 do
		local f1_local7 = f1_arg0["perk" .. f1_local4]
		f1_local7:cancelAnimateToState()
		if Game.GetPlayerPerkSlotMaterial( f1_local3 ) ~= nil then
			local f1_local8 = f1_local7.imageElement
			local f1_local9 = f1_local7.textElement
			if f1_local0 or f1_local2 and f1_local1 then
				local f1_local10 = {
					{
						"default",
						0
					},
					{
						"visible",
						0
					}
				}
				local f1_local11 = {
					{
						"default",
						0
					},
					{
						"visible",
						0
					},
					{
						"visible",
						3500
					},
					{
						"hidden",
						500
					}
				}
				f1_local7:animateInSequence( f1_local10 )
				f1_local7.textHolder:cancelAnimateToState()
				f1_local7.textHolder:animateInSequence( f1_local11 )
			elseif not f1_local1 then
				local f1_local10 = {
					{
						"default",
						0
					},
					{
						"visible",
						0
					},
					{
						"visible",
						3500
					},
					{
						"hidden",
						500
					}
				}
				f1_local7.textHolder:cancelAnimateToState()
				f1_local7.textHolder:animateToState( "visible", 0 )
				f1_local7:animateInSequence( f1_local10 )
			else
				f1_local7:animateToState( "hidden" )
			end
		else
			f1_local7:animateToState( "hidden" )
		end
		f1_local3 = f1_local3 + 1
	end
end

function updateSpecificPerkInfo( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = Engine.GetDvarBool( "g_oldschool" )
	local f2_local1 = Game.GetOmnvar( "ui_session_state" ) == "spectator"
	local f2_local2 = Game.GetPlayerPerkSlotMaterial( f2_arg1 )
	local f2_local3 = Game.GetPerkNameForSlot( f2_arg1 )
	if f2_local3 then
		local f2_local4 = Engine.Localize( f2_local3 )
	end
	f2_local3 = f2_local4 or ""
	f2_arg0:cancelAnimateToState()
	if f2_local2 ~= nil then
		local f2_local5 = f2_arg0.imageElement
		f2_arg0.textElement:setText( f2_local3 )
		f2_local5:registerAnimationState( "updateImage", {
			material = f2_local2
		} )
		f2_local5:animateToState( "updateImage" )
		if f2_local0 or f2_local1 then
			local f2_local6 = {
				{
					"default",
					0
				},
				{
					"visible",
					0
				}
			}
			local f2_local7 = {
				{
					"default",
					0
				},
				{
					"visible",
					0
				},
				{
					"visible",
					3500
				},
				{
					"hidden",
					500
				}
			}
			f2_arg0:animateInSequence( f2_local6 )
			f2_arg0.textHolder:cancelAnimateToState()
			f2_arg0.textHolder:animateInSequence( f2_local7 )
		else
			f2_arg0:animateInSequence( {
				{
					"default",
					0
				},
				{
					"visible",
					0
				},
				{
					"visible",
					3500
				},
				{
					"hidden",
					500
				}
			} )
		end
	elseif f2_local0 ~= true and f2_local1 ~= true then
		f2_arg0:animateToState( "hidden" )
	end
end

function perksHudDef( f3_arg0, f3_arg1 )
	local f3_local0 = 50
	local f3_local1 = 175
	local f3_local2 = 15
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	} )
	self.id = "perkInfo"
	for f3_local4 = 1, 3, 1 do
		local self = LUI.UIHorizontalList.new( {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = true,
			bottom = -270 + f3_local4 * f3_local0,
			left = -(f3_local0 + f3_local1 + f3_local2),
			alpha = 0,
			height = f3_local0,
			spacing = f3_local2
		} )
		self.id = "perksHList_" .. f3_local4
		local self = LUI.UIVerticalList.new( {
			width = f3_local1,
			topAnchor = true,
			top = 12,
			spacing = 3
		} )
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self:registerAnimationState( "visible", {
			alpha = 1
		} )
		if not Engine.GetDvarBool( "g_oldschool" ) then
			local self = LUI.UIText.new( {
				width = 100,
				height = 10,
				color = Colors.white,
				alignment = LUI.Alignment.Right,
				rightAnchor = true,
				font = CoD.TextSettings.BodyFontBold.Font
			} )
			self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CAC_PERK_BLANK", tostring( f3_local4 ) ) ) )
			self:addElement( self )
		end
		local self = LUI.UIText.new( {
			width = f3_local1,
			height = 14,
			color = Colors.white,
			alignment = LUI.Alignment.Right,
			rightAnchor = true,
			font = CoD.TextSettings.BodyFontBold.Font
		} )
		self:addElement( self )
		local self = LUI.UIImage.new( {
			width = f3_local0,
			height = f3_local0,
			bottomAnchor = true
		} )
		self.imageElement = self
		self.textElement = self
		self.textHolder = self
		self["perk" .. f3_local4] = self
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self:registerAnimationState( "visible", {
			alpha = 1
		} )
		self:addElement( self )
		self:addElement( self )
		local f3_local11 = f3_local4 - 1
		local self = LUI.UIElement.new( {} )
		self:setupUIIntWatch( "PerkSlotChanged", f3_local11 )
		self:registerEventHandler( "int_watch_alert", function ( element, event )
			updateSpecificPerkInfo( self, f3_local11, event )
		end )
		self:addElement( self )
		self:addElement( self )
	end
	self:registerEventHandler( "playerstate_client_changed", refreshAnimations )
	self:registerOmnvarHandler( "ui_class_changed_grace_period", refreshAnimations )
	return self
end

LUI.MenuBuilder.registerType( "perksHudDef", perksHudDef )
LockTable( _M )
