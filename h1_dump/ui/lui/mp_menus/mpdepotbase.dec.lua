EnableGlobals()
InventoryCurrencyType = {
	LaunchCredits = 1,
	Credits = 2,
	Parts = 3,
	CoDPoints = 4,
	Bonus = 5,
	Max = 6
}
CurrencyInfo = {
	[InventoryCurrencyType.Credits] = {
		name = Engine.Localize( "@DEPOT_CREDITS" )
	},
	[InventoryCurrencyType.Parts] = {
		name = Engine.Localize( "@DEPOT_PARTS" )
	},
	[InventoryCurrencyType.CoDPoints] = {
		name = Engine.Localize( "@DEPOT_COD_POINTS" )
	},
	[InventoryCurrencyType.Bonus] = {
		name = Engine.Localize( "@DEPOT_BONUS" )
	}
}
CoD.currencyCreditConversionRate = 0
RarityInfo = {
	[Cac.InventoryItemRarity.Common] = {
		rarity = Cac.InventoryItemRarity.Common,
		name = "@DEPOT_RARITY_COMMON",
		comScoreKey = "common",
		img = RegisterMaterial( "depot_card_common" ),
		corner = RegisterMaterial( "depot_button_rarity_corner_common" ),
		glow = RegisterMaterial( "depot_button_rarity_glow_common" ),
		strip = RegisterMaterial( "depot_button_rarity_strip_common" ),
		color = {
			r = 0.37,
			g = 0.37,
			b = 0.37
		}
	},
	[Cac.InventoryItemRarity.Rare] = {
		rarity = Cac.InventoryItemRarity.Rare,
		name = "@DEPOT_RARITY_RARE",
		comScoreKey = "rare",
		img = RegisterMaterial( "depot_card_rare" ),
		corner = RegisterMaterial( "depot_button_rarity_corner_rare" ),
		glow = RegisterMaterial( "depot_button_rarity_glow_rare" ),
		strip = RegisterMaterial( "depot_button_rarity_strip_rare" ),
		color = {
			r = 0,
			g = 0.54,
			b = 0.74
		}
	},
	[Cac.InventoryItemRarity.Legendary] = {
		rarity = Cac.InventoryItemRarity.Legendary,
		name = "@DEPOT_RARITY_LEGENDARY",
		comScoreKey = "legendary",
		img = RegisterMaterial( "depot_card_legendary" ),
		corner = RegisterMaterial( "depot_button_rarity_corner_legendary" ),
		glow = RegisterMaterial( "depot_button_rarity_glow_legendary" ),
		strip = RegisterMaterial( "depot_button_rarity_strip_legendary" ),
		color = {
			r = 0.54,
			g = 0.06,
			b = 0.74
		}
	},
	[Cac.InventoryItemRarity.Epic] = {
		rarity = Cac.InventoryItemRarity.Epic,
		name = "@DEPOT_RARITY_EPIC",
		comScoreKey = "epic",
		img = RegisterMaterial( "depot_card_epic" ),
		corner = RegisterMaterial( "depot_button_rarity_corner_epic" ),
		glow = RegisterMaterial( "depot_button_rarity_glow_epic" ),
		strip = RegisterMaterial( "depot_button_rarity_strip_epic" ),
		color = {
			r = 1,
			g = 0.8,
			b = 0.18
		}
	},
	[Cac.InventoryItemRarity.Reward] = {
		rarity = Cac.InventoryItemRarity.Reward,
		name = "@DEPOT_BOUNTY",
		comScoreKey = "reward",
		img = RegisterMaterial( "depot_card_reward" ),
		corner = RegisterMaterial( "depot_button_rarity_corner_reward" ),
		glow = RegisterMaterial( "depot_button_rarity_glow_reward" ),
		strip = RegisterMaterial( "depot_button_rarity_strip_reward" ),
		color = {
			r = 0,
			g = 0,
			b = 0
		}
	},
	[Cac.InventoryItemRarity.Entitlement] = {
		rarity = Cac.InventoryItemRarity.Entitlement,
		name = "",
		comScoreKey = "entitlement",
		img = RegisterMaterial( "depot_card_common" ),
		corner = RegisterMaterial( "depot_button_rarity_corner_reward" ),
		glow = RegisterMaterial( "depot_button_rarity_glow_reward" ),
		strip = RegisterMaterial( "depot_button_rarity_strip_reward" ),
		color = {
			r = 0,
			g = 0,
			b = 0
		}
	}
}
function GetCurrencyImage( f1_arg0 )
	if f1_arg0 == InventoryCurrencyType.Credits then
		return "depot_currency_credit"
	elseif f1_arg0 == InventoryCurrencyType.Parts then
		return "depot_currency_parts"
	elseif f1_arg0 == InventoryCurrencyType.CoDPoints then
		return "depot_currency_cp"
	elseif f1_arg0 == InventoryCurrencyType.Bonus then
		return "white"
	else
		
	end
