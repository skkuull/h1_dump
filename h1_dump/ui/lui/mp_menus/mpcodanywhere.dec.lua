local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.CODAnywhere = InheritFrom( LUI.MenuTemplate )
function cod_anywhere_unavailable_popup( f1_arg0, f1_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@GAME_WARNING" ),
		message_text = Engine.Localize( "@LUA_MENU_COD_ANYWHERE_UNAVAILABLE" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
	LUI.FlowManager.RequestAddMenu( f2_arg0, "cod_anywhere_sign_in_popup", true, f2_arg1.controller )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "cod_anywhere_registration_menu", true, f3_arg1.controller )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
end

function AddPopupButton( f5_arg0, f5_arg1, f5_arg2 )
	if not f5_arg0.buttonCount then
		f5_arg0.buttonCount = 0
	end
	LUI.MenuBuilder.BuildAddChild( f5_arg0, {
		type = "UIGenericButton",
		id = "popup_button_" .. f5_arg0.buttonCount,
		properties = {
			button_text = Engine.Localize( f5_arg1 ),
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = f5_arg2
		}
	} )
	f5_arg0.buttonCount = f5_arg0.buttonCount + 1
end

function cod_anywhere_popup_menu( f6_arg0, f6_arg1 )
	Engine.SetPlayerData( f6_arg1.exclusiveController, CoD.StatsGroup.Common, "cod_anywhere_signup_request", 1 )
	local f6_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_COD_ANYWHERE" ),
		popup_width = 500
	} )
	local f6_local1 = f6_local0:getFirstDescendentById( "generic_selectionList_content_id" )
	local f6_local2 = CoD.TextSettings.Font21
	local f6_local3 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f6_local3.height = f6_local2.Height
	f6_local3.font = f6_local2.Font
	f6_local3.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f6_local3.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f6_local3 )
	self:setText( Engine.LocalizeLong( "LUA_MENU_COD_ANYWHERE_MARKETING" ) )
	f6_local1:addElement( self )
	f6_local1:addElement( LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 16, CoD.AnchorTypes.TopLeft ) ) )
	AddPopupButton( f6_local1, "@LUA_MENU_COD_ANYWHERE_SIGN_IN", f0_local0 )
	AddPopupButton( f6_local1, "@LUA_MENU_COD_ANYWHERE_CREATE_ACCOUNT", f0_local1 )
	AddPopupButton( f6_local1, "@LUA_MENU_CODA_SKIP", f0_local2 )
	return f6_local0
end

local f0_local3 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Engine.Localize( "@LUA_MENU_COD_ANYWHERE" )
	local f7_local1 = Engine.GetDvarString( "cod_anywhere_errorMessage" )
	f7_arg0:dispatchEventToChildren( {
		name = "update_title",
		title_text = f7_local0
	} )
	f7_arg0:dispatchEventToChildren( {
		name = "update_message",
		message_text = f7_local1
	} )
end

local f0_local4 = function ( f8_arg0, f8_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
end

local f0_local5 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		confirmation_action = f0_local4
	} )
	f9_local0:registerEventHandler( "menu_create", f0_local3 )
	return f9_local0
end

function cod_anywhere_working_popup_menu()
	local f10_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@MENU_FACEBOOK_UPLOADING" )
	} )
	f10_local0.id = "cod_anywhere_working_popup_menu_id"
	return f10_local0
end

local f0_local6 = function ( f11_arg0, f11_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f11_arg0 )
	f11_arg0:dispatchEventToRoot( {
		name = "leave_platform_screen"
	} )
end

local f0_local7 = function ( f12_arg0, f12_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_COD_ANYWHERE" ),
		message_text = Engine.GetDvarString( "cod_anywhere_single_task_popup_text" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = f0_local6
	} )
end

local f0_local8 = function ( f13_arg0, f13_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f13_arg0 )
	CoDAnywhere.DoNotShowPopup( f13_arg1.controller )
	CoDAnywhere.DownloadNonUCDPlatforms( f13_arg1.controller )
end

local f0_local9 = function ( f14_arg0, f14_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_COD_ANYWHERE" ),
		message_text = Engine.Localize( "@LUA_MENU_COD_ANYWHERE_LINK_UCD_DESC" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = f0_local8
	} )
end

