AAR = {
	Layout = {
		PageContentTop = 130,
		TitleBarHeight = 33,
		SubTitleBarHeight = 31,
		SubTitleBannerWidth = 180,
		SubTitleCapWidth = 20,
		FooterHeight = 38,
		Width = 790,
		LeftColumnLeft = 106,
		LeftColumnTop = 138,
		BorderSize = 2,
		NavTabTop = S1MenuDims.safe_area_vert + 35,
		NavTabWidth = 148,
		NavTabHeight = 28,
		SideHeaderWidgetOffset = 36,
		NewItemsWidth = 226
	},
	NumUnlocksPerPage = 3,
	Swatch = {
		title = Colors.primary_text_color,
		title_2 = Colors.secondary_text_color,
		background = Colors.grey_14,
		background_2 = Colors.grey_22,
		background_3 = Colors.grey_4,
		background_4 = {
			r = 0.12,
			g = 0.12,
			b = 0.12
		},
		trim = Colors.grey_4,
		subtext = Colors.grey_4,
		table_fill = {
			r = 0,
			g = 0,
			b = 0,
			a = 0.15
		},
		table_div = {
			r = 1,
			g = 1,
			b = 1,
			a = 0.1
		},
		table_field = {
			r = 0.87,
			g = 0.87,
			b = 0.87
		},
		table_header = {
			r = 1,
			g = 1,
			b = 1,
			a = 0.5
		},
		light_fill = {
			r = 1,
			g = 1,
			b = 1,
			a = 0.1
		}
	},
	PlayerdataMaxChallengesCompleted = 20,
	SkipSummaryAnimation = true,
	HasMatchData = false,
	LastMatchDuration = nil,
	GameVictor = nil,
	HasPlayedAMatch = false,
	MatchDataPlayList = nil,
	IsPrivateMatchData = nil,
	ItemsUnlockedLastGame = {},
	Layout = AAR.Layout.NavTabTop + AAR.Layout.NavTabHeight,
	Layout = AAR.Layout.NavTabBot + 8
}
AwardsTable = {
	File = "mp/awardTable.csv",
	Cols = {
		IsMedal = 0,
		Ref = 1,
		Icon = 2,
		Name = 3,
		Desc = 4,
		Type = 5,
		XpRef = 6
	}
}
ChallengeTable = {
	File = "mp/allChallengesTable.csv",
	Cols = {
		RefName = 0,
		Name = 1,
		Tier = 8,
		UID = 28
	}
}
FactionTable = {
	File = "mp/factionTable.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		ShortName = 2,
		NameInCaps = 20,
		Icon = 5,
		ColorRed = 14,
		ColorGreen = 15,
		ColorBlue = 16
	}
}
XPEventTable = {
	File = "mp/xp_event_table.csv",
	Cols = {
		Ref = 0,
		PlaySplash = 1,
		GiveScore = 2,
		ScoreCallout = 3,
		DmXP = 4,
		WarXP = 5,
		SdXP = 6,
		DomXP = 7,
		ConfXP = 8,
		GunXP = 11,
		CtfXP = 12,
		HpXP = 15
	}
}
XPEventModeCols = {
	dm = XPEventTable.Cols.DmXP,
	war = XPEventTable.Cols.WarXP,
	sd = XPEventTable.Cols.SdXP,
	dom = XPEventTable.Cols.DomXP,
	conf = XPEventTable.Cols.ConfXP,
	gun = XPEventTable.Cols.GunXP,
	ctf = XPEventTable.Cols.CtfXP,
	hp = XPEventTable.Cols.HpXP
}
AAR.OnBackFromMatch = function ()
	AAR.HasPlayedAMatch = true
	AAR.HasMatchData = true
	AAR.LastMatchDuration = Game.GetOmnvar( "ui_game_duration" )
	AAR.GameVictor = Game.GetOmnvar( "ui_game_victor" )
	AAR.MatchDataPlayList = Engine.GetDvarInt( "playlist" )
	AAR.IsPrivateMatchData = Engine.GetDvarBool( "xblive_privatematch" )
	AAR.SkipSummaryAnimation = not GameX.IsRankedMatch()
	AAR.ItemsUnlockedLastGame = {}
	if Cac.GetSelectedControllerIndex() == nil then
		Cac.SetSelectedControllerIndex( Engine.GetFirstActiveController() )
	end
