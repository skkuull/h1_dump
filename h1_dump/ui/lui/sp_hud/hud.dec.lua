local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = Engine.GetDvarFloat( "safeArea_adjusted_horizontal" )
f0_local1 = Engine.GetDvarFloat( "safeArea_adjusted_vertical" )
f0_local2 = function ( f1_arg0, f1_arg1 )
	local f1_local0
	if Engine.GetDvarBool( "cg_draw2D" ) then
		f1_local0 = not Game.IsHudEnabled( nil )
	else
		f1_local0 = true
	end
	local f1_local1 = f1_arg0.is_paused
	local f1_local2 = Engine.GetDvarString( "createfx" ) == "on"
	local f1_local3 = Game.PlayerReticleZoom()
	local f1_local4 = Engine.IsVideoPlaying() and Engine.GetDvarBool( "cg_cinematicFullscreen" ) or Engine.InLoadingScreen()
	local f1_local5 = f1_arg0:getChildById( "hintsHudId" )
	local f1_local6 = f1_arg0:getChildById( "savingHudId" )
	local f1_local7 = f1_arg0:getChildById( "overlayHudId" )
	local f1_local8 = f1_arg0:getChildById( "ragtimeWarefareOverlayContainerId" )
	local f1_local9 = f1_arg0:getChildById( "shakeContainerHudId" )
	local f1_local10 = f1_local9:getChildById( "weaponInfoHud" )
	local f1_local11 = f1_local9:getChildById( "captureHudId" )
	local f1_local12 = f1_local9:getChildById( "videoLogCinematicRootId" )
	local f1_local13 = {}
	local f1_local14 = {}
	if f1_local1 then
		f1_local13 = {
			f1_local5,
			f1_local10,
			f1_local6,
			f1_local11,
			f1_local7,
			f1_local12
		}
		f1_local14 = {
			f1_local8
		}
	elseif f1_local4 then
		f1_local13 = {
			f1_local5,
			f1_local10,
			f1_local6,
			f1_local11,
			f1_local7,
			f1_local12,
			f1_local8
		}
		f1_local14 = {}
	elseif f1_local0 then
		f1_local13 = {
			f1_local5,
			f1_local10,
			f1_local6,
			f1_local11,
			f1_local7,
			f1_local12
		}
		f1_local14 = {}
	elseif f1_local3 then
		f1_local13 = {}
		f1_local14 = {
			f1_local5,
			f1_local10,
			f1_local6,
			f1_local11,
			f1_local7,
			f1_local12
		}
	else
		f1_local13 = {}
		f1_local14 = {
			f1_local5,
			f1_local10,
			f1_local6,
			f1_local11,
			f1_local7,
			f1_local12,
			f1_local8
		}
	end
	for f1_local18, f1_local19 in pairs( f1_local13 ) do
		if f1_local19.on_state == nil or f1_local19.on_state == true then
			f1_local19:animateToState( "hud_off", 0 )
			f1_local19.current_state = "hud_off"
			f1_local19.on_state = false
			f1_local19:processEvent( {
				name = "hud_off"
			} )
		end
	end
	if #f1_local14 and (f1_arg0.on_state == nil or f1_arg0.on_state == false) then
		f1_arg0:animateToState( "hud_on", 0 )
		f1_arg0.current_state = "hud_on"
		f1_arg0.on_state = true
	end
	for f1_local18, f1_local19 in pairs( f1_local14 ) do
		if f1_local19.on_state == nil or f1_local19.on_state == false then
			f1_local19:animateToState( "hud_on", 100 )
			f1_local19.current_state = "hud_on"
			f1_local19.on_state = true
			f1_local19:processEvent( {
				name = "hud_on"
			} )
		end
	end
	if not f1_arg0.is_paused and (f0_local0 ~= Engine.GetDvarFloat( "safeArea_adjusted_horizontal" ) or f0_local1 ~= Engine.GetDvarFloat( "safeArea_adjusted_vertical" )) then
		f0_local0 = Engine.GetDvarFloat( "safeArea_adjusted_horizontal" )
		f0_local1 = Engine.GetDvarFloat( "safeArea_adjusted_vertical" )
		f1_arg0:registerAnimationState( "new_margins", {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = true,
			top = ScreenResolution[currentScreenResolution].height * (1 - f0_local1) / 2,
			left = ScreenResolution[currentScreenResolution].width * (1 - f0_local0) / 2,
			bottom = -(ScreenResolution[currentScreenResolution].height * (1 - f0_local1)) / 2,
			right = -(ScreenResolution[currentScreenResolution].width * (1 - f0_local0)) / 2,
			alpha = 1
		} )
		f1_arg0:animateToState( "new_margins", 0 )
		f1_arg0:registerAnimationState( "default_on", {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = true,
			top = ScreenResolution[currentScreenResolution].height * (1 - f0_local1) / 2,
			left = ScreenResolution[currentScreenResolution].width * (1 - f0_local0) / 2,
			bottom = -(ScreenResolution[currentScreenResolution].height * (1 - f0_local1)) / 2,
			right = -(ScreenResolution[currentScreenResolution].width * (1 - f0_local0)) / 2,
			alpha = 1
		} )
	end
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetLuiRoot()
	if f2_local0 and not LUI.FlowManager.IsInStack( f2_local0.flowManager, "sp_pause_menu" ) then
		LUI.FlowManager.RequestAddMenu( f2_arg0, "sp_pause_menu", true, f2_arg1.controller, false )
		Engine.PlaySound( CoD.SFX.MenuAppear )
	end
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	f3_arg0.is_paused = false
	f0_local2( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getFirstDescendentById( "player_plane_hud_root" )
	if f3_local0 then
		f3_local0:processEvent( {
			name = "unpaused"
		} )
	end
	local f3_local1 = f3_arg0:getFirstDescendentById( "player_mech_hud_root" )
	if f3_local1 then
		f3_local1:processEvent( {
			name = "unpaused"
		} )
	end
end

local f0_local5 = function ( f4_arg0, f4_arg1 )
	f4_arg0.is_paused = true
	f0_local2( f4_arg0, f4_arg1 )
	f0_local3( f4_arg0, f4_arg1 )
end

local f0_local6 = function ( f5_arg0, f5_arg1 )
	f5_arg0.doRandomShake = true
	f0_local0 = Engine.GetDvarFloat( "safeArea_adjusted_horizontal" )
	f0_local1 = Engine.GetDvarFloat( "safeArea_adjusted_vertical" )
	local f5_local0 = f5_arg0:getChildById( "shakeContainerHudId" )
	for f5_local1 = 1, 4, 1 do
		f5_local0:registerAnimationState( "shake" .. f5_local1, {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = true,
			top = ScreenResolution[currentScreenResolution].height * (1 - f0_local1) / 2 + math.random( 10, 20 ),
			left = ScreenResolution[currentScreenResolution].width * (1 - f0_local0) / 2 + math.random( 10, 20 ),
			bottom = -(ScreenResolution[currentScreenResolution].height * (1 - f0_local1)) / 2 - math.random( 10, 20 ),
			right = -(ScreenResolution[currentScreenResolution].width * (1 - f0_local0)) / 2 - math.random( 10, 20 ),
			alpha = math.random( 0, 50 ) / 100
		} )
	end
	local f5_local1 = MBh.AnimateSequence
	local f5_local2 = {}
	local f5_local3 = {
		"default",
		0
	}
	local f5_local4 = {}
	local f5_local5 = "shake1"
	local f5_local6 = math.random( 10, 50 )
	f5_local4 = f5_local5
	f5_local5 = {}
	f5_local6 = "shake2"
	local f5_local7 = math.random( 10, 50 )
	f5_local5 = f5_local6
	f5_local6 = {}
	f5_local7 = "shake3"
	local f5_local8 = math.random( 10, 50 )
	f5_local6 = f5_local7
	f5_local7 = {}
	f5_local8 = "shake4"
	local f5_local9 = math.random( 10, 50 )
	f5_local7 = f5_local8
	f5_local8 = {}
	f5_local9 = "hud_off"
	local f5_local10 = math.random( 50, 100 )
	f5_local8 = f5_local9
	f5_local9 = {
		"default",
		250
	}
	f5_local2[1] = f5_local3
	f5_local2[2] = f5_local4
	f5_local2[3] = f5_local5
	f5_local2[4] = f5_local6
	f5_local2[5] = f5_local7
	f5_local2[6] = f5_local8
	f5_local2[7] = f5_local9
	f5_local2 = f5_local1( f5_local2 )
	f5_local2( f5_local0 )
	f5_arg0.doRandomShake = undefined
end

local f0_local7 = {
	alpha = 1
}
local f0_local8 = {
	alpha = 0
}
local f0_local9 = {
	topAnchor = true,
	leftAnchor = true,
	bottomAnchor = true,
	rightAnchor = true,
	top = 0,
	left = 0,
	bottom = 0,
	right = 0,
	alpha = 1
}
local f0_local10 = {
	topAnchor = false,
	leftAnchor = false,
	bottomAnchor = false,
	rightAnchor = false,
	top = -(ScreenResolution[currentScreenResolution].height / 2),
	left = -(ScreenResolution[currentScreenResolution].width / 2),
	bottom = ScreenResolution[currentScreenResolution].height / 2,
	right = ScreenResolution[currentScreenResolution].width / 2,
	alpha = 1
}
local f0_local11 = function ( f6_arg0 )
	local f6_local0 = {
		alpha = 1
	}
	local f6_local1 = {
		alpha = 0
	}
	local f6_local2 = {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = ScreenResolution[currentScreenResolution].height * (1 - f0_local1) / 2,
		left = ScreenResolution[currentScreenResolution].width * (1 - f0_local0) / 2,
		bottom = -(ScreenResolution[currentScreenResolution].height * (1 - f0_local1)) / 2,
		right = -(ScreenResolution[currentScreenResolution].width * (1 - f0_local0)) / 2,
		alpha = 1
	}
	f6_arg0:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = ScreenResolution[currentScreenResolution].height * (1 - f0_local1) / 2,
		left = ScreenResolution[currentScreenResolution].width * (1 - f0_local0) / 2,
		bottom = -(ScreenResolution[currentScreenResolution].height * (1 - f0_local1)) / 2,
		right = -(ScreenResolution[currentScreenResolution].width * (1 - f0_local0)) / 2,
		alpha = 0
	} )
	f6_arg0:registerAnimationState( "default_on", f6_local2 )
	f6_arg0:registerAnimationState( "hud_on", f6_local0 )
	f6_arg0:registerAnimationState( "hud_off", f6_local1 )
	f6_arg0:animateToState( "default" )