end

function GetCurrencyBalance( f2_arg0, f2_arg1 )
	if f2_arg1 and -1 < f2_arg1 then
		local f2_local0 = f2_arg1
	end
	local f2_local1 = f2_local0 or Engine.GetFirstActiveController()
	if f2_arg0 ~= InventoryCurrencyType.Credits then
		return Depot.Inventory_GetCurrencyBalance( f2_local1, f2_arg0 )
	else
		return Depot.Inventory_GetCurrencyBalance( f2_local1, f2_arg0 ) * CoD.currencyCreditConversionRate
	end
end

function SetDepotState( f3_arg0, f3_arg1 )
	if Engine.GetDvarBool( "virtualLobbyPresentable" ) then
		Cac.NotifyVirtualLobby( "depot_state", f3_arg1.state )
	end
end

local f0_local0 = function ( f4_arg0 )
	local f4_local0 = LUI.InventoryUtils.GetLootData( f4_arg0 )
	if f4_local0 == nil then
		f4_local0 = {
			name = "Bad data",
			desc = "Ya dun goofed",
			loot_type = ItemTypes.Playercard,
			image = RegisterMaterial( CoD.Material.Star ),
			lootRarity = RarityInfo[3],
			guid = "0x100c6a9"
		}
	elseif f4_local0.image == nil then
		f4_local0.image = RegisterMaterial( CoD.Material.Star )
	end
	return f4_local0
end

local f0_local1, f0_local2 = nil
function InvalidateItemSets()
	f0_local2.controller = nil
end

