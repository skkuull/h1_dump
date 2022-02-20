require( "LUI.mp_menus.s1CacUtils" )

LUI.CacDataProvider = {}
LUI.CacDataProvider.WeaponStats = {
	{
		name = "damage",
		statBars = true,
		dataProvider = Cac.GetWeaponDamage
	},
	{
		name = "accuracy",
		statBars = true,
		dataProvider = Cac.GetWeaponAccuracy
	},
	{
		name = "firerate",
		statBars = true,
		dataProvider = Cac.GetWeaponFireRate
	},
	{
		name = "range",
		statBars = true,
		dataProvider = Cac.GetWeaponRange
	},
	{
		name = "handling",
		statBars = true,
		dataProvider = Cac.GetWeaponHandling
	},
	{
		name = "mobility",
		statBars = true,
		dataProvider = Cac.GetWeaponMobility
	},
	{
		name = "total_ammo",
		statBars = false,
		dataProvider = Cac.GetWeaponAmmoCount
	},
	{
		name = "magazine",
		statBars = false,
		dataProvider = Cac.GetWeaponMagazineSize
	}
}
LUI.CacDataProvider.AttachKitStats = {
	{
		name = "damage",
		statBars = true,
		dataProvider = Cac.GetAttachKitDamage
	},
	{
		name = "accuracy",
		statBars = true,
		dataProvider = Cac.GetAttachKitAccuracy
	},
	{
		name = "firerate",
		statBars = true,
		dataProvider = Cac.GetAttachKitFireRate
	},
	{
		name = "range",
		statBars = true,
		dataProvider = Cac.GetAttachKitRange
	},
	{
		name = "handling",
		statBars = true,
		dataProvider = Cac.GetAttachKitHandling
	},
	{
		name = "mobility",
		statBars = true,
		dataProvider = Cac.GetAttachKitMobility
	},
	{
		name = "total_ammo",
		statBars = false,
		dataProvider = nil
	},
	{
		name = "magazine",
		statBars = false,
		dataProvider = nil
	},
	{
		name = "attachment",
		statBars = false,
		dataProvider = nil
	}
}
LUI.CacDataProvider.WeaponStatIcon = function ( f1_arg0 )
	return RegisterMaterial( "s1_cac_stats_icon_" .. f1_arg0 )
end

LUI.CacDataProvider.WeaponStatText = function ( f2_arg0 )
	return Engine.Localize( "LUA_MENU_WEAPSTATS_" .. f2_arg0 )
end

LUI.CacDataProvider.GetRestricted = function ( f3_arg0, f3_arg1, f3_arg2 )
	if MatchRules.IsUsingMatchRulesData() then
		if f3_arg1 == "none" or f3_arg1 == "specialty_null" or f3_arg1 == "iw5_combatknife" then
			return false
		elseif Cac.IsMatchPresetClass( LUI.CacStaticLayout.ClassLoc ) then
			return false
		end
		local f3_local0 = f3_arg1
		local f3_local1 = f3_arg0
		if f3_arg0 == "Primary" or f3_arg0 == "Secondary" or f3_arg0 == "Melee" then
			f3_local0 = Cac.GetWeaponNameFromLootName( f3_arg1 )
			f3_local1 = Cac.GetWeaponTypeFromWeapon( f3_arg0, f3_local0 )
		end
		if Cac.GetItemRestricted( f3_arg0, f3_local0, f3_arg1 ) then
			return true
		elseif f3_arg0 == "Primary_AttachKit" then
			f3_local1 = Cac.GetWeaponTypeFromWeapon( "Primary", Cac.GetEquippedWeapon( "Primary", 0, LUI.CacStaticLayout.ClassLoc ) )
		elseif f3_arg0 == "Primary_FurnitureKit" then
			f3_local1 = Cac.GetWeaponTypeFromWeapon( "Primary", Cac.GetEquippedWeapon( "Primary", 0, LUI.CacStaticLayout.ClassLoc ) )
		elseif f3_arg0 == "Secondary_AttachKit" then
			f3_local1 = Cac.GetWeaponTypeFromWeapon( "Secondary", Cac.GetEquippedWeapon( "Secondary", 0, LUI.CacStaticLayout.ClassLoc ) )
		elseif f3_arg0 == "Secondary_FurnitureKit" then
			f3_local1 = Cac.GetWeaponTypeFromWeapon( "Secondary", Cac.GetEquippedWeapon( "Secondary", 0, LUI.CacStaticLayout.ClassLoc ) )
		end
		if Cac.GetItemClassRestricted( f3_arg0, f3_local1 ) then
			return true
		end
	end
	return false