end

local f0_local12 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = nil
	if type( f7_arg1 ) == "table" then
		f7_local0 = LUI.MenuBuilder.buildItems( f7_arg1, f7_arg0.properties, f7_arg0 )
	else
		f7_local0 = f7_arg1
	end
	f7_arg0:addElement( f7_local0 )
	return f7_local0
end

local f0_local13 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self.id = menu
	self:registerAnimationState( "default", f0_local9 )
	self:registerAnimationState( "hud_on", f0_local7 )
	self:registerAnimationState( "hud_off", f0_local8 )
	self:animateToState( "default" )
	f0_local12( self, {
		type = controller
	} )
	return self
end

local f0_local14 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self.id = menu
	self:registerAnimationState( "default", f0_local9 )
	self:registerAnimationState( "hud_on", f0_local7 )
	self:registerAnimationState( "hud_off", f0_local8 )
	self:animateToState( "default" )
	f0_local12( self, {
		type = controller
	} )
	return self
end

local f0_local15 = function ( f10_arg0, f10_arg1 )
	if f10_arg1.value == true then
		f10_arg0:registerAnimationState( "visible", {
			top = Game.GetOmnvar( "ui_videolog_pos_top" ),
			left = Game.GetOmnvar( "ui_videolog_pos_left" ),
			bottom = Game.GetOmnvar( "ui_videolog_pos_bottom" ),
			right = Game.GetOmnvar( "ui_videolog_pos_right" ),
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = true,
			alpha = 1
		} )
		f10_arg0:animateToState( "visible", 0 )
	else
		f10_arg0:animateToState( "hidden", 500 )
	end
