local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MenuTemplate = InheritFrom( LUI.UIElement )
LUI.MenuTemplate.ListTop = GenericMenuDims.MenuStartY
LUI.MenuTemplate.ButtonStyle = GenericButtonSettings.Styles.FlatButton
LUI.MenuTemplate.spMenuOffset = GenericMenuDims.menu_top - LUI.MenuTemplate.ListTop + DesignGridDims.vert_gutter
LUI.MenuTemplate.TitleBar = {
	Width = 2,
	LeftOffset = -0.66
}
LUI.MenuTemplate.Title = {
	Top = GenericMenuDims.TitleTop
}
LUI.MenuTemplate.TitleText = {
	TopOffset = 0.66
}
LUI.MenuTemplate.GetXpScalarObj = function ( f1_arg0, f1_arg1 )
	return {
		xpScale = Playlist.GetPlaylistXpScale( f1_arg0, f1_arg1 ),
		xpScaleWithParty = Playlist.GetPlaylistXpScaleWithParty( f1_arg0, f1_arg1 ),
		depotScale = Playlist.GetPlaylistDepotCreditScale( f1_arg0, f1_arg1 )
	}
end

LUI.MenuTemplate.AddBuildNumber = function ( f2_arg0 )
	local self = LUI.UIText.new( {
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		height = CoD.TextSettings.BodyFontSmall.Height,
		font = CoD.TextSettings.BodyFontSmall.Font,
		width = GenericMenuDims.menu_right_wide - GenericMenuDims.menu_left
	} )
	self:setText( Engine.GetBuildNumber() )
	self:addElement( LUI.UITimer.new( 500, "refresh_buildnumber" ) )
	self:registerEventHandler( "refresh_buildnumber", function ( element, event )
		element:setText( Engine.GetBuildNumber() )
	end )
	f2_arg0:addElement( self )
end

LUI.MenuTemplate.AddListDivider = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4, f4_arg5 )
	if f4_arg0.listDivider ~= nil then
		f4_arg0.listDivider:close()
	end
	ListPaging.Reset( f4_arg0.list )
	if f4_arg2 == nil then
		f4_arg2, f4_arg3, f4_arg4, f4_arg5 = f4_arg0.list:getLocalRect()
	end
	if f4_arg1 then
		f4_arg3 = f4_arg3 + f4_arg1
	end
	local f4_local0 = CoD.CreateState( f4_arg2, f4_arg3 - H1MenuDims.spacing, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local0.width = f4_arg4 - f4_arg2
	f4_local0.height = 2
	
	local listDivider = LUI.Divider.new( f4_local0 )
	f4_arg0:addElement( listDivider )
	f4_arg0.listDivider = listDivider
	
end

LUI.MenuTemplate.CreateBottomDivider = function ( f5_arg0 )
	if f5_arg0.list.bottomDivider ~= nil then
		f5_arg0.list.bottomDivider:close()
	end
	f5_arg0.list.bottomDivider = LUI.UIImage.new( {
		leftAnchor = true,
		bottomAnchor = true,
		width = 29.5,
		height = 0.5,
		top = H1MenuDims.spacing + 0.5,
		material = RegisterMaterial( "white" ),
		color = Colors.mw1_green
	} )
end

LUI.MenuTemplate.AddBottomDividerToList = function ( f6_arg0, f6_arg1 )
	if f6_arg0.list.bottomDivider then
		if f6_arg1 then
			f6_arg1:addElement( f6_arg0.list.bottomDivider )
		else
			f6_arg0.list:addElement( f6_arg0.list.bottomDivider )
		end
	end
end

LUI.MenuTemplate.AddButton = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7 )
	assert( f7_arg0.list ~= nil )
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f7_arg7 = true
	end
	if f7_arg7 ~= true then
		if f7_arg0.list.buttonCount == 0 then
			f7_arg0:AddListDivider( f7_arg0.menu_list_divider_top_offset )
			f7_arg0:CreateBottomDivider()
		elseif f7_arg0.list.bottomDivider and not f7_arg0.list.bottomDivider:isClosed() then
			local f7_local0 = f7_arg0.list.bottomDivider:getParent()
			f7_local0:removeElement( f7_arg0.list.bottomDivider )
		end
	end
	local f7_local0, f7_local1 = nil
	if type( f7_arg3 ) == "function" then
		f7_local0 = f7_arg3
		f7_local1 = nil
	else
		f7_local1 = f7_arg3
		f7_local0 = nil
	end
	local f7_local2 = nil
	if type( f7_arg2 ) == "function" then
		f7_local2 = f7_arg2
	elseif type( f7_arg2 ) == "string" then
		f7_local2 = function ( f8_arg0, f8_arg1 )
			LUI.FlowManager.RequestAddMenu( f8_arg0, f7_arg2, true, f8_arg1.controller, false )
		end
		
	end
	if f7_arg1 == nil then
		f7_arg1 = f7_arg6.button_text
	end
	local f7_local3 = Engine.Localize( f7_arg1 )
	if f7_arg4 == nil or f7_arg4 then
		f7_local3 = Engine.ToUpperCase( f7_local3 )
	end
	local f7_local4 = {
		style = LUI.MenuTemplate.ButtonStyle,
		button_text = f7_local3,
		text_align_without_content = LUI.Alignment.Left,
		button_action_func = f7_local2,
		exclusiveController = f7_arg0.exclusiveController
	}
	if f7_arg6 ~= nil then
		LUI.InheritCopy( f7_local4, f7_arg6 )
	end
	local f7_local5 = LUI.MenuBuilder.BuildAddChild( f7_arg0.list, {
		type = "UIGenericButton",
		id = f7_arg0.type .. "_button_" .. f7_arg0.list.buttonCount,
		disabled = f7_local1,
		disabledFunc = f7_local0,
		properties = f7_local4,
		listIndex = f7_arg0.list.buttonCount
	} )
	f7_local5.menu = f7_arg0
	f7_arg0.list.buttonCount = f7_arg0.list.buttonCount + 1
	if f7_arg7 ~= true then
		f7_arg0:AddBottomDividerToList( f7_local5 )
	end
	return f7_local5
end

LUI.MenuTemplate.AddButtonWithSubText = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5 )
	local f9_local0 = f9_arg0:AddButton( f9_arg1, f9_arg2, f9_arg3 )
	local f9_local1 = LUI.MenuGenericButtons.ButtonLabelFont
	local f9_local2, f9_local3, f9_local4, f9_local5 = GetTextDimensions( Engine.Localize( f9_arg1 ), f9_local1.Font, f9_local1.Height )
	local f9_local6 = CoD.TextSettings.TitleFontTiny
	local f9_local7 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content + f9_local4 - f9_local2 + (f9_arg5 or 5)
	local self = LUI.UIText.new()
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = f9_local7,
		right = 0,
		top = 10,
		height = f9_local6.Height,
		alignment = LUI.Alignment.Left,
		font = f9_local6.Font,
		color = Colors.s1.text_focused,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self:setText( f9_arg4 )
	f9_local0.subTextField = self
	f9_local0:addElement( self )
	return f9_local0