end

LUI.CacDataProvider.Default = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = {
		unlockRef = Cac.GetUnlockItemRef( f4_arg2 ),
		weaponCategory = f4_arg1,
		storageCategory = f4_arg0,
		id = f4_arg2,
		index = f4_arg3,
		buttonLocked = Cac.IsWeaponRequired( f4_arg0, f4_arg2, LUI.CacStaticLayout.ClassLoc ),
		restricted = LUI.CacDataProvider.GetRestricted( f4_arg1, f4_arg2 )
	}
	if Engine.InFrontend() then
		f4_local0.hasNew = LUI.InventoryUtils.GetCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f4_arg1 )
	end
	return f4_local0
end

LUI.CacDataProvider.Weapon = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = f5_arg2 or {}
	local f5_local1 = Cac.GetWeaponNameFromLootName( f5_arg1 )
	if f5_arg1 == Cac.NullWeaponNames[f5_arg0] then
		f5_local0.label = ""
		f5_local0.weaponType = ""
	else
		f5_local0.label = Cac.GetWeaponName( f5_arg0, f5_arg1 )
		f5_local0.weaponType = Cac.GetWeaponTypeDisplayName( f5_arg0, Cac.GetWeaponTypeFromWeapon( f5_arg0, f5_local1 ), f5_local1 )
	end
	f5_local0.stats = {}
	if f5_local1 ~= f5_arg1 then
		local f5_local2, f5_local3 = nil
		for f5_local7, f5_local8 in pairs( LUI.CacDataProvider.WeaponStats ) do
			f5_local2 = f5_local8.dataProvider( f5_local1 )
			f5_local3 = f5_local8.dataProvider( f5_arg1 )
			if f5_local2 ~= f5_local3 then
				f5_local0.stats[#f5_local0.stats + 1] = {
					name = f5_local8.name,
					upgrade = f5_local2 < f5_local3
				}
			end
		end
	end
	return f5_local0
end

LUI.CacDataProvider.Primary = function ( f6_arg0 )
	local f6_local0 = "Primary"
	local f6_local1 = LUI.CacDataProvider.Default( f6_local0, f6_local0, f6_arg0.primary, 0 )
	LUI.CacDataProvider.Weapon( f6_local0, f6_arg0.primary, f6_local1 )
	if f6_arg0.primaryCamo and f6_arg0.primaryCamo ~= Cac.NullWeaponName_Primary_Camo then
		f6_local1.camoImage = Cac.GetWeaponImage( "Primary_Camo", f6_arg0.primaryCamo )
		f6_local1.camoLabel = Cac.GetWeaponName( "Primary_Camo", f6_arg0.primaryCamo )
	end
	if f6_arg0.primaryReticle and f6_arg0.primaryReticle ~= Cac.NullWeaponName_Primary_Reticle then
		f6_local1.reticleImage = Cac.GetWeaponImage( "Primary_Reticle", f6_arg0.primaryReticle )
		f6_local1.reticleLabel = Cac.GetWeaponName( "Primary_Reticle", f6_arg0.primaryReticle )
	end
	return f6_local1
end

