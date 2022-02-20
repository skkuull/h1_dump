local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ConsoleControls = {}
function LookInversionToggle( f1_arg0 )
	Engine.ToggleInvertedPitch( f1_arg0 )
end

function GetLookInversionText( f2_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "invertedPitch", f2_arg0 )
end

function VibrationToggle( f3_arg0 )
	Engine.ToggleRumble( f3_arg0 )
end

function GetVibrationText( f4_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "rumble", f4_arg0 )
end

function GetSensitivityText( f5_arg0 )
	if f5_arg0 < 3 then
		return Engine.Localize( "@MENU_LOW" ) .. " " .. f5_arg0
	elseif f5_arg0 < 7 then
		return Engine.Localize( "@MENU_MEDIUM" ) .. " " .. f5_arg0
	elseif f5_arg0 < 13 then
		return Engine.Localize( "@MENU_HIGH" ) .. " " .. f5_arg0
	elseif f5_arg0 < 20 then
		return Engine.Localize( "@MENU_VERY_HIGH" ) .. " " .. f5_arg0
	elseif f5_arg0 == 20 then
		return Engine.Localize( "@MENU_INSANE" ) .. " " .. f5_arg0
	else
		return f5_arg0 .. ""
	end
end

function GetSensitivityPitchText( f6_arg0 )
	return GetSensitivityText( Engine.GetProfileData( "viewSensitivityPitch", f6_arg0 ) )
end

function GetSensitivityYawText( f7_arg0 )
	return GetSensitivityText( Engine.GetProfileData( "viewSensitivityYaw", f7_arg0 ) )
end

function SensitivityPitchLess( f8_arg0 )
	LUI.Options.ProfileDataMenuOption( f8_arg0, 1, 20, -1, "viewSensitivityPitch" )
end

function SensitivityPitchMore( f9_arg0 )
	LUI.Options.ProfileDataMenuOption( f9_arg0, 1, 20, 1, "viewSensitivityPitch" )
end

function SensitivityYawLess( f10_arg0 )
	LUI.Options.ProfileDataMenuOption( f10_arg0, 1, 20, -1, "viewSensitivityYaw" )
end

function SensitivityYawMore( f11_arg0 )
	LUI.Options.ProfileDataMenuOption( f11_arg0, 1, 20, 1, "viewSensitivityYaw" )
end

function AutoWeaponSwitchToggle( f12_arg0 )
	Engine.ToggleAutoWeaponSwitch( f12_arg0 )
end

function GetAutoWeaponSwitchText( f13_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "autoWeaponSwitch", f13_arg0 )
end

function AimAssistLockonToggle( f14_arg0 )
	Engine.ToggleAimAssistLockon( f14_arg0 )
end

function GetAimAssistLockonText( f15_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "aimAssistLockon", f15_arg0 )
end

function AimAssistSlowdownToggle( f16_arg0 )
	Engine.ToggleAimAssistSlowdown( f16_arg0 )
end

function GetAimAssistSlowdownText( f17_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "aimAssistSlowdown", f17_arg0 )
end

function AimAssistToggle( f18_arg0 )
	AimAssistSlowdownToggle( f18_arg0 )
	Engine.ToggleAutoAim( f18_arg0 )
end

function GetAimAssistText( f19_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "autoAim", f19_arg0 )
end

f0_local0 = "gpadButtonsConfig"
function isFlipped( f20_arg0 )
	return string.find( Engine.GetProfileData( f0_local0, f20_arg0 ), "_alt" )
end

