Cao = {
	Types = {
		Gender = "gender",
		Shirt = "shirt",
		Head = "head",
		Gloves = "gloves"
	},
	CategoryIndices = {
		Gender = 0,
		Shirt = 1,
		Head = 2,
		Gloves = 3
	},
	CustomizationType = {
		Gender = 0,
		Shirt = 1,
		Head = 2,
		Gloves = 3
	},
	CustomizationIdx = {
		"gender",
		"shirt",
		"head",
		"gloves"
	},
	Gender = {
		Male = 1,
		Female = 2
	},
	Category2Type = {},
	CategoryIndexMap = {},
	TypeHexIDs = {},
	GlobalFields = {},
	Category2Type = Cao.CustomizationType.Gender,
	Category2Type = Cao.CustomizationType.Shirt,
	Category2Type = Cao.CustomizationType.Head,
	Category2Type = Cao.CustomizationType.Gloves,
	CategoryIndexMap = Cao.CategoryIndices.Gender,
	CategoryIndexMap = Cao.CategoryIndices.Shirt,
	CategoryIndexMap = Cao.CategoryIndices.Head,
	CategoryIndexMap = Cao.CategoryIndices.Gloves,
	TypeHexIDs = "0x62",
	TypeHexIDs = "0x63",
	TypeHexIDs = "0x69",
	GlobalFields = true,
	GlobalFields = true
}
CaoMenu = {
	MenuIndex = {
		Head = 1,
		Eyewear = 2,
		Hat = 3,
		Shirt = 4,
		Gear = 5,
		Gloves = 6,
		Pants = 7,
		Kneepads = 8,
		Shoes = 9,
		Exo = 10
	},
	OutfitStartIndex = 2,
	Data = {},
	Data = {
		GearType = Cao.Types.Head,
		Label = "@MPUI_HEAD"
	},
	Data = {
		GearType = Cao.Types.Shirt,
		Label = "@MPUI_SHIRT_TOP"
	},
	Data = {
		GearType = Cao.Types.Gloves,
		Label = "@MPUI_GLOVES"
	}
}
CaoItems = {}
GearTable = {
	File = "mp/CostumeIdTable.csv",
	Cols = {
		Category = 0,
		Index = 1,
		ModelStartIndex = 2,
		Collection = 3,
		Id = 4,
		Name = 5,
		Icon = 6,
		GUID = 7,
		NumOverrides = 8,
		Group0 = 9,
		Group1 = 10,
		Group2 = 11,
		Group3 = 12,
		Group4 = 13,
		Group5 = 14,
		Group6 = 15,
		Group7 = 16,
		Group8 = 17
	}
}
CharacterCamoTable = {
	File = "mp/characterCamoTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Description = 3,
		Image = 4,
		AllyUrban = 5,
		AllyWoodland = 6,
		AllySnow = 7,
		AllyDesert = 8,
		AxisUrban = 9,
		AxisWoodland = 10,
		AxisSnow = 11,
		AxisDesert = 12,
		Guid = 14
	}
}
OverrideTable = {
	File = "mp/CostumeOverrideTable.csv",
	Cols = {
		Model = 0,
		Id = 1,
		GUID = 2,
		OverrideMat = 3,
		OverrideViewMat = 4,
		Icon = 5,
		Name = 6
	}
}
if Engine.IsCurrentGen() then
	GearTable.File = "mp/CostumeIdTable_cg.csv"
	OverrideTable.File = "mp/CostumeOverrideTable_cg.csv"
else
	GearTable.File = "mp/CostumeIdTable.csv"
	OverrideTable.File = "mp/CostumeOverrideTable.csv"
end
CollectionTable = {
	File = "mp/costumeCollectionTable.csv",
	Cols = {
		Id = 0,
		Key = 1,
		Name = 2,
		RankReq = 3
	},
	MaxCollections = 10
}
Cao.CostumeFieldIsGlobal = function ( f1_arg0 )
	return Cao.GlobalFields[f1_arg0] == true
end

Cao.GetGlobalCostumeField = function ( f2_arg0 )
	return Engine.GetPlayerData( Cac.GetSelectedControllerIndex(), CoD.StatsGroup.Common, "globalCostume", f2_arg0 )
end

Cao.GetPerCostumeField = function ( f3_arg0, f3_arg1 )
	return Engine.GetPlayerData( Cac.GetSelectedControllerIndex(), CoD.StatsGroup.Common, "costumes", f3_arg1, f3_arg0 )
