local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotSupplyDropPurchasePopup = InheritFrom( LUI.MenuTemplate )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0 = 30
	if f1_arg0:getRect() then
		local f1_local1 = GenericTitleBarDims.TitleBarHeight + f1_arg3 + f1_arg4 + f1_arg5 * (f1_arg1:getNumChildren() - 1)
		local f1_local2 = f1_arg1:getFirstChild()
		while f1_local2 do
			local f1_local3 = nil
			if f1_local2.getText and f1_local2:getText() then
				local f1_local4 = nil
				f1_local4, f1_local3 = f1_local2:getElementTextDims()
			else
				f1_local3 = f1_local2:getHeight()
			end
			f1_local1 = f1_local1 + f1_local3
			f1_local2 = f1_local2:getNextSibling()
		end
		local f1_local3 = {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			left = -f1_arg2 / 2,
			right = f1_arg2 / 2,
			top = -(f1_local1 / 2 + f1_local0),
			bottom = f1_local1 / 2 - f1_local0,
			alpha = 1
		}
		f1_arg0:registerAnimationState( "final_state", f1_local3 )
		f1_local3.alpha = 0
		f1_arg0:registerAnimationState( "start_state", f1_local3 )
		f1_arg0:registerAnimationState( "wait", f1_local3 )
		f1_arg0:animateInSequence( {
			{
				"start_state",
				0
			},
			{
				"final_state",
				0,
				true,
				true
			}
		}, nil, true, true )
	else
		f1_arg0:animateToState( "start", 1 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5 )
	local f2_local0 = f2_arg4 or GenericPopupAnimationSettings.Global.DelayOut
	local f2_local1 = f2_arg5 or GenericPopupAnimationSettings.Global.DurationOut
	f2_arg0:registerAnimationState( "default", f2_arg1 )
	f2_arg1.alpha = 0
	f2_arg0:registerAnimationState( "hidden", f2_arg1 )
	f2_arg0:animateInSequence( {
		{
			"hidden",
			0,
			true,
			true
		},
		{
			"hidden",
			f2_arg2,
			true,
			true
		},
		{
			"default",
			f2_arg3,
			true,
			true
		}
	} )
	f2_arg0:registerEventHandler( "close_popup", function ( element, event )
		element:animateInSequence( {
			{
				"default",
				f2_local0,
				true,
				true
			},
			{
				"hidden",
				f2_local1,
				true,
				true
			}
		} )
	end )
end

f0_local2 = function ( f4_arg0 )
	f4_arg0.backgroundBorder:animateInSequence( {
		{
			"default",
			67
		}
	} )
	f4_arg0.topDecoration:animateInSequence( {
		{
			"default",
			67
		}
	} )
end

local f0_local3 = function ( f5_arg0 )
	f5_arg0.backgroundBorder:animateInSequence( {
		{
			"hidden",
			67
		}
	} )
	f5_arg0.topDecoration:animateInSequence( {
		{
			"hidden",
			67
		}
	} )
end

