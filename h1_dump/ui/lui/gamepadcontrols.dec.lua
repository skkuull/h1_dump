local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.GamepadControls = {}
f0_local0 = "viewSensitivityPitch"
f0_local1 = "viewSensitivityYaw"
function GamepadDisabledFunc( f1_arg0, f1_arg1 )
	return not Engine.GetProfileData( "gpadEnabled" )
end

function ButtonsLayoutAction( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestAddMenu( f2_arg0, "buttons", true, f2_arg1.controller, false )
end

function SticksLayoutAction( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "thumbstick", true, f3_arg1.controller, false )
end

function GetSensitivityText( f4_arg0 )
	local f4_local0 = Engine.GetProfileData( f4_arg0 )
	if f4_local0 < 3 then
		return Engine.Localize( "@MENU_LOW" ) .. " " .. f4_local0
	elseif f4_local0 < 7 then
		return Engine.Localize( "@MENU_MEDIUM" ) .. " " .. f4_local0
	elseif f4_local0 < 13 then
		return Engine.Localize( "@MENU_HIGH" ) .. " " .. f4_local0
	elseif f4_local0 < 20 then
		return Engine.Localize( "@MENU_VERY_HIGH" ) .. " " .. f4_local0
	elseif f4_local0 >= 20 then
		return Engine.Localize( "@MENU_INSANE" ) .. " " .. f4_local0
	else
		return f4_local0 .. ""
	end
end

function GetSensitivityPitchText()
	return GetSensitivityText( f0_local0 )
end

function GetSensitivityYawText()
	return GetSensitivityText( f0_local1 )
end

function SensitivityChange( f7_arg0, f7_arg1, f7_arg2 )
	Engine.SetProfileData( f7_arg2, math.min( 20, math.max( 1, Engine.GetProfileData( f7_arg2, f7_arg0 ) + f7_arg1 ) ), f7_arg0 )
end

function RefreshMouseCursor( f8_arg0 )
	local f8_local0 = Engine.GetLuiRoot()
	LUI.FlowManager.tryAddMouseCursor( f8_local0 )
	local f8_local1 = f8_local0:getChildById( "mouse_cursor" )
	if f8_local1 then
		if f8_arg0 then
			f8_local1:hide()
		else
			f8_local1:show()
		end
	end
	Engine.Exec( "updategamerprofile" )
end

function OptionsMainClose( f9_arg0, f9_arg1 )
	Engine.Exec( "updategamerprofile" )
end

f0_local2 = "gpadButtonsConfig"
function RefreshLayoutDisplay( f10_arg0, f10_arg1 )
	if f10_arg0.controller and f10_arg0.controller.sticksOverlay then
		f10_arg0.controller:dispatchEventToChildren( {
			name = "hide_texts"
		} )
		f10_arg0.controller:dispatchEventToChildren( {
			name = "show_" .. Engine.GetProfileData( f0_local2 )
		} )
		LUI.OptionsLayout.ResetSticksLayout( f10_arg0.controller.sticksOverlay, f10_arg1 )
	end
end

function isFlipped()
	return string.find( Engine.GetProfileData( f0_local2 ), "_alt" )
end

function CreateOptions( f12_arg0 )
	LUI.Options.CreateControlProfileDataButton( f12_arg0, "gpadEnabled", "profile_toggleEnableGamepad", nil, "LUA_MENU_GAMEPAD", "LUA_MENU_GAMEPAD_TOGGLE_DESC", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	}, nil, nil, function ( f13_arg0, f13_arg1, f13_arg2 )
		RefreshMouseCursor( f13_arg2 )
		f12_arg0.optionMenuTabElement:Refresh()
		if f13_arg2 then
			LUI.OptionsLayout.BuildMenu( f12_arg0.rightPanel, f13_arg1.controller )
			RefreshLayoutDisplay( f12_arg0.rightPanel, f13_arg1.controller )
		else
			if f12_arg0.rightPanel.controller ~= nil then
				f12_arg0.rightPanel:removeElement( f12_arg0.rightPanel.controller )
			end
			f13_arg0:dispatchEventToRoot( {
				name = "check_switch_to_azerty"
			} )
		end
	end )
	local f12_local0 = LUI.Options.CreateControlProfileDataButton( f12_arg0, "gpadSticksConfig", nil, "profile_setSticksConfig", "PLATFORM_UI_THUMBSTICK_LAYOUT", "PLATFORM_UI_OPTIONS_STICK_LAYOUT_DESC", {
		{
			text = "MENU_DEFAULT",
			value = "thumbstick_default"
		},
		{
			text = "MENU_SOUTHPAW",
			value = "thumbstick_southpaw"
		},
		{
			text = "MENU_LEGACY",
			value = "thumbstick_legacy"
		},
		{
			text = "MENU_LEGACY_SOUTHPAW",
			value = "thumbstick_legacysouthpaw"
		}
	}, GamepadDisabledFunc, nil, function ( f14_arg0, f14_arg1 )
		f12_arg0.rightPanel:dispatchEventToChildren( {
			name = "swap_sticks_buttons"
		} )
		RefreshLayoutDisplay( f12_arg0.rightPanel, f14_arg1.controller )
		f12_arg0.rightPanel.controller.sticksOverlay:dispatchEventToChildren( {
			name = "highlight",
			dispatchChildren = true
		} )
		f12_arg0.rightPanel.controller.buttonsOverlay:dispatchEventToChildren( {
			name = "highlight_for_sticks",
			dispatchChildren = true
		} )
	end )
	f12_local0.properties.button_over_func = function ( f15_arg0, f15_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.sticksOverlay then
			f12_arg0.rightPanel.controller.sticksOverlay:dispatchEventToChildren( {
				name = "highlight",
				dispatchChildren = true
			} )
			f12_arg0.rightPanel.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "highlight_for_sticks",
				dispatchChildren = true
			} )
		end
	end
	
	f12_local0.properties.button_up_func = function ( f16_arg0, f16_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.sticksOverlay then
			f12_arg0.rightPanel.controller.sticksOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	local f12_local1 = LUI.Options.CreateGamepadLayoutProfileButton( f12_arg0, f0_local2, nil, "profile_setButtonsConfig", "MENU_BUTTON_LAYOUT", "PLATFORM_UI_OPTIONS_BUTTON_LAYOUT_DESC", {
		{
			text = "MENU_DEFAULT",
			value = "buttons_default"
		},
		{
			text = "MENU_TACTICAL",
			value = "buttons_tactical"
		},
		{
			text = "MENU_LEFTY_LEGACY",
			value = "buttons_lefty"
		},
		{
			text = "MENU_LEFTY",
			value = "buttons_lefty_regular"
		},
		{
			text = "MENU_NOMAD",
			value = "buttons_nomad"
		},
		{
			text = "MENU_CHARLIE",
			value = "buttons_charlie"
		},
		{
			text = "MENU_ONE-HAND_GUNSLINGER",
			value = "buttons_one-hand_gunslinger"
		},
		{
			text = "MENU_BUMPER_JUMPER",
			value = "buttons_bumper_jumper"
		},
		{
			text = "MENU_BUMPER_JUMPER_TACT",
			value = "buttons_bumper_jumper_tact"
		},
		{
			text = "MENU_STICK_AND_MOVE",
			value = "buttons_stick_and_move"
		}
	}, GamepadDisabledFunc, function ( f17_arg0, f17_arg1 )
		local f17_local0 = ""
		if isFlipped() then
			f17_local0 = "_alt"
		end
		Engine.ExecNow( "profile_setButtonsConfig " .. f17_arg1.value .. f17_local0 )
		if not Engine.IsConsoleGame() then
			Engine.ExecNow( "profile_menuDvarsFinish" )
		end
		LUI.Options.OptionsWindowTriggerRefresh( f17_arg0, f17_arg1 )
		RefreshLayoutDisplay( f12_arg0.rightPanel, f17_arg1.controller )
	end )
	f12_local1.properties.button_over_func = function ( f18_arg0, f18_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.buttonsOverlay then
			f12_arg0.rightPanel.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "highlight",
				dispatchChildren = true
			} )
			f12_arg0.rightPanel.controller.unscaledButtonsOverlay:dispatchEventToChildren( {
				name = "highlight",
				dispatchChildren = true
			} )
		end
	end
	
	f12_local1.properties.button_up_func = function ( f19_arg0, f19_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.buttonsOverlay then
			f12_arg0.rightPanel.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
			f12_arg0.rightPanel.controller.unscaledButtonsOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	local f12_local2 = nil
	local f12_local3 = function ( f20_arg0, f20_arg1 )
		local f20_local0 = string.gsub( Engine.GetProfileData( f0_local2 ), "_alt", "" )
		local f20_local1 = "_alt"
		if isFlipped() then
			f20_local1 = ""
		end
		Engine.ExecNow( "profile_setButtonsConfig " .. f20_local0 .. f20_local1 )
		f12_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
		RefreshLayoutDisplay( f12_arg0.rightPanel, f20_arg1.controller )
	end
	
	local f12_local4 = f12_arg0:AddButton( Engine.Localize( "@MENU_BUTTON_LAYOUT_ALT" ), nil, GamepadDisabledFunc, nil, nil, {
		variant = GenericButtonSettings.Variants.Select,
		desc_text = Engine.Localize( "@MENU_OPTIONS_BUTTON_LAYOUT_ALT_DESC" ),
		H1OptionButton = true,
		button_display_func = function ( f21_arg0, f21_arg1 )
			if isFlipped() then
				return Engine.Localize( "@LUA_MENU_ENABLED" )
			else
				return Engine.Localize( "@LUA_MENU_DISABLED" )
			end
		end,
		button_left_func = f12_local3,
		button_right_func = f12_local3,
		buttonActionIsRightAction = true,
		showLockOnDisable = true
	} )
	f12_local4.properties.button_over_func = function ( f22_arg0, f22_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.buttonsOverlay then
			f12_arg0.rightPanel.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "flipped_button_highlight",
				dispatchChildren = true
			} )
		end
	end
	
	f12_local4.properties.button_up_func = function ( f23_arg0, f23_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.buttonsOverlay then
			f12_arg0.rightPanel.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	local f12_local5 = LUI.Options.CreateControlProfileDataButton( f12_arg0, "invertedPitch", "profile_toggleInvertedPitch", nil, "MENU_LOOK_INVERSION", "PLATFORM_UI_OPTIONS_LOOK_INVERSION_DESC", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	}, GamepadDisabledFunc, nil, function ( f24_arg0, f24_arg1 )
		RefreshLayoutDisplay( f12_arg0.rightPanel, f24_arg1.controller )
		f12_arg0.rightPanel.controller.sticksOverlay:dispatchEventToChildren( {
			name = "look_inversion_highlight",
			dispatchChildren = true
		} )
	end )
	f12_local5.properties.button_over_func = function ( f25_arg0, f25_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.sticksOverlay then
			f12_arg0.rightPanel.controller.sticksOverlay:dispatchEventToChildren( {
				name = "look_inversion_highlight",
				dispatchChildren = true
			} )
		end
	end
	
	f12_local5.properties.button_up_func = function ( f26_arg0, f26_arg1 )
		if f12_arg0.rightPanel.controller and f12_arg0.rightPanel.controller.sticksOverlay then
			f12_arg0.rightPanel.controller.sticksOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	f12_arg0:AddButton( nil, nil, GamepadDisabledFunc, nil, nil, {
		variant = GenericButtonSettings.Variants.Select,
		button_text = Engine.Localize( "MENU_VERTICAL_LOOK_SENSITIVITY" ),
		desc_text = Engine.Localize( "PLATFORM_OPTIONS_VERTICAL_SENSITIVITY_DESC" ),
		H1OptionButton = true,
		button_display_func = GetSensitivityPitchText,
		button_left_func = function ( f27_arg0, f27_arg1 )
			return SensitivityChange( f12_arg0.exclusiveController, -1, f0_local0 )
		end,
		button_right_func = function ( f28_arg0, f28_arg1 )
			return SensitivityChange( f12_arg0.exclusiveController, 1, f0_local0 )
		end,
		buttonActionIsRightAction = true,
		muteAction = true,
		showLockOnDisable = true,
		valueActionAudio = true
	} )
	f12_arg0:AddButton( nil, nil, GamepadDisabledFunc, nil, nil, {
		variant = GenericButtonSettings.Variants.Select,
		button_text = Engine.Localize( "MENU_HORIZONTAL_LOOK_SENSITIVITY" ),
		desc_text = Engine.Localize( "PLATFORM_OPTIONS_HORIZONTAL_SENSITIVITY_DESC" ),
		H1OptionButton = true,
		button_display_func = GetSensitivityYawText,
		button_left_func = function ( f29_arg0, f29_arg1 )
			return SensitivityChange( f12_arg0.exclusiveController, -1, f0_local1 )
		end,
		button_right_func = function ( f30_arg0, f30_arg1 )
			return SensitivityChange( f12_arg0.exclusiveController, 1, f0_local1 )
		end,
		buttonActionIsRightAction = true,
		muteAction = true,
		showLockOnDisable = true,
		valueActionAudio = true
	} )
	LUI.Options.CreateControlProfileDataButton( f12_arg0, "rumble", "profile_toggleRumble", nil, "MENU_CONTROLLER_VIBRATION", "PLATFORM_OPTIONS_VIBRATION_DESC", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	}, GamepadDisabledFunc )
	if not Engine.IsMultiplayer() then
		LUI.Options.CreateControlProfileDataButton( f12_arg0, "autoAim", "profile_toggleAutoAim", nil, "MENU_AIM_ASSIST", "PLATFORM_UI_OPTIONS_AIM_ASSIST_DESC", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, GamepadDisabledFunc, nil, function ( f31_arg0, f31_arg1 )
			Engine.ToggleAimAssistSlowdown( f31_arg1.controller )
		end )
	end
	LUI.Options.CreateControlProfileDataButton( f12_arg0, "autoWeaponSwitch", "profile_toggleAutoWeaponSwitch", nil, "LUA_MENU_AUTO_WEAPON_SWITCH", "LUA_MENU_AUTO_WEAPON_SWITCH_DESC", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	}, GamepadDisabledFunc )
	if Engine.IsMultiplayer() then
		LUI.Options.CreateControlProfileDataButton( f12_arg0, "aimAssistLockon", "profile_toggleAimAssistLockon", nil, "LUA_MENU_AIM_ASSIST_LOCKON", "LUA_MENU_AIM_ASSIST_LOCKON_DESC", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, GamepadDisabledFunc )
		LUI.Options.CreateControlProfileDataButton( f12_arg0, "aimAssistSlowdown", "profile_toggleAimAssistSlowdown", nil, "LUA_MENU_AIM_ASSIST_SLOWDOWN", "LUA_MENU_AIM_ASSIST_SLOWDOWN_DESC", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, GamepadDisabledFunc )
	end
	if Engine.IsDevelopmentBuild() then
		LUI.Options.CreateControlProfileDataButton( f12_arg0, "useDevKeyboard", "profile_toggleDevKeyboard", nil, "DEBUG_KEYBOARD", "DEBUG_KEYBOARD_DESC", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, GamepadDisabledFunc, true )
	end
	LUI.Options.InitScrollingList( f12_arg0.list, nil )
