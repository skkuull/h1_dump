CombatRecordBaseWidth = 890
CombatRecordBaseLeft = 365
CombatRecordBaseTop = LUI.MenuTemplate.ListTop + 14
CombatRecordBaseHeight = 532
MenuBaseLeft = 0
CombatRecord = {
	SmallFont = CoD.TextSettings.TitleFontTinyBold,
	PanelDimensions = {
		left = 296,
		width = 782,
		top = CombatRecordBaseTop,
		height = 472
	},
	MenuDimensions = {
		left = MenuBaseLeft,
		width = CombatRecordBaseWidth,
		top = CombatRecordBaseTop,
		height = CombatRecordBaseHeight
	},
	ListDimensions = {
		top = CombatRecordBaseTop,
		width = 286,
		height = 464
	},
	TabDimensions = {
		top = LUI.MenuTemplate.ListTop - 24
	},
	GameModes = {
		X = 0,
		Y = 50,
		Width = 282,
		Height = 100,
		XSkip = 304,
		YSkip = 120,
		Image = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				width = 100,
				top = 0,
				height = 100
			}
		},
		TextTitle = {
			Rect = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = 110,
				width = 172,
				top = 0,
				height = 20
			}
		},
		Stats = {
			X1 = 110,
			X2 = 230,
			Y = 20,
			Width1 = 120,
			Width2 = 52,
			Height = 18,
			YSkip = 20
		}
	},
	AwardsTable = {
		File = "mp/awardTable.csv",
		Cols = {
			IsMedal = 0,
			ReferenceName = 1,
			Icon = 2,
			Title = 3,
			Desc = 4,
			AwardType = 7,
			Hide = 8
		}
	},
	PerkTable = {
		File = "mp/perkTable.csv",
		Cols = {
			Ref = 1,
			Name = 2,
			Image = 3
		}
	},
	AttachmentTable = {
		File = "mp/attachmentBase.csv",
		Cols = {
			Ref = 1,
			Name = 3,
			Image = 5
		}
	}
}
CareerStatsType = {
	INT_COUNTER = 1,
	INT_PERCENT_OF_100 = 2,
	INT_TIME_IN_SECS_WORDS = 3,
	INT_TIME_IN_SECS_LETTERS = 4,
	RATIO = 5,
	INT_DECIMAL_PERCENT = 6,
	NA_ZERO = 7,
	INT_DECIMAL_PERCENT_NO_SIGN = 8
}
CombatRecord.CreateInfoPanel = function ( f1_arg0 )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = CombatRecord.PanelDimensions.left,
		width = CombatRecord.PanelDimensions.width,
		top = CombatRecord.PanelDimensions.top,
		height = CombatRecord.PanelDimensions.height
	} )
	self.controller = f1_arg0
	return self
end

CombatRecord.GetRankInfo = function ( f2_arg0 )
	local f2_local0 = {
		prestige = 0,
		experience = 0
	}
	if Engine.DoWeHaveStats( f2_arg0 ) == true then
		f2_local0.prestige = Engine.GetPlayerData( f2_arg0, CoD.StatsGroup.Ranked, "prestige" ) or 0
		f2_local0.experience = Engine.GetPlayerDataMPXP( f2_arg0 ) or 0
	end
	f2_local0.maxRank = Rank.GetMaxRank( f2_local0.prestige )
	f2_local0.maxExperience = Rank.GetRankMaxXP( f2_local0.maxRank, f2_local0.prestige )
	if f2_local0.maxExperience < f2_local0.experience then
		f2_local0.experience = f2_local0.maxExperience
	end
	f2_local0.rank = Lobby.GetRankForXP( f2_local0.experience, f2_local0.prestige )
	local f2_local1
	if f2_local0.maxRank < f2_local0.rank + 1 then
		f2_local1 = f2_local0.maxRank
		if not f2_local1 then
		
		else
			f2_local0.rank2 = f2_local1
			f2_local1
			if f2_local0.maxExperience < Rank.GetRankMaxXP( f2_local0.rank, f2_local0.prestige ) then
				f2_local1 = f2_local0.maxExperience
				if not f2_local1 then
				
				else
					f2_local0.experience2 = f2_local1
					f2_local0.displayRankNum1 = Rank.GetRankDisplay( f2_local0.rank, Engine.IsAliensMode() and CoD.PlayMode.Aliens or CoD.PlayMode.Core )
					f2_local0.displayRankString1 = Rank.GetFullRank( f2_local0.rank )
					if f2_local0.rank < f2_local0.maxRank then
						f2_local0.displayRankString2 = Rank.GetFullRank( f2_local0.rank2 )
					else
						f2_local0.displayRankString2 = Engine.Localize( "@LUA_MP_FRONTEND_PRESTIGE_NUM", f2_local0.prestige + 1 )
					end
					return f2_local0
				end
			end
			f2_local1 = Rank.GetRankMaxXP( f2_local0.rank, f2_local0.prestige )
		end
	end
	f2_local1 = f2_local0.rank + 1
end

CombatRecord.AddTitleText = function ( f3_arg0 )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 15,
		width = 200,
		top = 5,
		height = CombatRecord.SmallFont.Height,
		font = CombatRecord.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		color = grey_25
	} )
	self:setText( f3_arg0 )
	return self
end

CombatRecord.AddPlayerCardPanel = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local self = LUI.UIBackgroundPanel.new( f4_arg0 )
	local f4_local1 = CombatRecord.GetRankInfo( f4_arg1 )
	self:addElement( LUI.Playercard.new( {
		scale = f4_arg2
	}, {
		gamertag = Engine.GetUsernameByController( f4_arg1 ),
		clantag = Engine.GetProfileDataUseEliteClanTag( f4_arg1 ) and Clan.GetTag( f4_arg1 ) or Engine.GetCustomClanTag( f4_arg1 ),
		background = Cao.GetCallingCard( f4_arg1 ),
		xuid = Engine.GetXUIDByController( f4_arg1 ),
		emblem = Cao.GetEmblemPatch( f4_arg1 ),
		prestige = f4_local1.prestige,
		rank = f4_local1.rank
	} ) )
	if f4_arg3 then
		self:addElement( CombatRecord.AddTitleText( f4_arg3 ) )
	end
	return self
end

CombatRecord.AddProgressBar = function ( f5_arg0 )
	local f5_local0 = 250
	local f5_local1 = 3
	local f5_local2 = f5_arg0.experience / f5_arg0.experience2 * (f5_local0 - f5_local1 * 2)
	local self = LUI.UIElement.new( CoD.CreateState( -f5_local0 / 2, 0, f5_local0 / 2, 10, CoD.AnchorTypes.Top ) )
	self:addElement( LUI.UIBorder.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		color = Colors.grey_4,
		borderThickness = 1
	} ) )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 2,
		bottom = -2,
		left = f5_local1,
		width = f5_local2,
		material = RegisterMaterial( "white" )
	} ) )
	return self