local f0_local10 = function ( f15_arg0, f15_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_COD_ANYWHERE" ),
		message_text = Engine.Localize( "@LUA_MENU_COD_ANYWHERE_ALL_DONE" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function cod_anywhere_email_confirm_continue( f16_arg0, f16_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f16_arg0 )
	f16_arg0:dispatchEventToRoot( {
		name = "cod_anywhere_start_registration",
		id = "coda_registration",
		controller = f16_arg1.controller
	} )
end

local f0_local11 = function ( f17_arg0, f17_arg1 )
	local f17_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f17_arg1.reg_menu )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_CODA_EMAIL_CONFIRM_TITLE" ),
		message_text = Engine.Localize( "@LUA_MENU_CODA_EMAIL_CONFIRM_TEXT", f17_local0.reg_email ),
		yes_action = cod_anywhere_email_confirm_continue,
		no_action = MBh.LeaveMenu(),
		yes_text = Engine.Localize( "@LUA_MENU_CONTINUE" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function cod_anywhere_quit_confirm_popup( f18_arg0, f18_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@PLATFORM_QUIT" ),
		message_text = Engine.Localize( "@MENU_ARE_YOU_SURE_QUIT" ),
		yes_action = function ( f19_arg0, f19_arg1 )
			f19_arg0:dispatchEventToRoot( {
				name = "cod_anywhere_success_exit",
				id = "coda_registration"
			} )
		end
		,
		no_action = MBh.LeaveMenu(),
		yes_text = Engine.Localize( "@MENU_QUIT" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function SignInEmailChanged( f20_arg0, f20_arg1 )
	local f20_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f20_arg0 )
	if f20_arg1.text ~= nil then
		f20_local0.signin_email = f20_arg1.text
	end
	if f20_arg1.text and string.len( f20_arg1.text ) >= 21 then
		f20_arg1.text = string.sub( f20_arg1.text, 1, 21 )
	end
	return f20_arg1.text
end

function SignInPasswordChanged( f21_arg0, f21_arg1 )
	local f21_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f21_arg0 )
	if f21_arg1.text ~= nil then
		f21_local0.signin_password = f21_arg1.text
	end
end

local f0_local12 = function ( f22_arg0, f22_arg1 )
	LUI.FlowManager.RequestAddMenu( f22_arg0, "cod_anywhere_error_popup_menu", true, f22_arg1.controller )
end

local f0_local13 = function ( f23_arg0, f23_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f23_arg0 )
	f23_arg0:dispatchEventToRoot( {
		name = "cod_anywhere_success_exit",
		id = "coda_registration"
	} )
	LUI.FlowManager.RequestAddMenu( f23_arg0, "cod_anywhere_success_popup_menu", true, f23_arg1.controller )
end

function LeaveCoDAnywhereMenu( f24_arg0, f24_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f24_arg0 )
end

function SignInContinue( f25_arg0, f25_arg1 )
	local f25_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f25_arg0 )
	CoDAnywhere.StartAccountLinking( f25_arg1.controller, f25_local0.signin_email, f25_local0.signin_password )
end

function cod_anywhere_sign_in_popup( f26_arg0, f26_arg1 )
	local f26_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_CODA_SIGNIN_TITLE" ),
		popup_width = 600
	} )
	local f26_local1 = f26_local0:getFirstDescendentById( "generic_selectionList_content_id" )
	local f26_local2 = LUI.FlowManager.GetMenuScopedDataFromElement( f26_local0 )
	f26_local2.signin_email = RegistrationDefaults.reg_email
	f26_local2.signin_password = RegistrationDefaults.reg_password
	local f26_local3 = CoD.TextSettings.Font21
	local f26_local4 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f26_local4.height = f26_local3.Height
	f26_local4.font = f26_local3.Font
	f26_local4.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f26_local4.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f26_local4 )
	self:setText( Engine.LocalizeLong( "@LUA_MENU_CODA_SIGNIN_TEXT" ) )
	f26_local1:addElement( self )
	f26_local1:addElement( LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 16, CoD.AnchorTypes.TopLeft ) ) )
	f26_local0:registerEventHandler( "cod_anywhere_success_exit", MBh.LeaveMenu() )
	f26_local0:registerEventHandler( "open_cod_anywhere_error_popup", f0_local12 )
	f26_local0:registerEventHandler( "open_cod_anywhere_success_popup", f0_local13 )
	LUI.MenuBuilder.BuildAddChild( f26_local1, {
		type = "UIGenericButton",
		id = "cod_anywhere_signin_email",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				bottom = GenericButtonSettings.Styles.GradientButton.height
			}
		},
		properties = {
			variant = GenericButtonSettings.Variants.Input,
			button_text = Engine.Localize( "@LUA_MENU_CODA_REGISTER_EMAIL" ),
			content_width = ButtonDefaults.content_width,
			content_margin = ButtonDefaults.content_margin,
			field_edited_func = SignInEmailChanged,
			text_alignment = LUI.Alignment.Center,
			keyboard_type = CoD.KeyboardInputTypes.Email,
			field_name = Engine.Localize( "@LUA_MENU_CODA_REGISTER_EMAIL_SYSTEM_DIALOG" ),
			max_length = 127
		}
	} )
	LUI.MenuBuilder.BuildAddChild( f26_local1, {
		type = "UIGenericButton",
		id = "cod_anywhere_signin_password",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				bottom = GenericButtonSettings.Styles.GradientButton.height
			}
		},
		properties = {
			variant = GenericButtonSettings.Variants.Input,
			button_text = Engine.Localize( "@LUA_MENU_CODA_REGISTER_PASSWORD" ),
			content_width = ButtonDefaults.content_width,
			content_margin = ButtonDefaults.content_margin,
			field_edited_func = SignInPasswordChanged,
			text_alignment = LUI.Alignment.Center,
			keyboard_type = CoD.KeyboardInputTypes.Password,
			field_name = Engine.Localize( "@LUA_MENU_CODA_REGISTER_PASSWORD_SYSTEM_DIALOG" ),
			password_field = true
		}
	} )
	AddPopupButton( f26_local1, "@LUA_MENU_CODA_SIGNIN_CONFIRM", SignInContinue )
	return f26_local0
end

function GetCountryText( f27_arg0, f27_arg1 )
	local f27_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f27_arg0 )
	local f27_local1 = f27_local0.reg_country or 1
	return Engine.Localize( RegistrationDefaults.country_list[f27_local0.reg_country or 1].display_string )
end

function CountryNext( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f28_arg0 )
	local f28_local1 = f28_local0.reg_country + 1
	if f28_local1 > #RegistrationDefaults.country_list then
		f28_local1 = 1
	end
	f28_local0.reg_country = f28_local1
end

function CountryPrev( f29_arg0, f29_arg1, f29_arg2 )
	local f29_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f29_arg0 )
	local f29_local1 = f29_local0.reg_country - 1
	if f29_local1 < 1 then
		f29_local1 = #RegistrationDefaults.country_list
	end
	f29_local0.reg_country = f29_local1
end

function RegisterEmailPopup( f30_arg0, f30_arg1 )
	f30_arg0.properties.is_email_popup = true
	Engine.OpenScreenKeyboard( f30_arg1.controller, f30_arg0.properties.field_name, value and value or "", f30_arg0.properties.max_length, false, false, f30_arg0.properties.keyboard_type )
end

function RegisterEmailDisplayChanged( f31_arg0, f31_arg1 )
	local f31_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f31_arg0 )
	local f31_local1 = f31_local0.reg_email or ""
	if string.len( f31_local1 ) >= 21 then
		f31_local1 = string.sub( f31_local1, 1, 21 )
	end
	return f31_local1
