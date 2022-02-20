local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
require( "LUI.sp_hud.hudStanceIndicator" )
f0_local0 = 3000
f0_local1 = 50
f0_local2 = 50
local f0_local3 = 7000
local f0_local4 = 2000
local f0_local5 = 2000
local f0_local6 = 1000
local f0_local7 = 2000
local f0_local8 = {
	glow_start_fade_in = 0,
	glow_fade_in_time = 0,
	glow_start_fade_out = 67,
	glow_fade_out_time = 0,
	text_start_fade_in = 35,
	text_fade_in_time = 0,
	scanlines_start_fade_in = 35,
	scanlines_fade_in_time = 17,
	scanlines_start_fade_out = 67,
	scanlines_fade_out_time = 360
}
WeaponClipDefault = {
	width = -10.67,
	height = -21.33,
	spacing = -6.33,
	offsetY = 0,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_largeb",
	nvg_material = "h1_hud_weapwidget_ammopip_largeb_nightvision"
}
WeaponClipSmallA = {
	width = 10.67,
	height = 10.67,
	spacing = -7,
	offsetY = 10.67,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_smalla",
	nvg_material = "h1_hud_weapwidget_ammopip_smalla_nightvision"
}
WeaponClipSmallASubM = {
	width = 10.67,
	height = 10.67,
	spacing = -8,
	offsetY = 10.67,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_smalla",
	nvg_material = "h1_hud_weapwidget_ammopip_smalla_nightvision"
}
WeaponClipSmallB = {
	width = 10.67,
	height = 10.67,
	spacing = -6.33,
	offsetY = 10.67,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_smallb",
	nvg_material = "h1_hud_weapwidget_ammopip_smallb_nightvision"
}
WeaponClipMedium = {
	width = 10.67,
	height = 21.33,
	spacing = -8,
	offsetY = 0,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_medium",
	nvg_material = "h1_hud_weapwidget_ammopip_medium_nightvision"
}
WeaponClipLargeA = {
	width = 10.67,
	height = 21.33,
	spacing = -6.33,
	offsetY = 0,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_largea",
	nvg_material = "h1_hud_weapwidget_ammopip_largea_nightvision"
}
WeaponClipLargeAAuto = {
	width = 10.67,
	height = 21.33,
	spacing = -7.67,
	offsetY = 0,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_largea",
	nvg_material = "h1_hud_weapwidget_ammopip_largea_nightvision"
}
WeaponClipLargeAHor = {
	width = 21.33,
	height = 10.67,
	spacing = -2,
	offsetY = 10.67,
	offsetAnchor = 10,
	material = "h1_hud_weapwidget_ammopip_largeahor",
	nvg_material = "h1_hud_weapwidget_ammopip_largeahor_nightvision"
}
WeaponClipLargeB = {
	width = 10.67,
	height = 21.33,
	spacing = -6.33,
	offsetY = 0,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_largeb",
	nvg_material = "h1_hud_weapwidget_ammopip_largeb_nightvision"
}
WeaponClipBelt = {
	width = 5.33,
	height = 2.67,
	spacing = 0,
	offsetY = 10.67,
	offsetAnchor = 0,
	material = "h1_hud_weapwidget_ammopip_belt",
	nvg_material = "h1_hud_weapwidget_ammopip_belt_nightvision",
	beltFed = true,
	rows = 5,
	pipsPerRow = 20
}
WeaponClipShell = {
	width = 21.33,
	height = 10.67,
	spacing = -4.67,
	offsetY = 10.67,
	offsetAnchor = 10,
	material = "h1_hud_weapwidget_ammopip_shell",
	nvg_material = "h1_hud_weapwidget_ammopip_shell_nightvision"
}
WeaponClipRPG7 = {
	width = 85.32,
	height = 10.67,
	spacing = 0,
	offsetY = 10.67,
	offsetAnchor = 76.66,
	material = "h1_hud_weapwidget_ammopip_rpg7",
	nvg_material = "h1_hud_weapwidget_ammopip_rpg7_nightvision"
}
WeaponClipStinger = {
	width = 85.32,
	height = 10.67,
	spacing = 0,
	offsetY = 10.67,
	offsetAnchor = 76.66,
	material = "h1_hud_weapwidget_ammopip_stinger",
	nvg_material = "h1_hud_weapwidget_ammopip_stinger_nightvision"
}
WeaponClipJavelin = {
	width = 85.32,
	height = 10.67,
	spacing = 0,
	offsetY = 10.67,
	offsetAnchor = 76.66,
	material = "h1_hud_weapwidget_ammopip_javelin",
	nvg_material = "h1_hud_weapwidget_ammopip_javelin_nightvision"
}
AltWeaponLookup = {}
ExplosiveLookup = {
	airstrike_support = true,
	c4 = true,
	claymore = true,
	cobra_air_support = true
}
DisableAmmoStatusLookup = {
	airstrike_support = true,
	c4 = true,
	claymore = true,
	cobra_air_support = true,
	stinger = true,
	rpg = true,
	rpg_player = true,
	javelin = true,
	rpg_jeepride = true
}
DisableAmmoAndBulletPipsLookup = {
	javelin = true,
	stinger = true
}
WeaponNameToClipType = {
	default = {
		clip = WeaponClipDefault
	},
	colt45 = {
		clip = WeaponClipSmallA
	},
	colt45_zak_killer = {
		clip = WeaponClipSmallA
	},
	beretta = {
		clip = WeaponClipSmallA
	},
	beretta_muzzle_nodynlight = {
		clip = WeaponClipSmallA
	},
	usp = {
		clip = WeaponClipSmallA
	},
	usp_silencer = {
		clip = WeaponClipSmallA
	},
	deserteagle = {
		clip = WeaponClipSmallB
	},
	deserteagle_cgoship = {
		clip = WeaponClipSmallB
	},
	mp5 = {
		clip = WeaponClipSmallASubM
	},
	mp5_muzzle_small = {
		clip = WeaponClipSmallASubM
	},
	mp5_silencer = {
		clip = WeaponClipSmallASubM
	},
	skorpion = {
		clip = WeaponClipSmallASubM
	},
	uzi = {
		clip = WeaponClipSmallASubM
	},
	uzi_sd = {
		clip = WeaponClipSmallASubM
	},
	ak74u = {
		clip = WeaponClipMedium
	},
	p90 = {
		clip = WeaponClipSmallASubM
	},
	p90_silencer = {
		clip = WeaponClipSmallASubM
	},
	m4_grunt = {
		clip = WeaponClipMedium
	},
	m4_grunt_muzzle_small = {
		clip = WeaponClipMedium
	},
	m4_silencer = {
		clip = WeaponClipMedium
	},
	m4_grenadier = {
		clip = WeaponClipMedium
	},
	m4m203_silencer_reflex = {
		clip = WeaponClipMedium
	},
	m16_basic = {
		clip = WeaponClipMedium
	},
	m16_grenadier = {
		clip = WeaponClipMedium
	},
	ak47 = {
		clip = WeaponClipMedium
	},
	ak47_muzzle_nodynlight = {
		clip = WeaponClipMedium
	},
	ak47_grenadier = {
		clip = WeaponClipMedium
	},
	g36c = {
		clip = WeaponClipMedium
	},
	g3 = {
		clip = WeaponClipLargeAAuto
	},
	rpd = {
		clip = WeaponClipBelt
	},
	rpd_muzzle_small = {
		clip = WeaponClipBelt
	},
	rpd_muzzle_nodynlight = {
		clip = WeaponClipBelt
	},
	saw = {
		clip = WeaponClipBelt
	},
	saw_muzzle_small = {
		clip = WeaponClipBelt
	},
	m60e4 = {
		clip = WeaponClipBelt
	},
	m60e4_muzzle_nodynlight = {
		clip = WeaponClipBelt
	},
	saw_mg_setup = {
		clip = WeaponClipBelt
	},
	remington700 = {
		clip = WeaponClipLargeAHor
	},
	barrett = {
		clip = WeaponClipLargeA
	},
	m14_scoped = {
		clip = WeaponClipLargeA
	},
	m14_scoped_silencer = {
		clip = WeaponClipLargeA
	},
	m14_scoped_woodland = {
		clip = WeaponClipLargeA
	},
	m14_scoped_silencer_woodland = {
		clip = WeaponClipLargeA
	},
	dragunov = {
		clip = WeaponClipLargeA
	},
	m1014 = {
		clip = WeaponClipShell
	},
	winchester1200 = {
		clip = WeaponClipShell
	},
	rpg = {
		clip = WeaponClipRPG7
	},
	rpg_jeepride = {
		clip = WeaponClipRPG7
	},
	rpg_player = {
		clip = WeaponClipRPG7
	},
	stinger = {
		clip = WeaponClipStinger
	},
	stinger_speedy = {
		clip = WeaponClipStinger
	},
	javelin = {
		clip = WeaponClipJavelin
	},
	javelin_objective = {
		clip = WeaponClipJavelin
	},
	m40a3_mp = {
		clip = WeaponClipLargeAHor
	},
	m40a3_acog_mp = {
		clip = WeaponClipLargeAHor
	},
	barret_mp = {
		clip = WeaponClipLargeB
	},
	barret_acog_mp = {
		clip = WeaponClipLargeB
	},
	m60e4_mp = {
		clip = WeaponClipBelt
	},
	m60e4_grip_mp = {
		clip = WeaponClipBelt
	},
	m60e4_acog_mp = {
		clip = WeaponClipBelt
	},
	m60e4_reflex_mp = {
		clip = WeaponClipBelt
	},
	m14_mp = {
		clip = WeaponClipLargeA
	},
	m14_gl_mp = {
		clip = WeaponClipLargeA
	},
	m14_acog_mp = {
		clip = WeaponClipLargeA
	},
	m14_reflex_mp = {
		clip = WeaponClipLargeA
	},
	m14_silencer_mp = {
		clip = WeaponClipLargeA
	},
	mp44_mp = {
		clip = WeaponClipLargeA
	},
	m4_acog_mp = {
		clip = WeaponClipMedium
	},
	m4_reflex_mp = {
		clip = WeaponClipMedium
	}
}
WeaponNameToLabel = {}
local f0_local9 = 5.33
local f0_local10 = 85.32
local f0_local11 = {
	red = Swatches.HUD.Warning.r,
	green = Swatches.HUD.Warning.g,
	blue = Swatches.HUD.Warning.b,
	alpha = 1
}
local f0_local12 = function ( f1_arg0, f1_arg1 )
	if f1_arg0._event ~= f1_arg1 then
		f1_arg0._event = f1_arg1
		f1_arg0:processEvent( {
			name = f1_arg1
		} )
	end