end

Cao.GetActiveOutfitIndex = function ()
	return Engine.GetPlayerData( Cac.GetSelectedControllerIndex(), CoD.StatsGroup.Common, "activeCostume" )
end

Cao.SetActiveOutfitIndex = function ( f5_arg0 )
	if f5_arg0 == Cao.GetActiveOutfitIndex() then
		return 
	else
		local f5_local0 = Cac.GetSelectedControllerIndex()
		Engine.SetPlayerCostumeFieldUpdate( f5_local0 )
		return Engine.SetPlayerData( f5_local0, CoD.StatsGroup.Common, "activeCostume", f5_arg0 )
	end
end

Cao.GetActiveCostume = function ()
	return Cao.GetCostumeByIndex( Cao.GetActiveOutfitIndex() )
end

Cao.GetCostumeByIndex = function ( f7_arg0 )
	return {
		[Cao.Types.Gender] = Cao.GetGlobalCostumeField( Cao.Types.Gender ),
		[Cao.Types.Head] = Cao.GetGlobalCostumeField( Cao.Types.Head ),
		[Cao.Types.Shirt] = Cao.GetPerCostumeField( Cao.Types.Shirt, f7_arg0 ),
		[Cao.Types.Gloves] = Cao.GetPerCostumeField( Cao.Types.Gloves, f7_arg0 )
	}
end

Cao.SendCostumesToVLobby = function ()
	local f8_local0 = Cac.GetSelectedControllerIndex()
	local f8_local1 = 4
	local f8_local2 = ""
	for f8_local3 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.HasActiveLocalClient( f8_local3 ) then
			Cac.SetSelectedControllerIndex( f8_local3 )
			local f8_local6 = "" .. f8_local3 .. "|" .. Cao.GetActiveOutfitIndex()
			for f8_local7 = 0, f8_local1 - 1, 1 do
				local f8_local10 = Cao.GetCostumeByIndex( f8_local7 )
				f8_local6 = f8_local6 .. "|" .. f8_local7
				for f8_local11 = 1, #Cao.CustomizationIdx, 1 do
					f8_local6 = f8_local6 .. "," .. f8_local10[Cao.CustomizationIdx[f8_local11]]
				end
			end
			if f8_local2 == "" then
				f8_local2 = f8_local6
			else
				f8_local2 = f8_local2 .. "#" .. f8_local6
			end
		end
	end
	DebugPrint( "NotifyServer costumes " .. f8_local2 )
	Cac.NotifyVirtualLobby( "costumes", f8_local2 )
	Cac.SetSelectedControllerIndex( f8_local0 )
end

Cao.SetGlobalCostumeField = function ( f9_arg0, f9_arg1 )
	local f9_local0 = Cac.GetSelectedControllerIndex()
	DebugPrint( "SetGlobalCostumeField() controller: " .. f9_local0 .. " field: " .. f9_arg0 .. " value: " .. f9_arg1 )
	Engine.SetPlayerCostumeFieldUpdate( f9_local0 )
	return Engine.SetPlayerData( f9_local0, CoD.StatsGroup.Common, "globalCostume", f9_arg0, f9_arg1 )
end

Cao.SetPerCostumeField = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Cac.GetSelectedControllerIndex()
	DebugPrint( "SetPerCostumeField() controller: " .. f10_local0 .. " field: " .. f10_arg0 .. " value: " .. f10_arg1 .. " costume: " .. f10_arg2 )
	if f10_arg2 == Cao.GetActiveOutfitIndex() then
		Engine.SetPlayerCostumeFieldUpdate( f10_local0 )
	end
	return Engine.SetPlayerData( f10_local0, CoD.StatsGroup.Common, "costumes", f10_arg2, f10_arg0, f10_arg1 )
end

Cao.SetCostume = function ( f11_arg0, f11_arg1 )
	local f11_local0 = true
	if f11_local0 then
		f11_local0 = Cao.SetGlobalCostumeField( Cao.Types.Gender, f11_arg0.gender )
	end
	if f11_local0 then
		f11_local0 = Cao.SetGlobalCostumeField( Cao.Types.Shirt, f11_arg0.shirt )
	end
	if f11_local0 then
		f11_local0 = Cao.SetPerCostumeField( Cao.Types.Head, f11_arg0.head, f11_arg1 )
	end
	if f11_local0 then
		f11_local0 = Cao.SetPerCostumeField( Cao.Types.Gloves, f11_arg0.gloves, f11_arg1 )
	end
	return f11_local0
