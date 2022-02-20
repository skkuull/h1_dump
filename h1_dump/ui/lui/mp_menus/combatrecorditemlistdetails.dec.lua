local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 57
f0_local1 = CoD.TextSettings.TitleFontMediumLargeBold.Height * 0.75
f0_local2 = 8
function itemOverviewStat( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = Engine.ToUpperCase( Engine.Localize( f1_arg2.text ) )
	local f1_local1, f1_local2, f1_local3, f1_local4 = GetTextDimensions( f1_local0, CoD.TextSettings.TitleFontVeryTiny.Font, CoD.TextSettings.TitleFontVeryTiny.Height )
	local f1_local5 = f1_local3 - f1_local1
	local f1_local6 = CoD.CreateState( 0, 0, nil, CoD.TextSettings.TitleFontVeryTiny.Height + f0_local1, CoD.AnchorTypes.TopLeft )
	f1_local6.width = f1_local5
	local self = LUI.UIVerticalList.new( f1_local6 )
	self.id = "itemOverviewStatItemVL" .. f1_arg2.text
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		top = 0,
		right = 20,
		height = f0_local1,
		font = CoD.TextSettings.TitleFontMediumLargeBold.Font,
		alignment = LUI.Alignment.Left
	} )
	self.itemDetails = f1_arg2
	if f1_arg3.StatTextUpdateHandler( self, f1_arg4 ) == false then
		return nil
	end
	local f1_local9, f1_local10, f1_local11, f1_local12 = GetTextDimensions( self:getText(), CoD.TextSettings.TitleFontMediumLargeBold.Font, f0_local1 )
	local f1_local13 = f1_local11 - f1_local9
	if not (f1_local5 >= f1_local13 or f1_local13 == f1_local6.width) or f1_local13 < f1_local5 and f1_local5 ~= f1_local6.width then
		if f1_local13 < f1_local5 then
			local f1_local14 = f1_local5
		end
		f1_local6.width = f1_local14 or f1_local13
		self:registerAnimationState( "default", f1_local6 )
		self:animateToState( "default" )
		f1_arg0:setLayoutCached( false )
	end
	self:addElement( self )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		top = 0,
		right = 20,
		height = CoD.TextSettings.TitleFontVeryTiny.Height,
		font = CoD.TextSettings.TitleFontVeryTiny.Font,
		alignment = LUI.Alignment.Left,
		color = Colors.h1.medium_grey
	} )
	self:setText( f1_local0 )
	self:addElement( self )
	return self
end

function itemOverview( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.CreateState( CombatRecord.PanelDimensions.left, CombatRecord.PanelDimensions.top + 21, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local0.width = CombatRecord.PanelDimensions.width
	f2_local0.height = CombatRecord.PanelDimensions.height
	return LUI.UIElement.new( f2_local0 )
end

function updateItemOverview( f3_arg0, f3_arg1 )
	f3_arg0.itemOverviewContainer:closeChildren()
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 35,
		top = 58,
		right = 0,
		bottom = 0,
		spacing = 1
	} )
	self.id = "itemOverviewHL"
	local self = LUI.UIElement.new( CoD.CreateState( 30, 10, 30, 50, CoD.AnchorTypes.TopLeft ) )
	self:addElement( LUI.UIBackgroundPanel.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = 10,
		top = nil,
		right = 0,
		bottom = CoD.TextSettings.TitleFontSmall.Height / 2 + 3,
		height = CoD.TextSettings.TitleFontSmall.Height,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alignment = LUI.Alignment.Left
	} )
	self:addElement( self )
	self:registerEventHandler( "update_item", function ( element, event )
		local f4_local0 = event.displayName or event.itemName
		local f4_local1, f4_local2, f4_local3, f4_local4 = GetTextDimensions( f4_local0, CoD.TextSettings.TitleFontSmall.Font, CoD.TextSettings.TitleFontSmall.Height )
		self:registerAnimationState( "default", CoD.CreateState( 30, 10, 50 + f4_local3 - f4_local1, 50, CoD.AnchorTypes.TopLeft ) )
		self:animateToState( "default", 0 )
		element:setText( f4_local0 )
		self:closeChildren()
		local f4_local5 = CoD.TextSettings.TitleFontVeryTiny.Height + f0_local1 - 7
		local f4_local6 = CoD.CreateState( nil, 5, nil, nil, CoD.AnchorTypes.Top )
		f4_local6.height = f4_local5
		f4_local6.width = 1
		f4_local6.alpha = 0.5
		f4_local6.color = Colors.h1.medium_grey
		local f4_local7 = false
		for f4_local12, f4_local13 in ipairs( f3_arg0.inputTable.OverviewCategoryTable ) do
			local f4_local14 = itemOverviewStat( self, f3_arg1, f4_local13, f3_arg0.inputTable, event )
			if f4_local14 ~= nil then
				local self = LUI.UIImage.new( f4_local6 )
				if f4_local12 > 1 and f4_local7 then
					self:addSpacer( 10 )
					self:addElement( self )
					self:addSpacer( 10 )
				end
				f4_local7 = true
				self:addElement( f4_local14 )
			end
		end
	end )
	f3_arg0.itemOverviewContainer:addElement( self )
	f3_arg0.itemOverviewContainer:addElement( self )
