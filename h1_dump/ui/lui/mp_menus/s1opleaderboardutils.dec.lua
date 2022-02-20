FilterDvarName = "ui_lb_filter"
DurationDvarName = "ui_lb_duration"
HardcoreDvarName = "ui_lb_hardcore"
LBVarType = {
	Normal = 1,
	Rank = 2
}
OpLeaderboard = {
	Filters = {
		None = {
			Title = "@LUA_MENU_GHOSTS_LEADERBOARD_ALL_CAPS",
			OptionText = "@LUA_MENU_ALLPLAYERS",
			Value = "none",
			Key = "None"
		},
		Friends = {
			Title = "@LUA_MENU_GHOSTS_LEADERBOARD_FRIENDS_CAPS",
			OptionText = "@LUA_MENU_LB_FILTER_GROUP_FRIENDS",
			Value = "friends",
			Key = "Friends"
		},
		LobbyMembers = {
			Title = "@LUA_MENU_GHOSTS_LEADERBOARD_LOBBY_CAPS",
			OptionText = "@LUA_MENU_LB_FILTER_GROUP_LOBBY_MEMBERS",
			Value = "lobby_members",
			Key = "LobbyMembers"
		},
		Clan = {
			Title = "@LUA_MENU_GHOSTS_LEADERBOARD_CLAN_CAPS",
			OptionText = "@LUA_MENU_LB_FILTER_GROUP_CLAN",
			Value = "clan",
			Key = "Clan"
		}
	},
	DurationDefs = {
		Alltime = {
			OptionText = "@LUA_MENU_LB_FILTER_DURATION_ALLTIME",
			Duration = "TRK_ALLTIME",
			Key = "Alltime"
		},
		Weekly = {
			OptionText = "@LUA_MENU_LB_FILTER_DURATION_WEEKLY",
			Duration = "TRK_WEEKLY",
			Key = "Weekly"
		},
		Monthly = {
			OptionText = "@LUA_MENU_LB_FILTER_DURATION_MONTHLY",
			Duration = "TRK_MONTHLY",
			Key = "Monthly"
		}
	}
}
DefaultDurationStringkey = OpLeaderboard.DurationDefs.Alltime.Key
OpLeaderboard.CoreModeDefs = {
	Standard = {
		OptionText = "@LUA_MENU_LB_FILTER_COREMODE_STANDARD",
		FileSuffix = "",
		Key = 0
	},
	Hardcore = {
		OptionText = "@LUA_MENU_LB_FILTER_COREMODE_HARDCORE",
		FileSuffix = "_HC",
		Key = 1
	},
	OldSchool = {
		OptionText = "@LUA_MENU_OLDSCHOOL",
		FileSuffix = "_OS",
		Key = 2
	}
}
local f0_local0 = LUI.Alignment.Center
OpLeaderboard.Boards = {
	PositionDataIndex = 0,
	NameDataIndex = 3,
	RankDataIndex = 2,
	Career = {
		label = "@LUA_MENU_CAREER",
		dynCol = 3,
		CoreModeFilterEnabled = false,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 120
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 122
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_AVG_SCORE",
				alignment = f0_local0,
				width = 120
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_GAMES_PLAYED",
				alignment = f0_local0,
				width = 120
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_TIME_PLAYED",
				alignment = f0_local0,
				width = 120
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_TOTALXP",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_TOTALXP",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_TOTALXP",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	TDM = {
		gameType = "war",
		label = "@MPUI_TEAM_DEATHMATCH",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@MENU_RATIO",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_ASSISTS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_WAR",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_WAR",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_WAR",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	FFA = {
		gameType = "dm",
		label = "@MPUI_DEATHMATCH",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@MENU_RATIO",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_WEAPPERF_HEADSHOTS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_DM",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_DM",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_DM",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	KillConfirmed = {
		gameType = "conf",
		label = "@MPUI_CONF",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_CONFIRMS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DENIES",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_CONF",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_CONF",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_CONF",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	CTF = {
		gameType = "ctf",
		label = "@MPUI_CAPTURE_THE_FLAG",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_CAPTURES",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_RETURNS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 9,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 86
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_CTF",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_CTF",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_CTF",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	SearchAndDestroy = {
		gameType = "sd",
		label = "@MPUI_SEARCH_AND_DESTROY",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_PLANTS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFUSES",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 9,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 86
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_SD",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_SD",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_SD",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	Domination = {
		gameType = "dom",
		label = "@MPUI_DOMINATION",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_CAPTURES",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_DOM",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_DOM",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_DOM",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	Hardpoint = {
		gameType = "hp",
		label = "@MPUI_HP",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@DEPOT_AVG_TIME",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_HP",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_HP",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_HP",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	GunGame = {
		gameType = "gun",
		label = "@MPUI_GUN",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_STABS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SETBACKS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_GUN",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_GUN",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_GUN",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	Sabotage = {
		gameType = "sab",
		label = "@MPUI_SABOTAGE_CAPS",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_PLANTS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFUSES",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 9,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 86
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_SAB",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_SAB",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_SAB",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	Headquarters = {
		gameType = "koth",
		label = "@MPUI_HEADQUARTERS_CAPS",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 102
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_CAPTURES",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DESTROYS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 100
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 100
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_KOTH",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_KOTH",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_KOTH",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	},
	Demolition = {
		gameType = "dd",
		label = "@MPUI_DD_CAPS",
		dynCol = 3,
		CoreModeFilterEnabled = true,
		leaderboardColumnInfo = {
			{
				dataIndex = 0,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_POSITION",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 1,
				lbVarType = LBVarType.Rank,
				text = "@MENU_PLAYER",
				alignment = LUI.Alignment.Left,
				width = 57
			},
			{
				dataIndex = 3,
				lbVarType = LBVarType.Normal,
				text = "",
				alignment = LUI.Alignment.Left,
				width = 50
			},
			{
				dataIndex = 4,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_SCORE",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 5,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_PLANTS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 6,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFUSES",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 7,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEFENDS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 8,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_KILLS",
				alignment = f0_local0,
				width = 86
			},
			{
				dataIndex = 9,
				lbVarType = LBVarType.Normal,
				text = "@LUA_MENU_DEATHS",
				alignment = f0_local0,
				width = 86
			}
		},
		DefaultDurationKey = DefaultDurationStringkey,
		Durations = {
			Alltime = {
				File = "LB_VR_GM_DD",
				DurationDef = OpLeaderboard.DurationDefs.Alltime
			},
			Weekly = {
				File = "LB_VR_GM_DD",
				DurationDef = OpLeaderboard.DurationDefs.Weekly
			},
			Monthly = {
				File = "LB_VR_GM_DD",
				DurationDef = OpLeaderboard.DurationDefs.Monthly
			}
		}
	}
}
local f0_local1 = CoD.DesignGridHelper( 22, 0 ) - 10
OpLeaderboard.CenterPanel = {
	Rect = {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		width = f0_local1,
		top = 32,
		height = 548
	},
	FilterText = {
		Rect = {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			width = 366,
			top = 0,
			height = 24
		}
	},
	Leaderboard = {
		Rect = {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			width = f0_local1,
			top = 40,
			height = 502
		},
		Header = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 10,
				width = f0_local1,
				top = 56,
				height = 32
			}
		},
		PlayerLine = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				width = f0_local1,
				top = 45,
				height = 32
			}
		},
		List = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 10,
				width = f0_local1,
				top = 87,
				height = 430
			},
			RowAndColumnGap = 1,
			NumRowsToDisplay = 15,
			CenterIndex = 8,
			RowInitialXOffset = 2,
			RowTextOffset = 0,
			RowTextHPadding = 4,
			RowSeperatorSkip = 0,
			RowSeperatorHeight = 0,
			RowOffset = 0,
			RowHeight = 28,
			RowVSkip = 25,
			RankIconWidth = 21,
			RankIconHeight = 21,
			RankIconX1 = 4,
			RankIconX2 = 2,
			RankIconY = 3
		},
		Footer = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 10,
				width = f0_local1,
				top = 510,
				height = 40
			},
			Font = CoD.TextSettings.Font21,
			TextWidth = 140,
			GapX = 0,
			IconWidth = 15.75,
			IconHeight = 8.25,
			ButtonWidth = 32,
			ButtonHeight = 32
		}
	},
	DebugPanel = {
		Text = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				width = 500,
				top = -90,
				height = 24
			}
		},
		ButtonRenderMode = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				width = 500,
				top = -64,
				height = 36
			}
		}
	}
}
OpLeaderboard.GetLeaderboard = function ( f1_arg0 )
	assert( f1_arg0 )
	return OpLeaderboard.Boards[f1_arg0]
