local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 512
function readingsavedevice()
	local f1_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "@PLATFORM_READING_SAVE_DEVICE" )
	} )
	f1_local0.id = "readingsavedevice_id"
	f1_local0:registerEventHandler( "menu_close", MBh.EmitEventToRoot( {
		name = "finish_read_device"
	} ) )
	return f1_local0
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetDvarString( "com_errorTitle" )
	local f2_local1 = Engine.GetDvarString( "com_errorMessage" )
	local f2_local2 = Engine.GetDvarString( "lui_fullErrorDesc" )
	local f2_local3 = {
		name = "update_title",
		title_text = f2_local0
	}
	local f2_local4 = {
		name = "update_message",
		message_text = f2_local1
	}
	f2_arg0:dispatchEventToChildren( f2_local3 )
	f2_arg0:dispatchEventToChildren( f2_local4 )
	if f2_local2 and f2_local2 ~= "" then
		local f2_local5 = 600
		local f2_local6 = (1280 - f2_local5) / 2
		local f2_local7 = CoD.CreateState( f2_local6, 400, f2_local6 + f2_local5, 630, CoD.AnchorTypes.TopLeft )
		f2_local7.alpha = 0.8
		f2_local7.color = Colors.black
		local self = LUI.UIImage.new( f2_local7 )
		f2_arg0:addElement( self )
		local f2_local9 = CoD.CreateState( 3, 3, -3, 18, CoD.AnchorTypes.TopLeftRight )
		f2_local9.font = CoD.TextSettings.BodyFont.Font
		local self = LUI.UIText.new( f2_local9 )
		self:setText( string.sub( f2_local2, 1, f0_local0 - 2 ) )
		self:addElement( self )
		Engine.SetDvarString( "lui_fullErrorDesc", "" )
	end
end

f0_local2 = function ()
	if Engine.GetDvarBool( "lui_exitOnResolve" ) == true then
		Engine.Exit()
		return 
	else
		Engine.ClearError( Engine.GetFirstActiveController() )
	end
end

function errorPopupClosePlus( f4_arg0, f4_arg1 )
	if Engine.ShowPSPlusUpsell then
		Engine.ShowPSPlusUpsell( f4_arg1.controller )
	end
end

function error_popmenu( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup" )
	f5_local0:registerEventHandler( "menu_create", f0_local1 )
	f5_local0.id = "error_popup_id"
	return f5_local0
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	DebugPrint( "RESTARTING GAME" )
	Engine.SystemRestart( "" )
end

function ccs_need_restart( f7_arg0, f7_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		cancel_will_close = false,
		popup_title = Engine.Localize( "@MENU_CCS_RESTART_CONFIRMATION_TITLE" ),
		message_text = Engine.Localize( "@MENU_CCS_RESTART_CONFIRMATION_TEXT" ),
		button_text = Engine.Localize( "@MENU_CCS_RESTART_BUTTON_LABEL" ),
		confirmation_action = f0_local3
	} )
end

local f0_local4 = function ( f8_arg0, f8_arg1 )
	DebugPrint( "RESTARTING GAME" )
	Engine.SystemRestart( "" )
end

function ccs_fail_need_restart( f9_arg0, f9_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		cancel_will_close = false,
		popup_title = Engine.Localize( "@MENU_CCS_RESTART_CONFIRMATION_TITLE" ),
		message_text = Engine.Localize( "@MENU_CCS_FAILURE_RESTART_CONFIRMATION_TEXT" ),
		button_text = Engine.Localize( "@MENU_CCS_RESTART_BUTTON_LABEL" ),
		confirmation_action = f0_local3
	} )
end

function CancelCSSDownload( f10_arg0, f10_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f10_arg0, f10_arg1 )
	local f10_local0 = Engine.GetLuiRoot()
	if f10_local0 then
		f10_local0:processEvent( {
			name = "CancelPatching"
		} )
	end
end

function ccs_is_downloading( f11_arg0, f11_arg1 )
	local f11_local0 = {
		message_text = Engine.Localize( "@MENU_CCS_DOWNLOAD_IN_PROGRESS" ),
		isCCS = true,
		isLiveWithCancel = not Engine.IsMultiplayer()
	}
	local f11_local1
	if not Engine.IsMultiplayer() then
		f11_local1 = CancelCSSDownload
		if not f11_local1 then
		
		else
			f11_local0.cancel_func = f11_local1
			return LUI.MenuBuilder.BuildRegisteredType( "waiting_popup", f11_local0 )
		end
	end
	f11_local1 = nil
end

function error_popmenu_party( f12_arg0, f12_arg1 )
	local f12_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup" )
	f12_local0:registerEventHandler( "menu_create", f0_local1 )
	f12_local0.id = "error_popmenu_party_id"
	return f12_local0
end

function error_popmenu_psplus_party( f13_arg0, f13_arg1 )
	local f13_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		confirmation_action = errorPopupClosePlus
	} )
	f13_local0:registerEventHandler( "menu_create", f0_local1 )
	f13_local0.id = "error_popmenu_party_plus_id"
	return f13_local0
end

local f0_local5 = function ( f14_arg0, f14_arg1 )
	DebugPrint( "QUIT GAME NOW" )
	Engine.Quit()
end

function quit_popmenu( f15_arg0, f15_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MENU_QUIT_WARNING" ),
		yes_action = f0_local5
	} )
end

function error_popmenu_submenu( f16_arg0, f16_arg1 )
	local f16_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup" )
	f16_local0:registerEventHandler( "menu_create", f0_local1 )
	f16_local0.id = "error_popmenu_submenu_id"
	return f16_local0
end

local f0_local6 = function ( f17_arg0, f17_arg1 )
	Engine.Exec( "xsignin", f17_arg1.controller )
end

local f0_local7 = function ( f18_arg0, f18_arg1 )
	LUI.FlowManager.RequestAddMenu( f18_arg0, "boot_brightness", false, f18_arg1.controller, true, {} )
end

local f0_local8 = function ( f19_arg0, f19_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@MENU_SP_PROFILE_WARNING_SP" ),
		yes_action = f0_local6,
		no_action = f0_local7,
		cancel_action = yes_action,
		cancel_means_no = false,
		default_focus_index = 1
	} )
end

local f0_local9 = function ( f20_arg0, f20_arg1 )
	Engine.DeleteSave( f20_arg1.controller )
end

local f0_local10 = function ( f21_arg0, f21_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		cancel_will_close = false,
		popup_title = Engine.Localize( "@MENU_CORRUPT_SAVEDATA_TITLE" ),
		message_text = Engine.Localize( "@MENU_CORRUPT_SAVEDATA_MESSAGE" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = f0_local9
	} )
end

local f0_local11 = function ( f22_arg0, f22_arg1 )
	Engine.RetrySaveData( f22_arg1.controller )
end

local f0_local12 = function ( f23_arg0, f23_arg1 )
	Engine.ClearSaveDataErrors( f23_arg1.controller )
end

local f0_local13 = function ( f24_arg0, f24_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_SAVEDATA_FAILED_TITLE" ),
		message_text = Engine.Localize( "@MENU_SAVEDATA_FAILED_MESSAGE" ),
		yes_action = f0_local11,
		no_action = f0_local12
	} )
end

local f0_local14 = function ( f25_arg0, f25_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@LUA_MENU_PROFILE_FORCE_SP" ),
		button_text = Engine.Localize( "@MENU_OK" )
	} )
end

local f0_local15 = function ( f26_arg0, f26_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@MENU_THROTTLE_ERROR" ),
		button_text = Engine.Localize( "@MENU_OK" )
	} )
end

function live_party_invite_popmenu( f27_arg0, f27_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE" ),
		yes_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE_ACCEPT_NOW" ),
		yes_action = function ( f28_arg0, f28_arg1 )
			Friends.AcceptLivePartyInvitation( f28_arg1.controller )
		end
		,
		no_text = Engine.Localize( "@LUA_MENU_DECLINE" ),
		no_action = function ( f29_arg0, f29_arg1 )
			Friends.DeclineLivePartyInvitation( f29_arg1.controller )
		end
		
	} )
end

function live_party_streaming_incomplete_popmenu( f30_arg0, f30_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@PLATFORM_STREAMING_IN_PROGRESS" ),
		button_text = Engine.Localize( "@MENU_OK" )
	} )
end