end

CombatRecord.AddCurrentRankPanel = function ( f6_arg0, f6_arg1, f6_arg2 )
	local self = LUI.UIBackgroundPanel.new( f6_arg0 )
	local f6_local1 = LUI.UIVerticalList.new
	local f6_local2 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0
	}
	local f6_local3
	if f6_arg2 then
		f6_local3 = 10
		if not f6_local3 then
		
		else
			f6_local2.top = f6_local3
			f6_local2.right = 0
			f6_local2.bottom = 0
			f6_local2.spacing = 6
			f6_local1 = f6_local1( f6_local2 )
			f6_local2 = CombatRecord.GetRankInfo( f6_arg1 )
			f6_local1:addElement( LUI.UIImage.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				left = -50,
				width = 100,
				top = 0,
				height = 100,
				material = RegisterMaterial( Rank.GetRankIcon( f6_local2.rank, f6_local2.prestige, Rank.GetCustomRankIcons( f6_local2.prestige, f6_local2.experience ) ) )
			} ) )
			local self = LUI.UIText.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				top = 0,
				height = CombatRecord.SmallFont.Height,
				font = CombatRecord.SmallFont.Font,
				alignment = LUI.Alignment.Center
			} )
			self:setText( Engine.Localize( "LUA_MP_FRONTEND_COMBAT_RANK", f6_local2.displayRankString1 ) )
			f6_local1:addElement( self )
			local self = LUI.UIText.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				top = 0,
				height = CombatRecord.SmallFont.Height,
				font = CombatRecord.SmallFont.Font,
				alignment = LUI.Alignment.Center
			} )
			self:setText( Engine.Localize( "LUA_MP_FRONTEND_COMBAT_LEVEL", f6_local2.displayRankNum1 ) )
			f6_local1:addElement( self )
			self:addElement( f6_local1 )
			if f6_arg2 then
				self:addElement( CombatRecord.AddTitleText( f6_arg2 ) )
			end
			return self
		end
	end
	f6_local3 = 2
end

CombatRecord.AddNextRankPanel = function ( f7_arg0, f7_arg1, f7_arg2 )
	local self = LUI.UIBackgroundPanel.new( f7_arg0 )
	local f7_local1 = LUI.UIVerticalList.new
	local f7_local2 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0
	}
	local f7_local3
	if f7_arg2 then
		f7_local3 = 10
		if not f7_local3 then
		
		else
			f7_local2.top = f7_local3
			f7_local2.right = 0
			f7_local2.bottom = 0
			f7_local2.spacing = 3
			f7_local1 = f7_local1( f7_local2 )
			f7_local2 = CombatRecord.GetRankInfo( f7_arg1 )
			f7_local3 = Rank.GetMaxRank( f7_local2.prestige ) == f7_local2.rank
			local f7_local4 = f7_local2.prestige >= Lobby.GetMaxPrestigeLevel()
			local f7_local5 = f7_local2.experience < f7_local2.maxExperience
			local f7_local6 = Rank.GetCustomRankIcons( f7_local2.prestige, f7_local2.experience2 )
			local f7_local7 = LUI.UIImage.new
			local f7_local8 = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				left = -50,
				width = 100,
				top = 0,
				height = 100
			}
			local self
			if f7_local3 and not f7_local4 then
				self = RegisterMaterial( Rank.GetRankIcon( 1, f7_local2.prestige + 1 ) )
				if not self then
				
				else
					f7_local8.material = self
					self
					if f7_local4 and f7_local3 then
						self = 0
						if not self then
						
						else
							f7_local8.alpha = self
							f7_local1:addElement( f7_local7( f7_local8 ) )
							if f7_local5 then
								f7_local1:addElement( CombatRecord.AddProgressBar( f7_local2 ) )
							end
							f7_local8 = ""
							if f7_local4 and f7_local3 then
								f7_local8 = Engine.Localize( "LUA_MP_FRONTEND_COMBAT_RECORD_MAX_PRESTIGE" )
							elseif not f7_local5 then
								f7_local8 = Engine.Localize( "LUA_MP_FRONTEND_COMBAT_RECORD_PRESTIGE" )
							else
								f7_local8 = Engine.Localize( "LUA_MP_FRONTEND_PROGRESS", f7_local2.displayRankString2 )
							end
							self = LUI.UIText.new( {
								topAnchor = true,
								bottomAnchor = false,
								leftAnchor = true,
								rightAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								height = CombatRecord.SmallFont.Height,
								font = CombatRecord.SmallFont.Font,
								alignment = LUI.Alignment.Center
							} )
							self:setText( f7_local8 )
							f7_local1:addElement( self )
							local self = LUI.UIText.new( {
								topAnchor = true,
								bottomAnchor = false,
								leftAnchor = true,
								rightAnchor = true,
								left = 0,
								right = 0,
								top = 0,
								height = CombatRecord.SmallFont.Height,
								font = CombatRecord.SmallFont.Font,
								alignment = LUI.Alignment.Center
							} )
							self:setText( Engine.Localize( "LUA_MP_FRONTEND_XP_PROGRESS", f7_local2.experience, f7_local2.experience2 ) )
							if f7_local5 then
								f7_local1:addElement( self )
							end
							self:addElement( f7_local1 )
							if f7_arg2 then
								self:addElement( CombatRecord.AddTitleText( f7_arg2 ) )
							end
							return self
						end
					end
					self = 1
				end
			end
			self = RegisterMaterial( Rank.GetRankIcon( f7_local2.rank2, f7_local2.prestige, Rank.GetCustomRankIcons( f7_local2.prestige, f7_local2.experience2, f7_local6 ) ) )
		end
	end
	f7_local3 = 2
end

CombatRecord.CareerInfoVerticalList = function ( f8_arg0 )
	local self = LUI.UIVerticalList.new( CoD.CreateState( 0, 0, CombatRecord.MenuDimensions.width / 3, 0, CoD.AnchorTypes.TopBottomLeft ) )
	self.id = "careerInfoVL"
	self:addElement( CombatRecord.AddPlayerCardPanel( CoD.CreateState( 0, 0, 0, CombatRecord.MenuDimensions.height / 3, CoD.AnchorTypes.TopLeftRight ), f8_arg0, -0.5, Engine.Localize( "MENU_NAME" ) ) )
	self:addElement( CombatRecord.AddCurrentRankPanel( CoD.CreateState( 0, 0, 0, CombatRecord.MenuDimensions.height / 3, CoD.AnchorTypes.TopLeftRight ), f8_arg0, Engine.Localize( "LUA_MENU_CURRENT_RANK" ) ) )
	self:addElement( CombatRecord.AddNextRankPanel( CoD.CreateState( 0, 0, 0, CombatRecord.MenuDimensions.height / 3, CoD.AnchorTypes.TopLeftRight ), f8_arg0, Engine.Localize( "LUA_MENU_NEXT_RANK" ) ) )
	return self
