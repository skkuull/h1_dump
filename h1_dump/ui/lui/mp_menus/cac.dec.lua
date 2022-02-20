local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Cac = {}
LUI.Cac.EquipNone = 0
LUI.Cac.EquipPrimary = bit( 1 )
LUI.Cac.EquipSecondary = bit( 2 )
function Refresh( f1_arg0 )
	local f1_local0 = Cac.GetLoadout( LUI.CacStaticLayout.ClassLoc, f1_arg0.selectedClassIndex )
	if f1_arg0 == nil then
		f1_arg0 = {}
	end
	f1_arg0.loadout = f1_local0
	if f1_arg0.staticLayout then
		local f1_local1 = nil
		local f1_local2 = #f1_arg0.staticLayout.containers
		for f1_local3 = 1, f1_local2, 1 do
			f1_arg0.staticLayout.containers[f1_local3]:Refresh( f1_local0 )
		end
	end
	f1_arg0.haveRestrictedClasses = false
	if f1_arg0.list then
		f1_arg0.list:processEvent( {
			name = "refresh_class_name",
			dispatchChildren = true
		} )
		RefreshHelpButtons( f1_arg0 )
	end
end

function RefreshHelpButtons( f2_arg0 )
	local f2_local0 = f2_arg0.properties or {}
	local f2_local1 = f2_arg0.list:getFirstInFocus()
	local f2_local2
	if f2_local1 then
		f2_local2 = f2_local1.properties.isLocked
	else
		f2_local2 = true
	end
	local f2_local3 = f2_local1 and f2_local1.properties.isDlcLocked
	LUI.ButtonHelperText.ClearHelperTextObjects( f2_arg0.help, {
		side = "all"
	} )
	LUI.ButtonHelperText.AddHelperTextObject( f2_arg0.help, LUI.ButtonHelperText.CommonEvents.addBackButton, goBack )
	f2_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addFriendsButton )
	if f2_arg0.properties.equipRef then
		f2_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_action",
			helper_text = Engine.Localize( "@DEPOT_EQUIP" ),
			side = "left",
			clickable = false,
			priority = -1000
		} )
		if f2_local1 ~= nil and f2_local1.restricted then
			f2_arg0:AddHelp( {
				name = "add_button_helper_text",
				id = "restricted",
				image_name = CoD.Material.RestrictedIcon,
				helper_text = Engine.Localize( "@DEPOT_NOT_COMPATIBLE" ),
				side = "top_right",
				clickable = false,
				priority = -1000
			} )
		end
	elseif Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f2_arg0:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	if f2_local3 then
		LUI.ButtonHelperText.AddHelperTextObject( f2_arg0.help, {
			name = "add_button_helper_text",
			button_ref = "button_action",
			helper_text = Engine.Localize( "@LUA_MENU_STORE" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f3_arg0, f3_arg1 )
			if f2_local1 then
				f2_local1.properties:button_action_func( f3_arg1 )
			end
		end )
	elseif not f2_local2 then
		if not f2_local0.editMatchPresets then
			LUI.ButtonHelperText.AddHelperTextObject( f2_arg0.help, {
				name = "add_button_helper_text",
				button_ref = "button_start",
				helper_text = Engine.Localize( "@MPUI_FIRINGRANGE" ),
				side = "right",
				clickable = true,
				priority = -1000
			}, function ( f4_arg0, f4_arg1 )
				OnFiringRange( f2_arg0 )
			end )
		end
		LUI.ButtonHelperText.AddHelperTextObject( f2_arg0.help, {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@LUA_MENU_CLASS_OPTIONS" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f5_arg0, f5_arg1 )
			LUI.FlowManager.RequestAddMenu( nil, "cac_class_options_popup", true, f5_arg1.controller, false, {
				callback_params = {
					menu = f2_arg0
				}
			} )
		end )
		if f2_local0.editMatchPresets then
			LUI.ButtonHelperText.AddHelperTextObject( f2_arg0.help, {
				name = "add_button_helper_text",
				button_ref = "button_select",
				helper_text = Engine.Localize( "@LUA_MENU_TOGGLE_DEFAULT" ),
				side = "right",
				clickable = true,
				priority = -1000
			}, function ( f6_arg0, f6_arg1 )
				Engine.PlaySound( CoD.SFX.MouseClick )
				OnToggleDefault( f2_arg0 )
			end )
		end
		f2_arg0:registerEventHandler( "text_input_complete", function ( element, event )
			if event.text and event.text ~= "" then
				if #event.text > CoD.MaxClassNameLength then
					event.text = string.sub( event.text, 1, CoD.MaxClassNameLength )
					LUI.FlowManager.RequestAddMenu( element, "generic_confirmation_popup", false, false, false, {
						popup_title = Engine.Localize( "@MENU_WARNING" ),
						message_text = Engine.Localize( "@LUA_MENU_CUSTOM_CLASS_NAME_TOO_LONG", CoD.MaxClassNameLength )
					} )
				end
				Cac.SetCustomClassName( event.text, LUI.CacStaticLayout.ClassLoc )
				Refresh( f2_arg0 )
			end
		end )
		if f2_arg0.haveRestrictedClasses then
			LUI.ButtonHelperText.AddHelperTextObject( f2_arg0.help, LUI.ButtonHelperText.CommonEvents.addRestrictedHelp )
		end
	end
	f2_arg0:AddRotateHelp()
	if f2_arg0.factionWidget then
		f2_arg0.factionWidget:ShowHelpButtons()
	end
end

function OnFiringRange( f8_arg0 )
	if Engine.GetDvarBool( "virtualLobbyActive" ) and Engine.GetDvarBool( "virtualLobbyPresentable" ) then
		Engine.PlaySound( CoD.SFX.MenuAccept )
		PersistentBackground.FadeFromBlackSlow()
		Engine.CloseScreenKeyboard( Cac.GetSelectedControllerIndex() )
		Cac.SetVirtualLobbyLoadout( Cac.GetSelectedControllerIndex() )
		Cac.NotifyVLClassChange( Cac.GetSelectedControllerIndex(), -1, LUI.CacStaticLayout.ClassLoc )
		Lobby.SetFiringRangeController( Cac.GetSelectedControllerIndex() )
		LUI.FlowManager.RequestAddMenu( f8_arg0, "FiringRange" )
	end
	return true
end

function CacMenuTabPageFlip( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = f9_arg0.availableClassCount
	local f9_local1 = math.ceil( f9_local0 / f9_arg0.classesPerPage )
	local f9_local2 = f9_arg0.currentPage
	f9_arg0.currentPage = f9_arg2
	if f9_local1 < f9_arg0.currentPage then
		f9_arg0.currentPage = f9_local1
	elseif f9_arg0.currentPage < 1 then
		f9_arg0.currentPage = 1
	end
	if f9_local2 ~= f9_arg0.currentPage or f9_arg3 then
		if f9_arg0.headerText then
			f9_arg0.headerText:setText( Engine.Localize( "@MPUI_X_SLASH_Y", f9_arg0.currentPage, f9_local1 ) )
		end
		if f9_arg0.pipList then
			f9_arg0:processEvent( {
				name = "update_pips"
			} )
		end
		local f9_local3 = f9_arg0.selectedClassIndex - (f9_local2 - 1) * f9_arg0.classesPerPage
		local f9_local4 = LUI.FlowManager.GetMenuScopedDataFromElement( f9_arg0 )
		if f9_local4.inAxisClass then
			f9_local3 = f9_local3 + f9_arg0.classesPerPage
		end
		local f9_local5 = f9_arg0.list:getChildById( "cac_class_button_" .. f9_local3 )
		if f9_local5 then
			f9_local5:processEvent( {
				name = "lose_focus",
				controller = f9_arg1
			} )
		end
		local f9_local6 = nil
		for f9_local7 = 0, f9_arg0.numClassButtons - 1, 1 do
			local f9_local10 = f9_arg0.list:getChildById( "cac_class_button_" .. f9_local7 )
			local f9_local11 = (f9_arg0.currentPage - 1) * f9_arg0.classesPerPage + f9_local7
			local f9_local12 = f9_local10.properties.isAxisButton
			if f9_local12 or f9_local11 < f9_local0 then
				f9_local10:makeFocusable()
				f9_local10:show()
				if f9_local7 <= f9_local3 then
					f9_local6 = f9_local10
				end
				if not f9_local12 then
					f9_local10.properties.slot = f9_local11
					f9_local10.properties.isLocked = Cac.IsCustomClassLocked( Cac.GetSelectedControllerIndex(), LUI.CacStaticLayout.ClassLoc, f9_local11 )
					f9_local10.properties.isDlcLocked = Cac.IsCustomClassDlcLocked( Cac.GetSelectedControllerIndex(), LUI.CacStaticLayout.ClassLoc, f9_local11 )
					if f9_local10.properties.isLocked then
						f9_local10:processEvent( {
							name = "disable"
						} )
						f9_local10:makeFocusable()
						if f9_local10.newSticker then
							f9_local10.newSticker:processEvent( {
								name = "updateNew",
								show = false,
								dispatchChildren = true
							} )
						end
					end
					f9_local10:processEvent( {
						name = "enable"
					} )
					if f9_local10.newSticker then
						local f9_local13 = false
						local f9_local14 = Cac.GetEquippedWeapon( "Primary", 0, LUI.CacStaticLayout.ClassLoc, f9_local11 )
						if f9_local14 ~= nil then
							f9_local13 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f9_local14 )
						end
						if not f9_local13 then
							f9_local13 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetEquippedWeapon( "Secondary", 0, LUI.CacStaticLayout.ClassLoc, f9_local11 ) )
						end
						f9_local10.newSticker:processEvent( {
							name = "updateNew",
							show = f9_local13,
							dispatchChildren = true
						} )
					end
				end
			end
			f9_local10:makeNotFocusable()
			f9_local10:hide()
		end
		if f9_local6 then
			f9_local6:processEvent( {
				name = "gain_focus",
				controller = f9_arg1
			} )
		end
	end
end

function CacOnTabLeft( f10_arg0, f10_arg1, f10_arg2 )
	CacMenuTabPageFlip( f10_arg2, f10_arg1.controller, f10_arg2.currentPage - 1 )
end

function CacOnTabRight( f11_arg0, f11_arg1, f11_arg2 )
	CacMenuTabPageFlip( f11_arg2, f11_arg1.controller, f11_arg2.currentPage + 1 )
end

function CacOnTabClick( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	CacMenuTabPageFlip( f12_arg2, f12_arg1.controller, f12_arg3 )
end

function OnCacGainFocus( f13_arg0, f13_arg1 )
	CacMenuTabPageFlip( f13_arg0, Cac.GetSelectedControllerIndex(), f13_arg0.currentPage, true )
end

function OnCacRestoreFocus( f14_arg0, f14_arg1 )
	local f14_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f14_arg0 )
	if f14_local0.inAxisClass then
		LUI.CacStaticLayout.ClassLoc = "defaultClassesTeam1"
		f14_arg0.selectedClassIndex = Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc )
	end
	Refresh( f14_arg0 )
	Cac.NotifyVirtualLobby( "weapon_highlighted", "none" )
	f14_arg0.list:processEvent( {
		name = "lose_focus",
		dispatchChildren = true
	} )
	OnCacGainFocus( f14_arg0, f14_arg1 )
	return true
