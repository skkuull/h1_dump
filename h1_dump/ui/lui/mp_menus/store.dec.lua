local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Store = InheritFrom( LUI.MenuTemplate )
f0_local0 = 3
f0_local1 = 2
f0_local2 = f0_local0 * f0_local1
local f0_local3 = 5
local f0_local4 = 154.6
local f0_local5 = 229.3
local f0_local6 = 10
local f0_local7 = f0_local4 * f0_local0
local f0_local8 = f0_local5 * f0_local1
local f0_local9 = 20
local f0_local10 = 255.09
local f0_local11 = 378.45
local f0_local12 = 14
LUI.Store.ScrollRate = 40
local f0_local13 = "???"
local f0_local14 = function ( f1_arg0 )
	f1_arg0:registerAnimationState( "animate", CoD.CreateState( f0_local9, f1_arg0.targetY, -f0_local9, 0, CoD.AnchorTypes.All ) )
	f1_arg0:animateToState( "animate", LUI.EULABase.ScrollTime )
end

local f0_local15 = function ( f2_arg0, f2_arg1 )
	if f2_arg0.targetY < LUI.EULABase.TopBuffer then
		f2_arg0.targetY = f2_arg0.targetY + LUI.Store.ScrollRate
		if f2_arg0.targetY > LUI.EULABase.TopBuffer then
			f2_arg0.targetY = LUI.EULABase.TopBuffer
		end
		f0_local14( f2_arg0 )
		Engine.PlaySound( CoD.SFX.MouseOver )
	end
end

local f0_local16 = function ( f3_arg0, f3_arg1 )
	if f3_arg0.minY < f3_arg0.targetY then
		f3_arg0.targetY = f3_arg0.targetY - LUI.Store.ScrollRate
		if f3_arg0.targetY < f3_arg0.minY then
			f3_arg0.targetY = f3_arg0.minY
		end
		f0_local14( f3_arg0 )
		Engine.PlaySound( CoD.SFX.MouseOver )
	end
end

function ShowStoreEmptyDialogAndLeave()
	local f4_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "store_main" )
	LUI.FlowManager.RequestLeaveMenuByName( "store_main" )
	if Engine.IsPS4() then
		Store.ShowEmptyStoreDialog( f4_local0.exclusiveControllerIndex )
	else
		LUI.FlowManager.RequestPopupMenu( nil, "generic_confirmation_popup", false, false, false, {
			popup_title = Engine.Localize( "@MENU_ERROR" ),
			message_text = Engine.Localize( "@LUA_MENU_STORE_ERROR_GENERIC" )
		} )
	end
end

local f0_local17 = function ( f5_arg0 )
	LUI.ButtonHelperText.ClearHelperTextObjects( f5_arg0.help, {
		side = "right"
	} )
	f5_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addFriendsButton )
end

local f0_local18 = function ( f6_arg0 )
	f0_local17( f6_arg0 )
	if f6_arg0.isArabic ~= true then
		local f6_local0, f6_local1 = nil
		if Engine.IsVita( f6_arg0.exclusiveController ) then
			f6_local0 = "button_shoulderl_vita"
			f6_local1 = "button_shoulderr_vita"
		end
		f6_arg0.helperText = LUI.ButtonHelperText.AddHelperTextObject( f6_arg0.help, {
			button_ref = "button_shoulderl",
			button_ref2 = "button_shoulderr",
			button_ref_vita = f6_local0,
			button_ref_vita_2 = f6_local1,
			helper_text = Engine.Localize( "@LUA_MENU_SCROLL_DESC" ),
			side = "right",
			clickable = false,
			groupLRButtons = true,
			func = function ( f7_arg0, f7_arg1 )
				f0_local15( f6_arg0.subPanel.infoPane.textContainer, f7_arg1 )
				return true
			end,
			func2 = function ( f8_arg0, f8_arg1 )
				f0_local16( f6_arg0.subPanel.infoPane.textContainer, f8_arg1 )
				return true
			end
		} )
	end
end

