local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
partyEndedDialogHeight = 400
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.Localize( "@MENU_NOTICE" )
	local f1_local1 = Engine.Localize( Engine.GetDvarString( "partyend_reason" ) )
	f1_arg0:dispatchEventToChildren( {
		name = "update_title",
		title_text = f1_local0
	} )
	f1_arg0:dispatchEventToChildren( {
		name = "update_message",
		message_text = f1_local1
	} )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	Engine.ResolveError( f2_arg1.controller )
	Engine.ClearError( f2_arg1.controller )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		confirmation_action = f0_local1,
		dialog_top = -partyEndedDialogHeight / 2,
		dialog_bottom = partyEndedDialogHeight / 2
	} )
	f3_local0:registerEventHandler( "menu_create", f0_local0 )
	f3_local0:registerEventHandler( "menu_close", xlivePartyEndedClose )
	f3_local0:registerEventHandler( "popup_back", function ( element, event )
		if Engine.ClearCompletionResolve then
			Engine.ClearCompletionResolve()
		end
	end )
	return f3_local0
end

function CancelButton( f5_arg0, f5_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f5_arg0 )
end

function ResetWaitingForOnlineDataFetch( f6_arg0, f6_arg1 )
	SetWaitingForNetworkType( WaitingForNetworkType.None )
	Engine.SetDvarInt( "lui_waitingforonlinedatafetch_controller", 0 )
end

function CancelGettingOnlineData( f7_arg0, f7_arg1 )
	ResetWaitingForOnlineDataFetch( f7_arg0, f7_arg1 )
	LUI.common_menus.CommonPopups.CancelAcceptingInvite( f7_arg0, f7_arg1 )
end

function popup_gettingdata()
	local f8_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box_with_cancel", {
		message = Engine.Localize( "@MENU_POPUP_ONLINEDATA" ),
		cancel_func = CancelGettingOnlineData
	} )
	f8_local0.id = "popup_gettingdata_id"
	f8_local0:registerEventHandler( "menu_close", MBh.EmitEventToRoot( {
		name = "online_data_finished"
	} ) )
	return f8_local0
end

function popup_gettinglb()
	local f9_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@MENU_DOWNLOADING" ),
		cancel_func = CancelButton
	} )
	f9_local0.id = "popup_gettinglb_id"
	return f9_local0
end

function popup_getting_socialconfig()
	local f10_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@MENU_PLEASE_WAIT" )
	} )
	f10_local0.id = "popup_getting_socialconfig_id"
	return f10_local0
end

function ResetStatsConfirm( f11_arg0, f11_arg1 )
	Engine.ResetStatsConfirm( f11_arg1.controller )
end

function ResetStatsCancel( f12_arg0, f12_arg1 )
	Engine.ExecNow( "forcenosplitscreencontrol resetStats_Cancel", f12_arg1.controller )
	Engine.ResetStatsCancel( f12_arg1.controller )
end

function menu_resetstats_warning( f13_arg0, f13_arg1 )
	local f13_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.GetDvarString( "com_errorMessage" ),
		popup_title = Engine.GetDvarString( "com_errorTitle" ),
		yes_text = Engine.Localize( "@MENU_STATS_RESET_YES" ),
		no_text = Engine.Localize( "@MENU_STATS_RESET_NO" ),
		yes_action = ResetStatsConfirm,
		no_action = ResetStatsCancel
	} )
	f13_local0:registerEventHandler( "menu_create", ResetWaitingForOnlineDataFetch )
	return f13_local0
end

local f0_local3 = function ( f14_arg0, f14_arg1 )
	Engine.Exec( "downloadplaylist", f14_arg1.controller )
	if Engine.GetDvarBool( "virtualLobbyInFiringRange" ) then
		local f14_local0 = Engine.GetLuiRoot()
		f14_local0:dispatchEventToRoot( {
			name = "toggle_pause"
		} )
	end
end

local f0_local4 = function ( f15_arg0, f15_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		cancel_will_close = false,
		confirmation_action = f0_local3,
		dialog_top = -100,
		dialog_bottom = 100,
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MPUI_DOWNLOADPLAYLIST" ),
		button_text = Engine.Localize( "@MENU_OK" )
	} )
end

local f0_local5 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = Engine.GetDvarString( "com_errorTitle" )
	local f16_local1 = Engine.GetDvarString( "com_errorMessage" )
	f16_arg0:dispatchEventToChildren( {
		name = "update_title",
		title_text = f16_local0
	} )
	f16_arg0:dispatchEventToChildren( {
		name = "update_message",
		message_text = f16_local1
	} )
end

