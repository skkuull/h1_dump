local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.Options = {}
LUI.Options.GetToggleTextForProfileData = function ( f1_arg0, f1_arg1 )
	return Engine.GetProfileData( f1_arg0, f1_arg1 ) and Engine.Localize( "@LUA_MENU_ENABLED" ) or Engine.Localize( "@LUA_MENU_DISABLED" )
end

LUI.Options.ProfileMenuOption = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	Engine.SetDvarFloat( f2_arg4, math.min( f2_arg2, math.max( f2_arg1, Engine.GetDvarFloat( f2_arg4 ) + f2_arg3 ) ) )
	Engine.MenuDvarsFinish( f2_arg0 )
end

LUI.Options.ProfileDataMenuOption = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	Engine.SetProfileData( f3_arg4, math.min( f3_arg2, math.max( f3_arg1, Engine.GetProfileData( f3_arg4, f3_arg0 ) + f3_arg3 ) ), f3_arg0 )
end

LUI.Options.GetSticksLayoutName = function ( f4_arg0 )
	local f4_local0 = Engine.GetProfileData( "gpadSticksConfig", f4_arg0 )
	if f4_local0 == "thumbstick_default" then
		return Engine.Localize( "@MENU_DEFAULT" )
	elseif f4_local0 == "thumbstick_southpaw" then
		return Engine.Localize( "@MENU_SOUTHPAW" )
	elseif f4_local0 == "thumbstick_legacy" then
		return Engine.Localize( "@MENU_LEGACY" )
	else
		return Engine.Localize( "@MENU_LEGACY_SOUTHPAW" )
	end
end

LUI.Options.GetButtonsLayoutName = function ( f5_arg0 )
	local f5_local0 = Engine.GetProfileData( "gpadButtonsConfig", f5_arg0 )
	if f5_local0 == "buttons_default" then
		return Engine.Localize( "@MENU_DEFAULT" )
	elseif f5_local0 == "buttons_tactical" then
		return Engine.Localize( "@MENU_TACTICAL" )
	elseif f5_local0 == "buttons_lefty" then
		return Engine.Localize( "@MENU_LEFTY_LEGACY" )
	elseif f5_local0 == "buttons_lefty_regular" then
		return Engine.Localize( "@MENU_LEFTY" )
	elseif f5_local0 == "buttons_nomad" then
		return Engine.Localize( "@MENU_NOMAD" )
	elseif f5_local0 == "buttons_nomad_tactical" then
		return Engine.Localize( "@MENU_NOMAD_TACTICAL" )
	elseif f5_local0 == "buttons_charlie" then
		return Engine.Localize( "@MENU_CHARLIE" )
	elseif f5_local0 == "buttons_one-hand_gunslinger" then
		return Engine.Localize( "@MENU_ONE-HAND_GUNSLINGER" )
	elseif f5_local0 == "buttons_bumper_jumper" then
		return Engine.Localize( "@MENU_BUMPER_JUMPER" )
	elseif f5_local0 == "buttons_bumper_jumper_tact" then
		return Engine.Localize( "@MENU_BUMPER_JUMPER_TACT" )
	elseif f5_local0 == "buttons_stick_and_move" then
		return Engine.Localize( "@MENU_STICK_AND_MOVE" )
	elseif f5_local0 == "buttons_default_alt" then
		return Engine.Localize( "@MENU_DEFAULT_ALT" )
	elseif f5_local0 == "buttons_tactical_alt" then
		return Engine.Localize( "@MENU_TACTICAL_ALT" )
	elseif f5_local0 == "buttons_lefty_alt" then
		return Engine.Localize( "@MENU_LEFTY_LEGACY_ALT" )
	elseif f5_local0 == "buttons_lefty_regular_alt" then
		return Engine.Localize( "@MENU_LEFTY_ALT" )
	elseif f5_local0 == "buttons_nomad_alt" then
		return Engine.Localize( "@MENU_NOMAD_ALT" )
	elseif f5_local0 == "buttons_nomad_tactical_alt" then
		return Engine.Localize( "@MENU_NOMAD_TACTICAL_ALT" )
	elseif f5_local0 == "buttons_charlie_alt" then
		return Engine.Localize( "@MENU_CHARLIE_ALT" )
	elseif f5_local0 == "buttons_one-hand_gunslinger_alt" then
		return Engine.Localize( "@MENU_ONE-HAND_GUNSLINGER_ALT" )
	elseif f5_local0 == "buttons_bumper_jumper_alt" then
		return Engine.Localize( "@MENU_BUMPER_JUMPER_ALT" )
	elseif f5_local0 == "buttons_bumper_jumper_tact_alt" then
		return Engine.Localize( "@MENU_BUMPER_JUMPER_TACT_ALT" )
	elseif f5_local0 == "buttons_stick_and_move_alt" then
		return Engine.Localize( "@MENU_STICK_AND_MOVE_ALT" )
	else
		return Engine.Localize( "@MENU_DEFAULT" )
	end
end

LUI.Options.StringOptionListFromList = function ( f6_arg0 )
	local f6_local0 = {}
	for f6_local4, f6_local5 in pairs( f6_arg0 ) do
		f6_local0[f6_local4] = {
			text = f6_local5,
			value = f6_local5
		}
	end
	return f6_local0
end

