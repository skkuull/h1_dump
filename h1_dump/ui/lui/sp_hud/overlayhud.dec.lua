local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.hudElem
	if f1_arg0.openOverlays[f1_local0] then
		return 
	else
		local f1_local1 = LUI.MenuBuilder.buildItems( {
			type = f1_local0
		}, f1_arg0.properties, f1_arg0 )
		f1_local1:registerEventHandler( f1_local0 .. "_hidden", function ( element, event )
			element:close()
			f1_arg0.openOverlays[f1_local0] = false
		end )
		f1_arg0.openOverlays[f1_local0] = true
		f1_arg0:addElement( f1_local1 )
		f1_local1:processEvent( {
			name = "init_overlay",
			omnvar = f1_arg1.omnvar,
			value = f1_arg1.value
		} )
	end
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.value == false then
		f3_arg0:dispatchEventToChildren( {
			name = "RecScreenShootingRangeMain_hidden"
		} )
	else
		require( "LUI.sp_menus.RecoveryScreen" )
		f3_arg0:dispatchEventToRoot( {
			name = "add_overlay",
			target = f3_arg0,
			hudElem = "RecScreenShootingRangeMain",
			omnvar = f3_arg1.omnvar,
			value = f3_arg1.value
		} )
	end
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	if f4_arg1.value == false then
		f4_arg0:dispatchEventToChildren( {
			name = "RecScreenGrenadeRangeMain_hidden"
		} )
	else
		require( "LUI.sp_menus.RecoveryScreen" )
		f4_arg0:dispatchEventToRoot( {
			name = "add_overlay",
			target = f4_arg0,
			hudElem = "RecScreenGrenadeRangeMain",
			omnvar = f4_arg1.omnvar,
			value = f4_arg1.value
		} )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	require( "LUI.sp_hud.GenericMeterHud" )
	if f5_arg1.value == true then
		f5_arg0:dispatchEventToRoot( {
			name = "add_overlay",
			target = f5_arg0,
			hudElem = "AR_GenericMeterHudDef",
			omnvar = f5_arg1.omnvar,
			value = f5_arg1.value
		} )
	elseif f5_arg1.value == false then
		f5_arg0:dispatchEventToChildren( {
			name = "AR_GenericMeterHudDef_hidden"
		} )
	end
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0:getFirstChild()
	while f6_local0 do
		f6_local0:processEvent( f6_arg1 )
		f6_local0 = f6_local0:getNextSibling()
	end
end

local f0_local5 = function ( f7_arg0 )
	local f7_local0 = Game.GetOmnvar( "ui_recovery_screen_shooting_range" )
	local f7_local1 = Game.GetOmnvar( "ui_recovery_screen_grenade_range" )
	local f7_local2 = Game.GetOmnvar( "ui_meterhud_enable" )
	f0_local1( f7_arg0, {
		name = "ui_recovery_screen_shooting_range",
		value = f7_local0
	} )
	f0_local2( f7_arg0, {
		name = "ui_recovery_screen_grenade_range",
		value = f7_local1
	} )
	f0_local3( f7_arg0, {
		name = "ui_meterhud_enable",
		value = f7_local2
	} )
end

LUI.MenuBuilder.registerType( "overlayHudDef", function ()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:registerAnimationState( "hud_on", {
		alpha = 1
	} )
	self:registerAnimationState( "hud_off", {
		alpha = 0
	} )
	self.id = "overlayId"
	self.openOverlays = {}
	self:registerOmnvarHandler( "ui_recovery_screen_shooting_range", f0_local1 )
	self:registerOmnvarHandler( "ui_recovery_screen_grenade_range", f0_local2 )
	self:registerOmnvarHandler( "ui_meterhud_enable", f0_local3 )
	self:registerEventHandler( "add_overlay", f0_local0 )
	f0_local5( self )
	return self
end )
LockTable( _M )