local f0_local4 = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.topDecoration = LUI.Divider.new()
	self.topDecoration:registerAnimationState( "default", {
		alpha = 1
	} )
	self.topDecoration:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self.topDecoration:animateToState( "hidden" )
	self:addElement( self.topDecoration )
	local self = LUI.UIImage.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = GenericTitleBarDims.TitleBarHeight / 2,
		bottom = 0,
		material = RegisterMaterial( "h1_popup_bg_light" ),
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		alpha = 0
	} )
	self:animateToState( "hidden" )
	self.backgroundBorder = self
	self:addElement( self )
	self:registerEventHandler( "menu_create", f0_local2 )
	self:registerEventHandler( "close_popup", f0_local3 )
	return self
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	f7_arg1.paddingBottom = f7_arg1.padding_bottom or 9
	f7_arg1.paddingRight = f7_arg1.padding_right or 11
	f7_arg1.paddingLeft = f7_arg1.padding_left or 11
	f7_arg1.paddingTop = f7_arg1.padding_top or 25
	local self
	if f7_arg1.cancel_will_close ~= nil then
		self = f7_arg1.cancel_will_close
	else
		self = true
	end
	f7_arg1.cancel_will_close = self
	f7_arg1.listSpacing = f7_arg1.popup_list_spacing or 6
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
	local f7_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local1.alpha = 1
	local self = LUI.UIElement.new( f7_local1 )
	self.id = "generic_selectionList_intermediate"
	self:registerAnimationState( "default", f7_local1 )
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
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" ) )
	local self = LUI.UIElement.new()
	self.id = "generic_selectionList_window_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		left = -f7_arg1.popup_width / 2,
		right = f7_arg1.popup_width / 2,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self:registerAnimationState( "start", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		left = -f7_arg1.popup_width / 2,
		right = f7_arg1.popup_width / 2,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self:animateToState( "default" )
	self:animateToState( "start", 1 )
	self:addElement( self )
	self:addElement( f0_local4( f7_arg0, f7_arg1 ) )
	local self = LUI.UIVerticalList.new()
	self.id = "generic_selectionList_content_id"
	f0_local1( self, {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = f7_arg1.paddingLeft,
		right = -f7_arg1.paddingRight,
		top = GenericTitleBarDims.TitleBarHeight + f7_arg1.paddingTop,
		bottom = -f7_arg1.paddingBottom,
		spacing = f7_arg1.listSpacing,
		alpha = 1
	}, GenericPopupAnimationSettings.Window.DelayIn, GenericPopupAnimationSettings.Window.DurationIn, GenericPopupAnimationSettings.Window.DelayOut, GenericPopupAnimationSettings.Window.DurationOut )
	self:addElement( self )
	local f7_local5 = function ( f11_arg0, f11_arg1 )
		f0_local0( f11_arg0, self, f7_arg1.popup_width, f7_arg1.paddingTop, f7_arg1.paddingBottom, f7_arg1.listSpacing )
	end
	
	self:addEventHandler( "menu_create", f7_local5 )
	self:addEventHandler( "resize_popup", f7_local5 )
	self:addEventHandler( "transition_step_complete_final_state", function ( f12_arg0, f12_arg1 )
		Engine.PlaySound( CoD.SFX.PopupAppears )
	end )
	self:registerEventHandler( "close_popup", function ( element, event )
		if self.animOutTimer == nil then
			Engine.PlaySound( CoD.SFX.PopupDisappears )
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
	self:addEventHandler( "transition_complete_start", f7_local5 )
	local self = LUI.UIBindButton.new()
	self.id = "generic_selectionList_back_id"
	self:registerEventHandler( "button_secondary", function ( element, event )
		if f7_arg1.cancel_will_close then
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
		else
			self:processEvent( {
				name = "popup_back",
				controller = event.controller
			} )
		end
	end )
	self:addElement( self )
	self.window = self
	self.list = self
	return self
end

local f0_local6 = function ( f17_arg0 )
	local f17_local0 = tostring( math.floor( GetCurrencyBalance( InventoryCurrencyType.Credits, f17_arg0.exclusiveController ) ) )
	local f17_local1 = CoD.TextSettings.BodyFontVeryTiny
	local f17_local2, f17_local3, f17_local4, f17_local5 = GetTextDimensions( f17_local0, f17_local1.Font, f17_local1.Height )
	local f17_local6 = LUI.MenuTemplate.ButtonStyle.y_offset
	local f17_local7 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content
	local f17_local8 = f17_local7 * 2
	local f17_local9 = RegisterMaterial( GetCurrencyImage( InventoryCurrencyType.Credits ) )
	local f17_local10, f17_local11 = GetMaterialDimensions( f17_local9 )
	local f17_local12 = f17_local1.Height + f17_local7 / 2
	local f17_local13 = f17_local12 * f17_local10 / f17_local11
	f17_arg0.currencyInfoPanel = LUI.MenuBuilder.BuildAddChild( f17_arg0.window, {
		type = "UIElement",
		id = "currencyInfoPanel",
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = -f17_local8,
				top = f17_local8,
				bottom = f17_local8 + f17_local12
			}
		}
	} )
	local f17_local14 = LUI.MenuBuilder.BuildAddChild( LUI.MenuBuilder.BuildAddChild( f17_arg0.currencyInfoPanel, {
		type = "UIText",
		id = "creditsText",
		properties = {
			text = f17_local0
		},
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = -f17_local4,
				right = 0,
				top = f17_local6,
				bottom = f17_local6 + f17_local1.Height,
				font = f17_local1.Font,
				horizontalAlignment = LUI.HorizontalAlignment.None,
				verticalAlignment = LUI.VerticalAlignment.Middle,
				color = Colors.primary_text_color
			}
		}
	} ), {
		type = "UIImage",
		id = "creditsIcon",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f17_local13 - f17_local7 / 4,
				right = -f17_local7 / 4,
				top = -f17_local6 - f17_local12 / 2,
				bottom = -f17_local6 + f17_local12 / 2,
				material = f17_local9
			}
		}
	} )
	f17_local0 = tostring( math.floor( GetCurrencyBalance( InventoryCurrencyType.CoDPoints, f17_arg0.exclusiveController ) ) )
	f17_local2, f17_local3, f17_local4, f17_local5 = GetTextDimensions( f17_local0, f17_local1.Font, f17_local1.Height )
	local f17_local15 = f17_local14
	if CoD.IsCPEnabled() then
		local f17_local16 = LUI.MenuBuilder.BuildAddChild( f17_local14, {
			type = "UIText",
			id = "codPointsText",
			properties = {
				text = f17_local0
			},
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = -f17_local7 - f17_local4,
					right = -f17_local7,
					top = f17_local6 - f17_local1.Height / 2,
					bottom = f17_local6 + f17_local1.Height / 2,
					font = f17_local1.Font,
					horizontalAlignment = LUI.HorizontalAlignment.None,
					verticalAlignment = LUI.VerticalAlignment.Middle,
					color = Colors.primary_text_color
				}
			}
		} )
		f17_local9 = RegisterMaterial( GetCurrencyImage( InventoryCurrencyType.CoDPoints, f17_arg0.exclusiveController ) )
		local f17_local17, f17_local18 = GetMaterialDimensions( f17_local9 )
		f17_local15 = LUI.MenuBuilder.BuildAddChild( f17_local16, {
			type = "UIImage",
			id = "codPointsIcon",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = -(f17_local12 * f17_local17 / f17_local18) - f17_local7 / 4,
					right = -f17_local7 / 4,
					top = -f17_local6 - f17_local12 / 2,
					bottom = -f17_local6 + f17_local12 / 2,
					material = f17_local9
				}
			}
		} )
	end
	f17_local0 = Engine.Localize( "@DEPOT_CURRENT" )
	f17_local2, f17_local3, f17_local4, f17_local5 = GetTextDimensions( f17_local0, f17_local1.Font, f17_local1.Height )
	local f17_local16 = LUI.MenuBuilder.BuildAddChild( f17_local15, {
		type = "UIText",
		id = "currentText",
		properties = {
			text = f17_local0
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f17_local7 - f17_local4,
				right = -f17_local7,
				top = f17_local6 - f17_local1.Height / 2,
				bottom = f17_local6 + f17_local1.Height / 2,
				font = f17_local1.Font,
				horizontalAlignment = LUI.HorizontalAlignment.None,
				verticalAlignment = LUI.VerticalAlignment.Middle,
				color = Colors.primary_text_color
			}
		}
	} )
