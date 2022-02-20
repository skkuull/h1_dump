local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.InventoryUtils = {}
LUI.InventoryUtils.TaskType = {
	INV_TASK_INVALID = 0,
	INV_TASK_GETBALANCE = 1,
	INV_TASK_GETINVENTORY = 2,
	INV_TASK_CONSUME_ITEMS = 3,
	INV_TASK_UPDATE_ITEM_DATA = 4,
	INV_TASK_REDEEMCOUPONS = 5,
	INV_TASK_GETCOUPONS = 6,
	INV_TASK_GETPENDINGCOUPONS = 7,
	INV_TASK_CLAIMCOUPONS = 8,
	INV_TASK_TRANSFERCOUPONS = 9,
	INV_TASK_DELETECOUPONS = 10,
	INV_TASK_GETUNIQUECOUPONMETADATA_REWARDROLLS = 11,
	INV_TASK_GETUNIQUECOUPONMETADATA_MTXREWARDROLLS = 12,
	INV_TASK_GETUNIQUECOUPONMETADATA_TIMEREWARDROLLS = 13,
	INV_TASK_GETUNIQUECOUPONMETADATA_ACTIVITYREWARDS = 14,
	INV_TASK_GETPRODUCTS = 15,
	INV_TASK_GETENTITLEMENTS = 16,
	INV_TASK_DELETE_EXPIRED_ITEMS = 17,
	INV_TASK_PAWN_ITEMS = 18,
	INV_TASK_GETEXPIREDITEMS = 19,
	INV_TASK_REPORT_USAGE_TIME = 20,
	INV_TASK_START_EXCHANGE_ENTITLEMENT = 21,
	INV_TASK_EXECUTE_EXCHANGE_ENTITLEMENT = 22,
	INV_TASK_PURCHASE_ITEM = 23
}
LUI.InventoryUtils.EventType = {
	ELUIInventoryEvent_ItemExpired = 0,
	ELUIInventoryEvent_ReinforcementReceived = 1,
	ELUIInventoryEvent_InventoryModified = 2,
	ELUIInventoryEvent_TaskCompleted = 3
}
LUI.InventoryUtils.UnlockTypes = {
	PERK = "perk",
	FEATURE = "feature",
	PROFILE_FEATURE = "profileFeature",
	TITLE = "title",
	ICON = "icon",
	KILLSTREAK = "killstreak",
	CHALLENGE = "challenge",
	PRESTIGE = "prestige",
	WEAPON = "weapon",
	WEAPON_ATTACHMENT = "weaponAttachment",
	WEAPON_ATTACHKIT = "weaponAttachKit",
	WEAPON_FURNITUREKIT = "weaponFurnitureKit",
	WEAPON_CAMO = "weaponCamo",
	WEAPON_BUFF = "weaponBuff",
	WEAPON_RETICLE = "weaponReticle"
}
function IsLocked( f1_arg0 )
	local f1_local0 = f1_arg0.lockState == "Locked"
	if LUI.CacStaticLayout.ClassLoc ~= nil and Cac.IsMatchPresetClass( LUI.CacStaticLayout.ClassLoc ) then
		f1_local0 = false
	end
	return f1_local0
end

function IsRestricted( f2_arg0 )
	return f2_arg0.isRestricted
end

function IsNew( f3_arg0 )
	return f3_arg0.isNew
end

function GetLockIcon( f4_arg0 )
	if f4_arg0.lockStatus == Cac.ItemLockStatus.DlcRequired and f4_arg0.dlcRequirement then
		return RegisterMaterial( "weapon_locked_dlc_64" )
	elseif f4_arg0.loot_type == ItemTypes.Playercard or f4_arg0.loot_type == ItemTypes.Emblem or f4_arg0.loot_type == ItemTypes.Costume or f4_arg0.unlockType ~= nil then
		return RegisterMaterial( CoD.Material.LockedIcon )
	else
		return Cac.GetWeaponLockedIcon( f4_arg0.weaponCategory, f4_arg0.weaponType )
	end
end

function GetRestrictedIcon( f5_arg0 )
	return RegisterMaterial( CoD.Material.RestrictedIcon )
end

function GetNewStickerIcon( f6_arg0 )
	return RegisterMaterial( CoD.Material.NewSticker )
end

function GetWeaponStatsData( f7_arg0, f7_arg1 )
	local f7_local0 = {}
	for f7_local1 = 1, #LUI.CacDataProvider.WeaponStats, 1 do
		local f7_local4 = LUI.CacDataProvider.WeaponStats[f7_local1].dataProvider
		if f7_local4 then
			f7_local0[f7_local1] = {
				name = LUI.CacDataProvider.WeaponStats[f7_local1].name or "error",
				statBars = LUI.CacDataProvider.WeaponStats[f7_local1].statBars or false,
				compareVal = f7_local4( f7_arg1 ) or 0,
				selfVal = f7_local4( f7_arg0 ) or 0
			}
		end
	end
	return f7_local0
end

function GetWeaponVsAttachKitStatsData( f8_arg0, f8_arg1 )
	local f8_local0 = {}
	if f8_arg0 == nil then
		return f8_local0
	end
	local f8_local1 = f8_arg0.lootName
	local f8_local2 = f8_arg0.currentAttachKit
	local f8_local3 = f8_arg0.selectedAttach
	for f8_local4 = 1, #LUI.CacDataProvider.WeaponStats, 1 do
		local f8_local7 = LUI.CacDataProvider.WeaponStats[f8_local4].dataProvider
		local f8_local8 = LUI.CacDataProvider.AttachKitStats[f8_local4].dataProvider
		if f8_local7 and f8_local8 then
			local f8_local9 = f8_local7( f8_local1 )
			local f8_local10 = false
			f8_local9 = f8_local9 + (tonumber( f8_local8( f8_local2 ) ) or 0)
			if f8_arg1 == equippedAtt then
				f8_local10 = true
			end
			local f8_local11 = f8_local9
			local f8_local12 = tonumber( f8_local8( f8_arg1 ) )
			if not f8_local12 then
				f8_local12 = 0
			end
			if f8_local10 then
				if f8_local3 ~= nil and f8_local3 ~= f8_arg1 then
					local f8_local13 = tonumber( f8_local8( f8_local3 ) )
					if not f8_local13 then
						f8_local13 = 0
					end
					f8_local11 = f8_local9 - f8_local13
				else
					f8_local11 = f8_local9
				end
			elseif f8_local3 ~= nil then
				local f8_local13 = tonumber( f8_local8( f8_local3 ) )
				if not f8_local13 then
					f8_local13 = 0
				end
				f8_local11 = f8_local9 - f8_local13 + f8_local12
			else
				f8_local11 = f8_local11 + f8_local12
			end
			f8_local0[f8_local4] = {
				name = LUI.CacDataProvider.AttachKitStats[f8_local4].name,
				statBars = LUI.CacDataProvider.AttachKitStats[f8_local4].statBars,
				compareVal = f8_local9,
				selfVal = f8_local11
			}
		end
	end
	return f8_local0
end

f0_local0 = {
	Primary = LUI.InventoryUtils.UnlockTypes.WEAPON,
	Primary_AttachKit = LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT,
	Primary_FurnitureKit = LUI.InventoryUtils.UnlockTypes.WEAPON_FURNITUREKIT,
	Primary_Camo = LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO,
	Primary_Reticle = LUI.InventoryUtils.UnlockTypes.WEAPON_RETICLE,
	Secondary = LUI.InventoryUtils.UnlockTypes.WEAPON,
	Secondary_AttachKit = LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT,
	Secondary_FurnitureKit = LUI.InventoryUtils.UnlockTypes.WEAPON_FURNITUREKIT,
	Secondary_Camo = LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO,
	Secondary_Reticle = LUI.InventoryUtils.UnlockTypes.WEAPON_RETICLE,
	Lethal = LUI.InventoryUtils.UnlockTypes.PERK,
	Tactical = LUI.InventoryUtils.UnlockTypes.WEAPON,
	Perk_Slot1 = LUI.InventoryUtils.UnlockTypes.PERK,
	Perk_Slot2 = LUI.InventoryUtils.UnlockTypes.PERK,
	Perk_Slot3 = LUI.InventoryUtils.UnlockTypes.PERK
}
LUI.InventoryUtils.GetUnlockTypeFromWeaponCategory = function ( f9_arg0 )
	return f0_local0[f9_arg0]
end

LUI.InventoryUtils.IsInvalidUnlockItemId = function ( f10_arg0, f10_arg1 )
	if string.find( f10_arg1, "cardtitle_" ) then
		return true
	else
		return false
	end
end