end

AAR.ClearAAR = function ()
	Engine.SetDvarBool( "ui_opensummary", false )
	AAR.HasMatchData = false
end

AAR.GetChallengesData = function ( f3_arg0 )
	local f3_local0 = AAR.GetLastMatchChallenges( f3_arg0 ) or {}
	local f3_local1 = {}
	for f3_local2 = 1, #f3_local0, 1 do
		local f3_local5 = f3_local0[f3_local2]
		local f3_local6 = GetChallengeData( f3_arg0, f3_local5, true )
		local f3_local7 = {}
		if not f3_local6.RewardName or f3_local6.RewardName == "" then
			DebugPrint( "Could not find RewardName for Challenge {" .. f3_local6.Name .. "}, Hiding Reward Name" )
		else
			f3_local7.reward = f3_local6.RewardName
		end
		if not f3_local6.RewardImage or f3_local6.RewardImage == "" then
			DebugPrint( "Could not find RewardImage for Challenge {" .. f3_local6.Name .. "}, Hiding Reward Image." )
		else
			f3_local7.rewardIcon = f3_local6.RewardImage
		end
		f3_local7.id = f3_local5
		f3_local7.name = f3_local6.Name
		f3_local7.desc = f3_local6.Desc
		f3_local7.icon = f3_local6.Image
		f3_local7.type = f3_local6.RewardType
		f3_local1[f3_local2] = f3_local7
	end
	return f3_local1
end

AAR.GetMedalsData = function ( f4_arg0 )
	local f4_local0 = AAR.GetLastMatchMedals( f4_arg0 ) or {}
	local f4_local1 = AAR.GetGameMode( f4_arg0 )
	local f4_local2 = {}
	for f4_local3 = 1, #f4_local0, 1 do
		local f4_local6 = {}
		local f4_local7 = f4_local0[f4_local3]
		local f4_local8 = f4_local7.id
		f4_local6.id = f4_local8
		f4_local6.count = f4_local7.count
		f4_local6.name = Engine.Localize( AAR.GetAwardName( f4_local8 ) )
		f4_local6.desc = Engine.Localize( AAR.GetAwardDesc( f4_local8 ) )
		f4_local6.icon = RegisterMaterial( AAR.GetAwardIcon( f4_local8 ) )
		f4_local2[f4_local3] = f4_local6
	end
	return f4_local2
end

AAR.GetFactionName = function ( f5_arg0 )
	return AAR.GetFactionNameByRef( GameX.GetFactionName( f5_arg0 ) )
end

AAR.GetFactionNameByRef = function ( f6_arg0 )
	return Engine.Localize( "@" .. Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f6_arg0, FactionTable.Cols.ShortName ) )
end

AAR.GetFactionIcon = function ( f7_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f7_arg0, FactionTable.Cols.Icon )
end

AAR.GetFactionColorRed = function ( f8_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f8_arg0, FactionTable.Cols.ColorRed )
end

AAR.GetFactionColorGreen = function ( f9_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f9_arg0, FactionTable.Cols.ColorGreen )
end

AAR.GetFactionColorBlue = function ( f10_arg0 )
	return Engine.TableLookup( FactionTable.File, FactionTable.Cols.Ref, f10_arg0, FactionTable.Cols.ColorBlue )
end

AAR.GetRoundMatchXP = function ( f11_arg0 )
	return Engine.GetPlayerData( f11_arg0, CoD.StatsGroup.Common, "round", "matchXp" ) or 0
end

AAR.GetRoundMiscXP = function ( f12_arg0 )
	return Engine.GetPlayerData( f12_arg0, CoD.StatsGroup.Common, "round", "miscXp" ) or 0
end

AAR.GetRoundScoreXP = function ( f13_arg0 )
	return Engine.GetPlayerData( f13_arg0, CoD.StatsGroup.Common, "round", "scoreXp" ) or 0