end

local f0_local16 = function ( f11_arg0, f11_arg1 )
	if f11_arg1.value == true then
		f11_arg0:animateToState( "visible", 100 )
	else
		f11_arg0:animateToState( "hidden", 100 )
	end
end

local f0_local17 = function ( f12_arg0, f12_arg1 )
	if f12_arg1.value == true then
		f12_arg0:animateToState( "visible", 2500, false, true )
	else
		f12_arg0:animateToState( "hidden", 0 )
	end
end

local f0_local18 = function ( f13_arg0, f13_arg1 )
	if f13_arg1.value == true then
		local f13_local0 = "CINEMATIC_ERROR"
		local f13_local1 = Game.GetOmnvar( "ui_videolog_blendfunc" )
		if f13_local1 == 0 then
			f13_local0 = "cinematic_add"
		elseif f13_local1 == 1 then
			f13_local0 = "cinematic_blend"
		elseif f13_local1 == 2 then
			f13_local0 = "cinematic_blend_add"
		elseif f13_local1 == 3 then
			f13_local0 = "cinematic_screen_add"
		elseif f13_local1 == 4 then
			f13_local0 = "cinematic_multiply"
		elseif f13_local1 == 5 then
			f13_local0 = "cinematic_replace"
		end
		f13_arg0:registerAnimationState( "visible", {
			material = RegisterMaterial( f13_local0 )
		} )
		f13_arg0:animateToState( "visible", 100 )
	else
		f13_arg0:animateToState( "hidden", 100 )
	end