end

CombatRecord.GetCareerStatsKDRatio = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = nil
	local f9_local1
	if f9_arg2 then
		f9_local1 = Engine.GetPlayerData( f9_arg0, CoD.StatsGroup.Ranked, "weaponStats", f9_arg2, "deaths" )
		if not f9_local1 then
		
		else
			local f9_local2
			if f9_arg2 then
				f9_local2 = Engine.GetPlayerData( f9_arg0, CoD.StatsGroup.Ranked, "weaponStats", f9_arg2, "kills" )
				if not f9_local2 then
				
				else
					if f9_local1 > 0 then
						local f9_local3 = tostring( string.format( "%.2f", f9_local2 / f9_local1 ) )
					end
					return f9_local3 or f9_local2
				end
			end
			f9_local2 = Engine.GetPlayerData( f9_arg0, CoD.StatsGroup.Ranked, "kills" )
		end
	end
	f9_local1 = Engine.GetPlayerData( f9_arg0, CoD.StatsGroup.Ranked, "deaths" )
end

CombatRecord.GetCareerStatsWLRatio = function ( f10_arg0, f10_arg1 )
	local f10_local0 = nil
	local f10_local1 = Engine.GetPlayerData( f10_arg0, CoD.StatsGroup.Ranked, "wins" )
	local f10_local2 = Engine.GetPlayerData( f10_arg0, CoD.StatsGroup.Ranked, "losses" )
	if f10_local2 > 0 then
		local f10_local3 = tostring( string.format( "%.2f", f10_local1 / f10_local2 ) )
	end
	return f10_local3 or f10_local1
end

CombatRecord.GetGameModesWLRatio = function ( f11_arg0, f11_arg1 )
	local f11_local0 = nil
	local f11_local1 = Engine.GetPlayerData( f11_arg0, CoD.StatsGroup.Ranked, "combatRecord", f11_arg1, "wins" )
	local f11_local2 = Engine.GetPlayerData( f11_arg0, CoD.StatsGroup.Ranked, "combatRecord", f11_arg1, "numMatches" ) - f11_local1
	if f11_local2 > 0 then
		local f11_local3 = tostring( string.format( "%.2f", f11_local1 / f11_local2 ) )
	end
	return f11_local3 or f11_local1
end

CombatRecord.GetGameModesWLPercentage = function ( f12_arg0, f12_arg1 )
	local f12_local0 = nil
	local f12_local1 = Engine.GetPlayerData( f12_arg0, CoD.StatsGroup.Ranked, "combatRecord", f12_arg1, "wins" )
	local f12_local2 = Engine.GetPlayerData( f12_arg0, CoD.StatsGroup.Ranked, "combatRecord", f12_arg1, "numMatches" )
	local f12_local3 = Engine.GetPlayerData( f12_arg0, CoD.StatsGroup.Ranked, "combatRecord", f12_arg1, "ties" )
	local f12_local4
	if f12_local1 > 0 then
		f12_local4 = f12_local1 / (f12_local1 + f12_local2 - f12_local1 + f12_local3)
		if not f12_local4 then
		
		else
			return CombatRecord.GetCareerStatsInfoString( CareerStatsType.INT_DECIMAL_PERCENT_NO_SIGN, f12_local4 )
		end
	end
	f12_local4 = 0
end

CombatRecord.GetGameModesKDRatio = function ( f13_arg0, f13_arg1 )
	local f13_local0 = nil
	local f13_local1 = Engine.GetPlayerData( f13_arg0, CoD.StatsGroup.Ranked, "combatRecord", f13_arg1, "kills" )
	local f13_local2 = Engine.GetPlayerData( f13_arg0, CoD.StatsGroup.Ranked, "combatRecord", f13_arg1, "deaths" )
	if f13_local2 > 0 then
		local f13_local3 = tostring( string.format( "%.2f", f13_local1 / f13_local2 ) )
	end
	return f13_local3 or f13_local1
end

CombatRecord.GetGameModesXpPerMinute = function ( f14_arg0, f14_arg1 )
	local f14_local0 = nil
	local f14_local1 = Engine.GetPlayerData( f14_arg0, CoD.StatsGroup.Ranked, "combatRecord", f14_arg1, "timePlayed" )
	local f14_local2 = Engine.GetPlayerData( f14_arg0, CoD.StatsGroup.Ranked, "combatRecord", f14_arg1, "xpEarned" )
	if f14_local1 >= 60 then
		f14_local0 = tostring( string.format( "%.2f", f14_local2 / f14_local1 / 60 ) )
	elseif f14_local1 > 0 then
		f14_local0 = tostring( string.format( "%.2f", f14_local2 / f14_local1 * 60 ) )
	else
		f14_local0 = "0"
	end
	return f14_local0
end

CombatRecord.GetCareerStatsScorePerMinute = function ( f15_arg0, f15_arg1 )
	local f15_local0 = nil
	local f15_local1 = Engine.GetPlayerData( f15_arg0, CoD.StatsGroup.Ranked, "timePlayedTotal" )
	if f15_local1 >= 60 then
		f15_local0 = tostring( string.format( "%.2f", Engine.GetPlayerData( f15_arg0, CoD.StatsGroup.Ranked, "score" ) / f15_local1 / 60 ) )
	else
		f15_local0 = "0"
	end
	return f15_local0
end