end

Cao.GetHeadGender = function ( f12_arg0 )
	for f12_local0 = GearTable.Cols.Group0, GearTable.Cols.Group8, 1 do
		if Engine.LookupCostumeTableColumnForGUID( f12_arg0, f12_local0 ) == "female" then
			return Cao.Gender.Female
		end
	end
	return Cao.Gender.Male
end

Cao.GetGearGuid = function ( f13_arg0, f13_arg1 )
	local f13_local0 = CaoItems[f13_arg0]
	if f13_local0 then
		for f13_local1 = 1, #f13_local0, 1 do
			if f13_local0[f13_local1].id == f13_arg1 then
				return f13_local0[f13_local1].guid
			end
		end
	end
	return nil
end

Cao.GetCollectionName = function ( f14_arg0 )
	return Engine.TableLookup( CollectionTable.File, CollectionTable.Cols.Id, f14_arg0, CollectionTable.Cols.Name )
end

Cao.IsValidVariant = function ( f15_arg0 )
	local f15_local0 = Engine.LookupStatsTableColumnForGUID( f15_arg0, StatsTable.Cols.Name )
	if f15_local0 and f15_local0 ~= "" then
		return true
	else
		return false
	end
end

Cao.GetDisplayOrder = function ( f16_arg0 )
	return tonumber( Engine.LookupStatsTableColumnForGUID( f16_arg0, StatsTable.Cols.DisplayOrder ) )
end

Cao.GearNameRaw = function ( f17_arg0 )
	return Engine.LookupStatsTableColumnForGUID( f17_arg0, StatsTable.Cols.Name )
end

Cao.GearName = function ( f18_arg0 )
	return Engine.Localize( "@" .. Cao.GearNameRaw( f18_arg0 ) )
end

Cao.GetGearReference = function ( f19_arg0 )
	return Engine.LookupStatsTableColumnForGUID( f19_arg0, StatsTable.Cols.WeaponRef )
end

Cao.GetGearImageRaw = function ( f20_arg0 )
	return Engine.LookupStatsTableColumnForGUID( f20_arg0, StatsTable.Cols.Image )
end

Cao.GetGearImage = function ( f21_arg0 )
	return RegisterMaterial( Cao.GetGearImageRaw( f21_arg0 ) )
end

Cao.GetGearCategory = function ( f22_arg0 )
	local f22_local0 = Lobby.GetCostumeGuidVariant( f22_arg0 )
	return Engine.LookupCostumeTableColumnForGUID( Lobby.GetCostumeGuid( f22_arg0, 0 ), GearTable.Cols.Category )
end

Cao.GetBaseGUID = function ( f23_arg0 )
	return Lobby.GetCostumeGuid( f23_arg0, 0 )
end

Cao.FixGearGuid = function ( f24_arg0, f24_arg1 )
	if f24_arg1 == 0 then
		return f24_arg0
	else
		return Lobby.GetCostumeGuid( f24_arg0, f24_arg1 )
	end
end

Cao.GearId = function ( f25_arg0, f25_arg1 )
	local f25_local0 = Lobby.GetCostumeGuidVariant( f25_arg0 )
	local f25_local1 = tonumber( Engine.LookupCostumeTableColumnForGUID( f25_arg1, GearTable.Cols.Id ) )
	if f25_local0 ~= 0 then
		return Lobby.GetCostumeId( f25_local1, f25_local0 )
	else
		return f25_local1
	end
end

Cao.CategoryToIndex = function ( f26_arg0 )
	local f26_local0 = Cao.CategoryIndexMap[f26_arg0]
	if f26_local0 ~= nil then
		return f26_local0
	else
		return 0
	end
end

Cao.GetCategoryNameSingle = function ( f27_arg0 )
	return Engine.Localize( "@LUA_MENU_GEARTYPE_SINGLE_" .. f27_arg0 )
end

Cao.VLobbyPreviewCostume = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	local f28_local0 = f28_arg0 or Engine.GetFirstActiveController()
	if f28_arg2 == nil then
		f28_arg2 = "none"
		f28_arg3 = 0
	end
	Cac.NotifyVirtualLobby( "costume_preview", f28_local0 .. ":" .. f28_arg1 .. "," .. f28_arg2 .. "," .. f28_arg3 )
