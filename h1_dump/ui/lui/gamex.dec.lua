if not GameX then
	GameX = {}
end
GameX.GetPlayerOpposingTeam = function ( f1_arg0 )
	local f1_local0 = f1_arg0
	if not f1_local0 then
		f1_local0 = Game.GetPlayerTeam()
		if GameX.IsSpectatingNotOnTeam( f1_local0 ) then
			f1_local0 = spectatorFakeTeam
		end
	end
	local f1_local1 = otherTeamLookup[f1_local0]
	if not f1_local1 then
		f1_local1 = 0
	end
	return f1_local1
end

GameX.gameModeIsFFA = function ( f2_arg0 )
	local f2_local0 = f2_arg0 or Engine.GetDvarString( "ui_gametype" )
	if f2_local0 == "dm" or f2_local0 == "adrn" or f2_local0 == "mugger" or f2_local0 == "assn" or f2_local0 == "fo" or f2_local0 == "sna" or f2_local0 == "sotf_ffa" or f2_local0 == "gun" then
		return true
	else
		return false
	end
end

GameX.GetTeamName = function ( f3_arg0 )
	local f3_local0 = {
		"free",
		"axis",
		"allies"
	}
	return f3_local0[f3_arg0 + 1]
end

GameX.GetFactionName = function ( f4_arg0 )
	local f4_local0 = {
		"free",
		"russian",
		"sas"
	}
	return f4_local0[f4_arg0 + 1]
end

GameX.IsSpectatingNotOnTeam = function ( f5_arg0 )
	local f5_local0
	if not (Game.IsSpectating() or Game.GetOmnvar( "ui_session_state" ) == "spectator") or (f5_arg0 or Game.GetPlayerTeam()) ~= Teams.spectator then
		f5_local0 = false
	else
		f5_local0 = true
	end
	return f5_local0
end

GameX.IsHardcoreMode = function ()
	return Engine.GetDvarBool( "g_hardcore" )
end

GameX.IsRankedMatch = function ()
	local f7_local0 = Engine.GetOnlineGame()
	if f7_local0 then
		f7_local0 = not Engine.GetDvarBool( "xblive_privatematch" )
	end
	return f7_local0
end

GameX.GetGameMode = function ()
	return Engine.GetDvarString( "ui_gametype" )
end

GameX.GetNumPlayerSlotsForFinalScoreboard = function ( f9_arg0, f9_arg1 )
	local f9_local0 = GameX.IsRankedMatch() and Engine.GetDvarInt( "party_maxplayers" ) or 0
	local f9_local1 = Game.GetNumPlayersOnTeam( f9_arg0 )
	if GameX.gameModeIsFFA( f9_arg1 ) then
		assert( f9_arg0 == Teams.free )
		return math.max( 1, math.max( f9_local1, f9_local0 ) )
	end
	local f9_local2 = assert
	local f9_local3
	if f9_arg0 ~= Teams.axis and f9_arg0 ~= Teams.allies then
		f9_local3 = false
	else
		f9_local3 = true
	end
	f9_local2( f9_local3 )
	return math.max( 1, math.max( f9_local1, f9_local0 / 2 ) )
end

GameX.GetPlayerScoreInfoAtRankForGameMode = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = Game.GetPlayerScoreInfoAtRank( f10_arg0, f10_arg1 )
	if not f10_local0 then
		return nil
	else
		local f10_local1 = 99999
		f10_local0.score = math.min( f10_local1, f10_local0.score )
		f10_local0.kills = math.min( f10_local1, f10_local0.kills )
		f10_local0.deaths = math.min( f10_local1, f10_local0.deaths )
		f10_local0.assists = math.min( f10_local1, f10_local0.assists )
		f10_local0.extrascore0 = math.min( f10_local1, f10_local0.extrascore0 )
		GameX.maxScoreStat = f10_local1
		return f10_local0
	end
end