end

LUI.MenuTemplate.RefreshButtonDisabled = function ( f10_arg0 )
	if f10_arg0.list then
		f10_arg0.list:dispatchEventToChildren( {
			name = "refresh_disabled"
		} )
	end
end

LUI.MenuTemplate.AddSpacing = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		height = controller
	} )
	self:animateToState( "default" )
	menu.list:addElement( self )
end

LUI.MenuTemplate.AddHeader = function ( f12_arg0, f12_arg1 )
	assert( f12_arg0.list ~= nil )
	local f12_local0 = Engine.Localize( f12_arg1 )
	local f12_local1 = CoD.TextSettings.Font21
	local f12_local2, f12_local3, f12_local4, f12_local5 = GetTextDimensions2( f12_local0, f12_local1.Font, f12_local1.Height )
	local f12_local6 = f12_local4 - f12_local2 + 40
	local f12_local7 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f12_local7.width = f12_local6
	f12_local7.height = f12_local1.Height + 4
	f12_local7.material = RegisterMaterial( "white" )
	f12_local7.color = {
		r = 0.21,
		g = 0.21,
		b = 0.21
	}
	local self = LUI.UIImage.new( f12_local7 )
	local f12_local9 = 12
	local f12_local10 = CoD.CreateState( 12, 3, nil, nil, CoD.AnchorTypes.TopLeft )
	f12_local10.width = f12_local9
	f12_local10.height = f12_local9
	f12_local10.material = RegisterMaterial( "h1_deco_double_triangle" )
	f12_local10.color = {
		r = 0.36,
		g = 0.36,
		b = 0.36
	}
	self:addElement( LUI.UIImage.new( f12_local10 ) )
	local f12_local11 = CoD.CreateState( 32, 4, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f12_local11.height = f12_local1.Height
	f12_local11.font = f12_local1.Font
	f12_local11.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f12_local11.color = {
		r = 0.83,
		g = 0.83,
		b = 0.83
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f12_local11.top = 2
	end
	local self = LUI.UIText.new( f12_local11 )
	self:setText( f12_local0 )
	self:addElement( self )
	f12_arg0.list:addElement( self )
end

LUI.MenuTemplate.AddMenuDescription = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local0 = f13_arg1 * LUI.ButtonDescText.Font.Height
	local f13_local1 = f13_arg3 or 26
	local self = LUI.UIElement.new( nil, {
		borderAlpha = 0.45
	} )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		height = f13_local1 * 2 + f13_local0,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		height = f13_local1 * 2 + f13_local0,
		alpha = 0
	} )
	local f13_local3 = self
	local self = self.animateToState
	local f13_local5
	if f13_arg2 then
		f13_local5 = "hidden"
		if not f13_local5 then
		
		else
			self( f13_local3, f13_local5 )
			self.visible = not f13_arg2
			self = LUI.UIElement.new()
			self:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = f13_local1
			} )
			self:animateToState( "default" )
			self:addElement( self )
			self:addElement( LUI.ButtonDescText.new( nil, {
				lines = f13_arg1
			} ) )
			f13_arg0.list:addElement( self )
			return self
		end
	end
	f13_local5 = "default"
end

LUI.MenuTemplate.InitScrolling = function ( f14_arg0 )
	local f14_local0 = 13
	if GameX.IsSplitscreen() then
		f14_local0 = 7
	end
	ListPaging.InitList( f14_arg0.list, f14_local0, 10, nil, nil, {
		left_offset = 50
	} )
	return f14_local0
end

LUI.MenuTemplate.InitScrollBar = function ( f15_arg0 )
	LUI.Options.InitScrollingList( f15_arg0.list )
end

LUI.MenuTemplate.AddHelp = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	f16_arg1 = LUI.DeepCopy( f16_arg1 )
	assert( f16_arg0.help ~= nil )
	if f16_arg4 ~= nil then
		local f16_local0
		if f16_arg4 == true then
			f16_local0 = "left"
			if not f16_local0 then
			
			else
				f16_arg1.side = f16_local0
			end
		end
		f16_local0 = "right"
	end
	return LUI.ButtonHelperText.AddHelperTextObject( f16_arg0.help, f16_arg1, f16_arg2, f16_arg3 )
end

LUI.MenuTemplate.AddHeaderDividers = function ( f17_arg0 )
	local f17_local0 = 60
	local f17_local1 = 20
	local f17_local2 = 1
	
	local headerContainer = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	f17_arg0:addElement( headerContainer )
	f17_arg0.headerContainer = headerContainer
	
	local f17_local4 = CoD.CreateState( 0, f17_local0, nil, nil, CoD.AnchorTypes.TopLeft )
	f17_local4.width = f17_local1
	f17_local4.height = f17_local2
	f17_local4.material = RegisterMaterial( "white" )
	f17_local4.color = Colors.mw1_green
	headerContainer:addElement( LUI.UIImage.new( f17_local4 ) )
	local f17_local5 = CoD.CreateState( nil, f17_local0, 0, nil, CoD.AnchorTypes.TopRight )
	f17_local5.width = f17_local1
	f17_local5.height = f17_local2
	f17_local5.material = RegisterMaterial( "white" )
	f17_local5.color = Colors.mw1_green
	headerContainer:addElement( LUI.UIImage.new( f17_local5 ) )
	local f17_local6 = CoD.CreateState( f17_local1, f17_local0, -775, nil, CoD.AnchorTypes.TopLeftRight )
	f17_local6.height = f17_local2
	f17_local6.material = RegisterMaterial( "h1_ui_divider_gradient_left" )
	f17_local6.color = Colors.mw1_green
	f17_local6.alpha = 0.5
	headerContainer:addElement( LUI.UIImage.new( f17_local6 ) )
	local f17_local7 = CoD.CreateState( 267, f17_local0, nil, nil, CoD.AnchorTypes.TopLeft )
	f17_local7.width = 80
	f17_local7.height = f17_local2
	f17_local7.material = RegisterMaterial( "white" )
	f17_local7.color = Colors.mw1_green
	f17_local7.alpha = 0.35
	headerContainer:addElement( LUI.UIImage.new( f17_local7 ) )
end

LUI.MenuTemplate.OnOptions = function ( f18_arg0, f18_arg1 )
	if GameX.IsSplitscreen() then
		GameX.SetOptionState( true )
	end
	if not f18_arg0.disabled then
		if Engine.IsConsoleGame() then
			LUI.FlowManager.RequestAddMenu( f18_arg0, "console_controls", true, f18_arg1.controller, false )
		else
			LUI.FlowManager.RequestAddMenu( f18_arg0, "pc_controls", true, f18_arg1.controller, false )
		end
		Engine.PlaySound( CoD.SFX.MenuAccept )
	end
end

