local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLootDropsBase = InheritFrom( LUI.MPDepotBase )
LUI.MPLootDropsBase.LootType = {
	"weapons",
	"weapon_kits",
	"weapon_camos",
	"reticles",
	"characters",
	"character_camos"
}
LUI.MPLootDropsBase.GetLootDropListFromString = function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = 1
	local f1_local2 = 0
	while true do
		f1_local2 = string.find( f1_arg0, "|", f1_local1 )
		if f1_local2 == nil then
			table.insert( f1_local0, string.sub( f1_arg0, f1_local1, string.len( f1_arg0 ) ) )
			return f1_local0
		end
		table.insert( f1_local0, string.sub( f1_arg0, f1_local1, f1_local2 - 1 ) )
		f1_local1 = f1_local2 + 1
	end
end

LUI.MPLootDropsBase.ParseDropAndPromoFromString = function ( f2_arg0 )
	local f2_local0 = string.find( f2_arg0, ":" )
	if f2_local0 ~= nil then
		return string.sub( f2_arg0, 1, f2_local0 - 1 ), string.sub( f2_arg0, f2_local0 + 1, f2_local0 + 2 )
	else
		return f2_arg0, 0
	end
end

LUI.MPLootDropsBase.IsLootDropInList = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = tonumber( f3_arg2 )
	for f3_local1 = 1, #f3_arg0, 1 do
		if f3_local0 > 0 then
			local f3_local4, f3_local5 = LUI.MPLootDropsBase.ParseDropAndPromoFromString( f3_arg0[f3_local1] )
			if f3_arg1 == f3_local4 and f3_arg2 == f3_local5 then
				return true
			end
		end
		if f3_arg1 == f3_arg0[f3_local1] then
			return true
		end
	end
	return false
end