local f0_local6 = function ( f17_arg0, f17_arg1 )
	Engine.ClearError( f17_arg1.controller )
end

local f0_local7 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		confirmation_action = f0_local6
	} )
	f18_local0:registerEventHandler( "menu_create", f0_local5 )
	return f18_local0
end

local f0_local8 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = Engine.Localize( "@MENU_NOTICE" )
	local f19_local1 = Engine.Localize( "@MPUI_YOUAREHOST" )
	f19_arg0:dispatchEventToChildren( {
		name = "update_title",
		title_text = f19_local0
	} )
	f19_arg0:dispatchEventToChildren( {
		name = "update_message",
		message_text = f19_local1
	} )
end

local f0_local9 = function ( f20_arg0, f20_arg1 )
	
end

local f0_local10 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		confirmation_action = f0_local9
	} )
	f21_local0:registerEventHandler( "menu_create", f0_local8 )
	return f21_local0
end

local f0_local11 = function ( f22_arg0, f22_arg1 )
	
end

local f0_local12 = function ( f23_arg0, f23_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		title_text = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( Engine.GetDvarString( "party_makehosterrormsg" ) ),
		confirmation_action = f0_local11
	} )
end

local f0_local13 = function ( f24_arg0, f24_arg1 )
	Engine.Exec( "party_acceptinvite" )
end

local f0_local14 = function ( f25_arg0, f25_arg1 )
	
end

local f0_local15 = function ( f26_arg0, f26_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.GetDvarString( "party_invitequestion" ),
		popup_title = Engine.Localize( "@MPUI_PARTY_INVITE_TITLE" ),
		yes_text = Engine.Localize( "@MPUI_PARTY_INVITE_ACCEPT" ),
		no_text = Engine.Localize( "@MPUI_PARTY_INVITE_DECLINE" ),
		yes_action = f0_local13,
		no_action = f0_local14
	} )
end

function ShowSigninWarning( f27_arg0 )
	if Engine.GetSplitScreen() and not Engine.AllSplitscreenProfilesSignedIn() then
		return true
	elseif not Engine.GetSplitScreen() and Engine.OfflineProfileCanSave( f27_arg0 ) then
		return true
	else
		return false
	end
end

function ShowSaveWarning( f28_arg0 )
	if Engine.GetSplitScreen() and not Engine.AllSplitscreenProfilesCanSave() then
		return true
	elseif not Engine.GetSplitScreen() and not Engine.OfflineProfileCanSave( f28_arg0 ) then
		return true
	else
		return false
	end
end

function GetSaveWarningText( f29_arg0 )
	if ShowSigninWarning( f29_arg0 ) then
		return Engine.Localize( "@MENU_NO_SAVE_DEVICE_WARNING_MP" )
	elseif Engine.GetDvarBool( "ui_multiplayer" ) then
		return Engine.Localize( "@MENU_NO_SAVE_DEVICE_WARNING_MP" )
	else
		return Engine.UserWithoutOfflineProfile()
	end
end

function GetGuestSaveWarningText( f30_arg0 )
	if ShowSigninWarning( f30_arg0 ) then
		return Engine.Localize( "@MENU_NO_SIGNIN_WARNING_MP" )
	elseif Engine.GetDvarBool( "ui_multiplayer" ) then
		return Engine.Localize( "@MENU_NO_SIGNIN_WARNING_MP" )
	else
		return Engine.UserWithoutOfflineProfile()
	end
end

local f0_local16 = function ( f31_arg0, f31_arg1 )
	assert( f31_arg0.properties.exclusiveController )
	local f31_local0 = f31_arg0.properties.exclusiveController
	local f31_local1 = ""
	if ShowSigninWarning( f31_local0 ) or ShowSaveWarning( f31_local0 ) then
		if Engine.IsUserAGuest( f31_local0 ) or not Engine.IsUserSignedIn( f31_local0 ) then
			f31_local1 = GetGuestSaveWarningText( f31_local0 )
		else
			f31_local1 = GetSaveWarningText( f31_local0 )
		end
	end
	f31_arg0:dispatchEventToChildren( {
		name = "update_message",
		message_text = f31_local1
	} )
end

function SaveErrorContinue( f32_arg0, f32_arg1 )
	DebugPrint( "Save Error Continue" )
	if Engine.GetSplitScreen() then
		Engine.Exec( "endsplitscreensignin" )
		if Engine.GetDvarBool( "ui_multiplayer" ) then
			LUI.FlowManager.RequestAddMenu( f32_arg0, "menu_gamesetup_splitscreen", false, f32_arg1.controller, false, {} )
		else
			LUI.FlowManager.RequestAddMenu( f32_arg0, "menu_splitscreen_setup", false, f32_arg1.controller, false, {} )
		end
	else
		assert( f32_arg0.properties.callback_params.continue_to_menu )
		LUI.FlowManager.RequestAddMenu( f32_arg0, f32_arg0.properties.callback_params.continue_to_menu, false, f32_arg1.controller, true, {} )
	end
