local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function IsPostGame()
	return Engine.GetDvarString( "ui_game_state" ) == "postgame"
end

function GetTeamAndRank( f2_arg0 )
	assert( f2_arg0 and f2_arg0 >= 0 )
	local f2_local0 = nil
	local f2_local1 = GameX.GetGameMode()
	local f2_local2 = nil
	local f2_local3 = Game.GetPlayerTeam( f2_arg0 )
	local f2_local4 = Game.GetNumPlayersOnTeam( f2_local3 )
	for f2_local5 = 1, f2_local4, 1 do
		f2_local0 = GameX.GetPlayerScoreInfoAtRankForGameMode( f2_local3, f2_local5, f2_local1 )
		if f2_local0.client == f2_arg0 then
			f2_local2 = f2_local5
		end
	end
	return f2_local3, f2_local2
end

function CycleClientNums( f3_arg0, f3_arg1 )
	assert( f3_arg0 and f3_arg0 >= 0 )
	assert( math.abs( f3_arg1 ) == 1 )
	local f3_local0 = nil
	local f3_local1 = GameX.GetGameMode()
	local f3_local2, f3_local3 = GetTeamAndRank( f3_arg0 )
	assert( f3_local2 )
	assert( f3_local3 )
	repeat
		f3_local2, f3_local3 = SanitizeTeamAndRank( f3_local2, f3_local3 + f3_arg1 )
		f3_local0 = GameX.GetPlayerScoreInfoAtRankForGameMode( f3_local2, f3_local3, f3_local1 )
		if not f3_local0.isDead then
			
		else
			
		end
		return f3_local0.client
	until f3_local0.client == f3_arg0
end

Views = {
	FirstPerson = 1,
	ThirdPerson = 2,
	Free = 3,
	Max = 3
}
MLG.Views = Views
currentView = Views.Free
MLG.GetCurrentView = function ()
	return currentView
end

MLG.StartFollow = function ()
	if knownState.userPreferences.clientNum and knownState.userPreferences.clientNum >= 0 then
		MLG.FollowClientnum( knownState.userPreferences.clientNum )
	else
		MLG.FollowNext()
		MLG.FollowPrev()
	end
end

function ChangeView( f6_arg0, f6_arg1 )
	assert( f6_arg0.mlgHUD )
	local f6_local0 = currentView
	if f6_arg1 then
		currentView = f6_arg1
	else
		if mapZoomMode == MapZoomModes.FullScreen then
			return 
		end
		currentView = 1 + currentView % Views.Max
	end
	knownState.userPreferences.view = currentView
	if currentView == Views.FirstPerson then
		MLG.SetThirdPerson( false )
	elseif currentView == Views.ThirdPerson then
		MLG.SetThirdPerson( true )
	elseif currentView == Views.Free then
		MLG.StopFollow()
		if f6_local0 ~= currentView then
			Engine.NotifyServer( "mlg_view_change", currentView )
		end
	end
	if f6_local0 == Views.Free and currentView ~= Views.Free then
		MLG.StartFollow()
	end
	if currentView == Views.Free then
		f6_arg0:dispatchEventToRoot( {
			name = "cod_caster_view_free",
			immediate = true
		} )
	else
		f6_arg0:dispatchEventToRoot( {
			name = "cod_caster_view_player",
			immediate = true
		} )
	end
	f6_arg0.mlgHUD:processEvent( {
		name = "view_change"
	} )
	f6_arg0.mlgHUD.hudContainer.hud:processEvent( {
		name = "view_change"
	} )
	f6_arg0.mlgHUD:processEvent( {
		name = "update_mlg_hud_visibility"
	} )
end

function FollowPrev( f7_arg0, f7_arg1 )
	if mapZoomMode == MapZoomModes.FullScreen then
		return 
	end
	local f7_local0 = MLG.GetFollowedClientNum()
	if f7_local0 then
		local f7_local1 = CycleClientNums( f7_local0, -1 )
		if f7_local1 then
			MLG.FollowClientnum( f7_local1 )
		else
			MLG.FollowPrev()
		end
	else
		MLG.FollowPrev()
	end
	if currentView == Views.Free then
		ChangeView( f7_arg0, Views.FirstPerson )
	end
end

function FollowNext( f8_arg0, f8_arg1 )
	if mapZoomMode == MapZoomModes.FullScreen then
		return 
	end
	local f8_local0 = MLG.GetFollowedClientNum()
	if f8_local0 then
		local f8_local1 = CycleClientNums( f8_local0, 1 )
		if f8_local1 then
			MLG.FollowClientnum( f8_local1 )
		else
			MLG.FollowNext()
		end
	else
		MLG.FollowNext()
	end
	if currentView == Views.Free then
		ChangeView( f8_arg0, Views.FirstPerson )
	end
end

function FollowSelectedPlayer( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0.mlgHUD.currentPlayerFocus
	if focusMode ~= FocusModes.Scoreboard or not f9_local0 then
		return 
	end
	local f9_local1 = GameX.GetPlayerScoreInfoAtRankForGameMode( f9_local0.team, f9_local0.rank, GameX.GetGameMode() )
	MLG.FollowClientnum( f9_local1.client )
	if currentView == Views.Free then
		ChangeView( f9_arg0, Views.FirstPerson )
	end
end

ScoreModes = {
	None = 1,
	Small = 2,
	Large = 3
}
scoreMode = ScoreModes.Small
function ToggleSmallScoreboard( f10_arg0 )
	if scoreMode == ScoreModes.Small then
		SetScoreMode( f10_arg0, ScoreModes.None )
	else
		SetScoreMode( f10_arg0, ScoreModes.Small )
	end
end

function ToggleLargeScoreboard( f11_arg0 )
	if scoreMode == ScoreModes.Large then
		SetScoreMode( f11_arg0, ScoreModes.None )
	else
		SetScoreMode( f11_arg0, ScoreModes.Large )
	end
end

function SetScoreMode( f12_arg0, f12_arg1 )
	assert( f12_arg0.mlgHUD )
	assert( f12_arg0.mlgHUD.hudContainer )
	assert( f12_arg0.mlgHUD.hudContainer.hud )
	scoreMode = f12_arg1
	if f12_arg1 == ScoreModes.Large then
		f12_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "close_scoreboard",
			immediate = true
		} )
		f12_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "open_scoreboard",
			showLargeScoreboard = true
		} )
		SetFocusMode( f12_arg0, FocusModes.None )
	elseif f12_arg1 == ScoreModes.Small then
		f12_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "close_scoreboard",
			immediate = true
		} )
		f12_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "open_scoreboard"
		} )
		SetFocusMode( f12_arg0, FocusModes.Scoreboard )
	else
		f12_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "close_scoreboard"
		} )
		SetFocusMode( f12_arg0, FocusModes.None )
	end
	knownState.userPreferences.scoreMode = scoreMode
	f12_arg0.mlgHUD:processEvent( {
		name = "update_mlg_hud_visibility"
	} )
end

function MoveScoreboardCursor( f13_arg0, f13_arg1 )
	if not f13_arg0.mlgHUD.currentPlayerFocus then
		SetFocusMode( f13_arg0, FocusModes.Scoreboard )
	end
	local f13_local0 = f13_arg0.mlgHUD.currentPlayerFocus
	if f13_local0 then
		f13_local0.rank = f13_local0.rank + f13_arg1
		f13_local0.team, f13_local0.rank = SanitizeTeamAndRank( f13_local0.team, f13_local0.rank )
		f13_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "hilite_scoreboard_row",
			team = f13_local0.team,
			rank = f13_local0.rank
		} )
		local f13_local1 = GameX.GetPlayerScoreInfoAtRankForGameMode( f13_local0.team, f13_local0.rank, GameX.GetGameMode() )
		MLG.HighlightClientNum( f13_local1.client )
	end
end

