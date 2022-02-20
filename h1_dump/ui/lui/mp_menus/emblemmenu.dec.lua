local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 5
f0_local1 = 4
f0_local2 = f0_local0 * f0_local1
local f0_local3 = 85
local f0_local4 = 85
local f0_local5 = f0_local3 * f0_local0
local f0_local6 = f0_local4 * f0_local1
local f0_local7 = {
	r = 0.54,
	g = 0.54,
	b = 0.54
}
local f0_local8 = 405
local f0_local9 = 125
local f0_local10 = function ( f1_arg0 )
	table.sort( f1_arg0, function ( f2_arg0, f2_arg1 )
		if f2_arg0.lootData then
			local f2_local0 = f2_arg0.lootData.lootRarity
			local f2_local1 = RaritySortTable[f2_arg0.lootData.lootRarity.rarity]
		end
		local f2_local2 = f2_local0 and f2_local1 or -1
		if f2_arg1.lootData then
			local f2_local3 = f2_arg1.lootData.lootRarity
			local f2_local4 = RaritySortTable[f2_arg1.lootData.lootRarity.rarity]
		end
		return f2_local2 < (f2_local3 and f2_local4 or -1)
	end )
	return f1_arg0
end

function buildEmblemsData( f3_arg0, f3_arg1 )
	local f3_local0 = {}
	local f3_local1 = 0
	local f3_local2 = 1
	while Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, 0 ) ~= "" do
		local f3_local3 = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.IsDLC ) == "1"
		if not (f3_arg1 ~= true or f3_local3 ~= true) or f3_arg1 == nil and f3_local3 == false then
			local f3_local4 = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.Category )
			local f3_local5 = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.ContentPromo )
			local f3_local6 = tonumber( f3_local5 )
			if f3_local6 ~= nil and 0 < f3_local6 then
				f3_local4 = f3_local4 .. ":" .. f3_local5
			end
			local f3_local7 = {}
			local f3_local8 = true
			f3_local7.emblemIndex = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.ID )
			local f3_local9 = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.Image )
			f3_local7.name = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.Name )
			f3_local7.image = f3_local9
			f3_local7.challengeData = GetChallengeDataForCard( f3_arg0, f3_local9 )
			local f3_local10 = GetClanEntitlementDataForCard( f3_arg0, f3_local1 )
			f3_local7.clanEntitlementData = f3_local10
			if f3_local10.lockedByClanEntitlement and not Clan.IsEnabled() then
				f3_local8 = false
			end
			local f3_local11, f3_local12, f3_local13 = Cac.GetItemLockState( f3_arg0, nil, f3_local9, true )
			if Engine.Inventory_GetItemTypeByReference( f3_local9 ) == Cac.InventoryItemType.Entitlement then
				local f3_local14 = Engine.TableLookupByRow( EmblemIconTable.File, f3_local1, EmblemIconTable.Cols.Guid )
				if f3_local14 ~= "" then
					local f3_local15 = Engine.LookupStatsTableColumnForGUID( f3_local14, StatsTable.Cols.Ref )
					if not (f3_local15 == "" or not Engine.IsItemUnlocked( f3_arg0, f3_local15 )) or f3_local12 == Cac.ItemLockStatus.DlcRequired then
						f3_local7.challengeData = {}
						f3_local8 = true
					else
						f3_local8 = false
					end
				else
					f3_local8 = false
				end
			end
			f3_local7.unlockData = {
				lockState = f3_local11,
				lockStatus = f3_local12,
				unlockMessage = f3_local13,
				unlockRank = tonumber( Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f3_local9, UnlockTable.Cols.Rank ) ),
				unlockPrestigeLevel = tonumber( Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f3_local9, UnlockTable.Cols.PrestigeLevel ) ),
				unlockChallenge = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f3_local9, UnlockTable.Cols.Challenge )
			}
			if f3_local12 == Cac.ItemLockStatus.DlcRequired then
				f3_local7.unlockData.dlcRequirement = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f3_local9, UnlockTable.Cols.DlcLevel )
				f3_local7.unlockData.dlcEarlyAccess = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f3_local9, UnlockTable.Cols.DlcEarlyAccess ) == "1"
			end
			if f3_local8 == true then
				if f3_local0[f3_local4] == nil then
					f3_local0[f3_local4] = {}
				end
				f3_local7.lootData = LUI.InventoryUtils.GetLootDataForRef( "emblem", f3_local9 )
				table.insert( f3_local0[f3_local4], f3_local7 )
			end
			local f3_local14
			if f3_local7.clanEntitlementData.lockedByClanEntitlement or f3_local7.unlockData.lockState == "Locked" then
				f3_local14 = not Engine.GetDvarBool( "unlockAllItems" )
			else
				f3_local14 = false
			end
			f3_local7.locked = f3_local14
			if f3_local7.locked then
				f3_local7.displayStatus = "locked"
			else
				f3_local7.displayStatus = "visible"
			end
		end
		f3_local1 = f3_local1 + 1
	end
	local f3_local3 = nil
	if f3_arg1 == true then
		f3_local3 = "mp/emblemNavDLC.csv"
	else
		f3_local3 = "mp/emblemNav.csv"
	end
	f3_local0.emblemCategories = {}
	f3_local0.numEmblemTabs = Engine.TableGetRowCount( f3_local3 )
	local f3_local4 = 0
	while Engine.TableLookupByRow( f3_local3, f3_local4, 0 ) ~= "" do
		local f3_local5 = Engine.TableLookupByRow( f3_local3, f3_local4, 2 )
		local f3_local6 = Engine.TableLookupByRow( f3_local3, f3_local4, 3 )
		f3_local4 = f3_local4 + 1
		f3_local0.emblemCategories[f3_local4] = {
			name = Engine.Localize( f3_local5 ),
			category = f3_local6
		}
		f3_local0.emblemCategories[f3_local4] = {
			name = Engine.Localize( f3_local5 ),
			category = f3_local6
		}
		if f3_local0[f3_local0.emblemCategories[f3_local4].category] and f3_local0[f3_local0.emblemCategories[f3_local4].category][1] and f3_local0[f3_local0.emblemCategories[f3_local4].category][1].lootData then
			f0_local10( f3_local0[f3_local0.emblemCategories[f3_local4].category] )
		end
	end
	return f3_local0
