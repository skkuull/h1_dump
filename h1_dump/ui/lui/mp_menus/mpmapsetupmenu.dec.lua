local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MapSetup = InheritFrom( LUI.MenuTemplate )
LUI.MapSetup.MapFeeder = function ( f1_arg0 )
	local f1_local0 = {
		mp_virtual_lobb = true,
		mp_vlobby_refra = true,
		mp_vlobby_laser = true,
		mp_vlobby_room = true
	}
	local f1_local1 = Lobby.GetMapFeederCount()
	local f1_local2 = LUI.FlowManager.GetMenuScopedDataByMenuName( "mapsetup_menu_main" ) or {}
	for f1_local3 = 0, f1_local1 - 1, 1 do
		local f1_local6 = Lobby.GetMapLoadNameByIndex( f1_local3 )
		if not f1_local0[f1_local6] then
			local f1_local7 = false
			if Lobby.GetMapSupportsAliensByIdx then
				if Engine.IsAliensMode() and Lobby.GetMapSupportsAliensByIdx( f1_local3 ) then
					f1_local7 = true
				elseif not Engine.IsAliensMode() and not Lobby.GetMapSupportsAliensByIdx( f1_local3 ) then
					f1_local7 = true
				end
			else
				f1_local7 = true
			end
			if f1_local7 then
				local f1_local8 = MBh.EmitEventToRoot( {
					name = "select_map",
					idx = f1_local3
				} )
				local f1_local9 = MBh.EmitEventToRoot( {
					name = "update_map",
					idx = f1_local3
				} )
				local f1_local10 = f1_local6 == Engine.GetDvarString( "ui_mapname" )
				if f1_local6 == "bonus_map" or f1_local6 == "more_maps" then
					if Engine.StreamingIsFullyInstalled() then
						local f1_local11 = f1_arg0:AddButton( GetButtonMapName( f1_local3 ), f1_local8, nil, nil, nil, {
							button_text = GetButtonMapName( f1_local3 ),
							button_over_func = f1_local9
						} )
						f1_local11:registerEventHandler( "element_refresh", function ( element, event )
							element:setText( GetButtonMapName( element.properties.button_map_index ) )
						end )
					end
				end
				local f1_local11 = {
					button_text = Lobby.GetMapNameByIndex( f1_local3 ),
					variant = GenericButtonSettings.Variants.Checkbox,
					content_margin = 0,
					content_width = 60,
					button_over_func = f1_local9
				}
				local f1_local12 = nil
				if f1_local10 then
					f1_local11.text_default_color = Colors.mw1_green
				end
				if Engine.ControllerHasMap( f1_arg0.exclusiveController, f1_local6 ) == false then
					f1_local8 = NoBonusMapsAction
					f1_local11.customIcon = {
						material = "h1_ui_download_arrow",
						initVisible = true,
						size = 14
					}
					local f1_local13 = Engine.GetOnlineGame()
					if not f1_local13 then
						f1_local13 = Engine.GetDvarBool( "ui_onlineRequired" )
					end
					f1_local12 = not f1_local13
					if f1_local12 then
						f1_local11.button_over_disable_func = f1_local9
					end
				end
				local f1_local13 = f1_arg0:AddButton( Lobby.GetMapNameByIndex( f1_local3 ), f1_local8, f1_local12, nil, nil, f1_local11 )
				f1_local13.listDefaultFocus = f1_local10
				f1_local13:registerEventHandler( "element_refresh", function ( element, event )
					element:setText( Lobby.GetMapNameByIndex( element.properties.button_map_index ) )
				end )
			end
		end
	end
end

function MapSetupCreate( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg0 ) or {}
	f4_local0.rotationAllowed = f4_arg0.properties.rotationAllowed
	local f4_local1 = LUI.ButtonHelperText.CommonEvents.addBackButton
	f4_local1.immediate = true
	f4_arg0:dispatchEventToRoot( f4_local1 )
	f4_arg0:dispatchEventToRoot( {
		name = "update_lists",
		immediate = true
	} )
	UpdateMapRotation( f4_arg0, f4_arg1 )
end

function UpdateMapRotation( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f5_arg0 )
	local f5_local1 = Lobby.GetMapFeederCount()
	for f5_local2 = 0, f5_local1 - 1, 1 do
		local f5_local5 = f5_arg0:getFirstDescendentById( "mapsetup_menu_main_button_" .. f5_local2 )
		if f5_local5 ~= nil then
			f5_local5:processEvent( {
				name = "set_checked",
				checkBox = Lobby.IsMapInRotation( Lobby.GetMapLoadNameByIndex( f5_local2 ) ),
				dispatchChildren = true
			} )
		end
	end
