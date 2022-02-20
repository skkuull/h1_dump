local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepot = InheritFrom( LUI.MPDepotBase )
LUI.MPDepot.SupplyCrateTypes = {
	AW_Common = "aw_basic",
	AW_Rare = "aw_advanced",
	Onboarding = "onboarding",
	LS_Common = "ls_basic",
	LS_Rare = "ls_advanced",
	LS_Promo = "ls_promo",
	CH_Common = "ch_basic",
	CH_Rare = "ch_advanced",
	CH_Promo = "ch_promo",
	EX_Promo_1 = "ex_promo_1",
	EX_Promo_2 = "ex_promo_2",
	EX_Promo_3 = "ex_promo_3",
	EX_Promo_4 = "ex_promo_4",
	EX_Promo_5 = "ex_promo_5",
	EX_Promo_6 = "ex_promo_6",
	EX_Promo_7 = "ex_promo_7",
	EX_Promo_8 = "ex_promo_8",
	EX_Promo_9 = "ex_promo_9",
	EX_Promo_10 = "ex_promo_10",
	EX_Promo_11 = "ex_promo_11",
	EX_Promo_12 = "ex_promo_12",
	EX_Promo_13 = "ex_promo_13",
	EX_Promo_14 = "ex_promo_14",
	EX_Promo_15 = "ex_promo_15",
	EX_Promo_16 = "ex_promo_16"
}
LUI.MPDepot.LootDrops = {
	Drop1 = 1,
	Drop2 = 2,
	Drop3 = 3
}
LUI.MPDepot.LootDropCategory = {
	LootDrop1 = LUI.MPDepot.LootDrops.Drop1,
	LootDrop2 = LUI.MPDepot.LootDrops.Drop1,
	LootDrop3 = LUI.MPDepot.LootDrops.Drop2,
	LootDrop4 = LUI.MPDepot.LootDrops.Drop2,
	LootDrop5 = LUI.MPDepot.LootDrops.Drop3,
	LootDrop6 = LUI.MPDepot.LootDrops.Drop3
}
LUI.MPDepot.LootDropsData = {
	[LUI.MPDepot.LootDrops.Drop3 .. "_promo"] = {
		name = "@DEPOT_PROMO_2",
		lootTableColName = "LootDrop5:2",
		icon = "loot_drop_event_2_icon"
	},
	[LUI.MPDepot.LootDrops.Drop3] = {
		name = "@DEPOT_SEASON_3",
		lootTableColName = "LootDrop5|LootDrop6",
		icon = "loot_drop_3_icon"
	},
	[LUI.MPDepot.LootDrops.Drop3 .. "_common"] = {
		name = "@DEPOT_SEASON_3",
		lootTableColName = "LootDrop5|LootDrop6",
		icon = "loot_drop_3_icon_common"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_1"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "depot_card_back_lionstrike_legendary"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_2"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "loot_drop_rare_weaponkit_icon"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_3"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "loot_drop_ex_promo_3_icon"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_4"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "h1_depot_crate_icon_ballisticmelee"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_5"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "h1_depot_crate_icon_ballisticmelee"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_6"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop1|LootDrop2",
		icon = "loot_drop_1_icon"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_7"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "loot_drop_2_icon"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_8"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop1|LootDrop2",
		icon = "loot_drop_rare_weaponkit_icon"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_9"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop5|LootDrop6",
		icon = "loot_drop_3_icon"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_10"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop5|LootDrop6",
		icon = "depot_card_back_lionstrike_legendary"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_11"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop5|LootDrop6",
		icon = "loot_drop_rare_weaponkit_icon"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_12"] = {
		name = "@DEPOT_PROMO3",
		lootTableColName = "LootDrop5|LootDrop6",
		icon = "h1_depot_crate_icon_ballisticmelee"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_promo"] = {
		name = "@DEPOT_PROMO_1",
		lootTableColName = "LootDrop3:1",
		icon = "loot_drop_event_1_icon"
	},
	[LUI.MPDepot.LootDrops.Drop2] = {
		name = "@DEPOT_SEASON_2",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "loot_drop_2_icon"
	},
	[LUI.MPDepot.LootDrops.Drop2 .. "_common"] = {
		name = "@DEPOT_SEASON_2",
		lootTableColName = "LootDrop3|LootDrop4",
		icon = "loot_drop_2_icon_common"
	},
	[LUI.MPDepot.LootDrops.Drop1] = {
		name = "@DEPOT_SEASON_1",
		lootTableColName = "LootDrop1|LootDrop2",
		icon = "loot_drop_1_icon"
	},
	[LUI.MPDepot.LootDrops.Drop1 .. "_common"] = {
		name = "@DEPOT_SEASON_1",
		lootTableColName = "LootDrop1|LootDrop2",
		icon = "loot_drop_1_icon_common"
	}
}
LUI.MPDepot.SuppyDropLootStream = {
	[LUI.MPDepot.SupplyCrateTypes.AW_Common] = LUI.MPDepot.LootDrops.Drop1 .. "_common",
	[LUI.MPDepot.SupplyCrateTypes.AW_Rare] = LUI.MPDepot.LootDrops.Drop1,
	[LUI.MPDepot.SupplyCrateTypes.Onboarding] = LUI.MPDepot.LootDrops.Drop1,
	[LUI.MPDepot.SupplyCrateTypes.LS_Common] = LUI.MPDepot.LootDrops.Drop2 .. "_common",
	[LUI.MPDepot.SupplyCrateTypes.LS_Rare] = LUI.MPDepot.LootDrops.Drop2,
	[LUI.MPDepot.SupplyCrateTypes.LS_Promo] = LUI.MPDepot.LootDrops.Drop2 .. "_promo",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_1] = LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_1",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_2] = LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_2",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_3] = LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_3",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_4] = LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_4",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_5] = LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_5",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_6] = LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_6",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_7] = LUI.MPDepot.LootDrops.Drop2 .. "_ex_promo_7",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_8] = LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_8",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_9] = LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_9",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_10] = LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_10",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_11] = LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_11",
	[LUI.MPDepot.SupplyCrateTypes.EX_Promo_12] = LUI.MPDepot.LootDrops.Drop1 .. "_ex_promo_12",
	[LUI.MPDepot.SupplyCrateTypes.CH_Common] = LUI.MPDepot.LootDrops.Drop3 .. "_common",
	[LUI.MPDepot.SupplyCrateTypes.CH_Rare] = LUI.MPDepot.LootDrops.Drop3,
	[LUI.MPDepot.SupplyCrateTypes.CH_Promo] = LUI.MPDepot.LootDrops.Drop3 .. "_promo"
}
LUI.MPDepot.Collections = {
	{
		Name = "@DEPOT_SEASON_3",
		Tag = "LootDrop5|LootDrop6",
		Reward = "0x6300063"
	},
	{
		Name = "@DEPOT_PROMO_2",
		Tag = "LootDrop5:2",
		Reward = "0x630004E"
	},
	{
		Name = "@DEPOT_SEASON_2",
		Tag = "LootDrop3|LootDrop4",
		Reward = "0x6300040"
	},
	{
		Name = "@DEPOT_PROMO_1",
		Tag = "LootDrop3:1",
		Reward = "0x6300031"
	},
	{
		Name = "@DEPOT_SEASON_1",
		Tag = "LootDrop1|LootDrop2",
		Reward = "0x100D0BE"
	}
}
LUI.MPDepot.crateData = {}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.AW_Common] = {
	text = Engine.Localize( "@DEPOT_COMMON_SUPPLY_DROP" ),
	textColor = {
		r = 0.83,
		g = 0.83,
		b = 0.83
	},
	desc_text = Engine.Localize( "@DEPOT_COMMON_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_common",
	popup_img = "depot_crate_angled_common",
	sparkleColor = {
		r = 0.75,
		g = 0.75,
		b = 0.75
	},
	purchaseSound = "grvs_conf_purch",
	rarity = Cac.InventoryItemRarity.Common,
	items = {
		LUI.MPDepot.SupplyCrateTypes.AW_Common
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.LS_Common] = {
	text = Engine.Localize( "@DEPOT_COMMON_SUPPLY_DROP" ),
	textColor = {
		r = 0.83,
		g = 0.83,
		b = 0.83
	},
	desc_text = Engine.Localize( "@DEPOT_COMMON_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_drop_2_common",
	popup_img = "depot_crate_angled_drop_2_common",
	sparkleColor = {
		r = 0.75,
		g = 0.75,
		b = 0.75
	},
	purchaseSound = "grvs_conf_purch",
	rarity = Cac.InventoryItemRarity.Common,
	items = {
		LUI.MPDepot.SupplyCrateTypes.LS_Common
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.CH_Common] = {
	text = Engine.Localize( "@DEPOT_COMMON_SUPPLY_DROP" ),
	textColor = {
		r = 0.83,
		g = 0.83,
		b = 0.83
	},
	desc_text = Engine.Localize( "@DEPOT_COMMON_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_drop_3_common",
	popup_img = "depot_crate_angled_drop_3_common",
	sparkleColor = {
		r = 0.75,
		g = 0.75,
		b = 0.75
	},
	purchaseSound = "grvs_conf_purch",
	rarity = Cac.InventoryItemRarity.Common,
	items = {
		LUI.MPDepot.SupplyCrateTypes.CH_Common
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.AW_Rare] = {
	text = Engine.Localize( "@DEPOT_RARE_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_RARE_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_rare",
	popup_img = "depot_crate_angled_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.AW_Rare,
		LUI.MPDepot.SupplyCrateTypes.AW_Rare .. "_cp"
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.LS_Rare] = {
	text = Engine.Localize( "@DEPOT_RARE_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_RARE_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_drop_2_rare",
	popup_img = "depot_crate_angled_drop_2_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	crateAvailableIcon = "depot_crate_inventory_lionstrike",
	items = {
		LUI.MPDepot.SupplyCrateTypes.LS_Rare,
		LUI.MPDepot.SupplyCrateTypes.LS_Rare .. "_cp"
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.CH_Rare] = {
	text = Engine.Localize( "@DEPOT_RARE_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_RARE_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_drop_3_rare",
	popup_img = "depot_crate_angled_drop_3_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	crateAvailableIcon = "depot_crate_inventory_copperhead",
	items = {
		LUI.MPDepot.SupplyCrateTypes.CH_Rare,
		LUI.MPDepot.SupplyCrateTypes.CH_Rare .. "_cp"
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.LS_Promo] = {
	text = Engine.Localize( "@DEPOT_LS_PROMO_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_LS_PROMO_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_event_1",
	popup_img = "depot_crate_angled_event_1",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.LS_Promo,
		LUI.MPDepot.SupplyCrateTypes.LS_Promo .. "_cp"
	},
	specialimg = "loot_drop_2_icon",
	category = LUI.MPDepot.LootDrops.Drop2,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.LS_Rare,
	crateAvailableIcon = "depot_crate_inventory_shamrock",
	containsLootTypes = {
		{
			num = 2,
			image = "depot_card_back_lionstrike"
		},
		{
			num = 1,
			image = "depot_card_back_shamrock"
		}
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.CH_Promo] = {
	text = Engine.Localize( "@DEPOT_CH_PROMO_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_CH_PROMO_SUPPLY_DROP_CONTENT_DESCRIPTION" ),
	img = "depot_crate_event_2",
	popup_img = "depot_crate_angled_event_2",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.CH_Promo,
		LUI.MPDepot.SupplyCrateTypes.CH_Promo .. "_cp"
	},
	specialimg = "loot_drop_3_icon",
	category = LUI.MPDepot.LootDrops.Drop3,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.CH_Rare,
	crateAvailableIcon = "depot_crate_inventory_summer",
	containsLootTypes = {
		{
			num = 2,
			image = "depot_card_back_copperhead"
		},
		{
			num = 1,
			image = "depot_card_back_summer"
		}
	}
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_1] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_1_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_RARITY_LIMIT_DESC", "DEPOT_RARITY_LEGENDARY", 4 ),
	img = "depot_crate_bundle_ls_legend",
	popup_img = "depot_crate_angled_drop_2_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_1
	},
	specialimg = "loot_drop_2_icon",
	category = LUI.MPDepot.LootDrops.Drop2,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.LS_Rare,
	crateAvailableIcon = "depot_crate_inventory_lionstrike",
	bundleID = 5
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_2] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_2_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_WEAPONKIT_LIMIT", 10 ),
	img = "depot_crate_bundle_ls_weapon_kit",
	popup_img = "depot_crate_angled_drop_2_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_2
	},
	specialimg = "loot_drop_2_icon",
	category = LUI.MPDepot.LootDrops.Drop2,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.LS_Rare,
	crateAvailableIcon = "depot_crate_inventory_lionstrike",
	bundleID = 6
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_3] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_3_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_CHARACTER_LIMIT", 3 ),
	img = "depot_crate_bundle_ls_character",
	popup_img = "depot_crate_angled_drop_2_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_3 .. "_cp"
	},
	specialimg = "loot_drop_2_icon",
	category = LUI.MPDepot.LootDrops.Drop2,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.LS_Rare,
	crateAvailableIcon = "depot_crate_inventory_lionstrike",
	bundleID = 7
}
local f0_local3 = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_4_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_WEAPON_LIMIT", 10 ),
	img = "h1_depot_crate_icon_rare_lionstrike_ballisticmelee",
	popup_img = "depot_crate_angled_drop_2_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_5
	},
	specialimg = "loot_drop_2_icon",
	category = LUI.MPDepot.LootDrops.Drop2,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.LS_Rare,
	crateAvailableIcon = "depot_crate_inventory_lionstrike",
	bundleID = 10
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_4] = f0_local3
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_5] = f0_local3
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_6] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_6_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_ITEM_LIMIT", "@DEPOT_SEASON_LC_1", 10 ),
	img = "depot_crate_rare",
	popup_img = "depot_crate_angled_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_6
	},
	specialimg = "loot_drop_1_icon",
	category = LUI.MPDepot.LootDrops.Drop1,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.AW_Rare,
	crateAvailableIcon = "depot_crate_inventory_arcticwolf",
	bundleID = 11
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_7] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_7_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_ITEM_LIMIT", "@DEPOT_SEASON_LC_2", 10 ),
	img = "depot_crate_drop_2_rare",
	popup_img = "depot_crate_angled_drop_2_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_7
	},
	specialimg = "loot_drop_2_icon",
	category = LUI.MPDepot.LootDrops.Drop2,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.LS_Rare,
	crateAvailableIcon = "depot_crate_inventory_lionstrike",
	bundleID = 12
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_8] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_2_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_WEAPONKIT_LIMIT", 10 ),
	img = "depot_crate_bundle_aw_weapon_kit",
	popup_img = "depot_crate_angled_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_8
	},
	specialimg = "loot_drop_1_icon",
	category = LUI.MPDepot.LootDrops.Drop1,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.AW_Rare,
	crateAvailableIcon = "depot_crate_inventory_arcticwolf",
	bundleID = 13
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_9] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_9_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_ITEM_LIMIT", "@DEPOT_SEASON_LC_3", 10 ),
	img = "depot_crate_drop_3_rare",
	popup_img = "depot_crate_angled_drop_3_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_9
	},
	specialimg = "loot_drop_3_icon",
	category = LUI.MPDepot.LootDrops.Drop3,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.CH_Rare,
	crateAvailableIcon = "depot_crate_inventory_copperhead",
	bundleID = 14
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_10] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_1_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_RARITY_LIMIT_DESC", "DEPOT_RARITY_LEGENDARY", 5 ),
	img = "depot_crate_bundle_ch_legend",
	popup_img = "depot_crate_angled_drop_3_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_10
	},
	specialimg = "loot_drop_3_icon",
	category = LUI.MPDepot.LootDrops.Drop3,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.CH_Rare,
	crateAvailableIcon = "depot_crate_inventory_copperhead",
	bundleID = 15
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_11] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_2_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_WEAPONKIT_LIMIT", 10 ),
	img = "depot_crate_bundle_ch_weapon_kit",
	popup_img = "depot_crate_angled_drop_3_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_11
	},
	specialimg = "loot_drop_3_icon",
	category = LUI.MPDepot.LootDrops.Drop3,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.CH_Rare,
	crateAvailableIcon = "depot_crate_inventory_copperhead",
	bundleID = 21
}
LUI.MPDepot.crateData[LUI.MPDepot.SupplyCrateTypes.EX_Promo_12] = {
	text = Engine.Localize( "@DEPOT_EX_PROMO_4_SUPPLY_DROP" ),
	textColor = {
		r = 0,
		g = 0.73,
		b = 1
	},
	desc_text = Engine.Localize( "@DEPOT_GUARANTEE_WEAPON_LIMIT", 10 ),
	img = "h1_depot_crate_icon_rare_copperhead_ballisticmelee",
	popup_img = "depot_crate_angled_drop_3_rare",
	defaultFocus = true,
	sparkleColor = {
		r = 0.58,
		g = 0.9,
		b = 0.96
	},
	purchaseSound = "grvs_conf_purch_rare",
	rarity = Cac.InventoryItemRarity.Rare,
	items = {
		LUI.MPDepot.SupplyCrateTypes.EX_Promo_12
	},
	specialimg = "loot_drop_3_icon",
	category = LUI.MPDepot.LootDrops.Drop3,
	isPromo = true,
	fallbackCrateType = LUI.MPDepot.SupplyCrateTypes.CH_Rare,
	crateAvailableIcon = "depot_crate_inventory_copperhead",
	bundleID = 22
}
LUI.MPDepot.ExclusiveCrates = {
	ALL = -1,
	NONE = 0,
	SHAMROCK_AND_AWE = 1,
	DAYS_OF_SUMMER = 2,
	NO_DUPE_LEGENDARIES = 3,
	NO_DUPE_WEAPONKITS = 4,
	NO_DUPE_CHARACTERS = 5,
	NO_DUPE_WEAPONS = 6,
	NO_DUPE_ALL_WEAPONS = 7,
	NO_DUPE_AW = 8,
	NO_DUPE_LS = 9,
	NO_DUPE_AW_WEAPONKITS = 10,
	NO_DUPE_CH = 11,
	NO_DUPE_LEGENDARIES_CH = 12,
	NO_DUPE_WEAPONKITS_CH = 13,
	NO_DUPE_WEAPONS_CH = 14
}
LUI.MPDepot.ExclusiveCratesInfo = {
	[LUI.MPDepot.ExclusiveCrates.SHAMROCK_AND_AWE] = LUI.MPDepot.SupplyCrateTypes.LS_Promo,
	[LUI.MPDepot.ExclusiveCrates.DAYS_OF_SUMMER] = LUI.MPDepot.SupplyCrateTypes.CH_Promo,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_LEGENDARIES] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_1,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_WEAPONKITS] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_2,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_CHARACTERS] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_3,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_WEAPONS] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_4,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_ALL_WEAPONS] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_5,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_AW] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_6,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_LS] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_7,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_AW_WEAPONKITS] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_8,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_CH] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_9,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_LEGENDARIES_CH] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_10,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_WEAPONKITS_CH] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_11,
	[LUI.MPDepot.ExclusiveCrates.NO_DUPE_WEAPONS_CH] = LUI.MPDepot.SupplyCrateTypes.EX_Promo_12
}
local f0_local4 = LUI.MPDepot
local f0_local5 = "BundlesTable"
local f0_local6 = {
	File = "mp/bundles.csv"
}
local f0_local7 = "Cols"
local f0_local8 = {
	ID = 0,
	Name = 1,
	PurchaseID = 2,
	LocalizedString = 3,
	PurchaseLimitItem = 4,
	PurchaseLimitQuantity = 5,
	PurchaseCurrency = 6,
	PurchaseAmount = 7,
	CurrencyAwardID = 8,
	CurrencyAwardAmount = 9,
	Item0ID = 10,
	Item0Amount = 11,
	Item1ID = 12,
	Item1Amount = 13,
	Item2ID = 14,
	Item2Amount = 15,
	Item3ID = 16,
	Item3Amount = 17,
	MarketingImage = 18
}
local f0_local9 = "ProductionLevel"
local f0_local10 = 19
f0_local8[f0_local9] = f0_local10
f0_local6[f0_local7] = f0_local8
f0_local4[f0_local5] = f0_local6
f0_local4 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content / 2
f0_local5 = 125
f0_local6 = CoD.TextSettings.BodyFontVeryTiny
f0_local7 = f0_local6.Height + f0_local4 / 2
f0_local8 = 20
f0_local9 = f0_local5 + 5
f0_local10 = function ( f1_arg0, f1_arg1 )
	if not Engine.GetDvarBool( "virtualLobbyPresentable" ) then
		f1_arg0:registerDvarHandler( "virtualLobbyPresentable", f0_local10 )
	else
		local f1_local0 = Cac.NotifyVirtualLobby
		local f1_local1 = "depot"
		local f1_local2
		if f1_arg1 then
			f1_local2 = f1_arg1.controller
			if not f1_local2 then
			
			else
				f1_local0( f1_local1, f1_local2 )
			end
		end
		f1_local2 = f1_arg0.exclusiveController
	end
