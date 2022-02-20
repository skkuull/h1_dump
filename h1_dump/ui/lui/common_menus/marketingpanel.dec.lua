local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MarketingPanel = {}
f0_local0 = 2
f0_local1 = H1MenuDims.spacing - f0_local0
f0_local2 = GenericButtonSettings.Styles.FlatButton.height
local f0_local3 = 3
local f0_local4 = 135
local f0_local5 = GenericMenuDims.menu_width_standard
local f0_local6 = 150
local f0_local7 = 1000
local f0_local8 = 365
LUI.MarketingPanel.buttonWidth = f0_local5
LUI.MarketingPanel.buttonHeight = f0_local4
LUI.MarketingPanel.buttonTop = f0_local8 + f0_local0 + f0_local1 + f0_local2 + f0_local3
function OnPanelListAction( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg1.controller ~= f1_arg2 then
		Engine.PlaySound( CoD.SFX.DenySelect )
		return 
	end
	local f1_local0 = #f1_arg0.panelData and f1_arg0.panelData or f1_arg0.panelData[f1_arg0.currIndex]
	LUI.ComScore.LogMarketingClick( f1_arg2, f1_local0.messageID, LUI.MOTD.GetComScoreScreenForChannel( f1_arg0.channel ) )
	if f1_local0.action == LUI.MOTD.ActionType.STORE then
		local f1_local1 = f1_local0.item_category
		local f1_local2 = f1_local0.item_name
		Sns.OpenStoreMenu( f1_arg2, f1_arg0.comScoreScreen, LUI.ComScore.StoreSource.Marketing )
	elseif f1_local0.action == LUI.MOTD.ActionType.DEPOT then
		Sns.OpenDepotMenu( f1_arg2 )
	elseif f1_local0.action == LUI.MOTD.ActionType.REGISTRATION then
		Sns.OpenCoDAnywherePopup( f1_arg2 )
	elseif f1_local0.action == LUI.MOTD.ActionType.POPUP then
		LUI.FlowManager.RequestPopupMenu( self, "MarketingPopup", true, f1_arg2, false, f1_local0 )
	end
end

function OnPanelSwitchFocus( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg2 == "unfocused" then
		f2_arg0.isFocused = false
	elseif f2_arg2 == "focused" then
		f2_arg0.isFocused = true
	end
	f2_arg0.panel.highlight:animateToState( f2_arg2, f0_local6 / 2 )
	if f2_arg0.numButtons > 1 then
		f2_arg0.panel.arrowLeft:animateToState( f2_arg2, f0_local6 / 2 )
		f2_arg0.panel.arrowRight:animateToState( f2_arg2, f0_local6 / 2 )
	end
end

function OnMousePanelUnfocus( f3_arg0, f3_arg1 )
	OnPanelUnfocus( f3_arg0.parent, f3_arg1 )
end

function OnMousePanelFocus( f4_arg0, f4_arg1 )
	OnPanelFocus( f4_arg0.parent, f4_arg1 )
end

function OnPanelUnfocus( f5_arg0, f5_arg1 )
	LUI.UITimer.Reset( f5_arg0.autoScrollTimer )
	OnPanelSwitchFocus( f5_arg0, f5_arg1, "unfocused" )
end

function OnPanelFocus( f6_arg0, f6_arg1 )
	LUI.UITimer.Stop( f6_arg0.autoScrollTimer )
	OnPanelSwitchFocus( f6_arg0, f6_arg1, "focused" )
end

function OnShiftList( f7_arg0, f7_arg1 )
	UpdateShiftListPosition( f7_arg0, {
		indexOffset = f7_arg1.shiftAmount
	} )
	if not f7_arg1.ignoreSound then
		Engine.PlaySound( CoD.SFX.MenuScroll )
	end
	if f7_arg1.arrowToAnimate then
		f7_arg1.arrowToAnimate:animateInSequence( {
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
	end
end

function OnPanelButtonInput( f8_arg0, f8_arg1 )
	if f8_arg0.isFocused and f8_arg1.down == true then
		if f8_arg1.button == "left" then
			OnShiftList( f8_arg0, {
				shiftAmount = -1,
				arrowToAnimate = f8_arg0.panelContainer.arrowLeft
			} )
		elseif f8_arg1.button == "right" then
			OnShiftList( f8_arg0, {
				shiftAmount = 1,
				arrowToAnimate = f8_arg0.panelContainer.arrowRight
			} )
		elseif f8_arg1.button == "up" or f8_arg1.button == "down" and f8_arg1.repeats <= 1 then
			OnPanelUnfocus( f8_arg0, f8_arg1 )
			return LUI.UIBindButton.GamepadButton( f8_arg0, f8_arg1 )
		elseif f8_arg1.button == "primary" then
			OnPanelListAction( f8_arg0, f8_arg1, f8_arg1.controller )
			OnPanelSwitchFocus( f8_arg0, f8_arg1, "unfocused" )
			Engine.PlaySound( CoD.SFX.MenuAccept )
		end
	end
end

function OnAutoScrollPanel( f9_arg0, f9_arg1 )
	UpdateShiftListPosition( f9_arg0, {
		indexOffset = 1
	} )
end

function AnimateShiftListLeft( f10_arg0, f10_arg1 )
	f10_arg0.panel.hList:registerAnimationState( "default", {
		left = -f0_local5 * f10_arg1.strideAmount,
		leftAnchor = true,
		width = f0_local5 * f10_arg0.numButtons,
		height = f0_local4,
		spacing = 0
	} )
	f10_arg0.panel.hList:animateToState( "default", f10_arg1.instantAnimate and 0 or f0_local6 )
end

function UpdateShiftListPosition( f11_arg0, f11_arg1 )
	if f11_arg0.numButtons > 1 then
		local f11_local0 = f11_arg0.currIndex + f11_arg1.indexOffset
		if f11_local0 < 1 then
			f11_local0 = f11_arg0.numButtons
		elseif f11_arg0.numButtons < f11_local0 then
			f11_local0 = 1
		end
		AnimateShiftListLeft( f11_arg0, {
			strideAmount = f11_local0 - 1
		} )
		f11_arg0.fakeButtons[f11_arg0.currIndex]:animateToState( "unfocused", f0_local6 )
		f11_arg0.fakeButtons[f11_local0]:animateToState( "focused", f0_local6 )
		f11_arg0.currIndex = f11_local0
	end
end

function BuildPanelButton( f12_arg0 )
	local f12_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f12_local0.width = f0_local5
	f12_local0.height = f0_local4
	local self = LUI.UIElement.new( f12_local0 )
	local f12_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f12_local2.material = RegisterMaterial( f12_arg0.imageName or "white" )
	self:addElement( LUI.UIImage.new( f12_local2 ) )
	local f12_local3 = CoD.TextSettings.Font21
	local f12_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeftRight )
	f12_local4.height = f12_local3.Height * 2
	f12_local4.material = RegisterMaterial( "black" )
	f12_local4.alpha = 0.75
	local self = LUI.UIImage.new( f12_local4 )
	self:addElement( self )
	local f12_local6 = 2
	local f12_local7 = f12_arg0.localizedText and f12_arg0.localizedText or "Call to Action goes here."
	local f12_local8, f12_local9, f12_local10, f12_local11 = GetTextDimensions( f12_local7, f12_local3.Font, f12_local3.Height )
	local f12_local12 = CoD.CreateState( featuredLeftGap, -f12_local3.Height / 2 + f12_local6, nil, nil, CoD.AnchorTypes.None )
	f12_local12.font = f12_local3.Font
	f12_local12.color = Colors.white
	f12_local12.width = f12_local10 - f12_local8
	f12_local12.height = f12_local3.Height
	local self = LUI.UIText.new( f12_local12 )
	self:setText( f12_local7 )
	self:addElement( self )
	return self
end

function AddPanelButtonList( f13_arg0, f13_arg1 )
	local f13_local0 = #f13_arg1.data and 1 or #f13_arg1.data
	local self = LUI.UIStencilText.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	f13_arg0:addElement( self )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		leftAnchor = true,
		width = f0_local5 * f13_local0,
		height = f0_local4,
		spacing = 0
	} )
	self.list = {}
	self.currIndex = 1
	self.currMinRangeIndex = 1
	self.currMaxRangeIndex = HLIST_NUM_DISPLAY_BUTTONS
	for f13_local3 = 1, f13_local0, 1 do
		local f13_local6 = #f13_arg1.data and f13_arg1.data or f13_arg1.data[f13_local3]
		local f13_local7 = BuildPanelButton( {
			localizedText = f13_local6.action_title,
			imageName = f13_local6.image
		} )
		table.insert( self.list, f13_local7 )
		self:addElement( f13_local7 )
	end
	f13_arg0.hList = self
	self:addElement( self )
end

function AddPanel( f14_arg0 )
	local f14_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Bottom )
	f14_local0.width = f0_local5
	f14_local0.height = f0_local4
	local self = LUI.UIButton.new( f14_local0 )
	f14_arg0.panelContainer = self
	f14_arg0:addElement( self )
	if Engine.IsPC() then
		self:registerEventHandler( "leftmouseup", function ( element, event )
			OnPanelListAction( f14_arg0, event, event.controller )
			Engine.PlaySound( CoD.SFX.MenuAccept )
		end )
	end
	AddPanelButtonList( self, {
		data = f14_arg0.panelData
	} )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f14_local2 = 0
	local f14_local3 = CoD.CreateState( -f14_local2, -f14_local2, f14_local2, f14_local2, CoD.AnchorTypes.All )
	f14_local3.alpha = 0
	f14_local3.material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	local self = LUI.UIImage.new( f14_local3 )
	self:setup9SliceImage()
	self:registerAnimationState( "focused", {
		alpha = 1
	} )
	self:registerAnimationState( "unfocused", {
		alpha = 0
	} )
	self.highlight = self
	self:addElement( self )
	local f14_local5 = RegisterMaterial( "h1_prestige_leftright_arrow" )
	local f14_local6 = Engine.GetMaterialAspectRatio( f14_local5 )
	local f14_local7 = 20
	local f14_local8 = f14_local7 * f14_local6
	local f14_local9 = 10
	if f14_arg0.numButtons > 1 then
		local f14_local10 = CoD.CreateState( -f14_local8 - f14_local9, nil, nil, nil, CoD.AnchorTypes.Left )
		f14_local10.width = f14_local8
		f14_local10.height = f14_local7
		f14_local10.alpha = 0
		f14_local10.material = f14_local5
		f14_local10.isRight = false
		local f14_local11 = LUI.GenericPopupPanel.AddArrowIcon( f14_arg0, f14_local10, OnShiftList )
		f14_local11:registerAnimationState( "focused", {
			alpha = 1
		} )
		f14_local11:registerAnimationState( "unfocused", {
			alpha = 0
		} )
		self.arrowLeft = f14_local11
		self:addElement( f14_local11 )
		local f14_local12 = CoD.CreateState( nil, nil, f14_local8 + f14_local9, nil, CoD.AnchorTypes.Right )
		f14_local12.width = f14_local8
		f14_local12.height = f14_local7
		f14_local12.alpha = 0
		f14_local12.zRot = 180
		f14_local12.material = f14_local5
		f14_local12.isRight = true
		local f14_local13 = LUI.GenericPopupPanel.AddArrowIcon( f14_arg0, f14_local12, OnShiftList )
		f14_local13:registerAnimationState( "focused", {
			alpha = 1
		} )
		f14_local13:registerAnimationState( "unfocused", {
			alpha = 0
		} )
		self.arrowRight = f14_local13
		self:addElement( f14_local13 )
	end
	f14_arg0.panel = self
