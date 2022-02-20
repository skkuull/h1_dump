Lobby = Lobby or {}
if Engine.InFrontend() then
	Lobby.MemberListStates = {
		None = 0,
		Prelobby = 1,
		Lobby = 2,
		Teams = 3
	}
	Lobby.TransitionTime = 750
	Lobby.PasswordLength = 24
	Lobby.Teams = {
		Free = 0,
		Bad = 0,
		Axis = 1,
		Allies = 2
	}
	Lobby.BotTeams = {
		Friendly = 0,
		Enemy = 1,
		FFA = 2
	}
	Lobby.CurrGenBotLimit = 12
	Lobby.NextGenBotLimit = 18
	Lobby.BotDifficulties = {
		Recruit = 0,
		Regular = 1,
		Hardened = 2,
		Veteran = 3,
		Mixed = 4
	}
	Lobby.MemberStatTypes = {
		Score = 0,
		Divider = 1,
		Deaths = 2,
		BestWeapon = 3,
		Wins = 4,
		KDRatio = 5,
		CurrentWinStreak = 6,
		GamesPlayed = 7,
		WinLossRatio = 8,
		TimePlayed = 9
	}
	MapVoting = {
		MapA = {
			refNum = 0,
			voteIndex = 1,
			votesDvar = "party_nextMapVoteStatus"
		},
		MapB = {
			refNum = 1,
			voteIndex = 2,
			votesDvar = "party_alternateMapVoteStatus"
		},
		Random = {
			refNum = 2,
			voteIndex = 3,
			votesDvar = "party_randomMapVoteStatus"
		}
	}
	Lobby.PlayerStatsCategories = {
		{
			Title = "@LUA_MENU_KD_RATIO",
			Type = Lobby.MemberStatTypes.KDRatio
		},
		{
			Title = "@LUA_MENU_PREFERRED_WEAPON",
			Type = Lobby.MemberStatTypes.BestWeapon
		},
		{
			Title = "@LUA_MENU_CURRENT_STREAK",
			Type = Lobby.MemberStatTypes.CurrentWinStreak
		},
		{
			Title = "@LUA_MENU_WINS",
			Type = Lobby.MemberStatTypes.Wins
		},
		{
			Title = "@LUA_MENU_GAMES_PLAYED",
			Type = Lobby.MemberStatTypes.GamesPlayed
		},
		{
			Title = "@LUA_MENU_WL_RATIO",
			Type = Lobby.MemberStatTypes.WinLossRatio
		},
		{
			Title = "@LUA_MENU_TIME_PLAYED",
			Type = Lobby.MemberStatTypes.TimePlayed
		}
	}
	Lobby.AARTypes = {
		Normal = 0,
		Splitscreen = 1
	}
	Lobby.GavelMessagesToShow = {}
	function GavelMessageConfirmation( f1_arg0, f1_arg1 )
		table.remove( Lobby.GavelMessagesToShow, #Lobby.GavelMessagesToShow )
		if #Lobby.GavelMessagesToShow == 0 then
			LUI.FlowManager.RequestLeaveMenu( f1_arg0, nil, nil, f1_arg1.controller )
			local f1_local0 = Engine.GetDvarBool( "useonlinestats" )
			Engine.SetDvarBool( "useonlinestats", true )
			Engine.SetGavelMessagesSeen( Engine.GetFirstActiveController() )
			Engine.SetDvarBool( "useonlinestats", f1_local0 )
			Engine.SetDvarBool( "lui_waitingforgavelmessagesconfirmed", true )
		else
			local f1_local0 = Lobby.GavelMessagesToShow[#Lobby.GavelMessagesToShow]
			local f1_local1 = f1_arg0:getParent()
			f1_local1:dispatchEventToChildren( {
				name = "update_message",
				message_text = Engine.Localize( "@LUA_MENU_GAVEL_MSG_" .. f1_local0 )
			} )
		end
	end
	
	function ShowGavelMessage( f2_arg0 )
		if Lobby.GavelMessagesToShow ~= nil and #Lobby.GavelMessagesToShow > 0 then
			LUI.FlowManager.RequestAddMenu( f2_arg0, "generic_confirmation_popup", false, false, false, {
				popup_title = Engine.Localize( "@MENU_NOTICE" ),
				message_text = Engine.Localize( "@LUA_MENU_GAVEL_MSG_" .. Lobby.GavelMessagesToShow[#Lobby.GavelMessagesToShow] ),
				confirmation_action = function ( f3_arg0, f3_arg1 )
					GavelMessageConfirmation( f3_arg0, f3_arg1 )
				end,
				confirm_will_close = false
			} )
			return true
		else
			
		end
	end
	
	function CheckGavelMessages( f4_arg0 )
		if #Lobby.GavelMessagesToShow == 0 then
			Lobby.GavelMessagesToShow = Engine.GetGavelMessages( f4_arg0 )
			if Lobby.GavelMessagesToShow == nil then
				Lobby.GavelMessagesToShow = {}
			end
		end
	end
	
	function clearMatchData()
		if Engine.ClearMatchData then
			Engine.ClearMatchData()
		end
	end
	
	function OpenCoDAnywhere( f6_arg0, f6_arg1 )
		if Engine.UserIsGuest( f6_arg1.controller ) then
			LUI.FlowManager.RequestAddMenu( nil, "mp_no_guest_popup", true, f6_arg1.controller )
		else
			DebugPrint( "OpenCoDAnywhere called, intra network: " .. tostring( Engine.GetDvarInt( "ca_intra_only" ) ) )
			if Engine.GetDvarInt( "ca_intra_only" ) == 1 then
				if CoDAnywhere.ShouldShowLinkCreatePopup( f6_arg1.controller, true ) == true then
					LUI.FlowManager.RequestPopupMenu( nil, "cod_anywhere_popup_menu", true, f6_arg1.controller )
				else
					LUI.FlowManager.RequestAddMenu( nil, "cod_anywhere_all_done_popup_menu", true, f6_arg1.controller )
				end
			elseif CoDAnywhere.ShouldShowLinkCreatePopup( f6_arg1.controller, true ) == true then
				LUI.FlowManager.RequestPopupMenu( nil, "cod_anywhere_popup_menu", true, f6_arg1.controller )
			elseif CoDAnywhere.ShouldShowLinkUCDPopup( f6_arg1.controller, true ) == true then
				LUI.FlowManager.RequestAddMenu( nil, "cod_anywhere_link_ucd_popup_menu", true, f6_arg1.controller )
			else
				CoDAnywhere.DownloadNonUCDPlatforms( f6_arg1.controller )
			end
		end
	end
	
	function LoadMatchRules()
		if MLG.AreMLGRulesEnabled() then
			MatchRules.LoadMLGRecipe()
		else
			MatchRules.LoadMatchRulesDataDefault()
		end
	end
	
	function IsGameHost()
		return Lobby.IsGameHost()
	end
	
	function IsNotGameHost()
		return not IsGameHost()
	end
	
	function AreWePrivatePartyHost()
		local f10_local0 = Lobby.IsInPrivateParty()
		if f10_local0 then
			f10_local0 = Lobby.IsPrivatePartyHost()
		end
		return f10_local0
	end
	
	function IsOurPrivatePartyHostInLobby()
		local f11_local0 = Lobby.IsInPrivateParty()
		local f11_local1 = Lobby.IsPrivatePartyHost()
		local f11_local2 = Lobby.IsPrivatePartyHostInLobby()
		local f11_local3 = f11_local0
		local f11_local4
		if not f11_local1 then
			f11_local4 = f11_local2
		else
			f11_local4 = false
		end
		return f11_local4
	end
	
	function IsPrivateMatch()
		if Engine.GetOnlineGame() == true and Engine.GetDvarBool( "xblive_privatematch" ) == true then
			return true
		else
			return false
		end
	end
	
	function IsPublicMatch()
		if Engine.GetOnlineGame() == true and Engine.GetDvarBool( "xblive_privatematch" ) == false then
			return true
		else
			return false
		end
	end
	
	function IsOfflineMatch()
		return Engine.GetOnlineGame() == false
	end
	
	function IsTeamsVisible()
		local f15_local0 = Engine.GetDvarBool( "party_teamsVisible" )
		if f15_local0 then
			f15_local0 = Engine.GetDvarBool( "party_teamBased" )
			if f15_local0 then
				f15_local0 = not Engine.GetDvarBool( "party_playersCoop" )
			end
		end
		return f15_local0
	end
	
	function IsVotingFinished()
		return Lobby.HasVotePassed() or IsTeamsVisible()
	end
	
	function ExitLobby( f17_arg0, f17_arg1 )
		f17_arg0:dispatchEventToRoot( {
			name = "exit_private_lobby",
			dispatchChildren = true
		} )
		f17_arg0:dispatchEventToRoot( {
			name = "exit_public_lobby"
		} )
	end
	
	function OpenAfterActionReport( f18_arg0, f18_arg1, f18_arg2 )
		local f18_local0
		if f18_arg2 then
			f18_local0 = f18_arg2.controller
			if not f18_local0 then
			
			else
				if not f18_arg0 then
					f18_arg0 = Lobby.AARTypes.Normal
				end
				Engine.PlaySound( "ui_summary_screen" )
				LUI.FlowManager.RequestAddMenu( self, "aar_summary_main", true, f18_local0, false, {
					controller = f18_local0,
					aarType = f18_arg0,
					postMatch = f18_arg1
				} )
			end
		end
		f18_local0 = Engine.GetFirstActiveController()
	end
	
	function OnVLobbyLoaded( f19_arg0, f19_arg1 )
		if f19_arg0.loadingWidget then
			f19_arg0.loadingWidget:animateToState( "disabled" )
		end
		f19_arg0:registerEventHandler( "gamepad_button", nil )
		Engine.SetUiHasNoVisibleChatUserInfo( false )
	end
	
	function LobbyInitAAR( f20_arg0, f20_arg1 )
		if Engine.GetDvarBool( "ui_opensummary" ) then
			Engine.SetDvarBool( "ui_opensummary", false )
			AAR.OnBackFromMatch()
			if not Engine.GetSplitScreen() then
				OpenAfterActionReport( f20_arg1, true )
				f20_arg0:setAlpha( 0 )
			else
				Engine.SetUiHasNoVisibleChatUserInfo( true )
				local f20_local0 = LUI.MenuBuilder.BuildRegisteredType( "waiting_popup", {
					message_text = Engine.Localize( "@MENU_LOADING_DOTS" )
				} )
				local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ) )
				self:setupFullWindowElement()
				f20_local0:registerAnimationState( "disabled", {
					alpha = 0
				} )
				f20_arg0.loadingWidget = f20_local0
				f20_arg0:addElement( self )
				self:addElement( f20_local0 )
				f20_arg0:registerEventHandler( "gamepad_button", function ( element, event )
					
				end )
				f20_arg0:registerDvarHandler( "virtualLobbyReady", OnVLobbyLoaded )
			end
		end
		if AAR.HasMatchData and Engine.GetDvarInt( "playlist" ) == AAR.MatchDataPlayList and Engine.GetDvarBool( "xblive_privatematch" ) == AAR.IsPrivateMatchData then
			LUI.ButtonHelperText.AddHelperTextObject( f20_arg0.help, LUI.ButtonHelperText.CommonEvents.addGameSummaryButton, function ( f22_arg0, f22_arg1 )
				OpenAfterActionReport( f20_arg1, nil, f22_arg1 )
			end )
		end
	end
	
	function AnyActiveControllers()
		for f23_local0 = 1, Engine.GetMaxControllerCount(), 1 do
			if Engine.HasActiveLocalClient( f23_local0 - 1 ) then
				return true
			end
		end
		return false
	end
	
	function StartVirtualLobby()
		if Engine.GetDvarBool( "virtualLobbyEnabled" ) and not Engine.GetDvarBool( "virtuallobbyactive" ) then
			local f24_local0 = Engine.GetLuiRoot()
			if AnyActiveControllers() and Cac.GetSelectedControllerIndex() == nil then
				Cac.SetSelectedControllerIndex( Engine.GetFirstActiveController() )
			end
			Engine.Exec( "virtuallobby" )
		end
	end
	
	function StartVirtualLobbyEvent( f25_arg0, f25_arg1 )
		StartVirtualLobby()
	end
	
	function SetupTheLobby( f26_arg0 )
		f26_arg0:registerEventHandler( "refresh_vl_loadout", function ( element, event )
			Cac.SetVirtualLobbyLoadout( -1 )
		end )
		f26_arg0:registerEventHandler( "startvirtuallobby", StartVirtualLobbyEvent )
		f26_arg0:dispatchEventToRoot( {
			name = "startvirtuallobby",
			immediate = false
		} )
		local self = LUI.UITimer.new( 500, {
			name = "refresh_vl_loadout"
		}, nil, true, f26_arg0, true )
		self.id = "refresh_vl_loadout_timer"
		f26_arg0:addElement( self )
		if not dontHideBG2 then
			Cac.NotifyVirtualLobby( "vlpresentable", 0 )
		end
		Cac.NotifyVirtualLobby( "lootscreen_weapon_highlighted", "none" )
		if Engine.GetDvarBool( "vlDepotEnabled" ) then
			Cac.NotifyVirtualLobby( "leave_depot", 0 )
		end
	end
	
	function LobbyMemberListGetState( f28_arg0 )
		local f28_local0 = IsTeamsVisible()
		if f28_arg0 == Lobby.MemberListStates.Lobby and f28_local0 then
			return Lobby.MemberListStates.Teams
		elseif f28_arg0 == Lobby.MemberListStates.Teams and not f28_local0 then
			return Lobby.MemberListStates.Lobby
		else
			return f28_arg0
		end
	end
	
	function LobbyMemberIsBot( f29_arg0, f29_arg1, f29_arg2 )
		return Lobby.IsMemberABot( f29_arg0, f29_arg1, f29_arg2 )
	end
	
	function GetMaxBotLimit()
		local f30_local0 = Lobby.CurrGenBotLimit
		if Engine.IsPS4() or Engine.IsXB3() or not Engine.IsConsoleGame() then
			f30_local0 = Lobby.NextGenBotLimit
		end
		f30_local0 = math.min( f30_local0, GetPartyMaxPlayers() )
		if Engine.GetOnlineGame() == false and Engine.GetSplitScreen() == true then
			f30_local0 = f30_local0 - Engine.SplitscreenPlayerCount()
		elseif Engine.GetDvarBool( "xblive_privatematch" ) == true then
			f30_local0 = math.max( f30_local0 - Lobby.GetCurrentMemberCount( Lobby.MemberListStates.Lobby ), 0 )
		elseif Engine.GetSystemLink() == true then
			f30_local0 = f30_local0 - 1
		end
		return f30_local0
	end
	
	function BotIsTeamBased( f31_arg0 )
		return tonumber( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f31_arg0, GameTypesTable.Cols.TeamBased ) )
	end
	
	function BotButtonDisplayText( f32_arg0 )
		local f32_local0 = 0
		if Lobby.GetBotsTeamLimit then
			f32_local0 = Lobby.GetBotsTeamLimit( f32_arg0 )
		end
		return tostring( f32_local0 )
	end
	
	function FriendlyBotButtonDisplayText( f33_arg0, f33_arg1 )
		return BotButtonDisplayText( Lobby.BotTeams.Friendly )
	end
	
	function EnemyBotButtonDisplayText( f34_arg0, f34_arg1 )
		return BotButtonDisplayText( Lobby.BotTeams.Enemy )
	end
	
	function FFABotButtonDisplayText( f35_arg0, f35_arg1 )
		return BotButtonDisplayText( Lobby.BotTeams.FFA )
	end
	
	function SetBotsTeamLimit( f36_arg0, f36_arg1 )
		if Lobby.IsGameHost() then
			Lobby.SetBotsTeamLimit( f36_arg0, f36_arg1 )
		end
	end
	
	function SetBotsDifficulty( f37_arg0, f37_arg1 )
		if Lobby.IsGameHost() then
			Lobby.SetBotsDifficulty( f37_arg0, f37_arg1 )
		end
	end
	
	function SetBotsConnectType( f38_arg0 )
		if Lobby.IsGameHost() then
			Lobby.SetBotsConnectType( f38_arg0 )
		end
	end
	
	function EnforceBotFeatureBanTeamLimits()
		if Engine.AntiCheatIsFeatureBanned( Engine.GetFirstActiveController(), CoD.AntiCheat.Ban.FEATURE_BAN_BOT_GAMES ) then
			SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
			SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
			SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
		end
	end
	
	function BotButtonLeft( f40_arg0 )
		EnforceBotFeatureBanTeamLimits()
		if Lobby.GetBotsTeamLimit then
			local f40_local0 = Lobby.GetBotsTeamLimit( f40_arg0 ) - 1
			if Lobby.SetBotsTeamLimit then
				if f40_local0 < 0 then
					SetBotsTeamLimit( f40_arg0, 0 )
				else
					SetBotsTeamLimit( f40_arg0, f40_local0 )
				end
			end
		end
	end
	
	function FriendlyBotButtonLeft( f41_arg0, f41_arg1 )
		BotButtonLeft( Lobby.BotTeams.Friendly )
	end
	
	function EnemyBotButtonLeft( f42_arg0, f42_arg1 )
		BotButtonLeft( Lobby.BotTeams.Enemy )
	end
	
	function FFABotButtonLeft( f43_arg0, f43_arg1 )
		BotButtonLeft( Lobby.BotTeams.FFA )
	end
	
	function BotButtonRight( f44_arg0, f44_arg1 )
		Engine.AntiCheatBanCheck( Engine.GetFirstActiveController(), CoD.AntiCheat.Ban.FEATURE_BAN_BOT_GAMES )
		if Lobby.GetBotsTeamLimit and Lobby.SetBotsTeamLimit then
			local f44_local0 = Lobby.GetBotsTeamLimit( f44_arg0 ) + 1
			if f44_arg1 < f44_local0 then
				f44_local0 = f44_arg1
			end
			SetBotsTeamLimit( f44_arg0, f44_local0 )
		end
	end
	
	function FriendlyBotButtonRight( f45_arg0, f45_arg1 )
		BotButtonRight( Lobby.BotTeams.Friendly, GetMaxBotLimit() )
		f45_arg0:dispatchEventToParent( {
			name = "bot_button_refresh",
			removeTeam = Lobby.BotTeams.Enemy
		} )
	end
	
	function EnemyBotButtonRight( f46_arg0, f46_arg1 )
		BotButtonRight( Lobby.BotTeams.Enemy, GetMaxBotLimit() )
		f46_arg0:dispatchEventToParent( {
			name = "bot_button_refresh",
			removeTeam = Lobby.BotTeams.Friendly
		} )
	end
	
	function FFABotButtonRight( f47_arg0, f47_arg1 )
		BotButtonRight( Lobby.BotTeams.FFA, GetMaxBotLimit() )
		f47_arg0:dispatchEventToParent( {
			name = "bot_button_refresh"
		} )
	end
	
	function BotButtonRefresh( f48_arg0, f48_arg1 )
		EnforceBotFeatureBanTeamLimits()
		local f48_local0 = MatchRules.GetData( "gametype" )
		if f48_local0 ~= nil then
			local f48_local1 = GetMaxBotLimit()
			local f48_local2 = BotIsTeamBased( f48_local0 )
			if f48_local2 and f48_local2 == 1 then
				local f48_local3 = f48_arg1.removeTeam == Lobby.BotTeams.Friendly
				local f48_local4 = f48_arg1.removeTeam == Lobby.BotTeams.Enemy
				local f48_local5 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.Friendly )
				local f48_local6 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.Enemy )
				local f48_local7 = GetTeamLimitForMaxPlayers( GetPrivateMatchPlayerLimits( f48_local0 ) )
				if f48_local7 < f48_local5 then
					f48_local5 = f48_local7
					SetBotsTeamLimit( Lobby.BotTeams.Friendly, f48_local7 )
				end
				if f48_local7 < f48_local6 then
					f48_local6 = f48_local7
					SetBotsTeamLimit( Lobby.BotTeams.Enemy, f48_local7 )
					while f48_local1 < f48_local5 + f48_local6 do
						if not f48_local3 and (f48_local4 or f48_local5 < f48_local6) then
							SetBotsTeamLimit( Lobby.BotTeams.Enemy, f48_local6 - 1 )
						else
							SetBotsTeamLimit( Lobby.BotTeams.Friendly, f48_local5 - 1 )
						end
					end
				end
			elseif f48_local1 < Lobby.GetBotsTeamLimit( Lobby.BotTeams.FFA ) then
				SetBotsTeamLimit( Lobby.BotTeams.FFA, f48_local1 )
			end
		end
		f48_arg0:processEvent( {
			name = "content_refresh"
		} )
	end
	
	function BotsDifficultyButtonDisplayText( f49_arg0 )
		local f49_local0 = Lobby.BotDifficulties.Regular
		if Lobby.GetBotsDifficulty then
			f49_local0 = Lobby.GetBotsDifficulty( f49_arg0 )
		end
		if f49_local0 == Lobby.BotDifficulties.Recruit then
			return Engine.Localize( "@LUA_MENU_BOTS_RECRUIT" )
		elseif f49_local0 == Lobby.BotDifficulties.Regular then
			return Engine.Localize( "@LUA_MENU_BOTS_REGULAR" )
		elseif f49_local0 == Lobby.BotDifficulties.Hardened then
			return Engine.Localize( "@LUA_MENU_BOTS_HARDENED" )
		elseif f49_local0 == Lobby.BotDifficulties.Veteran then
			return Engine.Localize( "@LUA_MENU_BOTS_VETERAN" )
		elseif f49_local0 == Lobby.BotDifficulties.Mixed then
			return Engine.Localize( "@LUA_MENU_BOTS_MIXED" )
		else
			return "FIXME Missing option"
		end
	end
	
	function FriendlyBotsDifficultyButtonDisplayText( f50_arg0, f50_arg1 )
		return BotsDifficultyButtonDisplayText( Lobby.BotTeams.Friendly )
	end
	
	function EnemyBotsDifficultyButtonDisplayText( f51_arg0, f51_arg1 )
		return BotsDifficultyButtonDisplayText( Lobby.BotTeams.Enemy )
	end
	
	function FFABotsDifficultyButtonDisplayText( f52_arg0, f52_arg1 )
		return BotsDifficultyButtonDisplayText( Lobby.BotTeams.FFA )
	end
	
	function BotsDifficultyButtonLeft( f53_arg0 )
		if Lobby.GetBotsDifficulty then
			local f53_local0 = Lobby.GetBotsDifficulty( f53_arg0 ) - 1
			if Lobby.GetBotsDifficultyCount then
				if f53_local0 < 0 then
					f53_local0 = Lobby.GetBotsDifficultyCount() - 1
				end
			else
				f53_local0 = 0
			end
			if Lobby.SetBotsDifficulty then
				SetBotsDifficulty( f53_arg0, f53_local0 )
			end
		end
	end
	
	function FriendlyBotsDifficultyButtonLeft( f54_arg0, f54_arg1 )
		BotsDifficultyButtonLeft( Lobby.BotTeams.Friendly )
	end
	
	function EnemyBotsDifficultyButtonLeft( f55_arg0, f55_arg1 )
		BotsDifficultyButtonLeft( Lobby.BotTeams.Enemy )
	end
	
	function FFABotsDifficultyButtonLeft( f56_arg0, f56_arg1 )
		BotsDifficultyButtonLeft( Lobby.BotTeams.FFA )
	end
	
	function BotsDifficultyButtonRight( f57_arg0 )
		if Lobby.GetBotsDifficulty then
			local f57_local0 = Lobby.GetBotsDifficulty( f57_arg0 ) + 1
			if Lobby.GetBotsDifficultyCount then
				if Lobby.GetBotsDifficultyCount() <= f57_local0 then
					f57_local0 = 0
				end
			else
				f57_local0 = 0
			end
			if Lobby.SetBotsDifficulty then
				SetBotsDifficulty( f57_arg0, f57_local0 )
			end
		end
	end
	
	function FriendlyBotsDifficultyButtonRight( f58_arg0, f58_arg1 )
		BotsDifficultyButtonRight( Lobby.BotTeams.Friendly )
	end
	
	function EnemyBotsDifficultyButtonRight( f59_arg0, f59_arg1 )
		BotsDifficultyButtonRight( Lobby.BotTeams.Enemy )
	end
	
	function FFABotsDifficultyButtonRight( f60_arg0, f60_arg1 )
		BotsDifficultyButtonRight( Lobby.BotTeams.FFA )
	end
	
	function FixTeamLimitsAndDifficultiesIfNecessary( f61_arg0, f61_arg1 )
		EnforceBotFeatureBanTeamLimits()
		local f61_local0 = BotIsTeamBased( f61_arg0 )
		local f61_local1 = BotIsTeamBased( f61_arg1 )
		if f61_local0 == 1 and f61_local1 == 0 then
			if Lobby.SetBotsTeamLimit and Lobby.GetBotsTeamLimit then
				local f61_local2 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.Friendly )
				local f61_local3 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.Enemy )
				if f61_local2 + f61_local3 > GetMaxBotLimit() then
					SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
					SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
					SetBotsTeamLimit( Lobby.BotTeams.FFA, GetMaxBotLimit() )
				else
					SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
					SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
					SetBotsTeamLimit( Lobby.BotTeams.FFA, f61_local2 + f61_local3 )
				end
			end
			if Lobby.SetBotsDifficulty and Lobby.GetBotsDifficulty then
				SetBotsDifficulty( Lobby.BotTeams.FFA, Lobby.GetBotsDifficulty( Lobby.BotTeams.Enemy ) )
			end
		elseif f61_local0 == 0 and f61_local1 == 1 then
			if Lobby.SetBotsTeamLimit and Lobby.GetBotsTeamLimit then
				local f61_local2 = GetMaxBotLimit()
				local f61_local3 = Lobby.GetBotsTeamLimit( Lobby.BotTeams.FFA )
				if f61_local2 < f61_local3 then
					f61_local3 = f61_local2
				end
				SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
				local f61_local4 = math.floor( f61_local3 / 2 )
				SetBotsTeamLimit( Lobby.BotTeams.Friendly, f61_local4 )
				if f61_local3 % 2 == 1 then
					SetBotsTeamLimit( Lobby.BotTeams.Enemy, f61_local4 + 1 )
				else
					SetBotsTeamLimit( Lobby.BotTeams.Enemy, f61_local4 )
				end
			end
			if Lobby.SetBotsDifficulty and Lobby.GetBotsDifficulty then
				local f61_local2 = Lobby.GetBotsDifficulty( Lobby.BotTeams.FFA )
				SetBotsDifficulty( Lobby.BotTeams.Friendly, f61_local2 )
				SetBotsDifficulty( Lobby.BotTeams.Enemy, f61_local2 )
			end
		end
	end
	
	function SetIsAliensSolo( f62_arg0 )
		if f62_arg0 then
			Engine.SetDvarBool( "xblive_privatematch_solo", true )
		else
			Engine.SetDvarBool( "xblive_privatematch_solo", false )
		end
	end
	
	function GetGameTypeIcon( f63_arg0 )
		return Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f63_arg0, GameTypesTable.Cols.Image )
	end
	
	function GetCurrentGameType()
		local f64_local0 = Engine.GetDvarString( "ui_gametype" )
		if MatchRules.IsUsingMatchRulesData() then
			f64_local0 = MatchRules.GetData( "gametype" )
		end
		return f64_local0
	end
	
	function IsCurrentGameTypeteamBased()
		local f65_local0 = GetCurrentGameType()
		local f65_local1
		if f65_local0 == "dm" or f65_local0 == "mugger" or f65_local0 == "sotf_ffa" or f65_local0 == "gun" then
			f65_local1 = false
		else
			f65_local1 = true
		end
		return f65_local1
	end
	