LUI.CacDataProvider.PrimaryAttachKit = function ( f7_arg0 )
	local f7_local0 = "Primary_AttachKit"
	local f7_local1 = LUI.CacDataProvider.Default( f7_local0, f7_local0, f7_arg0.primaryAttachKit, 0 )
	if not Cac.WeaponHasAttachKitsAvailable( Cac.GetSelectedControllerIndex(), f7_arg0.primary, "Primary" ) then
		f7_local1.elementDisabled = true
	end
	if Engine.InFrontend() and f7_local1.hasNew then
		local f7_local2 = false
		if f7_arg0.primary then
			for f7_local6, f7_local7 in pairs( Cac.GetAllDefinedAndValidWeapons( "Primary_AttachKit", nil, LUI.CacStaticLayout.ClassLoc, nil, Cac.NotPreorderWeapon, Cac.GetSelectedControllerIndex() ) ) do
				if LUI.InventoryUtils.GetItemNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetWeaponNameFromLootName( f7_arg0.primary ) .. " " .. f7_local7[1] ) then
					f7_local2 = true
					break
				end
			end
		end
		f7_local1.hasNew = f7_local2
	end
	if Cac.NullWeaponNames[f7_local1.weaponCategory] == f7_local1.id then
		f7_local1.label = ""
		if f7_local1.elementDisabled then
			f7_local1.label = Engine.Localize( "@LUA_MENU_NO_ATTACHKITS_AVAILABLE" )
		end
	else
		f7_local1.label = Cac.GetWeaponName( f7_local1.weaponCategory, f7_local1.id )
	end
	return f7_local1
end

LUI.CacDataProvider.PrimaryFurnitureKit = function ( f8_arg0 )
	local f8_local0 = "Primary_FurnitureKit"
	local f8_local1 = LUI.CacDataProvider.Default( f8_local0, f8_local0, f8_arg0.primaryFurnitureKit, 0 )
	if not Cac.WeaponHasFurnitureKitsAvailable( Cac.GetSelectedControllerIndex(), f8_arg0.primary, "Primary" ) then
		f8_local1.elementDisabled = true
	end
	if Engine.InFrontend() and f8_local1.hasNew then
		local f8_local2 = false
		if f8_arg0.primary then
			for f8_local6, f8_local7 in pairs( Cac.GetAllDefinedAndValidWeapons( "Primary_FurnitureKit", nil, LUI.CacStaticLayout.ClassLoc, nil, Cac.NotPreorderWeapon, Cac.GetSelectedControllerIndex() ) ) do
				if LUI.InventoryUtils.GetItemNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetWeaponNameFromLootName( f8_arg0.primary ) .. " " .. f8_local7[1] ) then
					f8_local2 = true
					break
				end
			end
		end
		f8_local1.hasNew = f8_local2
	end
	if Cac.NullWeaponNames[f8_local1.weaponCategory] == f8_local1.id then
		f8_local1.label = ""
		if f8_local1.elementDisabled then
			f8_local1.label = Engine.Localize( "@LUA_MENU_NO_FURNITUREKITS_AVAILABLE" )
		end
	else
		f8_local1.label = Cac.GetWeaponName( f8_local1.weaponCategory, f8_local1.id )
	end
	return f8_local1
end

LUI.CacDataProvider.Secondary = function ( f9_arg0 )
	local f9_local0 = "Secondary"
	local f9_local1 = Cac.HasOverkill() and "Primary" or "Secondary"
	local f9_local2 = LUI.CacDataProvider.Default( f9_local0, f9_local1, f9_arg0.secondary, 0 )
	LUI.CacDataProvider.Weapon( f9_local1, f9_arg0.secondary, f9_local2 )
	if f9_arg0.secondaryCamo and f9_arg0.secondaryCamo ~= Cac.NullWeaponName_Secondary_Camo then
		f9_local2.camoImage = Cac.GetWeaponImage( "Secondary_Camo", f9_arg0.secondaryCamo )
		f9_local2.camoLabel = Cac.GetWeaponName( "Secondary_Camo", f9_arg0.secondaryCamo )
	end
	if f9_arg0.secondaryReticle and f9_arg0.secondaryReticle ~= Cac.NullWeaponName_Secondary_Reticle then
		f9_local2.reticleImage = Cac.GetWeaponImage( "Secondary_Reticle", f9_arg0.secondaryReticle )
		f9_local2.reticleLabel = Cac.GetWeaponName( "Secondary_Reticle", f9_arg0.secondaryReticle )
	end
	return f9_local2
end

