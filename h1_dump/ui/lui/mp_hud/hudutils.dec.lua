ScoreboardShared = {
	TeamScoreFont = CoD.TextSettings.BodyFont,
	TeamScoreFontBold = CoD.TextSettings.BodyFontBold,
	HeaderFont = CoD.TextSettings.BodyFontBold18,
	HeaderColor = {
		r = 1,
		g = 1,
		b = 1
	},
	HeaderAlpha = 0.5,
	CellFont = CoD.TextSettings.TitleFontTinyBold,
	CellColor = {
		r = 1,
		g = 1,
		b = 1
	},
	CellAlpha = 1
}
SplashTable = {
	File = "mp/splashTable.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		Desc = 2,
		Image = 3,
		Duration = 4,
		Red = 5,
		Green = 6,
		Blue = 7,
		Alpha = 8,
		Sound = 9,
		DontKnow = 10,
		SplashType = 11,
		FrontendImage = 12
	}
}
IntelChallengesTable = {
	File = "mp/intelChallenges.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		Reward = 2,
		Target = 3,
		Available = 4
	}
}
KillCamAbilitiesBitMaskTable = {
	File = "mp/killCamAbilitiesBitMaskTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		BitMask = 2
	}
}
XPEventTable = {
	File = "mp/xp_event_table.csv",
	Cols = {
		Ref = 0,
		PlaySplash = 1,
		GiveScore = 2,
		ScoreCallout = 3
	}
}
WeaponClasses = {
	Rifle = 0,
	Sniper = 1,
	MG = 2,
	SMG = 3,
	Spread = 4,
	Pistol = 5,
	Grenade = 6,
	RocketLauncher = 7,
	Turret = 8,
	ThrowingKnife = 9,
	NonPlayer = 10,
	Item = 11,
	Cone = 12,
	Beam = 13,
	Shield = 14,
	Hover = 15,
	Cloak = 16,
	Ping = 17,
	Repulsor = 18,
	Health = 20,
	Mute = 21,
	Underwater = 22
}
WeaponOverlaysTable = {
	File = "mp/weaponOverlays.csv",
	Cols = {
		Index = 0,
		SimpleName = 1,
		BackgroundBlur = 2,
		Reticule = 3,
		Vignette = 4,
		TargetMarker = 5,
		BackgroundOverlay = 6
	}
}
function ExtractClanTag( f1_arg0 )
	local f1_local0 = ""
	local f1_local1 = f1_arg0
	if Engine.IsConsoleGame() and string.sub( f1_local1, 1, 1 ) == "[" then
		local f1_local2 = string.find( f1_local1, "]" )
		if f1_local2 then
			f1_local0 = string.sub( f1_local1, 1, f1_local2 )
			f1_local1 = string.sub( f1_local1, f1_local2 + 1 )
		end
	end
	return f1_local0, f1_local1
end

function IsGameTypeRoundBased( f2_arg0 )
	assert( f2_arg0 )
	return Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f2_arg0, GameTypesTable.Cols.RoundBased ) == "1"
end

function IsMLGMatch()
	return Engine.GetDvarBool( "xblive_competitionmatch" )
end

function ScoreboardTruncate( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = ScoreboardShared.CellFont
	local f4_local1, f4_local2, f4_local3, f4_local4 = GetTextDimensions( f4_arg0, f4_local0.Font, f4_local0.Height )
	if f4_arg1 < f4_local3 then
		f4_arg0 = string.sub( f4_arg0, 1, f4_arg2 ) .. Engine.Localize( "@MENU_ELLIPSIS" )
	end
	return f4_arg0
end

function GetMapName()
	local f5_local0 = ""
	local f5_local1 = Engine.GetDvarString( "ui_mapname" )
	if f5_local1 then
		f5_local0 = Game.GetMapDisplayName( f5_local1 )
	end
	return f5_local0
end

function GetGameModeName()
	local f6_local0 = nil
	local f6_local1 = Engine.GetOnlineGame()
	if f6_local1 then
		f6_local1 = not Engine.GetDvarBool( "xblive_privatematch" )
	end
	if f6_local1 then
		f6_local0 = Playlist.GetPlaylistName( Playlist.GetPlaylistIdFromNum( Engine.GetDvarInt( "playlist" ) ) )
	else
		f6_local0 = Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, GameX.GetGameMode(), GameTypesTable.Cols.Name ) )
	end
	return f6_local0
end

function GetEnemyTeam( f7_arg0 )
	if f7_arg0 == Teams.free then
		return Teams.free
	elseif f7_arg0 == Teams.allies then
		return Teams.axis
	elseif f7_arg0 == Teams.axis then
		return Teams.allies
	else
		assert( false, "Unexpected team" )
	end
end

function CanSwitchTeamsInThisGamemode( f8_arg0 )
	return "1" == Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f8_arg0, GameTypesTable.Cols.TeamChoice )
end

function NeverAllowChangeTeams()
	local f9_local0
	if GameX.GetGameMode() ~= "aliens" and GameX.IsRankedMatch() ~= true then
		f9_local0 = MLG.IsMLGSpectator()
	else
		f9_local0 = true
	end
	return f9_local0
end

function CanShowChangeTeamMenuOption()
	local f10_local0
	if not CanSwitchTeamsInThisGamemode( GameX.GetGameMode() ) then
		f10_local0 = IsSpectatorAllowed()
		if f10_local0 then
		
		else
			return f10_local0
		end
	end
	f10_local0 = not NeverAllowChangeTeams()
end