end

function SaveErrorReturn( f33_arg0, f33_arg1 )
	DebugPrint( "Save Error Cancel" )
	if Engine.GetSplitScreen() then
		Engine.ExecNow( "startsplitscreensignin" )
	end
end

function saveGameErrorAbort( f34_arg0, f34_arg1 )
	SaveErrorReturn( f34_arg0, f34_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f34_arg0, true )
end

function savegame_error_mp( f35_arg0, f35_arg1 )
	local f35_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_SAVE_ERROR_MP" ),
		popup_title = Engine.Localize( "@MENU_SAVE_ERROR_MP" ),
		yes_text = Engine.Localize( "@MENU_RESUMEGAME_NOSAVE_MP" ),
		no_text = Engine.Localize( "@MENU_RETURN_SIGNIN_MP" ),
		yes_action = SaveErrorContinue,
		no_action = SaveErrorReturn
	} )
	f35_local0:registerEventHandler( "menu_create", f0_local16 )
	f35_local0:registerEventHandler( "popup_back", function ( element, event )
		element.properties:no_action( event )
	end )
	f35_local0:registerEventHandler( "ss_controller_unplugged", saveGameErrorAbort )
	return f35_local0
end

function savegame_error_systemlink( f37_arg0, f37_arg1 )
	local f37_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_SAVE_ERROR_MP" ),
		popup_title = Engine.Localize( "@MENU_SAVE_ERROR_MP" ),
		yes_text = Engine.Localize( "@MENU_RESUMEGAME_NOSAVE_MP" ),
		no_text = Engine.Localize( "@PLATFORM_RESELECT_SAVE_DEVICE" ),
		yes_action = function ( f38_arg0, f38_arg1 )
			local f38_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "savegame_error_systemlink" )
			if f38_local0 and f38_local0.nextmenu then
				LUI.FlowManager.RequestAddMenu( f38_arg0, f38_local0.nextmenu, false, f38_arg1.controller, false, {} )
			end
		end,
		no_action = function ( f39_arg0, f39_arg1 )
			Engine.ForceSelectSaveDevice( f39_arg1.controller )
		end
	} )
	f37_local0:registerEventHandler( "menu_create", f0_local16 )
	f37_local0:registerEventHandler( "popup_back", function ( element, event )
		element.properties:no_action( event )
	end )
	f37_local0:registerEventHandler( "ss_controller_unplugged", saveGameErrorAbort )
	return f37_local0
end