LUI.Options.GetDvarEnableTextFunc = function ( f7_arg0, f7_arg1 )
	return function ( f8_arg0 )
		local f8_local0 = Engine.GetDvarBool( f7_arg0 )
		if f7_arg1 then
			f8_local0 = not f8_local0
		end
		if f8_local0 then
			return Engine.Localize( "@LUA_MENU_ENABLED" )
		else
			return Engine.Localize( "@LUA_MENU_DISABLED" )
		end
	end
	
end

LUI.Options.ToggleDvarFunc = function ( f9_arg0 )
	return function ( f10_arg0 )
		if Engine.GetDvarBool( f9_arg0 ) then
			Engine.SetDvarBool( f9_arg0, false )
		else
			Engine.SetDvarBool( f9_arg0, true )
		end
	end
	
end

LUI.Options.ToggleProfiledataFunc = function ( f11_arg0, f11_arg1 )
	return function ()
		if Engine.GetProfileData( f11_arg0, f11_arg1 ) then
			Engine.SetProfileData( f11_arg0, 0, f11_arg1 )
		else
			Engine.SetProfileData( f11_arg0, 1, f11_arg1 )
		end
	end
	
end

LUI.Options.RefreshVideoSetting = function ()
	Engine.Exec( "vid_sync" )
	LUI.PCOptions.TransferSettingsToGame()
	Engine.Exec( "vid_reconfig" )
end

LUI.Options.RenderColorBlindToggle = function ( f14_arg0 )
	if Engine.ToggleRenderColorBlind then
		Engine.ToggleRenderColorBlind( f14_arg0 )
	end
end

LUI.Options.GetRenderColorBlindText = function ( f15_arg0 )
	if Engine.ToggleRenderColorBlind then
		return LUI.Options.GetToggleTextForProfileData( "renderColorBlind", f15_arg0 )
	else
		return Engine.Localize( "@LUA_MENU_DISABLED" )
	end
end

LUI.Options.GetBrightness = function ()
	return 1 - (Engine.GetDvarFloat( "profileMenuOption_blacklevel" ) - SliderBounds.Brightness.Min) / (SliderBounds.Brightness.Max - SliderBounds.Brightness.Min)
end

LUI.Options.BrightnessLess = function ( f17_arg0, f17_arg1 )
	LUI.Options.ProfileMenuOption( f17_arg0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max, -SliderBounds.Brightness.Step, "profileMenuOption_blacklevel" )
	f17_arg1:dispatchEventToRoot( {
		name = "brightness_updated"
	} )
end

LUI.Options.BrightnessMore = function ( f18_arg0, f18_arg1 )
	LUI.Options.ProfileMenuOption( f18_arg0, SliderBounds.Brightness.Min, SliderBounds.Brightness.Max, SliderBounds.Brightness.Step, "profileMenuOption_blacklevel" )
	f18_arg1:dispatchEventToRoot( {
		name = "brightness_updated"
	} )
end

LUI.Options.ShowBrightnessGuide = function ( f19_arg0 )
	f19_arg0:dispatchEventToRoot( {
		name = "brightness_over_children"
	} )
	f19_arg0:animateToState( "visible" )
end

LUI.Options.HideBrightnessGuide = function ( f20_arg0 )
	f20_arg0:animateToState( "default" )
end

f0_local0 = {
	band_height = 90,
	left = 710,
	top = LUI.MenuTemplate.ListTop + (Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset),
	width = 360
}
function CreateBrightnessImage( f21_arg0, f21_arg1, f21_arg2 )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = f0_local0.band_height,
		material = RegisterMaterial( "white" ),
		red = f21_arg2,
		green = f21_arg2,
		blue = f21_arg2
	} )
	self.id = f21_arg0
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -CoD.TextSettings.TitleFontMedium.Height / 2,
		bottom = CoD.TextSettings.TitleFontMedium.Height / 2,
		font = CoD.TextSettings.TitleFontMedium.Font,
		red = 0,
		green = 0,
		blue = 0,
		alignment = LUI.Alignment.Center
	} )
	self:setText( Engine.Localize( f21_arg1 ) )
	self:registerEventHandler( "brightness_over_children", UpdateBrightnessGuide )
	self:registerEventHandler( "brightness_updated", UpdateBrightnessGuide )
	self:addElement( self )
	return self
end

LUI.Options.CreateBrightnessGuide = function ()
	local f22_local0 = CoD.CreateState( f0_local0.left, f0_local0.top, f0_local0.left + f0_local0.width, f0_local0.top + 3 * f0_local0.band_height, CoD.AnchorTypes.TopLeft )
	f22_local0.alpha = 0
	local self = LUI.UIElement.new( f22_local0 )
	self.id = "brightness_guide_id"
	local f22_local2 = {
		alpha = 1
	}
	self:registerAnimationState( "default", f22_local0 )
	self:registerAnimationState( "visible", f22_local2 )
	local self = self
	local f22_local4 = self.registerEventHandler
	local f22_local5 = "brightness_over"
	local self = MBh.DoMultiple
	local f22_local7 = {}
	local f22_local8 = MBh.AnimateToState( "visible", 0 )
	local f22_local9 = MBh.EmitEvent( {
		name = "brightness_over_children"
	} )
	f22_local4( self, f22_local5, self( f22_local8 ) )
	self:registerEventHandler( "brightness_up", MBh.AnimateToState( "default", 0 ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_border", {
		thickness = 2,
		border_red = Colors.generic_menu_frame_color.r,
		border_green = Colors.generic_menu_frame_color.g,
		border_blue = Colors.generic_menu_frame_color.b
	} ) )
	self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	} )
	self:addElement( self )
	self:addElement( CreateBrightnessImage( BrightnessGuideConstants.not_visible.item_id, "@MENU_BRIGHTNESS_NOT_VISIBLE", BrightnessGuideConstants.not_visible.color_default ) )
	self:addElement( CreateBrightnessImage( BrightnessGuideConstants.barely_visible.item_id, "@MENU_BRIGHTNESS_BARELY_VISIBLE", BrightnessGuideConstants.barely_visible.color_default ) )
	self:addElement( CreateBrightnessImage( BrightnessGuideConstants.easily_visible.item_id, "@MENU_BRIGHTNESS_EASILY_VISIBLE", BrightnessGuideConstants.easily_visible.color_default ) )
	self:addElement( LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = 15
	} ) )
	self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = CoD.TextSettings.BodyFont.Height,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center,
		red = Colors.primary_text_color.r,
		green = Colors.primary_text_color.g,
		blue = Colors.primary_text_color.b
	} )
	self:setText( Engine.Localize( "@MENU_BRIGHTNESS_DESC2" ) )
	self:addElement( self )
	return self