end

function DepotOnBack( f2_arg0, f2_arg1 )
	Cac.NotifyVirtualLobby( "leave_depot", f2_arg1.controller )
	Engine.ExecNow( "upload_playercard", f2_arg1.controller )
	LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
end

local f0_local11 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = RegisterMaterial( GetCurrencyImage( f3_arg2 ) )
	local f3_local1, f3_local2 = GetMaterialDimensions( f3_local0 )
	local f3_local3 = f0_local7 * f3_local1 / f3_local2
	local f3_local4 = f0_local4 / 2
	local f3_local5, f3_local6, f3_local7, f3_local8 = GetTextDimensions( f3_arg1, f0_local6.Font, f0_local6.Height )
	local f3_local9 = f0_local6.Height
	local f3_local10 = f3_local7 + f3_local3 + f3_local4
	local f3_local11 = 1
	local f3_local12 = LUI.MenuBuilder.BuildAddChild( f3_arg0, {
		type = "UIElement",
		id = f3_arg0.id .. "_costBG_" .. tostring( f3_arg2 ),
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				width = f3_local10,
				height = f3_local9
			}
		}
	} )
	LUI.MenuBuilder.BuildAddChild( f3_local12, {
		type = "UIImage",
		id = f3_arg0.id .. "_costIcon_" .. tostring( f3_arg2 ),
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = 0,
				right = f3_local3,
				top = -f0_local7 / 2,
				bottom = f0_local7 / 2,
				material = f3_local0
			}
		}
	} )
	LUI.MenuBuilder.BuildAddChild( f3_local12, {
		type = "UIText",
		id = f3_arg0.id .. "_costText_" .. tostring( f3_arg2 ),
		properties = {
			text = f3_arg1
		},
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				left = -f3_local7,
				right = 0,
				top = f3_local11 - f0_local6.Height / 2,
				bottom = f3_local11 + f0_local6.Height / 2,
				font = f0_local6.Font,
				horizontalAlignment = LUI.HorizontalAlignment.Right,
				verticalAlignment = LUI.VerticalAlignment.Middle,
				color = Colors.primary_text_color
			}
		}
	} )