function AddGameModeInfoCTF( f14_arg0 )
	local f14_local0 = CoD.TextSettings.TitleFontTinyBold
	local f14_local1 = function ( f15_arg0, f15_arg1 )
		local f15_local0 = ""
		if f15_arg1 > 0 then
			local f15_local1 = Game.GetPlayerScoreInfo( f15_arg1 )
			if f15_local1 then
				f15_local0 = f15_local0 .. " " .. f15_local1.name
			end
		end
		f15_arg0:setText( f15_local0 )
	end
	
	local f14_local2 = function ( f16_arg0, f16_arg1 )
		local f16_local0 = function ( f17_arg0, f17_arg1 )
			local f17_local0 = ""
			local f17_local1 = ""
			if f17_arg1 == 0 then
				f17_local1 = "waypoint_esports_ctf_flag"
			elseif f17_arg1 < 0 then
				f17_local1 = "waypoint_esports_ctf_dropped"
			else
				f17_local1 = "waypoint_esports_ctf_taken"
			end
			if f16_arg1 then
				f17_local1 = f17_local1 .. "_red"
			else
				f17_local1 = f17_local1 .. "_blue"
			end
			if f17_arg0.current ~= f17_local1 then
				f17_arg0:setImage( RegisterMaterial( f17_local1 ) )
				f17_arg0.current = f17_local1
			end
		end
		
		local self = LUI.UIElement.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0
		} )
		self.id = "flagInfo_" .. f16_arg0
		local f16_local2, f16_local3 = nil
		if f16_arg1 then
			f16_local2 = -40
			f16_local3 = 0
		else
			f16_local2 = 0
			f16_local3 = 40
		end
		local f16_local4 = LUI.UIImage.new
		local self = {}
		local f16_local6
		if f16_arg1 then
			f16_local6 = RegisterMaterial( "waypoint_esports_ctf_flag_red" )
			if not f16_local6 then
			
			else
				self.material = f16_local6
				self.topAnchor = false
				self.bottomAnchor = false
				self.leftAnchor = not f16_arg1
				self.rightAnchor = f16_arg1
				self.top = -20
				self.bottom = 20
				self.left = f16_local2
				self.right = f16_local3
				f16_local4 = f16_local4( self )
				f16_local4.id = "flagIcon"
				f16_local4:registerOmnvarHandler( f16_arg0, function ( f18_arg0, f18_arg1 )
					f16_local0( f18_arg0, f18_arg1.value )
				end )
				self = LUI.UICountdown.new()
				self.id = "flagTimer"
				local f16_local7 = self
				f16_local6 = self.registerAnimationState
				local f16_local8 = "default"
				local f16_local9 = {}
				local f16_local10
				if f16_arg1 then
					f16_local10 = LUI.HorizontalAlignment.Right
					if not f16_local10 then
					
					else
						f16_local9.alignment = f16_local10
						f16_local9.font = f14_local0.Font
						f16_local9.topAnchor = false
						f16_local9.bottomAnchor = false
						f16_local9.leftAnchor = true
						f16_local9.rightAnchor = true
						f16_local9.top = -1 - f14_local0.Height / 2
						f16_local9.height = f14_local0.Height
						f16_local9.left = 45
						f16_local9.right = -45
						f16_local9.color = Colors.primary_text_color
						f16_local9.alpha = 0
						f16_local6( f16_local7, f16_local8, f16_local9 )
						self:registerAnimationState( "hidden", {
							alpha = 0
						} )
						self:registerAnimationState( "visible", {
							alpha = 1
						} )
						self:animateToState( "default" )
						self:registerOmnvarHandler( f16_arg0, function ( f19_arg0, f19_arg1 )
							local f19_local0 = Game.GetOmnvar( f16_arg0 )
							if f19_local0 < 0 then
								f19_arg0:setEndTime( Game.GetTime() - f19_local0 * 1000 )
								f19_arg0:animateToState( "visible", 0 )
							else
								f19_arg0:setEndTime( 0 )
								f19_arg0:animateToState( "hidden", 0 )
							end
						end )
						f16_local7 = LUI.UIText.new
						f16_local8 = {
							font = f14_local0.Font
						}
						if f16_arg1 then
							f16_local9 = LUI.HorizontalAlignment.Right
							if not f16_local9 then
							
							else
								f16_local8.alignment = f16_local9
								f16_local8.topAnchor = false
								f16_local8.bottomAnchor = false
								f16_local8.leftAnchor = true
								f16_local8.rightAnchor = true
								f16_local8.top = -1 - f14_local0.Height / 2
								f16_local8.height = f14_local0.Height
								f16_local8.left = 45
								f16_local8.right = -45
								f16_local7 = f16_local7( f16_local8 )
								f16_local7.id = "flagStatus"
								f16_local7:registerOmnvarHandler( f16_arg0, function ( f20_arg0, f20_arg1 )
									f14_local1( f20_arg0, f20_arg1.value )
								end )
								f14_local1( f16_local7, Game.GetOmnvar( f16_arg0 ) )
								f16_local0( f16_local4, Game.GetOmnvar( f16_arg0 ) )
								self:addElement( f16_local4 )
								self:addElement( self )
								self:addElement( f16_local7 )
								return self
							end
						end
						f16_local9 = LUI.HorizontalAlignment.Left
					end
				end
				f16_local10 = LUI.HorizontalAlignment.Left
			end
		end
		f16_local6 = RegisterMaterial( "waypoint_esports_ctf_flag_blue" )
	end
	
	local f14_local3 = f14_local2( "ui_mlg_game_mode_status_1", false )
	local f14_local4 = f14_local2( "ui_mlg_game_mode_status_2", true )
	f14_arg0:addElement( f14_local3 )
	f14_arg0:addElement( f14_local4 )
end

function AddGameModeInfoDOM( f21_arg0 )
	local f21_local0 = function ( f22_arg0 )
		local self = LUI.UIText.new( {
			alignment = LUI.Alignment.Left,
			font = CoD.TextSettings.SmallFont.Font,
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			top = 0,
			right = 20,
			height = CoD.TextSettings.SmallFont.Height
		} )
		self.id = "domPoint_" .. f22_arg0
		self:setText( f22_arg0 )
		return self
	end
	
	local f21_local1 = function ( menu, controller )
		local self = LUI.UIHorizontalList.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			alignment = controller
		} )
		self.id = "domPoints_" .. menu
		local f23_local1 = function ( f24_arg0 )
			f24_arg0:closeChildren()
			if menu == Game.GetOmnvar( "ui_mlg_game_mode_status_1" ) then
				f24_arg0:addElement( f21_local0( "A" ) )
			end
			if menu == Game.GetOmnvar( "ui_mlg_game_mode_status_2" ) then
				f24_arg0:addElement( f21_local0( "B" ) )
			end
			if menu == Game.GetOmnvar( "ui_mlg_game_mode_status_3" ) then
				f24_arg0:addElement( f21_local0( "C" ) )
			end
		end
		
		f23_local1( self )
		self:registerOmnvarHandler( "ui_mlg_game_mode_status_1", f23_local1 )
		self:registerOmnvarHandler( "ui_mlg_game_mode_status_2", f23_local1 )
		self:registerOmnvarHandler( "ui_mlg_game_mode_status_3", f23_local1 )
		return self
	end
	
	f21_arg0:addElement( f21_local1( -1, LUI.HorizontalAlignment.Left ) )
	f21_arg0:addElement( f21_local1( 0, LUI.HorizontalAlignment.Center ) )
	f21_arg0:addElement( f21_local1( 1, LUI.HorizontalAlignment.Right ) )
end

function AddGameModeInfoHP( f25_arg0 )
	local f25_local0 = CoD.TextSettings.TitleFontTinyBold
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 5,
		right = -5
	} )
	self.id = "hp_info"
	f25_arg0:addElement( self )
	local f25_local2 = function ( f26_arg0, f26_arg1 )
		local f26_local0 = Game.GetOmnvar( "ui_mlg_game_mode_status_1" )
		local f26_local1 = Game.GetOmnvar( "ui_mlg_game_mode_status_2" )
		if f26_local0 == 0 then
			if f26_local1 == 0 then
				f26_arg0:animateToState( "default" )
			else
				f26_arg0:animateToState( "atlas" )
			end
		elseif f26_local1 == 0 then
			f26_arg0:animateToState( "sentinel" )
		else
			f26_arg0:animateToState( "contested" )
		end
	end
	
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "waypoint_esports_hardpoint_white" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		bottom = 20,
		left = -20,
		right = 20
	} )
	self:registerAnimationState( "sentinel", {
		material = RegisterMaterial( "waypoint_esports_hardpoint_blue" )
	} )
	self:registerAnimationState( "atlas", {
		material = RegisterMaterial( "waypoint_esports_hardpoint_red" )
	} )
	self:registerAnimationState( "contested", {
		material = RegisterMaterial( "waypoint_contested" )
	} )
	self:registerOmnvarHandler( "ui_mlg_game_mode_status_1", f25_local2 )
	self:registerOmnvarHandler( "ui_mlg_game_mode_status_2", f25_local2 )
	self.id = "icon"
	self:addElement( self )
	local f25_local4 = function ( f27_arg0, f27_arg1 )
		if f27_arg1.value == 0 then
			f27_arg0:setText( "" )
		elseif f27_arg1.value == 1 then
			f27_arg0:setText( Engine.Localize( "ESPORTS_HARDPOINT_1_PLAYER" ) )
		else
			f27_arg0:setText( Engine.Localize( "ESPORTS_HARDPOINT_N_PLAYERS", f27_arg1.value ) )
		end
	end
	
	local self = LUI.UIText.new( {
		font = f25_local0.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = -f25_local0.Height / 2 - 2,
		right = 0,
		height = f25_local0.Height
	} )
	self.id = "numSentinelText"
	self:registerOmnvarHandler( "ui_mlg_game_mode_status_1", f25_local4 )
	f25_local4( self, {
		value = Game.GetOmnvar( "ui_mlg_game_mode_status_1" )
	} )
	self:addElement( self )
	local self = LUI.UIText.new( {
		font = f25_local0.Font,
		alignment = LUI.Alignment.Right,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = -f25_local0.Height / 2 - 2,
		right = 0,
		height = f25_local0.Height
	} )
	self.id = "numAtlasText"
	self:registerOmnvarHandler( "ui_mlg_game_mode_status_2", f25_local4 )
	f25_local4( self, {
		value = Game.GetOmnvar( "ui_mlg_game_mode_status_2" )
	} )
	self:addElement( self )