CareerStatsInfoTable = {
	{
		text = "LUA_MENU_KILLS_CAPS",
		statVarName = "kills",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MENU_WINS_CAPS",
		statVarName = "wins",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MENU_SCORE_CAPS",
		statVarName = "score",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "MPUI_COMBATRECORD_KD_RATIO",
		getStatValueFunc = CombatRecord.GetCareerStatsKDRatio
	},
	{
		text = "LUA_MP_FRONTEND_WL_RATIO_CAPS",
		getStatValueFunc = CombatRecord.GetCareerStatsWLRatio
	},
	{
		text = "LUA_MP_FRONTEND_SCORE_PER_MINUTE_CAPS",
		getStatValueFunc = CombatRecord.GetCareerStatsScorePerMinute
	}
}
CareerDetailsInfoTable = {
	{
		text = "LUA_MP_FRONTEND_COMBAT_TIME_CAPS",
		statVarName = "timePlayedTotal",
		statsType = CareerStatsType.INT_TIME_IN_SECS_LETTERS
	},
	{
		text = "LUA_MENU_KILLS_CAPS",
		statVarName = "kills",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MENU_DEATHS_CAPS",
		statVarName = "deaths",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MENU_WINS_CAPS",
		statVarName = "wins",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MP_FRONTEND_WL_RATIO_CAPS",
		getStatValueFunc = CombatRecord.GetCareerStatsWLRatio
	},
	{
		text = "LUA_MENU_SCORE_CAPS",
		statVarName = "score",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MP_FRONTEND_SCORE_PER_MINUTE_CAPS",
		getStatValueFunc = CombatRecord.GetCareerStatsScorePerMinute
	},
	{
		text = "LUA_MENU_ACCURACY_CAPS",
		statVarName = "accuracy",
		statsType = CareerStatsType.INT_PERCENT_OF_100
	},
	{
		text = "LUA_MP_FRONTEND_GAMES_PLAYED_CAPS",
		statVarName = "gamesPlayed",
		statsType = CareerStatsType.INT_COUNTER
	}
}
CombatRecord.WeaponStatDetailsTable = {
	{
		text = "LUA_MENU_KILLS_CAPS",
		statVarName = "TotalKills",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "MPUI_COMBATRECORD_KD_RATIO",
		statVarName = "TotalKD",
		statsType = CareerStatsType.RATIO
	},
	{
		text = "LUA_MENU_ACCURACY_CAPS",
		statVarName = "TotalAccuracy",
		statsType = CareerStatsType.INT_DECIMAL_PERCENT
	},
	{
		text = "MPUI_COMBATRECORD_HEADSHOTS",
		statVarName = "TotalHeadShots",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "MPUI_COMBATRECORD_TIMEEQUIPPED_CAPS",
		statVarName = "TimeInUse",
		statsType = CareerStatsType.INT_TIME_IN_SECS_LETTERS
	}
}
CombatRecord.MeleeWeaponStatDetailsTable = {
	{
		text = "LUA_MENU_KILLS_CAPS",
		statVarName = "TotalKills",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "MPUI_COMBATRECORD_KD_RATIO",
		statVarName = "TotalKD",
		statsType = CareerStatsType.RATIO
	},
	{
		text = "LUA_MENU_ACCURACY_CAPS",
		statVarName = "TotalAccuracy",
		statsType = CareerStatsType.INT_DECIMAL_PERCENT
	},
	{
		text = "MPUI_COMBATRECORD_TIMEEQUIPPED_CAPS",
		statVarName = "TimeInUse",
		statsType = CareerStatsType.INT_TIME_IN_SECS_LETTERS
	}
}
CombatRecord.LauncherStatDetailsTable = {
	{
		text = "LUA_MENU_KILLS_CAPS",
		statVarName = "kills",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MP_FRONTEND_USED",
		statVarName = "shots",
		statsType = CareerStatsType.INT_COUNTER
	}
}
CombatRecord.GameModesStatDetailsTable = {
	{
		text = "LUA_MENU_WINS_CAPS",
		statVarName = "wins",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "MPUI_COMBATRECORD_KD_RATIO",
		getStatValueFunc = CombatRecord.GetGameModesKDRatio
	},
	{
		text = "LUA_MENU_WIN_PERCENTAGE",
		getStatValueFunc = CombatRecord.GetGameModesWLPercentage
	},
	{
		text = "LUA_MENU_TOTAL_XP_EARNED_CAPS",
		statVarName = "xpEarned",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "MPUI_COMBATRECORD_XP_PER_MINUTE",
		getStatValueFunc = CombatRecord.GetGameModesXpPerMinute
	}
}
CombatRecord.ScoreStreakStatDetailsTable = {
	{
		text = "LUA_MP_FRONTEND_SCORESTREAK_EARNED",
		statConcat = "earned",
		statsType = CareerStatsType.INT_COUNTER
	},
	{
		text = "LUA_MENU_KILLS_CAPS",
		statConcat = "kill",
		statsType = CareerStatsType.INT_COUNTER
	}
}
GameModesList = {
	"war",
	"dm",
	"dom",
	"conf",
	"sd",
	"hp",
	"gun",
	"sab",
	"koth"
}
CombatRecord.GetCareerStatsInfoString = function ( f16_arg0, f16_arg1 )
	local f16_local0 = nil
	if f16_arg0 == CareerStatsType.INT_COUNTER then
		f16_local0 = tostring( f16_arg1 )
	elseif f16_arg0 == CareerStatsType.INT_PERCENT_OF_100 then
		f16_local0 = tostring( f16_arg1 / 100 ) .. Engine.Localize( "@MPUI_COMBATRECORD_PERCENT" )
	elseif f16_arg0 == CareerStatsType.INT_TIME_IN_SECS_WORDS or f16_arg0 == CareerStatsType.INT_TIME_IN_SECS_LETTERS then
		if f16_arg0 == CareerStatsType.INT_TIME_IN_SECS_WORDS then
			local f16_local1 = Engine.FormatTimeDaysHoursMinutesTight( math.floor( f16_arg1 ) )
		end
		f16_local0 = f16_local1 or Engine.FormatTimeDaysHoursMinutesSecondsTight( math.floor( f16_arg1 ) )
	elseif f16_arg0 == CareerStatsType.RATIO then
		f16_local0 = tostring( string.format( "%.2f", f16_arg1 ) )
	elseif f16_arg0 == CareerStatsType.INT_DECIMAL_PERCENT then
		f16_local0 = tostring( math.floor( string.format( "%.2f", f16_arg1 ) * 100 ) ) .. Engine.Localize( "@MPUI_COMBATRECORD_PERCENT" )
	elseif f16_arg0 == CareerStatsType.INT_DECIMAL_PERCENT_NO_SIGN then
		f16_local0 = tostring( math.floor( string.format( "%.2f", f16_arg1 ) * 100 ) )
	elseif f16_arg0 == CareerStatsType.NA_ZERO then
		if f16_arg1 > 0 then
			local f16_local2 = tostring( f16_arg1 )
		end
		f16_local0 = f16_local2 or Engine.Localize( "@MPUI_COMBATRECORD_NA" )
	end
	if not f16_local0 or f16_local0 == "" then
		f16_local0 = Engine.Localize( "@MPUI_COMBATRECORD_NA" )
	end
	return f16_local0
end

CombatRecord.GetRankedStatsInfoString = function ( f17_arg0, f17_arg1 )
	local f17_local0 = nil
	if f17_arg1.getStatValueFunc then
		f17_local0 = f17_arg1.getStatValueFunc( f17_arg0, f17_arg1 )
	elseif f17_arg1.statVarName and f17_arg1.statsType then
		f17_local0 = CombatRecord.GetCareerStatsInfoString( f17_arg1.statsType, Engine.GetPlayerData( f17_arg0, CoD.StatsGroup.Ranked, f17_arg1.statVarName ) )
	end
	return f17_local0
