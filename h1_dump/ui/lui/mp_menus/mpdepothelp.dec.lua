local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotHelp = InheritFrom( LUI.UIElement )
f0_local0 = function ( f1_arg0 )
	local f1_local0, f1_local1, f1_local2 = nil
	if f1_arg0.loot_type ~= nil then
		local f1_local3 = {
			costume = function ( f2_arg0 )
				return f2_arg0.loot_type, f2_arg0.id
			end,
			callingcard = function ( f3_arg0 )
				return f3_arg0.loot_type, f3_arg0.lootName
			end,
			emblem = function ( f4_arg0 )
				return f4_arg0.loot_type, f4_arg0.lootName
			end,
			weaponcamo = function ( f5_arg0 )
				return f5_arg0.weaponCategory, f5_arg0.externalRef and f5_arg0.externalRef or f5_arg0.weaponName
			end,
			reticle = function ( f6_arg0 )
				return f6_arg0.weaponCategory, f6_arg0.externalRef and f6_arg0.externalRef or f6_arg0.weaponName
			end,
			charactercamo = function ( f7_arg0 )
				return f7_arg0.loot_type, f7_arg0.externalRef and f7_arg0.externalRef or f7_arg0.weaponName
			end
		}
		f1_local2 = f1_local3[f1_arg0.loot_type]
	end
	if f1_local2 == nil then
		f1_local0 = f1_arg0.weaponCategory
		f1_local1 = f1_arg0.weaponName
	else
		f1_local0, f1_local1 = f1_local2( f1_arg0 )
	end
	return f1_local0, f1_local1
end

function RemoveDesertEagleCustom( f8_arg0 )
	for f8_local0 = #f8_arg0, 1, -1 do
		if f8_arg0[f8_local0].ref == "h1_deserteagle55" then
			table.remove( f8_arg0, f8_local0 )
			return 
		end
	end
end

LUI.MPDepotHelp.WeaponListAllWeapons = function ()
	local f9_local0 = {}
	local f9_local1 = {
		Cac.Weapons.Primary,
		Cac.Weapons.Secondary
	}
	local f9_local2 = {
		"Primary",
		"Secondary"
	}
	for f9_local14, f9_local15 in pairs( f9_local1 ) do
		for f9_local9, f9_local10 in pairs( f9_local15.Indices ) do
			for f9_local6, f9_local7 in ipairs( f9_local15[f9_local9] ) do
				f9_local0[#f9_local0 + 1] = {
					category = f9_local2[f9_local14],
					ref = f9_local7[1]
				}
			end
		end
	end
	RemoveDesertEagleCustom( f9_local0 )
	return f9_local0
end

LUI.MPDepotHelp.WeaponListForItem = function ( f10_arg0, f10_arg1 )
	local f10_local0 = {}
	local f10_local1 = {
		weapon_assault = "ast",
		weapon_smg = "smg",
		weapon_heavy = "lmg",
		weapon_shotgun = "sht",
		weapon_sniper = "snp",
		weapon_pistol = "pst"
	}
	local f10_local2 = {
		Cac.Weapons.Primary,
		Cac.Weapons.Secondary
	}
	local f10_local3 = {
		"Primary",
		"Secondary"
	}
	for f10_local15, f10_local16 in pairs( f10_local2 ) do
		for f10_local12, f10_local13 in pairs( f10_local16.Indices ) do
			if f10_local1[f10_local12] == f10_arg1.categoryKey then
				for f10_local10, f10_local11 in ipairs( f10_local16[f10_local12] ) do
					f10_local0[#f10_local0 + 1] = {
						category = f10_local3[f10_local15],
						ref = f10_local11[1]
					}
				end
			end
		end
	end
	RemoveDesertEagleCustom( f10_local0 )
	return f10_local0
end

