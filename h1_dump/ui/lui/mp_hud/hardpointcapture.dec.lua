local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function hardpointCapture()
	local f1_local0 = GameX.IsSplitscreen() and 45 or 50
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		bottom = GameX.IsSplitscreen() and 115 or 194,
		width = f1_local0,
		height = f1_local0,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "hardpointCapture"
	local f1_local2, f1_local3 = nil
	if MLG.IsMLGSpectator() then
		f1_local2 = "waypoint_esports_hardpoint_blue"
		f1_local3 = "waypoint_contested"
	else
		f1_local2 = "waypoint_defend"
		f1_local3 = "waypoint_contested"
	end
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		material = RegisterMaterial( f1_local2 )
	} )
	self:registerAnimationState( "contested", {
		material = RegisterMaterial( f1_local3 )
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.visible = true
	self.id = "icon"
	self:registerEventHandler( "update_player_ads", function ( element, event )
		local f2_local0 = event.playerIsZoomingIn or false
		local f2_local1 = event.zoomTime or 0
		if f2_local0 and element.visible == true then
			element:animateToState( "hide", f2_local1 )
			element.visible = false
		elseif element.visible == false then
			element:animateToState( "show", f2_local1 )
			element.visible = true
		end
	end )
	self:addElement( self )
	local f1_local5 = nil
	self:registerEventHandler( "hardpoint_refresh", function ( element, event )
		CheckPlayerADS( element )
	end )
	self:registerOmnvarHandler( "ui_hardpoint", function ( f4_arg0, f4_arg1 )
		if f4_arg1.value > 0 then
			f4_arg0:animateToState( "visible" )
			if f1_local5 == nil then
				f1_local5 = LUI.UITimer.new( 20, {
					name = "hardpoint_refresh"
				}, "hud" )
				f1_local5.id = "hardpointCaptureRefreshTimer_id"
				f4_arg0:addElement( f1_local5 )
			end
		else
			f4_arg0:animateToState( "default" )
			if f1_local5 ~= nil then
				f1_local5:close()
				f1_local5 = nil
			end
		end
		if f4_arg1.value == 1 then
			self:animateToState( "default" )
		elseif f4_arg1.value == 2 then
			self:animateToState( "contested" )
		end
	end )
	return self
end

LUI.MenuBuilder.registerType( "hardpointCapture", hardpointCapture )
LockTable( _M )