end

function EmblemEquip( f4_arg0, f4_arg1, f4_arg2 )
	Cao.SetEmblemPatch( f4_arg1.controller, f4_arg0.data.emblemIndex or 0 )
	Cac.NotifyVirtualLobby( "reset_loadout", f4_arg1.controller )
	f4_arg2:processEvent( {
		name = "on_item_equipped"
	} )
	if not f4_arg2.fromDepot then
		LUI.FlowManager.RequestRestoreMenu( self, "PlayercardMenu", true, f4_arg1.controller, true )
	end
	f4_arg0.icon:animateToState( "visible" )
end

function Emblem( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7, f5_arg8 )
	local f5_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f5_local0.height = f5_arg3
	f5_local0.width = f5_arg2
	local self = LUI.UIButton.new( f5_local0 )
	self.gridIdx = f5_arg0
	self.id = "emblem_button_" .. f5_arg0
	self.properties = self.properties or {}
	self:makeFocusable()
	self.disabled = f5_arg1.unlockData.lockStatus ~= Cac.ItemLockStatus.Unlocked
	self.emblemIndex = f5_arg1.emblemIndex
	self.image = RegisterMaterial( f5_arg1.image )
	if self.disabled then
		local f5_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
		f5_local2.width = 20
		f5_local2.height = 20
		f5_local2.material = f5_arg6
		self:addElement( LUI.UIImage.new( f5_local2 ) )
	else
		local f5_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f5_local2.material = self.image
		self:addElement( LUI.UIImage.new( f5_local2 ) )
	end
	self.data = f5_arg1
	local f5_local2 = f5_arg8
	local f5_local3 = 7
	local f5_local4 = 16
	
	local icon = LUI.UIImage.new( {
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		width = f5_local4,
		height = f5_local4,
		top = f5_local3,
		right = -(f5_local3 - 1),
		material = f5_local2
	} )
	self:addElement( icon )
	self.icon = icon
	
	icon:registerAnimationState( "visible", {
		alpha = 1
	} )
	icon:registerAnimationState( "hidden", {
		alpha = 0
	} )
	icon:animateToState( "hidden" )
	if f5_arg4 then
		self:addElement( LUI.NewSticker.new( CoD.CreateState( nil, 16, 6, nil, CoD.AnchorTypes.TopRight ), LUI.NewSticker.WithText ) )
	end
	return self