LUI.MenuTemplate.AddOptionsButton = function ( f19_arg0, f19_arg1 )
	if f19_arg1 then
		return f19_arg0:AddButton( "@MENU_OPTIONS", LUI.MenuTemplate.OnOptions, nil, nil, nil, {
			desc_text = Engine.Localize( "@MENU_OPTIONS_DESC" )
		} )
	else
		f19_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_start",
			helper_text = Engine.Localize( "@MENU_OPTIONS" ),
			side = "right",
			clickable = true
		}, LUI.MenuTemplate.OnOptions )
	end
end

LUI.MenuTemplate.OnStore = function ( f20_arg0, f20_arg1 )
	Sns.OpenStoreMenu( f20_arg1.controller, f20_arg0.comScoreScreen, LUI.ComScore.StoreSource.MenuButton )
end

LUI.MenuTemplate.StoreDisabled = function ( f21_arg0 )
	if Engine.IsPS3() or Engine.IsPS4() then
		local f21_local0 = Lobby.IsInPrivateParty()
		local f21_local1 = Lobby.IsPrivatePartyHost()
		local f21_local2 = Lobby.IsPartyHostWaitingOnMembers()
		local f21_local3
		if not f21_local0 or f21_local1 then
			f21_local3 = f21_local2
		else
			f21_local3 = true
		end
		return f21_local3
	else
		
	end
end

LUI.MenuTemplate.CanShowStore = function ()
	return Engine.GetDvarBool( "ui_show_store" )
end

LUI.MenuTemplate.AddStoreButton = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	if f23_arg1 == nil then
		f23_arg1 = f23_arg0.OnStore
	end
	if f23_arg2 == nil then
		f23_arg2 = f23_arg0.StoreDisabled
	end
	if f23_arg0:CanShowStore() then
		local f23_local0 = {}
		if f23_arg3 and Engine.IsConsoleGame() and Engine.InFrontend() then
			f23_local0.shouldShowNewStoreSticker = true
			f23_local0.newStickerUpdateFunction = StoreButtonNewStickerUpdate
		end
		local f23_local1 = f23_arg0:AddButton( "@LUA_MENU_STORE", f23_arg1, f23_arg2, nil, false, f23_local0 )
		f23_local1.comScoreScreen = f23_arg4
		return f23_local1
	else
		return nil
	end
end

function RepeatStoreButtonNewStickerUpdate( f24_arg0 )
	local storeButtonNewStickerUpdateTimer = LUI.UITimer.new( 500, "TickStoreButtonNewStickerUpdate", nil, false )
	storeButtonNewStickerUpdateTimer.id = "StoreButtonNewStickerUpdateTimer"
	f24_arg0:registerEventHandler( "TickStoreButtonNewStickerUpdate", function ( element, event )
		StoreButtonNewStickerUpdate( element, event )
	end )
	f24_arg0:addElement( storeButtonNewStickerUpdateTimer )
	f24_arg0.storeButtonNewStickerUpdateTimer = storeButtonNewStickerUpdateTimer
	
end

function StoreButtonNewStickerUpdate( f26_arg0, f26_arg1 )
	if f26_arg0.storeButtonNewStickerUpdateTimer == nil then
		RepeatStoreButtonNewStickerUpdate( f26_arg0 )
	end
	local f26_local0 = "hidden"
	if Store.GetAnyNewStoreItemBreadcrumbState() then
		f26_local0 = "default"
	end
	f26_arg0:animateToState( f26_local0 )
end

LUI.MenuTemplate.AddMarketingPanel = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
	if not Engine.IsCoreMode() then
		return 
	else
		f27_arg0.list:addElement( LUI.MarketingPanel.new( nil, {
			channel = f27_arg1,
			exclusiveControllerIndex = f27_arg3,
			comScoreScreen = f27_arg2
		} ) )
	end
end

f0_local0 = 26
f0_local1 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content
f0_local2 = 0.67
local f0_local3 = f0_local0 * 1.2
local f0_local4 = f0_local1 / 4
local f0_local5 = CoD.TextSettings.BodyFontVeryTiny
LUI.MenuTemplate.AddCurrencyInfoPanel = function ( f28_arg0 )
	if not Engine.IsDepotEnabled() or not Engine.InFrontend() or not Engine.IsMultiplayer() or Cac.InPermanentLockingContext() then
		return 
	end
	local f28_local0 = 1
	f28_arg0.currencyInfoPanel = LUI.MenuBuilder.BuildAddChild( f28_arg0, {
		type = "UIElement",
		id = f28_arg0.id .. "_currencyInfoPanel",
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 0,
				bottom = f0_local0
			}
		}
	} )
	local f28_local1 = Engine.Localize( "@DEPOT_NEXT_DEPOT_CREDIT" )
	local f28_local2 = f0_local0 / 2 - f28_local0
	local f28_local3, f28_local4, f28_local5, f28_local6 = GetTextDimensions( f28_local1, f0_local5.Font, f28_local2 )
	local f28_local7 = 2
	f28_arg0.currencyInfoPanel.creditProgressContainer = LUI.MenuBuilder.BuildAddChild( f28_arg0.currencyInfoPanel, {
		type = "UIElement",
		id = f28_arg0.id .. "_creditProgressContainer",
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				left = -f28_local5,
				right = 0,
				top = 0,
				bottom = 0
			}
		}
	} )
	f28_arg0.currencyInfoPanel.creditProgressContainer.nextDepotCreditText = LUI.MenuBuilder.BuildAddChild( f28_arg0.currencyInfoPanel.creditProgressContainer, {
		type = "UIText",
		id = f28_arg0.currencyInfoPanel.creditProgressContainer.id .. "_nextDepotCreditText",
		properties = {
			text = f28_local1
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = f28_local7,
				bottom = f28_local2,
				font = f0_local5.Font,
				horizontalAlignment = LUI.HorizontalAlignment.Center,
				verticalAlignment = LUI.VerticalAlignment.Top,
				color = Colors.primary_text_color
			}
		}
	} )
	f28_arg0.currencyInfoPanel.creditProgressContainer.nextDepotCreditText:setupAutoScaleText()
	local f28_local8 = GetCurrencyBalance( InventoryCurrencyType.Credits, f28_arg0.exclusiveController )
	f28_arg0.currencyInfoPanel.creditProgressContainer.creditProgressBar = LUI.MenuBuilder.BuildAddChild( f28_arg0.currencyInfoPanel.creditProgressContainer, {
		type = "UIProgressBar",
		id = f28_arg0.currencyInfoPanel.creditProgressContainer.id .. "_creditProgressBar",
		properties = {
			background_color = Colors.h1.dark_grey,
			segment_colors = {
				Colors.h1.light_grey
			},
			progress_values = {
				f28_local8 - math.floor( f28_local8 )
			}
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = true,
				left = 0,
				right = 0,
				top = -f28_local2,
				bottom = -f28_local7
			}
		}
	} )
	local f28_local9 = {
		InventoryCurrencyType.Credits,
		InventoryCurrencyType.Parts
	}
	if CoD.IsCPEnabled() then
		f28_local9[#f28_local9 + 1] = InventoryCurrencyType.CoDPoints
	end
	f28_local2 = f0_local0 * f0_local2
	local f28_local10 = f28_local2 / 2
	local f28_local11 = 2
	f28_arg0.currencyInfoPanel.currencyBalanceContainers = {}
	for f28_local12 = 1, #f28_local9, 1 do
		local f28_local15 = GetCurrencyBalance( f28_local9[f28_local12], f28_arg0.exclusiveController )
		f28_local1 = tostring( math.floor( f28_local15 ) )
		f28_local3, f28_local4, f28_local5, f28_local6 = GetTextDimensions( f28_local1, f0_local5.Font, f28_local2 )
		local f28_local16 = nil
		if f28_local12 == 1 then
			f28_local16 = f28_arg0.currencyInfoPanel.creditProgressContainer
		else
			f28_local16 = f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12 - 1]]
		end
		local f28_local17 = {
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = true,
			left = -f28_local5 - f0_local1 - f0_local4 - f0_local3,
			right = -f0_local1,
			top = 0,
			bottom = 0
		}
		f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]] = LUI.MenuBuilder.BuildAddChild( f28_local16, {
			type = "UIElement",
			id = f28_arg0.currencyInfoPanel.id .. "_currencyBalanceContainer_" .. f28_local9[f28_local12],
			states = {
				default = f28_local17
			}
		} )
		f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].defaultAnimationState = f28_local17
		f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].amount = f28_local15
		f28_local17 = {
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			left = -f28_local5,
			right = 0,
			top = f28_local11 - f28_local10,
			bottom = f28_local11 + f28_local10,
			font = f0_local5.Font,
			horizontalAlignment = LUI.HorizontalAlignment.None,
			verticalAlignment = LUI.VerticalAlignment.None,
			color = Colors.primary_text_color
		}
		f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].currencyText = LUI.MenuBuilder.BuildAddChild( f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]], {
			type = "UIText",
			id = f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].id .. "_currencyAmount",
			properties = {
				text = f28_local1
			},
			states = {
				default = f28_local17
			}
		} )
		f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].currencyText.defaultAnimationState = f28_local17
		f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].currencyImg = LUI.MenuBuilder.BuildAddChild( f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]], {
			type = "UIImage",
			id = f28_arg0.currencyInfoPanel.currencyBalanceContainers[f28_local9[f28_local12]].id .. "_currencyImg",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = true,
					left = 0,
					right = f0_local3,
					top = -(f0_local3 - f0_local0) / 2,
					bottom = (f0_local3 - f0_local0) / 2,
					material = RegisterMaterial( GetCurrencyImage( f28_local9[f28_local12] ) )
				}
			}
		} )
	end
	f28_arg0.currencyInfoPanel:registerEventHandler( "on_crafted_item", function ( element, event )
		f28_arg0:UpdateCurrency( InventoryCurrencyType.Parts )
	end )
	f28_arg0.currencyInfoPanel:registerEventHandler( "inventory", function ( element, event )
		f28_arg0:UpdateCurrency( InventoryCurrencyType.CoDPoints )
	end )