end

LUI.MPDepot.CreateAvailablePromoCratesInfo = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = RegisterMaterial( f4_arg2 )
	local f4_local1, f4_local2 = GetMaterialDimensions( f4_local0 )
	local f4_local3 = f4_local1 / f4_local2
	local f4_local4 = 23
	local f4_local5 = f4_local4 * f4_local3
	local self = LUI.UIElement.new( {
		width = f4_local5,
		height = f4_local4,
		topAnchor = true
	} )
	self:addElement( LUI.UIImage.new( {
		width = f4_local5,
		height = f4_local4,
		material = f4_local0,
		leftAnchor = true
	} ) )
	self.numText = LUI.UIText.new( {
		topAnchor = true,
		rightAnchor = true,
		top = 0,
		height = 12,
		width = 10,
		left = 0,
		color = Colors.mw1_green,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.BodyFontBold.Font
	} )
	self.numText:setText( f4_arg1 )
	self.numText:setupAutoScaleText()
	self:addElement( self.numText )
	f4_arg0:addElement( self )
end

LUI.MPDepot.CreateAvailableCratesInfo = function ( f5_arg0, f5_arg1 )
	local f5_local0 = RegisterMaterial( "h1_depot_button_inventory_badge" )
	local f5_local1, f5_local2 = GetMaterialDimensions( f5_local0 )
	local f5_local3 = f5_local1 / f5_local2
	local f5_local4 = 55
	local self = nil
	if f5_arg0 then
		self = LUI.UIElement.new( {
			width = f5_local4,
			height = f5_local4,
			topAnchor = true
		} )
	else
		self = LUI.UIElement.new( {
			width = f5_local4,
			height = f5_local4,
			bottomAnchor = true,
			bottom = f5_local4 * 0.1
		} )
	end
	self:addElement( LUI.UIImage.new( {
		width = f5_local4 * f5_local3,
		height = f5_local4,
		material = f5_local0
	} ) )
	self.numText = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = f5_local4 * 0.5 - 10,
		height = 20,
		left = 5,
		right = -5,
		horizontalAlignment = LUI.HorizontalAlignment.Center,
		color = Colors.mw1_green,
		font = CoD.TextSettings.BodyFontBold.Font
	} )
	self.numText:setText( f5_arg1 )
	self.numText:setupAutoScaleText()
	self:addElement( self.numText )
	if not f5_arg0 then
		return self
	end
	local f5_local6 = nil
	if f5_arg1 == 1 then
		f5_local6 = Engine.Localize( "@DEPOT_ONE_CRATE_TO_OPEN" )
	else
		f5_local6 = Engine.Localize( "@DEPOT_CRATES_TO_OPEN" )
	end
	local f5_local7, f5_local8, f5_local9, f5_local10 = GetTextDimensions( f5_local6, f0_local6.Font, f0_local6.Height )
	local self = LUI.UIText.new( {
		topAnchor = true,
		height = 12,
		font = CoD.TextSettings.BodyFont.Font,
		color = Colors.h1.medium_grey,
		verticalAlignment = LUI.VerticalAlignment.Middle
	} )
	self:registerAnimationState( "green", {
		color = Colors.mw1_green
	} )
	self:registerAnimationState( "grey", {
		color = Colors.h1.medium_grey
	} )
	self:registerEventHandler( "gain_focus", function ( element, event )
		element:animateToState( "green" )
	end )
	self:registerEventHandler( "lose_focus", function ( element, event )
		element:animateToState( "grey" )
	end )
	self:setText( f5_local6 )
	f5_arg0:addElement( self )
	f5_arg0:addElement( self )
end

LUI.MPDepot.GetSupplyDropCount = function ( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.Loot_GetSupplyDropCount( f8_arg0, f8_arg1 )
	if Engine.Loot_HasUnviewedSupplyDrop( f8_arg0, f8_arg1, 0 ) then
		f8_local0 = f8_local0 + 1
	end
	return f8_local0
end

LUI.MPDepot.GetCrateCount = function ( f9_arg0, f9_arg1 )
	return LUI.MPDepot.GetSupplyDropCount( f9_arg0, LUI.MPDepot.crateData[f9_arg1].items[1] )
end

LUI.MPDepot.GetSupplyDropPrice = function ( f10_arg0 )
	local f10_local0 = nil
	if LUI.MPDepot.crateData[f10_arg0] and LUI.MPDepot.crateData[f10_arg0].bundleID ~= nil then
		local f10_local1 = Engine.TableLookupGetRowNum( LUI.MPDepot.BundlesTable.File, LUI.MPDepot.BundlesTable.Cols.ID, "" .. LUI.MPDepot.crateData[f10_arg0].bundleID )
		if f10_local1 >= 0 then
			f10_local0 = {
				type = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f10_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseCurrency ) ),
				amount = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f10_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseAmount ) )
			}
		end
	end
	if f10_local0 == nil then
		f10_local0 = Engine.Loot_GetSupplyDropPrice( f10_arg0 )
	end
	return f10_local0
end

