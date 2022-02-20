local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotCollections = InheritFrom( LUI.MPDepotBase )
f0_local0 = 4
f0_local1 = 60
f0_local2 = f0_local1
local f0_local3 = 4
local f0_local4 = 6
local f0_local5 = 10
local f0_local6 = f0_local1 + f0_local3
local f0_local7 = f0_local6 + f0_local4 + f0_local3 + f0_local5
local f0_local8 = 72
local f0_local9 = 24
local f0_local10 = 180
local f0_local11 = 520
local f0_local12 = 46
local f0_local13 = 24
LUI.MPDepotCollections.MakeItem = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f0_local1
	if f1_arg2 then
		f1_local0 = f1_local0 + f0_local8 + f1_local0
	end
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f1_local0,
		height = f0_local7
	} )
	self.width = f1_local0
	
	local alphaRoot = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( alphaRoot )
	self.alphaRoot = alphaRoot
	
	local image = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		width = f0_local1,
		height = f0_local1
	} )
	alphaRoot:addElement( image )
	self.image = image
	
	local rarityBar = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = f0_local6,
		width = f0_local1,
		height = f0_local4,
		material = RegisterMaterial( "collection_rarity_marker" )
	} )
	alphaRoot:addElement( rarityBar )
	self.rarityBar = rarityBar
	
	local nameText = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		height = f0_local5,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font,
		width = f1_local0 + f0_local12 * 0.75,
		bottomAnchor = true,
		bottom = 0
	} )
	alphaRoot:addElement( nameText )
	self.nameText = nameText
	
	local lock = LUI.MPDepotLootCard.MakeLockWithBkg( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 46
	} )
	self:addElement( lock )
	self.lock = lock
	
	return self
end

LUI.MPDepotCollections.PlaceItem = function ( f2_arg0, f2_arg1 )
	if f0_local0 < f2_arg0.curCol or f2_arg1 and f2_arg0.curCol == f0_local0 then
		f2_arg0.curRow = f2_arg0.curRow + 1
		f2_arg0.curCol = 1
	end
	local f2_local0 = f0_local10 + f0_local13 + (f2_arg0.curRow - 1) * (f0_local7 + f0_local9)
	local f2_local1 = f0_local11 + f0_local12 + (f2_arg0.curCol - 1) * (f0_local2 + f0_local8)
	f2_arg0.curCol = f2_arg0.curCol + 1
	if f2_arg1 then
		f2_arg0.curCol = f2_arg0.curCol + 1
	end
	return f2_local0, f2_local1
end