LUI.MPDepotHelp.WeaponListForCamos = function ( f11_arg0 )
	local f11_local0 = {}
	local f11_local1 = {}
	for f11_local2 = 0, 5, 1 do
		f11_local1[#f11_local1 + 1] = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f11_arg0, CamoTable.Cols.ARGuid + f11_local2 )
	end
	local f11_local2 = {
		weapon_assault = 1,
		weapon_smg = 2,
		weapon_heavy = 3,
		weapon_shotgun = 4,
		weapon_sniper = 5,
		weapon_pistol = 6
	}
	local f11_local3 = {
		Cac.Weapons.Primary,
		Cac.Weapons.Secondary
	}
	local f11_local4 = {
		"Primary",
		"Secondary"
	}
	for f11_local17, f11_local18 in pairs( f11_local3 ) do
		for f11_local13, f11_local14 in pairs( f11_local18.Indices ) do
			local f11_local16 = f11_local1[f11_local2[f11_local13]]
			if f11_local16 ~= nil and f11_local16 ~= "" then
				for f11_local11, f11_local12 in ipairs( f11_local18[f11_local13] ) do
					f11_local0[#f11_local0 + 1] = {
						category = f11_local4[f11_local17],
						ref = f11_local12[1]
					}
				end
			end
		end
	end
	RemoveDesertEagleCustom( f11_local0 )
	return f11_local0
end

LUI.MPDepotHelp.WeaponListForReticles = function ( f12_arg0 )
	local f12_local0 = {}
	local f12_local1 = {}
	for f12_local2 = 0, 5, 1 do
		f12_local1[#f12_local1 + 1] = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f12_arg0, ReticleTable.Cols.ARGuid + f12_local2 )
	end
	local f12_local2 = {
		weapon_assault = 1,
		weapon_smg = 2,
		weapon_heavy = 3,
		weapon_shotgun = 4,
		weapon_sniper = 5,
		weapon_pistol = 6
	}
	local f12_local3 = {
		Cac.Weapons.Primary,
		Cac.Weapons.Secondary
	}
	local f12_local4 = {
		"Primary",
		"Secondary"
	}
	for f12_local17, f12_local18 in pairs( f12_local3 ) do
		for f12_local13, f12_local14 in pairs( f12_local18.Indices ) do
			local f12_local16 = f12_local1[f12_local2[f12_local13]]
			if f12_local16 ~= nil and f12_local16 ~= "" then
				for f12_local11, f12_local12 in ipairs( f12_local18[f12_local13] ) do
					f12_local0[#f12_local0 + 1] = {
						category = f12_local4[f12_local17],
						ref = f12_local12[1]
					}
				end
			end
		end
	end
	RemoveDesertEagleCustom( f12_local0 )
	return f12_local0
end

LUI.MPDepotHelp.WeaponListForKits = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local0 = {}
	local f13_local1 = Engine.TableLookupFromStart( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local2 = {
		Cac.Weapons.Primary,
		Cac.Weapons.Secondary
	}
	local f13_local3 = {
		"Primary",
		"Secondary"
	}
	for f13_local17, f13_local18 in pairs( f13_local2 ) do
		for f13_local13, f13_local14 in pairs( f13_local18.Indices ) do
			local f13_local7 = false
			local f13_local16 = Cac.KitWeaponTypes[f13_local13]
			for f13_local8 in string.gmatch( f13_local1, "%a+" ) do
				if f13_local8 == f13_local16 then
					f13_local7 = true
					break
				end
			end
			if f13_local7 then
				for f13_local8, f13_local12 in ipairs( f13_local18[f13_local13] ) do
					f13_local0[#f13_local0 + 1] = {
						category = f13_local3[f13_local17],
						ref = f13_local12[1]
					}
				end
			end
		end
	end
	RemoveDesertEagleCustom( f13_local0 )
	return f13_local0
end

LUI.MPDepotHelp.WeaponListForAttachKits = function ( f14_arg0 )
	return LUI.MPDepotHelp.WeaponListForKits( AttachKitTable.File, AttachKitTable.Cols.Ref, f14_arg0, AttachKitTable.Cols.Valid )
end

LUI.MPDepotHelp.WeaponListForFurnitureKitsByRef = function ( f15_arg0 )
	return LUI.MPDepotHelp.WeaponListForKits( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f15_arg0, FurnitureKitTable.Cols.Valid )
end

LUI.MPDepotHelp.WeaponListForFurnitureKitsByGuid = function ( f16_arg0 )
	return LUI.MPDepotHelp.WeaponListForKits( FurnitureKitTable.File, FurnitureKitTable.Cols.GlobalID, f16_arg0, FurnitureKitTable.Cols.Valid )
end

f0_local1 = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = nil
	local f17_local1 = {
		Primary_AttachKit = LUI.MPDepotHelp.WeaponListForAttachKits,
		Primary_FurnitureKit = LUI.MPDepotHelp.WeaponListForItem,
		Primary_Camo = LUI.MPDepotHelp.WeaponListForItem,
		Primary_Reticle = LUI.MPDepotHelp.WeaponListForItem,
		Secondary_AttachKit = LUI.MPDepotHelp.WeaponListForAttachKits,
		Secondary_FurnitureKit = LUI.MPDepotHelp.WeaponListForItem,
		Secondary_Camo = LUI.MPDepotHelp.WeaponListForItem,
		Secondary_Reticle = LUI.MPDepotHelp.WeaponListForItem
	}
	f17_local0 = f17_local1[f17_arg0]
	if f17_local0 == nil then
		f17_local0 = WeaponListAllWeapons
	end
	return f17_local0( f17_arg1, f17_arg2 )
end

f0_local2 = function ( f18_arg0, f18_arg1 )
	if f18_arg0.properties.noCollectionHelp == true or Cac.InPermanentLockingContext() then
		return 
	end
	local f18_local0 = GetCollectionForItem( f18_arg1 )
	if f18_local0 ~= nil then
		f18_arg0.menu:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@DEPOT_VIEW_COLLECTION" ),
			side = "right",
			clickable = true
		}, function ( f19_arg0, f19_arg1 )
			LUI.FlowManager.RequestAddMenu( f19_arg0, "MPDepotCollectionDetailsMenu", true, f19_arg1.controller, false, {
				setID = f18_local0.setID
			} )
		end )
	else
		f18_arg0.menu:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = ""
		} )
	end