end

local f0_local7 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0 = Engine.Localize( "@DEPOT_COST" )
	local f18_local1 = CoD.TextSettings.BodyFontSmall
	local f18_local2, f18_local3, f18_local4, f18_local5 = GetTextDimensions( f18_local0, f18_local1.Font, f18_local1.Height )
	local f18_local6 = LUI.MenuTemplate.ButtonStyle.y_offset
	local f18_local7 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content
	local f18_local8 = RegisterMaterial( GetCurrencyImage( f18_arg2 ) )
	local f18_local9, f18_local10 = GetMaterialDimensions( f18_local8 )
	local f18_local11 = f18_local1.Height + f18_local7 / 2
	local f18_local12 = LUI.MenuBuilder.BuildAddChild( LUI.MenuBuilder.BuildAddChild( f18_arg0, {
		type = "UIText",
		id = "costText",
		properties = {
			text = f18_local0
		},
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				left = f18_local7,
				right = f18_local7 + f18_local4,
				top = f18_local6 - f18_local1.Height / 2,
				bottom = f18_local6 + f18_local1.Height / 2,
				font = f18_local1.Font,
				horizontalAlignment = LUI.HorizontalAlignment.None,
				verticalAlignment = LUI.VerticalAlignment.Middle,
				color = Colors.primary_text_color
			}
		}
	} ), {
		type = "UIImage",
		id = "currencyIcon",
		states = {
			default = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				left = f18_local7,
				right = f18_local7 + f18_local11 * f18_local9 / f18_local10,
				top = -f18_local6 - f18_local11 / 2,
				bottom = -f18_local6 + f18_local11 / 2,
				material = f18_local8
			}
		}
	} )
	f18_local0 = tostring( f18_arg3 )
	f18_local2, f18_local3, f18_local4, f18_local5 = GetTextDimensions( f18_local0, f18_local1.Font, f18_local1.Height )
	local f18_local13 = LUI.MenuBuilder.BuildAddChild
	local f18_local14 = f18_local12
	local f18_local15 = {
		type = "UIText",
		id = "currencyText",
		properties = {
			text = f18_local0
		}
	}
	local f18_local16 = {}
	local f18_local17 = {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = f18_local7 / 2,
		right = f18_local7 / 2 + f18_local4,
		top = f18_local6 - f18_local1.Height / 2,
		bottom = f18_local6 + f18_local1.Height / 2,
		font = f18_local1.Font,
		horizontalAlignment = LUI.HorizontalAlignment.None,
		verticalAlignment = LUI.VerticalAlignment.Middle
	}
	local f18_local18
	if f18_arg3 <= GetCurrencyBalance( f18_arg2, f18_arg0.exclusiveController ) then
		f18_local18 = Colors.primary_text_color
		if not f18_local18 then
		
		else
			f18_local17.color = f18_local18
			f18_local16.default = f18_local17
			f18_local15.states = f18_local16
			f18_local13( f18_local14, f18_local15 )
		end
	end
	f18_local18 = Swatches.HUD.Warning