local f0_local12 = function ( f11_arg0, f11_arg1, f11_arg2 )
	if LUI.MPDepot.crateData[f11_arg1].items ~= nil then
		local f11_local0 = GetContentPromos()
		local f11_local1 = 0
		if f11_arg0.promoList then
			f11_arg0.promoList:close()
			f11_arg0.promoList = nil
		end
		local f11_local2 = LUI.MPDepot.crateData[f11_arg1].items[1]
		f11_arg0.crateType = f11_arg1
		f11_arg0.supplyDropType = f11_local2
		f11_arg0.availableCrates = LUI.MPDepot.GetSupplyDropCount( f11_arg2, f11_local2 )
		for f11_local9, f11_local10 in pairs( LUI.MPDepot.ExclusiveCratesInfo ) do
			local f11_local7 = false
			for f11_local8 = 1, #f11_local0, 1 do
				local f11_local6 = f11_local0[f11_local8]
				if f11_local6 == -1 or f11_local6 == f11_local9 then
					f11_local7 = true
				end
			end
			if not f11_local7 and LUI.MPDepot.crateData[f11_local10].fallbackCrateType == f11_arg1 then
				local f11_local8 = LUI.MPDepot.GetSupplyDropCount( f11_arg2, LUI.MPDepot.crateData[f11_local10].items[1] )
				if f11_local8 > 0 then
					if f11_arg0.promoList == nil then
						f11_arg0.promoList = LUI.UIVerticalList.new( {
							leftAnchor = true,
							topAnchor = true,
							top = 30,
							left = 0,
							width = 30,
							spacing = 0
						} )
						f11_arg0.promoList.id = "promo_crate_info"
						f11_arg0:addElement( f11_arg0.promoList )
					end
					f11_local1 = f11_local1 + f11_local8
					LUI.MPDepot.CreateAvailablePromoCratesInfo( f11_arg0.promoList, f11_local8, LUI.MPDepot.crateData[f11_local10].crateAvailableIcon )
					f11_arg0.crateType = f11_local10
					f11_arg0.supplyDropType = LUI.MPDepot.crateData[f11_local10].items[1]
				end
			end
		end
		if f11_local1 > 0 then
			LUI.MPDepot.CreateAvailablePromoCratesInfo( f11_arg0.promoList, f11_arg0.availableCrates, LUI.MPDepot.crateData[f11_arg1].crateAvailableIcon )
			f11_arg0.availableCrates = f11_arg0.availableCrates + f11_local1
			f11_arg0.availableList = LUI.UIVerticalList.new( {
				topAnchor = true,
				top = 55,
				spacing = 0
			} )
			f11_arg0:addElement( f11_arg0.availableList )
			LUI.MPDepot.CreateAvailableCratesInfo( f11_arg0.availableList, f11_arg0.availableCrates )
		elseif f11_arg0.availableCrates > 0 then
			f11_arg0.availableList = LUI.UIVerticalList.new( {
				topAnchor = true,
				top = 55,
				spacing = 0
			} )
			f11_arg0:addElement( f11_arg0.availableList )
			LUI.MPDepot.CreateAvailableCratesInfo( f11_arg0.availableList, f11_arg0.availableCrates )
		end
		f11_arg0.costList = LUI.UIHorizontalList.new( {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			bottom = -f0_local4,
			height = f0_local7,
			alignment = LUI.HorizontalAlignment.Center,
			spacing = H1MenuDims.spacing
		} )
		f11_arg0:addElement( f11_arg0.costList )
		for f11_local3 = 1, #LUI.MPDepot.crateData[f11_arg1].items, 1 do
			local f11_local7 = LUI.MPDepot.GetSupplyDropPrice( LUI.MPDepot.crateData[f11_arg1].items[f11_local3] )
			if f11_local7.type == InventoryCurrencyType.Credits or CoD.IsCPEnabled() then
				if f11_local3 > 1 then
					LUI.MenuBuilder.BuildAddChild( f11_arg0.costList, {
						type = "UIElement",
						id = f11_arg0.costList.id .. "Spacer" .. f11_local3,
						states = {
							default = {
								leftAnchor = false,
								rightAnchor = false,
								topAnchor = false,
								bottomAnchor = true,
								width = f0_local4,
								height = f0_local7
							}
						}
					} )
				end
				f0_local11( f11_arg0.costList, tostring( f11_local7.amount ), f11_local7.type )
			end
		end
	end
end

local f0_local13 = function ( f12_arg0 )
	local f12_local0 = f12_arg0.list.supplyDropList:getFirstChild()
	while f12_local0 do
		if f12_local0.availableCrates ~= LUI.MPDepot.GetSupplyDropCount( f12_arg0.exclusiveController, LUI.MPDepot.crateData[f12_local0.crateType].items[1] ) then
			if f12_local0.availableList then
				f12_local0.availableList:close()
				f12_local0.availableList = nil
			end
			if f12_local0.costList then
				f12_local0.costList:close()
				f12_local0.costList = nil
			end
			f0_local12( f12_local0, f12_local0.crateType, f12_arg0.exclusiveController )
		end
		f12_local0 = f12_local0:getNextSibling()
	end
end

local f0_local14 = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = {
		style = LUI.MenuTemplate.ButtonStyle,
		button_text = LUI.MPDepot.crateData[f13_arg1].text,
		desc_text = LUI.MPDepot.crateData[f13_arg1].desc_text,
		text_align_without_content = LUI.Alignment.Center,
		button_action_func = function ( f14_arg0, f14_arg1 )
			if LUI.MPDepot.crateData[f14_arg0.crateType].items ~= nil then
				if f14_arg0.availableCrates > 0 then
					LUI.FlowManager.RequestAddMenu( f14_arg0, "MPDepotOpenLootMenu", true, f14_arg1.controller, false, {
						crateType = f14_arg0.crateType,
						currencyInfo = LUI.MPDepot.GetSupplyDropPrice( f14_arg0.supplyDropType ),
						supplyDropType = f14_arg0.supplyDropType,
						numAvailable = f14_arg0.availableCrates
					} )
				else
					LUI.FlowManager.RequestAddMenu( f14_arg0, "MPDepotSupplyDropPurchasePopup", true, f14_arg1.controller, false, {
						crateType = f13_arg1
					} )
				end
			end
		end,
		button_over_func = function ( f15_arg0, f15_arg1 )
			f15_arg0:dispatchEventToChildren( {
				name = "gain_focus",
				dispatchChildren = true,
				immediate = true
			} )
		end,
		button_up_func = function ( f16_arg0, f16_arg1 )
			f16_arg0:dispatchEventToChildren( {
				name = "lose_focus",
				dispatchChildren = true,
				immediate = true
			} )
		end,
		exclusiveController = f13_arg2,
		height = f0_local5,
		y_offset = -f0_local5 / 2 + f0_local4 + LUI.MenuTemplate.ButtonStyle.height * LUI.UIGenericButton.fontScale / 4,
		muteAction = true
	}
	local f13_local1 = LUI.MenuBuilder.BuildAddChild( f13_arg0, {
		type = "UIGenericButton",
		id = "SupplyCrate_button_" .. f13_arg0.buttonCount,
		properties = f13_local0,
		listIndex = f13_arg0.buttonCount
	} )
	f13_arg0.buttonCount = f13_arg0.buttonCount + 1
	local f13_local2 = RegisterMaterial( LUI.MPDepot.crateData[f13_arg1].img )
	local f13_local3, f13_local4 = GetMaterialDimensions( f13_local2 )
	local f13_local5 = f13_local0.height - (f0_local7 + f0_local4) * 2
	local f13_local6 = f13_local5 * f13_local3 / f13_local4
	local f13_local7 = LUI.MenuBuilder.BuildAddChild( f13_local1, {
		type = "UIImage",
		id = f13_local1.id .. "_img",
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f13_local6 / 2,
				top = -f13_local5 / 2,
				height = f13_local5,
				width = f13_local6,
				material = f13_local2,
				scale = 0
			},
			focused = {
				scale = 0.25
			}
		}
	} )
	LUI.MPDepotBase.PlaySparkleAnimation( f13_local7, f13_arg1 )
	f13_local7:registerEventHandler( "gain_focus", function ( element, event )
		element:animateToState( "focused" )
		element.mask:animateToState( "show" )
	end )
	f13_local7:registerEventHandler( "lose_focus", function ( element, event )
		element:animateToState( "default" )
		element.mask:animateToState( "hide" )
	end )
	f0_local12( f13_local1, f13_arg1, f13_arg2 )
	if LUI.MPDepot.LootDropsData[LUI.MPDepot.SuppyDropLootStream[f13_arg1]].icon ~= nil then
		local f13_local8 = RegisterMaterial( LUI.MPDepot.LootDropsData[LUI.MPDepot.SuppyDropLootStream[f13_arg1]].icon )
		local f13_local9, f13_local10 = GetMaterialDimensions( f13_local8 )
		local f13_local11 = f13_local5 * 0.66
		local f13_local12 = f13_local11 * f13_local9 / f13_local10
		local f13_local13 = CoD.CreateState( f13_local6 - f13_local12 * 0.6, 0, f13_local12 * 0.4, f13_local11 - f13_local5, CoD.AnchorTypes.All )
		f13_local13.material = f13_local8
		f13_local7.lootIcon = LUI.UIImage.new( f13_local13 )
		f13_local7.lootIcon:setPriority( 100 )
		f13_local7:addElement( f13_local7.lootIcon )
	end
	local f13_local8 = ""
	for f13_local9 = 1, #LUI.MPDepot.crateData[f13_arg1].items, 1 do
		local f13_local14 = LUI.MPDepot.GetSupplyDropPrice( LUI.MPDepot.crateData[f13_arg1].items[f13_local9] )
		if f13_local14.promo ~= nil and f13_local14.promo.image ~= nil then
			f13_local8 = f13_local14.promo.image
			break
		end
	end
	if f13_local8 ~= "" then
		local f13_local9 = RegisterMaterial( f13_local8 )
		local f13_local10, f13_local11 = GetMaterialDimensions( f13_local9 )
		local f13_local12 = f13_local5
		f13_local1:addElement( LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			left = 0,
			top = -f13_local12 / 2,
			width = f13_local12 * f13_local10 / f13_local11,
			height = f13_local12,
			material = f13_local9
		} ) )
	end
	f13_local1.listDefaultFocus = LUI.MPDepot.crateData[f13_arg1].defaultFocus
	f13_local1.crateType = f13_arg1
	return f13_local1
end