end

function OnClearClass( f15_arg0 )
	Cac.DefaultClass( LUI.CacStaticLayout.ClassLoc, f15_arg0.selectedClassIndex )
	Cac.SetVirtualLobbyLoadout( f15_arg0.exclusiveController )
	Cac.NotifyVirtualLobby( "reset_loadout", f15_arg0.exclusiveController + 16 * (Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ) + 1) )
	local f15_local0 = nil
	if f15_arg0.type == "CacMenu" then
		f15_local0 = Engine.Localize( "@CLASS_SLOT_NUMBER", f15_arg0.selectedClassIndex + 1 )
	else
		f15_local0 = Engine.Localize( "@LUA_MENU_LOADOUT_DEFAULT_NAME", f15_arg0.selectedClassIndex + 1 )
	end
	Cac.SetCustomClassName( f15_local0, LUI.CacStaticLayout.ClassLoc, f15_arg0.selectedClassIndex )
	Refresh( f15_arg0 )
end

function OnCopyClass( f16_arg0, f16_arg1 )
	Cac.CopyClass( LUI.CacStaticLayout.ClassLoc, nil, f16_arg1 )
end

function OnPasteClass( f17_arg0, f17_arg1 )
	Cac.PasteClass( LUI.CacStaticLayout.ClassLoc, f17_arg1 )
	Refresh( f17_arg0 )
