local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotCollectionDetails = InheritFrom( LUI.MPDepotBase )
f0_local0 = 288
f0_local1 = 512
f0_local2 = 60
local f0_local3 = {
	weaponcamo = true,
	furniturekit = true,
	charactercamo = true,
	weapon = true,
	costume = true
}
LUI.MPDepotCollectionDetails.GetCollection = function ( f1_arg0 )
	local f1_local0 = f1_arg0.set
	if not f1_local0 then
		f1_local0 = GetItemSet( f1_arg0.setID )
	end
	return f1_local0
end

LUI.MPDepotCollectionDetails.OnButtonFocus = function ( f2_arg0, f2_arg1 )
	local f2_local0 = nil
	local f2_local1 = f2_arg0:GetCollection()
	if f2_arg1 == f2_arg0.rewardButton then
		f2_local0 = f2_local1.setReward
	else
		f2_local0 = f2_local1.setItems[f2_arg1.itemIdx]
	end
	f2_arg0.lastFocus = f2_arg1
	f2_arg0.depotHelp:OnFocus( f2_arg0.controller, f2_local0 )
	local f2_local2 = f2_local0.desc
	if f2_local2 == "" then
		f2_local2 = Engine.Localize( f2_local0.category )
	end
	f2_arg0.itemDescWidget:Update( Engine.ToUpperCase( f2_local0.name ), f2_local2 )
	LUI.MPDepotLootCard.SetItem( f2_arg0.cardRoot.card, f2_local0 )
	local f2_local3 = 1
	if f0_local3[f2_local0.loot_type] then
		f2_local3 = 0
	end
	f2_arg0.mainImage:setAlpha( f2_local3 )
	f2_arg0.reticleBackground:hide()
	if f2_arg0.animCard ~= nil then
		f2_arg0.mainImage:removeElement( f2_arg0.animCard )
		f2_arg0.animCard = nil
	end
	if f2_local3 > 0 then
		local f2_local4, f2_local5 = GetMaterialDimensions( f2_local0.image )
		local f2_local6 = f0_local0
		local f2_local7 = f2_local4 / f2_local5 * f2_local6
		if f2_local0.loot_type == "reticle" then
			f2_local7 = f0_local2
			f2_local6 = f0_local2
			f2_arg0.reticleBackground:show()
		elseif f0_local1 < f2_local7 then
			f2_local7 = f0_local1
			f2_local6 = f2_local5 / f2_local4 * f2_local7
		end
		f2_arg0.mainImage:registerAnimationState( "pos", {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			height = f2_local6,
			width = f2_local7
		} )
		f2_arg0.mainImage:animateToState( "pos" )
		local f2_local8 = f2_local0.image
		if f2_local0.animatedTable ~= nil then
			f2_local8 = RegisterMaterial( "ui_transparent" )
			local f2_local9 = LUI.Playercard.CreateAnimatedCallingCard( f2_local0.animatedTable, f2_local6 )
			f2_arg0.mainImage:addElement( f2_local9 )
			f2_arg0.animCard = f2_local9
		end
		Engine.CacheMaterial( f2_local8 )
		f2_arg0.mainImage:setImage( f2_local8 )
	end
	if f2_local0.isOwned or f2_local1.completed then
		f2_arg0.lock:hide()
		f2_arg0.itemLockReasonLabel:animateToState( "hidden" )
	else
		if f2_local0.loot_type == "reticle" or f2_local0.loot_type == "costume" then
			f2_arg0.lock:registerAnimationState( "reticle", CoD.CreateState( nil, 160, nil, nil, CoD.AnchorTypes.None ) )
			f2_arg0.lock:animateToState( "reticle" )
		else
			f2_arg0.lock:animateToState( "default" )
		end
		f2_arg0.lock:show()
		if IsContentPromoUnlocked( f2_local0.contentPromo ) == false then
			f2_arg0.itemLockReasonLabel:animateToState( "default" )
		else
			f2_arg0.itemLockReasonLabel:animateToState( "hidden" )
		end
	end
	if f2_arg0.checkReward then
		f2_arg0.checkReward = false
		if not f2_local1.setReward.isOwned then
			CollectionRewardQueueAdd( f2_arg0, f2_local1 )
		end
		local f2_local4 = f2_arg0.season
		if not f2_local4 then
			f2_local4 = GetSeasonForItem( f2_local1.setReward.guid )
		end
		if f2_local4.rewardData ~= nil and not f2_local4.rewardData.setReward.isOwned then
			CollectionRewardQueueAdd( f2_arg0, f2_local4.rewardData )
		end
		ProcessCollectionRewardQueue( f2_arg0, nil )
	end
end

