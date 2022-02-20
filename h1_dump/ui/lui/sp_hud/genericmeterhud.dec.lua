local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
DebugPrint( "Registering " .. _NAME )
local f0_local0, f0_local1, f0_local2, f0_local3 = nil
local f0_local4 = 154.5
local f0_local5 = 46.5
local f0_local6 = 120
local f0_local7 = 6
local f0_local8 = 25
local f0_local9 = -15
local f0_local10 = -25
local f0_local11 = 65
local f0_local12 = 85
local f0_local13 = 300
local f0_local14 = 50
local f0_local15 = Colors.s1Hud_contractedYellow
local f0_local16 = Colors.s1Hud_bright_red
local f0_local17 = 500
local f0_local18 = 400
local f0_local19 = 0
local f0_local20 = "tag_ui_ammo"
local f0_local21 = function ()
	local f1_local0 = Game.GetViewmodelEntNum()
	local f1_local1 = Game.PlayerCanAttachToViewmodel()
	if f1_local1 then
		f1_local1 = Game.EntityHasTag( f1_local0, f0_local20 )
	end
	return f1_local1
end

local f0_local22 = function ( f2_arg0 )
	f2_arg0:setupEntityContainer( Game.GetViewmodelEntNum(), 0, 0, 0, f0_local20 )
	f2_arg0:setEntityContainerTransferRotation( false, 0, 0, 0 )
	if f2_arg0.isAttachedToViewModel == false then
		f2_arg0:animateToState( "default", 0 )
	end
	f2_arg0.isAttachedToViewModel = true
	f2_arg0.isDetachedFromViewModel = false
end

local f0_local23 = function ( f3_arg0 )
	if f3_arg0.isAttachedToViewModel then
		f3_arg0:setupEntityContainer( -1 )
	end
	f3_arg0.isAttachedToViewModel = false
	f3_arg0.isDetachedFromViewModel = true
end

local f0_local24 = function ( f4_arg0 )
	f4_arg0:animateToState( "two_d", 0 )
end

local f0_local25 = function ()
	local f5_local0
	if Game.GetOmnvar( "ui_meterhud_toggle" ) ~= false and Game.GetPlayerHealth() > 0 then
		f5_local0 = Game.DeadQuoteVisible()
		if not f5_local0 then
			f5_local0 = Game.PlayerOnLadder()
			if not f5_local0 then
				f5_local0 = Engine.InLoadingScreen()
				if not f5_local0 then
					f5_local0 = Game.PlayerOnTurret()
					if not f5_local0 then
						if Game.IsHudEnabled( nil ) then
							f5_local0 = Game.PlayerDrivingVehicle()
							if not f5_local0 then
								if Game.PlayerADS() ~= 1 and Game.IsWeaponReloading( 1 ) == 0 and Game.IsWeaponSwitching( 1 ) == 0 then
									f5_local0 = false
								else
									f5_local0 = true
								end
							end
						else
							f5_local0 = true
						end
					end
				end
			end
		end
	else
		f5_local0 = true
	end
	return f5_local0
end

local f0_local26 = function ()
	local f6_local0
	if Game.PlayerADS() ~= 1 and Game.IsWeaponReloading( 1 ) == 0 and Game.IsWeaponSwitching( 1 ) == 0 then
		f6_local0 = false
	else
		f6_local0 = true
	end
	return f6_local0
end

f0_local1 = function ( f7_arg0, f7_arg1 )
	f7_arg0.isAttachedToViewModel = false
	f7_arg0.isDetachedFromViewModel = false
	f7_arg0.animationTime = 0
	f7_arg0.state = ""
	f7_arg0.stayHidden = false
	f0_local2( f7_arg0 )
	f0_local3( f7_arg0 )
	f7_arg0.initalized = true
end

