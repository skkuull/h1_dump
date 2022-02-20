local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ComScore.EnableComScore()
IsInitialMenuView = true
function OnSystemLinkNetwork( f1_arg0, f1_arg1 )
	f1_arg0:processEvent( {
		name = "button_action",
		controller = f1_arg1.controller,
		noRefocus = true
	} )
end

function GavelMessagesProcessed( f2_arg0, f2_arg1 )
	f2_arg0:processEvent( {
		name = "button_action",
		controller = f2_arg1.controller,
		noRefocus = true
	} )
end

function OnOnlineDataFetched( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetDvarBool( "useonlinestats" )
	Engine.SetDvarBool( "useonlinestats", true )
	CheckGavelMessages( f3_arg1.controller )
	Engine.SetDvarBool( "useonlinestats", f3_local0 )
	f3_arg0:processEvent( {
		name = "button_action",
		controller = f3_arg1.controller,
		noRefocus = true
	} )
end

function ClearWaitingForOtherType( f4_arg0 )
	if GetWaitingForNetworkType() ~= f4_arg0 then
		SetWaitingForNetworkType( WaitingForNetworkType.None )
	end
end

function ResolveSignInRefusal( f5_arg0 )
	if Engine.IsProfileSignedIn( f5_arg0 ) == false then
		LUI.FlowManager.RequestAddMenu( nil, "no_profile_force_popmenu", false, f5_arg0, false, {} )
	end
end

function OnPlayButton( f6_arg0, f6_arg1 )
	ClearWaitingForOtherType( WaitingForNetworkType.Online )
	Engine.ExecNow( "forcenosplitscreencontrol main_XBOXLIVE_1", f6_arg1.controller )
	if DCache.IsStartupDisabled() then
		LUI.FlowManager.RequestAddMenu( nil, "generic_yesno_popup", true, f6_arg1.controller, nil, {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			yes_action = function ()
				DCache.ClearDCache( 1 )
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			no_action = function ()
				DCache.ClearStartupCount()
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			message_text = Engine.Localize( "@LUA_MENU_DCACHE_CLEAR_REQUEST" ),
			yes_text = Engine.Localize( "@LUA_MENU_YES" ),
			no_text = Engine.Localize( "@LUA_MENU_NO" )
		} )
		return 
	end
	local f6_local0, f6_local1 = Engine.UserCanAccessMPLiveMenu( f6_arg1.controller )
	if not f6_local0 then
		if Engine.IsXB3() and f6_local1 == CoD.PlayOnlineFailure.OPFR_XBOXLIVE_MPNOTALLOWED then
			f6_local0 = Engine.ShowXB3GoldUpsell( f6_arg1.controller )
		elseif Engine.IsPCApp() and f6_local1 == CoD.PlayOnlineFailure.OPFR_PLATFORM_UPDATE_REQUIRED then
			LUI.FlowManager.RequestAddMenu( f6_arg0, "uwp_update_required", true, f6_arg1.controller )
			return 
		end
	end
	if not f6_local0 then
		if Engine.IsPS4() and f6_local1 == CoD.PlayOnlineFailure.OPFR_XBOXLIVE_SIGNEDOUTOFLIVE then
			Engine.ExecWithResolve( "xrequirelivesignin", ResolveSignInRefusal, f6_arg1.controller )
		elseif Engine.IsPS4() and f6_local1 == CoD.PlayOnlineFailure.OPFR_XBOXLIVE_MPNOTALLOWED then
			Engine.ExecWithResolve( "xrequirelivesignin", ResolveSignInRefusal, f6_arg1.controller )
		else
			Engine.Exec( "xrequirelivesignin", f6_arg1.controller )
			if WaitingForNetworkType.Online ~= GetWaitingForNetworkType() and f6_local1 ~= CoD.PlayOnlineFailure.OPFR_PLATFORM_PSPLUS_REQUIRED then
				SetWaitingForNetworkType( WaitingForNetworkType.Online, f6_arg1.controller )
			end
		end
	elseif not Engine.HasAcceptedEULA( f6_arg1.controller ) then
		LUI.FlowManager.RequestAddMenu( nil, "EULA", true, f6_arg1.controller, false, {
			callback = function ()
				OnPlayButton( f6_arg0, f6_arg1 )
			end
		} )
	elseif CheckCRMBanMessage( f6_arg0, f6_arg1.controller ) then
		return 
	elseif Lobby.GavelMessagesToShow ~= nil and #Lobby.GavelMessagesToShow > 0 then
		f6_arg0:processEvent( {
			name = "lose_focus"
		} )
		ShowGavelMessage( f6_arg0 )
	else
		if Engine.UsingStreamingInstall() then
			Engine.ForceUpdateArenas()
		end
		Engine.ExecNow( "resetSplitscreenSignIn", f6_arg1.controller )
		Engine.ExecNow( "forcenosplitscreencontrol main_XBOXLIVE_3", f6_arg1.controller )
		Engine.SetOnlineGame( true )
		Engine.SetSystemLink( false )
		Engine.SetSplitScreen( false )
		Engine.SetDvarBool( "xblive_privatematch", false )
		AAR.ClearAAR()
		Engine.SetDvarBool( "squad_match", false )
		Engine.ExecNow( MPConfig.default_xboxlive, f6_arg1.controller )
		Engine.SetDvarInt( "party_maxplayers", Engine.IsAliensMode() and 4 or 9 )
		Engine.ExecNow( "xstartprivateparty", f6_arg1.controller )
		Engine.Exec( "startentitlements", f6_arg1.controller )
		Engine.ExecNow( "upload_playercard", f6_arg1.controller )
		Cac.SetSelectedControllerIndex( f6_arg1.controller )
		Engine.CacheUserDataForController( f6_arg1.controller )
		LUI.FlowManager.RequestAddMenu( f6_arg0, "menu_xboxlive", false, f6_arg1.controller, false, {
			initialController = f6_arg1.controller
		} )
	end
end

function OnSplitscreenButton( f10_arg0, f10_arg1 )
	if DCache.IsStartupDisabled() then
		LUI.FlowManager.RequestAddMenu( nil, "generic_yesno_popup", true, controller, nil, {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			yes_action = function ()
				DCache.ClearDCache( 1 )
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			no_action = function ()
				DCache.ClearStartupCount()
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			message_text = Engine.Localize( "@LUA_MENU_DCACHE_CLEAR_REQUEST" ),
			yes_text = Engine.Localize( "@LUA_MENU_YES" ),
			no_text = Engine.Localize( "@LUA_MENU_NO" )
		} )
		return 
	end
	SetWaitingForNetworkType( WaitingForNetworkType.None )
	Engine.Exec( "xstopprivateparty" )
	Engine.Exec( "resetSplitscreenSignIn" )
	Engine.Exec( "forcesplitscreencontrol main_SPLITSCREEN" )
	Engine.SetSystemLink( false )
	Engine.SetSplitScreen( true )
	Engine.SetOnlineGame( false )
	Engine.SetDvarBool( "xblive_privatematch", false )
	AAR.ClearAAR()
	Engine.Exec( MPConfig.default_splitscreen )
	Engine.CacheUserDataForController( f10_arg1.controller )
	if Engine.GetDvarBool( "lui_splitscreensignin_menu" ) then
		LUI.FlowManager.RequestAddMenu( f10_arg0, "menu_splitscreensignin", false, f10_arg1.controller, false )
	else
		assert( not Engine.IsAliensMode(), "Splitscreen sign in UI not supported by .menu." )
		LUI.FlowManager.RequestOldMenu( f10_arg0, "menu_splitscreensignin", false )
	end
end

function OnReturnToMainMenu( f13_arg0, f13_arg1 )
	LUI.FlowManager.RequestPopupMenu( f13_arg0, "main_choose_exe_popup_menu", true, f13_arg1.controller )
	Engine.Exec( "forcenosplitscreencontrol openChooseExe " .. tostring( f13_arg1.controller ) )
end

function OnSystemLinkButton( f14_arg0, f14_arg1 )
	ClearWaitingForOtherType( WaitingForNetworkType.SystemLink )
	local f14_local0, f14_local1 = Engine.UserCanAccessSystemLinkMenu( f14_arg1.controller )
	if not f14_local0 then
		if WaitingForNetworkType.SystemLink ~= GetWaitingForNetworkType() then
			SetWaitingForNetworkType( WaitingForNetworkType.SystemLink, f14_arg1.controller )
			LUI.FlowManager.RequestAddMenu( f14_arg0, "popup_connecting", false, f14_arg1.controller, false )
		end
		Engine.Exec( "xrequiresignin", f14_arg1.controller )
		Engine.Exec( "forcesplitscreencontrol main_SYSTEMLINK_2", f14_arg1.controller )
	elseif not Engine.HasAcceptedEULA( f14_arg1.controller ) then
		LUI.FlowManager.RequestAddMenu( nil, "EULA", true, f14_arg1.controller, false, {
			callback = function ()
				OnSystemLinkButton( f14_arg0, f14_arg1 )
			end
		} )
	else
		if Engine.UsingStreamingInstall() then
			Engine.ForceUpdateArenas()
		end
		LUI.FlowManager.RequestLeaveMenuByName( "popup_connecting", nil )
		Engine.ExecNow( "resetSplitscreenSignIn", f14_arg1.controller )
		Engine.Exec( "forcenosplitscreencontrol main_SYSTEMLINK_3", f14_arg1.controller )
		Engine.SetSystemLink( true )
		Engine.SetSplitScreen( false )
		Engine.Exec( "clearcontrollermap" )
		Engine.SetOnlineGame( false )
		AAR.ClearAAR()
		if Lobby.UsingSystemLinkParty() then
			Engine.SetDvarBool( "xblive_privatematch", true )
		else
			Engine.SetDvarBool( "xblive_privatematch", false )
		end
		Engine.SetDvarBool( "ui_opensummary", false )
		Engine.Exec( MPConfig.default_systemlink, f14_arg1.controller )
		Engine.MakeLocalClientActive( f14_arg1.controller )
		Engine.CacheUserDataForController( f14_arg1.controller )
		Cac.SetSelectedControllerIndex( f14_arg1.controller )
		if Engine.GetDvarBool( "lui_systemlink_menu" ) then
			LUI.FlowManager.RequestAddMenu( f14_arg0, "menu_systemlink", false, f14_arg1.controller, false )
		else
			assert( not Engine.IsAliensMode(), "SystemLink UI not supported by .menu." )
			LUI.FlowManager.RequestOldMenu( f14_arg0, "menu_systemlink", false )
		end
	end
end

function AddStreamingInstallWidget( f16_arg0 )
	if IsStreamingInstall() then
		local f16_local0 = LUI.StreamingInstallWidget.new()
		f16_arg0:addElement( f16_local0 )
		f16_arg0.streamingInstall = f16_local0
	end
end

function ResolveCRPClickThroughAction( f17_arg0 )
	local f17_local0, f17_local1 = Engine.UserCanAccessMPLiveMenu( f17_arg0 )
	if not f17_local0 and f17_local1 ~= CoD.PlayOnlineFailure.OPFR_PLATFORM_PSPLUS_REQUIRED then
		SetWaitingForNetworkType( WaitingForNetworkType.Online, f17_arg0 )
		Engine.ExecNow( "forcenosplitscreencontrol main_XBOXLIVE_1", f17_arg0 )
		Engine.ExecWithResolve( "xrequirelivesignin", ResolveCRPClickThroughAction, f17_arg0 )
	else
		local f17_local2 = LUI.FlowManager.GetMenuScopedDataByMenuName( "mp_main_menu" )
		OnPlayButton( f17_local2.crpButton, {
			name = "button_action",
			controller = f17_arg0
		} )
	end
end

function CRPClickThroughAction( f18_arg0, f18_arg1 )
	if not IsStreamingInstall() then
		local f18_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "mp_main_menu" )
		ResolveCRPClickThroughAction( f18_local0.crpController )
	end