end

function OnToggleDefault( f18_arg0 )
	Cac.SetClassInUse( LUI.CacStaticLayout.ClassLoc, f18_arg0.selectedClassIndex, not Cac.IsClassInUse( LUI.CacStaticLayout.ClassLoc, f18_arg0.selectedClassIndex ) )
	Refresh( f18_arg0 )
end

Cac.NotifyVLClassChange = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = f19_arg0 + 16 * (f19_arg1 + 1)
	if f19_arg2 == "defaultClassesTeam2" then
		Cac.NotifyVirtualLobby( "preset_classpreview_allies", f19_local0 )
	elseif f19_arg2 == "defaultClassesTeam1" then
		Cac.NotifyVirtualLobby( "preset_classpreview_axis", f19_local0 )
	else
		Cac.NotifyVirtualLobby( "classpreview", f19_local0 )
	end
end

function OnClassButtonOver( f20_arg0, f20_arg1, f20_arg2 )
	f20_arg2.selectedClassIndex = f20_arg0.properties.slot
	f20_arg2.focusedButton = f20_arg0
	LUI.CacStaticLayout.ClassLoc = f20_arg0.properties.classLoc
	Cac.OverridePlayerDataFaction = true
	local f20_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f20_arg0 )
	local f20_local1 = Cac.GetSelectedControllerIndex()
	f20_local0.inAxisClass = f20_arg0.properties.isAxisButton
	if f20_arg0.properties.isDlcLocked then
		f20_arg2.staticLayout:hide()
		f20_arg2.selectedClassIndexIsLocked = true
	elseif f20_arg0.properties.isLocked then
		if f20_arg2.unlockBlurb then
			f20_arg2.unlockBlurb:animateToState( "visible" )
		end
		f20_arg2.staticLayout:hide()
		f20_arg2.selectedClassIndexIsLocked = true
	else
		if f20_arg2.unlockBlurb then
			f20_arg2.unlockBlurb:animateToState( "default" )
		end
		f20_arg2.staticLayout:show()
		f20_arg2.selectedClassIndexIsLocked = false
		Cac.SetSelectedClassIndex( f20_arg2.selectedClassIndex, LUI.CacStaticLayout.ClassLoc )
		Cac.SetVirtualLobbyLoadout( f20_local1 )
		Cac.NotifyVLClassChange( f20_local1, f20_arg2.selectedClassIndex, LUI.CacStaticLayout.ClassLoc )
	end
	Refresh( f20_arg2 )
end

function OnClassButtonAction( f21_arg0, f21_arg1 )
	if f21_arg0.properties.isDlcLocked then
		local f21_local0 = LUI.InventoryUtils.GetLootData( nil, nil, {
			Type = LUI.InventoryUtils.UnlockTypes.FEATURE,
			ItemId = Cac.ExtendedLoadoutUnlockRef
		} )
		if f21_local0 and f21_local0.lockStatus == Cac.ItemLockStatus.DlcRequired and f21_local0.dlcRequirement and Dlc.TryOpenStore( Cac.GetSelectedControllerIndex(), f21_local0.dlcRequirement, f21_local0.dlcEarlyAccess ) then
			return 
		end
	elseif not f21_arg0.properties.isLocked then
		LUI.FlowManager.RequestAddMenu( f21_arg0, "CacLoadoutEditorMenu", true, Cac.GetSelectedControllerIndex(), f21_arg1.replaceTop, {
			loadout = f21_arg0.menu.loadout
		} )
	end
end

function TranslatePrimaryToSecondary( f22_arg0 )
	local f22_local0 = {
		Primary = "Secondary",
		Primary_AttackKit = "Secondary_AttachKit",
		Primary_Camo = "Secondary_Camo",
		Primary_Reticle = "Secondary_Reticle",
		Primary_FurnitureKit = "Secondary_FurnitureKit"
	}
	return f22_local0[f22_arg0] or f22_arg0
end

function OnEquipToClass( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	if not f23_arg0.restricted then
		local f23_local0 = hasbit( f23_arg0.equipSlot, LUI.Cac.EquipPrimary )
		local f23_local1 = hasbit( f23_arg0.equipSlot, LUI.Cac.EquipSecondary )
		local f23_local2 = function ()
			Cac.SelectEquippedWeapon( f23_arg3, 0, f23_arg2, Cac.GetCustomClassLoc() )
			Refresh( f23_arg0.menu )
		end
		
		local f23_local3 = function ()
			Cac.SelectEquippedWeapon( TranslatePrimaryToSecondary( f23_arg3 ), 0, f23_arg2, Cac.GetCustomClassLoc() )
			Refresh( f23_arg0.menu )
		end
		
		local f23_local4 = function ()
			Cac.SelectEquippedWeapon( f23_arg3, 0, f23_arg2, Cac.GetCustomClassLoc() )
			Cac.SelectEquippedWeapon( TranslatePrimaryToSecondary( f23_arg3 ), 0, f23_arg2, Cac.GetCustomClassLoc() )
			Refresh( f23_arg0.menu )
		end
		
		if f23_local0 and f23_local1 then
			LUI.FlowManager.RequestAddMenu( f23_arg0, "ResolveEquipAmbiguityPopup", true, f23_arg1.controller, false, {
				equipName = Cac.GetWeaponName( f23_arg3, f23_arg2 ),
				primaryFunc = f23_local2,
				primaryName = Cac.GetWeaponName( "Primary", Cac.GetEquippedWeapon( "Primary", 0, Cac.GetCustomClassLoc(), f23_arg0.properties.slot ) ),
				secondaryFunc = f23_local3,
				secondaryName = Cac.GetWeaponName( "Secondary", Cac.GetEquippedWeapon( "Secondary", 0, Cac.GetCustomClassLoc(), f23_arg0.properties.slot ) ),
				bothFunc = f23_local4
			} )
		elseif f23_local0 then
			f23_local2()
		elseif f23_local1 then
			f23_local3()
		end
	end
end

function goBack( f27_arg0 )
	Cac.ClearCopyData()
	LUI.FlowManager.RequestLeaveMenu( f27_arg0 )
end

f0_local0 = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4, f28_arg5 )
	f28_arg0.equipSlot = setbit( f28_arg0.equipSlot, LUI.Cac.EquipPrimary )
	return true