LUI.InventoryUtils.GetUnlockItemLootData = function ( f11_arg0, f11_arg1 )
	if not f11_arg0 or not f11_arg1 or f11_arg0 == "" or f11_arg1 == "" then
		DebugPrint( "Must provide a Type and ItemId" )
		return nil
	elseif LUI.InventoryUtils.IsInvalidUnlockItemId( f11_arg0, f11_arg1 ) then
		return nil
	end
	local f11_local0 = {}
	if f11_arg0 == LUI.InventoryUtils.UnlockTypes.WEAPON then
		local f11_local1 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f11_arg1, StatsTable.Cols.GUID )
		if not f11_local1 or f11_local1 == "" then
			f11_local0.unlockType = LUI.InventoryUtils.UnlockTypes.PERK
			f11_local0.name = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Name ) or ""
			f11_local0.desc = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Desc ) or ""
			f11_local0.category = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Type ) or ""
			f11_local0.image = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Image )
			if f11_local0.category then
				local f11_local2 = f11_local0.category
				local f11_local3 = f11_local0.category
			end
			f11_local0.category = f11_local2 and f11_local3 or "@LUA_MENU_EXO_ABILITY_CAPS"
			f11_local0.weaponCategory = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Slot ) or ""
			if f11_local0.weaponCategory == "flash" then
				f11_local0.weaponCategory = "Tactical"
			end
			f11_local0.weaponName = f11_arg1
		else
			return LUI.InventoryUtils.GetLootData( f11_local1 )
		end
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.FEATURE then
		local f11_local1 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f11_arg1, StatsTable.Cols.GUID )
		if not f11_local1 or f11_local1 == "" then
			f11_local0.name = ""
			f11_local0.desc = ""
			f11_local0.category = ""
			f11_local0.image = nil
			f11_local0.weaponName = f11_arg1
		else
			return LUI.InventoryUtils.GetLootData( f11_local1 )
		end
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.PERK then
		local f11_local1 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Name )
		if not f11_local1 then
			f11_local1 = ""
		end
		f11_local0.name = f11_local1
		f11_local1 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Desc )
		if not f11_local1 then
			f11_local1 = ""
		end
		f11_local0.desc = f11_local1
		f11_local1 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Type )
		if not f11_local1 then
			f11_local1 = ""
		end
		f11_local0.category = f11_local1
		f11_local0.image = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Image )
		f11_local1 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f11_arg1, PerkTable.Cols.Slot )
		if not f11_local1 then
			f11_local1 = ""
		end
		f11_local0.weaponCategory = f11_local1
		if f11_local0.weaponCategory ~= "" and f11_local0.weaponCategory ~= "Perk_Slot1" and f11_local0.weaponCategory ~= "Perk_Slot2" and f11_local0.weaponCategory ~= "Perk_Slot3" and f11_local0.weaponCategory ~= "Tactical" then
			f11_local0.weaponCategory = "Lethal"
		end
		f11_local0.weaponName = f11_arg1
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.TITLE then
		f11_local0.cardIndex = tonumber( Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Image, f11_arg1, CallingCardTable.Cols.Ref ) )
		local f11_local1 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Image, f11_arg1, CallingCardTable.Cols.Name )
		if not f11_local1 then
			f11_local1 = ""
		end
		f11_local0.name = f11_local1
		f11_local0.desc = ""
		f11_local0.category = "@LUA_MENU_PLAYERCARD_CAPS"
		f11_local0.image = f11_arg1
		f11_local0.weaponCategory = "CallingCard"
		f11_local1 = "cc_"
		local f11_local4 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Image, f11_arg1, CallingCardTable.Cols.Category )
		if not f11_local4 then
			f11_local4 = ""
		end
		f11_local0.weaponType = f11_local1 .. f11_local4
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.ICON then
		local f11_local1 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.Image, f11_arg1, EmblemIconTable.Cols.Name )
		if not f11_local1 then
			f11_local1 = ""
		end
		f11_local0.name = f11_local1
		f11_local0.desc = ""
		f11_local0.category = "@MENU_EMBLEM_CAPS"
		f11_local0.emblem = f11_arg1
		if f11_local0.name then
			local f11_local5 = f11_local0.name
			local f11_local6 = f11_local0.name
		end
		f11_local0.name = f11_local5 and f11_local6 or "@LUA_MP_FRONTEND_NEW_EMBLEM"
		f11_local0.weaponCategory = "Emblem"
		f11_local1 = "em_"
		local f11_local4 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.Image, f11_arg1, EmblemIconTable.Cols.Category )
		if not f11_local4 then
			f11_local4 = ""
		end
		f11_local0.weaponType = f11_local1 .. f11_local4
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.KILLSTREAK then
		local f11_local1 = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.Index )
		if f11_local1 and f11_local1 ~= "" then
			f11_local0.moduleIndex = f11_local1
			local f11_local4 = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.Name )
			if not f11_local4 then
				f11_local4 = ""
			end
			f11_local0.name = f11_local4
			f11_local4 = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.Desc )
			if not f11_local4 then
				f11_local4 = ""
			end
			f11_local0.desc = f11_local4
			f11_local0.category = "@LUA_MENU_SCORESTREAK_MODULE_CAPS"
			f11_local0.image = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.Icon )
			f11_local0.streakRef = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.BaseStreakRef )
			f11_local0.cost = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.AddedPoints )
			f11_local0.isSupport = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f11_arg1, KillstreakModulesTable.Cols.IsSupport )
			f11_local0.weaponCategory = "StreakModules"
		else
			local f11_local4 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f11_arg1, KillstreakTable.Cols.Name )
			if not f11_local4 then
				f11_local4 = ""
			end
			f11_local0.name = f11_local4
			f11_local4 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f11_arg1, KillstreakTable.Cols.Desc )
			if not f11_local4 then
				f11_local4 = ""
			end
			f11_local0.desc = f11_local4
			f11_local0.category = "@LUA_MENU_SCORESTREAK_CAPS"
			f11_local0.image = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f11_arg1, KillstreakTable.Cols.Image )
			f11_local0.weaponCategory = "Streak"
		end
		f11_local0.weaponName = f11_arg1
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHMENT or f11_arg0 == "attachmentUnlock" or f11_arg0 == "attachmentUnlockSpecial" then
		local f11_local1 = string.find( f11_arg1, " " )
		local f11_local4 = string.sub( f11_arg1, 0, f11_local1 - 1 )
		local f11_local7 = string.sub( f11_arg1, f11_local1 + 1 )
		local f11_local8 = Cac.GetWeaponCategoryFromWeapon( f11_local4 )
		local f11_local9 = Cac.GetWeaponTypeFromWeapon( f11_local8, f11_local4 )
		local f11_local10 = f11_local7
		local f11_local11 = f11_local8 .. "_AttachKit"
		f11_local0.unlockType = LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT
		local f11_local12 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f11_local10, AttachKitTable.Cols.Name )
		if not f11_local12 then
			f11_local12 = ""
		end
		f11_local0.name = f11_local12
		f11_local12 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f11_local10, AttachKitTable.Cols.Desc )
		if not f11_local12 then
			f11_local12 = ""
		end
		f11_local0.desc = f11_local12
		f11_local0.category = "@LUA_MENU_ATTACHKIT_CAPS"
		f11_local0.image = Cac.GetWeaponImageName( f11_local11, f11_local10 )
		f11_local0.weaponName = f11_local7
		f11_local0.lootName = f11_local7
		f11_local0.baseRef = f11_local10
		f11_local0.weaponCategory = f11_local11
		f11_local0.gunData = {
			weaponName = f11_local4,
			lootName = f11_local4,
			weaponCategory = f11_local8,
			weaponType = f11_local9
		}
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT or f11_arg0 == "attachKitUnlock" or f11_arg0 == "attachKitUnlockSpecial" then
		local f11_local1 = string.find( f11_arg1, " " )
		local f11_local4 = string.sub( f11_arg1, 0, f11_local1 - 1 )
		local f11_local7 = string.sub( f11_arg1, f11_local1 + 1 )
		local f11_local8 = Cac.GetWeaponCategoryFromWeapon( f11_local4 )
		local f11_local9 = Cac.GetWeaponTypeFromWeapon( f11_local8, f11_local4 )
		local f11_local10 = f11_local7
		local f11_local11 = f11_local8 .. "_AttachKit"
		f11_local0.unlockType = LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT
		local f11_local12 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f11_local10, AttachKitTable.Cols.Name )
		if not f11_local12 then
			f11_local12 = ""
		end
		f11_local0.name = f11_local12
		f11_local12 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f11_local10, AttachKitTable.Cols.Desc )
		if not f11_local12 then
			f11_local12 = ""
		end
		f11_local0.desc = f11_local12
		f11_local0.category = "@LUA_MENU_ATTACHKIT_CAPS"
		f11_local0.image = Cac.GetWeaponImageName( f11_local11, f11_local10 )
		f11_local0.weaponName = f11_local7
		f11_local0.lootName = f11_local7
		f11_local0.baseRef = f11_local10
		f11_local0.weaponCategory = f11_local11
		f11_local0.gunData = {
			weaponName = f11_local4,
			lootName = f11_local4,
			weaponCategory = f11_local8,
			weaponType = f11_local9
		}
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.WEAPON_FURNITUREKIT or f11_arg0 == "furnitureKitUnlock" or f11_arg0 == "furnitureKitUnlockSpecial" then
		local f11_local1 = string.find( f11_arg1, " " )
		local f11_local4 = string.sub( f11_arg1, 0, f11_local1 - 1 )
		local f11_local7 = string.sub( f11_arg1, f11_local1 + 1 )
		local f11_local8 = Cac.GetWeaponCategoryFromWeapon( f11_local4 )
		local f11_local9 = Cac.GetWeaponTypeFromWeapon( f11_local8, f11_local4 )
		local f11_local10 = f11_local7
		local f11_local11 = f11_local8 .. "_FurnitureKit"
		f11_local0.unlockType = LUI.InventoryUtils.UnlockTypes.WEAPON_FURNITUREKIT
		local f11_local12 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f11_local10, FurnitureKitTable.Cols.Name )
		if not f11_local12 then
			f11_local12 = ""
		end
		f11_local0.name = f11_local12
		f11_local12 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f11_local10, FurnitureKitTable.Cols.Desc )
		if not f11_local12 then
			f11_local12 = ""
		end
		f11_local0.desc = f11_local12
		f11_local0.category = "@LUA_MENU_FURNITUREKIT_CAPS"
		f11_local0.image = Cac.GetWeaponImageName( f11_local11, f11_local10 )
		f11_local0.weaponName = f11_local7
		f11_local0.lootName = f11_local7
		f11_local0.baseRef = f11_local10
		f11_local0.weaponCategory = f11_local11
		f11_local0.gunData = {
			weaponName = f11_local4,
			lootName = f11_local4,
			weaponCategory = f11_local8,
			weaponType = f11_local9
		}
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO or f11_arg0 == "camo" then
		local f11_local1 = string.find( f11_arg1, " " )
		local f11_local4 = string.sub( f11_arg1, 0, f11_local1 - 1 )
		local f11_local7 = string.sub( f11_arg1, f11_local1 + 1 )
		local f11_local8 = Cac.GetWeaponCategoryFromWeapon( f11_local4 )
		local f11_local9 = Cac.GetWeaponTypeFromWeapon( f11_local8, f11_local4 )
		local f11_local10 = f11_local8 .. "_Camo"
		local f11_local11 = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f11_local7, CamoTable.Cols.Name )
		if not f11_local11 then
			f11_local11 = ""
		end
		f11_local0.name = f11_local11
		f11_local11 = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f11_local7, CamoTable.Cols.Desc )
		if not f11_local11 then
			f11_local11 = ""
		end
		f11_local0.desc = f11_local11
		f11_local0.category = "@MENU_CAMO_SHORT_CAPS"
		f11_local0.image = Cac.GetWeaponImageName( f11_local10, f11_local7 )
		f11_local0.weaponName = f11_local7
		f11_local0.lootName = f11_local7
		f11_local0.weaponCategory = f11_local10
		f11_local0.gunData = {
			weaponName = f11_local4,
			lootName = f11_local4,
			weaponCategory = f11_local8,
			weaponType = f11_local9
		}
	elseif f11_arg0 == LUI.InventoryUtils.UnlockTypes.WEAPON_RETICLE or f11_arg0 == "reticle" then
		local f11_local1 = string.find( f11_arg1, " " )
		local f11_local4 = string.sub( f11_arg1, 0, f11_local1 - 1 )
		local f11_local7 = string.sub( f11_arg1, f11_local1 + 1 )
		local f11_local8 = Cac.GetWeaponCategoryFromWeapon( f11_local4 )
		local f11_local9 = Cac.GetWeaponTypeFromWeapon( f11_local8, f11_local4 )
		local f11_local10 = f11_local8 .. "_Reticle"
		local f11_local11 = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f11_arg1, ReticleTable.Cols.Name )
		if not f11_local11 then
			f11_local11 = ""
		end
		f11_local0.name = f11_local11
		f11_local11 = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f11_arg1, ReticleTable.Cols.Desc )
		if not f11_local11 then
			f11_local11 = ""
		end
		f11_local0.desc = f11_local11
		f11_local0.category = "@MENU_RETICLE_CAPS"
		f11_local0.image = Cac.GetWeaponImageName( f11_local10, f11_local7 )
		f11_local0.weaponName = f11_local7
		f11_local0.lootName = f11_local7
		f11_local0.weaponCategory = f11_local10
		f11_local0.gunData = {
			weaponName = f11_local4,
			lootName = f11_local4,
			weaponCategory = f11_local8,
			weaponType = f11_local9
		}
	elseif f11_arg0 == "none" and string.find( f11_arg1, "scorestreak_module_" ) then
		f11_local0.unlockType = LUI.InventoryUtils.UnlockTypes.KILLSTREAK
		f11_local0.name = "@LUA_MENU_" .. f11_arg1
		f11_local0.desc = ""
		f11_local0.category = "@LUA_MENU_SCORESTREAK_MODULE_CAPS"
		f11_local0.image = "ks_mod_generic"
		f11_local0.weaponCategory = "StreakModules"
		f11_local0.weaponName = f11_arg1
	else
		DebugPrint( "Unknown Type : " .. f11_arg0 )
		return nil
	end
	f11_local0.ItemId = f11_arg1
	if f11_local0.unlockType then
		local f11_local13 = f11_local0.unlockType
		local f11_local14 = f11_local0.unlockType
	end
	f11_local0.unlockType = f11_local13 and f11_local14 or f11_arg0
	local f11_local1 = f11_local0.lootRarity
	if not f11_local1 then
		f11_local1 = 1
	end
	f11_local0.lootRarity = f11_local1
	if f11_local0.name then
		local f11_local15 = f11_local0.name
		local f11_local16 = Engine.Localize( f11_local0.name )
	end
	f11_local0.name = f11_local15 and f11_local16 or ""
	if f11_local0.category then
		local f11_local17 = f11_local0.category
		local f11_local18 = Engine.Localize( f11_local0.category )
	end
	f11_local0.category = f11_local17 and f11_local18 or ""
	if f11_local0.image then
		local f11_local19 = f11_local0.image
		local f11_local20 = RegisterMaterial( f11_local0.image )
	end
	f11_local0.image = f11_local19 and f11_local20 or nil
	if f11_local0.desc then
		local f11_local21 = f11_local0.desc
		local f11_local22 = Engine.Localize( f11_local0.desc )
	end
	f11_local0.desc = f11_local21 and f11_local22 or ""
	if not f11_local0.lockState and not f11_local0.lockStatus and not f11_local0.unlockMessage then
		local f11_local1, f11_local4, f11_local7 = nil
		if f11_local0.weaponCategory and f11_local0.weaponCategory ~= "" then
			f11_local1, f11_local4, f11_local7 = Cac.GetClassItemLockState( Cac.GetSelectedControllerIndex(), nil, nil, f11_local0.weaponCategory, f11_arg1 )
		else
			f11_local1, f11_local4, f11_local7 = Cac.GetItemLockState( Cac.GetSelectedControllerIndex(), nil, f11_arg1 )
		end
		f11_local0.lockStatus = f11_local4
		f11_local0.lockState = f11_local1
		f11_local0.unlockMessage = f11_local7
	end
	if f11_local0.lockStatus == Cac.ItemLockStatus.Unlocked and f11_local0.lootName then
		local f11_local1, f11_local4, f11_local7 = Cac.GetItemLockState( Cac.GetSelectedControllerIndex(), nil, f11_local0.lootName )
		if f11_local4 ~= Cac.ItemLockStatus.Unlocked then
			local f11_local8 = f11_local1
			local f11_local9 = f11_local4
			f11_local0.unlockMessage = f11_local7
			f11_local0.lockStatus = f11_local9
			f11_local0.lockState = f11_local8
			f11_local0.ItemId = f11_local0.lootName
		end
	end
	return f11_local0
