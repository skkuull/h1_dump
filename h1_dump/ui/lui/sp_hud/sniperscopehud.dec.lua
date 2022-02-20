local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 0.9
f0_local1 = 0.1
f0_local2 = 0.15
local f0_local3 = 0.2
local f0_local4 = 0.2
local f0_local5 = 67.5
local f0_local6 = 37.5
local f0_local7 = 2
local f0_local8 = 6
local f0_local9 = 1
local f0_local10 = 0.7
local f0_local11 = 1.5
local f0_local12 = 70
local f0_local13 = 0.1
local f0_local14 = 35
local f0_local15 = 35
local f0_local16 = 950
local f0_local17 = 950
local f0_local18 = math.pi
local f0_local19 = 0
local f0_local20 = 0.1
local f0_local21 = 0.25
local f0_local22 = 0.1
local f0_local23 = 1279.87
local f0_local24 = 799.92
local f0_local25 = 768
local f0_local26 = 870.4
local f0_local27 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0._state ~= f1_arg1 then
		f1_arg0._state = f1_arg1
		f1_arg0:animateToState( f1_arg1, f1_arg2 )
	end
end

local f0_local28 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0 < f2_arg1 then
		return f2_arg1
	elseif f2_arg2 < f2_arg0 then
		return f2_arg2
	else
		return f2_arg0
	end
end

local f0_local29 = function ( f3_arg0 )
	f3_arg0:registerAnimationState( "on", {
		alpha = 1
	} )
	f3_arg0:registerAnimationState( "off", {
		alpha = 0
	} )
	return f3_arg0
end

local f0_local30 = function ( f4_arg0 )
	local f4_local0, f4_local1, f4_local2, f4_local3, f4_local4, f4_local5, f4_local6, f4_local7, f4_local8 = Game.GetPlayerVectors()
	local f4_local9 = math.acos( f4_local0 )
	local f4_local10 = math.acos( f4_local8 )
	if f4_local1 < 0 then
		f4_local9 = math.pi - f4_local9 + math.pi
	end
	if f4_local2 > 0 then
		f4_local10 = math.pi - f4_local10 + math.pi
	end
	if f4_arg0.firstRun then
		f4_arg0.forward.acosx = f4_local9
		f4_arg0.up.acosz = f4_local10
		f4_arg0.firstRun = false
	end
	local f4_local11 = nil
	local f4_local12 = math.abs( f4_local9 - f4_arg0.forward.acosx )
	if f0_local19 <= f4_local12 and f4_local12 <= f0_local18 then
		f4_local11 = math.acos( f0_local28( f4_local0 * f4_arg0.forward.x + f4_local1 * f4_arg0.forward.y + f4_local2 * f4_arg0.forward.z, -1, 1 ) )
		if f4_arg0.forward.acosx < f4_local9 then
			f4_local11 = -f4_local11
		end
	elseif f4_local12 == 0 then
		f4_local11 = 0
	else
		f4_local11 = f4_arg0.forward.delta
	end
	local f4_local13 = nil
	local f4_local14 = math.abs( f4_local10 - f4_arg0.up.acosz )
	if f0_local19 <= f4_local14 and f4_local14 <= f0_local18 then
		f4_local13 = math.acos( f0_local28( f4_local6 * f4_arg0.up.x + f4_local7 * f4_arg0.up.y + f4_local8 * f4_arg0.up.z, -1, 1 ) )
		if f4_local10 < f4_arg0.up.acosz then
			f4_local13 = -f4_local13
		end
	elseif f4_local14 == 0 then
		f4_local13 = 0
	else
		f4_local13 = f4_arg0.up.delta
	end
	f4_arg0.forward.delta = f4_arg0.forward.delta * (1 - f0_local13) + f4_local11 * f0_local13
	f4_arg0.up.delta = f4_arg0.up.delta * (1 - f0_local13) + f4_local13 * f0_local13
	f4_arg0.forward.x = f4_local0
	f4_arg0.forward.y = f4_local1
	f4_arg0.forward.z = f4_local2
	f4_arg0.forward.acosx = f4_local9
	f4_arg0.up.x = f4_local6
	f4_arg0.up.y = f4_local7
	f4_arg0.up.z = f4_local8
	f4_arg0.up.acosz = f4_local10
	local f4_local15 = 1 / f4_arg0.fov / f0_local12
	local f4_local16 = f4_arg0.forward.delta * f0_local16 * f4_local15
	local f4_local17 = f4_arg0.up.delta * f0_local17 * f4_local15
	f4_local16 = f0_local28( f4_local16, -f0_local14, f0_local14 )
	f4_local17 = f0_local28( f4_local17, -f0_local15, f0_local15 )
	f4_arg0.lensShadow:setLeftRight( false, false, -f0_local26 / 2 + f4_local16, -f0_local26 / 2 + f4_local16 + f0_local26 )
	f4_arg0.lensShadow:setTopBottom( false, false, -f0_local26 / 2 + f4_local17, -f0_local26 / 2 + f4_local17 + f0_local26 )
