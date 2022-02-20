local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	{
		name = "@LUA_MENU_ASSAULT_RIFLES_CAPS",
		weaponCategory = "weapon_assault"
	},
	{
		name = "@LUA_MENU_SMGS_CAPS",
		weaponCategory = "weapon_smg"
	},
	{
		name = "@LUA_MENU_SNIPER_RIFLES_CAPS",
		weaponCategory = "weapon_sniper"
	},
	{
		name = "@LUA_MENU_SHOTGUNS_CAPS",
		weaponCategory = "weapon_shotgun"
	},
	{
		name = "@LUA_MENU_LMGS_CAPS",
		weaponCategory = "weapon_heavy"
	}
}
f0_local1 = {
	{
		category = "LootDrop5|LootDrop6",
		name = "@DEPOT_SEASON_3"
	},
	{
		category = "LootDrop5:2",
		name = "@DEPOT_PROMO_2"
	},
	{
		category = "LootDrop3|LootDrop4",
		name = "@DEPOT_SEASON_2"
	},
	{
		category = "LootDrop3:1",
		name = "@DEPOT_PROMO_1"
	},
	{
		category = "LootDrop1|LootDrop2",
		name = "@DEPOT_SEASON_1"
	}
}
f0_local2 = {
	{
		category = "Gold",
		name = "@MENU_CLASSIC"
	},
	{
		category = "LootDrop5|LootDrop6",
		name = "@DEPOT_SEASON_3"
	},
	{
		category = "LootDrop5:2",
		name = "@DEPOT_PROMO_2"
	},
	{
		category = "LootDrop3|LootDrop4",
		name = "@DEPOT_SEASON_2"
	},
	{
		category = "LootDrop3:1",
		name = "@DEPOT_PROMO_1"
	},
	{
		category = "LootDrop1|LootDrop2",
		name = "@DEPOT_SEASON_1"
	}
}
local f0_local3 = function ( f1_arg0, f1_arg1, f1_arg2 )
	LUI.FlowManager.RequestAddMenu( nil, "CacDetails", true, Cac.GetSelectedControllerIndex(), nil, {
		storageCategory = f1_arg0.storageCategory,
		weaponType = f1_arg0.weaponCategory,
		parentCategory = f1_arg0.parentCategory,
		overrideStorageCategory = f1_arg2,
		menuTitle = f1_arg0.name,
		showAttributes = f1_arg0.showAttributes,
		subCategories = f1_arg0.subCategories,
		statsPrefix = f1_arg0.statsPrefix,
		attributesDelta = f1_arg0.attributesDelta,
		optionsForVL = f1_arg0.optionsForVL,
		showUnlocks = f1_arg0.showUnlocks,
		cacLootTabs = f1_arg0.cacLootTabs
	} )
end

local f0_local4 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Cac.GetPrimaryCategoryIfOverkill( f2_arg0.storageCategory, f2_arg0, f0_local0 )
	if f2_arg0.storageCategory ~= f2_local0 then
		f0_local3( f2_arg0, f2_arg1, f2_local0 )
	else
		f0_local3( f2_arg0, f2_arg1 )
	end
end