end

OpLeaderboard.GetLabel = function ( f2_arg0 )
	local f2_local0 = OpLeaderboard.GetLeaderboard( f2_arg0 )
	return f2_local0.label
end

OpLeaderboard.GetLeaderboardDefaultDurationKey = function ( f3_arg0 )
	local f3_local0 = OpLeaderboard.GetLeaderboard( f3_arg0 )
	return f3_local0.DefaultDurationKey
end

OpLeaderboard.IsCoreModeFilterEnabled = function ( f4_arg0 )
	local f4_local0 = OpLeaderboard.GetLeaderboard( f4_arg0 )
	return f4_local0.CoreModeFilterEnabled
end

OpLeaderboard.GetDynamicColumnIndex = function ( f5_arg0 )
	local f5_local0 = OpLeaderboard.GetLeaderboard( f5_arg0 )
	return f5_local0.dynCol
end

OpLeaderboard.GetDurationFile = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = OpLeaderboard.GetLeaderboard( f6_arg0 )
	return f6_local0.Durations[f6_arg1].File .. OpLeaderboard.GetCoreModeFileSuffix( f6_arg0, f6_arg2 )
end

OpLeaderboard.GetDurationDef = function ( f7_arg0, f7_arg1 )
	local f7_local0 = OpLeaderboard.GetLeaderboard( f7_arg0 )
	return f7_local0.Durations[f7_arg1].DurationDef