end

function BuildGameModeSubTitleElementHP()
	local self = LUI.UICountdown.new( {} )
	self:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontTinyBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = 71,
		right = 0,
		height = CoD.TextSettings.TitleFontTiny.Height,
		color = Colors.white,
		alpha = 0.75
	} )
	self.m_decimals = false
	self:animateToState( "default", 0 )
	self.id = "countdown"
	local f28_local1 = function ( f29_arg0, f29_arg1 )
		f29_arg0:setEndTime( Game.GetOmnvar( "ui_hardpoint_timer" ) )
	end
	
	self:registerOmnvarHandler( "ui_hardpoint_timer", f28_local1 )
	f28_local1( self )
	return self
end

function AddGameModeInfoSDSR( f30_arg0 )
	local f30_local0 = Engine.GetDvarString( "ui_gametype" )
	local f30_local1 = CoD.TextSettings.TitleFontTinyBold
	local f30_local2 = function ( menu, controller )
		local self = LUI.UIText.new( {
			font = f30_local1.Font,
			alignment = controller,
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			left = 10,
			top = -f30_local1.Height / 2 - 1,
			right = -10,
			height = f30_local1.Height
		} )
		self.id = "aliveCountText_" .. menu
		f30_arg0:addElement( self )
		self:registerEventHandler( "update_alive_count", function ()
			local f32_local0 = Game.GetOmnvar( "ui_attacking_team" )
			local f32_local1 = 0
			local f32_local2 = Game.GetNumPlayersOnTeam( menu )
			for f32_local3 = 1, f32_local2, 1 do
				local f32_local6 = GameX.GetPlayerScoreInfoAtRankForGameMode( menu, f32_local3, f30_local0 )
				if not f32_local6.isDead then
					f32_local1 = f32_local1 + 1
				end
			end
			if menu == f32_local0 then
				if f32_local1 == 1 then
					self:setText( Engine.Localize( "ESPORTS_1_ATTACKER_ALIVE" ) )
				else
					self:setText( Engine.Localize( "ESPORTS_N_ATTACKERS_ALIVE", f32_local1 ) )
				end
			elseif f32_local1 == 1 then
				self:setText( Engine.Localize( "ESPORTS_1_DEFENDER_ALIVE" ) )
			else
				self:setText( Engine.Localize( "ESPORTS_N_DEFENDERS_ALIVE", f32_local1 ) )
			end
		end )
	end
	
	f30_local2( Teams.allies, LUI.HorizontalAlignment.Left )
	f30_local2( Teams.axis, LUI.HorizontalAlignment.Right )
	local self = LUI.UITimer.new( 200, "update_alive_count" )
	self.id = "update_alive_count_timer"
	f30_arg0:addElement( self )
	local self = LUI.UIImage.new( {
		alignment = LUI.HorizontalAlignment.Center,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		bottom = 20,
		left = -20,
		right = 20,
		alpha = 0
	} )
	self.id = "bomb_planted_ui"
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "planted_A", {
		material = RegisterMaterial( "waypoint_esports_snd_planted_A" )
	} )
	self:registerAnimationState( "planted_B", {
		material = RegisterMaterial( "waypoint_esports_snd_planted_B" )
	} )
	self:registerOmnvarHandler( "ui_mlg_game_mode_status_1", function ( f33_arg0, f33_arg1 )
		if f33_arg1.value == 0 then
			f33_arg0:animateToState( "hidden", 0 )
		elseif f33_arg1.value == 1 then
			f33_arg0:animateToState( "planted_A", 0 )
			f33_arg0:animateToState( "visible", 0 )
		elseif f33_arg1.value == 2 then
			f33_arg0:animateToState( "planted_B", 0 )
			f33_arg0:animateToState( "visible", 0 )
		end
	end )
	f30_arg0:addElement( self )
end

function AddGameModeInfo( f34_arg0, f34_arg1 )
	local f34_local0 = Engine.GetDvarString( "ui_gametype" )
	if f34_local0 == "ctf" then
		AddGameModeInfoCTF( f34_arg0 )
	elseif f34_local0 == "dom" then
		AddGameModeInfoDOM( f34_arg0 )
	elseif f34_local0 == "hp" then
		AddGameModeInfoHP( f34_arg0 )
	elseif f34_local0 == "sd" then
		AddGameModeInfoSDSR( f34_arg0 )
	elseif f34_local0 == "sab" then
		AddGameModeInfoSDSR( f34_arg0 )
	elseif f34_local0 == "dd" then
		AddGameModeInfoSDSR( f34_arg0 )
	elseif f34_local0 == "koth" then
		AddGameModeInfoSDSR( f34_arg0 )
	end
end

function BuildGameModeSubTitleElementRoundBased( f35_arg0 )
	local f35_local0 = "scr_" .. f35_arg0 .. "_halftime"
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontTinyBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = 71,
		right = 0,
		height = CoD.TextSettings.TitleFontTiny.Height,
		color = Colors.white,
		alpha = 0.75
	} )
	self.id = "roundStatus_id"
	self.hasHalftime = Engine.GetDvarInt( f35_local0 ) == 1
	local f35_local2 = function ( f36_arg0, f36_arg1 )
		if f36_arg0.hasHalftime then
			if f36_arg1.value > 2 then
				f36_arg0:setText( Engine.Localize( "@LUA_MP_COMMON_OVERTIME" ) )
			else
				f36_arg0:setText( Engine.Localize( "@LUA_MP_COMMON_ROUND_NUM_OF_NUM", f36_arg1.value, 2 ) )
			end
		else
			f36_arg0:setText( Engine.Localize( "@LUA_MP_COMMON_ROUND_NUM", f36_arg1.value ) )
		end
	end
	
	f35_local2( self, {
		value = Game.GetOmnvar( "ui_current_round" )
	} )
	self:registerOmnvarHandler( "ui_current_round", f35_local2 )
	return self
end

function BuildGameModeSubTitleElement()
	local f37_local0 = nil
	local f37_local1 = false
	local f37_local2 = Engine.GetDvarString( "ui_gametype" )
	if f37_local2 == "ctf" then
		f37_local0 = BuildGameModeSubTitleElementRoundBased( f37_local2 )
	elseif f37_local2 == "hp" then
		f37_local0 = BuildGameModeSubTitleElementHP()
	elseif f37_local2 == "sd" then
		f37_local0 = BuildGameModeSubTitleElementRoundBased( f37_local2 )
	else
		f37_local1 = true
	end
	assert( f37_local1 or f37_local0 ~= nil )
	return f37_local0
end