function SupplyDropResult( f19_arg0, f19_arg1 )
	if f19_arg1.success then
		DebugPrint( "SupplyDropResult: items: " .. #f19_arg1.items .. " currencies: " .. #f19_arg1.currencies .. " entitlements: " .. #f19_arg1.entitlements )
	else
		DebugPrint( "SupplyDropResult: FAILURE" )
	end
end

local f0_local15 = function ( f20_arg0, f20_arg1 )
	local f20_local0 = {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		left = 150,
		width = 385,
		top = 150,
		height = 30,
		font = CoD.TextSettings.H1TitleFont.Font,
		horizontalAlignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
		verticalAlignment = LUI.VerticalAlignment.Top,
		alpha = 1
	}
	local f20_local1 = Engine.Localize( "@DEPOT_GRAVES_INTRO_LINE" .. f20_arg1.line )
	local f20_local2 = 5
	if f20_arg1.line == 2 then
		f20_local0.top = f20_local0.top + f20_local0.height + f20_local2
		f20_local0.height = f20_local0.height * 0.75
	elseif f20_arg1.line == 3 then
		f20_local0.top = f20_local0.top + f20_local0.height * 1.75 + f20_local2 * 2
		f20_local0.height = f20_local0.height * 0.75
	end
	if not f20_arg0.introLines then
		f20_arg0.introLines = {}
	end
	f20_arg0.introLines[f20_arg1.line] = LUI.UIText.new( f20_local0 )
	f20_arg0:addElement( f20_arg0.introLines[f20_arg1.line] )
	f20_arg0.introLines[f20_arg1.line]:setText( f20_local1 )
	f20_arg0.introLines[f20_arg1.line]:setTextStyle( CoD.TextStyle.MW1Title )
	f20_arg0.introLines[f20_arg1.line]:setupAutoScaleText()
	f20_arg0.introLines[f20_arg1.line]:setUsePulseFX( true, false )
	f20_arg0.introLines[f20_arg1.line]:registerAnimationState( "hide", {
		alpha = 0
	} )
	f20_arg0.introLines[f20_arg1.line]:animateInSequence( {
		{
			"default",
			5000 + (3 - f20_arg1.line) * 1000
		},
		{
			"hide",
			1000
		}
	}, nil, true, true )
end

local f0_local16 = function ( f21_arg0 )
	local f21_local0 = 2000
	local f21_local1 = 1000
	local f21_local2 = 3
	f21_arg0:registerEventHandler( "add_intro_line", f0_local15 )
	for f21_local3 = 1, f21_local2, 1 do
		f21_arg0:addElement( LUI.UITimer.new( f21_local0 + (f21_local3 - 1) * f21_local1, {
			name = "add_intro_line",
			line = f21_local3
		}, nil, true ) )
	end
	f21_arg0:addElement( LUI.UITimer.new( f21_local0, {
		name = "play_sound",
		sound = "h1_ui_menu_text",
		stop_delay = f21_local1 * f21_local2 - 500,
		stop_event = "stop_intro_text_sfx"
	}, nil, true ) )
end

local f0_local17 = function ( f22_arg0, f22_arg1 )
	f22_arg0:registerEventHandler( "gamepad_button", nil )
	local f22_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f22_arg0 )
	if Engine.Loot_GetSupplyDropCount( f22_arg0.exclusiveController, LUI.MPDepot.SupplyCrateTypes.Onboarding ) > 0 then
		LUI.OnboardingPopups.Depot( {
			controller = f22_arg0.exclusiveController
		} )
	end
end

local f0_local18 = function ( f23_arg0, f23_arg1 )
	local f23_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f23_arg0 )
	local f23_local1 = LUI.FlowManager.GetBottomMenuScopedData()
	if Engine.Loot_GetSupplyDropCount( f23_arg0.exclusiveController, LUI.MPDepot.SupplyCrateTypes.Onboarding ) > 0 then
		f23_local0.onBoarding = true
	elseif f23_local0.onBoarding or not f23_local1.beenInDepotThisSession then
		f23_local0.onBoarding = nil
		f23_local1.beenInDepotThisSession = true
		f0_local16( f23_arg0 )
	end
	local f23_local2 = f23_arg1.fadeTime or 1000
	local f23_local3 = f23_arg1.returnControlsTime or f23_local2 + 1000
	f23_arg0:animateToState( "show", f23_local2 )
	f23_arg0:registerEventHandler( "return_controls", f0_local17 )
	f23_arg0:addElement( LUI.UITimer.new( f23_local3, "return_controls", nil, true ) )
end

local f0_local19 = function ( f24_arg0, f24_arg1 )
	f24_arg0:processEvent( {
		name = "stop_intro_text_sfx"
	} )
end

local f0_local20 = function ( f25_arg0 )
	local f25_local0 = f0_local9
	if f25_arg0.list.bundleList then
		f25_local0 = f25_local0 * 2 + H1MenuDims.spacing
	end
	f25_arg0:AddListDivider( f25_local0 + f0_local8 )
end

LUI.MPDepot.CanPurchaseBundle = function ( f26_arg0, f26_arg1 )
	local f26_local0 = false
	local f26_local1 = Engine.TableLookupGetRowNum( LUI.MPDepot.BundlesTable.File, LUI.MPDepot.BundlesTable.Cols.ID, f26_arg1 )
	if f26_local1 > 0 then
		local f26_local2 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f26_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseLimitItem )
		local f26_local3 = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f26_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseLimitQuantity ) ) or 0
		if f26_local3 ~= 0 and Engine.Inventory_GetItemQuantity( f26_arg0, f26_local2, false ) >= f26_local3 then
			f26_local0 = false
		else
			f26_local0 = true
		end
	end
	return f26_local0
end

local f0_local21 = function ( f27_arg0, f27_arg1, f27_arg2 )
	return tonumber( f27_arg2 ) <= GetCurrencyBalance( tonumber( f27_arg1 ), f27_arg0 )
end

local f0_local22 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	if not f0_local21( f28_arg0, f28_arg2, f28_arg3 ) then
		f28_arg1:disable()
		f28_arg1.properties.allowDisabledAction = true
		f28_arg1.disabledSFX = "h1_ui_purch_neg"
		f28_arg1:registerEventHandler( "button_action_disable", function ( element, event )
			Sns.OpenStoreMenu( f28_arg0, LUI.ComScore.ScreenID.Depot, LUI.ComScore.StoreSource.MenuButton )
		end )
		f28_arg1:registerEventHandler( "inventory", function ( element, event )
			if f0_local21( f28_arg0, f28_arg2, f28_arg3 ) then
				event.controller = f28_arg0
				f28_arg1:enable( event )
			end
		end )
	end
end

