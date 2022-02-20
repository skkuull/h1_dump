local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.CacDetails = InheritFrom( LUI.CacBase )
LUI.CacDetails.ArrowBoxOffset = 35
LUI.CacDetails.WeaponBoxLeft = 345
LUI.CacDetails.PrimaryWeaponBoxTop = 125
LUI.CacDetails.WeaponBoxTop = 105
LUI.CacDetails.PerksBlue = {
	r = 0.13,
	g = 0.32,
	b = 0.5
}
LUI.CacDetails.PerksRed = {
	r = 0.46,
	g = 0.12,
	b = 0.16
}
LUI.CacDetails.PerksYellow = {
	r = 0.42,
	g = 0.45,
	b = 0.31
}
LUI.CacDetails.LoadingVideo = "h1_ui_weapon_load_fx"
LUI.CacDetails.TitleBoxLeft = 345
LUI.CacDetails.TitleBoxTop = 125
LUI.WeaponInfoFont = CoD.TextSettings.BodyFont.Font
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			top = 10
		},
		numOfTabs = f1_arg1,
		vPadding = 20,
		forceStringBasedTabWidth = true,
		forceShowTabs = true
	} )
	f1_local0:keepRightBumperAlignedToHeader( true )
	f1_arg0.tabManager = f1_local0
	f1_arg0:addElement( f1_local0 )
	if not Engine.IsConsoleGame() and not Engine.IsGamepadEnabled() then
		f1_arg0:AddHelp( {
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

LUI.CacDetails.OnButtonActionUnlocks = function ( f2_arg0, f2_arg1 )
	if Cac.SelectingWeaponForAttachmentPermanentUnlock() then
		LUI.FlowManager.RequestAddMenu( nil, "CacDetailsPermanentUnlocksAttachments", true, f2_arg1.controller, false, {
			parentWeaponID = f2_arg0.itemID,
			storageCategory = "Primary_AttachKit",
			weaponType = "attachkit",
			menuTitle = Engine.Localize( "@LUA_MENU_ATTACHMENT_CAPS" ),
			showAttributes = true,
			showUnlocks = true,
			optionsForVL = {
				{
					optionStorageCategory = "Primary",
					optionWeaponRef = f2_arg0.itemID
				},
				{
					optionStorageCategory = "Primary_AttachKit"
				}
			},
			statsPrefix = "ak_",
			attributesDelta = true
		} )
	else
		LUI.FlowManager.RequestAddMenu( nil, "UnlockConfirmationDialog", true, f2_arg1.controller, false, {
			permanentRef = Cac.GetPermanentUnlockItemRef( f2_arg0.itemID, f2_arg0.menu.parentWeaponID ),
			itemID = f2_arg0.itemID,
			category = f2_arg0.menu.storageCategory,
			parentWeaponID = f2_arg0.menu.parentWeaponID,
			parentCategory = Cac.SelectingAttachmentPermanentUnlock() and "Primary" or f2_arg0.menu.parentCategory,
			menuToRestore = f2_arg0.menu.menuToRestore
		} )
	end
end

LUI.CacDetails.OnButtonActionGeneral = function ( f3_arg0, f3_arg1 )
	Cac.SelectEquippedWeapon( f3_arg0.menu.storageCategory, Cac.SelectedWeaponIndex, f3_arg0.itemID, LUI.CacStaticLayout.ClassLoc )
	if Engine.IsVideoPlaying( LUI.CacDetails.LoadingVideo ) then
		Engine.StopMenuVideo()
	end
	LUI.FlowManager.RequestLeaveMenu( f3_arg0.menu )
end

LUI.CacDetails.OnButtonFocus = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Cac.GetSelectedControllerIndex()
	local f4_local1 = Cac.GetWeaponName( f4_arg0.menu.storageCategory, f4_arg0.itemID )
	if f4_arg0.unlocked == true then
		f4_arg0.menu.itemModelLockOverlay:hide()
		f4_arg0.menu.itemLockReasonLabel:animateToState( "hidden" )
	else
		f4_arg0.menu.itemModelLockOverlay:show()
		if f4_arg0.lootData and IsContentPromoUnlocked( f4_arg0.lootData.contentPromo ) == false then
			f4_arg0.menu.itemLockReasonLabel:animateToState( "default" )
		else
			f4_arg0.menu.itemLockReasonLabel:animateToState( "hidden" )
		end
	end
	f4_arg0.menu.itemDescriptionWidget:Update( Engine.ToUpperCase( f4_local1 ), Cac.GetWeaponDescription( f4_arg0.menu.storageCategory, f4_arg0.itemID ), nil, f4_arg0.challengeData, f4_arg0.lootData and f4_arg0.lootData.guid or nil )
	if f4_arg0.lootData and f4_arg0.lootData.lootRarity then
		f4_arg0.menu.itemDescriptionWidget:ColorForPerks( f4_arg0.lootData.lootRarity.color )
	end
	if f4_arg0.itemID == "none" then
		f4_arg0.menu.itemDescriptionWidget:registerAnimationState( "hide", {
			alpha = 0
		} )
		f4_arg0.menu.itemDescriptionWidget:animateToState( "hide" )
	else
		f4_arg0.menu.itemDescriptionWidget:registerAnimationState( "show", {
			alpha = 1
		} )
		f4_arg0.menu.itemDescriptionWidget:animateToState( "show" )
	end
	if f4_arg0.menu.attributes ~= nil then
		local f4_local2 = ""
		if f4_arg0.menu.statsPrefix then
			f4_local2 = f4_local2 .. f4_arg0.menu.statsPrefix
		end
		f4_arg0.menu.attributes:Refresh( f4_local2 .. f4_arg0.itemID, f4_arg0.menu.attributesDelta, f4_arg0.menu.parentWeaponID )
	end
	if IsPublicMatch() then
		LUI.NewSticker.Update( f4_arg0 )
		local f4_local2 = ""
		if f4_arg0.menu.parentWeaponID then
			f4_local2 = f4_local2 .. f4_arg0.menu.parentWeaponID .. " "
		end
		LUI.InventoryUtils.SetNewStickerState( f4_local0, f4_local2 .. f4_arg0.itemID, f4_arg0.menu.storageCategory, f4_arg0.menu.parentWeaponID and f4_arg0.menu.parentWeaponID or f4_arg0.menu.weaponType, false )
		if not LUI.InventoryUtils.GetSubCategoryNewStickerState( f4_local0, f4_arg0.menu.weaponType ) and f4_arg0.menu.tabManager and f4_arg0.menu.tabManager.tabsList ~= nil and f4_arg0.menu.tabManager.tabSelected <= #f4_arg0.menu.tabManager.tabsList then
			local f4_local3 = f4_arg0.menu.tabManager.tabsList[f4_arg0.menu.tabManager.tabSelected]
			if f4_local3 and f4_local3.tabHeader then
				LUI.NewSticker.Update( f4_local3.tabHeader )
			end
		end
	end
	f4_arg0.menu.depotHelp:OnFocus( f4_local0, f4_arg0.lootData )
	if f4_arg0.reticlePreviewIconName and f4_arg0.menu.reticlePreviewElement then
		f4_arg0.menu.reticlePreviewElement:show()
		f4_arg0.menu.reticlePreviewElement:registerAnimationState( "update", {
			material = f4_arg0.reticlePreviewIconName
		} )
		f4_arg0.menu.reticlePreviewElement:animateToState( "update" )
	elseif f4_arg0.menu.reticlePreviewElement then
		f4_arg0.menu.reticlePreviewElement:hide()
	else
		local f4_local2 = "" .. f4_local0 .. "_"
		if f4_arg0.menu.storageCategory == "Primary" or f4_arg0.menu.storageCategory == "Secondary" then
			f4_local2 = f4_local2 .. Cac.GetVLOptionsString( f4_arg0.menu.storageCategory, f4_arg0.itemID )
		else
			for f4_local4 = 1, #f4_arg0.menu.optionsForVL, 1 do
				if f4_arg0.menu.optionsForVL[f4_local4].optionStorageCategory == f4_arg0.menu.storageCategory then
					f4_local2 = f4_local2 .. Cac.GetVLOptionsString( f4_arg0.menu.storageCategory, f4_arg0.itemID ) .. "_"
				else
					f4_local2 = f4_local2 .. Cac.GetVLOptionsString( f4_arg0.menu.optionsForVL[f4_local4].optionStorageCategory, f4_arg0.menu.optionsForVL[f4_local4].optionWeaponRef ) .. "_"
				end
			end
		end
		Cac.NotifyVirtualLobby( "weapon_highlighted", f4_local2 )
	end
end

function CreateExtraImage( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f5_local0.height = f5_arg1
	f5_local0.width = f5_arg0
	local self = LUI.UIButton.new( f5_local0 )
	self.id = "extra_image"
	self.properties = self.properties or {}
	local f5_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local2.material = f5_arg2
	
	local image = LUI.UIImage.new( f5_local2 )
	self:addElement( image )
	self.image = image
	
	return self
end

f0_local1 = function ( f6_arg0 )
	table.sort( f6_arg0, function ( f7_arg0, f7_arg1 )
		if f7_arg0.lootData then
			local f7_local0 = f7_arg0.lootData.lootRarity
			local f7_local1 = RaritySortTable[f7_arg0.lootData.lootRarity.rarity]
		end
		local f7_local2 = f7_local0 and f7_local1 or -1
		if f7_arg1.lootData then
			local f7_local3 = f7_arg1.lootData.lootRarity
			local f7_local4 = RaritySortTable[f7_arg1.lootData.lootRarity.rarity]
		end
		local f7_local5 = f7_local3 and f7_local4 or -1
		if f7_arg1.itemID == "wc_arcticwolf_01" then
			return 1
		else
			return f7_local2 < f7_local5
		end
	end )
	return f6_arg0
end

LUI.CacDetails.PopulateList = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6 )
	local f8_local0 = Engine.GetDvarBool( "xblive_privatematch" )
	f8_arg0.weaponType = f8_arg2
	local f8_local1 = f8_arg0.list
	if f8_arg0.grid then
		f8_local1 = f8_arg0.grid
	end
	if not f8_arg0.tabManager then
		f8_arg0:AddListDivider()
	end
	if f8_local1.listPagerScrollIndicator ~= nil then
		f8_local1.listPagerScrollIndicator:close()
		f8_local1.listPagerScrollIndicator = nil
	end
	local f8_local2
	if f8_arg1 ~= "Primary_Camo" and f8_arg1 ~= "Secondary_Camo" and f8_arg1 ~= "Primary_Reticle" and f8_arg1 ~= "Secondary_Reticle" then
		f8_local2 = false
	else
		f8_local2 = true
	end
	local f8_local3 = f8_arg0.weaponType == "reticle"
	local f8_local4 = Cac.GetSelectedControllerIndex()
	local f8_local5 = {}
	if f8_local2 then
		local f8_local6 = LUI.MenuTemplate.ButtonStyle.border_padding
		local f8_local7 = LUI.MenuTemplate.ButtonStyle.border_padding
		local f8_local8, f8_local9, f8_local10, f8_local11 = nil
		if f8_arg0.gridMask ~= nil then
			f8_local8, f8_local9, f8_local10, f8_local11 = f8_arg0.gridMask:getLocalRect()
		else
			local f8_local12, f8_local13, f8_local14, f8_local15 = f8_arg0.list:getLocalRect()
			f8_local11 = f8_local15
			f8_local10 = f8_local14
			f8_local9 = f8_local13
			f8_local8 = f8_local12 - f8_local6
			f8_local9 = f8_local9 - f8_local7
		end
		f8_local5.iconHeight = 56
		f8_local5.height = f8_local5.iconHeight * 2
		f8_local5.width = f8_local5.height
		f8_local5.anchorType = CoD.AnchorTypes.TopLeft
		f8_local5.primaryFontHeight = f8_local5.height * 0.08
		f8_local5.primaryTextLeft = 14
		f8_local5.primaryTextRight = -10
		f8_local5.primaryTextTop = 5
		f8_local5.secondaryFontHeight = f8_local5.primaryFontHeight
		f8_local5.secondaryTextRight = -10
		f8_local5.secondaryTextTop = f8_local5.primaryTextTop + f8_local5.primaryFontHeight + 2
		f8_local5.iconCentered = true
		f8_local5.gridProps = {
			elementsPerRow = 3,
			rowHeight = f8_local5.height,
			rows = 4,
			hSpacing = f8_local6,
			vSpacing = f8_local7,
			left = f8_local8,
			top = f8_local9
		}
		f8_local5.extraElemsFuncs = {
			category = function ( f9_arg0 )
				local self = LUI.UIText.new( {
					leftAnchor = true,
					topAnchor = false,
					rightAnchor = false,
					bottomAnchor = true,
					left = f8_local5.primaryTextLeft,
					bottom = -f8_local5.primaryTextTop + 0.5,
					height = f8_local5.secondaryFontHeight,
					width = f8_local5.width,
					font = LUI.CacButton.SecondaryFont.Font,
					alpha = 0.3
				} )
				self:setText( f9_arg0.category )
				return self
			end
		}
	end
	if f8_arg0.grid then
		f8_arg0.grid:closeTree()
		f8_arg0.grid:close()
		f8_arg0.gridMask:close()
		f8_arg0.grid = nil
		f8_arg0.list:closeTree()
		f8_arg0.list:close()
		f8_arg0.list.buttonCount = 0
		f8_arg0.gridMask = nil
	else
		local f8_local6 = f8_local1:getParent()
		f8_local1.buttonCount = 0
		f8_local1:closeTree()
		f8_arg0.list:closeTree()
		f8_arg0.list:close()
		f8_arg0.list.buttonCount = 0
		f8_local6:addElement( f8_local1 )
		ListPaging.Reset( f8_local1 )
		f8_local1.pagingData = nil
	end
	run_gc()
	run_gc()
	local f8_local6 = nil
	local f8_local7 = false
	local f8_local8 = f8_arg6
	if f8_local8 ~= nil then
		if f8_local8 == "Gold" then
			f8_local6 = function ( f10_arg0 )
				if f10_arg0[1] == "none" then
					return true
				else
					local f10_local0 = LUI.InventoryUtils.GetLootGuidForRef( f8_arg1, f10_arg0[1], LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ), f8_arg5 )
					if f10_local0 == "" then
						return true
					else
						return Cac.ItemsForProdLevel( f10_local0, f8_local8 )
					end
				end
			end
			
		else
			f8_local7 = true
			f8_local6 = function ( f11_arg0 )
				if f11_arg0[1] == "none" then
					return true
				else
					local f11_local0 = LUI.InventoryUtils.GetLootGuidForRef( f8_arg1, f11_arg0[1], LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ), f8_arg5 )
					if f11_local0 == "" then
						return false
					else
						return Cac.ItemsForProdLevel( f11_local0, f8_local8 )
					end
				end
			end
			
		end
	elseif f8_arg2 == "furniturekit" or f8_arg2 == "reticle" or f8_arg2 == "weapon_melee" then
		f8_local7 = true
	end
	local f8_local9 = Cac.GetAllDefinedAndValidWeapons( f8_arg1, f8_arg2, LUI.CacStaticLayout.ClassLoc, nil, f8_local6, f8_local4, f8_arg0.parentWeaponID )
	local f8_local10 = {}
	for f8_local14, f8_local15 in pairs( f8_local9 ) do
		local f8_local16 = {
			itemID = f8_local15[1],
			lootData = LUI.InventoryUtils.GetLootDataForRef( f8_arg1, f8_local16.itemID, LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ), f8_arg5 )
		}
		if f8_local16.lootData and Engine.TableLookupGetRowNum( LootTable.File, LootTable.Cols.GUID, f8_local16.lootData.guid ) > -1 then
			f8_local16.unlocked = f8_local16.lootData.lockState == "Unlocked"
		else
			f8_local16.unlocked = Cac.IsClassItemUnlocked( f8_local4, f8_local16.itemID, f8_arg0.parentWeaponID )
		end
		f8_local10[#f8_local10 + 1] = f8_local16
	end
	if f8_local7 then
		f0_local1( f8_local10 )
	end
	f8_local11, f8_local12 = nil
	for f8_local16, f8_local44 in pairs( f8_local10 ) do
		local f8_local45 = f8_local44.itemID
		local f8_local27 = ""
		local f8_local29 = nil
		local f8_local18 = true
		local f8_local31 = nil
		local f8_local21 = false
		local f8_local20 = false
		local f8_local17 = ""
		local f8_local19 = nil
		local f8_local28, f8_local26, f8_local30 = false
		if f8_arg0.parentWeaponID then
			f8_local17 = f8_local17 .. f8_arg0.parentWeaponID .. " "
		end
		f8_local17 = f8_local17 .. f8_local45
		if Cac.InPermanentLockingContext() then
			if f8_local45 == "none" then
				f8_local18 = false
			elseif Cac.SelectingWeaponForAttachmentPermanentUnlock() then
				if f8_local45 ~= "h1_mp44" and f8_local45 ~= "h1_junsho" then
					f8_local18 = true
				else
					f8_local18 = false
				end
			else
				f8_local19 = Cac.GetPrestigeShopChallenge( f8_local17 )
				if f8_local19 == nil or f8_local19 == "" then
					f8_local18 = false
				else
					f8_local18 = true
				end
			end
		else
			f8_local20 = f8_arg3 == f8_local45
			if IsPublicMatch() then
				f8_local21 = LUI.InventoryUtils.GetItemNewStickerState( f8_local4, f8_local17 )
			end
		end
		if f8_local18 then
			local f8_local22 = Cac.GetUnlockItemRef( f8_local45, f8_arg0.parentWeaponID )
			if f8_local22 ~= nil and f8_local22 ~= "" then
				local f8_local23 = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f8_local22, UnlockTable.Cols.Challenge )
				if f8_local23 ~= nil and f8_local23 ~= "" then
					local f8_local24, f8_local25 = ParseChallengeName( f8_local23 )
					f8_local26 = GetChallengeData( f8_local4, f8_local24, false, f8_local25 )
					if f8_local11 ~= nil and f8_local26.NumTiers == 3 then
						f8_local26.lowerUnlockedTierRewardName = f8_local11
					end
					if f8_local26.Completed == false and f8_local26.ActiveTier == 3 then
						f8_local11 = f8_local26.RewardName
					end
					if f8_local26 and f8_local26.Name and f8_local26.Name ~= "" and not f8_local0 and not f8_local44.unlocked then
						f8_local27 = Engine.Localize( "@LUA_MENU_UNLOCK_CHALLENGE_PREFIX", f8_local26.Name )
					end
				end
			end
			if f8_arg0.showUnlocks then
				f8_local19 = Cac.GetPrestigeShopChallenge( f8_local17 )
				if f8_local19 ~= nil and f8_local19 ~= "" then
					if Cac.IsItemPermanentlyUnlocked( f8_local4, Cac.GetPermanentUnlockItemRef( f8_local45, f8_arg0.parentWeaponID ) ) then
						f8_local28 = true
						f8_local27 = Engine.Localize( "@LUA_MENU_PERMANENTLY_UNLOCKED_CAPS" )
						f8_local29 = "h1_ui_icon_unlocked"
					elseif f8_arg0.showUnlocks and f8_arg0.numTokens > 0 then
						f8_local29 = "h1_ui_icon_unlock_token"
					end
				end
			end
			if not f8_local44.unlocked and (f8_local44.lootData == nil or f8_local44.lootData.inventoryItemType == Cac.InventoryItemType.Default) then
				local f8_local23 = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f8_local45, UnlockTable.Cols.Rank )
				if f8_local23 ~= nil and f8_local23 ~= "" then
					f8_local30 = Engine.Localize( "@LUA_MENU_UNLOCKED_AT_RANK", f8_local23 + 1 )
				end
			elseif not Cac.InPermanentLockingContext() and not f8_local28 then
				f8_local29 = nil
			end
			local f8_local23 = Cac.IsClassItemLockedForOverkill( f8_local4, LUI.CacStaticLayout.ClassLoc, f8_arg0.storageCategory, f8_local45 )
			local f8_local24 = Cac.IsClassItemLockedForSmoke( f8_local4, LUI.CacStaticLayout.ClassLoc, f8_arg0.storageCategory, f8_local45 )
			local f8_local25 = false
			if f8_local23.locked or f8_local24.locked then
				f8_local31 = true
				f8_local25 = true
				if f8_local23.reasonText then
					local f8_local32 = f8_local23.reasonText
				end
				f8_local27 = f8_local32 or f8_local24.reasonText
			else
				f8_local31 = not f8_local44.unlocked
			end
			local f8_local33 = LUI.CacDetails.OnButtonActionGeneral
			local f8_local34 = false
			if Cac.InPermanentLockingContext() then
				if (f8_local28 or f8_arg0.numTokens == 0) and not Cac.SelectingWeaponForAttachmentPermanentUnlock() then
					f8_local33 = nil
				else
					f8_local33 = LUI.CacDetails.OnButtonActionUnlocks
				end
			end
			local f8_local35 = nil
			if Engine.IsDepotEnabled() and f8_local44.lootData ~= nil then
				f8_local35 = f8_local44.lootData.lootRarity
			end
			f8_local5.iconLeftOffset = nil
			f8_local5.iconTopOffset = nil
			f8_local5.iconHeight = 56
			f8_local5.iconName = nil
			f8_local5.customIcon = nil
			f8_local5.actionFunc = function ( f12_arg0, f12_arg1 )
				LUI.MPDepotHelp.OnAction( f12_arg0, f12_arg1, f8_arg0, f8_local44.lootData )
			end
			
			f8_local5.primaryText = Cac.GetWeaponName( f8_arg1, f8_local45 )
			f8_local5.secondaryText = f8_local27
			f8_local5.iconName = Cac.GetWeaponImageName( f8_arg1, f8_local45 )
			f8_local5.locked = f8_local31
			f8_local5.equipped = f8_local20
			local f8_local36
			if f8_local21 then
				f8_local36 = LUI.NewSticker.WithText
				if not f8_local36 then
				
				else
					f8_local5.newMode = f8_local36
					f8_local5.secondaryImage = f8_local29
					f8_local5.extraImagePadding = f8_local2
					f8_local36 = Cac.GetUnrestrictedState( f8_arg1, f8_local45 )
					if not f8_local36 then
						if f8_local45 ~= "none" and f8_local2 ~= true then
							f8_local36 = false
						else
							f8_local36 = true
						end
					end
					f8_local5.unrestricted = f8_local36
					f8_local5.rarity = f8_local35
					f8_local5.extraElems = {}
					f8_local36 = nil
					if f8_local5.gridProps and f8_local44.lootData then
						f8_local36 = CreateExtraImage( f8_local5.iconHeight, f8_local5.iconHeight, f8_local44.lootData.image )
					end
					local f8_local37 = nil
					local f8_local38 = 0
					if not f8_local44.unlocked and f8_local44.lootData ~= nil then
						if IsContentPromoUnlocked( f8_local44.lootData.contentPromo ) then
							if Cac.IsRewardType( f8_local44.lootData.inventoryItemType ) then
								if Cac.LootDropRewardImages[f8_local44.lootData.guid] and Cac.LootDropRewardImages[f8_local44.lootData.guid].complete and Cac.LootDropRewardImages[f8_local44.lootData.guid].isOwned == true then
									f8_local5.iconName = Cac.LootDropRewardImages[f8_local44.lootData.guid].complete
								else
									f8_local5.iconName = "collection_reward_locked"
								end
								f8_local5.locked = nil
							elseif Cac.IsCraftableType( f8_local44.lootData.inventoryItemType ) then
								f8_local37 = f8_local44.lootData.price
								if f8_local5.iconCentered then
									f8_local5.iconTopOffset = -20
									f8_local38 = 15
								else
									f8_local5.iconLeftOffset = -46
									f8_local5.iconTopOffset = 16
									local f8_local39 = 1000
									while f8_local39 - 1 < f8_local37 do
										f8_local5.iconLeftOffset = f8_local5.iconLeftOffset - 8
										f8_local39 = f8_local39 * 10
									end
								end
								f8_local5.iconHeight = 28
								f8_local5.iconName = GetCurrencyImage( InventoryCurrencyType.Parts )
								f8_local5.secondaryImage = nil
								f8_local5.locked = nil
							end
						end
						if f8_local36 ~= nil then
							if f8_local3 then
								f8_local36.image:registerAnimationState( "scaledBack", {
									color = {
										r = 0.25,
										g = 0.25,
										b = 0.25
									}
								} )
								f8_local36.image:animateToState( "scaledBack" )
							else
								f8_local36:registerAnimationState( "scaledBack", {
									alpha = 0.15
								} )
								f8_local36:animateToState( "scaledBack" )
							end
						end
					end
					if f8_local5.extraElemsFuncs and f8_local44.lootData ~= nil then
						for f8_local42, f8_local43 in pairs( f8_local5.extraElemsFuncs ) do
							f8_local5.extraElems[#f8_local5.extraElems + 1] = f8_local43( {
								category = f8_local44.lootData.category
							} )
						end
					end
					f8_local5.externalElement = f8_local36
					f8_local12 = LUI.CacBase.AddCacButton( f8_arg0, f8_local5 )
					f8_local5.externalElement = nil
					if f8_local37 then
						LUI.MPDepotBase.AddInfoToButton( f8_arg0, f8_local12, f8_local37, true, nil, f8_local5.iconCentered and LUI.Alignment.Center or LUI.Alignment.Right, f8_local38 )
					end
					f8_local12:addEventHandler( "button_over", LUI.CacDetails.OnButtonFocus )
					f8_local12:addEventHandler( "button_over_disable", LUI.CacDetails.OnButtonFocus )
					f8_local12.itemID = f8_local45
					f8_local12.listDefaultFocus = f8_local20
					f8_local12.challengeData = f8_local26
					f8_local12.rankUnlockStr = f8_local30
					f8_local12.unlocked = f8_local44.unlocked
					f8_local12.lootData = f8_local44.lootData
					f8_local12.passThruFunc = f8_local33
					if f8_local44.lootData ~= nil and f8_local44.lootData.loot_type == ItemTypes.Reticle then
						f8_local12.reticlePreviewIconName = f8_local44.lootData.image
					elseif f8_arg2 == "reticle" then
						f8_local12.reticlePreviewIconName = RegisterMaterial( f8_local5.iconName )
					end
					if f8_local33 == nil then
						f8_local12.actionSFX = f8_local12.disabledSFX
					end
					if f8_arg0.showUnlocks == true and not f8_local25 and (f8_arg0.numTokens > 0 or Cac.InPermanentLockingContext() and Cac.SelectingWeaponForAttachmentPermanentUnlock()) then
						f8_local12.properties = {}
						f8_local12.properties.allowDisabledAction = true
						f8_local12.disabledSFX = CoD.SFX.MouseClick
						f8_local12:registerEventHandler( "button_action_disable", LUI.CacDetails.OnButtonActionUnlocks )
					end
					if Cac.InPermanentLockingContext() and f8_arg0.numTokens > 0 and not f8_local28 and not Cac.SelectingWeaponForAttachmentPermanentUnlock() then
						f8_local12:clearActionSFX()
						f8_local12.disabledSFX = nil
					end
				end
			end
			f8_local36 = nil
		end
	end
	if f8_arg0.grid then
		f8_local13, f8_local14, f8_local15, f8_local16 = f8_arg0.gridMask:getLocalRect()
		ListPaging.InitGrid( f8_arg0.grid, 4, 10, false, f8_arg0, {
			enabled = f8_arg0.list:getNumChildren() > 4,
			scrollState = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				top = f8_local16,
				left = f8_local13 + (f8_local15 - f8_local13) / 2 - LUI.UIScrollIndicator.DefaultWidth / 2 - LUI.UIScrollIndicator.GetMaxTextWidth( f8_arg0.list.buttonCount, LUI.UIScrollIndicator.DefaultFont ) / 2 + LUI.UIScrollIndicator.DefaultHeight / 2,
				width = f8_local15 - f8_local13,
				height = LUI.UIScrollIndicator.DefaultHeight
			}
		}, nil )
		if not LUI.FlowManager.IsTopMenuModal() then
			f8_arg0.grid:processEvent( {
				name = "gain_focus",
				controller = f8_arg0.controller
			} )
		end
		if not f8_arg0.tabManager then
			f8_arg0:AddListDivider( nil, f8_local13 + f8_local5.gridProps.hSpacing, f8_local14, f8_local15 - f8_local5.gridProps.hSpacing, f8_local16 )
		end
	else
		ListPaging.InitList( f8_arg0.list, 7, 10, false, false, {
			enabled = false
		}, nil )
		if not LUI.FlowManager.IsTopMenuModal() then
			f8_arg0.list:processEvent( {
				name = "gain_focus",
				controller = f8_arg0.controller
			} )
		end
		f8_arg0:CreateBottomDivider()
		f8_arg0:AddBottomDividerToList( f8_local12 )
	end