end

CombatRecord.GetTotalStatsInfoString = function ( f18_arg0, f18_arg1 )
	return CombatRecord.GetCareerStatsInfoString( f18_arg0.statsType, f18_arg1[f18_arg0.statVarName] )
end

CombatRecord.GetWeaponStatsInfoString = function ( f19_arg0, f19_arg1, f19_arg2 )
	return CombatRecord.GetCareerStatsInfoString( f19_arg1.statsType, Engine.GetPlayerData( f19_arg0, CoD.StatsGroup.Ranked, "weaponStats", Cac.StripMPSuffix( f19_arg2 ), f19_arg1.statVarName ) )
end

CombatRecord.GetAttachmentStatsInfoString = function ( f20_arg0, f20_arg1, f20_arg2 )
	return CombatRecord.GetCareerStatsInfoString( f20_arg1.statsType, Engine.GetPlayerData( f20_arg0, CoD.StatsGroup.Ranked, "attachmentsStats", f20_arg2, f20_arg1.statVarName ) )
end

CombatRecord.GetMeleeWeaponStatsInfoString = function ( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = nil
	if f21_arg1.getStatValueFunc then
		f21_local0 = f21_arg1.getStatValueFunc( f21_arg0, f21_arg2 )
	elseif f21_arg1.statVarName and f21_arg1.statsType then
		f21_local0 = CombatRecord.GetTotalStatsInfoString( f21_arg1, Engine.GetCombatRecordWeaponStatsData( f21_arg0, {
			f21_arg2
		} ) )
	end
	return f21_local0
end

CombatRecord.GetGameModeStatsInfoString = function ( f22_arg0, f22_arg1, f22_arg2 )
	local f22_local0 = nil
	if f22_arg1.getStatValueFunc then
		f22_local0 = f22_arg1.getStatValueFunc( f22_arg0, f22_arg2 )
	elseif f22_arg1.statVarName and f22_arg1.statsType then
		f22_local0 = CombatRecord.GetCareerStatsInfoString( f22_arg1.statsType, Engine.GetPlayerData( f22_arg0, CoD.StatsGroup.Ranked, "combatRecord", f22_arg2, f22_arg1.statVarName ) )
	end
	return f22_local0
end

CombatRecord.GetScoreStreakStatsInfoString = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = nil
	local f23_local1 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f23_arg2, KillstreakTable.Cols.Type )
	local f23_local2 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f23_arg2, KillstreakTable.Cols.AlternateName )
	if f23_arg1.statConcat == "kill" and f23_local2 ~= "" then
		f23_arg2 = f23_local2
	end
	if f23_arg1.statConcat and f23_arg1.statsType then
		local f23_local3
		if f23_arg1.statConcat ~= "kill" or f23_local1 ~= "support" then
			f23_local3 = Engine.GetPlayerData( f23_arg0, CoD.StatsGroup.Common, "awards", f23_arg2 .. "_" .. f23_arg1.statConcat )
			if not f23_local3 then
			
			else
				if f23_local3 ~= nil then
					local f23_local4 = CombatRecord.GetCareerStatsInfoString( f23_arg1.statsType, f23_local3 )
				end
				f23_local0 = f23_local4 or nil
			end
		end
		f23_local3 = nil
	end
	return f23_local0
end

CombatRecord.AddPanelInfo = function ( menu, controller )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( 0, -(CombatRecord.PanelDimensions.height * 0.4), 0, 0, CoD.AnchorTypes.BottomLeftRight ) )
	self.id = "infoContainer"
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 10,
		bottom = 0,
		spacing = 10
	} )
	self.id = "panelInfoVL"
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		height = CoD.TextSettings.TitleFontMedium.Height,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alignment = LUI.Alignment.Center
	} )
	self:setText( menu )
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		height = CombatRecord.SmallFont.Height,
		font = CombatRecord.SmallFont.Font,
		alignment = LUI.Alignment.Center
	} )
	self:setText( controller )
	self:addElement( self )
	self:addElement( self )
	return self
end

CombatRecord.GetWeaponList = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
	local f25_local0 = {}
	if f25_arg3 == nil then
		f25_arg3 = true
	end
	local f25_local1 = Cac.GetWeaponIterator( f25_arg0, false, true, f25_arg1 )
	while f25_local1:GetWeaponName() ~= nil do
		local f25_local2 = f25_local1:GetWeaponName()
		f25_local0[#f25_local0 + 1] = stripMp and Cac.StripMPSuffix( f25_local2 ) or f25_local2
		f25_local1:Advance()
	end
	local f25_local2 = Cac.NullWeaponName_Primary
	if not (not f25_arg2 or f25_arg1) or f25_arg2 and f25_arg1 == f25_local2 then
		f25_local0[#f25_local0 + 1] = f25_local2
	end
	return f25_local0
end

CombatRecord.GetKillSortedWeaponData = function ( f26_arg0 )
	local f26_local0 = {}
	local f26_local1 = Cac.GetWeaponIterator( {
		Cac.Weapons.Primary,
		Cac.Weapons.Secondary
	}, true )
	while f26_local1:GetWeaponName() ~= nil do
		local f26_local2 = f26_local1:GetWeaponName()
		local f26_local3 = nil
		local f26_local4 = Engine.GetCombatRecordWeaponStatsData( f26_arg0, {
			f26_local2
		} )
		f26_local0[#f26_local0 + 1] = {
			itemName = f26_local2,
			weaponKills = f26_local4.TotalKills,
			itemString = Engine.Localize( Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f26_local2, StatsTable.Cols.Name ) )
		}
		f26_local1:Advance()
	end
	table.sort( f26_local0, function ( f27_arg0, f27_arg1 )
		if f27_arg0.weaponKills == f27_arg1.weaponKills then
			return f27_arg0.itemString < f27_arg1.itemString
		else
			return f27_arg1.weaponKills < f27_arg0.weaponKills
		end
	end )
	return f26_local0
end

CombatRecord.GetKillSortedMeleeWeaponData = function ( f28_arg0 )
	local f28_local0 = {}
	local f28_local1 = Cac.GetWeaponIterator( {
		Cac.Weapons.Melee
	}, true )
	while f28_local1:GetWeaponName() ~= nil do
		local f28_local2 = f28_local1:GetWeaponName()
		local f28_local3 = nil
		if f28_local2 ~= Cac.NullWeaponNames.Melee then
			local f28_local4 = Engine.GetCombatRecordWeaponStatsData( f28_arg0, {
				f28_local2
			} )
			f28_local0[#f28_local0 + 1] = {
				itemName = f28_local2,
				weaponKills = f28_local4.TotalKills,
				itemString = Engine.Localize( Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f28_local2, StatsTable.Cols.Name ) )
			}
		end
		f28_local1:Advance()
	end
	table.sort( f28_local0, function ( f29_arg0, f29_arg1 )
		if f29_arg0.weaponKills == f29_arg1.weaponKills then
			return f29_arg0.itemString < f29_arg1.itemString
		else
			return f29_arg1.weaponKills < f29_arg0.weaponKills
		end
	end )
	return f28_local0