function sign_in_as_sub_or_guest( f31_arg0, f31_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_SIGN_IN_GUEST_OR_SUB_TITLE" ),
		message_text = Engine.Localize( "@MENU_SIGN_IN_GUEST_OR_SUB_TEXT" ),
		yes_text = Engine.Localize( "@MENU_SIGN_IN_GUEST_OR_SUB_YES" ),
		yes_action = function ( f32_arg0, f32_arg1 )
			Lobby.DoSubSignIn( f32_arg1.controller )
		end
		,
		no_text = Engine.Localize( "@MENU_SIGN_IN_GUEST_OR_SUB_NO" ),
		no_action = function ( f33_arg0, f33_arg1 )
			Lobby.DoGuestSignIn( f33_arg1.controller )
		end
		
	} )
end

function CancelAcceptingInvite( f34_arg0, f34_arg1 )
	local f34_local0 = f34_arg1.controller
	Engine.SetOnlineGame( false )
	Engine.SetSystemLink( false )
	Engine.SetDvarBool( "specialops", false )
	Engine.SetDvarBool( "so_survival", false )
	Engine.Exec( "stopPrivateListen", f34_local0 )
	Engine.Exec( "coopStopSearch", f34_local0 )
	Engine.Exec( "useonlinestats 0", f34_local0 )
	Engine.Exec( "statsdownloadcancel", f34_local0 )
	Engine.Exec( "xstopparty WAITING_POPUP_CANCELED_ACTION", f34_local0 )
	Engine.Exec( "xstopprivateparty", f34_local0 )
	Engine.Exec( "xcancelconnectingdialog", f34_local0 )
	Engine.Exec( "forcesplitscreencontrol WAITING_POPUP_CANCELED_ACTION", f34_local0 )
	LUI.FlowManager.RequestLeaveMenu( f34_arg0 )
end

function OnAcceptingInviteCreate( f35_arg0, f35_arg1 )
	if AAR ~= nil then
		AAR.ClearAAR()
	end
end

function popup_acceptinginvite( f36_arg0, f36_arg1 )
	local f36_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box_with_cancel", {
		message = Engine.Localize( "@MENU_POPUP_ACCEPTINVITE" ),
		cancel_func = CancelAcceptingInvite
	} )
	f36_local0.id = "popup_acceptinginvite_id"
	f36_local0:registerEventHandler( "menu_create", OnAcceptingInviteCreate )
	return f36_local0
end

function UpdateTextDots( f37_arg0, f37_arg1 )
	assert( f37_arg0.properties.numDots )
	assert( f37_arg0.properties.message )
	local f37_local0 = f37_arg0.properties.numDots
	local f37_local1 = f37_arg0.properties.message
	f37_local0 = (f37_local0 + 1) % 12
	for f37_local2 = 1, f37_local0, 1 do
		local f37_local5 = f37_local2
		f37_local1 = f37_local1 .. ". "
	end
	f37_arg0:setText( f37_local1 )
	f37_arg0.properties.numDots = f37_local0
end

function CreateDot( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
	local f38_local0 = f38_arg1 / 1.25
	local f38_local1 = f38_arg0 / 1.25
	local f38_local2 = 2
	local f38_local3 = 1
	local f38_local4 = MBh.AnimateSequence( {
		{
			"state0",
			0 / f38_local3
		},
		{
			"state1",
			150 / f38_local3,
			true,
			true
		},
		{
			"state2",
			100 / f38_local3,
			true,
			true
		},
		{
			"state3",
			800 / f38_local3,
			true,
			true
		}
	} )
	local f38_local5 = CoD.CreateState( f38_local1 - f38_local2, f38_local0 - f38_local2, f38_local1 + f38_local2, f38_local0 + f38_local2, CoD.AnchorTypes.None )
	f38_local5.material = RegisterMaterial( "widg_loading_circle" )
	f38_local5.alpha = 0
	local self = LUI.UIImage.new( f38_local5 )
	self:registerAnimationState( "state0", {
		alpha = 0,
		scale = -1
	} )
	self:registerAnimationState( "state1", {
		alpha = 1,
		scale = 0.6
	} )
	self:registerAnimationState( "state2", {
		alpha = 1,
		scale = 0
	} )
	self:registerAnimationState( "state3", {
		alpha = 0,
		scale = 0
	} )
	self:registerEventHandler( f38_arg2, f38_local4 )
	return self
end

function loading_animation_widget()
	local f39_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f39_local0.height = LoadingAnimationDims.Height
	f39_local0.width = LoadingAnimationDims.Width
	f39_local0.material = RegisterMaterial( CoD.Material.LoadingAnim )
	f39_local0.alpha = 1
	return LUI.UIImage.new( f39_local0 )
end

function OnAnimateArrow( f40_arg0, f40_arg1 )
	f40_arg0.tick = f40_arg0.tick or 0
	local f40_local0 = f40_arg0:getParent()
	f40_local0:processEvent( {
		name = "tick_" .. f40_arg0.tick
	} )
	f40_arg0.tick = (f40_arg0.tick + 1) % 12
	f40_arg0.tick = f40_arg0.tick and 0 or f40_arg0.tick
end

function live_dialog_processing_widget( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local self = LUI.UIElement.new( CoD.CreateState( -15, -15, 15, 15, CoD.AnchorTypes.None ) )
	self:addElement( CreateDot( -16, 0, "tick_0" ) )
	self:addElement( CreateDot( -14, -8, "tick_1" ) )
	self:addElement( CreateDot( -8, -14, "tick_2" ) )
	self:addElement( CreateDot( 0, -16, "tick_3" ) )
	self:addElement( CreateDot( 8, -14, "tick_4" ) )
	self:addElement( CreateDot( 14, -8, "tick_5" ) )
	self:addElement( CreateDot( 16, 0, "tick_6" ) )
	self:addElement( CreateDot( 14, 8, "tick_7" ) )
	self:addElement( CreateDot( 8, 14, "tick_8" ) )
	self:addElement( CreateDot( 0, 16, "tick_9" ) )
	self:addElement( CreateDot( -8, 14, "tick_10" ) )
	self:addElement( CreateDot( -14, 8, "tick_11" ) )
	self:addElement( LUI.UITimer.new( 300 / 3, "anim_arrow", nil, false ) )
	local self = LUI.UIElement.new()
	self:registerEventHandler( "anim_arrow", OnAnimateArrow )
	self:addElement( self )
	self:addElement( self )
	return self
end

function live_dialog_popup_background()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_menu_background", {
		top_offset = 0,
		fill_alpha = 1,
		use_background_tint = true
	} ) )
	return self
end

function AddLiveDialogFooterHelperText( f43_arg0, f43_arg1 )
	local f43_local0 = Engine.IsConsoleGame()
	if not f43_local0 then
		f43_local0 = Engine.IsGamepadEnabled()
	end
	local f43_local1 = f43_arg1.footerOffset or 0
	local f43_local2 = nil
	if f43_local0 then
		f43_local2 = LUI.ButtonHelperText.helper_text_item( nil, Engine.Localize( "@LUA_MENU_CANCEL" ), ButtonMap.button_secondary, nil, nil )
	else
		f43_local2 = LUI.ButtonHelperText.helper_text_item( ButtonMap.button_secondary, Engine.Localize( "@LUA_MENU_CANCEL" ), nil, nil, nil )
	end
	f43_local2.triggers_event = "button_secondary"
	f43_local2.id = "popup_cancel_text_id"
	local f43_local3
	if f43_local0 then
		f43_local3 = 33
		if not f43_local3 then
		
		else
			local f43_local4 = f43_local2
			local f43_local5 = f43_local2.registerAnimationState
			local f43_local6 = "default"
			local f43_local7 = {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				left = -50,
				right = 50
			}
			local f43_local8 = Engine.IsCurrentGen() and -45 or -25
			local f43_local9 = f43_local8 + f43_local1
			f43_local7.bottom = f43_local8
			f43_local7.height = f43_local3
			f43_local5( f43_local4, f43_local6, f43_local7 )
			f43_local2:animateToState( "default" )
			f43_local2:registerEventHandler( "virtual_keyboard_popup_active", MBh.EmitEvent( "popup_active" ) )
			f43_arg0:addElement( f43_local2 )
		end
	end
	f43_local3 = CoD.TextSettings.BodyFont.Height
end

function OnIntermediateDialogGainFocus( f44_arg0, f44_arg1 )
	if f44_arg1.focusType ~= FocusType.MouseOver then
		f44_arg0:animateToState( "default" )
	end
end

function OnIntermediateDialogLostFocus( f45_arg0, f45_arg1 )
	if f45_arg1.focusType ~= FocusType.MouseOver then
		f45_arg0:animateToState( "hidden" )
	end