function large_scoreboard()
	local f38_local0 = Engine.GetDvarString( "ui_gametype" )
	local f38_local1 = 360
	local self = LUI.UIElement.new()
	self.id = "large_scoreboard"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -40,
		height = 80,
		left = -f38_local1 / 2,
		right = f38_local1 / 2
	} )
	self:animateToState( "default" )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_esports_scoreboard_bg_blur" ),
		color = Colors.grey_75,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -30,
		height = 192,
		right = 0,
		width = 192
	} )
	self.id = "backgroundSentinelBlur"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_esports_scoreboard_bg" ),
		color = CoD.GetSentinelColor(),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -30,
		height = 192,
		right = 0,
		width = 192
	} )
	self.id = "backgroundSentinel"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_esports_scoreboard_bg_blur" ),
		yRot = 180,
		color = Colors.grey_75,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -30,
		height = 192,
		width = 192,
		left = 0
	} )
	self.id = "backgroundAtlasBlur"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_esports_scoreboard_bg" ),
		color = CoD.GetAtlasColor(),
		yRot = 180,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -30,
		height = 192,
		width = 192,
		left = 0
	} )
	self.id = "backgroundAtlas"
	self:addElement( self )
	local f38_local7 = Engine.ToUpperCase( Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, GameX.GetGameMode(), GameTypesTable.Cols.Name ) ) ) .. " - " .. GetMapName()
	local f38_local8 = CoD.TextSettings.TitleFontTinyBold
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = f38_local8.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = 10,
		right = 0,
		height = f38_local8.Height
	} )
	self.id = "gameRules"
	self:setText( f38_local7 )
	self:addElement( self )
	local f38_local10, f38_local11, f38_local12, f38_local13 = GetTextDimensions2( f38_local7, f38_local8.Font, f38_local8.Height )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_esports_scoreboard_top_bracket" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 10,
		height = 24,
		width = 96,
		right = -f38_local12 / 2
	} )
	self.id = "nameFrameLeft"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "hud_esports_scoreboard_top_bracket" ),
		yRot = 180,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 10,
		height = 24,
		width = 96,
		left = f38_local12 / 2
	} )
	self.id = "nameFrameRight"
	self:addElement( self )
	local f38_local16 = 47
	local self = LUI.UICountdown.new()
	self.id = "gameTimer"
	self:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = f38_local16,
		right = 0,
		height = CoD.TextSettings.TitleFontSmall.Height,
		color = Colors.primary_text_color
	} )
	self:animateToState( "default" )
	self:registerAnimationState( "yellow", {
		color = Colors.yellow
	} )
	self:registerAnimationState( "red", {
		color = Colors.red
	} )
	self:registerOmnvarHandler( "ui_bomb_timer", function ( f39_arg0, f39_arg1 )
		if f39_arg1.value == 0 then
			f39_arg0:animateToState( "default", 0 )
		else
			f39_arg0:animateInSequence( {
				{
					"yellow",
					0
				},
				{
					"yellow",
					f39_arg0:getEndTime() - Game.GetTime() - 7500
				},
				{
					"red",
					0
				}
			} )
		end
	end )
	self:addElement( self )
	local f38_local18 = BuildGameModeSubTitleElement()
	if f38_local18 ~= nil then
		self:addElement( f38_local18 )
	end
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMediumLargeBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -60,
		top = 47,
		width = 0,
		height = CoD.TextSettings.TitleFontMediumLarge.Height,
		color = CoD.GetSentinelColor()
	} )
	self:setupUIBindText( "TeamScoreFriendly" )
	self.id = "sentinelScore"
	self:addElement( self )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMediumLargeBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = 60,
		top = 47,
		width = 0,
		height = CoD.TextSettings.TitleFontMediumLarge.Height,
		color = CoD.GetAtlasColor()
	} )
	self:setupUIBindText( "TeamScoreEnemy" )
	self.id = "atlasScore"
	self:addElement( self )
	local f38_local21 = function ( f40_arg0 )
		return function ( f41_arg0, f41_arg1 )
			local f41_local0 = Game.GetPlayerTeam( Game.GetPlayerstateClientnum() )
			if mlgIconClearEnabled then
				f41_arg0:animateToState( "hidden" )
			else
				f41_arg0:animateToState( "default" )
			end
		end
		
	end
	
	local f38_local22 = Engine.GetDvarString( "g_TeamIcon_Allies" )
	local f38_local23 = Engine.GetDvarString( "g_TeamIcon_Axis" )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( f38_local22 ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 11,
		height = 96,
		right = -85,
		width = 96,
		color = CoD.GetSentinelColor(),
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "mlg_icon_clear_enabled_change", f38_local21( Teams.allies ) )
	self.id = "sentinelEmblem"
	self:addElement( self )
	local self = f38_local21( Teams.allies )
	self( self )
	self = LUI.UIImage.new( {
		material = RegisterMaterial( f38_local23 ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 10,
		height = 96,
		width = 96,
		left = 85,
		color = CoD.GetAtlasColor(),
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "mlg_icon_clear_enabled_change", f38_local21( Teams.axis ) )
	self.id = "atlasEmblem"
	self:addElement( self )
	local self = f38_local21( Teams.axis )
	self( self )
	self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 23,
		height = 28,
		left = 41,
		right = -41
	} )
	self.id = "modeInfoBG"
	self:addElement( self )
	AddGameModeInfo( self, f38_local1 - 82 )
	return self
end

LoadoutTabs = {
	Min = 1,
	None = 1,
	Name = 2,
	Primary = 3,
	Secondary = 4,
	Perks = 5,
	Max = 5
}
loadoutTab = LoadoutTabs.Name
function NextLoadoutTab( f42_arg0, f42_arg1 )
	SetLoadoutTab( f42_arg0, 1 + loadoutTab % LoadoutTabs.Max )
end

function PreviousLoadoutTab( f43_arg0, f43_arg1 )
	local f43_local0 = loadoutTab - 1
	if loadoutTab == LoadoutTabs.Min then
		f43_local0 = LoadoutTabs.Max
	end
	SetLoadoutTab( f43_arg0, f43_local0 )
end

function SetLoadoutTab( f44_arg0, f44_arg1 )
	assert( f44_arg0.mlgHUD )
	assert( f44_arg0.mlgHUD.loadout )
	loadoutTab = f44_arg1
	if loadoutTab ~= LoadoutTabs.None then
		f44_arg0.mlgHUD.loadout:processEvent( {
			name = "refresh_tab"
		} )
	end
	f44_arg0.mlgHUD:processEvent( {
		name = "update_mlg_hud_visibility"
	} )
	knownState.userPreferences.loadoutTab = loadoutTab
end

function PopulateLoadoutTab( f45_arg0 )
	f45_arg0:closeChildren()
	local f45_local0 = 0
	if loadoutTab == LoadoutTabs.Name then
		
	elseif loadoutTab == LoadoutTabs.Primary or loadoutTab == LoadoutTabs.Secondary then
		local f45_local1 = 140
		local f45_local2 = 32
		local f45_local3 = "ui_mlg_loadout_primary_"
		local f45_local4 = 3
		if loadoutTab == LoadoutTabs.Secondary then
			f45_local3 = "ui_mlg_loadout_secondary_"
			f45_local4 = 2
		end
		local f45_local5 = Game.GetOmnvar( f45_local3 .. "weapon" )
		local f45_local6 = Engine.TableLookupByRow( StatsTable.File, f45_local5, StatsTable.Cols.WeaponImage )
		if f45_local6 and #f45_local6 > 0 and f45_local5 > 0 then
			local f45_local7 = RegisterMaterial( f45_local6 )
			Engine.CacheMaterial( f45_local7 )
			local self = LUI.UIImage.new( {
				material = f45_local7,
				topAnchor = false,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = -f45_local1 / 4,
				height = f45_local1 / 2,
				left = 0,
				width = f45_local1
			} )
			self.id = "weapon"
			f45_arg0:addElement( self )
			f45_local0 = f45_local0 + f45_local1
			local self = LUI.UIHorizontalList.new( {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				bottom = 0,
				left = 0,
				right = 3 * f45_local2,
				horizontalAlignment = LUI.HorizontalAlignment.Center
			} )
			self.id = "attachkit"
			f45_arg0:addElement( self )
			local self = Engine.TableLookupGetRowNum( AttachKitTable.File, AttachKitTable.Cols.Id, Game.GetOmnvar( f45_local3 .. "attachkit" ) )
			if Engine.TableLookupByRow( AttachKitTable.File, self, AttachKitTable.Cols.Ref ) ~= "none" then
				local self = LUI.UIImage.new( {
					material = RegisterMaterial( Engine.TableLookupByRow( AttachKitTable.File, self, AttachKitTable.Cols.Image ) ),
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					top = -f45_local2 / 2,
					height = f45_local2,
					left = 0,
					width = f45_local2
				} )
				self.id = "attachkit"
				self:addElement( self )
			end
			local self = Engine.TableLookupGetRowNum( FurnitureKitTable.File, FurnitureKitTable.Cols.Id, Game.GetOmnvar( f45_local3 .. "furniturekit" ) )
			local f45_local12 = Engine.TableLookupByRow( FurnitureKitTable.File, self, FurnitureKitTable.Cols.Ref )
			if f45_local12 ~= "none" and f45_local12 ~= "base" then
				local self = LUI.UIImage.new( {
					material = RegisterMaterial( Engine.TableLookupByRow( FurnitureKitTable.File, self, FurnitureKitTable.Cols.Image ) ),
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					top = -f45_local2 / 2,
					height = f45_local2,
					left = f45_local2,
					width = f45_local2
				} )
				self.id = "furniturekit"
				self:addElement( self )
			end
		end
	elseif loadoutTab == LoadoutTabs.Perks then
		local f45_local1 = 64
		local f45_local2 = {
			0,
			1,
			2
		}
		for f45_local3 = 0, 2, 1 do
			local f45_local7 = f45_local2[f45_local3 + 1]
			local self = Game.GetOmnvar( "ui_mlg_loadout_perk_" .. f45_local7 )
			local self = Engine.TableLookupByRow( PerkTable.File, self, PerkTable.Cols.Image )
			local f45_local14 = Engine.TableLookupByRow( PerkTable.File, self, PerkTable.Cols.Ref )
			local self = nil
			if f45_local14 ~= "specialty_null" and self and #self > 0 then
				self = LUI.UIImage.new( {
					material = RegisterMaterial( self ),
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					top = -f45_local1 / 2,
					height = f45_local1,
					left = 0,
					width = f45_local1
				} )
				self.id = "perk_" .. f45_local7
				f45_arg0:addElement( self )
			end
			if self or f45_local7 < 3 then
				f45_local0 = f45_local0 + f45_local1
			end
		end
	end
	return f45_local0
end