LUI.MPLootDropsBase.GetGenericItemList = function ( f4_arg0, f4_arg1 )
	if not f4_arg1 then
		f4_arg1 = "LootDrop1"
	end
	local f4_local0 = {}
	local f4_local1 = LUI.MPLootDropsBase.GetLootDropListFromString( f4_arg1 )
	local f4_local2 = CollectionRewardsEnabled()
	local f4_local3 = Engine.TableGetRowCount( LootTable.File )
	for f4_local4 = 0, f4_local3 - 1, 1 do
		if LUI.MPLootDropsBase.IsLootDropInList( f4_local1, Engine.TableLookupByRow( LootTable.File, f4_local4, LootTable.Cols.Lootdrop ), Engine.TableLookupByRow( LootTable.File, f4_local4, LootTable.Cols.ContentPromo ) ) then
			local f4_local7 = Engine.TableLookupByRow( LootTable.File, f4_local4, LootTable.Cols.GUID )
			if f4_local7 ~= nil and f4_local7 ~= "" and (f4_arg0 == nil or Cac.GetItemType( f4_local7 ) == f4_arg0) then
				local f4_local8 = LUI.InventoryUtils.GetLootData( f4_local7 )
				if f4_local8 ~= nil and (f4_local2 or f4_local8.price > 0) then
					f4_local0[#f4_local0 + 1] = f4_local8
				end
			end
		end
	end
	Cac.SortLootByRarity( f4_local0 )
	return f4_local0
end

LUI.MPLootDropsBase.GetWeaponsList = function ( f5_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "weapon", f5_arg0 )
end

LUI.MPLootDropsBase.GetAttachmentKitsList = function ( f6_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "attachkit", f6_arg0 )
end

LUI.MPLootDropsBase.GetWeaponKitsList = function ( f7_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "furniturekit", f7_arg0 )
end

LUI.MPLootDropsBase.GetWeaponCamosList = function ( f8_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "weaponcamo", f8_arg0 )
end

LUI.MPLootDropsBase.GetReticlesList = function ( f9_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "reticle", f9_arg0 )
end

LUI.MPLootDropsBase.GetCharactersList = function ( f10_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "costume", f10_arg0 )
end

LUI.MPLootDropsBase.GetCharacterCamosList = function ( f11_arg0 )
	return LUI.MPLootDropsBase.GetGenericItemList( "charactercamo", f11_arg0 )
end

f0_local0 = 7
LUI.MPLootDropsBase.MenuInfo = {
	weapons = {
		title = "@DEPOT_WEAPONS",
		GetList = LUI.MPLootDropsBase.GetWeaponsList,
		rows = f0_local0,
		columns = 1,
		background = PersistentBackground.Variants.VirtualLobby
	},
	weapon_kits = {
		title = "@DEPOT_WEAPON_KITS",
		GetList = LUI.MPLootDropsBase.GetWeaponKitsList,
		rows = f0_local0,
		columns = 1,
		background = PersistentBackground.Variants.VirtualLobby
	},
	weapon_camos = {
		title = "@DEPOT_WEAPON_CAMOS",
		GetList = LUI.MPLootDropsBase.GetWeaponCamosList,
		rows = 4,
		columns = 3,
		descLeftOffset = 30,
		background = PersistentBackground.Variants.VirtualLobby
	},
	reticles = {
		title = "@DEPOT_RETICLES",
		GetList = LUI.MPLootDropsBase.GetReticlesList,
		rows = 4,
		columns = 3,
		descLeftOffset = 30,
		background = PersistentBackground.Variants.Default
	},
	characters = {
		title = "@DEPOT_CHARACTER_CAPS",
		GetList = LUI.MPLootDropsBase.GetCharactersList,
		rows = f0_local0,
		columns = 1,
		background = PersistentBackground.Variants.VirtualLobby
	},
	character_camos = {
		title = "@MENU_CAMO_CAPS",
		GetList = LUI.MPLootDropsBase.GetCharacterCamosList,
		rows = 4,
		columns = 3,
		descLeftOffset = 30,
		background = PersistentBackground.Variants.VirtualLobby
	}
}
LUI.MPLootDropsBase.OnButtonFocus = function ( f12_arg0, f12_arg1 )
	f12_arg0.menu.itemDescriptionWidget:animateToState( "show" )
	f12_arg0.menu.itemDescriptionWidget:Update( Engine.ToUpperCase( f12_arg0.info.name ), Engine.ToUpperCase( f12_arg0.info.category ), f12_arg0.info.loot_type and f12_arg0.info.desc or nil, nil, f12_arg0.info.guid )
	f12_arg0.menu.itemDescriptionWidget:ColorForPerks( f12_arg0.info.lootRarity.color )
	f12_arg0.menu.depotHelp:OnFocus( f12_arg0.menu.controller, f12_arg0.info )
	if f12_arg0.reticlePreviewIconName and f12_arg0.menu.reticlePreviewElement then
		f12_arg0.menu.reticlePreviewElement:show()
		f12_arg0.menu.reticlePreviewElement:registerAnimationState( "update", {
			material = f12_arg0.reticlePreviewIconName
		} )
		f12_arg0.menu.reticlePreviewElement:animateToState( "update" )
	elseif f12_arg0.menu.reticlePreviewElement then
		f12_arg0.menu.reticlePreviewElement:hide()
	end
	if f12_arg0.info.lockState == "Locked" then
		f12_arg0.menu.itemModelLockOverlay:show()
		if f12_arg0.info and IsContentPromoUnlocked( f12_arg0.info.contentPromo ) == false then
			f12_arg0.menu.itemLockReasonLabel:animateToState( "default" )
		else
			f12_arg0.menu.itemLockReasonLabel:animateToState( "hidden" )
		end
	else
		f12_arg0.menu.itemModelLockOverlay:hide()
		f12_arg0.menu.itemLockReasonLabel:animateToState( "hidden" )
	end
end

function CreateExtraImage( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f13_local0.height = f13_arg1
	f13_local0.width = f13_arg0
	local self = LUI.UIButton.new( f13_local0 )
	self.id = "extra_image"
	self.properties = self.properties or {}
	local f13_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f13_local2.material = f13_arg2
	
	local image = LUI.UIImage.new( f13_local2 )
	self:addElement( image )
	self.image = image
	
	return self
end

LUI.MPLootDropsBase.PopulateList = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg0.list.buttonCount > 0
	f14_arg0.lootDropCategory = f14_arg1
	local f14_local1 = f14_arg0.list
	if f14_arg0.grid then
		f14_local1 = f14_arg0.grid
	end
	if not f14_arg0.tabManager then
		f14_arg0:AddListDivider()
	end
	if f14_local1.listPagerScrollIndicator ~= nil then
		f14_local1.listPagerScrollIndicator:close()
		f14_local1.listPagerScrollIndicator = nil
	end
	local f14_local2 = LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].GetList( f14_arg1 )
	local f14_local3 = {}
	local f14_local4 = f14_arg0.loot_type == "character_camos"
	local f14_local5 = f14_arg0.loot_type == "reticles"
	if LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].columns > 1 then
		local f14_local6 = LUI.MenuTemplate.ButtonStyle.border_padding
		local f14_local7 = LUI.MenuTemplate.ButtonStyle.border_padding
		local f14_local8, f14_local9, f14_local10, f14_local11 = nil
		if f14_arg0.gridMask ~= nil then
			f14_local8, f14_local9, f14_local10, f14_local11 = f14_arg0.gridMask:getLocalRect()
		else
			local f14_local12, f14_local13, f14_local14, f14_local15 = f14_arg0.list:getLocalRect()
			f14_local11 = f14_local15
			f14_local10 = f14_local14
			f14_local9 = f14_local13
			f14_local8 = f14_local12 - f14_local6
			f14_local9 = f14_local9 - f14_local7
		end
		f14_local3.iconHeight = 56
		f14_local3.height = f14_local3.iconHeight * 2
		f14_local3.width = f14_local3.height
		f14_local3.anchorType = CoD.AnchorTypes.TopLeft
		f14_local3.primaryFontHeight = 12
		f14_local3.primaryTextLeft = 12
		f14_local3.primaryTextRight = -10
		f14_local3.primaryTextTop = 5
		f14_local3.secondaryFontHeight = 9
		f14_local3.secondaryTextRight = -10
		f14_local3.secondaryTextTop = f14_local3.primaryTextTop + f14_local3.primaryFontHeight + 2
		f14_local3.iconCentered = true
		f14_local3.gridProps = {
			elementsPerRow = LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].columns,
			rowHeight = f14_local3.height,
			rows = LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].rows,
			hSpacing = f14_local6,
			vSpacing = f14_local7,
			left = f14_local8,
			top = f14_local9
		}
		f14_local3.extraElemsFuncs = {
			category = function ( f15_arg0 )
				local self = LUI.UIText.new( {
					leftAnchor = true,
					topAnchor = false,
					rightAnchor = false,
					bottomAnchor = true,
					left = f14_local3.primaryTextLeft + 2,
					bottom = -f14_local3.primaryTextTop - 5,
					height = f14_local3.secondaryFontHeight,
					width = f14_local3.width - f14_local3.primaryTextLeft + 2,
					font = LUI.CacButton.SecondaryFont.Font,
					useTextWrapping = true,
					alignment = LUI.Alignment.Left,
					alpha = 0.3
				} )
				self:setText( f15_arg0.category )
				return self
			end
		}
	end
	if f14_arg0.grid then
		f14_arg0.grid:closeTree()
		f14_arg0.grid:close()
		f14_arg0.gridMask:close()
		f14_arg0.grid = nil
		f14_arg0.list:closeTree()
		f14_arg0.list:close()
		f14_arg0.list.buttonCount = 0
	elseif f14_local1 then
		local f14_local6 = f14_local1:getParent()
		f14_local1.buttonCount = 0
		f14_local1:closeTree()
		if f14_local6 then
			f14_local6:addElement( f14_local1 )
			ListPaging.Reset( f14_local1 )
		end
		f14_local1.pagingData = nil
	end
	run_gc()
	run_gc()
	local f14_local6 = f14_arg0.itemDescriptionWidget
	f14_local6:registerAnimationState( "hide", {
		alpha = 0
	} )
	f14_local6:registerAnimationState( "show", {
		alpha = 1
	} )
	local f14_local7 = f14_arg0.depotHelp
	local f14_local8 = f14_arg0
	if f14_arg0.loot_type == "characters" and f14_arg0.isPersonalizeCharacter then
		table.insert( f14_local2, 1, {
			name = Engine.Localize( "@LUA_MENU_DEFAULT" ),
			lootRarity = RarityInfo[Cac.InventoryItemRarity.Common],
			padding = 0,
			image = RegisterMaterial( "weapon_missing_image" ),
			lockState = "Unlocked",
			inventoryItemType = Cac.InventoryItemType.Loot,
			category = Engine.Localize( "@DEPOT_CHARACTER_CAPS" ),
			id = 1,
			guid = "0x6300001",
			price = 0,
			loot_type = "costume",
			useDepotHelpAction = true
		} )
	elseif f14_arg0.loot_type == "character_camos" and f14_arg0.isPersonalizeCamo then
		table.insert( f14_local2, 1, {
			name = Engine.Localize( "@LUA_MENU_DEFAULT" ),
			lootRarity = RarityInfo[Cac.InventoryItemRarity.Common],
			padding = 0,
			image = RegisterMaterial( "weapon_missing_image" ),
			lockState = "Unlocked",
			inventoryItemType = Cac.InventoryItemType.Loot,
			category = Engine.Localize( "@DEPOT_CHARACTER_CAMOS" ),
			id = "none",
			guid = "0x100D0C0",
			externalRef = "none",
			price = 0,
			loot_type = "charactercamo",
			useDepotHelpAction = true
		} )
	end
	local f14_local9 = #f14_local2
	local f14_local10 = {}
	local f14_local11 = {}
	for f14_local12 = 1, f14_local9, 1 do
		local f14_local15 = f14_local12
		local f14_local16 = nil
		f14_local3.iconLeftOffset = nil
		f14_local3.iconTopOffset = nil
		f14_local3.iconHeight = 56
		f14_local3.iconName = nil
		f14_local3.customIcon = nil
		f14_local3.locked = nil
		f14_local3.primaryText = f14_local2[f14_local15].name
		f14_local3.newMode = f14_local2[f14_local15].new
		f14_local3.extraImagePadding = f14_local2[f14_local15].padding
		f14_local3.rarity = f14_local2[f14_local15].lootRarity
		f14_local3.equipped = false
		f14_local3.secondaryText = ""
		f14_local3.extraElems = {}
		f14_local10[f14_local15] = f14_local2[f14_local15].image
		if not f14_local3.gridProps then
			f14_local3.secondaryText = f14_local2[f14_local15].category
			f14_local3.iconName = f14_local2[f14_local15].image
		else
			f14_local16 = CreateExtraImage( f14_local3.iconHeight, f14_local3.iconHeight, f14_local2[f14_local15].image )
		end
		local f14_local17 = nil
		local f14_local18 = 0
		if f14_local2[f14_local15].lockState == "Locked" then
			if not IsContentPromoUnlocked( f14_local2[f14_local15].contentPromo ) then
				f14_local3.locked = true
				f14_local3.iconName = "s1_icon_locked_full"
			else
				if Cac.IsRewardType( f14_local2[f14_local15].inventoryItemType ) then
					if Cac.LootDropRewardImages[f14_local2[f14_local15].guid] and Cac.LootDropRewardImages[f14_local2[f14_local15].guid].complete and f14_local2[f14_local15].isOwned == true then
						f14_local3.iconName = Cac.LootDropRewardImages[f14_local2[f14_local15].guid].complete
					else
						f14_local3.iconName = "collection_reward_locked"
					end
				else
					f14_local17 = f14_local2[f14_local15].price
					if f14_local3.iconCentered then
						f14_local3.iconTopOffset = -20
						f14_local18 = 15
					else
						f14_local3.iconLeftOffset = -48
						f14_local3.iconTopOffset = 16
						local f14_local19 = 1000
						while f14_local19 - 1 < f14_local17 do
							f14_local3.iconLeftOffset = f14_local3.iconLeftOffset - 8
							f14_local19 = f14_local19 * 10
						end
					end
					f14_local3.iconHeight = 28
					f14_local3.iconName = GetCurrencyImage( InventoryCurrencyType.Parts )
				end
				if f14_local16 ~= nil then
					if f14_local5 then
						f14_local16.image:registerAnimationState( "scaledBack", {
							color = {
								r = 0.25,
								g = 0.25,
								b = 0.25
							}
						} )
						f14_local16.image:animateToState( "scaledBack" )
					else
						f14_local16:registerAnimationState( "scaledBack", {
							alpha = 0.15
						} )
						f14_local16:animateToState( "scaledBack" )
					end
				end
			end
		end
		f14_local3.actionFunc = function ( f16_arg0, f16_arg1 )
			LUI.MPDepotHelp.OnAction( f16_arg0, f16_arg1, f14_arg0, f14_local2[f14_local15] )
		end
		
		if f14_local3.extraElemsFuncs then
			for f14_local22, f14_local23 in pairs( f14_local3.extraElemsFuncs ) do
				f14_local3.extraElems[#f14_local3.extraElems + 1] = f14_local23( {
					category = f14_local2[f14_local15].category
				} )
			end
		end
		local f14_local20 = nil
		if f14_local4 then
			f14_local20 = tonumber( Engine.TableLookup( CharacterCamoTable.File, CharacterCamoTable.Cols.Guid, f14_local2[f14_local15].guid, CharacterCamoTable.Cols.Index ) )
			f14_local11[f14_local15] = f14_local20
		end
		if f14_arg0.equippedId then
			if f14_local4 then
				if f14_local20 ~= nil then
					f14_local3.listDefaultFocus = f14_local20 == f14_arg0.equippedId
				end
			else
				f14_local3.listDefaultFocus = f14_local2[f14_local15].id == f14_arg0.equippedId
			end
			f14_local3.equipped = f14_local3.listDefaultFocus
		end
		f14_local3.externalElement = f14_local16
		local f14_local19 = LUI.CacBase.AddCacButton( f14_arg0, f14_local3 )
		f14_local3.externalElement = nil
		f14_local19:rename( f14_arg0.loot_type .. f14_arg1 .. f14_local15 )
		f14_local19:addEventHandler( "button_over", LUI.MPLootDropsBase.OnButtonFocus )
		f14_local19:addEventHandler( "button_over_disable", LUI.MPLootDropsBase.OnButtonFocus )
		f14_local19.info = f14_local2[f14_local15]
		if f14_local2[f14_local15].loot_type == "reticle" then
			f14_local19.reticlePreviewIconName = f14_local2[f14_local15].image
		end
		if f14_local17 then
			f14_arg0:AddInfoToButton( f14_local19, f14_local17, true, nil, f14_local3.iconCentered and LUI.Alignment.Center or LUI.Alignment.Right, f14_local18 )
		end
	end
	if f14_arg0.grid then
		local f14_local12, f14_local13, f14_local14, f14_local15 = f14_arg0.gridMask:getLocalRect()
		ListPaging.InitGrid( f14_arg0.grid, LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].rows, 10, false, f14_arg0, {
			enabled = LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].rows < f14_arg0.list:getNumChildren(),
			scrollState = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				top = f14_local15,
				left = f14_local12 + (f14_local14 - f14_local12) / 2 - LUI.UIScrollIndicator.DefaultWidth / 2 - LUI.UIScrollIndicator.GetMaxTextWidth( f14_arg0.list.buttonCount, LUI.UIScrollIndicator.DefaultFont ) / 2 + LUI.UIScrollIndicator.DefaultHeight / 2,
				width = f14_local14 - f14_local12,
				height = LUI.UIScrollIndicator.DefaultHeight
			}
		}, nil )
		ListPaging.InitStreaming( f14_arg0.grid, f14_local10, StreamingCount )
		if not LUI.FlowManager.IsTopMenuModal() then
			f14_arg0.grid:processEvent( {
				name = "gain_focus",
				controller = f14_arg0.controller
			} )
		end
		if not f14_arg0.tabManager then
			f14_arg0:AddListDivider( nil, f14_local12 + f14_local3.gridProps.hSpacing, f14_local13 + f14_local3.gridProps.vSpacing, f14_local14 - f14_local3.gridProps.hSpacing, f14_local15 )
		end
	elseif f14_arg0.list.buttonCount > 0 then
		ListPaging.InitList( f14_arg0.list, LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].rows, 10, false, false, {
			enabled = LUI.MPLootDropsBase.MenuInfo[f14_arg0.loot_type].rows < f14_arg0.list:getNumChildren(),
			center = true
		}, nil, true )
		ListPaging.InitStreaming( f14_arg0.list, f14_local10, StreamingCount )
		if not LUI.FlowManager.IsTopMenuModal() then
			f14_arg0.list:processEvent( {
				name = "gain_focus",
				controller = f14_arg0.controller
			} )
		end
		f14_arg0:CreateBottomDivider()
		f14_arg0:AddBottomDividerToList()
	elseif f14_arg0.itemDescriptionWidget then
		f14_arg0.itemDescriptionWidget:hide()
	end
	if f14_local4 then
		f14_arg0:registerEventHandler( "on_faction_changed", function ( element, event )
			Engine.CacheCharacterCamos( Engine.TableLookupByRow( Cac.FactionsCSV.File, event.faction, Cac.FactionsCSV.Cols.Team ), Engine.TableLookupByRow( Cac.FactionsCSV.File, event.faction, Cac.FactionsCSV.Cols.Environment ), f14_local11 )
		end )
		if f14_arg0.depotHelp ~= nil and f14_arg0.depotHelp.factionWidget ~= nil then
			f14_arg0:dispatchEventToRoot( {
				name = "on_faction_changed",
				faction = f14_arg0.depotHelp.factionWidget.currentFaction
			} )
		end
	end