end

LUI.InventoryUtils.GetLootGuidForRef = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	local f12_local0 = nil
	local f12_local1 = {
		Primary = true,
		Secondary = true,
		Tactical = true,
		Perk_Slot1 = true,
		Perk_Slot2 = true,
		Perk_Slot3 = true,
		Melee = true
	}
	local f12_local2 = {
		callingcard = true,
		emblem = true
	}
	if f12_local1[f12_arg0] == true then
		f12_local0 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f12_arg1, StatsTable.Cols.GUID )
	elseif f12_local2[f12_arg0] == true then
		f12_local0 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.ExternalRef, f12_arg1, StatsTable.Cols.GUID )
	elseif f12_arg0 == "Primary_AttachKit" or f12_arg0 == "Secondary_AttachKit" then
		f12_local0 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f12_arg1, AttachKitTable.Cols.GlobalID )
	else
		local f12_local3 = Cac.GetEquippedWeapon( f12_arg4 or f12_arg0, 0, f12_arg2, f12_arg3 )
		if f12_local3 ~= nil and f12_local3 ~= "" then
			local f12_local4 = Cac.GetWeaponTypeFromWeaponWithoutCategory( f12_local3 )
			if f12_local4 ~= nil and f12_local4 ~= "" then
				local f12_local5 = {
					weapon_assault = 0,
					weapon_smg = 1,
					weapon_heavy = 2,
					weapon_shotgun = 3,
					weapon_sniper = 4,
					weapon_pistol = 5
				}
				local f12_local6 = f12_local5[f12_local4]
				if f12_arg0 == "Primary_FurnitureKit" or f12_arg0 == "Secondary_FurnitureKit" then
					local f12_local7 = Cac.KitWeaponTypes[f12_local4]
					f12_local0 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f12_arg1, f12_local6 + FurnitureKitTable.Cols.ASTItem )
					if f12_local0 == nil or f12_local0 == "" then
						f12_local0 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f12_arg1, FurnitureKitTable.Cols.GlobalID )
					end
				elseif f12_arg0 == "Primary_Reticle" or f12_arg0 == "Secondary_Reticle" then
					f12_local0 = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f12_arg1, f12_local6 + ReticleTable.Cols.ARGuid )
				elseif f12_arg0 == "Primary_Camo" or f12_arg0 == "Secondary_Camo" then
					f12_local0 = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f12_arg1, f12_local6 + CamoTable.Cols.ARGuid )
				end
			end
		end
	end
	return f12_local0
