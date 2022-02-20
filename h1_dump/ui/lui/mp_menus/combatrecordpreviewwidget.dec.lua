LUI.CombatRecordPreviewWidget = InheritFrom( LUI.UIElement )
function buildLogo( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		width = 100,
		topAnchor = true,
		bottomAnchor = true
	} )
	local f1_local1 = RegisterMaterial( "h1_combatrecord_silverplate" )
	local f1_local2, f1_local3 = GetMaterialDimensions( f1_local1 )
	local f1_local4 = controller
	local self = LUI.UIImage.new( {
		material = f1_local1,
		width = f1_local4 * f1_local2 / f1_local3,
		height = f1_local4
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = f1_local1
	} )
	local f1_local7 = Rank.GetRankIcon( menu.rank, menu.prestige, Rank.GetCustomRankIcons( menu.prestige, menu.xp ) )
	local f1_local8, f1_local9 = GetMaterialDimensions( RegisterMaterial( f1_local7 ) )
	local f1_local10 = 60
	local self = LUI.UIImage.new( {
		height = f1_local10,
		width = f1_local10 * f1_local8 / f1_local9,
		material = RegisterMaterial( f1_local7 )
	} )
	self:addElement( self )
	self:addElement( self )
	return self
end

function buildRankAndTitle( f2_arg0 )
	local f2_local0 = Rank.GetFullRank( f2_arg0.rank )
	local f2_local1, f2_local2, f2_local3, f2_local4 = GetTextDimensions( f2_arg0.rankDisplay, CoD.TextSettings.BodyFont.Font, 50 )
	local f2_local5 = f2_local2 - f2_local4
	local f2_local6 = f2_local3 - f2_local1
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		width = 230,
		left = 100
	} )
	local f2_local8 = LUI.Alignment.Left
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Left,
		height = 50,
		width = 200,
		color = Colors.mp.aar_score_gold,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( f2_arg0.rankDisplay )
	local self = LUI.UIVerticalList.new( {
		left = 100,
		leftAnchor = true,
		width = 70,
		height = 70
	} )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Left,
		width = 200,
		height = 20,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font,
		lineSpacingRatio = 0.3
	} )
	self:setText( f2_local0 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

function buildStatsGrid( f3_arg0 )
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		width = 325,
		topAnchor = true,
		top = 16.5,
		left = 330,
		spacing = 15
	} )
	local f3_local1 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "kills" )
	local f3_local2 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "wins" )
	local f3_local3 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "losses" )
	local f3_local4 = CombatRecord.GetCareerStatsKDRatio( f3_arg0.controller )
	local f3_local5 = tostring( string.format( "%.2f", Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "accuracy" ) / 100 ) ) .. "%"
	local f3_local6 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "assists" )
	local f3_local7 = CombatRecord.GetCareerStatsScorePerMinute( f3_arg0.controller )
	local f3_local8 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "score" )
	local f3_local9 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "gamesPlayed" )
	local f3_local10 = nil
	if f3_local2 == 0 then
		f3_local10 = 0
	else
		f3_local10 = f3_local2 / (f3_local2 + f3_local3)
	end
	local f3_local11 = CombatRecord.GetCareerStatsInfoString( CareerStatsType.INT_DECIMAL_PERCENT_NO_SIGN, f3_local10 )
	local f3_local12 = Engine.FormatTimeDaysHoursMinutesSeconds( Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "timePlayedTotal" ) )
	local f3_local13 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "meleeKills" )
	local f3_local14 = Engine.GetPlayerData( f3_arg0.controller, CoD.StatsGroup.Ranked, "destructibleKills" )
	local f3_local15 = {
		text1 = f3_local1,
		subtext1 = Engine.Localize( "@LUA_MENU_KILLS_CAPS" ),
		text2 = f3_local13,
		subtext2 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_MELEEKILLS" ) ),
		text3 = f3_local9,
		subtext3 = Engine.Localize( "@LUA_MP_FRONTEND_GAMES_PLAYED_CAPS" )
	}
	local f3_local16 = {
		text1 = f3_local4,
		subtext1 = Engine.Localize( "@MPUI_COMBATRECORD_KD_RATIO" ),
		text2 = f3_local6,
		subtext2 = Engine.Localize( "@LUA_MENU_ASSISTS_CAPS" ),
		text3 = f3_local2,
		subtext3 = Engine.Localize( "@LUA_MENU_WINS_CAPS" )
	}
	local f3_local17 = {
		text1 = f3_local5,
		subtext1 = Engine.Localize( "@LUA_MENU_ACCURACY_CAPS" ),
		text2 = f3_local8,
		subtext2 = Engine.Localize( "@LUA_MENU_SCORE_CAPS" ),
		text3 = f3_local11,
		subtext3 = Engine.Localize( "@LUA_MENU_WIN_PERCENTAGE" )
	}
	local f3_local18 = {
		text1 = f3_local14,
		subtext1 = Engine.Localize( "@LUA_MENU_ENVIRONMENT_KILLS" ),
		text2 = f3_local7,
		subtext2 = Engine.Localize( "@LUA_MP_FRONTEND_SCORE_PER_MINUTE_CAPS" ),
		text3 = f3_local12,
		subtext3 = Engine.Localize( "@LUA_MENU_PLAY_TIME" )
	}
	self:addElement( buildStatsVList( "1", f3_local15 ) )
	self:addElement( buildStatsVList( "2", f3_local16 ) )
	self:addElement( buildStatsVList( "3", f3_local17 ) )
	self:addElement( buildStatsVList( "4", f3_local18 ) )
	return self