f0_local0 = function ( f8_arg0, f8_arg1 )
	if f8_arg0.initalized ~= true then
		f0_local1( f8_arg0 )
	end
	f0_local3( f8_arg0 )
	if f8_arg0.animationTime > 0 then
		f8_arg0.animationTime = f8_arg0.animationTime - f0_local17
		if f8_arg0.animationTime <= 0 then
			f8_arg0.animationTime = 0
			if f8_arg0.state == "hiding" then
				f8_arg0.state = "hidden"
			elseif f8_arg0.state == "showing" then
				f8_arg0.state = "visible"
			end
		else
			return 
		end
	end
	local f8_local0 = f0_local25()
	if f8_local0 and f8_arg0.state ~= "hidden" then
		local f8_local1 = f0_local18
		if f0_local26() then
			f8_local1 = f0_local19
		end
		f8_arg0:animateToState( "hidden", f8_local1 )
		f8_arg0.state = "hiding"
		f8_arg0.animationTime = f8_local1
	elseif not f8_local0 and f8_arg0.state ~= "visible" and not f8_arg0.stayHidden then
		local f8_local1 = f0_local18
		if Game.PlayerADS() > 0.2 then
			f8_local1 = f0_local19
		end
		f8_arg0:animateToState( "visible", f8_local1 )
		f8_arg0.state = "showing"
		f8_arg0.animationTime = f8_local1
	end
	local f8_local1 = false
	local f8_local2 = Game.GetOmnvar( "ui_meterhud_ar_and_2d" )
	if f0_local21() then
		if f8_arg0.isAttachedToViewModel == false then
			f8_local1 = true
		end
		f0_local22( f8_arg0 )
		f8_arg0.stayHidden = false
	elseif not f8_local2 then
		f0_local23( f8_arg0 )
		f8_local1 = true
		f8_arg0.stayHidden = true
	elseif not f0_local21() and f8_arg0.isDetachedFromViewModel == false then
		f0_local23( f8_arg0 )
		f0_local24( f8_arg0 )
		f8_local1 = true
		f8_arg0.stayHidden = false
	end
	if f8_local1 == true then
		f8_arg0:animateToState( "hidden", 0 )
		f8_arg0.state = "hidden"
	end
end

local f0_local27 = function ( f9_arg0, f9_arg1, f9_arg2 )
	return f9_arg0 + (f9_arg1 - f9_arg0) * f9_arg2
end

local f0_local28 = function ( f10_arg0, f10_arg1, f10_arg2 )
	return {
		r = f0_local27( f10_arg0.r, f10_arg1.r, f10_arg2 ),
		g = f0_local27( f10_arg0.g, f10_arg1.g, f10_arg2 ),
		b = f0_local27( f10_arg0.b, f10_arg1.b, f10_arg2 )
	}
end

local f0_local29 = function ()
	return 9
end

f0_local3 = function ( f12_arg0, f12_arg1 )
	local f12_local0 = 1 - Game.GetOmnvar( "ui_meterhud_level" )
	local f12_local1 = f12_arg0:getChildById( "AR_GenericMeterHud_Meter" )
	local f12_local2 = Game.GetOmnvar( "ui_meterhud_text" )
	local f12_local3 = f0_local28( f0_local15, f0_local16, f12_local0 )
	local f12_local4 = 1
	if f12_local2 == 1 then
		f12_local4 = f0_local27( 0.5, 1, f12_local0 )
	end
	f12_local1:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		topAnchor = true,
		left = f0_local8,
		right = f0_local9,
		top = f0_local7 + f0_local6 * f12_local0,
		bottom = f0_local10,
		material = RegisterMaterial( "white" ),
		color = f12_local3,
		alpha = f12_local4
	} )
	f12_local1:animateToState( "default", 200 )
	local f12_local5 = f12_arg0:getChildById( "AR_GenericMeterHud_Text" )
	if f12_local5.colorSameAsMeter == true then
		f12_local5:registerAnimationState( "default", {
			color = f12_local3,
			alpha = f12_local4
		} )
		f12_local5:animateToState( "default", 200 )
	end
end

f0_local2 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = Game.GetOmnvar( "ui_meterhud_text" )
	local f13_local1 = f13_arg0:getChildById( "AR_GenericMeterHud_Text" )
	local f13_local2 = f13_arg0:getChildById( "AR_GenericMeterHud_InnerBox" )
	local f13_local3 = f13_arg0:getChildById( "AR_GenericMeterHud_OuterBox" )
	local f13_local4 = "METER"
	local f13_local5 = f0_local15
	if f13_local0 == 0 then
		f13_local5 = f0_local16
		f13_local4 = "WEAPON_UNCLOAKED"
		f13_local1:animateToState( "default", 0 )
		f13_local2:animateToState( "default", 0 )
		f13_local3:animateToState( "default", 0 )
		f13_local1.colorSameAsMeter = false
	elseif f13_local0 == 1 then
		f13_local4 = "WEAPON_CLOAKED"
		f13_local1:animateToState( "cloaked", 0 )
		f13_local2:animateToState( "cloaked", 0 )
		f13_local3:animateToState( "cloaked", 0 )
		f13_local1.colorSameAsMeter = true
	elseif f13_local0 == 2 then
		f13_local4 = "WEAPON_FUEL"
		f13_local1:animateToState( "default", 0 )
		f13_local2:animateToState( "default", 0 )
		f13_local3:animateToState( "default", 0 )
		f13_local1.colorSameAsMeter = true
	end
	f13_local1:setText( Engine.Localize( f13_local4 ) )
	f13_local1:registerAnimationState( "default", {
		color = f13_local5
	} )
	f13_local1:animateToState( "default", 200 )
