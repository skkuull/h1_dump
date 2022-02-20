local f0_local0 = function ( f1_arg0, f1_arg1 )
	Engine.SetPlayerDataEx( f1_arg0, f1_arg1, "challengeState", "ch_prestige", 1 )
	Engine.SetPlayerDataEx( f1_arg0, f1_arg1, "challengeProgress", "ch_prestige", 0 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 5
	Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "numTrends", 0 )
	for f2_local1 = 1, f2_local0, 1 do
		Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "trend", f2_local1 - 1, "timestamp", 0 )
		Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "trend", f2_local1 - 1, "kills", 0 )
		Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "trend", f2_local1 - 1, "deaths", 0 )
	end
	Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "war", "numMatches", 0 )
	Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "war", "deaths", 0 )
	Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "war", "kills", 0 )
	Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "war", "bestkdr", 0 )
	Engine.SetPlayerData( f2_arg0, f2_arg1, "combatRecord", "war", "mostkills", 0 )
	Engine.SetPlayerDataEx( f2_arg0, f2_arg1, "combatRecord", "ctf", "numMatches", 0 )
	Engine.SetPlayerDataEx( f2_arg0, f2_arg1, "combatRecord", "ctf", "captures", 0 )
	Engine.SetPlayerDataEx( f2_arg0, f2_arg1, "combatRecord", "ctf", "returns", 0 )
	Engine.SetPlayerDataEx( f2_arg0, f2_arg1, "combatRecord", "ctf", "mostcaptures", 0 )
	Engine.SetPlayerDataEx( f2_arg0, f2_arg1, "combatRecord", "ctf", "mostreturns", 0 )
end

function InitPlayerDataExtended( f3_arg0, f3_arg1 )
	DebugPrint( "InitPlayerDataExtended" )
	local f3_local0 = f3_arg1.controller or 0
	for f3_local1 = CoD.StatsGroup.Ranked, CoD.StatsGroup.Private, 1 do
		local f3_local4 = 12
		local f3_local5 = "customClasses"
		if f3_local1 == CoD.StatsGroup.Private then
			f3_local5 = "privateMatchCustomClasses"
		end
		local f3_local6 = 0
		local f3_local7 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutPrimary", f3_local4 )
		local f3_local8 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutPrimary" .. "Camo", f3_local4 )
		for f3_local9 = 0, 49, 1 do
			Engine.SetPlayerDataExtendedEx( f3_local0, f3_local1, f3_local5, f3_local9, "weaponSetups", f3_local6, "weapon", f3_local7 )
			Engine.SetPlayerDataExtendedEx( f3_local0, f3_local1, f3_local5, f3_local9, "weaponSetups", f3_local6, "camo", f3_local8 )
			Engine.SetPlayerDataExtendedEx( f3_local0, f3_local1, f3_local5, f3_local9, "weaponSetups", f3_local6, "reticle", "none" )
		end
		f3_local6 = 1
		f3_local7 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutSecondary", f3_local4 )
		f3_local8 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutSecondary" .. "Camo", f3_local4 )
		for f3_local9 = 0, 49, 1 do
			Engine.SetPlayerDataExtendedEx( f3_local0, f3_local1, f3_local5, f3_local9, "weaponSetups", f3_local6, "weapon", f3_local7 )
			Engine.SetPlayerDataExtendedEx( f3_local0, f3_local1, f3_local5, f3_local9, "weaponSetups", f3_local6, "camo", f3_local8 )
			Engine.SetPlayerDataExtendedEx( f3_local0, f3_local1, f3_local5, f3_local9, "weaponSetups", f3_local6, "reticle", "none" )
		end
	end
end

function ResetEmptyLoadouts( f4_arg0, f4_arg1 )
	DebugPrint( "ResetEmptyLoadouts" )
	local f4_local0 = f4_arg1.controller or 0
	local f4_local1 = CoD.StatsGroup.Ranked
	local f4_local2 = 12
	local f4_local3 = "customClasses"
	local f4_local4 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutPrimary", f4_local2 )
	local f4_local5 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutSecondary", f4_local2 )
	local f4_local6 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutEquipment", f4_local2 )
	local f4_local7 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutOffhand", f4_local2 )
	local f4_local8 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutPerk1", f4_local2 )
	local f4_local9 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutPerk2", f4_local2 )
	local f4_local10 = Engine.TableLookup( "mp/classTable.csv", 0, "loadoutPerk3", f4_local2 )
	local f4_local11 = false
	for f4_local12 = 0, 74, 1 do
		if Engine.GetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "weaponSetups", 0, "weapon" ) == "none" then
			f4_local11 = true
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "weaponSetups", 0, "weapon", f4_local4 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "weaponSetups", 1, "weapon", f4_local5 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "equipment", 0, f4_local6 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "equipment", 1, f4_local7 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "perkSlots", 0, f4_local8 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "perkSlots", 1, f4_local9 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "perkSlots", 2, f4_local10 )
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "name", Engine.Localize( "@CLASS_SLOT_NUMBER", f4_local12 + 1 ) )
		end
	end
	if f4_local11 then
		for f4_local12 = 5, 19, 1 do
			Engine.SetPlayerData( f4_local0, f4_local1, f4_local3, f4_local12, "name", Engine.Localize( "@CLASS_SLOT_NUMBER", f4_local12 + 1 ) )
		end
	end
end