end

AAR.GetRoundChallengeXP = function ( f14_arg0 )
	return Engine.GetPlayerData( f14_arg0, CoD.StatsGroup.Common, "round", "challengeXp" ) or 0
end

AAR.GetRoundDoubleXP = function ( f15_arg0 )
	return Engine.GetPlayerData( f15_arg0, CoD.StatsGroup.Common, "round", "entitlementXp" ) or 0
end

AAR.GetRoundClanXP = function ( f16_arg0 )
	return Engine.GetPlayerData( f16_arg0, CoD.StatsGroup.Common, "round", "clanWarsXp" ) or 0
end

AAR.GetRoundTotalXP = function ( f17_arg0 )
	return Engine.GetPlayerData( f17_arg0, CoD.StatsGroup.Common, "round", "totalXp" ) or 0
end

AAR.GetRankForXP = function ( f18_arg0, f18_arg1 )
	if Engine.IsAliensMode() then
		return Lobby.GetAlienRankForXP( f18_arg0, f18_arg1 )
	else
		return Lobby.GetRankForXP( f18_arg0, f18_arg1 )
	end
end

AAR.GetCareerExperience = function ( f19_arg0 )
	if Engine.IsAliensMode() then
		return Aliens.getAliensExperience( f19_arg0 )
	else
		return Engine.GetPlayerDataMPXP( f19_arg0 ) or 0
	end
end

AAR.GetPrestigeLevel = function ( f20_arg0 )
	return Engine.GetPlayerData( f20_arg0, CoD.StatsGroup.Ranked, "prestige" ) or 0
end

AAR.GetLastMatchChallenges = function ( f21_arg0 )
	local f21_local0 = {}
	local f21_local1 = math.min( Engine.GetPlayerData( f21_arg0, CoD.StatsGroup.Common, "round", "challengeNumCompleted" ) or 0, AAR.PlayerdataMaxChallengesCompleted )
	for f21_local2 = 1, f21_local1, 1 do
		local f21_local5 = Engine.GetPlayerData( f21_arg0, CoD.StatsGroup.Common, "round", "challengesCompleted", f21_local2 - 1 )
		if f21_local5 and f21_local5 ~= 0 then
			f21_local0[#f21_local0 + 1] = Engine.TableLookup( ChallengeTable.File, ChallengeTable.Cols.UID, f21_local5, ChallengeTable.Cols.RefName )
		end
	end
	return f21_local0
end

AAR.GetLastMatchMedals = function ( f22_arg0 )
	local f22_local0 = {}
	local f22_local1 = 0
	local f22_local2 = Engine.TableLookupByRow( AwardsTable.File, f22_local1, AwardsTable.Cols.Ref )
	while f22_local2 do
		if f22_local2 == "" then
			break
		elseif AAR.GetAwardIsMedal( f22_local2 ) then
			local f22_local3 = AAR.GetAccolade( f22_arg0, f22_local2 )
			if f22_local3 and f22_local3 ~= "" and 0 < f22_local3 then
				f22_local0[#f22_local0 + 1] = {
					id = f22_local2,
					count = f22_local3
				}
			end
		end
		f22_local1 = f22_local1 + 1
		f22_local2 = Engine.TableLookupByRow( AwardsTable.File, f22_local1, AwardsTable.Cols.Ref )
	end
	return f22_local0
end

AAR.GetAccolade = function ( f23_arg0, f23_arg1 )
	return Engine.GetPlayerData( f23_arg0, CoD.StatsGroup.Common, "round", "awards", f23_arg1 )
end

AAR.GetAwardIsMedal = function ( f24_arg0 )
	local f24_local0 = Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f24_arg0, AwardsTable.Cols.IsMedal )
	return f24_local0 and f24_local0 == "1"
end

AAR.GetAwardIcon = function ( f25_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f25_arg0, AwardsTable.Cols.Icon )
end

AAR.GetAwardName = function ( f26_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f26_arg0, AwardsTable.Cols.Name )
end

AAR.GetAwardDesc = function ( f27_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f27_arg0, AwardsTable.Cols.Desc )
end