function MainChooseExeChildrenFeeder()
	local f41_local0 = {
		[#f41_local0 + 1] = {
			type = "UIText",
			id = "container_switch_to_sp_text",
			properties = {
				text = ""
			},
			states = {
				default = CoD.ColorizeState( Colors.white, {
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true,
					top = 40,
					left = 0,
					right = 0,
					height = CoD.TextSettings.PopupFont.Height + 30
				} )
			},
			children = {
				{
					type = "UIText",
					id = "switch_to_sp_text",
					properties = {
						text = Engine.Localize( "@MENU_SWITCH_TO_SINGLE_PLAYER" )
					},
					states = {
						default = CoD.ColorizeState( Colors.white, {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = true,
							top = 16,
							left = 12,
							right = -12,
							height = CoD.TextSettings.PopupFont.Height,
							font = CoD.TextSettings.PopupFont.Font,
							color = Colors.h1.light_grey,
							alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
							spacing = 6
						} )
					}
				}
			}
		},
		[#f41_local0 + 1] = {
			type = "UIGenericButton",
			id = "main_choose_sp_button",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@MENU_YES" ),
				button_action_func = function ( f42_arg0, f42_arg1 )
					local f42_local0 = function ( f43_arg0, f43_arg1 )
						Engine.StartSingleplayer( f43_arg1.controller )
					end
					
					if f42_arg0.properties.parent_popup then
						if f42_arg1 ~= nil then
							f42_arg1.name = "close_popup"
						end
						f42_arg0.properties.parent_popup:dispatchEventToChildren( f42_arg1 )
						f42_arg0:registerEventHandler( "popup_closed", f42_local0 )
					else
						f42_local0( f42_arg0, f42_arg1 )
					end
				end,
				fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
				parent_popup = nil
			}
		}
	}
	local f41_local1 = 6
	f41_local0[#f41_local0 + 1] = {
		type = "UIElement",
		id = "padding_before_button_1",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				left = 0,
				right = 0,
				height = f41_local1
			}
		}
	}
	f41_local0[#f41_local0 + 1] = {
		type = "UIGenericButton",
		id = "main_choose_cancel_button",
		listDefaultFocus = true,
		properties = {
			style = GenericButtonSettings.Styles.GlassButton,
			substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
			button_text = Engine.Localize( "@LUA_MENU_CANCEL" ),
			button_action_func = function ( f44_arg0, f44_arg1 )
				local f44_local0 = function ( f45_arg0, f45_arg1 )
					LUI.FlowManager.RequestLeaveMenu( f45_arg0 )
				end
				
				if f44_arg0.properties.parent_popup then
					if f44_arg1 ~= nil then
						f44_arg1.name = "close_popup"
					end
					f44_arg0.properties.parent_popup:dispatchEventToChildren( f44_arg1 )
					f44_arg0:registerEventHandler( "popup_closed", f44_local0 )
				else
					f44_local0( f44_arg0, f44_arg1 )
				end
			end,
			fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
			parent_popup = nil
		}
	}
	if not Engine.IsConsoleGame() then
		f41_local0[#f41_local0 + 1] = {
			type = "UIElement",
			id = "padding_before_button_2",
			states = {
				default = {
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true,
					top = 0,
					left = 0,
					right = 0,
					height = f41_local1
				}
			}
		}
		f41_local0[#f41_local0 + 1] = {
			type = "UIGenericButton",
			id = "main_choose_exit_button",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@LUA_MENU_EXIT_GAME" ),
				button_action_func = function ( f46_arg0, f46_arg1 )
					LUI.FlowManager.RequestAddMenu( f46_arg0, "quit_popmenu", false, f46_arg1.controller, false )
				end,
				fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
				parent_popup = nil
			}
		}
	end
	return f41_local0
end

function main_choose_exe_popup_menu()
	return {
		type = "generic_selectionList_popup",
		id = "main_choose_exe_popup_menu_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			popup_childfeeder = MainChooseExeChildrenFeeder
		},
		handlers = {
			menu_close = function ( f48_arg0, f48_arg1 )
				Engine.Exec( "forcesplitscreencontrol closeChooseExe" )
			end
			
		}
	}
end

function AcceptInviteWarningConfirm( f49_arg0, f49_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f49_arg0, nil )
	Engine.ExecNow( "confirmInvite" )
end

function AcceptInviteWarningCancel( f50_arg0, f50_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f50_arg0, nil )
	if Engine.IsXB3() or Engine.IsPCApp() then
		Friends.DeclineLivePartyInvitation( f50_arg1.controller )
	end
end

function acceptinvite_warning( f51_arg0, f51_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_LEAVEPARTYWARNING" ),
		popup_title = Engine.Localize( "@MENU_ACCEPTINVITETITLE" ),
		yes_text = Engine.Localize( "@MENU_CONFIRMINVITE" ),
		no_text = Engine.Localize( "@MENU_RESUMEGAME" ),
		yes_action = AcceptInviteWarningConfirm,
		no_action = AcceptInviteWarningCancel
	} )
end