local f0_local19 = function ( f9_arg0, f9_arg1, f9_arg2 )
	if Engine.IsPC() then
		local f9_local0 = not Engine.IsPCApp()
	end
	local self = LUI.UIButton.new( CoD.CreateState( 0, 0, f0_local5, f0_local4, CoD.AnchorTypes.TopLeft ) )
	self:setActionSFX( "h1_mpui_purch_codpts" )
	local f9_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local2.material = RegisterMaterial( f9_arg0.thumbName )
	f9_local2.alpha = 1
	self:addElement( LUI.UIImage.new( f9_local2 ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 37,
		material = RegisterMaterial( "black" ),
		alpha = 1
	} )
	self.background = self
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f9_local4 = CoD.CreateState( -115, nil, 0, f0_local4 - 4, CoD.AnchorTypes.TopRight )
	f9_local4.height = 22
	f9_local4.alignment = LUI.Alignment.Center
	f9_local4.font = CoD.TextSettings.TitleFontSmaller.Font
	f9_local4.color = Colors.mw1_green
	local self = LUI.UIText.new( f9_local4 )
	self:addElement( self )
	if not Store.IsItemPurchasedByIndex( f9_arg1, f9_arg2 ) then
		f9_arg0.cost = string.gsub( f9_arg0.cost, f0_local13, "" )
		self:setText( f9_arg0.cost )
	else
		self:setText( Engine.Localize( "LUA_MENU_PURCHASED_CAPS" ) )
	end
	local f9_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local6.material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	f9_local6.alpha = 0
	local self = LUI.UIImage.new( f9_local6 )
	self:setup9SliceImage()
	self:registerAnimationState( "default", f9_local6 )
	self:registerAnimationState( "shown", {
		alpha = 1
	} )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "shown" ) )
	self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "shown" ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	self:registerEventHandler( "button_disable", MBh.AnimateToState( "default" ) )
	self:addElement( self )
	self.data = f9_arg0
	return self
end

local f0_local20 = function ( f10_arg0, f10_arg1 )
	f10_arg0.minY = f0_local12
	local f10_local0 = 0
	local f10_local1 = f10_arg0:getFirstChild()
	local f10_local2, f10_local3, f10_local4 = GetTextDimensions2( f10_arg1, CoD.TextSettings.TitleFontSmaller.Font, f0_local12, f0_local11 - 2 * f0_local9, true )
	local f10_local5 = f10_local3 * 1.2
	local f10_local6 = CoD.CreateState( 0, f10_local0, nil, nil, CoD.AnchorTypes.TopLeft )
	f10_local6.width = f10_local4
	f10_local6.height = f0_local12
	f10_local6.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f10_local6.font = CoD.TextSettings.TitleFontSmaller.Font
	f10_local6.lineSpacingRatio = 0.2
	f10_local1:registerAnimationState( "default", f10_local6 )
	f10_local1.min = f10_local0
	f10_local1:animateToState( "default" )
	f10_arg0.minY = f10_arg0.minY - f10_local5 + 100
end