end

function GetButtonMapName( f6_arg0 )
	local f6_local0 = Lobby.GetMapNameByIndex( f6_arg0 )
	if Engine.MarkLocalized( f6_local0 ) == Engine.Localize( "DLC_MAPSTORE" ) then
		f6_local0 = Engine.Localize( "LUA_MENU_MORE_MAPS" )
	end
	return f6_local0
end

function UpdateMap( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0:getFirstDescendentById( "mapsetup_mapname" )
	local f7_local1 = f7_arg0:getFirstDescendentById( "mapsetup_mapdesc" )
	local f7_local2 = f7_arg0:getFirstDescendentById( "mapsetup_mapimage" )
	local f7_local3 = f7_arg0:getFirstDescendentById( "mapsetup_details_window" )
	local f7_local4 = f7_arg0:getFirstDescendentById( "mapsetup_missing_window" )
	local f7_local5 = f7_arg1.idx
	local f7_local6 = Lobby.GetMapDescByIndex( f7_local5 )
	local f7_local7 = Lobby.GetMapNameByIndex( f7_local5 )
	if f7_local0 then
		f7_local0:setText( Engine.ToUpperCase( f7_local7 ) )
	end
	if f7_local1 then
		f7_local1:setText( Engine.Localize( f7_local6 ) )
	end
	f7_arg0:processEvent( {
		name = "adjust_desc_text",
		dispatchChildren = true,
		descText = f7_local6
	} )
	if f7_local2 then
		local f7_local8 = Lobby.GetMapLoadNameByIndex( f7_local5 )
		if f7_local8 == "bonus_map" or f7_local8 == "more_maps" then
			f7_local2:setImage( RegisterMaterial( "loadscreen_mp_bonusmaps" ) )
		else
			f7_local2:setImage( RegisterMaterial( Lobby.GetMapImageByIndex( f7_local5 ) ) )
		end
	end
	local f7_local8 = nil
	local f7_local9 = Engine.GetDvarString( "ui_mapname" )
	if f7_local9 then
		f7_local8 = Game.GetMapDisplayName( f7_local9 )
	end
	local f7_local10 = f7_local3:getChildById( "chosenIcon" )
	if f7_local8 == f7_local7 and f7_local10 == nil then
		local f7_local11 = RegisterMaterial( "h1_ui_menu_icon_equipped" )
		local f7_local12 = 7
		local f7_local13 = 28
		local f7_local14 = 16
		local self = LUI.UIImage.new( {
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			width = f7_local14,
			height = f7_local14,
			top = f7_local12 + f7_local13,
			right = -(f7_local12 - 1),
			material = f7_local11
		} )
		self.id = "chosenIcon"
		f7_local3:addElement( self )
	elseif f7_local8 ~= f7_local7 and f7_local10 ~= nil then
		f7_local3:removeElement( f7_local10 )
		f7_local10 = nil
	end
	f7_local3:show()
	if Engine.ControllerHasMap( f7_arg0.m_ownerController, Lobby.GetMapLoadNameByIndex( f7_local5 ) ) == false then
		f7_local4:show()
	else
		f7_local4:hide()
	end
end

function PurchaseMapsAction( f8_arg0, f8_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
	Sns.OpenStoreMenu( f8_arg1.controller, "map_select_menu", LUI.ComScore.ScreenID.MapSelect, LUI.ComScore.StoreSource.MenuButton )
end

function GetMoreMaps( f9_arg0, f9_arg1 )
	local f9_local0 = {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = nil,
		yes_action = nil
	}
	if LUI.MenuTemplate.CanShowStore() then
		if Engine.GetOnlineGame() then
			f9_local0.message_text = Engine.Localize( "@LUA_MENU_PURCHASE_MAPS" )
			f9_local0.yes_action = PurchaseMapsAction
			LUI.FlowManager.RequestAddMenu( f9_arg0, "generic_yesno_popup", true, f9_arg1.controller, false, f9_local0 )
		else
			f9_local0.message_text = Engine.Localize( "@LUA_MENU_PURCHASE_MAPS_OFFLINE" )
			LUI.FlowManager.RequestAddMenu( f9_arg0, "generic_confirmation_popup", true, f9_arg1.controller, false, f9_local0 )
		end
	elseif Engine.IsPS4() then
		Store.ShowEmptyStoreDialog( f9_arg1.controller )
	else
		f9_local0.message_text = Engine.Localize( "@LUA_MENU_STORE_RESTRICTED" )
		LUI.FlowManager.RequestAddMenu( f9_arg0, "generic_confirmation_popup", true, f9_arg1.controller, false, f9_local0 )
	end
end

function NoBonusMapsAction( f10_arg0, f10_arg1 )
	local f10_local0 = Engine.GetOnlineGame()
	if not f10_local0 then
		f10_local0 = Engine.GetDvarBool( "ui_onlineRequired" )
	end
	if f10_local0 then
		LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
		Sns.OpenStoreMenu( f10_arg1.controller, "map_select_menu", LUI.ComScore.ScreenID.MapSelect, LUI.ComScore.StoreSource.MenuButton )
	end
end

function SelectMap( f11_arg0, f11_arg1 )
	local f11_local0 = Lobby.GetMapLoadNameByIndex( f11_arg1.idx )
	if f11_local0 == "bonus_map" then
		local f11_local1 = Lobby.GetDLCMapCount()
		local f11_local2 = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = nil,
			yes_action = nil
		}
		if f11_local1 > 0 then
			Engine.SetDvarBool( "ui_showDLCMaps", true )
			f11_arg0:dispatchEventToRoot( {
				name = "refresh_maps"
			} )
		elseif LUI.MenuTemplate.CanShowStore() then
			if Engine.GetOnlineGame() then
				f11_local2.message_text = Engine.Localize( "@LUA_MENU_NO_BONUS_MAPS" )
				f11_local2.yes_action = NoBonusMapsAction
				LUI.FlowManager.RequestAddMenu( f11_arg0, "generic_yesno_popup", true, f11_arg1.controller, false, f11_local2 )
			else
				f11_local2.message_text = Engine.Localize( "@LUA_MENU_NO_BONUS_MAPS_OFFLINE" )
				LUI.FlowManager.RequestAddMenu( f11_arg0, "generic_confirmation_popup", true, f11_arg1.controller, false, f11_local2 )
			end
		elseif Engine.IsPS4() then
			Store.ShowEmptyStoreDialog( f11_arg1.controller )
		else
			f11_local2.message_text = Engine.Localize( "@LUA_MENU_STORE_RESTRICTED" )
			LUI.FlowManager.RequestAddMenu( f11_arg0, "generic_confirmation_popup", true, f11_arg1.controller, false, f11_local2 )
		end
	elseif f11_local0 == "more_maps" then
		GetMoreMaps( f11_arg0, f11_arg1 )
	elseif f11_arg0.properties.rotationAllowed and MatchRules.IsUsingCustomMapRotation() then
		SelectMap_Rotation( f11_arg0, f11_arg1 )
	else
		SelectMap_Single( f11_arg0, f11_arg1 )
	end
end

function SelectMap_Single( f12_arg0, f12_arg1 )
	local f12_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f12_arg0 ) or {}
	local f12_local1 = f12_arg1.idx
	if f12_local1 == nil then
		return 
	else
		Engine.SetDvarString( "ui_mapname", Lobby.GetMapLoadNameByIndex( f12_local1 ) )
		ExitMenu( f12_arg0, f12_arg1 )
	end