end

f0_local1 = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5 )
	f29_arg0.equipSlot = setbit( f29_arg0.equipSlot, LUI.Cac.EquipPrimary )
	return true
end

f0_local2 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4, f30_arg5 )
	f30_arg0.equipSlot = setbit( f30_arg0.equipSlot, LUI.Cac.EquipSecondary )
	return not Cac.HasEquippedWeapon( "Perk_Slot2", "specialty_twoprimaries", Cac.GetCustomClassLoc(), f30_arg2 )
end

local f0_local3 = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = Cac.GetEquippedWeapon( "Primary", 0, Cac.GetCustomClassLoc(), f31_arg2 )
	local f31_local1 = Cac.GetEquippedWeapon( "Secondary", 0, Cac.GetCustomClassLoc(), f31_arg2 )
	for f31_local2 = 1, #f31_arg1, 1 do
		if f31_local0 == f31_arg1[f31_local2].ref then
			f31_arg0.equipSlot = setbit( f31_arg0.equipSlot, LUI.Cac.EquipPrimary )
		end
		if f31_local1 == f31_arg1[f31_local2].ref then
			f31_arg0.equipSlot = setbit( f31_arg0.equipSlot, LUI.Cac.EquipSecondary )
		end
	end
	return f31_arg0.equipSlot ~= LUI.Cac.EquipNone
end

local f0_local4 = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3, f32_arg4, f32_arg5 )
	f0_local3( f32_arg0, LUI.MPDepotHelp.WeaponListForAttachKits( f32_arg5 ), f32_arg2 )
	return f32_arg0.equipSlot ~= LUI.Cac.EquipNone
end

local f0_local5 = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5 )
	f0_local3( f33_arg0, LUI.MPDepotHelp.WeaponListForCamos( f33_arg4 ), f33_arg2 )
	return f33_arg0.equipSlot ~= LUI.Cac.EquipNone
end

local f0_local6 = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4, f34_arg5 )
	f0_local3( f34_arg0, LUI.MPDepotHelp.WeaponListForFurnitureKitsByGuid( f34_arg5 ), f34_arg2 )
	return f34_arg0.equipSlot ~= LUI.Cac.EquipNone
end

local f0_local7 = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4, f35_arg5 )
	f0_local3( f35_arg0, LUI.MPDepotHelp.WeaponListForReticles( f35_arg4 ), f35_arg2 )
	local f35_local0 = nil
	if hasbit( f35_arg0.equipSlot, LUI.Cac.EquipPrimary ) and Cac.GetWeaponTypeFromWeapon( "Primary", Cac.GetEquippedWeapon( "Primary", 0, Cac.GetCustomClassLoc(), f35_arg2 ) ) ~= "weapon_sniper" and not Cac.DoesAttachKitAllowReticles( Cac.GetEquippedWeapon( "Primary_AttachKit", 0, Cac.GetCustomClassLoc(), f35_arg2 ) ) then
		f35_arg0.equipSlot = clearbit( f35_arg0.equipSlot, LUI.Cac.EquipPrimary )
	end
	if hasbit( f35_arg0.equipSlot, LUI.Cac.EquipSecondary ) and Cac.GetWeaponTypeFromWeaponWithoutCategory( Cac.GetEquippedWeapon( "Secondary", 0, Cac.GetCustomClassLoc(), f35_arg2 ) ) ~= "weapon_sniper" and not Cac.DoesAttachKitAllowReticles( Cac.GetEquippedWeapon( "Secondary_AttachKit", 0, Cac.GetCustomClassLoc(), f35_arg2 ) ) then
		f35_arg0.equipSlot = clearbit( f35_arg0.equipSlot, LUI.Cac.EquipSecondary )
	end
	return f35_arg0.equipSlot ~= LUI.Cac.EquipNone
end

local f0_local8 = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4, f36_arg5 )
	f36_arg0.equipSlot = LUI.Cac.EquipNone
	local f36_local0 = false
	local f36_local1 = {
		Primary = f0_local0,
		Secondary = f0_local2,
		Primary_AttachKit = f0_local4,
		Primary_Camo = f0_local5,
		Primary_Reticle = f0_local7,
		Primary_FurnitureKit = f0_local6,
		Melee = f0_local1
	}
	local f36_local2 = f36_local1[f36_arg3]
	if f36_local2 then
		f36_local0 = f36_local2( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4, f36_arg5 )
	end
	return f36_local0
end

function RefreshClassButton( f37_arg0, f37_arg1, f37_arg2 )
	local f37_local0 = "Error"
	local f37_local1 = Cac.GetSelectedControllerIndex()
	if f37_arg0.properties and f37_arg0.properties.slot then
		local f37_local2 = f37_arg0.properties.classLoc
		local f37_local3 = f37_arg0.properties.slot
		f37_local0 = Cac.GetCustomClassName( f37_local2, f37_local3 )
		local f37_local4 = Cac.IsCustomClassDlcLocked( f37_local1, f37_local2, f37_local3 )
		local f37_local5 = Cac.IsCustomClassLocked( f37_local1, f37_local2, f37_local3 )
		local f37_local6 = Cac.GetLoadout( f37_local2, f37_local3 )
		local f37_local7 = nil
		if f37_arg2.properties.equipRef then
			if f37_arg2.properties.equipCategory == "Primary" and f37_local6 and f37_local6.secondary == f37_arg2.properties.equipRef then
				f37_local7 = true
			elseif f37_local4 or f37_local5 then
				f37_local7 = false
			else
				f37_local7 = not f0_local8( f37_arg0, f37_local1, f37_local3, f37_arg2.properties.equipCategory, f37_arg2.properties.equipRef, f37_arg2.properties.equipGuid )
			end
			f37_arg0.restricted = f37_local7
		else
			f37_local7 = Cac.IsCustomClassRestricted( f37_local2, f37_local3 )
			f37_arg2.haveRestrictedClasses = f37_arg2.haveRestrictedClasses or f37_local7
		end
		f37_arg0:processEvent( {
			name = "update_restricted",
			isRestricted = f37_local7
		} )
		f37_arg0:processEvent( {
			name = "update_dlc_lock",
			isDlcLocked = f37_local4
		} )
		f37_arg0:processEvent( {
			name = "update_lock",
			isLocked = f37_local5 and not f37_local4
		} )
	end
	f37_arg0:setText( f37_local0 )