end

LUI.MenuTemplate.HighlightCurrency = function ( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg0.currencyInfoPanel.currencyBalanceContainers[f31_arg1]
	if f31_local0 ~= nil then
		local f31_local1 = 1000
		local f31_local2 = 1.1
		local f31_local3 = f0_local0 * f0_local2
		if not f31_local0.highlightCurrencyElems then
			f31_local0.highlightCurrencyElems = {}
		end
		local f31_local4 = LUI.DeepCopy( f31_local0.currencyText.defaultAnimationState )
		f31_local4.alpha = 1
		f31_local0.highlightCurrencyElems[f31_arg1] = LUI.UIText.new( f31_local4 )
		f31_local0:addElement( f31_local0.highlightCurrencyElems[f31_arg1] )
		f31_local0.highlightCurrencyElems[f31_arg1]:setText( f31_local0.currencyText.text )
		f31_local4.top = (f31_local4.top - f31_local4.bottom) * f31_local2
		local f31_local5, f31_local6, f31_local7, f31_local8 = GetTextDimensions( f31_local0.currencyText.text, f0_local5.Font, f31_local4.bottom - f31_local4.top )
		local f31_local9 = (f31_local7 - f31_local5 - f31_local4.right - f31_local4.left) / 2
		f31_local4.left = f31_local4.left - f31_local9
		f31_local4.right = f31_local4.right + f31_local9
		f31_local4.verticalAlignment = LUI.VerticalAlignment.Bottom
		f31_local4.alpha = 0
		f31_local0.highlightCurrencyElems[f31_arg1]:registerAnimationState( "highlight", f31_local4 )
		f31_local0.highlightCurrencyElems[f31_arg1]:animateInSequence( {
			{
				"default",
				0
			},
			{
				"highlight",
				f31_local1
			}
		}, nil, true, true )
		f31_local0:registerEventHandler( "remove_highlight", function ( element, event )
			element:removeElement( element.highlightCurrencyElems[f31_arg1] )
			element.highlightCurrencyElems[f31_arg1] = nil
		end )
		f31_local0:addElement( LUI.UITimer.new( f31_local1, "remove_highlight", nil, true ) )
	end
end

LUI.MenuTemplate.UpdateCurrency = function ( f33_arg0, f33_arg1 )
	local f33_local0 = f33_arg0.currencyInfoPanel.currencyBalanceContainers[f33_arg1]
	if f33_local0 ~= nil then
		local f33_local1 = GetCurrencyBalance( f33_arg1, f33_arg0.exclusiveController )
		local f33_local2 = tostring( math.floor( f33_local1 ) )
		local f33_local3, f33_local4, f33_local5, f33_local6 = GetTextDimensions( f33_local2, f0_local5.Font, f0_local0 * f0_local2 )
		f33_local0.defaultAnimationState.left = -f33_local5 - f0_local1 - f0_local4 - f0_local3
		f33_local0:registerAnimationState( "default", f33_local0.defaultAnimationState )
		f33_local0:animateToState( "default" )
		f33_local0.currencyText.defaultAnimationState.left = -f33_local5
		f33_local0.currencyText:registerAnimationState( "default", f33_local0.currencyText.defaultAnimationState )
		f33_local0.currencyText:animateToState( "default" )
		f33_local0.currencyText:setText( f33_local2 )
		f33_local0.currencyText.text = f33_local2
		if f33_arg1 == InventoryCurrencyType.Credits then
			f33_arg0.currencyInfoPanel.creditProgressContainer.creditProgressBar:processEvent( {
				name = "progress_refresh",
				newValues = {
					f33_local1 - math.floor( f33_local1 )
				}
			} )
		elseif InventoryCurrencyType.CoDPoints then
			if f33_local0.amount < f33_local1 then
				Engine.PlaySound( "h1_mpui_purch_codpts" )
			end
			f33_local0.amount = f33_local1
		end
	end
end

LUI.MenuTemplate.OnGainFocus = function ( f34_arg0, f34_arg1 )
	if f34_arg0.list ~= nil then
		f34_arg0.list:processEvent( f34_arg1 )
	end
end

LUI.MenuTemplate.AddWorldBlur = function ( f35_arg0, f35_arg1, f35_arg2 )
	local self = LUI.UIElement.new( {
		worldBlur = f35_arg2 or 5
	} )
	self.id = f35_arg1 .. "_blur"
	self:setupWorldBlur()
	f35_arg0:addElement( self )
end

LUI.MenuTemplate.AddDarken = function ( f36_arg0, f36_arg1, f36_arg2 )
	local f36_local0 = CoD.CreateState( -100, -100, 100, 100, CoD.AnchorTypes.All )
	f36_local0.material = RegisterMaterial( "black" )
	f36_local0.alpha = 0
	local self = LUI.UIImage.new( f36_local0 )
	self.id = f36_arg1 .. "_darken"
	self:setupFullWindowElement()
	f36_arg0:addElement( self )
	self:registerAnimationState( "end_state", {
		alpha = 0.5
	} )
	self:animateToState( "end_state", f36_arg2 or 0, true, true )
end

LUI.MenuTemplate.AddVignette = function ( f37_arg0 )
	local f37_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f37_local0.material = RegisterMaterial( "h1_ui_bg_vignette" )
	local self = LUI.UIImage.new( f37_local0 )
	self:setupFullWindowElement()
	f37_arg0:addElement( self )
end

LUI.MenuTemplate.AddImageDecorations = function ( f38_arg0 )
	if Engine.InFrontend() then
		local f38_local0 = CoD.CreateState( nil, 0, nil, nil, CoD.AnchorTypes.TopLeftRight )
		f38_local0.height = 104
		f38_local0.left = -2
		f38_local0.material = RegisterMaterial( "h1_ui_header_glitch" )
		f38_arg0:addElement( LUI.UIImage.new( f38_local0 ) )
		f38_local0 = CoD.CreateState( nil, nil, nil, 0, CoD.AnchorTypes.BottomLeftRight )
		f38_local0.height = 80
		f38_local0.material = RegisterMaterial( "h1_ui_footer_glitch" )
		f38_arg0:addElement( LUI.UIImage.new( f38_local0 ) )
	end
end

LUI.MenuTemplate.InitInGameBkg = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
	if not Engine.InFrontend() then
		if Engine.IsMultiplayer() then
			LUI.MenuTemplate.AddWorldBlur( f39_arg0, f39_arg1 )
			LUI.MenuTemplate.AddDarken( f39_arg0, f39_arg1 )
		else
			LUI.MenuTemplate.AddWorldBlur( f39_arg0, f39_arg1, 9 )
			LUI.MenuTemplate.AddDarken( f39_arg0, f39_arg1, f39_arg3 )
		end
	end
end

LUI.MenuTemplate.AddBackButton = function ( f40_arg0, f40_arg1, f40_arg2 )
	if not f40_arg1 then
		f40_arg1 = MBh.LeaveMenu()
	end
	local f40_local0 = f40_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addBackButton, f40_arg1, f40_arg2, true )
	f40_local0:clearActionSFX()
	return f40_local0