end

function AddFeaturedBar( f16_arg0 )
	local f16_local0 = CoD.CreateState( nil, f0_local0 + f0_local1, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f16_local0.height = f0_local2
	local self = LUI.UIElement.new( f16_local0 )
	f16_arg0:addElement( self )
	local f16_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f16_local2.color = Colors.grey_14
	f16_local2.material = RegisterMaterial( "white" )
	self:addElement( LUI.UIImage.new( f16_local2 ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f16_local3 = GenericButtonSettings.Styles.FlatButton.text_padding_with_content
	local f16_local4 = 2
	local f16_local5 = CoD.TextSettings.Font19
	local f16_local6 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_FEATURED" ) )
	local f16_local7, f16_local8, f16_local9, f16_local10 = GetTextDimensions( f16_local6, f16_local5.Font, f16_local5.Height )
	local f16_local11 = CoD.CreateState( f16_local3, -f16_local5.Height / 2 + f16_local4, nil, nil, CoD.AnchorTypes.Left )
	f16_local11.font = f16_local5.Font
	f16_local11.color = Colors.h1.light_grey
	f16_local11.width = f16_local9 - f16_local7
	f16_local11.height = f16_local5.Height
	local self = LUI.UIText.new( f16_local11 )
	self:setText( f16_local6 )
	self:addElement( self )
	if f16_arg0.numButtons > 1 then
		local f16_local13 = -15
		for f16_local14 = 1, f16_arg0.numButtons, 1 do
			local f16_local17 = 14
			local f16_local18 = RegisterMaterial( "h1_ui_featured_pip_unfocused" )
			local f16_local19 = Engine.GetMaterialAspectRatio( f16_local18 )
			local f16_local20 = CoD.CreateState( nil, nil, f16_local13, nil, CoD.AnchorTypes.Right )
			f16_local20.width = f16_local17 * f16_local19
			f16_local20.height = f16_local17
			local self = LUI.UIButton.new( f16_local20 )
			self.id = "pageIndicatorButton_" .. f16_local14
			self:addElement( self )
			if Engine.IsPC() then
				self.index = f16_arg0.numButtons + 1 - f16_local14
				self:setHandleMouseButton( true )
				self.m_requireFocusType = FocusType.MouseOver
				self:registerEventHandler( "leftmousedown", function ( element, event )
					OnShiftList( f16_arg0, {
						shiftAmount = element.index - f16_arg0.currIndex,
						ignoreSound = true
					} )
				end )
			end
			local f16_local22 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
			f16_local22.material = f16_local18
			local self = LUI.UIImage.new( f16_local22 )
			self.id = "pageIndicatorButtonImage_" .. f16_local14
			self:registerAnimationState( "unfocused", {
				material = RegisterMaterial( "h1_ui_featured_pip_unfocused" )
			} )
			self:registerAnimationState( "focused", {
				material = RegisterMaterial( "h1_ui_featured_pip_focused" )
			} )
			self.image = self
			self:addElement( self )
			table.insert( f16_arg0.fakeButtons, 1, self )
			f16_local13 = f16_local13 - f16_local17
		end
		f16_arg0.fakeButtons[1]:animateToState( "focused" )
	end
end

LUI.MarketingPanel.ClearViewedMessages = function ( f18_arg0 )
	for f18_local0 = 1, #f18_arg0, 1 do
		local f18_local3 = f18_arg0[f18_local0]
		local f18_local4 = LUI.MOTD.ViewedChannels[f18_local3]
		if f18_local4 ~= nil then
			for f18_local8, f18_local9 in pairs( f18_local4 ) do
				Engine.MarketingClearLocation( f18_local8, f18_local3 )
			end
			LUI.MOTD.ViewedChannels[f18_local3] = nil
		end
	end
end

LUI.MarketingPanel.new = function ( f19_arg0, f19_arg1 )
	local f19_local0 = f19_arg1.exclusiveControllerIndex
	if not f19_local0 then
		f19_local0 = Engine.GetFirstActiveController()
	end
	local f19_local1 = {}
	LUI.MOTD.AddMarketingData( f19_local0, f19_arg1.channel, f19_local1 )
	if not f19_local1 or #f19_local1 <= 0 then
		return LUI.UIElement.new()
	end
	f19_local1.exclusiveControllerIndex = f19_local0
	local f19_local2 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.BottomLeft )
	f19_local2.width = f0_local5
	f19_local2.height = f0_local0 + f0_local1 + f0_local2 + f0_local3 + f0_local4
	local f19_local3 = Engine.IsPC() and LUI.UIElement.new( f19_local2 ) or LUI.UIButton.new( f19_local2 )
	f19_local3.panelData = f19_local1
	f19_local3.height = f19_local2.height
	f19_local3.channel = f19_arg1.channel
	f19_local3.comScoreScreen = f19_arg1.comScoreScreen
	f19_local3.fakeButtons = {}
	f19_local3.currIndex = 1
	f19_local3.numButtons = #f19_local1 and 1 or #f19_local1
	f19_local3.isFocused = false
	f19_local3:registerEventHandler( "gamepad_button", OnPanelButtonInput )
	f19_local3:registerEventHandler( "autoscroll", OnAutoScrollPanel )
	f19_local3:registerEventHandler( "button_over", OnPanelFocus )
	if Engine.IsPC() then
		local self = 24
		local self = LUI.UIElement.new( CoD.CreateState( -self, nil, self, nil, CoD.AnchorTypes.All ) )
		self:setHandleMouse( true )
		self.parent = f19_local3
		f19_local3:addElement( self )
		self:registerEventHandler( "mouseenter", OnMousePanelFocus )
		self:registerEventHandler( "mouseleave", OnMousePanelUnfocus )
	end
	f19_local3:addElement( LUI.Divider.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight ) ) )
	AddFeaturedBar( f19_local3 )
	AddPanel( f19_local3 )
	local self = LUI.UITimer.new( 3 * f0_local7, "autoscroll" )
	f19_local3.autoScrollTimer = self
	f19_local3:addElement( self )
	return f19_local3
end

LUI.MenuBuilder.registerType( "marketing_panel", LUI.MarketingPanel.new )
LockTable( _M )