end

function SelectMap_Rotation( f13_arg0, f13_arg1 )
	local f13_local0 = Lobby.GetMapLoadNameByIndex( f13_arg1.idx )
	if Lobby.IsMapInRotation( f13_local0 ) then
		Lobby.IncludeMapInRotation( f13_local0, false )
	else
		Lobby.IncludeMapInRotation( f13_local0, true )
	end
	Engine.ExecNow( "xupdatepartystate" )
end

function ToggleMultiMap( f14_arg0, f14_arg1 )
	if f14_arg0.properties.rotationAllowed then
		Engine.PlaySound( CoD.SFX.MouseClick )
		MatchRules.SetUsingCustomMapRotation( MatchRules.IsUsingCustomMapRotation() )
		f14_arg0:dispatchEventToRoot( {
			name = "update_lists"
		} )
	else
		Engine.PlaySound( CoD.SFX.DenySelect )
	end
end

function UpdateLists( f15_arg0, f15_arg1 )
	local f15_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f15_arg0 ) or {}
	local f15_local1 = f15_local0.rotationAllowed and MatchRules.IsUsingCustomMapRotation() or false
	f15_arg0:processEvent( {
		name = "show_checkbox",
		showBox = f15_local1,
		dispatchChildren = true
	} )
	if f15_local1 then
		f15_arg0:dispatchEventToRoot( {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@LUA_MENU_RULES_TOGGLE_ROTATION_OFF" ),
			side = "right",
			clickable = true,
			immediate = true
		} )
	elseif f15_arg0.properties.rotationAllowed then
		f15_arg0:dispatchEventToRoot( {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@LUA_MENU_RULES_TOGGLE_ROTATION_ON" ),
			side = "right",
			clickable = true,
			immediate = true
		} )
	end