end

local f0_local13 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0._state ~= f2_arg1 then
		f2_arg0._state = f2_arg1
		f2_arg0:animateToState( f2_arg1, f2_arg2 )
	end
end

local f0_local14 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	table.insert( f3_arg1, {
		f = f3_arg3,
		t = f3_arg2,
		p = f3_arg4
	} )
end

local f0_local15 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = RegisterMaterial( f4_arg0 )
	return {
		type = "UIImage",
		states = {
			default = {
				left = 0,
				top = 0,
				width = f4_arg2,
				height = f4_arg3,
				material = f4_local0,
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1
			},
			on = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1,
				material = f4_local0
			},
			off = {
				red = 0.1,
				green = 0.1,
				blue = 0.1,
				material = f4_local0,
				alpha = CoD.HudStandards.overlayAlpha * 0.65
			},
			nvg_off = {
				color = CoD.HudStandards.nvgOverlayTint,
				alpha = CoD.HudStandards.overlayAlphaNVG * 0.5,
				material = RegisterMaterial( f4_arg1 )
			},
			low = {
				color = Colors.hud_warning,
				material = f4_local0,
				alpha = 1
			}
		},
		handlers = {
			low = MBh.AnimateLoop( {
				{
					"low",
					500
				},
				{
					"on",
					500
				}
			} ),
			on = MBh.AnimateToState( "on", 0 ),
			off = MBh.AnimateToState( "off", 0 ),
			nvg_off = MBh.AnimateToState( "nvg_off", 0 )
		}
	}
end

local f0_local16 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0.weaponClipType.clip.width
	local f5_local1 = f5_arg0.weaponClipType.clip.height
	local f5_local2 = f5_arg0.weaponClipType.clip.material
	local f5_local3 = f5_arg0.weaponClipType.clip.nvg_material
	local f5_local4 = f5_arg0.weaponClipType.clip.spacing
	local f5_local5 = f5_arg0.weaponClipType.clip.offsetY
	local f5_local6 = f5_arg0.weaponClipType.clip.offsetAnchor
	local f5_local7 = f5_arg0.weaponClipSize
	local f5_local8 = {
		type = "UIElement",
		id = "ammoClipGraphic",
		states = {
			default = {
				rightAnchor = true,
				bottom = -71.33,
				right = -((f5_arg0.hasAmmoAndBulletPips and 455 or 80) * 0.33),
				alpha = 1
			}
		},
		children = {}
	}
	if f5_arg0.weaponClipType.clip.beltFed == nil then
		for f5_local9 = 1, f5_local7, 1 do
			f5_local8.children[f5_local9] = f0_local15( f5_local2, f5_local3, f5_local0, f5_local1 )
			f5_local8.children[f5_local9].id = "ammoBulletGraphic_" .. f5_local9
			f5_local8.children[f5_local9].states.default.left = -(f5_local7 - f5_local9) * f5_local0 - f5_local4 * (f5_local7 - f5_local9) - f5_local6
			f5_local8.children[f5_local9].states.default.top = f5_local5
		end
	else
		local f5_local9 = 1
		local f5_local10 = f5_arg0.weaponClipType.clip.rows
		local f5_local11 = f5_arg0.weaponClipType.clip.pipsPerRow
		for f5_local12 = 1, f5_local10, 1 do
			for f5_local15 = 1, f5_local11, 1 do
				local f5_local18 = nil
				if f5_local12 % 2 == 0 then
					f5_local18 = -(f5_local15 - 1) * f5_local0 - f5_local4 * (f5_local15 - 1) - f5_local6
				else
					f5_local18 = -(f5_local11 - f5_local15) * f5_local0 - f5_local4 * (f5_local11 - f5_local15) - f5_local6
				end
				f5_local8.children[f5_local9] = f0_local15( f5_local2, f5_local3, f5_local0, f5_local1 )
				f5_local8.children[f5_local9].id = "ammoBulletGraphic_" .. f5_local9
				f5_local8.children[f5_local9].states.default.left = f5_local18
				f5_local8.children[f5_local9].states.default.top = f5_local5 + (f5_local12 - 1) * f5_local1
				f5_local9 = f5_local9 + 1
			end
		end
	end
	return f5_local8
end

local f0_local17 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = LUI.MenuBuilder.BuildAddChild( f6_arg1, f0_local16( f6_arg0 ) )
	f6_local0.pips = {}
	f6_local0.clipMax = f6_arg0.weaponClipSize
	for f6_local1 = 1, f6_local0.clipMax, 1 do
		f6_local0.pips[f6_local0.clipMax - f6_local1 + 1] = f6_local0:getChildById( "ammoBulletGraphic_" .. f6_local1 )
	end
	return f6_local0
end

local f0_local18 = function ( f7_arg0 )
	local f7_local0
	if not f7_arg0.inFlashbangRoutine and not f7_arg0.dead then
		f7_local0 = not f7_arg0.isActionSlotPreempted
	else
		f7_local0 = false
	end
	return f7_local0
end

local f0_local19 = function ( f8_arg0 )
	local f8_local0
	if not f8_arg0.inFlashbangRoutine then
		f8_local0 = not f8_arg0.dead
	else
		f8_local0 = false
	end
	return f8_local0
end

local f0_local20 = function ( f9_arg0 )
	local f9_local0
	if not f9_arg0.inFlashbangRoutine and not f9_arg0.dead and not f9_arg0.isAmmoStatusPreempted then
		f9_local0 = not f9_arg0.hasExplosivesEquipped
	else
		f9_local0 = false
	end
	return f9_local0
end

local f0_local21 = function ( f10_arg0 )
	local f10_local0
	if not f10_arg0.inFlashbangRoutine and not f10_arg0.dead then
		f10_local0 = not f10_arg0.isWeaponInfoPreempted
	else
		f10_local0 = false
	end
	return f10_local0
end

local f0_local22 = function ( f11_arg0 )
	local f11_local0
	if not f11_arg0.primaryAmmoIsLow and not f11_arg0.primaryClipIsLow then
		f11_local0 = not f11_arg0.inFlashbangRoutine
	else
		f11_local0 = false
	end
	return f11_local0
end

local f0_local23 = function ( f12_arg0 )
	local f12_local0
	if not f0_local22( f12_arg0 ) or f12_arg0.actionSlot.activeSlot ~= 0 then
		f12_local0 = not f12_arg0.actionSlot.hasValidSlots
	else
		f12_local0 = true
	end
	return f12_local0
end

local f0_local24 = function ( f13_arg0 )
	return f0_local22( f13_arg0 )
end

local f0_local25 = function ( f14_arg0 )
	return true
end

local f0_local26 = function ( f15_arg0, f15_arg1 )
	for f15_local0 = 1, #f15_arg0.inactiveWidgets, 1 do
		f0_local13( f15_arg0.inactiveWidgets[f15_local0], "off", f15_arg1 )
	end
end

local f0_local27 = function ( f16_arg0, f16_arg1, f16_arg2 )
	if f16_arg0.actionSlot.hasValidSlot == false then
		return 
	elseif f0_local18( f16_arg0 ) == true or f16_arg2 == true then
		f16_arg0.actionSlotIsShowing = true
		f0_local13( f16_arg0.actionSlot, "on", f16_arg1 )
	end
end

function hideActionSlot( f17_arg0, f17_arg1, f17_arg2 )
	if f0_local23( f17_arg0 ) == true or f17_arg2 == true then
		f17_arg0.actionSlotIsShowing = false
		f0_local13( f17_arg0.actionSlot, "off", f17_arg1 )
	end
end

local f0_local28 = function ( f18_arg0, f18_arg1, f18_arg2 )
	if f0_local19( f18_arg0 ) == true or f18_arg2 == true then
		f18_arg0.hudStanceIsShowing = true
		f0_local13( f18_arg0.hudStance, "on", f18_arg1 )
	end
end

function hideHudStance( f19_arg0, f19_arg1, f19_arg2 )
	if f0_local24( f19_arg0 ) == true or f19_arg2 == true then
		f19_arg0.hudStanceIsShowing = false
		f0_local13( f19_arg0.hudStance, "off", f19_arg1 )
	end
end

local f0_local29 = function ( f20_arg0, f20_arg1 )
	f0_local13( f20_arg1.element, f20_arg1.state, f20_arg1.time )
end