end

function OnPopupContainerReposition( f46_arg0, f46_arg1 )
	local f46_local0 = 10
	local f46_local1, f46_local2, f46_local3, f46_local4 = GetTextDimensions( f46_arg0.properties.message, CoD.TextSettings.BodyFont.Font, CoD.TextSettings.BodyFont.Height )
	local f46_local5 = f46_local3 - f46_local1
	local f46_local6 = LoadingAnimationDims.Width + f46_local0 + f46_local5
	local f46_local7 = f46_arg0:getChildById( "popup_text_id" )
	f46_local7:registerAnimationState( "updated", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -CoD.TextSettings.BodyFont.Height,
		bottom = 0,
		left = -1 * (f46_local6 * 0.5 - LoadingAnimationDims.Width + f46_local0),
		width = f46_local5 + f46_local0
	} )
	f46_local7:animateToState( "updated", 0 )
	local f46_local8 = f46_arg0:getChildById( "loading_animation_id" )
	f46_local8:registerAnimationState( "updated", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -f46_local6 * 0.5,
		height = LoadingAnimationDims.Height,
		width = LoadingAnimationDims.Width
	} )
	f46_local8:animateToState( "updated", 0 )
	f46_arg0:registerAnimationState( "updated", {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		width = f46_local6 + f46_local0 * 2,
		height = DialogPopupDims.Height
	} )
	f46_arg0:animateToState( "updated" )
end

function live_dialog_text_box_with_cancel( f47_arg0, f47_arg1 )
	f47_arg1.isLiveWithCancel = true
	f47_arg1.message_text = f47_arg1.message
	return LUI.MenuBuilder.BuildRegisteredType( "waiting_popup", f47_arg1 )
end

function live_dialog_text_box( f48_arg0, f48_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "waiting_popup", {
		isLive = true,
		message_text = f48_arg1.message
	} )
end

function popup_connecting( f49_arg0, f49_arg1 )
	local f49_local0 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box_with_cancel", {
		message = Engine.Localize( "@XBOXLIVE_POPUP_CONNECTION" ),
		cancel_func = LUI.common_menus.CommonPopups.CancelAcceptingInvite
	} )
	f49_local0.id = "popup_connecting_id"
	return f49_local0
end

local f0_local16 = function ( f50_arg0, f50_arg1 )
	local f50_local0 = Engine.Localize( "@MENU_NOTICE" )
	local f50_local1 = Engine.GetDvarString( "online_end_reason" )
	f50_arg0:dispatchEventToChildren( {
		name = "update_title",
		title_text = f50_local0
	} )
	f50_arg0:dispatchEventToChildren( {
		name = "update_message",
		message_text = f50_local1
	} )
end

local f0_local17 = function ( f51_arg0, f51_arg1 )
	Engine.ResolveError( f51_arg1.controller )
end

local f0_local18 = function ( f52_arg0, f52_arg1 )
	local f52_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		confirmation_action = f0_local17
	} )
	f52_local0:registerEventHandler( "menu_create", f0_local16 )
	return f52_local0
end

local f0_local19 = function ( f53_arg0, f53_arg1 )
	LUI.FlowManager.RequestCloseAllMenus( f53_arg0 )
	Engine.TogglePause()
	f53_arg0:dispatchEventToRoot( {
		name = "toggle_pause_off"
	} )
end

function save_and_quit_yes_action( f54_arg0, f54_arg1 )
	Engine.SendSPMatchData()
	Engine.FlashFade( 0, 0, 0, 255, 20 )
	LUI.FlowManager.RequestLeaveMenuByName( "save_game_info_hud" )
	LUI.FlowManager.RequestAddMenu( f54_arg0, "save_game_info_hud", true, f54_arg1.controller, false )
end

local f0_local20 = function ( f55_arg0, f55_arg1 )
	Engine.SendSPMatchData()
	LUI.FlowManager.RequestLeaveMenuByName( "save_game_info_hud" )
	LUI.FlowManager.RequestAddMenu( f55_arg0, "save_game_info_hud", true, f55_arg1.controller, false, {
		continueAfterSave = true
	} )
end

local f0_local21 = function ( f56_arg0, f56_arg1 )
	Engine.Exec( "disconnect" )
	Engine.SetDvarBool( "inpubliclobby", false )
	Engine.AcceptInvite()
end

local f0_local22 = function ( f57_arg0, f57_arg1 )
	if Engine.IsXB3() or Engine.IsPCApp() then
		Friends.DeclineLivePartyInvitation( f57_arg1.controller )
	end
	Engine.SaveRevert()
end

local f0_local23 = function ( f58_arg0, f58_arg1 )
	local f58_local0 = Engine.GetDvarBool( "sv_saveDeviceAvailable" )
	if not f58_local0 then
		f58_local0 = Engine.IsPS4()
	end
	if f58_local0 then
		LUI.FlowManager.RequestLeaveMenu( f58_arg0 )
	end
end

function SaveGameErrorCreate( f59_arg0, f59_arg1 )
	LUI.FlowManager.RequestLeaveMenuByName( "save_game_info_hud" )
	local f59_local0 = Engine.GetDvarBool( "sv_saveDeviceAvailable" )
	if not f59_local0 then
		f59_local0 = Engine.IsPS4()
	end
	if not f59_local0 then
		f59_arg0:addElement( LUI.UITimer.new( 200, "save_game_popup_tick" ) )
		f59_arg0:registerEventHandler( "save_game_popup_tick", f0_local23 )
	end
end

function SaveGameErrorFeeder( f60_arg0 )
	local f60_local0 = Engine.GetDvarBool( "sv_saveDeviceAvailable" )
	if not f60_local0 then
		f60_local0 = Engine.IsPS4()
	end
	local f60_local1 = Engine.GetDvarBool( "sv_saveGameAvailable" )
	local f60_local2 = {}
	local f60_local3 = ""
	if f60_local0 then
		if f60_local1 then
			f60_local3 = Engine.Localize( "@MENU_WARNING_CHECKPOINT_RESET" )
		elseif Engine.IsPS4() then
			f60_local3 = Engine.Localize( "@PLATFORM_SAVE_ERROR" )
		else
			f60_local3 = Engine.Localize( "@MENU_NO_SAVE_DEVICE_WARNING_NOW_OKAY" )
		end
	else
		f60_local3 = Engine.Localize( "@MENU_NO_SAVE_DEVICE_WARNING" )
	end
	f60_local2[#f60_local2 + 1] = {
		type = "UIText",
		id = "desc_text",
		states = {
			default = {
				font = CoD.TextSettings.BodyFont.Font,
				alignment = LUI.Alignment.Center,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 12,
				right = -12,
				top = 0,
				bottom = CoD.TextSettings.BodyFont.Height,
				red = 1,
				green = 1,
				blue = 1
			}
		},
		properties = {
			text = f60_local3
		}
	}
	local f60_local4 = ""
	if f60_local0 then
		if f60_local1 then
			f60_local4 = Engine.Localize( "@MENU_OVERWRITE_SAVE" )
		else
			f60_local4 = Engine.Localize( "@MENU_RETRY_SAVE" )
		end
	else
		f60_local4 = Engine.Localize( "@PLATFORM_SELECT_SAVE_DEVICE" )
	end
	f60_local2[#f60_local2 + 1] = {
		type = "UIGenericButton",
		id = "first_button",
		properties = {
			style = GenericButtonSettings.Styles.GlassButton,
			substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
			button_text = f60_local4,
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = function ( f61_arg0, f61_arg1 )
				if f60_local0 then
					if f60_local1 then
						Engine.DeleteSave( f61_arg1.controller )
					end
					f0_local20( f61_arg0, f61_arg1 )
				else
					Engine.ForceSelectSaveDevice( f61_arg1.controller )
					local f61_local0 = Engine.GetLuiRoot()
					if f61_local0 and not LUI.FlowManager.IsInStack( f61_local0.flowManager, "sp_pause_menu" ) then
						Engine.TogglePause( f61_arg0, f61_arg1 )
					end
				end
			end
		}
	}
	f60_local2[#f60_local2 + 1] = {
		type = "UIGenericButton",
		id = "resume_game_nosave",
		properties = {
			style = GenericButtonSettings.Styles.GlassButton,
			substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
			button_text = Engine.Localize( "@MENU_RESUMEGAME_NOSAVE" ),
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = function ( f62_arg0, f62_arg1 )
				f0_local19( f62_arg0, f62_arg1 )
				Engine.SaveRevert()
				Engine.FlashFade( 0, 0, 0, 0, 0 )
			end
		}
	}
	f60_local2[#f60_local2 + 1] = {
		type = "UIGenericButton",
		id = "quit_nosave",
		properties = {
			style = GenericButtonSettings.Styles.GlassButton,
			substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
			button_text = Engine.Localize( "@MENU_QUIT_NO_SAVE" ),
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = function ( f63_arg0, f63_arg1 )
				Engine.SaveRevert()
				LUI.FlowManager.RequestAddMenu( f63_arg0, "quit_confirm_popup", false, f63_arg1.controller, false )
			end
		}
	}
	if f60_local0 and not Engine.IsPS4() then
		f60_local2[#f60_local2 + 1] = {
			type = "UIGenericButton",
			id = "reselect_save_device",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@PLATFORM_RESELECT_SAVE_DEVICE" ),
				text_align_without_content = LUI.Alignment.Center,
				button_action_func = function ( f64_arg0, f64_arg1 )
					Engine.ForceSelectSaveDevice( f64_arg1.controller )
				end
			}
		}
	end
	return f60_local2