LUI.MPDepotCollectionDetails.RefreshProgress = function ( f3_arg0 )
	local f3_local0 = nil
	local f3_local1 = 0
	local f3_local2 = 0
	local f3_local3 = f3_arg0:GetCollection()
	if f3_local3.completed then
		f3_local2 = 1
		f3_local0 = Engine.Localize( "@DEPOT_COLLECTION_COMPLETED" )
		f3_local1 = 20
	else
		f3_local0 = Engine.Localize( "@DEPOT_SET_NUM_COLLECTED", f3_local3.numOwned, #f3_local3.setItems )
	end
	f3_arg0.progressText:registerAnimationState( "update", {
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		top = LUI.MenuTemplate.ListTop,
		left = f3_local1,
		width = 500,
		height = 12,
		alignment = LUI.Alignment.Left,
		color = Colors.h1.second_medium_grey,
		font = CoD.TextSettings.BodyFont.Font
	} )
	f3_arg0.progressText:animateToState( "update" )
	f3_arg0.progressText:setText( f3_local0 )
	f3_arg0.progressStar:setAlpha( f3_local2 )
end

LUI.MPDepotCollectionDetails.OnCraftedItem = function ( f4_arg0 )
	f4_arg0:RefreshProgress()
	f4_arg0:OnButtonFocus( f4_arg0.lastFocus )
	local f4_local0 = f4_arg0.actionButton
	if f4_local0 == nil then
		return 
	elseif f4_local0.subTextField ~= nil then
		f4_local0:removeElement( f4_local0.subTextField )
		f4_local0.subTextField = nil
	end
	f4_local0:dispatchEventToChildren( {
		name = "update_custom_icon",
		isVisible = false
	} )
end

LUI.MPDepotCollectionDetails.OnCompletedSet = function ( f5_arg0 )
	local f5_local0 = f5_arg0.rewardButton
	if f5_local0 ~= nil then
		f5_local0:UnlockRefresh( nil, nil, "collection_reward_complete" )
		if f5_arg0.lastFocus == f5_local0 then
			f5_arg0:OnButtonFocus( f5_local0 )
		end
	end
end

LUI.MPDepotCollectionDetails.InitButton = function ( f6_arg0, f6_arg1 )
	f6_arg1:addEventHandler( "button_over", function ( f7_arg0, f7_arg1 )
		f6_arg0:OnButtonFocus( f7_arg0 )
	end )
	f6_arg1:addEventHandler( "button_over_disable", function ( f8_arg0, f8_arg1 )
		f6_arg0:OnButtonFocus( f8_arg0 )
	end )
end

function MPDepotCollectionDetailsMenu( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg1.set
	if not f9_local0 then
		f9_local0 = GetItemSet( f9_arg1.setID )
	end
	f9_arg1.menu_title = Engine.ToUpperCase( f9_local0.name )
	f9_arg1.menu_top_indent = 26
	f9_arg1.persistentBackground = PersistentBackground.Variants.VirtualLobby
	if not LUI.FlowManager.IsInStackRoot( "MPDepotMenu" ) then
		f9_arg1.onBackFunc = function ( f10_arg0, f10_arg1 )
			LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
			Cac.NotifyVirtualLobby( "leave_depot", 0 )
		end
		
	end
	local f9_local1 = LUI.MPDepotBase.new( f9_arg0, f9_arg1 )
	f9_local1:setClass( LUI.MPDepotCollectionDetails )
	f9_local1.controller = f9_arg1.exclusiveController
	f9_local1.setID = f9_arg1.setID
	f9_local1.set = f9_arg1.set
	f9_local1.season = f9_arg1.season
	f9_local1:SetBreadCrumb( Engine.Localize( "@DEPOT_COLLECTIONS" ) )
	local f9_local2 = 16
	
	local progressStar = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		top = LUI.MenuTemplate.ListTop - 4,
		width = f9_local2,
		height = f9_local2,
		material = RegisterMaterial( CoD.Material.Star )
	} )
	f9_local1:addElement( progressStar )
	f9_local1.progressStar = progressStar
	
	local progressText = LUI.UIText.new()
	f9_local1:addElement( progressText )
	f9_local1.progressText = progressText
	
	f9_local1:RefreshProgress()
	f9_local1:addEventHandler( "on_crafted_item", function ( f11_arg0, f11_arg1 )
		if f11_arg1.success then
			f9_local1:OnCraftedItem()
			f9_local1:dispatchEventToChildren( f11_arg1 )
		end
		if f11_arg1.isSetReward then
			f9_local1:OnCompletedSet()
		end
		f9_local1.actionButton = nil
	end )
	f9_local1:addEventHandler( "on_item_equipped", function ( f12_arg0, f12_arg1 )
		LUI.MPDepotHelp.StartConfirmationPopUpAnim( f9_local1, "equip" )
	end )
	if CollectionRewardsEnabled() then
		local self = f9_local0.setReward
		local f9_local6 = function ( f13_arg0, f13_arg1 )
			LUI.MPDepotHelp.OnAction( f13_arg0, f13_arg1, f9_local1, self )
		end
		
		local reticleBackground = {
			primaryText = self.name,
			secondaryText = "@DEPOT_BOUNTY_REWARD"
		}
		local mainImage
		if self.isOwned or f9_local0.completed == true then
			mainImage = "collection_reward_complete"
			if not mainImage then
			
			else
				reticleBackground.iconName = mainImage
				reticleBackground.rarity = self.lootRarity
				reticleBackground.buttonWidth = GenericMenuDims.menu_width_standard
				reticleBackground.anchorType = CoD.AnchorTypes.TopLeft
				reticleBackground.actionFunc = f9_local6
				mainImage = LUI.CacBase.AddCacButton( f9_local1, reticleBackground )
				f9_local1:InitButton( mainImage )
				f9_local1.rewardButton = mainImage
				f9_local1:AddListDivider( LUI.CacButton.Height + 13 )
				f9_local1:AddSpacing( 1 )
			end
		end
		mainImage = "collection_reward_locked"
	end
	if not f9_arg1.isSeasonReward then
		for self = 1, #f9_local0.setItems, 1 do
			local f9_local9 = f9_local0.setItems[self]
			local f9_local10 = IsContentPromoUnlocked( f9_local9.contentPromo )
			local f9_local11
			if not f9_local9.isOwned then
				f9_local11 = f9_local10
			else
				f9_local11 = false
			end
			local f9_local12 = nil
			if f9_local11 then
				f9_local12 = {
					material = GetCurrencyImage( InventoryCurrencyType.Parts ),
					offset = 48,
					initVisible = true
				}
			end
			local f9_local13 = {
				rarity = f9_local9.lootRarity,
				customIcon = f9_local12,
				showLockOnDisable = not f9_local10
			}
			local itemLockReasonLabel = f9_local1
			local lock = f9_local1.AddButton
			local f9_local16 = f9_local9.name
			local f9_local17 = function ( f14_arg0, f14_arg1 )
				f9_local1.actionButton = f14_arg0
				LUI.MPDepotHelp.OnAction( f14_arg0, f14_arg1, f9_local1, f9_local9 )
			end
			
			local f9_local18
			if not f9_local9.isOwned then
				f9_local18 = not f9_local10
			else
				f9_local18 = false
			end
			lock = lock( itemLockReasonLabel, f9_local16, f9_local17, f9_local18, nil, nil, f9_local13 )
			f9_local1:InitButton( lock )
			lock.itemIdx = self
			if f9_local11 then
				f9_local1:AddInfoToButton( lock, f9_local9.price, true )
			end
		end
	end
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		top = 128,
		left = 438,
		width = f0_local0,
		height = f0_local0
	} )
	f9_local1:addElement( self )
	local f9_local6 = CoD.CreateState( -424, -150, nil, nil, CoD.AnchorTypes.None )
	f9_local6.width = 788.14
	f9_local6.height = 420
	f9_local6.material = RegisterMaterial( "h1_reticles_previewscene" )
	
	local reticleBackground = LUI.UIImage.new( f9_local6 )
	self:addElement( reticleBackground )
	f9_local1.reticleBackground = reticleBackground
	
	local mainImage = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:addElement( mainImage )
	f9_local1.mainImage = mainImage
	
	local f9_local9 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	local f9_local10 = 38
	local f9_local11 = 325
	
	local lock = LUI.CacDetails.MakeLockOverlay( f9_local9, nil, nil, {
		topAnchor = true,
		top = -f9_local10,
		width = f9_local11
	}, {
		bottomAnchor = true,
		top = f9_local10,
		width = f9_local11
	}, true )
	self:addElement( lock )
	f9_local1.lock = lock
	
	local itemLockReasonLabel = LUI.UIText.new( {
		color = Colors.white,
		alignment = LUI.Alignment.Center,
		height = 14,
		font = CoD.TextSettings.BodyFont.Font,
		top = -f9_local10,
		width = f9_local11,
		alpha = 1
	} )
	itemLockReasonLabel:registerAnimationState( "hidden", {
		alpha = 0
	} )
	itemLockReasonLabel:setText( Engine.Localize( "@DEPOT_LOCKED_LIVE_EVENT_EXPIRED" ) )
	lock:addElement( itemLockReasonLabel )
	f9_local1.itemLockReasonLabel = itemLockReasonLabel
	
	local f9_local16 = LUI.ItemDescriptionWidget.new( {
		bottomAnchor = true,
		top = 50
	} )
	f9_local1.itemDescWidget = f9_local16
	self:addElement( f9_local16 )
	local f9_local18 = LUI.MPDepotLootCard.new( {
		anchorType = CoD.AnchorTypes.TopLeft,
		top = 476,
		left = 2030
	} )
	
	local cardRoot = f9_local18.rootElem
	cardRoot.card = f9_local18.card
	f9_local1:addElement( cardRoot )
	f9_local1.cardRoot = cardRoot
	
	local depotHelp = LUI.MPDepotHelp.new( f9_local1, {
		noCollectionHelp = true,
		factionLowerRight = true,
		clearWeapon = true
	} )
	f9_local1:addElement( depotHelp )
	f9_local1.depotHelp = depotHelp
	
	f9_local1.checkReward = true
	return f9_local1
end

LUI.MenuBuilder.registerType( "MPDepotCollectionDetailsMenu", MPDepotCollectionDetailsMenu )
VLobby.InitMenuMode( "MPDepotCollectionDetailsMenu", VirtualLobbyModes.LUI_MODE_CAO_COLLECTIONS, PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