end

function RegisterEmailChanged( f32_arg0, f32_arg1 )
	if not f32_arg0.properties.is_email_popup then
		return 
	end
	f32_arg0.properties.is_email_popup = false
	local f32_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f32_arg0 )
	if f32_arg1.text ~= nil then
		f32_local0.reg_email = f32_arg1.text
		VerifyEmail( f32_arg0, f32_arg1, f32_arg1.text, true )
	end
	f32_arg0:processEvent( {
		name = "content_refresh"
	} )
end

function VerifyEmail( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
	local f33_local0 = Engine.Localize( "@LUA_MENU_CODA_REGISTER_EMAIL" )
	if f33_arg2 == nil or string.find( f33_arg2, "@" ) == nil or string.find( f33_arg2, "." ) == nil then
		if f33_arg3 and f33_arg3 == true then
			LUI.FlowManager.RequestAddMenu( f33_arg0, "cod_anywhere_entry_error_popup", true, f33_arg1.controller, false, {
				extraMessage = f33_local0
			} )
		end
		LUI.CODAnywhere.ShowProblemIcon( f33_arg0, "email" )
		return f33_local0
	else
		LUI.CODAnywhere.HideProblemIcon( f33_arg0, "email" )
	end
end

function RegisterPasswordChanged( f34_arg0, f34_arg1 )
	local f34_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f34_arg0 )
	f34_local0.reg_password = f34_arg1.text
	VerifyPassword( f34_arg0, f34_arg1, f34_arg1.text, true )
	VerifyConfirmPassword( f34_arg0, f34_arg1, f34_local0.reg_password_confirm, true )
end

function VerifyPassword( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f35_arg0 )
	local f35_local1 = Engine.Localize( "@LUA_MENU_CODA_REGISTER_PASSWORD" )
	local f35_local2 = true
	if f35_arg2 == nil or f35_arg2 == "" then
		f35_local2 = false
	end
	if f35_local2 == false or string.len( f35_arg2 ) < 8 or string.len( f35_arg2 ) > 20 then
		f35_local2 = false
	end
	if f35_local2 == false or f35_arg2 == f35_local0.reg_email then
		f35_local2 = false
	end
	if f35_local2 == false then
		if show_popup and show_popup == true then
			LUI.FlowManager.RequestAddMenu( f35_arg0, "cod_anywhere_entry_error_popup", true, f35_arg1.controller, false, {
				extraMessage = f35_local1
			} )
		end
		LUI.CODAnywhere.ShowProblemIcon( f35_arg0, "password" )
		return f35_local1
	else
		LUI.CODAnywhere.HideProblemIcon( f35_arg0, "password" )
	end
end

function RegisterConfirmPasswordChanged( f36_arg0, f36_arg1 )
	local f36_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f36_arg0 )
	f36_local0.reg_password_confirm = f36_arg1.text
	VerifyConfirmPassword( f36_arg0, f36_arg1, f36_arg1.text, true )
end

function VerifyConfirmPassword( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
	local f37_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f37_arg0 )
	local f37_local1 = Engine.Localize( "@LUA_MENU_CODA_REGISTER_PASS_CONFIRM" )
	if f37_arg2 == nil or f37_arg2 ~= f37_local0.reg_password then
		if show_popup and show_popup == true then
			LUI.FlowManager.RequestAddMenu( f37_arg0, "cod_anywhere_entry_error_popup", true, f37_arg1.controller, false, {
				extraMessage = f37_local1
			} )
		end
		LUI.CODAnywhere.ShowProblemIcon( f37_arg0, "confirm" )
		return f37_local1
	else
		LUI.CODAnywhere.HideProblemIcon( f37_arg0, "confirm" )
	end
end

function SubscribeChanged( f38_arg0, f38_arg1, f38_arg2 )
	local f38_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f38_arg0 )
	f38_local0.reg_subscribe = f38_local0.reg_subscribe and 1 or 0
end

function AcceptTOSChanged( f39_arg0, f39_arg1, f39_arg2 )
	local f39_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f39_arg0 )
	f39_local0.reg_tos_confirm = f39_local0.reg_tos_confirm and 1 or 0
end

function AcceptPPChanged( f40_arg0, f40_arg1, f40_arg2 )
	local f40_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f40_arg0 )
	f40_local0.reg_pp_confirm = f40_local0.reg_pp_confirm and 1 or 0
end

function GetMonthText( f41_arg0, f41_arg1 )
	local f41_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f41_arg0 )
	return Engine.Localize( RegistrationDefaults.month_list[f41_local0.reg_dob_month or 1] )
end

function MonthNext( f42_arg0, f42_arg1, f42_arg2 )
	local f42_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f42_arg0 )
	local f42_local1 = f42_local0.reg_dob_month + 1
	if f42_local1 > #RegistrationDefaults.month_list then
		f42_local1 = 1
	end
	f42_local0.reg_dob_month = f42_local1
	if RegistrationDefaults.month_days[f42_local0.reg_dob_month] < f42_local0.reg_dob_day then
		f42_local0.reg_dob_day = RegistrationDefaults.month_days[f42_local0.reg_dob_month]
		f42_arg0:dispatchEventToRoot( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
end

function MonthPrev( f43_arg0, f43_arg1, f43_arg2 )
	local f43_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f43_arg0 )
	local f43_local1 = f43_local0.reg_dob_month - 1
	if f43_local1 < 1 then
		f43_local1 = #RegistrationDefaults.month_list
	end
	f43_local0.reg_dob_month = f43_local1
	if RegistrationDefaults.month_days[f43_local0.reg_dob_month] < f43_local0.reg_dob_day then
		f43_local0.reg_dob_day = RegistrationDefaults.month_days[f43_local0.reg_dob_month]
		f43_arg0:dispatchEventToRoot( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
end

function GetDayNum( f44_arg0, f44_arg1 )
	local f44_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f44_arg0 )
	return f44_local0.reg_dob_day or 1
