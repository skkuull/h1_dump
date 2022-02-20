local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		Engine.SetUI3DWindows( f1_arg0, 0.5, 0, 0.5, 0.5 )
		f2_arg0:setUI3DWindow( f1_arg0 )
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	f3_arg0.active = CoD.UsingAccuracyGreeble2( Game.GetPlayerWeaponName() )
	f3_arg0:animateToState( f3_arg0.active and "active" or "default" )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	if CoD.UsingAccuracyGreeble2( Game.GetPlayerWeaponName() ) then
		LUI.UITimer.Reset( f4_arg0 )
	else
		LUI.UITimer.Stop( f4_arg0 )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Game.GetWeaponDamageStats()
	local f5_local1 = Game.GetCrosshairTraceDistance()
	if f5_local1 == 0 then
		f5_local1 = f5_local0.minDamageRange
	end
	local f5_local2 = f5_arg0:getChildById( "AccuracyGreeble2TextId" )
	f5_local2:setText( f5_local1 )
	if f5_local0.minDamageRange < f5_local1 then
		f5_arg0:processEvent( {
			name = "to_outofrange"
		} )
	elseif (f5_local0.minDamageRange + f5_local0.maxDamageRange) / 2 < f5_local1 then
		f5_arg0:processEvent( {
			name = "to_min"
		} )
	elseif f5_local0.maxDamageRange < f5_local1 then
		f5_arg0:processEvent( {
			name = "to_mid"
		} )
	else
		f5_arg0:processEvent( {
			name = "to_max"
		} )
	end
end

local f0_local4 = function ()
	return {
		type = "UIImage",
		id = "AccuracyGreeble2HudMainId",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = true,
				rightAnchor = true,
				top = 0,
				left = 0,
				bottom = 0,
				right = 0,
				material = RegisterMaterial( "ui_transparent" ),
				alpha = 0
			},
			active = {
				alpha = 1
			}
		},
		handlers = {
			init_overlay = f0_local0( 2 ),
			weapon_change = f0_local1,
			greeble_update = f0_local3
		},
		children = {
			{
				type = "AccuracyGreeble2Timer"
			},
			{
				type = "AccuracyGreeble2Text"
			}
		}
	}
end

local f0_local5 = function ()
	return {
		type = "UITimer",
		id = "AccuracyGreeble2TimerId",
		properties = {
			interval = 50,
			event = {
				name = "greeble_update",
				dispatchChildren = true
			}
		},
		handlers = {
			weapon_change = f0_local2
		}
	}
end

local f0_local6 = function ()
	return {
		type = "UIText",
		id = "AccuracyGreeble2TextId",
		properties = {
			font = CoD.TextSettings.BodyFont.Font
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				height = 256,
				left = 0,
				right = 0,
				alpha = 1,
				alignment = LUI.Alignment.Right,
				verticalAlignment = LUI.VerticalAlignment.Middle
			},
			outofrange = {
				red = 1,
				green = 1,
				blue = 1
			},
			min_damage = {
				red = 1,
				green = 0,
				blue = 0
			},
			mid_damage = {
				red = 1,
				green = 0.5,
				blue = 0
			},
			max_damage = {
				red = 0,
				green = 1,
				blue = 0
			}
		},
		handlers = {
			to_min = MBh.AnimateToState( "min_damage", 333 ),
			to_mid = MBh.AnimateToState( "mid_damage", 333 ),
			to_max = MBh.AnimateToState( "max_damage", 333 ),
			to_outofrange = MBh.AnimateToState( "outofrange", 333 )
		}
	}
end

LUI.MenuBuilder.registerDef( "AccuracyGreeble2HudMain", f0_local4 )
LUI.MenuBuilder.registerDef( "AccuracyGreeble2Timer", f0_local5 )
LUI.MenuBuilder.registerDef( "AccuracyGreeble2Text", f0_local6 )
LockTable( _M )