end

LUI.CacDetails.MakeLockOverlay = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5 )
	if f13_arg1 == nil then
		f13_arg1 = 400
	end
	if f13_arg2 == nil then
		f13_arg2 = 0.7
	end
	if f13_arg3 == nil then
		f13_arg3 = {
			topAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 153,
			left = 60,
			right = -60
		}
	end
	if f13_arg4 == nil then
		f13_arg4 = {
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			bottom = -151,
			left = 60,
			right = -60
		}
	end
	local self = LUI.UIElement.new( f13_arg0 )
	local f13_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f13_local1.width = f13_arg1
	f13_local1.height = f13_arg1
	f13_local1.material = RegisterMaterial( "h1_deco_locked_3d_overlay" )
	f13_local1.alpha = f13_arg2
	self:addElement( LUI.UIImage.new( f13_local1 ) )
	local f13_local2 = LUI.Divider.new( f13_arg3, 10, LUI.Divider.Grey )
	local f13_local3 = LUI.Divider.new( f13_arg4, 10, LUI.Divider.Grey )
	if not f13_arg5 then
		self:addElement( f13_local2 )
		self:addElement( f13_local3 )
	end
	local f13_local4 = CoD.CreateState( -10, -11, nil, nil, CoD.AnchorTypes.None )
	f13_local4.width = 20
	f13_local4.height = 20
	f13_local4.material = RegisterMaterial( "s1_icon_locked_full" )
	local self = LUI.UIImage.new( f13_local4 )
	self:addElement( self )
	if f13_arg5 then
		self:addElement( f13_local2 )
		self:addElement( f13_local3 )
	end
	self:hide()
	return self