end

function UpdateBrightnessGuide( f23_arg0 )
	local f23_local0 = Engine.GetDvarFloat( "profileMenuOption_blacklevel" )
	local f23_local1 = nil
	if f23_arg0.id == BrightnessGuideConstants.not_visible.item_id then
		f23_local1 = BrightnessGuideConstants.not_visible.color_default
	elseif f23_arg0.id == BrightnessGuideConstants.barely_visible.item_id then
		f23_local1 = BrightnessGuideConstants.barely_visible.color_default
	elseif f23_arg0.id == BrightnessGuideConstants.easily_visible.item_id then
		f23_local1 = BrightnessGuideConstants.easily_visible.color_default
	end
	if f23_local1 ~= nil then
		local f23_local2 = (f23_local1 - f23_local0) / (1 - f23_local0)
		f23_arg0:registerAnimationState( "current", {
			red = f23_local2,
			green = f23_local2,
			blue = f23_local2
		} )
		f23_arg0:animateToState( "current", 0 )
	end
end

LUI.Options.GetDisplay = function ( f24_arg0 )
	return Engine.GetBinding( f24_arg0 )
end

LUI.Options.OptionsWindowRefresh = function ( f25_arg0, f25_arg1 )
	if f25_arg1.source_input == "button_action" or f25_arg1.source_input == "key_bound" or f25_arg1.source_input == "button_right" or f25_arg1.source_input == "button_left" then
		f25_arg0:processEvent( {
			name = "refresh_disabled"
		} )
		f25_arg0:processEvent( {
			name = "content_refresh"
		} )
	end
end

LUI.Options.ClearBindTextHelper = function ( f26_arg0, f26_arg1 )
	return LUI.ButtonHelperText.ClearHelperTextObject( f26_arg0.help, LUI.ButtonHelperText.CommonEvents.addUnboundButton )
end

LUI.Options.OptionsWindowTriggerRefresh = function ( f27_arg0, f27_arg1 )
	f27_arg0:dispatchEventToRoot( {
		name = "options_window_refresh",
		source_input = f27_arg1.name,
		immediate = true
	} )
end

LUI.Options.CreateControlBindButton = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	local f28_local0 = {
		variant = GenericButtonSettings.Variants.Info,
		button_text = Engine.Localize( f28_arg1 )
	}
	local f28_local1
	if f28_arg2 then
		f28_local1 = Engine.Localize( f28_arg2 )
		if not f28_local1 then
		
		else
			f28_local0.desc_text = f28_local1
			f28_local0.button_display_func = function ( f29_arg0, f29_arg1 )
				return LUI.Options.GetDisplay( f28_arg3 )
			end
			
			f28_local0.H1OptionButton = true
			f28_local0.maxLabelWidth = 200
			f28_local1 = f28_arg0:AddButton( f28_arg1, function ( f30_arg0, f30_arg1 )
				Engine.BindKey( f28_arg3 )
				LUI.Options.OptionsWindowTriggerRefresh( f30_arg0, f30_arg1 )
				f28_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addUnboundButton )
			end, nil, nil, nil, f28_local0 )
			f28_local1:registerEventHandler( "element_refresh", MBh.EmitEvent( "content_refresh" ) )
			f28_local1:registerEventHandler( "key_bound", function ( element, event )
				LUI.Options.OptionsWindowTriggerRefresh( element, event )
				LUI.Options.ClearBindTextHelper( f28_arg0, event )
			end )
			return f28_local1
		end
	end
	f28_local1 = ""
end

function isFlipped( f32_arg0 )
	return string.find( Engine.GetProfileData( "gpadButtonsConfig", f32_arg0 ), "_alt" )
end

LUI.Options.FindProfileValue = function ( f33_arg0, f33_arg1, f33_arg2 )
	local f33_local0 = Engine.GetProfileData( f33_arg0, f33_arg2 )
	if f33_arg1[1].value == "buttons_default" then
		f33_local0 = string.gsub( f33_local0, "_alt", "" )
	end
	local f33_local1 = 1
	local f33_local2 = false
	for f33_local6, f33_local7 in pairs( f33_arg1 ) do
		if f33_local7.value == f33_local0 then
			f33_local1 = f33_local6
			f33_local2 = true
			break
		end
	end
	if not f33_local2 then
		DebugPrint( "WARNING: Profile Values " .. f33_arg1 .. " not found for " .. f33_arg0 .. " in values option list." )
	end
	return f33_local1
