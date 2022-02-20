local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = {
	OutOfRange = 0,
	Min = 1,
	Mid = 2,
	Max = 3
}
f0_local1 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		Engine.SetUI3DWindows( f1_arg0, 0.5, 0, 0.5, 0.5 )
		f2_arg0:setUI3DWindow( f1_arg0 )
	end
	
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0.active = CoD.UsingAccuracyGreeble1( Game.GetPlayerWeaponName() )
	f3_arg0:animateToState( f3_arg0.active and "active" or "default" )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if CoD.UsingAccuracyGreeble1( Game.GetPlayerWeaponName() ) then
		LUI.UITimer.Reset( f4_arg0 )
	else
		LUI.UITimer.Stop( f4_arg0 )
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Game.GetWeaponDamageStats()
	local f5_local1 = Game.GetCrosshairTraceDistance()
	if f5_local1 == 0 then
		f5_local1 = f5_local0.minDamageRange
	end
	local f5_local2 = f0_local0.OutOfRange
	local f5_local3 = nil
	if f5_local0.minDamageRange < f5_local1 then
		f5_local2 = f0_local0.OutOfRange
		f5_local3 = "outofrange"
	elseif (f5_local0.minDamageRange + f5_local0.maxDamageRange) / 2 < f5_local1 then
		f5_local2 = f0_local0.Min
		f5_local3 = "min"
	elseif f5_local0.maxDamageRange < f5_local1 then
		f5_local2 = f0_local0.Mid
		f5_local3 = "mid"
	else
		f5_local2 = f0_local0.Max
		f5_local3 = "max"
	end
	if f5_arg0.lastState == nil then
		f5_arg0.lastState = f0_local0.OutOfRange
	end
	if f5_arg0.lastState ~= f5_local2 then
		f5_arg0:processEvent( {
			name = (f5_arg0.lastState and "inc_" or "dec_") .. f5_local3
		} )
		f5_arg0.lastState = f5_local2
	end
end

local f0_local5 = function ()
	return {
		type = "UIImage",
		id = "AccuracyGreeble1HudMainId",
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
			init_overlay = f0_local1( 2 ),
			weapon_change = f0_local2,
			greeble_update = f0_local4
		},
		children = {
			{
				type = "AccuracyGreeble1Timer"
			},
			{
				type = "AccuracyGreeble1ActiveImage"
			},
			{
				type = "AccuracyGreeble1TransitionImage"
			}
		}
	}
end

local f0_local6 = function ()
	return {
		type = "UITimer",
		id = "AccuracyGreeble1TimerId",
		properties = {
			interval = 200,
			event = {
				name = "greeble_update",
				dispatchChildren = true
			}
		},
		handlers = {
			weapon_change = f0_local3
		}
	}
end

local f0_local7 = function ()
	return {
		type = "UIImage",
		id = "AccuracyGreeble1ActiveImageId",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = true,
				rightAnchor = true,
				material = RegisterMaterial( "black" ),
				alpha = 1
			},
			off = {
				alpha = 0
			},
			on = {
				alpha = 1
			},
			outofrange = {
				material = RegisterMaterial( "black" )
			},
			min_damage = {
				material = RegisterMaterial( "mtl_accuracy_bars_far" )
			},
			mid_damage = {
				material = RegisterMaterial( "mtl_accuracy_bars_medium" )
			},
			max_damage = {
				material = RegisterMaterial( "mtl_accuracy_bars_near" )
			}
		},
		handlers = {
			inc_min = MBh.AnimateSequence( {
				{
					"on",
					150
				},
				{
					"min_damage",
					0
				},
				{
					"on",
					50
				}
			} ),
			inc_mid = MBh.AnimateSequence( {
				{
					"on",
					150
				},
				{
					"mid_damage",
					0
				},
				{
					"on",
					50
				}
			} ),
			inc_max = MBh.AnimateSequence( {
				{
					"on",
					150
				},
				{
					"max_damage",
					0
				},
				{
					"on",
					50
				}
			} ),
			dec_mid = MBh.AnimateSequence( {
				{
					"off",
					150,
					true
				},
				{
					"mid_damage",
					0
				},
				{
					"on",
					0
				},
				{
					"on",
					50
				}
			} ),
			dec_min = MBh.AnimateSequence( {
				{
					"off",
					150,
					true
				},
				{
					"min_damage",
					0
				},
				{
					"on",
					0
				},
				{
					"on",
					50
				}
			} ),
			dec_outofrange = MBh.AnimateSequence( {
				{
					"off",
					150,
					true
				},
				{
					"outofrange",
					0
				},
				{
					"on",
					0
				},
				{
					"on",
					50
				}
			} )
		}
	}
end

local f0_local8 = function ()
	return {
		type = "UIImage",
		id = "AccuracyGreeble1TransitionImageId",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = true,
				rightAnchor = true,
				material = RegisterMaterial( "black" ),
				alpha = 0
			},
			off = {
				alpha = 0
			},
			on = {
				alpha = 1
			},
			outofrange = {
				material = RegisterMaterial( "ui_transparent" )
			},
			min_damage = {
				material = RegisterMaterial( "mtl_accuracy_bars_far" )
			},
			mid_damage = {
				material = RegisterMaterial( "mtl_accuracy_bars_medium" )
			},
			max_damage = {
				material = RegisterMaterial( "mtl_accuracy_bars_near" )
			}
		},
		handlers = {
			inc_min = MBh.AnimateSequence( {
				{
					"min_damage",
					0
				},
				{
					"on",
					150,
					true
				},
				{
					"off",
					0
				},
				{
					"off",
					50
				}
			} ),
			inc_mid = MBh.AnimateSequence( {
				{
					"mid_damage",
					0
				},
				{
					"on",
					150,
					true
				},
				{
					"off",
					0
				},
				{
					"off",
					50
				}
			} ),
			inc_max = MBh.AnimateSequence( {
				{
					"max_damage",
					0
				},
				{
					"on",
					150,
					true
				},
				{
					"off",
					0
				},
				{
					"off",
					50
				}
			} ),
			dec_mid = MBh.AnimateSequence( {
				{
					"mid_damage",
					0
				},
				{
					"on",
					0
				},
				{
					"on",
					200
				},
				{
					"off",
					0
				}
			} ),
			dec_min = MBh.AnimateSequence( {
				{
					"min_damage",
					0
				},
				{
					"on",
					0
				},
				{
					"on",
					200
				},
				{
					"off",
					0
				}
			} ),
			dec_outofrange = MBh.AnimateSequence( {
				{
					"outofrange",
					0
				},
				{
					"on",
					0
				},
				{
					"on",
					200
				},
				{
					"off",
					0
				}
			} )
		}
	}
end

LUI.MenuBuilder.registerDef( "AccuracyGreeble1HudMain", f0_local5 )
LUI.MenuBuilder.registerDef( "AccuracyGreeble1Timer", f0_local6 )
LUI.MenuBuilder.registerDef( "AccuracyGreeble1ActiveImage", f0_local7 )
LUI.MenuBuilder.registerDef( "AccuracyGreeble1TransitionImage", f0_local8 )
LockTable( _M )