local f0_local21 = function ( f11_arg0 )
	local f11_local0 = CoD.CreateState( nil, 0, 0, 0, CoD.AnchorTypes.TopBottomRight )
	f11_local0.width = f0_local11
	f11_local0.alpha = 0
	local self = LUI.UIButton.new( f11_local0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		material = RegisterMaterial( "black" ),
		alpha = 1
	} )
	self.background = self
	self:addElement( self )
	local f11_local3 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f11_local3.height = f0_local10
	f11_local3.material = RegisterMaterial( "white" )
	f11_local3.alpha = 1
	local self = LUI.UIImage.new( f11_local3 )
	self:addElement( self )
	local f11_local5 = CoD.CreateState( -110, nil, -f0_local9, f0_local10 - 10, CoD.AnchorTypes.TopRight )
	f11_local5.height = 24
	f11_local5.alignment = LUI.Alignment.Center
	f11_local5.font = CoD.TextSettings.BodyFont.Font
	f11_local5.color = Colors.mw1_green
	f11_local5.font = CoD.TextSettings.TitleFontSmaller.Font
	local self = LUI.UIText.new( f11_local5 )
	self:setText( "$19.99" )
	self:addElement( self )
	self:addElement( LUI.Divider.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		top = f0_local10 + 2,
		left = f0_local9,
		right = -f0_local9
	}, 10, LUI.Divider.Grey ) )
	local self = LUI.UIElement.new( CoD.CreateState( 0, f0_local10 + 10, 0, -f0_local9, CoD.AnchorTypes.All ) )
	self:setUseStencil( true )
	self:addElement( self )
	local f11_local8 = Engine.IsPC()
	if f11_local8 then
		f11_local8 = not Engine.IsPCApp()
	end
	local self, textContainer = nil
	if f11_arg0 ~= true then
		textContainer = LUI.UIElement.new( CoD.CreateState( f0_local9, 0, -f0_local9, 0, CoD.AnchorTypes.All ) )
		textContainer.targetY = 0
		textContainer.minY = 474 - f0_local10
		self:addElement( textContainer )
		self.textContainer = textContainer
		
		local f11_local11 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
		f11_local11.width = 100
		f11_local11.height = f0_local12
		f11_local11.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
		f11_local11.font = CoD.TextSettings.TitleFontSmaller.Font
		self = LUI.UIText.new( f11_local11 )
		self.id = "desc_text_line_1"
		self:setText( "" )
		textContainer:addElement( self )
	end
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	self:registerEventHandler( "update_panel", function ( element, event )
		if event.data then
			self:registerAnimationState( "updateImage", {
				material = RegisterMaterial( event.data.thumbName )
			} )
			self:animateToState( "updateImage" )
			local f12_local0 = event.data.cost
			if not Store.IsItemPurchasedByIndex( event.category, event.index ) then
				self:setText( string.gsub( f12_local0, f0_local13, "" ) )
			else
				self:setText( Engine.Localize( "LUA_MENU_PURCHASED_CAPS" ) )
			end
			if f11_arg0 ~= true then
				local f12_local1 = event.data.details
				if Engine.IsPS4() and string.sub( event.data.details, 1, 4 ) == "ZZZZ" then
					local f12_local2 = 50
					if Engine.GetCurrentLanguage() == 5 or Engine.GetCurrentLanguage() == 6 then
						f12_local2 = 44
					end
					local f12_local3 = math.ceil( string.len( event.data.details ) / f12_local2 )
					local f12_local4 = ""
					for f12_local5 = 1, f12_local3, 1 do
						f12_local4 = f12_local4 .. string.sub( event.data.details, f12_local5 - 1 * f12_local2 + 1, f12_local5 * f12_local2 ) .. "\n"
					end
					f12_local1 = f12_local4
				end
				local f12_local2 = nil
				if f11_local8 then
					f12_local2 = Engine.Localize( f12_local1 )
				else
					f12_local2 = f12_local1
				end
				self:setText( f12_local2 )
				f0_local20( textContainer, f12_local2 )
				textContainer.targetY = 4
				f0_local14( textContainer )
			end
			self:animateToState( "visible" )
		else
			self:animateToState( "default" )
		end
	end )
	return self
end

local f0_local22 = function ( f13_arg0, f13_arg1 )
	if f13_arg0.loadingWidget then
		f13_arg0.loadingWidget:animateToState( "default" )
		f13_arg0.m_disableNavigation = false
	end
	f13_arg0.grid.vlist:closeChildren()
	ListPaging.Reset( f13_arg0.grid )
	f13_arg0.grid.pagingData = nil
	local f13_local0 = f13_arg1.category
	local f13_local1 = Store.GetNumItemsInCategory( f13_arg1.category )
	if f13_local1 > 0 then
		if Engine.IsPS4() then
			Engine.ShowPsStoreIcon( 0 )
		end
		local f13_local2 = false
		for f13_local3 = 0, f13_local1 - 1, 1 do
			local f13_local6 = f13_local3
			local f13_local7 = f0_local19( Store.GetCompleteItemInfoByIndex( f13_arg1.category, f13_local6 ), f13_local0, f13_local6 )
			f13_local7.id = "card_button_" .. f13_local6
			f13_local7:registerEventHandler( "button_action", function ( element, event )
				if not Store.IsItemPurchasedByIndex( f13_local0, f13_local6 ) then
					local f14_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "store_main" )
					f14_local0.clearCache = true
					Store.PurchaseOffer( event.controller, f13_local0, f13_local6, LUI.ComScore.GetStoreScreen(), LUI.ComScore.GetStoreActionSource() )
				end
			end )
			f13_local7:registerEventHandler( "button_over", function ( element, event )
				f13_arg0.subPanel.infoPane:processEvent( {
					name = "update_panel",
					data = f13_local7.data,
					category = f13_local0,
					index = f13_local6
				} )
			end )
			f13_local7.listDefaultFocus = not f13_local2
			f13_arg0.grid:addElement( f13_local7 )
			f13_local2 = true
		end
		ListPaging.InitGrid( f13_arg0.grid, f0_local0, nil, false, f13_arg0.scrollIndicatorParent, f13_arg0.scrollIndicatorState )
		f13_arg0.subPanel:animateToState( "default" )
		if f13_arg0.inCategory then
			f13_arg0.list:processEvent( {
				name = "lose_focus"
			} )
			f13_arg0.subPanel:processEvent( {
				name = "gain_focus"
			} )
		end
	else
		if Engine.IsPS4() then
			Engine.HidePsStoreIcon()
		end
		if f13_local0 == 1 then
			ShowStoreEmptyDialogAndLeave()
		end
	end