end

f0_local0 = function ( f19_arg0 )
	local f19_local0 = CoD.CreateState( nil, nil, nil, nile, CoD.AnchorTypes.None )
	f19_local0.material = RegisterMaterial( "h1_logo_mw_medium" )
	f19_local0.width = 571
	f19_local0.height = 256
	f19_arg0:addElement( LUI.UIImage.new( f19_local0 ) )
end

function MainMenu( f20_arg0, f20_arg1 )
	local f20_local0, f20_local1 = nil
	local f20_local2 = "@MENU_MULTIPLAYER_CAPS"
	local f20_local3 = ""
	local f20_local4 = nil
	Engine.SetDvarBool( "party_playersCoop", false )
	f20_local0 = LUI.MenuTemplate.new( f20_arg0, {
		menu_title = f20_local2,
		uppercase_title = f20_local4
	} )
	LUI.MenuTemplate.SetBreadCrumb( f20_local0, f20_local3 )
	f20_local0:AddBuildNumber()
	f20_local1 = f20_local0:AddButton( "@PLATFORM_PLAY_ONLINE", OnPlayButton, IsStreamingInstall )
	f20_local1:setDisabledRefreshRate( 1000 )
	f20_local1:rename( "mp_main_menu_play_online" )
	f20_local1:registerEventHandler( "onOnlineDataFetched", OnOnlineDataFetched )
	f20_local1:registerEventHandler( "gavelMessagesProcessed", GavelMessagesProcessed )
	if Engine.IsConsoleGame() then
		f20_local1 = f20_local0:AddButton( "@PLATFORM_SYSTEM_LINK", OnSystemLinkButton )
		f20_local1:rename( "MainMenu_SystemLink" )
		f20_local1:registerEventHandler( "onSystemLinkNetwork", OnSystemLinkNetwork )
	end
	if Engine.IsCoreMode() then
		for f20_local5 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.HasActiveLocalClient( f20_local5 ) and Engine.GetProfileData( "mp_StartCRPLobby", f20_local5 ) then
				Engine.Exec( "profile_ClearStartCRPLobby", f20_local5 )
				Engine.Exec( "updategamerprofile" )
				f20_local1.listDefaultFocus = true
				local f20_local8 = LUI.FlowManager.GetMenuScopedDataByMenuName( "mp_main_menu" )
				f20_local8.crpButton = f20_local1
				f20_local8.crpController = f20_local5
				f20_local1:registerEventHandler( "StartCRPLobby", CRPClickThroughAction )
				f20_local1:dispatchEventToRoot( {
					name = "StartCRPLobby",
					target = f20_local1
				} )
				break
			end
		end
	end
	f20_local0:AddOptionsButton( false, true )
	if Engine.IsXB3() or Engine.IsPCApp() then
		LUI.ButtonHelperText.AddSignInAndSwitchUserHelp( f20_local0 )
	end
	f0_local0( f20_local0 )
	f20_local0:AddBackButton( OnReturnToMainMenu )
	AddStreamingInstallWidget( f20_local0 )
	Engine.ExecNow( "set xblive_competitionmatch 0" )
	Lobby.ClearLocalPlayLoadouts()
	f20_local0:registerEventHandler( "refresh_button_helper", refreshHelpButtons )
	IsInitialMenuView = false
	if Engine.IsPC() then
		if not Engine.GetDisplayDriverMeetsMinVer() then
			LUI.FlowManager.RequestAddMenu( self, "PCDriverDialog" )
		elseif Engine.ShaderUploadFrontendShouldShowDialog() then
			LUI.FlowManager.RequestAddMenu( self, "ShaderCacheDialog" )
		end
	end
	return f20_local0
end

function refreshHelpButtons( f21_arg0, f21_arg1 )
	f21_arg0:AddOptionsButton()
	f21_arg0:AddBackButton( OnReturnToMainMenu )
end

function StartMenuMusic()
	Engine.PlayMusic( CoD.Music.MainMPMusicList[math.random( 1, #CoD.Music.MainMPMusicList )] )
end

LUI.MenuBuilder.registerType( "mp_main_menu", MainMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "mp_main_menu", function ()
	Engine.SetDvarInt( "virtualLobbyMode", VirtualLobbyModes.LUI_MODE_PRELOBBY )
	StartMenuMusic()
end )
LUI.FlowManager.RegisterStackResumeBehaviour( "mp_main_menu", function ()
	IsInitialMenuView = false
end )
LockTable( _M )