end

CombatRecord.GetShotSortedLauncherData = function ( f30_arg0 )
	local f30_local0 = {}
	local f30_local1 = Cac.GetWeaponIterator( {
		Cac.Weapons.Equipment
	}, true )
	while f30_local1:GetWeaponName() ~= nil do
		local f30_local2 = f30_local1:GetWeaponName()
		local f30_local3 = nil
		local f30_local4 = CombatRecord.PerkTable
		f30_local0[#f30_local0 + 1] = {
			itemName = f30_local2,
			launcherUsed = Engine.GetPlayerData( f30_arg0, CoD.StatsGroup.Ranked, "weaponStats", Cac.StripMPSuffix( Cac.Addh1Prefix( f30_local2 ) ), "shots" ),
			itemString = Engine.Localize( Engine.TableLookup( f30_local4.File, f30_local4.Cols.Ref, f30_local2, f30_local4.Cols.Name ) ),
			useSecondaryTable = false
		}
		f30_local1:Advance()
	end
	f30_local1 = Cac.GetWeaponIterator( {
		Cac.Weapons.Attachments
	}, true )
	while f30_local1:GetWeaponName() ~= nil do
		local f30_local2 = f30_local1:GetWeaponName()
		local f30_local3 = nil
		local f30_local4 = CombatRecord.AttachmentTable
		f30_local0[#f30_local0 + 1] = {
			itemName = f30_local2,
			launcherUsed = Engine.GetPlayerData( f30_arg0, CoD.StatsGroup.Ranked, "attachmentsStats", f30_local2, "shots" ),
			itemString = Engine.Localize( Engine.TableLookup( f30_local4.File, f30_local4.Cols.Ref, f30_local2, f30_local4.Cols.Name ) ),
			useSecondaryTable = true
		}
		f30_local1:Advance()
	end
	table.sort( f30_local0, function ( f31_arg0, f31_arg1 )
		if f31_arg0.launcherUsed == f31_arg1.launcherUsed then
			return f31_arg0.itemString < f31_arg1.itemString
		else
			return f31_arg1.launcherUsed < f31_arg0.launcherUsed
		end
	end )
	return f30_local0
end

CombatRecord.GetGameModesList = function ()
	local f32_local0 = {}
	local f32_local1 = 1
	while Engine.TableLookupByRow( GameTypesTable.File, f32_local1, GameTypesTable.Cols.Ref ) ~= "" do
		f32_local0[#f32_local0 + 1] = Engine.TableLookupByRow( GameTypesTable.File, f32_local1, GameTypesTable.Cols.Ref )
		f32_local1 = f32_local1 + 1
	end
	return f32_local0
end

CombatRecord.GetWinSortedGameModeData = function ( f33_arg0 )
	local f33_local0 = {}
	for f33_local4, f33_local5 in ipairs( GameModesList ) do
		f33_local0[#f33_local0 + 1] = {
			itemName = f33_local5,
			modeWins = Engine.GetPlayerData( f33_arg0, CoD.StatsGroup.Ranked, "combatRecord", f33_local5, "wins" ),
			itemString = Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f33_local5, GameTypesTable.Cols.Name ) )
		}
	end
	table.sort( f33_local0, function ( f34_arg0, f34_arg1 )
		if f34_arg0.modeWins == f34_arg1.modeWins then
			return f34_arg0.itemString < f34_arg1.itemString
		else
			return f34_arg1.modeWins < f34_arg0.modeWins
		end
	end )
	return f33_local0
end

CombatRecord.GetEarnedSortedScoreStreakData = function ( f35_arg0 )
	local f35_local0 = {}
	for f35_local4, f35_local5 in ipairs( CombatRecord.GetWeaponList( {
		Cac.Weapons.Streak
	}, nil, nil, true ) ) do
		f35_local0[#f35_local0 + 1] = {
			itemName = f35_local5,
			itemEarned = Engine.GetPlayerData( f35_arg0, CoD.StatsGroup.Common, "awards", f35_local5 .. "_earned" ),
			itemString = Engine.Localize( Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f35_local5, KillstreakTable.Cols.Name ) .. "_LOWERC" )
		}
	end
	table.sort( f35_local0, function ( f36_arg0, f36_arg1 )
		if f36_arg0.itemEarned == f36_arg1.itemEarned then
			return f36_arg0.itemString < f36_arg1.itemString
		else
			return f36_arg1.itemEarned < f36_arg0.itemEarned
		end
	end )
	return f35_local0
end

CombatRecord.GetBestSortedMedals = function ( f37_arg0, f37_arg1 )
	local f37_local0 = {}
	local f37_local1 = {}
	local f37_local2 = 0
	while true do
		local f37_local3 = tonumber( Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f37_local2, CombatRecord.AwardsTable.Cols.IsMedal ) )
		if f37_local3 == nil then
			table.sort( f37_local0, function ( f38_arg0, f38_arg1 )
				return f38_arg1.value < f38_arg0.value
			end )
			for f37_local3 = 1, math.min( f37_arg1, #f37_local0 ), 1 do
				local f37_local6 = f37_local0[f37_local3].row
				f37_local1[#f37_local1 + 1] = {
					medalName = f37_local0[f37_local3].ref,
					medalMaterial = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f37_local6, CombatRecord.AwardsTable.Cols.Icon ),
					medalTitle = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f37_local6, CombatRecord.AwardsTable.Cols.Title ),
					count = f37_local0[f37_local3].value
				}
			end
			return f37_local1
		elseif f37_local3 == 1 then
			local f37_local4 = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f37_local2, CombatRecord.AwardsTable.Cols.ReferenceName )
			if f37_local4 and f37_local4 ~= "" then
				f37_local0[#f37_local0 + 1] = {
					row = f37_local2,
					ref = f37_local4,
					value = Engine.GetPlayerData( f37_arg0, CoD.StatsGroup.Common, "bests", f37_local4 ) or 0
				}
			end
		end
		f37_local2 = f37_local2 + 1
	end
end