function user_generated_content_restriction_popup( f52_arg0, f52_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@GAME_WARNING" ),
		message_text = Engine.Localize( "@LUA_MENU_USER_CONTENT_RESTRICTIONS" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function CancelJoinInProgressWithPassword( f53_arg0, f53_arg1 )
	Engine.SetOnlineGame( false )
	Engine.SetSystemLink( false )
	Engine.Exec( "stopListening" )
	Engine.Exec( "useonlinestats 0" )
	Engine.Exec( "statsdownloadcancel" )
	Engine.Exec( "xstopparty PASSWORD_POPUP_CANCELED_ACTION" )
	Engine.Exec( "xstopprivateparty" )
	Engine.Exec( "xcancelconnectingdialog" )
	Engine.Exec( "resetautoconnect" )
	LUI.FlowManager.RequestSetStack( f53_arg0, {
		{
			name = "mp_main_menu"
		}
	} )
	LUI.FlowManager.RequestLeaveMenu( f53_arg0 )
end

function jip_with_password()
	local self = LUI.UIElement.new()
	self.id = "jip_with_password_id"
	self:registerEventHandler( "menu_create", function ( element, event )
		Engine.SetDvarString( "privateMatch_joinPassword", "" )
		Engine.OpenScreenKeyboard( 0, Engine.Localize( "MENU_PASSWORD_SYSTEM_DIALOG" ), "", Lobby.PasswordLength, false, false, CoD.KeyboardInputTypes.Password, true )
	end )
	self:registerEventHandler( "text_input_complete", function ( element, event )
		if not event.text or event.text == "" then
			CancelJoinInProgressWithPassword( element, event )
		else
			Engine.SetDvarString( "privateMatch_joinPassword", event.text )
			Engine.Exec( "xjoinpasswordparty" )
			LUI.FlowManager.RequestLeaveMenu( element )
		end
	end )
	return self
end

function OnPopupThrottlingMoveToLobby( f57_arg0, f57_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f57_arg0, nil )
	f57_arg0:dispatchEventToRoot( {
		name = "find_match_after_throttle",
		controller = f57_arg0.properties.exclusiveController
	} )
end

function popup_throttling()
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true
	} )
	self.id = "popup_throttling_id"
	self:registerEventHandler( "move_to_lobby", OnPopupThrottlingMoveToLobby )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@MENU_PLEASE_WAIT" )
	} ) )
	local self = LUI.UITimer.new( Engine.GetDvarInt( "lb_throttle_time" ) * 1000, "move_to_lobby", nil, false )
	self.id = "move_to_lobby_id"
	self:addElement( self )
	return self
end

function mp_reputation_warning_popup( f59_arg0, f59_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@LUA_MP_FRONTEND_XB3_LOW_REP_WARNING" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function mp_damaged_content_popup( f60_arg0, f60_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_XENON_DAMAGED_DLC" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function popup_mp_cac_warning( f61_arg0, f61_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function mp_no_guest_popup( f62_arg0, f62_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MENU_NO_GUEST" )
	} )
end

if Engine.IsPS3() then
	function mp_wrong_controller_popup( f63_arg0, f63_arg1 )
		return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@PLATFORM_USECONTROLLER1" )
		} )
	end
	
end
function popup_reset_game_options( f64_arg0, f64_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "LUA_MENU_RESET_OPTIONS" ),
		popup_title = Engine.Localize( "LUA_MENU_SET_DEFAULT_CONTROLS" ),
		no_action = function ( f65_arg0, f65_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f65_arg0 )
		end
		,
		yes_action = function ( f66_arg0, f66_arg1 )
			LoadMatchRules()
			f66_arg0:dispatchEventToRoot( {
				name = "rules_reset",
				immediate = true
			} )
		end
		
	} )
end

function goto_store( f67_arg0, f67_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@LUA_MENU_GOTO_STORE" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_text = Engine.Localize( "@MENU_NO" ),
		yes_action = function ( f68_arg0, f68_arg1 )
			if Engine.UserIsGuest( f68_arg1.controller ) then
				LUI.FlowManager.RequestAddMenu( f68_arg0, "store_noguests_error", false, controller, false )
			elseif not Engine.GetOnlineGame() then
				LUI.FlowManager.RequestAddMenu( f68_arg0, "store_live_error", false, controller, false )
			else
				Engine.ExecNow( "uploadstats", f68_arg1.controller )
				local f68_local0 = Engine.GetLuiRoot()
				local f68_local1 = LUI.FlowManager.IsInStack( f68_local0.flowManager, "menu_xboxlive_privatelobby" )
				local f68_local2 = LUI.FlowManager.IsInStack( f68_local0.flowManager, "menu_xboxlive_lobby" )
				Engine.ExecNow( "forcesplitscreencontrol goToStore" )
				if f68_local1 or f68_local2 then
					f68_arg1.execNow = true
					LUI.mp_menus.mpLobbyWidgets.leaveLobbyAndPartyYesActionWithExitLobby( f68_arg0, f68_arg1 )
				end
				LUI.FlowManager.RequestRestoreMenu( nil, "menu_xboxlive" )
				Sns.OpenStoreMenu( f68_arg1.controller, LUI.ComScore.ScreenID.CaC, LUI.ComScore.StoreSource.DlcLoot, false, f68_arg0.properties.callback_params.dlcName )
			end
		end
		,
		no_action = function ( f69_arg0, f69_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f69_arg0 )
		end
		
	} )
end

