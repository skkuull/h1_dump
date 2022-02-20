local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 6
f0_local1 = 3
f0_local2 = f0_local0 * f0_local1
local f0_local3 = 65
local f0_local4 = 231.11
local f0_local5 = f0_local3 * f0_local0
local f0_local6 = f0_local4 * f0_local1
local f0_local7 = {
	r = 0.54,
	g = 0.54,
	b = 0.54
}
local f0_local8 = 50
local f0_local9 = 65
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

function buildCallingCardsData( f3_arg0, f3_arg1 )
	local f3_local0 = {}
	local f3_local1 = 0
	local f3_local2 = 1
	while Engine.TableLookupByRow( CallingCardTable.File, f3_local1, 0 ) ~= "" do
		local f3_local3 = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.IsDLC ) == "1"
		if not (f3_arg1 ~= true or f3_local3 ~= true) or f3_arg1 == nil and f3_local3 == false then
			local f3_local4 = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.Category )
			local f3_local5 = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.ContentPromo )
			local f3_local6 = tonumber( f3_local5 )
			if f3_local6 ~= nil and 0 < f3_local6 then
				f3_local4 = f3_local4 .. ":" .. f3_local5
			end
			local f3_local7 = {}
			local f3_local8 = true
			f3_local7.cardIndex = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.Ref )
			local f3_local9 = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.Image )
			f3_local7.image = f3_local9
			f3_local7.name = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.Name )
			f3_local7.animatedTable = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.AnimatedTable )
			f3_local7.challengeData = GetChallengeDataForCard( f3_arg0, f3_local9 )
			local f3_local10 = GetClanEntitlementDataForCard( f3_arg0, f3_local1 )
			f3_local7.clanEntitlementData = f3_local10
			if f3_local10.lockedByClanEntitlement and not Clan.IsEnabled() then
				f3_local8 = false
			end
			local f3_local11, f3_local12, f3_local13 = Cac.GetItemLockState( f3_arg0, nil, f3_local9, true )
			if Engine.Inventory_GetItemTypeByReference( f3_local9 ) == Cac.InventoryItemType.Entitlement then
				local f3_local14 = Engine.TableLookupByRow( CallingCardTable.File, f3_local1, CallingCardTable.Cols.Guid )
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
				f3_local7.lootData = LUI.InventoryUtils.GetLootDataForRef( "callingcard", f3_local9 )
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
		f3_local3 = "mp/callingCardNavDLC.csv"
	else
		f3_local3 = "mp/callingCardNav.csv"
	end
	f3_local0.callingCardCategories = {}
	f3_local0.numCallingCardTabs = Engine.TableGetRowCount( f3_local3 )
	local f3_local4 = 0
	while Engine.TableLookupByRow( f3_local3, f3_local4, 0 ) ~= "" do
		local f3_local5 = Engine.TableLookupByRow( f3_local3, f3_local4, 2 )
		local f3_local6 = Engine.TableLookupByRow( f3_local3, f3_local4, 3 )
		f3_local4 = f3_local4 + 1
		f3_local0.callingCardCategories[f3_local4] = {
			name = Engine.Localize( f3_local5 ),
			category = f3_local6
		}
		if f3_local0[f3_local0.callingCardCategories[f3_local4].category] and f3_local0[f3_local0.callingCardCategories[f3_local4].category][1] and f3_local0[f3_local0.callingCardCategories[f3_local4].category][1].lootData then
			f0_local10( f3_local0[f3_local0.callingCardCategories[f3_local4].category] )
		end
	end
	return f3_local0
end