end

function itemListEntry( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5 )
	local f5_local0 = CoD.CreateState( 0, 0, 0, f0_local0, CoD.AnchorTypes.TopLeftRight )
	f5_local0.scale = 0
	local self = LUI.UIButton.new( f5_local0 )
	self.id = "itemListEntryContainer" .. f5_arg1.itemName
	self:addEventHandler( "button_over", function ( f6_arg0, f6_arg1 )
		f5_arg2:processEvent( {
			name = "update_item",
			itemName = f5_arg1.itemName,
			displayName = f5_arg1.itemString,
			useSecondaryTable = f5_arg1.useSecondaryTable,
			controllerIndex = f5_arg0,
			dispatchChildren = true
		} )
		f5_arg2:processEvent( {
			name = "update_placement",
			current = f5_arg3,
			total = f5_arg4,
			dispatchChildren = true
		} )
	end )
	local f5_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIBackgroundPanel.new( f5_local2 )
	f5_local2.alpha = 1
	self:registerAnimationState( "default", f5_local2 )
	self:animateToState( "default", 0 )
	self:addElement( self )
	local f5_local4 = CoD.CreateState( 1, 0, -1, 0, CoD.AnchorTypes.All )
	f5_local4.borderThickness = 1
	f5_local4.color = Colors.h1.medium_grey
	f5_local4.alpha = 1
	self:addElement( LUI.UIBorder.new( f5_local4 ) )
	self:makeFocusable()
	local f5_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local5.material = RegisterMaterial( "btn_focused_rect_innerglow" )
	f5_local5.alpha = 0
	local self = LUI.UIImage.new( f5_local5 )
	self.id = "itemButton_focusBg"
	f5_local5.alpha = 1
	self:registerAnimationState( "focused", f5_local5 )
	self:setup9SliceImage( 10, 5, 0.25, 0.12 )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 0 ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	self:addElement( self )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = 15,
		right = 0,
		height = CoD.TextSettings.TitleFontTiny.Height,
		font = CoD.TextSettings.TitleFontTiny.Font,
		alignment = LUI.Alignment.Left,
		color = Colors.h1.medium_grey
	} )
	self:setText( f5_arg1.itemString )
	self:registerAnimationState( "focused", {
		color = Colors.white
	} )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 0 ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	self:addElement( self )
	local f5_local8 = 10
	local f5_local9 = CoD.CreateState( nil, nil, 0, nil, CoD.AnchorTypes.Right )
	f5_local9.height = f0_local1 + 1 + f5_local8
	f5_local9.width = 40
	local self = LUI.UIElement.new( f5_local9 )
	self:addElement( self )
	local f5_local11, f5_local12, f5_local13, f5_local14 = GetTextDimensions( f5_arg5.getItemListStatString( f5_arg1 ), CoD.TextSettings.TitleFontMediumLargeBold.Font, f0_local1 )
	local f5_local15 = f5_local13 - f5_local11
	local f5_local16 = false
	if f5_local15 < 30 then
		f5_local15 = 30
		f5_local16 = true
	end
	local f5_local17 = f5_arg5.getItemListStatTitleString()
	local f5_local18, f5_local19, f5_local20, f5_local21 = GetTextDimensions( f5_local17, CoD.TextSettings.TitleFontVeryTiny.Font, f5_local8 )
	local f5_local22 = f5_local20 - f5_local18
	local f5_local23 = -15
	if f5_local22 < f5_local15 then
		f5_local23 = f5_local23 - (f5_local15 - f5_local22) / 2
	end
	local self = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		bottom = 1,
		right = f5_local23 + 5,
		height = f5_local8,
		width = f5_local22 + 10,
		font = CoD.TextSettings.TitleFontVeryTiny.Font,
		alignment = LUI.Alignment.Center,
		color = Colors.h1.medium_grey
	} )
	self:setText( f5_local17 )
	self:registerAnimationState( "focused", {
		color = Colors.white
	} )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 0 ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
	self:addElement( self )
	local f5_local25 = -15
	if f5_local15 < f5_local22 then
		f5_local25 = f5_local25 - (f5_local22 - f5_local15) / 2
	end
	local f5_local26 = LUI.UIText.new
	local f5_local27 = {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		top = -4,
		right = f5_local25,
		height = f0_local1,
		width = f5_local15,
		font = CoD.TextSettings.TitleFontMediumLargeBold.Font
	}
	local f5_local28
	if f5_local16 then
		f5_local28 = LUI.Alignment.Center
		if not f5_local28 then
		
		else
			f5_local27.alignment = f5_local28
			f5_local27.color = Colors.h1.medium_grey
			f5_local26 = f5_local26( f5_local27 )
			f5_local26:setText( f5_arg5.getItemListStatString( f5_arg1 ) )
			f5_local26:registerAnimationState( "focused", {
				color = Colors.white
			} )
			f5_local26:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 0 ) )
			f5_local26:registerEventHandler( "button_up", MBh.AnimateToState( "default", 0 ) )
			self:addElement( f5_local26 )
			f5_local27 = CoD.CreateState( nil, 4, f5_local25, nil, CoD.AnchorTypes.Right )
			f5_local27.height = 1
			f5_local27.width = f5_local15
			f5_local27.color = Colors.h1.medium_grey
			f5_local27.alpha = 0.25
			self:addElement( LUI.UIImage.new( f5_local27 ) )
			return self
		end
	end
	f5_local28 = LUI.Alignment.Right