end

function save_game_error_popup()
	local f65_local0 = Engine.GetDvarBool( "sv_saveDeviceAvailable" )
	local f65_local1 = nil
	if f65_local0 then
		if Engine.IsPS4() then
			f65_local1 = Engine.Localize( "@MENU_ERROR" )
		else
			f65_local1 = Engine.Localize( "@PLATFORM_SAVE_ERROR_NOW_OKAY" )
		end
	else
		f65_local1 = Engine.Localize( "@PLATFORM_SAVE_ERROR" )
	end
	return {
		type = "generic_selectionList_popup",
		id = "save_game_error_popup_id",
		properties = {
			cancel_will_close = false,
			popup_title = f65_local1,
			popup_childfeeder = SaveGameErrorFeeder
		},
		handlers = {
			menu_create = SaveGameErrorCreate
		}
	}
end

function LostSelectedSaveDevicePopupConfirm( f66_arg0, f66_arg1 )
	Engine.Exec( "select_save_device" )
end

local f0_local24 = function ( f67_arg0, f67_arg1 )
	local f67_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		message_text = Engine.Localize( "@PLATFORM_SAVE_DEVICE_LOST" ),
		popup_title = Engine.Localize( "@MENU_WARNING" )
	} )
	f67_local0:registerEventHandler( "menu_close", LostSelectedSaveDevicePopupConfirm )
	return f67_local0
end

local f0_local25 = function ( f68_arg0, f68_arg1 )
	CoDAnywhere.IntegrateCACFile()
end

local f0_local26 = function ( f69_arg0, f69_arg1 )
	CoDAnywhere.DeleteCACFile()
end

function cac_elite_popup( f70_arg0, f70_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_COD_MOBILE_APP_DATA_TITLE" ),
		squadMembersChanged = 1,
		loadoutsChanged = 2,
		modifiedDay = 1,
		modifiedMonth = 10,
		modifiedYear = 2013,
		message_text = Engine.GetDvarString( "mobile_app_data_available" ),
		yes_action = f0_local25,
		no_action = f0_local26,
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_text = Engine.Localize( "@MENU_NO" )
	} )
end

function quitYesAction( f71_arg0, f71_arg1 )
	Engine.Exec( "disconnect" )
end

function quit_no_save_confirm_popup( f72_arg0, f72_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@PLATFORM_QUIT" ),
		message_text = Engine.Localize( "@MENU_QUIT_WARNING" ),
		yes_action = quitYesAction,
		yes_text = Engine.Localize( "@MENU_QUIT" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function quit_confirm_popup( f73_arg0, f73_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@PLATFORM_QUIT" ),
		message_text = Engine.Localize( "@MENU_ARE_YOU_SURE_QUIT" ),
		yes_action = quitYesAction,
		yes_text = Engine.Localize( "@MENU_QUIT" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function save_and_quit_confirm_popup( f74_arg0, f74_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_QUIT_WARNING" ),
		message_text = Engine.Localize( "@MENU_SAVEQUIT_TEXT" ),
		yes_action = save_and_quit_yes_action,
		yes_text = Engine.Localize( "@CGAME_CONTINUE_SAVING" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function save_and_quit_confirm_invited_popup( f75_arg0, f75_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_CONTINUE_SAVING" ),
		message_text = Engine.Localize( "@MENU_SAVEQUIT_TEXT" ),
		yes_action = save_and_quit_yes_action,
		no_action = f0_local21,
		yes_text = Engine.Localize( "@CGAME_CONTINUE_SAVING" ),
		no_text = Engine.Localize( "@MENU_CONTINUE_WITHOUT_SAVING" ),
		cancel_means_no = false,
		cancel_action = f0_local22
	} )
end

local f0_local27 = function ()
	return {
		type = "UIText",
		id = "save_game_loading_hud_id",
		properties = {
			text = Engine.Localize( "@CGAME_NOW_SAVING" ),
			textStyle = CoD.TextStyle.Shadowed
		},
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 80,
				bottom = 120,
				left = 0,
				right = 0,
				font = CoD.TextSettings.TitleFont.Font,
				alignment = LUI.Alignment.Center,
				red = 1,
				green = 1,
				blue = 1
			}
		}
	}
end

local f0_local28 = function ( f77_arg0, f77_arg1 )
	local f77_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f77_arg0 )
	if not f77_local0.continueAfterSave then
		Engine.FlashFade( 0, 0, 0, 255, 20 )
		Engine.SetSaveExecOnSuccess( "disconnect" )
		Engine.SetDvarBool( "ui_skipMainLockout", true )
	end
	Engine.SaveDelay()
	Engine.WriteSave()
end

local f0_local29 = function ( f78_arg0, f78_arg1 )
	if f78_arg1.doContinue then
		local f78_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f78_arg0 )
		if f78_local0.continueAfterSave then
			f0_local19( f78_arg0, f78_arg1 )
			return 
		end
	end
	if f78_arg1.finished then
		Engine.SaveComplete()
	end
end

local f0_local30 = function ()
	return {
		type = "UIElement",
		id = "save_game_info_hud_id",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				botomAnchor = true
			}
		},
		handlers = {
			menu_create = f0_local28,
			save_event = f0_local29
		},
		children = {
			{
				type = "UIOwnerdraw",
				id = "save_game_info_background",
				properties = {
					ownerDraw = CoD.Ownerdraw.CGMissionObjectiveBackdrop
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = true,
						rightAnchor = true,
						red = 0,
						green = 0,
						blue = 0,
						alpha = 0.5
					}
				}
			},
			{
				type = "UIText",
				id = "save_game_info_text",
				properties = {
					text = Engine.Localize( "@CGAME_NOW_SAVING" ),
					textStyle = CoD.TextStyle.Shadowed
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = 40,
						bottom = 60,
						left = CoD.HudStandards.borderX * 2,
						font = CoD.TextSettings.BodyFontBold18.Font,
						alignment = LUI.Alignment.Left,
						red = 1,
						green = 1,
						blue = 1
					}
				}
			}
		}
	}
end

function menu_ps3_ui_bg()
	return {
		type = "UIImage",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0,
				material = RegisterMaterial( "white" ),
				red = 0.1,
				green = 0.14,
				blue = 0.16,
				alpha = 0.85
			}
		}
	}
end