LUI.MPDepotCollections.AddItems = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	while #f3_arg2 < #f3_arg1 do
		local f3_local0 = f3_arg0:MakeItem( #f3_arg2 + 1, f3_arg3 )
		f3_arg0:addElement( f3_local0 )
		f3_arg2[#f3_arg2 + 1] = f3_local0
	end
	for f3_local0 = 1, #f3_arg1, 1 do
		local f3_local3 = f3_arg1[f3_local0]
		local f3_local4 = f3_arg2[f3_local0]
		f3_local4:setAlpha( 1 )
		f3_local4.nameText:setText( f3_local3.name )
		if f3_local4.animCard ~= nil then
			f3_local4.image:removeElement( f3_local4.animCard )
			f3_local4.animCard = nil
		end
		local f3_local5 = f3_local3.image
		if f3_local3.animatedTable ~= nil then
			f3_local5 = RegisterMaterial( "ui_transparent" )
			local f3_local6 = LUI.Playercard.CreateAnimatedCallingCard( f3_local3.animatedTable, f0_local1 )
			f3_local4.image:addElement( f3_local6 )
			f3_local4.animCard = f3_local6
		else
			Engine.CacheMaterial( f3_local5 )
		end
		f3_local4.image:setImage( f3_local5 )
		local f3_local6 = 1
		local f3_local7 = 0.3
		if f3_local3.isOwned then
			f3_local6 = 0
			f3_local7 = 1
		end
		if f3_local3.loot_type == "reticle" then
			local f3_local8 = 1 * f3_local7
			f3_local4.image:registerAnimationState( "default", {
				topAnchor = true,
				leftAnchor = false,
				rightAnchor = false,
				top = 0,
				width = f0_local1,
				height = f0_local1,
				color = {
					r = f3_local8,
					g = f3_local8,
					b = f3_local8
				},
				alpha = 1
			} )
		else
			f3_local4.image:registerAnimationState( "default", {
				topAnchor = true,
				leftAnchor = false,
				rightAnchor = false,
				top = 0,
				width = f0_local1,
				height = f0_local1,
				color = {
					r = 1,
					g = 1,
					b = 1
				},
				alpha = 1
			} )
		end
		f3_local4.image:animateToState( "default", 0 )
		f3_local4.alphaRoot:setAlpha( f3_local7 )
		f3_local4.lock:setAlpha( f3_local6 )
		if f3_arg3 then
			local f3_local8, f3_local9 = GetMaterialDimensions( f3_local3.image )
			f3_local4.image:registerAnimationState( "pos", {
				topAnchor = true,
				leftAnchor = false,
				rightAnchor = false,
				top = 0,
				height = f0_local1,
				width = f3_local8 / f3_local9 * f0_local1
			} )
			f3_local4.image:animateToState( "pos" )
		end
		f3_local4.rarityBar:registerAnimationState( "color", {
			color = f3_local3.lootRarity.color
		} )
		f3_local4.rarityBar:animateToState( "color" )
		local f3_local9, f3_local10 = f3_arg0:PlaceItem( f3_arg3 )
		f3_local4:registerAnimationState( "pos", {
			topAnchor = true,
			leftAnchor = true,
			top = f3_local9,
			left = f3_local10,
			width = f3_local4.width,
			height = f0_local7
		} )
		f3_local4:animateToState( "pos" )
	end
end

local f0_local14 = function ( f4_arg0 )
	for f4_local0 = 1, #f4_arg0, 1 do
		f4_arg0[f4_local0]:setAlpha( 0 )
	end
end

LUI.MPDepotCollections.OnButtonFocus = function ( f5_arg0, f5_arg1 )
	f5_arg0.itemDescWidget:setAlpha( 1 )
	f5_arg0.collectionBkg:setAlpha( 1 )
	f5_arg0.progressText:setAlpha( 1 )
	f5_arg0.operationBountyDetails:setAlpha( 0 )
	local f5_local0 = f5_arg1.itemSet
	local f5_local1 = f5_local0.setReward
	local f5_local2 = f5_arg0.rewardItem
	if f5_local2 ~= nil then
		LUI.MPDepotLootCard.SetItem( f5_local2.card, f5_local1 )
		LUI.MPDepotLootCard.SetRewardEarned( f5_local2.card, f5_local1.isOwned or f5_local0.completed )
	end
	f0_local14( f5_arg0.squareElems )
	f0_local14( f5_arg0.wideElems )
	f5_arg0.curRow = 1
	f5_arg0.curCol = 1
	local f5_local3 = {}
	local f5_local4 = {}
	for f5_local5 = 1, #f5_local0.setItems, 1 do
		local f5_local8 = f5_local0.setItems[f5_local5]
		local f5_local9, f5_local10 = GetMaterialDimensions( f5_local8.image )
		if f5_local10 < f5_local9 then
			f5_local4[#f5_local4 + 1] = f5_local8
		else
			f5_local3[#f5_local3 + 1] = f5_local8
		end
	end
	f5_arg0:AddItems( f5_local3, f5_arg0.squareElems, false )
	f5_arg0:AddItems( f5_local4, f5_arg0.wideElems, true )
	local f5_local5 = nil
	if f5_local0.completed then
		f5_local5 = Engine.Localize( "@DEPOT_COLLECTION_COMPLETED" )
	else
		f5_local5 = Engine.Localize( "@DEPOT_SET_NUM_COLLECTED", f5_local0.numOwned, #f5_local0.setItems )
	end
	f5_arg0.progressText:setText( f5_local5 )
	f5_arg0.itemDescWidget:Update( f5_local0.name, "" )
end

LUI.MPDepotCollections.OnOperationBountyButtonFocus = function ( f6_arg0, f6_arg1 )
	f6_arg0.itemDescWidget:setAlpha( 0 )
	f6_arg0.collectionBkg:setAlpha( 0 )
	f6_arg0.progressText:setAlpha( 0 )
	f0_local14( f6_arg0.squareElems )
	f0_local14( f6_arg0.wideElems )
	f6_arg0:AddItems( {}, f6_arg0.squareElems, false )
	f6_arg0:AddItems( {}, f6_arg0.wideElems, true )
	local f6_local0 = {
		seasonTag = f6_arg0.season.tag,
		isComplete = f6_arg0.season.rewardData.completed,
		numSetsCompleted = f6_arg0.season.completedSets,
		totalNumSets = f6_arg0.numSets
	}
	f6_arg0.operationBountyDetails:Update( f6_local0 )
	f6_arg0.operationBountyDetails:setAlpha( 1 )
	local f6_local1 = f6_arg1.itemSet.setReward
	local f6_local2 = f6_arg0.rewardItem
	if f6_local2 ~= nil then
		LUI.MPDepotLootCard.SetItem( f6_local2.card, f6_local1 )
		LUI.MPDepotLootCard.SetRewardEarned( f6_local2.card, f6_local1.isOwned or f6_local0.isComplete )
	end
end

LUI.MPDepotCollections.AddOperationBountyButton = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = f7_arg2.rewardData.setReward
	local f7_local1 = {
		isRestricted = f7_local0.isRestricted,
		isNew = f7_local0.isNew,
		classLoc = f7_local0.classLoc,
		category = f7_local0.category,
		guid = f7_local0.guid,
		lockState = f7_local0.lockState,
		image = f7_local0.image,
		categoryKey = f7_local0.categoryKey,
		name = f7_local0.name,
		inventoryItemType = f7_local0.inventoryItemType,
		unlockMessage = f7_local0.unlockMessage,
		lootRarity = f7_local0.lootRarity,
		desc = f7_local0.desc,
		unlockTableRef = f7_local0.unlockTableRef,
		contentPromo = f7_local0.contentPromo,
		weaponName = f7_local0.weaponName,
		externalRef = f7_local0.externalRef,
		id = f7_local0.id,
		baseGuid = f7_local0.baseGuid,
		isOwned = f7_local0.isOwned,
		isOverflow = f7_local0.isOverflow,
		lockStatus = f7_local0.lockStatus,
		price = f7_local0.price,
		weaponCategory = f7_local0.weaponCategory,
		loot_type = f7_local0.loot_type,
		lootName = f7_local0.lootName
	}
	f7_local0.setReward = f7_local1
	f7_local0.setItems = {
		f7_local1
	}
	f7_local0.completed = f7_arg2.completedSets == #f7_arg1
	f7_local0.numOwned = f7_local0.isOwned and 1 or 0
	TryShowSeasonCompleted( f7_arg0.exclusiveController, f7_arg2.rewardData )
	local f7_local2 = function ( f8_arg0, f8_arg1 )
		LUI.FlowManager.RequestAddMenu( f8_arg0, "MPDepotCollectionDetailsMenu", true, f8_arg1.controller, false, {
			set = f7_local0,
			season = f7_arg2,
			isSeasonReward = f7_arg2.rewardData.isSeasonReward
		} )
	end
	
	local f7_local3 = nil
	if f7_local0.completed then
		f7_local3 = {
			material = CoD.Material.Star,
			offset = 20,
			initVisible = true
		}
	end
	local f7_local4 = f7_arg0:AddButton( "DEPOT_OPERATION_BOUNTY", f7_local2, nil, nil, nil, {
		customIcon = f7_local3
	} )
	f7_arg0.setButtons[0] = f7_local4
	f7_arg0.bountyBtn = f7_local4
	f7_local4.itemSet = f7_local0
	if f7_local3 == nil then
		f7_arg0:AddInfoToButton( f7_local4, Engine.Localize( "@MPUI_X_SLASH_Y", f7_arg2.completedSets, #f7_arg1 ), true )
	end
	f7_arg0.numSets = #f7_arg1
	f7_local4:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		f7_arg0:OnOperationBountyButtonFocus( f9_arg0 )
	end )
end

LUI.MPDepotCollections.PopulateList = function ( f10_arg0, f10_arg1 )
	local f10_local0 = false
	if f10_arg0.setButtons ~= nil then
		if not f10_arg0.setButtons[0] or not 0 then
			local f10_local1 = 1
		end
		for f10_local2 = #f10_arg0.setButtons, f10_local2, 1 do
			f10_arg0.setButtons[f10_local1]:close()
		end
		f10_arg0.list.buttonCount = 0
		f10_local0 = true
	end
	f10_arg0.setButtons = {}
	local f10_local4 = nil
	for f10_local1 = 1, #LUI.MPDepot.Collections, 1 do
		if LUI.MPDepot.Collections[f10_local1].Tag == f10_arg1 then
			f10_local4 = f10_arg0.setsData.seasons[f10_local1]
			break
		end
	end
	local f10_local1 = f10_local4.sets
	if CollectionRewardsEnabled() and f10_local4.rewardData and f10_local4.rewardData.isSeasonReward then
		f10_arg0.season = f10_local4
		f10_arg0:AddOperationBountyButton( f10_local1, f10_local4 )
		if f10_arg0.operationBountyDetails then
			f10_arg0.operationBountyDetails:setAlpha( 1 )
		end
		if f10_arg0.rewardItem then
			f10_arg0.rewardItem:show()
		end
		if f10_arg0.itemDescWidget then
			f10_arg0.itemDescWidget:show()
		end
		if f10_arg0.collectionBkg then
			f10_arg0.collectionBkg:show()
		end
	else
		if f10_arg0.operationBountyDetails then
			f10_arg0.operationBountyDetails:setAlpha( 0 )
		end
		if f10_arg0.rewardItem then
			f10_arg0.rewardItem:hide()
		end
		if f10_arg0.itemDescWidget then
			f10_arg0.itemDescWidget:hide()
		end
		if f10_arg0.collectionBkg then
			f10_arg0.collectionBkg:hide()
		end
	end
	for f10_local2 = 1, #f10_local1, 1 do
		local f10_local6 = f10_local1[f10_local2]
		local f10_local7 = function ( f11_arg0, f11_arg1 )
			LUI.FlowManager.RequestAddMenu( f11_arg0, "MPDepotCollectionDetailsMenu", true, f11_arg1.controller, false, {
				setID = f10_local6.setID
			} )
		end
		
		local f10_local8 = nil
		if f10_local6.completed then
			f10_local8 = {
				material = CoD.Material.Star,
				offset = 20,
				initVisible = true
			}
		end
		TryShowCollectionCompleted( f10_arg0.exclusiveController, f10_local6 )
		local f10_local9 = f10_arg0:AddButton( f10_local6.name, f10_local7, nil, nil, nil, {
			customIcon = f10_local8
		} )
		f10_arg0.setButtons[f10_local2] = f10_local9
		f10_local9.itemSet = f10_local6
		if f10_local8 == nil then
			f10_arg0:AddInfoToButton( f10_local9, Engine.Localize( "@MPUI_X_SLASH_Y", f10_local6.numOwned, #f10_local6.setItems ), true )
		end
		f10_local9:addEventHandler( "button_over", function ( f12_arg0, f12_arg1 )
			f10_arg0:OnButtonFocus( f12_arg0 )
		end )
	end
	if f10_local0 then
		f10_arg0.list:clearSavedState()
		f10_arg0.list:processEvent( {
			name = "gain_focus"
		} )
	end
	if f10_arg0.list.buttonCount > 0 then
		ListPaging.InitList( f10_arg0.list, 10, 14, nil, nil, {
			left_offset = 50
		}, nil, true )
	end
end

function MPDepotCollectionsMenu( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg1 or {}
	f13_local0.menu_title = "@DEPOT_COLLECTIONS"
	f13_local0.menu_top_indent = 34
	local f13_local1 = LUI.MPDepotBase.new( f13_arg0, f13_local0, 2 )
	f13_local1:setClass( LUI.MPDepotCollections )
	f13_local1:AddHelp( LUI.ButtonHelperText.CommonEvents.addOnboardingButton, function ( f14_arg0, f14_arg1 )
		LUI.OnboardingPopups.All( {
			controller = f13_arg1.exclusiveController,
			startingIndex = LUI.OnboardingPopups.COLLECTIONS
		} )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	local f13_local2 = LUI.ItemDescriptionWidget.new( {
		topAnchor = true,
		leftAnchor = true,
		top = f0_local10 - 38,
		left = f0_local11 + 3
	}, nil, true )
	f13_local1.itemDescWidget = f13_local2
	f13_local1:addElement( f13_local2 )
	local f13_local3 = 3
	local f13_local4 = f0_local2 * f0_local0 + (f0_local0 - 1) * f0_local8 + f0_local12 * 2
	local f13_local5 = f0_local7 * f13_local3 + (f13_local3 - 1) * f0_local9 + f0_local13 * 2
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f0_local10,
		left = f0_local11,
		width = f13_local4,
		height = f13_local5,
		material = RegisterMaterial( "depot_collection_summary_backing" )
	} )
	f13_local1.collectionBkg = self
	f13_local1:addElement( self )
	f13_local1.setsData = GetItemSets()
	f13_local1:AddLootDropTabSelector()
	local f13_local7 = LUI.MenuBuilder.BuildRegisteredType( "MPDepotCollectionOperationBountyDetails", {
		anchor = CoD.AnchorTypes.TopLeft,
		top = f0_local10 - 50,
		left = f0_local11,
		width = f13_local4,
		height = f13_local5
	} )
	f13_local7:setAlpha( 0 )
	f13_local1.operationBountyDetails = f13_local7
	f13_local1:addElement( f13_local7 )
	
	local progressText = LUI.UIText.new( {
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		bottom = f0_local10 - 6,
		right = f0_local11 + f13_local4 - 3,
		height = 12,
		alignment = LUI.Alignment.Right,
		color = Colors.h1.second_medium_grey,
		font = CoD.TextSettings.BodyFont.Font
	} )
	f13_local1:addElement( progressText )
	f13_local1.progressText = progressText
	
	f13_local1.squareElems = {}
	f13_local1.wideElems = {}
	if CollectionRewardsEnabled() then
		local f13_local9 = LUI.MPDepotLootCard.new( {
			anchorType = CoD.AnchorTypes.TopLeft,
			top = 575,
			left = 800,
			isSetReward = true
		} )
		local f13_local10 = f13_local9.rootElem
		f13_local10.card = f13_local9.card
		f13_local1:addElement( f13_local10 )
		f13_local1.rewardItem = f13_local10
	end
	SetDepotState( self, {
		state = "pause"
	} )
	local f13_local11 = Engine.GetPlayerData( f13_arg1.exclusiveController, CoD.StatsGroup.Common, "depotData" )
	if not hasbit( f13_local11, 1 ) then
		LUI.OnboardingPopups.Collections( {
			controller = f13_arg1.exclusiveController
		} )
		f13_local11 = setbit( f13_local11, 1 )
	end
	Engine.SetPlayerData( f13_arg1.exclusiveController, CoD.StatsGroup.Common, "depotData", f13_local11 )
	return f13_local1
end

LUI.MenuBuilder.registerType( "MPDepotCollectionsMenu", MPDepotCollectionsMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "MPDepotCollectionsMenu", PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