end

function BuildGrid( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = f6_arg0.list
	if f6_arg0.grid then
		f6_local0 = f6_arg0.grid
	end
	if f6_local0 ~= nil and f6_local0.listPagerScrollIndicator ~= nil then
		f6_local0.listPagerScrollIndicator:close()
		f6_local0.listPagerScrollIndicator = nil
	end
	local f6_local1 = {}
	local f6_local2 = 10
	local f6_local3 = f6_local2
	local f6_local4 = f6_local2
	local f6_local5, f6_local6, f6_local7, f6_local8 = nil
	if f6_arg0.gridMask ~= nil then
		f6_local5, f6_local6, f6_local7, f6_local8 = f6_arg0.gridMask:getLocalRect()
	elseif f6_arg0.list then
		local f6_local9, f6_local10, f6_local11, f6_local12 = f6_arg0.list:getLocalRect()
		f6_local8 = f6_local12
		f6_local7 = f6_local11
		f6_local6 = f6_local10
		f6_local5 = f6_local9 - f6_local3
		f6_local6 = f6_local6 - f6_local4
	end
	f6_local1.iconHeight = f0_local3 * 0.75
	f6_local1.height = f0_local3
	f6_local1.width = f0_local4
	f6_local1.anchorType = CoD.AnchorTypes.TopLeft
	f6_local1.primaryFontHeight = f6_local1.height * 0.07
	f6_local1.primaryTextLeft = 14
	f6_local1.primaryTextRight = -10
	f6_local1.primaryTextTop = 5
	f6_local1.secondaryFontHeight = f6_local1.primaryFontHeight * 0.85
	f6_local1.secondaryTextRight = -10
	f6_local1.secondaryTextTop = f6_local1.primaryTextTop + f6_local1.primaryFontHeight + 2
	f6_local1.iconCentered = true
	f6_local1.gridProps = {
		elementsPerRow = f0_local1,
		rowHeight = f6_local1.height,
		rows = f0_local0,
		hSpacing = f6_local3,
		vSpacing = f6_local4,
		left = f6_local5,
		top = f6_local6
	}
	if f6_arg0.grid then
		f6_arg0.grid:closeTree()
		f6_arg0.grid:close()
		f6_arg0.gridMask:close()
		f6_arg0.grid = nil
		f6_arg0.list:closeTree()
		f6_arg0.list:close()
		f6_arg0.list.buttonCount = 0
	elseif f6_local0 then
		local f6_local9 = f6_local0:getParent()
		f6_local0.buttonCount = 0
		f6_local0:closeTree()
		if f6_local9 then
			f6_local9:addElement( f6_local0 )
			ListPaging.Reset( f6_local0 )
		end
		f6_local0.pagingData = nil
	else
		f6_arg0.list:closeTree()
		f6_arg0.list:close()
		f6_arg0.list.buttonCount = 0
		if f6_arg0.gridMask then
			f6_arg0.gridMask:close()
			f6_arg0.gridMask = nil
		end
	end
	run_gc()
	run_gc()
	local f6_local9 = Cao.GetEmblemPatch( f6_arg1 )
	local f6_local10 = {}
	local f6_local11 = RegisterMaterial( "white" )
	local f6_local12 = RegisterMaterial( "s1_icon_locked_full" )
	local f6_local13 = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	local f6_local14 = RegisterMaterial( "h1_ui_menu_icon_equipped" )
	local f6_local15 = f6_arg3[f6_arg2]
	if f6_local15 then
		for f6_local16 = 1, #f6_local15, 1 do
			local f6_local19 = f6_local16
			local f6_local20 = false
			if IsPublicMatch() then
				f6_local20 = LUI.InventoryUtils.GetItemNewStickerState( f6_arg1, f6_local15[f6_local19].image )
			end
			local f6_local21 = Emblem( f6_local19, f6_local15[f6_local19], f0_local4 * 0.75, f0_local3 * 0.75, f6_local20, f6_local11, f6_local12, f6_local13, f6_local14 )
			f6_local21.data = f6_local15[f6_local19]
			local f6_local22 = f6_local15[f6_local19].lootData
			if not f6_local22 then
				f6_local22 = f6_local15[f6_local19].locked == false
			end
			local f6_local23 = nil
			local f6_local24 = f6_local15[f6_local19].lootData
			if not f6_local24 then
				f6_local24 = f6_local15[f6_local19]
			end
			f6_local1.locked = nil
			f6_local1.iconLeftOffset = nil
			f6_local1.iconTopOffset = nil
			f6_local1.iconHeight = f0_local3 * 0.75
			f6_local1.iconName = nil
			f6_local1.customIcon = nil
			local f6_local25
			if f6_local22 then
				f6_local25 = function ( f7_arg0, f7_arg1 )
					LUI.MPDepotHelp.OnAction( f6_local21, f7_arg1, f6_arg0, f6_local15[f6_local19].lootData )
				end
				
				if not f6_local25 then
				
				else
					f6_local1.actionFunc = f6_local25
					f6_local1.primaryText = ""
					f6_local1.secondaryText = ""
					f6_local1.extraImagePadding = f6_local24.padding
					f6_local1.rarity = f6_local24.lootRarity
					f6_local1.equipped = f6_local9 == tonumber( f6_local21.data.emblemIndex )
					f6_local1.externalElement = f6_local21
					f6_local1.extraElems = {}
					f6_local25 = nil
					local f6_local26 = 0
					if f6_local24.lockState == nil and f6_local24.locked == true then
						f6_local1.locked = true
					elseif f6_local24.lockState == "Locked" then
						if not IsContentPromoUnlocked( f6_local24.contentPromo ) then
							f6_local1.locked = true
							f6_local1.iconName = "s1_icon_locked_full"
						elseif Cac.IsRewardType( f6_local24.inventoryItemType ) then
							f6_local1.iconName = "collection_reward_locked"
							f6_local1.locked = nil
						elseif Cac.IsCraftableType( f6_local24.inventoryItemType ) then
							f6_local25 = f6_local24.price
							if f6_local1.iconCentered then
								f6_local1.iconTopOffset = -20
								f6_local26 = 15
							else
								f6_local1.iconLeftOffset = -46
								f6_local1.iconTopOffset = 16
								local f6_local27 = 1000
								while f6_local27 - 1 < f6_local25 do
									f6_local1.iconLeftOffset = f6_local1.iconLeftOffset - 8
									f6_local27 = f6_local27 * 10
								end
							end
							f6_local1.iconHeight = 28
							f6_local1.iconName = GetCurrencyImage( InventoryCurrencyType.Parts )
							f6_local1.secondaryImage = nil
							f6_local1.locked = nil
						end
					end
					if f6_local1.iconName ~= nil then
						f6_local21:registerAnimationState( "scaledBack", {
							alpha = 0.15
						} )
						f6_local21:animateToState( "scaledBack" )
					end
					f6_local1.listDefaultFocus = f6_local1.equipped
					f6_local23 = LUI.CacBase.AddCacButton( f6_arg0, f6_local1 )
					if f6_local22 == false then
						f6_local23:clearActionSFX()
					end
					f6_local1.externalElement = nil
					if f6_local25 then
						LUI.MPDepotBase.AddInfoToButton( f6_arg0, f6_local23, f6_local25, true, f6_local1.iconCentered and 0 or -10, f6_local1.iconCentered and LUI.Alignment.Center or LUI.Alignment.Right, f6_local26 )
					end
					f6_local21.data.guid = f6_local24.guid
					f6_local21.id = "emblem_button_" .. f6_arg2 .. "_" .. f6_local19
					f6_local21:registerEventHandler( "button_over", function ( element, event )
						updateInfo( element, event, f6_arg0 )
					end )
					f6_local21:registerEventHandler( "button_over_disable", function ( element, event )
						updateInfo( element, event, f6_arg0 )
					end )
					f6_local21.category = f6_arg2
					local f6_local28
					if f6_local22 then
						f6_local28 = function ( f10_arg0, f10_arg1 )
							EmblemEquip( f10_arg0, f10_arg1, f6_arg0 )
						end
						
						if not f6_local28 then
						
						else
							f6_local21.passThruFunc = f6_local28
							f6_local10[f6_local19] = f6_local21.image
						end
					end
					f6_local28 = nil
				end
			end
			f6_local25 = nil
		end
		local f6_local16 = {
			containerWidth = f0_local6,
			containerHeight = 32
		}
		
		local scrollIndicatorParent = LUI.UIElement.new( {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			left = 116,
			top = -70.5,
			height = f6_local16.containerHeight
		} )
		f6_arg0:addElement( scrollIndicatorParent )
		f6_arg0.scrollIndicatorParent = scrollIndicatorParent
		
		ListPaging.InitGrid( f6_arg0.grid, f0_local0, nil, false, scrollIndicatorParent, f6_local16 )
		ListPaging.InitStreaming( f6_arg0.grid, f6_local10, StreamingCount )
		local f6_local18, f6_local19, f6_local20, f6_local21 = f6_arg0.gridMask:getLocalRect()
		if not f6_arg0.tabManager then
			f6_arg0:AddListDivider( nil, f6_local18 + f6_local1.gridProps.hSpacing, f6_local19 + f6_local1.gridProps.vSpacing, f6_local20 - f6_local1.gridProps.hSpacing, f6_local21 )
		end
		if not LUI.FlowManager.IsTopMenuModal() then
			f6_arg0.grid:processEvent( {
				name = "gain_focus",
				controller = f6_arg1
			} )
		else
			return mask
		end
		f6_local21.passThruFunc = f6_local28
		f6_local10[f6_local19] = f6_local21.image
	end
	return mask
end

function updateInfo( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg1.controller
	if f11_local0 == nil then
		local f11_local1 = LUI.FlowManager.GetMenuScopedDataFromElement( f11_arg2 )
		f11_local0 = f11_local1.exclusiveControllerIndex
	end
	f11_arg2.depotHelp:OnFocus( f11_local0, f11_arg0.data.lootData )
	f11_arg2.largeEmblem:setImage( f11_arg0.image )
	if f11_arg0.data.unlockData ~= nil and f11_arg0.data.unlockData.lockStatus ~= Cac.ItemLockStatus.Unlocked and (f11_arg0.data.unlockData.unlockChallenge == nil or f11_arg0.data.unlockData.unlockChallenge == "") then
		f11_arg2.itemDescriptionWidget:animateToState( "default" )
		f11_arg2.itemDescriptionWidget:Update( Engine.Localize( f11_arg0.data.name ), f11_arg0.data.unlockData.unlockMessage )
		f11_arg2.itemDescriptionWidget:ClearColor()
	elseif f11_arg0.data.unlockData.unlockChallenge and f11_arg0.data.unlockData.unlockChallenge ~= "" then
		local f11_local1, f11_local2 = ParseChallengeName( f11_arg0.data.unlockData.unlockChallenge )
		local f11_local3 = GetChallengeData( f11_local0, f11_local1, nil, nil, f11_local2 )
		if f11_local3 then
			f11_arg2.itemDescriptionWidget:animateToState( "default" )
			local f11_local4 = nil
			if f11_local3.prerequisite then
				f11_local4 = f11_local3.prerequisite
			else
				f11_local4 = GetChallengeNameWithTier( f11_local1, f11_local2 )
			end
			f11_arg2.itemDescriptionWidget:Update( Engine.Localize( f11_arg0.data.name ), f11_local4, nil, f11_local3 )
		end
		f11_arg2.itemDescriptionWidget:ClearColor()
	else
		f11_arg2.itemDescriptionWidget:Update( Engine.Localize( f11_arg0.data.name ), "", nil, nil, f11_arg0.data.guid )
		if f11_arg0.data.lootData and f11_arg0.data.lootData.lootRarity then
			f11_arg2.itemDescriptionWidget:ColorForPerks( f11_arg0.data.lootData.lootRarity.color )
		else
			f11_arg2.itemDescriptionWidget:ClearColor()
		end
	end
	if IsPublicMatch() then
		LUI.NewSticker.Update( f11_arg0 )
		local f11_local1 = "em_" .. f11_arg0.category
		LUI.InventoryUtils.SetNewStickerState( f11_local0, f11_arg0.data.image, "Emblem", f11_local1, false )
		if not LUI.InventoryUtils.GetSubCategoryNewStickerState( f11_local0, f11_local1 ) and f11_arg2.tabManager and f11_arg2.tabManager.tabsList ~= nil and f11_arg2.tabManager.tabSelected <= #f11_arg2.tabManager.tabsList then
			local f11_local3 = f11_arg2.tabManager.tabsList[f11_arg2.tabManager.tabSelected]
			if f11_local3 and f11_local3.tabHeader then
				LUI.NewSticker.Update( f11_local3.tabHeader )
			end
		end
	end
	if f11_arg0.disabled == true or f11_arg0.data.lootData and f11_arg0.data.lootData.lockState == "Locked" then
		f11_arg2.itemModelLockOverlay:show()
		if f11_arg0.data.lootData and IsContentPromoUnlocked( f11_arg0.data.lootData.contentPromo ) == false then
			f11_arg2.itemLockReasonLabel:animateToState( "default" )
		else
			f11_arg2.itemLockReasonLabel:animateToState( "hidden" )
		end
	else
		f11_arg2.itemLockReasonLabel:animateToState( "hidden" )
		f11_arg2.itemModelLockOverlay:hide()
	end
	f11_arg2.playerCard:feedContent( {
		emblem = f11_arg0.emblemIndex
	} )
end

function BuildEmblemAndPlayercard( menu, controller )
	local self = LUI.UIElement.new( {
		height = 150
	} )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 185,
		left = f0_local6 + 1400,
		spacing = 50
	} )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		width = 214,
		height = 214
	} )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "h1_emblem_deco_patch" )
	} ) )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		top = 47,
		width = 120,
		height = 120,
		material = RegisterMaterial( "white" )
	} )
	self:addElement( self )
	
	local itemModelLockOverlay = LUI.CacDetails.MakeLockOverlay( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ), 325, 0.9, {
		topAnchor = true,
		top = 37,
		width = 250
	}, {
		topAnchor = true,
		top = -15,
		width = 250
	}, true )
	self:addElement( itemModelLockOverlay )
	menu.itemModelLockOverlay = itemModelLockOverlay
	
	local itemLockReasonLabel = LUI.UIText.new( {
		color = Colors.white,
		height = 14,
		font = CoD.TextSettings.BodyFont.Font,
		bottom = -27,
		topAnchor = true,
		width = 250,
		alpha = 1
	} )
	itemLockReasonLabel:registerAnimationState( "hidden", {
		alpha = 0
	} )
	itemLockReasonLabel:setText( Engine.Localize( "@DEPOT_LOCKED_LIVE_EVENT_EXPIRED" ) )
	itemModelLockOverlay:addElement( itemLockReasonLabel )
	menu.itemLockReasonLabel = itemLockReasonLabel
	
	menu.largeEmblem = self
	self:addElement( self )
	local f12_local6 = CombatRecord.GetRankInfo( menu.exclusiveController )
	local f12_local7 = CombatRecord.GetRankInfo( menu.exclusiveController )
	local f12_local8 = {
		gamertag = CoD.FormatClanAndGamerTags( Engine.GetCustomClanTag( menu.exclusiveController ), Engine.GetUsernameByController( menu.exclusiveController ) ),
		clantag = Engine.GetProfileDataUseEliteClanTag( menu.exclusiveController ) and Clan.GetTag( menu.exclusiveController ) or Engine.GetCustomClanTag( menu.exclusiveController ),
		background = Cao.GetCallingCard( menu.exclusiveController ),
		xuid = Engine.GetXUIDByController( menu.exclusiveController ),
		emblem = Cao.GetEmblemPatch( menu.exclusiveController ),
		prestige = f12_local7.prestige,
		rank = f12_local7.rank
	}
	local self = LUI.UIElement.new( {
		topAnchor = true,
		height = 40
	} )
	local self = LUI.UIText.new( {
		color = Colors.white,
		height = 14,
		font = CoD.TextSettings.BodyFont.Font,
		alpha = 0.4,
		top = 63
	} )
	self:setText( Engine.Localize( "@LUA_MENU_PREVIEW" ) )
	self:addElement( self )
	self:addElement( self )
	local f12_local11 = LUI.Playercard.new( {
		scale = 0.5,
		top = 120,
		topAnchor = true
	}, f12_local8 )
	menu.playerCard = f12_local11
	self:addElement( f12_local11 )
	menu:addElement( self )