GameX.GetScreenDims = function ()
	local f11_local0 = {}
	local f11_local1 = Engine.GetLuiRoot()
	f11_local0 = f11_local1:getCurrentGlobalRect()
	return f11_local0[3], f11_local0[4]
end

GameX.GetScreenWidth = function ()
	local f12_local0 = {}
	local f12_local1 = Engine.GetLuiRoot()
	f12_local0 = f12_local1:getCurrentGlobalRect()
	return f12_local0[3]
end

GameX.GetScreenHeight = function ()
	local f13_local0 = {}
	local f13_local1 = Engine.GetLuiRoot()
	f13_local0 = f13_local1:getCurrentGlobalRect()
	return f13_local0[4]
end

GameX.GetSafeZoneSize = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg0 or SliderBounds.HorzMargin.Min
	local f14_local1 = f14_arg1 or SliderBounds.VertMargin.Min
	local f14_local2, f14_local3 = GameX.GetScreenDims()
	local f14_local4 = f14_local2 * (1 - f14_local0) / 2
	local f14_local5 = f14_local3 * (1 - f14_local1) / 2
	local f14_local6 = Engine.SplitscreenPlayerCount()
	assert( f14_local6 <= MaxLocalClients )
	assert( f14_local6 <= 4 )
	if f14_local6 == 2 then
		f14_local5 = f14_local5 * 2
		local f14_local7 = Engine.GetCurrentLocalClient()
		assert( f14_local7 and f14_local7 < MaxLocalClients )
		if f14_local7 == 0 then
			return f14_local4, f14_local5, -f14_local4, 0
		else
			return f14_local4, 0, -f14_local4, -f14_local5
		end
	elseif f14_local6 == 3 or f14_local6 == 4 then
		f14_local5 = f14_local5 * 2
		f14_local4 = f14_local4 * 2
		local f14_local7 = f14_local2 / 2
		local f14_local8 = f14_local3 / 2
		local f14_local9 = Engine.GetCurrentLocalClient()
		assert( f14_local9 and f14_local9 < MaxLocalClients )
		if f14_local9 == 0 then
			return f14_local4, f14_local5, 0, 0
		elseif f14_local9 == 1 then
			return 0, f14_local5, -f14_local4, 0
		elseif f14_local9 == 2 then
			if f14_local6 == 3 then
				return 0, 0, 0, -f14_local5
			else
				return f14_local4, 0, 0, -f14_local5
			end
		else
			return 0, 0, -f14_local4, -f14_local5
		end
	else
		return f14_local4, f14_local5, -f14_local4, -f14_local5
	end
end

GameX.GetAdjustedSafeZoneSize = function ()
	return GameX.GetSafeZoneSize( Engine.GetDvarFloat( "safeArea_adjusted_horizontal" ), Engine.GetDvarFloat( "safeArea_adjusted_vertical" ) )
end

GameX.IsSplitscreen = function ()
	local f16_local0 = 0
	if Engine.SplitscreenPlayerCount and not Engine.InFrontend() then
		f16_local0 = Engine.SplitscreenPlayerCount()
	end
	local f16_local1 = assert
	local f16_local2
	if f16_local0 and f16_local0 > MaxLocalClients then
		f16_local2 = false
	else
		f16_local2 = true
	end
	f16_local1( f16_local2 )
	return f16_local0 > 1
end

OptionState = {
	Locked = false
}
GameX.IsOptionStateLocked = function ()
	return OptionState.Locked
end

GameX.SetOptionState = function ( f18_arg0 )
	OptionState.Locked = f18_arg0
end

GameX.UsesFakeLoadout = function ()
	local f19_local0 = GameX.GetGameMode()
	local f19_local1
	if f19_local0 ~= "sotf" and f19_local0 ~= "sotf_ffa" and f19_local0 ~= "gun" then
		f19_local1 = false
	else
		f19_local1 = true
	end
	return f19_local1
end