AAR.GetAwardXpRef = function ( f28_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f28_arg0, AwardsTable.Cols.XpRef )
end

AAR.GetAwardXP = function ( f29_arg0, f29_arg1 )
	local f29_local0 = 0
	local f29_local1 = AAR.GetAwardXpRef( f29_arg0 )
	if f29_local1 and f29_local1 ~= "" then
		f29_local0 = Engine.TableLookup( XPEventTable.File, XPEventTable.Cols.Ref, f29_local1, XPEventModeCols[f29_arg1] )
	end
	if not f29_local0 or f29_local0 == "" then
		f29_local0 = 0
	end
	return f29_local0
end

AAR.GetAwardType = function ( f30_arg0 )
	return Engine.TableLookup( AwardsTable.File, AwardsTable.Cols.Ref, f30_arg0, AwardsTable.Cols.Type )
end

AAR.GetScopedData = function ()
	return LUI.FlowManager.GetMenuScopedDataByMenuName( "aar_summary_main" )
end

AAR.GetScoreboardType = function ( f32_arg0 )
	return Engine.GetPlayerData( f32_arg0, CoD.StatsGroup.Common, "round", "scoreboardType" )
end

AAR.GetGameMode = function ( f33_arg0 )
	return Engine.GetPlayerData( f33_arg0, CoD.StatsGroup.Common, "round", "gameMode" )
end

AAR.GetRoundStat = function ( f34_arg0, f34_arg1 )
	return Engine.GetPlayerData( f34_arg0, CoD.StatsGroup.Common, "round", f34_arg1 )
end

AAR.GetRoundBest = function ( f35_arg0, f35_arg1 )
	return Engine.GetPlayerData( f35_arg0, CoD.StatsGroup.Common, "round", "awards", f35_arg1 )
end

AAR.GetLifetimeBest = function ( f36_arg0, f36_arg1 )
	return Engine.GetPlayerData( f36_arg0, CoD.StatsGroup.Common, "awards", f36_arg1 )
end

AAR.GetPersonalBest = function ( f37_arg0, f37_arg1 )
	return Engine.GetPlayerData( f37_arg0, CoD.StatsGroup.Common, "bests", f37_arg1 )
end

AAR.GetRankedMatchStat = function ( f38_arg0, f38_arg1 )
	return Engine.GetPlayerData( f38_arg0, CoD.StatsGroup.Ranked, f38_arg1 )
end

AAR.GetPlayerCount = function ()
	return Engine.GetClientMatchData( "scoreboardPlayerCount" )
end

AAR.GetPlayerId = function ( f40_arg0, f40_arg1 )
	return Engine.GetClientMatchData( "scoreboards", f40_arg0, "scoreboard", f40_arg1 )
end

AAR.GetPlayerName = function ( f41_arg0 )
	return Engine.GetClientMatchData( "players", f41_arg0, "name" )
end

AAR.GetPlayerClanTag = function ( f42_arg0 )
	return Engine.GetClientMatchData( "players", f42_arg0, "clanTag" )
end

AAR.GetPlayerFullName = function ( f43_arg0 )
	local f43_local0 = AAR.GetPlayerName( f43_arg0 )
	local f43_local1 = AAR.GetPlayerClanTag( f43_arg0 )
	if f43_local1 ~= nil and f43_local1 ~= "" then
		return "[" .. f43_local1 .. "] " .. f43_local0
	else
		return f43_local0
	end
end

AAR.GetPlayerXUID = function ( f44_arg0 )
	return Engine.GetClientMatchData( "players", f44_arg0, "xuid" )
end

AAR.GetPlayerCallingCard = function ( f45_arg0 )
	return Engine.GetClientMatchData( "players", f45_arg0, "callingCardIndex" )
end

AAR.GetPlayerEmblem = function ( f46_arg0 )
	return Engine.GetClientMatchData( "players", f46_arg0, "emblemPatchIndex" )
end

AAR.GetPlayerTeam = function ( f47_arg0 )
	return Engine.GetClientMatchData( "players", f47_arg0, "team" )
end

