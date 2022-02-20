local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 1000
f0_local1 = 2000
f0_local2 = 500
local f0_local3 = function ( f1_arg0 )
	if f1_arg0 ~= nil then
		LUI.UITimer.Stop( f1_arg0 )
		f1_arg0:close()
	end
end

local f0_local4 = function ( f2_arg0, f2_arg1 )
	f2_arg0:animateToState( "on", f0_local1 )
	f2_arg0.colorMap:animateToState( "on", f0_local1 )
	f0_local3( f2_arg0.timer )
	f2_arg0.timer = nil
end

local f0_local5 = function ( f3_arg0 )
	if f3_arg0.on then
		return 
	else
		f3_arg0.on = true
		f3_arg0.timer = LUI.UITimer.new( f0_local0, "timer_event", "hud", false )
		f3_arg0:registerEventHandler( "timer_event", f0_local4 )
		f3_arg0:addElement( f3_arg0.timer )
	end
end

local f0_local6 = function ( f4_arg0 )
	if not f4_arg0.on then
		return 
	else
		f0_local3( f4_arg0.timer )
		f4_arg0.timer = nil
		f4_arg0.on = false
		f4_arg0:animateToState( "off", f0_local2 )
		f4_arg0.colorMap:animateToState( "off", f0_local2 )
	end
end

local f0_local7 = function ( f5_arg0, f5_arg1 )
	if f5_arg1.value then
		f0_local5( f5_arg0 )
	else
		f0_local6( f5_arg0 )
	end
end

local f0_local8 = function ( f6_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	self.id = "overlayRootId"
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		alpha = 1,
		material = RegisterMaterial( "h1_airplane_overlay_blur" )
	} )
	self.id = "overlay_blurId"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		alpha = 1,
		red = 0,
		blue = 0,
		green = 0,
		material = RegisterMaterial( "h1_airplane_overlay" )
	} )
	self.id = "overlay_colormapId"
	self:addElement( self )
	f6_arg0:addElement( self )
	self.colorMap = self
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0,
		red = 0,
		blue = 0,
		green = 0
	} )
	self:registerAnimationState( "on", {
		alpha = 1,
		red = 1,
		blue = 1,
		green = 1
	} )
	self:registerOmnvarHandler( "ui_airplane_slowmo_overlay", f0_local7 )
	f0_local7( self, {
		name = "ui_airplane_slowmo_overlay",
		value = Game.GetOmnvar( "ui_airplane_slowmo_overlay" )
	} )
	return f6_arg0
end

local f0_local9 = function ( f7_arg0, f7_arg1 )
	if f7_arg1.value then
		f0_local8( f7_arg0 )
	end
end

LUI.MenuBuilder.registerType( "airplaneSlowMoOverlayType", function ()
	local self = LUI.UIElement.new( Engine.IsConsoleGame() and {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -360 * Engine.GetAspectRatio(),
		right = 360 * Engine.GetAspectRatio(),
		top = -360,
		bottom = 360
	} or {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	self.id = "rootId"
	self:registerOmnvarHandler( "ui_airplane_init", f0_local9 )
	f0_local9( self, {
		name = "ui_airplane_init",
		value = Game.GetOmnvar( "ui_airplane_init" )
	} )
	return self
end )
LockTable( _M )