function loadout()
	local f46_local0 = 65
	local f46_local1 = -1
	local f46_local2 = 25
	local f46_local3 = 80
	local f46_local4 = 192
	local f46_local5 = -35
	local f46_local6 = 96
	local f46_local7 = 35
	local f46_local8 = 48
	local f46_local9 = 20
	local f46_local10 = 20
	local self = LUI.UIVerticalList.new()
	self.id = "loadout"
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = f46_local2,
		left = 0,
		right = 0,
		perspective = 1280
	} )
	self.id = "titleArea"
	self:addElement( self )
	local self = LUI.UIBackgroundPanel.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "backgroundBlur"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -f46_local4 / 2,
		height = f46_local4,
		left = f46_local5,
		width = f46_local6,
		alpha = 0
	} )
	self.id = "teamIcon"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -f46_local4 / 2,
		height = f46_local4,
		left = f46_local5,
		width = f46_local6,
		alpha = 0,
		material = RegisterMaterial( "hud_esports_nameplate_left_blur" ),
		color = Colors.grey_75
	} )
	self.id = "teamIconBlur"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -f46_local4 / 2,
		height = f46_local4,
		left = f46_local5 + f46_local6,
		right = f46_local7 - f46_local8,
		alpha = 0,
		material = RegisterMaterial( "hud_esports_nameplate_repeat" )
	} )
	self.id = "backgroundMid"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -f46_local4 / 2,
		height = f46_local4,
		left = f46_local5 + f46_local6,
		right = f46_local7 - f46_local8,
		alpha = 0,
		material = RegisterMaterial( "hud_esports_nameplate_repeat_blur" ),
		color = Colors.grey_75
	} )
	self.id = "backgroundMidBlur"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -f46_local4 / 2,
		height = f46_local4,
		width = f46_local8,
		right = f46_local7,
		alpha = 0,
		material = RegisterMaterial( "hud_esports_nameplate_right" )
	} )
	self.id = "backgroundRight"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -f46_local4 / 2,
		height = f46_local4,
		width = f46_local8,
		right = f46_local7,
		alpha = 0,
		material = RegisterMaterial( "hud_esports_nameplate_right_blur" ),
		color = Colors.grey_75
	} )
	self.id = "backgroundRightBlur"
	self:addElement( self )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.TitleFontMediumBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 20,
		top = 0,
		right = 0,
		height = CoD.TextSettings.TitleFontSmallBold.Height
	} )
	self:registerAnimationState( "atlas", {
		color = CoD.GetAtlasColor()
	} )
	self:registerAnimationState( "sentinel", {
		color = CoD.GetSentinelColor()
	} )
	self:registerEventHandler( "playerstate_client_changed", function ( element, event )
		if Game.GetPlayerTeam( Game.GetPlayerstateClientnum() ) == Teams.allies then
			element:animateToState( "sentinel" )
		else
			element:animateToState( "atlas" )
		end
	end )
	self.id = "playerName"
	self:addElement( self )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Right,
		font = CoD.TextSettings.TitleFontTinyBold.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = 5,
		right = -20,
		height = CoD.TextSettings.TitleFontTinyBold.Height
	} )
	self.id = "tabName"
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:addElement( self )
	local self = LUI.UIBackgroundPanel.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = f46_local3,
		left = 0,
		right = 0
	} )
	self.id = "contentArea"
	self:addElement( self )
	local self = LUI.UIHorizontalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 5,
		bottom = -5,
		left = 0,
		right = 0,
		horizontalAlignment = LUI.HorizontalAlignment.Center,
		spacing = f46_local10
	} )
	self.id = "content"
	self:addElement( self )
	self:registerEventHandler( "playerstate_client_changed", function ( element, event )
		local f48_local0 = Game.GetPlayerClientnum()
		local f48_local1 = Game.GetPlayerstateClientnum()
		if f48_local0 ~= f48_local1 then
			local f48_local2 = Game.GetPlayerScoreInfo( f48_local1 )
			if f48_local2 ~= nil then
				self:setText( f48_local2.name )
			else
				self:setText( "" )
			end
			self.mlgHUD:processEvent( {
				name = "update_mlg_hud_visibility"
			} )
		end
	end )
	self:registerOmnvarHandler( "ui_mlg_loadout_primary_weapon", function ( f49_arg0, f49_arg1 )
		f49_arg0:processEvent( {
			name = "refresh_tab"
		} )
	end )
	self:registerEventHandler( "refresh_tab", function ( element, event )
		local f50_local0 = 20
		local f50_local1 = CoD.TextSettings.TitleFontSmallBold.Height
		local f50_local2 = false
		local f50_local3 = 1
		local f50_local4 = 0
		local f50_local5 = 25
		local f50_local6 = 80
		local f50_local7, f50_local8 = nil
		if loadoutTab == LoadoutTabs.Name then
			self:setText( "" )
			f50_local0 = 60
			f50_local1 = CoD.TextSettings.TitleFontMediumLargeBold.Height
			f50_local2 = true
			f50_local3 = 0
			f50_local4 = 100
			f50_local5 = CoD.TextSettings.TitleFontMediumLargeBold.Height + 20
			f50_local6 = 0
			local f50_local9 = Engine.GetDvarString( "g_TeamIcon_Allies" )
			local f50_local10 = Engine.GetDvarString( "g_TeamIcon_Axis" )
			if Game.GetPlayerTeam( Game.GetPlayerstateClientnum() ) == Teams.allies then
				f50_local7 = RegisterMaterial( f50_local9 )
				f50_local8 = CoD.GetSentinelColor()
			else
				f50_local7 = RegisterMaterial( f50_local10 )
				f50_local8 = CoD.GetAtlasColor()
			end
		elseif loadoutTab == LoadoutTabs.Primary then
			self:setText( Engine.Localize( "MPUI_PRIMARY_WEAPON" ) )
		elseif loadoutTab == LoadoutTabs.Secondary then
			self:setText( Engine.Localize( "MPUI_SECONDARY_WEAPON" ) )
		elseif loadoutTab == LoadoutTabs.Perks then
			self:setText( Engine.Localize( "ESPORTS_PERKS" ) )
		end
		local f50_local9, f50_local10, f50_local11, f50_local12 = GetTextDimensions2( self:getText(), CoD.TextSettings.TitleFontMediumBold.Font, f50_local1 )
		local f50_local13 = nil
		if loadoutTab == LoadoutTabs.Name then
			f50_local13 = f50_local0 + f50_local11 + 10
		else
			local f50_local14, f50_local15, f50_local16, f50_local17 = GetTextDimensions2( self:getText(), CoD.TextSettings.TitleFontTinyBold.Font, CoD.TextSettings.TitleFontTinyBold.Height )
			f50_local13 = f50_local0 + f50_local11 + 10 + f50_local16 + 20
		end
		local f50_local14 = math.max( f50_local13, PopulateLoadoutTab( self ) + f46_local10 * math.max( 0, self:getNumChildren() ) + 20 )
		element:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = f50_local2,
			rightAnchor = false,
			bottom = -f46_local0,
			left = f50_local3 * -f50_local14 / 2 + f50_local4,
			width = f50_local14,
			height = f50_local5 + f46_local1 + f50_local6
		} )
		element:animateToState( "default" )
		self:registerAnimationState( "refresh", {
			perspective = 0,
			yRot = 0
		} )
		self:animateToState( "refresh" )
		self:registerAnimationState( "refresh", {
			leftAnchor = true,
			rightAnchor = true,
			left = f50_local0,
			right = 0,
			height = f50_local1
		} )
		self:animateToState( "refresh" )
		local f50_local15 = self
		local f50_local16 = f50_local15
		f50_local15 = f50_local15.registerAnimationState
		local f50_local17 = "refresh"
		local f50_local18 = {}
		local f50_local19
		if not f50_local7 then
			f50_local19 = 1
			if not f50_local19 then
			
			else
				f50_local18.alpha = f50_local19
				f50_local15( f50_local16, f50_local17, f50_local18 )
				self:animateToState( "refresh" )
				f50_local15 = self
				f50_local16 = f50_local15
				f50_local15 = f50_local15.registerAnimationState
				f50_local17 = "refresh"
				f50_local18 = {}
				f50_local19
				if f50_local7 then
					f50_local19 = 1
					if not f50_local19 then
					
					else
						f50_local18.alpha = f50_local19
						f50_local18.material = f50_local7
						f50_local18.color = f50_local8
						f50_local15( f50_local16, f50_local17, f50_local18 )
						self:animateToState( "refresh" )
						f50_local15 = self
						f50_local16 = f50_local15
						f50_local15 = f50_local15.registerAnimationState
						f50_local17 = "refresh"
						f50_local18 = {}
						f50_local19
						if f50_local7 then
							f50_local19 = 1
							if not f50_local19 then
							
							else
								f50_local18.alpha = f50_local19
								f50_local15( f50_local16, f50_local17, f50_local18 )
								self:animateToState( "refresh" )
								f50_local15 = self
								f50_local16 = f50_local15
								f50_local15 = f50_local15.registerAnimationState
								f50_local17 = "refresh"
								f50_local18 = {}
								f50_local19
								if f50_local7 then
									f50_local19 = 1
									if not f50_local19 then
									
									else
										f50_local18.alpha = f50_local19
										f50_local18.color = f50_local8
										f50_local15( f50_local16, f50_local17, f50_local18 )
										self:animateToState( "refresh" )
										f50_local15 = self
										f50_local16 = f50_local15
										f50_local15 = f50_local15.registerAnimationState
										f50_local17 = "refresh"
										f50_local18 = {}
										f50_local19
										if f50_local7 then
											f50_local19 = 1
											if not f50_local19 then
											
											else
												f50_local18.alpha = f50_local19
												f50_local15( f50_local16, f50_local17, f50_local18 )
												self:animateToState( "refresh" )
												f50_local15 = self
												f50_local16 = f50_local15
												f50_local15 = f50_local15.registerAnimationState
												f50_local17 = "refresh"
												f50_local18 = {}
												f50_local19
												if f50_local7 then
													f50_local19 = 1
													if not f50_local19 then
													
													else
														f50_local18.alpha = f50_local19
														f50_local18.color = f50_local8
														f50_local15( f50_local16, f50_local17, f50_local18 )
														self:animateToState( "refresh" )
														f50_local15 = self
														f50_local16 = f50_local15
														f50_local15 = f50_local15.registerAnimationState
														f50_local17 = "refresh"
														f50_local18 = {}
														f50_local19
														if f50_local7 then
															f50_local19 = 1
															if not f50_local19 then
															
															else
																f50_local18.alpha = f50_local19
																f50_local15( f50_local16, f50_local17, f50_local18 )
																self:animateToState( "refresh" )
																self:registerAnimationState( "refresh", {
																	height = f50_local6
																} )
																self:animateToState( "refresh" )
															end
														end
														f50_local19 = 0
													end
												end
												f50_local19 = 0
											end
										end
										f50_local19 = 0
									end
								end
								f50_local19 = 0
							end
						end
						f50_local19 = 0
					end
				end
				f50_local19 = 0
			end
		end
		f50_local19 = 0
	end )
	return self