end

local f0_local19 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg0:getFirstDescendentById( "gasmaskRootId" )
	if f14_arg1.value then
		f14_local0:animateToState( "on", 0 )
	else
		f14_local0:animateToState( "off", 0 )
	end
end

local f0_local20 = function ( f15_arg0, f15_arg1 )
	local f15_local0 = f15_arg0:getFirstDescendentById( "ragtimeWarefareOverlayId" )
	if f15_arg1.value then
		f15_local0:animateToState( "show", 1000 )
	else
		f15_local0:animateToState( "hide", 1000 )
	end
end

local f0_local21 = function ()
	local self = LUI.UIElement.new()
	self.id = "hud_id"
	f0_local11( self )
	self:registerEventHandler( "hud_shake", f0_local6 )
	self:registerEventHandler( "toggle_pause", f0_local5 )
	self:registerEventHandler( "toggle_pause_off", f0_local4 )
	self:setupUIIntWatch( "IsHudEnabled" )
	self:registerDvarHandler( "cg_draw2D", f0_local2 )
	self:registerDvarHandler( "createfx", f0_local2 )
	self:registerDvarHandler( "cg_cinematicFullscreen", f0_local2 )
	self:registerOmnvarHandler( "ui_playermech_hud", f0_local2 )
	self:registerOmnvarHandler( "ui_playerplane_hud", f0_local2 )
	self:registerOmnvarHandler( "ui_videolog", f0_local2 )
	self:registerEventHandler( "int_watch_alert", f0_local2 )
	self:registerEventHandler( "player_start", f0_local2 )
	self:registerOmnvarHandler( "ui_gasmask", f0_local19 )
	self:registerOmnvarHandler( "ui_ragtimewarefare_overlay", f0_local20 )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "IsVideoPlaying" )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		f0_local2( element:getParent(), event )
	end )
	self:addElement( self )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "IsReticleZoom" )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		f0_local2( element:getParent(), event )
	end )
	self:addElement( self )
	f0_local12( self, f0_local13( "gasmaskHudId", "gasmaskHudDef" ) )
	f0_local12( self, f0_local13( "javelinHudId", "javelinHudDef" ) )
	f0_local12( self, f0_local13( "nightvisionHudId", "NightVisionHudDef" ) )
	f0_local12( self, f0_local13( "sniperScopeId", "sniperScopeHudType" ) )
	f0_local12( self, f0_local13( "consciousnessOverlayId", "consciousnessOverlayType" ) )
	f0_local12( self, f0_local13( "airplaneSlowMoOverlayId", "airplaneSlowMoOverlayType" ) )
	f0_local12( self, f0_local13( "jeepRideCrashShellShockOverlayId", "jeepRideCrashShellShockOverlayType" ) )
	f0_local12( self, f0_local13( "jeepRideFirefightShellShockOverlayId", "jeepRideFirefightShellShockOverlayType" ) )
	f0_local12( self, f0_local13( "ragtimeWarefareOverlayContainerId", "ragtime_warefare_overlay_def" ) )
	f0_local12( self, f0_local13( "hintsHudId", "hintsHudDef" ) )
	f0_local12( self, f0_local13( "savingHudId", "savingHudDef" ) )
	f0_local12( self, f0_local13( "overlayHudId", "overlayHudDef" ) )
	f0_local19( self, {
		name = "ui_gasmask",
		value = Game.GetOmnvar( "ui_gasmask" )
	} )
	local self = LUI.UIElement.new()
	self.id = "shakeContainerHudId"
	self:registerAnimationState( "default", f0_local9 )
	self:registerAnimationState( "hud_on", f0_local7 )
	self:registerAnimationState( "hud_off", f0_local8 )
	self:animateToState( "default" )
	self.properties = {
		shakeLooping = 0,
		shakeVersion = 0
	}
	self:addElement( self )
	f0_local12( self, f0_local14( "weaponInfoHud", "WeaponInfoHudDef" ) )
	f0_local12( self, f0_local14( "captureHudId", "captureHudDef" ) )
	local f16_local4 = f0_local12( self, {
		type = "UIElement",
		id = "videoLogCinematicRootId",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = true,
				rightAnchor = true,
				alpha = 0
			}
		},
		children = {
			{
				type = "UIElement",
				id = "videoLogCinematicId",
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = true,
						rightAnchor = true,
						top = Game.GetOmnvar( "ui_videolog_pos_top" ),
						left = Game.GetOmnvar( "ui_videolog_pos_left" ),
						bottom = Game.GetOmnvar( "ui_videolog_pos_bottom" ),
						right = Game.GetOmnvar( "ui_videolog_pos_right" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					visible = {
						alpha = 1
					},
					hidden = {
						alpha = 0
					}
				},
				handlers = {
					omnvar_update = {
						ui_videolog = f0_local15
					}
				},
				children = {
					{
						type = "UIElement",
						id = "videoLogFade",
						states = {
							default = {
								topAnchor = true,
								leftAnchor = true,
								bottomAnchor = true,
								rightAnchor = true,
								alpha = 0
							},
							visible = {
								alpha = 1
							},
							hidden = {
								alpha = 0
							}
						},
						handlers = {
							omnvar_update = {
								ui_videolog = f0_local17
							}
						},
						children = {
							{
								type = "UIImage",
								id = "videoLogBlurBackground",
								states = {
									default = {
										topAnchor = true,
										leftAnchor = true,
										bottomAnchor = true,
										rightAnchor = true,
										material = RegisterMaterial( "mtl_ui_videolog_blurbackground" ),
										red = 0.3,
										green = 0.3,
										blue = 0.3,
										alpha = 1
									},
									visible = {
										alpha = 1
									},
									hidden = {
										alpha = 0
									}
								},
								handlers = {
									omnvar_update = {
										ui_videolog_blur_bkgrnd = f0_local16
									}
								}
							}
						}
					},
					{
						type = "UIImage",
						id = "videoLogCinematicMaterialId",
						states = {
							default = {
								topAnchor = true,
								leftAnchor = true,
								bottomAnchor = true,
								rightAnchor = true,
								material = RegisterMaterial( "cinematic" )
							}
						},
						handlers = {
							omnvar_update = {
								ui_videolog = f0_local18
							}
						}
					}
				}
			}
		}
	} )
	f16_local4:registerAnimationState( "hud_on", f0_local7 )
	f16_local4:registerAnimationState( "hud_off", f0_local8 )
	local f16_local5 = Game.GetOmnvar( "ui_videolog" )
	local f16_local6 = f16_local4:getChildById( "videoLogCinematicId" )
	local f16_local7 = f16_local6:getChildById( "videoLogFade" )
	local f16_local8 = f16_local6:getChildById( "videoLogCinematicMaterialId" )
	f0_local17( f16_local7, {
		name = "ui_videolog",
		value = f16_local5
	} )
	f0_local15( f16_local6, {
		name = "ui_videolog",
		value = f16_local5
	} )
	f0_local18( f16_local8, {
		name = "ui_videolog",
		value = f16_local5
	} )
	local self = LUI.UIElement.new()
	if self.setFlashFade then
		self:setFlashFade()
	end
	self:registerAnimationState( "default", {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self:animateToState( "default" )
	self:addElement( self )
	local f16_local10 = self:getChildById( "shakeContainerHudId" )
	f16_local10 = f16_local10:getChildById( "weaponInfoHud" )
	f16_local10:processEvent( {
		name = "init"
	} )
	local self = LUI.UIImage.new( Engine.IsConsoleGame() and {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		alpha = 0,
		left = -360 * Engine.GetAspectRatio(),
		right = 360 * Engine.GetAspectRatio(),
		top = -360,
		bottom = 360,
		material = RegisterMaterial( "black" )
	} or {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		alpha = 0,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		material = RegisterMaterial( "black" )
	} )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerOmnvarHandler( "ui_go_black", function ( f19_arg0, f19_arg1 )
		if f19_arg1.value then
			f19_arg0:animateToState( "on", f19_arg1.value * 1000 )
		end
	end )
	self:addElement( self )
	f0_local2( self, {} )
	return self
end

local f0_local22 = function ()
	local self = LUI.UIElement.new()
	self.id = "hintsContainerHudId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:animateToState( "default", 0 )
	local f20_local1 = LUI.sp_hud.gameInfo.mantleHintDef()
	local f20_local2 = LUI.sp_hud.gameInfo.cursorHintDef()
	local f20_local3 = LUI.sp_hud.gameInfo.invalidCmdHintDef()
	local f20_local4 = LUI.sp_hud.gameInfo.breathHintDef()
	local f20_local5 = LUI.sp_hud.gameInfo.zoomHintDef()
	local f20_local6 = LUI.sp_hud.gameInfo.toggleHybridHintDef()
	local f20_local7 = LUI.sp_hud.gameInfo.toggleThermalHintDef()
	self:addElement( f20_local1 )
	self:addElement( f20_local2 )
	self:addElement( f20_local3 )
	self:addElement( f20_local4 )
	self:addElement( f20_local5 )
	self:addElement( f20_local6 )
	self:addElement( f20_local7 )
	return self
end

local f0_local23 = function ()
	local self = LUI.UIElement.new()
	self.id = "deadQuoteContainerHudId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:animateToState( "default", 0 )
	self:addElement( LUI.sp_hud.gameInfo.deadQuoteDef() )
	return self
end

local f0_local24 = function ()
	local self = LUI.UIElement.new()
	self.id = "savingContainerHudId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:animateToState( "default", 0 )
	self:addElement( LUI.sp_hud.gameInfo.savingDef() )
	return self
end

local f0_local25 = function ()
	return {
		type = "hud",
		id = "hud_720_id"
	}
end

LUI.MenuBuilder.registerType( "hintsHudDef", f0_local22 )
LUI.MenuBuilder.registerType( "savingHudDef", f0_local24 )
LUI.MenuBuilder.registerType( "hud", f0_local21 )
LUI.MenuBuilder.registerDef( "hud_720", f0_local25 )
LUI.HudManager.registerHud( "hud_720" )
LockTable( _M )