function controllerremoved_popmenu()
	if Engine.IsConsoleGame() then
		local f81_local0, f81_local1, f81_local2 = nil
		if Engine.IsXB3() == true then
			f81_local0 = "h1_deco_option_controller_x1"
			f81_local1 = 240
			f81_local2 = 308
		else
			f81_local0 = "h1_deco_option_controller_ps4"
			f81_local1 = 210
		end
		local f81_local3 = 155
		local f81_local4 = 330
		local f81_local5 = 35
		local f81_local6 = CoD.TextSettings.BodyFontSmall.Font
		local f81_local7 = CoD.TextSettings.BodyFontSmall.Height
		local f81_local8 = Engine.Localize( "@PLATFORM_CONTROLLER_DISCONNECTED" )
		local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ) )
		local f81_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
		f81_local10.material = RegisterMaterial( "white" )
		f81_local10.color = Colors.black
		f81_local10.alpha = 0.7
		self:addElement( LUI.UIImage.new( f81_local10 ) )
		local f81_local11 = CoD.CreateState( nil, -f81_local3, nil, nil, CoD.AnchorTypes.None )
		f81_local11.height = f81_local1
		f81_local11.width = f81_local4
		f81_local11.material = RegisterMaterial( f81_local0 )
		f81_local11.alpha = 0.75
		local self = LUI.UIImage.new( f81_local11 )
		self:addElement( self )
		if not Engine.IsPS4() then
			local f81_local13 = CoD.CreateState( -35, f81_local2, nil, nil, CoD.AnchorTypes.Top )
			f81_local13.height = 70
			f81_local13.width = 70
			f81_local13.material = RegisterMaterial( "h1_ui_icon_unlock_warning" )
			self:addElement( LUI.UIImage.new( f81_local13 ) )
		end
		local f81_local13 = CoD.CreateState( 3, f81_local1 + f81_local5, nil, nil, CoD.AnchorTypes.TopLeftRight )
		f81_local13.font = f81_local6
		f81_local13.height = f81_local7
		f81_local13.textAlignment = LUI.Alignment.Center
		local self = LUI.UIText.new( f81_local13 )
		self:setText( f81_local8 )
		self:addElement( self )
		self:setupFullWindowElement()
		return self
	else
		return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@PLATFORM_CONTROLLER_DISCONNECTED" ),
			button_text = Engine.Localize( "@MENU_CONTINUE" ),
			confirmation_action = function ( f82_arg0, f82_arg1 )
				Engine.ExecNow( "profile_toggleEnableGamepad 0" )
				Engine.ExecNow( "updategamerprofile" )
				f82_arg0:dispatchEventToRoot( {
					name = "toggle_enable_gamepad",
					dispatchChildren = true
				} )
				f82_arg0:dispatchEventToRoot( {
					name = "check_switch_to_azerty"
				} )
			end
			
		} )
	end
end

if not Engine.IsConsoleGame() then
	function steam_overlay_required( f83_arg0, f83_arg1 )
		return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@PLATFORM_UI_STEAM_OVERLAY_REQUIRED" )
		} )
	end
	
end
function ConfirmProfileChange( f84_arg0, f84_arg1 )
	DebugPrint( "Confirm profile change" )
	Engine.ConfirmXB3UserProfileChange( f84_arg1.controller )
end

function IgnoreProfileChange( f85_arg0, f85_arg1 )
	DebugPrint( "Ignore profile change" )
	Engine.IgnoreXB3UserProfileChange( f85_arg1.controller )
end

function user_changed_confirm_mp( f86_arg0, f86_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_PROFILE_PAIRING_CONFIRM" ),
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_text = Engine.Localize( "@MENU_NO" ),
		yes_action = IgnoreProfileChange,
		no_action = ConfirmProfileChange,
		default_focus_index = 1
	} )
end

function controller_changed_confirm_mp( f87_arg0, f87_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		message_text = Engine.Localize( "@PLATFORM_UI_CONTROLLER_PAIRING_CONFIRM" ),
		popup_title = Engine.Localize( "@MENU_WARNING" )
	} )
end

function recipe_load_failed_popup( f88_arg0, f88_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MPUI_RECIPE_LOAD_FAILED" )
	} )
end

function recipe_save_failed_popup( f89_arg0, f89_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MPUI_RECIPE_SAVE_FAILED" )
	} )
end

function recipe_save_failed_no_guests_popup( f90_arg0, f90_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MPUI_RULES_NOGUESTSAVE" )
	} )
end

function recipe_save_failed_no_device_popup( f91_arg0, f91_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MPUI_RULES_NOSAVEDEVICE" )
	} )
end

function ChooseLanguageOptions()
	local f92_local0 = {}
	local f92_local1 = Engine.GetSupportedLanguages()
	for f92_local2 = 1, #f92_local1, 1 do
		f92_local0[#f92_local0 + 1] = {
			type = "UIGenericButton",
			id = "language_button_" .. #f92_local0,
			listDefaultFocus = f92_local1[f92_local2].id == Engine.GetCurrentLanguage(),
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = f92_local1[f92_local2].name,
				language = f92_local1[f92_local2].id,
				button_action_func = function ( f93_arg0, f93_arg1 )
					if f93_arg0.properties.language ~= Engine.GetCurrentLanguage() then
						LUI.FlowManager.RequestAddMenu( f93_arg0, "choose_language_confirm_popup", false, f93_arg1.controller, true, {
							language = f93_arg0.properties.language
						} )
					else
						Engine.SetLanguage( f93_arg0.properties.language )
						LUI.FlowManager.RequestLeaveMenu( f93_arg0 )
						local f93_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f93_arg0 )
						if f93_local0 and f93_local0.callback ~= nil then
							f93_local0.callback()
						end
					end
				end
			}
		}
		if f92_local1[f92_local2].name == "Arabic" then
			local f92_local5 = f92_local0[#f92_local0]
			local f92_local6 = f92_local5.properties.substyle.height
			local f92_local7 = RegisterMaterial( "ui_language_arabic" )
			local f92_local8, f92_local9 = GetMaterialDimensions( f92_local7 )
			f92_local8 = f92_local6 * f92_local8 / f92_local9
			f92_local9 = f92_local6
			local f92_local10 = RegisterMaterial( "ui_language_arabic_focused" )
			local f92_local11, f92_local12 = GetMaterialDimensions( f92_local10 )
			f92_local11 = f92_local6 * f92_local11 / f92_local12
			f92_local12 = f92_local6
			f92_local5.properties.button_text = ""
			f92_local5.children = {
				{
					type = "UIImage",
					states = {
						default = {
							leftAnchor = false,
							topAnchor = false,
							rightAnchor = false,
							bottomAnchor = false,
							material = f92_local7,
							width = f92_local8,
							height = f92_local9
						},
						focused = {
							leftAnchor = false,
							topAnchor = false,
							rightAnchor = false,
							bottomAnchor = false,
							material = f92_local10,
							width = f92_local11,
							height = f92_local12
						}
					},
					handlers = {
						gain_focus = function ( f94_arg0 )
							f94_arg0:animateToState( "focused" )
						end,
						lose_focus = function ( f95_arg0 )
							f95_arg0:animateToState( "default" )
						end
					}
				}
			}
		end
	end
	return f92_local0
end

function choose_language_popup()
	return {
		type = "generic_selectionList_popup",
		id = "choose_language_popup_id",
		properties = {
			popup_title = Engine.Localize( "@LUA_MENU_CHOOSE_LANGUAGE" ),
			popup_childfeeder = ChooseLanguageOptions
		},
		handlers = {
			menu_create = function ( f97_arg0 )
				local f97_local0 = Engine.GetSupportedLanguages()
				for f97_local1 = 1, #f97_local0, 1 do
					if f97_local0[f97_local1].name == "Arabic" then
						local f97_local4 = f97_arg0:getFirstDescendentById( "generic_menu_titlebar_background_id" )
						local f97_local5 = CoD.TextSettings.TitleFontMediumLarge.Height
						local f97_local6 = RegisterMaterial( "ui_choose_language_arabic" )
						local f97_local7, f97_local8 = GetMaterialDimensions( f97_local6 )
						LUI.MenuBuilder.BuildAddChild( f97_local4, {
							type = "UIImage",
							states = {
								default = {
									leftAnchor = false,
									topAnchor = true,
									rightAnchor = true,
									bottomAnchor = false,
									material = f97_local6,
									width = f97_local5 * f97_local7 / f97_local8,
									height = f97_local5
								}
							}
						} )
						break
					end
				end
			end
			
		}
	}
end

local f0_local31 = function ( f98_arg0, f98_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_CONFIRM_LANGUAGE" ),
		button_text = Engine.Localize( "@MENU_CONTINUE" ),
		confirmation_action = function ( f99_arg0, f99_arg1 )
			local f99_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f99_arg0 )
			Engine.SetLanguage( f99_local0.language )
		end
		
	} )
end

local f0_local32 = function ( f100_arg0, f100_arg1 )
	local f100_local0 = Engine.GetLuiRoot()
	Engine.ExecNow( "profile_toggleEnableGamepad" )
	LUI.FlowManager.tryAddMouseCursor( f100_local0 )
	Engine.Exec( "updategamerprofile" )
	f100_arg0:dispatchEventToRoot( {
		name = "toggle_enable_gamepad",
		dispatchChildren = true
	} )
end

local f0_local33 = function ( f101_arg0, f101_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MENU_NO_CONTROLLER_INITIAL" ),
		yes_action = f0_local32
	} )
end