local f0_local23 = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = GetContentPromos()
	local f31_local1 = {}
	for f31_local2 = 1, #f31_local0, 1 do
		local f31_local5 = f31_local0[f31_local2]
		if f31_local5 == LUI.MPDepot.ExclusiveCrates.ALL then
			for f31_local6 = 1, #LUI.MPDepot.ExclusiveCratesInfo, 1 do
				local f31_local9 = LUI.MPDepot.crateData[LUI.MPDepot.ExclusiveCratesInfo[f31_local6]]
				if f31_arg2 == f31_local9.category then
					f31_local1[1] = {}
					f31_local1[1].type = LUI.MPDepot.ExclusiveCratesInfo[f31_local6]
					f31_local1[1].crateInfo = f31_local9
				end
			end
		end
		if f31_local5 > LUI.MPDepot.ExclusiveCrates.NONE and LUI.MPDepot.ExclusiveCratesInfo[f31_local5] and LUI.MPDepot.crateData[LUI.MPDepot.ExclusiveCratesInfo[f31_local5]] then
			local f31_local6 = LUI.MPDepot.crateData[LUI.MPDepot.ExclusiveCratesInfo[f31_local5]]
			if f31_arg2 == f31_local6.category and (f31_local6.bundleID == nil or LUI.MPDepot.CanPurchaseBundle( f31_arg0.exclusiveController, f31_local6.bundleID )) then
				f31_local1[1] = {}
				f31_local1[1].type = LUI.MPDepot.ExclusiveCratesInfo[f31_local5]
				f31_local1[1].crateInfo = f31_local6
			end
		end
	end
	local f31_local2 = #f31_local1
	local f31_local3 = false
	if f31_local2 > 0 then
		f31_arg0.list.exclusiveList = LUI.UIHorizontalList.new( {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			bottom = f0_local9,
			left = 0,
			width = f31_arg1,
			alignment = LUI.HorizontalAlignment.Left,
			spacing = H1MenuDims.spacing
		} )
		f31_arg0.list.exclusiveList.buttonCount = 0
		f31_arg0.list.exclusiveList.id = "exclusiveList"
		local f31_local4 = function ( f32_arg0, f32_arg1 )
			if LUI.MPDepot.crateData[f32_arg0.type].items ~= nil then
				if f32_arg0.availableCrates > 0 then
					local f32_local0 = LUI.MPDepot.crateData[f32_arg0.type].items[1]
					LUI.FlowManager.RequestAddMenu( f32_arg0, "MPDepotOpenLootMenu", true, f32_arg1.controller, false, {
						crateType = f32_arg0.type,
						currencyInfo = LUI.MPDepot.GetSupplyDropPrice( f32_local0 ),
						supplyDropType = f32_local0,
						numAvailable = f32_arg0.availableCrates
					} )
				else
					LUI.FlowManager.RequestAddMenu( f32_arg0, "MPDepotSupplyDropPurchasePopup", true, f32_arg1.controller, false, {
						crateType = f32_arg0.type
					} )
				end
			end
		end
		
		local f31_local10 = function ( f33_arg0, f33_arg1 )
			f33_arg0:dispatchEventToChildren( {
				name = "gain_focus",
				dispatchChildren = true,
				immediate = true
			} )
		end
		
		local f31_local5 = function ( f34_arg0, f34_arg1 )
			f34_arg0:dispatchEventToChildren( {
				name = "lose_focus",
				dispatchChildren = true,
				immediate = true
			} )
		end
		
		for f31_local6 = 1, f31_local2, 1 do
			local f31_local9 = f31_local1[1]
			f31_local3 = true
			local f31_local11 = {
				style = LUI.MenuTemplate.ButtonStyle,
				button_text = f31_local9.crateInfo.text,
				desc_text = f31_local9.crateInfo.desc_text,
				text_align_without_content = LUI.Alignment.Center,
				button_action_func = f31_local4,
				button_over_func = f31_local10,
				button_up_func = f31_local5,
				exclusiveController = f31_arg0.exclusiveController,
				height = f0_local5,
				y_offset = -f0_local5 / 2 + f0_local4 + LUI.MenuTemplate.ButtonStyle.height * LUI.UIGenericButton.fontScale / 4,
				muteAction = true
			}
			local self = LUI.UIGenericButton.new( nil, f31_local11 )
			self.type = f31_local9.type
			self:makeFocusable()
			self.properties = f31_local11
			self.id = "bundle_" .. f31_local6
			local f31_local13 = f0_local7 + f0_local4 * 2
			local f31_local14 = f0_local4
			self.itemContainer = LUI.UIElement.new( {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				left = f31_local14,
				top = f31_local13,
				right = -f31_local14,
				bottom = -f31_local13,
				scale = 0
			} )
			self:addElement( self.itemContainer )
			local f31_local15 = 0
			local f31_local16 = BodyFont.Font
			local f31_local17 = f31_local11.height / 5
			local f31_local18 = f31_local11.height - f31_local13
			local f31_local19 = RegisterMaterial( f31_local9.crateInfo.img )
			local f31_local20, f31_local21 = GetMaterialDimensions( f31_local19 )
			local f31_local22 = f31_local18 * f31_local20 / f31_local21
			local self = LUI.UIImage.new( {
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = false,
				left = -f31_local22 / 2,
				top = -f31_local18 / 2,
				width = f31_local22,
				height = f31_local18,
				material = f31_local19,
				scale = 0
			} )
			self.itemContainer:addElement( self )
			self:registerAnimationState( "descale", {
				scale = -0.25
			} )
			self:animateToState( "descale" )
			local f31_local24, f31_local25, f31_local26 = nil
			f31_local24 = RegisterMaterial( f31_local9.crateInfo.specialimg )
			f31_local25, f31_local26 = GetMaterialDimensions( f31_local24 )
			if f31_local9.crateInfo.bundleID == nil then
				local f31_local27 = RegisterMaterial
				local f31_local28 = LUI.MPDepot.LootDropsData
				local f31_local29 = LUI.MPDepot.SuppyDropLootStream
				f31_local27 = f31_local27( f31_local28[LUI.MPDepot.SuppyDropLootStream[f31_local9.type]].icon )
				f31_local28, f31_local29 = GetMaterialDimensions( f31_local27 )
				self.itemContainer:addElement( LUI.UIImage.new( {
					leftAnchor = false,
					topAnchor = false,
					rightAnchor = true,
					bottomAnchor = false,
					right = -20,
					top = -f31_local18 / 2,
					width = f31_local18 * f31_local28 / f31_local29,
					height = f31_local18,
					material = f31_local27
				} ) )
				self.itemContainer:addElement( LUI.UIImage.new( {
					leftAnchor = true,
					topAnchor = false,
					rightAnchor = false,
					bottomAnchor = false,
					left = 20,
					top = -f31_local18 / 2,
					width = f31_local18 * f31_local25 / f31_local26,
					height = f31_local18,
					material = f31_local24
				} ) )
			else
				local f31_local27 = f31_local18 * 0.66
				local f31_local28 = f31_local27 * f31_local25 / f31_local26
				local f31_local29 = 0.71
				local self = CoD.CreateState( f31_local22 * f31_local29, 0, -f31_local22 * (1 - f31_local29) + f31_local28, f31_local27 - f31_local18, CoD.AnchorTypes.All )
				self.material = f31_local24
				local self = LUI.UIImage.new( self )
				self:setPriority( 100 )
				self:addElement( self )
			end
			if f31_local9.crateInfo.containsLootTypes ~= nil then
				local f31_local27 = 20
				local f31_local28 = 10
				for f31_local29 = 1, #f31_local9.crateInfo.containsLootTypes, 1 do
					local self = -30
					local f31_local34 = 10
					if f31_local9.crateInfo.containsLootTypes[f31_local29].num ~= nil then
						local f31_local35 = f31_local9.crateInfo.containsLootTypes[f31_local29].num
						local f31_local36 = RegisterMaterial( f31_local9.crateInfo.containsLootTypes[f31_local29].image )
						local f31_local37, f31_local38 = GetMaterialDimensions( f31_local36 )
						local f31_local39 = f31_local18 * 0.5
						local f31_local40 = f31_local39 * f31_local37 / f31_local38
						for f31_local41 = 1, f31_local35, 1 do
							local f31_local44 = f31_local41
							self:addElement( LUI.UIImage.new( {
								leftAnchor = f31_local29 == 1,
								topAnchor = true,
								rightAnchor = f31_local29 == 2,
								bottomAnchor = false,
								left = self,
								top = f31_local34,
								width = f31_local40,
								height = f31_local39,
								material = f31_local36
							} ) )
							self = self + f31_local27
							f31_local34 = f31_local34 + f31_local28
						end
					end
				end
			end
			f0_local12( self, f31_local9.type, f31_arg0.exclusiveController )
			if Engine.GetDvarString( "inventory_contentPromoExpireTime" ) ~= "0" and f31_local9.crateInfo.category == LUI.MPDepot.LootDrops.Drop3 and f31_local9.crateInfo.isPromo == true then
				local f31_local28 = BodyFont.Font
				local f31_local29 = 14
				local self = LUI.UIText.new( {
					leftAnchor = false,
					topAnchor = true,
					rightAnchor = true,
					bottomAnchor = false,
					left = 10,
					top = 10,
					width = 120,
					height = f31_local29,
					alignment = LUI.Alignment.Left,
					font = f31_local28,
					color = Colors.mw1_green
				} )
				self:setText( Engine.Localize( "@DEPOT_LIVE_EVENT" ) )
				self:addElement( self )
				local self = LUI.UIText.new( {
					leftAnchor = false,
					topAnchor = true,
					rightAnchor = true,
					bottomAnchor = false,
					left = 10,
					top = 12 + f31_local29,
					width = 120,
					height = f31_local29,
					alignment = LUI.Alignment.Left,
					font = f31_local28
				} )
				self:addElement( self )
				local self = function ()
					local f35_local0 = Engine.TimeUntilPromoExpires()
					local f35_local1 = math.floor( f35_local0 / 86400 )
					if f35_local1 > 0 then
						local f35_local2 = ""
						if f35_local1 > 1 then
							f35_local2 = "@DEPOT_ENDS_IN_N_DAYS"
						else
							f35_local2 = "@DEPOT_ENDS_IN_N_DAY"
						end
						self:setText( Engine.Localize( f35_local2, f35_local1 ) )
					else
						local f35_local2 = math.floor( f35_local0 / 3600 )
						local f35_local3 = ""
						if f35_local2 > 1 then
							f35_local3 = "@DEPOT_ENDS_IN_N_HOURS"
						elseif f35_local2 < 0 then
							f35_local2 = 0
							f35_local3 = "@DEPOT_ENDS_IN_N_HOURS"
						else
							f35_local3 = "@DEPOT_ENDS_IN_N_HOUR"
						end
						self:setText( Engine.Localize( f35_local3, f35_local2 ) )
					end
				end
				
				self:registerEventHandler( "update_event_time", self )
				local self = LUI.UITimer.new( 60000, "update_event_time" )
				self.id = "update_event_timer"
				self:addElement( self )
				self()
			end
			f31_arg0.list.exclusiveList:addElement( self )
			f31_arg0.list.exclusiveList.buttonCount = f31_arg0.list.exclusiveList.buttonCount + 1
			LUI.MPDepotBase.PlaySparkleAnimation( self, f31_local9.type )
			self:registerEventHandler( "gain_focus", function ( element, event )
				element:animateToState( "default" )
				element.mask:animateToState( "show" )
			end )
			self:registerEventHandler( "lose_focus", function ( element, event )
				element:animateToState( "descale" )
				element.mask:animateToState( "hide" )
			end )
		end
		if f31_local3 == false then
			f31_arg0.list.exclusiveList = nil
		else
			f31_arg0.list.exclusiveList:makeFocusable()
			f31_arg0.list:addElement( f31_arg0.list.exclusiveList )
		end
	end
	return f31_local3
end

LUI.MPDepot.AddBundleDropIcon = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
	if f38_arg1 == 19 or f38_arg1 == 20 then
		return 
	end
	local f38_local0, f38_local1, f38_local2 = nil
	local f38_local3 = Engine.LookupStatsTableColumnForGUID( f38_arg0, StatsTable.Cols.ProdLevel )
	for f38_local7, f38_local8 in pairs( LUI.MPDepot.LootDropsData ) do
		if not string.find( f38_local7, "common" ) and not string.find( f38_local7, "promo" ) and string.find( f38_local8.lootTableColName, f38_local3 ) and f38_local8.icon then
			f38_local0 = RegisterMaterial( f38_local8.icon )
			f38_local1, f38_local2 = GetMaterialDimensions( f38_local0 )
			break
		end
	end
	if f38_local0 then
		f38_local4 = f38_arg3 * 0.8
		f38_local5 = f38_local4 * f38_local1 / f38_local2
		f38_arg2:addElement( LUI.UIImage.new( {
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			left = -f38_local5 / 2,
			top = 0,
			width = f38_local5,
			height = f38_local4,
			material = f38_local0
		} ) )
	end
end

LUI.MPDepot.AddBundleItemImage = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4, f39_arg5 )
	local f39_local0 = Engine.LookupStatsTableColumnForGUID( f39_arg1, StatsTable.Cols.Image )
	if f39_local0 and f39_local0 ~= "" then
		local f39_local1 = RegisterMaterial( f39_local0 )
		local f39_local2, f39_local3 = GetMaterialDimensions( f39_local1 )
		local f39_local4 = f39_arg2 - f39_arg4 + f39_arg5
		local f39_local5 = f39_local4 * f39_local2 / f39_local3
		local self = LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			left = f39_arg3,
			top = -f39_local4 / 2,
			width = f39_local5,
			height = f39_local4,
			material = f39_local1
		} )
		f39_arg0.itemContainer:addElement( self )
		f39_arg3 = f39_arg3 + f39_local5 + f0_local4
		LUI.MPDepot.AddBundleDropIcon( f39_arg1, f39_arg0.bundleID, self, f39_local4 )
	end
	return f39_arg3
end