end

local f0_local3 = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = false
	local f20_local1 = {
		Primary = true,
		Primary_AttachKit = true,
		Primary_FurnitureKit = true,
		Primary_Camo = true,
		Secondary = true,
		Secondary_AttachKit = true,
		Secondary_FurnitureKit = true,
		Secondary_Camo = true,
		Melee = true,
		costume = true,
		charactercamo = true
	}
	if f20_local1[f20_arg1] then
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
			f20_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.addRightStickButton )
		else
			f20_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.addMouseDrag )
		end
	elseif Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f20_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.removeRightStickButton )
	else
		f20_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.removeMouseDrag )
	end
end

local f0_local4 = function ( f21_arg0, f21_arg1, f21_arg2 )
	if f21_arg0.properties.noCollectionHelp == true then
		return 
	end
	local f21_local0 = {
		Primary = true,
		Primary_AttachKit = true,
		Secondary = true,
		Secondary_AttachKit = true
	}
	if f21_local0[f21_arg1] then
		f21_arg0.menu.attributes:Refresh( f21_arg2 )
		f21_arg0.menu.attributes:Show()
	else
		f21_arg0.menu.attributes:Hide()
	end
end

local f0_local5 = function ( f22_arg0, f22_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@DEPOT_CAC_EQUIP_ERROR" ),
		button_text = Engine.Localize( "@MENU_OK" )
	} )
end

local f0_local6 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	if not Cac.IsItemUnlocked( f23_arg1, "feature_cac" ) then
		LUI.FlowManager.RequestAddMenu( f23_arg0, "CACEquipError", true, f23_arg1 )
		return 
	else
		LUI.FlowManager.RequestAddMenu( nil, "CacMenu", true, f23_arg1, false, {
			equipCategory = f23_arg2,
			equipRef = f23_arg3,
			equipGuid = f23_arg4.guid
		} )
	end
end