end

local f0_local8 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content
	local f19_local1, f19_local2, f19_local3, f19_local4 = f19_arg0.list:getLocalRect()
	local f19_local5, f19_local6, f19_local7, f19_local8 = f19_arg0.currencyInfoPanel:getLocalRect()
	local f19_local9 = RegisterMaterial( "depot_crate_dialog_backing" )
	local f19_local10, f19_local11 = GetMaterialDimensions( f19_local9 )
	local f19_local12 = f19_local8 + f19_local0 / 2
	local f19_local13 = f19_local2 - f19_local0
	local f19_local14 = (f19_local13 - f19_local12) * f19_local10 / f19_local11
	local f19_local15 = CoD.CreateState( -f19_local14 / 2, f19_local12, f19_local14 / 2, f19_local13, CoD.AnchorTypes.Top )
	f19_local15.material = f19_local9
	local self = LUI.UIImage.new( f19_local15 )
	f19_arg0.window:addElement( self )
	local f19_local17, f19_local18, f19_local19, f19_local20 = self:getLocalRect()
	local f19_local21 = RegisterMaterial( LUI.MPDepot.crateData[f19_arg1].popup_img )
	local f19_local22, f19_local23 = GetMaterialDimensions( f19_local21 )
	local f19_local24 = (f19_local20 - f19_local18) * 1.3
	local f19_local25 = f19_local24 * f19_local22 / f19_local23
	local f19_local26 = f19_local0
	local f19_local27 = CoD.CreateState( f19_local0 / 4, f19_local26 - f19_local24, f19_local0 / 4 + f19_local25, f19_local26, CoD.AnchorTypes.BottomLeft )
	f19_local27.material = f19_local21
	f19_arg0.crate = LUI.UIImage.new( f19_local27 )
	self:addElement( f19_arg0.crate )
	local f19_local28 = LUI.MPDepot.LootDropsData[LUI.MPDepot.SuppyDropLootStream[f19_arg1]].icon
	if f19_local28 ~= nil then
		if LUI.MPDepot.crateData[f19_arg1].isPromo == true then
			local f19_local29, f19_local30, f19_local31, f19_local32, f19_local33, self, self = nil
			local f19_local36 = LUI.MPDepot.crateData[f19_arg1].specialimg
			if f19_local28 ~= f19_local36 then
				f19_local29 = RegisterMaterial( f19_local28 )
				f19_local30, f19_local31 = GetMaterialDimensions( f19_local29 )
				f19_local32 = f19_local24 * 0.5
				f19_local33 = f19_local32 * f19_local30 / f19_local31
				self = -f19_local24 * 0.1
				self = CoD.CreateState( -f19_local33, self - f19_local32 / 2, 0, self + f19_local32 / 2, CoD.AnchorTypes.Right )
				self.material = f19_local29
				f19_arg0.crate.lootIcon = LUI.UIImage.new( self )
				f19_arg0.crate.lootIcon:setPriority( 100 )
				f19_arg0.crate:addElement( f19_arg0.crate.lootIcon )
			end
			f19_local29 = RegisterMaterial( f19_local36 )
			f19_local30, f19_local31 = GetMaterialDimensions( f19_local29 )
			f19_local32 = f19_local24 * 0.5
			f19_local33 = f19_local32 * f19_local30 / f19_local31
			self = -f19_local24 * 0.1
			self = CoD.CreateState( 0, self - f19_local32 / 2, f19_local33, self + f19_local32 / 2, CoD.AnchorTypes.Left )
			self.material = f19_local29
			f19_arg0.crate.lootIcon = LUI.UIImage.new( self )
			f19_arg0.crate.lootIcon:setPriority( 100 )
			f19_arg0.crate:addElement( f19_arg0.crate.lootIcon )
		else
			local f19_local29 = RegisterMaterial( f19_local28 )
			local f19_local30, f19_local31 = GetMaterialDimensions( f19_local29 )
			local f19_local32 = f19_local24 * 0.5
			local f19_local33 = f19_local32 * f19_local30 / f19_local31
			local self = -f19_local24 * 0.1
			local self = CoD.CreateState( -f19_local33 / 2, self - f19_local32 / 2, f19_local33 / 2, self + f19_local32 / 2, CoD.AnchorTypes.None )
			self.material = f19_local29
			f19_arg0.crate.lootIcon = LUI.UIImage.new( self )
			f19_arg0.crate.lootIcon:setPriority( 100 )
			f19_arg0.crate:addElement( f19_arg0.crate.lootIcon )
		end
	end
	local f19_local29 = f19_local20 - f19_local18
	local f19_local30 = f19_local19 - f19_local17
	local f19_local31 = f19_local0 * 0.75
	local f19_local32 = CoD.TextSettings.BodyFontSmall.Font
	local f19_local33 = CoD.CreateState( f19_local30 / 2 + f19_local0 * 2, f19_local0, -f19_local0 * 2, f19_local0 + f19_local31 * 1.5, CoD.AnchorTypes.TopLeftRight )
	f19_local33.font = f19_local32
	f19_local33.horizontalAlignment = LUI.HorizontalAlignment.Left
	f19_local33.verticalAlignment = LUI.HorizontalAlignment.Top
	f19_local33.color = LUI.MPDepot.crateData[f19_arg1].textColor
	local self = LUI.UIText.new( f19_local33 )
	self:setText( LUI.MPDepot.crateData[f19_arg1].text )
	self:setupAutoScaleText()
	self:addElement( self )
	f19_local33.left = 0
	f19_local33.right = 0
	f19_local33.top = 5
	f19_local33.bottom = 5 + f19_local31
	f19_local33.topAnchor = false
	f19_local33.bottomAnchor = true
	f19_local33.color = Colors.primary_text_color
	f19_local33.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f19_local33 )
	self:setText( LUI.MPDepot.crateData[f19_arg1].desc_text )
	self:addElement( self )
