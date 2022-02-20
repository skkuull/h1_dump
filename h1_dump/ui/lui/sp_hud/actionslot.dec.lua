local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = {
	red = Swatches.HUD.Warning.r,
	green = Swatches.HUD.Warning.g,
	blue = Swatches.HUD.Warning.b,
	alpha = 1
}
f0_local1 = {}
f0_local2 = {}
local f0_local3 = function ( f1_arg0 )
	return Game.GetPlayerWeaponName()
end

local f0_local4 = function ( f2_arg0 )
	return f2_arg0
end

local f0_local5 = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0._state ~= f3_arg1 then
		f3_arg0._state = f3_arg1
		f3_arg0:animateToState( f3_arg1, f3_arg2 )
	end
end

local f0_local6 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f0_local2[f4_arg1]
	local f4_local1 = Game.GetPlayerActionSlotMaterial( f4_local0 )
	local f4_local2 = Game.GetPlayerActionSlotActive( f4_local0 )
	local f4_local3 = f4_arg0.icons[f4_arg1]
	local f4_local4 = f4_arg0.ammos[f4_arg1]
	local f4_local5 = f4_arg0.selectedIcons[f4_arg1]
	local f4_local6 = f4_arg0.keyBindings[f4_arg1]
	if f4_local1 ~= nil then
		if f4_local3.material ~= f4_local1 then
			f4_local3:registerAnimationState( "on", {
				material = f4_local1,
				alpha = 1
			} )
			f4_local3.material = f4_local1
			f4_local3:animateToState( "on", 0 )
		else
			f0_local5( f4_local3, "on", 0 )
		end
		if f4_local6 ~= nil then
			if f4_local2 then
				f0_local5( f4_local6, "selected", 0 )
			else
				f0_local5( f4_local6, "on", 0 )
			end
		end
		local f4_local7 = f4_local3.labels[f4_local3.labelKey( f4_local1 )]
		if f4_local7 ~= f4_local3.label then
			if f4_local3.label ~= nil then
				f0_local5( f4_local3.label, "off", 0 )
			end
			f4_local3.label = f4_local7
		end
		if f4_local3.label ~= nil then
			f0_local5( f4_local3.label, "on", 0 )
		end
		if f4_local4 ~= nil then
			local f4_local8 = Game.GetPlayerActionSlotAmmo( f4_local0 )
			if f0_local1[f4_local1] ~= false then
				f4_local4:setText( f4_local8 )
				if f4_local8 == 0 then
					f0_local5( f4_local4, "low", 0 )
				else
					f0_local5( f4_local4, "on", 0 )
				end
			else
				f0_local5( f4_local4, "off", 0 )
			end
		end
	else
		f0_local5( f4_local3, "off", 0 )
		if f4_local6 ~= nil then
			f0_local5( f4_local6, "off", 0 )
		end
		if f4_local4 ~= nil then
			f0_local5( f4_local4, "off", 0 )
		end
		if f4_local3.label ~= nil then
			f0_local5( f4_local3.label, "off", 0 )
		end
	end
	if f4_local5 ~= nil then
		if f4_local2 then
			f0_local5( f4_local5, "on", 0 )
		else
			f0_local5( f4_local5, "off", 0 )
		end
	end
end