local f0_local5 = function ( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
end

local f0_local6 = function ()
	return Cac.HasOverkill() and "@MENU_SECONDARY_CAPS" or "@MPUI_SIDE_ARM"
end

local f0_local7 = function ( f5_arg0, f5_arg1 )
	if not Engine.IsDepotEnabled() then
		return false
	elseif Cac.GetWeaponTypeFromWeapon( Cac.GetPrimaryCategoryIfOverkill( f5_arg0, nil, f0_local0 ), Cac.GetEquippedWeapon( f5_arg0, 0, LUI.CacStaticLayout.ClassLoc ) ) == "weapon_sniper" then
		return true
	else
		return Cac.DoesAttachKitAllowReticles( Cac.GetEquippedWeapon( f5_arg1, 0, LUI.CacStaticLayout.ClassLoc ) )
	end
end

local f0_local8 = {
	{
		name = "@MENU_PRIMARY_CAPS",
		storageCategory = "Primary",
		actionFunc = f0_local3,
		options = {
			{
				name = "@LUA_MENU_ATTACHMENT_CAPS",
				storageCategory = "Primary_AttachKit",
				weaponCategory = "attachkit",
				showAttributes = true,
				statsPrefix = "ak_",
				attributesDelta = true,
				showUnlocks = true
			},
			{
				name = "@MENU_CAMO_SHORT_CAPS",
				storageCategory = "Primary_Camo",
				weaponCategory = "camo",
				showUnlocks = false,
				cacLootTabs = f0_local2
			},
			{
				name = "@LUA_MENU_WEAPON_KIT",
				storageCategory = "Primary_FurnitureKit",
				weaponCategory = "furniturekit",
				visibleFunc = Engine.IsDepotEnabled
			},
			{
				name = "@MENU_RETICLE_CAPS",
				storageCategory = "Primary_Reticle",
				weaponCategory = "reticle",
				cacLootTabs = f0_local1,
				visibleFunc = function ()
					return f0_local7( "Primary", "Primary_AttachKit" )
				end
			}
		},
		showAttributes = true,
		subCategories = f0_local0,
		showUnlocks = true
	},
	{
		name = f0_local6,
		storageCategory = "Secondary",
		actionFunc = f0_local4,
		options = {
			{
				name = "@LUA_MENU_ATTACHMENT_CAPS",
				storageCategory = "Secondary_AttachKit",
				weaponCategory = "attachkit",
				actionFunc = f0_local4,
				showAttributes = true,
				statsPrefix = "ak_",
				attributesDelta = true,
				showUnlocks = true
			},
			{
				name = "@MENU_CAMO_SHORT_CAPS",
				storageCategory = "Secondary_Camo",
				weaponCategory = "camo",
				actionFunc = f0_local4,
				showUnlocks = false,
				cacLootTabs = f0_local2
			},
			{
				name = "@LUA_MENU_WEAPON_KIT",
				storageCategory = "Secondary_FurnitureKit",
				weaponCategory = "furniturekit",
				actionFunc = f0_local4,
				visibleFunc = Engine.IsDepotEnabled
			},
			{
				name = "@MENU_RETICLE_CAPS",
				storageCategory = "Secondary_Reticle",
				weaponCategory = "reticle",
				cacLootTabs = f0_local1,
				actionFunc = f0_local4,
				visibleFunc = function ()
					return f0_local7( "Secondary", "Secondary_AttachKit" )
				end
			}
		},
		showAttributes = true,
		showUnlocks = true
	},
	{
		name = "@LUA_MENU_TACTICAL_CAPS",
		storageCategory = "Tactical",
		weaponCategory = "equipment_tactical"
	},
	{
		name = "@MENU_PERK1_CAPS",
		storageCategory = "Perk_Slot1",
		weaponCategory = "perk",
		disabledFunc = Cac.GetPerk1Names,
		showUnlocks = true,
		isPerk1 = true
	},
	{
		name = "@MENU_PERK2_CAPS",
		storageCategory = "Perk_Slot2",
		weaponCategory = "perk",
		showUnlocks = true
	},
	{
		name = "@MENU_PERK3_CAPS",
		storageCategory = "Perk_Slot3",
		weaponCategory = "perk",
		showUnlocks = true
	},
	{
		name = "@MENU_MELEE_CAPS",
		storageCategory = "Melee",
		weaponCategory = "weapon_melee",
		showUnlocks = true,
		visibleFunc = Engine.IsDepotEnabled
	}
}
local f0_local9 = function ( f8_arg0 )
	if type( f8_arg0 ) == "function" then
		return f8_arg0()
	else
		return f8_arg0
	end
end

function ShowOpenList( f9_arg0, f9_arg1 )
	f9_arg0.openList = f9_arg1
	local f9_local0 = f9_arg1:getFirstChild()
	while f9_local0 ~= nil do
		if f9_local0.SetVisible then
			f9_local0:SetVisible( true, true )
		end
		f9_local0 = f9_local0:getNextSibling()
	end
end

function HideOpenList( f10_arg0 )
	if f10_arg0.openList ~= nil then
		local f10_local0 = f10_arg0.openList:getFirstChild()
		while f10_local0 ~= nil do
			if f10_local0.SetVisible then
				f10_local0:SetVisible( false )
			end
			f10_local0 = f10_local0:getNextSibling()
		end
		f10_arg0.openList:clearSavedState()
		f10_arg0.openList = nil
	end
end

function OnOptionsListRestoreFocus( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = LUI.UIElement.restoreFocus( f11_arg0, f11_arg1 )
	if f11_local0 then
		ShowOpenList( f11_arg2, f11_arg0 )
	end
	return f11_local0
end

function OnButtonGainFocus( f12_arg0, f12_arg1, f12_arg2 )
	HideOpenList( f12_arg2 )
	LUI.UIButton.gainFocus( f12_arg0, f12_arg1 )
	Cac.NotifyVirtualLobby( "weapon_highlighted", "" .. Cac.GetSelectedControllerIndex() .. "_" .. Cac.GetVLOptionsString( f12_arg0.storageCategory, f12_arg0.weaponRef ) )
end

function OnHorizontalListGainFocus( f13_arg0, f13_arg1, f13_arg2 )
	if f13_arg2.openList == f13_arg0 then
		return 
	else
		HideOpenList( f13_arg2 )
		ShowOpenList( f13_arg2, f13_arg0 )
	end
end

function OnWeaponButtonGainFocus( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	LUI.UIButton.gainFocus( f14_arg2 or f14_arg0, f14_arg1 )
	local f14_local0 = "" .. Cac.GetSelectedControllerIndex() .. "_"
	for f14_local1 = 1, #f14_arg0.optionsForVL, 1 do
		f14_local0 = f14_local0 .. Cac.GetVLOptionsString( f14_arg0.optionsForVL[f14_local1].optionStorageCategory, f14_arg0.optionsForVL[f14_local1].optionWeaponRef ) .. "_"
	end
	Cac.NotifyVirtualLobby( "weapon_highlighted", f14_local0 )
	OnHorizontalListGainFocus( f14_arg0:getParent(), f14_arg1, f14_arg3 )
	if not f14_arg2 then
		f14_arg0.menu:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = ""
		} )
	end
end

function ClearWeaponAccessory( f15_arg0 )
	Engine.PlaySound( CoD.SFX.ButtonX )
	local f15_local0 = nil
	if string.find( f15_arg0.storageCategory, "Primary" ) then
		f15_local0 = "Primary"
	else
		f15_local0 = "Secondary"
	end
	local f15_local1 = Cac.GetWeaponTypeFromWeaponWithoutCategory( Cac.GetEquippedWeapon( f15_local0, 0, LUI.CacStaticLayout.ClassLoc ) ) == "weapon_sniper"
	local f15_local2 = Cac.Perk1Disabled()
	local f15_local3 = Cac.GetEquippedWeapon( f15_arg0.storageCategory, 0, LUI.CacStaticLayout.ClassLoc )
	Cac.OverrideClearReticle = f15_local1
	Cac.ClearEquippedWeapon( f15_arg0.storageCategory, 0, LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ) )
	local f15_local4 = Cac.GetEquippedWeapon( f15_arg0.storageCategory, 0, LUI.CacStaticLayout.ClassLoc )
	if f15_local3 ~= f15_local4 then
		f15_arg0:Refresh( Cac.GetWeaponImageName( f15_arg0.storageCategory, f15_local4 ) )
		for f15_local5 = 1, #f15_arg0.optionsForVL, 1 do
			if f15_arg0.optionsForVL[f15_local5].optionWeaponRef == f15_local3 and f15_arg0.optionsForVL[f15_local5].optionStorageCategory == f15_arg0.storageCategory then
				f15_arg0.optionsForVL[f15_local5].optionWeaponRef = f15_local4
				break
			end
		end
		if string.find( f15_arg0.storageCategory, "_AttachKit" ) ~= nil then
			for f15_local5 = 1, #f15_arg0.optionsForVL, 1 do
				if string.find( f15_arg0.optionsForVL[f15_local5].optionStorageCategory, "_Reticle" ) ~= nil and not f15_local1 then
					table.remove( f15_arg0.optionsForVL, f15_local5 )
					break
				end
			end
			if not f15_local1 then
				local f15_local5 = f15_arg0:getParent()
				if f15_local5 ~= nil then
					local f15_local6 = f15_local5:getFirstChild()
					while f15_local6 ~= nil do
						if string.find( f15_local6.storageCategory, "_Reticle" ) ~= nil then
							f15_local5:removeElement( f15_local6 )
							break
						end
						f15_local6 = f15_local6:getNextSibling()
					end
				end
			end
		end
		OnWeaponAccessoryButtonGainFocus( f15_arg0, {}, f15_arg0, f15_arg0.menu )
		if f15_local2 and not Cac.Perk1Disabled() then
			f15_local5 = Cac.GetEquippedWeapon( "Perk_Slot1", 0, LUI.CacStaticLayout.ClassLoc )
			f15_arg0.menu.Perk1:UnlockRefresh( "@MENU_PERK1_CAPS", Cac.GetWeaponName( "Perk_Slot1", f15_local5 ), Cac.GetWeaponImageName( "Perk_Slot1", f15_local5 ) )
		end
	end