end

LUI.MenuTemplate.AddBackButtonWithSelector = function ( f41_arg0, f41_arg1, f41_arg2 )
	if not f41_arg1 then
		f41_arg1 = MBh.LeaveMenu()
	end
	local f41_local0 = f41_arg0
	local f41_local1 = f41_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addBackButton, function ( f42_arg0, f42_arg1 )
		if f41_local0.ActiveSelector then
			LUI.Options.CloseSelectionMenu( f41_local0, true )
		else
			f41_arg1( f42_arg0, f42_arg1 )
		end
	end, f41_arg2, true )
	f41_local1:clearActionSFX()
	return f41_local1
end

LUI.MenuTemplate.AddHelpButton = function ( f43_arg0 )
	f43_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addHelpButton, function ( f44_arg0, f44_arg1 )
		Engine.Help()
	end )
end

LUI.MenuTemplate.AddOptionalBackground = function ( menu, controller )
	local self = LUI.UIImage.new( controller )
	self:setupFullWindowElement()
	self.id = menu.type .. "_bg"
	menu:addElement( self )
end

LUI.MenuTemplate.GetDefaultBreadCrumpText = function ()
	if Engine.IsMultiplayer() then
		return Engine.Localize( "@MENU_MULTIPLAYER_CAPS" )
	elseif Engine.InFrontend() then
		return Engine.Localize( "@MENU_SP_CAMPAIGN" )
	else
		return Engine.GetDvarBool( "arcademode" ) and Engine.ToUpperCase( Engine.Localize( "@MENU_ARCADEMODE" ) ) or Engine.Localize( "@MENU_SP_CAMPAIGN" )
	end
end

LUI.MenuTemplate.SetBreadCrumb = function ( f47_arg0, f47_arg1 )
	f47_arg0:dispatchEventToChildren( {
		name = "update_breadcrumb_text",
		string = f47_arg1,
		dispatchChildren = true
	} )
end

LUI.MenuTemplate.GetTitleDimensions = function ( f48_arg0 )
	return GetTextDimensions( f48_arg0, CoD.TextSettings.H1TitleFont.Font, CoD.TextSettings.H1TitleFont.Height )
end

LUI.MenuTemplate.AddDotElement = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3, f49_arg4 )
	local f49_local0 = Engine.IsRightToLeftLanguage()
	local f49_local1, f49_local2, f49_local3, f49_local4 = LUI.MenuTemplate.GetTitleDimensions( f49_arg1 )
	local f49_local5 = {
		type = "UIImage"
	}
	local f49_local6 = {}
	local f49_local7 = {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false
	}
	if f49_local0 then
		local f49_local8 = f49_arg2
	end
	f49_local7.left = f49_local8 or f49_arg2 + f49_local3 + 10
	f49_local7.width = 8
	f49_local7.top = LUI.MenuTemplate.Title.Top + f49_arg3 + CoD.TextSettings.H1TitleFont.Height - 12
	f49_local7.height = 8
	f49_local7.material = RegisterMaterial( "h1_deco_title_point" )
	f49_local7.alpha = 1
	f49_local6.default = f49_local7
	f49_local6.hidden = {
		alpha = 0
	}
	f49_local5.states = f49_local6
	f49_local5.handlers = {
		start_anim = function ( f50_arg0, f50_arg1 )
			local f50_local0 = GenericMenuAnimationSettings.DotDuration
			local f50_local1 = MBh.AnimateSequence( {
				{
					"hidden",
					0
				},
				{
					"default",
					f50_local0,
					true,
					true
				},
				{
					"hidden",
					f50_local0,
					true,
					true
				},
				{
					"default",
					f50_local0,
					true,
					true
				},
				{
					"hidden",
					f50_local0,
					true,
					true
				},
				{
					"default",
					f50_local0,
					true,
					true
				},
				{
					"hidden",
					f50_local0,
					true,
					true
				},
				{
					"default",
					f50_local0,
					true,
					true
				}
			} )
			f50_local1( f50_arg0 )
		end
	}
	f49_arg0.dotElement = LUI.MenuBuilder.BuildAddChild( f49_arg0, f49_local5 )
	f49_arg0.dotElement:processEvent( {
		name = "start_anim"
	} )