end

LUI.InventoryUtils.GetLootDataForRef = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	local f13_local0 = LUI.InventoryUtils.GetLootGuidForRef( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	if f13_local0 ~= nil and f13_local0 ~= "" then
		return LUI.InventoryUtils.GetLootData( f13_local0 )
	else
		return nil
	end
end

LUI.InventoryUtils.GetWeaponAccessoryCompatibilityCategory = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	local f14_local0 = {
		"ast",
		"smg",
		"lmg",
		"sht",
		"snp",
		"pst"
	}
	local f14_local1 = {
		ast = "@MENU_ASSAULT_RIFLES_CAPS",
		smg = "@MENU_SMGS_CAPS",
		lmg = "@MENU_LMGS_CAPS",
		sht = "@MENU_SHOTGUNS_CAPS",
		snp = "@MENU_SNIPER_RIFLES_CAPS",
		pst = "@MENU_PISTOLS_CAPS"
	}
	if f14_arg2 == nil then
		return Engine.Localize( f14_local1.ast ), "ast"
	elseif f14_arg3 == nil then
		f14_arg3 = f14_arg2
	end
	if f14_arg3 == "wcamo_jan_arctic_wolf_reward" or f14_arg3 == "ret_code" or f14_arg3 == "wcamo_code" then
		return Engine.Localize( "@LUA_MENU_ALL_WEAPONS_CAPS" ), "ast"
	elseif f14_arg1 == "Primary_Camo" or f14_arg1 == "Secondary_Camo" then
		for f14_local2 = 0, #f14_local0, 1 do
			local f14_local5 = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f14_arg2, CamoTable.Cols.ARGuid + f14_local2 )
			if f14_local5 ~= nil and f14_local5 ~= "" and f14_arg0 == f14_local5 then
				local f14_local6 = f14_local0[f14_local2 + 1]
				return Engine.Localize( f14_local1[f14_local6] ), f14_local6
			end
		end
	elseif f14_arg1 == "Primary_Reticle" or f14_arg1 == "Secondary_Reticle" then
		for f14_local2 = 0, #f14_local0, 1 do
			local f14_local5 = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f14_arg2, ReticleTable.Cols.ARGuid + f14_local2 )
			if f14_local5 ~= nil and f14_local5 ~= "" and f14_arg0 == f14_local5 then
				local f14_local6 = f14_local0[f14_local2 + 1]
				return Engine.Localize( f14_local1[f14_local6] ), f14_local6
			end
		end
	elseif f14_arg1 == "Primary_FurnitureKit" or f14_arg1 == "Secondary_FurnitureKit" then
		for f14_local2 = 0, #f14_local0, 1 do
			local f14_local5 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f14_arg2, FurnitureKitTable.Cols.ASTItem + f14_local2 )
			if f14_local5 ~= nil and f14_local5 ~= "" and f14_arg0 == f14_local5 then
				local f14_local6 = f14_local0[f14_local2 + 1]
				return Engine.Localize( f14_local1[f14_local6] ), f14_local6
			end
		end
		local f14_local2 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f14_arg2, FurnitureKitTable.Cols.Valid )
		if f14_local2 ~= nil and f14_local2 ~= "" then
			local f14_local3 = f14_local1[f14_local2]
			if f14_local3 ~= nil and f14_local3 ~= "" then
				return Engine.Localize( f14_local3 ), f14_local2
			end
		end
	elseif f14_arg1 == "Primary_AttachKit" or f14_arg1 == "Secondary_AttachKit" then
		local f14_local2 = Engine.TableLookupFromStart( AttachKitTable.File, AttachKitTable.Cols.Ref, f14_arg2, AttachKitTable.Cols.Valid )
		if f14_local2 ~= nil and f14_local2 ~= "" then
			local f14_local3 = f14_local1[f14_local2]
			if f14_local3 ~= nil and f14_local3 ~= "" then
				return Engine.Localize( f14_local3 ), f14_local2
			end
		end
	end
end

