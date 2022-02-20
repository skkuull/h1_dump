StandardChallengeColumns = {
	Ref = 0,
	Name = 1,
	Desc = 2,
	Label = 3,
	Weight = 4,
	Filter = 5,
	UnlockLevel = 6,
	ChallengeUnlock = 7,
	TierUnlock = 8,
	PrestigeShopUnlock = 9,
	Target1 = 10,
	XP1 = 11,
	Target2 = 12,
	XP2 = 13,
	Target3 = 14,
	XP3 = 15,
	Target4 = 16,
	XP4 = 17,
	Target5 = 18,
	XP5 = 19,
	Target6 = 20,
	XP6 = 21,
	Target7 = 22,
	XP7 = 23,
	Target8 = 24,
	XP8 = 25,
	Target9 = 26,
	XP9 = 27,
	ChallengeID = 28,
	ItemGUID1 = 29,
	ItemGUID2 = 30,
	ItemGUID3 = 31,
	ItemGUID4 = 32,
	ItemGUID5 = 33,
	ItemGUID6 = 34,
	ItemGUID7 = 35,
	ItemGUID8 = 36,
	ItemGUID9 = 37,
	ItemGUID10 = 38,
	ItemGUID11 = 39,
	ItemGUID12 = 40,
	ItemGUID13 = 41,
	ItemGUID14 = 42,
	Category = 46,
	PrestigeUnlock = 47
}
AllChallengesTable = {
	File = "mp/allChallengesTable.csv",
	Cols = StandardChallengeColumns
}
ChallengeCategoryNavTable = {
	File = "mp/challengeCategoryNav.csv",
	Cols = {
		Ref = 0,
		Parent = 1,
		Name = 2,
		Filter = 3,
		Image1 = 4,
		Image1Width = 5,
		Image1Height = 6,
		Image2 = 7,
		Image2Width = 8,
		Image2Height = 9,
		HideWhenEmpty = 10,
		MenuTitle = 11
	}
}
TierStrings = {
	"LUA_MENU_ROMAN_ONE",
	"LUA_MENU_ROMAN_TWO",
	"LUA_MENU_ROMAN_THREE",
	"LUA_MENU_ROMAN_FOUR",
	"LUA_MENU_ROMAN_FIVE",
	"LUA_MENU_ROMAN_SIX",
	"LUA_MENU_ROMAN_SEVEN",
	"LUA_MENU_ROMAN_EIGHT",
	"LUA_MENU_ROMAN_NINE"
}
ChallengeStatus = {
	Locked = {
		text = "MENU_LOCKED",
		color = Colors.red,
		animState = "locked"
	},
	Unlocked = {
		text = "",
		color = Colors.white,
		animState = "default"
	},
	Complete = {
		text = "CHALLENGE_COMPLETE",
		color = Colors.green,
		animState = "complete"
	}
}
function ParseChallengeName( f1_arg0 )
	local f1_local0 = f1_arg0
	local f1_local1 = 1
	if f1_arg0 ~= "" then
		local f1_local2 = string.len( f1_arg0 )
		local f1_local3 = string.sub( f1_arg0, 1, f1_local2 - 2 )
		local f1_local4 = string.sub( f1_arg0, f1_local2 - 1, f1_local2 - 1 )
		local f1_local5 = tonumber( string.sub( f1_arg0, f1_local2 ) )
		if f1_local4 == "_" and TierStrings[f1_local5] ~= nil then
			f1_local1 = f1_local5
			f1_local0 = f1_local3
		else
			DebugPrint( "ref " .. f1_arg0 .. "does not contain valid tier, defaulting to tier 1" )
		end
	end
	return f1_local0, f1_local1
end

function GetFieldForChallenge( f2_arg0, f2_arg1 )
	local f2_local0 = assert
	local f2_local1
	if f2_arg1 < AllChallengesTable.Cols.Ref or f2_arg1 > AllChallengesTable.Cols.ItemGUID14 then
		f2_local1 = false
	else
		f2_local1 = true
	end
	f2_local0( f2_local1, "Invalid column in GetFieldForChallenge( challenge_ref, column )" )
	return Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f2_arg0, f2_arg1 )
end

function GetChallengeName( f3_arg0 )
	local f3_local0 = GetFieldForChallenge( f3_arg0, AllChallengesTable.Cols.Name )
	if f3_local0 == "" then
		DebugPrint( "Warning, challenge " .. f3_arg0 .. " not found in allChallengesTable.csv" )
		return f3_local0
	else
		return Engine.Localize( f3_local0 )
	end
