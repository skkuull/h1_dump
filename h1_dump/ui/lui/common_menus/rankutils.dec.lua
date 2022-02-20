Rank = {
	CustomRankIconBits = {
		MasterPrestige = bit( 1 )
	}
}
RankTable = {
	File = "mp/rankTable.csv",
	AlienFile = "mp/alien/rankTable.csv",
	Cols = {
		RankId = 0,
		Rank = 1,
		MinXp = 2,
		XpToNextLevel = 3,
		ShortRankName = 4,
		FullRankName = 5,
		RankIcon = 6,
		MaxXp = 7,
		Level = 13,
		DisplayLevel = 14,
		InGameRank = 16,
		UnlockString = 17
	}
}
RankIconTable = {
	File = "mp/rankIconTable.csv",
	AlienFile = "mp/alien/rankIconTable.csv",
	Cols = {
		RankId = 0,
		Standard = 1,
		Prestige1 = 2
	}
}
local f0_local0 = 0
Rank.GetMaxPrestigeLevel = function ()
	if f0_local0 == 0 then
		f0_local0 = tonumber( Engine.TableLookup( RankIconTable.File, 0, "maxPrestige", 1 ) )
	end
	return f0_local0
end

Rank.GetDefaultMaxRank = function ()
	local f2_local0 = tonumber( Engine.TableLookup( RankTable.File, 0, "maxrank", 1 ) )
	assert( f2_local0 ~= nil, "Rank.GetMaxRank() : Could not read max rank (MP)" )
	return f2_local0
end

Rank.GetMaxRank = function ( f3_arg0 )
	local f3_local0 = nil
	if f3_arg0 == Rank.GetMaxPrestigeLevel() then
		f3_local0 = tonumber( Engine.TableLookup( RankTable.File, 0, "maxrankformaxprestige", 1 ) )
	else
		f3_local0 = tonumber( Engine.TableLookup( RankTable.File, 0, "maxrank", 1 ) )
	end
	return f3_local0
end

Rank.GetRankDisplay = function ( f4_arg0 )
	local f4_local0 = nil
	if Rank.GetDefaultMaxRank() < f4_arg0 then
		if f4_arg0 == tonumber( Engine.TableLookup( RankTable.File, 0, "maxrankformaxprestige", 1 ) ) then
			f4_local0 = Engine.Localize( "@LUA_MENU_LEVEL_1000" )
		else
			f4_local0 = tostring( f4_arg0 + 1 )
		end
	else
		f4_local0 = Engine.TableLookup( RankTable.File, RankTable.Cols.RankId, f4_arg0, RankTable.Cols.DisplayLevel )
	end
	return f4_local0
end

Rank.GetCustomRankDisplay = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = nil
	if not f5_arg2 or f5_arg2 == CoD.PlayMode.Core or f5_arg2 == CoD.PlayMode.SquadVsSquad then
		f5_local0 = Rank.GetRankDisplay( f5_arg0, optCoDPlayMode )
	else
		DebugPrint( "[WARNING] Rank.GetCustomRankDisplay() : Unsupported CodPlayMode [" .. f5_arg2 .. "]!" )
		f5_local0 = ""
	end
	return f5_local0
end

Rank.GetRankMinXP = function ( f6_arg0, f6_arg1 )
	local f6_local0 = nil
	if not f6_arg1 or f6_arg1 == CoD.PlayMode.Core or f6_arg1 == CoD.PlayMode.SquadVsSquad then
		local f6_local1 = Rank.GetDefaultMaxRank()
		if f6_local1 < f6_arg0 then
			f6_local0 = Rank.GetRankMaxXP( f6_local1, 0, f6_arg1 ) + (f6_arg0 - f6_local1 - 1) * Rank.GetRankXPToNext( f6_local1, f6_arg1 )
		else
			f6_local0 = tonumber( Engine.TableLookup( RankTable.File, RankTable.Cols.RankId, f6_arg0, RankTable.Cols.MinXp ) )
		end
	else
		DebugPrint( "[WARNING] Rank.GetRankMinXP() : Unsupported CodPlayMode [" .. f6_arg1 .. "]!" )
		f6_local0 = 0
	end
	return f6_local0
end