end

function DayNext( f45_arg0, f45_arg1, f45_arg2 )
	local f45_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f45_arg0 )
	local f45_local1 = f45_local0.reg_dob_day + 1
	local f45_local2 = RegistrationDefaults.month_days[f45_local0.reg_dob_month]
	if f45_local0.is_leap_year and f45_local0.reg_dob_month == 2 then
		f45_local2 = f45_local2 + 1
	end
	if f45_local2 < f45_local1 then
		f45_local1 = 1
	end
	f45_local0.reg_dob_day = f45_local1
end

function DayPrev( f46_arg0, f46_arg1, f46_arg2 )
	local f46_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f46_arg0 )
	local f46_local1 = f46_local0.reg_dob_day - 1
	local f46_local2 = RegistrationDefaults.month_days[f46_local0.reg_dob_month]
	if f46_local0.is_leap_year and f46_local0.reg_dob_month == 2 then
		f46_local2 = f46_local2 + 1
	end
	if f46_local1 < 1 then
		f46_local1 = f46_local2
	end
	f46_local0.reg_dob_day = f46_local1
end

function GetYearNum( f47_arg0, f47_arg1 )
	local f47_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f47_arg0 )
	return f47_local0.reg_dob_year or 2000
end

function YearNext( f48_arg0, f48_arg1, f48_arg2 )
	local f48_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f48_arg0 )
	local f48_local1 = f48_local0.reg_dob_year + 1
	if f48_local1 > RegistrationDefaults.max_year then
		f48_local1 = RegistrationDefaults.min_year
	end
	f48_local0.reg_dob_year = f48_local1
	local f48_local2
	if f48_local0.reg_dob_year % 400 ~= 0 and (f48_local0.reg_dob_year % 4 ~= 0 or f48_local0.reg_dob_year % 100 <= 0) then
		f48_local2 = false
	else
		f48_local2 = true
	end
	f48_local0.is_leap_year = f48_local2
	if f48_local0.is_leap_year == false and f48_local0.reg_dob_day == 29 then
		f48_local0.reg_dob_day = RegistrationDefaults.month_days[f48_local0.reg_dob_month]
		f48_arg0:dispatchEventToRoot( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
end

function YearPrev( f49_arg0, f49_arg1, f49_arg2 )
	local f49_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f49_arg0 )
	local f49_local1 = f49_local0.reg_dob_year - 1
	if f49_local1 < RegistrationDefaults.min_year then
		f49_local1 = RegistrationDefaults.max_year
	end
	f49_local0.reg_dob_year = f49_local1
	local f49_local2
	if f49_local0.reg_dob_year % 400 ~= 0 and (f49_local0.reg_dob_year % 4 ~= 0 or f49_local0.reg_dob_year % 100 <= 0) then
		f49_local2 = false
	else
		f49_local2 = true
	end
	f49_local0.is_leap_year = f49_local2
	if f49_local0.is_leap_year == false and f49_local0.reg_dob_day == 29 then
		f49_local0.reg_dob_day = RegistrationDefaults.month_days[f49_local0.reg_dob_month]
		f49_arg0:dispatchEventToRoot( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
end

function VerifyDoB( f50_arg0, f50_arg1 )
	local f50_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f50_arg0 )
	local f50_local1 = 13
	local f50_local2, f50_local3, f50_local4 = Engine.GetCurrentDayMonthYear()
	local f50_local5 = false
	if f50_local0.reg_dob_year + f50_local1 < f50_local4 then
		f50_local5 = true
	elseif f50_local0.reg_dob_year + f50_local1 == f50_local4 then
		if f50_local0.reg_dob_month < f50_local3 then
			f50_local5 = true
		elseif f50_local0.reg_dob_month == f50_local3 and f50_local0.reg_dob_day <= f50_local2 then
			f50_local5 = true
		end
	end
	return f50_local5
end

function CheckShowConfirmButton( f51_arg0, f51_arg1 )
	local f51_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f51_arg0 )
	local f51_local1 = true
	if f51_local0.reg_email == nil or #f51_local0.reg_email == 0 or f51_local0.reg_password == nil or #f51_local0.reg_password == 0 or f51_local0.reg_password_confirm == nil or #f51_local0.reg_password_confirm == 0 or f51_local0.reg_tos_confirm == nil or f51_local0.reg_tos_confirm == 0 or f51_local0.reg_pp_confirm == nil or f51_local0.reg_pp_confirm == 0 then
		f51_local1 = false
	end
	return f51_local1
end

function ContinueRegister( f52_arg0, f52_arg1 )
	if (CheckShowConfirmButton( f52_arg0, f52_arg1 ) or false) == false then
		return 
	end
	local f52_local0 = false
	if RegisterConfirm( f52_arg0, f52_arg1, true ) == true then
		LUI.FlowManager.RequestPopupMenu( f52_arg0, "cod_anywhere_email_confirm_popup", true, f52_arg1.controller, false, {
			reg_menu = f52_arg0
		} )
	end
end