LUI.InventoryUtils.GetLootData = function ( f15_arg0, f15_arg1, f15_arg2 )
	if f15_arg0 == nil and f15_arg2 == nil then
		DebugPrint( "GetLootData: nil args" )
		return nil
	end
	local f15_local0 = {}
	local f15_local1 = Cac.GetSelectedControllerIndex()
	local f15_local2, f15_local3 = Cac.GetCachedData_InventoryUtils_GetLootData( f15_local1, f15_arg0, f15_arg1, f15_arg2 )
	if f15_local2 then
		return f15_local3
	elseif f15_arg0 then
		f15_local0.loot_type = f15_arg1 or Cac.GetItemType( f15_arg0 )
		if f15_local0.loot_type == nil then
			DebugPrint( "GetLootData: no loot_type for " .. f15_arg0 )
			return nil
		elseif f15_local0.loot_type == ItemTypes.SupplyDrop then
			return nil
		end
		f15_local0.guid = f15_arg0
		f15_local0.isOverflow = LUI.InventoryUtils.IsOverflowLoot( f15_local1, f15_arg0 )
		local f15_local4 = Engine.TableLookupGetRowNum( StatsTable.File, StatsTable.Cols.GUID, f15_local0.guid )
		if f15_local4 >= 0 then
			local f15_local5 = Engine.TableLookupByRow( StatsTable.File, f15_local4, StatsTable.Cols.ExternalRef )
			if f15_local5 ~= nil and f15_local5 ~= "" then
				f15_local0.externalRef = f15_local5
			end
			local f15_local6 = Engine.TableLookupByRow( StatsTable.File, f15_local4, StatsTable.Cols.Price )
			if f15_local6 ~= nil and f15_local6 ~= "" then
				f15_local0.price = tonumber( f15_local6 )
			end
			local f15_local7 = Engine.TableLookupByRow( StatsTable.File, f15_local4, StatsTable.Cols.ContentPromo )
			if f15_local7 ~= nil and f15_local7 ~= "" then
				f15_local0.contentPromo = tonumber( f15_local7 )
			else
				f15_local0.contentPromo = 0
			end
		end
		if f15_local0.loot_type == ItemTypes.Reticle then
			local f15_local5 = Engine.LookupStatsTableColumnForGUID( f15_arg0, StatsTable.Cols.Ref )
			if f15_local5 and f15_local5 ~= "" then
				local f15_local6 = Engine.LookupStatsTableColumnForGUID( f15_arg0, StatsTable.Cols.WeaponName )
				if not f15_local6 or f15_local6 == "" then
					f15_local6 = f15_local5
				end
				f15_arg1 = f15_local0.loot_type
				f15_arg2 = {
					lootName = f15_local5,
					weaponName = f15_local6,
					weaponCategory = "Primary_Reticle",
					classLoc = Cac.GetCustomClassLoc()
				}
			end
		elseif f15_local0.loot_type == ItemTypes.Camo then
			local f15_local5 = Engine.LookupStatsTableColumnForGUID( f15_arg0, StatsTable.Cols.Ref )
			if f15_local5 and f15_local5 ~= "" then
				local f15_local6 = Engine.LookupStatsTableColumnForGUID( f15_arg0, StatsTable.Cols.WeaponName )
				if not f15_local6 or f15_local6 == "" then
					f15_local6 = f15_local5
				end
				f15_arg1 = f15_local0.loot_type
				f15_arg2 = {
					lootName = f15_local5,
					weaponName = f15_local6,
					weaponCategory = "Primary_Camo",
					classLoc = Cac.GetCustomClassLoc()
				}
			end
		elseif f15_local0.loot_type == ItemTypes.Playercard then
			local f15_local5 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Guid, f15_arg0, CallingCardTable.Cols.Image )
			if f15_local5 and f15_local5 ~= "" then
				local f15_local6, f15_local7, f15_local8 = Cac.GetItemLockState( f15_local1, f15_arg0 )
				f15_arg1 = f15_local0.loot_type
				f15_arg2 = {
					callingCardImage = f15_local5,
					lockStatus = f15_local7,
					lockState = f15_local6,
					unlockMessage = f15_local8
				}
			end
		elseif f15_local0.loot_type == ItemTypes.Emblem then
			local f15_local5 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.Guid, f15_arg0, EmblemIconTable.Cols.Image )
			if f15_local5 and f15_local5 ~= "" then
				local f15_local6, f15_local7, f15_local8 = Cac.GetItemLockState( f15_local1, f15_arg0 )
				f15_arg1 = f15_local0.loot_type
				f15_arg2 = {
					emblemName = f15_local5,
					lockStatus = f15_local7,
					lockState = f15_local6,
					unlockMessage = f15_local8
				}
			end
		elseif f15_local0.loot_type == ItemTypes.AttachKit then
			local f15_local5 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.GlobalID, f15_arg0, AttachKitTable.Cols.Ref )
			if f15_local5 and f15_local5 ~= "" then
				local f15_local6, f15_local7, f15_local8 = Cac.GetItemLockState( f15_local1, f15_arg0 )
				local f15_local9 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.GlobalID, f15_arg0, AttachKitTable.Cols.Desc )
				f15_arg1 = f15_local0.loot_type
				f15_arg2 = {
					attachUniqueRef = f15_local5,
					weaponName = f15_local5,
					lockStatus = f15_local7,
					lockState = f15_local6,
					unlockMessage = f15_local8,
					desc = f15_local9,
					weaponCategory = "Primary_AttachKit"
				}
			end
		elseif f15_local0.loot_type == ItemTypes.FurnitureKit then
			local f15_local5 = Engine.TableLookup( FurnitureKitTable.File, FurnitureKitTable.Cols.GlobalID, f15_arg0, FurnitureKitTable.Cols.Ref )
			if f15_local5 and f15_local5 ~= "" then
				local f15_local6, f15_local7, f15_local8 = Cac.GetItemLockState( f15_local1, f15_arg0 )
				local f15_local9 = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f15_local5, FurnitureKitTable.Cols.Desc )
				f15_arg1 = f15_local0.loot_type
				f15_arg2 = {
					attachUniqueRef = f15_local5,
					weaponName = f15_local5,
					lockStatus = f15_local7,
					lockState = f15_local6,
					unlockMessage = f15_local8,
					desc = f15_local9,
					weaponCategory = "Primary_FurnitureKit"
				}
			else
				return nil
			end
		end
	end
	if f15_arg1 == ItemTypes.SupplyDrop and f15_arg2.spid and f15_arg2.origin then
		if f15_arg2.origin == LUI.LootOrigin.INVALID then
			return nil
		end
		f15_local0.spid = f15_arg2.spid
		f15_local0.origin = f15_arg2.origin
		f15_local0.loot_type = ItemTypes.SupplyDrop
		f15_local0.category = ""
		if f15_local0.origin == LUI.LootOrigin.MTX then
			f15_local0.name = Engine.Localize( "@LUA_MENU_SUPPLY_DROP_MTX" )
			f15_local0.image = RegisterMaterial( "s1_supply_drop_mtx" )
			f15_local0.quantity = Engine.Loot_GetUnopenedMTXSupplyPackageCount( f15_local1 )
			f15_local0.lootRarity = "mtx"
		else
			f15_local0.name = Engine.Localize( "@LUA_MENU_SUPPLY_DROP" )
			f15_local0.image = RegisterMaterial( "s1_supply_drop" )
			f15_local0.quantity = 1
		end
	elseif f15_arg1 == ItemTypes.Attachment and f15_arg2 then
		f15_local0.loot_type = f15_arg1
		f15_local0.lootName = f15_arg2.attachUniqueRef
		f15_local0.weaponName = f15_arg2.attachUniqueRef
		f15_local0.baseRef = f15_arg2.weaponName
		f15_local0.weaponCategory = f15_arg2.weaponCategory
		f15_local0.gunData = f15_arg2.gunData
		f15_local0.classLoc = f15_arg2.classLoc
	elseif f15_arg1 == ItemTypes.AttachKit and f15_arg2 then
		f15_local0.loot_type = f15_arg1
		f15_local0.name = f15_arg2.attachUniqueRef
		f15_local0.lootName = f15_arg2.attachUniqueRef
		f15_local0.weaponName = f15_arg2.attachUniqueRef
		f15_local0.baseRef = f15_arg2.weaponName
		f15_local0.weaponCategory = f15_arg2.weaponCategory
		f15_local0.gunData = f15_arg2.gunData
		f15_local0.classLoc = f15_arg2.classLoc
		f15_local0.desc = f15_arg2.desc
		f15_local0.category, f15_local0.categoryKey = LUI.InventoryUtils.GetWeaponAccessoryCompatibilityCategory( f15_arg0, f15_local0.weaponCategory, f15_local0.baseRef )
	elseif f15_arg1 == ItemTypes.FurnitureKit and f15_arg2 then
		f15_local0.loot_type = f15_arg1
		f15_local0.name = f15_arg2.attachUniqueRef
		f15_local0.lootName = f15_arg2.attachUniqueRef
		f15_local0.weaponName = f15_arg2.attachUniqueRef
		f15_local0.baseRef = f15_arg2.weaponName
		f15_local0.weaponCategory = f15_arg2.weaponCategory
		f15_local0.gunData = f15_arg2.gunData
		f15_local0.classLoc = f15_arg2.classLoc
		f15_local0.desc = f15_arg2.desc
		f15_local0.category, f15_local0.categoryKey = LUI.InventoryUtils.GetWeaponAccessoryCompatibilityCategory( f15_arg0, f15_local0.weaponCategory, f15_local0.baseRef )
	elseif f15_arg1 == ItemTypes.Camo and f15_arg2 then
		f15_local0.loot_type = f15_arg1
		f15_local0.lootName = f15_arg2.lootName
		f15_local0.weaponName = f15_arg2.weaponName
		f15_local0.weaponCategory = f15_arg2.weaponCategory
		f15_local0.classLoc = f15_arg2.classLoc
		f15_local0.category, f15_local0.categoryKey = LUI.InventoryUtils.GetWeaponAccessoryCompatibilityCategory( f15_arg0, f15_local0.weaponCategory, f15_local0.externalRef, f15_local0.lootName )
	elseif f15_arg1 == ItemTypes.Reticle and f15_arg2 then
		f15_local0.loot_type = f15_arg1
		f15_local0.lootName = f15_arg2.lootName
		f15_local0.weaponName = f15_arg2.weaponName
		f15_local0.weaponCategory = f15_arg2.weaponCategory
		f15_local0.classLoc = f15_arg2.classLoc
		f15_local0.category, f15_local0.categoryKey = LUI.InventoryUtils.GetWeaponAccessoryCompatibilityCategory( f15_arg0, f15_local0.weaponCategory, f15_local0.externalRef, f15_local0.lootName )
	elseif f15_arg1 == ItemTypes.Playercard and f15_arg2 then
		local f15_local4 = Engine.TableLookupGetRowNum( CallingCardTable.File, CallingCardTable.Cols.Image, f15_arg2.callingCardImage )
		f15_local0.loot_type = f15_arg1
		f15_local0.name = Engine.Localize( Engine.TableLookupByRow( CallingCardTable.File, f15_local4, CallingCardTable.Cols.Name ) or "" )
		f15_local0.image = RegisterMaterial( f15_arg2.callingCardImage )
		f15_local0.desc = ""
		f15_local0.lootName = f15_arg2.callingCardImage
		f15_local0.cardIndex = tonumber( Engine.TableLookupByRow( CallingCardTable.File, f15_local4, CallingCardTable.Cols.Ref ) )
		f15_local0.category = Engine.Localize( "@LUA_MENU_CALLING_CARD_CAPS" )
		f15_local0.animatedTable = Engine.TableLookupByRow( CallingCardTable.File, f15_local4, CallingCardTable.Cols.AnimatedTable )
		if f15_local0.animatedTable == "" then
			f15_local0.animatedTable = nil
		end
	elseif f15_arg1 == ItemTypes.Emblem and f15_arg2 then
		f15_local0.loot_type = f15_arg1
		f15_local0.name = Engine.Localize( Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.Image, f15_arg2.emblemName, EmblemIconTable.Cols.Name ) or "" )
		f15_local0.emblem = f15_arg2.emblemName
		f15_local0.image = RegisterMaterial( f15_arg2.emblemName )
		f15_local0.desc = ""
		f15_local0.lootName = f15_arg2.emblemName
		f15_local0.category = Engine.Localize( "@MENU_EMBLEM_CAPS" )
	elseif f15_arg2 and f15_arg2.Type and f15_arg2.ItemId then
		local f15_local4 = LUI.InventoryUtils.GetUnlockItemLootData( f15_arg2.Type, f15_arg2.ItemId )
		if f15_local4 then
			for f15_local8, f15_local9 in pairs( f15_local4 ) do
				f15_local0[f15_local8] = f15_local9
			end
		else
			return nil
		end
	elseif f15_local0.loot_type == ItemTypes.Costume then
		f15_local0.baseGuid = Cao.GetBaseGUID( f15_arg0 )
		f15_local0.id = Cao.GearId( f15_arg0, f15_local0.baseGuid )
		f15_local0.name = Cao.GearName( f15_arg0 )
		f15_local0.image = Cao.GetGearImage( f15_arg0 )
		f15_local0.lootName = Cao.GetGearReference( f15_arg0 )
		f15_local0.desc = ""
		f15_local0.category = Engine.Localize( "@DEPOT_CHARACTER_CAPS" )
	elseif f15_local0.loot_type == ItemTypes.CharacterCamo then
		f15_local0.baseGuid = Cao.GetBaseGUID( f15_arg0 )
		f15_local0.id = Cao.GearId( f15_arg0, f15_local0.baseGuid )
		f15_local0.name = Cao.GearName( f15_arg0 )
		f15_local0.image = RegisterMaterial( Engine.TableLookup( CharacterCamoTable.File, CharacterCamoTable.Cols.Guid, f15_local0.guid, CharacterCamoTable.Cols.Image ) )
		f15_local0.lootName = Cao.GetGearReference( f15_arg0 )
		f15_local0.desc = ""
		f15_local0.category = Engine.Localize( "@DEPOT_CHARACTER_CAMOS" )
	elseif f15_local0.loot_type == ItemTypes.Feature then
		f15_local0.name = Cac.GetNameFromStatsTableGUID( f15_arg0 )
		f15_local0.lootName = Cac.GetItemRefName( f15_arg0 )
		f15_local0.weaponName = Cac.GetWeaponNameFromLootName( f15_local0.lootName )
		local f15_local4 = Cac.GetImageNameFromStatsTableGUID( f15_arg0 )
		if f15_local4 ~= "" then
			f15_local0.image = RegisterMaterial( f15_local4 )
		end
		f15_local0.desc = Cac.GetDescFromStatsTableGUID( f15_arg0 )
	elseif f15_local0.loot_type == ItemTypes.Weapon or f15_local0.loot_type == ItemTypes.Reinforcement then
		f15_local0.lootName = Cac.GetItemRefName( f15_arg0 )
		f15_local0.weaponName = Cac.GetWeaponNameFromLootName( f15_local0.lootName )
		f15_local0.weaponCategory = Cac.GetWeaponCategoryFromWeapon( f15_local0.weaponName )
		if Cac.IsReinforcement( f15_local0 ) then
			f15_local0.loot_type = ItemTypes.Reinforcement
		end
	elseif f15_local0.loot_type == ItemTypes.AttachKit then
		f15_local0.lootName = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.GlobalID, f15_arg0, AttachKitTable.Cols.Ref )
		f15_local0.weaponCategory = "Primary_AttachKit"
	elseif f15_local0.loot_type == ItemTypes.FurnitureKit then
		f15_local0.lootName = Engine.TableLookup( FurnitureKitTable.File, FurnitureKitTable.Cols.GlobalID, f15_arg0, FurnitureKitTable.Cols.Ref )
		f15_local0.weaponCategory = "Primary_FurnitureKit"
	elseif f15_local0.loot_type == ItemTypes.Playercard or f15_local0.loot_type == ItemTypes.Emblem or f15_local0.loot_type == ItemTypes.Reticle or f15_local0.loot_type == ItemTypes.Camo then
		f15_local0.name = Cac.GetNameFromStatsTableGUID( f15_arg0 )
		f15_local0.lootName = Cac.GetItemRefName( f15_arg0 )
	else
		assert( nil, "Unhandled guid-based loot_type: " .. (f15_local0.loot_type and "'" .. f15_local0.loot_type .. "'" or "nil") )
	end
	if f15_local0.weaponCategory and f15_local0.lootName and not f15_local0.ItemId then
		local f15_local4 = f15_local0.lootName
		if f15_local0.externalRef ~= nil then
			f15_local4 = f15_local0.externalRef
		end
		f15_local0.name = Cac.GetWeaponName( f15_local0.weaponCategory, f15_local4 )
		f15_local0.image = Cac.GetWeaponImage( f15_local0.weaponCategory, f15_local4 )
		f15_local0.desc = Cac.GetWeaponDescription( f15_local0.weaponCategory, f15_local4 )
	end
	if nil ~= Cac.SelectedWeaponIndex and f15_local0.weaponCategory and (f15_local0.baseRef or f15_local0.lootName or f15_local0.weaponName) and nil ~= LUI.CacStaticLayout.ClassLoc then
		local f15_local4 = LUI.CacDataProvider.GetRestricted
		local f15_local5 = f15_local0.weaponCategory
		local f15_local6 = f15_local0.baseRef
		if not f15_local6 then
			f15_local6 = f15_local0.lootName
			if not f15_local6 then
				f15_local6 = f15_local0.weaponName
			end
		end
		f15_local0.isRestricted = f15_local4( f15_local5, f15_local6, Cac.SelectedWeaponIndex )
	end
	if f15_local0.loot_type ~= ItemTypes.Reinforcement and f15_local0.loot_type ~= ItemTypes.SupplyDrop then
		if (f15_local0.category == nil or f15_local0.category == "") and f15_local0.weaponCategory and f15_local0.weaponName and not f15_local0.ItemId then
			f15_local0.weaponType = Cac.GetWeaponTypeFromWeapon( f15_local0.weaponCategory, f15_local0.weaponName )
			if f15_local0.weaponType then
				f15_local0.category = Engine.ToUpperCase( Cac.GetWeaponTypeDisplayName( f15_local0.weaponCategory, f15_local0.weaponType, f15_local0.weaponName ) )
			end
		end
		local f15_local4, f15_local5, f15_local6, f15_local7 = nil
		if (f15_local0.loot_type == ItemTypes.Playercard or f15_local0.unlockType == LUI.InventoryUtils.UnlockTypes.TITLE) and f15_local0.cardIndex then
			local f15_local8 = Engine.TableLookupGetRowNum( CallingCardTable.File, CallingCardTable.Cols.Ref, f15_local0.cardIndex )
			if f15_local8 ~= -1 then
				f15_local7 = Engine.TableLookupByRow( CallingCardTable.File, f15_local8, CallingCardTable.Cols.Image )
				f15_local4, f15_local5, f15_local6 = Cac.GetItemLockState( f15_local1, f15_arg0, f15_local7 )
				if nil ~= GetClanEntitlementDataForCard then
					local f15_local9 = GetClanEntitlementDataForCard( f15_local1, f15_local8 )
					if f15_local9 then
						f15_local0.lockedByClanEntitlement = f15_local9.lockedByClanEntitlement
					end
				end
			end
		elseif f15_local0.loot_type == ItemTypes.Playercard or f15_local0.loot_type == ItemTypes.Emblem or f15_local0.loot_type == ItemTypes.Feature then
			f15_local4, f15_local5, f15_local6 = Cac.GetItemLockState( f15_local1, f15_arg0, f15_local0.lootName )
			f15_local7 = f15_local0.lootName
		elseif f15_local0.loot_type == ItemTypes.Costume then
			f15_local4, f15_local5, f15_local6 = Cac.GetItemLockState( f15_local1, f15_arg0 )
			f15_local7 = f15_local0.lootName
		elseif f15_local0.loot_type == ItemTypes.CharacterCamo then
			f15_local4, f15_local5, f15_local6 = Cac.GetItemLockState( f15_local1, f15_arg0 )
			f15_local7 = f15_local0.lootName
		elseif f15_local0.loot_type == ItemTypes.AttachKit then
			f15_local0.statsData = GetWeaponVsAttachKitStatsData( f15_local0.gunData, f15_local0.lootName )
			f15_local7 = f15_local0.lootName
			f15_local4 = f15_arg2.lockState
			f15_local5 = f15_arg2.lockStatus
		elseif f15_local0.loot_type == ItemTypes.FurnitureKit then
			f15_local0.statsData = GetWeaponVsAttachKitStatsData( f15_local0.gunData, f15_local0.lootName )
			f15_local7 = f15_local0.lootName
			f15_local4 = f15_arg2.lockState
			f15_local5 = f15_arg2.lockStatus
		elseif f15_local0.loot_type == ItemTypes.Reticle or f15_local0.loot_type == ItemTypes.Camo then
			f15_local0.statsData = nil
			f15_local7 = Cac.GetUnlockItemRef( f15_local0.lootName )
			f15_local4, f15_local5, f15_local6 = Cac.GetClassItemLockState( f15_local1, nil, f15_local0.classLoc, f15_local0.weaponCategory, f15_local7 )
			if f15_local5 == Cac.ItemLockStatus.Unlocked then
				local f15_local8, f15_local9, f15_local10 = Cac.GetItemLockState( f15_local1, f15_arg0, f15_local0.lootName )
				if f15_local9 ~= Cac.ItemLockStatus.Unlocked then
					local f15_local11 = f15_local8
					local f15_local12 = f15_local9
					f15_local6 = f15_local10
					f15_local5 = f15_local12
					f15_local4 = f15_local11
					f15_local7 = f15_local0.lootName
				end
			end
		elseif f15_local0.ItemId and (f15_local0.lockState or f15_local0.lockStatus or f15_local0.unlockMessage) then
			local f15_local8 = f15_local0.lockState
			local f15_local9 = f15_local0.lockStatus
			local f15_local10 = f15_local0.unlockMessage
			f15_local7 = f15_local0.ItemId
			f15_local6 = f15_local10
			f15_local5 = f15_local9
			f15_local4 = f15_local8
		else
			f15_local0.statsData = GetWeaponStatsData( f15_local0.lootName, f15_local0.weaponName )
			local f15_local8 = Cac.GetWeaponRequiredAttachment( f15_local0.lootName )
			if f15_local8 and f15_local8 ~= "" then
				f15_local0.requiredAttachment = f15_local8
			end
			f15_local4, f15_local5, f15_local6 = Cac.GetClassItemLockState( f15_local1, f15_arg0, nil, f15_local0.weaponCategory, f15_local0.lootName )
			f15_local7 = Cac.GetUnlockItemRef( f15_local0.lootName )
		end
		if f15_local0.lockedByClanEntitlement and not Engine.GetDvarBool( "unlockAllItems" ) then
			if not Clan.IsEnabled() then
				local f15_local8 = "Hidden"
				local f15_local9 = Cac.ItemLockStatus.NotInInventory
				f15_local6 = ""
				f15_local5 = f15_local9
				f15_local4 = f15_local8
			else
				local f15_local8 = "Locked"
				local f15_local9 = Cac.ItemLockStatus.EntitlementNotUnlocked
				f15_local6 = Engine.Localize( "CLANS_UNLOCKED_VIA_CLAN_PROGRESSION" )
				f15_local5 = f15_local9
				f15_local4 = f15_local8
			end
		end
		local f15_local8 = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f15_local7, UnlockTable.Cols.Challenge )
		local f15_local9 = f15_local8 and f15_local8 ~= ""
		if f15_local5 == Cac.ItemLockStatus.DlcRequired then
			f15_local0.dlcRequirement = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f15_local7, UnlockTable.Cols.DlcLevel )
			f15_local0.dlcEarlyAccess = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f15_local7, UnlockTable.Cols.DlcEarlyAccess ) == "1"
			if not f15_local0.dlcRequirement or f15_local0.dlcRequirement == "" then
				f15_local0.dlcRequirement = 0
			end
		elseif f15_local5 == Cac.ItemLockStatus.LevelNotReached or f15_local5 == Cac.ItemLockStatus.PrestigeNotReached then
			f15_local0.rankRequirement = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f15_local7, UnlockTable.Cols.Rank )
			f15_local0.prestigeRequirement = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f15_local7, UnlockTable.Cols.PrestigeLevel )
			if not f15_local0.rankRequirement or f15_local0.rankRequirement == "" then
				f15_local0.rankRequirement = 0
			end
			if not f15_local0.prestigeRequirement or f15_local0.prestigeRequirement == "" then
				f15_local0.prestigeRequirement = 0
			end
		elseif f15_local5 == Cac.ItemLockStatus.ChallengeNotCompleted or f15_local9 then
			local f15_local10 = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f15_local7, UnlockTable.Cols.Challenge )
			if f15_local10 and f15_local10 ~= "" then
				local f15_local11 = string.len( f15_local10 )
				local f15_local12 = f15_local10
				local f15_local13 = nil
				if f15_local11 > 2 then
					local f15_local14 = string.sub( f15_local10, f15_local11 - 1, f15_local11 - 1 )
					local f15_local15 = tonumber( string.sub( f15_local10, f15_local11 ) )
					if f15_local14 == "_" and f15_local15 ~= nil then
						f15_local12 = string.sub( f15_local10, 0, f15_local11 - 2 )
						f15_local13 = f15_local15
					end
				end
				f15_local0.challengeRequirement = f15_local12
				f15_local0.challengeTier = f15_local13
				f15_local0.challengeData = GetChallengeData( f15_local1, f15_local0.challengeRequirement, false, f15_local0.challengeTier )
				if f15_local10 == "ch_prestige_max" then
					f15_local0.challengeData.Name = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX" )
					f15_local0.challengeData.Desc = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX_DESC" )
				end
				if f15_local10 == "ch_prestige_max_2" then
					f15_local0.challengeData.Name = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX2" )
					f15_local0.challengeData.Desc = Engine.Localize( "@CHALLENGE_PRESTIGE_MAX2_DESC" )
				end
			end
		end
		f15_local0.unlockTableRef = f15_local7
		f15_local0.isNew = LUI.InventoryUtils.GetItemNewStickerState( f15_local1, f15_local0.unlockTableRef )
		f15_local0.lockState = f15_local4
		f15_local0.isOwned = f15_local4 ~= "Locked"
		f15_local0.lockStatus = f15_local5
		f15_local0.unlockMessage = f15_local6
		if nil ~= RarityInfo and f15_arg0 and f15_arg0 ~= LUI.InventoryUtils.InvalidGuid then
			f15_local0.lootRarity = RarityInfo[Cac.GetLootRarity( f15_arg0 )]
		end
		if f15_arg0 and f15_arg0 ~= LUI.InventoryUtils.InvalidGuid then
			f15_local0.inventoryItemType = Engine.Inventory_GetItemTypeByGuid( f15_arg0 )
		end
	end
	Cac.SetCachedData_InventoryUtils_GetLootData( f15_local1, f15_arg0, f15_arg1, f15_arg2, f15_local0 )
	return f15_local0