local f0_local30 = function ( f21_arg0, f21_arg1 )
	if f0_local20( f21_arg0 ) then
		f21_arg0.ammoStatusIsShowing = true
		if f21_arg0.ammoStatus.state ~= f21_arg1 then
			f21_arg0.ammoStatus.state = f21_arg1
			f21_arg0.watchdogGroups.ammoStatus = {}
			f0_local14( f21_arg0, f21_arg0.watchdogGroups.ammoStatus, f0_local8.glow_start_fade_in, f0_local29, {
				element = f21_arg0.ammoStatus.glow,
				state = f21_arg1,
				time = f0_local8.glow_fade_in_time
			} )
			f0_local14( f21_arg0, f21_arg0.watchdogGroups.ammoStatus, f0_local8.scanlines_start_fade_in, f0_local29, {
				element = f21_arg0.ammoStatus.scanlines,
				state = f21_arg1,
				time = f0_local8.scanlines_fade_in_time
			} )
			f0_local14( f21_arg0, f21_arg0.watchdogGroups.ammoStatus, f0_local8.text_start_fade_in, f0_local29, {
				element = f21_arg0.ammoStatus.text,
				state = f21_arg1,
				time = f0_local8.text_fade_in_time
			} )
			f0_local14( f21_arg0, f21_arg0.watchdogGroups.ammoStatus, f0_local8.text_start_fade_in, f0_local29, {
				element = f21_arg0.ammoStatus.backer,
				state = f21_arg1,
				time = f0_local8.text_fade_in_time
			} )
			f0_local14( f21_arg0, f21_arg0.watchdogGroups.ammoStatus, f0_local8.glow_start_fade_out, f0_local29, {
				element = f21_arg0.ammoStatus.glow,
				state = "off",
				time = f0_local8.glow_fade_out_time
			} )
			f0_local14( f21_arg0, f21_arg0.watchdogGroups.ammoStatus, f0_local8.scanlines_start_fade_out, f0_local29, {
				element = f21_arg0.ammoStatus.scanlines,
				state = "off",
				time = f0_local8.scanlines_fade_out_time
			} )
		end
	end
end

function hideAmmoStatus( f22_arg0, f22_arg1, f22_arg2 )
	if f0_local25( f22_arg0 ) or f22_arg2 then
		f22_arg0.ammoStatusIsShowing = false
		f0_local13( f22_arg0.ammoStatus.text, "off", f22_arg1 )
		f0_local13( f22_arg0.ammoStatus.backer, "off", f22_arg1 )
		f0_local13( f22_arg0.ammoStatus.glow, "off", f22_arg1 )
		f0_local13( f22_arg0.ammoStatus.scanlines, "off", f22_arg1 )
		f22_arg0.ammoStatus.state = nil
		f22_arg0.watchdogGroups.ammoStatus = {}
	end
end

local f0_local31 = function ( f23_arg0, f23_arg1, f23_arg2 )
	if f0_local21( f23_arg0 ) == true or f23_arg2 == true then
		for f23_local0 = 1, #f23_arg0.activeWidgets, 1 do
			f0_local13( f23_arg0.activeWidgets[f23_local0], "on", f23_arg1 )
		end
		f23_arg0.weaponWidgetIsShowing = true
	end
end

local f0_local32 = function ( f24_arg0, f24_arg1, f24_arg2 )
	if f0_local22( f24_arg0 ) == true or f24_arg2 == true then
		for f24_local0 = 1, #f24_arg0.activeWidgets, 1 do
			f0_local13( f24_arg0.activeWidgets[f24_local0], "off", f24_arg1 )
		end
		f24_arg0.weaponWidgetIsShowing = false
	end
end

local f0_local33 = function ( f25_arg0, f25_arg1 )
	f25_arg0.watchdogGroups.hideWidgets = {}
	f0_local14( f25_arg0, f25_arg0.watchdogGroups.hideWidgets, f0_local3, f0_local32, f0_local4 )
end

local f0_local34 = function ( f26_arg0, f26_arg1 )
	local f26_local0 = f26_arg0.watchdogGroups
	f26_arg0.watchdogGroups = {}
	for f26_local7, f26_local8 in pairs( f26_local0 ) do
		local f26_local9 = {}
		for f26_local4, f26_local5 in pairs( f26_local8 ) do
			f26_local5.t = f26_local5.t - f26_arg1
			if f26_local5.t <= 0 then
				f26_local5.f( f26_arg0, f26_local5.p )
			else
				table.insert( f26_local9, f26_local5 )
			end
		end
		if #f26_local9 > 0 then
			f26_arg0.watchdogGroups[f26_local7] = {}
			f26_arg0.watchdogGroups[f26_local7] = f26_local9
		end
	end
end

function updateAmmoStatusMessage( f27_arg0 )
	if f27_arg0.primaryClipIsLow and f27_arg0.hasPrimaryWeapon then
		local f27_local0, f27_local1 = nil
		if f27_arg0.primaryStockAmmo > 0 then
			f27_local0 = Engine.Localize( "@PLATFORM_RELOAD_CAPS" )
			f27_local1 = "reload"
		elseif f27_arg0.primaryClipAmmo > 0 then
			f27_local0 = Engine.Localize( "@PLATFORM_LOW_AMMO_NO_RELOAD_CAPS" )
			f27_local1 = "low"
		else
			f27_local0 = Engine.Localize( "@WEAPON_NO_AMMO_CAPS" )
			f27_local1 = "out"
		end
		if f27_local1 ~= "out" and f27_arg0.hasAmmoStatus == false then
			hideAmmoStatus( f27_arg0, f0_local1, false )
		else
			f27_arg0.ammoStatus.text:setText( f27_local0 )
			f0_local30( f27_arg0, f27_local1 )
		end
	else
		hideAmmoStatus( f27_arg0, f0_local1, false )
	end
end

local f0_local35 = function ( f28_arg0 )
	local f28_local0 = Game.GetPlayerPrimaryMaxClipAmmo()
	if f28_local0 == 0 then
		return 
	elseif f28_local0 ~= f28_arg0.clipMax then
		return 
	end
	local f28_local1 = Game.GetPlayerPrimaryClipAmmo( 1 )
	local f28_local2 = Game.GetPlayerClipLowAmmoThreshold()
	f28_arg0.weaponInfo.primaryClipAmmo = f28_local1
	f28_arg0.weaponInfo.primaryClipIsLow = f28_local1 <= f28_local0 * f28_local2
	updateAmmoStatusMessage( f28_arg0.weaponInfo )
	local f28_local3 = nil
	if f28_arg0.weaponInfo.primaryClipIsLow then
		f28_local3 = "low"
	else
		f28_local3 = "on"
	end
	for f28_local4 = 1, f28_local1, 1 do
		f0_local12( f28_arg0.pips[f28_local4], f28_local3 )
	end
	local f28_local4 = nil
	if f28_arg0.weaponInfo.isNvgMode then
		f28_local4 = "nvg_off"
	else
		f28_local4 = "off"
	end
	for f28_local5 = f28_local1 + 1, f28_local0, 1 do
		f0_local12( f28_arg0.pips[f28_local5], f28_local4 )
	end
end

local f0_local36 = function ( f29_arg0 )
	f29_arg0.activeWidgets = {}
	f29_arg0.inactiveWidgets = {}
	if f29_arg0.hasPrimaryWeapon == false then
		table.insert( f29_arg0.inactiveWidgets, f29_arg0.tacticalWidget )
		table.insert( f29_arg0.inactiveWidgets, f29_arg0.lethalWidget )
		table.insert( f29_arg0.inactiveWidgets, f29_arg0.leftTickMarks )
		table.insert( f29_arg0.inactiveWidgets, f29_arg0.rightTickMarks )
		table.insert( f29_arg0.inactiveWidgets, f29_arg0.primaryWidget )
	else
		if f29_arg0.tacticalWidget ~= nil then
			table.insert( f29_arg0.activeWidgets, f29_arg0.tacticalWidget )
		end
		if f29_arg0.lethalWidget ~= nil then
			table.insert( f29_arg0.activeWidgets, f29_arg0.lethalWidget )
		end
		table.insert( f29_arg0.activeWidgets, f29_arg0.leftTickMarks )
		table.insert( f29_arg0.activeWidgets, f29_arg0.rightTickMarks )
		if f29_arg0.hasExplosivesEquipped then
			table.insert( f29_arg0.inactiveWidgets, f29_arg0.primaryWidget )
		else
			table.insert( f29_arg0.activeWidgets, f29_arg0.primaryWidget )
		end
	end
end

local f0_local37 = function ( f30_arg0 )
	if f30_arg0.hasExplosivesEquipped then
		return 
	end
	local f30_local0 = Game.GetPlayerPrimaryStockAmmo()
	local f30_local1 = Game.GetPlayerMaxStockAmmo()
	f30_arg0.primaryStockAmmo = f30_local0
	if not f30_arg0.hasAmmoAndBulletPips then
		return 
	end
	local f30_local2 = f30_local1 * 0.2
	if f30_local0 <= f30_local2 then
		f30_arg0.primaryAmmoIsLow = true
		f0_local13( f30_arg0.primaryWeaponAmmoText, "low", 0 )
	elseif f30_local2 < f30_local0 then
		f30_arg0.primaryAmmoIsLow = false
		f0_local13( f30_arg0.primaryWeaponAmmoText, "on", 0 )
	end
	if f30_local0 >= 10 and f30_local0 < 100 then
		f0_local13( f30_arg0.primaryWeaponAmmoText.emptySlot0, "off", 0 )
		f0_local13( f30_arg0.primaryWeaponAmmoText.emptySlot1, "on", 0 )
	elseif f30_local0 < 10 then
		f0_local13( f30_arg0.primaryWeaponAmmoText.emptySlot0, "on", 0 )
		f0_local13( f30_arg0.primaryWeaponAmmoText.emptySlot1, "on", 0 )
	else
		f0_local13( f30_arg0.primaryWeaponAmmoText.emptySlot0, "off", 0 )
		f0_local13( f30_arg0.primaryWeaponAmmoText.emptySlot1, "off", 0 )
	end
	f30_arg0.primaryWeaponAmmoText:setText( f30_local0 )