function CallingCardEquip( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = f4_arg0.data.cardIndex or 0
	f4_arg0.icon:animateToState( "visible" )
	Cao.SetCallingCard( f4_arg1.controller, f4_local0 )
	f4_arg2:processEvent( {
		name = "on_item_equipped"
	} )
	if not f4_arg2.fromDepot then
		LUI.FlowManager.RequestRestoreMenu( self, "PlayercardMenu", true, f4_arg1.controller, true )
	end
end

function addLockedState( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local0.material = f5_arg1
	f5_local0.color = f0_local7
	f5_local0.alpha = 0.25
	local self = LUI.UIImage.new( f5_local0 )
	f5_arg0:addElement( LUI.UIBorder.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = f5_arg1,
		color = f0_local7,
		borderThickness = 1
	} ) )
	self:registerAnimationState( "upState", {
		alpha = 0.25
	} )
	self:registerAnimationState( "overState", {
		alpha = 0.45
	} )
	self:registerEventHandler( "button_over_disable", function ( element, event )
		element:animateToState( "overState" )
	end )
	self:registerEventHandler( "button_disable", function ( element, event )
		element:animateToState( "upState" )
	end )
	f5_arg0:addElement( self )
	local f5_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f5_local2.width = 20
	f5_local2.height = 20
	f5_local2.material = f5_arg2
	f5_arg0:addElement( LUI.UIImage.new( f5_local2 ) )
	f5_arg0.spinner:animateToState( "hidden" )
end

