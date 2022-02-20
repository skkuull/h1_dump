local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyOnline = InheritFrom( LUI.MPLobbyBase )
function disableCreateGameButtons()
	local f1_local0 = Lobby.IsInPrivateParty()
	local f1_local1 = Lobby.IsPrivatePartyHost()
	local f1_local2 = Lobby.IsPartyHostWaitingOnMembers()
	local f1_local3
	if not f1_local0 or f1_local1 then
		f1_local3 = f1_local2
	else
		f1_local3 = true
	end
	return f1_local3
end

function disablePublicMatchButton()
	return disableCreateGameButtons()
end

function disablePrivateMatchButton()
	return disableCreateGameButtons()
end

f0_local0 = function ()
	local f4_local0 = Lobby.IsInPrivateParty()
	if f4_local0 then
		f4_local0 = not Lobby.IsAloneInPrivateParty()
	end
	return f4_local0
end

f0_local1 = function ( f5_arg0 )
	LeaveXboxLive()
	if Lobby.IsInPrivateParty() == false or Lobby.IsPrivatePartyHost() then
		LUI.FlowManager.RequestLeaveMenuByName( "menu_xboxlive" )
		Engine.ExecNow( "clearcontrollermap" )
	end
end

LUI.MPLobbyOnline.HandleBack = function ( f6_arg0, f6_arg1 )
	if f0_local0() then
		LUI.FlowManager.RequestAddMenu( f6_arg0, "leaveprelobbywarning", true, f6_arg1.controller, false, {} )
	else
		f0_local1( f6_arg0 )
	end
end

function OnPublicMatch( f7_arg0, f7_arg1 )
	if Engine.GetOnlineGame() then
		Engine.Exec( "xcheckezpatch" )
		Engine.ExecNow( "xblive_privatematch 0" )
		LUI.FlowManager.RequestAddMenu( f7_arg0, "FindGameMenu", true, nil, false, {
			clanWarsController = f7_arg1.controller
		} )
	end
end

function OnPrivateMatch( f8_arg0, f8_arg1 )
	Engine.ExecNow( "banCheck " .. CoD.AntiCheat.Ban.FEATURE_BAN_HOSTING, f8_arg1.controller )
	if Engine.AllSplitscreenPlayersInParty() then
		Engine.Exec( "xcheckezpatch", f8_arg1.controller )
		Engine.Exec( MPConfig.default_xboxlive, f8_arg1.controller )
		Engine.Exec( "ui_enumeratesaved", f8_arg1.controller )
		Engine.SetDvarBool( "xblive_privatematch", true )
		Engine.ExecNow( "xstartprivatematch" )
		LUI.FlowManager.RequestAddMenu( f8_arg0, "menu_xboxlive_privatelobby", true )
	end
end

LUI.MPLobbyOnline.OnGainFocus = function ( f9_arg0, f9_arg1 )
	LUI.MPLobbyBase.OnGainFocus( f9_arg0, f9_arg1 )
	f9_arg0:dispatchEventToRoot( {
		name = "open_motd",
		immediate = true,
		isLobbyOnlineFocused = true
	} )
end

LUI.MPLobbyOnline.OnStackPush = function ( f10_arg0, f10_arg1 )
	MPMatchmaking.Setup()
end

LUI.MPLobbyOnline.OnStackPop = function ( f11_arg0, f11_arg1 )
	LUI.MPLobbyBase.CollectGarbage()
end

LUI.MPLobbyOnline.OnCAC = function ( f12_arg0, f12_arg1 )
	if Engine.GetOnlineGame() then
		LUI.MPLobbyBase.OnCAC( f12_arg0, f12_arg1 )
	end
end

LUI.MPLobbyOnline.OnBarracks = function ( f13_arg0, f13_arg1 )
	if Engine.GetOnlineGame() then
		LUI.MPLobbyBase.OnBarracks( f13_arg0, f13_arg1 )
	end
end

LUI.MPLobbyOnline.OnPersonalization = function ( f14_arg0, f14_arg1 )
	if Engine.GetOnlineGame() then
		LUI.MPLobbyBase.OnPersonalization( f14_arg0, f14_arg1 )
	end
end

LUI.MPLobbyOnline.OnDepot = function ( f15_arg0, f15_arg1 )
	if Engine.GetOnlineGame() then
		LUI.MPLobbyBase.OnDepot( f15_arg0, f15_arg1 )
	end
end