end

local f0_local38 = function ( f31_arg0 )
	f31_arg0.parent.weaponWidgetDirty = true
end

function setHideActionSlotWatchdog( f32_arg0 )
	f32_arg0.watchdogGroups.actionSlot = {}
	f0_local14( f32_arg0, f32_arg0.watchdogGroups.actionSlot, f0_local3, hideActionSlot, f0_local4 )
end

function actionSlotWatcher( f33_arg0, f33_arg1 )
	f33_arg0.parent.actionSlotDirty = true
end

function updateActionSlot( f34_arg0, f34_arg1 )
	f34_arg0.actionSlotDirty = false
	f34_arg0.actionSlot.activeSlot = 0
	f34_arg0.actionSlot.hasValidSlot = false
	for f34_local0 = 0, 3, 1 do
		if Game.GetPlayerActionSlotActive( f34_local0 ) then
			f34_arg0.actionSlot.activeSlot = f34_local0 + 1
			break
		end
	end
	for f34_local0 = 1, 4, 1 do
		f34_arg0.actionSlot.slots[f34_local0] = Game.GetPlayerActionSlotMaterial( f34_local0 - 1 )
	end
	for f34_local0 = 1, 4, 1 do
		if f34_arg0.actionSlot.slots[f34_local0] ~= nil then
			f34_arg0.actionSlot.hasValidSlot = true
			break
		end
	end
	if f34_arg0.actionSlot.hasValidSlot == false then
		hideActionSlot( f34_arg0, f0_local1 )
	else
		f0_local27( f34_arg0, f0_local2 )
		setHideActionSlotWatchdog( f34_arg0 )
	end
end

local f0_local39 = function ( f35_arg0 )
	f0_local13( f35_arg0.primaryWeaponText, "off", f0_local5 )
end

local f0_local40 = function ( f36_arg0 )
	f36_arg0.weaponWidgetDirty = false
	local f36_local0 = Game.GetPlayerWeaponName()
	local f36_local1 = WeaponNameToClipType[f36_local0]
	local f36_local2 = Game.GetPlayerPrimaryMaxClipAmmo()
	if f36_local1 == nil then
		f36_local1 = WeaponNameToClipType.default
	end
	local f36_local3 = WeaponNameToLabel[f36_local0]
	if f36_arg0.weaponLabelTable ~= f36_local3 then
		if f36_arg0.weaponLabelTable ~= nil then
			f0_local13( f36_arg0.weaponLabelTable, "off", 0 )
		end
		f36_arg0.weaponLabelTable = f36_local3
		if f36_arg0.weaponLabelTable ~= nil then
			f0_local13( f36_arg0.weaponLabelTable, "on", 0 )
		end
	end
	local f36_local4 = Game.GetPlayerSmokeWeapon()
	if f36_local4 == "smoke_grenade_american" then
		f0_local13( f36_arg0.tacticalWidget.smk, "on", 0 )
		f0_local13( f36_arg0.tacticalWidget.fla, "off", 0 )
	elseif f36_local4 == "flash_grenade" then
		f0_local13( f36_arg0.tacticalWidget.fla, "on", 0 )
		f0_local13( f36_arg0.tacticalWidget.smk, "off", 0 )
	end
	if f36_arg0.tacticalWidget ~= nil then
		if Game.GetPlayerSmokeAmmo() == 0 then
			f0_local13( f36_arg0.tacticalWidget.text, "low", 0 )
		else
			f0_local13( f36_arg0.tacticalWidget.text, "on", 0 )
		end
	end
	if f36_arg0.lethalWidget ~= nil then
		if Game.GetPlayerFragAmmo() == 0 then
			f0_local13( f36_arg0.lethalWidget.text, "low", 0 )
		else
			f0_local13( f36_arg0.lethalWidget.text, "on", 0 )
		end
	end
	local f36_local5 = Game.GetPlayerWeaponDisplayName()
	if f36_local5 == nil then
		f36_local5 = ""
	end
	local f36_local6 = AltWeaponLookup[f36_local5]
	if f36_local6 == nil then
		f36_local6 = Game.IsWeaponInAltMode()
		AltWeaponLookup[f36_local5] = f36_local6
	end
	if f36_arg0.weaponName ~= f36_local0 or f36_local1 ~= f36_arg0.weaponClipType or f36_arg0.weaponClipSize ~= f36_local2 or f36_arg0.altWeapon ~= f36_local6 then
		f36_arg0.weaponName = f36_local0
		f36_arg0.hasExplosivesEquipped = ExplosiveLookup[f36_local0] ~= nil
		f36_arg0.hasAmmoStatus = DisableAmmoStatusLookup[f36_local0] == nil
		f36_arg0.hasAmmoAndBulletPips = DisableAmmoAndBulletPipsLookup[f36_local0] == nil
		f36_arg0.hasPrimaryWeapon = f36_local2 > 0
		f36_arg0.weaponClipType = f36_local1
		f36_arg0.weaponClipSize = f36_local2
		f36_arg0.primaryClipAmmo = Game.GetPlayerPrimaryClipAmmo( 1 )
		f36_arg0.primaryClipIsLow = f36_arg0.primaryClipAmmo <= f36_local2 * Game.GetPlayerClipLowAmmoThreshold()
		f36_arg0.primaryStockAmmo = Game.GetPlayerPrimaryStockAmmo()
		f36_arg0.ammoStatus.state = nil
		f36_arg0.altWeapon = f36_local6
		if not f36_arg0.hasExplosivesEquipped and f36_arg0.hasPrimaryWeapon then
			f36_arg0.primaryWeaponText:setText( f36_local5 )
			if f36_arg0.pipImage ~= nil then
				f36_arg0.pipImage:registerEventHandler( "int_watch_alert", nil )
				f36_arg0.primaryWidget:removeElement( f36_arg0.pipImage )
				f36_arg0.pipImage = nil
			end
			if f36_arg0.weaponClipType ~= nil then
				if f36_arg0.pipGraphics[f36_arg0.weaponClipType] == nil then
					f36_arg0.pipGraphics[f36_arg0.weaponClipType] = {}
				end
				if f36_arg0.pipGraphics[f36_arg0.weaponClipType][f36_arg0.weaponClipSize] == nil then
					f36_arg0.pipImage = f0_local17( f36_arg0, f36_arg0.primaryWidget )
					f36_arg0.pipImage.weaponInfo = f36_arg0
				else
					f36_arg0.pipImage = f36_arg0.pipGraphics[f36_arg0.weaponClipType][f36_arg0.weaponClipSize]
					f36_arg0.primaryWidget:addElement( f36_arg0.pipImage )
				end
				f36_arg0.pipImage:setupUIIntWatch( "ClipAmmoRight" )
				f36_arg0.pipImage:registerEventHandler( "int_watch_alert", f0_local35 )
			end
		else
			f36_arg0.primaryWeaponText:setText( "" )
		end
		if f36_arg0.hasExplosivesEquipped then
			f0_local13( f36_arg0.leftTickMarks, "slide_no_primary", 0 )
		elseif f36_arg0.hasTactical == true and f36_arg0.hasLethal == true then
			f0_local13( f36_arg0.leftTickMarks, "slide_full", 0 )
		end
		f36_arg0.watchdogGroups.primaryWeaponText = {}
		if not f36_arg0.hasExplosivesEquipped and f36_arg0.hasPrimaryWeapon then
			f0_local14( f36_arg0, f36_arg0.watchdogGroups.primaryWeaponText, f0_local5, f0_local39 )
			f0_local13( f36_arg0.primaryWeaponText, "on", f0_local2 )
		end
		f0_local36( f36_arg0 )
		hideAmmoStatus( f36_arg0, 0, true )
		if not f36_arg0.hasAmmoAndBulletPips then
			f0_local13( f36_arg0.primaryWeaponText, "right", 0 )
			f0_local13( f36_arg0.primaryWeaponAmmoText, "off", 0 )
			f0_local13( f36_arg0.primaryWeaponAmmoText.emptySlot0, "off", 0 )
			f0_local13( f36_arg0.primaryWeaponAmmoText.emptySlot1, "off", 0 )
		else
			f0_local13( f36_arg0.primaryWeaponText, "left", 0 )
		end
	end
	f0_local37( f36_arg0 )
	updateAmmoStatusMessage( f36_arg0 )
	f0_local26( f36_arg0, f0_local1 )
	f0_local31( f36_arg0, f0_local2 )
	f0_local33( f36_arg0, f36_arg0.activeWidgets )
end

local f0_local41 = function ( f37_arg0, f37_arg1, f37_arg2 )
	if f37_arg0.compass.alpha ~= f37_arg1 then
		f37_arg0.compass:registerAnimationState( "fade", {
			alpha = f37_arg1
		} )
		f37_arg0.compass.tickertape:registerAnimationState( "fade", {
			alpha = f37_arg1
		} )
		f37_arg0.compass:animateToState( "fade", f37_arg2 )
		f37_arg0.compass.tickertape:animateToState( "fade", f37_arg2 )
		f37_arg0.compass.alpha = f37_arg1
	end
end

local f0_local42 = function ( f38_arg0 )
	if f38_arg0.dead then
		return 
	else
		f38_arg0.flashbangAllNormal = true
	end
end

