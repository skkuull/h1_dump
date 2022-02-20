local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyPrivate = InheritFrom( LUI.MPLobbyBase )
function menu_xboxlive_privatelobby_push()
	MatchRules.SetUsingMatchRulesData( 1 )
end

function GetPlayersWithoutMapInRotation()
	local f2_local0 = Lobby.NumMapsInRotation()
	for f2_local1 = 0, f2_local0 - 1, 1 do
		local f2_local4 = Lobby.GetMapInRotation( f2_local1 )
		if not Engine.PartyEveryoneHasMap( f2_local4 ) then
			return Engine.Localize( "@LUA_MENU_DESC_PLAYERS_MISSING_MAP", Engine.MarkLocalized( Lobby.GetMapName( f2_local4 ) ) )
		end
	end
	return nil
end

function GetPlayersWithoutMap()
	if Lobby.IsGameHost() and MatchRules.IsUsingCustomMapRotation() then
		return GetPlayersWithoutMapInRotation()
	elseif not Engine.PartyEveryoneHasMap( Engine.GetDvarString( "ui_mapname" ) ) then
		return Engine.Localize( "@LUA_MENU_DESC_PLAYERS_MISSING_MAP", Engine.MarkLocalized( Lobby.GetMapName() ) )
	else
		return nil
	end
end

function SetDescriptionText( f4_arg0, f4_arg1 )
	if f4_arg0.description then
		local f4_local0 = true
		if f4_arg1 == nil or f4_arg1 == "" then
			f4_arg1 = ""
			f4_local0 = false
		end
		if f4_arg0.description.text ~= f4_arg1 then
			f4_arg0.description.text = f4_arg1
			f4_arg0.description:processEvent( {
				name = "set_button_info_persistent_text",
				text = f4_arg1,
				isPersistent = true
			} )
		end
		if f4_arg0.description.visible ~= f4_local0 then
			f4_arg0.description.visible = f4_local0
			local f4_local1 = f4_arg0.description
			local f4_local2 = f4_local1
			f4_local1 = f4_local1.animateToState
			local f4_local3
			if f4_local0 then
				f4_local3 = "default"
				if not f4_local3 then
				
				else
					f4_local1( f4_local2, f4_local3 )
				end
			end
			f4_local3 = "hidden"
		end
	end
end

function ClientUpdateDescription( f5_arg0, f5_arg1 )
	SetDescriptionText( f5_arg0, GetPlayersWithoutMap() )
end

function IsStartGameDisabled( f6_arg0 )
	if Engine.GetDvarBool( "virtualLobbyEnabled" ) then
		if Engine.IsCoreMode() and not Engine.GetDvarBool( "virtualLobbyAllocated" ) then
			return true
		end
	end
	local f6_local0 = GetPlayersWithoutMap()
	if f6_local0 ~= nil then
		SetDescriptionText( f6_arg0, f6_local0 )
		return true
	elseif Lobby.IsPartyHostWaitingOnMembers() then
		SetDescriptionText( f6_arg0, Engine.Localize( "@LUA_MENU_DESC_LOCKED_WAITING_FOR_PARTY_MEMBERS" ) )
		return true
	elseif not Lobby.PartyClientsUpToDate() then
		SetDescriptionText( f6_arg0, "" )
		return true
	elseif Engine.GetDvarInt( "party_maxplayers" ) < Lobby.GetCurrentMemberCount( Lobby.MemberListStates.Lobby ) then
		SetDescriptionText( f6_arg0, Engine.Localize( "@LUA_MENU_TOO_MANY_PLAYERS" ) )
		return true
	elseif Matchmaking.IsHostingBanned() == true then
		SetDescriptionText( f6_arg0, "" )
		return true
	end
	SetDescriptionText( f6_arg0, nil )
	return false
end

function OnStartGame( f7_arg0, f7_arg1 )
	Engine.ExecNow( "banCheck " .. CoD.AntiCheat.Ban.FEATURE_BAN_HOSTING, f7_arg1.controller )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			Lobby.SetLocalReadyUpFlag()
			UpdateReadyUpText( f7_arg0, f7_arg1 )
			return 
		elseif not Lobby.GetPartyReadyUpStatus() then
			return 
		end
	end
	if Lobby.GetBotsTeamLimit( 0 ) > 0 or Lobby.GetBotsTeamLimit( 1 ) > 0 then
		SetBotsConnectType( 2 )
	else
		SetBotsConnectType( 0 )
	end
	Engine.Exec( "xpartygo", f7_arg1.controller )
end

function UpdateReadyUpText( f8_arg0, f8_arg1 )
	f8_arg0:processEvent( {
		name = "refresh_disabled"
	} )
	f8_arg0:setText( GetReadyUpDisplayString( f8_arg0, f8_arg1 ) )