end

FocusModes = {
	None = 1,
	Scoreboard = 2,
	Max = 2
}
focusMode = FocusModes.None
followedClientNum = -1
function SetFocusMode( f51_arg0, f51_arg1 )
	assert( f51_arg0.mlgHUD )
	assert( f51_arg0.mlgHUD.hudContainer )
	assert( f51_arg0.mlgHUD.hudContainer.hud )
	if f51_arg1 == focusMode and (f51_arg1 == FocusModes.None or f51_arg0.mlgHUD.currentPlayerFocus) then
		return 
	end
	focusMode = f51_arg1
	local f51_local0, f51_local1, f51_local2 = nil
	if f51_arg1 == FocusModes.Scoreboard then
		if scoreMode == ScoreModes.BoardOff then
			SetScoreMode( f51_arg0, ScoreModes.BoardOn )
		end
		f51_local0 = MLG.GetFollowedClientNum()
		if f51_local0 then
			f51_local1, f51_local2 = GetTeamAndRank( f51_local0 )
		else
			if GameX.gameModeIsFFA() then
				local f51_local3 = Teams.free
			end
			f51_local1 = f51_local3 or Teams.allies
			f51_local2 = 1
			local f51_local4 = GameX.GetPlayerScoreInfoAtRankForGameMode( f51_local1, f51_local2, GameX.GetGameMode() )
			if f51_local1 == Teams.allies and not f51_local4 then
				f51_local4 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.axis, f51_local2, GameX.GetGameMode() )
			end
			if f51_local4 then
				f51_local0 = f51_local4.client
			end
		end
	end
	if f51_local0 and f51_local1 and f51_local2 then
		f51_arg0.mlgHUD.currentPlayerFocus = {
			team = f51_local1,
			rank = f51_local2
		}
		f51_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "hilite_scoreboard_row",
			team = f51_local1,
			rank = f51_local2
		} )
		MLG.HighlightClientNum( f51_local0 )
	else
		f51_arg0.mlgHUD.hudContainer.hud:processEvent( {
			name = "hilite_scoreboard_row"
		} )
		f51_arg0.mlgHUD.currentPlayerFocus = nil
		MLG.HighlightClientNum( -1 )
	end
	f51_arg0.mlgHUD:processEvent( {
		name = "focus_mode_change"
	} )
end

function large_map()
	local self = LUI.UIElement.new()
	self.id = "largeMap"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "bigger", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		width = 320,
		height = 320,
		top = 0,
		left = -30
	} )
	self:registerAnimationState( "fullscreen", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = 500,
		height = 500,
		top = -225,
		left = -250
	} )
	self:registerEventHandler( "show_standard_map", function ( element, event )
		element:animateToState( "default", 150 )
	end )
	self:registerEventHandler( "show_bigger_map", function ( element, event )
		element:animateToState( "default", 0 )
		element:animateToState( "bigger", 0 )
		element:animateToState( "visible", 150 )
	end )
	self:registerEventHandler( "show_fullscreen_map", function ( element, event )
		element:animateToState( "default", 0 )
		element:animateToState( "fullscreen", 0 )
		element:animateToState( "visible", 150 )
	end )
	self:registerEventHandler( "killcam_change", function ( element, event )
		if event.value then
			knownState.userPreferences.mapZoomMode = mapZoomMode
			SetMapZoomMode( self, MapZoomModes.Standard )
		end
	end )
	self:animateToState( "default" )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0.8
	} )
	self:setupMinimap( CoD.CompassType.Full )
	self:addElement( self )
	local self = LUI.UIElement.new()
	self:setupMinimapIcons( CoD.CompassType.Full )
	self.properties = {
		drawPlayer = true
	}
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		left = 0,
		alpha = 0.8
	} )
	self:animateToState( "default" )
	self:addElement( self )
	return self
end

MapZoomModes = {
	Standard = 1,
	Bigger = 2,
	FullScreen = 3,
	Max = 3
}
mapZoomMode = MapZoomModes.Bigger
function CycleMapZoom( f57_arg0, f57_arg1 )
	SetMapZoomMode( f57_arg0, 1 + mapZoomMode % MapZoomModes.Max )
end

function SetMapZoomMode( f58_arg0, f58_arg1 )
	assert( f58_arg0.mlgHUD )
	assert( f58_arg0.mlgHUD.hudContainer )
	assert( f58_arg0.mlgHUD.hudContainer.hud )
	mapZoomMode = f58_arg1
	if mapZoomMode == MapZoomModes.Standard then
		f58_arg0.mlgHUD.hudContainer.hud.useMLGMinimap = false
		f58_arg0.mlgHUD:processEvent( {
			name = "show_standard_map"
		} )
	else
		f58_arg0.mlgHUD.hudContainer.hud.useMLGMinimap = true
		if mapZoomMode == MapZoomModes.Bigger then
			f58_arg0.mlgHUD:processEvent( {
				name = "show_bigger_map"
			} )
		elseif mapZoomMode == MapZoomModes.FullScreen then
			f58_arg0.mlgHUD:processEvent( {
				name = "show_fullscreen_map"
			} )
		end
	end
	f58_arg0.mlgHUD:processEvent( {
		name = "map_zoom_change"
	} )
	f58_arg0.mlgHUD:processEvent( {
		name = "update_mlg_hud_visibility"
	} )
	f58_arg0.mlgHUD.hudContainer.hud:processEvent( {
		name = "mlg_minimap_change"
	} )
end

Overlays = {
	None = 1,
	Help = 2,
	Max = 2
}
currentOverlay = Overlays.Help
function ToggleOverlays( f59_arg0 )
	assert( f59_arg0.mlgHUD )
	currentOverlay = 1 + currentOverlay % Overlays.Max
	f59_arg0.mlgHUD:processEvent( {
		name = "update_mlg_hud_visibility"
	} )
end

mpHudEnabled = true
function ToggleMPHud( f60_arg0, f60_arg1 )
	if currentView ~= Views.Free then
		mpHudEnabled = not mpHudEnabled
		f60_arg0.mlgHUD:processEvent( {
			name = "mlg_hud_enabled_change"
		} )
		f60_arg0.mlgHUD.hudContainer:processEvent( {
			name = "mlg_hud_enabled_change"
		} )
	end
end

function MLGHud_isMPHudEnabled()
	return mpHudEnabled
end

mlgIconClearEnabled = false
function ToggleMLGIconClear( f62_arg0, f62_arg1 )
	mlgIconClearEnabled = not mlgIconClearEnabled
	f62_arg0.mlgHUD:processEvent( {
		name = "mlg_icon_clear_enabled_change"
	} )
	f62_arg0.mlgHUD.hudContainer.hud:processEvent( {
		name = "mlg_icon_clear_enabled_change"
	} )
end

function MLGHud_isMLGIconClearEnabled()
	return mlgIconClearEnabled
end