end

local f0_local23 = function ( f16_arg0 )
	local f16_local0 = CoD.CreateState( GenericMenuDims.menu_right, LUI.MenuTemplate.ListTop, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f16_local0.height = 474
	f16_local0.alpha = 1
	local self = LUI.UIElement.new( f16_local0 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "hidden" )
	
	local infoPane = f0_local21( f16_arg0.isArabic )
	self:addElement( infoPane )
	self.infoPane = infoPane
	
	local self = LUI.UIGrid.new( nil, {
		id = "subpanel_grid",
		elementsPerRow = f0_local1,
		hSpacing = f0_local3,
		vSpacing = f0_local3,
		rowHeight = f0_local4,
		hAlign = LUI.Alignment.Left,
		vAlign = LUI.Alignment.Top
	} )
	self:makeFocusable()
	self:registerAnimationState( "default", CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:animateToState( "default" )
	self:addElement( self )
	local f16_local4 = {
		containerWidth = f0_local8,
		containerHeight = 32
	}
	
	local scrollIndicatorParent = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		left = 288,
		top = -142,
		height = f16_local4.containerHeight
	} )
	f16_arg0:addElement( scrollIndicatorParent )
	f16_arg0.scrollIndicatorParent = scrollIndicatorParent
	
	f16_arg0.scrollIndicatorState = f16_local4
	f16_arg0.grid = self
	f16_arg0.subPanel = self
	return self
end

function OnStorePurchaseComplete( f17_arg0, f17_arg1 )
	if f17_arg0.currentCategory == f17_arg1.category then
		f17_arg0.m_disableNavigation = true
		f17_arg0.loadingWidget:animateToState( "visible" )
		Store.FetchContentForCategory( f17_arg1.category )
	end
end

function OnFocusCategory( f18_arg0, f18_arg1, f18_arg2 )
	if f18_arg1.lastButton then
		f18_arg1.lastButton:processEvent( {
			name = "button_unpin"
		} )
		f18_arg1.lastButton = nil
		f18_arg1.inCategory = false
	end
	f18_arg1.m_disableNavigation = true
	if f18_arg1.currentCategory ~= f18_arg2 then
		f18_arg1.loadingWidget:animateToState( "visible" )
	end
	Store.FetchContentForCategory( f18_arg2 )
	f18_arg1.currentCategory = f18_arg2
end

function OnSelectCategory( f19_arg0, f19_arg1, f19_arg2 )
	f19_arg1.lastButton = f19_arg0
	f19_arg1.list:processEvent( {
		name = "lose_focus"
	} )
	f19_arg1.subPanel:processEvent( {
		name = "gain_focus"
	} )
	f19_arg1.inCategory = true
	if f19_arg1.lastButton then
		f19_arg1.lastButton:processEvent( {
			name = "button_pin"
		} )
	end
	f0_local18( f19_arg1 )
end

function OnBackButton( f20_arg0, f20_arg1, f20_arg2 )
	if f20_arg2.inCategory then
		f20_arg2.subPanel.infoPane:processEvent( {
			name = "update_panel",
			data = nil
		} )
		f20_arg2.lastButton:processEvent( {
			name = "button_unpin"
		} )
		f20_arg2.lastButton = nil
		f20_arg2.inCategory = false
		f20_arg2.subPanel:processEvent( {
			name = "lose_focus"
		} )
		f20_arg2.list:processEvent( {
			name = "gain_focus"
		} )
		f20_arg2.subPanel:animateToState( "hidden" )
		Engine.PlaySound( CoD.SFX.SelectBack )
		f0_local17( f20_arg2 )
	else
		LUI.FlowManager.RequestLeaveMenu( f20_arg0 )
	end
end

function OnRestoreFocus( f21_arg0, f21_arg1 )
	LUI.UIElement.restoreFocus( f21_arg0, f21_arg1 )
end