LUI.CacDataProvider.SecondaryAttachKit = function ( f10_arg0 )
	local f10_local0 = LUI.CacDataProvider.Default( "Secondary_AttachKit", Cac.HasOverkill() and "Primary_AttachKit" or "Secondary_AttachKit", f10_arg0.secondaryAttachKit, 0 )
	if not Cac.WeaponHasAttachKitsAvailable( Cac.GetSelectedControllerIndex(), f10_arg0.secondary, "Secondary" ) then
		f10_local0.elementDisabled = true
	end
	if Engine.InFrontend() and f10_local0.hasNew then
		local f10_local1 = false
		if f10_arg0.secondary then
			for f10_local5, f10_local6 in pairs( Cac.GetAllDefinedAndValidWeapons( "Secondary_AttachKit", nil, LUI.CacStaticLayout.ClassLoc, nil, Cac.NotPreorderWeapon, Cac.GetSelectedControllerIndex() ) ) do
				if LUI.InventoryUtils.GetItemNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetWeaponNameFromLootName( f10_arg0.secondary ) .. " " .. f10_local6[1] ) then
					f10_local1 = true
					break
				end
			end
		end
		f10_local0.hasNew = f10_local1
	end
	if Cac.NullWeaponNames[f10_local0.weaponCategory] == f10_local0.id then
		f10_local0.label = ""
		if f10_local0.elementDisabled then
			f10_local0.label = Engine.Localize( "@LUA_MENU_NO_ATTACHKITS_AVAILABLE" )
		end
	else
		f10_local0.label = Cac.GetWeaponName( f10_local0.weaponCategory, f10_local0.id )
	end
	return f10_local0
end

LUI.CacDataProvider.SecondaryFurnitureKit = function ( f11_arg0 )
	local f11_local0 = LUI.CacDataProvider.Default( "Secondary_FurnitureKit", Cac.HasOverkill() and "Primary_FurnitureKit" or "Secondary_FurnitureKit", f11_arg0.secondaryFurnitureKit, 0 )
	if not Cac.WeaponHasFurnitureKitsAvailable( Cac.GetSelectedControllerIndex(), f11_arg0.secondary, "Secondary" ) then
		f11_local0.elementDisabled = true
	end
	if Engine.InFrontend() and f11_local0.hasNew then
		local f11_local1 = false
		if f11_arg0.secondary then
			for f11_local5, f11_local6 in pairs( Cac.GetAllDefinedAndValidWeapons( "Secondary_FurnitureKit", nil, LUI.CacStaticLayout.ClassLoc, nil, Cac.NotPreorderWeapon, Cac.GetSelectedControllerIndex() ) ) do
				if LUI.InventoryUtils.GetItemNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetWeaponNameFromLootName( f11_arg0.secondary ) .. " " .. f11_local6[1] ) then
					f11_local1 = true
					break
				end
			end
		end
		f11_local0.hasNew = f11_local1
	end
	if Cac.NullWeaponNames[f11_local0.weaponCategory] == f11_local0.id then
		f11_local0.label = ""
		if f11_local0.elementDisabled then
			f11_local0.label = Engine.Localize( "@LUA_MENU_NO_FURNITUREKITS_AVAILABLE" )
		end
	else
		f11_local0.label = Cac.GetWeaponName( f11_local0.weaponCategory, f11_local0.id )
	end
	return f11_local0
end

LUI.CacDataProvider.Melee = function ( f12_arg0 )
	local f12_local0 = "Melee"
	local f12_local1 = LUI.CacDataProvider.Default( f12_local0, f12_local0, f12_arg0.melee, 0 )
	if f12_arg0.melee then
		LUI.CacDataProvider.Weapon( f12_local0, f12_arg0.melee, f12_local1 )
	end
	if Engine.InFrontend() and f12_local1.hasNew then
		local f12_local2 = false
		if f12_arg0.melee then
			for f12_local6, f12_local7 in pairs( Cac.GetAllDefinedAndValidWeapons( "Melee", nil, LUI.CacStaticLayout.ClassLoc, nil, Cac.NotPreorderWeapon, Cac.GetSelectedControllerIndex() ) ) do
				if LUI.InventoryUtils.GetItemNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetWeaponNameFromLootName( f12_arg0.melee ) .. " " .. f12_local7[1] ) then
					f12_local2 = true
					break
				end
			end
		end
		f12_local1.hasNew = f12_local2
	end
	return f12_local1
end