function menu_xboxlive( f16_arg0, f16_arg1 )
	local f16_local0 = LUI.MPLobbyBase.new( f16_arg0, {
		menu_title = "@PLATFORM_UI_HEADER_PLAY_MP_CAPS",
		memberListState = Lobby.MemberListStates.Prelobby
	} )
	f16_local0:setClass( LUI.MPLobbyOnline )
	local f16_local1 = f16_local0:AddButton( "@PLATFORM_FIND_GAME", OnPublicMatch, disablePublicMatchButton )
	f16_local1:setDisabledRefreshRate( 500 )
	f16_local1:rename( "menu_xboxlive_find_game" )
	if Engine.IsCoreMode() then
		f16_local0:AddCACButton()
		f16_local0:AddBarracksButton()
		f16_local0:AddPersonalizationButton()
		f16_local0:AddDepotButton()
	end
	f16_local1 = f16_local0:AddButton( "@MENU_PRIVATE_MATCH", OnPrivateMatch, disablePrivateMatchButton )
	f16_local1:rename( "menu_xboxlive_private_match" )
	f16_local1:setDisabledRefreshRate( 500 )
	if not Engine.IsCoreMode() then
		local f16_local2 = f16_local0:AddButton( "@LUA_MENU_LEADERBOARD", "OpLeaderboardMain" )
		f16_local2:rename( "OperatorMenu_leaderboard" )
	end
	f16_local1 = f16_local0:AddStoreButton( nil, nil, true, LUI.ComScore.ScreenID.PlayOnline )
	if f16_local1 then
		f16_local1:setDisabledRefreshRate( 500 )
	end
	local f16_local2 = f16_arg1.initialController
	if f16_local2 ~= nil then
		if Engine.IsCODAccountEnabled( f16_local2 ) and tonumber( Engine.GetPlayerData( f16_local2, CoD.StatsGroup.Common, "cod_anywhere_signup_request" ) ) == 0 and CoD.IsCoDAccountRegistrationAvailableInMyRegion() and CoDAnywhere.ServiceAvailable( f16_local2 ) and not CoDAnywhere.HasUCDAccount( f16_local2 ) then
			LUI.FlowManager.RequestPopupMenu( self, "cod_anywhere_popup_menu", true, f16_local2 )
		end
	end
	f16_local0:AddOptionsButton()
	local f16_local3 = Lobby.GetNATType()
	if f16_local3 then
		local f16_local4 = Engine.Localize( "NETWORK_YOURNATTYPE", f16_local3 )
		local f16_local5 = CoD.CreateState( nil, nil, 2, -62, CoD.AnchorTypes.BottomRight )
		f16_local5.width = 250
		f16_local5.height = CoD.TextSettings.BodyFontVeryTiny.Height
		f16_local5.font = CoD.TextSettings.BodyFontVeryTiny.Font
		f16_local5.color = Colors.white
		f16_local5.alpha = 0.25
		local self = LUI.UIText.new( f16_local5 )
		self:setText( f16_local4 )
		f16_local0:addElement( self )
	end
	f16_local0:AddMenuDescription( 1 )
	f16_local0:AddMarketingPanel( LUI.MarketingLocation.Featured, LUI.ComScore.ScreenID.PlayOnline )
	f16_local0.isSignInMenu = true
	f16_local0:registerEventHandler( "gain_focus", LUI.MPLobbyOnline.OnGainFocus )
	f16_local0:registerEventHandler( "player_joined", Cac.PlayerJoinedEvent )
	f16_local0:registerEventHandler( "exit_live_lobby", f0_local1 )
	f16_local0:registerEventHandler( "processMarketingPopups", LUI.CustomMarketingPopups.ShowCustomMarketingPopupsIfPossible )
	if LUI.MOTD.haveCheckedMarketingQueue then
		local f16_local4 = Engine.GetLuiRoot()
		f16_local4:dispatchEventToRoot( {
			name = "processMarketingPopups"
		} )
	end
	if Engine.IsCoreMode() then
		Engine.ExecNow( "eliteclan_refresh", Engine.GetFirstActiveController() )
	end
	f16_local0:AddCurrencyInfoPanel()
	return f16_local0
end

LUI.MenuBuilder.registerType( "menu_xboxlive", menu_xboxlive )
LUI.FlowManager.RegisterMenuStack( "menu_xboxlive", {
	"mp_main_menu"
} )
VLobby.InitMenuMode( "menu_xboxlive", VirtualLobbyModes.LUI_MODE_LOBBY, LUI.MPLobbyOnline.OnStackPush, LUI.MPLobbyOnline.OnStackPush )
LockTable( _M )