function goto_store_leave_lobby( f70_arg0, f70_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@LUA_MENU_GOTO_STORE_LEAVE_LOBBY" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_text = Engine.Localize( "@MENU_NO" ),
		yes_action = function ( f71_arg0, f71_arg1 )
			if Engine.UserIsGuest( f71_arg1.controller ) then
				LUI.FlowManager.RequestAddMenu( f71_arg0, "store_noguests_error", false, controller, false )
			elseif not Engine.GetOnlineGame() then
				LUI.FlowManager.RequestAddMenu( f71_arg0, "store_live_error", false, controller, false )
			else
				Engine.ExecNow( "uploadstats", f71_arg1.controller )
				local f71_local0 = Engine.GetLuiRoot()
				local f71_local1 = LUI.FlowManager.IsInStack( f71_local0.flowManager, "menu_xboxlive_privatelobby" )
				local f71_local2 = LUI.FlowManager.IsInStack( f71_local0.flowManager, "menu_xboxlive_lobby" )
				Engine.ExecNow( "forcesplitscreencontrol goToStore" )
				if f71_local1 or f71_local2 then
					f71_arg1.execNow = true
					LUI.mp_menus.mpLobbyWidgets.leaveLobbyAndPartyYesActionWithExitLobby( f71_arg0, f71_arg1 )
				end
				LUI.FlowManager.RequestRestoreMenu( nil, "menu_xboxlive" )
				Sns.OpenStoreMenu( f71_arg1.controller, LUI.ComScore.ScreenID.CaC, LUI.ComScore.StoreSource.DlcLoot, false, f71_arg0.properties.callback_params.dlcName )
			end
		end
		,
		no_action = function ( f72_arg0, f72_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f72_arg0 )
		end
		
	} )
end

function OnFindPlayerPurchasesMoveToStore( f73_arg0, f73_arg1 )
	if Store.FoundPlayerPurchases() == true then
		LUI.FlowManager.RequestLeaveMenu( f73_arg0, nil )
		LUI.FlowManager.RequestAddMenu( f73_arg0, "store_main", true, controller, replaceTop, f73_arg0.properties.storeData )
	end
end

function finding_player_purchases( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "finding_player_purchases_id"
	self:registerEventHandler( "menu_create", function ( element, event )
		Store.FindPlayerPurchases( event.controller )
	end )
	self:registerEventHandler( "move_to_store", OnFindPlayerPurchasesMoveToStore )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box_with_cancel", {
		message = Engine.Localize( "@MENU_PLEASE_WAIT" ),
		cancel_func = MBh.LeaveMenu()
	} ) )
	local self = LUI.UITimer.new( 1000, "move_to_store", nil, false )
	self.id = "move_to_store_id"
	self:addElement( self )
	return self
end

function preorder_offer( f76_arg0, f76_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@LUA_MENU_PREORDER_OFFER" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_text = Engine.Localize( "@MENU_NO" ),
		yes_action = function ( f77_arg0, f77_arg1 )
			Engine.Exec( "showPreOrder" )
		end
		,
		no_action = function ( f78_arg0, f78_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f78_arg0 )
		end
		
	} )
end

function popup_confirm_report( f79_arg0, f79_arg1 )
	local f79_local0 = {
		popup_title = Engine.Localize( "@MENU_NOTICE" )
	}
	if f79_arg1 then
		local f79_local1 = f79_arg1.message_text
		local f79_local2 = f79_arg1.message_text
	end
	f79_local0.message_text = f79_local1 and f79_local2 or ""
	f79_local0.dialog_top = -100
	f79_local0.dialog_bottom = 100
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", f79_local0 )
end

function ReportPopupFeeder( f80_arg0 )
	local f80_local0 = {
		{
			text = "@MENU_REPORT_OFFENSIVE",
			confirmationString = "@MENU_REPORT_OFFENSIVE_SUBMIT",
			offense = Friends.Constants.reportOffensiveLobbyPlayer
		},
		{
			text = "@MENU_REPORT_EXPLOITING",
			confirmationString = "@MENU_REPORT_EXPLOITING_SUBMIT",
			offense = Friends.Constants.reportExploitingLobbyPlayer
		},
		{
			text = "@MENU_REPORT_CHEATING",
			confirmationString = "@MENU_REPORT_CHEATING_SUBMIT",
			offense = Friends.Constants.reportCheatingLobbyPlayer
		},
		{
			text = "@MENU_REPORT_BOOSTING",
			confirmationString = "@MENU_REPORT_BOOSTING_SUBMIT",
			offense = Friends.Constants.reportBoostingLobbyPlayer
		},
		{
			text = "@MENU_REPORT_EMBLEM",
			confirmationString = "@MENU_REPORT_EMBLEM_SUBMIT",
			offense = Friends.Constants.reportEmblemLobbyPlayer
		}
	}
	local f80_local1 = {}
	local f80_local2 = Engine.EmblemsEnabled()
	for f80_local6, f80_local7 in ipairs( f80_local0 ) do
		if f80_local2 or f80_local7.text ~= "@MENU_REPORT_EMBLEM" then
			f80_local1[#f80_local1 + 1] = {
				type = "UIGenericButton",
				id = "offense_" .. f80_local6,
				properties = {
					style = GenericButtonSettings.Styles.GlassButton,
					substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
					button_text = Engine.Localize( f80_local7.text ),
					button_action_func = function ( f81_arg0, f81_arg1 )
						LUI.FlowManager.RequestLeaveMenu( f81_arg0, nil, nil, nil, true )
						f80_arg0.reportFunction( f81_arg1.controller, f80_local7.offense )
						f80_arg0.confirmationAction( f81_arg0, f81_arg1, Engine.Localize( f80_local7.confirmationString ) )
					end
				}
			}
		end
	end
	return f80_local1