end

function RefreshFunc( f32_arg0 )
	return function ( f33_arg0, f33_arg1 )
		f32_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
		RefreshLayoutDisplay( f32_arg0.rightPanel, f32_arg0.exclusiveController )
	end
	
end

LUI.GamepadControls.new = function ( f34_arg0, f34_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f34_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f34_local1 = LUI.MenuTemplate.new( f34_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CONTROL_OPTIONS" ) ),
		menu_top_indent = f34_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = 0 ~= LUI.PCControlOptions.FindTypeIndex( LUI.PreviousMenuName )
	} )
	f34_local1.optionMenuTabElement = f34_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f35_arg0 )
			return LUI.PCControlOptions.Categories[f35_arg0].title
		end,
		tabCount = #LUI.PCControlOptions.Categories,
		underTabTextFunc = function ( f36_arg0 )
			return LUI.PCControlOptions.Categories[f36_arg0].title
		end,
		top = f34_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.PCControlOptions.LoadMenu,
		activeIndex = LUI.PCControlOptions.FindTypeIndex( "gamepad_controls" ),
		isTabLockedfunc = LUI.PCControlOptions.IsCategoryDisabled,
		skipChangeTab = true,
		exclusiveController = f34_local1.exclusiveController
	} ) )
	f34_local1:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f34_local1:registerEventHandler( "menu_close", OptionsMainClose )
	f34_local1:registerEventHandler( "popup_inactive", RefreshFunc( f34_local1 ) )
	f34_local1:registerEventHandler( "toggle_enable_gamepad", function ( element, event )
		LUI.FlowManager.RequestAddMenu( nil, "gamepad_controls", true, event.controller, true, nil, {
			reload = true
		} )
	end )
	if Engine.IsPC() then
		f34_local1:registerEventHandler( "popup_inactive", function ( element, event )
			LUI.FlowManager.RequestAddMenu( nil, "gamepad_controls", true, Engine.GetControllerForLocalClient( 0 ), true, nil, {
				reload = true
			} )
		end )
	end
	f34_local1.rightPanel = LUI.Options.AddRightPanel( f34_local1 )
	if not GamepadDisabledFunc() then
		LUI.OptionsLayout.BuildMenu( f34_local1.rightPanel, f34_arg1.exclusiveController )
	end
	local f34_local2 = function ( f39_arg0, f39_arg1 )
		f39_arg0.properties.button_over_func = function ( f40_arg0, f40_arg1 )
			if f39_arg1 then
				f39_arg1:dispatchEventToChildren( {
					name = "highlight",
					dispatchChildren = true
				} )
			end
		end
		
		f39_arg0.properties.button_up_func = function ( f41_arg0, f41_arg1 )
			if f39_arg1 then
				f39_arg1:dispatchEventToChildren( {
					name = "restore",
					dispatchChildren = true
				} )
			end
		end
		
	end
	
	RefreshLayoutDisplay( f34_local1.rightPanel, f34_local1.exclusiveController )
	CreateOptions( f34_local1 )
	LUI.Options.AddOptionTextInfo( f34_local1 )
	LUI.PCControlOptions.AddResetToDefaultButton( f34_local1 )
	f34_local1:AddBackButton()
	return f34_local1
end

LUI.MenuBuilder.registerType( "gamepad_controls", LUI.GamepadControls.new )
LockTable( _M )