end

function RefreshMapList( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0:getChildById( "mapsetup_rptatopmmaplist" )
	f16_local0:processEvent( {
		name = "menu_refresh"
	} )
	f16_arg0:processEvent( {
		name = "update_lists"
	} )
	f16_arg0:processEvent( {
		name = "gain_focus"
	} )
	UpdateMapRotation( f16_arg0, f16_arg1 )
end

function ExitMenu( f17_arg0, f17_arg1 )
	local f17_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f17_arg0 ) or {}
	local f17_local1 = f17_local0.rotationAllowed
	if f17_local1 then
		f17_local1 = MatchRules.IsUsingCustomMapRotation()
	end
	if f17_local1 == false then
		Engine.ExecNow( "xupdatepartystate" )
	end
	Engine.SetDvarBool( "ui_showDLCMaps", false )
	LUI.FlowManager.RequestLeaveMenu( f17_arg0 )
end

function BackButtonFunc( f18_arg0, f18_arg1 )
	if Engine.GetDvarBool( "ui_showDLCMaps" ) then
		Engine.SetDvarBool( "ui_showDLCMaps", false )
		f18_arg0:dispatchEventToRoot( {
			name = "refresh_maps"
		} )
	else
		ExitMenu( f18_arg0, f18_arg1 )
	end
end

LUI.MapSetup.AddMissingMapWindow = function ( f19_arg0 )
	local f19_local0 = RegisterMaterial( "store_mappack1" )
	local f19_local1 = Engine.GetMaterialAspectRatio( f19_local0 )
	local f19_local2 = 200
	local f19_local3 = 200 * f19_local1
	local f19_local4 = 10
	local f19_local5 = f19_local2 + f19_local4 * 2 + GenericTitleBarDims.TitleBarHeight
	local f19_local6 = f19_local3 + f19_local4 * 2
	local f19_local7 = CoD.CreateState( 800, 61, nil, nil, CoD.AnchorTypes.TopLeft )
	f19_local7.width = f19_local6
	f19_local7.height = f19_local5
	local self = LUI.UIElement.new( f19_local7 )
	self.id = "mapsetup_missing_window"
	local f19_local9 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_background" )
	f19_local9.id = "mapsetup_missing_window_bg"
	self:addElement( f19_local9 )
	f19_local9:addElement( LUI.DecoFrame.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), LUI.DecoFrame.Grey ) )
	local f19_local10 = CoD.CreateState( f19_local4, f19_local4 + GenericTitleBarDims.TitleBarHeight, -f19_local4, -f19_local4, CoD.AnchorTypes.All )
	f19_local10.material = f19_local0
	local self = LUI.UIImage.new( f19_local10 )
	self.id = "mapsetup_mapimage"
	self:addElement( self )
	local f19_local12 = CoD.TextSettings.BodyFontVeryTiny
	local self = LUI.UIText.new( {
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		alignment = LUI.Alignment.Left,
		top = 5,
		height = f19_local12.Height,
		font = f19_local12.Font,
		alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	} )
	self.id = "mapsetup_mapdesc"
	self:addElement( self )
	self:setText( Engine.Localize( "@LUA_MENU_VARIETY_AVAILABLE_STORE" ) )
	self:hide()
	f19_arg0.missingMapWindow = self
	f19_arg0:addElement( self )
end