end

Cao.VLobbySaveCostume = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	Cac.NotifyVirtualLobby( "costume_apply", (f29_arg0 or Engine.GetFirstActiveController()) .. ":" .. f29_arg1 .. "," .. f29_arg2 .. "," .. f29_arg3 )
end

Cao.GetCallingCard = function ( f30_arg0 )
	return Engine.GetPlayerData( f30_arg0, CoD.StatsGroup.Common, "callingCardIndex" )
end

Cao.SetCallingCard = function ( f31_arg0, f31_arg1 )
	Engine.SetPlayerData( f31_arg0, CoD.StatsGroup.Common, "callingCardIndex", f31_arg1 )
end

Cao.GetEmblemPatch = function ( f32_arg0 )
	return Engine.GetPlayerData( f32_arg0, CoD.StatsGroup.Common, "emblemPatchIndex" )
end

Cao.SetEmblemPatch = function ( f33_arg0, f33_arg1 )
	Engine.SetPlayerData( f33_arg0, CoD.StatsGroup.Common, "emblemPatchIndex", f33_arg1 )
end

function ParseCaoItems()
	CaoItems = {}
	local f34_local0 = 0
	while true do
		local f34_local1 = Engine.TableLookupByRow( GearTable.File, f34_local0, 0 )
		if f34_local1 == "" then
			
		elseif CaoItems[f34_local1] == nil then
			CaoItems[f34_local1] = {}
		end
		local f34_local2 = Engine.TableLookupByRow( GearTable.File, f34_local0, GearTable.Cols.NumOverrides )
		local f34_local3 = Engine.TableLookupByRow( GearTable.File, f34_local0, GearTable.Cols.GUID )
		local f34_local4 = Engine.TableLookupByRow( GearTable.File, f34_local0, GearTable.Cols.Id )
		local f34_local5 = Engine.TableLookupByRow( GearTable.File, f34_local0, GearTable.Cols.Icon )
		local f34_local6 = Engine.TableLookupByRow( GearTable.File, f34_local0, GearTable.Cols.Name )
		CaoItems[f34_local1][#CaoItems[f34_local1] + 1] = {
			category = f34_local1,
			guid = f34_local3,
			baseGuid = f34_local3,
			id = Cao.GearId( f34_local3, f34_local3 ),
			name = Cao.GearName( f34_local3 ),
			nameDebug = Cao.GearNameRaw( f34_local3 ),
			image = Cao.GetGearImage( f34_local3 ),
			imageDebug = Cao.GetGearImageRaw( f34_local3 ),
			lootRarity = Cac.GetLootRarity( f34_local3 ) + 1,
			loot_type = ItemTypes.Costume,
			displayOrder = Cao.GetDisplayOrder( f34_local3 )
		}
		if f34_local2 ~= "" then
			local f34_local7 = tonumber( f34_local2 )
			local f34_local8 = 1
			while f34_local7 > 0 and f34_local8 < 128 do
				local f34_local9 = Cao.FixGearGuid( f34_local3, f34_local8 )
				if (f34_local9 == "0x6B0C001" or f34_local9 == "0x6b0c001") and not Engine.IsXbox360() and not Engine.IsXB3() then
					f34_local7 = f34_local7 - 1
				elseif Cao.IsValidVariant( f34_local9 ) then
					local f34_local10 = {
						category = f34_local1,
						baseGuid = f34_local3,
						guid = f34_local9,
						id = Cao.GearId( f34_local9, f34_local3 ),
						name = Cao.GearName( f34_local9 ),
						nameDebug = Cao.GearNameRaw( f34_local9 ),
						image = Cao.GetGearImage( f34_local9 ),
						imageDebug = Cao.GetGearImageRaw( f34_local9 ),
						lootRarity = Cac.GetLootRarity( f34_local10.guid ) + 1,
						loot_type = ItemTypes.Costume,
						displayOrder = Cao.GetDisplayOrder( f34_local9 )
					}
					CaoItems[f34_local1][#CaoItems[f34_local1] + 1] = f34_local10
					f34_local7 = f34_local7 - 1
				end
				f34_local8 = f34_local8 + 1
			end
		end
		f34_local0 = f34_local0 + 1
	end
end

ParseCaoItems()