CombatRecord.Border = function ( f39_arg0 )
	local self = LUI.UIBorder.new( {
		alpha = 0
	} )
	self:registerAnimationState( "focused", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = f39_arg0 or 0,
		top = 0,
		bottom = 0,
		alpha = 1,
		borderThickness = 3,
		color = Colors.s1Hud_canary
	} )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 0 ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	return self
end

CombatRecord.TemplateProps = {
	GameModes = {
		categoryMaterial = "ui_challenge_team_deathmatch",
		rightPanelTitle = "LUA_MP_FRONTEND_KD_TRENDS",
		infoTitle = "MPUI_COMBATRECORD_GAMEMODES_CAPS",
		infoDesc = "LUA_MP_FRONTEND_COMBAT_RECORD_GAME_MODES_DESC",
		showTrends = true
	},
	Weapons = {
		categoryMaterial = "ui_challenge_weapon_challenges",
		rightPanelTitle = "LUA_MP_FRONTEND_FAVORITE_WEAPON",
		favoriteCategoryArray = {
			Cac.Weapons.Primary,
			Cac.Weapons.Secondary
		},
		infoTitle = "MPUI_COMBATRECORD_WEAPONS_CAPS",
		infoDesc = "LUA_MP_FRONTEND_COMBAT_RECORD_WEAPONS_DESC",
		addKnife = true,
		favoriteStatsFunction = Engine.GetCombatRecordWeaponStatsData,
		favoriteImageState = {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = -175,
			right = 175,
			top = 90,
			height = 175
		},
		favoriteStat = "MostLethal",
		lookupTable = StatsTable
	},
	Launcher = {
		categoryMaterial = "ui_challenge_exo",
		rightPanelTitle = "LUA_MP_FRONTEND_FAVORITE_LAUNCHER",
		favoriteCategoryArray = {
			Cac.Weapons.Lethal
		},
		infoTitle = "MENU_EQUIPMENT_CAPS",
		infoDesc = "LUA_MP_FRONTEND_COMBAT_RECORD_LAUNCHER_DESC",
		favoriteStatsFunction = Engine.GetCombatRecordWeaponStatsData,
		favoriteImageState = {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = -75,
			right = 75,
			top = 100,
			height = 150
		},
		favoriteStat = "MostUsed",
		lookupTable = CombatRecord.PerkTable,
		concatenateMP = true
	},
	Scorestreaks = {
		categoryMaterial = "ui_challenge_scorestreaks",
		rightPanelTitle = "LUA_MP_FRONTEND_FAVORITE_SCORESTREAK",
		favoriteCategoryArray = {
			Cac.Weapons.Streak
		},
		infoTitle = "MENU_SCORESTREAKS_CAPS",
		infoDesc = "LUA_MP_FRONTEND_COMBAT_RECORD_SCORESTREAK_DESC",
		favoriteStatsFunction = Engine.GetScoreStreaksStatsData,
		favoriteImageState = {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = -75,
			right = 75,
			top = 100,
			height = 150
		},
		favoriteStat = "MostEarned",
		lookupTable = KillstreakTable
	}
}
CombatRecord.InputTable = {
	WeaponDetails = {
		MenuTitle = "MPUI_COMBATRECORD_WEAPONS_CAPS",
		OverviewCategoryTable = CombatRecord.WeaponStatDetailsTable,
		StatTextUpdateHandler = function ( f40_arg0, f40_arg1 )
			f40_arg0:setText( CombatRecord.GetTotalStatsInfoString( f40_arg0.itemDetails, Engine.GetCombatRecordWeaponStatsData( f40_arg1.controllerIndex, {
				f40_arg1.itemName
			} ) ) )
			return true
		end,
		ItemListFunction = CombatRecord.GetKillSortedWeaponData,
		ImageLookupTable = StatsTable,
		getImageLookupTable = function ( f41_arg0 )
			return StatsTable
		end,
		PanelImageHeight = 250,
		PanelTopOffset = -125,
		getItemListStatString = function ( f42_arg0 )
			return tostring( f42_arg0.weaponKills )
		end,
		getItemListStatTitleString = function ()
			return Engine.Localize( "LUA_MENU_KILLS_CAPS" )
		end
	},
	MeleeWeaponDetails = {
		MenuTitle = "MPUI_MELEE_CAPS",
		OverviewCategoryTable = CombatRecord.MeleeWeaponStatDetailsTable,
		StatTextUpdateHandler = function ( f44_arg0, f44_arg1 )
			if f44_arg1.useSecondaryTable then
				f44_arg0:setText( CombatRecord.GetMeleeWeaponStatsInfoString( f44_arg1.controllerIndex, f44_arg0.itemDetails, f44_arg1.itemName ) )
			else
				f44_arg0:setText( CombatRecord.GetMeleeWeaponStatsInfoString( f44_arg1.controllerIndex, f44_arg0.itemDetails, f44_arg1.itemName ) )
			end
			return true
		end,
		ItemListFunction = CombatRecord.GetKillSortedMeleeWeaponData,
		ImageLookupTable = StatsTable,
		getImageLookupTable = function ( f45_arg0 )
			return StatsTable
		end,
		PanelImageHeight = 250,
		PanelTopOffset = -125,
		getItemListStatString = function ( f46_arg0 )
			return tostring( f46_arg0.weaponKills )
		end,
		getItemListStatTitleString = function ()
			return Engine.Localize( "LUA_MENU_KILLS_CAPS" )
		end
	},
	LauncherDetails = {
		MenuTitle = "LUA_MENU_EXO_LAUNCHER_CAPS",
		OverviewCategoryTable = CombatRecord.LauncherStatDetailsTable,
		StatTextUpdateHandler = function ( f48_arg0, f48_arg1 )
			if f48_arg1.useSecondaryTable then
				f48_arg0:setText( CombatRecord.GetAttachmentStatsInfoString( f48_arg1.controllerIndex, f48_arg0.itemDetails, f48_arg1.itemName ) )
			else
				f48_arg0:setText( CombatRecord.GetWeaponStatsInfoString( f48_arg1.controllerIndex, f48_arg0.itemDetails, Cac.Addh1Prefix( f48_arg1.itemName ) ) )
			end
			return true
		end,
		ItemListFunction = CombatRecord.GetShotSortedLauncherData,
		getImageLookupTable = function ( f49_arg0 )
			if f49_arg0 then
				return CombatRecord.AttachmentTable
			else
				return CombatRecord.PerkTable
			end
		end,
		PanelImageHeight = 250,
		PanelTopOffset = -125,
		getItemListStatString = function ( f50_arg0 )
			return tostring( f50_arg0.launcherUsed )
		end,
		getItemListStatTitleString = function ()
			return Engine.ToUpperCase( Engine.Localize( "LUA_MP_FRONTEND_USED" ) )
		end
	},
	GameModeDetails = {
		MenuTitle = "MPUI_COMBATRECORD_GAMEMODES_CAPS",
		OverviewCategoryTable = CombatRecord.GameModesStatDetailsTable,
		StatTextUpdateHandler = function ( f52_arg0, f52_arg1 )
			f52_arg0:setText( CombatRecord.GetGameModeStatsInfoString( f52_arg1.controllerIndex, f52_arg0.itemDetails, f52_arg1.itemName ) )
			return true
		end,
		ItemListFunction = CombatRecord.GetWinSortedGameModeData,
		ImageLookupTable = GameTypesTable,
		getImageLookupTable = function ( f53_arg0 )
			return GameTypesTable
		end,
		PanelImageHeight = 525,
		getItemListStatString = function ( f54_arg0 )
			return tostring( f54_arg0.modeWins )
		end,
		getItemListStatTitleString = function ()
			return Engine.Localize( "MPUI_WINS_CAPS" )
		end
	},
	ScorestreakDetails = {
		MenuTitle = "MENU_SCORESTREAKS_CAPS",
		OverviewCategoryTable = CombatRecord.ScoreStreakStatDetailsTable,
		StatTextUpdateHandler = function ( f56_arg0, f56_arg1 )
			local f56_local0 = CombatRecord.GetScoreStreakStatsInfoString( f56_arg1.controllerIndex, f56_arg0.itemDetails, f56_arg1.itemName )
			if f56_local0 ~= nil then
				f56_arg0:setText( f56_local0 )
				return true
			else
				return false
			end
		end,
		ItemListFunction = CombatRecord.GetEarnedSortedScoreStreakData,
		ImageLookupTable = KillstreakTable,
		getImageLookupTable = function ( f57_arg0 )
			return KillstreakTable
		end,
		PanelImageHeight = 200,
		getItemListStatString = function ( f58_arg0 )
			return tostring( f58_arg0.itemEarned )
		end,
		getItemListStatTitleString = function ()
			return Engine.ToUpperCase( Engine.Localize( "LUA_MP_FRONTEND_SCORESTREAK_EARNED" ) )
		end
	}
}
function GetTrendsStatsData( f60_arg0 )
	local f60_local0 = {}
	if Engine.DoWeHaveStats( f60_arg0 ) == true then
		local f60_local1 = math.min( Engine.GetPlayerData( f60_arg0, CoD.StatsGroup.Ranked, "combatRecord", "numTrends" ), 5 )
		if f60_local1 > 0 then
			for f60_local2 = 1, f60_local1, 1 do
				local f60_local5 = {
					kills = Engine.GetPlayerData( f60_arg0, CoD.StatsGroup.Ranked, "combatRecord", "trend", f60_local2 - 1, "kills" ),
					deaths = Engine.GetPlayerData( f60_arg0, CoD.StatsGroup.Ranked, "combatRecord", "trend", f60_local2 - 1, "deaths" )
				}
				if f60_local5.deaths > 0 then
					f60_local5.kd = f60_local5.kills / f60_local5.deaths
				else
					f60_local5.kd = f60_local5.kills
				end
				f60_local0[f60_local2] = f60_local5
			end
		end
	end
	return f60_local0
