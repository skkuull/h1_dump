local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AARScoreboard = InheritFrom( LUI.UIElement )
f0_local0, f0_local1 = nil
LUI.AARScoreboard.IsLocalPlayerIndex = 0
LUI.AARScoreboard.RANK_ICON = 1
LUI.AARScoreboard.RANK_NUM = 2
LUI.AARScoreboard.NAME = 3
LUI.AARScoreboard.SCORE = 4
LUI.AARScoreboard.KILLS = 5
LUI.AARScoreboard.DEATHS = 6
LUI.AARScoreboard.KDR = 7
LUI.AARScoreboard.ASSISTS = 8
LUI.AARScoreboard.EXTRASCORE0 = 9
LUI.AARScoreboard.EXTRASCORE1 = 10
function GenerateStats( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = AAR.GetPlayerStat( f1_arg1, "rank" )
	local f1_local1 = Rank.GetRankIcon( f1_local0, AAR.GetPlayerStat( f1_arg1, "prestige" ) )
	local f1_local2 = AAR.GetPlayerFullName( f1_arg1 )
	local f1_local3 = AAR.GetPlayerStat( f1_arg1, "score" )
	local f1_local4 = AAR.GetPlayerStat( f1_arg1, "kills" )
	local f1_local5 = AAR.GetPlayerStat( f1_arg1, "deaths" )
	local f1_local6 = AAR.GetPlayerStat( f1_arg1, "extrascore0" )
	local f1_local7 = AAR.GetPlayerStat( f1_arg1, "extrascore1" )
	local f1_local8 = string.format
	local f1_local9 = "%.2f"
	local f1_local10 = tostring
	if f1_local5 <= 0 then
		local f1_local11 = f1_local4
	end
	f1_local10 = {
		f1_local2,
		f1_local3,
		f1_local4,
		f1_local5,
		f1_local8( f1_local9, f1_local10( f1_local11 or f1_local4 / f1_local5 ) ),
		AAR.GetPlayerStat( f1_arg1, "assists" ),
		f1_local6,
		f1_local7
	}
	local f1_local12 = LUI.ScoreboardStats.CustomStats[f1_arg2]
	if f1_local12 then
		LUI.ScoreboardStats.CurrStats = f1_local12
	end
	local f1_local13 = {}
	local f1_local14 = LUI.AARScoreboard.IsLocalPlayerIndex
	local f1_local15 = f0_local0
	if f1_local15 then
		f1_local15 = f1_arg1 and f0_local0 == f1_arg1
	end
	f1_local13[f1_local14] = f1_local15
	f1_local13[LUI.AARScoreboard.RANK_ICON] = f1_local1
	f1_local13[LUI.AARScoreboard.RANK_NUM] = f1_local0
	for f1_local14 = 1, #LUI.ScoreboardStats.CurrStats.statValsIdx, 1 do
		local f1_local17 = f1_local14 + 2
		f1_local13[f1_local17] = f1_local10[LUI.ScoreboardStats.CurrStats.statValsIdx[f1_local14]]
		if f0_local1 == "hp" and f1_local17 == 7 then
			f1_local13[f1_local17] = FormatTimeMinutesSeconds( f1_local13[f1_local17] )
		end
	end
	table.insert( f1_arg0, f1_local13 )
end

LUI.AARScoreboard.new = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	if not f2_local0 then
		f2_local0 = Engine.GetFirstActiveController()
	end
	f0_local0 = AAR.GetLocalPlayer( f2_local0 )
	local f2_local1 = AAR.GetScoreboardType( f2_local0 )
	local f2_local2
	if f2_local1 == "allies" or f2_local1 == "axis" then
		f2_local2 = false
	else
		f2_local2 = true
	end
	local f2_local3 = AAR.GetGameMode( f2_local0 )
	local f2_local4
	if f2_local3 == nil then
		f2_local4 = "nil"
		if not f2_local4 then
		
		else
			local f2_local5 = {
				extended = false,
				gameModeKey = f2_local4,
				mapName = AAR.GetMapName( f2_local0 )
			}
			local f2_local6 = AAR.GetPlayerCount()
			f0_local1 = f2_local3
			local f2_local7 = {
				header = {
					teamScore = AAR.GetAlliesScore() or 0
				},
				teamStatVals = {}
			}
			local f2_local8 = {
				header = {
					teamScore = AAR.GetAxisScore() or 0
				},
				teamStatVals = {}
			}
			if f2_local6 then
				for f2_local9 = 1, f2_local6, 1 do
					local f2_local12 = AAR.GetPlayerId( f2_local1, f2_local9 - 1 )
					if f2_local12 >= 0 then
						if AAR.GetPlayerTeam( f2_local12 ) == "allies" or f2_local2 then
							GenerateStats( f2_local7.teamStatVals, f2_local12, f2_local3 )
						else
							GenerateStats( f2_local8.teamStatVals, f2_local12, f2_local3 )
						end
					end
				end
			end
			return LUI.MenuBuilder.BuildRegisteredType( "scoreboard", {
				showWinningIconBg = true,
				defAlpha = GameX.IsRankedMatch() and 0 or 1,
				winningTeam = AAR.GameVictor,
				header = f2_local5,
				teamLeft = f2_local7,
				teamRight = f2_local8,
				gameMode = f2_local3,
				gameModeName = f2_local4,
				controller = f2_local0
			} )
		end
	end
	f2_local4 = AAR.GetGameModeName( f2_local3 )
end

LUI.MenuBuilder.registerType( "aarScoreboard", LUI.AARScoreboard.new )
LockTable( _M )