function store_main( f22_arg0, f22_arg1 )
	local f22_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "store_main" )
	if f22_local0.clearCache == true and Engine.IsXB3() then
		Store.ClearContentCache( f22_arg1.exclusiveController )
		f22_local0.clearCache = false
	end
	local f22_local1 = LUI.MenuTemplate.new( f22_arg0, {
		menu_title = "@LUA_MENU_STORE",
		uppercase_title = true
	} )
	f22_local1:setClass( LUI.Store )
	if Engine.IsPS4() and (Engine.GetDvarBool( "loc_arabic_sku" ) or Languages[Engine.GetCurrentLanguage()] == "LANGUAGE_ARABIC") then
		f22_local1.isArabic = true
	end
	local f22_local2 = {}
	f22_local2 = Store.GetCategories()
	if Engine.IsPC() then
		f0_local18( f22_local1 )
	end
	local f22_local3 = true
	if Engine.IsPS4() and Engine.GetDvarString( "shortversion" ) == "1.9" and (Engine.GetDvarBool( "loc_arabic_sku" ) or Engine.GetDvarBool( "loc_german_sku" ) or Engine.GetDvarBool( "loc_russian_sku" )) then
		f22_local3 = false
	end
	for f22_local4 = 1, #f22_local2, 1 do
		local f22_local7 = f22_local2[f22_local4]
		if (f22_local3 == true or f22_local7.id ~= 2) and (true == Engine.GetDvarBool( "ui_enable_cp" ) or f22_local7.title ~= "DEPOT_COD_POINTS") then
			local f22_local8 = f22_local1:AddButton( Engine.Localize( f22_local7.title ) )
			f22_local8:registerEventHandler( "button_over", function ( element, event )
				OnFocusCategory( element, f22_local1, f22_local7.id )
			end )
			f22_local8:registerEventHandler( "button_action", function ( element, event )
				OnSelectCategory( element, f22_local1, f22_local7.id )
			end )
		end
	end
	f22_local1:addElement( f0_local23( f22_local1 ) )
	f22_local1:registerEventHandler( "store_got_metadata", f0_local22 )
	f22_local1:registerEventHandler( "purchase_complete", OnStorePurchaseComplete )
	local f22_local5 = sns_fetching_category_spinner()
	f22_local1.loadingWidget = f22_local5
	f22_local1:addElement( f22_local5 )
	f22_local1.inCategory = false
	f22_local1:AddBackButton( function ( f25_arg0, f25_arg1 )
		OnBackButton( f25_arg0, f25_arg1, f22_local1 )
	end )
	f22_local1:AddCurrencyInfoPanel()
	f22_local1:registerEventHandler( "restore_focus", OnRestoreFocus )
	f22_local1:registerEventHandler( "gamepad_button", function ( element, event )
		if not element.m_disableNavigation then
			element:dispatchEventToChildren( event )
		end
	end )
	return f22_local1
end

function store_noguests_error( f27_arg0, f27_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_STORE_NOGUESTACCOUNTS" )
	} )
end

function store_disabled_error( f28_arg0, f28_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_STORE_RESTRICTED" )
	} )
end

function store_live_error( f29_arg0, f29_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@PLATFORM_UI_STORE_MUSTLOGIN" )
	} )
end

function store_oneclick_fetch_error( f30_arg0, f30_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_STORE_ERROR_GENERIC" )
	} )
end

function store_isupdating_error( f31_arg0, f31_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_STORE_ERROR_ISUPDATING" )
	} )
end

LUI.MenuBuilder.registerType( "store_main", store_main )
LUI.MenuBuilder.registerPopupType( "store_noguests_error", store_noguests_error )
LUI.MenuBuilder.registerPopupType( "store_disabled_error", store_disabled_error )
LUI.MenuBuilder.registerPopupType( "store_live_error", store_live_error )
LUI.MenuBuilder.registerPopupType( "store_oneclick_fetch_error", store_oneclick_fetch_error )
LUI.MenuBuilder.registerPopupType( "store_isupdating_error", store_isupdating_error )
LUI.FlowManager.RegisterStackPushBehaviour( "store_main", function ()
	if Engine.IsPS4() then
		Engine.ShowPsStoreIcon( 0 )
	end
end )
LUI.FlowManager.RegisterStackResumeBehaviour( "store_main", function ()
	if Engine.IsPS4() then
		Engine.ShowPsStoreIcon( 0 )
	end
end )
LUI.FlowManager.RegisterStackPopBehaviour( "store_main", function ()
	Engine.CloseInGameStore()
	if Engine.IsPS4() then
		Engine.HidePsStoreIcon()
	end
end )
LockTable( _M )