end

function popup_friend_report()
	return {
		type = "generic_selectionList_popup",
		id = "popup_friend_report",
		properties = {
			popup_title = Engine.Localize( "@MENU_REPORT_PLAYER" ),
			popup_childfeeder = ReportPopupFeeder,
			friendIndex = 0,
			confirmationAction = function ( f83_arg0, f83_arg1, f83_arg2 )
				LUI.FlowManager.RequestAddMenu( f83_arg0, "popup_confirm_report", true, controller, false, {
					message_text = f83_arg2
				} )
			end
			,
			additional_handlers = {
				kill_friends_list = MBh.LeaveMenu()
			},
			muteAction = true
		},
		audio = {
			no_button_action = true
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = 0,
				top = 0,
				bottom = 0
			}
		}
	}
end

function OnPopupLoadingContentCheckContent( f84_arg0, f84_arg1 )
	if f84_arg0.finished then
		return 
	elseif Engine.Content_IsEnumerationDone() then
		f84_arg0.finished = true
		LUI.FlowManager.RequestLeaveMenu( f84_arg0 )
		f84_arg0:dispatchEventToRoot( {
			name = "content_load_done"
		} )
	end
end

function popup_loading_content()
	local self = LUI.UIElement.new()
	self.id = "popup_loading_content_id"
	self:registerEventHandler( "check_content", OnPopupLoadingContentCheckContent )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@MENU_LOADING_DOTS" )
	} ) )
	local self = LUI.UITimer.new( 250, "check_content", nil, false )
	self.id = "content_timer_id"
	self:addElement( self )
	return self
end

function uwp_update_required( f86_arg0, f86_arg1 )
	local f86_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@PLATFORM_UWP_UPDATE_REQUIRED_DESC" ),
		button_text = Engine.Localize( "@PLATFORM_UWP_UPDATE_REQUIRED_BUTTON" ),
		confirmation_action = Engine.StartStorePage,
		cancel_will_close = false
	} )
	f86_local0.id = "uwp_update_required"
	return f86_local0
end

function onPopupFabricatingComplete( f87_arg0, f87_arg1 )
	if f87_arg1.inventoryTaskType ~= LUI.InventoryUtils.TaskType.INV_TASK_PURCHASE_ITEM or f87_arg1.inventoryEventType ~= LUI.InventoryUtils.EventType.ELUIInventoryEvent_TaskCompleted then
		return 
	end
	LUI.FlowManager.RequestLeaveMenu( f87_arg0, nil )
	local f87_local0 = nil
	local f87_local1 = f87_arg0.properties.exclusiveController
	if f87_arg1.success then
		InvalidateItemSets()
		f87_local0 = GetCollectionForItem( f87_arg0.properties.guid )
		LUI.ComScore.LogCraftItem( f87_local1, f87_local0, f87_arg0.properties.guid )
	end
	if not CollectionRewardsEnabled() or f87_local0 == nil or not f87_local0.completed then
		f87_arg0:dispatchEventToRoot( {
			name = "on_crafted_item",
			controller = f87_local1,
			success = f87_arg1.success
		} )
	end
	if f87_arg1.success then
		local f87_local2 = f87_arg0.properties.parentMenu
		CollectionRewardQueueAdd( f87_local2, f87_local0 )
		local f87_local3 = GetSeasonForItem( f87_local0.setReward.guid )
		if f87_local3.rewardData ~= nil then
			CollectionRewardQueueAdd( f87_local2, f87_local3.rewardData )
		end
		ProcessCollectionRewardQueue( f87_local2, nil )
	end
end

function popup_fabricating_item( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true
	} )
	self.id = "popup_fabricating_item_id"
	self:registerEventHandler( "inventory", onPopupFabricatingComplete )
	local f88_local1 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@DEPOT_FABRICATE_ITEM" )
	} )
	self:addElement( f88_local1 )
	self:addElement( f88_local1 )
	return self