end

local f0_local31 = function ( f5_arg0 )
	if f5_arg0.attack then
		f5_arg0.recoilStartTime = f5_arg0.time
		f5_arg0.jitterStartTime = f5_arg0.time
		f5_arg0.jitterFov = f5_arg0.fov
	elseif f5_arg0.recoilStartTime == 0 and f5_arg0.jitterStartTime == 0 then
		return 
	end
	local f5_local0 = f5_arg0.time - f5_arg0.recoilStartTime
	local f5_local1 = f5_arg0.time - f5_arg0.jitterStartTime
	if f5_local1 < f0_local7 or f5_local0 < f0_local4 then
		local f5_local2 = 1 - (f5_arg0.jitterFov - f0_local11) / (f0_local12 - f0_local11)
		local f5_local3 = 1 - f5_local1 / f0_local7
		local f5_local4 = 1 - f5_local0 / f0_local4
		f5_local3 = f0_local28( f5_local3, 0, 1 )
		f5_local4 = f0_local28( f5_local4, 0, 1 )
		f5_local2 = (f0_local9 - f0_local10) * f0_local28( f5_local2, 0, 1 ) + f0_local10
		local f5_local5 = f5_local4 * f0_local2 + 1
		local f5_local6 = f5_local4 * f0_local3 + 1
		local f5_local7 = f5_local4 * f0_local1 + 1
		f5_local3 = math.pow( f5_local3 * f5_local2, f0_local8 )
		local f5_local8 = f5_local3 * f0_local5
		local f5_local9 = math.random( -math.pi, math.pi )
		local f5_local10 = math.random( -math.pi, math.pi )
		f5_local9 = math.cos( f5_local9 ) * f5_local8
		f5_local10 = math.sin( f5_local10 ) * f5_local8
		f5_arg0.reticle:setLeftRight( false, false, -(f0_local25 / 2 * f5_local5) + f5_local9, -(f0_local25 / 2 * f5_local5) + f5_local9 + f0_local25 * f5_local5 )
		f5_arg0.reticle:setTopBottom( false, false, -(f0_local25 / 2 * f5_local5) + f5_local10, -(f0_local25 / 2 * f5_local5) + f5_local10 + f0_local25 * f5_local5 )
		f5_arg0.scope:setLeftRight( false, false, -(f0_local23 / 2 * f5_local6) + f5_local9, -(f0_local23 / 2 * f5_local6) + f5_local9 + f0_local23 * f5_local6 )
		f5_arg0.scope:setTopBottom( false, false, -(f0_local24 / 2 * f5_local6) + f5_local10, -(f0_local24 / 2 * f5_local6) + f5_local10 + f0_local24 * f5_local6 )
		f5_local9 = math.random( -math.pi, math.pi )
		f5_local10 = math.random( -math.pi, math.pi )
		f5_local8 = f5_local3 * f0_local6
		f5_local9 = math.cos( f5_local9 ) * f5_local8
		f5_local10 = math.sin( f5_local10 ) * f5_local8
		f5_arg0.lensShadow:setLeftRight( false, false, -(f0_local26 / 2 * f5_local7) + f5_local9, -(f0_local26 / 2 * f5_local7) + f5_local9 + f0_local26 * f5_local7 )
		f5_arg0.lensShadow:setTopBottom( false, false, -(f0_local26 / 2 * f5_local7) + f5_local10, -(f0_local26 / 2 * f5_local7) + f5_local10 + f0_local26 * f5_local7 )
	else
		f5_arg0.reticle:setLeftRight( false, false, -f0_local25 / 2, -f0_local25 / 2 + f0_local25 )
		f5_arg0.reticle:setTopBottom( false, false, -f0_local25 / 2, -f0_local25 / 2 + f0_local25 )
		f5_arg0.scope:setLeftRight( false, false, -f0_local23 / 2, -f0_local23 / 2 + f0_local23 )
		f5_arg0.scope:setTopBottom( false, false, -f0_local24 / 2, -f0_local24 / 2 + f0_local24 )
		f5_arg0.lensShadow:setLeftRight( false, false, -f0_local26 / 2, -f0_local26 / 2 + f0_local26 )
		f5_arg0.lensShadow:setTopBottom( false, false, -f0_local26 / 2, -f0_local26 / 2 + f0_local26 )
		f5_arg0.recoilStartTime = 0
		f5_arg0.jitterStartTime = 0
	end
	return true