function RegisterConfirm( f53_arg0, f53_arg1, f53_arg2 )
	local f53_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f53_arg0 )
	local f53_local1 = {
		[#f53_local1 + 1] = VerifyEmail( f53_arg0, f53_arg1, f53_local0.reg_email, false ),
		[#f53_local1 + 1] = VerifyPassword( f53_arg0, f53_arg1, f53_local0.reg_password, false ),
		[#f53_local1 + 1] = VerifyConfirmPassword( f53_arg0, f53_arg1, f53_local0.reg_password_confirm, false )
	}
	if not f53_arg2 and not VerifyDoB( f53_arg0, f53_arg1, f53_local0.reg_dob_year, false ) then
		Engine.SetCODAccountDebounce( f53_arg1.controller )
		LUI.FlowManager.RequestLeaveMenu( f53_arg0 )
		LUI.FlowManager.RequestAddMenu( f53_arg0, "cod_anywhere_unavailable_popup", true, f53_arg1.controller )
		return 
	elseif #f53_local1 ~= 0 then
		local f53_local2 = ""
		for f53_local3 = 1, #f53_local1, 1 do
			f53_local2 = f53_local2 .. f53_local1[f53_local3]
			if f53_local3 < #f53_local1 then
				f53_local2 = f53_local2 .. ",\n"
			end
		end
		LUI.FlowManager.RequestAddMenu( f53_arg0, "cod_anywhere_entry_error_popup", true, f53_arg1.controller, false, {
			extraMessage = f53_local2
		} )
	else
		if f53_arg2 == true then
			return true
		end
		local f53_local2 = f53_local0.reg_dob_month
		if f53_local0.reg_dob_month < 10 then
			f53_local2 = "0" .. f53_local0.reg_dob_month
		end
		local f53_local3 = f53_local0.reg_dob_day
		if f53_local0.reg_dob_day < 10 then
			f53_local3 = "0" .. f53_local0.reg_dob_day
		end
		local f53_local4 = f53_local0.reg_dob_year .. "-" .. f53_local2 .. "-" .. f53_local3
		local f53_local5 = RegistrationDefaults.country_list[f53_local0.reg_country].code
		local f53_local6 = nil
		if f53_local0.reg_subscribe == 1 then
			f53_local6 = true
		else
			f53_local6 = false
		end
		CoDAnywhere.StartAccountCreation( f53_arg1.controller, f53_local0.reg_email, f53_local6, f53_local4, f53_local5, f53_local0.reg_password )
		LUI.ComScore.LogCreateAccount( f53_arg1.controller, f53_local6 )
	end
end

local f0_local14 = {
	reg_country = 1,
	reg_email = "",
	reg_password = "",
	reg_password_confirm = "",
	reg_dob_month = 1,
	reg_dob_day = 1,
	reg_dob_year = 2000,
	reg_subscribe = 0,
	reg_tos_confirm = 0,
	reg_pp_confirm = 0,
	is_leap_year = true,
	min_year = 1900,
	max_year = Engine.GetCurrentYear(),
	country_list = {
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_US",
			code = "US"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_AU",
			code = "AU"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_AT",
			code = "AT"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_BE",
			code = "BE"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_BR",
			code = "BR"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_CA",
			code = "CA"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_CZ",
			code = "CZ"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_DK",
			code = "DK"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_FI",
			code = "FI"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_FR",
			code = "FR"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_DE",
			code = "DE"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_GR",
			code = "GR"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_HU",
			code = "HU"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_IE",
			code = "IE"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_IT",
			code = "IT"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_MX",
			code = "MX"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_NL",
			code = "NL"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_NZ",
			code = "NZ"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_NO",
			code = "NO"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_PL",
			code = "PL"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_PT",
			code = "PT"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_ES",
			code = "ES"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_SE",
			code = "SE"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_CH",
			code = "CH"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_GB",
			code = "GB"
		},
		{
			display_string = "@LUA_MENU_CODA_COUNTRY_JP",
			code = "JP"
		}
	},
	month_list = {
		"@LUA_MENU_CODA_REGISTER_MONTH_1",
		"@LUA_MENU_CODA_REGISTER_MONTH_2",
		"@LUA_MENU_CODA_REGISTER_MONTH_3",
		"@LUA_MENU_CODA_REGISTER_MONTH_4",
		"@LUA_MENU_CODA_REGISTER_MONTH_5",
		"@LUA_MENU_CODA_REGISTER_MONTH_6",
		"@LUA_MENU_CODA_REGISTER_MONTH_7",
		"@LUA_MENU_CODA_REGISTER_MONTH_8",
		"@LUA_MENU_CODA_REGISTER_MONTH_9",
		"@LUA_MENU_CODA_REGISTER_MONTH_10",
		"@LUA_MENU_CODA_REGISTER_MONTH_11",
		"@LUA_MENU_CODA_REGISTER_MONTH_12"
	},
	month_days = {
		31,
		28,
		31,
		30,
		31,
		30,
		31,
		31,
		30,
		31,
		30,
		31
	}
}
local f0_local15 = {}
local f0_local16 = Engine.Localize( "LUA_MENU_YES" )
local f0_local17 = Engine.Localize( "LUA_MENU_NO" )
f0_local14.subscribe_list = f0_local16
RegistrationDefaults = f0_local14
DefaultButtonStates = {
	default = {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = CoD.DesignGridHelper( 14 ),
		top = 0,
		bottom = GenericButtonSettings.Styles.GradientButton.height
	}
}
ButtonDefaults = {
	content_width = 300,
	content_margin = 20,
	text_padding_with_content = 32
}
DefaultIconState = {
	default = {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 4,
		width = 24,
		height = 24,
		material = RegisterMaterial( "icon_new" ),
		alpha = 0
	},
	show = {
		alpha = 1
	}
}
DefaultIconHandlers = {
	show_problem_icon = function ( f54_arg0, f54_arg1, f54_arg2 )
		if f54_arg1.id == f54_arg0.id then
			f54_arg0:animateToState( "show", 0 )
		end
	end,
	hide_problem_icon = function ( f55_arg0, f55_arg1, f55_arg2 )
		if f55_arg1.id == f55_arg0.id then
			f55_arg0:animateToState( "default", 0 )
		end
	end
}
f0_local14 = function ( f56_arg0 )
	for f56_local0 = 1, #RegistrationDefaults.country_list, 1 do
		if f56_arg0 == RegistrationDefaults.country_list[f56_local0] then
			return f56_local0
		end
	end
	return 1
end

function cod_anywhere_entry_error_popup( f57_arg0, f57_arg1 )
	local f57_local0 = Engine.Localize( "@LUA_MENU_CODA_REGISTER_ENTRY_ERROR" )
	local f57_local1 = LUI.FlowManager.GetMenuScopedDataByMenuName( "cod_anywhere_entry_error_popup" )
	if f57_local1 and f57_local1.extraMessage then
		f57_local0 = Engine.MarkLocalized( f57_local0 .. "\n" .. Engine.Localize( f57_local1.extraMessage ) )
	end
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		cancel_will_close = false,
		popup_title = Engine.Localize( "@MENU_ERROR" ),
		message_text = f57_local0,
		button_text = Engine.Localize( "@LUA_MENU_CONTINUE" )
	} )