end

LUI.MenuTemplate.useSharedTitle = true
LUI.MenuTemplate.AddTitle = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4, f51_arg5, f51_arg6, f51_arg7 )
	if f51_arg2 then
		f51_arg1 = Engine.ToUpperCase( f51_arg1 )
	end
	local f51_local0 = f51_arg4 or 0
	local f51_local1 = f51_arg5 or 0
	if wholeTitle.MenuTemplate.Title.element ~= nil then
		assert( wholeTitle.MenuTemplate.Title.active == false )
		assert( wholeTitle.MenuTemplate.Title.headertext )
		f51_arg0:addElement( wholeTitle.MenuTemplate.Title.element )
		f51_arg0.wholeTitle = wholeTitle.MenuTemplate.Title.element
		
		f51_arg0.title = wholeTitle.MenuTemplate.Title.headertext
		wholeTitle.MenuTemplate.Title.active = true
		f51_arg0:dispatchEventToChildren( {
			name = "update_header_text",
			string = f51_arg1,
			dispatchChildren = true
		} )
		if not f51_arg6 then
			wholeTitle.MenuTemplate.Title.element.dotElement:close()
			wholeTitle.MenuTemplate.AddDotElement( wholeTitle.MenuTemplate.Title.element, f51_arg1, f51_local0, f51_local1 )
		end
		wholeTitle.MenuTemplate.Title.element = nil
		return 
	end
	local f51_local2 = Engine.IsRightToLeftLanguage()
	local f51_local3 = wholeTitle.MenuBuilder.BuildAddChild
	local f51_local4 = f51_arg0
	local f51_local5 = {
		type = "generic_menu_title",
		id = "generic_title"
	}
	local f51_local6 = {
		menu_title = f51_arg1,
		menu_title_width = f51_arg3
	}
	local f51_local7
	if f51_local2 then
		f51_local7 = 14
		if not f51_local7 then
		
		else
			f51_local6.headerStartX = f51_local7
			f51_local6.marqueePadding = -5
			f51_local5.properties = f51_local6
			f51_local5.states = {
				default = {
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					left = f51_local0,
					top = f51_local1,
					alpha = 1
				},
				hidden = {
					alpha = 0
				}
			}
			f51_local3 = f51_local3( f51_local4, f51_local5 )
			f51_arg0.wholeTitle = f51_local3
			f51_arg0.title = f51_local3:getFirstDescendentById( "header_text" )
			assert( f51_arg0.title, "Title need a header text." )
			if wholeTitle.MenuTemplate.useSharedTitle then
				wholeTitle.MenuTemplate.Title.active = true
				f51_local3:registerEventHandler( "menu_close", function ( element, event )
					assert( LUI.MenuTemplate.Title.element == nil )
					local f52_local0 = element:getParent()
					LUI.MenuTemplate.Title.element = element
					LUI.MenuTemplate.Title.headertext = f52_local0.title
					f52_local0:removeElement( element )
					f52_local0.title = nil
					LUI.MenuTemplate.Title.active = false
					LUI.MenuTemplate.SetBreadCrumb( element, LUI.MenuTemplate.GetDefaultBreadCrumpText() )
				end )
				f51_local3:registerEventHandler( "closeallmenus", function ( element, event )
					element:close()
					LUI.MenuTemplate.Title.active = false
					LUI.MenuTemplate.Title.element = nil
					LUI.MenuTemplate.Title.headertext = nil
				end )
			end
			wholeTitle.MenuTemplate.AddDotElement( f51_local3, f51_arg1, f51_local0, f51_local1 )
		end
	end
	f51_local7 = 0
end

function OnPartyStatusRefresh( f54_arg0, f54_arg1, f54_arg2 )
	local f54_local0 = Lobby.GetPartyStatus()
	if f54_arg2 then
		f54_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "partyStatus",
			helper_text = f54_local0,
			side = "left",
			clickable = false,
			color = Colors.s1.text_focused,
			bindTextID = "PrivatePartyStatus",
			width = 500
		}, nil, nil, true )
	else
		f54_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "partyStatus",
			helper_text = f54_local0,
			side = "left",
			clickable = false,
			color = Colors.s1.text_focused,
			width = 500
		}, nil, nil, true )
	end
end

function SetupUIBindTextDelayed( f55_arg0, f55_arg1 )
	f55_arg0:setupUIBindText( "PrivatePartyStatus" )
	f55_arg0:setClass( LUI.UIText )
	local f55_local0 = f55_arg0:getParent()
	if f55_local0 then
		local f55_local1 = f55_local0:getChildById( "partyStatusTimer" )
		if f55_local1 then
			LUI.UITimer.Stop( f55_local1 )
			f55_local1:close()
		end
	end
end

LUI.MenuTemplate.AddPartyStatus = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
	local f56_local0 = CoD.TextSettings.BodyFontSmall
	local f56_local1 = -16
	local f56_local2 = 160
	if f56_arg3 then
		f56_local1 = -GenericFooterDims.Height
	end
	local f56_local3 = f56_local1 - f56_local0.Height
	local f56_local4 = 0
	OnPartyStatusRefresh( f56_arg0, nil, f56_arg1 )
	f56_arg0:registerEventHandler( "refreshPartyStatus", OnPartyStatusRefresh )
	f56_local4 = 200
	if f56_local4 > 0 then
		f56_arg0:addElement( LUI.UITimer.new( f56_local4, "refreshPartyStatus" ) )
	end
end

LUI.MenuTemplate.RefreshFriendsWidget = function ( f57_arg0 )
	if f57_arg0.friendsWidget then
		f57_arg0.friendsWidget:processEvent( {
			name = "live_connection"
		} )
	end
end

LUI.MenuTemplate.AddMapDisplay = function ( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = f58_arg1()
	f58_local0.parentList = f58_arg0.list
	if f58_arg2 then
		f58_arg0:AddSpacing( 17 )
	else
		f58_arg0:AddSpacing( 78 )
	end
	f58_arg0.list:addElement( f58_local0 )
	f58_local0:Refresh()
	f58_arg0.mapDisplay = f58_local0
end

LUI.MenuTemplate.AddRotateHelp = function ( f59_arg0 )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f59_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addRightStickButton )
	else
		f59_arg0:AddHelp( LUI.ButtonHelperText.CommonEvents.addMouseDrag )
	end
end