end

LUI.CacDetails.new = function ( f14_arg0, f14_arg1 )
	local f14_local0 = nil
	if f14_arg1.weaponType ~= "reticle" then
		f14_local0 = PersistentBackground.Variants.VirtualLobby
	end
	local f14_local1 = LUI.CacBase.new( f14_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( f14_arg1.menuTitle ) ),
		menu_width = CoD.DesignGridHelper( 7, 1 ),
		menu_top_indent = 20,
		persistentBackground = f14_local0
	} )
	f14_local1:SetBreadCrumb( Engine.Localize( "@LUA_MENU_CREATE_A_CLASS_CAPS" ) )
	f14_local1:setClass( LUI.CacDetails )
	f14_local1.storageCategory = f14_arg1.storageCategory
	f14_local1.weaponType = f14_arg1.weaponType
	f14_local1.parentCategory = f14_arg1.parentCategory
	f14_local1.overrideStorageCategory = f14_arg1.overrideStorageCategory
	f14_local1.statsPrefix = f14_arg1.statsPrefix
	f14_local1.attributesDelta = f14_arg1.attributesDelta
	f14_local1.optionsForVL = f14_arg1.optionsForVL
	f14_local1.parentWeaponID = f14_arg1.parentWeaponID
	f14_local1.menuToRestore = f14_arg0.type
	f14_local1.showUnlocks = IsPublicMatch() and f14_arg1.showUnlocks or false
	local f14_local2 = 0
	local f14_local3 = f14_local1.overrideStorageCategory or f14_local1.storageCategory
	if f14_local3 == "Primary_Camo" or f14_local3 == "Secondary_Camo" or f14_local3 == "Primary_Reticle" or f14_local3 == "Secondary_Reticle" then
		f14_local2 = 30
	end
	local f14_local4 = LUI.ItemDescriptionWidget.new( {
		topAnchor = true,
		leftAnchor = true,
		top = LUI.CacDetails.TitleBoxTop,
		left = LUI.CacDetails.TitleBoxLeft + f14_local2
	} )
	f14_local1.itemDescriptionWidget = f14_local4
	f14_local1:addElement( f14_local4 )
	if f14_arg1.storageCategory == "Perk_Slot1" then
		f14_local4:ColorForPerks( LUI.CacDetails.PerksBlue )
	elseif f14_arg1.storageCategory == "Perk_Slot2" then
		f14_local4:ColorForPerks( LUI.CacDetails.PerksRed )
	elseif f14_arg1.storageCategory == "Perk_Slot3" then
		f14_local4:ColorForPerks( LUI.CacDetails.PerksYellow )
	end
	if Cac.InPermanentLockingContext() then
		f14_local1:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCKS" ) ) )
	end
	if f14_local1.parentCategory ~= nil and f14_local1.parentWeaponID == nil then
		f14_local1.parentWeaponID = Cac.GetEquippedWeapon( f14_local1.parentCategory, 0, LUI.CacStaticLayout.ClassLoc )
	end
	local f14_local5 = Cac.GetEquippedWeapon( f14_local1.storageCategory, 0, LUI.CacStaticLayout.ClassLoc )
	if f14_arg1.exclusiveController ~= nil then
		f14_local1.numTokens = Cac.GetPrestigeTokens( f14_arg1.exclusiveController )
	end
	local f14_local6 = CoD.CreateState( 420, 175, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local6.height = 400
	f14_local6.width = 533
	f14_local6.alpha = 0
	f14_local6.material = RegisterMaterial( "cinematic" )
	local self = LUI.UIImage.new( f14_local6 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerOmnvarHandler( "ui_cac_weapon_loading", function ( f15_arg0, f15_arg1 )
		if f15_arg1.value == true then
			Engine.PlayMenuVideo( "h1_ui_weapon_load_fx", 1 )
			f15_arg0:animateToState( "visible", 0 )
		else
			if Engine.IsVideoPlaying( LUI.CacDetails.LoadingVideo ) then
				Engine.StopMenuVideo()
			end
			f15_arg0:animateToState( "hidden", 0 )
		end
	end )
	f14_local1:addElement( LUI.MPDepotHelp.new( f14_local1, {
		actionAndCollectionHelpOnly = true
	} ) )
	f14_local1:addElement( self )
	f14_local1:AddBackButton( function ( f16_arg0, f16_arg1 )
		if Engine.IsVideoPlaying( LUI.CacDetails.LoadingVideo ) then
			Engine.StopMenuVideo()
		end
		LUI.FlowManager.RequestLeaveMenu( f16_arg0 )
	end )
	if f14_arg1.showAttributes then
		local f14_local8, itemModelLockOverlay = nil
		if Cac.InPermanentLockingContext() then
			if Cac.SelectingAttachmentPermanentUnlock() then
				local f14_local10 = f14_local1.parentWeaponID
			end
			itemModelLockOverlay = f14_local10 or nil
		else
			if f14_local1.parentWeaponID then
				local f14_local11 = f14_local1.parentWeaponID
			end
			itemModelLockOverlay = f14_local11 or f14_local5
		end
		local itemLockReasonLabel = nil
		if itemModelLockOverlay then
			itemLockReasonLabel = {
				accuracy = Cac.GetWeaponAccuracy( itemModelLockOverlay ),
				damage = Cac.GetWeaponDamage( itemModelLockOverlay ),
				range = Cac.GetWeaponRange( itemModelLockOverlay ),
				fireRate = Cac.GetWeaponFireRate( itemModelLockOverlay ),
				mobility = Cac.GetWeaponMobility( itemModelLockOverlay )
			}
		end
		f14_local8 = LUI.CacWeaponAttributes.new( itemLockReasonLabel, f14_local2 )
		f14_local1.attributes = f14_local8
		f14_local1:addElement( f14_local8 )
	end
	f14_local1.weaponNameBackgroundBox = weaponNameBackgroundBox
	if f14_arg1 and f14_arg1.weaponType ~= "reticle" then
		f14_local1:AddRotateHelp()
	end
	if (f14_local1.numTokens > 0 or Cac.InPermanentLockingContext()) and f14_local1.showUnlocks == true then
		local f14_local8 = CoD.TextSettings.Font21
		local itemModelLockOverlay = CoD.CreateState( 0, 32, 0, nil, CoD.AnchorTypes.TopLeftRight )
		itemModelLockOverlay.alignment = LUI.Alignment.Right
		itemModelLockOverlay.height = f14_local8.Height
		itemModelLockOverlay.font = f14_local8.Font
		itemModelLockOverlay.color = Colors.h1.light_grey
		itemModelLockOverlay.alpha = 0.4
		local itemLockReasonLabel = nil
		if f14_local1.numTokens > 1 or f14_local1.numTokens == 0 then
			itemLockReasonLabel = Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCK_COUNT", f14_local1.numTokens )
		else
			itemLockReasonLabel = Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCK_COUNT_SINGLE" )
		end
		local reticlePreviewElement = LUI.UIText.new( itemModelLockOverlay )
		reticlePreviewElement:setText( itemLockReasonLabel )
		f14_local1:addElement( reticlePreviewElement )
		local f14_local14, f14_local15, f14_local16, f14_local17 = GetTextDimensions( itemLockReasonLabel, f14_local8.Font, f14_local8.Height )
		local f14_local18 = 20
		local f14_local19 = CoD.CreateState( nil, 28, 0 - f14_local16 - 10, nil, CoD.AnchorTypes.TopRight )
		f14_local19.width = f14_local18
		f14_local19.height = f14_local18
		f14_local19.material = RegisterMaterial( "h1_ui_icon_unlock_token" )
		f14_local1:addElement( LUI.UIImage.new( f14_local19 ) )
	end
	if f14_arg1.weaponType == nil and not Cac.InPermanentLockingContext() then
		f14_arg1.weaponType = Cac.GetWeaponTypeFromWeapon( f14_local1.overrideStorageCategory or f14_arg1.storageCategory, f14_local5 )
	end
	if f14_arg1.weaponType == ItemTypes.Reticle then
		local f14_local8 = CoD.CreateState( -247, -185, nil, nil, CoD.AnchorTypes.None )
		f14_local8.width = 788.14
		f14_local8.height = 420
		f14_local8.material = RegisterMaterial( "h1_reticles_previewscene" )
		f14_local1:addElement( LUI.UIImage.new( f14_local8 ) )
		local itemLockReasonLabel = CoD.CreateState( 147, -61.5, nil, nil, CoD.AnchorTypes.None )
		itemLockReasonLabel.width = 60
		itemLockReasonLabel.height = 60
		
		local reticlePreviewElement = LUI.UIImage.new( itemLockReasonLabel )
		f14_local1:addElement( reticlePreviewElement )
		f14_local1.reticlePreviewElement = reticlePreviewElement
		
		f14_local1.reticlePreviewElement:hide()
	end
	local itemModelLockOverlay = LUI.CacDetails.MakeLockOverlay( CoD.CreateState( 530, 122, 970, 562, CoD.AnchorTypes.TopLeft ) )
	f14_local1:addElement( itemModelLockOverlay )
	f14_local1.itemModelLockOverlay = itemModelLockOverlay
	
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
	f14_local1.itemLockReasonLabel = itemLockReasonLabel
	
	f14_local1:AddCurrencyInfoPanel()
	if not (not f14_arg1.subCategories or #f14_arg1.subCategories <= 0) or f14_arg1.cacLootTabs and #f14_arg1.cacLootTabs > 0 then
		f0_local0( f14_local1, f14_arg1.subCategories and #f14_arg1.subCategories or #f14_arg1.cacLootTabs )
		local f14_local14 = false
		local f14_local15 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local1 )
		if f14_local15 and f14_local15.tabIndex then
			f14_local1.tabManager.tabSelected = f14_local15.tabIndex
			f14_local14 = true
		end
		if f14_arg1.subCategories and #f14_arg1.subCategories > 0 then
			for f14_local16 = 1, #f14_arg1.subCategories, 1 do
				local f14_local19 = f14_local16
				local f14_local20 = false
				if IsPublicMatch() then
					f14_local20 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f14_arg1.subCategories[f14_local19].weaponCategory )
				end
				f14_local1.tabManager:addTab( Cac.GetSelectedControllerIndex(), Engine.Localize( f14_arg1.subCategories[f14_local19].name ), function ( f17_arg0, f17_arg1 )
					local f17_local0 = f14_local1
					local f17_local1 = f17_local0
					f17_local0 = f17_local0.PopulateList
					local f17_local2 = f14_local1.overrideStorageCategory
					if not f17_local2 then
						f17_local2 = f14_local1.storageCategory
					end
					f17_local0( f17_local1, f17_local2, f14_arg1.subCategories[f14_local19].weaponCategory, f14_local5, true, f14_local1.parentCategory )
					f17_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local1 )
					if f17_local0 then
						f17_local0.tabIndex = f14_local19
					end
				end, nil, nil, nil, nil, f14_local20 )
				if not f14_local14 and f14_arg1.subCategories[f14_local19].weaponCategory == f14_arg1.weaponType then
					f14_local1.tabManager.tabSelected = f14_local19
				end
			end
		else
			local f14_local16 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.ExternalRef, f14_local5, StatsTable.Cols.ProdLevel )
			local f14_local17 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.ExternalRef, f14_local5, StatsTable.Cols.ContentPromo )
			if f14_local17 ~= nil and f14_local17 ~= "0" and f14_local17 ~= "" then
				f14_local16 = f14_local16 .. ":" .. f14_local17
			end
			for f14_local18 = 1, #f14_arg1.cacLootTabs, 1 do
				local f14_local21 = f14_local18
				f14_local1.tabManager:addTab( Cac.GetSelectedControllerIndex(), Engine.Localize( f14_arg1.cacLootTabs[f14_local21].name ), function ( f18_arg0, f18_arg1 )
					local f18_local0 = f14_local1
					local f18_local1 = f18_local0
					f18_local0 = f18_local0.PopulateList
					local f18_local2 = f14_local1.overrideStorageCategory
					if not f18_local2 then
						f18_local2 = f14_arg1.storageCategory
					end
					f18_local0( f18_local1, f18_local2, f14_arg1.weaponType, f14_local5, nil, f14_local1.parentCategory, f14_arg1.cacLootTabs[f14_local21].category )
					f18_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local1 )
					if f18_local0 then
						f18_local0.tabIndex = f14_local21
					end
				end, nil, nil, nil, nil, false )
				if not f14_local14 then
					if f14_local5 then
						local f14_local22 = LUI.MPLootDropsBase.GetLootDropListFromString( f14_arg1.cacLootTabs[f14_local21].category )
						for f14_local23 = 1, #f14_local22, 1 do
							if f14_local22[f14_local23] == f14_local16 then
								f14_local1.tabManager.tabSelected = f14_local21
								f14_local14 = true
							end
						end
					else
						f14_local1.tabManager.tabSelected = 1
						f14_local14 = true
					end
				end
			end
		end
		f14_local1.tabManager:refreshTab( Cac.GetSelectedControllerIndex() )
	else
		f14_local1:PopulateList( f14_local1.overrideStorageCategory or f14_arg1.storageCategory, f14_arg1.weaponType, f14_local5, nil, f14_local1.parentCategory )
	end
	f14_local1:registerEventHandler( "on_crafted_item", function ( element, event )
		if event.success == true then
			if f14_arg1.subCategories and #f14_arg1.subCategories > 0 then
				local f19_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local1 )
				local f19_local1 = f14_local1
				local f19_local2 = f19_local1
				f19_local1 = f19_local1.PopulateList
				local f19_local3 = f14_local1.overrideStorageCategory
				if not f19_local3 then
					f19_local3 = f14_local1.storageCategory
				end
				f19_local1( f19_local2, f19_local3, f14_arg1.subCategories[f19_local0.tabIndex].weaponCategory, f14_local5, true, f14_local1.parentCategory )
			elseif f14_arg1.cacLootTabs and #f14_arg1.cacLootTabs > 0 then
				local f19_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_local1 )
				local f19_local1 = f14_local1
				local f19_local2 = f19_local1
				f19_local1 = f19_local1.PopulateList
				local f19_local3 = f14_local1.overrideStorageCategory
				if not f19_local3 then
					f19_local3 = f14_arg1.storageCategory
				end
				f19_local1( f19_local2, f19_local3, f14_arg1.weaponType, f14_local5, nil, f14_local1.parentCategory, f14_arg1.cacLootTabs[f19_local0.tabIndex].category )
			else
				local f19_local0 = f14_local1
				local f19_local1 = f19_local0
				f19_local0 = f19_local0.PopulateList
				local f19_local2 = f14_local1.overrideStorageCategory
				if not f19_local2 then
					f19_local2 = f14_arg1.storageCategory
				end
				f19_local0( f19_local1, f19_local2, f14_arg1.weaponType, nil, nil, f14_local1.parentCategory )
			end
			element:dispatchEventToChildren( event )
		end
	end )
	return f14_local1
end

LUI.MenuBuilder.registerType( "CacDetails", LUI.CacDetails.new )
VLobby.InitMenuMode( "CacDetails", VirtualLobbyModes.LUI_MODE_CAC_WEAP )
LUI.MenuBuilder.registerType( "CacDetailsPermanentUnlocks", LUI.CacDetails.new )
VLobby.InitMenuMode( "CacDetailsPermanentUnlocks", VirtualLobbyModes.LUI_MODE_CAC_WEAP, PersistentBackground.FadeFromBlackFast, nil )
LUI.MenuBuilder.registerType( "CacDetailsPermanentUnlocksWeaponForAttachments", LUI.CacDetails.new )
VLobby.InitMenuMode( "CacDetailsPermanentUnlocksWeaponForAttachments", VirtualLobbyModes.LUI_MODE_CAC_WEAP, PersistentBackground.FadeFromBlackFast, nil )
LUI.MenuBuilder.registerType( "CacDetailsPermanentUnlocksAttachments", LUI.CacDetails.new )
VLobby.InitMenuMode( "CacDetailsPermanentUnlocksAttachments", VirtualLobbyModes.LUI_MODE_CAC_WEAP )
LockTable( _M )