end

LUI.InventoryUtils.GetAnyCACItemNewStickerState = function ()
	if Engine.InFrontend() then
		local f16_local0 = Engine.GetMaxControllerCount()
		for f16_local1 = 0, f16_local0 - 1, 1 do
			if Engine.HasActiveLocalClient( f16_local1 ) and Engine.GetAnyNewCACItemBreadcrumbState( f16_local1 ) then
				return true
			end
		end
	end
	return false
end

LUI.InventoryUtils.GetAnyPersonalizationNewStickerState = function ()
	if Engine.InFrontend() then
		local f17_local0 = Engine.GetMaxControllerCount()
		for f17_local1 = 0, f17_local0 - 1, 1 do
			if Engine.HasActiveLocalClient( f17_local1 ) and (LUI.InventoryUtils.GetCategoryNewStickerState( f17_local1, "Emblem" ) or LUI.InventoryUtils.GetCategoryNewStickerState( f17_local1, "CallingCard" )) then
				return true
			end
		end
	end
	return false
end

LUI.InventoryUtils.GetCategoryNewStickerState = function ( f18_arg0, f18_arg1 )
	if Engine.InFrontend() then
		local f18_local0 = Cac.BreadcrumbCategoryIndex[f18_arg1]
		if f18_local0 then
			return Engine.GetNewItemCategoryBreadcrumbState( f18_arg0 or Cac.GetSelectedControllerIndex(), f18_local0 )
		end
	end
	return false