end

LUI.CODAnywhere.ShowProblemIcon = function ( f58_arg0, f58_arg1 )
	f58_arg0:dispatchEventToRoot( {
		name = "show_problem_icon",
		id = "coda_" .. f58_arg1 .. "_icon"
	} )
end

LUI.CODAnywhere.HideProblemIcon = function ( f59_arg0, f59_arg1 )
	f59_arg0:dispatchEventToRoot( {
		name = "hide_problem_icon",
		id = "coda_" .. f59_arg1 .. "_icon"
	} )
end

LUI.CODAnywhere.AddButtonEnd = function ( f60_arg0, f60_arg1 )
	local f60_local0 = LUI.MenuBuilder.BuildAddChild( f60_arg1, {
		type = "UIImage",
		states = DefaultIconState,
		handlers = DefaultIconHandlers
	} )
	f60_local0.id = f60_arg1.id .. "_icon"
	f60_arg1.menu = f60_arg0
	f60_arg0.list.buttonCount = f60_arg0.list.buttonCount + 1
end

LUI.CODAnywhere.AddInputButton = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3, f61_arg4, f61_arg5, f61_arg6 )
	local f61_local0 = LUI.MenuBuilder.BuildAddChild
	local f61_local1 = f61_arg0.list
	local f61_local2 = {
		type = "UIGenericButton",
		id = "coda_" .. f61_arg1,
		states = DefaultButtonStates
	}
	local f61_local3 = {
		variant = GenericButtonSettings.Variants.Input,
		button_text = Engine.Localize( f61_arg2 ),
		desc_text = Engine.Localize( f61_arg3 ),
		content_width = ButtonDefaults.content_width,
		content_margin = ButtonDefaults.content_margin,
		text_padding_with_content = ButtonDefaults.text_padding_with_content,
		text_padding_focus_with_content = ButtonDefaults.text_padding_with_content,
		field_edited_func = f61_arg4,
		text_alignment = LUI.Alignment.Center,
		field_name = Engine.Localize( f61_arg5 ),
		password_field = f61_arg6
	}
	local f61_local4
	if f61_arg6 then
		f61_local4 = CoD.KeyboardInputTypes.Password
		if not f61_local4 then
		
		else
			f61_local3.keyboard_type = f61_local4
			f61_local2.properties = f61_local3
			f61_arg0:AddButtonEnd( f61_local0( f61_local1, f61_local2 ) )
		end
	end
	f61_local4 = CoD.KeyboardInputTypes.Normal
end

LUI.CODAnywhere.AddSelectButton = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4, f62_arg5, f62_arg6 )
	f62_arg0:AddButtonEnd( LUI.MenuBuilder.BuildAddChild( f62_arg0.list, {
		type = "UIGenericButton",
		id = "coda_" .. f62_arg1,
		states = DefaultButtonStates,
		properties = {
			variant = GenericButtonSettings.Variants.Select,
			button_text = Engine.Localize( f62_arg2 ),
			desc_text = Engine.Localize( f62_arg3 ),
			content_width = ButtonDefaults.content_width,
			content_margin = ButtonDefaults.content_margin,
			text_padding_with_content = ButtonDefaults.text_padding_with_content,
			text_padding_focus_with_content = ButtonDefaults.text_padding_with_content,
			button_display_func = f62_arg4,
			button_left_func = function ( f63_arg0, f63_arg1 )
				return f62_arg5( f63_arg0, f63_arg1, f62_arg0.exclusiveController )
			end,
			button_right_func = function ( f64_arg0, f64_arg1 )
				return f62_arg6( f64_arg0, f64_arg1, f62_arg0.exclusiveController )
			end
		}
	} ) )
end

LUI.CODAnywhere.AddInfoButton = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4, f65_arg5, f65_arg6, f65_arg7, f65_arg8, f65_arg9 )
	f65_arg0:AddButtonEnd( LUI.MenuBuilder.BuildAddChild( f65_arg0.list, {
		type = "UIGenericButton",
		id = "coda_" .. f65_arg1,
		states = DefaultButtonStates,
		properties = {
			variant = GenericButtonSettings.Variants.Info,
			button_text = Engine.Localize( f65_arg2 ),
			desc_text = Engine.Localize( f65_arg3 ),
			content_width = ButtonDefaults.content_width,
			content_margin = ButtonDefaults.content_margin,
			text_padding_with_content = ButtonDefaults.text_padding_with_content,
			text_padding_focus_with_content = ButtonDefaults.text_padding_with_content,
			button_display_func = f65_arg4,
			button_action_func = f65_arg5,
			text_alignment = LUI.Alignment.Center,
			field_name = Engine.Localize( f65_arg6 ),
			keyboard_type = f65_arg7,
			max_length = f65_arg8,
			additional_handlers = {
				text_input_complete = f65_arg9
			}
		}
	} ) )
end

LUI.CODAnywhere.AddCheckboxButton = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4, f66_arg5 )
	local f66_local0 = LUI.MenuBuilder.BuildAddChild( f66_arg0.list, {
		type = "UIGenericButton",
		id = "coda_" .. f66_arg1,
		states = DefaultButtonStates,
		properties = {
			variant = GenericButtonSettings.Variants.Checkbox,
			button_text = Engine.Localize( f66_arg2 ),
			desc_text = Engine.Localize( f66_arg3 ),
			content_width = ButtonDefaults.content_width,
			content_margin = ButtonDefaults.content_margin,
			text_padding_with_content = ButtonDefaults.text_padding_with_content,
			text_padding_focus_with_content = ButtonDefaults.text_padding_with_content,
			text_padding_without_content = ButtonDefaults.text_padding_with_content,
			text_padding_focus_without_content = ButtonDefaults.text_padding_with_content,
			button_action_func = f66_arg4
		}
	} )
	f66_arg0:AddButtonEnd( f66_local0 )
	f66_local0:processEvent( {
		name = "set_checked",
		checkBox = f66_arg5
	} )