end

local f0_local9 = function ( f20_arg0 )
	local f20_local0 = math.random( 100, 150 )
	local f20_local1 = f20_local0 * f20_arg0.matHeightWidthRatio
	local f20_local2 = f20_arg0:getParent()
	f20_local2 = f20_local2.crateWidth
	local f20_local3 = f20_arg0:getParent()
	f20_local3 = f20_local3.crateHeight
	local f20_local4 = math.random( -f20_local2 * 0.33, f20_local2 * 0.33 )
	local f20_local5 = math.random( -f20_local3 * 0.1, f20_local3 * 0.1 )
	local f20_local6 = CoD.CreateState( f20_local4 - f20_local0 / 2, f20_local5, f20_local4 + f20_local0 / 2, f20_local5 + f20_local1, CoD.AnchorTypes.Bottom )
	f20_local6.alpha = 0
	f20_arg0:registerAnimationState( "start", f20_local6 )
	f20_local5 = math.random( f20_local3 * 0.1, f20_local3 * 0.2 )
	f20_local6.alpha = 1
	f20_local6.top = f20_local6.top - f20_local5
	f20_local6.bottom = f20_local6.bottom - f20_local5
	local f20_local7 = f20_local5
	f20_arg0:registerAnimationState( "fade_in", f20_local6 )
	f20_local5 = math.random( f20_local1, f20_local1 * 1.1 )
	f20_local6.top = f20_local6.top - f20_local5
	f20_local6.bottom = f20_local6.bottom - f20_local5
	local f20_local8 = f20_local5
	f20_arg0:registerAnimationState( "move", f20_local6 )
	f20_local5 = math.random( f20_local3 * 0.1, f20_local3 * 0.2 )
	f20_local6.alpha = 0
	f20_local6.top = f20_local6.top - f20_local5
	f20_local6.bottom = f20_local6.bottom - f20_local5
	local f20_local9 = f20_local5
	f20_arg0:registerAnimationState( "fade_out", f20_local6 )
	local f20_local10 = math.random( 15, 45 )
	f20_arg0:animateInSequence( {
		{
			"start",
			0
		},
		{
			"fade_in",
			f20_local7 / f20_local10 * 1000
		},
		{
			"move",
			f20_local8 / f20_local10 * 1000
		},
		{
			"fade_out",
			f20_local9 / f20_local10 * 1000
		}
	}, nil, true, true )
	f20_arg0:addElement( LUI.UITimer.new( (f20_local7 + f20_local8 + f20_local9) / f20_local10 * 1000 + math.random( 5, 100 ), "update_sparkle", nil, true ) )