f0_local0 = 0
f0_local1 = 1
function help_lines()
	local f64_local0 = {
		Font = CoD.TextSettings.TitleFontTiny.Font,
		Height = 14
	}
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 5,
		bottom = 0,
		left = 0,
		right = 0,
		spacing = 0
	} )
	self.id = "vlist"
	local f64_local2 = {}
	for f64_local3 = 1, 3, 1 do
		local self = LUI.UIHorizontalList.new( {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = f64_local0.Height,
			left = 0,
			right = 0,
			alignment = LUI.HorizontalAlignment.Center,
			spacing = 2
		} )
		self.id = "line_" .. f64_local3
		self:addElement( self )
		f64_local2[f64_local3] = self
	end
	self.addHelpText = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
		assert( f64_local2[f65_arg0] )
		assert( #f65_arg2 > 0 )
		local f65_local0 = ""
		for f65_local1 = 1, #f65_arg2, 1 do
			if CoD.UsingController() then
				f65_local0 = f65_local0 .. Engine.Localize( f65_arg2[f65_local1].string )
			else
				f65_local0 = f65_local0 .. Engine.Localize( f65_arg2[f65_local1].keyboard_string )
			end
			if f65_local1 < #f65_arg2 then
				f65_local0 = f65_local0 .. "/"
			end
		end
		local f65_local1, f65_local2, f65_local3, f65_local4 = GetTextDimensions2( f65_local0, f64_local0.Font, f64_local0.Height )
		local self = LUI.UIText.new( {
			font = f64_local0.Font,
			alignment = LUI.Alignment.Left,
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			top = 0,
			width = f65_local3,
			height = f64_local0.Height,
			alpha = 0.8
		} )
		self.id = "help_buttons_" .. f65_arg1
		self:setText( f65_local0 )
		local f65_local6 = Engine.ToUpperCase( Engine.Localize( f65_arg1 ) )
		local f65_local7, f65_local8, f65_local9, f65_local10 = GetTextDimensions2( f65_local6, f64_local0.Font, f64_local0.Height )
		local self = LUI.UIText.new( {
			font = f64_local0.Font,
			alignment = LUI.Alignment.Left,
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			top = 0,
			width = f65_local9,
			height = f64_local0.Height
		} )
		self.id = "help_action_" .. f65_arg1
		self:setText( f65_local6 )
		if f65_arg3 == f0_local0 then
			f64_local2[f65_arg0]:addElement( self )
			f64_local2[f65_arg0]:addElement( self )
		else
			f64_local2[f65_arg0]:addElement( self )
			f64_local2[f65_arg0]:addElement( self )
		end
		local self = LUI.UIElement.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			bottom = 0,
			left = 0,
			right = 15
		} )
		self.id = "spacer_" .. f65_arg1
		f64_local2[f65_arg0]:addElement( self )
	end
	
	return self
end

function help_keyboard()
	local f66_local0 = help_lines()
	if mapZoomMode ~= MapZoomModes.FullScreen then
		f66_local0.addHelpText( 1, "ESPORTS_CYCLE_PLAYERS", {
			ButtonMap.button_page_up,
			ButtonMap.button_page_down
		}, f0_local0 )
		f66_local0.addHelpText( 1, "ESPORTS_CYCLE_LOADOUT", {
			ButtonMap.button_end
		}, f0_local0 )
	end
	f66_local0.addHelpText( 1, "ESPORTS_BROWSE_PLAYERS", {
		ButtonMap.button_ins,
		ButtonMap.button_del,
		ButtonMap.button_action
	}, f0_local1 )
	f66_local0.addHelpText( 2, "ESPORTS_MINIMAP", {
		ButtonMap.button_alt1
	}, f0_local1 )
	f66_local0.addHelpText( 3, "ESPORTS_TOGGLE_LARGE_SCOREBOARD", {
		ButtonMap.button_right_trigger
	}, f0_local0 )
	f66_local0.addHelpText( 3, "ESPORTS_TOGGLE_SCOREBOARD", {
		ButtonMap.button_select
	}, f0_local0 )
	f66_local0.addHelpText( 3, "ESPORTS_HIDE_HELPER", {
		ButtonMap.button_start
	}, f0_local1 )
	f66_local0.addHelpText( 1, "ESPORTS_COD_VISION", {
		ButtonMap.button_home
	}, f0_local0 )
	if currentView ~= Views.Free then
		local f66_local1 = ""
		if mpHudEnabled then
			f66_local1 = "ESPORTS_HIDE_PLAYER_HUD"
		else
			f66_local1 = "ESPORTS_SHOW_PLAYER_HUD"
		end
		f66_local0.addHelpText( 2, f66_local1, {
			ButtonMap.button_shoulderr
		}, f0_local1 )
	end
	return f66_local0
end

function help_controller()
	local f67_local0 = help_lines()
	f67_local0.addHelpText( 1, "ESPORTS_HIDE_HELPER", {
		ButtonMap.button_secondary
	}, f0_local0 )
	if mapZoomMode ~= MapZoomModes.FullScreen then
		f67_local0.addHelpText( 1, "ESPORTS_CYCLE_PLAYERS", {
			ButtonMap.button_dpad_up,
			ButtonMap.button_dpad_down
		}, f0_local0 )
		f67_local0.addHelpText( 1, "ESPORTS_CYCLE_LOADOUT", {
			ButtonMap.button_dpad_left,
			ButtonMap.button_dpad_right
		}, f0_local0 )
	end
	f67_local0.addHelpText( 1, "ESPORTS_MINIMAP", {
		ButtonMap.button_left_trigger
	}, f0_local0 )
	f67_local0.addHelpText( 1, "ESPORTS_COD_VISION", {
		ButtonMap.button_alt1
	}, f0_local0 )
	f67_local0.addHelpText( 1, "ESPORTS_TOGGLE_LARGE_SCOREBOARD", {
		ButtonMap.button_select
	}, f0_local0 )
	local f67_local1 = ""
	if focusMode == FocusModes.None then
		f67_local1 = "ESPORTS_FOCUS_SCOREBOARD"
	else
		f67_local1 = "ESPORTS_UNFOCUS_SCOREBOARD"
	end
	f67_local0.addHelpText( 1, f67_local1, {
		ButtonMap.button_right_trigger
	}, f0_local0 )
	if currentView ~= Views.Free then
		local f67_local2 = ""
		if mpHudEnabled then
			f67_local2 = "ESPORTS_HIDE_PLAYER_HUD"
		else
			f67_local2 = "ESPORTS_SHOW_PLAYER_HUD"
		end
		f67_local0.addHelpText( 1, f67_local2, {
			ButtonMap.button_shoulderr
		}, f0_local0 )
	end
	return f67_local0
end

function help()
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		height = 60,
		bottom = 1,
		left = -1,
		right = 1
	} )
	self.id = "help"
	local f68_local1 = function ( f69_arg0, f69_arg1 )
		f69_arg0:closeChildren()
		local self = LUI.UIBackgroundPanel.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0
		} )
		self.id = "blurBG"
		f69_arg0:addElement( self )
		local self = LUI.UIImage.new( {
			material = RegisterMaterial( "white" ),
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			color = Colors.black,
			alpha = 0.35
		} )
		self.id = "darken"
		f69_arg0:addElement( self )
		if CoD.UsingController() then
			f69_arg0:addElement( help_controller() )
		else
			f69_arg0:addElement( help_keyboard() )
		end
	end
	
	self:registerEventHandler( "rebuild_help", f68_local1 )
	self:registerEventHandler( "map_zoom_change", MBh.EmitEvent( "rebuild_help" ) )
	self:registerEventHandler( "view_change", MBh.EmitEvent( "rebuild_help" ) )
	self:registerEventHandler( "focus_mode_change", MBh.EmitEvent( "rebuild_help" ) )
	self:registerEventHandler( "mlg_hud_enabled_change", MBh.EmitEvent( "rebuild_help" ) )
	f68_local1( self )
	return self
end

function OpenPauseMenu( f70_arg0, f70_arg1 )
	assert( f70_arg0.mlgHUD )
	f70_arg0:dispatchEventToRoot( {
		name = "toggle_pause"
	} )
end