end

LUI.Options.CreateGamepadLayoutProfileButton = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4, f34_arg5, f34_arg6, f34_arg7, f34_arg8 )
	local f34_local0 = LUI.Options.FindProfileValue( f34_arg1, f34_arg6, f34_arg0.exclusiveController )
	local f34_local1 = {
		variant = GenericButtonSettings.Variants.Select
	}
	if localized then
		local f34_local2 = f34_arg4
	end
	f34_local1.button_text = f34_local2 or Engine.Localize( f34_arg4 )
	if localized then
		local f34_local3 = f34_arg5
	end
	local f34_local4
	if f34_arg5 then
		f34_local4 = Engine.Localize( f34_arg5 )
		if not f34_local4 then
		
		else
			f34_local1.desc_text = f34_local4
			f34_local1.H1OptionButton = true
			f34_local1.button_display_func = function ( f35_arg0, f35_arg1 )
				f34_local0 = LUI.Options.FindProfileValue( f34_arg1, f34_arg6, f34_arg0.exclusiveController )
				if isFlipped( f34_arg0.exclusiveController ) then
					return Engine.Localize( f34_arg6[f34_local0].text .. "_ALT" )
				else
					return Engine.Localize( f34_arg6[f34_local0].text )
				end
			end
			
			f34_local1.button_left_func = function ( f36_arg0, f36_arg1 )
				f34_local0 = 1 + (#f34_arg6 + f34_local0 - 1 - 1) % #f34_arg6
				f36_arg1.value = f34_arg6[f34_local0].value
				f34_arg8( f36_arg0, f36_arg1 )
			end
			
			f34_local1.button_right_func = function ( f37_arg0, f37_arg1 )
				f34_local0 = 1 + (f34_local0 - 1 + 1) % #f34_arg6
				f37_arg1.value = f34_arg6[f34_local0].value
				f34_arg8( f37_arg0, f37_arg1 )
			end
			
			f34_local1.showLockOnDisable = true
			f34_local1.maxLabelWidth = 200
			f34_local1.maxContentWidth = 175
			f34_local1.buttonActionIsRightAction = true
			f34_local4 = f34_arg0:AddButton( f34_arg4, nil, f34_arg7, nil, nil, f34_local1 )
			f34_local4:registerEventHandler( "element_refresh", MBh.EmitEvent( "content_refresh" ) )
			return f34_local4
		end
	end
	f34_local4 = f34_local3 or ""
end

LUI.Options.CreateControlProfileDataButton = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4, f38_arg5, f38_arg6, f38_arg7, f38_arg8, f38_arg9 )
	local f38_local0 = LUI.Options.FindProfileValue( f38_arg1, f38_arg6, f38_arg0.exclusiveController )
	local f38_local1 = function ( f39_arg0, f39_arg1 )
		if f38_arg3 then
			Engine.ExecNow( f38_arg3 .. " " .. f38_arg6[f38_local0].value )
		else
			Engine.ExecNow( f38_arg2 )
		end
		if not Engine.IsConsoleGame() then
			Engine.ExecNow( "profile_menuDvarsFinish" )
		end
		LUI.Options.OptionsWindowTriggerRefresh( f39_arg0, f39_arg1 )
		if f38_arg9 and type( f38_arg9 ) == "function" then
			f38_arg9( f39_arg0, f39_arg1, f38_arg6[f38_local0].value )
		end
	end
	
	local f38_local2 = {
		variant = GenericButtonSettings.Variants.Select
	}
	if f38_arg8 then
		local f38_local3 = f38_arg4
	end
	f38_local2.button_text = f38_local3 or Engine.Localize( f38_arg4 )
	if f38_arg8 then
		local f38_local4 = f38_arg5
	end
	local f38_local5
	if f38_arg5 then
		f38_local5 = Engine.Localize( f38_arg5 )
		if not f38_local5 then
		
		else
			f38_local2.desc_text = f38_local5
			f38_local2.H1OptionButton = true
			f38_local2.button_display_func = function ( f40_arg0, f40_arg1 )
				f38_local0 = LUI.Options.FindProfileValue( f38_arg1, f38_arg6, f38_arg0.exclusiveController )
				return Engine.Localize( f38_arg6[f38_local0].text )
			end
			
			f38_local2.button_left_func = function ( f41_arg0, f41_arg1 )
				f38_local0 = 1 + (#f38_arg6 + f38_local0 - 1 - 1) % #f38_arg6
				f38_local1( f41_arg0, f41_arg1 )
			end
			
			f38_local2.button_right_func = function ( f42_arg0, f42_arg1 )
				f38_local0 = 1 + (f38_local0 - 1 + 1) % #f38_arg6
				f38_local1( f42_arg0, f42_arg1 )
			end
			
			f38_local2.showLockOnDisable = true
			f38_local2.maxLabelWidth = 200
			f38_local2.buttonActionIsRightAction = true
			f38_local5 = f38_arg0:AddButton( f38_arg4, nil, f38_arg7, nil, nil, f38_local2 )
			f38_local5:registerEventHandler( "element_refresh", MBh.EmitEvent( "content_refresh" ) )
			return f38_local5
		end
	end
	f38_local5 = f38_local4 or ""
end

LUI.Options.CreateDVarVideoOptionHelper = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3, f43_arg4 )
	if type( f43_arg3 ) ~= "function" then
		local f43_local0 = f43_arg3
		f43_arg3 = function ()
			return f43_local0
		end
		
	end
	if not f43_arg4 then
		f43_arg4 = {}
	end
	local f43_local0 = LUI.Options.CreateSelectionButton
	local f43_local1 = f43_arg0
	local f43_local2 = f43_arg1
	local f43_local3 = f43_arg2
	local f43_local4 = f43_arg4.button_desc
	local f43_local5 = function ( f45_arg0, f45_arg1 )
		return LUI.Options.GetDvarText( f43_arg1, f43_arg3() )
	end
	
	local f43_local6 = f43_arg3
	local f43_local7 = LUI.Options.WarpSetDvarEventFunc( f43_arg1, f43_arg3 )
	local f43_local8 = f43_arg4.refreshFunc
	if not f43_local8 then
		f43_local8 = LUI.Options.RefreshVideoSetting
	end
	f43_local0( f43_local1, f43_local2, f43_local3, f43_local4, f43_local5, f43_local6, f43_local7, f43_local8, f43_arg4.disabledFunc )