end

local f0_local10 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = 20
	local f21_local1 = 4
	local f21_local2, f21_local3, f21_local4, f21_local5 = f21_arg0.crate:getLocalRect()
	local f21_local6 = f21_local4 - f21_local2
	local f21_local7 = f21_local5 - f21_local3
	f21_arg0.crate.mask = LUI.UIElement.new( CoD.CreateState( -f21_local6 * 0.25, -f21_local7 * 10, f21_local6 * 0.25, -f21_local7 * 0.12, CoD.AnchorTypes.None ) )
	f21_arg0.crate.mask:setUseStencil( true )
	f21_arg0.crate:addElement( f21_arg0.crate.mask )
	f21_arg0.crate.mask.crateWidth = f21_local6
	f21_arg0.crate.mask.crateHeight = f21_local7
	f21_arg0.sparkles = {}
	local f21_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.None )
	f21_local8.alpha = 0
	f21_local8.color = LUI.MPDepot.crateData[f21_arg1].sparkleColor
	for f21_local9 = 1, f21_local0, 1 do
		f21_local8.material = RegisterMaterial( "reward_splash_particles_" .. f21_local9 % f21_local1 + 1 )
		f21_arg0.sparkles[f21_local9] = LUI.UIImage.new( f21_local8 )
		local f21_local12, f21_local13 = GetMaterialDimensions( f21_local8.material )
		f21_arg0.sparkles[f21_local9].matHeightWidthRatio = f21_local13 / f21_local12
		f21_arg0.sparkles[f21_local9]:registerEventHandler( "update_sparkle", f0_local9 )
		f21_arg0.sparkles[f21_local9]:addElement( LUI.UITimer.new( math.random( 10, 25 ) * f21_local9 * 0.1, "update_sparkle", nil, true ) )
		f21_arg0.crate.mask:addElement( f21_arg0.sparkles[f21_local9] )
	end
end

