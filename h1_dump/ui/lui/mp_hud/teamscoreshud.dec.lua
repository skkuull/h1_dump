local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	if GameX.gameModeIsFFA() then
		local f1_local0 = Game.GetPlayerScoreRanking() or 0
		if f1_local0 > 1 then
			local f1_local1 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 1, GameX.GetGameMode() )
			local f1_local2 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, f1_local0, GameX.GetGameMode() )
			if f1_local1 and f1_local2 then
				if f1_local1.score == f1_local2.score then
					return "tied"
				else
					return "losing"
				end
			else
				return "tied"
			end
		end
		local f1_local1 = Game.GetPlayerName()
		local f1_local2 = Game.GetPlayerScore()
		local f1_local3 = Game.GetPlayerTeam()
		local f1_local4 = Game.GetNumPlayersOnTeam( f1_local3 )
		local f1_local5 = false
		for f1_local6 = 1, f1_local4, 1 do
			local f1_local9 = Game.GetPlayerScoreInfoAtRank( f1_local3, f1_local6 )
			if f1_local9 and f1_local9.name ~= f1_local1 then
				f1_local5 = f1_local9.score == f1_local2
				if f1_local5 then
					break
				end
			end
		end
		if f1_local5 then
			return "tied"
		end
		return "winning"
	else
		local f1_local0 = Game.GetPlayerTeam()
		if f1_local0 == Teams.spectator then
			f1_local0 = Game.GetPlayerTeam( Game.GetPlayerstateClientnum() )
		end
		local f1_local1 = GameX.GetPlayerOpposingTeam( f1_local0 )
		local f1_local2 = Game.GetTeamScore( f1_local0 ) or 0
		local f1_local3 = Game.GetTeamScore( f1_local1 ) or 0
		if f1_local3 < f1_local2 then
			return "winning"
		elseif f1_local2 < f1_local3 then
			return "losing"
		elseif f1_local2 == f1_local3 then
			return "tied"
		else
			return nil
		end
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = {
		winning = "@LUA_MP_COMMON_SCORE_WINNING",
		losing = "@LUA_MP_COMMON_SCORE_LOSING",
		tied = "@LUA_MP_COMMON_SCORE_TIED"
	}
	local f2_local1 = f0_local0()
	local f2_local2, f2_local3 = nil
	local f2_local4 = Game.GetPlayerstateClientnum()
	if GameX.gameModeIsFFA() then
		f2_local2 = Game.GetPlayerScore( f2_local4 )
		local f2_local5 = Game.GetPlayerName( f2_local4 )
		local f2_local6 = Game.GetPlayerTeam( f2_local4 )
		local f2_local7 = Game.GetNumPlayersOnTeam( f2_local6 )
		for f2_local8 = 1, f2_local7, 1 do
			local f2_local11 = Game.GetPlayerScoreInfoAtRank( f2_local6, f2_local8 )
			if f2_local11 and f2_local11.name ~= f2_local5 then
				f2_local3 = f2_local11.score
			end
		end
	else
		local f2_local5 = Game.GetPlayerTeam( f2_local4 )
		local f2_local6 = GameX.GetPlayerOpposingTeam()
		f2_local2 = Game.GetTeamScore( f2_local5 ) or 0
		f2_local3 = Game.GetTeamScore( f2_local6 ) or 0
	end
	if not f2_local2 then
		f2_local2 = 0
	end
	if not f2_local3 then
		f2_local3 = 0
	end
	f2_arg0:setText( Engine.Localize( f2_local0[f2_local1], f2_local2, f2_local3 ) )
	if f2_local1 ~= f2_arg0.currentStatus or f2_arg1 == true then
		f2_arg0:animateInSequence( {
			{
				f2_local1,
				0
			},
			{
				f2_local1,
				1000
			},
			{
				"hidden",
				500
			}
		} )
		f2_arg0.currentStatus = f2_local1
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f0_local0()
	if f3_local0 ~= f3_arg0.currentStatus then
		f3_arg0.friendlyScore:animateToState( f3_local0 )
		f3_arg0.currentStatus = f3_local0
	end
	if f3_arg0.matchStatus and Game.GetOmnvar( "ui_session_state" ) ~= "spectator" then
		local f3_local1 = f0_local1
		local f3_local2 = f3_arg0.matchStatus
		local f3_local3
		if f3_arg1 == nil or f3_arg1.forced ~= true then
			f3_local3 = false
		else
			f3_local3 = true
		end
		f3_local1( f3_local2, f3_local3 )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.newValue
	if f4_arg0.friendlyBar then
		local f4_local1 = 2 + f4_local0 / f4_arg0.scoreLimit * (f4_arg0.barWidth - 6)
		f4_arg0.friendlyBar:registerAnimationState( "default", CoD.CreateState( 1, 1, f4_local1, -1, CoD.AnchorTypes.TopBottomLeft ) )
		f4_arg0.friendlyBar:animateToState( "default", 0 )
		local f4_local2 = CoD.CreateState( -2 + f4_local1, nil, nil, 2, CoD.AnchorTypes.BottomLeft )
		f4_local2.width = 2
		f4_local2.height = 2
		f4_arg0.friendlyBar.triangle:registerAnimationState( "move", f4_local2 )
		f4_arg0.friendlyBar.triangle:animateToState( "move", 0 )
	end
	f0_local2( f4_arg0, f4_arg1 )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.newValue
	if f5_arg0.enemyBar then
		local f5_local1 = 2 + f5_local0 / f5_arg0.scoreLimit * (f5_arg0.barWidth - 6)
		f5_arg0.enemyBar:registerAnimationState( "default", CoD.CreateState( 1, 1, f5_local1, -1, CoD.AnchorTypes.TopBottomLeft ) )
		f5_arg0.enemyBar:animateToState( "default", 0 )
		local f5_local2 = CoD.CreateState( -2 + f5_local1, nil, nil, 2, CoD.AnchorTypes.BottomLeft )
		f5_local2.width = 2
		f5_local2.height = 2
		f5_arg0.enemyBar.triangle:registerAnimationState( "move", f5_local2 )
		f5_arg0.enemyBar.triangle:animateToState( "move", 0 )
	end
	f0_local2( f5_arg0, f5_arg1 )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	f6_arg0.cycle = f6_arg0.cycle or 0
	local f6_local0 = {}
	table.insert( f6_local0, GetGameModeName() )
	local f6_local1 = true
	if Game.GetPlayerTeam() == Teams.spectator and GameX.gameModeIsFFA() then
		f6_local1 = false
	end
	local f6_local2 = false
	local f6_local3 = Engine.GetDvarString( "ui_gametype" )
	if f6_local1 then
		local f6_local4 = nil
		local f6_local5 = false
		if f6_local3 ~= nil then
			f6_local2 = IsGameTypeRoundBased( f6_local3 )
			f6_local5 = 0 < Engine.GetDvarInt( "ui_scorelimit" )
		end
		local f6_local6 = {
			winning = "@LUA_MP_COMMON_WINNING_CAPS",
			losing = "@LUA_MP_COMMON_LOSING_CAPS",
			tied = "@LUA_MP_COMMON_TIED_CAPS"
		}
		table.insert( f6_local0, Engine.Localize( f6_local6[f0_local0()] ) )
	end
	if f6_local2 then
		local f6_local4 = Game.GetOmnvar( "ui_current_round" )
		local f6_local6 = Engine.GetDvarInt( "scr_" .. f6_local3 .. "_halftime" ) == 1
		local f6_local7 = nil
		if f6_local6 or f6_local3 == "dd" then
			local f6_local8 = 2
			if f6_local8 < f6_local4 then
				f6_local7 = Engine.Localize( "@LUA_MP_COMMON_OVERTIME" )
			else
				f6_local7 = Engine.Localize( "@LUA_MP_COMMON_ROUND_NUM_OF_NUM", f6_local4, f6_local8 )
			end
		else
			f6_local7 = Engine.Localize( "@LUA_MP_COMMON_ROUND_NUM", f6_local4 )
		end
		table.insert( f6_local0, f6_local7 )
	end
	f6_arg0.cycle = (f6_arg0.cycle + 1) % #f6_local0
	f6_arg0:setText( f6_local0[f6_arg0.cycle + 1] )
