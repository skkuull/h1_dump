local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function LobbyPlayerStatsGetPlayerInfo( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = {}
	local f1_local1 = f1_arg2
	local f1_local2 = f1_arg3
	if f1_arg0 then
		assert( f1_arg4 )
		if f1_arg1 == Lobby.MemberListStates.Teams and Lobby.GetLocalPlayerTeam then
			f1_local2 = Lobby.GetLocalPlayerTeam( f1_arg1, f1_arg4 )
		end
		local f1_local3 = Lobby.GetCurrentMemberCount( f1_arg1, f1_local2 )
		for f1_local4 = 1, f1_local3, 1 do
			if Lobby.GetMemberControllerIndex( f1_arg1, f1_local4 - 1, f1_local2 ) == f1_arg4 then
				f1_local1 = f1_local4 - 1
				break
			end
		end
	end
	f1_local0.xuid = Lobby.GetMemberXuid( f1_local1, f1_arg4 )
	f1_local0.gamertag = Lobby.GetMemberName( f1_arg1, f1_local1, f1_local2 )
	if Engine.IsAliensMode() then
		f1_local0.memberPrestige = Lobby.GetMemberAlienPrestigeLevel( f1_arg1, f1_local1, f1_local2 )
		f1_local0.memberRank = Lobby.GetMemberAlienRank( f1_arg1, f1_local1, f1_local2 )
	else
		f1_local0.memberPrestige = Lobby.GetMemberPrestigeLevel( f1_arg1, f1_local1, f1_local2 )
		f1_local0.memberRank = Lobby.GetMemberRank( f1_arg1, f1_local1, f1_local2 )
	end
	f1_local0.clantag = ""
	if Engine.IsCoreMode() and Lobby.HasMemberClanTag( f1_arg1, f1_local1, f1_local2 ) then
		f1_local0.clantag = Lobby.GetMemberClanTag( f1_arg1, f1_local1, f1_local2 )
	end
	f1_local0.patch = Lobby.GetMemberPatch and Lobby.GetMemberPatch( f1_arg1, f1_local1, f1_local2 ) or 0
	f1_local0.patchBG = Lobby.GetMemberPatchbacking and Lobby.GetMemberPatchbacking( f1_arg1, f1_local1, f1_local2 ) or 0
	f1_local0.background = Lobby.GetMemberBackground and Lobby.GetMemberBackground( f1_arg1, f1_local1, f1_local2 ) or 0
	f1_local0.memberSlot = f1_local1
	f1_local0.memberTeam = f1_local2
	return f1_local0
end

function LobbyPlayerStatsFeeder( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = LobbyPlayerStatsGetPlayerInfo( f2_arg0.isComparison, f2_arg0.memberListState, f2_arg0.memberSlot, f2_arg0.team, f2_arg0.controller )
	f2_local0[#f2_local0 + 1] = {
		type = "playercard",
		id = "lobby_basic_playercard_id",
		properties = {
			xuid = f2_local1.xuid,
			gamertag = f2_local1.gamertag,
			clantag = f2_local1.clantag,
			rank = f2_local1.memberRank,
			prestige = f2_local1.memberPrestige,
			background = f2_local1.background,
			patchShape = f2_local1.patchBG,
			patchEmblem = f2_local1.patch
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 55,
				right = -55,
				top = 180,
				bottom = 250
			}
		}
	}
	if not Engine.IsAliensMode() then
		local f2_local2 = {}
		local f2_local3 = 25
		local f2_local4 = {
			material = RegisterMaterial( "white" ),
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = -150,
			right = 0,
			top = 0,
			bottom = 0,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0.1
		}
		local f2_local5 = {
			material = RegisterMaterial( "box_angle_rtcap" ),
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = -150,
			right = -182,
			top = 0,
			bottom = 0,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0.1
		}
		local f2_local6 = {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 10,
			right = -150,
			top = 2,
			bottom = 2 + CoD.TextSettings.BodyFont.Height,
			red = Colors.primary_text_color.r,
			green = Colors.primary_text_color.g,
			blue = Colors.primary_text_color.b,
			alignment = LUI.Alignment.Left,
			font = CoD.TextSettings.BodyFont.Font
		}
		local f2_local7 = {
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = -150,
			right = -10,
			top = 2,
			bottom = 2 + CoD.TextSettings.BodyFont.Height,
			red = Colors.white.r,
			green = Colors.white.g,
			blue = Colors.white.b,
			alignment = LUI.Alignment.Left,
			font = CoD.TextSettings.BodyFont.Font
		}
		if f2_arg0.isComparison then
			f2_local4 = {
				material = RegisterMaterial( "white" ),
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = 150,
				top = 0,
				bottom = 0,
				red = 1,
				green = 1,
				blue = 1,
				alpha = 0.1
			}
			f2_local5 = {
				material = RegisterMaterial( "box_angle_ltcap" ),
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 182,
				right = 150,
				top = 0,
				bottom = 0,
				red = 1,
				green = 1,
				blue = 1,
				alpha = 0.1
			}
			f2_local6 = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 150,
				right = -10,
				top = 2,
				bottom = 2 + CoD.TextSettings.BodyFont.Height,
				red = Colors.primary_text_color.r,
				green = Colors.primary_text_color.g,
				blue = Colors.primary_text_color.b,
				alignment = LUI.Alignment.Right,
				font = CoD.TextSettings.BodyFont.Font
			}
			f2_local7 = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				left = 10,
				right = 150,
				top = 2,
				bottom = 2 + CoD.TextSettings.BodyFont.Height,
				red = Colors.white.r,
				green = Colors.white.g,
				blue = Colors.white.b,
				alignment = LUI.Alignment.Right,
				font = CoD.TextSettings.BodyFont.Font
			}
		end
		local f2_local8 = Lobby.PlayerStatsCategories
		for f2_local9 = 1, #f2_local8, 1 do
			local f2_local12 = "---"
			if Lobby.GetMemberStat then
				local f2_local13 = tonumber( Lobby.GetMemberStat( f2_arg0.memberListState, f2_local1.memberSlot, f2_local1.memberTeam, Lobby.MemberStatTypes.GamesPlayed ) )
				if f2_local13 ~= nil and f2_local13 > 0 then
					f2_local12 = Lobby.GetMemberStat( f2_arg0.memberListState, f2_local1.memberSlot, f2_local1.memberTeam, f2_local8[f2_local9].Type ) or ""
				end
			end
			f2_local2[#f2_local2 + 1] = {
				type = "UIElement",
				id = "lobby_player_stat_" .. f2_local9 .. "_id",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 14,
						right = -6,
						top = 0,
						bottom = f2_local3
					}
				},
				children = {
					{
						type = "UIImage",
						id = "lobby_player_stat_bg_title",
						states = {
							default = {
								material = RegisterMaterial( "white" ),
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								bottom = 0,
								red = Colors.very_dark_cyan.r,
								green = Colors.very_dark_cyan.g,
								blue = Colors.very_dark_cyan.b,
								alpha = 0.5
							}
						}
					},
					{
						type = "UIImage",
						id = "lobby_player_stat_bg_value",
						states = {
							default = f2_local4
						}
					},
					{
						type = "UIImage",
						id = "lobby_player_stat_bg_cap",
						states = {
							default = f2_local5
						}
					},
					{
						type = "UIText",
						id = "lobby_player_stat_text_title",
						properties = {
							text = Engine.Localize( f2_local8[f2_local9].Title )
						},
						states = {
							default = f2_local6
						}
					},
					{
						type = "UIText",
						id = "lobby_player_stat_text_value",
						properties = {
							text = f2_local12
						},
						states = {
							default = f2_local7
						}
					}
				}
			}
		end
		f2_local0[#f2_local0 + 1] = {
			type = "UIVerticalList",
			id = "lobby_player_stats_list_id",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = false,
					left = 40,
					right = -40,
					top = 300,
					bottom = 300 + #Lobby.PlayerStatsCategories * (f2_local3 + 2),
					spacing = 3
				}
			},
			children = f2_local2
		}
		if f2_arg0.isComparison then
			f2_local0[#f2_local0 + 1] = {
				type = "UIText",
				id = "lobby_player_stat_text_value",
				properties = {
					text = Engine.Localize( "@LUA_MENU_VERSUS" )
				},
				states = {
					default = {
						alignment = LUI.Alignment.Center,
						font = CoD.TextSettings.TitleFont.Font,
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = -20,
						right = 20,
						top = 205,
						bottom = 205 + CoD.TextSettings.TitleFont.Height,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b
					},
					shown = {
						alpha = 1
					},
					hidden = {
						alpha = 0
					}
				},
				handlers = {
					lobby_page_enter = function ( f3_arg0, f3_arg1 )
						f3_arg0:animateToState( "shown", f3_arg1.animTime or 0, true )
					end,
					lobby_page_leave = function ( f4_arg0, f4_arg1 )
						f4_arg0:animateToState( "hidden", f4_arg1.animTime or 0, true )
					end
				}
			}
		else
			return f2_local0
		end
	end
	return f2_local0