end

function buildStatsVList( f4_arg0, f4_arg1, f4_arg2 )
	local self = LUI.UIHorizontalList.new( {
		width = 100,
		height = 100,
		topAnchor = true,
		leftAnchor = true
	} )
	self.id = "statsHList" .. f4_arg0
	local self = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		width = 0.5,
		height = 153,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey,
		alpha = 0.55
	} )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		width = 20
	} )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 10,
		width = 115,
		height = 200,
		spacing = 15
	} )
	self.id = "statsVList" .. f4_arg0
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		height = 30,
		spacing = 2
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		height = 20,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		height = 12,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:addElement( self )
	self:addElement( self )
	self.id = "textHolder1"
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		width = 70,
		height = 0.5,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey,
		alpha = 0.55
	} )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		height = 30,
		spacing = 2
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		height = 20,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		height = 12,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:addElement( self )
	self:addElement( self )
	self.id = "textHolder2"
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		width = 70,
		height = 0.5,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey,
		alpha = 0.55
	} )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		height = 30,
		spacing = 2
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		height = 20,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		height = 12,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:addElement( self )
	self:addElement( self )
	self.id = "textHolder3"
	self:setText( f4_arg1.text1 )
	self:setText( f4_arg1.subtext1 )
	self:setText( f4_arg1.text2 )
	self:setText( f4_arg1.subtext2 )
	self:setText( f4_arg1.text3 )
	self:setText( f4_arg1.subtext3 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	if f4_arg2 then
		local self = LUI.UIImage.new( {
			topAnchor = true,
			leftAnchor = true,
			width = 0.5,
			height = 153,
			material = RegisterMaterial( "white" ),
			color = Colors.h1.medium_grey,
			alpha = 0.55
		} )
		local self = LUI.UIElement.new( {
			topAnchor = true,
			leftAnchor = true,
			width = 20
		} )
		self:addElement( self )
		self:addElement( self )
	end
	return self
end

function buildPlaytime( f5_arg0 )
	local f5_local0 = Engine.GetPlayerData( f5_arg0.controller, CoD.StatsGroup.Ranked, "timePlayedTotal" )
	local self = LUI.UIElement.new( {
		width = 182,
		height = 100,
		topAnchor = true,
		rightAnchor = true,
		top = 25
	} )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 30,
		spacing = 2,
		top = 60,
		left = 0
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		alignment = LUI.Alignment.Center,
		height = 12,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		alignment = LUI.Alignment.Center,
		height = 18,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:addElement( self )
	self:addElement( self )
	self:setText( Engine.Localize( "@LUA_MENU_PLAY_TIME" ) )
	self:setText( Engine.FormatTimeDaysHoursMinutesSeconds( f5_local0 ) )
	self:addElement( self )
	return self
end

function buildRankLogo( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6 )
	local f6_local0 = f6_arg2
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		width = f6_local0
	} )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.black,
		alpha = 0.5
	} ) )
	local f6_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f6_local2.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f6_local2 )
	self:setupTiles( 6 )
	self:addElement( self )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		top = 6,
		spacing = 4
	} )
	local f6_local5 = Rank.GetRankIcon( f6_arg0, f6_arg1, Rank.GetCustomRankIcons( f6_arg1, f6_arg4 ) )
	local f6_local6, f6_local7 = GetMaterialDimensions( RegisterMaterial( f6_local5 ) )
	local f6_local8 = 27
	local f6_local9 = f6_local6 / f6_local7
	local f6_local10 = LUI.UIImage.new
	local f6_local11 = {
		topAnchor = true,
		top = 5,
		height = f6_local8,
		width = f6_local8 * f6_local9
	}
	local self
	if f6_arg6 then
		self = 0.25
		if not self then
		
		else
			f6_local11.alpha = self
			f6_local11.material = RegisterMaterial( f6_local5 )
			self:addElement( f6_local10( f6_local11 ) )
			f6_local11 = LUI.UIHorizontalList.new
			self = {
				width = 40,
				bottom = -18
			}
			local f6_local13
			if f6_arg6 then
				f6_local13 = 0.25
				if not f6_local13 then
				
				else
					self.alpha = f6_local13
					f6_local11 = f6_local11( self )
					self = LUI.UIText.new( {
						height = 10,
						width = f6_local0,
						color = Colors.white,
						font = CoD.TextSettings.BodyFont.Font,
						alignment = LUI.Alignment.Center
					} )
					f6_local13, f6_local14 = nil
					if f6_arg5 == true then
						f6_local13 = Engine.Localize( "@LUA_MENU_PRESTIGE_CAPS" )
						f6_local14 = Colors.white
					else
						f6_local13 = Engine.Localize( "@LUA_MENU_LEVEL_CAPS" )
						f6_local14 = Colors.mp.aar_score_gold
					end
					self:setText( f6_local13 )
					local self = LUI.UIText.new( {
						height = 14,
						width = f6_local0,
						color = f6_local14,
						font = CoD.TextSettings.BodyFont.Font,
						alignment = LUI.Alignment.Center
					} )
					self:setText( f6_arg3 )
					self:addElement( self )
					self:addElement( self )
					self:addElement( self )
					self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
					if f6_arg6 == true then
						self:addElement( LUI.UIImage.new( {
							topAnchor = true,
							top = 5 + (f6_local8 - 14) / 2,
							height = 14,
							width = 14,
							material = RegisterMaterial( "icon_lock_mini" )
						} ) )
					end
					return self
				end
			end
			f6_local13 = 1
		end
	end
	self = 1