end

function GetChallengeNameWithTier( f4_arg0, f4_arg1 )
	local f4_local0 = GetChallengeName( f4_arg0 )
	if GetChallengeTierCount( f4_arg0 ) > 1 and f4_arg1 > 0 then
		f4_local0 = Engine.Localize( "LUA_MENU_CHALLENGE_AND_TIER", f4_local0, Engine.Localize( TierStrings[f4_arg1] ) )
	end
	return f4_local0
end

function GetChallengeImage( f5_arg0 )
	local f5_local0 = nil
	if Engine.InFrontend() then
		f5_local0 = Engine.TableLookup( SplashTable.File, SplashTable.Cols.Ref, f5_arg0, SplashTable.Cols.FrontendImage )
	end
	if f5_local0 == nil or f5_local0 == "" then
		f5_local0 = Engine.TableLookup( SplashTable.File, SplashTable.Cols.Ref, f5_arg0, SplashTable.Cols.Image )
		if f5_local0 == "" then
			DebugPrint( "Warning, image for challenge " .. f5_arg0 .. " not found in splashTable.csv, using fallback ui_challenge_unlocked" )
			f5_local0 = "ui_challenge_unlocked"
		end
	end
	return RegisterMaterial( f5_local0 )
end

function GetChallengeTierCount( f6_arg0 )
	local f6_local0 = 0
	local f6_local1 = 9
	for f6_local2 = 1, f6_local1, 1 do
		if GetFieldForChallenge( f6_arg0, AllChallengesTable.Cols.Target1 + (f6_local2 - 1) * 2 ) == "" then
			break
		end
		f6_local0 = f6_local0 + 1
	end
	return f6_local0
end

function GetChallengeStatus( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	if f7_arg1 < 1 then
		return ChallengeStatus.Locked
	elseif f7_arg1 <= GetChallengeTierCount( f7_arg0 ) then
		if f7_arg3 <= f7_arg2 then
			return ChallengeStatus.Complete
		else
			return ChallengeStatus.Unlocked
		end
	else
		return ChallengeStatus.Complete
	end
end

function GetChallengeReward( f8_arg0, f8_arg1 )
	if f8_arg1 < 1 then
		f8_arg1 = 1
	end
	local f8_local0 = nil
	if f8_arg1 > 0 then
		f8_local0 = GetFieldForChallenge( f8_arg0, AllChallengesTable.Cols.ItemGUID1 + f8_arg1 - 1 )
	else
		f8_local0 = GetFieldForChallenge( f8_arg0, AllChallengesTable.Cols.ItemGUID1 )
	end
	return f8_local0
end

function GetChallengeXPReward( f9_arg0, f9_arg1 )
	if f9_arg1 < 1 then
		f9_arg1 = 1
	end
	local f9_local0 = nil
	if f9_arg1 > 0 then
		f9_local0 = GetFieldForChallenge( f9_arg0, AllChallengesTable.Cols.XP1 + (f9_arg1 - 1) * 2 )
	else
		f9_local0 = GetFieldForChallenge( f9_arg0, AllChallengesTable.Cols.XP1 )
	end
	if f9_local0 and f9_local0 ~= "" then
		f9_local0 = tonumber( f9_local0 )
	end
	return f9_local0
end

function GetChallengeState( f10_arg0, f10_arg1 )
	return Engine.GetChallengeState( f10_arg0, f10_arg1 )
end

function GetChallengeProgress( f11_arg0, f11_arg1 )
	return Engine.GetChallengeProgress( f11_arg0, f11_arg1 )
end

function GetChallengeTarget( f12_arg0, f12_arg1 )
	if f12_arg1 < 1 then
		f12_arg1 = 1
	end
	return tonumber( GetFieldForChallenge( f12_arg0, AllChallengesTable.Cols.Target1 + (f12_arg1 - 1) * 2 ) ) or 0
end

function IsUnlockItem( f13_arg0 )
	local f13_local0 = false
	if f13_arg0 and f13_arg0 ~= "" then
		if Engine.InFrontend() and CaoItems ~= nil and CaoItems[f13_arg0] then
			f13_local0 = true
		elseif f13_arg0 == "weaponCamo" then
			f13_local0 = true
		elseif f13_arg0 == "attachmentUnlock" or f13_arg0 == "weaponAttachment" or f13_arg0 == "attachmentUnlockSpecial" then
			f13_local0 = true
		elseif f13_arg0 == "title" then
			f13_local0 = true
		elseif f13_arg0 == "icon" then
			f13_local0 = true
		elseif f13_arg0 == "loot" or f13_arg0 == "gear" then
			f13_local0 = true
		end
	end
	return f13_local0
end

function GetNameForUnlockItem( f14_arg0, f14_arg1 )
	assert( IsUnlockItem( f14_arg0 ) )
	local f14_local0 = nil
	if f14_arg0 == "weaponCamo" then
		f14_local0 = Engine.Localize( Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, GetCamoRefForUnlock( f14_arg1 ), CamoTable.Cols.Name ) )
	elseif f14_arg0 == "attachmentUnlock" or f14_arg0 == "weaponAttachment" or f14_arg0 == "attachmentUnlockSpecial" then
		local f14_local1 = f14_arg1
		local f14_local2, f14_local3 = string.find( f14_local1, " " )
		if f14_local3 then
			f14_local1 = string.sub( f14_arg1, f14_local3 + 1 )
		end
		f14_local0 = Engine.Localize( Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f14_local1, AttachKitTable.Cols.Name ) )
	elseif f14_arg0 == "title" then
		f14_local0 = Engine.Localize( Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Image, f14_arg1, CallingCardTable.Cols.Name ) )
	elseif f14_arg0 == "icon" then
		f14_local0 = Engine.Localize( "MENU_PLAYERCARD_ICON" )
	elseif f14_arg0 == "loot" then
		f14_local0 = Engine.Localize( Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f14_arg1, StatsTable.Cols.Name ) )
	end
	return f14_local0