local f0_local7 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	f0_local6( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
end

local f0_local8 = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
	f0_local6( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
end

local f0_local9 = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
	f0_local6( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
end

local f0_local10 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4 )
	f0_local6( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4 )
end

local f0_local11 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	Cac.NotifyVirtualLobby( "costume_apply", "" .. f28_arg1 .. "_" .. f28_arg3 )
	Engine.SetPlayerData( f28_arg1, CoD.StatsGroup.Common, "globalCostume", Cao.Types.Head, f28_arg3 )
	Engine.SetPlayerData( f28_arg1, CoD.StatsGroup.Common, "costumes", 0, Cao.Types.Shirt, 1 )
	Engine.SetPlayerData( f28_arg1, CoD.StatsGroup.Common, "costumes", 0, Cao.Types.Gloves, 1 )
	if f28_arg0.menu.properties.leaveAfterEquip then
		LUI.FlowManager.RequestLeaveMenu( f28_arg0 )
	else
		f28_arg0.menu:processEvent( {
			name = "on_item_equipped"
		} )
	end
end

local f0_local12 = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	local f29_local0 = tonumber( Engine.TableLookup( CharacterCamoTable.File, CharacterCamoTable.Cols.Ref, f29_arg3, CharacterCamoTable.Cols.Index ) )
	if f29_local0 ~= nil then
		Cac.NotifyVirtualLobby( "camo_apply", "" .. f29_arg1 .. "_" .. f29_local0 )
		Engine.SetPlayerData( f29_arg1, CoD.StatsGroup.Common, "characterCamoIndex", f29_local0 )
		if f29_arg0.menu.properties.leaveAfterEquip then
			LUI.FlowManager.RequestLeaveMenu( f29_arg0 )
		else
			f29_arg0.menu:processEvent( {
				name = "on_item_equipped"
			} )
		end
	end
end

local f0_local13 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4 )
	local f30_local0 = 0
	if f30_arg4.emblemIndex ~= nil then
		f30_local0 = f30_arg4.emblemIndex
	else
		f30_local0 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.Guid, f30_arg4.guid, EmblemIconTable.Cols.ID )
	end
	Cao.SetEmblemPatch( f30_arg1, f30_local0 )
	Cac.NotifyVirtualLobby( "reset_loadout", f30_arg1 )
	f30_arg0.menu:processEvent( {
		name = "on_item_equipped"
	} )
end

local f0_local14 = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
	local f31_local0 = 0
	if f31_arg4.cardIndex ~= nil then
		f31_local0 = f31_arg4.cardIndex
	else
		f31_local0 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Guid, f31_arg4.guid, CallingCardTable.Cols.ID )
	end
	Cao.SetCallingCard( f31_arg1, f31_arg4.cardIndex )
	f31_arg0.menu:processEvent( {
		name = "on_item_equipped"
	} )
end

LUI.MPDepotHelp.StartConfirmationPopUpAnim = function ( f32_arg0, f32_arg1 )
	LUI.MPDepotHelp.ClearConfirmationPopUpAnim( f32_arg0 )
	local f32_local0, f32_local1 = nil
	if f32_arg1 == "craft" then
		f32_local0 = RegisterMaterial( "h1_depot_crafting_icon" )
		f32_local1 = Engine.Localize( "DEPOT_ITEM_CRAFTED_CAPS" )
	elseif f32_arg1 == "equip" then
		f32_local0 = RegisterMaterial( "h1_ui_menu_icon_equipped" )
		f32_local1 = Engine.Localize( "DEPOT_ITEM_EQUIPPED_CAPS" )
	end
	LUI.MPDepotHelp.RunConfirmationPopUpAnim( f32_arg0, f32_local0, f32_local1 )
end

LUI.MPDepotHelp.ClearConfirmationPopUpAnim = function ( f33_arg0 )
	if f33_arg0.confirmationPopUp then
		f33_arg0.confirmationPopUp:closeChildren()
		f33_arg0:removeElement( f33_arg0.confirmationPopUp )
		f33_arg0.confirmationPopUp = nil
	end
end