local f0_local43 = function ( f39_arg0 )
	if f39_arg0.dead then
		return 
	elseif not f39_arg0.isActionSlotPreempted then
		f0_local27( f39_arg0, f0_local6, true )
	end
	if not f39_arg0.isHudStancePreemted then
		f0_local28( f39_arg0, f0_local6, true )
	end
	if not f39_arg0.isWeaponInfoPreempted then
		f0_local31( f39_arg0, f0_local6, true )
	end
	if not f39_arg0.isCompassPreempted then
		f0_local41( f39_arg0, 1, f0_local6 )
	end
	f39_arg0.watchdogGroups.flashbangAllNormal = {}
	f0_local14( f39_arg0, f39_arg0.watchdogGroups.flashbangAllNormal, f0_local6, f0_local42 )
end

local f0_local44 = function ( f40_arg0 )
	f0_local32( f40_arg0, 0, true )
	hideActionSlot( f40_arg0, 0, true )
	hideHudStance( f40_arg0, 0, true )
	f0_local41( f40_arg0, 0, 0 )
	hideAmmoStatus( f40_arg0, 0, true )
	f40_arg0.watchdogGroups.flashbanged = {}
	f0_local14( f40_arg0, f40_arg0.watchdogGroups.flashbanged, f0_local7, f0_local43 )
end

local f0_local45 = function ( f41_arg0, f41_arg1 )
	f41_arg0.time = Game.GetTime()
	local f41_local0 = Game.GetPlayerHealth()
	local f41_local1 = Game.IsShowingGameMessages( 1 )
	local f41_local2 = Game.IsHudEnabled()
	local f41_local3 = Engine.GetDvarBool( "ammoCounterHide" )
	local f41_local4 = Engine.GetDvarBool( "actionSlotsHide" )
	local f41_local5 = Engine.GetDvarBool( "hud_showstance" )
	local f41_local6 = Engine.GetDvarBool( "compass" )
	local f41_local7 = Game.GetJavelinActive()
	local f41_local8 = Game.PlayerReticleZoom()
	local f41_local9 = Game.PlayerOnTurret()
	local f41_local10 = Game.CheckPlayerMiscInput()
	local f41_local11 = Game.GetOmnvar( "ui_display_hud_for_equipment_motion" )
	local f41_local12 = f41_local1
	local f41_local13
	if f41_local2 ~= false and f41_local4 ~= true and f41_local8 ~= true and f41_local9 ~= true then
		f41_local13 = false
	else
		f41_local13 = f41_local12 or true
	end
	local f41_local14 = f41_local1
	local f41_local15
	if f41_local2 then
		f41_local15 = not f41_local5
	else
		f41_local15 = f41_local14 or true
	end
	local f41_local16
	if f41_local2 then
		local f41_local17 = f41_local3
		local f41_local18 = f41_local9
		f41_local16 = f41_local7
	else
		f41_local16 = f41_local18 or f41_local17 or true
	end
	local f41_local19
	if f41_local2 ~= false and f41_local6 ~= false and f41_local8 ~= true and f41_local9 ~= true then
		f41_local19 = false
	else
		f41_local19 = true
	end
	local f41_local20 = f41_local16
	local f41_local21 = false
	if not f41_arg0.displayHudForEquipmentMotion and f41_local11 then
		f41_arg0.displayHudForEquipmentMotion = true
		f41_arg0.weaponWidgetDirty = true
	end
	if f41_arg0.displayHudForEquipmentMotion and not f41_local11 then
		f41_arg0.displayHudForEquipmentMotion = false
	end
	if f41_local13 and not f41_arg0.isActionSlotPreempted and f41_arg0.actionSlotIsShowing == true then
		f41_arg0.actionSlotDirty = true
		hideActionSlot( f41_arg0, f0_local1, true )
	end
	if f41_local15 and not f41_arg0.isHudStancePreempted and f41_arg0.hudStanceIsShowing then
		f41_arg0.hudStanceDirty = true
		hideHudStance( f41_arg0, f0_local1, true )
	end
	if f41_local20 and not f41_arg0.isAmmoStatusPreempted then
		hideAmmoStatus( f41_arg0, f0_local1, true )
	elseif not f41_local20 and f41_arg0.isAmmoStatusPreempted then
		f41_local21 = true
	end
	if f41_local19 then
		f0_local41( f41_arg0, 0, f0_local1 )
	end
	if f41_local16 and not f41_arg0.isWeaponInfoPreempted and f41_arg0.weaponWidgetIsShowing then
		f41_arg0.weaponWidgetDirty = true
		f0_local32( f41_arg0, f0_local1, true )
	end
	if f41_arg0.isActionSlotPreempted and not f41_local13 and f41_arg0.weaponWidgetIsShowing then
		f41_arg0.weaponWidgetDirty = true
	end
	f41_arg0.isCompassPreempted = f41_local19
	f41_arg0.isWeaponInfoPreempted = f41_local16
	f41_arg0.isActionSlotPreempted = f41_local13
	f41_arg0.isHudStancePreempted = f41_local15
	f41_arg0.isAmmoStatusPreempted = f41_local20
	if f41_local0 > 0 and f41_arg0.weaponWidgetDirty and not f41_arg0.isWeaponInfoPreempted then
		f0_local40( f41_arg0 )
		f41_arg0.actionSlotDirty = true
	end
	if f41_local0 > 0 and f41_arg0.actionSlotDirty and not f41_arg0.isActionSlotPreempted then
		updateActionSlot( f41_arg0 )
	end
	if f41_local0 > 0 and f41_arg0.hudStanceDirty and not f41_arg0.isHudStancePreempted then
		f41_arg0.hudStanceDirty = false
		f0_local28( f41_arg0, f0_local2, false )
	end
	if f41_local0 > 0 and f41_local21 then
		updateAmmoStatusMessage( f41_arg0 )
	end
	if f41_arg0.miscInput ~= f41_local10 then
		f41_arg0.miscInput = f41_local10
		if f41_arg0.miscInput then
			f41_arg0.weaponWidgetDirty = true
			f41_arg0.actionSlotDirty = true
		end
	end
	f0_local34( f41_arg0, f41_arg1.timeElapsed )
	if f41_local0 <= 0 and f41_arg0.dead == false then
		f41_arg0.dead = true
		f0_local32( f41_arg0, f0_local0, true )
		f0_local41( f41_arg0, 0, f0_local0 )
		hideActionSlot( f41_arg0, f0_local0, true )
		hideAmmoStatus( f41_arg0, f0_local0, true )
	end
	if f41_arg0.dead == false then
		local f41_local22 = Game.GetFlashbangedRemainingTime()
		if f41_local22 > 0 and f41_arg0.inFlashbangRoutine == false then
			f41_arg0.inFlashbangRoutine = true
			f41_arg0.flashbangAllNormal = false
			f0_local44( f41_arg0 )
		elseif f41_local22 == 0 and f41_arg0.inFlashbangRoutine == true then
			f41_arg0.inFlashbangRoutine = false
			f0_local33( f41_arg0, f41_arg0.activeWidgets )
			setHideActionSlotWatchdog( f41_arg0 )
		elseif f41_arg0.flashbangAllNormal and not f41_local19 then
			f0_local41( f41_arg0, Game.GetCompassAlpha(), 0 )
		end
	end
	f41_arg0:dispatchEventToChildren( f41_arg1 )
end

local f0_local46 = function ( f42_arg0, f42_arg1, f42_arg2 )
	for f42_local0 = 1, #f42_arg1, 1 do
		local self = LUI.UIElement.new()
		self.id = f42_arg1[f42_local0] .. "_watch"
		self:setupUIIntWatch( f42_arg1[f42_local0] )
		self:registerEventHandler( "int_watch_alert", f42_arg2 )
		self.parent = f42_arg0
		f42_arg0:addElement( self )
	end
end

local f0_local47 = function ( f43_arg0, f43_arg1 )
	local f43_local0 = f43_arg0:getFirstDescendentById( "actionSlotId" )
	local f43_local1 = f43_arg0:getFirstDescendentById( "actionSlotDpadId" )
	local f43_local2 = f43_arg0:getFirstDescendentById( "actionSlotKeyboardId" )
	if f43_arg1.original.newValue == 1 then
		if not f43_local2.hidden then
			f43_local0.useKeyboard = false
			f43_local0.useDpad = true
			f43_local1.hidden = false
			f0_local13( f43_local1, "hud_on", 0 )
			f43_local2.hidden = true
			f0_local13( f43_local2, "hud_off", 0 )
		end
	elseif f43_arg1.original.newValue == 0 and not f43_local1.hidden then
		f43_local0.useKeyboard = true
		f43_local0.useDpad = false
		f43_local1.hidden = true
		f0_local13( f43_local1, "hud_off", 0 )
		f43_local2.hidden = false
		f0_local13( f43_local2, "hud_on", 0 )
	end
end

local f0_local48 = function ( f44_arg0, f44_arg1 )
	local f44_local0 = nil
	f44_arg0.isNvgMode = f44_arg1.value
	if f44_arg0.isNvgMode then
		f44_local0 = "nvg_on"
	else
		f44_local0 = "on"
	end
	for f44_local1 = 1, #f44_arg0.nvgElements, 1 do
		f0_local13( f44_arg0.nvgElements[f44_local1], f44_local0, 0 )
	end
	if f44_arg0.pipImage ~= nil then
		f0_local35( f44_arg0.pipImage )
	end
end