end

LUI.Options.GetDvarIndex = function ( f46_arg0, f46_arg1 )
	local f46_local0 = nil
	local f46_local1 = 1
	local f46_local2 = Engine.GetDvarType( f46_arg0 )
	if f46_local2 == DvarTypeTable.DvarString then
		f46_local0 = Engine.GetDvarString( f46_arg0 )
	elseif f46_local2 == DvarTypeTable.DvarInt then
		f46_local0 = Engine.GetDvarInt( f46_arg0 )
	elseif f46_local2 == DvarTypeTable.DvarBool then
		f46_local0 = Engine.GetDvarBool( f46_arg0 )
	end
	local f46_local3 = false
	for f46_local7, f46_local8 in pairs( f46_arg1 ) do
		if f46_local8.value == f46_local0 then
			f46_local1 = f46_local7
			f46_local3 = true
			break
		end
	end
	if not f46_local3 then
		DebugPrint( "WARNING: Values " .. f46_local0 .. " not found for " .. f46_arg0 .. " in values option list." )
	end
	return f46_local1
end

LUI.Options.GetDvarText = function ( f47_arg0, f47_arg1 )
	local f47_local0 = LUI.Options.GetDvarIndex( f47_arg0, f47_arg1 )
	return Engine.Localize( f47_arg1[LUI.Options.GetDvarIndex( f47_arg0, f47_arg1 )].text )
end

LUI.Options.SetDvar = function ( f48_arg0, f48_arg1, f48_arg2 )
	assert( f48_arg1 and f48_arg2 )
	local f48_local0 = Engine.GetDvarType( f48_arg0 )
	if f48_local0 == DvarTypeTable.DvarString then
		Engine.SetDvarString( f48_arg0, f48_arg1[f48_arg2].value )
	elseif f48_local0 == DvarTypeTable.DvarInt then
		Engine.SetDvarInt( f48_arg0, f48_arg1[f48_arg2].value )
	elseif f48_local0 == DvarTypeTable.DvarBool then
		Engine.SetDvarBool( f48_arg0, f48_arg1[f48_arg2].value )
	else
		assert( false, "Unsupported dVar type." )
	end
end

LUI.Options.WarpSetDvarEventFunc = function ( f49_arg0, f49_arg1 )
	return function ( f50_arg0, f50_arg1 )
		assert( f50_arg1 and f50_arg1.currentIndex )
		LUI.Options.SetDvar( f49_arg0, f49_arg1(), f50_arg1.currentIndex )
	end
	
end

