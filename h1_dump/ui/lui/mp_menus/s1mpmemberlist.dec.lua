local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.UIMemberList = {}
if Engine.IsConsoleGame() then
	function GetTalkIconState( f1_arg0, f1_arg1, f1_arg2 )
		if not Lobby.IsMemberHeadsetConnected( f1_arg0, f1_arg1, f1_arg2 ) then
			return "inactive"
		elseif Lobby.IsMemberBlocked( f1_arg0, f1_arg1, f1_arg2 ) then
			return "blocked"
		elseif Lobby.IsMemberMuted( f1_arg0, f1_arg1, f1_arg2 ) then
			if Lobby.IsMemberTalking( f1_arg0, f1_arg1, f1_arg2 ) then
				return "muted_talking"
			else
				return "muted"
			end
		elseif Lobby.IsMemberTalking( f1_arg0, f1_arg1, f1_arg2 ) then
			return "talking"
		else
			return "quiet"
		end
	end
	
else
	function GetTalkIconState( f2_arg0, f2_arg1, f2_arg2 )
		if Lobby.IsMemberMuted( f2_arg0, f2_arg1, f2_arg2 ) then
			return "muted"
		elseif Lobby.IsMemberTalking( f2_arg0, f2_arg1, f2_arg2 ) then
			return "talking"
		else
			return "inactive"
		end
	end
	
end
function LobbyMemberGetLocalPlayerTeam( f3_arg0 )
	local f3_local0 = Engine.GetFirstActiveController()
	if Lobby.GetLocalPlayerTeam then
		return Lobby.GetLocalPlayerTeam( f3_arg0, f3_local0 )
	else
		return Teams.allies
	end
end

f0_local0 = function ( f4_arg0, f4_arg1 )
	if f4_arg0 == Lobby.MemberListStates.Teams then
		local f4_local0 = Teams.allies
		local f4_local1 = Teams.axis
		local f4_local2 = LobbyMemberGetLocalPlayerTeam( f4_arg0 )
		if f4_local2 == Teams.axis or f4_local2 == Teams.allies then
			f4_local0 = f4_local2
			f4_local1 = otherTeamLookup[f4_local2]
		end
		local f4_local3 = Lobby.GetCurrentMemberCount( f4_arg0, f4_local0 )
		local f4_local4 = Lobby.GetCurrentMemberCount( f4_arg0, f4_local1 )
		local f4_local5 = Lobby.GetCurrentMemberCount( f4_arg0, Teams.spectator )
		if f4_arg1 < f4_local3 then
			return f4_arg1
		elseif f4_arg1 < f4_local3 + f4_local4 then
			return f4_arg1 - f4_local3
		elseif f4_arg1 < f4_local3 + f4_local4 + f4_local5 then
			return f4_arg1 - f4_local3 - f4_local4
		else
			return f4_arg1 - f4_local3 - f4_local4 - f4_local5
		end
	else
		return f4_arg1
	end
end

f0_local1 = function ( f5_arg0, f5_arg1 )
	if f5_arg0 == Lobby.MemberListStates.Teams then
		local f5_local0 = Teams.allies
		local f5_local1 = Teams.axis
		local f5_local2 = LobbyMemberGetLocalPlayerTeam( f5_arg0 )
		if f5_local2 == Teams.axis or f5_local2 == Teams.allies then
			f5_local0 = f5_local2
			f5_local1 = otherTeamLookup[f5_local2]
		end
		local f5_local3 = Lobby.GetCurrentMemberCount( f5_arg0, f5_local0 )
		local f5_local4 = Lobby.GetCurrentMemberCount( f5_arg0, f5_local1 )
		local f5_local5 = Lobby.GetCurrentMemberCount( f5_arg0, Teams.spectator )
		if f5_arg1 < f5_local3 then
			return f5_local0
		elseif f5_arg1 < f5_local3 + f5_local4 then
			return f5_local1
		elseif f5_arg1 < f5_local3 + f5_local4 + f5_local5 then
			return Teams.spectator
		else
			return Teams.free
		end
	else
		return Teams.free
	end
end

f0_local2 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	if f6_arg0 and not LobbyMemberIsBot( f6_arg1, f6_arg2, f6_arg3 ) and Lobby.UsingReadyUpFeature() then
		if Lobby.GetMemberReadyUpFlag( f6_arg1, f6_arg2, f6_arg3 ) == true then
			return "ready"
		else
			return "notready"
		end
	else
		return "hidden"
	end
end