end

function cacClassOptionsPopupFeeder( f38_arg0 )
	local f38_local0 = {}
	if (IsOnlineMatch() or not f38_arg0.editMatchPresets) and not f38_arg0.disableRenameButton then
		f38_local0[#f38_local0 + 1] = {
			type = "UIGenericButton",
			id = "member_option_" .. #f38_local0,
			disabled = false,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@MENU_RENAME_CAPS" ),
				button_action_func = function ( f39_arg0, f39_arg1 )
					local f39_local0 = Cac.GetCustomClassName( LUI.CacStaticLayout.ClassLoc )
					local f39_local1 = CoD.MaxClassNameLength
					if Engine.IsXB3() then
						f39_local1 = f39_local1 + 1
					end
					Engine.OpenScreenKeyboard( f39_arg1.controller, Engine.Localize( "@MENU_RENAME_IN_SYSTEM_BOX" ), f39_local0 or "", f39_local1, true, true )
				end
			}
		}
	end
	if not f38_arg0.disableCopyButton then
		f38_local0[#f38_local0 + 1] = {
			type = "UIGenericButton",
			id = "member_option_" .. #f38_local0,
			disabled = false,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@MENU_COPY_CLASS_CAPS" ),
				button_action_func = function ( f40_arg0, f40_arg1 )
					OnCopyClass( f40_arg0.properties.parent_popup.properties.callback_params.menu, f38_arg0.disableRenameButton )
					LUI.FlowManager.RequestLeaveMenu( f40_arg0.properties.parent_popup, true )
				end,
				muteAction = true
			}
		}
	end
	if Cac.HasCopyData() then
		f38_local0[#f38_local0 + 1] = {
			type = "UIGenericButton",
			id = "member_option_" .. #f38_local0,
			disabled = false,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.ToUpperCase( Engine.Localize( "@MENU_EMBLEM_LAYER_PASTE" ) ),
				button_action_func = function ( f41_arg0, f41_arg1 )
					OnPasteClass( f41_arg0.properties.parent_popup.properties.callback_params.menu, f41_arg0.properties.parent_popup.properties.callback_params.menu.selectedClassIndex )
					Cac.ClearCopyData()
					LUI.FlowManager.RequestLeaveMenu( f41_arg0.properties.parent_popup, true )
				end,
				muteAction = true
			}
		}
	end
	if f38_arg0.toggleDefaultInsteadOfClear then
		f38_local0[#f38_local0 + 1] = {
			type = "UIGenericButton",
			id = "member_option_" .. #f38_local0,
			disabled = false,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@LUA_MENU_TOGGLE_DEFAULT" ),
				button_action_func = function ( f42_arg0, f42_arg1 )
					OnToggleDefault( f42_arg0.properties.parent_popup.properties.callback_params.menu )
					LUI.FlowManager.RequestLeaveMenu( f42_arg0.properties.parent_popup, true )
				end
			}
		}
	else
		f38_local0[#f38_local0 + 1] = {
			type = "UIGenericButton",
			id = "member_option_" .. #f38_local0,
			disabled = false,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@LUA_MENU_CLEAR_CLASS" ),
				button_action_func = function ( f43_arg0, f43_arg1 )
					OnClearClass( f43_arg0.properties.parent_popup.properties.callback_params.menu )
					LUI.FlowManager.RequestLeaveMenu( f43_arg0.properties.parent_popup, true )
				end
			}
		}
	end
	return f38_local0
end

function cacClassPastePopupFeeder( f44_arg0 )
	local f44_local0 = {}
	local f44_local1 = Cac.GetCustomClassCount( LUI.CacStaticLayout.ClassLoc )
	local f44_local2 = nil
	for f44_local3 = 0, f44_local1 - 1, 1 do
		local f44_local6 = f44_local3
		f44_local0[#f44_local0 + 1] = {
			type = "UIGenericButton",
			id = "class_" .. f44_local6,
			disabled = f44_local6 == f44_arg0.selectedIndex,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.ToUpperCase( Cac.GetCustomClassName( LUI.CacStaticLayout.ClassLoc, f44_local6 ) ),
				button_action_func = function ( f45_arg0, f45_arg1 )
					OnPasteClass( f45_arg0.properties.parent_popup.properties.callback_params.menu, f44_local6 )
					LUI.FlowManager.RequestLeaveMenu( f45_arg0.properties.parent_popup, true )
					LUI.FlowManager.RequestLeaveMenuByName( "cac_class_options_popup" )
				end
			}
		}
	end
	return f44_local0
end

local f0_local9 = function ( f46_arg0, f46_arg1, f46_arg2 )
	if not f46_arg0.buttonCount then
		f46_arg0.buttonCount = 0
	end
	local f46_local0 = function ( f47_arg0, f47_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f47_arg0 )
	end
	
	LUI.MenuBuilder.BuildAddChild( f46_arg0, {
		type = "UIGenericButton",
		id = "popup_button_" .. f46_arg0.buttonCount,
		properties = {
			button_text = f46_arg1,
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = function ( f48_arg0, f48_arg1 )
				f46_arg2()
				f46_local0( f48_arg0, f48_arg1 )
			end
		}
	} )
	f46_arg0.buttonCount = f46_arg0.buttonCount + 1
end

