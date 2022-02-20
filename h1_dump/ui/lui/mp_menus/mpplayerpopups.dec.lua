local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
if not LobbyMember then
	LobbyMember = {}
end
LobbyMember.ReportPlayerButtonAction = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestPopupMenu( f1_arg0, "popup_friend_report", true, f1_arg1.controller, false, {
		friendIndex = -1,
		reportFunction = LobbyMember.SelectedMember_Report,
		confirmationAction = function ( f2_arg0, f2_arg1, f2_arg2 )
			LUI.FlowManager.RequestAddMenu( f2_arg0, "popup_confirm_report", true, controller, false, {
				message_text = f2_arg2
			} )
		end
	} )
end

LobbyMember.Options = {
	xboxProfile = {
		text = "@XBOXLIVE_VIEW_PROFILE",
		action = LobbyMember.SelectedMember_ShowGamerCard,
		disabled = function ()
			return not Engine.GetDvarBool( "party_playervisible" )
		end
	},
	psSendFriendInvite = {
		text = "@XBOXLIVE_ADDFRIEND",
		action = LobbyMember.SelectedMember_AddFriend,
		disabled = function ()
			local f4_local0
			if Engine.GetDvarBool( "party_playervisible" ) then
				f4_local0 = Engine.GetDvarBool( "party_IsLocalClientSelected" )
				if not f4_local0 then
					f4_local0 = LobbyMember.SelectedMember_IsFriend()
					if not f4_local0 then
						f4_local0 = LobbyMember.SelectedMember_IsGuest()
					end
				end
			else
				f4_local0 = true
			end
			return f4_local0
		end
	},
	inviteToClan = {
		text = "@LUA_MENU_CLAN_INVITE_TO_CLAN",
		action = function ( f5_arg0, f5_arg1 )
			if Engine.IsChatRestricted() then
				LUI.FlowManager.RequestAddMenu( f5_arg0, "user_generated_content_restriction_popup", true, f5_arg1.controller )
			else
				LobbyMember.SelectedMember_InviteToClan( f5_arg1.controller )
			end
		end,
		disabled = function ( f6_arg0 )
			local f6_local0
			if LobbyMember.SelectedMember_CanInviteToClan( f6_arg0 ) and Engine.GetDvarBool( "party_playervisible" ) then
				f6_local0 = LobbyMember.SelectedMember_IsGuest()
			else
				f6_local0 = true
			end
			return f6_local0
		end,
		muteInLobbyList = Engine.IsChatRestricted()
	},
	viewClan = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0 = Lobby.GetMemberName( f7_arg0, f7_arg1, f7_arg2 )
		return {
			text = "@CLANS_VIEW_CLAN",
			action = function ( f8_arg0, f8_arg1 )
				if not CoDAnywhere.ServiceAvailable( f8_arg1.controller ) then
					LUI.FlowManager.RequestAddMenu( f8_arg0, "generic_confirmation_popup", true, f8_arg1.controller, false, {
						popup_title = Engine.Localize( "MENU_ERROR" ),
						message_text = Engine.Localize( "LUA_MENU_COD_ANYWHERE_ERROR_SERVICE" )
					} )
				elseif not CoDAnywhere.HasUCDAccount( f8_arg1.controller ) then
					LUI.FlowManager.RequestAddMenu( f8_arg0, "generic_confirmation_popup", true, f8_arg1.controller, false, {
						popup_title = Engine.Localize( "MENU_NOTICE" ),
						message_text = Engine.Localize( "LUA_MENU_COD_ACCOUNT_REQUIRED" )
					} )
				else
					LobbyMember.SelectedMember_FetchClan( f8_arg1.controller )
					LUI.FlowManager.RequestAddMenu( f8_arg0, "ClanProfileMenu", true, f8_arg1.controller, false, {
						remoteView = true,
						remotePlayerName = f7_local0
					} )
				end
			end
			,
			disabled = function ( f9_arg0 )
				local f9_local0 = LobbyMember.SelectedMember_IsGuest()
				if not f9_local0 then
					if Engine.GetDvarBool( "party_playervisible" ) then
						f9_local0 = not Lobby.IsInClan( f7_arg0, f7_arg1, f7_arg2, f9_arg0 )
					else
						f9_local0 = true
					end
				end
				return f9_local0
			end
			
		}
	end,
	toggleMute = {
		text = "@XBOXLIVE_PLAYER_MUTE",
		action = LobbyMember.SelectedMember_ToggleMute,
		disabled = function ()
			local f10_local0 = Engine.GetDvarBool( "party_IsLocalClientSelected" )
			if not f10_local0 then
				if Engine.GetDvarBool( "party_playervisible" ) then
					f10_local0 = LobbyMember.SelectedMember_IsAway()
				else
					f10_local0 = true
				end
			end
			return f10_local0
		end
	},
	showCommonGroups = {
		text = "@MENU_SHOW_COMMON_GROUPS",
		action = LobbyMember.SelectedMember_ShowCommonGroups,
		disabled = function ()
			local f11_local0 = Engine.GetDvarBool( "party_IsLocalClientSelected" )
			if not f11_local0 then
				f11_local0 = not Engine.GetDvarBool( "party_playervisible" )
			end
			return f11_local0
		end,
		exclude = function ( f12_arg0 )
			return not Engine.UserGroupsAllowed( f12_arg0 )
		end
	},
	tryMigrateHost = {
		text = "@MPUI_SETASHOST",
		action = LobbyMember.SelectedMember_TryMigrateHost,
		disabled = function ()
			local f13_local0
			if Lobby.IsPrivatePartyHost() and Engine.GetDvarBool( "party_playervisible" ) then
				f13_local0 = Engine.GetDvarBool( "party_IsLocalClientSelected" )
				if not f13_local0 then
					f13_local0 = LobbyMember.SelectedMember_IsAway()
					if not f13_local0 then
						f13_local0 = IsPrivateMatch()
					end
				end
			else
				f13_local0 = true
			end
			return f13_local0
		end
	},
	reportPlayer = {
		text = "@MENU_REPORT_PLAYER",
		action = LobbyMember.ReportPlayerButtonAction,
		disabled = function ()
			local f14_local0 = Engine.GetDvarBool( "party_IsLocalClientSelected" )
			if not f14_local0 then
				f14_local0 = not Engine.GetDvarBool( "party_playervisible" )
			end
			return f14_local0
		end,
		muteInLobbyList = true
	},
	kickPlayer = {
		text = "@XBOXLIVE_KICK",
		action = LobbyMember.SelectedMember_TryKick,
		disabled = function ()
			local f15_local0 = Lobby.IsPrivatePartyHost()
			if f15_local0 then
				f15_local0 = not Engine.InLobby()
			end
			local f15_local1 = Lobby.IsGameHost()
			if f15_local1 then
				f15_local1 = IsPrivateMatch()
				if not f15_local1 then
					f15_local1 = Engine.GetSystemLink()
				end
			end
			local f15_local2 = f15_local1 or f15_local0
			local f15_local3 = Engine.GetDvarBool( "party_playervisible" )
			local f15_local4 = Engine.GetDvarBool( "party_IsLocalClientSelected" )
			local f15_local5
			if f15_local2 and f15_local3 then
				f15_local5 = f15_local4
			else
				f15_local5 = true
			end
			return f15_local5
		end,
		muteInLobbyList = true
	}
}
f0_local0 = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	local f16_local0 = Engine.IsXbox360()
	if not f16_local0 then
		f16_local0 = Engine.IsXB3()
		if not f16_local0 then
			f16_local0 = Engine.IsPCApp()
		end
	end
	local f16_local1 = {}
	if Lobby.IsMemberABot( f16_arg0, f16_arg1, f16_arg2 ) then
		return {
			{
				text = "@LUA_MENU_REMOVE_BOT",
				customActionFunc = function ( f17_arg0, f17_arg1 )
					Lobby.RemoveMemberBot( f16_arg0, f16_arg1, f16_arg2 )
				end
				,
				disabled = function ()
					return not Lobby.IsPrivatePartyHost()
				end
				
			},
			{
				variant = "select",
				text = "@LUA_MENU_DIFFICULTY",
				display = function ( f19_arg0, f19_arg1 )
					local f19_local0 = Lobby.GetMemberBotDifficulty( f16_arg0, f16_arg1, f16_arg2 )
					if f19_local0 == Lobby.BotDifficulties.Recruit then
						return Engine.Localize( "@LUA_MENU_BOTS_RECRUIT" )
					elseif f19_local0 == Lobby.BotDifficulties.Regular then
						return Engine.Localize( "@LUA_MENU_BOTS_REGULAR" )
					elseif f19_local0 == Lobby.BotDifficulties.Hardened then
						return Engine.Localize( "@LUA_MENU_BOTS_HARDENED" )
					elseif f19_local0 == Lobby.BotDifficulties.Veteran then
						return Engine.Localize( "@LUA_MENU_BOTS_VETERAN" )
					else
						return "FIXME Missing option"
					end
				end
				,
				left = function ( f20_arg0, f20_arg1 )
					local f20_local0 = Lobby.GetMemberBotDifficulty( f16_arg0, f16_arg1, f16_arg2 )
					local f20_local1 = Lobby.BotDifficulties.Regular
					if f20_local0 == Lobby.BotDifficulties.Recruit then
						f20_local1 = Lobby.BotDifficulties.Veteran
					elseif f20_local0 == Lobby.BotDifficulties.Regular then
						f20_local1 = Lobby.BotDifficulties.Recruit
					elseif f20_local0 == Lobby.BotDifficulties.Hardened then
						f20_local1 = Lobby.BotDifficulties.Regular
					elseif f20_local0 == Lobby.BotDifficulties.Veteran then
						f20_local1 = Lobby.BotDifficulties.Hardened
					else
						f20_local1 = Lobby.BotDifficulties.Regular
					end
					Lobby.SetMemberBotDifficulty( f16_arg0, f16_arg1, f16_arg2, f20_local1 )
				end
				,
				right = function ( f21_arg0, f21_arg1 )
					local f21_local0 = Lobby.GetMemberBotDifficulty( f16_arg0, f16_arg1, f16_arg2 )
					local f21_local1 = Lobby.BotDifficulties.Regular
					if f21_local0 == Lobby.BotDifficulties.Recruit then
						f21_local1 = Lobby.BotDifficulties.Regular
					elseif f21_local0 == Lobby.BotDifficulties.Regular then
						f21_local1 = Lobby.BotDifficulties.Hardened
					elseif f21_local0 == Lobby.BotDifficulties.Hardened then
						f21_local1 = Lobby.BotDifficulties.Veteran
					elseif f21_local0 == Lobby.BotDifficulties.Veteran then
						f21_local1 = Lobby.BotDifficulties.Recruit
					else
						f21_local1 = Lobby.BotDifficulties.Regular
					end
					Lobby.SetMemberBotDifficulty( f16_arg0, f16_arg1, f16_arg2, f21_local1 )
				end
				,
				disabled = function ()
					return not Lobby.IsPrivatePartyHost()
				end
				
			},
			{
				variant = "select",
				text = "@LUA_MENU_PERSONALITY",
				display = function ( f23_arg0, f23_arg1 )
					return tostring( Lobby.GetMemberBotPersonality( f16_arg0, f16_arg1, f16_arg2 ) )
				end
				,
				left = function ( f24_arg0, f24_arg1 )
					local f24_local0 = Lobby.GetMemberBotPersonality( f16_arg0, f16_arg1, f16_arg2 ) - 1
					if f24_local0 < 1 then
						f24_local0 = 5
					end
					Lobby.SetMemberBotPersonality( f16_arg0, f16_arg1, f16_arg2, f24_local0 )
				end
				,
				right = function ( f25_arg0, f25_arg1 )
					local f25_local0 = Lobby.GetMemberBotPersonality( f16_arg0, f16_arg1, f16_arg2 ) + 1
					if f25_local0 > 5 then
						f25_local0 = 1
					end
					Lobby.SetMemberBotPersonality( f16_arg0, f16_arg1, f16_arg2, f25_local0 )
				end
				,
				disabled = function ()
					return not Lobby.IsPrivatePartyHost()
				end
				
			}
		}
	elseif f16_arg0 == Lobby.MemberListStates.Prelobby then
		if Engine.IsConsoleGame() or Engine.IsPCApp() then
			local f16_local2 = {}
			local f16_local3
			if f16_local0 or Engine.IsPS4() then
				f16_local3 = LobbyMember.Options.xboxProfile
				if not f16_local3 then
				
				else
					local f16_local4 = LobbyMember.Options.toggleMute
					local f16_local5 = LobbyMember.Options.tryMigrateHost
					local f16_local6 = LobbyMember.Options.reportPlayer
					local f16_local7 = LobbyMember.Options.kickPlayer
					f16_local2[1] = f16_local3
					f16_local2[2] = f16_local4
					f16_local2[3] = f16_local5
					f16_local2[4] = f16_local6
					f16_local2[5] = f16_local7
					f16_local1 = f16_local2
				end
			end
			f16_local3 = LobbyMember.Options.psSendFriendInvite
		else
			f16_local1 = {
				LobbyMember.Options.toggleMute,
				LobbyMember.Options.tryMigrateHost,
				LobbyMember.Options.reportPlayer,
				LobbyMember.Options.kickPlayer
			}
		end
	elseif f16_arg0 == Lobby.MemberListStates.Lobby or f16_arg0 == Lobby.MemberListStates.Teams then
		if f16_arg4 then
			if Engine.IsConsoleGame() or Engine.IsPCApp() then
				if Engine.GetSystemLink() then
					if f16_local0 or Engine.IsPS4() then
						f16_local1[#f16_local1 + 1] = LobbyMember.Options.xboxProfile
					end
					f16_local1[#f16_local1 + 1] = LobbyMember.Options.toggleMute
					f16_local1[#f16_local1 + 1] = LobbyMember.Options.kickPlayer
				else
					local f16_local2 = {}
					local f16_local3
					if f16_local0 or Engine.IsPS4() then
						f16_local3 = LobbyMember.Options.xboxProfile
						if not f16_local3 then
						
						else
							local f16_local4 = LobbyMember.Options.toggleMute
							local f16_local5 = LobbyMember.Options.kickPlayer
							local f16_local6 = LobbyMember.Options.reportPlayer
							f16_local2[1] = f16_local3
							f16_local2[2] = f16_local4
							f16_local2[3] = f16_local5
							f16_local2[4] = f16_local6
							f16_local1 = f16_local2
						end
					end
					f16_local3 = LobbyMember.Options.psSendFriendInvite
				end
			else
				f16_local1 = {
					LobbyMember.Options.toggleMute,
					LobbyMember.Options.kickPlayer,
					LobbyMember.Options.reportPlayer
				}
			end
		elseif f16_arg3 then
			if Engine.IsConsoleGame() or Engine.IsPCApp() then
				local f16_local2 = {}
				local f16_local3
				if f16_local0 or Engine.IsPS4() then
					f16_local3 = LobbyMember.Options.xboxProfile
					if not f16_local3 then
					
					else
						local f16_local4 = LobbyMember.Options.toggleMute
						local f16_local5 = LobbyMember.Options.reportPlayer
						f16_local2[1] = f16_local3
						f16_local2[2] = f16_local4
						f16_local2[3] = f16_local5
						f16_local1 = f16_local2
					end
				end
				f16_local3 = LobbyMember.Options.psSendFriendInvite
			else
				f16_local1 = {
					LobbyMember.Options.toggleMute,
					LobbyMember.Options.reportPlayer
				}
			end
		end
	end
	if not Engine.GetSystemLink() then
		if Clan.IsEnabled() then
			f16_local1[#f16_local1 + 1] = LobbyMember.Options.inviteToClan
		end
		if Clan.IsRemoteViewEnabled() then
			f16_local1[#f16_local1 + 1] = LobbyMember.Options.viewClan( f16_arg0, f16_arg1, f16_arg2 )
		end
	end
	if Engine.IsPC() then
		f16_local1[#f16_local1 + 1] = {
			text = "@MENU_CANCEL"
		}
	end
	return f16_local1
end

function playerPopupMenuFeeder( f27_arg0 )
	assert( f27_arg0.memberListState )
	assert( f27_arg0.memberSlot )
	assert( f27_arg0.team )
	assert( f27_arg0.exclusiveController )
	local f27_local0 = f27_arg0.exclusiveController
	local f27_local1 = Lobby.IsMemberAISquadMember( f27_arg0.memberListState, f27_arg0.memberSlot, f27_arg0.team )
	if not f27_local1 then
		LobbyMember.SelectMember( f27_arg0.exclusiveController, f27_arg0.memberListState, f27_arg0.memberSlot, f27_arg0.team )
	end
	local f27_local2 = f0_local0( f27_arg0.memberListState, f27_arg0.memberSlot, f27_arg0.team, f27_arg0.isPublicLobby, f27_arg0.isPrivateLobby )
	local f27_local3 = {}
	for f27_local4 = 1, #f27_local2, 1 do
		local f27_local7 = f27_local4
		if not f27_local2[f27_local7].exclude or f27_local2[f27_local7].exclude( f27_local0 ) == false then
			if f27_local2[f27_local7].variant and f27_local2[f27_local7].variant == "select" then
				f27_local3[#f27_local3 + 1] = {
					type = "UIGenericButton",
					id = "member_option_" .. f27_local7,
					disabled = f27_local2[f27_local7].disabled( f27_local0 ) or f27_local1,
					properties = {
						style = GenericButtonSettings.Styles.GlassButton,
						substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
						variant = GenericButtonSettings.Variants.Select,
						button_text = Engine.Localize( f27_local2[f27_local7].text ),
						button_display_func = f27_local2[f27_local7].display,
						button_left_func = f27_local2[f27_local7].left,
						button_right_func = f27_local2[f27_local7].right
					}
				}
			else
				f27_local3[#f27_local3 + 1] = {
					type = "UIGenericButton",
					id = "member_option_" .. f27_local7,
					disabled = f27_local2[f27_local7].disabled and f27_local2[f27_local7].disabled( f27_local0 ) or f27_local1,
					properties = {
						style = GenericButtonSettings.Styles.GlassButton,
						substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
						button_text = Engine.Localize( f27_local2[f27_local7].text ),
						button_action_func = function ( f28_arg0, f28_arg1 )
							LUI.FlowManager.RequestLeaveMenu( f28_arg0, nil, nil, nil, true )
							if f27_local2[f27_local7].customActionFunc then
								f27_local2[f27_local7].customActionFunc( f28_arg0, f28_arg1 )
							elseif f27_local2[f27_local7].action then
								f27_local2[f27_local7].action( f28_arg0, f28_arg1 )
							end
						end,
						muteAction = f27_local2[f27_local7].muteInLobbyList
					},
					audio = {
						no_button_action = f27_local2[f27_local7].muteInLobbyList
					}
				}
			end
		end
	end
	return f27_local3
end

function player_popup_party()
	return {
		type = "generic_selectionList_popup",
		id = "player_popup_menu_id",
		properties = {
			memberSlot = nil,
			memberListState = nil,
			team = nil,
			popup_title = Engine.Localize( "@MPUI_PLAYER_OPTIONS" ),
			popup_childfeeder = playerPopupMenuFeeder
		}
	}
end

function kickwarning( f30_arg0, f30_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.GetDvarString( "party_kickplayerquestion" ),
		popup_title = Engine.Localize( "@MPUI_KICK_PLAYER" ),
		yes_text = Engine.Localize( "@LUA_MENU_YES" ),
		no_text = Engine.Localize( "@LUA_MENU_NO" ),
		yes_action = LobbyMember.SelectedMember_Kick,
		default_focus_index = 2
	} )
end

function hostchangewarning( f31_arg0, f31_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.GetDvarString( "party_makehostquestion" ),
		popup_title = Engine.Localize( "@MPUI_CHANGEHOSTTITLE" ),
		yes_text = Engine.Localize( "@LUA_MENU_YES" ),
		no_text = Engine.Localize( "@LUA_MENU_NO" ),
		yes_action = LobbyMember.SelectedMember_MigrateHost,
		default_focus_index = 2
	} )
end

function playerUnmutable( f32_arg0, f32_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		message_text = Engine.Localize( "@XBOXLIVE_EXTERNALMUTE_TITLE" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = nil,
		dialog_top = -75,
		dialog_bottom = 75
	} )
end

LUI.MenuBuilder.registerDef( "player_popup_party", player_popup_party )
LUI.MenuBuilder.registerPopupType( "kickwarning", kickwarning )
LUI.MenuBuilder.registerPopupType( "hostchangewarning", hostchangewarning )
LUI.MenuBuilder.registerPopupType( "playerUnmutable", playerUnmutable )
LockTable( _M )