AAR.GetPlayerDivision = function ( f48_arg0 )
	return Engine.GetClientMatchData( "players", f48_arg0, "division" )
end

AAR.GetPlayerStat = function ( f49_arg0, f49_arg1 )
	return Engine.GetClientMatchData( "players", f49_arg0, f49_arg1 )
end

AAR.GetGameModeName = function ( f50_arg0 )
	return Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f50_arg0, GameTypesTable.Cols.Name ) )
end

AAR.GetMapRefName = function ( f51_arg0 )
	return Engine.GetPlayerData( f51_arg0, CoD.StatsGroup.Common, "round", "map" )
end

AAR.GetMapName = function ( f52_arg0 )
	return Lobby.GetMapName( AAR.GetMapRefName( f52_arg0 ) )
end

AAR.GetGameDuration = function ()
	return Engine.FormatTimeHoursMinutesSeconds( AAR.LastMatchDuration / 1000 )
end

AAR.GetAlliesScore = function ()
	return Engine.GetClientMatchData( "alliesScore" )
end

AAR.GetAxisScore = function ()
	return Engine.GetClientMatchData( "axisScore" )
end

AAR.IsLocalPlayerMLGSpectator = function ( f56_arg0 )
	local f56_local0 = Engine.GetXUIDByController( f56_arg0 )
	local f56_local1 = Lobby.GetCurrentMemberCount( Lobby.MemberListStates.Lobby )
	if f56_local1 ~= nil and f56_local1 > 0 then
		for f56_local2 = 1, f56_local1, 1 do
			if Lobby.GetMemberXuid( f56_local2 - 1, f56_arg0 ) == f56_local0 then
				return Lobby.IsMemberMLGSpectator( f56_local2 - 1, f56_arg0 )
			end
		end
	end
	return false
end

AAR.GetLocalPlayer = function ( f57_arg0 )
	local f57_local0 = Engine.GetXUIDByController( f57_arg0 )
	local f57_local1 = Engine.PlatformXUIDToHexXUID( f57_local0 )
	local f57_local2 = AAR.GetScoreboardType( f57_arg0 )
	local f57_local3 = AAR.GetPlayerCount()
	if f57_local3 ~= nil and f57_local3 > 0 then
		for f57_local4 = 1, f57_local3, 1 do
			local f57_local7 = AAR.GetPlayerId( f57_local2, f57_local4 - 1 )
			if f57_local7 >= 0 then
				local f57_local8 = AAR.GetPlayerXUID( f57_local7 )
				if f57_local8 == f57_local1 or f57_local8 == f57_local0 then
					return f57_local7
				end
			end
		end
	end
	return nil
end

function GetCSDItemReward( f58_arg0 )
	if Engine.GetDvarInt( "csdRewardMasterKillswitch" ) > 0 then
		return 
	end
	local f58_local0 = GetChallengeReward( "ch_rank_csd", 1 )
	if f58_local0 ~= nil and f58_local0 ~= "" then
		f58_arg0[#f58_arg0 + 1] = {
			Guid = f58_local0
		}
	end
end

AAR.GetItemsUnlockedAtRank = function ( f59_arg0 )
	local f59_local0 = {}
	if not Engine.IsAliensMode() then
		local f59_local1 = 0
	end
	return f59_local0
end

AAR.GetItemsUnlockedAtPrestige = function ( f60_arg0 )
	local f60_local0 = {}
	if not Engine.IsAliensMode() then
		local f60_local1 = 0
	end
	return f60_local0
end

AAR.UpdateNewItemBreadcrumbs = function ( f61_arg0 )
	local f61_local0 = AAR.ItemsUnlockedLastGame[f61_arg0]
	if f61_local0 then
		for f61_local1 = 1, #f61_local0, 1 do
			local f61_local4 = LUI.InventoryUtils.GetLootData( nil, nil, f61_local0[f61_local1] )
			if f61_local4 and f61_local4.weaponCategory then
				LUI.InventoryUtils.SetNewStickerState( f61_arg0, f61_local4.unlockTableRef, f61_local4.weaponCategory, f61_local4.gunData and f61_local4.gunData.weaponName or f61_local4.weaponType, true )
			end
		end
	end