end

function OnWeaponAccessoryButtonGainFocus( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
	OnWeaponButtonGainFocus( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
	f16_arg0.menu:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_CLEAR" ),
		side = "right",
		clickable = true,
		func = function ( f17_arg0, f17_arg1 )
			ClearWeaponAccessory( f16_arg2 )
		end
	} )
end

function CacLoadoutEditorMenu( f18_arg0, f18_arg1 )
	local f18_local0 = CoD.DesignGridHelper( 7, 1 )
	local f18_local1 = LUI.CacBase.new( f18_arg0, {
		menu_title = Engine.ToUpperCase( Cac.GetCustomClassName( LUI.CacStaticLayout.ClassLoc ) ),
		menu_width = f18_local0,
		persistentBackground = PersistentBackground.Variants.VirtualLobby
	} )
	f18_local1:SetBreadCrumb( Engine.Localize( "@LUA_MENU_CREATE_A_CLASS_CAPS" ) )
	f18_local1:AddListDivider()
	f18_local1:CreateBottomDivider()
	for f18_local39, f18_local40 in pairs( f0_local8 ) do
		if not f18_local40.visibleFunc or f18_local40.visibleFunc() then
			local f18_local5 = nil
			local f18_local6 = Cac.GetEquippedWeapon( f18_local40.storageCategory, 0, LUI.CacStaticLayout.ClassLoc )
			local f18_local7 = Cac.GetWeaponImageName( f18_local40.storageCategory, f18_local6 )
			local f18_local8 = Cac.GetWeaponName( f18_local40.storageCategory, f18_local6 )
			local f18_local9 = f0_local9( f18_local40.name )
			local f18_local10 = false
			if IsPublicMatch() then
				local f18_local11 = LUI.InventoryUtils.GetCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f18_local40.storageCategory )
				local f18_local12 = LUI.NewSticker.Default
			end
			local f18_local13 = f18_local11 and f18_local12 or nil
			local f18_local14 = Cac.GetUnrestrictedState( f18_local40.storageCategory, f18_local6 )
			if f18_local40.disabledFunc then
				local f18_local15, f18_local16 = f18_local40.disabledFunc()
				if f18_local15 and f18_local16 then
					f18_local9 = f18_local15
					f18_local8 = f18_local16
					f18_local10 = true
				end
			end
			local f18_local15 = {
				optionWeaponRef = f18_local6,
				optionStorageCategory = f18_local40.storageCategory
			}
			local f18_local16 = LUI.InventoryUtils.GetLootDataForRef( f18_local40.storageCategory, f18_local6, LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ) )
			local f18_local17 = {
				actionFunc = f18_local40.actionFunc or f0_local3,
				primaryText = f18_local9,
				secondaryText = f18_local8,
				iconName = f18_local7,
				newMode = f18_local13,
				unrestricted = f18_local14
			}
			local self
			if f18_local16 ~= nil then
				self = f18_local16.lootRarity
				if not self then
				
				else
					f18_local17.rarity = self
					if f18_local40.options ~= nil then
						self = LUI.UIHorizontalList.new( {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = false,
							top = 0,
							bottom = 60,
							left = 0,
							right = f18_local0,
							alignment = LUI.HorizontalAlignment.Left,
							spacing = H1MenuDims.spacing
						} )
						self:registerEventHandler( "restore_focus", function ( element, event )
							return OnOptionsListRestoreFocus( element, event, f18_local1 )
						end )
						self.buttonCount = 0
						self:makeFocusable()
						self.id = "optionsList_" .. f18_local40.storageCategory
						f18_local1.list:addElement( self )
						local f18_local19 = f18_local1.list
						f18_local1.list = self
						f18_local5 = f18_local1:AddCacButton( f18_local17 )
						f18_local5:registerEventHandler( "gain_focus", function ( element, event )
							OnWeaponButtonGainFocus( element, event, nil, f18_local1 )
						end )
						f18_local5.optionsForVL = {}
						table.insert( f18_local5.optionsForVL, f18_local15 )
						f18_local1.list = f18_local19
						for f18_local37, f18_local38 in pairs( f18_local40.options ) do
							if f18_local6 ~= "h1_deserteagle55" and (not f18_local38.visibleFunc or f18_local38.visibleFunc()) then
								local f18_local23 = Cac.GetEquippedWeapon( f18_local38.storageCategory, 0, LUI.CacStaticLayout.ClassLoc )
								local f18_local24 = Cac.GetWeaponImageName( f18_local38.storageCategory, f18_local23 )
								local f18_local25 = false
								local f18_local26 = true
								if IsPublicMatch() then
									f18_local25 = LUI.InventoryUtils.GetCategoryNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetPrimaryCategoryIfOverkill( f18_local38.storageCategory, nil, f0_local0 ) ) and LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f18_local6 )
								else
									local f18_local27 = Cac.GetUnrestrictedState( f18_local38.storageCategory, f18_local23 )
									if f18_local38.weaponCategory ~= "camo" and f18_local23 ~= "none" then
										f18_local26 = false
									else
										f18_local26 = f18_local27 or true
									end
								end
								local f18_local28 = LUI.InventoryUtils.GetLootDataForRef( f18_local38.storageCategory, f18_local23, LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ), f18_local40.storageCategory )
								local f18_local29 = LUI.CacWeaponAccessoryButton.new
								local f18_local30 = f18_local38.actionFunc or f0_local3
								local f18_local31 = f18_local24
								local f18_local32 = f18_local37
								local f18_local33 = f18_local38.name
								local f18_local34 = f18_local25
								local f18_local35 = f18_local26
								local f18_local36
								if f18_local28 ~= nil then
									f18_local36 = f18_local28.lootRarity
									if not f18_local36 then
									
									else
										f18_local29 = f18_local29( f18_local30, f18_local31, f18_local32, f18_local33, f18_local34, f18_local35, f18_local36 )
										f18_local29.menu = f18_local1
										f18_local29:registerEventHandler( "gain_focus", function ( element, event )
											OnWeaponAccessoryButtonGainFocus( f18_local5, event, f18_local29, f18_local1 )
										end )
										f18_local29.id = self.id .. "_option_" .. f18_local37
										f18_local29.storageCategory = f18_local38.storageCategory
										f18_local29.weaponCategory = f18_local38.weaponCategory
										f18_local29.showAttributes = f18_local38.showAttributes
										f18_local29.statsPrefix = f18_local38.statsPrefix
										f18_local29.attributesDelta = f18_local38.attributesDelta
										f18_local29.parentCategory = f18_local40.storageCategory
										f18_local29.cacLootTabs = Engine.GetOnlineGame() and f18_local38.cacLootTabs or nil
										f18_local29.showUnlocks = f18_local38.showUnlocks
										f18_local29.name = f18_local38.name
										self:addElement( f18_local29 )
										table.insert( f18_local5.optionsForVL, {
											optionWeaponRef = f18_local23,
											optionStorageCategory = f18_local38.storageCategory
										} )
										f18_local29.optionsForVL = f18_local5.optionsForVL
									end
								end
								f18_local36 = nil
							end
						end
					else
						f18_local5 = f18_local1:AddCacButton( f18_local17 )
						f18_local5:registerEventHandler( "gain_focus", function ( element, event )
							OnWeaponButtonGainFocus( element, event, nil, f18_local1 )
						end )
						f18_local5.optionsForVL = {}
						table.insert( f18_local5.optionsForVL, f18_local15 )
						if f18_local10 then
							f18_local5:processEvent( {
								name = "disable"
							} )
						end
					end
					f18_local5.storageCategory = f18_local40.storageCategory
					f18_local5.weaponCategory = f18_local40.weaponCategory
					f18_local5.showAttributes = f18_local40.showAttributes
					f18_local5.showUnlocks = f18_local40.showUnlocks
					f18_local5.subCategories = f18_local40.subCategories
					f18_local5.name = f18_local9
					f18_local5.weaponRef = f18_local6
					if f18_local40.isPerk1 then
						f18_local1.Perk1 = f18_local5
					end
				end
			end
			self = nil
		end
	end
	f18_local1:AddCurrencyInfoPanel()
	f18_local1:AddBottomDividerToList()
	f18_local1:AddBackButton( function ( f23_arg0, f23_arg1 )
		f0_local5( f18_local1, f23_arg1 )
	end )
	f18_local1:AddRotateHelp()
	return f18_local1
end

LUI.MenuBuilder.registerType( "CacLoadoutEditorMenu", CacLoadoutEditorMenu )
VLobby.InitMenuMode( "CacLoadoutEditorMenu", VirtualLobbyModes.LUI_MODE_CAC_WEAP, PersistentBackground.FadeFromBlackFast, PersistentBackground.FadeFromBlackFast )
LockTable( _M )