end

local f0_local6 = function ( f7_arg0 )
	local f7_local0 = nil
	local f7_local1 = Game.GetOmnvar( "ui_team_selected" )
	if f7_local1 == 1 then
		f7_local0 = Engine.GetDvarString( "g_TeamIcon_Axis" )
	elseif f7_local1 == 2 then
		f7_local0 = Engine.GetDvarString( "g_TeamIcon_Allies" )
	end
	if f7_local0 ~= nil then
		f7_arg0:Update( f7_local0 )
	end
end

LUI.MenuBuilder.registerType( "teamScoresHudDef", function ()
	local f8_local0 = 1
	local f8_local1 = CoD.TextSettings.TitleFontBold
	local f8_local2 = 40
	local f8_local3 = 0
	local f8_local4 = 10
	local f8_local5 = GameX.IsSplitscreen()
	local f8_local6 = 65
	local f8_local7 = 342
	local f8_local8 = 85
	local f8_local9 = f8_local7 + f8_local6
	local f8_local10 = 63
	local f8_local11 = 63
	local f8_local12 = 60
	local f8_local13 = 60
	local f8_local14 = 157
	local f8_local15 = f8_local11
	local f8_local16 = 80
	local f8_local17 = 75
	local f8_local18 = 15
	local f8_local19
	if GameX.IsRankedMatch() and not f8_local5 then
		f8_local19 = -30
		if not f8_local19 then
		
		else
			local self = LUI.UIElement.new( {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				bottom = f8_local19
			} )
			self.id = "teamScores_root"
			local self = LUI.UIElement.new( {
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				bottom = 0,
				left = 0,
				height = f8_local8,
				width = f8_local9
			} )
			self.id = "teamScores_lowerright"
			self:addElement( self )
			local f8_local22 = CoD.CreateState( f8_local9, nil, nil, 0, CoD.AnchorTypes.BottomLeft )
			f8_local22.width = -f8_local7
			f8_local22.height = f8_local8
			f8_local22.alpha = 1
			local self = LUI.UIElement.new( f8_local22 )
			self:addElement( self )
			local self = LUI.UIElement.new( {
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				bottom = 0,
				left = f8_local6,
				width = f8_local14,
				height = f8_local15,
				alpha = 1
			} )
			self.id = "teamScores_id"
			self:addElement( self )
			local f8_local25 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
			f8_local25.material = RegisterMaterial( "h1_hud_weapwidget_blur" )
			self:addElement( LUI.UIImage.new( f8_local25 ) )
			local f8_local26 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
			f8_local26.material = RegisterMaterial( "h1_hud_weapwidget_border" )
			f8_local26.color = CoD.HudStandards.overlayTint
			self:addElement( LUI.UIImage.new( f8_local26 ) )
			local f8_local27 = CoD.CreateState( -140, nil, nil, -1, CoD.AnchorTypes.BottomLeft )
			f8_local27.material = RegisterMaterial( "h1_ui_hud_deco_angledbar_anchor" )
			f8_local27.height = 8
			f8_local27.width = 8
			self:addElement( LUI.UIImage.new( f8_local27 ) )
			local f8_local28 = Engine.GetDvarString( "ui_gametype" )
			local f8_local29, f8_local30 = false
			if f8_local28 ~= nil then
				f8_local30 = Engine.GetDvarInt( "ui_scorelimit" )
				f8_local29 = f8_local30 > 0
			end
			local self, self = nil
			if f8_local29 then
				local f8_local33 = CoD.CreateState( f8_local17, 14, nil, 24, CoD.AnchorTypes.TopLeft )
				f8_local33.color = Colors.black
				f8_local33.width = f8_local16
				local self = LUI.DecoFrame.new( f8_local33, LUI.DecoFrame.Grey )
				self:addElement( self )
				local f8_local35 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
				f8_local35.material = RegisterMaterial( "white" )
				f8_local35.color = Colors.grey_2
				f8_local35.alpha = 0.5
				local self = LUI.UIImage.new( f8_local35 )
				self.id = "friendlyBarBg_id"
				self:addElement( self )
				local self = CoD.CreateState( nil, 1, -1, -1, CoD.AnchorTypes.TopBottomRight )
				self.material = RegisterMaterial( "white" )
				self.color = Colors.h1.ally_blue
				self.width = 2
				self.alpha = 0.5
				local self = LUI.UIImage.new( self )
				self.id = "friendlyEndCap_id"
				self:addElement( self )
				local self = CoD.CreateState( 0, 0, 1, 0, CoD.AnchorTypes.TopBottomLeft )
				self.material = RegisterMaterial( "white" )
				self.color = Colors.white
				self = LUI.UIImage.new( self )
				self.id = "friendlyBar_id"
				self:addElement( self )
				local self = CoD.CreateState( -10, -7, 7, 7, CoD.AnchorTypes.All )
				self.material = RegisterMaterial( "h1_hud_team_score_glow" )
				self.color = Colors.h1.ally_blue
				local self = LUI.UIImage.new( self )
				self.id = "friendlyGlow_id"
				self:addElement( self )
				local f8_local42 = CoD.CreateState( -2, nil, nil, 2, CoD.AnchorTypes.BottomLeft )
				f8_local42.width = 2
				f8_local42.height = 2
				f8_local42.material = RegisterMaterial( "h1_deco_corner" )
				local triangle = LUI.UIImage.new( f8_local42 )
				self:addElement( triangle )
				self.triangle = triangle
				
				local f8_local44 = CoD.CreateState( f8_local17, -20, nil, -10, CoD.AnchorTypes.BottomLeft )
				f8_local44.color = Colors.black
				f8_local44.width = f8_local16
				local f8_local45 = LUI.DecoFrame.new( f8_local44, LUI.DecoFrame.Grey )
				self:addElement( f8_local45 )
				local f8_local46 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
				f8_local46.material = RegisterMaterial( "white" )
				f8_local46.color = Colors.grey_2
				f8_local46.alpha = 0.5
				local self = LUI.UIImage.new( f8_local46 )
				self.id = "enemyBarBg_id"
				f8_local45:addElement( self )
				local f8_local48 = CoD.CreateState( nil, 1, -1, -1, CoD.AnchorTypes.TopBottomRight )
				f8_local48.material = RegisterMaterial( "white" )
				f8_local48.color = Colors.h1.enemy_red
				f8_local48.width = 2
				f8_local48.alpha = 0.5
				local self = LUI.UIImage.new( f8_local48 )
				self.id = "enemyEndCap_id"
				f8_local45:addElement( self )
				local f8_local50 = CoD.CreateState( 0, 0, 1, 0, CoD.AnchorTypes.TopBottomLeft )
				f8_local50.material = RegisterMaterial( "white" )
				f8_local50.color = Colors.grey_5
				self = LUI.UIImage.new( f8_local50 )
				self.id = "enemyBar_id"
				f8_local45:addElement( self )
				local f8_local51 = CoD.CreateState( -2, nil, nil, 2, CoD.AnchorTypes.BottomLeft )
				f8_local51.width = 2
				f8_local51.height = 2
				f8_local51.material = RegisterMaterial( "h1_deco_corner" )
				local self = LUI.UIImage.new( f8_local51 )
				f8_local45:addElement( self )
				self.triangle = self
			end
			local f8_local33 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5 )
				local f9_local0 = CoD.CreateState( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				f9_local0.material = RegisterMaterial( "white" )
				f9_local0.color = f9_arg5
				f9_local0.width = 2
				f9_local0.alpha = 0.5
				return LUI.UIImage.new( f9_local0 )
			end
			
			self:addElement( f8_local33( 5, 14, nil, 24, CoD.AnchorTypes.TopLeft, Colors.h1.ally_blue ) )
			local self = LUI.UIText.new( {
				font = CoD.TextSettings.SP_HudAmmoCounterFont.Font,
				alignment = LUI.Alignment.Left,
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				left = 9,
				right = 0,
				height = CoD.TextSettings.SP_HudAmmoCounterFont.Height,
				textstyle = CoD.TextStyle.Shadowed
			} )
			self.id = "friendlyScore_id"
			self:addElement( self )
			local f8_local35 = CoD.CreateState( 5, nil, nil, -26, CoD.AnchorTypes.BottomLeft )
			f8_local35.width = f8_local14 - 6
			f8_local35.color = Colors.black
			local self = LUI.Divider.new( f8_local35, 5, 2 )
			self.id = "score_divider"
			self:addElement( self )
			self:addElement( f8_local33( 5, -20, nil, -10, CoD.AnchorTypes.BottomLeft, Colors.h1.enemy_red ) )
			local self = LUI.UIText.new( {
				font = CoD.TextSettings.SP_HudAmmoCounterFont.Font,
				alignment = LUI.Alignment.Left,
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				bottom = -3,
				left = 9,
				right = 0,
				height = CoD.TextSettings.TitleFontSmallBold.Height,
				color = Swatches.HUD.ScoreEnemy,
				alpha = 0.5,
				textstyle = CoD.TextStyle.Shadowed
			} )
			self.id = "enemyScore_id"
			self:addElement( self )
			local self = LUI.UIElement.new()
			self:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = true,
				top = 0,
				right = f8_local7,
				height = f8_local18,
				width = f8_local7
			} )
			self:animateToState( "default" )
			self.id = "roundStatusArea"
			self:addElement( self )
			local self = LUI.UIText.new( {
				alignment = LUI.Alignment.Left,
				font = CoD.TextSettings.TitleFontSmallBold.Font,
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				height = f8_local18,
				left = 4,
				right = 0,
				textstyle = CoD.TextStyle.Shadowed
			} )
			self.id = "roundStatus_id"
			self:setTextStyle( CoD.TextStyle.ForceUpperCase )
			self:registerOmnvarHandler( "ui_current_round", f0_local5 )
			self:registerEventHandler( "update_round_status", f0_local5 )
			local self = LUI.UITimer.new( 4000, "update_round_status" )
			self.id = "update_round_status"
			self:addElement( self )
			self:addElement( self )
			local self = LUI.MenuBuilder.buildItems( {
				type = "timersHudDef"
			}, {} )
			self:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				left = 0,
				width = f8_local13,
				height = f8_local18
			} )
			self:animateToState( "default" )
			self:addElement( self )
			local f8_local42 = CoD.CreateState( 0, nil, nil, 0, CoD.AnchorTypes.BottomLeft )
			f8_local42.width = f8_local13
			f8_local42.height = f8_local12
			f8_local42.alpha = 1
			local triangle = LUI.UIElement.new( f8_local42 )
			self:addElement( triangle )
			local f8_local44 = CoD.CreateState( 0, nil, nil, 0, CoD.AnchorTypes.BottomLeft )
			f8_local44.material = RegisterMaterial( "h1_hud_box_blur" )
			f8_local44.width = f8_local13
			f8_local44.height = f8_local12
			triangle:addElement( LUI.UIImage.new( f8_local44 ) )
			local f8_local46 = CoD.CreateState( 0, nil, nil, 0, CoD.AnchorTypes.BottomLeft )
			f8_local46.material = RegisterMaterial( "h1_ui_hud_backing_faction_border" )
			f8_local46.width = f8_local13 + 17
			f8_local46.height = f8_local12 + 25
			f8_local46.color = CoD.HudStandards.overlayTint
			triangle:addElement( LUI.UIImage.new( f8_local46 ) )
			local f8_local48 = CoD.CreateState( nil, 10, nil, nil, CoD.AnchorTypes.Top )
			f8_local48.width = f8_local13 - 5
			f8_local48.color = Colors.black
			triangle:addElement( LUI.Divider.new( f8_local48, 5, 2 ) )
			local f8_local50 = CoD.CreateState( nil, nil, nil, -5, CoD.AnchorTypes.Bottom )
			f8_local50.width = f8_local13 - 5
			f8_local50.color = Colors.black
			triangle:addElement( LUI.Divider.new( f8_local50, 5, 2 ) )
			local f8_local53 = LUI.FactionIcon.new( {
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				bottom = -1,
				left = -1,
				height = f8_local11,
				width = f8_local10
			}, {
				disableDividers = true
			} )
			f8_local53.id = "logo"
			triangle:addElement( f8_local53 )
			f0_local6( f8_local53 )
			f8_local53:registerEventHandler( "playerstate_client_changed", function ( element, event )
				f0_local6( f8_local53 )
			end )
			f8_local53:registerOmnvarHandler( "ui_team_selected", function ( f11_arg0, f11_arg1 )
				f0_local6( f8_local53 )
			end )
			local self = nil
			if not f8_local5 then
				self = LUI.UIText.new( {
					alignment = LUI.Alignment.Center,
					font = CoD.TextSettings.TitleFontSmallBold.Font,
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true,
					top = 2,
					height = f8_local18,
					left = 0,
					right = 0,
					textstyle = CoD.TextStyle.Shadowed
				} )
				self:setTextStyle( CoD.TextStyle.ForceUpperCase )
				self:registerAnimationState( "losing", {
					color = Swatches.HUD.ScoreLosing,
					glow = LUI.GlowState.None,
					alpha = 1
				} )
				self:registerAnimationState( "tied", {
					color = Swatches.HUD.ScoreTied,
					glow = LUI.GlowState.None,
					alpha = 1
				} )
				self:registerAnimationState( "winning", {
					color = Swatches.HUD.ScoreWinning,
					glow = LUI.GlowState.LightGreen,
					alpha = 1
				} )
				self:registerAnimationState( "hidden", {
					alpha = 0
				} )
				self.id = "matchStatus_id"
				self:addElement( self )
			end
			self:setupUIBindText( "TeamScoreFriendly" )
			self:setupUIBindText( "TeamScoreEnemy" )
			local self = LUI.UIElement.new()
			self.id = "scoreWatchFriendly"
			self.matchStatus = self
			self.friendlyScore = self
			self.friendlyBar = self
			self.barWidth = f8_local16
			self.scoreLimit = f8_local30
			self:setupUIIntWatch( "TeamScoreFriendly" )
			self:registerEventHandler( "int_watch_alert", f0_local3 )
			self:registerOmnvarHandler( "ui_match_countdown_toggle", function ( f12_arg0, f12_arg1 )
				if f12_arg1.value == false then
					local self = LUI.UITimer.new( 3000, "delay_complete", nil, true )
					f12_arg0:registerEventHandler( "delay_complete", function ()
						f0_local2( f12_arg0, {
							forced = true
						} )
					end )
					f12_arg0:addElement( self )
				end
			end )
			self:addElement( self )
			local self = LUI.UIElement.new()
			self.id = "scoreWatchEnemy"
			self.matchStatus = self
			self.friendlyScore = self
			self.barWidth = f8_local16
			self.enemyBar = self
			self.scoreLimit = f8_local30
			self:setupUIIntWatch( "TeamScoreEnemy" )
			self:registerEventHandler( "int_watch_alert", f0_local4 )
			self:addElement( self )
			return self
		end
	end
	f8_local19 = 0
end )
LockTable( _M )
