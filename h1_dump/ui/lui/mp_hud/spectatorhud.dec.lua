local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function UpdateSpectator( f1_arg0, f1_arg1 )
	f1_arg0:processEvent( {
		name = "refresh_playercard"
	} )
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	if f2_arg1.value > 0 and not Game.GetOmnvar( "ui_hide_spawn_timer" ) then
		f2_arg0:animateToState( "active", 0 )
		local f2_local0 = f2_arg0:getChildById( "timeUntilSpawnTimer" )
		f2_local0:setEndTime( f2_arg1.value )
		f2_local0:animateToState( "default", 0 )
	else
		f2_arg0:animateToState( "default", 0 )
	end
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getParent()
	f3_local0:animateToState( "default", 0 )
end

f0_local2 = function ()
	local f4_local0 = nil
	if GameX.IsRankedMatch() and not GameX.IsSplitscreen() then
		f4_local0 = -200
	elseif GameX.IsSplitscreen() then
		f4_local0 = -130
	else
		f4_local0 = -175
	end
	local self = LUI.UIElement.new()
	self.id = "timeUntilSpawn"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = f4_local0,
		top = 0,
		right = 0,
		left = 0,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local self = LUI.UICountdown.new( {} )
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 17,
		height = 20,
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		alignment = LUI.Alignment.Center,
		alpha = 1
	} )
	self.id = "timeUntilSpawnTimer"
	local self = LUI.UIText.new()
	self.id = "timeUntilSpawnText"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 0,
		height = 20,
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		alignment = LUI.Alignment.Center,
		alpha = 1
	} )
	self:setText( Engine.Localize( "MP_WAITING_TO_SPAWN" ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( self )
	self:addElement( self )
	self:animateToState( "default", 0 )
	self:animateToState( "default", 0 )
	self:animateToState( "default", 0 )
	self:registerOmnvarHandler( "ui_hide_spawn_timer", function ( f5_arg0, f5_arg1 )
		f0_local0( f5_arg0, {
			value = f5_arg1.value and Game.GetOmnvar( "ui_killcam_time_until_spawn" ) or 0
		} )
	end )
	self:registerOmnvarHandler( "ui_killcam_time_until_spawn", f0_local0 )
	self:registerEventHandler( "timeout", f0_local1 )
	return self
end

function spectatorUpdateSplitScreenCard( f6_arg0, f6_arg1 )
	local f6_local0 = CoD.TextSettings.TitleFontSmaller
	local f6_local1 = 14
	local f6_local2 = CoD.TextSettings.TitleFontSmaller
	local f6_local3 = 16
	local f6_local4 = Game.GetPlayerstateClientnum()
	if f6_arg0.currentClientNum ~= f6_local4 then
		local f6_local5 = nil
		if f6_local4 >= 0 then
			f6_local5 = Game.GetPlayerScoreInfo( f6_local4 )
		end
		if f6_local5 and f6_local4 ~= Game.GetPlayerClientnum() then
			f6_arg0:animateToState( "active" )
			if f6_local4 >= 0 and f6_local5 then
				local f6_local6 = Game.GetPlayerTeam( f6_local4 )
				local f6_local7 = Game.GetPlayerTeam()
				local f6_local8 = GameX.gameModeIsFFA()
				local f6_local9 = true
				if f6_local8 then
					local f6_local10 = Game.GetPlayerScoreInfoAtRank( f6_local7, Game.GetPlayerScoreRanking() )
					f6_local9 = f6_local10.name ~= splash_player_name
				else
					f6_local9 = f6_local7 ~= f6_local6
				end
				local f6_local11, f6_local10, f6_local12, f6_local13 = GetTextDimensions2( f6_local5.name, f6_local0.Font, f6_local1 )
				f6_arg0.gamerTag:setText( f6_local5.name )
				f6_arg0.gamerTag:setupAutoScaleText()
				local f6_local14 = f6_local12 - f6_local11
				local f6_local15 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
				f6_local15.width = f6_local14 + 13
				f6_local15.height = f6_local1
				local f6_local16 = nil
				if f6_arg0.rankField then
					local f6_local17 = Rank.GetRankDisplay( f6_local5.rank )
					f6_arg0.rankField:setText( f6_local17 )
					local f6_local18, f6_local19, f6_local20, f6_local21 = GetTextDimensions2( f6_local17, f6_local2.Font, f6_local3 )
					f6_local13 = f6_local21
					f6_local12 = f6_local20
					f6_local10 = f6_local19
					f6_local18 = f6_local12 - f6_local18
					f6_local16 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
					f6_local16.width = f6_local18
					f6_local16.height = f6_local3
					f6_local16.right = -(f6_local14 / 2) - 7
				end
				if f6_local9 then
					f6_local15.color = Colors.h1.enemy_red
					f6_arg0.gamerTag:registerAnimationState( "position", f6_local15 )
					f6_arg0.gamerTag:animateToState( "position" )
					if f6_arg0.rankField then
						f6_local16.color = Colors.h1.enemy_red
						f6_arg0.rankField:registerAnimationState( "position", f6_local16 )
						f6_arg0.rankField:animateToState( "position" )
					end
				else
					f6_local15.color = Colors.h1.ally_blue
					f6_arg0.gamerTag:registerAnimationState( "position", f6_local15 )
					f6_arg0.gamerTag:animateToState( "position" )
					if f6_arg0.rankField then
						f6_local16.color = Colors.h1.ally_blue
						f6_arg0.rankField:registerAnimationState( "position", f6_local16 )
						f6_arg0.rankField:animateToState( "position" )
					end
				end
			end
		else
			f6_arg0:animateToState( "default" )
		end
		f6_arg0.currentClientNum = f6_local4
	end
end

LUI.MenuBuilder.registerType( "spectatorHudDef", function ()
	local f7_local0 = GameX.IsSplitscreen()
	local self = LUI.UIElement.new()
	self.id = "spectatorHud"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self:animateToState( "default", 0 )
	self:registerEventHandler( "playerstate_client_changed", UpdateSpectator )
	local self = nil
	if f7_local0 then
		local self = CoD.TextSettings.TitleFontSmaller
		local f7_local4 = 14
		local f7_local5 = CoD.TextSettings.TitleFontSmaller
		local self = 16
		local f7_local7 = 273.33
		self = LUI.UIElement.new( {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = false,
			bottom = -95,
			left = -(f7_local7 / 2),
			height = 20,
			alpha = 0,
			width = f7_local7
		} )
		self:registerAnimationState( "active", {
			alpha = 1
		} )
		self:addElement( LUI.UIBackgroundPanel.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) ) )
		local f7_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
		f7_local8.font = self.Font
		f7_local8.height = f7_local4
		f7_local8.alignment = LUI.Alignment.Center
		local self = LUI.UIText.new( f7_local8 )
		self.gamerTag = self
		self:addElement( self )
		if GameX.IsRankedMatch() then
			local f7_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
			f7_local10.font = f7_local5.Font
			f7_local10.height = self
			f7_local10.alignment = LUI.Alignment.Center
			local self = LUI.UIText.new( f7_local10 )
			self.rankField = self
			self:addElement( self )
		end
		self:registerEventHandler( "refresh_playercard", spectatorUpdateSplitScreenCard )
	else
		local self = LUI.UIText.new()
		self.id = "spectatorTextId"
		self:setText( Engine.Localize( "@LUA_MENU_SPECTATING_CAPS" ) )
		local f7_local4 = CoD.TextSettings.SP_HudCarbon27
		self:registerAnimationState( "default", {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = false,
			rightAnchor = true,
			top = 2,
			height = f7_local4.Height * 0.6,
			font = f7_local4.Font,
			alignment = LUI.Alignment.Center,
			alpha = 1
		} )
		self:registerAnimationState( "faded", {
			alpha = 0
		} )
		self:registerEventHandler( "toggle_cam_header", function ( element, event )
			if event.scoreboardExists then
				element:animateToState( "default", 100 )
			else
				element:animateToState( "faded", 100 )
			end
		end )
		self:animateToState( "default", 0 )
		self:addElement( self )
		self = PlayerCard( GameX.IsRankedMatch() and -25 or 0 )
	end
	self:addElement( self )
	self:addElement( f0_local2() )
	self:addElement( LUI.mp_hud.Hints.spectatorControlsDef() )
	local f7_local4
	if Engine.IsGamepadEnabled() then
		f7_local4 = 30
		if not f7_local4 then
		
		else
			local f7_local5 = CoD.CreateState( nil, nil, -5, nil, CoD.AnchorTypes.Left )
			f7_local5.height = f7_local4
			f7_local5.width = 200
			f7_local5.font = CoD.TextSettings.TitleFontSmallBold.Font
			f7_local5.textstyle = CoD.TextStyle.Shadowed
			f7_local5.alignment = LUI.Alignment.Right
			local self = LUI.UIText.new( f7_local5 )
			self:addElement( self )
			local f7_local7 = CoD.CreateState( 5, nil, nil, nil, CoD.AnchorTypes.Right )
			f7_local7.height = f7_local4
			f7_local7.width = 200
			f7_local7.font = CoD.TextSettings.TitleFontSmallBold.Font
			f7_local7.textstyle = CoD.TextStyle.Shadowed
			f7_local7.alignment = LUI.Alignment.Left
			local self = LUI.UIText.new( f7_local7 )
			self:addElement( self )
			if Engine.IsGamepadEnabled() then
				self:setText( Engine.Localize( "@LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ) )
				self:setText( Engine.Localize( "@LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" ) )
			else
				self:setText( "^3" .. Engine.Localize( "@KEY_MOUSE1" ) .. "^7" )
				self:setText( "^3" .. Engine.Localize( "@KEY_MOUSE2" ) .. "^7" )
			end
			self:registerEventHandler( "button_config_updated", function ( element, event )
				if Engine.IsGamepadEnabled() then
					self:setText( Engine.Localize( "@LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ) )
					self:setText( Engine.Localize( "@LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" ) )
				else
					self:setText( "^3" .. Engine.Localize( "@KEY_MOUSE1" ) .. "^7" )
					self:setText( "^3" .. Engine.Localize( "@KEY_MOUSE2" ) .. "^7" )
				end
			end )
			self:processEvent( {
				name = "playerstate_client_changed"
			} )
			return self
		end
	end
	f7_local4 = 20
end )
LockTable( _M )