local f0_local49 = function ( f45_arg0 )
	local f45_local0 = {}
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "smokeGrenadeIconOverlay" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "smokeGrenadeIconLabelSMKImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "smokeGrenadeIconLabelFLAImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "fragGrenadeIconOverlay" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "fragGrenadeIconLabel" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoTextEmpty0Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoTextEmpty1Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerOverlay" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel12gImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19LugerImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel45ACPImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelJavelinImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelStingerImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelPG7GImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt556x45Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x39Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x54RImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x39RImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x33Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x39NATOImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATOImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATOImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel57x28Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel545x39Image" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel50BMGImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel50AEImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel32ACPImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "leftTickMarksImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "rightTickMarksImage" ) )
	table.insert( f45_local0, f45_arg0:getFirstDescendentById( "tickerTapeOverlayImage" ) )
	return f45_local0
end

local f0_local50 = function ( f46_arg0, f46_arg1 )
	if Game.GetPlayerHealth() > 0 then
		f46_arg0:setText( f46_arg1.newValue )
	end
end

local f0_local51 = function ( f47_arg0 )
	f47_arg0.ammoStatus = {}
	f47_arg0.tacticalWidget = f47_arg0:getFirstDescendentById( "smokeGrenadeContainer" )
	f47_arg0.tacticalWidget.fla = f47_arg0:getFirstDescendentById( "smokeGrenadeIconLabelFLA" )
	f47_arg0.tacticalWidget.smk = f47_arg0:getFirstDescendentById( "smokeGrenadeIconLabelSMK" )
	f47_arg0.tacticalWidget.text = f47_arg0:getFirstDescendentById( "smokeGrenadeAmmoText" )
	f47_arg0.lethalWidget = f47_arg0:getFirstDescendentById( "fragGrenadeContainer" )
	f47_arg0.lethalWidget.text = f47_arg0:getFirstDescendentById( "fragGrenadeAmmoText" )
	f47_arg0.primaryWidget = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainer" )
	f47_arg0.primaryWeaponText = f47_arg0:getFirstDescendentById( "primaryWeaponText" )
	f47_arg0.primaryWeaponAmmoText = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoText" )
	f47_arg0.leftTickMarks = f47_arg0:getFirstDescendentById( "leftTickMarks" )
	f47_arg0.rightTickMarks = f47_arg0:getFirstDescendentById( "rightTickMarks" )
	f47_arg0.primaryWeaponAmmoText.emptySlot0 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoTextEmpty0" )
	f47_arg0.primaryWeaponAmmoText.emptySlot1 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoTextEmpty1" )
	f47_arg0.compass = f47_arg0:getFirstDescendentById( "compassHud" )
	f47_arg0.compass.tickertape = f47_arg0:getFirstDescendentById( "compassTickerTape" )
	f47_arg0.actionSlot = f47_arg0:getFirstDescendentById( "actionSlotContainer" )
	f47_arg0.ammoStatus.text = f47_arg0:getFirstDescendentById( "ammoStatusText" )
	f47_arg0.ammoStatus.backer = f47_arg0:getFirstDescendentById( "ammoStatusBacker" )
	f47_arg0.ammoStatus.glow = f47_arg0:getFirstDescendentById( "ammoStatusGlow" )
	f47_arg0.ammoStatus.scanlines = f47_arg0:getFirstDescendentById( "ammoStatusScanlines" )
	f47_arg0.hudStance = f47_arg0:getFirstDescendentById( "hudStanceContainer" )
	f47_arg0.watchdogGroups = {}
	f47_arg0.activeWidgets = {}
	f47_arg0.inactiveWidgets = {}
	f47_arg0.isNvgMode = false
	f47_arg0.primaryAmmoIsLow = false
	f47_arg0.primaryClipIsLow = false
	f47_arg0.primaryClipAmmo = 0
	f47_arg0.hasExplosivesEquipped = false
	f47_arg0.hasAmmoStatus = false
	f47_arg0.hasAmmoAndBulletPips = true
	f47_arg0.inFlashbangRoutine = false
	f47_arg0.weaponName = ""
	f47_arg0.dead = false
	f47_arg0.isActionSlotPreempted = false
	f47_arg0.isWeaponInfoPreempted = false
	f47_arg0.time = 0
	f47_arg0.weaponWidgetDirty = true
	f47_arg0.actionSlotDirty = true
	f47_arg0.weaponWidgetIsShowing = false
	f47_arg0.actionSlotIsShowing = false
	f47_arg0.actionSlot.activeSlot = 0
	f47_arg0.actionSlot.slots = {}
	f47_arg0.actionSlot.hasValidSlot = false
	f47_arg0.hudStanceIsShowing = true
	f47_arg0.ammoStatusIsShowing = false
	f47_arg0.displayHudForEquipmentMotion = false
	f47_arg0.flashbangAllNormal = true
	f47_arg0.nvgElements = f0_local49( f47_arg0 )
	f47_arg0:registerOmnvarHandler( "ui_nightvision", f0_local48 )
	f0_local48( f47_arg0, {
		name = "ui_nightvision",
		value = Game.GetOmnvar( "ui_nightvision" )
	} )
	f47_arg0.pipGraphics = {}
	f47_arg0.hasTactical = Game.GetPlayerSmokeWeapon() ~= "none"
	if f47_arg0.hasTactical == true then
		local f47_local0 = f47_arg0:getFirstDescendentById( "smokeGrenadeIcon" )
		f47_local0:setupUIBindImage( "FlashMaterial" )
		f47_arg0.tacticalWidget.text:setupUIIntWatch( "TacticalCount" )
		f47_arg0.tacticalWidget.text:registerEventHandler( "int_watch_alert", f0_local50 )
	else
		f0_local13( f47_arg0.primaryWidget, "slide_single_widget", 0 )
		f0_local13( f47_arg0.leftTickMarks, "slide_single_widget", 0 )
		f47_arg0.tacticalWidget:close()
		f47_arg0.tacticalWidget = nil
	end
	f47_arg0.hasLethal = Game.GetPlayerFragWeapon() ~= "none"
	if f47_arg0.hasLethal == true then
		local f47_local0 = f47_arg0:getFirstDescendentById( "fragGrenadeIcon" )
		f47_local0:setupUIBindImage( "FragMaterial" )
		f47_arg0.lethalWidget.text:setupUIIntWatch( "LethalCount" )
		f47_arg0.lethalWidget.text:registerEventHandler( "int_watch_alert", f0_local50 )
	else
		if f47_arg0.hasTactical == true then
			f0_local13( f47_arg0.primaryWidget, "slide_single_widget", 0 )
			f0_local13( f47_arg0.tacticalWidget, "slide_single_widget", 0 )
			f0_local13( f47_arg0.leftTickMarks, "slide_single_widget", 0 )
		end
		f47_arg0.lethalWidget:close()
		f47_arg0.lethalWidget = nil
	end
	f0_local46( f47_arg0, {
		"TacticalCount",
		"LethalCount",
		"ClipAmmoRight",
		"ClipAmmoLeft",
		"ClipAmmoMax",
		"StockAmmo",
		"PlayerWeaponClass",
		"PlayerSwitchingWeapon"
	}, f0_local38 )
	f47_arg0.onRefresh = f0_local45
	f0_local46( f47_arg0, {
		"PlayerActionSlotActive"
	}, actionSlotWatcher )
	f0_local36( f47_arg0 )
	f0_local26( f47_arg0, 0 )
	f0_local32( f47_arg0, 0, true )
	hideActionSlot( f47_arg0, 0, true )
	hideAmmoStatus( f47_arg0, 0, true )
	WeaponNameToLabel.colt45 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel45ACP" )
	WeaponNameToLabel.colt45_zak_killer = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel45ACP" )
	WeaponNameToLabel.beretta = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.beretta_muzzle_nodynlight = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.usp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel45ACP" )
	WeaponNameToLabel.usp_silencer = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel45ACP" )
	WeaponNameToLabel.deserteagle = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel50AE" )
	WeaponNameToLabel.deserteagle_cgoship = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel50AE" )
	WeaponNameToLabel.mp5 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.mp5_muzzle_small = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.mp5_silencer = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.skorpion = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel32ACP" )
	WeaponNameToLabel.uzi = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.uzi_sd = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel9x19Luger" )
	WeaponNameToLabel.ak74u = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel545x39" )
	WeaponNameToLabel.p90 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel57x28" )
	WeaponNameToLabel.p90_silencer = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel57x28" )
	WeaponNameToLabel.m4_grunt = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m4_grunt_muzzle_small = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m4_silencer = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m4_grenadier = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m4m203_silencer_reflex = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m16_basic = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m16_grenadier = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.ak47 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x39R" )
	WeaponNameToLabel.ak47_muzzle_nodynlight = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x39R" )
	WeaponNameToLabel.ak47_grenadier = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x39R" )
	WeaponNameToLabel.g36c = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.g3 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x39NATO" )
	WeaponNameToLabel.rpd = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x39" )
	WeaponNameToLabel.rpd_muzzle_small = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x39" )
	WeaponNameToLabel.rpd_muzzle_nodynlight = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x39" )
	WeaponNameToLabel.saw = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt556x45" )
	WeaponNameToLabel.saw_muzzle_small = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt556x45" )
	WeaponNameToLabel.saw_mg_setup = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt556x45" )
	WeaponNameToLabel.remington700 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_scoped = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_scoped_silencer = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_scoped_woodland = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m60e4 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51" )
	WeaponNameToLabel.m60e4_muzzle_nodynlight = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51" )
	WeaponNameToLabel.m14_scoped_silencer_woodland = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.dragunov = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x54R" )
	WeaponNameToLabel.m1014 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel12g" )
	WeaponNameToLabel.winchester1200 = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel12g" )
	WeaponNameToLabel.rpg = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelPG7G" )
	WeaponNameToLabel.rpg_jeepride = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelPG7G" )
	WeaponNameToLabel.rpg_player = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelPG7G" )
	WeaponNameToLabel.stinger = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelStinger" )
	WeaponNameToLabel.stinger_speedy = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelStinger" )
	WeaponNameToLabel.javelin = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelJavelin" )
	WeaponNameToLabel.javelin_objective = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelJavelin" )
	WeaponNameToLabel.smoke_grenade_american = f47_arg0:getFirstDescendentById( "smokeGrenadeIconLabelSMK" )
	WeaponNameToLabel.flash_grenade = f47_arg0:getFirstDescendentById( "smokeGrenadeIconLabelFLA" )
	WeaponNameToLabel.barrett = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m40a3_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m40a3_acog_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.barret_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel50BMG" )
	WeaponNameToLabel.barret_acog_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel50BMG" )
	WeaponNameToLabel.m60e4_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51" )
	WeaponNameToLabel.m60e4_grip_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51" )
	WeaponNameToLabel.m60e4_acog_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51" )
	WeaponNameToLabel.m60e4_reflex_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabelBelt762x51" )
	WeaponNameToLabel.m14_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_gl_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_acog_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_reflex_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.m14_silencer_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x51NATO" )
	WeaponNameToLabel.mp44_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel762x33" )
	WeaponNameToLabel.m4_acog_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	WeaponNameToLabel.m4_reflex_mp = f47_arg0:getFirstDescendentById( "primaryWeaponAmmoContainerLabel556x45NATO" )
	local f47_local1 = f47_arg0:getFirstDescendentById( "actionSlotId" )
	f47_local1:processEvent( {
		name = "init"
	} )
	f47_arg0:onRefresh( {
		timeElapsed = 0
	} )