function MPDepotSupplyDropPurchaseButtonAction( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	if f22_arg3.amount <= GetCurrencyBalance( f22_arg3.type, f22_arg1.controller ) then
		LUI.FlowManager.RequestAddMenu( f22_arg0, "MPDepotOpenLootMenu", true, f22_arg1.controller, false, {
			crateType = f22_arg2,
			currencyInfo = f22_arg3,
			supplyDropType = f22_arg4
		} )
		LUI.FlowManager.RequestLeaveMenu( f22_arg0 )
	elseif f22_arg3.type == InventoryCurrencyType.CoDPoints then
		Sns.OpenStoreMenu( f22_arg1.controller, LUI.ComScore.ScreenID.SupplyDrop, LUI.ComScore.StoreSource.MenuButton )
		LUI.FlowManager.RequestLeaveMenu( f22_arg0 )
	end
end

local f0_local11 = function ( f23_arg0, f23_arg1, f23_arg2 )
	if f23_arg2 == InventoryCurrencyType.CoDPoints then
		Sns.OpenStoreMenu( f23_arg1.controller, LUI.ComScore.ScreenID.SupplyDrop, LUI.ComScore.StoreSource.MenuButton )
		LUI.FlowManager.RequestLeaveMenu( f23_arg0 )
	else
		LUI.MPDepotBase.Broke( f23_arg0, f23_arg1 )
	end
end

function MPDepotSupplyDropPurchasePopup( f24_arg0, f24_arg1 )
	local f24_local0 = f0_local5( self, {
		popup_title = "",
		padding_left = LUI.MenuTemplate.ButtonStyle.text_padding_without_content * 3 / 2,
		padding_right = 211,
		padding_top = 240,
		popup_width = 575
	} )
	f24_local0.exclusiveController = f24_arg1.exclusiveController
	f0_local6( f24_local0 )
	for f24_local1 = 1, #LUI.MPDepot.crateData[f24_arg1.crateType].items, 1 do
		local f24_local4 = LUI.MPDepot.crateData[f24_arg1.crateType].items[f24_local1]
		local f24_local5 = LUI.MPDepot.GetSupplyDropPrice( f24_local4 )
		local f24_local6 = nil
		local f24_local7 = false
		if f24_local5.type == InventoryCurrencyType.Credits then
			if f24_local5.amount <= GetCurrencyBalance( f24_local5.type, f24_arg1.exclusiveController ) then
				f24_local6 = Engine.Localize( "@DEPOT_PURCHASE_WITH_CREDITS" )
			else
				f24_local6 = Engine.Localize( "@DEPOT_PURCHASE_WITH_CREDITS" )
				f24_local7 = true
			end
		elseif CoD.IsCPEnabled() then
			if f24_local5.amount <= GetCurrencyBalance( f24_local5.type, f24_arg1.exclusiveController ) then
				f24_local6 = Engine.Localize( "@DEPOT_PURCHASE_WITH_COD_POINTS" )
			else
				f24_local6 = Engine.Localize( "@DEPOT_PURCHASE_MORE_COD_POINTS" )
			end
		end
		if f24_local6 ~= nil then
			local f24_local8 = LUI.MenuBuilder.BuildAddChild( f24_local0.list, {
				type = "UIGenericButton",
				id = "button_currency_" .. f24_local5.type,
				disabledFunc = function ()
					local f25_local0
					if f24_local5.type ~= InventoryCurrencyType.Credits or GetCurrencyBalance( f24_local5.type, f24_arg1.exclusiveController ) >= f24_local5.amount then
						f25_local0 = false
					else
						f25_local0 = true
					end
					return f25_local0
				end,
				properties = {
					button_text = f24_local6,
					text_align_without_content = LUI.Alignment.Center,
					button_action_func = function ( f26_arg0, f26_arg1 )
						MPDepotSupplyDropPurchaseButtonAction( f26_arg0, f26_arg1, f24_arg1.crateType, f24_local5, f24_local4 )
					end,
					allowDisabledAction = true,
					disableSound = "h1_ui_purch_neg"
				}
			} )
			f24_local8:registerEventHandler( "button_action_disable", function ( element, event )
				f0_local11( element, event, f24_local5.type )
			end )
			f24_local8.exclusiveController = f24_arg1.exclusiveController
			f0_local7( f24_local8, f24_arg1.crateType, f24_local5.type, f24_local5.amount )
		end
	end
	f0_local8( f24_local0, f24_arg1.crateType )
	if LUI.MPDepot.crateData[f24_arg1.crateType].sparkleColor then
		f0_local10( f24_local0, f24_arg1.crateType )
	end
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	f24_local0:addElement( self )
	local f24_local3 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	f24_local3:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	f24_local3:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	self:addElement( f24_local3 )
	return f24_local0
end

function AddBundleInfo( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4 )
	local f28_local0 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content / 2
	local f28_local1 = 125
	local f28_local2 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content
	local f28_local3, f28_local4, f28_local5, f28_local6 = f28_arg0.list:getLocalRect()
	local f28_local7, f28_local8, f28_local9, f28_local10 = f28_arg0.currencyInfoPanel:getLocalRect()
	local f28_local11 = RegisterMaterial( "depot_crate_dialog_backing" )
	local f28_local12, f28_local13 = GetMaterialDimensions( f28_local11 )
	local f28_local14 = f28_local10 + f28_local2 / 2
	local f28_local15 = f28_local4 - f28_local2
	local f28_local16 = 575 - f28_local2
	local f28_local17 = f28_local16 * f28_local13 / f28_local12
	local f28_local18 = CoD.CreateState( -f28_local16 / 2, f28_local14, f28_local16 / 2, f28_local15, CoD.AnchorTypes.Top )
	f28_local18.material = f28_local11
	local self = LUI.UIImage.new( f28_local18 )
	f28_arg0.window:addElement( self )
	local f28_local20 = 15
	local f28_local21 = -f28_local20
	local f28_local22 = f28_local0
	if f28_arg4 ~= nil and f28_arg4 ~= "" then
		f28_local20 = 40
		f28_local21 = 0
	end
	self.bundleID = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f28_arg2, LUI.MPDepot.BundlesTable.Cols.ID ) )
	LUI.MPDepot.AddBundleImage( self, f28_arg2, f28_local16, f28_local20, f28_local22, f28_local21 )
	if f28_arg4 ~= nil and f28_arg4 ~= "" then
		local f28_local23 = f28_local2 * 0.75
		local f28_local24 = CoD.TextSettings.BodyFontSmall.Font
		local f28_local25 = CoD.CreateState( f28_local2, f28_local2, -f28_local2 * 2, f28_local2 + f28_local23 * 1.1, CoD.AnchorTypes.TopLeftRight )
		f28_local25.font = f28_local24
		f28_local25.horizontalAlignment = LUI.HorizontalAlignment.Left
		f28_local25.verticalAlignment = LUI.HorizontalAlignment.Top
		f28_local25.lineSpacingRatio = 0.2
		local self = LUI.UIText.new( f28_local25 )
		self:setText( f28_arg4 )
		self:addElement( self )
	end