end

OpLeaderboard.GetFilter = function ( f8_arg0 )
	return OpLeaderboard.Filters[f8_arg0]
end

OpLeaderboard.GetFilterTitle = function ( f9_arg0 )
	local f9_local0 = OpLeaderboard.GetFilter( f9_arg0 )
	return f9_local0.Title
end

OpLeaderboard.GetFilterOptionText = function ( f10_arg0 )
	local f10_local0 = OpLeaderboard.GetFilter( f10_arg0 )
	return f10_local0.OptionText
end

OpLeaderboard.GetFilterValue = function ( f11_arg0 )
	local f11_local0 = OpLeaderboard.GetFilter( f11_arg0 )
	return f11_local0.Value
end

OpLeaderboard.GetCoreModeFilterOptionText = function ( f12_arg0, f12_arg1 )
	if not OpLeaderboard.IsCoreModeFilterEnabled( f12_arg0 ) then
		return ""
	end
	for f12_local3, f12_local4 in pairs( OpLeaderboard.CoreModeDefs ) do
		if f12_arg1 == f12_local4.Key then
			return f12_local4.OptionText
		end
	end
end

OpLeaderboard.GetCoreModeFileSuffix = function ( f13_arg0, f13_arg1 )
	if not OpLeaderboard.IsCoreModeFilterEnabled( f13_arg0 ) then
		return ""
	end
	for f13_local3, f13_local4 in pairs( OpLeaderboard.CoreModeDefs ) do
		if f13_arg1 == f13_local4.Key then
			return f13_local4.FileSuffix
		end
	end
end