end

function GetReadyUpDisplayString( f9_arg0, f9_arg1 )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			return Engine.Localize( "@LUA_MENU_READY_UP_CAPS" )
		elseif not Lobby.GetPartyReadyUpStatus() then
			return Engine.Localize( "@LUA_MENU_WAITING_FOR_OTHER_PLAYERS_CAPS" )
		end
	end
	if IsGameHost() then
		return Engine.Localize( "@LUA_MENU_START_GAME" )
	end
	return Engine.Localize( "@LUA_MENU_WAITING_FOR_HOST_CAPS" )
end

function IsGameSetupDisabled( f10_arg0, f10_arg1 )
	if Engine.Content_IsEnumerationDone() then
		f10_arg0:setDisabledRefreshRate( 0 )
		LUI.MPLobbyBase.RemoveLoadingWidgetFromButton( f10_arg0 )
		return false
	else
		return true
	end
end

function OnGameSetup( f11_arg0, f11_arg1 )
	LUI.FlowManager.RequestAddMenu( f11_arg0, "gamesetup_menu_main", true, f11_arg1.controller, false )
end

LUI.MPLobbyPrivate.new = function ( f12_arg0, f12_arg1 )
	local f12_local0 = LUI.MPLobbyBase.new( f12_arg0, {
		menu_title = f12_arg1.menu_title or "@LUA_MENU_PRIVATE_MATCH_LOBBY",
		has_match_summary = true
	}, true )
	f12_local0:setClass( LUI.MPLobbyPrivate )
	f12_local0:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@PLATFORM_PLAY_ONLINE" ) ) )
	local f12_local1 = false
	if Lobby.IsGameHost() then
		if not f12_local1 then
			local self = f12_local0:AddButton( "@LUA_MENU_START_GAME", OnStartGame, function ()
				return IsStartGameDisabled( f12_local0 )
			end )
			self:setDisabledRefreshRate( 100 )
		end
		local self = f12_local0:AddButton( "@LUA_MENU_GAME_SETUP", OnGameSetup, IsGameSetupDisabled )
		if IsGameSetupDisabled( self ) then
			self:setDisabledRefreshRate( 500 )
			LUI.MPLobbyBase.AddLoadingWidgetToButton( self )
		end
	end
	if Engine.IsCoreMode() then
		f12_local0:AddCACButton( true )
		f12_local0:AddPersonalizationButton()
		f12_local0:AddDepotButton()
	end
	f12_local0:AddOptionsButton()
	f12_local0:AddMapDisplay( LUI.MPLobbyMap.new, false )
	if not Lobby.IsGameHost() then
		local self = LUI.UITimer.new( 200, "ClientUpdateDescription" )
		self.id = "MPLobbyPrivate_desc_timer"
		f12_local0:addElement( self )
		f12_local0:registerEventHandler( "ClientUpdateDescription", ClientUpdateDescription )
	end
	f12_local0:registerEventHandler( "exit_private_lobby", function ( element, event )
		LUI.FlowManager.RequestLeaveMenu( element )
	end )
	f12_local0:registerEventHandler( "player_joined", Cac.PlayerJoinedEvent )
	f12_local0:registerEventHandler( "loadout_request", Cac.PlayerJoinedEvent )
	if not Engine.GetSplitScreen() then
		Engine.Exec( "forcenosplitscreencontrol mplobbyprivate_new" )
	end
	f12_local0:AddCurrencyInfoPanel()
	f12_local0.description = f12_local0:AddMenuDescription( 4, 1 )
	return f12_local0
end

LUI.MenuBuilder.registerType( "menu_xboxlive_privatelobby", LUI.MPLobbyPrivate.new )
LUI.FlowManager.RegisterMenuStack( "menu_xboxlive_privatelobby", {
	"mp_main_menu",
	"menu_xboxlive"
} )
function ResetVLobbyClassDisplay()
	PersistentBackground.FadeFromBlackSlow()
	if Cac.GetSelectedControllerIndex() ~= nil then
		local f15_local0 = Cac.GetCustomClassLoc()
		Cac.NotifyVLClassChange( Cac.GetSelectedControllerIndex(), Cac.GetSelectedClassIndex( f15_local0 ), f15_local0 )
	end
end

function OnPrivateMatchPush()
	ResetVLobbyClassDisplay()
end

function OnPrivateMatchPop()
	ResetVLobbyClassDisplay()
	LUI.MPLobbyBase.CollectGarbage()
end

VLobby.InitMenuMode( "menu_xboxlive_privatelobby", VirtualLobbyModes.LUI_MODE_LOBBY, OnPrivateMatchPush, OnPrivateMatchPop )
LockTable( _M )