function CallingCard( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7, f8_arg8 )
	local f8_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f8_local0.height = f8_arg3
	f8_local0.width = f8_arg2
	local self = LUI.UIButton.new( f8_local0 )
	self.gridIdx = f8_arg0
	self.properties = self.properties or {}
	self:makeFocusable()
	self.disabled = f8_arg1.unlockData.lockStatus ~= Cac.ItemLockStatus.Unlocked
	self.image = RegisterMaterial( f8_arg1.image )
	local f8_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f8_local2.width = f8_arg3
	f8_local2.height = f8_arg3
	f8_local2.material = RegisterMaterial( "h1_ui_loader_emblem" )
	f8_local2.alpha = 1
	
	local spinner = LUI.UIImage.new( f8_local2 )
	self:addElement( spinner )
	self.spinner = spinner
	
	spinner:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local f8_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	if f8_arg1.animatedTable == nil or f8_arg1.animatedTable == "" then
		if self.disabled then
			addLockedState( self, f8_arg5, f8_arg6 )
		else
			local f8_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
			f8_local5.material = self.image
			self:addElement( LUI.UIImage.new( f8_local5 ) )
		end
	else
		local f8_local5 = LUI.Playercard.CreateAnimatedCallingCard( f8_arg1.animatedTable, f8_arg3 )
		if f8_local5 and not self.disabled then
			self:addElement( f8_local5 )
		else
			addLockedState( self, f8_arg5, f8_arg6 )
		end
	end
	self.data = f8_arg1
	local f8_local5 = f8_arg8
	local f8_local6 = 7
	local f8_local7 = 16
	
	local icon = LUI.UIImage.new( {
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		width = f8_local7,
		height = f8_local7,
		top = f8_local6,
		right = -(f8_local6 - 1),
		material = f8_local5
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
	if f8_arg4 then
		self:addElement( LUI.NewSticker.new( CoD.CreateState( nil, 8, 4, nil, CoD.AnchorTypes.TopRight ), LUI.NewSticker.WithText ) )
	end
	local f8_local9 = CoD.CreateState( -2, -2, 2, 2, CoD.AnchorTypes.All )
	f8_local9.material = RegisterMaterial( "black" )
	f8_local9.alpha = 0
	
	local fader = LUI.UIImage.new( f8_local9 )
	self:addElement( fader )
	self.fader = fader
	
	self:setUseStencil( true )
	return self
end

function BuildGrid( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = f9_arg0.list
	if f9_arg0.grid then
		f9_local0 = f9_arg0.grid
	end
	if f9_local0 ~= nil and f9_local0.listPagerScrollIndicator ~= nil then
		f9_local0.listPagerScrollIndicator:close()
		f9_local0.listPagerScrollIndicator = nil
	end
	local f9_local1 = {}
	local f9_local2 = 10
	local f9_local3 = f9_local2
	local f9_local4 = f9_local2
	local f9_local5, f9_local6, f9_local7, f9_local8 = nil
	if f9_arg0.gridMask ~= nil then
		f9_local5, f9_local6, f9_local7, f9_local8 = f9_arg0.gridMask:getLocalRect()
	elseif f9_arg0.list and f9_local3 ~= nil and f9_local4 ~= nil then
		local f9_local9, f9_local10, f9_local11, f9_local12 = f9_arg0.list:getLocalRect()
		f9_local8 = f9_local12
		f9_local7 = f9_local11
		f9_local6 = f9_local10
		f9_local5 = f9_local9 - f9_local3
		f9_local6 = f9_local6 - f9_local4
	end
	f9_local1.iconHeight = f0_local3 * 0.75
	f9_local1.height = f0_local3
	f9_local1.width = f0_local4
	f9_local1.anchorType = CoD.AnchorTypes.TopLeft
	f9_local1.primaryFontHeight = f9_local1.height * 0.07
	f9_local1.primaryTextLeft = 14
	f9_local1.primaryTextRight = -10
	f9_local1.primaryTextTop = 5
	f9_local1.secondaryFontHeight = f9_local1.primaryFontHeight * 0.85
	f9_local1.secondaryTextRight = -10
	f9_local1.secondaryTextTop = f9_local1.primaryTextTop + f9_local1.primaryFontHeight + 2
	f9_local1.iconCentered = true
	f9_local1.gridProps = {
		elementsPerRow = f0_local1,
		rowHeight = f9_local1.height,
		rows = f0_local0,
		hSpacing = f9_local3,
		vSpacing = f9_local4,
		left = f9_local5,
		top = f9_local6
	}
	if f9_arg0.grid then
		f9_arg0.grid:closeTree()
		f9_arg0.grid:close()
		f9_arg0.gridMask:close()
		f9_arg0.grid = nil
		f9_arg0.list:closeTree()
		f9_arg0.list:close()
		f9_arg0.list.buttonCount = 0
	elseif f9_local0 then
		local f9_local9 = f9_local0:getParent()
		f9_local0.buttonCount = 0
		f9_local0:closeTree()
		if f9_local9 then
			f9_local9:addElement( f9_local0 )
			ListPaging.Reset( f9_local0 )
		end
		f9_local0.pagingData = nil
	else
		f9_arg0.list:closeTree()
		f9_arg0.list:close()
		f9_arg0.list.buttonCount = 0
		if f9_arg0.gridMask then
			f9_arg0.gridMask:close()
			f9_arg0.gridMask = nil
		end
	end
	run_gc()
	run_gc()
	local f9_local9 = Cao.GetCallingCard( f9_arg1 )
	local f9_local10 = {}
	local f9_local11 = RegisterMaterial( "white" )
	local f9_local12 = RegisterMaterial( "s1_icon_locked_full" )
	local f9_local13 = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	local f9_local14 = RegisterMaterial( "h1_ui_menu_icon_equipped" )
	local f9_local15 = f9_arg3[f9_arg2]
	if f9_local15 then
		for f9_local16 = 1, #f9_local15, 1 do
			local f9_local19 = f9_local16
			local f9_local20 = false
			if IsPublicMatch() then
				f9_local20 = LUI.InventoryUtils.GetItemNewStickerState( f9_arg1, f9_local15[f9_local19].image )
			end
			local f9_local21 = f9_local15[f9_local19].lootData
			if not f9_local21 then
				f9_local21 = f9_local15[f9_local19].locked == false
			end
			local f9_local22 = nil
			local f9_local23 = CallingCard( f9_local19, f9_local15[f9_local19], f0_local4 * 0.75, f0_local3 * 0.75, f9_local20, f9_local11, f9_local12, f9_local13, f9_local14 )
			local f9_local24 = f9_local15[f9_local19].lootData
			if not f9_local24 then
				f9_local24 = f9_local15[f9_local19]
			end
			f9_local1.locked = nil
			f9_local1.iconLeftOffset = nil
			f9_local1.iconTopOffset = nil
			f9_local1.iconHeight = f0_local3 * 0.75
			f9_local1.iconName = nil
			f9_local1.customIcon = nil
			local f9_local25
			if f9_local21 then
				f9_local25 = function ( f10_arg0, f10_arg1 )
					LUI.MPDepotHelp.OnAction( f9_local23, f10_arg1, f9_arg0, f9_local15[f9_local19].lootData )
				end
				
				if not f9_local25 then
				
				else
					f9_local1.actionFunc = f9_local25
					f9_local1.primaryText = ""
					f9_local1.secondaryText = ""
					f9_local1.extraImagePadding = f9_local24.padding
					f9_local1.rarity = f9_local24.lootRarity
					f9_local1.equipped = f9_local9 == tonumber( f9_local23.data.cardIndex )
					f9_local1.externalElement = f9_local23
					f9_local1.extraElems = {}
					f9_local25 = nil
					if f9_local24.lockState == nil and f9_local24.locked == true then
						f9_local1.locked = true
					elseif f9_local24.lockState == "Locked" then
						if not IsContentPromoUnlocked( f9_local24.contentPromo ) then
							f9_local1.locked = true
							f9_local1.iconName = "s1_icon_locked_full"
						elseif Cac.IsRewardType( f9_local24.inventoryItemType ) then
							f9_local1.iconName = "collection_reward_locked"
							f9_local1.locked = nil
						elseif Cac.IsCraftableType( f9_local24.inventoryItemType ) then
							f9_local25 = f9_local24.price
							if f9_local1.iconCentered then
								f9_local1.iconTopOffset = -15
								f9_local1.iconLeftOffset = -18
							else
								f9_local1.iconLeftOffset = -46
								f9_local1.iconTopOffset = 16
							end
							local f9_local26 = 1000
							while f9_local26 - 1 < f9_local25 do
								f9_local1.iconLeftOffset = f9_local1.iconLeftOffset - 8
								f9_local26 = f9_local26 * 10
							end
							f9_local1.iconHeight = 28
							f9_local1.iconName = GetCurrencyImage( InventoryCurrencyType.Parts )
							f9_local1.secondaryImage = nil
							f9_local1.locked = nil
						end
					end
					if f9_local1.iconName ~= nil then
						f9_local23.fader:registerAnimationState( "scaledBack", {
							alpha = 0.75
						} )
						f9_local23.fader:animateToState( "scaledBack" )
					end
					f9_local1.listDefaultFocus = f9_local1.equipped
					f9_local22 = LUI.CacBase.AddCacButton( f9_arg0, f9_local1 )
					if f9_local21 == false then
						f9_local22:clearActionSFX()
					end
					f9_local1.externalElement = nil
					if f9_local25 then
						LUI.MPDepotBase.AddInfoToButton( f9_arg0, f9_local22, f9_local25, true, 60, LUI.Alignment.Right )
					end
					f9_local23.id = "card_button_" .. f9_arg2 .. "_" .. f9_local19
					f9_local23:registerEventHandler( "button_over", f9_arg0.UpdateInfo )
					f9_local23:registerEventHandler( "button_over_disable", f9_arg0.UpdateInfo )
					f9_local23.category = f9_arg2
					local f9_local27
					if f9_local21 then
						f9_local27 = function ( f11_arg0, f11_arg1 )
							CallingCardEquip( f11_arg0, f11_arg1, f9_arg0 )
						end
						
						if not f9_local27 then
						
						else
							f9_local23.passThruFunc = f9_local27
							f9_local10[f9_local19] = f9_local23.image
							f9_local1.externalElement = nil
						end
					end
					f9_local27 = nil
				end
			end
			f9_local25 = nil
		end
		local f9_local16 = {
			containerWidth = f0_local6,
			containerHeight = 32
		}
		
		local scrollIndicatorParent = LUI.UIElement.new( {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			left = 288,
			top = -96,
			height = f9_local16.containerHeight
		} )
		f9_arg0:addElement( scrollIndicatorParent )
		f9_arg0.scrollIndicatorParent = scrollIndicatorParent
		
		ListPaging.InitGrid( f9_arg0.grid, f0_local0, nil, false, scrollIndicatorParent, f9_local16 )
		ListPaging.InitStreaming( f9_arg0.grid, f9_local10, StreamingCount )
		local f9_local18, f9_local19, f9_local20, f9_local21 = f9_arg0.gridMask:getLocalRect()
		if not f9_arg0.tabManager then
			f9_arg0:AddListDivider( nil, f9_local18 + f9_local1.gridProps.hSpacing, f9_local19 + f9_local1.gridProps.vSpacing, f9_local20 - f9_local1.gridProps.hSpacing, f9_local21 )
		end
		if not LUI.FlowManager.IsTopMenuModal() then
			f9_arg0.grid:processEvent( {
				name = "gain_focus",
				controller = f9_arg1
			} )
		else
			return mask
		end
		f9_local23.passThruFunc = f9_local27
		f9_local10[f9_local19] = f9_local23.image
		f9_local1.externalElement = nil
	end
	return mask
end

function BuildInfoPane( menu, controller )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		topAnchor = true,
		top = -28,
		right = -25,
		width = 355
	} )
	controller:addElement( self )
	local f12_local1 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f12_local1.height = 100
	local self = LUI.UIElement.new( f12_local1 )
	self:setUseStencil( true )
	self:addElement( self )
	local f12_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f12_local3.width = f12_local1.height
	f12_local3.height = f12_local1.height
	f12_local3.material = RegisterMaterial( "h1_ui_loader_emblem" )
	self:addElement( LUI.UIImage.new( f12_local3 ) )
	local f12_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f12_local4.material = RegisterMaterial( "black" )
	local self = LUI.UIImage.new( f12_local4 )
	self:addElement( self )
	
	local itemModelLockOverlay = LUI.CacDetails.MakeLockOverlay( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ), 400, 0.9, {
		topAnchor = true,
		top = 37,
		width = 300
	}, {
		topAnchor = true,
		top = -15,
		width = 300
	}, true )
	self:addElement( itemModelLockOverlay )
	menu.itemModelLockOverlay = itemModelLockOverlay
	
	local itemLockReasonLabel = LUI.UIText.new( {
		color = Colors.white,
		height = 14,
		font = CoD.TextSettings.BodyFont.Font,
		bottom = -27,
		topAnchor = true,
		width = 300,
		alpha = 1
	} )
	itemLockReasonLabel:registerAnimationState( "hidden", {
		alpha = 0
	} )
	itemLockReasonLabel:setText( Engine.Localize( "@DEPOT_LOCKED_LIVE_EVENT_EXPIRED" ) )
	itemModelLockOverlay:addElement( itemLockReasonLabel )
	menu.itemLockReasonLabel = itemLockReasonLabel
	
	self:addElement( LUI.Divider.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		top = 110
	}, 5, LUI.Divider.Green ) )
	local f12_local8 = LUI.ItemDescriptionWidget.new( {
		topAnchor = true,
		leftAnchor = true,
		top = 125
	}, 350 )
	f12_local8:registerAnimationState( "default", {
		alpha = 1
	} )
	f12_local8:registerAnimationState( "hidden", {
		alpha = 0
	} )
	menu.itemDescriptionWidget = f12_local8
	self:addElement( f12_local8 )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 355,
		spacing = 40
	} )
	local f12_local10 = CombatRecord.GetRankInfo( menu.exclusiveController )
	local f12_local11 = {
		gamertag = CoD.FormatClanAndGamerTags( Engine.GetCustomClanTag( menu.exclusiveController ), Engine.GetUsernameByController( menu.exclusiveController ) ),
		clantag = Engine.GetProfileDataUseEliteClanTag( menu.exclusiveController ) and Clan.GetTag( menu.exclusiveController ) or Engine.GetCustomClanTag( menu.exclusiveController ),
		background = Cao.GetCallingCard( menu.exclusiveController ),
		xuid = Engine.GetXUIDByController( menu.exclusiveController ),
		emblem = Cao.GetEmblemPatch( menu.exclusiveController ),
		prestige = f12_local10.prestige,
		rank = f12_local10.rank
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
		top = -40
	} )
	self:setText( Engine.Localize( "@LUA_MENU_PREVIEW" ) )
	self:addElement( self )
	self:addElement( self )
	local f12_local14 = LUI.Playercard.new( {
		scale = 0.35,
		topAnchor = true,
		top = 13
	}, f12_local11 )
	menu.playerCard = f12_local14
	self:addElement( f12_local14 )
	self:addElement( self )
	menu.UpdateInfo = function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller
		if f13_local0 == nil then
			local f13_local1 = LUI.FlowManager.GetMenuScopedDataFromElement( menu )
			f13_local0 = f13_local1.exclusiveControllerIndex
		end
		menu.depotHelp:OnFocus( f13_local0, f13_arg0.data.lootData )
		self:closeChildren()
		menu.playerCard:feedContent( {
			background = f13_arg0.data.cardIndex
		} )
		if f13_arg0.data.animatedTable == nil or f13_arg0.data.animatedTable == "" then
			self:setImage( f13_arg0.image )
		else
			local f13_local2 = LUI.Playercard.CreateAnimatedCallingCard( f13_arg0.data.animatedTable, f12_local1.height )
			if f13_local2 then
				self:addElement( f13_local2 )
				self:setImage( RegisterMaterial( "black" ) )
			end
		end
		if f13_arg0.data.unlockData ~= nil and f13_arg0.data.unlockData.lockStatus ~= Cac.ItemLockStatus.Unlocked and (f13_arg0.data.unlockData.unlockChallenge == nil or f13_arg0.data.unlockData.unlockChallenge == "") then
			menu.itemDescriptionWidget:animateToState( "default" )
			menu.itemDescriptionWidget:Update( Engine.Localize( f13_arg0.data.name ), f13_arg0.data.unlockData.unlockMessage )
			menu.itemDescriptionWidget:ClearColor()
		elseif f13_arg0.data.unlockData.unlockChallenge and f13_arg0.data.unlockData.unlockChallenge ~= "" then
			local f13_local2, f13_local3 = ParseChallengeName( f13_arg0.data.unlockData.unlockChallenge )
			local f13_local4 = GetChallengeData( f13_local0, f13_local2, nil, nil, f13_local3 )
			if f13_local4 then
				menu.itemDescriptionWidget:animateToState( "default" )
				local f13_local5 = nil
				if f13_local4.prerequisite then
					f13_local5 = f13_local4.prerequisite
				else
					f13_local5 = GetChallengeNameWithTier( f13_local2, f13_local3 )
				end
				menu.itemDescriptionWidget:Update( Engine.Localize( f13_arg0.data.name ), f13_local5, nil, f13_local4 )
			end
			menu.itemDescriptionWidget:ClearColor()
		else
			menu.itemDescriptionWidget:Update( Engine.Localize( f13_arg0.data.name ), "", nil, nil, f13_arg0.data.lootData and f13_arg0.data.lootData.guid or nil )
			if f13_arg0.data.lootData and f13_arg0.data.lootData.lootRarity then
				menu.itemDescriptionWidget:ColorForPerks( f13_arg0.data.lootData.lootRarity.color )
			else
				menu.itemDescriptionWidget:ClearColor()
			end
		end
		if IsPublicMatch() then
			LUI.NewSticker.Update( f13_arg0 )
			local f13_local2 = "cc_" .. f13_arg0.category
			LUI.InventoryUtils.SetNewStickerState( f13_local0, f13_arg0.data.image, "CallingCard", f13_local2, false )
			if not LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f13_local2 ) and menu.tabManager and menu.tabManager.tabsList ~= nil and menu.tabManager.tabSelected <= #menu.tabManager.tabsList then
				local f13_local4 = menu.tabManager.tabsList[menu.tabManager.tabSelected]
				if f13_local4 and f13_local4.tabHeader then
					LUI.NewSticker.Update( f13_local4.tabHeader )
				end
			end
		end
		self:addElement( menu.itemModelLockOverlay )
		menu.itemModelLockOverlay:setPriority( 501 )
		if f13_arg0.disabled == true or f13_arg0.data.lootData and f13_arg0.data.lootData.lockState == "Locked" then
			menu.itemModelLockOverlay:show()
			if f13_arg0.data.lootData and IsContentPromoUnlocked( f13_arg0.data.lootData.contentPromo ) == false then
				menu.itemLockReasonLabel:animateToState( "default" )
			else
				menu.itemLockReasonLabel:animateToState( "hidden" )
			end
		else
			menu.itemModelLockOverlay:hide()
			menu.itemLockReasonLabel:animateToState( "hidden" )
		end
	end
	