function GetItemSets_CommonData()
	local f6_local0 = {
		seasons = {},
		numSets = 0,
		completedSets = 0,
		itemToSetMap = {},
		idToSetMap = {},
		itemToSeasonMap = {},
		controller = controller
	}
	if f0_local1 == nil then
		f0_local1 = {}
		for f6_local1 = 1, #LUI.MPDepot.Collections, 1 do
			local f6_local4 = LUI.MPLootDropsBase.GetLootDropListFromString( LUI.MPDepot.Collections[f6_local1].Tag )
			for f6_local5 = 1, #f6_local4, 1 do
				local f6_local8, f6_local9 = LUI.MPLootDropsBase.ParseDropAndPromoFromString( f6_local4[f6_local5] )
				local f6_local10 = Engine.Loot_GetItemSets( f6_local8, f6_local9 )
				if f0_local1[f6_local1] == nil then
					f0_local1[f6_local1] = f6_local10
				end
				for f6_local11 = 1, #f6_local10, 1 do
					f0_local1[f6_local1][#f0_local1[f6_local1] + 1] = f6_local10[f6_local11]
				end
			end
		end
	end
	for f6_local1 = 1, #LUI.MPDepot.Collections, 1 do
		local f6_local14 = LUI.MPDepot.Collections[f6_local1]
		local f6_local15 = {
			sets = {},
			completedSets = 0,
			tag = f6_local14.Tag
		}
		f6_local0.seasons[f6_local1] = f6_local15
		if CollectionRewardsEnabled() and f6_local14.Reward ~= nil then
			local f6_local4 = {
				setReward = f0_local0( f6_local14.Reward ),
				isSeasonReward = true,
				name = f6_local4.setReward.name,
				completed = false
			}
			f6_local15.rewardData = f6_local4
		end
		local f6_local4 = f0_local1[f6_local1]
		local f6_local5 = #f6_local4
		for f6_local6 = 1, f6_local5, 1 do
			local f6_local9 = {
				name = nil,
				setID = 0,
				setReward = nil,
				setItems = {},
				numOwned = 0,
				completed = false
			}
			f6_local15.sets[f6_local6] = f6_local9
			local f6_local10 = f6_local4[f6_local6]
			f6_local9.setID = f6_local10.setID
			f6_local0.idToSetMap[f6_local9.setID] = f6_local9
			f6_local9.name = Engine.Localize( f6_local10.name )
			f6_local9.setReward = f0_local0( f6_local10.reward )
			f6_local0.itemToSetMap[f6_local10.reward] = f6_local9
			f6_local0.itemToSeasonMap[f6_local10.reward] = f6_local15
			for f6_local11 = 1, #f6_local10.items, 1 do
				local f6_local17 = f6_local10.items[f6_local11]
				f6_local9.setItems[f6_local11] = f0_local0( f6_local17 )
				f6_local0.itemToSetMap[f6_local17] = f6_local9
				f6_local0.itemToSeasonMap[f6_local17] = f6_local15
			end
			if not CollectionRewardsEnabled() then
				f6_local9.setItems[#f6_local9.setItems + 1] = f6_local9.setReward
			end
			table.sort( f6_local9.setItems, function ( f7_arg0, f7_arg1 )
				if f7_arg0 then
					local f7_local0 = f7_arg0.lootRarity
					local f7_local1 = RaritySortTable[f7_arg0.lootRarity.rarity]
				end
				local f7_local2 = f7_local0 and f7_local1 or -1
				if f7_arg1 then
					local f7_local3 = f7_arg1.lootRarity
					local f7_local4 = RaritySortTable[f7_arg1.lootRarity.rarity]
				end
				local f7_local5 = f7_local3 and f7_local4 or -1
				if f7_local2 == f7_local5 then
					return f7_arg0.name < f7_arg1.name
				else
					return f7_local5 < f7_local2
				end
			end )
			f6_local0.numSets = f6_local0.numSets + 1
		end
		table.sort( f6_local15.sets, function ( f8_arg0, f8_arg1 )
			return f8_arg0.name < f8_arg1.name
		end )
	end
	f0_local2 = f6_local0
end

function GetItemSets_ControllerData( f9_arg0 )
	f0_local2.controller = f9_arg0
	f0_local2.completedSets = 0
	for f9_local0 = 1, #f0_local2.seasons, 1 do
		local f9_local3 = f0_local2.seasons[f9_local0]
		f9_local3.completedSets = 0
		for f9_local4 = 1, #f9_local3.sets, 1 do
			local f9_local7 = f9_local3.sets[f9_local4]
			f9_local7.numOwned = 0
			for f9_local8 = 1, #f9_local7.setItems, 1 do
				local f9_local11 = f9_local7.setItems[f9_local8]
				f9_local11.isOwned = Engine.Inventory_GetItemQuantity( f9_arg0, f9_local11.guid, false ) > 0
				if f9_local11.isOwned then
					f9_local7.numOwned = f9_local7.numOwned + 1
				end
			end
			f9_local7.completed = f9_local7.numOwned == #f9_local7.setItems
			if f9_local7.completed then
				f9_local3.completedSets = f9_local3.completedSets + 1
				f0_local2.completedSets = f0_local2.completedSets + 1
			end
		end
		if f9_local3.rewardData ~= nil then
			f9_local3.rewardData.completed = f9_local3.completedSets == #f9_local3.sets
			local f9_local4 = Engine.Inventory_GetItemQuantity( f9_arg0, f9_local3.rewardData.setReward.guid, false ) > 0
			f9_local3.rewardData.setReward.isOwned = f9_local4
			local f9_local5 = f9_local3.rewardData.setReward
			if f9_local4 then
				local f9_local6 = 1
				if not f9_local6 then
				
				else
					f9_local5.numOwned = f9_local6
				end
			end
			f9_local6 = 0
		end
	end
end

function GetItemSets()
	if f0_local2 == nil then
		GetItemSets_CommonData()
	end
	local f10_local0 = Cac.GetSelectedControllerIndex()
	if f0_local2.controller ~= f10_local0 then
		GetItemSets_ControllerData( f10_local0 )
	end
	return f0_local2
end

function GetItemSet( f11_arg0 )
	local f11_local0 = GetItemSets()
	return f11_local0.idToSetMap[f11_arg0]
end

function GetCollectionForItem( f12_arg0 )
	local f12_local0 = GetItemSets()
	return f12_local0.itemToSetMap[f12_arg0]
end

function GetSeasonForItem( f13_arg0 )
	local f13_local0 = GetItemSets()
	return f13_local0.itemToSeasonMap[f13_arg0]
end

function TryShowCollectionCompleted( f14_arg0, f14_arg1, f14_arg2 )
	if CollectionRewardsEnabled() and f14_arg1 ~= nil and f14_arg1.setID ~= nil and (f14_arg1.completed or f14_arg2) and (Engine.Loot_CanClaimItemSetReward( f14_arg0, f14_arg1.setID ) or f14_arg2) then
		LUI.FlowManager.RequestAddMenu( nil, "MPDepotCollectionRewardSplash", true, f14_arg0, false, {
			collectionData = f14_arg1
		} )
		return true
	else
		return false
	end
end

function TryShowSeasonCompleted( f15_arg0, f15_arg1, f15_arg2 )
	if CollectionRewardsEnabled() and f15_arg1 ~= nil and (f15_arg1.completed or f15_arg2) and Engine.Inventory_GetItemQuantity( f15_arg0, f15_arg1.setReward.guid, false ) == 0 then
		LUI.FlowManager.RequestAddMenu( nil, "MPDepotCollectionRewardSplash", true, f15_arg0, false, {
			collectionData = f15_arg1
		} )
		return true
	else
		return false
	end
end

local f0_local3 = function ( f16_arg0, f16_arg1 )
	if Engine.GetDvarBool( "vlDepotEnabled" ) then
		local f16_local0 = {
			[6] = "grvs_coll_unlock_dlc1_01",
			[23] = "grvs_coll_unlock_dlc1_02",
			[76] = "grvs_coll_unlock_dlc1_04",
			[3] = "grvs_coll_unlock_dlc1_06",
			[38] = "grvs_coll_unlock_dlc1_07"
		}
		local f16_local1 = f16_local0[f16_arg1.setID] or "grvs_coll_unlock_gnrc"
		f16_arg0.timerIdx = (f16_arg0.timerIdx or 0) + 1
		local self = LUI.UITimer.new( 1500, "delay_complete", nil, true )
		self.id = "delay_timer_" .. f16_arg0.timerIdx
		f16_arg0:registerEventHandler( "delay_complete", function ()
			if f16_arg0.rewardVO then
				Engine.StopSound( f16_arg0.rewardVO )
			end
			f16_arg0.rewardVO = Engine.PlaySound( f16_local1 )
			self:close()
		end )
		f16_arg0:addElement( self )
	end
end

function ProcessCollectionRewardQueue( f18_arg0, f18_arg1 )
	if f18_arg0.collectionRewardQueue and #f18_arg0.collectionRewardQueue > 0 then
		local f18_local0 = false
		while #f18_arg0.collectionRewardQueue > 0 and f18_local0 == false do
			local f18_local1 = table.remove( f18_arg0.collectionRewardQueue, 1 )
			if f18_local1.isSeasonReward ~= nil then
				if TryShowSeasonCompleted( f18_arg0.exclusiveController, f18_local1, f18_arg0.debugShowCollectionReward ) then
					f0_local3( f18_arg0, f18_local1 )
					f18_arg0:registerEventHandler( "popup_inactive", function ( element, event )
						element:addElement( LUI.UITimer.new( 100, "process_collection_rewards", nil, true ) )
					end )
					f18_local0 = true
				end
			end
			if TryShowCollectionCompleted( f18_arg0.exclusiveController, f18_local1, f18_arg0.debugShowCollectionReward ) then
				f0_local3( f18_arg0, f18_local1 )
				f18_arg0:registerEventHandler( "popup_inactive", function ( element, event )
					element:addElement( LUI.UITimer.new( 100, "process_collection_rewards", nil, true ) )
				end )
				f18_local0 = true
			end
		end
	else
		f18_arg0:registerEventHandler( "popup_inactive", nil )
	end
end

function CollectionRewardQueueAdd( f21_arg0, f21_arg1 )
	if not f21_arg0.collectionRewardQueue then
		f21_arg0.collectionRewardQueue = {}
		f21_arg0:registerEventHandler( "process_collection_rewards", ProcessCollectionRewardQueue )
	end
	table.insert( f21_arg0.collectionRewardQueue, f21_arg1 )
end

function RandomFloatRange( f22_arg0, f22_arg1 )
	return math.random() * (f22_arg1 - f22_arg0) + f22_arg0
end

local f0_local4 = function ( f23_arg0 )
	local f23_local0 = {}
	for f23_local4 in string.gmatch( f23_arg0, "-?%d+" ) do
		local f23_local5 = tonumber( f23_local4 )
		if f23_local5 ~= 0 then
			table.insert( f23_local0, f23_local5 )
		end
	end
	return f23_local0
end

local f0_local5 = function ( f24_arg0, f24_arg1 )
	if f24_arg0 == nil or f24_arg0 == 0 then
		return true
	end
	local f24_local0 = f0_local4( f24_arg1 )
	for f24_local1 = 1, #f24_local0, 1 do
		local f24_local4 = f24_local0[f24_local1]
		if f24_local4 < 0 or f24_local4 == f24_arg0 then
			return true
		end
	end
	return false
end

function IsBundlePromoUnlocked( f25_arg0 )
	return f0_local5( f25_arg0, Engine.GetDvarString( "inventory_bundlePromo" ) )
end

function GetBundlePromos()
	return f0_local4( Engine.GetDvarString( "inventory_bundlePromo" ) )
end

function IsContentPromoUnlocked( f27_arg0 )
	return f0_local5( f27_arg0, Engine.GetDvarString( "inventory_contentPromo" ) )
end

function GetContentPromos()
	return f0_local4( Engine.GetDvarString( "inventory_contentPromo" ) )
end

DisableGlobals()
local f0_local6 = module
local f0_local7, f0_local8 = ...
f0_local6( f0_local7, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotBase = InheritFrom( LUI.MenuTemplate )
LUI.MPDepotBase.Broke = function ( f29_arg0, f29_arg1 )
	SetDepotState( f29_arg0, {
		state = "broke"
	} )
end

LUI.MPDepotBase.StopSound = function ( f30_arg0, f30_arg1 )
	if f30_arg1 then
		if f30_arg1.sound then
			Engine.StopSound( f30_arg1.sound )
		end
		if f30_arg1.stop_event then
			f30_arg0:registerEventHandler( f30_arg1.stop_event, nil )
		end
	end
end

LUI.MPDepotBase.PlaySound = function ( f31_arg0, f31_arg1 )
	if f31_arg1 and f31_arg1.sound then
		local f31_local0 = Engine.PlaySound( f31_arg1.sound )
		if f31_arg1.stop_delay then
			local f31_local1 = f31_arg0:getRootParent()
			f31_local1:registerEventHandler( "stop_sound", LUI.MPDepotBase.StopSound )
			f31_local1:addElement( LUI.UITimer.new( f31_arg1.stop_delay, {
				name = "stop_sound",
				sound = f31_local0,
				stop_event = stop_event
			}, nil, true ) )
		end
		if f31_arg1.stop_event then
			f31_arg0:registerEventHandler( f31_arg1.stop_event, function ( element, event )
				LUI.MPDepotBase.StopSound( element, {
					sound = f31_local0
				} )
				element:registerEventHandler( f31_arg1.stop_event, nil )
			end )
		end
		return f31_local0
	else
		
	end
end

LUI.MPDepotBase.UpdateSparkle = function ( f33_arg0 )
	local f33_local0 = math.random( 75, 125 )
	local f33_local1 = f33_local0 * f33_arg0.matHeightWidthRatio
	local f33_local2 = f33_arg0:getParent()
	f33_local2 = f33_local2.crateWidth
	local f33_local3 = f33_arg0:getParent()
	f33_local3 = f33_local3.crateHeight
	local f33_local4 = math.random( -f33_local2 * 0.33, f33_local2 * 0.33 )
	local f33_local5 = math.random( -f33_local3 * 0.1, f33_local3 * 0.1 )
	local f33_local6 = CoD.CreateState( f33_local4 - f33_local0 / 2, f33_local5, f33_local4 + f33_local0 / 2, f33_local5 + f33_local1, CoD.AnchorTypes.Bottom )
	f33_local6.alpha = 0
	f33_arg0:registerAnimationState( "start", f33_local6 )
	f33_local5 = math.random( f33_local3 * 0.1, f33_local3 * 0.2 )
	f33_local6.alpha = 1
	f33_local6.top = f33_local6.top - f33_local5
	f33_local6.bottom = f33_local6.bottom - f33_local5
	local f33_local7 = f33_local5
	f33_arg0:registerAnimationState( "fade_in", f33_local6 )
	f33_local5 = math.random( f33_local1, f33_local1 * 1.1 )
	f33_local6.top = f33_local6.top - f33_local5
	f33_local6.bottom = f33_local6.bottom - f33_local5
	local f33_local8 = f33_local5
	f33_arg0:registerAnimationState( "move", f33_local6 )
	f33_local5 = math.random( f33_local3 * 0.1, f33_local3 * 0.2 )
	f33_local6.alpha = 0
	f33_local6.top = f33_local6.top - f33_local5
	f33_local6.bottom = f33_local6.bottom - f33_local5
	local f33_local9 = f33_local5
	f33_arg0:registerAnimationState( "fade_out", f33_local6 )
	local f33_local10 = math.random( 15, 45 )
	f33_arg0:animateInSequence( {
		{
			"start",
			0
		},
		{
			"fade_in",
			f33_local7 / f33_local10 * 1000
		},
		{
			"move",
			f33_local8 / f33_local10 * 1000
		},
		{
			"fade_out",
			f33_local9 / f33_local10 * 1000
		}
	}, nil, true, true )
	f33_arg0:addElement( LUI.UITimer.new( (f33_local7 + f33_local8 + f33_local9) / f33_local10 * 1000 + math.random( 5, 100 ), "update_sparkle", nil, true ) )
end

LUI.MPDepotBase.PlaySparkleAnimation = function ( f34_arg0, f34_arg1 )
	local f34_local0 = 12
	local f34_local1 = 4
	local f34_local2, f34_local3, f34_local4, f34_local5 = f34_arg0:getLocalRect()
	local f34_local6 = f34_local4 - f34_local2
	local f34_local7 = f34_local5 - f34_local3
	local f34_local8 = CoD.CreateState( f34_local6 * 0.15, 0, -f34_local6 * 0.15, 0, CoD.AnchorTypes.TopLeftRight )
	f34_arg0.mask = LUI.UIElement.new( f34_local8 )
	f34_arg0.mask:registerAnimationState( "hide", f34_local8 )
	f34_local8.top = -f34_local7 * 0.8
	f34_local8.bottom = f34_local7 * 0.45
	f34_arg0.mask:registerAnimationState( "show", f34_local8 )
	f34_arg0.mask.crateWidth = f34_local6
	f34_arg0.mask.crateHeight = f34_local7
	f34_arg0.mask:setUseStencil( true )
	f34_arg0:addElement( f34_arg0.mask )
	f34_arg0.sparkles = {}
	local f34_local9 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.None )
	f34_local9.alpha = 0
	f34_local9.color = LUI.MPDepot.crateData[f34_arg1].sparkleColor
	for f34_local10 = 1, f34_local0, 1 do
		f34_local9.material = RegisterMaterial( "reward_splash_particles_" .. f34_local10 % f34_local1 + 1 )
		f34_arg0.sparkles[f34_local10] = LUI.UIImage.new( f34_local9 )
		local f34_local13, f34_local14 = GetMaterialDimensions( f34_local9.material )
		f34_arg0.sparkles[f34_local10].matHeightWidthRatio = f34_local14 / f34_local13
		f34_arg0.sparkles[f34_local10]:registerEventHandler( "update_sparkle", LUI.MPDepotBase.UpdateSparkle )
		f34_arg0.sparkles[f34_local10]:addElement( LUI.UITimer.new( math.random( 10, 25 ) * f34_local10 * 0.1, "update_sparkle", nil, true ) )
		f34_arg0.mask:addElement( f34_arg0.sparkles[f34_local10] )
	end
end

LUI.MPDepotBase.UpdateNewInventory = function ( f35_arg0, f35_arg1 )
	local f35_local0 = f35_arg0:getParent()
	if f35_arg0.text ~= nil and f35_local0.info ~= nil then
		local f35_local1 = f35_local0.info .. " " .. f35_arg0.text.newString
		f35_arg0.text:setText( f35_local1 )
		local f35_local2, f35_local3, f35_local4, f35_local5 = GetTextDimensions( f35_local1, f35_arg0.text.defaultState.font, f35_arg0.text.defaultState.height )
		local f35_local6 = f35_arg0.defaultState
		f35_local6.width = f35_arg0.defaultState.default_width + f35_local4 - f35_local2
		f35_local6.alpha = 1
		f35_arg0:setup3SliceRatio( 4, 0.38 )
		f35_arg0:registerAnimationState( "show", f35_local6 )
		f35_arg0:animateToState( "show" )
	else
		f35_arg0:animateToState( "hidden" )
	end
end

LUI.MPDepotBase.AddInfoToButton = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4, f36_arg5, f36_arg6 )
	if not f36_arg4 then
		f36_arg4 = 0
	end
	if not f36_arg6 then
		f36_arg6 = 0
	end
	local f36_local0 = GenericButtonSettings.Common
	f36_local0.align = f36_arg5 or LUI.AdjustAlignmentForLanguage( LUI.Alignment.Right )
	f36_local0.padding = LUI.MenuTemplate.ButtonStyle.text_padding_with_content + f36_arg4
	f36_local0.paddingFocus = LUI.MenuTemplate.ButtonStyle.text_padding_focus_with_content + f36_arg4
	f36_local0.yOffset = 2 + f36_arg6
	local f36_local1
	if f36_arg3 then
		f36_local1 = CoD.TextSettings.BodyFontSmall
		if not f36_local1 then
		
		else
			f36_arg1.subTextField = LUI.UIGenericButton.ButtonLabelFactory( f36_local0, f36_arg2, f36_arg1, nil, nil, f36_local1 )
			f36_arg1:addElement( f36_arg1.subTextField )
		end
	end
	f36_local1 = CoD.TextSettings.BodyFontVeryTiny
end

LUI.MPDepotBase.AddButtonWithInfo = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4, f37_arg5, f37_arg6, f37_arg7 )
	if type( f37_arg3 ) == "table" then
		local f37_local0 = LUI.DeepCopy( f37_arg3 )
		f37_arg3 = function ( f38_arg0, f38_arg1 )
			LUI.FlowManager.RequestAddMenu( f38_arg0, f37_local0.menu_name, true, f38_arg1.controller, false, f37_local0 )
		end
		
	end
	local f37_local0 = f37_arg0:AddButton( f37_arg2, f37_arg3, f37_arg4, nil, nil, {
		desc_text = f37_arg5,
		showNewSticker = f37_arg7 ~= nil,
		newStickerUpdateFunction = f37_arg7,
		newStickerMode = LUI.NewSticker.WithText
	}, true )
	f37_local0:rename( f37_arg1 )
	f37_local0:setDisabledRefreshRate( 500 )
	if f37_arg6 ~= nil then
		f37_local0.info = f37_arg6
		if f37_arg7 == nil then
			f37_arg0:AddInfoToButton( f37_local0, f37_arg6 )
		else
			f37_local0:processEvent( {
				name = "update_new_sticker"
			} )
		end
	end
	return f37_local0