end

local f0_local32 = function ( f6_arg0 )
	if f6_arg0.attack then
		f6_arg0.flash.on = true
		f0_local27( f6_arg0.flash, "on", 0 )
	elseif f6_arg0.flash.on then
		f6_arg0.flash.on = false
		f0_local27( f6_arg0.flash, "off", f0_local20 )
	end
end

local f0_local33 = function ( f7_arg0 )
	if not f7_arg0.on then
		return 
	end
	f7_arg0:registerEventHandler( "int_watch_alert", nil )
	Engine.SetDvarBool( "cg_drawCrosshair", f7_arg0.userWantsCrosshair )
	f7_arg0.on = false
	if f7_arg0.timer ~= nil then
		LUI.UITimer.Stop( f7_arg0.timer )
		f7_arg0.timer:close()
		f7_arg0.timer = nil
	end
	f0_local27( f7_arg0.reticle, "fade_out", f0_local21 )
	f0_local27( f7_arg0.scope, "fade_out", f0_local21 )
	f0_local27( f7_arg0.lensShadow, "fade_out", f0_local21 )
	f0_local27( f7_arg0, "off", f0_local21 )
end

local f0_local34 = function ( f8_arg0 )
	if f8_arg0.isPaused then
		return 
	elseif Game.GetPlayerHealth() <= 0 then
		f0_local33( f8_arg0 )
		return 
	end
	f8_arg0.time = Game.GetTime() / 1000
	if f8_arg0.time < f8_arg0.startTime then
		return 
	elseif f8_arg0.attack and f8_arg0.time < f8_arg0.turretReloadTime then
		f8_arg0.attack = false
		return 
	elseif f8_arg0.attack then
		f8_arg0.turretReloadTime = f8_arg0.time + f0_local0
	end
	f8_arg0.fov = Game.GetTurretFov()
	f0_local32( f8_arg0 )
	if not f0_local31( f8_arg0 ) then
		f0_local30( f8_arg0 )
	end
	f8_arg0.attack = false
end

local f0_local35 = function ( f9_arg0, f9_arg1 )
	f0_local34( f9_arg0 )
end

local f0_local36 = function ( f10_arg0, f10_arg1 )
	if f10_arg1.newValue == 1 then
		f10_arg0.attack = true
		f0_local34( f10_arg0 )
	end
end

local f0_local37 = function ( f11_arg0, f11_arg1 )
	f11_arg0.isPaused = true
end

local f0_local38 = function ( f12_arg0, f12_arg1 )
	f12_arg0.isPaused = false
end

local f0_local39 = function ( f13_arg0 )
	if f13_arg0.on then
		return 
	else
		f13_arg0:setupUIIntWatch( "AttackButton" )
		f13_arg0:registerEventHandler( "int_watch_alert", f0_local36 )
		f13_arg0:registerEventHandler( "toggle_pause", f0_local37 )
		f13_arg0:registerEventHandler( "toggle_pause_off", f0_local38 )
		f13_arg0.userWantsCrosshair = Engine.GetDvarBool( "cg_drawCrosshair", false )
		Engine.SetDvarBool( "cg_drawCrosshair", false )
		f13_arg0.on = true
		f13_arg0.timer = LUI.UITimer.new( 10, "timer_event", "hud", false )
		f13_arg0:registerEventHandler( "timer_event", f0_local35 )
		f13_arg0:addElement( f13_arg0.timer )
		f13_arg0.firstRun = true
		f13_arg0.startTime = Game.GetTime() / 1000 + f0_local21
		f0_local27( f13_arg0, "on", f0_local21 )
		f0_local27( f13_arg0.reticle, "fade_in", f0_local21 )
		f0_local27( f13_arg0.scope, "fade_in", f0_local21 )
		f0_local27( f13_arg0.lensShadow, "fade_in", f0_local21 )
	end
end

local f0_local40 = function ( f14_arg0, f14_arg1 )
	if f14_arg1.value then
		f0_local39( f14_arg0 )
	else
		f0_local33( f14_arg0 )
	end
end