end

function GetImageForUnlockItem( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	assert( IsUnlockItem( f15_arg1 ) )
	local f15_local0 = nil
	if Cac.GetItemLockState( f15_arg0, nil, f15_arg2 ) == "Hidden" then
		return RegisterMaterial( CoD.Material.LockedIcon )
	elseif f15_arg1 == "weaponCamo" then
		f15_local0 = RegisterMaterial( Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, GetCamoRefForUnlock( f15_arg2 ), CamoTable.Cols.Image ) )
	elseif f15_arg1 == "attachmentUnlock" or f15_arg1 == "weaponAttachment" or f15_arg1 == "attachmentUnlockSpecial" then
		local f15_local1 = f15_arg2
		local f15_local2, f15_local3 = string.find( f15_local1, " " )
		if f15_local3 then
			f15_local1 = string.sub( f15_arg2, f15_local3 + 1 )
		end
		f15_local0 = RegisterMaterial( Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f15_local1, AttachKitTable.Cols.Image ) )
	elseif f15_arg1 == "title" then
		local f15_local1 = f15_arg2
		f15_local0 = RegisterMaterial( f15_local1 )
		local f15_local2 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Image, f15_local1, CallingCardTable.Cols.AnimatedTable )
		if f15_local2 ~= nil and f15_local2 ~= "" then
			f15_arg3.animatedTable = f15_local2
		end
	elseif f15_arg1 == "icon" then
		local f15_local1 = f15_arg2
		if f15_local1 and f15_local1 ~= "" then
			f15_local0 = RegisterMaterial( f15_local1 )
		end
	elseif f15_arg1 == "loot" and (Cac.GetItemType( Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f15_arg2, StatsTable.Cols.GUID ) ) == ItemTypes.Weapon or ItemTypes.Costume) then
		f15_local0 = RegisterMaterial( Cac.GetImageNameFromStatsTable( f15_arg2 ) )
	end
	return f15_local0
end

function GetCamoRefForUnlock( f16_arg0 )
	local f16_local0 = f16_arg0
	local f16_local1, f16_local2 = string.find( f16_local0, " " )
	if f16_local2 then
		f16_local0 = string.sub( f16_arg0, f16_local2 + 1 )
	end
	return f16_local0
end

function GetUnlockByChallenge( f17_arg0, f17_arg1 )
	if f17_arg1 == 0 then
		f17_arg1 = 1
	end
	local f17_local0 = f17_arg0 .. "_" .. f17_arg1
	local f17_local1, f17_local2 = nil
	local f17_local3 = Engine.TableLookupGetRowNum( UnlockTable.File, UnlockTable.Cols.Challenge, f17_local0 )
	if f17_local3 ~= nil and 0 <= f17_local3 then
		f17_local1 = Engine.TableLookupByRow( UnlockTable.File, f17_local3, UnlockTable.Cols.Type )
		f17_local2 = Engine.TableLookupByRow( UnlockTable.File, f17_local3, UnlockTable.Cols.ItemId )
	end
	return f17_local1, f17_local2
end