end

LUI.MPDepotBase.PopulateList = function ( f39_arg0, f39_arg1 )
	
end

LUI.MPDepotBase.AddLootDropTabSelector = function ( f40_arg0, f40_arg1 )
	if f40_arg1 ~= nil then
		local f40_local0 = f40_arg1
	end
	local f40_local1 = f40_local0 or LUI.MPDepot.Collections
	local f40_local2 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			top = 10
		},
		numOfTabs = #f40_local1,
		vPadding = 20,
		forceStringBasedTabWidth = true,
		forceShowTabs = true
	} )
	f40_local2:keepRightBumperAlignedToHeader( true )
	f40_arg0.tabManager = f40_local2
	local f40_local3 = LUI.FlowManager.GetMenuScopedDataFromElement( f40_arg0 )
	local f40_local4 = GetContentPromos()
	local f40_local5 = GetBundlePromos()
	local f40_local6 = f40_arg0.type == "MPDepotMenu"
	for f40_local7 = 1, #f40_local1, 1 do
		local f40_local10 = f40_local7
		local f40_local11 = f40_local2
		local f40_local12 = f40_local2.addTab
		local f40_local13 = Engine.GetControllerForLocalClient( 0 )
		local f40_local14 = Engine.Localize( f40_local1[f40_local10].Name )
		local f40_local15 = function ( f41_arg0, f41_arg1 )
			f40_local3.lootTab = f40_local10
			if f40_local6 then
				CoD.DepotBaseSeenTabs[f40_local10] = 1
			end
			f40_arg0:PopulateList( f40_local1[f40_local10].Tag )
		end
		
		local f40_local16, f40_local17, f40_local18, f40_local19 = nil
		local f40_local20
		if CoD.DepotBaseSeenTabs[f40_local10] == 0 then
			local f40_local21 = f40_local6
			if f40_local4[f40_local10] == nil and (f40_local10 <= 1 or f40_local5[f40_local10 - 1] == nil) then
				f40_local20 = false
			else
				f40_local20 = f40_local21 and true
			end
			f40_local12( f40_local11, f40_local13, f40_local14, f40_local15, f40_local16, f40_local17, f40_local18, f40_local19, f40_local20 )
		end
		f40_local20 = false
	end
	local f40_local7 = -1
	if f40_arg0.loot_type ~= nil and f40_arg0.fromDepot ~= true then
		local f40_local8 = f40_arg0.loot_type == "character_camos"
		local f40_local9 = nil
		for f40_local10 = 1, #f40_local1, 1 do
			local f40_local14 = LUI.MPLootDropsBase.MenuInfo[f40_arg0.loot_type].GetList( f40_local1[f40_local10].Tag )
			local f40_local15 = #f40_local14
			for f40_local16 = 1, f40_local15, 1 do
				if f40_local8 then
					f40_local9 = tonumber( Engine.TableLookup( CharacterCamoTable.File, CharacterCamoTable.Cols.Guid, f40_local14[f40_local16].guid, CharacterCamoTable.Cols.Index ) )
				end
				if f40_arg0.equippedId then
					if f40_local8 then
						if f40_local9 ~= nil and f40_local9 == f40_arg0.equippedId then
							f40_local7 = f40_local10
						end
					elseif f40_local14[f40_local16].id == f40_arg0.equippedId then
						f40_local7 = f40_local10
					end
				end
				if f40_local7 ~= -1 then
					break
				end
			end
			if f40_local7 ~= -1 then
				
			end
		end
	end
	if f40_local7 == -1 then
		if f40_local3 then
			f40_local7 = f40_local3.lootTab or 1
		else
			f40_local7 = 1
		end
	end
	f40_local2:refreshTab( Engine.GetControllerForLocalClient( 0 ), f40_local7 )
	f40_arg0:addElement( f40_local2 )
	if not Engine.IsConsoleGame() and not Engine.IsGamepadEnabled() then
		f40_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_shoulderl",
			button_ref2 = "button_shoulderr",
			helper_text = Engine.Localize( "@LUA_MENU_CATEGORY" ),
			side = "right",
			clickable = false,
			priority = 2000,
			groupLRButtons = true
		} )
	end