end
Lobby.PrivacySettings = {
	NumOptions = 2,
	Closed = 0,
	Open = 1,
	Texts = {
		[0] = "PATCH_MENU_CLOSED",
		[1] = "PATCH_MENU_OPEN"
	}
}
function GetPrivateMatchPlayerLimits( f66_arg0 )
	return Engine.GetDvarInt( "party_maxPrivatePartyPlayers" )
end

function GetTeamLimitForMaxPlayers( f67_arg0 )
	return f67_arg0
end

function GetPartyMaxPlayers()
	local f68_local0 = Engine.GetDvarInt( "party_maxplayers" )
	if Engine.GetDvarBool( "xblive_privatematch" ) or Engine.InLobby() == false or Engine.GetOnlineGame() == false and Engine.GetSplitScreen() == true then
		local f68_local1 = GetPrivateMatchPlayerLimits()
		if f68_local0 ~= f68_local1 then
			Engine.SetDvarInt( "party_maxplayers", f68_local1 )
			f68_local0 = f68_local1
			if Engine.InLobby() then
				Engine.Exec( "xtogprivateslots;	xtogprivateslots; xsessionupdate;" )
			end
		end
	end
	return f68_local0
end

function IsOnlineMatch()
	return Engine.GetOnlineGame() == true
end