local f0_local7 = function ( f5_arg0 )
	f0_local1[RegisterMaterial( "hud_icon_nvg" )] = false
	f0_local2[3] = 3
	f0_local2[1] = 2
	f0_local2[2] = 0
	f0_local2[4] = 1
	f5_arg0.icons = {}
	f5_arg0.ammos = {}
	for f5_local0 = 1, 4, 1 do
		f5_arg0.ammos[f5_local0] = f5_arg0:getFirstDescendentById( "equip" .. f5_local0 .. "ContainerAmmoText" )
		if f5_arg0.ammos[f5_local0] ~= nil then
			f5_arg0.ammos[f5_local0]:registerAnimationState( "on", {
				red = 1,
				green = 1,
				blue = 1,
				alpha = 1
			} )
			f5_arg0.ammos[f5_local0]:registerAnimationState( "off", {
				alpha = 0
			} )
			f5_arg0.ammos[f5_local0]:registerAnimationState( "low", f0_local0 )
			f0_local5( f5_arg0.ammos[f5_local0], "off", 0 )
		end
	end
	f5_arg0.icons = {}
	f5_arg0.selectedIcons = {}
	f5_arg0.keyBindings = {}
	for f5_local0 = 1, 4, 1 do
		f5_arg0.icons[f5_local0] = f5_arg0:getFirstDescendentById( "equip" .. f5_local0 .. "ContainerIcon" )
		f5_arg0.selectedIcons[f5_local0] = f5_arg0:getFirstDescendentById( "equip" .. f5_local0 .. "Selected" )
		f5_arg0.keyBindings[f5_local0] = f5_arg0:getFirstDescendentById( "equip" .. f5_local0 .. "ContainerKeyBindingText" )
	end
	local f5_local0 = nil
	f5_arg0.icons[1].labels = {}
	f5_arg0.icons[1].labels.m4_grenadier = f5_arg0:getFirstDescendentById( "equip1LabelM203" )
	f5_arg0.icons[1].labels.m4m203_silencer_reflex = f5_arg0:getFirstDescendentById( "equip1LabelM203" )
	f5_arg0.icons[1].labels.m16_grenadier = f5_arg0:getFirstDescendentById( "equip1LabelM203" )
	f5_arg0.icons[1].labels.ak47_grenadier = f5_arg0:getFirstDescendentById( "equip1LabelGP25" )
	f5_arg0.icons[1].labelKey = f0_local3
	f5_local0 = RegisterMaterial( "hud_icon_nvg" )
	f5_arg0.icons[2].labels = {}
	f5_arg0.icons[2].labels[f5_local0] = f5_arg0:getFirstDescendentById( "equip2LabelNVG" )
	f5_arg0.icons[2].labelKey = f0_local4
	f5_local0 = RegisterMaterial( "hud_icon_cobra" )
	f5_arg0.icons[3].labels = {}
	f5_arg0.icons[3].labels[f5_local0] = f5_arg0:getFirstDescendentById( "equip3LabelHELI" )
	f5_arg0.icons[3].labels[RegisterMaterial( "hud_icon_claymore" )] = f5_arg0:getFirstDescendentById( "equip3LabelCLM" )
	f5_arg0.icons[3].labelKey = f0_local4
	f5_local0 = RegisterMaterial( "compass_objpoint_airstrike" )
	f5_arg0.icons[4].labels = {}
	f5_arg0.icons[4].labels[f5_local0] = f5_arg0:getFirstDescendentById( "equip4LabelAIR" )
	f5_arg0.icons[4].labels[RegisterMaterial( "hud_icon_c4" )] = f5_arg0:getFirstDescendentById( "equip4LabelC4" )
	f5_arg0.icons[4].labelKey = f0_local4
	for f5_local1 = 1, #f5_arg0.icons, 1 do
		f5_arg0.icons[f5_local1]:registerAnimationState( "on", {
			alpha = 1
		} )
		f5_arg0.icons[f5_local1]:registerAnimationState( "off", {
			alpha = 0
		} )
		f0_local5( f5_arg0.icons[f5_local1], "off", 0 )
		for f5_local7, f5_local8 in pairs( f5_arg0.icons[f5_local1].labels ) do
			f5_local8:registerAnimationState( "on", {
				alpha = 1
			} )
			f5_local8:registerAnimationState( "off", {
				alpha = 0
			} )
			f0_local5( f5_local8, "off", 0 )
		end
	end
end

local f0_local8 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = nil
	if f6_arg1.value then
		f6_local0 = "nvg_on"
	else
		f6_local0 = "on"
	end
	for f6_local1 = 1, #f6_arg0.keyboard.nvgElements, 1 do
		f0_local5( f6_arg0.keyboard.nvgElements[f6_local1], f6_local0, 0 )
	end
	for f6_local1 = 1, #f6_arg0.dpad.nvgElements, 1 do
		f0_local5( f6_arg0.dpad.nvgElements[f6_local1], f6_local0, 0 )
	end
end

local f0_local9 = function ( f7_arg0 )
	local f7_local0 = {}
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip1LabelM203Image" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip1LabelGP25Image" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip2LabelNVGImage" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip3LabelHELIImage" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip3LabelCLMImage" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip4LabelC4Image" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip4LabelAIRImage" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equipExtraOverlay" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip1ContainerOverlay" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip2ContainerOverlay" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip3ContainerOverlay" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "equip4ContainerOverlay" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "leftTickMarksImage" ) )
	table.insert( f7_local0, f7_arg0:getFirstDescendentById( "rightTickMarksImage" ) )
	local f7_local1 = {}
	for f7_local2 = 1, #f7_local0, 1 do
		if f7_local0[f7_local2] ~= nil then
			table.insert( f7_local1, f7_local0[f7_local2] )
		end
	end
	return f7_local1
end

local f0_local10 = function ( f8_arg0 )
	f8_arg0.keyboard = f8_arg0:getFirstDescendentById( "actionSlotKeyboardId" )
	f8_arg0.dpad = f8_arg0:getFirstDescendentById( "actionSlotDpadId" )
	f0_local7( f8_arg0.keyboard )
	f0_local7( f8_arg0.dpad )
	f8_arg0:registerOmnvarHandler( "ui_nightvision", f0_local8 )
	f8_arg0.keyboard.nvgElements = f0_local9( f8_arg0.keyboard )
	f8_arg0.dpad.nvgElements = f0_local9( f8_arg0.dpad )
	f0_local8( f8_arg0, {
		name = "ui_nightvision",
		value = Game.GetOmnvar( "ui_nightvision" )
	} )
end

local f0_local11 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = nil
	if f9_arg0.useKeyboard then
		f9_local0 = f9_arg0.keyboard
	elseif f9_arg0.useDpad then
		f9_local0 = f9_arg0.dpad
	end
	if f9_local0 ~= nil then
		for f9_local1 = 1, 4, 1 do
			f0_local6( f9_local0, f9_local1 )
		end
	end
end

LUI.MenuBuilder.registerDef( "actionSlotDef", function ()
	return {
		type = "UIElement",
		id = "actionSlotId",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = CoD.HudStandards.equipOffsetY,
				left = CoD.HudStandards.equipOffsetX
			},
			hud_on = {
				alpha = 1
			},
			hud_off = {
				alpha = 0
			}
		},
		handlers = {
			weapon_info_refresh = f0_local11,
			init = f0_local10
		},
		children = {
			{
				type = "actionSlotKeyboardDef"
			},
			{
				type = "actionSlotDpadDef"
			}
		}
	}
end )
LockTable( _M )