function GetChallengeDataOverrideTargetAndProgress( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = f18_arg1 or 0
	if f18_arg0 == "ch_exomech_frontier" then
		if 0 < f18_arg1 then
			f18_local0 = string.format( "%.1f", math.floor( f18_arg1 / 528 * 10 + 0.5 ) / 10 )
		end
		f18_arg2 = 62
	end
	return f18_arg1, f18_arg2, f18_local0
end

function GetChallengeData( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4, f19_arg5 )
	local f19_local0 = {
		Ref = f19_arg1,
		Name = "",
		Desc = "",
		Label = "",
		Image = "",
		Progress = 0,
		Target = 0,
		MaxProgress = 0,
		RewardXP = 0,
		RewardCurrency = 0,
		RewardName = nil,
		RewardImage = nil,
		RewardType = nil,
		ProgressText = "",
		NumTiers = 0,
		ActiveTier = 0,
		Completed = false,
		Target = nil,
		Status = ChallengeStatus.Locked,
		Category = nil,
		Name = GetChallengeName( f19_arg1 ),
		Image = GetChallengeImage( f19_arg1 ),
		Filter = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f19_arg1, AllChallengesTable.Cols.Filter ),
		Category = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f19_arg1, AllChallengesTable.Cols.Category )
	}
	if f19_local0.Name ~= "" then
		f19_local0.NumTiers = GetChallengeTierCount( f19_arg1 )
		local f19_local1 = GetChallengeState( f19_arg0, f19_arg1 )
		if f19_arg4 then
			f19_local0.ActiveTier = f19_arg4
		elseif f19_arg2 then
			f19_local0.ActiveTier = math.min( f19_local0.NumTiers, f19_local1 - 1 )
		elseif f19_arg3 ~= nil then
			f19_local0.ActiveTier = math.min( f19_local0.NumTiers, f19_arg3 )
		else
			f19_local0.ActiveTier = math.min( f19_local0.NumTiers, f19_local1 )
		end
		f19_local0.Target = GetChallengeTarget( f19_arg1, f19_local0.ActiveTier )
		f19_local0.Progress = GetChallengeProgress( f19_arg0, f19_arg1 )
		if not f19_arg5 then
			f19_local0.Name = GetChallengeNameWithTier( f19_arg1, f19_local0.ActiveTier )
		end
		f19_local0.RewardXP = GetChallengeXPReward( f19_arg1, f19_local0.ActiveTier )
		f19_local0.Desc = Engine.Localize( GetFieldForChallenge( f19_arg1, AllChallengesTable.Cols.Desc ), f19_local0.Target )
		if f19_local0.ActiveTier > 0 then
			if f19_local0.NumTiers < f19_local1 then
				f19_local0.Status = ChallengeStatus.Complete
			else
				local f19_local2
				if f19_local0.Target <= f19_local0.Progress then
					f19_local2 = ChallengeStatus.Complete
					if not f19_local2 then
					
					else
						f19_local0.Status = f19_local2
					end
				end
				f19_local2 = ChallengeStatus.Unlocked
			end
		end
		f19_local0.Completed = f19_local0.Status == ChallengeStatus.Complete
		local f19_local2, f19_local3 = GetUnlockByChallenge( f19_arg1, f19_local0.ActiveTier )
		if f19_local2 ~= nil and f19_local3 ~= nil and IsUnlockItem( f19_local2 ) then
			local f19_local4 = GetImageForUnlockItem( f19_arg0, f19_local2, f19_local3, f19_local0 )
			f19_local0.RewardName = GetNameForUnlockItem( f19_local2, f19_local3 )
			f19_local0.RewardImage = f19_local4
			f19_local0.RewardType = f19_local2
		end
	end
	if f19_arg1 == "ch_marathon" or f19_arg1 == "ch_wc_sprint" then
		local f19_local1 = tonumber( Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f19_arg1, AllChallengesTable.Cols.Weight ) )
		f19_local0.Progress = f19_local0.Progress / f19_local1
		f19_local0.Target = math.floor( f19_local0.Target / f19_local1 + 0.5 )
		if f19_local0.Target <= f19_local0.Progress + 0.01 then
			f19_local0.Progress = f19_local0.Target
		else
			f19_local0.Progress = math.floor( f19_local0.Progress )
		end
	end
	f19_local0.prerequisite = GetChallengePrerequisite( f19_local0, f19_arg0 )
	return f19_local0
end