function LeaveLobby( f70_arg0 )
	if AreWePrivatePartyHost() then
		Engine.Exec( "xstoplobbybackout leavelobbywarning", f70_arg0 )
	else
		Engine.Exec( "xstopparty leavelobbywarning", f70_arg0 )
	end
	LeaveLobby_NoStopParty( f70_arg0 )
end

function LeaveLobby_NoStopParty( f71_arg0 )
	MLG.SetMLGRulesEnabled( false )
	local f71_local0 = Engine.GetSystemLink()
	if f71_local0 then
		f71_local0 = Lobby.IsPrivatePartyHostInLobby()
	end
	if f71_local0 == false then
		Engine.Exec( "xblive_privatematch 0", f71_arg0 )
	end
	SetIsAliensSolo( false )
	Engine.SetDvarBool( "squad_match", false )
	if Lobby.BotsAreAllowed() then
		SetBotsConnectType( 0 )
		SetBotsDifficulty( Lobby.BotTeams.Friendly, 1 )
		SetBotsDifficulty( Lobby.BotTeams.Enemy, 1 )
		SetBotsDifficulty( Lobby.BotTeams.FFA, 1 )
		SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
		SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
		SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
	end
end

function LeaveLobbyAndParty( f72_arg0 )
	local f72_local0 = Engine.Exec
	if f72_arg0 then
		f72_local0 = Engine.ExecNow
	end
	f72_local0( "xstopparty leavelobbyandpartywarning" )
	f72_local0( "xstopprivateparty" )
	f72_local0( "xstartprivateparty" )
	f72_local0( "xblive_privatematch 0" )
	SetIsAliensSolo( false )
	Engine.SetDvarBool( "squad_match", false )
	if Lobby.BotsAreAllowed() then
		SetBotsConnectType( 0 )
		SetBotsDifficulty( Lobby.BotTeams.Friendly, 1 )
		SetBotsDifficulty( Lobby.BotTeams.Enemy, 1 )
		SetBotsDifficulty( Lobby.BotTeams.FFA, 1 )
		SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
		SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
		SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
	end
end

function LeaveXboxLive()
	local f73_local0 = Engine.GetFirstActiveController()
	Engine.ExecNow( "xstopprivateparty", f73_local0 )
	Cac.NotifyVirtualLobby( "leave_lobby", Engine.GetXUIDByController( f73_local0 ) )
	Engine.SetOnlineGame( false )
	Engine.SetSplitScreen( false )
	Engine.ExecNow( "forcesplitscreencontrol menu_xboxlive_CLOSE", f73_local0 )
end

function PromptToLeaveLobby( f74_arg0, f74_arg1, f74_arg2, f74_arg3 )
	if IsOurPrivatePartyHostInLobby() then
		LUI.FlowManager.RequestAddMenu( f74_arg0, "leavelobbyandpartywarning", true, f74_arg1.controller, false, {
			extraYesAction = f74_arg2,
			extraMessage = f74_arg3
		} )
	else
		LUI.FlowManager.RequestAddMenu( f74_arg0, "leavelobbywarning", true, f74_arg1.controller, false, {
			extraYesAction = f74_arg2,
			extraMessage = f74_arg3
		} )
	end
end

