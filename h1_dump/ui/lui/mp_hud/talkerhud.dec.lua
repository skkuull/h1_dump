local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = RegisterMaterial( "icon_online_chat" )
f0_local1 = RegisterMaterial( "icon_online_chat_enemy" )
f0_local2 = CoD.TextSettings.TitleFontTiny
local f0_local3 = GameX.IsSplitscreen() and 14 or 18
local f0_local4 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Game.PlayerHasPerk( "specialty_moreminimap" )
	local f1_local1 = Engine.GetDvarString( "ui_gametype" )
	if f1_local0 then
		f1_arg0:processEvent( {
			name = "extend"
		} )
	else
		f1_arg0:processEvent( {
			name = "contract"
		} )
	end
end

local f0_local5 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.newValue
	if f2_local0 ~= -1 then
		local f2_local1 = "active"
		local f2_local2 = Game.GetPlayerTeam()
		local f2_local3 = Game.GetPlayerTeam( f2_local0 )
		if f2_local2 == Teams.spectator then
			if f2_local3 == Teams.allies then
				f2_local1 = "active"
			else
				f2_local1 = "enemy"
			end
		elseif GetEnemyTeam( f2_local2 ) == f2_local3 then
			f2_local1 = "enemy"
		end
		local f2_local4 = f2_arg0:getFirstChild()
		f2_local4:setText( Game.GetPlayerName( f2_local0 ) )
		if f2_arg0.current_state ~= f2_local1 then
			f2_arg0:animateToState( f2_local1, 0 )
			f2_arg0.icon:animateToState( f2_local1, 0 )
			f2_arg0.current_state = f2_local1
		end
	elseif f2_arg0.current_state ~= "default" then
		f2_arg0:animateToState( "default", 250 )
		f2_arg0.current_state = "default"
	end
end

local f0_local6 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.newValue ~= 0 and f3_arg0.current_state ~= "talking" then
		f3_arg0:animateToState( "talking", 0 )
		f3_arg0.current_state = "talking"
	elseif f3_arg1.newValue == 0 and f3_arg0.current_state ~= "default" then
		f3_arg0:animateToState( "default", 150 )
		f3_arg0.current_state = "default"
	end
end

local f0_local7 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1 or f4_arg0
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		left = 0,
		top = f0_local3,
		width = 256,
		height = 256 - f0_local3,
		alignment = LUI.Alignment.Left,
		spacing = 0
	} )
	self.id = "talkersVLId"
	for f4_local2 = 1, 4, 1 do
		local self = LUI.UIElement.new( {
			leftAnchor = true,
			topAnchor = true,
			left = 0,
			top = 0,
			width = 256,
			height = f0_local3,
			alpha = 0
		} )
		self.id = "talkersChildrenContainerId" .. f4_local2
		self:registerAnimationState( "active", {
			alpha = 1
		} )
		self:registerAnimationState( "enemy", {
			alpha = 1
		} )
		self:addElement( self )
		local self = LUI.UIText.new( {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			left = f0_local3,
			top = 0,
			width = 800,
			height = f0_local3,
			font = f0_local2.Font,
			alignment = LUI.Alignment.Left
		} )
		self.id = "talkersNameTextId" .. f4_local2
		self:setTextStyle( CoD.TextStyle.Shadowed )
		self:addElement( self )
		
		local icon = LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			left = 0,
			top = 0,
			width = f0_local3,
			height = f0_local3,
			material = f0_local0
		} )
		icon.id = "talkersIconImageId" .. f4_local2
		icon:registerAnimationState( "active", {
			material = f0_local0
		} )
		icon:registerAnimationState( "enemy", {
			material = f0_local1
		} )
		self:addElement( icon )
		self.icon = icon
		
		local self = LUI.UIElement.new()
		self:setupUIIntWatch( "Talker", f4_local2 - 1 )
		self:registerEventHandler( "int_watch_alert", function ( element, event )
			f0_local5( element:getParent(), event )
		end )
		self:addElement( self )
	end
	f4_local0.talkersList = self
	f4_arg0:addElement( self )
end

LUI.MenuBuilder.registerType( "talkerHudDef", function ()
	local self = LUI.UIElement.new()
	local f6_local1 = not GameX.IsSplitscreen()
	local f6_local2 = GameX.IsSplitscreen() and -280 or 210
	local f6_local3 = GameX.IsSplitscreen() and -280 or 280
	local f6_local4 = GameX.IsSplitscreen() and 0 or 20
	self.id = "talkerHudId"
	self:registerAnimationState( "default", {
		leftAnchor = f6_local1,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = not f6_local1,
		top = f6_local4,
		left = f6_local2,
		height = 256,
		width = 256
	} )
	self:registerAnimationState( "extended", {
		leftAnchor = f6_local1,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = not f6_local1,
		top = f6_local4,
		left = f6_local3,
		height = 256,
		width = 256
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "hud_off", MBh.AnimateToState( "inactive", 0 ) )
	self:registerEventHandler( "hud_on", MBh.AnimateToState( "visible", 0 ) )
	self:registerEventHandler( "extend", MBh.AnimateToState( "extended", 0 ) )
	self:registerEventHandler( "contract", MBh.AnimateToState( "default", 0 ) )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "PlayerPerkChanged", Game.GetPerkIndexForName( "specialty_moreminimap" ) )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		f0_local4( element:getParent(), event )
	end )
	self:addElement( self )
	local self = LUI.UIImage.new()
	self.id = "talkerPlayerImageId"
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		left = 0,
		top = 0,
		height = f0_local3,
		width = f0_local3,
		material = f0_local0,
		alpha = 0
	} )
	self:registerAnimationState( "talking", {
		alpha = 1
	} )
	self:animateToState( "default" )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "Talking" )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		f0_local6( element:getParent(), event )
	end )
	self:addElement( self )
	self:addElement( self )
	f0_local7( self )
	return self
end )
LockTable( _M )