local f0_local3 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	local f7_local0 = f7_arg0.isActiveMemberSlot
	f7_arg0.memberListState = LobbyMemberListGetState( f7_arg1 )
	f7_arg0.memberSlot = f7_arg2
	f7_arg0.slot = f0_local0( f7_arg0.memberListState, f7_arg2 )
	f7_arg0.team = f0_local1( f7_arg0.memberListState, f7_arg2 )
	f7_arg0.isActiveMemberSlot = Lobby.IsActiveMemberSlot( f7_arg2 )
	f7_arg0.isBot = LobbyMemberIsBot( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
	if f7_arg0.isBot then
		f7_arg0.isLocalMember = false
		f7_arg0.isInPrivateParty = false
		f7_arg0.showHostIcon = false
	else
		f7_arg0.isLocalMember = Lobby.IsMemberALocalPlayer( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
		f7_arg0.isInPrivateParty = Lobby.IsMemberInPrivateParty( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
		f7_arg0.showHostIcon = Lobby.ShowMemberPrivatePartyHostIcon( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
	end
	if f7_arg0.isActiveMemberSlot then
		if f7_local0 == false and f7_arg0.isLocalMember == true then
			Cac.SetVirtualLobbyLoadout( -1 )
		end
		if f7_arg4 then
			f7_arg0.privateTeam = Lobby.GetPrivateMatchTeam( f7_arg0.memberSlot, Engine.GetFirstActiveController() ) + 1
		end
		f7_arg0.gamerTag = CoD.FormatClanAndGamerTags( Lobby.GetMemberClanTag( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team ), Lobby.GetMemberName( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team ) )
		if Engine.GetDvarInt( "scr_game_division" ) == 1 and not f7_arg0.isLocalMember and not f7_arg0.isInPrivateParty then
			f7_arg0.memberRank = ""
			f7_arg0.memberRankIcon = RegisterMaterial( "ui_transparent" )
		else
			local f7_local1 = Lobby.GetMemberRank( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
			local f7_local2 = Lobby.GetMemberPrestigeLevel( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
			local f7_local3 = Lobby.GetMemberCustomRankIcons( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
			f7_arg0.memberRank = f7_local1
			f7_arg0.memberPrestige = f7_local2
			f7_arg0.rankIcons = f7_local3
			f7_arg0.memberRankIcon = RegisterMaterial( Rank.GetRankIcon( f7_local1, f7_local2, f7_local3 ) )
		end
		f7_arg0.xuid = Lobby.GetMemberXuid( f7_arg0.memberSlot )
		f7_arg0.background = Lobby.GetMemberBackground( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
		f7_arg0.emblem = Lobby.GetMemberPatch( f7_arg0.memberListState, f7_arg0.slot, f7_arg0.team )
	else
		if f7_arg0.isNonPlayingLocalClient then
			f7_arg0.gamerTag = Lobby.GetNonPlayingLocalClientText( f7_arg2 )
		elseif f7_arg4 then
			f7_arg0.gamerTag = Engine.Localize( "@LUA_MENU_EMPTY" )
		else
			f7_arg0.gamerTag = Engine.Localize( "@LUA_MENU_LOBBY_SEARCH_SEARCHING" )
		end
		f7_arg0.memberRankIcon = RegisterMaterial( "white" )
	end
	f7_arg0.isPublicLobby = f7_arg3
	f7_arg0.isPrivateLobby = f7_arg4
end

local f0_local4 = function ( f8_arg0, f8_arg1 )
	if f8_arg1.isBot then
		f8_arg0.gamerTag:animateToState( "default" )
	elseif f8_arg1.isLocalMember then
		f8_arg0.gamerTag:animateToState( "local_player" )
	elseif f8_arg1.isInPrivateParty then
		f8_arg0.gamerTag:animateToState( "private_party" )
	else
		f8_arg0.gamerTag:animateToState( "default" )
	end
end

local f0_local5 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0.properties
	if not f9_arg1 then
		f9_arg1 = {}
	end
	if f9_local0.isActiveMemberSlot and f9_local0.isTeamsVisible then
		local f9_local1 = LobbyMemberGetLocalPlayerTeam( f9_local0.memberListState )
		if f9_local0.team == f9_local1 then
			f9_arg0.focusBackground:animateToState( "team_allies" )
		elseif f9_local0.team == otherTeamLookup[f9_local1] then
			f9_arg0.focusBackground:animateToState( "team_axis" )
		else
			f9_arg0.focusBackground:animateToState( "team_free" )
		end
	elseif f9_local0.isPrivateLobby then
		if f9_local0.privateTeam == 2 then
			f9_arg0.focusBackground:animateToState( "team_allies" )
		elseif f9_local0.privateTeam == 3 then
			f9_arg0.focusBackground:animateToState( "team_axis" )
		elseif f9_local0.privateTeam == 4 then
			f9_arg0.focusBackground:animateToState( "team_free" )
		else
			f9_arg0.focusBackground:animateToState( "default" )
		end
	else
		f9_arg0.focusBackground:animateToState( "default" )
	end
end

function UpdateReadyUpFlag( f10_arg0, f10_arg1 )
	f10_arg0:animateToState( f10_arg1.memberButton.properties.memberReadyUpState, 0 )
end

local f0_local6 = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = tonumber( Lobby.GetMemberStat( f11_arg0, f11_arg1, f11_arg2, Lobby.MemberStatTypes.Score ) )
	local f11_local1
	if f11_arg0 ~= Lobby.MemberListStates.Prelobby then
		f11_local1 = Lobby.ShowMemberInfo( f11_arg0, f11_arg1, f11_arg2 )
		if f11_local1 then
			if f11_local0 == 0 then
				f11_local1 = false
			else
				f11_local1 = true
			end
		end
	else
		f11_local1 = false
	end
	return f11_local1
end

function HandleLobbyMemberUpdateScoreVisibility( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg0.properties
	if not f0_local6( f12_local0.memberListState, f12_local0.slot, f12_local0.team ) or Engine.IsAliensMode() then
		f12_arg0.score:animateToState( "hidden", 0 )
	elseif f12_local0.isFocused then
		f12_arg0.score:animateToState( "highlighted", 0 )
	else
		f12_arg0.score:animateToState( "default", 0 )
	end
end

function HandleLobbyMemberUpdateScore( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg0.properties
	if f0_local6( f13_local0.memberListState, f13_local0.slot, f13_local0.team ) then
		f13_arg0.score:setText( GetScore( f13_local0.memberListState, f13_local0.slot, f13_local0.team ) )
	else
		f13_arg0.score:setText( "" )
	end
end

function GetScore( f14_arg0, f14_arg1, f14_arg2 )
	return Lobby.GetMemberStat( f14_arg0, f14_arg1, f14_arg2, Lobby.MemberStatTypes.Score ) or ""
end

local f0_local7 = function ( f15_arg0, f15_arg1 )
	local f15_local0 = {
		memberListState = f15_arg0.properties.memberListState,
		memberSlot = f15_arg0.properties.memberSlot,
		team = f15_arg0.properties.team
	}
	if f15_arg0.properties.memberListState == Lobby.MemberListStates.Teams then
		f15_local0.memberSlot = f0_local0( f15_local0.memberListState, f15_local0.memberSlot )
	end
	if f15_arg0.properties.isPublicLobby then
		f15_local0.isPublicLobby = true
	end
	if f15_arg0.properties.isPrivateLobby then
		f15_local0.isPrivateLobby = true
	end
	local f15_local1 = f15_arg0:getRootParent()
	f15_local1.playerPopupOpen = true
	LUI.FlowManager.RequestPopupMenu( f15_arg0, "player_popup_party", true, f15_arg1.controller, false, f15_local0 )
end

local f0_local8 = function ( f16_arg0, f16_arg1, f16_arg2 )
	f0_local7( f16_arg2.lastFocus, f16_arg1 )
end

local f0_local9 = function ( f17_arg0, f17_arg1 )
	if f17_arg0.properties.isPrivateLobby and not f17_arg0.properties.isActiveMemberSlot and not f17_arg0.properties.isNonPlayingLocalClient then
		return true
	elseif f17_arg0.properties.isPublicLobby and not f17_arg0.properties.isActiveMemberSlot and not f17_arg0.properties.isNonPlayingLocalClient and Lobby.IsGameReadyToStart() then
		return true
	end
	local f17_local0 = 0
	local f17_local1 = GetPartyMaxPlayers()
	if f17_arg0.properties.memberListState == Lobby.MemberListStates.Lobby or f17_arg0.properties.memberListState == Lobby.MemberListStates.Teams then
		f17_local0 = math.max( f17_local1, Lobby.GetCurrentMemberCount( f17_arg0.properties.memberListState ) )
	else
		f17_local0 = Lobby.GetCurrentMemberCount( f17_arg0.properties.memberListState )
		local f17_local2 = Lobby.IsPrivatePartyHost()
		if f17_local2 then
			f17_local2 = not Engine.InLobby()
		end
		if Lobby.GetNonPlayingLocalClientCount() > 0 and f17_local2 then
			f17_local0 = f17_local0 + 1
		end
	end
	if f17_local0 - 1 < f17_arg0.properties.memberSlot then
		return true
	end
	return false
end

local f0_local10 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = "default"
	if Engine.InLobby() and f18_arg0.properties ~= nil and f18_arg0.properties.memberSlot ~= nil then
		local f18_local1, f18_local2, f18_local3 = Engine.PartyMemberMissingMapPack( f18_arg0.properties.memberSlot )
		if f18_local1 then
			f18_local0 = "missing_map"
		end
	end
	f18_arg0.missingMap:animateToState( f18_local0 )
end

local f0_local11 = function ( f19_arg0, f19_arg1 )
	if f19_arg0.properties.isActiveMemberSlot and f19_arg0.properties.hasRank > 0 then
		f19_arg0.rankIcon:setImage( f19_arg0.properties.memberRankIcon )
		f19_arg0.rankIcon:animateToState( "default" )
	end
end

local f0_local12 = function ( f20_arg0, f20_arg1 )
	f20_arg0.gamerTag:animateToState( "inactive" )
	f20_arg0.gamerTag:setText( f20_arg0.properties.gamerTag )
end

local f0_local13 = function ( f21_arg0, f21_arg1 )
	f0_local4( f21_arg0, f21_arg0.properties )
	f21_arg0.gamerTag:setText( f21_arg0.properties.gamerTag )
end

local f0_local14 = function ( f22_arg0, f22_arg1 )
	if f22_arg0.properties.isActiveMemberSlot and f22_arg0.properties.hasRank > 0 then
		f22_arg0.memberRank:animateToState( "default" )
		f22_arg0.memberRank:setText( Rank.GetRankDisplay( f22_arg0.properties.memberRank ) )
	end
end

local f0_local15 = function ( f23_arg0, f23_arg1 )
	if f0_local9( f23_arg0, f23_arg1 ) then
		f23_arg0:animateToState( "hidden" )
		f23_arg0.disabledSFX = nil
	end
	f23_arg0.iconList.partyLeaderIcon:animateToState( "default" )
	f23_arg0.iconList.micIcon:animateToState( "inactive" )
	f23_arg0.iconList.micIcon.properties.currentMicState = "inactive"
	if f23_arg0.id ~= "listPlayercard" then
		HandleLobbyMemberUpdateScore( f23_arg0, f23_arg1 )
		HandleLobbyMemberUpdateScoreVisibility( f23_arg0, f23_arg1 )
		f0_local12( f23_arg0, f23_arg1 )
		f23_arg0.rankIcon:animateToState( "inactive" )
		f23_arg0.memberRank:animateToState( "inactive" )
	end
end

local f0_local16 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = "default"
	if f0_local9( f24_arg0, f24_arg1 ) then
		f24_local0 = "hidden"
	else
		f24_arg0.disabledSFX = CoD.SFX.MenuAcceptDisabled
	end
	f24_arg0:animateToState( f24_local0 )
	if f24_arg0.properties.showHostIcon then
		f24_arg0.iconList.partyLeaderIcon:animateToState( "visible" )
	else
		f24_arg0.iconList.partyLeaderIcon:animateToState( "default" )
	end
	if f24_arg0.id ~= "listPlayercard" then
		HandleLobbyMemberUpdateScore( f24_arg0, f24_arg1 )
		HandleLobbyMemberUpdateScoreVisibility( f24_arg0, f24_arg1 )
		f0_local10( f24_arg0, f24_arg1 )
		f0_local11( f24_arg0, f24_arg1 )
		f0_local13( f24_arg0, f24_arg1 )
		f0_local14( f24_arg0, f24_arg1 )
		f0_local5( f24_arg0, f24_arg1 )
	else
		f24_arg0:feedContent( {
			background = f24_arg0.properties.background,
			emblem = f24_arg0.properties.emblem,
			xuid = f24_arg0.properties.xuid,
			gamertag = f24_arg0.properties.gamerTag,
			rank = f24_arg0.properties.memberRank,
			prestige = f24_arg0.properties.memberPrestige,
			rankIcons = f24_arg0.properties.rankIcons
		} )
	end
end

local f0_local17 = function ( f25_arg0 )
	f0_local3( f25_arg0.properties, f25_arg0.properties.memberListState, f25_arg0.properties.memberSlot, f25_arg0.properties.isPublicLobby, f25_arg0.properties.isPrivateLobby )
	local f25_local0 = Lobby.IsSearching()
	local f25_local1 = f25_arg0.properties.memberListState == Lobby.MemberListStates.Prelobby
	if not f25_arg0.properties.isActiveMemberSlot then
		f25_arg0.disabled = true
	else
		f25_arg0.disabled = nil
	end
	f0_local16( f25_arg0 )
	if not f25_arg0.properties.isActiveMemberSlot then
		f0_local15( f25_arg0 )
		if f25_arg0:isInFocus() then
			f25_arg0:processEvent( {
				name = "lose_focus"
			} )
			f25_arg0:makeNotFocusable()
			f25_arg0:dispatchEventToRoot( {
				name = "member_list_refocus"
			} )
		else
			f25_arg0:makeNotFocusable()
		end
	else
		f25_arg0:makeFocusable()
	end
end

local f0_local18 = function ( f26_arg0, f26_arg1 )
	local f26_local0 = Lobby.IsActiveMemberSlot( f26_arg0.properties.memberSlot )
	if f26_arg1 then
		local f26_local1 = true
	else
		local f26_local1 = false
	end
	local f26_local2, f26_local3, f26_local4 = Engine.PartyMemberMissingMapPack( f26_arg0.properties.memberSlot )
	if f26_arg0.properties.isMissingPack ~= f26_local2 then
		f26_arg0.properties.isMissingPack = f26_local2
		local f26_local1 = true
	end
	local f26_local5 = Lobby.IsGameReadyToStart()
	if f26_arg0.properties.isGameReadyToStart ~= f26_local5 then
		f26_arg0.properties.isGameReadyToStart = f26_local5
		local f26_local1 = true
	end
	local f26_local6 = IsTeamsVisible()
	if f26_arg0.properties.isTeamsVisible ~= f26_local6 then
		f26_arg0.properties.isTeamsVisible = f26_local6
		local f26_local1 = true
	end
	local f26_local1
	if f26_arg0.properties.memberListState ~= Lobby.MemberListStates.Lobby and f26_arg0.properties.memberListState ~= Lobby.MemberListStates.Teams then
		if f26_arg0.properties.slot < GetPartyMaxPlayers() and f26_arg0.properties.slot == Lobby.GetCurrentMemberCount( f26_arg0.properties.memberListState ) and Lobby.GetNonPlayingLocalClientCount() > 0 then
			f26_arg0.properties.isNonPlayingLocalClient = true
		else
			local f26_local7 = Lobby.GetNonPlayingLocalClientCount()
			if f26_arg0.properties.isNonPlayingLocalClient then
				f26_local1 = true
			end
			f26_arg0.properties.isNonPlayingLocalClient = nil
		end
	else
		if f26_arg0.properties.isNonPlayingLocalClient then
			f26_local1 = true
		end
		f26_arg0.properties.isNonPlayingLocalClient = nil
	end
	local f26_local8 = f26_local1
	local f26_local9 = f26_arg0.properties.isNonPlayingLocalClient
	if not f26_local9 then
		if f26_local0 == f26_arg0.properties.isActiveMemberSlot and (not f26_local0 or f26_arg0.properties.xuid == Lobby.GetMemberXuid( f26_arg0.properties.memberSlot )) then
			local f26_local10 = f26_local0
			if f26_arg0.properties.showHostIcon == Lobby.ShowMemberPrivatePartyHostIcon( f26_arg0.properties.memberListState, f26_arg0.properties.slot, f26_arg0.properties.team ) then
				f26_local9 = false
			else
				f26_local9 = f26_local10 and (f26_local8 or true)
			end
		end
		f26_local9 = f26_local10 and (f26_local8 or true)
	end
	if f26_local0 == true and f26_local9 == false then
		if f26_arg0.properties.memberRank ~= Lobby.GetMemberRank( f26_arg0.properties.memberListState, f26_arg0.properties.slot, f26_arg0.properties.team ) or f26_arg0.properties.memberPrestige ~= Lobby.GetMemberPrestigeLevel( f26_arg0.properties.memberListState, f26_arg0.properties.slot, f26_arg0.properties.team ) then
			f26_local9 = true
		end
		if f26_arg0.properties.isPrivateLobby and f26_arg0.properties.privateTeam ~= Lobby.GetPrivateMatchTeam( f26_arg0.properties.memberSlot, Engine.GetFirstActiveController() ) + 1 then
			f26_local9 = true
		end
	end
	if f26_local9 then
		f0_local17( f26_arg0 )
	end
	if f26_arg0.properties.isActiveMemberSlot and not f26_arg0.properties.ignoreMic and f26_arg0.iconList then
		f26_arg0.iconList:dispatchEventToChildren( {
			name = "update_mic_icon",
			memberListState = f26_arg0.properties.memberListState,
			memberSlot = f26_arg0.properties.slot,
			team = f26_arg0.properties.team
		} )
	end
end

local f0_local19 = function ( f27_arg0, f27_arg1 )
	local f27_local0 = f27_arg0:getFirstChild()
	while f27_local0 do
		if f27_local0.properties and f27_local0.properties.processButtonUpdate then
			f0_local18( f27_local0 )
		end
		f27_local0 = f27_local0:getNextSibling()
	end
	f27_arg0:processEvent( {
		name = "update_navigation",
		dispatchChildren = true
	} )
end

local f0_local20 = function ( f28_arg0, f28_arg1 )
	local f28_local0 = f28_arg0:getRootParent()
	if not f28_local0.playerPopupOpen then
		if f28_arg0.lastFocus then
			f28_arg0:addElement( f28_arg0.lastFocus )
			if f28_arg0.playercard ~= nil and f28_arg0.playercard.iconList ~= nil then
				f28_arg0.playercard:removeElement( f28_arg0.playercard.iconList )
				f28_arg0.lastFocus:addElement( f28_arg0.playercard.iconList )
				f28_arg0.lastFocus.iconList:animateToState( "default", 0 )
				f28_arg0.playercard.iconList = nil
			end
			f0_local18( f28_arg0.lastFocus, true )
			f28_arg0.lastFocus = nil
		end
		if f28_arg0.playercard then
			f28_arg0:removeElement( f28_arg0.playercard )
			f28_arg0.playercard = nil
		end
		if Engine.GetDvarBool( "virtuallobbyactive" ) then
			local f28_local1 = Engine.GetXUIDByController( Engine.GetFirstActiveController() )
			if f28_local1 and f28_local1 ~= f28_local0.member_selected and f28_local0.member_selected ~= nil then
				f28_local0.member_selected = nil
				Engine.NotifyServerString( "member_select", f28_local1 )
				PersistentBackground.FadeFromBlackSlow()
				f28_arg0.menu.factionWidget:ShowHelpButtons()
			end
		end
	end
	LUI.UIElement.loseFocus( f28_arg0, f28_arg1 )
end

local f0_local21 = function ( f29_arg0, f29_arg1 )
	local f29_local0 = f29_arg0:getRootParent()
	f29_local0.playerPopupOpen = false
	LUI.UIVerticalList.gainFocus( f29_arg0, f29_arg1 )
end

local f0_local22 = function ( f30_arg0, f30_arg1 )
	f30_arg0:dispatchEventToRoot( {
		name = "lobby_detail_update",
		memberListState = f30_arg0.properties.memberListState,
		memberSlot = f30_arg0.properties.slot,
		team = f30_arg0.properties.team,
		dispatchChildren = true
	} )
	if Engine.GetDvarBool( "virtuallobbyactive" ) and f30_arg0.disabled ~= true then
		local f30_local0 = f30_arg0:getRootParent()
		local f30_local1 = f30_arg0.properties.xuid
		local f30_local2 = f30_local0.member_selected
		if f30_local1 ~= nil and f30_local1 ~= "0000000000000000" and f30_local1 ~= "0000000000000001" and (f30_local2 == nil or f30_local2 ~= f30_local1) then
			Engine.NotifyServerString( "member_select", f30_local1 )
			if f30_local0.member_selected ~= nil or f30_local0.member_selected == nil and not f30_arg0.properties.isLocalMember then
				PersistentBackground.FadeFromBlackSlow()
			end
			f30_local0.member_selected = f30_local1
		end
		if f30_arg0.properties.isLocalMember then
			f30_arg0.menu.factionWidget:ShowHelpButtons()
		else
			f30_arg0.menu.factionWidget:HideHelpButtons()
		end
	end
	f30_arg0:animateToState( "focused", 0 )
	HandleLobbyMemberUpdateScoreVisibility( f30_arg0, f30_arg1 )
	local f30_local0 = f30_arg0:getParent()
	if f30_local0 ~= nil then
		if f30_local0.lastFocus then
			f30_local0:addElement( f30_local0.lastFocus )
			if f30_local0.playercard ~= nil and f30_local0.playercard.iconList ~= nil then
				f30_local0.playercard:removeElement( f30_local0.playercard.iconList )
				f30_local0.lastFocus:addElement( f30_local0.playercard.iconList )
				f30_local0.lastFocus.iconList:animateToState( "default", 0 )
				f30_local0.playercard.iconList = nil
			end
			f0_local18( f30_local0.lastFocus, true )
		end
		local f30_local1 = f30_arg0:getPriority()
		f30_arg0:processEvent( {
			name = "lose_focus"
		} )
		local f30_local2 = f30_local0.lastFocus
		f30_local0.lastFocus = f30_arg0
		f30_local0:removeElement( f30_arg0 )
		if not f30_local0.playercard then
			f30_local0.playercard = LUI.FocusablePlayercard.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Top ), function ( f31_arg0, f31_arg1 )
				f0_local8( f31_arg0, f31_arg1, f30_local0 )
			end )
			f30_local0.playercard:makeFocusable()
			f30_local0.playercard.id = "listPlayercard"
		else
			f30_local0:removeElement( f30_local0.playercard )
		end
		f30_local0.playercard:feedContent( {
			background = f30_arg0.properties.background,
			emblem = f30_arg0.properties.emblem,
			xuid = f30_arg0.properties.xuid,
			gamertag = f30_arg0.properties.gamerTag,
			rank = f30_arg0.properties.memberRank,
			prestige = f30_arg0.properties.memberPrestige,
			rankIcons = f30_arg0.properties.rankIcons
		} )
		f30_local0.playercard.iconList = f30_local0.lastFocus.iconList
		if f30_local0.playercard.iconList ~= nil then
			f30_local0.lastFocus:removeElement( f30_local0.playercard.iconList )
			f30_local0.playercard:addElement( f30_local0.playercard.iconList )
			f30_local0.playercard.iconList:animateToState( "default", 0 )
		end
		f30_local0.playercard.properties = f30_arg0.properties
		f30_local0.playercard:setPriority( f30_local1 )
		f30_local0:addElement( f30_local0.playercard )
		f30_local0.playercard:processEvent( {
			name = "gain_focus"
		} )
	end
end

local f0_local23 = function ( f32_arg0, f32_arg1 )
	f32_arg0:animateToState( "unfocused", 0 )
	f0_local5( f32_arg0, f32_arg1 )
	HandleLobbyMemberUpdateScoreVisibility( f32_arg0, f32_arg1 )
end

local f0_local24 = function ( f33_arg0 )
	f0_local4( f33_arg0, f33_arg0.properties )
	if not f33_arg0.properties.ignoreMic then
		f33_arg0.iconList.micIcon:animateToState( "default" )
		f33_arg0.iconList.micIcon.properties.currentMicState = GetTalkIconState( f33_arg0.properties.memberListState, f33_arg0.properties.slot, f33_arg0.properties.team )
		f33_arg0.iconList.micIcon:animateToState( f33_arg0.iconList.micIcon.properties.currentMicState )
	end
	if f33_arg0.properties.showHostIcon then
		f33_arg0.iconList.partyLeaderIcon:animateToState( "visible" )
	else
		f33_arg0.iconList.partyLeaderIcon:animateToState( "default" )
	end
	if not f33_arg0.properties.isActiveMemberSlot then
		if f0_local6( f33_arg0.properties.memberListState, f33_arg0.properties.slot, f33_arg0.properties.team ) then
			f33_arg0.score:setText( GetScore( f33_arg0.properties.memberListState, f33_arg0.properties.slot, f33_arg0.properties.team ) )
		end
		f0_local15( f33_arg0 )
		f33_arg0:makeNotFocusable()
	else
		f33_arg0:makeFocusable()
	end
	if Engine.IsPC() then
		local f33_local0 = f33_arg0:getFirstDescendentById( "memberListButton_textContainer" )
		if f33_local0 then
			f33_local0:setUseStencil( true )
		end
	end
end

local f0_local25 = function ( f34_arg0, f34_arg1 )
	local f34_local0 = 24
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "icon_online_chat_quiet" ),
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f34_local0,
		alpha = 0
	} )
	self.id = "memberListButton_micIcon"
	self:registerAnimationState( "talking", {
		material = RegisterMaterial( "icon_online_chat" ),
		width = f34_local0,
		alpha = 1
	} )
	self:registerAnimationState( "muted", {
		material = RegisterMaterial( "icon_online_chat_mute_quiet" ),
		width = f34_local0,
		alpha = 1
	} )
	self:registerAnimationState( "muted_talking", {
		material = RegisterMaterial( "icon_online_chat_mute" ),
		width = f34_local0,
		alpha = 1
	} )
	self:registerAnimationState( "quiet", {
		material = RegisterMaterial( "icon_online_chat_quiet" ),
		width = f34_local0,
		alpha = 1
	} )
	self:registerAnimationState( "blocked", {
		width = 0,
		alpha = 0
	} )
	self:registerAnimationState( "inactive", {
		alpha = 0,
		width = 0
	} )
	self:registerEventHandler( "update_mic_icon", function ( element, event )
		local f35_local0 = GetTalkIconState( event.memberListState, event.memberSlot, event.team )
		if f35_local0 ~= element.properties.currentMicState then
			element.properties.currentMicState = f35_local0
			element:animateToState( f35_local0 )
		end
	end )
	f34_arg0:addElement( self )
	self.properties = {}
	f34_arg0.micIcon = self
	
	local partyLeaderIcon = LUI.UIImage.new( {
		material = RegisterMaterial( "icon_party_leader" ),
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f34_local0,
		alpha = 0
	} )
	partyLeaderIcon.id = "memberListButton_partyLeaderIcon"
	partyLeaderIcon:registerAnimationState( "visible", {
		alpha = 1
	} )
	f34_arg0:addElement( partyLeaderIcon )
	f34_arg0.partyLeaderIcon = partyLeaderIcon
	
end

local f0_local26 = function ( f36_arg0, f36_arg1 )
	local f36_local0 = 24
	local f36_local1 = 18
	local f36_local2 = f36_local0 - 2
	local f36_local3 = CoD.TextSettings.BodyFontVeryTiny
	local f36_local4 = f36_local3.Height * 0.9
	local f36_local5 = f36_local3
	local f36_local6 = true
	local f36_local7 = 0
	if Engine.IsPC() then
		f36_local6 = false
		f36_local7 = 260
	end
	local f36_local8 = GameX.IsRankedMatch() and 1 or 0
	local f36_local9 = 1
	local f36_local10 = f36_local2 + f36_local1
	local f36_local11 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "black" ),
		alpha = 0.5
	}
	local f36_local12 = {
		gamerTag = " ",
		xuid = "0000000000000001",
		memberRank = "0",
		memberRankIcon = RegisterMaterial( "icon_mp_rank" ),
		memberListState = Lobby.MemberListStates.None,
		memberSlot = f36_arg1,
		slot = f36_arg1,
		team = Lobby.Teams.Free,
		hasRank = f36_local8,
		buttonHeight = f36_local0,
		isMLGSpectator = false,
		memberReadyUpState = nil,
		button_action_func = f0_local7,
		processButtonUpdate = true,
		ignoreMic = f36_arg0.ignoreMic,
		isNonPlayingLocalClient = f36_arg0.isNonPlayingLocalClient
	}
	local self = LUI.UIButton.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = f36_local0,
		alpha = 1
	} )
	self.id = "memberListButton"
	self.properties = f36_local12
	self.menu = f36_arg0.menu
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "button_action", f0_local7 )
	self:animateToState( "hidden" )
	
	local focusBackground = LUI.UIImage.new( f36_local11 )
	focusBackground.id = "memberListButton_focusBg"
	focusBackground:registerAnimationState( "team_axis", {
		material = RegisterMaterial( "white" ),
		color = Colors.h1.enemy_red,
		alpha = 0.35
	} )
	focusBackground:registerAnimationState( "team_allies", {
		material = RegisterMaterial( "white" ),
		color = Colors.h1.ally_blue,
		alpha = 0.35
	} )
	focusBackground:registerAnimationState( "team_free", {
		material = RegisterMaterial( "white" ),
		color = Colors.s1Hud_contractedYellow,
		alpha = 0.35
	} )
	self:addElement( focusBackground )
	self.focusBackground = focusBackground
	
	local f36_local15 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f36_local15.borderThickness = 1
	f36_local15.color = Colors.h1.dark_grey
	self:addElement( LUI.UIBorder.new( f36_local15 ) )
	
	local missingMap = LUI.UIImage.new( {
		alpha = 0
	} )
	missingMap.id = "missing_map_id"
	missingMap:registerAnimationState( "missing_map", {
		material = RegisterMaterial( "white" ),
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		color = Colors.orange,
		alpha = 0.25
	} )
	self:addElement( missingMap )
	self.missingMap = missingMap
	
	local rankIcon = LUI.UIImage.new( {
		material = RegisterMaterial( MBh.Property( "memberRankIcon" ) ),
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = 1,
		height = f36_local2,
		width = f36_local2,
		alpha = f36_local9
	} )
	rankIcon.id = "memberListButton_rankIcon"
	rankIcon:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local f36_local18 = 4
	local f36_local19 = nil
	if f36_local8 == 1 then
		f36_local19 = f36_local10 + f36_local18 + 1
	else
		f36_local19 = 6
	end
	local gamerTag = LUI.UIText.new( {
		horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft,
		font = f36_local3.Font,
		leftAnchor = true,
		rightAnchor = f36_local6,
		topAnchor = false,
		bottomAnchor = false,
		left = f36_local19,
		right = f36_local7,
		height = f36_local4,
		color = Colors.white,
		alpha = 1
	} )
	gamerTag.id = "memberListButton_gamerTag"
	gamerTag.properties = {
		text = MBh.Property( "gamerTag" )
	}
	gamerTag:registerAnimationState( "inactive", {
		font = f36_local5.Font,
		leftAnchor = true,
		rightAnchor = f36_local6,
		topAnchor = false,
		bottomAnchor = false,
		left = 6,
		top = -5,
		right = f36_local7,
		height = f36_local5.Height,
		color = Colors.white,
		alpha = 0.25
	} )
	gamerTag:registerAnimationState( "local_player", {
		horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft,
		font = f36_local3.Font,
		leftAnchor = true,
		rightAnchor = f36_local6,
		topAnchor = false,
		bottomAnchor = false,
		left = f36_local19,
		right = f36_local7,
		height = f36_local4,
		color = Colors.mw1_green,
		alpha = 1
	} )
	gamerTag:registerAnimationState( "private_party", {
		horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft,
		font = f36_local3.Font,
		leftAnchor = true,
		rightAnchor = f36_local6,
		topAnchor = false,
		bottomAnchor = false,
		left = f36_local19,
		right = f36_local7,
		height = f36_local4,
		color = Colors.frontend_private_party_player_name,
		alpha = 1
	} )
	if Engine.IsPC() and gamerTag.setupAutoScaleText then
		gamerTag:setupAutoScaleText()
	end
	self:addElement( gamerTag )
	self.gamerTag = gamerTag
	
	local memberRank = LUI.UIText.new( {
		horizontalAlignment = LUI.HorizontalAlignment.Center,
		font = f36_local3.Font,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = f36_local0 + 1,
		width = f36_local1,
		height = f36_local4,
		color = Colors.yellow,
		alpha = f36_local9
	} )
	memberRank.id = "memberListButton_memberRank"
	memberRank:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:addElement( memberRank )
	self.memberRank = memberRank
	
	local score = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -1 * f36_local4 * 0.5,
		bottom = f36_local4 * 0.5,
		left = 0,
		right = -5,
		font = f36_local3.Font,
		alignment = LUI.Alignment.Right,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	score.id = "member_button_score_id"
	score.properties = {}
	score:registerAnimationState( "hidden", {
		alpha = 0
	} )
	score:registerAnimationState( "highlighted", {
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self:addElement( score )
	self.score = score
	
	local f36_local23 = f36_local0 / 2
	
	local iconList = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -f36_local0,
		top = -f36_local23,
		right = 0,
		bottom = f36_local23,
		alignment = LUI.Alignment.Right
	} )
	iconList.id = "memberListHorizontalIconList_id"
	iconList.properties = {
		buttonLength = MBh.Property( "buttonHeight" ),
		isMLG = MBh.Property( "isMLGSpectator" )
	}
	f0_local25( iconList, self )
	self:addElement( iconList )
	self.iconList = iconList
	
	self:registerEventHandler( "state_activated", f0_local7 )
	self:registerEventHandler( "button_over", f0_local22 )
	self:registerEventHandler( "button_up", f0_local23 )
	self:registerEventHandler( "member_slot_inactive", f0_local15 )
	self:registerEventHandler( "member_slot_refresh", f0_local16 )
	f0_local24( self )
	return self