end

LUI.MPDepotBase.OnLevel2Back = function ( f42_arg0, f42_arg1 )
	Cac.NotifyVirtualLobby( "depot_return", f42_arg1.controller )
	LUI.FlowManager.RequestLeaveMenu( f42_arg0 )
end

LUI.MPDepotBase.new = function ( f43_arg0, f43_arg1, f43_arg2 )
	local f43_local0 = f43_arg1 or {}
	f43_local0.noHeader = f43_local0.noHeader
	if f43_arg2 == 2 then
		f43_local0.persistentBackground = PersistentBackground.Variants.Default
		f43_local0.onBackFunc = LUI.MPDepotBase.OnLevel2Back
	end
	local f43_local1 = LUI.MenuTemplate.new( f43_arg0, f43_local0 )
	f43_local1:setClass( LUI.MPDepotBase )
	f43_local1:AddCurrencyInfoPanel()
	if f43_arg2 == 2 then
		f43_local1:SetBreadCrumb( Engine.Localize( "@DEPOT_DEPOT" ) )
		SetDepotState( f43_local1, {
			state = "pause"
		} )
	end
	f43_local1.backButton = f43_local1:AddBackButton( f43_local0.onBackFunc )
	f43_local1.backButton.menu = f43_local1
	if not f43_local0.noOptionsButton then
		f43_local1:AddOptionsButton()
	end
	return f43_local1
end

LockTable( _M )