LUI.MenuTemplate.CountdownTextPadding = 18
LUI.MenuTemplate.RefreshCountdownTimer = function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4 )
	local f60_local0 = false
	if MatchRules.IsUsingMatchRulesData() then
		f60_local0 = MatchRules.GetData( "commonOption", "timeLimit" ) == 0
	end
	if f60_arg2.countdownStarted == true and f60_arg2.countdownTextHidden == true then
		f60_arg1:animateToState( "hidden" )
		if f60_local0 == false then
			local f60_local1, f60_local2, f60_local3, f60_local4 = f60_arg2:getLocalRect()
			f60_arg3:registerAnimationState( "widthAdjust", {
				width = f60_local3 - f60_local1 + LUI.MenuTemplate.CountdownTextPadding
			} )
			f60_arg3:animateToState( "widthAdjust" )
			f60_arg2:animateToState( "default" )
			f60_arg4:animateToState( "default" )
		end
	else
		if f60_arg0 ~= 0 then
			f60_arg2.countdownStarted = true
		end
		if f60_arg0 >= 11 then
			f60_arg1:animateToState( "default" )
		elseif f60_arg0 <= 10 and f60_arg2.countdownStarted == true then
			f60_arg1:animateToState( "warning" )
			f60_arg4:animateToState( "warning" )
		end
		if f60_arg2.countdownStarted == true and f60_arg2.countdownTextHidden == false then
			if f60_arg0 == 0 then
				f60_arg1:animateToState( "default" )
				f60_arg4:animateToState( "default" )
				f60_arg1:setText( Engine.Localize( "@MP_MATCH_STARTING" ) )
				local f60_local1, f60_local2, f60_local3, f60_local4 = GetTextDimensions( Engine.Localize( "@MP_MATCH_STARTING" ), CoD.TextSettings.BodyFont24.Font, CoD.TextSettings.BodyFontSmall.Height )
				f60_arg3:registerAnimationState( "widthAdjust", {
					width = f60_local3 + LUI.MenuTemplate.CountdownTextPadding
				} )
				f60_arg3:animateToState( "widthAdjust" )
				if f60_local0 == true then
					f60_arg2.countdownTextHidden = true
					if f60_arg2.delayTimer == nil then
						local self = LUI.UITimer.new( 2000, "delay_complete", nil, true )
						f60_arg2.delayTimer = self
						f60_arg1:registerEventHandler( "delay_complete", function ()
							f60_arg3:hide()
						end )
						f60_arg1:addElement( self )
					end
				end
			else
				local f60_local1 = Engine.Localize( "@MP_MATCH_BEGINS_IN_VAL", f60_arg0 )
				local f60_local2, f60_local3, f60_local4, self = GetTextDimensions( f60_local1, CoD.TextSettings.BodyFont24.Font, CoD.TextSettings.BodyFontSmall.Height )
				f60_arg1:setText( f60_local1 )
				f60_arg3:registerAnimationState( "widthAdjust", {
					width = f60_local4 + LUI.MenuTemplate.CountdownTextPadding
				} )
				f60_arg3:animateToState( "widthAdjust" )
			end
		end
	end
end

LUI.MenuTemplate.SetGameEndedText = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
	local f62_local0 = {
		{
			name = Engine.ToUpperCase( Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) ) ),
			icon = Engine.GetDvarString( "g_TeamIcon_Axis" )
		},
		{
			name = Engine.ToUpperCase( Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) ) ),
			icon = Engine.GetDvarString( "g_TeamIcon_Allies" )
		}
	}
	if string.find( tostring( f62_local0[Teams.allies].name ), "MARINES" ) then
		CoD.SwapFactionReasonStrings()
	else
		CoD.RestoreFactionReasonStrings()
	end
	local f62_local1 = Engine.Localize( CoD.ReasonStrings[f62_arg0] )
	f62_arg1:animateToState( "default" )
	f62_arg3:animateToState( "default" )
	f62_arg2:show()
	f62_arg1:setText( f62_local1 )
	local f62_local2, f62_local3, f62_local4, f62_local5 = GetTextDimensions( f62_local1, CoD.TextSettings.BodyFont24.Font, CoD.TextSettings.BodyFontSmall.Height )
	f62_arg2:registerAnimationState( "widthAdjust", {
		width = f62_local4 + LUI.MenuTemplate.CountdownTextPadding
	} )
	f62_arg2:animateToState( "widthAdjust" )
end

