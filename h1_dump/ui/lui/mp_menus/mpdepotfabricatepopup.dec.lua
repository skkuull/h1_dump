local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, f1_arg0.height, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "contentLootContainer"
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterMaterial( "h1_ui_btn_unfocused" )
	local self = LUI.UIImage.new( f1_local1 )
	self.id = "fill"
	self:setup9SliceImage( LUI.H1ButtonBackground.EdgeW, LUI.H1ButtonBackground.EdgeH, LUI.H1ButtonBackground.EdgeU, LUI.H1ButtonBackground.EdgeV )
	self:addElement( self )
	if f1_arg0.rarity ~= nil and f1_arg0.rarity.strip ~= nil and f1_arg0.rarity.glow ~= nil and f1_arg0.rarity.corner ~= nil then
		local f1_local3 = CoD.CreateState( 0, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
		f1_local3.width = 8
		f1_local3.material = f1_arg0.rarity.strip
		self:addElement( LUI.UIImage.new( f1_local3 ) )
		local self = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		self.material = f1_arg0.rarity.glow
		self:addElement( LUI.UIImage.new( self ) )
		local f1_local5 = CoD.CreateState( nil, 2, -2, nil, CoD.AnchorTypes.TopRight )
		f1_local5.width = 16
		f1_local5.height = 16
		f1_local5.material = f1_arg0.rarity.corner
		f1_local5.alpha = 1
		self:addElement( LUI.UIImage.new( f1_local5 ) )
	end
	local f1_local3 = 10
	if f1_arg0.rarity then
		f1_local3 = 14
	end
	local f1_local6 = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	local self = f1_arg0.primaryTextLeft
	if not self then
		self = f1_local3
	end
	f1_local6.left = self
	self = f1_arg0.primaryTextRight
	if not self then
		self = -70
	end
	f1_local6.right = self
	self = f1_arg0.primaryTextTop
	if not self then
		self = 16
	end
	f1_local6.top = self
	self = f1_arg0.primaryFontHeight
	if not self then
		self = LUI.CacButton.PrimaryFontHeight
	end
	f1_local6.height = self
	f1_local6.font = LUI.CacButton.PrimaryFont.Font
	f1_local6.alignment = LUI.Alignment.Left
	f1_local6.alpha = 1
	f1_local6.color = Colors.white
	self = LUI.UIText.new( f1_local6 )
	self:setText( Engine.ToUpperCase( Engine.Localize( f1_arg0.primaryText ) ) )
	self.primaryText = self
	self:addElement( self )
	local f1_local5 = 16
	local f1_local7 = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	local self
	if f1_arg0.secondaryImage then
		self = f1_local5 + 14
		if not self then
			self = f1_arg0.secondaryTextLeft
			if not self then
				self = f1_local3
			end
		end
	else
		self = f1_arg0.secondaryTextLeft
		if not self then
			self = f1_local3
		end
	end
	f1_local7.left = self
	self = f1_arg0.secondaryTextRight
	if not self then
		self = -70
	end
	f1_local7.right = self
	self = f1_arg0.secondaryTextTop
	if not self then
		self = 36
	end
	f1_local7.top = self
	self = f1_arg0.secondaryFontHeight
	if not self then
		self = LUI.CacButton.SecondaryFontHeight
	end
	f1_local7.height = self
	f1_local7.font = LUI.CacButton.SecondaryFont.Font
	f1_local7.alignment = LUI.Alignment.Left
	f1_local7.alpha = 1
	self = LUI.UIText.new( f1_local7 )
	self:setText( f1_arg0.secondaryText and Engine.ToUpperCase( Engine.Localize( f1_arg0.secondaryText ) ) or "" )
	self.secondaryText = self
	self:addElement( self )
	if f1_arg0.secondaryImage ~= nil then
		local f1_local9 = CoD.CreateState( 10, 32, nil, nil, CoD.AnchorTypes.TopLeft )
		f1_local9.width = f1_local5
		f1_local9.height = f1_local5
		f1_local9.material = RegisterMaterial( f1_arg0.secondaryImage )
		self:addElement( LUI.UIImage.new( f1_local9 ) )
	end
	local f1_local9 = LUI.CacButton.CreateIcon( f1_arg0 )
	if f1_local9 then
		self:addElement( f1_local9 )
		self.icon = f1_local9
	end
	return self
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	if Engine.Inventory_PurchaseItem( f2_local0, Engine.TableLookup( LootTable.File, LootTable.Cols.GUID, f2_arg0.guid, LootTable.Cols.Purchase ), 1 ) == true then
		LUI.FlowManager.RequestAddMenu( nil, "popup_fabricating_item", true, f2_local0, nil, {
			guid = f2_arg0.guid,
			parentMenu = f2_arg0.parentMenu
		} )
		Engine.PlaySound( "h1_mpui_grind_item" )
		LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
	end
end

f0_local2 = function ( f3_arg0 )
	local self = LUI.UIElement.new( CoD.CreateState( 10, 40, -10, nil, CoD.AnchorTypes.TopLeftRight ) )
	local f3_local1 = f3_arg0.itemData
	self:addElement( f0_local0( {
		primaryText = f3_local1.name,
		secondaryText = f3_local1.category,
		iconName = f3_local1.image,
		locked = f3_local1.locked,
		newMode = f3_local1.new,
		extraImagePadding = f3_local1.padding,
		rarity = f3_local1.lootRarity,
		height = LUI.CacButton.Height
	} ) )
	local self = LUI.UIElement.new( CoD.CreateState( 0, LUI.CacButton.Height + 8, 0, nil, CoD.AnchorTypes.TopLeftRight ) )
	self:addElement( self )
	local f3_local3 = GetCurrencyBalance( InventoryCurrencyType.Parts, f3_arg0.exclusiveController )
	local f3_local4 = {
		id = "option_btn_1",
		style = GenericButtonSettings.Styles.GlassButton,
		substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu,
		content_width = 200,
		negative_color = true,
		button_action_func = f0_local1
	}
	local self = LUI.UIGenericButton.new( nil, f3_local4 )
	self:makeFocusable()
	self:processEvent( {
		name = "gain_focus"
	} )
	self.properties = f3_local4
	self.guid = f3_arg0.guid
	self.parentMenu = f3_arg0.parentMenu
	local f3_local6 = 14
	local f3_local7 = f3_arg0.fabricateCost <= f3_local3
	local f3_local8
	if f3_local7 then
		f3_local8 = Engine.Localize( "@DEPOT_FABRICATE_ITEM" )
		if not f3_local8 then
		
		else
			local f3_local9, f3_local10, f3_local11, f3_local12 = GetTextDimensions2( f3_local8, CoD.TextSettings.TitleFontSmaller.Font, f3_local6 )
			local f3_local13 = f3_local11 - f3_local9 + 8
			local f3_local14 = f3_arg0.fabricateCost
			local f3_local15, f3_local16, f3_local17, f3_local18 = GetTextDimensions2( f3_local14, CoD.TextSettings.TitleFontSmaller.Font, f3_local6 )
			f3_local12 = f3_local18
			f3_local11 = f3_local17
			f3_local10 = f3_local16
			f3_local15 = f3_local11 - f3_local15
			f3_local16 = 16
			f3_local17 = f3_local13 + f3_local16 + f3_local15
			f3_local18 = CoD.CreateState( -(f3_local17 / 2), nil, nil, f3_local6 / 2 + 2, CoD.AnchorTypes.None )
			f3_local18.width = f3_local13
			f3_local18.height = f3_local6
			f3_local18.font = CoD.TextSettings.TitleFontSmaller.Font
			f3_local18.alignment = LUI.Alignment.Left
			local self = LUI.UIText.new( f3_local18 )
			self:setText( f3_local8 )
			self:addElement( self )
			local f3_local20 = CoD.CreateState( nil, nil, f3_local17 / 2, f3_local6 / 2 + 2, CoD.AnchorTypes.None )
			f3_local20.width = f3_local15
			f3_local20.height = f3_local6
			f3_local20.font = CoD.TextSettings.TitleFontSmaller.Font
			if not f3_local7 then
				f3_local20.color = Swatches.HUD.Warning
				self:disable()
			end
			local self = LUI.UIText.new( f3_local20 )
			self:setText( f3_local14 )
			self:addElement( self )
			local f3_local22 = CoD.CreateState( f3_local18.left + f3_local18.width, nil, nil, nil, CoD.AnchorTypes.None )
			f3_local22.material = RegisterMaterial( GetCurrencyImage( InventoryCurrencyType.Parts ) )
			f3_local22.height = f3_local16
			f3_local22.width = f3_local16
			self:addElement( LUI.UIImage.new( f3_local22 ) )
			self:addElement( self )
			return self
		end
	end
	f3_local8 = Engine.Localize( "@DEPOT_NOT_ENOUGH_PARTS" )
end

local f0_local3 = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:addElement( LUI.Divider.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		top = -10
	}, 20, LUI.Divider.Green ) )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = -300,
		right = 300,
		top = -300,
		bottom = 300,
		material = RegisterMaterial( "depot_crafting_popup_glow" ),
		alpha = 1,
		color = controller.itemData.lootRarity.color
	} ) )
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
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f4_local2 = controller.titleBarTextIndent
	if not f4_local2 then
		f4_local2 = GenericTitleBarDims.TitleBarLCapWidth
	end
	local f4_local3 = controller.titleAlign
	if not f4_local3 then
		f4_local3 = LUI.Alignment.Left
	end
	local f4_local4 = controller.title or "PLACEMENT TEXT"
	local f4_local5 = controller.titleFont
	if not f4_local5 then
		f4_local5 = CoD.TextSettings.TitleFontSmaller
	end
	local f4_local6 = controller.vertOffset
	if not f4_local6 then
		f4_local6 = GenericTitleBarDims.TitleBarHeight / 2 - f4_local5.Height / 2 + 2
	end
	local f4_local7 = controller.color
	if not f4_local7 then
		f4_local7 = Colors.white
	end
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, GenericTitleBarDims.TitleBarHeight, CoD.AnchorTypes.TopLeftRight, {
		alpha = 1
	} ) )
	self:animateToState( "default" )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = f4_local6,
		height = f4_local5.Height,
		left = f4_local2,
		right = -f4_local2,
		font = f4_local5.Font,
		color = f4_local7,
		alignment = f4_local3,
		alpha = 1
	} )
	self.id = "titleText"
	self:setText( f4_local4 )
	self:registerEventHandler( "update_title", setTitleText )
	self.titleText = self
	self:addElement( self )
	local f4_local10 = GetCurrencyBalance( InventoryCurrencyType.Parts, controller.exclusiveController )
	local f4_local11 = -6
	local f4_local12 = CoD.CreateState( nil, nil, f4_local11, GenericTitleBarDims.TitleBarHeight * 0.6 / 2 + 2, CoD.AnchorTypes.Right )
	f4_local12.height = GenericTitleBarDims.TitleBarHeight * 0.6
	f4_local12.font = f4_local5.Font
	f4_local12.alignment = LUI.Alignment.Right
	f4_local12.width = 100
	local self = LUI.UIText.new( f4_local12 )
	self:setText( f4_local10 )
	self:addElement( self )
	local f4_local14, f4_local15, f4_local16, f4_local17 = GetTextDimensions( f4_local10, f4_local12.font, f4_local12.height )
	local f4_local18 = CoD.CreateState( nil, nil, f4_local14 - f4_local16 + f4_local11 - 4, nil, CoD.AnchorTypes.Right )
	f4_local18.material = RegisterMaterial( GetCurrencyImage( InventoryCurrencyType.Parts ) )
	f4_local18.height = f4_local12.height + 4
	f4_local18.width = f4_local12.height + 4
	self:addElement( LUI.UIImage.new( f4_local18 ) )
	local f4_local19 = CoD.CreateState( f4_local2, f4_local6 + f4_local5.Height + 2, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local19.material = RegisterMaterial( "white" )
	f4_local19.height = 1
	f4_local19.width = 20
	f4_local19.color = Colors.mw1_green
	self:addElement( LUI.UIImage.new( f4_local19 ) )
	self:addElement( self )
	return self
end

function MPDepotFabricatePopup( f5_arg0, f5_arg1 )
	f5_arg1.titleAlign = LUI.Alignment.Left
	local f5_local0 = f5_arg1.titleAlign
	local f5_local1 = LUI.Alignment.Left
	f5_arg1.titleBarTextIndent = REG22 and 12 or 0
	f5_arg1.title = Engine.ToUpperCase( Engine.Localize( "@DEPOT_FABRICATE" ) )
	f5_arg1.titleFont = CoD.TextSettings.TitleFontSmaller
	f5_local0 = f5_arg1.popup_list_spacing
	if not f5_local0 then
		f5_local0 = H1MenuDims.spacing
	end
	f5_arg1.listSpacing = f5_local0
	f5_arg1.fabricateCost = f5_arg1.fabricateCost or "0"
	local f5_local0, f5_local1, f5_local2, f5_local3 = GetTextDimensions( f5_arg1.title, f5_arg1.titleFont.Font, f5_arg1.titleFont.Height )
	local self = f5_arg1.popup_width
	if not self then
		self = LUI.clamp( f5_local2 - f5_local0 + 60, GenericPopupDims.Width, 1200 )
	end
	f5_arg1.width = self
	self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local f5_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local5.alpha = 1
	local self = LUI.UIElement.new( f5_local5 )
	self.id = "fabricate_popup_intermediate"
	self:registerAnimationState( "default", f5_local5 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "gain_focus", function ( element, event )
		if event.focusType ~= FocusType.MouseOver then
			element:animateToState( "default" )
		end
		element:dispatchEventToChildren( event )
	end )
	self:registerEventHandler( "restore_focus", function ( element, event )
		element:animateToState( "default" )
	end )
	self:registerEventHandler( "lose_focus", function ( element, event )
		if event.focusType ~= FocusType.MouseOver then
			element:animateToState( "hidden" )
		end
		element:dispatchEventToChildren( event )
	end )
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "h1_popup_dark_vignetting" )
	} )
	self.id = "fabricate_popup_screen_overlay_blur"
	self:setupFullWindowElement()
	self:addElement( self )
	local self = LUI.UIElement.new()
	self.id = "fabricate_popup_window_id"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -f5_arg1.width / 2,
		right = f5_arg1.width / 2,
		height = 155,
		alpha = 0
	} )
	self:registerAnimationState( "start", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -f5_arg1.width / 2,
		right = f5_arg1.width / 2,
		height = 155,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:animateToState( "start", 1 )
	self:addElement( self )
	f5_arg1.itemData = LUI.InventoryUtils.GetLootData( f5_arg1.guid )
	self:addElement( f0_local3( self, f5_arg1 ) )
	self:addElement( f0_local2( f5_arg1 ) )
	self:registerEventHandler( "close_popup", function ( element, event )
		if self.animOutTimer == nil then
			local self = LUI.UITimer.new( 66, "wait_for_anim_end" )
			self.id = "timer_wait_for_anim_end"
			self.loop = false
			self.animOutTimer = self
			self:addElement( self )
			self:registerEventHandler( "wait_for_anim_end", function ( element, event )
				if event ~= nil then
					event.name = "popup_closed"
				end
				self:dispatchEventToChildren( event )
			end )
		end
	end )
	self:addEventHandler( "transition_complete_start", function ( f11_arg0, f11_arg1 )
		Engine.PlaySound( CoD.SFX.PopupAppears )
	end )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( self )
	local f5_local10 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	f5_local10:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	f5_local10:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	local self = LUI.UIBindButton.new()
	self.id = "fabricate_popup_back_id"
	self:registerEventHandler( "button_secondary", function ( element, event )
		if event ~= nil then
			event.name = "close_popup"
			event.dispatchChildren = true
		end
		self:dispatchEventToChildren( event )
		element:registerEventHandler( "popup_closed", function ( element, event )
			self:processEvent( {
				name = "popup_back",
				controller = event.controller
			} )
			LUI.FlowManager.RequestLeaveMenu( element )
		end )
	end )
	self:addElement( self )
	self:registerEventHandler( "popup_inactive", function ( element, event )
		
	end )
	return self
end

LUI.MenuBuilder.registerPopupType( "MPDepotFabricatePopup", MPDepotFabricatePopup )
LockTable( _M )