LUI.MPDepotHelp.RunConfirmationPopUpAnim = function ( f34_arg0, f34_arg1, f34_arg2 )
	local f34_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f34_local0.width = 0
	f34_local0.height = 0
	f34_local0.alpha = 0
	
	local confirmationPopUp = LUI.UIElement.new( f34_local0 )
	f34_arg0:addElement( confirmationPopUp )
	f34_arg0.confirmationPopUp = confirmationPopUp
	
	local f34_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f34_local2.width = 486
	f34_local2.height = 266
	f34_local2.material = RegisterMaterial( "h1_depot_crafting_glow" )
	f34_local2.color = Colors.black
	confirmationPopUp:addElement( LUI.UIImage.new( f34_local2 ) )
	local f34_local3 = CoD.CreateState( nil, -35, nil, nil, CoD.AnchorTypes.None )
	f34_local3.width = 30
	f34_local3.height = 30
	f34_local3.material = f34_arg1
	confirmationPopUp:addElement( LUI.UIImage.new( f34_local3 ) )
	local f34_local4 = CoD.CreateState( nil, 2, nil, nil, CoD.AnchorTypes.None )
	f34_local4.font = CoD.TextSettings.BodyFont18.Font
	f34_local4.alignment = LUI.Alignment.Center
	f34_local4.width = 300
	f34_local4.height = CoD.TextSettings.BodyFont18.Height
	local self = LUI.UIText.new( f34_local4 )
	self:setText( f34_arg2 )
	confirmationPopUp:addElement( self )
	confirmationPopUp:registerEventHandler( "transition_complete_final", function ( element, event )
		LUI.MPDepotHelp.ClearConfirmationPopUpAnim( f34_arg0 )
	end )
	local f34_local6 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f34_local6.width = f34_local2.width
	f34_local6.height = f34_local2.height
	f34_local6.alpha = 1
	confirmationPopUp:registerAnimationState( "full", f34_local6 )
	confirmationPopUp:registerAnimationState( "final", f34_local0 )
	confirmationPopUp:animateInSequence( {
		{
			"default",
			1
		},
		{
			"full",
			100
		},
		{
			"full",
			275
		},
		{
			"final",
			100
		}
	} )
end

local f0_local15 = function ()
	local f36_local0 = LUI.FlowManager.IsInStack
	local f36_local1 = Engine.GetLuiRoot()
	f36_local0 = f36_local0( f36_local1.flowManager, "CacDetails" )
	if f36_local0 then
		f36_local0 = not LUI.FlowManager.IsMenuTopmost( Engine.GetLuiRoot(), "CacDetails" )
	end
	return f36_local0
end

LUI.MPDepotHelp.OnAction = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	local f37_local0, f37_local1, f37_local2 = nil
	if f37_arg3 ~= nil then
		f37_local0, f37_local1 = f0_local0( f37_arg3 )
		f37_local2 = Engine.Inventory_GetItemTypeByGuid( f37_arg3.guid )
	end
	local f37_local3 = f37_arg2.depotHelp
	if not Cac.InPermanentLockingContext() and (not (f37_local2 == nil or not Cac.IsCraftableType( f37_local2 ) and not Cac.IsRewardType( f37_local2 )) or f37_arg3 ~= nil and f37_arg3.useDepotHelpAction == true) then
		local f37_local4, f37_local5, f37_local6 = Cac.GetItemLockState( f37_arg1.controller, f37_arg3.guid )
		if f37_local4 == "Unlocked" and not f37_arg4 then
			if f37_arg0.passThruFunc then
				f37_arg0:passThruFunc( f37_arg1 )
			elseif not f0_local15() then
				local f37_local7 = {
					Primary = f0_local7,
					Primary_AttachKit = f0_local8,
					Primary_FurnitureKit = f0_local8,
					Primary_Camo = f0_local10,
					Primary_Reticle = f0_local9,
					Secondary = f0_local7,
					Secondary_AttachKit = f0_local8,
					Secondary_FurnitureKit = f0_local8,
					Secondary_Camo = f0_local10,
					Secondary_Reticle = f0_local9,
					Melee = f0_local7,
					costume = f0_local11,
					charactercamo = f0_local12,
					emblem = f0_local13,
					callingcard = f0_local14
				}
				local f37_local8 = f37_local7[f37_local0]
				if f37_local8 then
					f37_local8( f37_local3, f37_arg1.controller, f37_local0, f37_local1, f37_arg3 )
				end
			end
		elseif Cac.IsRewardType( f37_local2 ) or f37_arg4 then
			if not f37_local3.properties.noCollectionHelp then
				local f37_local7 = GetCollectionForItem( f37_arg3.guid )
				if f37_local7 ~= nil then
					LUI.FlowManager.RequestAddMenu( f37_arg0, "MPDepotCollectionDetailsMenu", true, f37_arg1.controller, false, {
						setID = f37_local7.setID
					} )
				end
			end
		elseif IsContentPromoUnlocked( f37_arg3.contentPromo ) then
			LUI.FlowManager.RequestAddMenu( nil, "MPDepotFabricatePopup", true, f37_arg1.controller, false, {
				guid = f37_arg3.guid,
				fabricateCost = f37_arg3.price,
				parentMenu = f37_arg2
			} )
		end
	elseif f37_arg0.passThruFunc then
		f37_arg0:passThruFunc( f37_arg1 )
	end