local f0_local34 = function ( f102_arg0, f102_arg1 )
	Engine.ExecNow( "profile_toggleEnableGamepad 1" )
	Engine.ExecNow( "updategamerprofile" )
	f102_arg0:dispatchEventToRoot( {
		name = "refresh_button_helper",
		dispatchChildren = true
	} )
	f102_arg0:dispatchEventToRoot( {
		name = "toggle_enable_gamepad",
		dispatchChildren = true
	} )
	f102_arg0:dispatchEventToRoot( {
		name = "check_switch_to_azerty"
	} )
end

local f0_local35 = function ( f103_arg0, f103_arg1 )
	Engine.ExecNow( "profile_toggleEnableGamepad 0" )
	Engine.ExecNow( "updategamerprofile" )
	f103_arg0:dispatchEventToRoot( {
		name = "toggle_enable_gamepad",
		dispatchChildren = true
	} )
	f103_arg0:dispatchEventToRoot( {
		name = "check_switch_to_azerty"
	} )
end

local f0_local36 = function ( f104_arg0, f104_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MENU_CONTROLLER_INITIAL" ),
		yes_action = f0_local34,
		no_action = f0_local35
	} )
end

local f0_local37 = function ()
	Engine.SetDvarBool( "cg_IsWarnedAZERTY", true )
end

local f0_local38 = function ()
	Engine.Exec( "exec default_smp_controls_azerty.cfg" )
	f0_local37()
end

local f0_local39 = function ()
	Engine.Exec( "exec default_smp_controls.cfg" )
end

local f0_local40 = function ( f108_arg0, f108_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_KEYBOARD_LAYOUT" ),
		message_text = Engine.Localize( "@LUA_MENU_KEYBOARD_LAYOUT_DESC1" ) .. "\n\n" .. Engine.Localize( "@LUA_MENU_KEYBOARD_LAYOUT_DESC2" ),
		yes_action = f0_local37,
		no_action = f0_local38,
		cancel_will_close = false,
		yes_text = Engine.Localize( "@LUA_MENU_QWERTY" ),
		no_text = Engine.Localize( "@LUA_MENU_AZERTY" )
	} )
end

local f0_local41 = function ( f109_arg0, f109_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_KEYBOARD_LAYOUT" ),
		message_text = Engine.Localize( "@LUA_MENU_KEYBOARD_LAYOUT_DESC1" ),
		yes_action = f0_local39,
		no_action = f0_local38,
		cancel_means_no = false,
		yes_text = Engine.Localize( "@LUA_MENU_QWERTY" ),
		no_text = Engine.Localize( "@LUA_MENU_AZERTY" )
	} )
end

function invertAxisAction( f110_arg0, f110_arg1 )
	if Engine.IsGamepadEnabled() == true then
		if Engine.GetProfileData( "invertedPitch" ) then
			Engine.ExecNow( "profile_toggleInvertedPitch 0", f110_arg1.controller )
		else
			Engine.ExecNow( "profile_toggleInvertedPitch 1", f110_arg1.controller )
		end
		Engine.Exec( "updategamerprofile" )
	elseif Engine.GetDvarBool( "ui_mousePitch" ) then
		Engine.SetDvarBool( "ui_mousePitch", false )
		Engine.SetDvarFloat( "m_pitch", MousePitchTable.PitchFloat )
	else
		Engine.SetDvarBool( "ui_mousePitch", true )
		Engine.SetDvarFloat( "m_pitch", -MousePitchTable.PitchFloat )
	end
	Engine.PopupClosed( f110_arg1.controller, "try_invert" )
end

function invertAxisCancelAction( f111_arg0, f111_arg1 )
	Engine.PopupClosed( f111_arg1.controller, "accept_normal" )
end

function invert_axis_popup( f112_arg0, f112_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@KILLHOUSE_AXIS_OPTION_MENU1_ALL" ),
		yes_action = invertAxisAction,
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_action = invertAxisCancelAction,
		no_text = Engine.Localize( "@MENU_NO" )
	} )
end

function invert_axis_confirm_popup( f113_arg0, f113_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@KILLHOUSE_AXIS_OPTION_MENU2_ALL" ),
		yes_action = invertAxisCancelAction,
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_action = invertAxisAction,
		no_text = Engine.Localize( "@MENU_NO" )
	} )
end

local f0_local42 = function ( f114_arg0, f114_arg1 )
	f114_arg0:setText( f114_arg1.message_text )
end

local f0_local43 = function ( f115_arg0, f115_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f115_arg0 )
	Engine.PopupClosed( f115_arg1.controller, "continue" )
end

local f0_local44 = function ( f116_arg0, f116_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f116_arg0 )
	Engine.PopupClosed( f116_arg1.controller, "try_again" )
end

function difficulty_fng_childfeeder( f117_arg0 )
	local f117_local0 = {}
	local self = LUI.UIElement.new()
	self.type = "difficulty_selection_menu_detailed"
	self.id = self.type .. "_container"
	local f117_local2 = nil
	if f117_arg0.subContainer then
		local subContainer = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		subContainer.id = self.type .. "_sub_container"
		self:addElement( subContainer )
		self.subContainer = subContainer
		
		f117_local2 = subContainer
	else
		f117_local2 = self
	end
	local self = nil
	if f117_arg0.scrollInSplitScreen and GameX.IsSplitscreen() then
		listState.bottom = listTop + 265
		self = LUI.UIScrollingVerticalList.new( listState, nil, {
			use_arrows = true,
			sendScrollEvents = true,
			autoScroll = LUI.AutoScroll.AnchoredEdges,
			autoScrollTime = 200
		} )
		self.id = self.type .. "_list"
		f117_local2:addElement( self )
	else
		self = LUI.UIVerticalList.build( nil, {
			defaultState = listState,
			noWrap = f117_arg0.listNoWrap
		} )
		self.id = self.type .. "_list"
		f117_local2:addElement( self )
	end
	self.buttonCount = 0
	self.list = self
	f117_local0[#f117_local0 + 1] = {
		type = "UIElement",
		id = "difficulty_info_text_wrapper_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = CoD.TextSettings.PopupFont.Height * 2,
				left = 12,
				right = -12
			}
		},
		children = {
			{
				type = "UIText",
				id = "difficulty_info_text_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 0,
						bottom = CoD.TextSettings.PopupFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.PopupFont.Font,
						color = Colors.h1.light_grey,
						alignment = LUI.AdjustAlignmentForLanguage( f117_arg0.message_text_alignment )
					}
				},
				handlers = {
					update_info_text = f0_local42
				}
			}
		}
	}
	for f117_local8, f117_local9 in pairs( CoD.DifficultyList ) do
		local f117_local10 = Engine.GetDvarInt( "recommended_gameskill" ) + 1
		local f117_local7 = f117_local9.text
		if f117_local10 == f117_local8 then
			f117_local7 = f117_local9.textRecommended
		end
		f117_local0[#f117_local0 + 1] = {
			type = "UIGenericButton",
			id = "difficulty_button_" .. f117_local8 .. "_id",
			listDefaultFocus = f117_local8 == f117_local10,
			audio = {
				button_over = CoD.SFX.SubMenuMouseOver
			},
			properties = {
				button_text = f117_local7,
				button_action_func = function ( f118_arg0, f118_arg1 )
					DebugPrint( "setting player 1 & 2 difficulty to " .. f117_local9.value )
					Engine.SetDvarInt( "g_gameskill_player_1", f117_local9.value )
					Engine.SetDvarInt( "g_gameskill_player_2", f117_local9.value )
					Engine.SetDvarInt( "g_gameskill", f117_local9.value )
					Engine.Exec( "profile_difficultySave " .. f117_local9.value )
					Engine.Exec( "updategamerprofile" )
					f0_local43( f118_arg0, f118_arg1 )
				end,
				text_align_without_content = LUI.Alignment.Center,
				fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
				parent_popup = nil,
				button_over_func = function ( f119_arg0, f119_arg1 )
					f119_arg0:dispatchEventToRoot( {
						name = "update_info_text",
						message_text = f117_local9.description
					} )
				end
			}
		}
	end
	subContainer = 10
	f117_local0[#f117_local0 + 1] = {
		type = "UIElement",
		id = "difficulty_try_again_separator_wrapper_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = subContainer,
				left = 0,
				right = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "difficulty_try_again_separator_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = subContainer / 2 - 3,
						bottom = subContainer / 2 + 2,
						left = 100,
						right = -100,
						material = RegisterMaterial( "h1_ui_divider_green" )
					}
				}
			}
		}
	}
	f117_local0[#f117_local0 + 1] = {
		type = "UIGenericButton",
		id = "difficulty_try_again_button_id",
		audio = {
			button_over = CoD.SFX.SubMenuMouseOver
		},
		properties = {
			button_text = Engine.Localize( "MENU_TRY_AGAIN" ),
			button_action_func = f0_local44,
			text_align_without_content = LUI.Alignment.Center,
			fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
			parent_popup = nil,
			button_over_func = function ( f120_arg0, f120_arg1 )
				f120_arg0:dispatchEventToRoot( {
					name = "update_info_text",
					message_text = Engine.Localize( "MENU_TRY_AGAIN_DESC" )
				} )
			end
		}
	}
	return f117_local0