end

CombatRecord.KDTrendsPanel = function ( f61_arg0, f61_arg1 )
	local f61_local0 = GetTrendsStatsData( f61_arg0 )
	local f61_local1 = #f61_local0
	local self = LUI.UIElement.new( f61_arg1 )
	local f61_local3 = 12
	if f61_local1 > 1 then
		local self = f61_arg1.width
		local f61_local5 = f61_arg1.height
		local f61_local6 = self / (f61_local1 - 1)
		local f61_local7 = f61_local0[1] and f61_local0[1].kd or 0
		local f61_local8 = 0
		if f61_local1 > 0 then
			for f61_local9 = 1, f61_local1, 1 do
				local f61_local12 = f61_local0[f61_local9].kd
				if f61_local12 < f61_local7 then
					f61_local7 = f61_local12
				end
				if f61_local8 < f61_local12 then
					f61_local8 = f61_local12
				end
			end
		end
		for f61_local9 = 1, f61_local1, 1 do
			local f61_local12 = CoD.CreateState( (f61_local9 - 1) * f61_local6, 0, f61_local9 * f61_local6, 0, CoD.AnchorTypes.TopBottomLeft )
			local self
			if f61_local9 ~= f61_local1 then
				self = LUI.UIBackgroundPanel.new( f61_local12 )
				if not self then
				
				else
					self.id = "trendSectionBackground" .. f61_local9
					self:addElement( self )
					local f61_local14 = 0.5
					local f61_local15 = 0.5
					local f61_local16 = f61_local0[f61_local9].kd
					local f61_local17 = f61_local0[f61_local9 + 1] and f61_local0[f61_local9 + 1].kd or 0
					if f61_local7 < f61_local8 then
						f61_local14 = 1 - (f61_local16 - f61_local7) / (f61_local8 - f61_local7)
						f61_local15 = 1 - (f61_local17 - f61_local7) / (f61_local8 - f61_local7)
					end
					local f61_local18 = f61_local14 * f61_local5 - f61_local3 / 2
					local f61_local19 = f61_local15 * f61_local5 - f61_local3 / 2
					if f61_local9 ~= f61_local1 then
						local f61_local20 = f61_local16 < f61_local17
						local self = CoD.CreateState( 0, f61_local18 + f61_local3 / 2, 0, f61_local19 + f61_local3 / 2, CoD.AnchorTypes.TopLeftRight )
						self.color = Colors.grey_6
						self:addElement( LUI.UILine.new( self ) )
					end
					self:addElement( LUI.UIImage.new( {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = -f61_local3 / 2,
						top = f61_local18,
						height = f61_local3,
						width = f61_local3,
						zRot = 45,
						material = RegisterMaterial( "white" ),
						color = Colors.sea_green
					} ) )
					local self = LUI.UIText.new( {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = -50,
						top = 195,
						height = CombatRecord.SmallFont.Height,
						width = 100,
						alignment = LUI.Alignment.Center,
						font = CombatRecord.SmallFont.Font
					} )
					self:setText( string.format( "%.2f", f61_local16 ) )
					self:addElement( self )
				end
			end
			self = LUI.UIElement.new( f61_local12 )
		end
	else
		local self = LUI.UIText.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = 0,
			height = CombatRecord.SmallFont.Height,
			alignment = LUI.Alignment.Center,
			font = CombatRecord.SmallFont.Font
		} )
		self:setText( Engine.Localize( "LUA_MP_FRONTEND_MISSING_KD_TRENDS" ) )
		self:addElement( self )
	end
	return self
end