end

function updateList( f7_arg0, f7_arg1 )
	f7_arg0.itemList:closeChildren()
	local f7_local0 = f7_arg0.inputTable.ItemListFunction( f7_arg1 )
	if #f7_local0 <= f0_local2 then
		f7_arg0.upArrow:hide()
		f7_arg0.downArrow:hide()
	else
		f7_arg0.upArrow:show()
		f7_arg0.downArrow:show()
	end
	f7_arg0.itemList.properties = {}
	for f7_local4, f7_local5 in ipairs( f7_local0 ) do
		if Cac.IsClassItemUnlocked( f7_arg1, f7_local5.itemName ) ~= false or f7_local5.itemName ~= "h1_deserteagle55" then
			f7_arg0.itemList:addElement( itemListEntry( f7_arg1, f7_local5, f7_arg0, f7_local4, #f7_local0, f7_arg0.inputTable ) )
		end
	end
	f7_arg0.itemList:registerEventHandler( LUI.FormatAnimStateFinishEvent( "default" ), function ( element, event )
		f7_arg0:clearSavedState()
		ListPaging.InitList( f7_arg0.itemList, f0_local2, nil, false, f7_arg0.listBkg, {
			enabled = false
		} )
	end )
	f7_arg0.itemList:animateToState( "default" )
end

function changeTab( f9_arg0, f9_arg1, f9_arg2 )
	f9_arg1.inputTable = f9_arg0.inputTable
	updateList( f9_arg1, f9_arg2 )
	updateItemOverview( f9_arg1, f9_arg2 )
	f9_arg1.itemList:processEvent( {
		name = "gain_focus"
	} )
end

function addTabs( f10_arg0, f10_arg1 )
	local f10_local0 = {
		[#f10_local0 + 1] = {
			label = "@LUA_MP_FRONTEND_CALLINGCARD_WEAPONS",
			inputTable = CombatRecord.InputTable.WeaponDetails
		},
		[#f10_local0 + 1] = {
			label = "@MPUI_MELEE_CAPS",
			inputTable = CombatRecord.InputTable.MeleeWeaponDetails
		},
		[#f10_local0 + 1] = {
			label = "@MENU_EQUIPMENT_ARMORY_CAPS",
			inputTable = CombatRecord.InputTable.LauncherDetails
		},
		[#f10_local0 + 1] = {
			label = "@MENU_SCORESTREAKS_CAPS",
			inputTable = CombatRecord.InputTable.ScorestreakDetails
		},
		[#f10_local0 + 1] = {
			label = "@MENU_GAME_TYPES",
			inputTable = CombatRecord.InputTable.GameModeDetails
		}
	}
	local f10_local1 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight ),
		numOfTabs = #f10_local0,
		isHidden = false
	} )
	f10_local1:keepRightBumperAlignedToHeader( true )
	f10_local1.tabSelected = 1
	f10_arg0:addElement( f10_local1 )
	for f10_local2 = 1, #f10_local0, 1 do
		local f10_local5 = f10_local2
		f10_local1:addTab( f10_arg1, f10_local0[f10_local5].label, function ()
			changeTab( f10_local0[f10_local5], f10_arg0, f10_arg1 )
		end )
	end
	return f10_local1