LUI.MapSetup.AddDetailsWindow = function ( f20_arg0 )
	local f20_local0 = 468
	local f20_local1 = 403
	local f20_local2 = 3
	local f20_local3 = f20_local0 - 2 * f20_local2
	local f20_local4 = CoD.TextSettings.Font46
	local f20_local5 = CoD.TextSettings.BodyFontVeryTiny
	local f20_local6 = 266
	local f20_local7 = 296
	local f20_local8 = 349
	local f20_local9 = CoD.CreateState( GenericMenuDims.menu_right_standard + 12, 61, nil, nil, CoD.AnchorTypes.TopLeft )
	f20_local9.width = f20_local0
	f20_local9.height = f20_local1
	local self = LUI.UIElement.new( f20_local9 )
	self.id = "mapsetup_details_window"
	local f20_local11 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_background" )
	f20_local11.id = "mapsetup_details_window_bg"
	self:addElement( f20_local11 )
	f20_local11:addElement( LUI.DecoFrame.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), LUI.DecoFrame.Grey ) )
	local f20_local12 = CoD.CreateState( f20_local2 + 0.5, 8.5, -f20_local2 + 0.5, nil, CoD.AnchorTypes.TopLeftRight )
	f20_local12.height = (f20_local0 - 2 * f20_local2) * 0.71
	local self = LUI.UIElement.new( f20_local12 )
	self.id = "mapsetup_mapimagemask"
	self:addElement( self )
	self:setUseStencil( true )
	local f20_local14 = CoD.CreateState( -17, 25, 25, nil, CoD.AnchorTypes.TopLeftRight )
	f20_local14.height = f20_local0 / 1.5
	local self = LUI.UIImage.new( f20_local14 )
	self.id = "mapsetup_mapimage"
	self:addElement( self )
	local f20_local16 = {
		topAnchor = true,
		width = f20_local3 - 20,
		left = -214,
		alignment = LUI.Alignment.Left
	}
	local f20_local17 = 19
	local f20_local18, f20_local19, f20_local20, f20_local21 = GetTextDimensions( Engine.Localize( "@LUA_MENU_MAP_CAPS" ), f20_local5.Font, f20_local5.Height )
	local f20_local22 = CoD.CreateState( f20_local17, f20_local6, f20_local20 * 2.08 + f20_local17, f20_local6 + f20_local5.Height * 1.75, CoD.AnchorTypes.TopLeft )
	f20_local22.alpha = 0.7
	f20_local22.color = {
		r = 0,
		b = 0,
		g = 0
	}
	self:addElement( LUI.UIImage.new( f20_local22 ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		alignment = LUI.Alignment.Left,
		width = f20_local3 - 20,
		top = f20_local6 + 5.5,
		left = -204,
		height = f20_local5.Height,
		font = f20_local5.Font
	} )
	self.id = "mapsetup_thewordmap"
	self:addElement( self )
	self:setText( Engine.Localize( "@LUA_MENU_MAP_CAPS" ) )
	f20_local16.top = f20_local7
	f20_local16.height = f20_local4.Height
	f20_local16.font = f20_local4.Font
	local self = LUI.UIText.new( f20_local16 )
	self:setTextStyle( CoD.TextStyle.ShadowedMore )
	self.id = "mapsetup_mapname"
	self.properties = {
		text = ""
	}
	self:addElement( self )
	f20_local16.top = f20_local8
	f20_local16.height = f20_local5.Height
	f20_local16.font = f20_local5.Font
	f20_local16.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	local self = LUI.UIText.new( f20_local16 )
	self.id = "mapsetup_mapdesc"
	self:registerAnimationState( "adjusted", {
		topAnchor = true,
		top = 293,
		height = f20_local5.Height
	} )
	self:registerEventHandler( "adjust_desc_text", function ( element, event )
		
	end )
	self:addElement( self )
	local f20_local26 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f20_local26.height = 11
	f20_local26.width = 11
	f20_local26.left = -35
	f20_local26.top = 48
	f20_local26.material = RegisterMaterial( "h1_ui_deco_green_triangle" )
	self:addElement( LUI.UIImage.new( f20_local26 ) )
	self:hide()
	f20_arg0:addElement( self )
end

LUI.MapSetup.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "mapsetup_root"
	self:registerEventHandler( "menu_create", MapSetupCreate )
	self:registerEventHandler( "update_map", UpdateMap )
	self:registerEventHandler( "update_lists", UpdateLists )
	self:registerEventHandler( "select_map", SelectMap )
	self:registerEventHandler( "refresh_maps", RefreshMapList )
	local f22_local1 = LUI.MenuTemplate.new( menu, {
		menu_title = Engine.Localize( "@LUA_MENU_MAP_SELECT_CAPS" ),
		spacing = H1MenuDims.spacing
	} )
	f22_local1:setClass( LUI.MapSetup )
	f22_local1:MapFeeder()
	f22_local1:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_GAME_SETUP_CAPS" ) ) )
	local self = LUI.UIBindButton.new()
	self.properties = {
		rotationAllowed = true
	}
	self.id = self.id .. "mapsetup_bindbuttons"
	self:registerEventHandler( "button_secondary", BackButtonFunc )
	self:registerEventHandler( "button_alt1", ToggleMultiMap )
	f22_local1:addElement( self )
	f22_local1:AddDetailsWindow()
	f22_local1:AddMissingMapWindow()
	self:addElement( f22_local1 )
	f22_local1:InitScrolling()
	return self
end

LUI.MenuBuilder.registerType( "mapsetup_menu_main", LUI.MapSetup.new )
LockTable( _M )