knownState = {
	isKillCam = nil,
	userPreferences = {}
}
function MLGHudControls()
	local self = LUI.UIBindButton.new()
	if CoD.UsingController() then
		self:registerEventHandler( "gamepad_button", function ( element, event )
			if IsPostGame() or Engine.GetLuiInUse() or knownState.isKillCam then
				return false
			elseif (event.button == "up" or event.button == "down" or event.button == "left" or event.button == "right") and event.qualifier ~= "dpad" then
				return false
			elseif event.button == "primary" then
				return FollowSelectedPlayer( element, event )
			else
				LUI.UIBindButton.GamepadButton( element, event )
				return true
			end
		end )
		local f71_local1 = function ( f73_arg0 )
			local f73_local0 = assert
			local f73_local1
			if f73_arg0 < 0 or f73_arg0 > 3 then
				f73_local1 = false
			else
				f73_local1 = true
			end
			f73_local0( f73_local1, "Invalid camera preset requested" )
			return function ( f74_arg0, f74_arg1 )
				if focusMode == FocusModes.None then
					if f74_arg1.name == "button_up" then
						FollowPrev( f74_arg0, f74_arg1 )
					elseif f74_arg1.name == "button_down" then
						FollowNext( f74_arg0, f74_arg1 )
					end
				elseif focusMode == FocusModes.Scoreboard then
					if f74_arg1.name == "button_up" then
						MoveScoreboardCursor( f74_arg0, -1 )
					elseif f74_arg1.name == "button_down" then
						MoveScoreboardCursor( f74_arg0, 1 )
					end
				end
			end
			
		end
		
		self:registerEventHandler( "button_secondary", ToggleOverlays )
		self:registerEventHandler( "button_alt1", function ()
			MLG.TogglePlayerOutlines()
		end )
		self:registerEventHandler( "button_left_trigger", CycleMapZoom )
		self:registerEventHandler( "button_start", OpenPauseMenu )
		self:registerEventHandler( "button_select", ToggleLargeScoreboard )
		self:registerEventHandler( "button_right_trigger", ToggleSmallScoreboard )
		self:registerEventHandler( "button_shoulderr", ToggleMPHud )
		self:registerEventHandler( "button_shoulderl", ToggleMLGIconClear )
		self:registerEventHandler( "button_up", f71_local1( 0 ) )
		self:registerEventHandler( "button_down", f71_local1( 2 ) )
		self:registerEventHandler( "button_right", NextLoadoutTab )
		self:registerEventHandler( "button_left", PreviousLoadoutTab )
	else
		self:registerEventHandler( "gamepad_button", function ( element, event )
			if event.down then
				if event.button == "page_up" or event.button == "page_down" or event.button == "ins" or event.button == "del" or event.button == "home" or event.button == "end" then
					element:processEvent( {
						name = event.button
					} )
					return true
				elseif event.button == "primary" then
					return FollowSelectedPlayer( element, event )
				end
			end
			return LUI.UIBindButton.GamepadButton( element, event )
		end )
		self:registerEventHandler( "button_select", ToggleSmallScoreboard )
		self:registerEventHandler( "button_start", ToggleOverlays )
		self:registerEventHandler( "button_alt1", CycleMapZoom )
		self:registerEventHandler( "page_up", FollowPrev )
		self:registerEventHandler( "page_down", FollowNext )
		self:registerEventHandler( "ins", function ( element, event )
			MoveScoreboardCursor( element, -1 )
		end )
		self:registerEventHandler( "del", function ( element, event )
			MoveScoreboardCursor( element, 1 )
		end )
		self:registerEventHandler( "home", function ()
			MLG.TogglePlayerOutlines()
		end )
		self:registerEventHandler( "end", NextLoadoutTab )
		self:registerEventHandler( "button_shoulderr", ToggleMPHud )
		self:registerEventHandler( "button_shoulderl", ToggleMLGIconClear )
		self:registerEventHandler( "button_right_trigger", ToggleLargeScoreboard )
	end
	return self
end

function OnRoundStart( f80_arg0, f80_arg1 )
	local f80_local0 = knownState.userPreferences
	if f80_local0.mapZoomMode then
		SetMapZoomMode( f80_arg0, f80_local0.mapZoomMode )
	else
		SetMapZoomMode( f80_arg0, mapZoomMode )
	end
	if f80_local0.view then
		ChangeView( f80_arg0, f80_local0.view )
	else
		ChangeView( f80_arg0, Views.FirstPerson )
	end
	if f80_local0.loadoutTab then
		SetLoadoutTab( f80_arg0, f80_local0.loadoutTab )
	else
		SetLoadoutTab( f80_arg0, loadoutTab )
	end
	if f80_local0.scoreMode then
		SetScoreMode( f80_arg0, f80_local0.scoreMode )
	else
		SetScoreMode( f80_arg0, scoreMode )
	end
	if Views.Free ~= currentView and f80_local0.clientNum then
		MLG.FollowClientnum( f80_local0.clientNum )
	else
		
	end
end

function UpdateTimer( f81_arg0, f81_arg1 )
	assert( f81_arg0.hudContainer )
	if Game.InKillCam() ~= knownState.isKillCam then
		knownState.isKillCam = Game.InKillCam()
		UpdateHUDVisibility( f81_arg0 )
		f81_arg0:processEvent( {
			name = "killcam_change",
			value = knownState.isKillCam
		} )
	end
	if not MLG.IsFollowing() then
		MLG.StartFollow()
	end
	local f81_local0 = MLG.GetFollowedClientNum() or -1
	if f81_local0 ~= followedClientNum then
		followedClientNum = f81_local0
		if followedClientNum >= 0 and not knownState.isKillCam then
			knownState.userPreferences.clientNum = f81_local0
		end
	end
end

function UpdateHUDVisibility( f82_arg0 )
	local f82_local0 = Engine.GetLuiRoot()
	local f82_local1 = f82_local0:AnyActiveMenusInStack()
	local f82_local2 = IsPostGame()
	local f82_local3 = knownState.isKillCam
	local f82_local4 = Game.GetPlayerClientnum() ~= Game.GetPlayerstateClientnum()
	local f82_local5 = f82_local2 or f82_local1 or f82_local3
	local f82_local6 = {
		[f82_arg0.largeScoreboard] = true,
		[f82_arg0.help] = currentOverlay ~= Overlays.None,
		[f82_arg0.largeMap] = mapZoomMode ~= MapZoomModes.Standard
	}
	local f82_local7 = f82_arg0.loadout
	local f82_local8 = f82_local4
	local f82_local9
	if currentView == Views.Free or mapZoomMode == MapZoomModes.FullScreen or loadoutTab == LoadoutTabs.None then
		f82_local9 = false
	else
		f82_local9 = f82_local8 and true
	end
	f82_local6[f82_local7] = f82_local9
	for f82_local16, f82_local11 in pairs( f82_local6 ) do
		if f82_local11 then
			f82_local11 = not f82_local5
		end
		if f82_local16.visible ~= f82_local11 then
			local f82_local12 = f82_local16
			local f82_local13 = f82_local16.animateToState
			local f82_local14
			if f82_local11 then
				f82_local14 = "default"
				if not f82_local14 then
				
				else
					local f82_local15
					if f82_local16 == f82_arg0.largeMap then
						f82_local15 = 0
						if not f82_local15 then
						
						else
							f82_local13( f82_local12, f82_local14, f82_local15 )
							f82_local16.visible = f82_local11
						end
					end
					f82_local15 = 150
				end
			end
			f82_local14 = "hidden"
		end
	end
end

function addWidget( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	f83_arg2.mlgHUD = f83_arg0
	local self = LUI.UIElement.new()
	self.id = "wrapper_for_" .. f83_arg2.id
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 1
	} )
	if f83_arg3 then
		self:animateToState( "hidden" )
	else
		self:animateToState( "default" )
	end
	self:addElement( f83_arg2 )
	if f83_arg1 then
		f83_arg0.static:addElement( self )
	else
		f83_arg0.scalable:addElement( self )
	end
	return self
end

function initControls( f84_arg0 )
	if f84_arg0.bind then
		f84_arg0.bind:close()
		f84_arg0.bind = nil
	end
	f84_arg0.bind = MLGHudControls()
	f84_arg0.bind.mlgHUD = f84_arg0
	f84_arg0:addElement( f84_arg0.bind )
end

function MLGHud( f85_arg0 )
	local self = LUI.UIElement.new()
	self.mlgHUD = self
	self.hudContainer = f85_arg0
	self.id = "MLGHud"
	self.addWidget = addWidget
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "init_hud", OnRoundStart )
	self:registerEventHandler( "update_mlg_hud_visibility", UpdateHUDVisibility )
	self:registerEventHandler( "non_empty_menu_stack", UpdateHUDVisibility )
	self:registerEventHandler( "empty_menu_stack", function ( element, event )
		UpdateHUDVisibility( element, event )
		initControls( self )
		self:processEvent( {
			name = "rebuild_help"
		} )
	end )
	self:registerDvarHandler( "ui_game_state", UpdateHUDVisibility )
	self.scalable = LUI.UIElement.new()
	self.scalable.id = "scalable"
	self:addElement( self.scalable )
	local f85_local1 = function ()
		local f87_local0, f87_local1, f87_local2, f87_local3 = GameX.GetAdjustedSafeZoneSize()
		local f87_local4 = 15
		self.scalable:registerAnimationState( "current", {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f87_local0 + f87_local4,
			top = f87_local1 + f87_local4,
			right = f87_local2 - f87_local4,
			bottom = f87_local3 - f87_local4
		} )
		self.scalable:animateToState( "current" )
	end
	
	self:registerEventHandler( "update_hud_margins", f85_local1 )
	f85_local1()
	self.static = LUI.UIElement.new()
	self.static.id = "static"
	self.static:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.static:animateToState( "default" )
	self:addElement( self.static )
	self.loadout = self:addWidget( true, loadout(), true )
	self.largeMap = self:addWidget( false, large_map() )
	self.largeScoreboard = self:addWidget( false, large_scoreboard() )
	self.help = self:addWidget( true, help() )
	initControls( self )
	local self = LUI.UITimer.new( 60, {
		name = "timer_update",
		dispatchChildren = true
	}, nil, false, element, false )
	self.id = "updateTimer"
	self:addElement( self )
	self:registerEventHandler( "timer_update", UpdateTimer )
	OnRoundStart( self )
	self:processEvent( {
		name = "playerstate_client_changed"
	} )
	local f85_local3 = table.insert
	local f85_local4 = Engine.GetLuiRoot()
	f85_local3( f85_local4.inputHungryElements, self )
	return self
end

LUI.MenuBuilder.registerType( "mlg_hud", MLGHud )
LockTable( _M )