LUI.MPDepot.AddBundleImage = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4, f40_arg5 )
	local f40_local0 = 0
	local f40_local1 = BodyFont.Font
	local f40_local2 = f0_local5 / 5
	local f40_local3 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.CurrencyAwardAmount )
	if f40_local3 ~= "" then
		f40_local3 = tonumber( f40_local3 )
	else
		f40_local3 = 0
	end
	if f40_arg5 == nil then
		f40_arg5 = -f40_arg3
	end
	f40_arg0.itemContainer = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = f40_arg4,
		top = f40_arg3,
		right = -f40_arg4,
		bottom = f40_arg5,
		scale = 0
	} )
	f40_arg0:addElement( f40_arg0.itemContainer )
	local f40_local4 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.PurchaseLimitItem )
	local f40_local5 = false
	if f40_local4 ~= "" then
		local f40_local6 = LUI.MPDepot.AddBundleItemImage( f40_arg0, f40_local4, f0_local5, f40_local0, f40_arg3, f40_arg5 )
		f40_local5 = f40_local6 ~= f40_local0
		f40_local0 = f40_local6
	end
	if not f40_local5 then
		local f40_local6 = {
			{
				ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item0ID ),
				amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item0Amount )
			},
			{
				ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item1ID ),
				amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item1Amount )
			},
			{
				ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item2ID ),
				amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item2Amount )
			},
			{
				ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item3ID ),
				amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.Item3Amount )
			}
		}
		for f40_local7 = 1, #f40_local6, 1 do
			if f40_local6[f40_local7].ID ~= "" then
				if tonumber( f40_local6[f40_local7].amount ) > 1 then
					local f40_local10 = Engine.Localize( "@DEPOT_NUMBER_X", f40_local6[f40_local7].amount )
					local f40_local11, f40_local12, f40_local13 = GetTextDimensions2( f40_local10, f40_local1, f40_local2 )
					local self = LUI.UIText.new( {
						leftAnchor = true,
						topAnchor = false,
						rightAnchor = false,
						bottomAnchor = false,
						left = f40_local0,
						top = -f40_local2 / 2,
						width = f40_local13,
						height = f40_local2,
						horizontalAlignment = LUI.HorizontalAlignment.Center,
						verticalAlignment = LUI.VerticalAlignment.Middle,
						font = f40_local1
					} )
					self:setText( f40_local10 )
					self:setupAutoScaleText()
					f40_arg0.itemContainer:addElement( self )
					f40_local0 = f40_local0 + f40_local13 + f0_local4 / 2
				end
				f40_local0 = LUI.MPDepot.AddBundleItemImage( f40_arg0, f40_local6[f40_local7].ID, f0_local5, f40_local0, f40_arg3, f40_arg5 )
				if 0 < f40_local3 or f40_local7 < #f40_local6 and f40_local6[f40_local7 + 1].ID ~= "" then
					local f40_local10 = Engine.Localize( "@DEPOT_PLUS" )
					local f40_local11, f40_local12, f40_local13 = GetTextDimensions2( f40_local10, f40_local1, f40_local2 )
					local self = LUI.UIText.new( {
						leftAnchor = true,
						topAnchor = false,
						rightAnchor = false,
						bottomAnchor = false,
						left = f40_local0,
						top = -f40_local2 / 2,
						width = f40_local13,
						height = f40_local2,
						horizontalAlignment = LUI.HorizontalAlignment.Center,
						verticalAlignment = LUI.VerticalAlignment.Middle,
						font = f40_local1
					} )
					self:setText( f40_local10 )
					self:setupAutoScaleText()
					f40_arg0.itemContainer:addElement( self )
					f40_local0 = f40_local0 + f40_local13 + f0_local4
				end
			end
		end
	end
	local f40_local6 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.MarketingImage )
	if f40_local6 ~= "" then
		local f40_local7 = RegisterMaterial( f40_local6 )
		local f40_local8, f40_local9 = GetMaterialDimensions( f40_local7 )
		local f40_local15 = f0_local5 - f40_arg3 + f40_arg5
		f40_arg0:addElement( LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			left = 0,
			top = -f40_local15 / 2,
			width = f40_local15 * f40_local8 / f40_local9,
			height = f40_local15,
			material = f40_local7
		} ) )
	end
	if 0 < f40_local3 then
		local f40_local9 = RegisterMaterial( GetCurrencyImage( tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f40_arg1, LUI.MPDepot.BundlesTable.Cols.CurrencyAwardID ) ) ) )
		local f40_local15, f40_local10 = GetMaterialDimensions( f40_local9 )
		local f40_local11 = (f0_local5 - f40_arg3 * 2) * 0.75
		local f40_local12 = f40_local11 * f40_local15 / f40_local10
		f40_arg0.itemContainer:addElement( LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			left = f40_local0,
			top = -f40_local11 / 2,
			width = f40_local12,
			height = f40_local11,
			material = f40_local9
		} ) )
		f40_local0 = f40_local0 + f40_local12 + f0_local4 / 2
		local self, f40_local16, f40_local17 = GetTextDimensions2( f40_local3, f40_local1, f40_local2 )
		local self = LUI.UIText.new( {
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			left = f40_local0,
			bottom = f0_local4,
			width = f40_local17,
			height = f40_local2,
			horizontalAlignment = LUI.HorizontalAlignment.Left,
			verticalAlignment = LUI.VerticalAlignment.Bottom,
			font = f40_local1
		} )
		self:setText( f40_local3 )
		self:setupAutoScaleText()
		f40_arg0.itemContainer:addElement( self )
		local f40_local19 = f40_local17
		local f40_local20 = Engine.Localize( "@DEPOT_BONUS_PARTS" )
		f40_local2 = f40_local2 * 0.4
		self, f40_local16, f40_local17 = GetTextDimensions2( f40_local20, f40_local1, f40_local2 )
		self = LUI.UIText.new( {
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			left = f40_local0,
			top = f0_local4 * 0.75,
			width = f40_local17,
			height = f40_local2,
			horizontalAlignment = LUI.HorizontalAlignment.Left,
			verticalAlignment = LUI.VerticalAlignment.Top,
			font = f40_local1
		} )
		self:setText( f40_local20 )
		self:setupAutoScaleText()
		f40_arg0.itemContainer:addElement( self )
		if f40_local19 < f40_local17 then
			f40_local19 = f40_local17
		end
		f40_local0 = f40_local0 + f40_local19 + f0_local4
	end
	if f40_arg2 - f40_arg4 * 2 < f40_local0 then
		f40_arg0.itemContainer.scale = 1 / f40_local0 / (f40_arg2 - f40_arg4 * 2) - 1
		local f40_local7 = (f40_arg0.itemContainer.scale * f40_arg2 + f40_arg4) / 2
		f40_arg0.itemContainer:registerAnimationState( "scaled", {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f40_arg4 + f40_local7,
			top = f40_arg3,
			right = -f40_arg4 + f40_local7,
			bottom = f40_arg5,
			scale = f40_arg0.itemContainer.scale
		} )
		f40_arg0.itemContainer:animateToState( "scaled" )
	else
		local f40_local7 = (f40_arg2 - f40_arg4 * 2 - f40_local0) / 2
		f40_arg0.itemContainer:registerAnimationState( "centered", {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f40_arg4 + f40_local7,
			top = f40_arg3,
			right = -f40_arg4 + f40_local7,
			bottom = f40_arg5,
			scale = 0
		} )
		f40_arg0.itemContainer:animateToState( "centered" )
	end
end