end

function LobbyPlayerStatsUpdateProps( f5_arg0, f5_arg1 )
	assert( f5_arg1.memberListState )
	assert( f5_arg1.memberSlot )
	assert( f5_arg1.team )
	local f5_local0 = f5_arg0.properties
	local f5_local1 = f5_arg1.memberListState
	if not f5_local1 then
		f5_local1 = Lobby.MemberListStates.None
	end
	f5_local0.memberListState = f5_local1
	f5_arg0.properties.memberSlot = f5_arg1.memberSlot or 0
	f5_arg0.properties.team = f5_arg1.team or 1
end

function LobbyPlayerStatsEnter( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0.properties
	local f6_local1 = f6_arg0.properties
	local f6_local2 = f6_arg1.controller
	if not f6_local2 then
		f6_local2 = Engine.GetFirstActiveController()
	end
	f6_local1.controller = f6_local2
	if f6_local0.isComparison then
		f6_arg0:processEvent( {
			name = "menu_refresh"
		} )
	end
	f6_local1 = LobbyPlayerStatsGetPlayerInfo( f6_local0.isComparison, f6_local0.memberListState, f6_local0.memberSlot, f6_local0.team, f6_arg0.properties.controller )
	f6_arg0:processEvent( {
		name = "update_playercard",
		xuid = f6_local1.xuid,
		gamertag = f6_local1.gamertag,
		clantag = f6_local1.clantag,
		rank = f6_local1.memberRank,
		prestige = f6_local1.memberPrestige,
		background = f6_local1.background,
		patchShape = f6_local1.patchBG,
		patchEmblem = f6_local1.patch
	} )
end

function sendPlayerCardUpdate( f7_arg0, f7_arg1 )
	if Engine.IsAliensMode() then
		local f7_local0 = LobbyPlayerStatsGetPlayerInfo( false, f7_arg1.memberListState, f7_arg1.memberSlot, f7_arg1.team, f7_arg1.controller )
		f7_arg0:processEvent( {
			name = "update_playercard",
			xuid = f7_local0.xuid,
			gamertag = f7_local0.gamertag,
			clantag = f7_local0.clantag,
			rank = f7_local0.memberRank,
			prestige = f7_local0.memberPrestige,
			background = f7_local0.background,
			patchShape = f7_local0.patchBG,
			patchEmblem = f7_local0.patch
		} )
	end
end

function lobby_player_stats()
	local f8_local0 = {
		type = "UIElement",
		id = "lobby_player_stats_id",
		focusable = true,
		properties = {
			memberListState = Lobby.MemberListStates.Lobby,
			memberSlot = 0,
			team = Teams.free,
			isComparison = false,
			controller = 0,
			should_disable_slide_right_func = function ( f9_arg0, f9_arg1 )
				local f9_local0 = f9_arg0.properties
				if not f9_local0.isComparison then
					if (Lobby.GetMemberControllerIndex and Lobby.GetMemberControllerIndex( f9_local0.memberListState, f9_local0.memberSlot, f9_local0.team ) or 0) == f9_arg1 then
						return true
					elseif not Engine.IsConsoleGame() and Lobby.IsMemberALocalPlayer( f9_local0.memberListState, f9_local0.memberSlot, f9_local0.team ) then
						return true
					end
				end
				return false
			end
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
	local f8_local1 = {}
	local f8_local2 = MBh.DoMultiple
	local f8_local3 = {}
	local f8_local4 = LobbyPlayerStatsUpdateProps
	local f8_local5 = sendPlayerCardUpdate
	local f8_local6 = MBh.EmitEvent( {
		name = "menu_refresh"
	} )
	f8_local1.lobby_detail_update = f8_local2( f8_local4 )
	f8_local1.lobby_page_enter = LobbyPlayerStatsEnter
	f8_local0.handlers = f8_local1
	f8_local0.childrenFeeder = LobbyPlayerStatsFeeder
	return f8_local0
end

LUI.MenuBuilder.registerDef( "lobby_player_stats", lobby_player_stats )
LockTable( _M )