function AreKillstreaksEquipped()
	for f11_local0 = 0, 4, 1 do
		if Game.GetOmnvar( "ks_icon" .. tostring( f11_local0 ) ) ~= 0 then
			return true
		end
	end
	return false
end

function HUDSpacer( f12_arg0 )
	local f12_local0 = LUI.UIImage.new
	local f12_local1 = {}
	local f12_local2 = RegisterMaterial
	local f12_local3
	if f12_arg0 then
		f12_local3 = "hud_divider_vertical"
		if not f12_local3 then
		
		else
			f12_local1.material = f12_local2( f12_local3 )
			f12_local1.topAnchor = f12_arg0
			f12_local1.bottomAnchor = f12_arg0
			f12_local1.leftAnchor = not f12_arg0
			f12_local1.rightAnchor = not f12_arg0
			f12_local1.top = 0
			if f12_arg0 then
				f12_local2 = 0
				if not f12_local2 then
				
				else
					f12_local1.bottom = f12_local2
					f12_local1.left = 0
					if not f12_arg0 then
						f12_local2 = 0
						if not f12_local2 then
						
						else
							f12_local1.right = f12_local2
							if f12_arg0 then
								f12_local2 = 2
								if not f12_local2 then
								
								else
									f12_local1.width = f12_local2
									if not f12_arg0 then
										f12_local2 = 2
										if not f12_local2 then
										
										else
											f12_local1.height = f12_local2
											f12_local1.alpha = 0.15
											f12_local0 = f12_local0( f12_local1 )
											f12_local0.id = "spacer"
											return f12_local0
										end
									end
									f12_local2 = nil
								end
							end
							f12_local2 = nil
						end
					end
					f12_local2 = nil
				end
			end
			f12_local2 = nil
		end
	end
	f12_local3 = "hud_divider_horizontal"
end

function UpdatePlayerCard( f13_arg0, f13_arg1 )
	local f13_local0 = Game.GetPlayerstateClientnum()
	if f13_arg0.currentClientNum ~= f13_local0 then
		local f13_local1 = nil
		if f13_local0 >= 0 then
			f13_local1 = Game.GetPlayerScoreInfo( f13_local0 )
		end
		if f13_local1 and Game.GetPlayerClientnum() ~= f13_local0 then
			f13_arg0:animateToState( "active" )
			f13_arg0:processEvent( {
				name = "update_playercard_for_clientnum",
				clientNum = f13_local0
			} )
		else
			f13_arg0:animateToState( "default" )
		end
		f13_arg0.currentClientNum = f13_local0
	end
end

function PlayerCard( f14_arg0 )
	local f14_local0 = LUI.MenuBuilder.BuildRegisteredType( "playercard" )
	local f14_local1 = LUI.Playercard.Width
	local f14_local2 = LUI.Playercard.Height
	if not f14_arg0 then
		f14_arg0 = 0
	end
	local self = LUI.UIElement.new()
	self.id = "spectatorPlayerCard"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		bottom = -100 + f14_arg0,
		left = -f14_local1 / 2,
		height = f14_local2,
		alpha = 0,
		width = f14_local1
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "refresh_playercard", UpdatePlayerCard )
	self:addElement( f14_local0 )
	return self
end

function HudGetRoundBestStat( f15_arg0 )
	return Engine.GetPlayerData( -1, CoD.StatsGroup.Common, "round", "awards", f15_arg0 )
end

function HudGetPersonalBestStat( f16_arg0 )
	return Engine.GetPlayerData( -1, CoD.StatsGroup.Common, "bests", f16_arg0 )
end

function SanitizeTeamAndRank( f17_arg0, f17_arg1 )
	local f17_local0 = Game.GetNumPlayersOnTeam( f17_arg0 )
	if f17_arg1 <= 0 or f17_local0 < f17_arg1 then
		if Game.GetNumPlayersOnTeam( GetEnemyTeam( f17_arg0 ) ) > 0 then
			f17_local0 = Game.GetNumPlayersOnTeam( GetEnemyTeam( f17_arg0 ) )
		end
		if f17_arg1 <= 0 then
			f17_arg1 = f17_local0
		else
			f17_arg1 = 1
		end
	end
	return f17_arg0, f17_arg1
end

function IsUsingLeftyButtonsLayout()
	if not CoD.UsingController() then
		return false
	else
		local f18_local0 = {
			buttons_lefty = true,
			buttons_lefty_alt = true
		}
		local f18_local1 = Engine.GetLuiRoot()
		assert( f18_local1 )
		assert( f18_local1.m_controllerIndex )
		return f18_local0[Engine.GetProfileData( "gpadButtonsConfig" )] ~= nil
	end
end

function GetPrivateMatchSpectateAllowedLevel()
	local f19_local0 = nil
	if MatchRules.IsUsingMatchRulesData() then
		f19_local0 = MatchRules.GetData( "commonOption", "spectateModeAllowed" )
	end
	if Engine.GetDvarBool( "xblive_competitionmatch" ) and Engine.GetDvarBool( "xblive_privatematch" ) then
		f19_local0 = 0
	end
	if f19_local0 == nil then
		f19_local0 = Engine.GetDvarInt( "scr_game_spectatetype" )
	end
	return f19_local0
end

function IsSpectatorAllowed()
	local f20_local0 = GetPrivateMatchSpectateAllowedLevel()
	if f20_local0 == 2 then
		return true
	elseif f20_local0 == 1 then
		if GameX.gameModeIsFFA() then
			return true
		end
		local f20_local1 = Game.GetOmnvar( "ui_team_selected" )
		if f20_local1 == 1 or f20_local1 == 2 then
			return true
		end
	end
	return false
end