Rank.GetRankMaxXP = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = nil
	if not f7_arg2 or f7_arg2 == CoD.PlayMode.Core or f7_arg2 == CoD.PlayMode.SquadVsSquad then
		local f7_local1 = Rank.GetDefaultMaxRank()
		if f7_local1 < f7_arg0 then
			f7_local0 = Rank.GetRankMaxXP( f7_local1, 0, f7_arg2 ) + (f7_arg0 - f7_local1) * Rank.GetRankXPToNext( f7_local1, f7_arg2 )
		else
			f7_local0 = tonumber( Engine.TableLookup( RankTable.File, RankTable.Cols.RankId, f7_arg0, RankTable.Cols.MaxXp ) )
			assert( f7_local0 ~= nil, "Rank.GetRankMaxXP() : Could not read max XP for rank (MP)" )
		end
	else
		DebugPrint( "[WARNING] Rank.GetRankMaxXP() : Unsupported CodPlayMode [" .. f7_arg2 .. "]!" )
		f7_local0 = 0
	end
	return f7_local0
end

Rank.GetRankXPToNext = function ( f8_arg0, f8_arg1 )
	local f8_local0 = nil
	if not f8_arg1 or f8_arg1 == CoD.PlayMode.Core or f8_arg1 == CoD.PlayMode.SquadVsSquad then
		local f8_local1 = Rank.GetDefaultMaxRank()
		if f8_local1 < f8_arg0 then
			f8_local0 = Rank.GetRankXPToNext( f8_local1, f8_arg1 )
		else
			f8_local0 = tonumber( Engine.TableLookup( RankTable.File, RankTable.Cols.RankId, f8_arg0, RankTable.Cols.XpToNextLevel ) )
		end
	else
		DebugPrint( "[WARNING] Rank.GetRankXPToNext() : Unsupported CodPlayMode [" .. f8_arg1 .. "]!" )
		f8_local0 = 0
	end
	return f8_local0
end

Rank.GetCustomRankIcons = function ( f9_arg0, f9_arg1 )
	local f9_local0 = 0
	if f9_arg0 == Rank.GetMaxPrestigeLevel() and Rank.GetRankMinXP( Rank.GetMaxRank( f9_arg0 ) ) <= f9_arg1 then
		f9_local0 = setbit( f9_local0, Rank.CustomRankIconBits.MasterPrestige )
	end
	return f9_local0
end

Rank.GetRankIcon = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	if not f10_arg3 or f10_arg3 == CoD.PlayMode.Core or f10_arg3 == CoD.PlayMode.SquadVsSquad then
		local f10_local0 = Rank.GetMaxPrestigeLevel()
		if f10_arg1 == f10_local0 then
			if f10_arg2 == nil then
				f10_arg2 = Rank.GetCustomRankIcons( f10_arg1, Rank.GetRankMinXP( f10_arg0 ) )
			end
			if hasbit( f10_arg2, Rank.CustomRankIconBits.MasterPrestige ) then
				return Engine.TableLookup( RankIconTable.File, 0, "masterPrestigeIcon", 1 )
			end
		end
		local f10_local1 = Rank.GetDefaultMaxRank()
		if f10_arg1 == f10_local0 and f10_local1 < f10_arg0 then
			return Engine.TableLookup( RankIconTable.File, RankIconTable.Cols.RankId, f10_local1, RankIconTable.Cols.Standard + f10_arg1 )
		else
			return Engine.TableLookup( RankIconTable.File, RankIconTable.Cols.RankId, f10_arg0, RankIconTable.Cols.Standard + f10_arg1 )
		end
	else
		DebugPrint( "[WARNING] Rank.GetRankIcon() : Unsupported CodPlayMode [" .. f10_arg3 .. "]!" )
		return ""
	end
end

Rank.GetFullRank = function ( f11_arg0, f11_arg1 )
	local f11_local0 = nil
	if not f11_arg1 or f11_arg1 == CoD.PlayMode.Core or f11_arg1 == CoD.PlayMode.SquadVsSquad then
		if f11_arg0 > Rank.GetDefaultMaxRank() then
			f11_local0 = Engine.Localize( "@RANK_PARAGON_FULL" )
		else
			f11_local0 = Engine.Localize( "@" .. Engine.TableLookup( RankTable.File, RankTable.Cols.RankId, f11_arg0, RankTable.Cols.FullRankName ) )
		end
	else
		DebugPrint( "[WARNING] Rank.GetFullRank() : Unsupported CodPlayMode [" .. f11_arg1 .. "]!" )
		f11_local0 = ""
	end
	return f11_local0
end