end

AAR.GetItemsUnlockedLastGame = function ( f62_arg0 )
	if not AAR.ItemsUnlockedLastGame[f62_arg0] then
		local f62_local0 = {}
		local f62_local1 = Lobby.GetItemsUnlockedLastGame( f62_arg0 )
		local f62_local2 = {}
		if f62_local1 then
			local f62_local3 = nil
			for f62_local4 = 1, #f62_local1, 1 do
				f62_local3 = f62_local1[f62_local4]
				local f62_local7 = Engine.TableLookupByRow( UnlockTable.File, f62_local3, UnlockTable.Cols.ItemId )
				local f62_local8 = Engine.TableLookupByRow( UnlockTable.File, f62_local3, UnlockTable.Cols.Type )
				if f62_local7 ~= "" then
					if f62_local8 == "" then
						break
					end
					local f62_local9, f62_local10, f62_local11 = Cac.GetItemLockState( f62_arg0, nil, f62_local7 )
					if f62_local9 == "Unlocked" then
						local f62_local12 = tonumber( Engine.TableLookupByRow( UnlockTable.File, f62_local3, UnlockTable.Cols.Rank ) )
						local f62_local13 = Engine.TableLookupByRow( UnlockTable.File, f62_local3, UnlockTable.Cols.Challenge )
						local f62_local14 = tonumber( Engine.TableLookupByRow( UnlockTable.File, f62_local3, UnlockTable.Cols.PrestigeLevel ) )
						if f62_local13 == "" then
							f62_local13 = nil
						end
						local f62_local15 = true
						if f62_local13 and #f62_local13 then
							f62_local15 = f62_local2[f62_local13] ~= true
						end
						if f62_local15 then
							f62_local0[#f62_local0 + 1] = {
								ItemId = f62_local7,
								Type = f62_local8,
								Rank = f62_local12,
								Challenge = f62_local13,
								Prestige = f62_local14
							}
						end
					end
				end
			end
		end
		AAR.ItemsUnlockedLastGame[f62_arg0] = f62_local0
		AAR.UpdateNewItemBreadcrumbs( f62_arg0 )
	end
	return AAR.ItemsUnlockedLastGame[f62_arg0]
end

AAR.GetMatchTeamSuccessString = function ( f63_arg0 )
	local f63_local0 = Engine.Localize( "@LUA_MENU_RANKED_YOUR_TEAM_DRAW" )
	local f63_local1 = AAR.GetLocalPlayer( f63_arg0 )
	if f63_local1 then
		local f63_local2 = AAR.GetPlayerTeam( f63_local1 )
		local f63_local3 = nil
		if f63_local2 == "allies" then
			f63_local3 = Teams.allies
		elseif f63_local2 == "axis" then
			f63_local3 = Teams.axis
		end
		if not (not f63_local3 or AAR.GameVictor ~= Teams.allies) or AAR.GameVictor == Teams.axis then
			if f63_local3 == AAR.GameVictor then
				f63_local0 = Engine.Localize( "@LUA_MENU_RANKED_YOUR_TEAM_WON" )
			else
				f63_local0 = Engine.Localize( "@LUA_MENU_RANKED_YOUR_TEAM_LOST" )
			end
		end
	end
	return f63_local0
end

AAR.GetMatchPlayers = function ( f64_arg0 )
	local f64_local0 = {}
	local f64_local1 = AAR.GetScoreboardType( f64_arg0 )
	local f64_local2 = AAR.GetPlayerCount()
	if f64_local2 ~= nil and f64_local2 > 0 then
		for f64_local3 = 1, f64_local2, 1 do
			local f64_local6 = AAR.GetPlayerId( f64_local1, f64_local3 - 1 )
			if f64_local6 >= 0 then
				f64_local0[#f64_local0 + 1] = {
					id = f64_local6,
					gamertag = AAR.GetPlayerFullName( f64_local6 ),
					team = AAR.GetPlayerTeam( f64_local6 ),
					division = AAR.GetPlayerDivision( f64_local6 )
				}
			end
		end
	end
	return f64_local0
end