function GetChallengePrerequisite( f20_arg0, f20_arg1 )
	local f20_local0 = Engine.GetPlayerDataMPXP( f20_arg1, CoD.StatsGroup.Ranked, "experience" )
	local f20_local1 = Lobby.GetPlayerPrestigeLevel( f20_arg1 )
	local f20_local2 = Lobby.GetRankForXP( f20_local0, f20_local1 )
	local f20_local3 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f20_arg0.Ref, AllChallengesTable.Cols.UnlockLevel )
	if f20_local3 ~= nil and f20_local3 ~= "" and f20_local3 ~= 0 then
		local f20_local4 = tonumber( f20_local3 )
		if f20_local2 < f20_local4 then
			return f20_arg0.Name .. "\n" .. Engine.Localize( "@LUA_MENU_ITEM_LEVEL_UNLOCK_DESC", Rank.GetRankDisplay( f20_local4 ) )
		end
	end
	local f20_local4 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f20_arg0.Ref, AllChallengesTable.Cols.ChallengeUnlock )
	if f20_local4 ~= nil and f20_local4 ~= "" then
		local f20_local5 = GetChallengeData( f20_arg1, f20_local4, nil, nil, nil, true )
		if not f20_local5.Completed then
			return f20_arg0.Name .. "\n" .. Engine.Localize( "@LUA_MENU_UNLOCKED_BY_COMPLETING_CHALLENGE", f20_local5.Name )
		end
	end
	local f20_local5 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f20_arg0.Ref, AllChallengesTable.Cols.PrestigeUnlock )
	if f20_local5 ~= nil and f20_local5 ~= "" and f20_local1 < tonumber( f20_local5 ) then
		return f20_arg0.Name .. "\n" .. Engine.Localize( "@LUA_MENU_ITEM_PRESTIGE_UNLOCK_DESC", f20_local5 )
	end
	return nil
end

function GetChallengeDataForCard( f21_arg0, f21_arg1 )
	local f21_local0 = {}
	local f21_local1 = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f21_arg1, UnlockTable.Cols.Challenge )
	if f21_local1 ~= nil and f21_local1 ~= "" then
		local f21_local2, f21_local3 = ParseChallengeName( f21_local1 )
		f21_local0.target = GetChallengeTarget( f21_local2, f21_local3 )
		if f21_local1 == "ch_prestige_max" then
			f21_local0.name = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX" )
			f21_local0.desc = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX_DESC" )
		elseif f21_local1 == "ch_prestige_max_2" then
			f21_local0.name = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX2" )
			f21_local0.desc = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX2_DESC" )
		else
			f21_local0.name = GetChallengeNameWithTier( f21_local2, f21_local3 )
			f21_local0.desc = Engine.Localize( GetFieldForChallenge( f21_local2, AllChallengesTable.Cols.Desc ), f21_local0.target )
		end
		f21_local0.progress = GetChallengeProgress( f21_arg0, f21_local2 )
		f21_local0.progressString = f21_local0.progress
		f21_local0.progress, f21_local0.target, f21_local0.progressString = GetChallengeDataOverrideTargetAndProgress( f21_local2, f21_local0.progress, f21_local0.target )
		if f21_local2 and f21_local2 ~= "" then
			local f21_local4 = GetChallengeState( f21_arg0, f21_local2 )
			if f21_local4 < f21_local3 or f21_local4 == f21_local3 and f21_local0.progress < f21_local0.target then
				f21_local0.lockedByChallenge = true
			end
		end
		local f21_local4 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f21_local2, AllChallengesTable.Cols.Name )
		if f21_local4 == "MPUI_MVP" or f21_local4 == "MPUI_WINS" then
			local f21_local5 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f21_local2, AllChallengesTable.Cols.Filter )
			if f21_local5 == "ffa" then
				f21_local5 = "dm"
			end
			if f21_local5 == "tdm" then
				f21_local5 = "war"
			end
			f21_local0.gameMode = Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f21_local5, GameTypesTable.Cols.Name ) )
		end
	end
	return f21_local0
end

function GetClanEntitlementDataForCard( f22_arg0, f22_arg1 )
	local f22_local0 = {}
	local f22_local1 = Engine.TableLookupByRow( CallingCardTable.File, f22_arg1, CallingCardTable.Cols.ClanEntitlement )
	if f22_local1 and f22_local1 ~= "" then
		local f22_local2 = true
		if Clan.IsEnabled() and Clan.AlreadyMember( f22_arg0 ) and Clan.IsEntitlementUnlocked( f22_arg0, f22_local1 ) then
			f22_local2 = false
		end
		f22_local0.lockedByClanEntitlement = f22_local2
	end
	return f22_local0
end

