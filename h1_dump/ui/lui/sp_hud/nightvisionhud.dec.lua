local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.value then
		f1_arg0:animateToState( "on", 0 )
	else
		f1_arg0:animateToState( "off", 0 )
	end
end

f0_local1 = function ( f2_arg0 )
	f2_arg0:registerAnimationState( "off", {
		alpha = 0
	} )
	f2_arg0:registerAnimationState( "on", {
		alpha = 1
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		material = RegisterMaterial( "nvg_blur" )
	} )
	self.id = "nightvisionVisorId"
	f2_arg0:addElement( self )
	f2_arg0:registerOmnvarHandler( "ui_nightvision", f0_local0 )
	f0_local0( f2_arg0, {
		name = "ui_nightvision",
		value = Game.GetOmnvar( "ui_nightvision" )
	} )
	return f2_arg0
end

LUI.MenuBuilder.registerType( "NightVisionHudDef", function ()
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
	self.id = "nightvisionRootId"
	return f0_local1( self )
end )
LockTable( _M )