end

local f0_local0 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	f7_arg1 = tonumber( f7_arg1 )
	f7_arg2 = tonumber( f7_arg2 )
	if f7_arg1 == nil or f7_arg2 == nil then
		f7_arg1 = 0
		f7_arg2 = 0
	end
	return (f7_arg4 - f7_arg3) / (f7_arg2 - f7_arg1) * (f7_arg0 - f7_arg2) + f7_arg4
end

function buildProgressBar( menu, controller )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		width = controller
	} )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.black,
		alpha = 0.4
	} ) )
	local f8_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f8_local1.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f8_local1 )
	self:setupTiles( 6 )
	self:addElement( self )
	local f8_local3 = 660
	local f8_local4 = 40
	local f8_local5 = (controller - f8_local3) / 2
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		left = f8_local5,
		width = f8_local3 + 1,
		height = f8_local4 + 3
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		alpha = 0.5,
		material = RegisterMaterial( "h1_ui_progressbar_inactivebar" ),
		width = f8_local3 + 1,
		height = f8_local4 + 3
	} )
	self:setup9SliceImage( 20, 20, 0.5, 0.5 )
	self:addElement( self )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		material = RegisterMaterial( "h1_ui_progressbar_activebar" ),
		width = 0,
		height = f8_local4
	} )
	self:setup9SliceImage( 20, 20, 0.5, 0.5 )
	self.maxWidth = f8_local3
	self.startLeft = f8_local5
	self.currXP = menu.xp
	local f8_local9 = Rank.GetRankMinXP( menu.rank )
	local f8_local10 = Rank.GetRankMaxXP( menu.rank )
	self:registerEventHandler( "update_progress", function ( element )
		local f9_local0 = nil
		if element.currXP == tonumber( f8_local9 ) then
			f9_local0 = 0
		else
			local f9_local1 = element.currXP
			local f9_local2 = tonumber( f8_local9 )
			local f9_local3 = tonumber( f8_local10 )
			f9_local0 = f0_local0( math.min( math.max( f9_local1, f9_local2 ), f9_local3 ), f9_local2, f9_local3, 40, element.maxWidth )
		end
		if f9_local0 == 0 then
			element:registerAnimationState( "hide", {
				alpha = 0
			} )
			element:animateToState( "hide", 0 )
		else
			element:registerAnimationState( "update", {
				leftAnchor = true,
				width = f9_local0
			} )
			element:animateToState( "update", 0 )
		end
	end )
	local f8_local11 = CoD.TextSettings.Font14
	local f8_local12 = 12
	local f8_local13 = CoD.CreateState( nil, nil, -f8_local12, 2, CoD.AnchorTypes.BottomRight )
	f8_local13.width = f8_local3 - f8_local12 * 2
	f8_local13.height = f8_local11.Height
	local self = LUI.UIElement.new( f8_local13 )
	self:addElement( self )
	local f8_local15 = Rank.GetRankXPToNext( menu.rank )
	local f8_local16 = self.currXP - f8_local9
	local f8_local17, f8_local18, f8_local19, f8_local20 = GetTextDimensions2( f8_local15 .. " / " .. f8_local15, f8_local11.Font, f8_local11.Height )
	local f8_local21 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
	f8_local21.font = f8_local11.Font
	f8_local21.color = Colors.h1.light_grey
	f8_local21.width = f8_local19 - f8_local17
	f8_local21.height = f8_local11.Height
	local self = LUI.UIText.new( f8_local21 )
	self:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f8_local16, f8_local15 ) )
	self:addElement( self )
	self:processEvent( {
		name = "update_progress"
	} )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	self:addElement( self )
	return self