LUI.Options.CreateSelectionMenu = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4, f51_arg5, f51_arg6, f51_arg7 )
	return function ( f52_arg0, f52_arg1 )
		local f52_local0 = f51_arg4()
		local f52_local1 = 4
		local f52_local2 = 7
		local f52_local3
		if f52_local2 < #f52_local0 then
			f52_local3 = 19
			if not f52_local3 then
			
			else
				local f52_local4 = 6
				if f51_arg0.ActiveSelector then
					DebugPrint( "WARNING: LUI.Options.CreateSelectionMenu is called but a selector is already open, closing previous one." )
					f51_arg0.ActiveSelector:close()
					f51_arg0.ActiveSelector = nil
				end
				f51_arg7 = f51_arg7 or {}
				local ActiveSelector = f51_arg7
				local f52_local6 = f51_arg7.defaultState
				if not f52_local6 then
					f52_local6 = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						top = 130,
						height = 200,
						left = 775.89,
						width = 372.96
					}
				end
				ActiveSelector.defaultState = f52_local6
				f52_arg0:processEvent( {
					name = "lost_focus"
				} )
				
				ActiveSelector = LUI.UIElement.new( f51_arg7.defaultState )
				ActiveSelector:registerAnimationState( "visible", {
					alpha = 1
				} )
				ActiveSelector:registerAnimationState( "hidden", {
					alpha = 0
				} )
				f51_arg0:addElement( ActiveSelector )
				f51_arg0.ActiveSelector = ActiveSelector
				
				ActiveSelector.id = "option_selector_menu"
				ActiveSelector.link_menu_button = f52_arg0
				ActiveSelector.focusParent = function ()
					f51_arg0:processEvent( {
						name = "gain_focus"
					} )
					ActiveSelector.link_menu_button:processEvent( {
						name = "gain_focus"
					} )
				end
				
				f52_local6 = {
					title_bar_text = Engine.Localize( f51_arg2 ),
					fill_alpha = 1,
					border_alpha = 1,
					color = Colors.white
				}
				local f52_local7 = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					top = 0,
					bottom = GenericTitleBarDims.TitleBarHeight
				}
				local f52_local8 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_titlebar", f52_local6 )
				f52_local8:registerAnimationState( "default", f52_local7 )
				f52_local8:animateToState( "default" )
				ActiveSelector:addElement( f52_local8 )
				ActiveSelector:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_menu_background", {
					top_offset = 0,
					fill_alpha = 1,
					use_background_tint = true
				} ) )
				local self = LUI.UIImage.new()
				self:registerAnimationState( "default", {
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					top = GenericTitleBarDims.TitleBarHeight - 1,
					material = RegisterMaterial( "h1_popup_bg" ),
					alpha = 1
				} )
				self:animateToState( "default" )
				ActiveSelector:addElement( self )
				local self = LUI.UIVerticalList.new( {
					leftAnchor = true,
					topAnchor = true,
					top = GenericTitleBarDims.TitleBarHeight + f52_local1,
					left = f52_local1,
					width = f51_arg7.defaultState.width - f52_local1 * 2 - f52_local3,
					spacing = f52_local4
				} )
				ActiveSelector:addElement( self )
				self.buttonCount = 0
				local f52_local11 = LUI.Options.GetDvarIndex( f51_arg1, f52_local0 )
				local f52_local12 = nil
				for f52_local17, f52_local18 in pairs( f52_local0 ) do
					self.buttonCount = self.buttonCount + 1
					local f52_local19 = {
						style = GenericButtonSettings.Styles.GlassButton,
						fade_in = 0,
						desc_text = f51_arg3 and Engine.Localize( f51_arg3 ) or nil,
						text_align_with_content = LUI.Alignment.Left,
						button_text = Engine.Localize( f52_local0[f52_local17].text ),
						button_action_func = function ( f54_arg0, f54_arg1 )
							if f51_arg5 and not f54_arg0.isCurrentValue then
								f54_arg1.currentIndex = f52_local17
								f51_arg5( f54_arg0, f54_arg1 )
							end
							if not f54_arg0.isCurrentValue then
								f51_arg6()
								ActiveSelector.link_menu_button:processEvent( {
									name = "content_refresh"
								} )
							end
							if f51_arg0.list then
								f51_arg0.list:processEvent( {
									name = "refresh_disabled",
									dispatchChildren = true
								} )
							end
							ActiveSelector.focusParent()
							f51_arg0.ActiveSelector = nil
							ActiveSelector:close()
						end
					}
					if f52_local17 == f52_local11 then
						f52_local19.lockedHighlight = true
						f52_local19.text_lock_color = Colors.h1.current_tab_select_text
					end
					local f52_local16 = LUI.MenuBuilder.BuildAddChild( self, {
						type = "UIGenericButton",
						id = "selection_menu_button_" .. f52_local17,
						properties = f52_local19,
						listIndex = self.buttonCount
					} )
					if f52_local17 == f52_local11 then
						f52_local12 = f52_local16
						f52_local16.listDefaultFocus = true
						f52_local16.isCurrentValue = true
					end
				end
				LUI.Options.InitScrollingList( self, nil, {
					rows = f52_local2
				} )
				f51_arg0:processEvent( {
					name = "lose_focus"
				} )
				self:processEvent( {
					name = "gain_focus"
				} )
				LUI.UIRoot.ProcessEvent( Engine.GetLuiRoot(), {
					name = "init_selector",
					target = ActiveSelector
				} )
				ActiveSelector:registerEventHandler( "init_selector", function ( element, event )
					local f55_local0 = #f52_local0
					if f52_local2 < f55_local0 then
						f55_local0 = f52_local2
					end
					local f55_local1 = f52_local1 * 2 + f52_local4 * (f55_local0 - 1)
					local f55_local2 = self:getFirstChild()
					f51_arg7.defaultState.height = GenericTitleBarDims.TitleBarHeight + f55_local1 + f55_local2:getHeight() * f55_local0
					ActiveSelector:registerAnimationState( "resize", f51_arg7.defaultState )
					ActiveSelector:animateToState( "resize" )
				end )
			end
		end
		f52_local3 = 0
	end
	
end

LUI.Options.CloseSelectionMenu = function ( f56_arg0, f56_arg1 )
	if f56_arg0.ActiveSelector then
		if f56_arg1 then
			f56_arg0.ActiveSelector.focusParent()
		end
		f56_arg0.ActiveSelector:close()
		f56_arg0.ActiveSelector = nil
	end
end

LUI.Options.CreateSelectionButton = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4, f57_arg5, f57_arg6, f57_arg7, f57_arg8, f57_arg9 )
	local f57_local0 = {
		variant = GenericButtonSettings.Variants.Info,
		button_text = Engine.Localize( f57_arg2 )
	}
	local f57_local1
	if f57_arg3 then
		f57_local1 = Engine.Localize( f57_arg3 )
		if not f57_local1 then
		
		else
			f57_local0.desc_text = f57_local1
			f57_local0.H1OptionButton = true
			f57_local0.button_display_func = f57_arg4
			f57_local0.button_action_func = LUI.Options.CreateSelectionMenu( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg5, f57_arg6, f57_arg7, nil )
			f57_local0.maxLabelWidth = 200
			f57_local0.showLockOnDisable = true
			return f57_arg0:AddButton( f57_arg2, nil, f57_arg8, nil, nil, f57_local0 )
		end
	end
	f57_local1 = ""