end

LUI.CODAnywhere.AddButtons = function ( f67_arg0 )
	f67_arg0:AddSelectButton( "country", "@LUA_MENU_CODA_REGISTER_COUNTRY", "@LUA_MENU_CODA_REGISTER_COUNTRY_DESC", GetCountryText, CountryPrev, CountryNext )
	f67_arg0:AddInfoButton( "email", "@LUA_MENU_CODA_REGISTER_EMAIL", "@LUA_MENU_CODA_REGISTER_EMAIL_DESC", RegisterEmailDisplayChanged, RegisterEmailPopup, "@LUA_MENU_CODA_REGISTER_EMAIL_SYSTEM_DIALOG", CoD.KeyboardInputTypes.Email, 53, RegisterEmailChanged )
	f67_arg0:AddInputButton( "password", "@LUA_MENU_CODA_REGISTER_PASSWORD", "@LUA_MENU_CODA_REGISTER_PASSWORD_DESC", RegisterPasswordChanged, "@LUA_MENU_CODA_REGISTER_PASSWORD_SYSTEM_DIALOG", true )
	f67_arg0:AddInputButton( "confirm", "@LUA_MENU_CODA_REGISTER_PASS_CONFIRM", "@LUA_MENU_CODA_REGISTER_PASS_CONFIRM_DESC", RegisterConfirmPasswordChanged, "@LUA_MENU_CODA_REGISTER_PASS_CONFIRM_SYSTEM_DIALOG", true )
	f67_arg0:AddSpacing( 10 )
	f67_arg0:AddHeader( "LUA_MENU_CODA_REGISTER_DOB" )
	f67_arg0:AddSelectButton( "month", "@LUA_MENU_CODA_REGISTER_DOB_MONTH", "@LUA_MENU_CODA_REGISTER_DOB_MONTH_DESC", GetMonthText, MonthPrev, MonthNext )
	f67_arg0:AddSelectButton( "day", "@LUA_MENU_CODA_REGISTER_DOB_DAY", "@LUA_MENU_CODA_REGISTER_DOB_DAY_DESC", GetDayNum, DayPrev, DayNext )
	f67_arg0:AddSelectButton( "year", "@LUA_MENU_CODA_REGISTER_DOB_YEAR", "@LUA_MENU_CODA_REGISTER_DOB_YEAR_DESC", GetYearNum, YearPrev, YearNext )
	f67_arg0:AddSpacing( 10 )
	local f67_local0 = {
		text_padding_without_content = ButtonDefaults.text_padding_with_content,
		text_padding_focus_without_content = ButtonDefaults.text_padding_with_content
	}
	local f67_local1 = f67_arg0
	local f67_local2 = f67_arg0.AddCheckboxButton
	local f67_local3 = "subscribe"
	local f67_local4 = "@LUA_MENU_CODA_REGISTER_SUBSCRIBE"
	local f67_local5 = "@LUA_MENU_CODA_REGISTER_SUBSCRIBE_DESC"
	local f67_local6 = SubscribeChanged
	local f67_local7
	if RegistrationDefaults.reg_subscribe == 1 then
		f67_local7 = true
	else
		f67_local7 = false
	end
	f67_local2( f67_local1, f67_local3, f67_local4, f67_local5, f67_local6, f67_local7 )
	f67_arg0:AddSpacing( 10 )
	f67_arg0:AddButton( "@LUA_MENU_CODA_TOS", "TOS", nil, nil, nil, f67_local0 )
	f67_local1 = f67_arg0
	f67_local2 = f67_arg0.AddCheckboxButton
	f67_local3 = "accept_tos"
	f67_local4 = "@LUA_MENU_CODA_TOS_ACCEPT"
	f67_local5 = ""
	f67_local6 = AcceptTOSChanged
	f67_local7
	if RegistrationDefaults.reg_tos_confirm == 1 then
		f67_local7 = true
	else
		f67_local7 = false
	end
	f67_local2( f67_local1, f67_local3, f67_local4, f67_local5, f67_local6, f67_local7 )
	f67_local1 = f67_arg0
	f67_local2 = f67_arg0.AddCheckboxButton
	f67_local3 = "accept_pp"
	f67_local4 = "@LUA_MENU_CODA_PP_ACCEPT"
	f67_local5 = "@LUA_MENU_CODA_PP_ACCEPT_DESC"
	f67_local6 = AcceptPPChanged
	f67_local7
	if RegistrationDefaults.reg_pp_confirm == 1 then
		f67_local7 = true
	else
		f67_local7 = false
	end
	f67_local2( f67_local1, f67_local3, f67_local4, f67_local5, f67_local6, f67_local7 )
	f67_local2 = f67_arg0:AddButton( "@LUA_MENU_REGISTER_NOW", ContinueRegister, function ( f68_arg0, f68_arg1 )
		return not CheckShowConfirmButton( f68_arg0, f68_arg1 )
	end, nil, nil, f67_local0 )
	f67_local2:setDisabledRefreshRate( 100 )
	f67_arg0:CreateBottomDivider()
end