OpLeaderboardMenu = {
	menu = 0,
	SelectedIndex = 0,
	Options = {
		{
			categoryId = "Career",
			categoryImage = "icon_pl_cat_exo"
		},
		{
			refId = "standard",
			text = OpLeaderboard.CoreModeDefs.Standard.OptionText,
			value = OpLeaderboard.CoreModeDefs.Standard.Key
		},
		{
			refId = "hardcore",
			text = OpLeaderboard.CoreModeDefs.Hardcore.OptionText,
			value = OpLeaderboard.CoreModeDefs.Hardcore.Key
		},
		{
			refId = "oldschool",
			text = OpLeaderboard.CoreModeDefs.OldSchool.OptionText,
			value = OpLeaderboard.CoreModeDefs.OldSchool.Key
		}
	},
	PlayerFilterOptions = {
		{
			text = OpLeaderboard.Filters.None.OptionText,
			value = OpLeaderboard.Filters.None.Key
		},
		{
			text = OpLeaderboard.Filters.Friends.OptionText,
			value = OpLeaderboard.Filters.Friends.Key
		}
	},
	DurationFilterOptions = {
		{
			text = OpLeaderboard.DurationDefs.Alltime.OptionText,
			value = OpLeaderboard.DurationDefs.Alltime.Key
		},
		{
			text = OpLeaderboard.DurationDefs.Weekly.OptionText,
			value = OpLeaderboard.DurationDefs.Weekly.Key
		},
		{
			text = OpLeaderboard.DurationDefs.Monthly.OptionText,
			value = OpLeaderboard.DurationDefs.Monthly.Key
		}
	},
	GametypeFilterOptions = {
		standard = {
			{
				categoryId = "FFA",
				categoryImage = "icon_pl_exo_free_for_all"
			},
			{
				categoryId = "TDM",
				categoryImage = "icon_pl_exo_team_deathmatch"
			},
			{
				categoryId = "SearchAndDestroy",
				categoryImage = "icon_pl_exo_search_and_destroy"
			},
			{
				categoryId = "Domination",
				categoryImage = "icon_pl_exo_domination"
			},
			{
				categoryId = "KillConfirmed",
				categoryImage = "icon_pl_exo_kill_confirmed"
			},
			{
				categoryId = "Sabotage",
				categoryImage = "icon_pl_exo_team_deathmatch"
			},
			{
				categoryId = "Headquarters",
				categoryImage = "icon_pl_exo_team_deathmatch"
			},
			{
				categoryId = "Hardpoint",
				categoryImage = "icon_pl_exo_hardpoint"
			},
			{
				categoryId = "GunGame",
				categoryImage = "icon_pl_exo_gun_game"
			}
		},
		hardcore = {
			{
				categoryId = "TDM",
				categoryImage = "icon_pl_exo_team_deathmatch"
			},
			{
				categoryId = "SearchAndDestroy",
				categoryImage = "icon_pl_exo_search_and_destroy"
			},
			{
				categoryId = "KillConfirmed",
				categoryImage = "icon_pl_exo_kill_confirmed"
			},
			{
				categoryId = "Headquarters",
				categoryImage = "icon_pl_exo_team_deathmatch"
			}
		},
		oldschool = {
			{
				categoryId = "FFA",
				categoryImage = "icon_pl_exo_free_for_all"
			},
			{
				categoryId = "TDM",
				categoryImage = "icon_pl_exo_team_deathmatch"
			},
			{
				categoryId = "KillConfirmed",
				categoryImage = "icon_pl_exo_kill_confirmed"
			}
		}
	}
}
OpLeaderboardDataController = {
	filterType = "None",
	durationKey = DefaultDurationStringkey,
	coreMode = OpLeaderboard.CoreModeDefs.Standard.Key,
	GetScoped = function ( f14_arg0 )
		local f14_local0 = nil
		if buttonIn then
			f14_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_arg0 )
		else
			f14_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "OpLeaderboardMain" )
		end
		return f14_local0
	end,
	OnMenuCreate = function ( f15_arg0, f15_arg1 )
		
	end,
	OnMenuClose = function ( f16_arg0, f16_arg1 )
		
	end,
	ChangeFilterAndDuration = function ( f17_arg0, f17_arg1, f17_arg2 )
		local f17_local0 = OpLeaderboardDataController.GetScoped()
		OpLeaderboardDataController.filterType = f17_arg0
		OpLeaderboardDataController.durationKey = f17_arg1
		OpLeaderboardDataController.coreMode = f17_arg2
		OpLeaderboardDataController.Init( f17_local0.categoryId )
		OpLeaderboardDataController.Fetch()
	end,
	Init = function ( f18_arg0 )
		local f18_local0 = OpLeaderboardDataController.GetScoped()
		if Clan.IsEnabled() and Clan.AlreadyMember( f18_local0.exclusiveController ) then
			table.insert( OpLeaderboardMenu.PlayerFilterOptions, {
				text = OpLeaderboard.Filters.Clan.OptionText,
				value = OpLeaderboard.Filters.Clan.Key
			} )
		end
		local f18_local1 = OpLeaderboard.GetLeaderboard( f18_arg0 )
		local f18_local2 = OpLeaderboardMenu.controllerIndex
		local f18_local3 = OpLeaderboardDataController.filterType
		local f18_local4 = OpLeaderboardDataController.durationKey
		local f18_local5 = OpLeaderboardDataController.coreMode
		if FilterDvarName ~= nil and Engine.GetDvarString( FilterDvarName ) ~= nil then
			f18_local3 = Engine.GetDvarString( FilterDvarName )
		end
		if nil ~= DurationDvarName and nil ~= Engine.GetDvarString( DurationDvarName ) then
			f18_local4 = Engine.GetDvarString( DurationDvarName )
		end
		if nil ~= HardcoreDvarName and nil ~= Engine.GetDvarString( HardcoreDvarName ) then
			f18_local5 = Engine.GetDvarInt( HardcoreDvarName )
		end
		local f18_local6 = OpLeaderboard.GetDurationDef( f18_arg0, f18_local4 )
		local f18_local7 = OpLeaderboard.GetDurationFile( f18_arg0, f18_local4, f18_local5 )
		f18_local0.controller = f18_local2
		f18_local0.categoryId = f18_arg0
		f18_local0.filterType = f18_local3
		f18_local0.durationKey = f18_local4
		f18_local0.coreMode = f18_local5
		f18_local0.durationDef = f18_local6
		f18_local0.file = f18_local7
		f18_local0.initialFetch = true
		f18_local0.readDelayFail = false
		f18_local0.readDelayTime = 0
		f18_local0.gotLeaderboardData = false
		f18_local0.columnInfo = {}
		for f18_local11, f18_local12 in ipairs( f18_local1.leaderboardColumnInfo ) do
			f18_local0.columnInfo[#f18_local0.columnInfo + 1] = f18_local12
		end
		f18_local0.leaderboardPageTop = 0
		f18_local0.leaderboardPageRow = 1
	end,
	Fetch = function ()
		local f19_local0 = OpLeaderboardDataController.GetScoped()
		OpLeaderboardDataController.FixCoords( f19_local0 )
		f19_local0.readDelayFail = false
		f19_local0.readDelayTime = 0
		f19_local0.gotLeaderboardData = false
		Engine.SetDvarInt( "lb_maxrows", OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay * 3 )
		local f19_local1 = f19_local0.durationDef
		local f19_local2 = f19_local0.file
		Leaderboards.Clear()
		Leaderboards.Open( f19_local2, f19_local1.Duration )
		Leaderboards.Refresh()
		Engine.SetDvarString( "lb_filter", OpLeaderboard.GetFilterValue( f19_local0.filterType ) )
		Leaderboards.UpdateLeaderboard( f19_local0.controller, f19_local0.leaderboardPageTop + f19_local0.leaderboardPageRow - 1 )
	end,
	SelectPrev = function ()
		OpLeaderboardDataController.SelectDelta( -1 )
	end,
	SelectNext = function ()
		OpLeaderboardDataController.SelectDelta( 1 )
	end,
	SelectPagePrev = function ()
		OpLeaderboardDataController.SelectDelta( -OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay )
	end,
	SelectPageNext = function ()
		OpLeaderboardDataController.SelectDelta( OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay )
	end,
	SelectRow = function ( f24_arg0 )
		local f24_local0 = OpLeaderboardDataController.GetScoped()
		f24_local0.leaderboardPageRow = f24_arg0
		OpLeaderboardDataController.SelectDelta( 0 )
	end,
	FixCoords = function ( f25_arg0 )
		if not Leaderboards.IsUpdating() and f25_arg0.gotLeaderboardData == true then
			local f25_local0 = Leaderboards.GetPlayerCount()
			if f25_arg0.localPlayerIsUnranked then
				f25_local0 = f25_local0 + 1
			end
			local f25_local1 = f25_arg0.leaderboardPageTop
			local f25_local2 = f25_arg0.leaderboardPageRow
			local f25_local3 = OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay
			local f25_local4 = OpLeaderboard.CenterPanel.Leaderboard.List.CenterIndex
			local f25_local5 = true
			if Leaderboards.GetPlayerCount() <= OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay then
				f25_local5 = false
			end
			local f25_local6 = true
			if f25_local5 == true then
				local f25_local7 = f25_local1 + f25_local2
				if f25_local0 < f25_local7 then
					f25_local7 = f25_local0
				elseif f25_local7 < 1 then
					f25_local7 = 1
				end
				f25_local1 = f25_local7 - f25_local4
				f25_local2 = f25_local7 - f25_local1
				if f25_local6 == true then
					if f25_local3 <= f25_local0 and f25_local0 - f25_local4 < f25_local7 then
						f25_local1 = f25_local0 - f25_local3
						f25_local2 = f25_local7 - f25_local1
						while f25_local1 < 0 do
							f25_local1 = f25_local1 + 1
							f25_local2 = f25_local2 - 1
						end
					end
				end
			else
				while f25_local3 < f25_local2 do
					f25_local2 = f25_local2 - f25_local3
					f25_local1 = f25_local1 + f25_local3
				end
				while f25_local2 < 1 do
					f25_local2 = f25_local2 + f25_local3
					f25_local1 = f25_local1 - f25_local3
				end
				if f25_local1 < 0 or f25_local0 < 1 then
					f25_local1 = 0
					f25_local2 = 1
				elseif f25_local0 < f25_local1 + f25_local2 then
					f25_local1 = 0
					f25_local2 = f25_local0
					while f25_local3 < f25_local2 do
						f25_local1 = f25_local1 + f25_local3
						f25_local2 = f25_local2 - f25_local3
					end
				end
			end
			f25_arg0.leaderboardPageTop = f25_local1
			f25_arg0.leaderboardPageRow = f25_local2
		end
	end,
	SelectDelta = function ( f26_arg0 )
		local f26_local0 = OpLeaderboardDataController.GetScoped()
		f26_local0.leaderboardPageRow = f26_local0.leaderboardPageRow + f26_arg0
		OpLeaderboardDataController.FixCoords( f26_local0 )
		Leaderboards.UpdateCurrentIndex( f26_local0.controller, f26_local0.leaderboardPageTop + f26_local0.leaderboardPageRow - 1 )
		if OpLeaderboardDataController.uiitemList and OpLeaderboardMenu.menu.list:getFirstInFocus() ~= nil then
			OpLeaderboardDataController.uiitemList:processEvent( {
				name = "lose_focus"
			} )
		end
		local f26_local1 = OpLeaderboardDataController.uiitemList:getFirstDescendentById( "opleaderboard_row_button_" .. tostring( f26_local0.leaderboardPageRow ) )
		local f26_local2 = OpLeaderboardDataController.uiitemList:getFirstInFocus()
		if f26_local2 and f26_local1 ~= f26_local2 then
			f26_local2:processEvent( {
				name = "lose_focus"
			} )
		end
		if f26_local1 and f26_local1 ~= f26_local2 then
			f26_local1:processEvent( {
				name = "gain_focus"
			} )
		end
		if OpLeaderboardDataController.uiitemPanel then
			OpLeaderboardDataController.uiitemPanel:processEvent( {
				name = "opleaderboard_selection_changed",
				dispatchChildren = true
			} )
			OpLeaderboardDataController.uiitemPanel:processEvent( {
				name = "opleaderboard_update_elements",
				dispatchChildren = true
			} )
		end
	end
}
local f0_local2 = 26
OpLeaderboardDataController.SelectByItem = function ( f27_arg0 )
	local f27_local0 = tonumber( string.sub( f27_arg0.id, f0_local2 ) )
	local f27_local1 = OpLeaderboardDataController.GetScoped()
	f27_local1.leaderboardPageRow = f27_local0
	OpLeaderboardDataController.FixCoords( f27_local1 )
	Leaderboards.UpdateCurrentIndex( f27_local1.controller, f27_local1.leaderboardPageTop + f27_local1.leaderboardPageRow - 1 )
	if OpLeaderboardDataController.uiitemList and OpLeaderboardMenu.menu.list:getFirstInFocus() ~= nil then
		OpLeaderboardDataController.uiitemList:processEvent( {
			name = "lose_focus"
		} )
	end
	local f27_local2 = OpLeaderboardDataController.uiitemList:getFirstDescendentById( "opleaderboard_row_button_" .. tostring( f27_local1.leaderboardPageRow ) )
	local f27_local3 = OpLeaderboardDataController.uiitemList:getFirstInFocus()
	if f27_local3 and f27_local2 ~= f27_local3 then
		f27_local3:processEvent( {
			name = "lose_focus"
		} )
	end
	if f27_local2 and f27_local2 ~= f27_local3 then
		f27_local2:processEvent( {
			name = "gain_focus"
		} )
	end
	if OpLeaderboardDataController.uiitemPanel then
		OpLeaderboardDataController.uiitemPanel:processEvent( {
			name = "opleaderboard_selection_changed",
			dispatchChildren = true,
			mouse = true
		} )
		OpLeaderboardDataController.uiitemPanel:processEvent( {
			name = "opleaderboard_update_elements",
			dispatchChildren = true
		} )
	end
end

OpLeaderboardDataController.IsSelectedByItem = function ( f28_arg0 )
	local f28_local0 = tonumber( string.sub( f28_arg0.id, f0_local2 ) )
	local f28_local1 = OpLeaderboardDataController.GetScoped()
	return f28_local1.leaderboardPageRow == f28_local0
end