end

LUI.MPLootDropsBase.new = function ( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg1 or {}
	Cac.SetSelectedControllerIndex( f18_arg1.exclusiveController )
	f18_local0.persistentBackground = LUI.MPLootDropsBase.MenuInfo[f18_arg1.loot_type].background
	f18_local0.menu_title = LUI.MPLootDropsBase.MenuInfo[f18_arg1.loot_type].title
	f18_local0.menu_width = CoD.DesignGridHelper( LUI.MPLootDropsBase.MenuInfo[f18_arg1.loot_type].rows, 1 )
	f18_local0.menu_top_indent = 20
	local f18_local1 = LUI.MPDepotBase.new( f18_arg0, f18_arg1 )
	f18_local1.fromDepot = f18_arg1.fromDepot
	f18_local1.isPersonalizeCharacter = f18_arg1.isPersonalizeCharacter
	f18_local1.isPersonalizeCamo = f18_arg1.isPersonalizeCamo
	f18_local1:setClass( LUI.MPLootDropsBase )
	f18_local1.controller = f18_arg1.exclusiveController
	f18_local1.equippedId = f18_arg1.equippedId
	if f18_local1.equippedId == nil then
		if f18_arg1.loot_type == "characters" then
			f18_local1.equippedId = Engine.GetPlayerData( f18_arg1.exclusiveController, CoD.StatsGroup.Common, "globalCostume", Cao.Types.Head )
		elseif f18_arg1.loot_type == "character_camos" then
			f18_local1.equippedId = Engine.GetPlayerData( f18_arg1.exclusiveController, CoD.StatsGroup.Common, "characterCamoIndex" )
		end
	end
	local depotHelp = LUI.MPDepotHelp.new( f18_local1, {
		clearWeapon = true
	} )
	f18_local1:addElement( depotHelp )
	f18_local1.depotHelp = depotHelp
	
	f18_local1:SetBreadCrumb( Engine.Localize( "@DEPOT_ARMORY" ) )
	local f18_local3 = LUI.MPLootDropsBase.MenuInfo[f18_arg1.loot_type].descLeftOffset or 0
	if f18_arg1.loot_type == "reticles" then
		local f18_local4 = CoD.CreateState( -247, -185, nil, nil, CoD.AnchorTypes.None )
		f18_local4.width = 788.14
		f18_local4.height = 420
		f18_local4.material = RegisterMaterial( "h1_reticles_previewscene" )
		f18_local1:addElement( LUI.UIImage.new( f18_local4 ) )
		local itemLockReasonLabel = CoD.CreateState( 147, -62, nil, nil, CoD.AnchorTypes.None )
		itemLockReasonLabel.width = 60
		itemLockReasonLabel.height = 60
		local reticlePreviewElement = LUI.UIImage.new( itemLockReasonLabel )
		f18_local1:addElement( reticlePreviewElement )
		f18_local1.reticlePreviewElement = reticlePreviewElement
		
		f18_local1.reticlePreviewElement:hide()
	end
	local itemModelLockOverlay = LUI.CacDetails.MakeLockOverlay( CoD.CreateState( 530, 122, 970, 562, CoD.AnchorTypes.TopLeft ) )
	f18_local1:addElement( itemModelLockOverlay )
	f18_local1.itemModelLockOverlay = itemModelLockOverlay
	
	local itemLockReasonLabel = LUI.UIText.new( {
		color = Colors.white,
		alignment = LUI.Alignment.Center,
		height = 14,
		font = CoD.TextSettings.BodyFont.Font,
		alpha = 0.4,
		top = 165,
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		alpha = 1
	} )
	itemLockReasonLabel:registerAnimationState( "hidden", {
		alpha = 0
	} )
	itemLockReasonLabel:setText( Engine.Localize( "@DEPOT_LOCKED_LIVE_EVENT_EXPIRED" ) )
	itemModelLockOverlay:addElement( itemLockReasonLabel )
	f18_local1.itemLockReasonLabel = itemLockReasonLabel
	
	local reticlePreviewElement = LUI.ItemDescriptionWidget.new( {
		topAnchor = true,
		leftAnchor = true,
		top = LUI.CacDetails.TitleBoxTop,
		left = LUI.CacDetails.TitleBoxLeft + f18_local3,
		collectionWidgetTop = 60
	} )
	reticlePreviewElement.subText:registerAnimationState( "changeColor", {
		color = Colors.h1.light_grey
	} )
	reticlePreviewElement.subText:animateToState( "changeColor" )
	f18_local1.itemDescriptionWidget = reticlePreviewElement
	f18_local1:addElement( reticlePreviewElement )
	f18_local1.loot_type = f18_arg1.loot_type
	f18_local1:AddLootDropTabSelector()
	f18_local1:registerEventHandler( "on_crafted_item", function ( element, event )
		if event.success == true then
			f18_local1.tabManager:refreshTab( f18_local1.controller, f18_local1.tabManager.tabSelected )
			element:dispatchEventToChildren( event )
		end
	end )
	f18_local1:registerEventHandler( "on_item_equipped", function ( element, event )
		if f18_local1.equippedId ~= nil then
			if f18_arg1.loot_type == "characters" then
				f18_local1.equippedId = Engine.GetPlayerData( f18_arg1.exclusiveController, CoD.StatsGroup.Common, "globalCostume", Cao.Types.Head )
			elseif f18_arg1.loot_type == "character_camos" then
				f18_local1.equippedId = Engine.GetPlayerData( f18_arg1.exclusiveController, CoD.StatsGroup.Common, "characterCamoIndex" )
			end
		end
		f18_local1.tabManager:refreshTab( f18_local1.controller, f18_local1.tabManager.tabSelected )
	end )
	return f18_local1
end

LUI.MPLootDropsBase.PersonalizeCamo = function ( f21_arg0, f21_arg1 )
	f21_arg1.menu_name = "MPLootDropsBase"
	f21_arg1.loot_type = "character_camos"
	f21_arg1.leaveAfterEquip = true
	f21_arg1.isPersonalizeCamo = true
	f21_arg1.equippedId = Engine.GetPlayerData( f21_arg1.exclusiveController, CoD.StatsGroup.Common, "characterCamoIndex" )
	local f21_local0 = LUI.MPLootDropsBase.new( f21_arg0, f21_arg1 )
	f21_local0:SetBreadCrumb( Engine.Localize( "@LUA_MENU_PERSONALIZATION_CAPS" ) )
	return f21_local0
end

LUI.MPLootDropsBase.PersonalizeCharacter = function ( f22_arg0, f22_arg1 )
	f22_arg1.menu_name = "MPLootDropsBase"
	f22_arg1.loot_type = "characters"
	f22_arg1.leaveAfterEquip = true
	f22_arg1.isPersonalizeCharacter = true
	f22_arg1.equippedId = Engine.GetPlayerData( f22_arg1.exclusiveController, CoD.StatsGroup.Common, "globalCostume", Cao.Types.Head )
	local f22_local0 = LUI.MPLootDropsBase.new( f22_arg0, f22_arg1 )
	f22_local0:SetBreadCrumb( Engine.Localize( "@LUA_MENU_PERSONALIZATION_CAPS" ) )
	return f22_local0
end

LUI.MenuBuilder.registerType( "MPLootDropsBase", LUI.MPLootDropsBase.new )
LUI.FlowManager.RegisterStackPushBehaviour( "MPLootDropsBase", PersistentBackground.FadeFromBlackSlow )
LUI.MenuBuilder.registerType( "PersonalizeCamo", LUI.MPLootDropsBase.PersonalizeCamo )
LUI.MenuBuilder.registerType( "PersonalizeCharacter", LUI.MPLootDropsBase.PersonalizeCharacter )
VLobby.InitMenuMode( "PersonalizeCharacter", VirtualLobbyModes.LUI_MODE_CAO_CHARACTER )
VLobby.InitMenuMode( "PersonalizeCamo", VirtualLobbyModes.LUI_MODE_CAO_CAMOUFLAGE )
LockTable( _M )