function ResolveEquipAmbiguityPopup( f49_arg0, f49_arg1 )
	local f49_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_title = Engine.Localize( "@DEPOT_EQUIP_AMBIGUITY_TITLE" )
	} )
	local f49_local1 = f49_local0:getFirstDescendentById( "generic_selectionList_content_id" )
	local f49_local2 = CoD.TextSettings.Font21
	local f49_local3 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f49_local3.height = f49_local2.Height
	f49_local3.font = f49_local2.Font
	f49_local3.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f49_local3.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f49_local3 )
	self:setText( Engine.Localize( "@DEPOT_EQUIP_AMBIGUITY_DESC", f49_arg1.equipName ) )
	f49_local1:addElement( self )
	f0_local9( f49_local1, Engine.ToUpperCase( Engine.Localize( "@DEPOT_EQUIP_AMBIGUITY_BUTTON", f49_arg1.primaryName ) ), f49_arg1.primaryFunc )
	f0_local9( f49_local1, Engine.ToUpperCase( Engine.Localize( "@DEPOT_EQUIP_AMBIGUITY_BUTTON", f49_arg1.secondaryName ) ), f49_arg1.secondaryFunc )
	f0_local9( f49_local1, Engine.Localize( "@DEPOT_EQUIP_AMBIGUITY_BUTTON_BOTH" ), f49_arg1.bothFunc )
	return f49_local0
end

local f0_local10 = function ( f50_arg0, f50_arg1 )
	local f50_local0 = {
		popup_title = Engine.ToUpperCase( Cac.GetCustomClassName( LUI.CacStaticLayout.ClassLoc ) ),
		popup_childfeeder = cacClassOptionsPopupFeeder,
		disableRenameButton = false,
		disableCopyButton = false,
		toggleDefaultInsteadOfClear = false
	}
	if Cac.IsCarrierClassSlot( f50_arg0.properties.callback_params.menu.selectedClassIndex, LUI.CacStaticLayout.ClassLoc ) then
		f50_local0.disableRenameButton = true
		f50_local0.toggleDefaultInsteadOfClear = true
	end
	local f50_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", f50_local0 )
	f50_local1:registerEventHandler( "text_input_complete", function ( element, event )
		if event.text then
			LUI.FlowManager.RequestLeaveMenu( element, true )
		end
	end )
	f50_local1:registerEventHandler( "popup_inactive", function ( element, event )
		Cac.ClearCopyData()
	end )
	return f50_local1
end

local f0_local11 = function ( f53_arg0, f53_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_PASTE_CLASS" ),
		popup_childfeeder = cacClassPastePopupFeeder,
		selectedIndex = f53_arg0.properties.callback_params.menu.selectedClassIndex
	} )
end

function AddClassButtons( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4, f54_arg5 )
	for f54_local0 = 0, f54_arg2 - 1, 1 do
		local f54_local3 = false
		local f54_local4 = Cac.GetEquippedWeapon( "Primary", 0, LUI.CacStaticLayout.ClassLoc, f54_local0 )
		if f54_local4 ~= nil then
			f54_local3 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), f54_local4 )
		end
		if not f54_local3 then
			f54_local3 = LUI.InventoryUtils.GetSubCategoryNewStickerState( Cac.GetSelectedControllerIndex(), Cac.GetEquippedWeapon( "Secondary", 0, LUI.CacStaticLayout.ClassLoc, f54_local0 ) )
		end
		local f54_local5 = LUI.MenuBuilder.BuildAddChild( f54_arg0.list, {
			type = "UIGenericButton",
			id = "cac_class_button_" .. f54_local0 + f54_arg1,
			properties = {
				style = f54_arg3,
				text_align_without_content = LUI.Alignment.Left,
				slot = f54_local0,
				button_over_func = function ( f55_arg0, f55_arg1 )
					OnClassButtonOver( f55_arg0, f55_arg1, f54_arg0 )
				end,
				button_over_disable_func = function ( f56_arg0, f56_arg1 )
					OnClassButtonOver( f56_arg0, f56_arg1, f54_arg0 )
				end,
				button_action_func = f54_arg4,
				classLoc = LUI.CacStaticLayout.ClassLoc,
				isAxisButton = f54_arg5,
				canShowRestricted = true,
				allowDisabledAction = false,
				canShowLocked = true,
				showNewSticker = f54_local3
			},
			handlers = {
				button_action_disable = function ( f57_arg0, f57_arg1 )
					f57_arg0.properties:button_action_func( f57_arg1 )
				end,
				refresh_class_name = function ( f58_arg0, f58_arg1 )
					RefreshClassButton( f58_arg0, f58_arg1, f54_arg0 )
				end
			}
		} )
		f54_local5.menu = f54_arg0
		if f54_local0 == f54_arg0.selectedClassIndex then
			f54_local5.listDefaultFocus = true
		end
	end
end