end

function difficulty_selection_menu_fng( f121_arg0, f121_arg1 )
	if not f121_arg1 then
		f121_arg1 = {}
	end
	f121_arg1.message_text_alignment = LUI.Alignment.Center
	f121_arg1.popup_title = Engine.Localize( "MENU_SELECT_DIFFICULTY" )
	f121_arg1.message_text = Engine.Localize( "MENU_WARNING_CHECKPOINT_RESET2" )
	f121_arg1.message_text_alignment = LUI.Alignment.Center
	f121_arg1.padding_top = 25
	f121_arg1.default_focus_index = 2
	f121_arg1.popup_childfeeder = difficulty_fng_childfeeder
	local f121_local0 = f121_arg1.popup_list_spacing
	if not f121_local0 then
		f121_local0 = H1MenuDims.spacing
	end
	f121_arg1.popup_list_spacing = f121_local0
	f121_arg1.cancel_will_close = false
	f121_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", f121_arg1 )
	f121_local0:registerAnimationState( "default", CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	f121_local0:registerEventHandler( "popup_back", function ( element, event )
		local f122_local0 = element:getFirstDescendentById( "generic_selectionList_content_id" )
		local f122_local1 = f122_local0:getFirstChild()
		while f122_local1 ~= nil do
			if f122_local1.id == "difficulty_try_again_button_id" then
				f122_local1:processEvent( {
					name = "gain_focus"
				} )
			else
				f122_local1:processEvent( {
					name = "lose_focus"
				} )
			end
			f122_local1 = f122_local1:getNextSibling()
		end
	end )
	f121_local0:registerEventHandler( "menu_create", function ( element, event )
		element:clearSavedState()
	end )
	return f121_local0
end

function campaignCompletedPopupResponseQuit( f124_arg0, f124_arg1 )
	Engine.SetDvarBool( "profileMenuOption_hasBeenNotifiedCampaignCompleted", true )
	Engine.ExecNow( "profile_menuDvarsFinish" )
	Engine.Exec( "updategamerprofile" )
	Engine.PopupClosed( f124_arg1.controller, "quit" )
end

function campaignCompletedPopupResponseNo( f125_arg0, f125_arg1 )
	Engine.SetDvarBool( "profileMenuOption_hasBeenNotifiedCampaignCompleted", true )
	Engine.ExecNow( "profile_menuDvarsFinish" )
	Engine.Exec( "updategamerprofile" )
	Engine.PopupClosed( f125_arg1.controller, "no" )
end

function campaign_completed_popup( f126_arg0, f126_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_CAMPAIGN_ARCADE_CHEAT_UNLOCKED" ),
		message_text = Engine.GetDvarBool( "loc_german_sku" ) and Engine.Localize( "@MENU_CAMPAIGN_ARCADE_CHEAT_UNLOCKED_DESC_GERMAN_SKU" ) .. Engine.Localize( "MENU_CONFIRM_RETURN_TO_MAIN_MENU" ) or Engine.Localize( "@MENU_CAMPAIGN_ARCADE_CHEAT_UNLOCKED_DESC" ) .. Engine.Localize( "MENU_CONFIRM_RETURN_TO_MAIN_MENU" ),
		yes_text = Engine.Localize( "@MENU_RETURN_TO_MAIN_MENU" ),
		yes_action = campaignCompletedPopupResponseQuit,
		no_text = Engine.Localize( "@MENU_CONTINUE_TO_NEXT_MISSION" ),
		no_action = campaignCompletedPopupResponseNo
	} )
end

local f0_local45 = function ( f127_arg0, f127_arg1, f127_arg2, f127_arg3, f127_arg4 )
	return (f127_arg4 - f127_arg3) / (f127_arg2 - f127_arg1) * (f127_arg0 - f127_arg2) + f127_arg4
end

local f0_local46 = function ( f128_arg0, f128_arg1 )
	local f128_local0 = Patch.PatchDownloadedSize()
	local f128_local1 = Patch.PatchSize()
	if f128_local1 <= f128_local0 then
		f128_local0 = f128_local1
	end
	local f128_local2 = f0_local45( f128_local0, 0, f128_local1, 0, f128_arg0.maxWidth )
	if f128_local2 >= 10 and not f128_arg0.passedGlow then
		f128_arg0.passedGlow = true
		f128_arg0.glowRider:animateToState( "normalSize", 3000 )
	end
	f128_arg0:registerAnimationState( "update", {
		left = f128_arg0.startLeft,
		leftAnchor = true,
		width = f128_local2
	} )
	f128_arg0:animateToState( "update", 3000 )
end

function waiting_popup( f129_arg0, f129_arg1 )
	local f129_local0 = 175
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		height = f129_local0
	} )
	local f129_local2 = {
		r = 0.1,
		g = 0.1,
		b = 0.1
	}
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "white" ),
		color = f129_local2
	} )
	local f129_local4 = LUI.Divider.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true
	}, 55, LUI.Divider.Green )
	local f129_local5 = LUI.Divider.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 2
	}, 55, LUI.Divider.Green )
	local f129_local6 = 200
	local f129_local7 = 15
	local f129_local8 = RegisterMaterial( "h1_ui_deco_green_triangle" )
	local f129_local9, f129_local10 = GetMaterialDimensions( f129_local8 )
	local f129_local11 = f129_local7 * f129_local9 / f129_local10
	local self = LUI.UIElement.new( {
		width = f129_local6 + f129_local11,
		topAnchor = true,
		top = -55,
		height = 20
	} )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		width = f129_local11,
		height = f129_local7,
		material = f129_local8
	} ) )
	if f129_arg1.message_text == nil or f129_arg1.message_text == "" then
		f129_arg1.message_text = "Please wait..."
	end
	local self = LUI.UIText.new( {
		leftAnchor = true,
		left = 25,
		width = f129_local6,
		font = CoD.TextSettings.BodyFont.Font,
		height = 20,
		color = Colors.white
	} )
	self:setText( f129_arg1.message_text )
	self:addElement( self )
	local f129_local14 = 75
	local self = LUI.UIHorizontalList.new( {
		topAnchor = true,
		top = 115,
		spacing = f129_local14,
		width = f129_local14 + LoadingAnimationDims.Width + f129_local6
	} )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "loading_animation_widget" ) )
	self:addElement( self )
	local f129_local16 = 15
	local f129_local17 = RegisterMaterial( "h1_deco_system_dialog_slashes" )
	local f129_local18, f129_local19 = GetMaterialDimensions( f129_local17 )
	local f129_local20 = f129_local16 * f129_local18 / f129_local19
	local self = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		top = -f129_local16,
		material = f129_local17,
		width = f129_local20,
		height = f129_local16
	} )
	local self = LUI.UIImage.new( {
		bottomAnchor = true,
		rightAnchor = true,
		bottom = f129_local16,
		material = f129_local17,
		width = f129_local20,
		height = f129_local16,
		zRot = -180
	} )
	local f129_local23 = f129_local0
	local f129_local24 = RegisterMaterial( "h1_deco_system_dialog_bg" )
	local f129_local25, f129_local26 = GetMaterialDimensions( f129_local24 )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 190,
		width = f129_local23 * f129_local25 / f129_local26,
		height = f129_local23,
		material = f129_local24
	} )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( f129_local4 )
	self:addElement( f129_local5 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	if f129_arg1.isCCS then
		local self = 250
		local f129_local29 = 5
		local f129_local30 = 10
		local self = LUI.UIElement.new( {
			bottomAnchor = true,
			bottom = -45,
			width = self + f129_local30,
			height = f129_local29 + f129_local30
		} )
		local self = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			color = f129_local2,
			alpha = 0.8
		} )
		local f129_local33 = LUI.DecoFrame.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			alpha = 0.75
		}, LUI.DecoFrame.Green )
		self:addElement( self )
		self:addElement( f129_local33 )
		local f129_local34 = f129_local30 / 2
		local self = LUI.UIImage.new( {
			left = f129_local34,
			leftAnchor = true,
			color = {
				r = 0.2,
				g = 0.2,
				b = 0.2
			},
			alpha = 0.8,
			material = RegisterMaterial( "white" ),
			width = self,
			height = f129_local29
		} )
		local self = LUI.UIBorder.new( {
			left = f129_local34,
			leftAnchor = true,
			borderThickness = 1,
			color = Colors.mw1_green,
			material = RegisterMaterial( "white" ),
			width = self,
			height = f129_local29
		} )
		self:addElement( self )
		self:addElement( self )
		local self = LUI.UIImage.new( {
			left = f129_local34,
			leftAnchor = true,
			material = RegisterMaterial( "h1_ui_progressbar_green" ),
			width = 0,
			height = f129_local29
		} )
		self.maxWidth = self
		self.startLeft = f129_local34
		local f129_local38 = 10
		local f129_local39 = RegisterMaterial( "h1_ui_loadscreen_progress_highlight" )
		local f129_local40, f129_local41 = GetMaterialDimensions( f129_local39 )
		local f129_local42 = f129_local38 * f129_local40 / f129_local41
		local self = LUI.UIImage.new( {
			rightAnchor = true,
			topAnchor = true,
			top = -4,
			right = 3,
			material = f129_local39,
			width = f129_local42 / 4,
			height = f129_local38
		} )
		self:registerAnimationState( "normalSize", {
			rightAnchor = true,
			topAnchor = true,
			top = -4,
			right = 4.5,
			material = f129_local39,
			width = f129_local42 / 2,
			height = f129_local38
		} )
		self.passedGlow = false
		self.glowRider = self
		self:addElement( self )
		self:addElement( self )
		self:addElement( self )
		self:addElement( LUI.UITimer.new( 100, "update_progress" ) )
		self:registerEventHandler( "update_progress", f0_local46 )
	end
	if f129_arg1.isLiveWithCancel then
		local self = LUI.UIBindButton.new()
		self:registerEventHandler( "button_secondary", function ( element, event )
			if f129_arg1.cancel_func then
				f129_arg1.cancel_func( element, event )
			end
		end )
		self:addElement( self )
		AddLiveDialogFooterHelperText( self, {
			footerOffset = 10
		} )
	end
	return self