end

LUI.MenuBuilder.registerDef( "AR_GenericMeterHudDef", function ()
	return {
		type = "UIElement",
		id = "AR_GenericMeterHud_Root",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = false,
				top = -f0_local4 - f0_local11,
				bottom = 0 - f0_local11,
				left = -f0_local5 + f0_local12,
				right = 0 + f0_local12
			},
			two_d = {
				topAnchor = true,
				leftAnchor = false,
				bottomAnchor = false,
				rightAnchor = true,
				top = f0_local13,
				left = -f0_local5 - f0_local14,
				right = -f0_local14,
				bottom = f0_local4 + f0_local13
			},
			hidden = {
				alpha = 0
			},
			visible = {
				alpha = 0.7
			}
		},
		handlers = {
			generic_hud_refresh = f0_local0,
			omnvar_update = {
				ui_meterhud_text = f0_local2
			}
		},
		children = {
			{
				type = "UIImage",
				id = "AR_GenericMeterHud_OuterBox",
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "mtl_ui_land_assist_fuel_box_outer" ),
						color = f0_local15,
						alpha = 0.25,
						red = 1,
						green = 1,
						blue = 1
					},
					cloaked = {
						red = 0.5,
						green = 0.5,
						blue = 0.5,
						alpha = 0.25
					}
				}
			},
			{
				type = "UIImage",
				id = "AR_GenericMeterHud_InnerBox",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						bottomAnchor = true,
						topAnchor = true,
						material = RegisterMaterial( "mtl_ui_land_assist_fuel_box_inner" ),
						color = f0_local15,
						alpha = 1,
						red = 1,
						green = 1,
						blue = 1
					},
					cloaked = {
						red = 0.5,
						green = 0.5,
						blue = 0.5,
						alpha = 0.5
					}
				}
			},
			{
				type = "UIText",
				id = "AR_GenericMeterHud_Text",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						bottomAnchor = true,
						topAnchor = false,
						bottom = -5,
						height = f0_local29(),
						left = 0,
						font = CoD.TextSettings.BodyFontBold18.Font,
						color = f0_local15,
						glow = LUI.GlowState.ElementColor,
						alpha = 1
					},
					cloaked = {
						alpha = 0.5
					}
				},
				properties = {
					text = "UNCLOAKED"
				}
			},
			{
				type = "UIImage",
				id = "AR_GenericMeterHud_Blur",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						bottomAnchor = true,
						topAnchor = true,
						material = RegisterMaterial( "black" ),
						color = f0_local15,
						alpha = 0.75
					}
				}
			},
			{
				type = "UIImage",
				id = "AR_GenericMeterHud_Meter",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						bottomAnchor = true,
						topAnchor = true,
						left = f0_local8,
						right = f0_local9,
						top = f0_local7 + f0_local6,
						bottom = f0_local10,
						material = RegisterMaterial( "white" ),
						color = f0_local15,
						alpha = 1
					},
					cloaked = {
						alpha = 0.5
					}
				}
			},
			{
				type = "UIIntWatch",
				properties = {
					dataSource = "PlayerADS"
				},
				handlers = {
					int_watch_alert = MBh.EmitEventToParent( "generic_hud_refresh", {} )
				}
			},
			{
				type = "UIIntWatch",
				properties = {
					dataSource = "PlayerReloading"
				},
				handlers = {
					int_watch_alert = MBh.EmitEventToParent( "generic_hud_refresh", {} )
				}
			},
			{
				type = "UIIntWatch",
				properties = {
					dataSource = "PlayerSwitchingWeapon"
				},
				handlers = {
					int_watch_alert = MBh.EmitEventToParent( "generic_hud_refresh", {} )
				}
			},
			{
				type = "UIIntWatch",
				properties = {
					dataSource = "PlayerDrivingVehicle"
				},
				handlers = {
					int_watch_alert = MBh.EmitEventToParent( "generic_hud_refresh", {} )
				}
			},
			{
				type = "UIIntWatch",
				properties = {
					dataSource = "PlayerOnTurret"
				},
				handlers = {
					int_watch_alert = MBh.EmitEventToParent( "generic_hud_refresh", {} )
				}
			},
			{
				type = "UITimer",
				id = "AR_GenericMeterHud_Timer",
				properties = {
					event = {
						name = "generic_hud_refresh"
					},
					interval = f0_local17
				}
			}
		}
	}
end )
LockTable( _M )