LUI.MenuTemplate.AddCountdownTimer = function ( f63_arg0 )
	local f63_local0 = 25
	local self = LUI.UIElement.new( {
		top = f63_local0,
		left = 0,
		bottom = f63_local0 * 2,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		leftAnchor = false
	} )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "black" ),
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		leftAnchor = true
	} )
	local f63_local3 = LUI.DecoFrame.new( {
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		leftAnchor = true,
		color = Colors.white
	}, LUI.DecoFrame.Grey )
	f63_local3:registerAnimationState( "warning", {
		color = {
			r = 1,
			g = 0.23,
			b = 0.27
		}
	} )
	local f63_local4 = LUI.MenuBuilder.buildItems( {
		type = "timersHudDef"
	}, {} )
	f63_local4:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		height = CoD.TextSettings.TitleFontSmallBold.Height,
		alpha = 1
	} )
	f63_local4:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f63_local4:animateToState( "hidden" )
	f63_local4.countdownStarted = false
	f63_local4.countdownTextHidden = false
	local f63_local5 = CoD.CreateState( nil, 6, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f63_local5.font = CoD.TextSettings.BodyFontSmall.Font
	f63_local5.height = CoD.TextSettings.BodyFontSmall.Height
	f63_local5.color = Colors.mw1_green
	f63_local5.alignment = LUI.Alignment.Center
	f63_local5.alpha = 1
	local self = LUI.UIText.new( f63_local5 )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "warning", {
		color = {
			r = 1,
			g = 0.23,
			b = 0.27
		}
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerOmnvarHandler( "ui_match_countdown", function ( f64_arg0, f64_arg1 )
		LUI.MenuTemplate.RefreshCountdownTimer( f64_arg1.value, self, f63_local4, self, f63_local3 )
	end )
	LUI.MenuTemplate.RefreshCountdownTimer( Game.GetOmnvar( "ui_match_countdown" ), self, f63_local4, self, f63_local3 )
	f63_local4:registerEventHandler( "timer_active", function ( element, event )
		if f63_local4.countdownTextHidden == false then
			f63_local4.countdownStarted = true
			f63_local4.countdownTextHidden = true
			self:animateToState( "hidden" )
			local f65_local0, f65_local1, f65_local2, f65_local3 = f63_local4:getLocalRect()
			self:registerAnimationState( "widthAdjust", {
				width = f65_local2 - f65_local0 + 18
			} )
			self:animateToState( "widthAdjust" )
			f63_local4:animateToState( "default" )
			f63_local3:animateToState( "default" )
		end
	end )
	f63_local4:registerEventHandler( "timer_timeout", function ( element, event )
		local f66_local0 = Game.GetOmnvar( "ui_round_end_reason" )
		if f66_local0 ~= 0 then
			LUI.MenuTemplate.SetGameEndedText( f66_local0, self, self, f63_local3 )
		end
	end )
	self:addElement( self )
	self:addElement( f63_local3 )
	self:addElement( self )
	self:addElement( f63_local4 )
	f63_arg0:addElement( self )
end

LUI.MenuTemplate.new = function ( f67_arg0, f67_arg1 )
	assert( f67_arg0 ~= nil )
	if not f67_arg1 then
		f67_arg1 = {}
	end
	if GameX.IsSplitscreen() then
		f67_arg1.do_not_add_friends_helper = true
	end
	local f67_local0 = CoD.CreateState( DesignGridDims.horz_gutter, DesignGridDims.vert_gutter, -DesignGridDims.horz_gutter, -DesignGridDims.vert_gutter, CoD.AnchorTypes.All )
	local self = f67_arg1.menu_alpha
	if not self then
		self = 1
	end
	f67_local0.alpha = self
	self = LUI.UIElement.new( f67_local0 )
	self:setClass( LUI.MenuTemplate )
	self:disableTreeFocus()
	self:registerEventHandler( "gain_focus", LUI.MenuTemplate.OnGainFocus )
	self.type = f67_arg0.type
	self.id = self.type .. "_container"
	self.exclusiveController = f67_arg0.properties and f67_arg0.properties.exclusiveController or Engine.GetSignedInAsController()
	self.menu_list_divider_top_offset = f67_arg1.menu_list_divider_top_offset
	self:InitInGameBkg( self.type, f67_arg1.distortion, f67_arg1.delay_display )
	if f67_arg1.menu_bg_state then
		self:AddOptionalBackground( f67_arg1.menu_bg_state )
	end
	if Engine.InFrontend() then
		if f67_arg1.persistentBackground then
			PersistentBackground.Set( f67_arg1.persistentBackground )
		else
			PersistentBackground.Set( PersistentBackground.Variants.Default )
		end
	end
	self:AddVignette()
	local self = LUI.UIElement.new()
	self:setupFullWindowElement()
	self:addElement( self )
	self.AddImageDecorations( self )
	self:AddTitle( Engine.Localize( f67_arg1.menu_title ), f67_arg1.uppercase_title, f67_arg1.menu_title_width, nil, nil, f67_arg1.skipAnim, f67_arg1.delay_display )
	if f67_arg1.noHeader == nil or not f67_arg1.noHeader then
		self:AddHeaderDividers()
	end
	local f67_local3 = LUI.MenuTemplate.ListTop
	if f67_arg1.menu_top_indent then
		f67_local3 = f67_local3 + f67_arg1.menu_top_indent
	end
	local f67_local4 = f67_arg1.menu_height
	if not f67_local4 then
		f67_local4 = 200
	end
	f67_local4 = f67_local4 + f67_local3
	local f67_local5 = 0
	local f67_local6 = f67_arg1.menu_width
	if not f67_local6 then
		f67_local6 = GenericMenuDims.menu_width_standard
	end
	f67_local6 = f67_local6 + f67_local5
	local f67_local7 = CoD.CreateState( f67_local5, f67_local3, f67_local6, f67_local4, CoD.AnchorTypes.TopLeft )
	f67_local7.font = CoD.TextSettings.BodyFontSmall.Font
	self.width = f67_local6 - f67_local5
	if f67_arg1.spacing then
		f67_local7.spacing = f67_arg1.spacing
	else
		f67_local7.spacing = H1MenuDims.spacing
	end
	local f67_local8 = nil
	if f67_arg1.subContainer then
		local subContainer = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		subContainer.id = self.type .. "_sub_container"
		self:addElement( subContainer )
		self.subContainer = subContainer
		
		f67_local8 = subContainer
	else
		f67_local8 = self
	end
	local self = nil
	if f67_arg1.scrollInSplitScreen and GameX.IsSplitscreen() then
		f67_local7.bottom = f67_local3 + 265
		self = LUI.UIScrollingVerticalList.new( f67_local7, nil, {
			use_arrows = true,
			sendScrollEvents = true,
			autoScroll = LUI.AutoScroll.AnchoredEdges,
			autoScrollTime = 200
		} )
		self.id = self.type .. "_list"
		f67_local8:addElement( self )
	else
		self = LUI.UIVerticalList.build( nil, {
			defaultState = f67_local7,
			noWrap = f67_arg1.listNoWrap,
			blockRepeatWrap = true
		} )
		self.id = self.type .. "_list"
		f67_local8:addElement( self )
	end
	self.buttonCount = 0
	self.list = self
	if f67_arg1.genericListAction then
		self.genericListAction = function ( f68_arg0, f68_arg1 )
			if not f68_arg1 then
				f68_arg1 = {}
			end
			f68_arg1.menu = self
			f67_arg1.genericListAction( f68_arg0, f68_arg1 )
		end
		
	end
	local subContainer = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main",
		id = self.type .. "_help"
	} )
	subContainer.skipAnim = f67_arg1.skipAnim
	subContainer:setupFullWindowElement()
	self.help = subContainer:getFirstDescendentById( "container" )
	if (Engine.IsConsoleGame() or Engine.IsGamepadEnabled()) and (f67_arg1.showSelectButton == nil or f67_arg1.showSelectButton) then
		self:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	if Engine.IsMultiplayer() and (not f67_arg1.do_not_add_friends_helper or f67_arg1.do_not_add_friends_helper ~= true) then
		self.friendsWidget = LUI.MenuBuilder.BuildAddChild( self, {
			type = "online_friends_widget",
			id = "online_friends_widget_id"
		} )
	end
	local f67_local11 = Engine.GetDvarInt( "virtualLobbyMode" )
	if (f67_local11 == VirtualLobbyModes.LUI_MODE_LOBBY or f67_local11 == VirtualLobbyModes.LUI_MODE_CAO or f67_local11 == VirtualLobbyModes.LUI_MODE_CLANPROFILE or f67_local11 == VirtualLobbyModes.LUI_MODE_CAC or f67_local11 == VirtualLobbyModes.LUI_MODE_CAC_WEAP or f67_local11 == VirtualLobbyModes.LUI_MODE_CAO_CHARACTER or f67_local11 == VirtualLobbyModes.LUI_MODE_CAO_CAMOUFLAGE or f67_local11 == VirtualLobbyModes.LUI_MODE_CAO_COLLECTIONS) and not Engine.IsConsoleGame() and Engine.InFrontend() and f67_arg0 and f67_arg0.properties and f67_arg0.properties.weaponType ~= "reticle" then
		self:addElement( VLobbyCharRotArea( nil, {
			vLobbyMode = f67_local11
		} ) )
	end
	local f67_local12 = f67_arg1.partyStatusAboveHelp
	local f67_local13 = LUI.FlowManager.IsInStack
	local f67_local14 = Engine.GetLuiRoot()
	if f67_local13( f67_local14.flowManager, "menu_xboxlive_lobby" ) then
		self:AddPartyStatus( nil, nil, f67_local12 )
	else
		f67_local13 = LUI.FlowManager.IsInStack
		f67_local14 = Engine.GetLuiRoot()
		if not f67_local13( f67_local14.flowManager, "menu_xboxlive_privatelobby" ) then
			f67_local13 = LUI.FlowManager.IsInStack
			f67_local14 = Engine.GetLuiRoot()
			if f67_local13( f67_local14.flowManager, "menu_systemlink" ) then
			
			else
				return self
			end
		end
		self:AddPartyStatus( true, true, f67_local12 )
	end
	return self
end

LockTable( _M )