function CacMenu( f59_arg0, f59_arg1 )
	Cac.ClearCopyData()
	local f59_local0 = "@MENU_CREATE_A_CLASS_CAPS"
	local f59_local1 = nil
	local f59_local2 = OnClassButtonAction
	local f59_local3, f59_local4, f59_local5, f59_local6 = nil
	local f59_local7 = 10
	local f59_local8 = false
	local f59_local9 = false
	local f59_local10 = f59_arg1.equipRef ~= nil
	Cac.ClearEditRemoveWeapon()
	if f59_arg1 then
		if f59_arg1.editMatchPresets then
			f59_local0 = "@LUA_MENU_PRESET_CLASSES_CAPS"
			f59_local3 = "defaultClassesTeam2"
			if IsCurrentGameTypeteamBased() then
				f59_local4 = "defaultClassesTeam1"
				f59_local5 = AAR.GetFactionNameByRef( Lobby.GetMapCustomField( "allieschar" ) )
				f59_local6 = AAR.GetFactionNameByRef( Lobby.GetMapCustomField( "axischar" ) )
			end
			f59_local7 = Cac.GetCustomClassCount( f59_local3 )
			f59_local8 = true
		end
		if f59_local10 then
			f59_local0 = "@LUA_MENU_EQUIP_CAPS"
			f59_local1 = Cac.GetWeaponName( f59_arg1.equipCategory, f59_arg1.equipRef )
			f59_local2 = function ( f60_arg0, f60_arg1 )
				OnEquipToClass( f60_arg0, f60_arg1, f59_arg1.equipRef, f59_arg1.equipCategory, f59_arg1.equipGuid )
			end
			
		end
	end
	if f59_local3 then
		LUI.CacStaticLayout.ClassLoc = f59_local3
	else
		LUI.CacStaticLayout.ClassLoc = Cac.GetCustomClassLoc()
	end
	local f59_local11 = GenericButtonSettings.Styles.FlatButton
	local f59_local12 = Cac.GetCustomClassCount( LUI.CacStaticLayout.ClassLoc )
	local f59_local13 = f59_local7 * f59_local11.height
	local f59_local14 = CoD.DesignGridHelper( 6 )
	if not f59_local8 and (IsPrivateMatch() or Engine.GetSystemLink()) then
		f59_local7 = f59_local12
	end
	local f59_local15 = nil
	if f59_local7 < f59_local12 then
		f59_local15 = 35
		f59_local9 = true
	end
	local f59_local16 = LUI.MenuTemplate.new( f59_arg0, {
		menu_title = Engine.Localize( f59_local0 ),
		menu_title_width = CoD.DesignGridHelper( 8, 1 ),
		menu_top_indent = f59_local15,
		menu_width = f59_local14,
		menu_height = f59_local13,
		persistentBackground = PersistentBackground.Variants.VirtualLobby
	} )
	f59_local16.properties = f59_arg1
	if f59_local1 == nil then
		if f59_local8 then
			f59_local1 = "@LUA_MENU_GAME_SETUP_CAPS"
		elseif IsPublicMatch() then
			f59_local1 = "@PLATFORM_PLAY_ONLINE"
		elseif IsPrivateMatch() then
			f59_local1 = "@LUA_MENU_PRIVATE_MATCH_LOBBY"
		elseif IsOfflineMatch() then
			f59_local1 = "@PLATFORM_SYSTEM_LINK_TITLE"
		end
	end
	if f59_local1 ~= nil then
		f59_local16:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( f59_local1 ) ) )
	end
	f59_local16:registerEventHandler( "gain_focus", OnCacGainFocus )
	f59_local16:registerEventHandler( "restore_focus", OnCacRestoreFocus )
	if not f59_local8 then
		f59_local16:registerEventHandler( "menu_close", Cac.PlayerJoinedEvent )
	end
	f59_local16.availableClassCount = f59_local12
	f59_local16.classesPerPage = f59_local7
	f59_local16.numClassButtons = f59_local7
	if Cac.OverridePlayerDataFaction then
		f59_local16.selectedClassIndex = Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc )
	else
		local f59_local17 = Engine.GetPlayerData( f59_local16.exclusiveController, CoD.StatsGroup.Common, "lastGame", "classIndex" )
		if f59_local17 == 0 or f59_local17 >= 100 then
			f59_local16.selectedClassIndex = 0
		else
			f59_local16.selectedClassIndex = f59_local17 - 1
		end
	end
	f59_local16.currentPage = math.ceil( (f59_local16.selectedClassIndex + 1) / f59_local7 )
	local self = LUI.UIElement.new( CoD.CreateState( CoD.DesignGridHelper( 6, 1 ), 60, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "cac_static_container"
	f59_local16:addElement( self )
	
	local staticLayout = LUI.CacStaticLayout.new( nil, nil, true )
	staticLayout:disableTreeFocus()
	self:addElement( staticLayout )
	f59_local16.staticLayout = staticLayout
	
	f59_local16:AddListDivider()
	if f59_local9 then
		local f59_local20 = ""
		local f59_local21 = ""
		if CoD.UsingController() then
			if Engine.IsVita( f59_arg1.exclusiveController ) then
				f59_local20 = Engine.Localize( "LUA_MENU_PAD_LEFT_TRIGGER_BUTTON" )
				f59_local21 = Engine.Localize( "LUA_MENU_PAD_RIGHT_TRIGGER_BUTTON" )
			else
				f59_local20 = Engine.Localize( "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" )
				f59_local21 = Engine.Localize( "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" )
			end
		else
			f59_local20 = Engine.Localize( "PLATFORM_KB_LEFT_SHOULDER_BUTTON" )
			f59_local21 = Engine.Localize( "PLATFORM_KB_RIGHT_SHOULDER_BUTTON" )
		end
		local self = function ( f61_arg0, f61_arg1 )
			CacOnTabLeft( f61_arg0, f61_arg1, f59_local16 )
		end
		
		local f59_local23 = function ( f62_arg0, f62_arg1 )
			CacOnTabRight( f62_arg0, f62_arg1, f59_local16 )
		end
		
		local self = LUI.UIElement.new( CoD.CreateState( 0, GenericMenuDims.MenuStartY - 7, GenericMenuDims.menu_width_standard, GenericMenuDims.MenuStartY + f59_local15, CoD.AnchorTypes.TopLeft ) )
		f59_local16:addElement( self )
		local self = nil
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
			self = LUI.UIText.new( CoD.CreateState( -70, 0, -50, 20, CoD.AnchorTypes.Top ) )
			self:setText( f59_local20 )
		else
			local self = CoD.CreateState( 25, 0, -50, nil, CoD.AnchorTypes.TopLeft )
			self.font = CoD.TextSettings.TitleFontMediumLarge.Font
			self.height = 20
			self = LUI.UIButtonText.new( self, Engine.ToUpperCase( Engine.Localize( f59_local20 ) ), false, false, false, false, self, function ()
				return f59_local16.currentPage == 1
			end )
		end
		local self = nil
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
			self = LUI.UIText.new( CoD.CreateState( 70, 0, 90, 20, CoD.AnchorTypes.Top ) )
			self:setText( f59_local21 )
		else
			local self = CoD.CreateState( f59_local14 - 45, 0, 0, nil, CoD.AnchorTypes.TopLeft )
			self.font = CoD.TextSettings.TitleFontMediumLarge.Font
			self.height = 20
			self = LUI.UIButtonText.new( self, Engine.ToUpperCase( Engine.Localize( f59_local21 ) ), false, false, false, false, f59_local23, function ()
				return f59_local16.currentPage == math.ceil( f59_local16.availableClassCount / f59_local16.classesPerPage )
			end )
		end
		local self = LUI.UIText.new( CoD.CreateState( 0, 2, 0, 18, CoD.AnchorTypes.TopLeftRight ) )
		local f59_local28 = 5
		local f59_local29 = math.ceil( f59_local12 / f59_local7 )
		local f59_local30 = GenericMenuDims.menu_width_standard
		local f59_local31 = f59_local30 / f59_local29
		local self = LUI.UIHorizontalList.new( {
			top = -4,
			spacing = 0,
			alignment = LUI.Alignment.Center,
			height = f59_local28 + 10,
			width = f59_local30
		} )
		local f59_local33 = function ( f65_arg0, f65_arg1 )
			f65_arg0.pipList:closeChildren()
			for f65_local0 = 1, f59_local29, 1 do
				local f65_local3 = f65_local0
				local self = nil
				self = LUI.UIBorder.new( {
					width = f59_local31,
					height = f59_local28,
					color = Colors.mw1_green,
					material = RegisterMaterial( "white" ),
					borderThickness = 1
				} )
				if f65_local3 == f65_arg0.currentPage then
					local f65_local5 = 4
					local f65_local6 = 6
					local f65_local7 = CoD.CreateState( -f65_local5, -f65_local6, f65_local5, f65_local6, CoD.AnchorTypes.All )
					f65_local7.material = RegisterMaterial( "h1_tabs_states_selected" )
					f65_local7.alpha = 0.35
					local self = LUI.UIImage.new( f65_local7 )
					self:setup3SliceRatio( 8, 0.25 )
					self:addElement( self )
				elseif Engine.IsPC() then
					local f65_local5 = 4
					local f65_local6 = 6
					local f65_local7 = CoD.CreateState( -f65_local5, -f65_local6, f65_local5, f65_local6, CoD.AnchorTypes.All )
					f65_local7.material = RegisterMaterial( "h1_tabs_states_selected" )
					f65_local7.alpha = 0
					local self = LUI.UIImage.new( f65_local7 )
					self:registerAnimationState( "mouseOver", {
						alpha = 0.25
					} )
					self:setup3SliceRatio( 8, 0.25 )
					self:addElement( self )
					local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, 10, CoD.AnchorTypes.All ) )
					self:setHandleMouseButton( true )
					self:setHandleMouseMove( true )
					self.m_requireFocusType = FocusType.MouseOver
					self:registerEventHandler( "leftmousedown", function ( element, event )
						Engine.PlaySound( CoD.SFX.MenuAccept )
						CacOnTabClick( element, event, f59_local16, f65_local3 )
					end )
					self:registerEventHandler( "mouseenter", function ( element, event )
						self:animateToState( "mouseOver" )
					end )
					self:registerEventHandler( "mouseleave", function ( element, event )
						self:animateToState( "default" )
					end )
					self:addElement( self )
				end
				f65_arg0.pipList:addElement( self )
			end
		end
		
		f59_local16:registerEventHandler( "update_pips", f59_local33 )
		self:addElement( self )
		self:addElement( self )
		self:addElement( self )
		self:addElement( self )
		f59_local16.headerText = self
		f59_local16.pipList = self
		f59_local33( f59_local16, nil )
		local self = LUI.UIBindButton.new()
		f59_local16:addElement( self )
		self:registerEventHandler( "button_shoulderl", self )
		self:registerEventHandler( "button_shoulderr", f59_local23 )
	end
	if f59_local4 ~= nil then
		f59_local16:AddHeader( f59_local5 )
		AddClassButtons( f59_local16, 0, f59_local7, f59_local11, f59_local2, false )
		f59_local16:AddHeader( f59_local6 )
		LUI.CacStaticLayout.ClassLoc = f59_local4
		local f59_local20 = Cac.GetCustomClassCount( f59_local4 )
		AddClassButtons( f59_local16, f59_local7, f59_local20, f59_local11, f59_local2, true )
		f59_local16.numClassButtons = f59_local16.numClassButtons + f59_local20
	else
		AddClassButtons( f59_local16, 0, f59_local7, f59_local11, f59_local2, false )
	end
	f59_local16:CreateBottomDivider()
	f59_local16:AddBottomDividerToList()
	local f59_local20 = LUI.CacFactionWidget.new( f59_local16, f59_local16.exclusiveController, true )
	f59_local16.factionWidget = f59_local20
	f59_local16:addElement( f59_local20 )
	Cac.NotifyVLClassChange( f59_local16.exclusiveController, f59_local16.selectedClassIndex, LUI.CacStaticLayout.ClassLoc )
	if not f59_local8 and not Engine.GetSystemLink() then
		local f59_local21 = CoD.CreateState( 0, nil, 300, -115, CoD.AnchorTypes.BottomLeft )
		f59_local21.height = 12
		f59_local21.alpha = 0
		f59_local21.color = Colors.mw1_green
		f59_local21.font = CoD.TextSettings.TitleFontMediumLarge.Font
		local self = LUI.UIText.new( f59_local21 )
		self:registerAnimationState( "visible", {
			alpha = 1
		} )
		self:setText( Engine.Localize( "@LUA_MENU_CUSTOM_SLOT_UNLOCK_PRESTIGE" ) )
		f59_local16.unlockBlurb = self
		f59_local16:addElement( self )
	end
	f59_local16:AddCurrencyInfoPanel()
	return f59_local16
end

LUI.MenuBuilder.registerType( "CacMenu", CacMenu )
LUI.MenuBuilder.registerPopupType( "cac_class_options_popup", f0_local10 )
LUI.MenuBuilder.registerPopupType( "cac_class_paste_popup", f0_local11 )
LUI.MenuBuilder.registerPopupType( "ResolveEquipAmbiguityPopup", ResolveEquipAmbiguityPopup )
VLobby.InitMenuMode( "CacMenu", VirtualLobbyModes.LUI_MODE_CAC, PersistentBackground.FadeFromBlackSlow, PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