end

local f0_local16 = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
	local f38_local0 = "@DEPOT_EQUIP"
	if f38_arg3 ~= nil and not Cac.InPermanentLockingContext() then
		local f38_local1 = Engine.Inventory_GetItemTypeByGuid( f38_arg3.guid )
		local f38_local2 = IsContentPromoUnlocked( f38_arg3.contentPromo )
		local f38_local3, f38_local4, f38_local5 = Cac.GetItemLockState( f38_arg1, f38_arg3.guid )
		if not f38_local2 then
			if f38_local3 == "Locked" then
				f38_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.removeSelectButton )
				return 
			end
		elseif Cac.IsCraftableType( f38_local1 ) then
			if f38_local3 == "Locked" then
				f38_local0 = "@DEPOT_FABRICATE"
			elseif f0_local15() then
				f38_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.removeSelectButton )
				return 
			end
		elseif f38_local1 == Cac.InventoryItemType.Default then
			f38_local0 = "@LUA_MENU_SELECT"
		elseif Cac.IsRewardType( f38_local1 ) then
			local f38_local6, f38_local7, f38_local8 = Cac.GetItemLockState( f38_arg1, f38_arg3.guid )
			if f38_local6 == "Locked" then
				if f38_arg0.properties.noCollectionHelp == true or GetCollectionForItem( f38_arg3.guid ) == nil then
					f38_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.removeSelectButton )
					return 
				end
				f38_local0 = "@DEPOT_VIEW_COLLECTION"
			elseif f0_local15() then
				f38_arg0.menu:AddHelp( LUI.ButtonHelperText.CommonEvents.removeSelectButton )
				return 
			end
		end
	else
		f38_local0 = "@LUA_MENU_SELECT"
	end
	f38_arg0.menu:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( f38_local0 ),
		side = "left",
		clickable = false,
		priority = -1000
	} )
end

local f0_local17 = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
	local f39_local0 = "" .. f39_arg1 .. "_" .. Cac.GetVLOptionsString( f39_arg2, f39_arg3 )
	if f39_arg0.properties.noCollectionHelp == true then
		Cac.NotifyVirtualLobby( "weapon_highlighted_c", f39_local0 )
	else
		Cac.NotifyVirtualLobby( "weapon_highlighted", f39_local0 )
	end
end

local f0_local18 = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4 )
	if f40_arg0.properties.noCollectionHelp == true then
		Cac.NotifyVirtualLobby( "weapon_highlighted_c", "none" )
	else
		Cac.NotifyVirtualLobby( "weapon_highlighted", "none" )
	end
end

local f0_local19 = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4, f41_arg5 )
	local f41_local0 = "" .. f41_arg1 .. "_" .. Cac.GetVLOptionsString( f41_arg2, f41_arg3 ) .. "_" .. Cac.GetVLOptionsString( f41_arg4, f41_arg5 )
	if f41_arg0.properties.noCollectionHelp == true then
		Cac.NotifyVirtualLobby( "weapon_highlighted_c", f41_local0 )
	else
		Cac.NotifyVirtualLobby( "weapon_highlighted", f41_local0 )
	end
end

local f0_local20 = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
	local f42_local0 = f0_local1( f42_arg2, f42_arg3, f42_arg4 )
	f42_arg0.weaponList = f42_local0
	if f42_local0 ~= nil and #f42_local0 > 0 then
		f42_arg0.currentWeaponIndex = math.random( 1, #f42_local0 )
		local f42_local1 = f42_local0[f42_arg0.currentWeaponIndex]
		f42_arg0.notifyFunc = function ( f43_arg0 )
			f0_local19( f42_arg0, f42_arg1, f43_arg0.category, f43_arg0.ref, f42_arg2, f42_arg3 )
		end
		
		f42_arg0.notifyFunc( f42_local1 )
	end
end

local f0_local21 = function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4 )
	local f44_local0 = "" .. f44_arg1 .. "_" .. f44_arg3
	if f44_arg0.properties.noCollectionHelp == true then
		Cac.NotifyVirtualLobby( "costume_preview_c", f44_local0 )
	else
		Cac.NotifyVirtualLobby( "costume_preview", f44_local0 )
	end