end

LUI.Options.CreateOptionButton = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3, f58_arg4, f58_arg5, f58_arg6, f58_arg7, f58_arg8 )
	local f58_local0 = nil
	local f58_local1 = 1
	local f58_local2 = Engine.GetDvarType( f58_arg1 )
	local f58_local3 = function ( f59_arg0, f59_arg1 )
		if f59_arg0 == "sf_use_chaplin" and f59_arg1 == "1" then
			Engine.SetDvarString( "sf_use_slowmo", "0" )
			Engine.SetDvarString( "sf_use_bw", "0" )
			Engine.SetDvarString( "sf_use_invert", "0" )
			Engine.SetDvarString( "sf_use_contrast", "0" )
		elseif (f59_arg0 == "sf_use_slowmo" or f59_arg0 == "sf_use_bw" or f59_arg0 == "sf_use_invert" or f59_arg0 == "sf_use_contrast") and f59_arg1 == "1" then
			Engine.SetDvarString( "sf_use_chaplin", "0" )
		end
		if f59_arg0 == "sf_use_bw" and f59_arg1 == "1" then
			Engine.SetDvarString( "sf_use_chaplin", "0" )
			Engine.SetDvarString( "sf_use_invert", "0" )
			Engine.SetDvarString( "sf_use_contrast", "0" )
		end
		if f59_arg0 == "sf_use_invert" and f59_arg1 == "1" then
			Engine.SetDvarString( "sf_use_chaplin", "0" )
			Engine.SetDvarString( "sf_use_bw", "0" )
			Engine.SetDvarString( "sf_use_contrast", "0" )
		end
		if f59_arg0 == "sf_use_contrast" and f59_arg1 == "1" then
			Engine.SetDvarString( "sf_use_chaplin", "0" )
			Engine.SetDvarString( "sf_use_invert", "0" )
			Engine.SetDvarString( "sf_use_bw", "0" )
		end
	end
	
	if f58_local2 == DvarTypeTable.DvarString then
		f58_local0 = Engine.GetDvarString( f58_arg1 )
	elseif f58_local2 == DvarTypeTable.DvarInt then
		f58_local0 = Engine.GetDvarInt( f58_arg1 )
	elseif f58_local2 == DvarTypeTable.DvarBool then
		f58_local0 = Engine.GetDvarBool( f58_arg1 )
	end
	local f58_local4 = false
	for f58_local8, f58_local9 in pairs( f58_arg4 ) do
		if f58_local9.value == f58_local0 then
			f58_local1 = f58_local8
			f58_local4 = true
			break
		end
	end
	if not f58_local4 then
		f58_local5 = f58_local0
		if f58_local2 == DvarTypeTable.DvarBool then
			if f58_local5 then
				local f58_local10 = "true"
			end
			f58_local5 = f58_local10 or "false"
		end
		DebugPrint( "WARNING: Values " .. f58_local5 .. " not found for " .. f58_arg1 .. " in values option list." )
	end
	if f58_arg5 == nil then
		f58_arg5 = function ( f60_arg0, f60_arg1 )
			if f58_local2 == DvarTypeTable.DvarString then
				f58_local3( f58_arg1, f58_arg4[f58_local1].value )
				Engine.SetDvarString( f58_arg1, f58_arg4[f58_local1].value )
			elseif f58_local2 == DvarTypeTable.DvarInt then
				Engine.SetDvarInt( f58_arg1, f58_arg4[f58_local1].value )
			elseif f58_local2 == DvarTypeTable.DvarBool then
				Engine.SetDvarBool( f58_arg1, f58_arg4[f58_local1].value )
			end
			if f58_arg7 then
				f58_arg7( f58_arg4[f58_local1].value )
			end
		end
		
	end
	f58_local5 = function ( f61_arg0, f61_arg1 )
		local f61_local0 = nil
		if f58_arg8 ~= nil then
			f61_local0 = f58_arg8( f61_arg0, f61_arg1 )
		end
		if f61_local0 == nil then
			f58_local1 = LUI.Options.GetDvarIndex( f58_arg1, f58_arg4 )
			return Engine.Localize( f58_arg4[f58_local1].text )
		else
			return f61_local0
		end
	end
	
	f58_local6 = {
		variant = GenericButtonSettings.Variants.Select,
		button_text = Engine.Localize( f58_arg2 )
	}
	if f58_arg3 then
		f58_local7 = Engine.Localize( f58_arg3 )
		if not f58_local7 then
		
		else
			f58_local6.desc_text = f58_local7
			f58_local6.H1OptionButton = true
			f58_local6.showLockOnDisable = true
			f58_local6.disableSound = CoD.SFX.MenuAcceptDisabled
			f58_local6.button_display_func = f58_local5
			f58_local6.button_left_func = function ( f62_arg0, f62_arg1 )
				f58_local1 = 1 + (#f58_arg4 + f58_local1 - 1 - 1) % #f58_arg4
				f58_arg5( f62_arg0, f62_arg1, f58_arg4[f58_local1].value )
			end
			
			f58_local6.button_right_func = function ( f63_arg0, f63_arg1 )
				f58_local1 = 1 + (f58_local1 - 1 + 1) % #f58_arg4
				f58_arg5( f63_arg0, f63_arg1, f58_arg4[f58_local1].value )
			end
			
			f58_local6.maxLabelWidth = 200
			f58_local6.buttonActionIsRightAction = true
			return f58_arg0:AddButton( f58_arg2, nil, f58_arg6, nil, nil, f58_local6 )
		end
	end
	f58_local7 = ""
end

LUI.Options.InitScrollingList = function ( f64_arg0, f64_arg1, f64_arg2 )
	if not f64_arg2 then
		f64_arg2 = {}
	end
	local self = nil
	local f64_local1 = 7.5
	local f64_local2 = f64_arg2.rows or 9
	local f64_local3 = f64_arg2.scrollBarLeftOffset or 10
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f64_local2 = 3
	end
	local f64_local4 = f64_arg0:getFirstChild()
	assert( f64_local4, "InitScrollingList need at least a child in list." )
	local f64_local5, f64_local6, f64_local7, f64_local8 = f64_arg0:getLocalRect()
	local f64_local9, f64_local10, f64_local11, f64_local12 = f64_local4:getLocalRect()
	local f64_local13 = f64_arg0:getAnimationStateInC( f64_arg0:getAnimationStateName() )
	self = LUI.UIVerticalScrollbar.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		width = f64_local1,
		left = f64_local7 + f64_local3,
		top = f64_local6 - 0.5,
		height = (f64_local12 - f64_local10 + (f64_local13.spacing or 0)) * f64_local2 - 8.5
	}, f64_arg0, f64_local1, nil, nil, nil, nil, Colors.white, Colors.h1.dark_grey, "h1_scrollbar_fill_normal", "h1_scrollbar_bg", "h1_scrollbar_fill_selected" )
	local f64_local14 = f64_arg0:getParent()
	f64_local14:addElement( self )
	ListPaging.InitList( f64_arg0, f64_local2, 10, false, false, {
		enabled = false
	}, self )
