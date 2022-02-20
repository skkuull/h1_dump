local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 250
f0_local1 = -1
f0_local2 = 89.6
local f0_local3 = 358.4
local f0_local4 = function ( f1_arg0, f1_arg1 )
	f0_local1 = f1_arg1.value
	local f1_local0 = Game.GetOmnvar( "ui_splash_optional_number" )
	local f1_local1 = nil
	if f1_arg0.prev_activeIntel ~= f0_local1 then
		f1_arg0.prev_activeIntel = f0_local1
		if f0_local1 >= 0 then
			f1_local1 = Engine.Localize( "@" .. Engine.TableLookupByRow( IntelChallengesTable.File, f0_local1, IntelChallengesTable.Cols.Name ), f1_local0 )
		else
			f1_arg0:processEvent( {
				name = "message_off"
			} )
		end
		if f1_local1 ~= nil then
			local f1_local2 = f1_arg0:getChildById( "intelChallengeBgId" )
			local f1_local3 = f1_arg0:getChildById( "intelChallengeTextId" )
			f1_local3:setText( f1_local1 )
			f1_arg0:processEvent( {
				name = "message_on",
				value = 500 + 1000 * tonumber( Engine.TableLookup( SplashTable.File, SplashTable.Cols.Ref, Engine.TableLookupByRow( IntelChallengesTable.File, f0_local1, IntelChallengesTable.Cols.Ref ), SplashTable.Cols.Duration ) )
			} )
		end
	end
end

local f0_local5 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.value
	local f2_local1 = nil
	if f2_local0 ~= -1 then
		f2_local1 = Engine.Localize( "@" .. Engine.TableLookupByRow( IntelChallengesTable.File, f0_local1, IntelChallengesTable.Cols.Name ), f2_local0 )
	end
	if f2_local1 ~= nil then
		local f2_local2 = f2_arg0:getChildById( "intelChallengeTextId" )
		f2_local2:setText( f2_local1 )
	end
end

LUI.MenuBuilder.registerType( "intelInfoHudDef", function ()
	local f3_local0 = RegisterMaterial( "hud_message_bg" )
	local f3_local1 = RegisterMaterial( "popup_icon_intel" )
	local self = LUI.UIElement.new()
	self.id = "intelInfoHud"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -80,
		left = 5,
		height = f0_local2,
		width = 0,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -80,
		left = 5,
		height = f0_local2,
		width = f0_local3,
		alpha = 1
	} )
	self:registerAnimationState( "opening", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -80,
		left = 5,
		height = f0_local2,
		width = f0_local3 + 40,
		alpha = 1
	} )
	self:registerAnimationState( "closing", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -80,
		left = 5,
		height = f0_local2,
		width = f0_local3,
		alpha = 1
	} )
	self:registerOmnvarHandler( "ui_intel_progress_current", f0_local5 )
	self:registerEventHandler( "hud_on", function ( element, event )
		if element.prev_activeIntel == f0_local1 and f0_local1 ~= -1 then
			local f4_local0 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"opening",
					f0_local0 / 2
				},
				{
					"active",
					f0_local0 / 2
				}
			} )
			f4_local0( element )
		end
	end )
	self:registerEventHandler( "message_on", function ( element, event )
		local f5_local0 = event.value
		if not event.value then
			f5_local0 = 0
		end
		local f5_local1 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"default",
				f5_local0
			},
			{
				"opening",
				f0_local0 / 2
			},
			{
				"active",
				f0_local0 / 2
			}
		} )
		f5_local1( element )
	end )
	self:registerEventHandler( "message_off", MBh.AnimateSequence( {
		{
			"active",
			0
		},
		{
			"closing",
			f0_local0 / 2
		},
		{
			"default",
			f0_local0 / 2
		}
	} ) )
	local self = LUI.UIImage.new()
	self.id = "intelChallengeBgId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = f3_local0
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIImage.new()
	self.id = "intelChallengeIconId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 15,
		left = 0,
		height = 64,
		width = 64,
		material = f3_local1
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIText.new()
	self.id = "intelChallengeHeaderTextId"
	self:setText( Engine.Localize( "@LUA_MENU_INTEL_CHALLENGE_CAPS" ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		top = 15,
		left = 64,
		height = CoD.TextSettings.BodyFont.Height,
		width = f0_local3 * 0.8,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Left,
		red = Colors.yellow.r,
		green = Colors.yellow.g,
		blue = Colors.yellow.b
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIText.new()
	self.id = "intelChallengeTextId"
	self:setText( "" )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		top = 35,
		left = 64,
		height = CoD.TextSettings.BodyFont.Height,
		width = f0_local3 * 0.6,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Left
	} )
	self:animateToState( "default", 0 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end )
LockTable( _M )