local f0_local41 = function ( f15_arg0 )
	f15_arg0:registerAnimationState( "off", {
		alpha = 0
	} )
	f15_arg0:registerAnimationState( "on", {
		alpha = 1
	} )
	local self = LUI.UIImage.new( {
		width = f0_local23 * 1.1,
		height = f0_local24 * 1.1,
		material = RegisterMaterial( "h1_sniperescape_blur" ),
		alpha = 1
	} )
	self.id = "scopeBlurId"
	f15_arg0:addElement( self )
	if Engine.IsPC() then
		local self = LUI.UIImage.new( {
			left = 0,
			width = -f0_local23,
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = true,
			material = RegisterMaterial( "h1_sniperescape_blur_sides" ),
			alpha = 1
		} )
		self.id = "leftScopeBlurId"
		self:addElement( self )
		local self = LUI.UIImage.new( {
			left = 0,
			width = f0_local23,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			material = RegisterMaterial( "h1_sniperescape_blur_sides" ),
			alpha = 1
		} )
		self.id = "rightScopeBlurId"
		self:addElement( self )
	end
	local self = LUI.UIImage.new( {
		width = 800,
		height = 800,
		material = RegisterMaterial( "h1_hud_overlay_sniperescape_flash" ),
		alpha = 0
	} )
	self.id = "scopeFlashId"
	f15_arg0:addElement( self )
	local self = LUI.UIImage.new( {
		width = f0_local26,
		height = f0_local26,
		material = RegisterMaterial( "h1_hud_overlay_sniperescape_lensshadow" ),
		alpha = 0.85
	} )
	self.id = "scopeLensShadowId"
	f15_arg0:addElement( self )
	local self = LUI.UIImage.new( {
		width = f0_local25,
		height = f0_local25,
		material = RegisterMaterial( "h1_hud_overlay_sniperescape_reticle" ),
		alpha = 1
	} )
	self.id = "scopeReticleId"
	f15_arg0:addElement( self )
	
	local scope = LUI.UIImage.new( {
		width = f0_local23,
		height = f0_local24,
		material = RegisterMaterial( "h1_hud_overlay_sniperescape_scope" ),
		alpha = 1
	} )
	scope.id = "scopeBgId"
	f15_arg0:addElement( scope )
	f15_arg0.scope = scope
	
	f15_arg0.reticle = self
	f15_arg0.lensShadow = self
	f15_arg0.flash = f0_local29( self )
	f15_arg0.on = false
	f15_arg0.attack = false
	f15_arg0.firstRun = true
	f15_arg0.jitterStartTime = 0
	f15_arg0.recoilStartTime = 0
	f15_arg0.jitterFov = 0
	f15_arg0.turretReloadTime = 0
	f15_arg0.isPaused = false
	f15_arg0.forward = {
		acosx = 0,
		delta = 0,
		x = 0,
		y = 0,
		z = 0
	}
	f15_arg0.up = {
		acosz = 0,
		delta = 0,
		x = 0,
		y = 0,
		z = 0
	}
	f15_arg0.reticle:registerAnimationState( "fade_out", {
		left = -f0_local25 / 2 * f0_local22,
		top = -f0_local25 / 2 * f0_local22,
		width = f0_local25 * f0_local22,
		height = f0_local25 * f0_local22
	} )
	f15_arg0.scope:registerAnimationState( "fade_out", {
		left = -f0_local23 / 2 * f0_local22,
		top = -f0_local24 / 2 * f0_local22,
		width = f0_local23 * f0_local22,
		height = f0_local24 * f0_local22
	} )
	f15_arg0.lensShadow:registerAnimationState( "fade_out", {
		left = -f0_local26 / 2 * f0_local22,
		top = -f0_local26 / 2 * f0_local22,
		width = f0_local26 * f0_local22,
		height = f0_local26 * f0_local22
	} )
	f15_arg0.reticle:registerAnimationState( "fade_in", {
		left = -f0_local25 / 2,
		top = -f0_local25 / 2,
		width = f0_local25,
		height = f0_local25
	} )
	f15_arg0.scope:registerAnimationState( "fade_in", {
		left = -f0_local23 / 2,
		top = -f0_local24 / 2,
		width = f0_local23,
		height = f0_local24
	} )
	f15_arg0.lensShadow:registerAnimationState( "fade_in", {
		left = -f0_local26 / 2,
		top = -f0_local26 / 2,
		width = f0_local26,
		height = f0_local26
	} )
	f0_local27( f15_arg0.reticle, "fade_out", 0 )
	f0_local27( f15_arg0.scope, "fade_out", 0 )
	f0_local27( f15_arg0.lensShadow, "fade_out", 0 )
	f0_local27( f15_arg0, "off", 0 )
	f15_arg0:registerOmnvarHandler( "ui_barret", f0_local40 )
	f0_local40( f15_arg0, {
		name = "ui_barret",
		value = Game.GetOmnvar( "ui_barret" )
	} )
	return f15_arg0
end

LUI.MenuBuilder.registerType( "sniperScopeHudType", function ()
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
	self.id = "sniperScopeRootId"
	return f0_local41( self )
end )
LockTable( _M )