LUI.CacDataProvider.Tactical = function ( f13_arg0 )
	local f13_local0 = LUI.CacDataProvider.Default( "Tactical", "Tactical", f13_arg0.tactical, 0 )
	if Cac.NullWeaponNames[f13_local0.weaponCategory] == f13_local0.id then
		f13_local0.label = ""
	else
		f13_local0.label = Cac.GetWeaponName( f13_local0.weaponCategory, f13_local0.id )
	end
	return f13_local0
end

LUI.CacDataProvider.Lethal = function ( f14_arg0, f14_arg1 )
	local f14_local0 = "Lethal"
	local f14_local1 = "Lethal"
	local f14_local2 = nil
	if f14_arg1 > 0 then
		f14_local2 = f14_arg0["lethal" .. f14_arg1 + 1]
	else
		f14_local2 = f14_arg0.lethal
	end
	local f14_local3 = LUI.CacDataProvider.Default( f14_local0, f14_local1, f14_local2, f14_arg1 )
	if dualTacticals then
		if f14_arg1 == 0 then
			f14_local3.elementExpanded = true
		else
			f14_local3.elementHidden = true
		end
	end
	if f14_arg1 > 0 and (dualTacticals or f14_arg0.lethal == Cac.NullWeaponNames[f14_local3.weaponCategory]) then
		f14_local3.elementDisabled = true
	end
	if Cac.NullWeaponNames[f14_local3.weaponCategory] == f14_local3.id then
		f14_local3.label = ""
	elseif f14_arg1 > 0 then
		f14_local3.label = "x2"
	else
		f14_local3.label = Cac.GetWeaponName( f14_local3.weaponCategory, f14_local3.id )
	end
	return f14_local3
end

LUI.CacDataProvider.Perk = function ( f15_arg0, f15_arg1 )
	local f15_local0 = "Perk_Slot" .. f15_arg1
	local f15_local1 = LUI.CacDataProvider.Default( f15_local0, f15_local0, f15_arg0["perk" .. f15_arg1], 0 )
	if Cac.NullWeaponNames[f15_local1.weaponCategory] == f15_local1.id then
		f15_local1.label = ""
	else
		f15_local1.label = Cac.GetWeaponName( f15_local1.weaponCategory, f15_local1.id )
	end
	return f15_local1
end

LUI.CacDataProvider.Streak = function ( f16_arg0, f16_arg1 )
	local f16_local0 = "Streak"
	local f16_local1 = LUI.CacDataProvider.Default( f16_local0, f16_local0, f16_arg0["killstreak" .. f16_arg1 + 1], f16_arg1 )
	f16_local1.label = Engine.Localize( "@MENU_SCORESTREAK_SLOT_LABEL", f16_arg1 + 1 )
	f16_local1.modules = {}
	f16_local1.modules[1] = f16_arg0["killstreakModule" .. f16_arg1 + 1 .. "a"]
	f16_local1.modules[2] = f16_arg0["killstreakModule" .. f16_arg1 + 1 .. "b"]
	f16_local1.modules[3] = f16_arg0["killstreakModule" .. f16_arg1 + 1 .. "c"]
	if Cac.NullWeaponNames[f16_local1.weaponCategory] == f16_local1.id then
		f16_local1.streakName = ""
		f16_local1.streakCost = ""
	else
		f16_local1.streakName = Cac.GetWeaponName( f16_local1.weaponCategory, f16_local1.id )
		f16_local1.streakCost = Cac.GetStreakCost( f16_local1.id ) + Cac.GetStreakModuleCost( f16_local1.modules[1] ) + Cac.GetStreakModuleCost( f16_local1.modules[2] ) + Cac.GetStreakModuleCost( f16_local1.modules[3] )
	end
	f16_local1.moduleRestricted = {}
	f16_local1.haveRestrictedModules = false
	for f16_local2 = 1, 3, 1 do
		local f16_local5 = LUI.CacDataProvider.GetRestricted( "StreakModules", f16_local1.modules[f16_local2], f16_arg1 )
		f16_local1.moduleRestricted[f16_local2] = f16_local5
		f16_local1.haveRestrictedModules = f16_local1.haveRestrictedModules or f16_local5
	end
	return f16_local1
end