end

LUI.CombatRecordPreviewWidget.new = function ( f10_arg0 )
	local f10_local0 = Engine.GetPlayerDataMPXP( f10_arg0, CoD.StatsGroup.Ranked, "experience" )
	local f10_local1 = Lobby.GetPlayerPrestigeLevel( f10_arg0 )
	local f10_local2 = Lobby.GetRankForXP( f10_local0, f10_local1 )
	local f10_local3 = {
		xp = f10_local0,
		prestige = f10_local1,
		rank = f10_local2,
		rankDisplay = Rank.GetRankDisplay( f10_local2 ),
		controller = f10_arg0,
		maxRank = Rank.GetMaxRank( f10_local3.prestige ),
		maxExperience = Rank.GetRankMaxXP( f10_local3.maxRank, f10_local3.prestige ),
		experience = f10_local0
	}
	if f10_local3.maxExperience < f10_local3.experience then
		f10_local3.experience = f10_local3.maxExperience
	end
	local self
	if f10_local3.maxExperience < Rank.GetRankMaxXP( f10_local3.rank, f10_local3.prestige ) then
		self = f10_local3.maxExperience
		if not self then
		
		else
			f10_local3.experience2 = self
			self = LUI.UIElement.new( {
				leftAnchor = true,
				topAnchor = true,
				left = OperatorMenuUtil.UpperPreviewLeft,
				top = OperatorMenuUtil.UpperPreviewTop,
				width = OperatorMenuUtil.PreviewElementWidth,
				height = OperatorMenuUtil.PreviewElementHeight
			} )
			self:setClass( LUI.CombatRecordPreviewWidget )
			local f10_local5 = 70
			local f10_local6 = OperatorMenuUtil.PreviewElementHeight - f10_local5 + 10
			local self = LUI.UIElement.new( {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				height = f10_local6
			} )
			local self = LUI.UIImage.new( {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				material = RegisterMaterial( "white" ),
				color = Colors.black,
				alpha = 0.5
			} )
			local f10_local9 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
			f10_local9.material = RegisterMaterial( "h1_ui_dot_pattern" )
			local self = LUI.UIImage.new( f10_local9 )
			self:setupTiles( 6 )
			self:addElement( self )
			self:addElement( self )
			self:addElement( buildLogo( f10_local3, f10_local6 ) )
			self:addElement( buildRankAndTitle( f10_local3 ) )
			self:addElement( buildStatsGrid( f10_local3 ) )
			self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
			local f10_local11 = 90
			local self = LUI.UIHorizontalList.new( {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				height = f10_local5,
				top = f10_local6 + 5,
				spacing = 2
			} )
			local f10_local13, f10_local14, f10_local15, f10_local16, f10_local17, f10_local18 = nil
			local f10_local19 = false
			local f10_local20 = false
			local f10_local21 = Rank.GetMaxRank( f10_local1 )
			if f10_local2 == f10_local21 then
				if f10_local1 < Rank.GetMaxPrestigeLevel() then
					f10_local20 = true
					f10_local13 = f10_local2
					f10_local14 = 0
					f10_local16 = f10_local1 + 1
					f10_local3.rank = f10_local13
					f10_local15 = Rank.GetRankMaxXP( f10_local13 )
					f10_local17 = Rank.GetRankDisplay( f10_local13 )
					f10_local18 = f10_local16
					if f10_local0 < f10_local15 then
						f10_local19 = true
					end
				else
					f10_local13 = f10_local21 - 1
					f10_local14 = f10_local21
					f10_local3.rank = f10_local13
					f10_local16 = f10_local1
					f10_local15 = Rank.GetRankMinXP( f10_local14 )
					f10_local17 = Rank.GetRankDisplay( f10_local13 )
					f10_local18 = Rank.GetRankDisplay( f10_local14 )
				end
			else
				f10_local13 = f10_local2
				f10_local14 = f10_local2 + 1
				f10_local16 = f10_local1
				if f10_local14 == f10_local21 then
					f10_local15 = Rank.GetRankMinXP( f10_local13 )
				else
					f10_local15 = Rank.GetRankMinXP( f10_local14 )
				end
				f10_local17 = Rank.GetRankDisplay( f10_local13 )
				f10_local18 = Rank.GetRankDisplay( f10_local14 )
			end
			local f10_local22 = buildRankLogo( f10_local13, f10_local1, f10_local11, f10_local17, Rank.GetRankMinXP( f10_local13 ) )
			local f10_local23 = buildRankLogo( f10_local14, f10_local16, f10_local11, f10_local18, f10_local15, f10_local20, f10_local19 )
			local f10_local24 = buildProgressBar( f10_local3, OperatorMenuUtil.PreviewElementWidth - f10_local11 * 2 - 4 )
			self:addElement( f10_local22 )
			self:addElement( f10_local24 )
			self:addElement( f10_local23 )
			self:addElement( self )
			self:addElement( self )
			return self
		end
	end
	self = Rank.GetRankMaxXP( f10_local3.rank, f10_local3.prestige )
end