end

LUI.Options.AddOptionTextInfo = function ( f65_arg0 )
	local f65_local0, f65_local1, f65_local2, f65_local3 = f65_arg0.list:getLocalRect()
	return f65_arg0:addElement( LUI.MenuBuilder.BuildRegisteredType( "h1_vlist_button_desc_text", {
		top = f65_local1 + (f65_arg0.list.listHeight or f65_local1 - f65_local3) + LUI.H1VlistButtonDescText.ListVerticalOffset,
		left = f65_local0,
		width = f65_local2 - f65_local0,
		fadeIn = true
	} ) )
end

LUI.Options.AddRightPanel = function ( f66_arg0 )
	local f66_local0, f66_local1, f66_local2, f66_local3 = f66_arg0.list:getLocalRect()
	local f66_local4 = 0
	local f66_local5 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f66_local4 = 450
		f66_local5 = -100
	end
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		top = 65 + f66_local5,
		left = f66_local2 + 150 + f66_local4,
		width = 400,
		height = 450
	} )
	self:animateToState( "default" )
	f66_arg0:addElement( self )
	return self
end

LUI.Options.WrapFuncWithController = function ( f67_arg0, f67_arg1 )
	if f67_arg1 ~= nil and type( f67_arg1 ) == "function" then
		return function ()
			local f68_local0 = f67_arg1
			local f68_local1 = f67_arg0.exclusiveController
			if not f68_local1 then
				f68_local1 = f67_arg0.controller
			end
			return f68_local0( f68_local1, f67_arg0 )
		end
		
	else
		return f67_arg1
	end
end

LUI.Options.AddButtonOptionVariant = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4, f69_arg5, f69_arg6, f69_arg7, f69_arg8, f69_arg9, f69_arg10, f69_arg11 )
	local f69_local0 = nil
	if type( f69_arg7 ) == "function" then
		f69_local0 = f69_arg7
	elseif type( f69_arg7 ) == "string" then
		f69_local0 = function ( f70_arg0, f70_arg1 )
			LUI.FlowManager.RequestAddMenu( f70_arg0, f69_arg7, true, f70_arg1.controller, false )
		end
		
	end
	local f69_local1 = {
		variant = f69_arg1,
		desc_text = Engine.Localize( f69_arg3 ),
		button_display_func = LUI.Options.WrapFuncWithController( f69_arg0, f69_arg4 ),
		button_left_func = LUI.Options.WrapFuncWithController( f69_arg0, f69_arg5 ),
		button_right_func = LUI.Options.WrapFuncWithController( f69_arg0, f69_arg6 ),
		button_action_func = f69_local0,
		button_over_func = f69_arg8,
		button_up_func = f69_arg9,
		H1OptionButton = true,
		textStyle = CoD.TextStyle.ForceUpperCase,
		maxLabelWidth = 200,
		buttonActionIsRightAction = f69_arg1 ~= GenericButtonSettings.Variants.Slider
	}
	local f69_local2
	if f69_arg1 ~= GenericButtonSettings.Variants.Slider then
		f69_local2 = f69_arg11
	else
		f69_local2 = true
	end
	f69_local1.muteAction = f69_local2
	f69_local1.valueActionAudio = f69_arg11
	return f69_arg0:AddButton( f69_arg2, nil, f69_arg10, nil, nil, f69_local1 )
end

LockTable( _M )