end

function AddLowerCounter( f12_arg0, f12_arg1 )
	local f12_local0 = 32
	local f12_local1 = 37
	local f12_local2 = CoD.CreateState( nil, nil, nil, -53, CoD.AnchorTypes.BottomLeft )
	f12_local2.width = f12_arg1
	f12_local2.height = 32
	local self = LUI.UIElement.new( f12_local2 )
	local f12_local4 = CoD.CreateState( -(f12_local1 + f12_local0), nil, nil, nil, CoD.AnchorTypes.None )
	f12_local4.width = f12_local0
	f12_local4.height = f12_local0
	f12_local4.material = RegisterMaterial( "s1_icon_up" )
	if Engine.IsPC() then
		f12_local4.alpha = 0.8
		f12_local4.scale = 0
	end
	local self = LUI.UIImage.new( f12_local4 )
	if Engine.IsPC() then
		self:makeFocusable()
		self:setHandleMouseButton( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			element:animateInSequence( {
				{
					"highlight",
					0
				},
				{
					"pulse",
					100
				},
				{
					"highlight",
					100
				}
			} )
			f12_arg0:processEvent( {
				name = "gain_focus"
			} )
			SendKey( element, event, {
				down = true,
				button = "up",
				name = "gamepad_button",
				qualifier = "keyboard",
				immediate = true
			} )
		end )
		self:registerAnimationState( "highlight", {
			alpha = 1,
			scale = 0
		} )
		self:registerAnimationState( "pulse", {
			scale = -0.1
		} )
		self:registerEventHandler( "mouseenter", function ( element, event )
			element:animateToState( "highlight" )
		end )
		self:registerEventHandler( "mouseleave", MBh.AnimateToState( "default" ) )
	end
	self:addElement( self )
	f12_local4.material = RegisterMaterial( "s1_icon_down" )
	f12_local4.left = f12_local1
	f12_local4.top = -17
	local self = LUI.UIImage.new( f12_local4 )
	if Engine.IsPC() then
		self:makeFocusable()
		self:setHandleMouseButton( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			element:animateInSequence( {
				{
					"highlight",
					0
				},
				{
					"pulse",
					100
				},
				{
					"highlight",
					100
				}
			} )
			f12_arg0:processEvent( {
				name = "gain_focus"
			} )
			SendKey( element, event, {
				down = true,
				button = "down",
				name = "gamepad_button",
				qualifier = "keyboard",
				immediate = true
			} )
		end )
		self:registerAnimationState( "highlight", {
			alpha = 1,
			scale = 0
		} )
		self:registerAnimationState( "pulse", {
			scale = -0.1
		} )
		self:registerEventHandler( "mouseenter", function ( element, event )
			element:animateToState( "highlight" )
		end )
		self:registerEventHandler( "mouseleave", MBh.AnimateToState( "default" ) )
	end
	self:addElement( self )
	local f12_local7 = CoD.CreateState( -50, nil, nil, nil, CoD.AnchorTypes.None )
	f12_local7.font = CoD.TextSettings.TitleFontSmall.Font
	f12_local7.height = 14
	f12_local7.width = 100
	f12_local7.alignment = LUI.Alignment.Center
	local self = LUI.UIText.new( f12_local7 )
	self:addElement( self )
	self:registerEventHandler( "update_placement", function ( element, event )
		self:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", event.current, event.total ) )
	end )
	f12_arg0.upArrow = self
	f12_arg0.downArrow = self
	f12_arg0:addElement( self )
end

