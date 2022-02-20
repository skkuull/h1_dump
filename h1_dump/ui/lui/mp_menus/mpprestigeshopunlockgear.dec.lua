local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnButtonAction( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestAddMenu( nil, f1_arg0.option.menu or "CacDetailsPermanentUnlocks", true, f1_arg1.controller, nil, {
		storageCategory = f1_arg0.option.category,
		menuTitle = f1_arg0.option.name,
		showAttributes = f1_arg0.option.showAttributes,
		subCategories = f1_arg0.option.subCategories,
		weaponType = f1_arg0.option.weaponCategory,
		optionsForVL = {
			{
				optionStorageCategory = f1_arg0.option.category
			}
		},
		showUnlocks = true
	} )
end

function AddDetailsPanel( f2_arg0 )
	local f2_local0 = CoD.DesignGridHelper( 8 )
	local f2_local1 = LUI.MenuTemplate.ListTop + 26
	local self = LUI.UIElement.new( CoD.CreateState( f2_local0, f2_local1, f2_local0 + CoD.DesignGridHelper( 13 ), f2_local1 + CoD.DesignGridHelper( 9 ), CoD.AnchorTypes.TopLeft ) )
	self:setClass( LUI.PlaylistDetailsPanel )
	self:registerEventHandler( "update_playlist_panel", function ( element, event )
		if event.category and event.index then
			LUI.PlaylistDetailsPanel.Update( element, GetPlaylistData( event.category, event.index ), event.category == 0 )
		elseif event.panelData then
			LUI.PlaylistDetailsPanel.Update( element, event.panelData, event.category == 0, event.isGamemodes )
		end
	end )
	local f2_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f2_local3.color = {
		r = 0.08,
		g = 0.08,
		b = 0.08
	}
	f2_local3.material = RegisterMaterial( "white" )
	f2_local3.alpha = 0.8
	self:addElement( LUI.UIImage.new( f2_local3 ) )
	self:addElement( LUI.DecoFrame.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ), LUI.DecoFrame.Grey ) )
	local f2_local4 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local4.height = 11
	f2_local4.width = 11
	f2_local4.left = -33
	f2_local4.top = 12
	f2_local4.material = RegisterMaterial( "h1_ui_deco_green_triangle" )
	self:addElement( LUI.UIImage.new( f2_local4 ) )
	local f2_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f2_local5.left = 4
	f2_local5.right = -4
	f2_local5.bottom = -4
	f2_local5.top = 4
	local self = LUI.UIElement.new( f2_local5 )
	self:setUseStencil( true )
	self:addElement( self )
	local f2_local7 = {
		r = 0.07,
		g = 0.07,
		b = 0.07
	}
	local f2_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeftRight )
	f2_local8.alpha = 0.8
	f2_local8.height = 72
	f2_local8.color = f2_local7
	self:addElement( LUI.UIImage.new( f2_local8 ) )
	local f2_local9 = CoD.CreateState( nil, -40, nil, nil, CoD.AnchorTypes.Top )
	f2_local9.width = 320
	f2_local9.height = 320
	f2_local9.material = RegisterMaterial( "h1_ui_icon_prestige_unlocks" )
	self:addElement( LUI.UIImage.new( f2_local9 ) )
	local f2_local10 = CoD.TextSettings.Font46
	local f2_local11 = CoD.CreateState( 12, nil, 12, -84, CoD.AnchorTypes.BottomLeftRight )
	f2_local11.font = f2_local10.Font
	f2_local11.height = f2_local10.Height
	f2_local11.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f2_local11 )
	self:addElement( self )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCKS" ) ) )
	local f2_local13 = CoD.TextSettings.Font21
	local f2_local14 = CoD.CreateState( 12, nil, -12, -48, CoD.AnchorTypes.BottomLeftRight )
	f2_local14.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f2_local14.height = f2_local13.Height
	f2_local14.font = f2_local13.Font
	f2_local14.lineSpacingRatio = 0.3
	local self = LUI.UIText.new( f2_local14 )
	self:addElement( self )
	self:setText( Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCKS_DESC" ) )
	f2_arg0:addElement( self )
end

function OnButtonOver( f4_arg0, f4_arg1 )
	f4_arg0.menu.desc:setText( f4_arg0.desc )
end

function menu_unlock_gear( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.MenuTemplate.new( f5_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCKS" ) ),
		menu_top_indent = 32
	} )
	local f5_local1 = AAR.GetPrestigeLevel( f5_arg1.exclusiveController )
	if f5_local1 > 0 then
		f5_local0:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@LUA_MP_FRONTEND_PRESTIGE_NUM", f5_local1 ) ) )
	else
		f5_local0:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PRESTIGE" ) ) )
	end
	Cac.NotifyVirtualLobby( "lootscreen_weapon_highlighted", "none" )
	local f5_local2 = {
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
	local f5_local3 = {
		{
			name = "@LUA_MENU_PRIMARY",
			category = "Primary",
			weaponCategory = "weapon_assault",
			desc = "@LUA_MENU_UNLOCK_DESC_PRIMARY",
			subCategories = f5_local2,
			showAttributes = true
		},
		{
			name = "@MPUI_SIDE_ARM",
			category = "Secondary",
			weaponCategory = "weapon_pistol",
			desc = "@LUA_MENU_UNLOCK_DESC_SECONDARY",
			showAttributes = true
		},
		{
			name = "@LUA_MENU_ATTACHMENT_CAPS",
			category = "Primary",
			weaponCategory = "weapon_assault",
			desc = "@LUA_MENU_UNLOCK_DESC_ATTACHMENT",
			subCategories = f5_local2,
			showAttributes = false,
			menu = "CacDetailsPermanentUnlocksWeaponForAttachments"
		},
		{
			name = "@MPUI_PERK1",
			category = "Perk_Slot1",
			weaponCategory = "perk",
			desc = "@LUA_MENU_UNLOCK_DESC_PERK"
		},
		{
			name = "@MPUI_PERK2",
			category = "Perk_Slot2",
			weaponCategory = "perk",
			desc = "@LUA_MENU_UNLOCK_DESC_PERK"
		},
		{
			name = "@MPUI_PERK3",
			category = "Perk_Slot3",
			weaponCategory = "perk",
			desc = "@LUA_MENU_UNLOCK_DESC_PERK"
		}
	}
	LUI.CacStaticLayout.ClassLoc = "customClasses"
	Cac.SetSelectedControllerIndex( f5_arg1.exclusiveController )
	local f5_local4 = CoD.TextSettings.Font21
	local f5_local5 = CoD.CreateState( 0, 380, 240, nil, CoD.AnchorTypes.TopLeft )
	f5_local5.height = f5_local4.Height
	f5_local5.font = f5_local4.Font
	f5_local5.color = Colors.mw1_green
	f5_local5.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	
	local desc = LUI.UIText.new( f5_local5 )
	f5_local0:addElement( desc )
	f5_local0.desc = desc
	
	local f5_local7 = nil
	for f5_local8 = 1, #f5_local3, 1 do
		f5_local7 = f5_local0:AddButton( f5_local3[f5_local8].name, OnButtonAction )
		f5_local7.option = f5_local3[f5_local8]
		f5_local7.menu = f5_local0
		f5_local7.desc = Engine.Localize( f5_local3[f5_local8].desc )
		f5_local7.weaponCategory = f5_local3[f5_local8].weaponCategory
		f5_local7:registerEventHandler( "button_over", OnButtonOver )
	end
	f5_local0:AddBackButton()
	AddDetailsPanel( f5_local0 )
	local f5_local8 = Cac.GetPrestigeTokens( f5_arg1.exclusiveController )
	local f5_local9 = CoD.TextSettings.Font21
	local f5_local10 = CoD.CreateState( 30, 90, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f5_local10.alignment = LUI.Alignment.Left
	f5_local10.height = f5_local9.Height
	f5_local10.font = f5_local9.Font
	local f5_local11 = nil
	if f5_local8 > 1 or f5_local8 == 0 then
		f5_local11 = Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCK_COUNT", f5_local8 )
	else
		f5_local11 = Engine.Localize( "@LUA_MENU_PERMANENT_UNLOCK_COUNT_SINGLE" )
	end
	local self = LUI.UIText.new( f5_local10 )
	self:setText( f5_local11 )
	f5_local0:addElement( self )
	local f5_local13 = 20
	local f5_local14 = CoD.CreateState( 0, 86, nil, nil, CoD.AnchorTypes.TopLeft )
	f5_local14.width = f5_local13
	f5_local14.height = f5_local13
	f5_local14.material = RegisterMaterial( "h1_ui_icon_unlock_token" )
	f5_local0:addElement( LUI.UIImage.new( f5_local14 ) )
	return f5_local0
end

function PerformPermanentUnlock( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = nil
	if f6_arg2 ~= nil and string.len( f6_arg2 ) > 0 then
		f6_local0 = Cac.GetPrestigeShopChallenge( f6_arg2 )
		if f6_local0 ~= nil and f6_local0 ~= "" then
			Engine.SetPlayerData( f6_arg1.controller, CoD.StatsGroup.Ranked, "challengeState", f6_local0, 2 )
			Engine.SetPlayerData( f6_arg1.controller, CoD.StatsGroup.Ranked, "challengeProgress", f6_local0, 2 )
			Cac.DecrementPrestigeTokens( f6_arg1.controller )
			LUI.FlowManager.RequestRestoreMenu( f6_arg0, f6_arg3, true, f6_arg1.controller, true )
		end
	end
end

function UnlockConfirmationDialog( f7_arg0, f7_arg1 )
	local f7_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_UNLOCK_CONFIRMATION_CAPS" ),
		padding_top = 0
	} )
	local f7_local1 = f7_local0:getFirstDescendentById( "generic_selectionList_content_id" )
	local f7_local2 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f7_local2.height = 220
	local self = LUI.UIElement.new( f7_local2 )
	f7_local1:addElement( self )
	local f7_local4 = RegisterMaterial( Cac.GetWeaponImageName( f7_arg1.category, f7_arg1.itemID ) )
	local f7_local5, f7_local6 = GetMaterialDimensions( f7_local4 )
	local f7_local7 = 160
	local f7_local8 = CoD.CreateState( nil, 0, nil, nil, CoD.AnchorTypes.Top )
	f7_local8.width = f7_local7 * f7_local5 / f7_local6
	f7_local8.height = f7_local7
	f7_local8.material = f7_local4
	local self = LUI.UIImage.new( f7_local8 )
	self:addElement( self )
	local f7_local10 = 30
	local f7_local11 = CoD.CreateState( 20, f7_local7, nil, nil, CoD.AnchorTypes.TopLeft )
	f7_local11.width = f7_local10
	f7_local11.height = f7_local10
	f7_local11.material = RegisterMaterial( "h1_ui_icon_unlocked" )
	self:addElement( LUI.UIImage.new( f7_local11 ) )
	local f7_local12 = CoD.TextSettings.Font21
	local f7_local13 = CoD.CreateState( 60, f7_local7, -20, nil, CoD.AnchorTypes.TopLeftRight )
	f7_local13.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f7_local13.height = f7_local12.Height
	f7_local13.font = f7_local12.Font
	f7_local13.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f7_local13 )
	self:addElement( self )
	local f7_local15 = nil
	if f7_arg1.parentWeaponID then
		f7_local15 = Engine.Localize( "@LUA_MENU_UNLOCK_CONFIRMATION_ATTACHMENT_DESC", Cac.GetWeaponName( f7_arg1.category, f7_arg1.itemID ), Cac.GetWeaponName( f7_arg1.parentCategory, f7_arg1.parentWeaponID ) )
	elseif f7_arg1.category == "Primary" or f7_arg1.category == "Secondary" then
		f7_local15 = Engine.Localize( "@LUA_MENU_UNLOCK_CONFIRMATION_WEAPON_DESC", Cac.GetWeaponName( f7_arg1.category, f7_arg1.itemID ) )
	else
		f7_local15 = Engine.Localize( "@LUA_MENU_UNLOCK_CONFIRMATION_PERK_DESC", Cac.GetWeaponName( f7_arg1.category, f7_arg1.itemID ) )
	end
	self:setText( f7_local15 )
	local f7_local16 = CoD.TextSettings.Font18
	local f7_local17 = CoD.CreateState( nil, 20, -4, nil, CoD.AnchorTypes.TopRight )
	f7_local17.alignment = LUI.Alignment.Center
	f7_local17.width = 12
	f7_local17.height = f7_local16.Height
	f7_local17.font = f7_local16.Font
	local self = LUI.UIText.new( f7_local17 )
	self:addElement( self )
	self:setText( Cac.GetPrestigeTokens( f7_arg1.exclusiveController ) )
	local f7_local19 = 20
	local f7_local20 = CoD.CreateState( nil, 16, -20, nil, CoD.AnchorTypes.TopRight )
	f7_local20.width = f7_local19
	f7_local20.height = f7_local19
	f7_local20.material = RegisterMaterial( "h1_ui_icon_unlock_token" )
	self:addElement( LUI.UIImage.new( f7_local20 ) )
	if f7_arg1.parentWeaponID and not Cac.IsClassItemUnlocked( f7_arg1.exclusiveController, f7_arg1.parentWeaponID ) then
		local f7_local21 = CoD.CreateState( nil, 24, nil, nil, CoD.AnchorTypes.None )
		f7_local21.width = 360
		f7_local21.height = f7_local12.Height
		f7_local21.alignment = LUI.Alignment.Center
		f7_local21.color = {
			r = 0.87,
			g = 0.26,
			b = 0.26
		}
		f7_local21.font = f7_local12.Font
		local self = LUI.UIText.new( f7_local21 )
		self:addElement( self )
		self:setText( Engine.Localize( "@LUA_MENU_UNLOCK_CONTINGENCY_WARNING", Cac.GetWeaponName( f7_arg1.parentCategory, f7_arg1.parentWeaponID ) ) )
		local f7_local23 = 36
		local f7_local24 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
		f7_local24.width = f7_local23
		f7_local24.height = f7_local23
		f7_local24.material = RegisterMaterial( "h1_ui_icon_unlock_warning" )
		self:addElement( LUI.UIImage.new( f7_local24 ) )
	end
	LUI.MenuBuilder.BuildAddChild( f7_local1, {
		type = "UIGenericButton",
		id = "confirm",
		properties = {
			button_text = Engine.Localize( "@LUA_MENU_PERMANENTLY_UNLOCK_CAPS" ),
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = function ( f8_arg0, f8_arg1 )
				PerformPermanentUnlock( f8_arg0, f8_arg1, f7_arg1.permanentRef, f7_arg1.menuToRestore )
			end
		}
	} )
	local f7_local21 = LUI.MenuBuilder.BuildAddChild( f7_local1, {
		type = "UIGenericButton",
		id = "cancel",
		properties = {
			button_text = Engine.Localize( "@LUA_MENU_CANCEL_UNLOCK_CAPS" ),
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = MBh.LeaveMenu()
		}
	} )
	f7_local21.listDefaultFocus = true
	return f7_local0
end

LUI.MenuBuilder.registerType( "menu_unlock_gear", menu_unlock_gear )
LUI.MenuBuilder.registerPopupType( "UnlockConfirmationDialog", UnlockConfirmationDialog )
LockTable( _M )