end

local f0_local52 = function ( f48_arg0, f48_arg1 )
	f48_arg0:onRefresh( f48_arg1 )
end

local f0_local53 = function ()
	return {
		type = "UIElement",
		id = "smokeGrenadeContainer",
		states = {
			default = {
				bottomAnchor = true,
				rightAnchor = true,
				right = -CoD.HudStandards.boxSpacing
			},
			slide_single_widget = {
				right = -21.33
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "smokeGrenadeIconBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_box_blur" ),
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "smokeGrenadeIconOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 85.32,
						height = 85.32
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIElement",
				id = "smokeGrenadeIconLabelSMK",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					},
					on = {
						alpha = 1
					},
					off = {
						alpha = 0
					}
				},
				children = {
					{
						type = "UIImage",
						id = "smokeGrenadeIconLabelSMKImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = 0
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_smk" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_smk_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "smokeGrenadeIconLabelFLA",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					},
					on = {
						alpha = 1
					},
					off = {
						alpha = 0
					}
				},
				children = {
					{
						type = "UIImage",
						id = "smokeGrenadeIconLabelFLAImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = 1
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_fla" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_fla_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "smokeGrenadeIcon",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = nil,
						bottom = CoD.HudStandards.icoYpos,
						right = CoD.HudStandards.icoXpos,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			},
			{
				type = "UIText",
				id = "smokeGrenadeAmmoText",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -3.33,
						right = -4.67,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					},
					on = {
						alpha = 1,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					low = f0_local11
				},
				properties = {
					text = "smokeGrenadeAmmoText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local54 = function ()
	return {
		type = "UIElement",
		id = "fragGrenadeContainer",
		states = {
			default = {
				bottomAnchor = true,
				rightAnchor = true,
				alpha = 1
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "fragGrenadeIconBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_box_blur" ),
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "fragGrenadeIconOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 85.32,
						height = 85.32
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIImage",
				id = "fragGrenadeIconLabel",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = CoD.HudStandards.labelsYpos,
						right = CoD.HudStandards.labelsXpos,
						width = 21.33,
						height = 5.33
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_labels_frg" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_labels_frg_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIImage",
				id = "fragGrenadeIcon",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = nil,
						bottom = CoD.HudStandards.icoYpos,
						right = CoD.HudStandards.icoXpos,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			},
			{
				type = "UIText",
				id = "fragGrenadeAmmoText",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -3.33,
						right = -4.67,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					},
					on = {
						alpha = 1,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					low = f0_local11
				},
				properties = {
					text = "fragGrenadeAmmoText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local55 = function ()
	local f51_local0 = "h1_hud_weapwidget_nullnum"
	local f51_local1 = "h1_hud_weapwidget_nullnum_nightvision"
	local f51_local2 = -23.66
	local f51_local3 = -43.33
	if Engine.GetCurrentLanguage() == 5 or Engine.GetCurrentLanguage() == 6 then
		f51_local0 = "h1_hud_weapwidget_nullnum_nimbus"
		f51_local1 = "h1_hud_weapwidget_nullnum_nightvision_nimbus"
		f51_local2 = -20.66
		f51_local3 = -38.66
	end
	local f51_local4 = {
		type = "UIElement",
		id = "primaryWeaponAmmoContainer",
		states = {
			default = {
				bottomAnchor = true,
				rightAnchor = true,
				right = -(CoD.HudStandards.boxSpacing * 2)
			},
			slide_single_widget = {
				right = -70.66
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "primaryWeaponAmmoContainerBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_weapwidget_blur" ),
						width = 341.3,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "primaryWeaponAmmoContainerOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 341.3,
						height = 85.32
					},
					on = {
						material = RegisterMaterial( "h1_hud_weapwidget_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_weapwidget_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIText",
				id = "primaryWeaponAmmoText",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -8,
						right = -4.33,
						width = 128,
						height = CoD.TextSettings.SP_HudAmmoCounterFont.Height,
						font = CoD.TextSettings.SP_HudAmmoCounterFont.Font,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					on = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					off = {
						alpha = 0
					},
					low = f0_local11
				},
				properties = {
					text = "primaryWeaponAmmoText",
					textStyle = CoD.TextStyle.Shadowed
				}
			},
			{
				type = "UIElement",
				id = "primaryWeaponAmmoTextEmpty0",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -13,
						right = f51_local2,
						width = 21.33,
						height = 42.66,
						alpha = 1
					},
					on = {
						alpha = 1
					},
					off = {
						alpha = 0
					}
				},
				children = {
					{
						type = "UIImage",
						id = "primaryWeaponAmmoTextEmpty0Image",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								width = 21.33,
								height = 42.66
							},
							on = {
								material = RegisterMaterial( f51_local0 ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha * 0.65
							},
							nvg_on = {
								material = RegisterMaterial( f51_local1 ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG * 0.5
							}
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "primaryWeaponAmmoTextEmpty1",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -13,
						right = f51_local3,
						width = 21.33,
						height = 42.66,
						alpha = 1
					},
					on = {
						alpha = 1
					},
					off = {
						alpha = 0
					}
				},
				children = {
					{
						type = "UIImage",
						id = "primaryWeaponAmmoTextEmpty1Image",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								width = 21.33,
								height = 42.66
							},
							on = {
								material = RegisterMaterial( f51_local0 ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha * 0.65
							},
							nvg_on = {
								material = RegisterMaterial( f51_local1 ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG * 0.5
							}
						}
					}
				}
			},
			{
				type = "UIText",
				id = "primaryWeaponText",
				states = {
					default = {
						alignment = LUI.Alignment.Right,
						bottom = -26,
						right = -66.66,
						rightAnchor = true,
						width = 256,
						height = CoD.TextSettings.SP_HudWeaponNameFont.Height,
						font = CoD.TextSettings.SP_HudWeaponNameFont.Font,
						alpha = 1
					},
					on = {
						alpha = 1
					},
					left = {
						alignment = LUI.Alignment.Right,
						bottom = -26,
						right = -68.66,
						rightAnchor = true,
						width = 256,
						height = CoD.TextSettings.SP_HudWeaponNameFont.Height,
						font = CoD.TextSettings.SP_HudWeaponNameFont.Font
					},
					right = {
						alignment = LUI.Alignment.Right,
						bottom = -26,
						right = -6,
						rightAnchor = true,
						width = 256,
						height = CoD.TextSettings.SP_HudWeaponNameFont.Height,
						font = CoD.TextSettings.SP_HudWeaponNameFont.Font,
						alpha = 1
					},
					off = {
						alpha = 0
					}
				},
				properties = {
					text = "primaryWeaponText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
	local f51_local5 = {
		{
			id = "primaryWeaponAmmoContainerLabel12g",
			material = "h1_hud_weapwidget_firearms_labels_12g",
			material_nvg = "h1_hud_weapwidget_firearms_labels_12g_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel9x19Luger",
			material = "h1_hud_weapwidget_firearms_labels_9x19l",
			material_nvg = "h1_hud_weapwidget_firearms_labels_9x19l_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel45ACP",
			material = "h1_hud_weapwidget_firearms_labels_45acp",
			material_nvg = "h1_hud_weapwidget_firearms_labels_45acp_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabelJavelin",
			material = "h1_hud_weapwidget_firearms_labels_javelin",
			material_nvg = "h1_hud_weapwidget_firearms_labels_javelin_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabelStinger",
			material = "h1_hud_weapwidget_firearms_labels_stinger",
			material_nvg = "h1_hud_weapwidget_firearms_labels_stinger_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabelPG7G",
			material = "h1_hud_weapwidget_firearms_labels_pg7g",
			material_nvg = "h1_hud_weapwidget_firearms_labels_pg7g_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabelBelt556x45",
			material = "h1_hud_weapwidget_firearms_labels_b556x45",
			material_nvg = "h1_hud_weapwidget_firearms_labels_b556x45_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabelBelt762x51",
			material = "h1_hud_weapwidget_firearms_labels_b762x51",
			material_nvg = "h1_hud_weapwidget_firearms_labels_b762x51_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabelBelt762x39",
			material = "h1_hud_weapwidget_firearms_labels_b762x39",
			material_nvg = "h1_hud_weapwidget_firearms_labels_b762x39_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel762x54R",
			material = "h1_hud_weapwidget_firearms_labels_762x54r",
			material_nvg = "h1_hud_weapwidget_firearms_labels_762x54r_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel762x39R",
			material = "h1_hud_weapwidget_firearms_labels_762x39r",
			material_nvg = "h1_hud_weapwidget_firearms_labels_762x39r_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel762x33",
			material = "h1_hud_weapwidget_firearms_labels_762x33",
			material_nvg = "h1_hud_weapwidget_firearms_labels_762x33_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel762x39NATO",
			material = "h1_hud_weapwidget_firearms_labels_762x39n",
			material_nvg = "h1_hud_weapwidget_firearms_labels_762x39n_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel762x51NATO",
			material = "h1_hud_weapwidget_firearms_labels_762x51n",
			material_nvg = "h1_hud_weapwidget_firearms_labels_762x51n_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel556x45NATO",
			material = "h1_hud_weapwidget_firearms_labels_556x45n",
			material_nvg = "h1_hud_weapwidget_firearms_labels_556x45n_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel57x28",
			material = "h1_hud_weapwidget_firearms_labels_57x28",
			material_nvg = "h1_hud_weapwidget_firearms_labels_57x28_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel545x39",
			material = "h1_hud_weapwidget_firearms_labels_545x39",
			material_nvg = "h1_hud_weapwidget_firearms_labels_545x39_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel50BMG",
			material = "h1_hud_weapwidget_firearms_labels_50bmg",
			material_nvg = "h1_hud_weapwidget_firearms_labels_50bmg_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel50AE",
			material = "h1_hud_weapwidget_firearms_labels_50ae",
			material_nvg = "h1_hud_weapwidget_firearms_labels_50ae_nightvision"
		},
		{
			id = "primaryWeaponAmmoContainerLabel32ACP",
			material = "h1_hud_weapwidget_firearms_labels_32acp",
			material_nvg = "h1_hud_weapwidget_firearms_labels_32acp_nightvision"
		}
	}
	for f51_local6 = 1, #f51_local5, 1 do
		table.insert( f51_local4.children, {
			id = f51_local5[f51_local6].id,
			type = "UIElement",
			states = {
				default = {
					bottomAnchor = true,
					rightAnchor = true,
					alpha = 0
				},
				on = {
					alpha = 1
				},
				off = {
					alpha = 0
				}
			},
			children = {
				{
					id = f51_local5[f51_local6].id .. "Image",
					type = "UIImage",
					states = {
						default = {
							bottomAnchor = true,
							rightAnchor = true,
							width = f0_local10,
							height = f0_local9,
							bottom = CoD.HudStandards.labelsYpos
						},
						on = {
							material = RegisterMaterial( f51_local5[f51_local6].material ),
							color = CoD.HudStandards.overlayTint,
							alpha = CoD.HudStandards.overlayAlpha
						},
						nvg_on = {
							material = RegisterMaterial( f51_local5[f51_local6].material_nvg ),
							color = CoD.HudStandards.nvgOverlayTint,
							alpha = CoD.HudStandards.overlayAlphaNVG
						}
					}
				}
			}
		} )
	end
	return f51_local4
end

local f0_local56 = function ()
	return {
		type = "UIElement",
		id = "weaponInfoPanel",
		states = {
			default = {
				bottomAnchor = true,
				rightAnchor = true,
				bottom = -CoD.HudStandards.borderY,
				right = -CoD.HudStandards.borderX
			}
		},
		children = {
			f0_local54(),
			f0_local53(),
			f0_local55(),
			{
				type = "UIElement",
				id = "leftTickMarks",
				states = {
					default = {
						rightAnchor = true,
						bottomAnchor = true,
						right = -282.64,
						bottom = CoD.HudStandards.ticksYpos
					},
					on = {
						alpha = 1
					},
					off = {
						alpha = 0
					},
					slide_single_widget = {
						rightAnchor = true,
						bottomAnchor = true,
						right = -239.98,
						bottom = CoD.HudStandards.ticksYpos
					},
					slide_no_primary = {
						rightAnchor = true,
						bottomAnchor = true,
						right = -90.66,
						bottom = CoD.HudStandards.ticksYpos
					},
					slide_full = {
						rightAnchor = true,
						bottomAnchor = true,
						right = -282.64,
						bottom = CoD.HudStandards.ticksYpos
					}
				},
				children = {
					{
						type = "UIImage",
						id = "leftTickMarksImage",
						states = {
							default = {
								rightAnchor = true,
								bottomAnchor = true,
								width = 10.67,
								height = 85.32
							},
							on = {
								material = RegisterMaterial( "h1_hud_crosshairs" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_crosshairs_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "rightTickMarks",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = CoD.HudStandards.ticksYpos,
						right = 7
					},
					on = {
						alpha = 1
					},
					off = {
						alpha = 0
					}
				},
				children = {
					{
						type = "UIImage",
						id = "rightTickMarksImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								width = 10.67,
								height = 85.32
							},
							on = {
								material = RegisterMaterial( "h1_hud_crosshairs" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_crosshairs_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			}
		}
	}
end

local f0_local57 = function ()
	return {
		type = "UIElement",
		id = "ammoStatusContainer",
		states = {
			default = {
				bottomAnchor = true,
				bottom = -575
			}
		},
		children = {
			{
				type = "UIImage",
				id = "ammoStatusBacker",
				states = {
					default = {
						width = 142.21,
						height = 71.1,
						material = RegisterMaterial( "h1_hud_ammo_status_bg" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5
					},
					on = {
						alpha = 0.5
					},
					reload = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5
					},
					out = {
						alpha = 0.75,
						red = 1,
						green = 0.14,
						blue = 0.18
					},
					low = {
						alpha = 0.5,
						color = Colors.hud_low_ammo_yellow
					},
					off = {
						alpha = 0
					}
				}
			},
			{
				type = "UIText",
				id = "ammoStatusText",
				states = {
					default = {
						alignment = LUI.Alignment.Center,
						width = 256,
						bottom = 9.5,
						height = CoD.TextSettings.SP_HudAmmoStatusText.Height,
						font = CoD.TextSettings.SP_HudAmmoStatusText.Font,
						alpha = 1
					},
					on = {
						alpha = 1
					},
					reload = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					out = {
						alpha = 1,
						red = 1,
						green = 0.14,
						blue = 0.18
					},
					low = {
						alpha = 1,
						color = Colors.hud_low_ammo_yellow
					},
					off = {
						alpha = 0
					}
				},
				properties = {
					text = "ammoStatusText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			},
			{
				type = "UIImage",
				id = "ammoStatusGlow",
				states = {
					default = {
						width = 142.21,
						height = 71.1,
						material = RegisterMaterial( "h1_hud_ammo_status_glow" ),
						alpha = 0
					},
					reload = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.4
					},
					out = {
						red = 1,
						green = 0.14,
						blue = 0.18,
						alpha = 0.4
					},
					low = {
						alpha = 0.4,
						color = Colors.hud_low_ammo_yellow
					},
					off = {
						alpha = 0
					}
				}
			},
			{
				type = "UIImage",
				id = "ammoStatusScanlines",
				states = {
					default = {
						width = 284.42,
						height = 71.1,
						material = RegisterMaterial( "h1_hud_ammo_status_scanlines" ),
						alpha = 0
					},
					reload = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					out = {
						red = 1,
						green = 0.14,
						blue = 0.18,
						alpha = 1
					},
					low = {
						alpha = 1,
						color = Colors.hud_low_ammo_yellow
					},
					off = {
						alpha = 0
					}
				}
			}
		}
	}
end

local f0_local58 = function ()
	return {
		type = "UIElement",
		id = "actionSlotContainer",
		states = {
			default = {
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = true,
				top = 0,
				left = -50,
				width = 128,
				height = 20,
				alpha = 1
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		handlers = {
			isGamepadEnabled = f0_local47
		},
		children = {
			{
				type = "UIIntWatch",
				properties = {
					dataSource = "IsGamepadEnabled"
				},
				handlers = {
					int_watch_alert = MBh.EmitEventToParent( "isGamepadEnabled", {
						saveOriginal = true
					} )
				}
			},
			{
				type = "actionSlotDef"
			}
		}
	}
end

local f0_local59 = function ()
	return {
		type = "UIElement",
		id = "hudStanceContainer",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				bottomAnchor = true
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "hudStanceIndicatorDef"
			}
		}
	}
end

LUI.MenuBuilder.registerDef( "WeaponInfoHudDef", function ()
	return {
		type = "UIElement",
		id = "weaponInfoHud",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				bottomAnchor = true
			},
			hud_on = {
				alpha = 1
			},
			hud_off = {
				alpha = 0
			}
		},
		handlers = {
			weapon_info_refresh = f0_local52,
			init = f0_local51
		},
		properties = {},
		children = {
			{
				type = "UITimer",
				id = "weaponInfoRefreshTimer",
				properties = {
					event = "weapon_info_refresh",
					group = "hud",
					interval = 10
				}
			},
			f0_local59(),
			f0_local56(),
			f0_local58(),
			f0_local57(),
			{
				type = "CompassHudDef"
			}
		}
	}
end )
LockTable( _M )