end

LUI.MenuBuilder.registerType( "live_dialog_text_box_with_cancel", live_dialog_text_box_with_cancel )
LUI.MenuBuilder.registerType( "live_dialog_text_box", live_dialog_text_box )
LUI.MenuBuilder.registerType( "loading_animation_widget", loading_animation_widget )
LUI.MenuBuilder.registerType( "live_dialog_processing_widget", live_dialog_processing_widget )
LUI.MenuBuilder.registerType( "live_dialog_popup_background", live_dialog_popup_background )
LUI.MenuBuilder.registerPopupType( "error_popmenu_party", error_popmenu_party )
LUI.MenuBuilder.registerPopupType( "error_popmenu_psplus_party", error_popmenu_psplus_party )
LUI.MenuBuilder.registerPopupType( "live_party_invite_popmenu", live_party_invite_popmenu )
LUI.MenuBuilder.registerPopupType( "live_party_streaming_incomplete_popmenu", live_party_streaming_incomplete_popmenu )
LUI.MenuBuilder.registerPopupType( "sign_in_as_sub_or_guest", sign_in_as_sub_or_guest )
LUI.MenuBuilder.registerType( "popup_acceptinginvite", popup_acceptinginvite )
LUI.MenuBuilder.registerPopupType( "popup_connecting", popup_connecting )
LUI.MenuBuilder.registerPopupType( "error_popmenu_submenu", error_popmenu_submenu )
LUI.MenuBuilder.registerType( "readingsavedevice", readingsavedevice )
LUI.MenuBuilder.registerPopupType( "error_corrupt_savedata", f0_local10 )
LUI.MenuBuilder.registerPopupType( "savedata_failed_popmenu", f0_local13 )
LUI.MenuBuilder.registerPopupType( "error_popmenu", error_popmenu )
LUI.MenuBuilder.registerPopupType( "quit_popmenu", quit_popmenu )
LUI.MenuBuilder.registerPopupType( "no_profile_warning_popmenu", f0_local8, nil, true )
LUI.MenuBuilder.registerPopupType( "no_profile_force_popmenu", f0_local14, nil, true )
LUI.MenuBuilder.registerPopupType( "throttle_error_popmenu", f0_local15, nil, true )
LUI.MenuBuilder.registerPopupType( "quit_no_save_confirm_popup", quit_no_save_confirm_popup )
LUI.MenuBuilder.registerPopupType( "quit_confirm_popup", quit_confirm_popup )
LUI.MenuBuilder.registerPopupType( "save_and_quit_confirm_popup", save_and_quit_confirm_popup )
LUI.MenuBuilder.registerPopupType( "save_and_quit_confirm_invited_popup", save_and_quit_confirm_invited_popup )
LUI.MenuBuilder.registerDef( "save_game_error_popup", save_game_error_popup )
LUI.MenuBuilder.registerPopupType( "lost_selected_save_device_popup", f0_local24 )
LUI.MenuBuilder.registerDef( "save_game_loading_hud", f0_local27 )
LUI.MenuBuilder.registerDef( "save_game_info_hud", f0_local30 )
LUI.MenuBuilder.registerDef( "menu_ps3_ui_bg", menu_ps3_ui_bg )
LUI.MenuBuilder.registerPopupType( "menu_online_ended", f0_local18 )
LUI.MenuBuilder.registerType( "controllerremoved_popmenu", controllerremoved_popmenu )
LUI.MenuBuilder.registerPopupType( "user_changed_confirm_mp", user_changed_confirm_mp )
LUI.MenuBuilder.registerPopupType( "controller_changed_confirm_mp", controller_changed_confirm_mp )
LUI.MenuBuilder.registerPopupType( "recipe_load_failed_popup", recipe_load_failed_popup, nil, true )
LUI.MenuBuilder.registerPopupType( "recipe_save_failed_popup", recipe_save_failed_popup, nil, true )
LUI.MenuBuilder.registerPopupType( "recipe_save_failed_no_guests_popup", recipe_save_failed_no_guests_popup, nil, true )
LUI.MenuBuilder.registerPopupType( "recipe_save_failed_no_device_popup", recipe_save_failed_no_device_popup, nil, true )
LUI.MenuBuilder.registerPopupType( "cac_elite_popup", cac_elite_popup )
LUI.MenuBuilder.registerPopupDef( "choose_language_popup", choose_language_popup )
LUI.MenuBuilder.registerPopupType( "choose_language_confirm_popup", f0_local31 )
LUI.MenuBuilder.registerPopupType( "MENU_TYPE_INVERT_AXIS", invert_axis_popup )
LUI.MenuBuilder.registerPopupType( "MENU_TYPE_INVERT_AXIS_CONFIRM", invert_axis_confirm_popup )
LUI.MenuBuilder.registerPopupType( "difficulty_selection_menu_fng", difficulty_selection_menu_fng )
LUI.MenuBuilder.registerPopupType( "campaign_completed_popup", campaign_completed_popup )
LUI.MenuBuilder.registerPopupType( "ccs_need_restart", ccs_need_restart )
LUI.MenuBuilder.registerPopupType( "ccs_is_downloading", ccs_is_downloading )
LUI.MenuBuilder.registerPopupType( "ccs_fail_need_restart", ccs_fail_need_restart )
LUI.MenuBuilder.registerType( "waiting_popup", waiting_popup )
if not Engine.IsConsoleGame() then
	LUI.MenuBuilder.registerPopupType( "steam_overlay_required", steam_overlay_required )
	LUI.MenuBuilder.registerPopupType( "switch_to_azerty_popup", f0_local40 )
	LUI.MenuBuilder.registerPopupType( "switch_to_azerty_reset_popup", f0_local41 )
end
LUI.MenuBuilder.registerPopupType( "no_controller_initial_popup", f0_local33 )
LUI.MenuBuilder.registerPopupType( "controller_initial_popup", f0_local36 )
LUI.FlowManager.RegisterStackPopBehaviour( "error_popmenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "error_popmenu_party", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "error_popmenu_submenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "error_popmenu_psplus_party", f0_local2 )
LockTable( _M )