LUI.CODAnywhere.SetupScopedDefaults = function ( f69_arg0, f69_arg1 )
	local f69_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f69_arg0 )
	f69_local0.reg_country = RegistrationDefaults.reg_country
	f69_local0.reg_email = RegistrationDefaults.reg_email
	f69_local0.reg_password = RegistrationDefaults.reg_password
	f69_local0.reg_password_confirm = RegistrationDefaults.reg_password_confirm
	f69_local0.reg_dob_month = RegistrationDefaults.reg_dob_month
	f69_local0.reg_dob_day = RegistrationDefaults.reg_dob_day
	f69_local0.reg_dob_year = RegistrationDefaults.reg_dob_year
	f69_local0.reg_subscribe = RegistrationDefaults.reg_subscribe
	f69_local0.reg_tos_confirm = RegistrationDefaults.reg_tos_confirm
	f69_local0.reg_pp_confirm = RegistrationDefaults.reg_pp_confirm
	local f69_local1 = CoDAnywhere.GetAutofillData( f69_arg1 )
	f69_local0.reg_country = f0_local14( Engine.ToUpperCase( f69_local1.Country ) )
	f69_local0.reg_dob_month = f69_local1.Month
	f69_local0.reg_dob_day = f69_local1.Day
	f69_local0.reg_dob_year = f69_local1.Year
end

LUI.CODAnywhere.AddDescriptions = function ( f70_arg0 )
	local f70_local0 = CoD.TextSettings.Font18
	local f70_local1 = CoD.CreateState( CoD.DesignGridHelper( 16 ), 450, nil, nil, CoD.AnchorTypes.TopLeft )
	f70_local1.width = CoD.DesignGridHelper( 8 )
	f70_local1.height = f70_local0.Height
	f70_local1.font = f70_local0.Font
	f70_local1.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f70_local1.lineSpacingRatio = 0.3
	local self = LUI.UIText.new( f70_local1 )
	self:setText( Engine.Localize( "@LUA_MENU_CODA_REGISTER_RATINGS" ) )
	f70_arg0:addElement( self )
	local f70_local3 = CoD.CreateState( CoD.DesignGridHelper( 16 ), LUI.MenuTemplate.ListTop - 30, nil, nil, CoD.AnchorTypes.TopLeft )
	f70_local3.width = CoD.DesignGridHelper( 8 )
	f70_local3.height = 350
	local self = LUI.UIElement.new( f70_local3 )
	f70_arg0:addElement( self )
	local f70_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f70_local5.alpha = 0.3
	f70_local5.color = {
		r = 0.2,
		b = 0.2,
		g = 0.2
	}
	self:addElement( LUI.UIImage.new( f70_local5 ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f70_local6 = CoD.TextSettings.Font21
	local f70_local7 = CoD.CreateState( 8, 8, -8, nil, CoD.AnchorTypes.TopLeftRight )
	f70_local7.height = f70_local6.Height
	f70_local7.font = f70_local6.Font
	f70_local7.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f70_local7.lineSpacingRatio = 0.3
	local self = LUI.UIText.new( f70_local7 )
	self:addElement( self )
	self:registerEventHandler( "set_button_info_text", function ( element, event )
		if event.text then
			element:setText( event.text )
		end
	end )
end

LUI.CODAnywhere.new = function ( f72_arg0, f72_arg1 )
	if not f72_arg1 then
		f72_arg1 = {}
	end
	local f72_local0 = f72_arg1.exclusiveController
	local f72_local1 = LUI.MenuTemplate.new( f72_arg0, {
		menu_top_indent = -30,
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CODA_REGISTER_TITLE" ) ),
		do_not_add_friends_helper = true,
		menu_width = CoD.DesignGridHelper( 14 )
	} )
	f72_local1:setClass( LUI.CODAnywhere )
	f72_local1:SetBreadCrumb( Engine.Localize( "@LUA_MENU_CODA_REGISTER_BREADCRUMB" ) )
	f72_local1:SetupScopedDefaults( f72_local0 )
	f72_local1:AddButtons()
	f72_local1:AddDescriptions()
	f72_local1:AddBackButton( function ( f73_arg0, f73_arg1 )
		LUI.FlowManager.RequestAddMenu( f73_arg0, "cod_anywhere_quit_confirm_popup", false, f73_arg1.controller, false )
	end )
	f72_local1:registerEventHandler( "open_cod_anywhere_error_popup", f0_local12 )
	f72_local1:registerEventHandler( "open_cod_anywhere_success_popup", f0_local13 )
	f72_local1:registerEventHandler( "cod_anywhere_start_registration", RegisterConfirm )
	f72_local1:registerEventHandler( "cod_anywhere_success_exit", MBh.LeaveMenu() )
	f72_local1:registerEventHandler( "leave_platform_screen", LeaveCoDAnywhereMenu )
	return f72_local1
end

LUI.MenuBuilder.registerPopupType( "cod_anywhere_unavailable_popup", cod_anywhere_unavailable_popup )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_all_done_popup_menu", f0_local10 )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_popup_menu", cod_anywhere_popup_menu )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_error_popup_menu", f0_local5 )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_working_popup_menu", cod_anywhere_working_popup_menu )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_success_popup_menu", f0_local7 )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_link_ucd_popup_menu", f0_local9 )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_quit_confirm_popup", cod_anywhere_quit_confirm_popup )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_sign_in_popup", cod_anywhere_sign_in_popup )
LUI.FlowManager.RegisterStackPushBehaviour( "cod_anywhere_sign_in_popup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "cod_anywhere_sign_in_popup", CoD.GameDVREnable )
LUI.MenuBuilder.registerType( "cod_anywhere_registration_menu", LUI.CODAnywhere.new )
LUI.FlowManager.RegisterStackPushBehaviour( "cod_anywhere_registration_menu", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "cod_anywhere_registration_menu", CoD.GameDVREnable )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_email_confirm_popup", f0_local11 )
LUI.FlowManager.RegisterStackPushBehaviour( "cod_anywhere_email_confirm_popup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "cod_anywhere_email_confirm_popup", CoD.GameDVREnable )
LUI.MenuBuilder.registerPopupType( "cod_anywhere_entry_error_popup", cod_anywhere_entry_error_popup )
LUI.FlowManager.RegisterStackPushBehaviour( "cod_anywhere_entry_error_popup", CoD.GameDVRDisable )
LUI.FlowManager.RegisterStackPopBehaviour( "cod_anywhere_entry_error_popup", CoD.GameDVREnable )
LockTable( _M )