function resetToDefaultAction( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg1.controller
	if not f21_local0 then
		f21_local0 = Engine.GetFirstActiveController()
	end
	Engine.ExecNow( "profile_setSticksConfig thumbstick_default" )
	Engine.ExecNow( "profile_setButtonsConfig buttons_default" )
	Engine.ExecNow( "profile_toggleInvertedPitch 0", f21_local0 )
	Engine.ExecNow( "profile_toggleAutoWeaponSwitch 1", f21_local0 )
	Engine.ExecNow( "profile_toggleAimAssistLockon 1", f21_local0 )
	Engine.ExecNow( "profile_toggleAimAssistSlowdown 1", f21_local0 )
	Engine.ExecNow( "profile_toggleAutoAim 1", f21_local0 )
	Engine.ExecNow( "profile_toggleRumble 1", f21_local0 )
	Engine.MenuDvarsFinish( f21_local0 )
	Engine.SetProfileData( "viewSensitivityPitch", 3, f21_local0 )
	Engine.SetProfileData( "viewSensitivityYaw", 3, f21_local0 )
	Engine.Exec( "updategamerprofile" )
	f21_arg0:dispatchEventToRoot( {
		name = "options_window_refresh",
		source_input = "button_action"
	} )
	f21_arg0:dispatchEventToRoot( {
		name = "refresh_layout_display"
	} )
end

function reset_controls( f22_arg0, f22_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_SET_DEFAULT_CONTROLS" ),
		message_text = Engine.Localize( "@LUA_MENU_RESTORE_EACH_SETTING_CONSOLE" ),
		yes_action = resetToDefaultAction,
		no_action = function ( f23_arg0, f23_arg1 )
			DebugPrint( "Running generic_confirmation_popup no action" )
		end
		,
		yes_text = Engine.Localize( "@LUA_MENU_YES" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function resetToDefault( f24_arg0, f24_arg1 )
	LUI.FlowManager.RequestAddMenu( f24_arg0, "reset_controls", false, f24_arg1.controller )
end

function addResetToDefaultButton( f25_arg0 )
	f25_arg0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_RESTORE_DEFAULT_CONTROLS" ),
		side = "right",
		clickable = true
	}, resetToDefault )
end

LUI.ConsoleControls.new = function ( f26_arg0, f26_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f26_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f26_local1 = 0 ~= LUI.ConsoleOptions.FindTypeIndex( LUI.PreviousMenuName )
	local f26_local2 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f26_local2 = -15
	end
	local f26_local3 = LUI.MenuTemplate.new( f26_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_OPTIONS_UPPER_CASE" ) ),
		menu_top_indent = f26_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing + f26_local2,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = f26_local1
	} )
	f26_local3:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	local f26_local4 = LUI.Options.AddRightPanel( f26_local3 )
	LUI.OptionsLayout.BuildMenu( f26_local4, f26_arg1.exclusiveController )
	local f26_local5 = function ()
		if f26_local4.controller and f26_local4.controller.sticksOverlay and f26_local4.controller.buttonsOverlay then
			f26_local4.controller:dispatchEventToChildren( {
				name = "hide_texts"
			} )
			f26_local4.controller:dispatchEventToChildren( {
				name = "show_" .. Engine.GetProfileData( f0_local0 )
			} )
			LUI.OptionsLayout.ResetSticksLayout( f26_local4.controller.sticksOverlay, f26_local3.exclusiveController )
		end
	end
	
	f26_local3:registerEventHandler( "refresh_layout_display", f26_local5 )
	f26_local5()
	f26_local3:addElement( LUI.H1MenuTab.new( {
		title = function ( f28_arg0 )
			return LUI.ConsoleOptions.Categories[f28_arg0].title
		end,
		tabCount = #LUI.ConsoleOptions.Categories,
		underTabTextFunc = function ( f29_arg0 )
			return LUI.ConsoleOptions.Categories[f29_arg0].title
		end,
		top = f26_local0 + LUI.MenuTemplate.ListTop + f26_local2,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.ConsoleOptions.LoadMenu,
		activeIndex = LUI.ConsoleOptions.FindTypeIndex( "console_controls" ),
		isTabLockedfunc = LUI.ConsoleOptions.IsOptionLocked,
		skipChangeTab = true,
		exclusiveController = f26_local3.exclusiveController
	} ) )
	local f26_local6 = LUI.Options.CreateControlProfileDataButton( f26_local3, "gpadSticksConfig", nil, "profile_setSticksConfig", "PLATFORM_UI_THUMBSTICK_LAYOUT", "PLATFORM_OPTIONS_STICK_LAYOUT_DESC", {
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
	}, nil, nil, function ( f30_arg0, f30_arg1, f30_arg2 )
		f26_local4:dispatchEventToChildren( {
			name = "swap_sticks_buttons"
		} )
		f26_local5()
		f26_local4.controller.sticksOverlay:dispatchEventToChildren( {
			name = "highlight",
			dispatchChildren = true
		} )
		f26_local4.controller.buttonsOverlay:dispatchEventToChildren( {
			name = "highlight_for_sticks",
			dispatchChildren = true
		} )
	end )
	f26_local6.properties.button_over_func = function ( f31_arg0, f31_arg1 )
		if f26_local4.controller and f26_local4.controller.sticksOverlay then
			f26_local4.controller.sticksOverlay:dispatchEventToChildren( {
				name = "highlight",
				dispatchChildren = true
			} )
			f26_local4.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "highlight_for_sticks",
				dispatchChildren = true
			} )
		end
	end
	
	f26_local6.properties.button_up_func = function ( f32_arg0, f32_arg1 )
		if f26_local4.controller and f26_local4.controller.sticksOverlay then
			f26_local4.controller.sticksOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	local f26_local7 = LUI.Options.CreateGamepadLayoutProfileButton( f26_local3, f0_local0, nil, "profile_setButtonsConfig", "MENU_BUTTON_LAYOUT", "PLATFORM_OPTIONS_BUTTON_LAYOUT_DESC", {
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
	}, nil, function ( f33_arg0, f33_arg1 )
		local f33_local0 = ""
		if isFlipped( f26_local3.exclusiveController ) then
			f33_local0 = "_alt"
		end
		Engine.ExecNow( "profile_setButtonsConfig " .. f33_arg1.value .. f33_local0 )
		if not Engine.IsConsoleGame() then
			Engine.ExecNow( "profile_menuDvarsFinish" )
		end
		LUI.Options.OptionsWindowTriggerRefresh( f33_arg0, f33_arg1 )
		f26_local5()
	end )
	f26_local7.properties.button_over_func = function ( f34_arg0, f34_arg1 )
		if f26_local4.controller and f26_local4.controller.buttonsOverlay then
			f26_local4.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "highlight",
				dispatchChildren = true
			} )
			f26_local4.controller.unscaledButtonsOverlay:dispatchEventToChildren( {
				name = "highlight",
				dispatchChildren = true
			} )
		end
	end
	
	f26_local7.properties.button_up_func = function ( f35_arg0, f35_arg1 )
		if f26_local4.controller and f26_local4.controller.buttonsOverlay then
			f26_local4.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
			f26_local4.controller.unscaledButtonsOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	local f26_local8 = nil
	local f26_local9 = function ( f36_arg0, f36_arg1 )
		local f36_local0 = string.gsub( Engine.GetProfileData( f0_local0 ), "_alt", "" )
		local f36_local1 = "_alt"
		if isFlipped( f26_local3.exclusiveController ) then
			f36_local1 = ""
		end
		Engine.ExecNow( "profile_setButtonsConfig " .. f36_local0 .. f36_local1 )
		f26_local3.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
		f26_local5( f26_local3.rightPanel )
	end
	
	local f26_local10 = f26_local3:AddButton( Engine.Localize( "@MENU_BUTTON_LAYOUT_ALT" ), nil, GamepadDisabledFunc, nil, nil, {
		variant = GenericButtonSettings.Variants.Select,
		desc_text = Engine.Localize( "@MENU_OPTIONS_BUTTON_LAYOUT_ALT_DESC" ),
		H1OptionButton = true,
		button_display_func = function ( f37_arg0, f37_arg1 )
			if isFlipped( f26_local3.exclusiveController ) then
				return Engine.Localize( "@LUA_MENU_ENABLED" )
			else
				return Engine.Localize( "@LUA_MENU_DISABLED" )
			end
		end,
		button_left_func = f26_local9,
		button_right_func = f26_local9,
		buttonActionIsRightAction = true
	} )
	f26_local10.properties.button_over_func = function ( f38_arg0, f38_arg1 )
		if f26_local4.controller and f26_local4.controller.buttonsOverlay then
			f26_local4.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "flipped_button_highlight",
				dispatchChildren = true
			} )
		end
	end
	
	f26_local10.properties.button_up_func = function ( f39_arg0, f39_arg1 )
		if f26_local4.controller and f26_local4.controller.buttonsOverlay then
			f26_local4.controller.buttonsOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	local f26_local11 = LUI.Options.CreateControlProfileDataButton( f26_local3, "invertedPitch", "profile_toggleInvertedPitch", nil, "MENU_LOOK_INVERSION", "PLATFORM_OPTIONS_LOOK_INVERSION_DESC", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	}, GamepadDisabledFunc, nil, function ( f40_arg0, f40_arg1 )
		f26_local5( f26_local3.rightPanel )
		f26_local4.controller.sticksOverlay:dispatchEventToChildren( {
			name = "look_inversion_highlight",
			dispatchChildren = true
		} )
	end )
	f26_local11.properties.button_over_func = function ( f41_arg0, f41_arg1 )
		if f26_local4.controller and f26_local4.controller.sticksOverlay then
			f26_local4.controller.sticksOverlay:dispatchEventToChildren( {
				name = "look_inversion_highlight",
				dispatchChildren = true
			} )
		end
	end
	
	f26_local11.properties.button_up_func = function ( f42_arg0, f42_arg1 )
		if f26_local4.controller and f26_local4.controller.sticksOverlay then
			f26_local4.controller.sticksOverlay:dispatchEventToChildren( {
				name = "restore",
				dispatchChildren = true
			} )
		end
	end
	
	LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@MENU_VERTICAL_LOOK_SENSITIVITY", "@PLATFORM_OPTIONS_VERTICAL_SENSITIVITY_DESC", GetSensitivityPitchText, SensitivityPitchLess, SensitivityPitchMore, nil, nil, nil, nil, true )
	LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@MENU_HORIZONTAL_LOOK_SENSITIVITY", "@PLATFORM_OPTIONS_HORIZONTAL_SENSITIVITY_DESC", GetSensitivityYawText, SensitivityYawLess, SensitivityYawMore, nil, nil, nil, nil, true )
	LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_AUTO_WEAPON_SWITCH", "@LUA_MENU_AUTO_WEAPON_SWITCH_DESC", GetAutoWeaponSwitchText, AutoWeaponSwitchToggle, AutoWeaponSwitchToggle )
	if Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_AIM_ASSIST_LOCKON", "@LUA_MENU_AIM_ASSIST_LOCKON_DESC", GetAimAssistLockonText, AimAssistLockonToggle, AimAssistLockonToggle )
		LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_AIM_ASSIST_SLOWDOWN", "@LUA_MENU_AIM_ASSIST_SLOWDOWN_DESC", GetAimAssistSlowdownText, AimAssistSlowdownToggle, AimAssistSlowdownToggle )
	else
		LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@MENU_AIM_ASSIST", "@PLATFORM_OPTIONS_AIM_ASSIST_DESC", GetAimAssistText, AimAssistToggle, AimAssistToggle )
	end
	LUI.Options.AddButtonOptionVariant( f26_local3, GenericButtonSettings.Variants.Select, "@MENU_CONTROLLER_VIBRATION", "@PLATFORM_OPTIONS_VIBRATION_DESC", GetVibrationText, VibrationToggle, VibrationToggle )
	LUI.Options.InitScrollingList( f26_local3.list, nil )
	LUI.Options.AddOptionTextInfo( f26_local3 )
	f26_local3:AddBackButton( function ( f43_arg0, f43_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f43_arg0 )
	end )
	f26_local3.alwaysSendMenuClose = true
	f26_local3:registerEventHandler( "menu_close", function ( element, event )
		Engine.ExecNow( "profile_menuDvarsFinish", f26_local3.exclusiveController )
		Engine.Exec( "updategamerprofile", f26_local3.exclusiveController )
		if GameX.IsSplitscreen() then
			GameX.SetOptionState( false )
		end
	end )
	addResetToDefaultButton( f26_local3 )
	return f26_local3
end

if Engine.InFrontend() and Engine.IsMultiplayer() then
	VLobby.InitMenuMode( "console_controls", VirtualLobbyModes.LUI_MODE_OBSCURED )
end
LUI.MenuBuilder.registerType( "console_controls", LUI.ConsoleControls.new )
LUI.MenuBuilder.registerPopupType( "reset_controls", reset_controls )
LockTable( _M )