function SendKey( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = Engine.GetLuiRoot()
	f18_arg2.controller = f18_arg1.controller
	LUI.UIRoot.ProcessEvent( f18_local0, f18_arg2 )
end

function combatRecordItemListDetails_OnGainFocus( f19_arg0, f19_arg1 )
	f19_arg0.itemList:processEvent( f19_arg1 )
end

function combatRecordItemListDetails( f20_arg0, f20_arg1 )
	local f20_local0 = f20_arg1.exclusiveController
	local f20_local1 = LUI.MenuTemplate.new( f20_arg0, {
		menu_title = "@MPUI_COMBATRECORD_HEADING_CAPS",
		menu_height = CombatRecord.MenuDimensions.height,
		menu_width = CombatRecord.ListDimensions.width
	} )
	LUI.MenuTemplate.SetBreadCrumb( f20_local1, Engine.Localize( "@LUA_MENU_BARRACKS_CAPS" ) )
	local f20_local2 = addTabs( f20_local1, f20_local0 )
	local self = LUI.UIElement.new( CoD.CreateState( 0, CombatRecord.ListDimensions.top, CombatRecord.ListDimensions.width, CombatRecord.ListDimensions.top + CombatRecord.ListDimensions.height, CoD.AnchorTypes.TopLeft ) )
	self:makeFocusable()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:makeFocusable()
	self:setUseStencil( true )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local self = LUI.UIVerticalList.new( CoD.CreateState( 2, 4, -2, -2, CoD.AnchorTypes.All ) )
	self.id = "combatRecordItemListDetails_list"
	self:addElement( self )
	self:addElement( self )
	f20_local1.itemList = self
	f20_local1:addElement( self )
	local f20_local7 = CoD.CreateState( CombatRecord.PanelDimensions.left, CombatRecord.PanelDimensions.top, nil, nil, CoD.AnchorTypes.TopLeft )
	f20_local7.width = CombatRecord.PanelDimensions.width
	f20_local7.height = CombatRecord.PanelDimensions.height
	f20_local7.material = RegisterMaterial( "h1_ui_deco_combatrecord_shadow" )
	local self = LUI.UIImage.new( f20_local7 )
	self:setup9SliceImage( 20, 20, 0.33, 0.33 )
	local f20_local9 = CoD.CreateState( 25, 25, 0, 0, CoD.AnchorTypes.All )
	f20_local9.material = RegisterMaterial( "h1_ui_dot_pattern_lg" )
	local self = LUI.UIImage.new( f20_local9 )
	self:setupTiles( 24 )
	self:addElement( self )
	f20_local1:addElement( self )
	local self = LUI.UIImage.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ) )
	self:registerEventHandler( "update_item", function ( element, event )
		local f21_local0 = f20_local1.inputTable.getImageLookupTable( event.useSecondaryTable )
		local f21_local1 = RegisterMaterial( Engine.TableLookup( f21_local0.File, f21_local0.Cols.Ref, event.itemName, f21_local0.Cols.Image ) )
		element:setImage( f21_local1 )
		local f21_local2 = Engine.GetMaterialAspectRatio( f21_local1 )
		local f21_local3 = f20_local1.inputTable.PanelImageHeight
		local f21_local4 = CoD.CreateState( nil, f20_local1.inputTable.PanelTopOffset, nil, nil, CoD.AnchorTypes.None )
		f21_local4.width = f21_local3 * f21_local2
		f21_local4.height = f21_local3
		element:registerAnimationState( "adjustSize", f21_local4 )
		element:animateToState( "adjustSize" )
	end )
	self:addElement( self )
	
	local itemOverviewContainer = itemOverview( f20_local0, f20_local1 )
	f20_local1:addElement( itemOverviewContainer )
	f20_local1.itemOverviewContainer = itemOverviewContainer
	
	AddLowerCounter( f20_local1, CombatRecord.ListDimensions.width )
	f20_local1:registerEventHandler( "gain_focus", combatRecordItemListDetails_OnGainFocus )
	f20_local1:AddBackButton( function ( f22_arg0, f22_arg1 )
		LUI.FlowManager.RequestLeaveMenu( nil, nil, nil, f20_local0 )
	end )
	f20_local2:refreshTab( f20_local0 )
	return f20_local1
end

LUI.MenuBuilder.registerType( "CombatRecordItemListDetails", combatRecordItemListDetails )
LockTable( _M )