end

LUI.InventoryUtils.GetSubCategoryNewStickerState = function ( f19_arg0, f19_arg1 )
	if Engine.InFrontend() then
		local f19_local0 = Cac.BreadcrumbSubCategoryIndex[f19_arg1]
		if f19_local0 then
			return Engine.GetNewItemSubCategoryBreadcrumbState( f19_arg0, f19_local0 )
		end
	end
	return false
end

LUI.InventoryUtils.GetItemNewStickerState = function ( f20_arg0, f20_arg1 )
	if Engine.InFrontend() then
		local f20_local0 = Engine.TableLookupGetRowNum( UnlockTable.File, UnlockTable.Cols.ItemId, f20_arg1 )
		if f20_local0 ~= -1 then
			local f20_local1, f20_local2, f20_local3 = Cac.GetItemLockState( f20_arg0, nil, f20_arg1, true )
			if f20_local2 == Cac.ItemLockStatus.Unlocked then
				return Engine.GetNewItemBreadcrumbState( f20_arg0, f20_local0 )
			end
		end
	end
	return false
end

LUI.InventoryUtils.SetNewStickerState = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	if Engine.InFrontend() then
		local f21_local0 = Engine.TableLookupGetRowNum( UnlockTable.File, UnlockTable.Cols.ItemId, f21_arg1 )
		local f21_local1 = Cac.BreadcrumbCategoryIndex[f21_arg2]
		if f21_local0 ~= -1 and f21_local1 then
			local f21_local2, f21_local3, f21_local4 = Cac.GetItemLockState( Cac.GetSelectedControllerIndex(), nil, f21_arg1, true )
			if f21_local3 == Cac.ItemLockStatus.Unlocked then
				local f21_local5 = Cac.BreadcrumbSubCategoryIndex[f21_arg3]
				if Cac.GetWeaponNameFromLootName( f21_arg1 ) == f21_arg1 then
					Engine.SetNewItemBreadcrumbState( f21_arg0, f21_local0, f21_local1, f21_local5, f21_arg4 )
				end
			end
		end
	end