end

local f0_local27 = function ( f37_arg0 )
	local f37_local0 = f37_arg0.properties
	f37_local0.memberListState = LobbyMemberListGetState( f37_local0.memberListState )
	local f37_local1 = 18
	for f37_local2 = 0, f37_local1 - 1, 1 do
		local f37_local5 = f0_local26( f37_local0, f37_local2 )
		f37_local5.id = "memberbtn_" .. f37_local2
		f0_local3( f37_local5.properties, f37_local0.memberListState, f37_local2, f37_local0.isPublicLobby, f37_local0.isPrivateLobby )
		if not f37_local5.properties.isActiveMemberSlot then
			f37_local5.disabled = true
		else
			f37_local5.disabled = nil
		end
		f37_local5:setPriority( f37_local2 )
		f37_arg0:addElement( f37_local5 )
	end
	f37_arg0.properties = f37_local0
end

local f0_local28 = function ( f38_arg0, f38_arg1 )
	local f38_local0 = f38_arg0:getFirstChild()
	while f38_local0 do
		if f38_local0.properties and f38_local0.properties.processButtonUpdate and f38_local0.properties.memberListState >= Lobby.MemberListStates.Lobby then
			f0_local18( f38_local0, true )
		end
		f38_local0 = f38_local0:getNextSibling()
	end
end

LUI.UIMemberList.new = function ( f39_arg0 )
	local self = LUI.UIVerticalList.new( {
		alignment = LUI.Alignment.Top,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		width = CoD.DesignGridHelper( 6, 1 ),
		spacing = 0
	}, true )
	self.numActiveSlots = 0
	self:registerEventHandler( "menu_refresh", f0_local28 )
	self:registerEventHandler( "member_list_update", f0_local19 )
	self:registerEventHandler( "member_list_refocus", function ( element, event )
		element:processEvent( {
			name = "gain_focus"
		} )
	end )
	self:registerEventHandler( "lose_focus", f0_local20 )
	self:registerEventHandler( "gain_focus", f0_local21 )
	assert( f39_arg0.memberListState, "Member list needs initial state" )
	self.properties = f39_arg0
	self.menu = f39_arg0.menu
	f0_local27( self )
	self:processEvent( {
		name = "update_navigation"
	} )
	return self
end

LockTable( _M )