end

function CallingCardMenu( f14_arg0, f14_arg1 )
	local f14_local0 = LUI.MenuTemplate.new( f14_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@MENU_CALLING_CARD" ) ),
		menu_top_indent = 20
	} )
	f14_local0.fromDepot = f14_arg1.fromDepot
	if f14_local0.fromDepot then
		f14_local0:SetBreadCrumb( Engine.Localize( "@DEPOT_ARMORY" ) )
	else
		f14_local0:SetBreadCrumb( Engine.Localize( "@LUA_MENU_PERSONALIZATION_CAPS" ) )
	end
	f14_local0.controller = f14_arg1.exclusiveController
	f14_local0:addElement( LUI.MPDepotHelp.new( f14_local0, {
		actionAndCollectionHelpOnly = true
	} ) )
	local f14_local1 = buildCallingCardsData( f14_local0.controller, f14_arg1.DLC )
	local self = LUI.UIElement.new( CoD.CreateState( 0, LUI.MenuTemplate.ListTop + 50, 0, 0, CoD.AnchorTypes.All ) )
	f14_local0:addElement( self )
	BuildInfoPane( f14_local0, self )
	local f14_local3 = Cao.GetCallingCard( f14_local0.controller )
	local f14_local4 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Ref, f14_local3, CallingCardTable.Cols.Category )
	local f14_local5 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Ref, f14_local3, CallingCardTable.Cols.ContentPromo )
	if f14_local5 ~= nil and f14_local5 ~= "0" and f14_local5 ~= "" then
		f14_local4 = f14_local4 .. ":" .. f14_local5
	end
	local f14_local6 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local0 )
	f14_arg1.defaultTab = f14_local6.curCategory or f14_arg1.defaultTab
	local f14_local7 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			top = 10
		},
		numOfTabs = f14_local1.numCallingCardTabs,
		vPadding = 20
	} )
	f14_local7:keepRightBumperAlignedToHeader( true )
	f14_local7.tabContentPane = self
	f14_local7.forceStringBasedTabWidth = true
	f14_local0.tabManager = f14_local7
	local f14_local8 = 0
	local f14_local9 = 1
	if f14_local0.fromDepot then
		f14_local9 = 2
	end
	for f14_local10 = f14_local9, f14_local1.numCallingCardTabs, 1 do
		f14_local8 = f14_local8 + 1
		local f14_local13 = f14_local1.callingCardCategories[f14_local10]
		local f14_local14 = false
		if IsPublicMatch() then
			f14_local14 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), "cc_" .. f14_local13.category )
		end
		f14_local7:addTab( f14_local0.controller, f14_local13.name, function ( f15_arg0, f15_arg1 )
			local f15_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local0 )
			f15_local0.curCategory = f14_local13.category
			return BuildGrid( f14_local0, f14_local0.controller, f14_local13.category, f14_local1 )
		end, nil, nil, nil, nil, f14_local14 )
		if f14_arg1.defaultTab then
			if f14_arg1.defaultTab == f14_local13.category then
				f14_local7.tabSelected = f14_local8
			end
		elseif f14_local13.category == f14_local4 then
			f14_local7.tabSelected = f14_local8
		end
	end
	f14_local7:refreshTab( f14_local0.controller, f14_local0.tabManager.tabSelected )
	f14_local0:addElement( f14_local7 )
	f14_local0:AddBackButton()
	f14_local0:AddCurrencyInfoPanel()
	f14_local0:registerEventHandler( "on_crafted_item", function ( element, event )
		if event.success == true then
			f14_local1 = buildCallingCardsData( f14_local0.controller, f14_arg1.DLC )
			f14_local0.tabManager:refreshTab( f14_local0.controller, f14_local0.tabManager.tabSelected )
			element:dispatchEventToChildren( event )
		end
	end )
	f14_local0:registerEventHandler( "on_item_equipped", function ( element, event )
		f14_local0.tabManager:refreshTab( f14_local0.controller, f14_local0.tabManager.tabSelected )
	end )
	return f14_local0
end

function CallingCardMenuDLC( f18_arg0, f18_arg1 )
	f18_arg1.DLC = true
	return CallingCardMenu( f18_arg0, f18_arg1 )
end

function CallingCardMenuFromDepot( f19_arg0, f19_arg1 )
	f19_arg1.defaultTab = "LootDrop4"
	f19_arg1.fromDepot = true
	return CallingCardMenuDLC( f19_arg0, f19_arg1 )
end

LUI.MenuBuilder.registerType( "CallingCardMenu", CallingCardMenu )
LUI.MenuBuilder.registerType( "CallingCardMenuDLC", CallingCardMenuDLC )
LUI.MenuBuilder.registerType( "CallingCardMenuFromDepot", CallingCardMenuFromDepot )
LockTable( _M )