local f0_local24 = function ( f41_arg0, f41_arg1, f41_arg2 )
	local f41_local0, f41_local1 = nil
	local f41_local2 = GetBundlePromos()
	local f41_local3 = nil
	for f41_local4 = 1, #f41_local2, 1 do
		local f41_local7 = f41_local2[f41_local4]
		local f41_local8 = Engine.TableLookupGetRowNum( LUI.MPDepot.BundlesTable.File, LUI.MPDepot.BundlesTable.Cols.ID, f41_local7 )
		if f41_local8 >= 0 then
			local f41_local9 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local8, LUI.MPDepot.BundlesTable.Cols.PurchaseID )
			if LUI.MPDepot.LootDropCategory[Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local8, LUI.MPDepot.BundlesTable.Cols.ProductionLevel )] == f41_arg2 and f41_local3 ~= "" and LUI.MPDepot.CanPurchaseBundle( f41_arg0.exclusiveController, f41_local7 ) then
				f41_local0 = f41_local7
				f41_local1 = f41_local8
				f41_local3 = f41_local9
			end
		end
	end
	f41_arg0.list.bundleList = nil
	if f41_local0 ~= nil then
		f41_arg0.list.bundleList = LUI.UIHorizontalList.new( {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			bottom = f0_local9,
			left = 0,
			width = f41_arg1,
			alignment = LUI.HorizontalAlignment.Left,
			spacing = H1MenuDims.spacing
		} )
		f41_arg0.list.bundleList.buttonCount = 0
		f41_arg0.list.bundleList.id = "bundleList"
		local f41_local4 = Engine.Localize( "@" .. Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local1, LUI.MPDepot.BundlesTable.Cols.LocalizedString ) )
		local f41_local5 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseCurrency )
		local f41_local6 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseAmount )
		local f41_local10 = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseLimitQuantity ) ) or 0
		local f41_local7 = ""
		if f41_local10 == 1 then
			f41_local7 = Engine.Localize( "@DEPOT_LIMITED_BUNDLE_DESC", f41_local10 )
		elseif f41_local10 > 1 then
			f41_local7 = Engine.Localize( "@DEPOT_LIMITED_BUNDLE_MULT_DESC", f41_local10 )
		end
		local f41_local8 = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f41_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseLimitItem )
		local f41_local9 = ""
		if f41_local8 and f41_local8 ~= "" then
			f41_local9 = Engine.LookupStatsTableColumnForGUID( f41_local8, StatsTable.Cols.WeaponDesc )
			if f41_local9 and f41_local9 ~= "" then
				f41_local9 = Engine.Localize( f41_local9 )
				if f41_local7 == "" then
					f41_local7 = f41_local9
				end
			end
		end
		local f41_local11 = {
			style = LUI.MenuTemplate.ButtonStyle,
			button_text = f41_local4,
			desc_text = f41_local7,
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = function ( f42_arg0, f42_arg1 )
				LUI.FlowManager.RequestAddMenu( f42_arg0, "MPDepotBundlePurchasePopup", true, f42_arg1.controller, false, {
					purchaseID = f41_local3,
					row = f41_local1,
					desc_text = f41_local9
				} )
			end,
			exclusiveController = f41_arg0.exclusiveController,
			height = f0_local5,
			y_offset = -f0_local5 / 2 + f0_local4 + LUI.MenuTemplate.ButtonStyle.height * LUI.UIGenericButton.fontScale / 4,
			muteAction = true
		}
		local self = LUI.UIGenericButton.new( nil, f41_local11 )
		self:makeFocusable()
		self.properties = f41_local11
		self.bundleID = f41_local0
		self:registerEventHandler( "on_purchased_bundle", function ( element, event )
			f0_local13( f41_arg0 )
			if currencyAwardID ~= "" then
				f41_arg0:UpdateCurrency( tonumber( currencyAwardID ) )
			end
			if f41_local5 ~= "" then
				f41_arg0:UpdateCurrency( tonumber( f41_local5 ) )
			end
			if not LUI.MPDepot.CanPurchaseBundle( event.controller, element.bundleID ) then
				element:close()
				f41_arg0.list.bundleList.buttonCount = f41_arg0.list.bundleList.buttonCount - 1
				if f41_arg0.list.bundleList.buttonCount == 0 then
					f41_arg0.list.bundleList:close()
					f41_arg0.list.bundleList = nil
					f41_arg0.list.supplyDropList:processEvent( {
						name = "gain_focus",
						immediate = true
					} )
					f0_local20( f41_arg0 )
				end
			else
				f0_local22( event.controller, element, f41_local5, f41_local6 )
			end
		end )
		LUI.MPDepot.AddBundleImage( self, f41_local1, f41_arg1, f0_local7 + f0_local4, f0_local4 )
		self.costList = LUI.UIHorizontalList.new( {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			bottom = -f0_local4,
			height = f0_local7,
			alignment = LUI.HorizontalAlignment.Center,
			spacing = H1MenuDims.spacing
		} )
		self:addElement( self.costList )
		f0_local11( self.costList, f41_local6, tonumber( f41_local5 ) )
		f41_arg0.list.bundleList:addElement( self )
		f0_local22( f41_arg0.exclusiveController, self, f41_local5, f41_local6 )
		f41_arg0.list.bundleList.buttonCount = f41_arg0.list.bundleList.buttonCount + 1
		f41_arg0.list.bundleList:makeFocusable()
		f41_arg0.list:addElement( f41_arg0.list.bundleList )
	end
end

LUI.MPDepot.PopulateList = function ( f44_arg0, f44_arg1 )
	local f44_local0, f44_local1, f44_local2, f44_local3 = f44_arg0.list:getLocalRect()
	local f44_local4 = (f44_local2 - f44_local0) * 2 + f0_local4
	local f44_local5 = false
	if f44_arg0.list.buttonCount > 0 then
		f44_local5 = true
	end
	if f44_arg0.list.supplyDropList then
		f44_arg0.list.supplyDropList:clearSavedState()
	end
	if f44_arg0.list.bundleList then
		f44_arg0.list.bundleList:clearSavedState()
	end
	f44_arg0.list:closeChildren()
	f44_arg0.list:clearSavedState()
	f44_arg0.list.buttonCount = 0
	f44_arg0:AddSpacing( 5 )
	if not f0_local23( f44_arg0, f44_local4, f44_arg1 ) then
		f0_local24( f44_arg0, f44_local4, f44_arg1 )
	end
	f44_arg0.list.supplyDropList = LUI.UIHorizontalList.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = f0_local9,
		left = 0,
		alignment = LUI.HorizontalAlignment.Left,
		spacing = H1MenuDims.spacing
	} )
	f44_arg0.list.supplyDropList.buttonCount = 0
	f44_arg0.list.supplyDropList:makeFocusable()
	f44_arg0.list:addElement( f44_arg0.list.supplyDropList )
	local f44_local6 = {}
	if f44_arg1 == LUI.MPDepot.LootDrops.Drop3 then
		f44_local6[#f44_local6 + 1] = LUI.MPDepot.SupplyCrateTypes.CH_Common
		f44_local6[#f44_local6 + 1] = LUI.MPDepot.SupplyCrateTypes.CH_Rare
	elseif f44_arg1 == LUI.MPDepot.LootDrops.Drop2 then
		f44_local6[#f44_local6 + 1] = LUI.MPDepot.SupplyCrateTypes.LS_Common
		f44_local6[#f44_local6 + 1] = LUI.MPDepot.SupplyCrateTypes.LS_Rare
	else
		f44_local6[#f44_local6 + 1] = LUI.MPDepot.SupplyCrateTypes.AW_Common
		f44_local6[#f44_local6 + 1] = LUI.MPDepot.SupplyCrateTypes.AW_Rare
	end
	for f44_local7 = 1, #f44_local6, 1 do
		f0_local14( f44_arg0.list.supplyDropList, f44_local6[f44_local7], f44_arg0.exclusiveController )
	end
	local f44_local7 = GetItemSets()
	f44_arg0:AddButtonWithInfo( "depot_collections", "@DEPOT_COLLECTIONS", "MPDepotCollectionsMenu", nil, nil, Engine.Localize( "@MPUI_X_SLASH_Y", f44_local7.completedSets, f44_local7.numSets ) )
	f44_arg0:AddButtonWithInfo( "depot_armory", "@DEPOT_ARMORY", "MPDepotArmoryMenu" )
	if f44_arg0:CanShowStore() then
		f44_arg0:AddButtonWithInfo( "depot_purchase_cod_points", "@DEPOT_PURCHASE_COD_POINTS", function ( f45_arg0, f45_arg1 )
			Sns.OpenStoreMenu( f45_arg1.controller, LUI.ComScore.ScreenID.Depot, LUI.ComScore.StoreSource.MenuButton )
		end )
	end
	f44_arg0:CreateBottomDivider()
	f44_arg0:AddBottomDividerToList()
	f44_arg0:AddSpacing( 10 )
	f44_arg0.list:addElement( LUI.ButtonDescText.new( nil, {
		lines = 1,
		font = CoD.TextSettings.BodyFontSmall,
		margin = 0
	} ) )
	f44_arg0.list.supplyDropList:setLayoutCached( false )
	f44_arg0.list.supplyDropList:updateNavigation()
	if f44_arg0.list.exclusiveList then
		f44_arg0.list.exclusiveList:setLayoutCached( false )
		f44_arg0.list.exclusiveList:updateNavigation()
	end
	if f44_arg0.list.bundleList then
		f44_arg0.list.bundleList:setLayoutCached( false )
		f44_arg0.list.bundleList:updateNavigation()
	end
	if f44_local5 then
		f44_arg0.list:processEvent( {
			name = "gain_focus",
			immediate = true
		} )
	end
end

function MPDepotMenu( f46_arg0, f46_arg1 )
	local f46_local0 = f46_arg1 or {}
	LUI.CacStaticLayout.ClassLoc = Cac.GetCustomClassLoc()
	f46_local0.persistentBackground = PersistentBackground.Variants.Depot
	f46_local0.menu_title = "@DEPOT_DEPOT"
	f46_local0.onBackFunc = DepotOnBack
	local f46_local1 = LUI.MPDepotBase.new( f46_arg0, f46_local0 )
	f46_local1:setClass( LUI.MPDepot )
	f0_local10( f46_local1 )
	local f46_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f46_local2.material = RegisterMaterial( "depot_vignette" )
	f46_local2.alpha = 0.5
	local self = LUI.UIImage.new( f46_local2 )
	self:setupFullWindowElement()
	self:setPriority( -100 )
	f46_local1:addElement( self )
	f46_local1:AddHelp( LUI.ButtonHelperText.CommonEvents.addOnboardingButton, function ( f47_arg0, f47_arg1 )
		LUI.OnboardingPopups.All( {
			controller = f46_arg1.exclusiveController
		} )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	f46_local1:AddLootDropTabSelector( {
		{
			Name = "@DEPOT_SEASON_3",
			Tag = LUI.MPDepot.LootDrops.Drop3
		},
		{
			Name = "@DEPOT_SEASON_2",
			Tag = LUI.MPDepot.LootDrops.Drop2
		},
		{
			Name = "@DEPOT_SEASON_1",
			Tag = LUI.MPDepot.LootDrops.Drop1
		}
	} )
	f46_local1:registerEventHandler( "supply_drop", SupplyDropResult )
	f46_local1:registerEventHandler( "play_sound", LUI.MPDepotBase.PlaySound )
	f46_local1:registerEventHandler( "stop_sound", LUI.MPDepotBase.StopSound )
	f46_local1:registerEventHandler( "menu_close", f0_local19 )
	Cac.NotifyVirtualLobby( "lootscreen_weapon_highlighted", "none" )
	f46_local1:registerAnimationState( "hide", {
		alpha = 0
	} )
	f46_local1:registerAnimationState( "show", {
		alpha = 1
	} )
	f46_local1:animateToState( "hide" )
	f46_local1:registerEventHandler( "gamepad_button", function ( element, event )
		
	end )
	if Engine.GetDvarBool( "vlDepotLoaded" ) then
		f0_local18( f46_local1, {
			fadeTime = 250,
			returnControlsTime = 250
		} )
	else
		f46_local1:registerDvarHandler( "vlDepotLoaded", f0_local18 )
	end
	return f46_local1
end

LUI.MenuBuilder.registerType( "MPDepotMenu", MPDepotMenu )
VLobby.InitMenuMode( "MPDepotMenu", VirtualLobbyModes.LUI_MODE_LOBBY, PersistentBackground.FadeFromBlackSlow, PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