end

function onPopupPurchasingBundleComplete( f89_arg0, f89_arg1 )
	if f89_arg1.inventoryTaskType ~= LUI.InventoryUtils.TaskType.INV_TASK_PURCHASE_ITEM or f89_arg1.inventoryEventType ~= LUI.InventoryUtils.EventType.ELUIInventoryEvent_TaskCompleted then
		return 
	else
		LUI.FlowManager.RequestLeaveMenu( f89_arg0, nil )
		f89_arg0:dispatchEventToRoot( {
			name = "on_purchased_bundle",
			controller = f89_arg0.properties.exclusiveController,
			success = f89_arg1.success
		} )
	end
end

function popup_purchasing_bundle( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true
	} )
	self.id = "popup_purchasing_bundle_id"
	self:registerEventHandler( "inventory", onPopupPurchasingBundleComplete )
	local f90_local1 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@DEPOT_PURCHASING_BUNDLE" )
	} )
	self:addElement( f90_local1 )
	self:addElement( f90_local1 )
	return self
end

LUI.MenuBuilder.registerPopupType( "downloadingplaylist", f0_local4 )
LUI.MenuBuilder.registerPopupType( "menu_resetstats_warning", menu_resetstats_warning )
LUI.MenuBuilder.registerPopupType( "popup_gettingdata", popup_gettingdata )
LUI.MenuBuilder.registerPopupType( "popup_gettinglb", popup_gettinglb )
LUI.MenuBuilder.registerPopupType( "popup_getting_socialconfig", popup_getting_socialconfig )
LUI.MenuBuilder.registerPopupType( "menu_xboxlive_partyended", f0_local2 )
LUI.MenuBuilder.registerPopupType( "error_popmenu_lobby", f0_local7 )
LUI.MenuBuilder.registerPopupType( "youarehost", f0_local10 )
LUI.MenuBuilder.registerPopupType( "partyinviteconfirm", f0_local15 )
LUI.MenuBuilder.registerPopupType( "makehostfailed", f0_local12 )
LUI.MenuBuilder.registerPopupType( "savegame_error_mp", savegame_error_mp )
LUI.MenuBuilder.registerPopupType( "savegame_error_systemlink", savegame_error_systemlink )
LUI.MenuBuilder.registerDef( "main_choose_exe_popup_menu", main_choose_exe_popup_menu )
LUI.MenuBuilder.registerPopupType( "acceptinvite_warning", acceptinvite_warning )
LUI.MenuBuilder.registerPopupType( "user_generated_content_restriction_popup", user_generated_content_restriction_popup )
LUI.MenuBuilder.registerPopupType( "mp_damaged_content_popup", mp_damaged_content_popup )
LUI.MenuBuilder.registerPopupType( "mp_no_guest_popup", mp_no_guest_popup )
if Engine.IsPS3() then
	LUI.MenuBuilder.registerPopupType( "mp_wrong_controller_popup", mp_wrong_controller_popup )
end
LUI.MenuBuilder.registerType( "jip_with_password", jip_with_password )
LUI.MenuBuilder.registerPopupType( "popup_throttling", popup_throttling, nil, true )
LUI.MenuBuilder.registerPopupType( "popup_mp_cac_warning", popup_mp_cac_warning )
LUI.MenuBuilder.registerPopupType( "goto_store", goto_store )
LUI.MenuBuilder.registerPopupType( "goto_store_leave_lobby", goto_store_leave_lobby )
LUI.MenuBuilder.registerPopupType( "popup_reset_game_options", popup_reset_game_options )
LUI.MenuBuilder.registerPopupType( "mp_reputation_warning_popup", mp_reputation_warning_popup, nil, true )
LUI.MenuBuilder.registerPopupType( "finding_player_purchases", finding_player_purchases )
LUI.MenuBuilder.registerPopupType( "preorder_offer", preorder_offer )
LUI.MenuBuilder.registerDef( "popup_friend_report", popup_friend_report )
LUI.MenuBuilder.registerPopupType( "popup_confirm_report", popup_confirm_report )
LUI.MenuBuilder.registerPopupType( "popup_loading_content", popup_loading_content )
LUI.MenuBuilder.registerPopupType( "uwp_update_required", uwp_update_required )
LUI.MenuBuilder.registerPopupType( "popup_fabricating_item", popup_fabricating_item )
LUI.MenuBuilder.registerPopupType( "popup_purchasing_bundle", popup_purchasing_bundle )
LockTable( _M )