end

function EmblemMenu( f13_arg0, f13_arg1 )
	local f13_local0 = LUI.MenuTemplate.new( f13_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@MENU_EMBLEM_SELECTOR_EMBLEMS_TAB" ) ),
		menu_top_indent = 20
	} )
	f13_local0.fromDepot = f13_arg1.fromDepot
	if f13_local0.fromDepot then
		f13_local0:SetBreadCrumb( Engine.Localize( "@DEPOT_ARMORY" ) )
	else
		f13_local0:SetBreadCrumb( Engine.Localize( "@LUA_MENU_PERSONALIZATION_CAPS" ) )
	end
	f13_local0:registerEventHandler( "gain_focus", FocusGrid )
	f13_local0.controller = f13_arg1.exclusiveController
	f13_local0:addElement( LUI.MPDepotHelp.new( f13_local0, {
		actionAndCollectionHelpOnly = true
	} ) )
	local f13_local1 = buildEmblemsData( f13_local0.controller, f13_arg1.DLC )
	local self = LUI.UIElement.new( CoD.CreateState( 0, LUI.MenuTemplate.ListTop + 50, 0, 0, CoD.AnchorTypes.All ) )
	f13_local0:addElement( self )
	local f13_local3 = LUI.ItemDescriptionWidget.new( {
		topAnchor = true,
		leftAnchor = true,
		top = f0_local9,
		left = f0_local8
	}, 315 )
	f13_local3:registerAnimationState( "default", {
		alpha = 1
	} )
	f13_local3:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f13_local0.itemDescriptionWidget = f13_local3
	f13_local0:addElement( f13_local3 )
	BuildEmblemAndPlayercard( f13_local0, self )
	local f13_local4 = Cao.GetEmblemPatch( f13_local0.controller )
	local f13_local5 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.ID, f13_local4, EmblemIconTable.Cols.Category )
	local f13_local6 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.ID, f13_local4, EmblemIconTable.Cols.ContentPromo )
	if f13_local6 ~= nil and f13_local6 ~= "0" and f13_local6 ~= "" then
		f13_local5 = f13_local5 .. ":" .. f13_local6
	end
	local f13_local7 = LUI.FlowManager.GetMenuScopedDataFromElement( f13_local0 )
	f13_arg1.defaultTab = f13_local7.curCategory or f13_arg1.defaultTab
	local f13_local8 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			top = 10
		},
		numOfTabs = f13_local1.numEmblemTabs,
		vPadding = 20
	} )
	f13_local8:keepRightBumperAlignedToHeader( true )
	f13_local8.tabContentPane = self
	f13_local8.forceStringBasedTabWidth = true
	f13_local0.tabManager = f13_local8
	local f13_local9 = 0
	local f13_local10 = 1
	if f13_local0.fromDepot then
		f13_local10 = 2
	end
	for f13_local11 = f13_local10, f13_local1.numEmblemTabs, 1 do
		f13_local9 = f13_local9 + 1
		local f13_local14 = f13_local1.emblemCategories[f13_local11]
		local f13_local15 = false
		if IsPublicMatch() then
			f13_local15 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), "em_" .. f13_local14.category )
		end
		f13_local8:addTab( f13_local0.controller, f13_local14.name, function ( f14_arg0, f14_arg1 )
			local f14_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f13_local0 )
			f14_local0.curCategory = f13_local14.category
			return BuildGrid( f13_local0, f13_local0.controller, f13_local14.category, f13_local1 )
		end, nil, nil, nil, nil, f13_local15 )
		if f13_local0.fromDepot ~= true then
			if f13_arg1.defaultTab then
				if f13_arg1.defaultTab == f13_local14.category then
					f13_local8.tabSelected = f13_local9
				end
			elseif f13_local14.category == f13_local5 then
				f13_local8.tabSelected = f13_local9
			end
		else
			f13_local8.tabSelected = 1
		end
	end
	f13_local8:refreshTab( f13_local0.controller, f13_local0.tabManager.tabSelected )
	f13_local0:addElement( f13_local8 )
	f13_local0:AddBackButton()
	f13_local0:AddCurrencyInfoPanel()
	f13_local0:registerEventHandler( "on_crafted_item", function ( element, event )
		if event.success == true then
			f13_local1 = buildEmblemsData( f13_local0.controller, f13_arg1.DLC )
			f13_local0.tabManager:refreshTab( f13_local0.controller, f13_local0.tabManager.tabSelected )
			element:dispatchEventToChildren( event )
		end
	end )
	f13_local0:registerEventHandler( "on_item_equipped", function ( element, event )
		f13_local0.tabManager:refreshTab( f13_local0.controller, f13_local0.tabManager.tabSelected )
	end )
	return f13_local0
end

function EmblemMenuDLC( f17_arg0, f17_arg1 )
	f17_arg1.DLC = true
	return EmblemMenu( f17_arg0, f17_arg1 )
end

function EmblemMenuFromDepot( f18_arg0, f18_arg1 )
	f18_arg1.defaultTab = "LootDrop3"
	f18_arg1.fromDepot = true
	return EmblemMenuDLC( f18_arg0, f18_arg1 )
end

LUI.MenuBuilder.registerType( "EmblemMenu", EmblemMenu )
LUI.MenuBuilder.registerType( "EmblemMenuDLC", EmblemMenuDLC )
LUI.MenuBuilder.registerType( "EmblemMenuFromDepot", EmblemMenuFromDepot )
LockTable( _M )