end

LUI.InventoryUtils.MaxOverflowLoot = 2
LUI.InventoryUtils.InvalidGuid = "0x0"
LUI.InventoryUtils.IsOverflowLoot = function ( f22_arg0, f22_arg1 )
	for f22_local0 = 1, LUI.InventoryUtils.MaxOverflowLoot, 1 do
		if Engine.GetOverflowLootGuid( f22_arg0, f22_local0 - 1 ) == f22_arg1 then
			return true
		end
	end
	return false
end

LUI.InventoryUtils.GetNumOverflowLoot = function ( f23_arg0 )
	local f23_local0 = 0
	for f23_local1 = 1, LUI.InventoryUtils.MaxOverflowLoot, 1 do
		if Engine.GetOverflowLootGuid( f23_arg0, f23_local1 - 1 ) ~= LUI.InventoryUtils.InvalidGuid then
			f23_local0 = f23_local0 + 1
		end
	end
	return f23_local0
end

f0_local1 = function ( f24_arg0 )
	local f24_local0
	if f24_arg0 ~= ItemTypes.Weapon and f24_arg0 ~= ItemTypes.Costume then
		f24_local0 = false
	else
		f24_local0 = true
	end
	return f24_local0
end

f0_local2 = function ( f25_arg0 )
	local f25_local0 = assert
	local f25_local1 = CaoItems[f25_arg0]
	if f25_local1 then
		f25_local1 = #CaoItems[f25_arg0] > 0
	end
	f25_local0( f25_local1 )
	return CaoItems[f25_arg0][1].id
end

local f0_local3 = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	local f26_local0 = Cac.GetEquippedWeapon( f26_arg3, 0, f26_arg1, f26_arg2 )
	if Engine.IsDevelopmentBuild() then
		assert( f26_local0, "Cac.GetEquippedWeapon(" .. f26_arg3 .. ", 0, " .. f26_arg1 .. ", " .. f26_arg2 .. " ) returned nil" )
	end
	local f26_local1 = LUI.InventoryUtils.GetLootDataForRef( f26_arg3, f26_local0, f26_arg1, f26_arg2 )
	local f26_local2 = nil
	if f26_local1 ~= nil then
		f26_local2 = f26_local1.guid
	end
	if f26_local2 then
		local f26_local3, f26_local4, f26_local5 = Cac.GetItemLockState( f26_arg0, f26_local2, nil, true )
		local f26_local6 = Engine.Inventory_GetItemTypeByReference( f26_local0 )
		local f26_local7 = false
		if f26_local6 == Cac.InventoryItemType.Default and f26_local4 == Cac.ItemLockStatus.LevelNotReached then
			f26_local7 = true
		end
		if not f26_local7 and not Engine.IsGuidUnlocked( f26_arg0, f26_local2 ) then
			Cac.SelectEquippedWeapon( f26_arg3, 0, Cac.NullWeaponNames[f26_arg3], f26_arg1, f26_arg2 )
		end
	end
end

LUI.InventoryUtils.ValidateEquippedLootItems = function ( f27_arg0 )
	local f27_local0 = Cac.GetSelectedControllerIndex()
	Cac.SetSelectedControllerIndex( f27_arg0 )
	local f27_local1 = LUI.CacStaticLayout.ClassLoc
	LUI.CacStaticLayout.ClassLoc = Cac.GetCustomClassLoc()
	local f27_local2 = LUI.CacStaticLayout.ClassLoc
	local f27_local3 = Cac.GetCustomClassCount( f27_local2 )
	for f27_local4 = 0, f27_local3 - 1, 1 do
		f0_local3( f27_arg0, f27_local2, f27_local4, "Primary" )
		f0_local3( f27_arg0, f27_local2, f27_local4, "Secondary" )
	end
	for f27_local11, f27_local12 in pairs( Cao.Types ) do
		if Cao.CostumeFieldIsGlobal( f27_local12 ) then
			local f27_local7 = Cao.GetGearGuid( f27_local12, Cao.GetGlobalCostumeField( f27_local12 ) )
			if f27_local7 and not Engine.IsGuidUnlocked( f27_arg0, f27_local7 ) then
				Cao.SetGlobalCostumeField( f27_local12, f0_local2( f27_local12 ) )
			end
		end
		for f27_local8 = 0, CollectionTable.MaxCollections - 1, 1 do
			local f27_local10 = Cao.GetGearGuid( f27_local12, Cao.GetPerCostumeField( f27_local12, f27_local8 ) )
			if f27_local10 and not Engine.IsGuidUnlocked( f27_arg0, f27_local10 ) then
				Cao.SetPerCostumeField( f27_local12, f0_local2( f27_local12 ), f27_local8 )
			end
		end
	end
	if f27_local0 then
		Cac.SetSelectedControllerIndex( f27_local0 )
	else
		Cac.SetSelectedControllerIndex( Engine.GetFirstActiveController() )
	end
	LUI.CacStaticLayout.ClassLoc = f27_local1
end

LUI.InventoryUtils.ValidateEquippedLootItemsForAll = function ()
	local f28_local0 = Engine.GetMaxControllerCount()
	for f28_local1 = 0, f28_local0 - 1, 1 do
		if Engine.HasActiveLocalClient( f28_local1 ) then
			LUI.InventoryUtils.ValidateEquippedLootItems( f28_local1 )
		end
	end
end

LUI.InventoryUtils.ClearEquippedLootItem = function ( f29_arg0 )
	if f0_local1( f29_arg0.loot_type ) then
		if f29_arg0.loot_type == ItemTypes.Weapon then
			local f29_local0 = Cac.GetCustomClassLoc()
			local f29_local1 = Cac.GetCustomClassCount( f29_local0 )
			for f29_local2 = 0, f29_local1 - 1, 1 do
				if Cac.GetEquippedWeapon( "Primary", 0, f29_local0, f29_local2 ) == f29_arg0.lootName then
					Cac.SelectEquippedWeapon( "Primary", 0, Cac.NullWeaponName_Primary, f29_local0, f29_local2 )
				end
				if Cac.GetEquippedWeapon( "Secondary", 0, f29_local0, f29_local2 ) == f29_arg0.lootName then
					Cac.SelectEquippedWeapon( "Secondary", 0, Cac.NullWeaponName_Secondary, f29_local0, f29_local2 )
				end
			end
		elseif f29_arg0.loot_type == ItemTypes.Costume then
			local f29_local0 = Cao.GetGearCategory( f29_arg0.guid )
			if Cao.CostumeFieldIsGlobal( f29_local0 ) then
				if Cao.GetGearGuid( f29_local0, Cao.GetGlobalCostumeField( f29_local0 ) ) == f29_arg0.guid then
					Cao.SetGlobalCostumeField( f29_local0, f0_local2( f29_local0 ) )
				end
			else
				for f29_local1 = 0, CollectionTable.MaxCollections - 1, 1 do
					if Cao.GetGearGuid( f29_local0, Cao.GetPerCostumeField( f29_local0, f29_local1 ) ) == f29_arg0.guid then
						Cao.SetPerCostumeField( f29_local0, f0_local2( f29_local0 ), f29_local1 )
					end
				end
			end
		end
	end
end

LockTable( _M )