end

local f0_local22 = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
	local f45_local0 = tonumber( Engine.TableLookup( CharacterCamoTable.File, CharacterCamoTable.Cols.Ref, f45_arg3, CharacterCamoTable.Cols.Index ) )
	if f45_local0 ~= nil then
		local f45_local1 = "" .. f45_arg1 .. "_" .. f45_local0
		if f45_arg0.properties.noCollectionHelp == true then
			Cac.NotifyVirtualLobby( "camo_preview_c", f45_local1 )
		else
			Cac.NotifyVirtualLobby( "camo_preview", f45_local1 )
		end
	end
end

local f0_local23 = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	Cac.NotifyVirtualLobby( "lootscreen_weapon_highlighted", "" .. f46_arg1 )
end

local f0_local24 = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
	if f47_arg0.previewGuid ~= nil and f47_arg4 ~= nil and f47_arg0.previewGuid == f47_arg4.guid then
		return 
	end
	f47_arg0.weaponList = nil
	f47_arg0.currentWeaponIndex = nil
	local f47_local0
	if f47_arg4 ~= nil then
		f47_local0 = f47_arg4.guid
		if not f47_local0 then
		
		else
			f47_arg0.previewGuid = f47_local0
			f47_local0 = nil
			local f47_local1 = {
				Primary = f0_local17,
				Primary_AttachKit = f0_local20,
				Primary_FurnitureKit = f0_local20,
				Primary_Camo = f0_local20,
				Primary_Reticle = f0_local18,
				Secondary = f0_local17,
				Secondary_AttachKit = f0_local20,
				Secondary_FurnitureKit = f0_local20,
				Secondary_Camo = f0_local20,
				Secondary_Reticle = f0_local18,
				Melee = f0_local17,
				costume = f0_local21,
				charactercamo = f0_local22,
				emblem = f0_local18,
				callingcard = f0_local18
			}
			f47_local0 = f47_local1[f47_arg2]
			if f47_local0 ~= nil then
				f47_local0( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
			end
		end
	end
	f47_local0 = nil
end

local f0_local25 = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
	f0_local24( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
end

local f0_local26 = function ( f49_arg0, f49_arg1 )
	f49_arg0.currentWeaponIndex = f49_arg0.currentWeaponIndex - 1
	if f49_arg0.currentWeaponIndex == 0 then
		f49_arg0.currentWeaponIndex = #f49_arg0.weaponList
	end
	f49_arg0.notifyFunc( f49_arg0.weaponList[f49_arg0.currentWeaponIndex] )
end

local f0_local27 = function ( f50_arg0, f50_arg1 )
	f50_arg0.currentWeaponIndex = f50_arg0.currentWeaponIndex + 1
	if #f50_arg0.weaponList < f50_arg0.currentWeaponIndex then
		f50_arg0.currentWeaponIndex = 1
	end
	f50_arg0.notifyFunc( f50_arg0.weaponList[f50_arg0.currentWeaponIndex] )
end

local f0_local28 = function ( f51_arg0, f51_arg1, f51_arg2 )
	if f51_arg0.weaponList ~= nil and #f51_arg0.weaponList > 1 then
		f51_arg0.needTriggerButtons = true
		local f51_local0, f51_local1 = nil
		if Engine.IsVita( f51_arg1 ) then
			f51_local0 = "button_left_trigger_vita"
			f51_local1 = "button_right_trigger_vita"
		end
		local f51_local2 = nil
		local f51_local3 = {
			Primary_AttachKit = "@MENU_CHANGE_WEAPON",
			Primary_FurnitureKit = "@MENU_CHANGE_WEAPON",
			Primary_Camo = "@MENU_CHANGE_WEAPON",
			Secondary_AttachKit = "@MENU_CHANGE_WEAPON",
			Secondary_FurnitureKit = "@MENU_CHANGE_WEAPON",
			Secondary_Camo = "@MENU_CHANGE_WEAPON"
		}
		f51_local2 = f51_local3[f51_arg2]
		if f51_local2 == nil then
			f51_local2 = "@MENU_ERROR"
		end
		LUI.ButtonHelperText.AddHelperTextObject( f51_arg0.menu.help, {
			name = "add_button_helper_text",
			button_ref = "button_left_trigger",
			button_ref2 = "button_right_trigger",
			button_ref_vita = f51_local0,
			button_ref_vita_2 = f51_local1,
			helper_text = Engine.Localize( f51_local2 ),
			side = "right",
			clickable = false,
			priority = 2000,
			groupLRButtons = true,
			leftIconClickFunc = function ( f52_arg0, f52_arg1 )
				f0_local26( f51_arg0, f52_arg1 )
			end,
			rightIconClickFunc = function ( f53_arg0, f53_arg1 )
				f0_local27( f51_arg0, f53_arg1 )
			end
		}, function ( f54_arg0, f54_arg1 )
			f0_local26( f51_arg0, f54_arg1 )
		end, nil, function ( f55_arg0, f55_arg1 )
			f0_local27( f51_arg0, f55_arg1 )
		end )
	end
end

local f0_local29 = function ( f56_arg0, f56_arg1, f56_arg2 )
	local f56_local0 = {
		costume = true,
		charactercamo = true
	}
	if f56_local0[f56_arg2] == true then
		f56_arg0.needTriggerButtons = true
		f56_arg0.factionWidget:ShowFactionImage()
		f56_arg0.factionWidget:ShowHelpButtons()
	else
		f56_arg0.factionWidget:HideFactionImage()
	end
end

LUI.MPDepotHelp.OnFocus = function ( f57_arg0, f57_arg1, f57_arg2 )
	f57_arg0.needTriggerButtons = false
	if f57_arg2 ~= nil then
		local f57_local0, f57_local1 = f0_local0( f57_arg2 )
		if f57_local0 == nil or f57_local1 == nil then
			Cac.NotifyVirtualLobby( "weapon_highlighted_c", "none" )
			return 
		elseif not f57_arg0.properties.actionAndCollectionHelpOnly then
			f0_local25( f57_arg0, f57_arg1, f57_local0, f57_local1, f57_arg2 )
			f0_local4( f57_arg0, f57_local0, f57_local1 )
			f0_local29( f57_arg0, f57_arg1, f57_local0 )
			f0_local28( f57_arg0, f57_arg1, f57_local0 )
			f0_local3( f57_arg0, f57_local0, f57_local1 )
		end
		f0_local16( f57_arg0, f57_arg1, f57_local1, f57_arg2 )
	else
		f0_local16( f57_arg0, f57_arg1 )
	end
	local f57_local0 = f0_local2
	local f57_local1 = f57_arg0
	local f57_local2
	if f57_arg2 then
		f57_local2 = f57_arg2.guid
		if not f57_local2 then
		
		else
			f57_local0( f57_local1, f57_local2 )
			if not f57_arg0.properties.actionAndCollectionHelpOnly and not f57_arg0.needTriggerButtons then
				f57_arg0.factionWidget:HideHelpButtons()
			end
		end
	end
	f57_local2 = nil
end

LUI.MPDepotHelp.new = function ( f58_arg0, f58_arg1 )
	local f58_local0 = f58_arg1 or {}
	local self = LUI.UIElement.new()
	self:setClass( LUI.MPDepotHelp )
	self.properties = f58_local0
	self.menu = f58_arg0
	f58_arg0.depotHelp = self
	if not f58_local0.actionAndCollectionHelpOnly then
		local f58_local2 = LUI.CacFactionWidget.new( f58_arg0, f58_arg0.exclusiveController, true, f58_local0.factionLowerRight )
		f58_arg0:addElement( f58_local2 )
		f58_local2:HideFactionImage()
		f58_local2:HideHelpButtons()
		self.factionWidget = f58_local2
		if not f58_local0.noCollectionHelp == true then
			local f58_local3 = LUI.CacWeaponAttributes.new()
			f58_arg0:addElement( f58_local3 )
			f58_local3:Hide()
			f58_arg0.attributes = f58_local3
		end
	end
	if f58_local0.clearWeapon == true then
		Cac.NotifyVirtualLobby( "weapon_highlighted_c", "none" )
	end
	return self
end

LUI.MenuBuilder.registerPopupType( "CACEquipError", f0_local5 )
LockTable( _M )