end

function MPDepotBundlePurchasePopup( f29_arg0, f29_arg1 )
	local f29_local0 = f0_local5( self, {
		popup_title = "",
		padding_left = LUI.MenuTemplate.ButtonStyle.text_padding_without_content * 3 / 2,
		padding_right = 211,
		padding_top = 240,
		popup_width = 575
	} )
	f29_local0.exclusiveController = f29_arg1.exclusiveController
	f0_local6( f29_local0 )
	local f29_local1 = f29_arg1.row
	local f29_local2 = Engine.Localize( "@" .. Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.LocalizedString ) )
	local f29_local3 = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseCurrency ) )
	local f29_local4 = tonumber( Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.PurchaseAmount ) )
	local f29_local5 = {
		{
			ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item0ID ),
			amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item0Amount )
		},
		{
			ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item1ID ),
			amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item1Amount )
		},
		{
			ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item2ID ),
			amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item2Amount )
		},
		{
			ID = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item3ID ),
			amount = Engine.TableLookupByRow( LUI.MPDepot.BundlesTable.File, f29_local1, LUI.MPDepot.BundlesTable.Cols.Item3Amount )
		}
	}
	local f29_local6 = {
		type = f29_local3,
		amount = f29_local4
	}
	local f29_local7 = nil
	local f29_local8 = false
	if f29_local6.type == InventoryCurrencyType.Credits then
		if f29_local6.amount <= GetCurrencyBalance( f29_local6.type, f29_arg1.exclusiveController ) then
			f29_local7 = Engine.Localize( "@DEPOT_PURCHASE_WITH_CREDITS" )
		else
			f29_local7 = Engine.Localize( "@DEPOT_PURCHASE_WITH_CREDITS" )
			f29_local8 = true
		end
	elseif CoD.IsCPEnabled() then
		if f29_local6.amount <= GetCurrencyBalance( f29_local6.type, f29_arg1.exclusiveController ) then
			f29_local7 = Engine.Localize( "@DEPOT_PURCHASE_WITH_COD_POINTS" )
		else
			f29_local7 = Engine.Localize( "@DEPOT_PURCHASE_MORE_COD_POINTS" )
		end
	end
	if f29_local7 ~= nil then
		local f29_local9 = LUI.MenuBuilder.BuildAddChild( f29_local0.list, {
			type = "UIGenericButton",
			id = "button_currency_" .. f29_local6.type,
			disabledFunc = function ()
				local f30_local0
				if f29_local6.type ~= InventoryCurrencyType.Credits or GetCurrencyBalance( f29_local6.type, f29_arg1.exclusiveController ) >= f29_local6.amount then
					f30_local0 = false
				else
					f30_local0 = true
				end
				return f30_local0
			end,
			properties = {
				button_text = f29_local7,
				text_align_without_content = LUI.Alignment.Center,
				button_action_func = function ( f31_arg0, f31_arg1 )
					Engine.Inventory_PurchaseItem( f31_arg1.controller, f29_arg1.purchaseID, 1 )
					LUI.FlowManager.RequestLeaveMenu( f31_arg0 )
					LUI.FlowManager.RequestAddMenu( nil, "popup_purchasing_bundle", true, f31_arg1.controller )
				end,
				allowDisabledAction = true,
				disableSound = "h1_ui_purch_neg"
			}
		} )
		f29_local9:registerEventHandler( "button_action_disable", function ( element, event )
			f0_local11( element, event, f29_local6.type )
		end )
		f29_local9.exclusiveController = f29_arg1.exclusiveController
		f0_local7( f29_local9, nil, f29_local6.type, f29_local6.amount )
	end
	AddBundleInfo( f29_local0, f29_local5, f29_local1, f29_local6, f29_arg1.desc_text )
	if f29_local0.crate then
		f0_local10( f29_local0, LUI.MPDepot.SupplyCrateTypes.AW_Rare )
	end
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	f29_local0:addElement( self )
	local f29_local11 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	f29_local11:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	f29_local11:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	self:addElement( f29_local11 )
	return f29_local0
end

LUI.MenuBuilder.registerPopupType( "MPDepotSupplyDropPurchasePopup", MPDepotSupplyDropPurchasePopup )
LUI.MenuBuilder.registerPopupType( "MPDepotBundlePurchasePopup", MPDepotBundlePurchasePopup )
LockTable( _M )
