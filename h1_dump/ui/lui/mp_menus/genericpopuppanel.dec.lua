local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.GenericPopupPanel = {}
f0_local0 = 550
f0_local1 = 30
f0_local2 = 252
local f0_local3 = 150
LUI.GenericPopupPanel.defWidth = f0_local0
LUI.GenericPopupPanel.defHeight = f0_local2
local f0_local4 = 2
local f0_local5 = H1MenuDims.spacing - f0_local4
local f0_local6 = 0
local f0_local7 = 5
function OnBackButton( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

function OnShiftList( f2_arg0, f2_arg1 )
	UpdateShiftListPosition( f2_arg0, {
		indexOffset = f2_arg1.shiftAmount
	} )
	if not f2_arg1.ignoreSound then
		Engine.PlaySound( CoD.SFX.MenuScroll )
	end
	if f2_arg1.arrowToAnimate then
		f2_arg1.arrowToAnimate:animateInSequence( {
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
	if f2_arg0.titleKeys then
		f2_arg0.title:setText( Engine.ToUpperCase( Engine.Localize( f2_arg0.titleKeys[f2_arg0.currIndex] ) ) )
	end
end

function OnPanelButtonInput( f3_arg0, f3_arg1 )
	if f3_arg0.numPanels > 1 then
		if f3_arg1.down == true then
			if f3_arg1.button == "left" then
				OnShiftList( f3_arg0, {
					shiftAmount = -1,
					arrowToAnimate = f3_arg0.panelContainer.arrowLeft
				} )
			elseif f3_arg1.button == "right" then
				OnShiftList( f3_arg0, {
					shiftAmount = 1,
					arrowToAnimate = f3_arg0.panelContainer.arrowRight
				} )
			end
		elseif f3_arg0.panelContainer and f3_arg0.panelContainer.arrowLeft and f3_arg0.panelContainer.arrowRight then
			f3_arg0.panelContainer.arrowLeft:animateToState( "default", 100 )
			f3_arg0.panelContainer.arrowRight:animateToState( "default", 100 )
		end
	end
end

function AnimateShiftListLeft( f4_arg0, f4_arg1 )
	if not f4_arg0 or not f4_arg0.panelContainer or not f4_arg0.panelContainer.hList then
		return 
	else
		f4_arg0.panelContainer.hList:registerAnimationState( "default", {
			left = -f4_arg0.contentWidth * f4_arg1.strideAmount,
			leftAnchor = true,
			width = f4_arg0.contentWidth * f4_arg0.numPanels,
			height = f4_arg0.panelHeight,
			spacing = 0
		} )
		f4_arg0.panelContainer.hList:animateToState( "default", f4_arg1.instantAnimate and 0 or f0_local3 )
	end
end

function UpdateShiftListPosition( f5_arg0, f5_arg1 )
	if f5_arg0.numPanels > 1 then
		local f5_local0 = f5_arg0.currIndex + f5_arg1.indexOffset
		if f5_local0 < 1 then
			f5_local0 = f5_arg0.numPanels
		elseif f5_arg0.numPanels < f5_local0 then
			f5_local0 = 1
		end
		AnimateShiftListLeft( f5_arg0, {
			strideAmount = f5_local0 - 1
		} )
		f5_arg0.pageIndicatorButtons[f5_arg0.currIndex].image:animateToState( "unfocused", f0_local3 )
		f5_arg0.pageIndicatorButtons[f5_local0].image:animateToState( "focused", f0_local3 )
		f5_arg0.currIndex = f5_local0
	end
end

function AddFooterButtons( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	menu:addElement( self )
	local f6_local1 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	local f6_local2 = nil
	local f6_local3 = f6_local1:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	if controller.hideBackButton then
		f6_local3:setAlpha( 0 )
		f6_local3:setHandleMouseButton( false )
	end
	if controller.replaceWithSelect then
		f6_local1:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	else
		f6_local1:processEvent( LUI.ButtonHelperText.CommonEvents.addContinueButton )
	end
	if Engine.IsPC() then
		local self = f6_local1:getFirstDescendentById( "button_secondary_id" )
		self:registerEventHandler( "leftmouseup", OnBackButton )
		if not controller.replaceWithSelect then
			local f6_local5 = f6_local1:getFirstDescendentById( "button_action_id" )
			f6_local5:registerEventHandler( "leftmouseup", OnBackButton )
		end
	end
	local self = LUI.UIBindButton.new()
	if not controller.hideBackButton then
		self:registerEventHandler( "button_secondary", OnBackButton )
	end
	if not controller.replaceWithSelect then
		self.handlePrimary = true
		self:registerEventHandler( "button_action", OnBackButton )
	end
	menu:addElement( self )
end

function AddHeader( f7_arg0, f7_arg1 )
	local f7_local0 = CoD.CreateState( nil, f0_local4 + f0_local5, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f7_local0.height = f7_arg0.headerHeight
	local self = LUI.UIElement.new( f7_local0 )
	f7_arg0:addElement( self )
	local f7_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f7_local2.alpha = 0.6
	f7_local2.material = RegisterMaterial( "h1_popup_title_bg" )
	self:addElement( LUI.UIImage.new( f7_local2 ) )
	local f7_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeftRight )
	f7_local3.height = 1
	f7_local3.color = Colors.h1.dark_grey
	f7_local3.material = RegisterMaterial( "white" )
	self:addElement( LUI.UIImage.new( f7_local3 ) )
	local f7_local4 = GenericButtonSettings.Styles.FlatButton.text_padding_with_content
	local f7_local5 = 3
	local f7_local6 = CoD.TextSettings.Font24
	local f7_local7 = Engine.ToUpperCase( Engine.Localize( f7_arg0.titleKeys and f7_arg0.titleKeys[f7_arg0.currIndex] or "" ) )
	local f7_local8, f7_local9, f7_local10, f7_local11 = GetTextDimensions( f7_local7, f7_local6.Font, f7_local6.Height )
	local f7_local12 = CoD.CreateState( f7_local4, -f7_local6.Height / 2 + f7_local5, nil, nil, CoD.AnchorTypes.Left )
	f7_local12.font = f7_local6.Font
	f7_local12.color = Colors.h1.light_grey
	f7_local12.width = f7_local10 - f7_local8
	f7_local12.height = f7_local6.Height
	local self = LUI.UIText.new( f7_local12 )
	f7_arg0.title = self
	self:setText( f7_local7 )
	self:addElement( self )
	if f7_arg0.numPanels > 1 then
		local f7_local14 = -f7_local4
		for f7_local15 = 1, f7_arg0.numPanels, 1 do
			local f7_local18 = 17
			local f7_local19 = RegisterMaterial( "h1_ui_featured_pip_unfocused" )
			local f7_local20 = Engine.GetMaterialAspectRatio( f7_local19 )
			local f7_local21 = CoD.CreateState( nil, nil, f7_local14, nil, CoD.AnchorTypes.Right )
			f7_local21.width = f7_local18 * f7_local20
			f7_local21.height = f7_local18
			local self = LUI.UIButton.new( f7_local21 )
			self.id = "pageIndicatorButton_" .. f7_local15
			self:addElement( self )
			if Engine.IsPC() then
				self.index = f7_arg0.numPanels + 1 - f7_local15
				self:setHandleMouseButton( true )
				self.m_requireFocusType = FocusType.MouseOver
				self:registerEventHandler( "leftmousedown", function ( element, event )
					OnShiftList( f7_arg0, {
						shiftAmount = element.index - f7_arg0.currIndex,
						ignoreSound = true
					} )
				end )
			end
			local f7_local23 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
			f7_local23.material = f7_local19
			local self = LUI.UIImage.new( f7_local23 )
			self.id = "pageIndicatorButtonImage_" .. f7_local15
			self:registerAnimationState( "unfocused", {
				material = RegisterMaterial( "h1_ui_featured_pip_unfocused" )
			} )
			self:registerAnimationState( "focused", {
				material = RegisterMaterial( "h1_ui_featured_pip_focused" )
			} )
			self.image = self
			self:addElement( self )
			table.insert( f7_arg0.pageIndicatorButtons, 1, self )
			f7_local14 = f7_local14 - f7_local18 * 1.25
		end
		f7_arg0.pageIndicatorButtons[f7_arg0.currIndex].image:animateToState( "focused" )
	end
end

function AddPanels( menu, controller )
	local self = LUI.UIStencilText.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	menu:addElement( self )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		leftAnchor = true,
		width = menu.width * menu.parent.numPanels,
		height = menu.height,
		spacing = 0
	} )
	self.list = {}
	self.currIndex = 1
	self.currMinRangeIndex = 1
	self.currMaxRangeIndex = f0_local7
	for f9_local2 = 1, menu.parent.numPanels, 1 do
		local f9_local5 = controller.panels[f9_local2]
		table.insert( self.list, f9_local5 )
		self:addElement( f9_local5 )
	end
	menu.hList = self
	self:addElement( self )
end

LUI.GenericPopupPanel.AddArrowIcon = function ( f10_arg0, f10_arg1, f10_arg2 )
	f10_arg1.alpha = 0.5
	f10_arg1.scale = 0
	local self = LUI.UIImage.new( f10_arg1 )
	self:registerAnimationState( "highlight", {
		alpha = 1,
		scale = 0
	} )
	self:registerAnimationState( "pulse", {
		scale = -0.1
	} )
	if Engine.IsPC() then
		self:setHandleMouseButton( true )
		self:setHandleMouseMove( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "mouseenter", function ( element, event )
			element:animateToState( "highlight" )
			Engine.PlaySound( CoD.SFX.MenuScroll )
		end )
		self:registerEventHandler( "mouseleave", function ( element, event )
			element:animateToState( "default" )
		end )
		self:registerEventHandler( "leftmousedown", function ( element, event )
			f10_arg2( f10_arg0, {
				shiftAmount = f10_arg1.isRight and 1 or -1,
				arrowToAnimate = element
			} )
		end )
	end
	return self
end

function AddRootPanel( f14_arg0, f14_arg1 )
	local f14_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Bottom )
	f14_local0.width = f14_arg0.contentWidth
	f14_local0.height = f14_arg0.panelHeight
	local self = LUI.UIElement.new( f14_local0 )
	self.width = f14_local0.width
	self.height = f14_local0.height
	self.parent = f14_arg0
	f14_arg0.panelContainer = self
	f14_arg0:addElement( self )
	local f14_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f14_local2.alpha = 1
	f14_local2.material = RegisterMaterial( "h1_popup_bg" )
	self:addElement( LUI.UIImage.new( f14_local2 ) )
	if f14_arg1.panels then
		AddPanels( self, f14_arg1 )
	end
	if f14_arg0.numPanels > 1 then
		local f14_local3 = RegisterMaterial( "h1_large_leftright_arrow" )
		local f14_local4 = Engine.GetMaterialAspectRatio( f14_local3 )
		local f14_local5 = 30
		local f14_local6 = f14_local5 * f14_local4
		local f14_local7 = 10
		local f14_local8 = CoD.CreateState( -f14_local6 - f14_local7, nil, nil, nil, CoD.AnchorTypes.Left )
		f14_local8.width = f14_local6
		f14_local8.height = f14_local5
		f14_local8.zRot = 180
		f14_local8.material = f14_local3
		f14_local8.isRight = false
		local f14_local9 = LUI.GenericPopupPanel.AddArrowIcon( f14_arg0, f14_local8, OnShiftList )
		self.arrowLeft = f14_local9
		self:addElement( f14_local9 )
		local f14_local10 = CoD.CreateState( nil, nil, f14_local6 + f14_local7, nil, CoD.AnchorTypes.Right )
		f14_local10.width = f14_local6
		f14_local10.height = f14_local5
		f14_local10.material = f14_local3
		f14_local10.isRight = true
		local f14_local11 = LUI.GenericPopupPanel.AddArrowIcon( f14_arg0, f14_local10, OnShiftList )
		self.arrowRight = f14_local11
		self:addElement( f14_local11 )
	end
end

function AddButton( menu, controller )
	local self = LUI.UIElement.new( controller.defState )
	self:setPriority( 1000 )
	menu:addElement( self )
	local f15_local1 = LUI.MenuBuilder.BuildRegisteredType( "UIGenericButton", {
		button_text = controller.text or "",
		text_align_without_content = LUI.Alignment.Center,
		button_action_func = controller.actionFunc
	} )
	f15_local1:makeFocusable()
	f15_local1:registerEventHandler( "button_action", controller.actionFunc )
	self:addElement( f15_local1 )
end

LUI.GenericPopupPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" ) )
	AddFooterButtons( self, controller )
	local f16_local1 = controller.headerHeight or f0_local1
	local f16_local2 = controller.panelHeight or f0_local2
	local f16_local3 = controller.contentWidth or f0_local0
	local f16_local4 = f0_local4 + f0_local5 + f16_local1 + f0_local6 + f16_local2
	local f16_local5 = CoD.CreateState( nil, -f16_local4 / 2 - f0_local4 + f0_local5, nil, nil, CoD.AnchorTypes.None )
	f16_local5.width = f16_local3
	f16_local5.height = f16_local4
	local self = LUI.UIElement.new( f16_local5 )
	self.contentWidth = f16_local3
	self.headerHeight = f16_local1
	self.panelHeight = f16_local2
	self.panels = controller.panels
	self.titleKeys = controller.titleKeys
	self.currIndex = controller.startingIndex or 1
	self:registerEventHandler( "gamepad_button", OnPanelButtonInput )
	local self
	if not controller.panels or #controller.panels == 0 then
		self = 1
		if not self then
		
		else
			self.numPanels = self
			self.pageIndicatorButtons = {}
			self:addElement( self )
			self = LUI.UIElement.new( f16_local5 )
			self:addElement( self )
			local f16_local8 = 1
			local self
			if controller.btnProps and #controller.btnProps > 0 then
				self = #controller.btnProps
				if not self then
				
				else
					for f16_local10 = 1, self, f16_local10 do
						AddButton( self, controller.btnProps[f16_local8] )
					end
					self:addElement( LUI.Divider.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight ) ) )
					AddHeader( self, controller )
					AddRootPanel( self, controller )
					f16_local8 = CoD.CreateState( nil, f0_local4 + f0_local5, nil, nil, CoD.AnchorTypes.TopLeftRight )
					f16_local8.height = f16_local1 + f0_local6 + f16_local2
					self = LUI.UIElement.new( f16_local8 )
					self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
					self:addElement( self )
					AnimateShiftListLeft( self, {
						strideAmount = self.currIndex - 1,
						instantAnimate = true
					} )
					return self
				end
			end
			self = 0
		end
	end
	self = #controller.panels
end

LUI.MenuBuilder.registerPopupType( "GenericPopupPanel", LUI.GenericPopupPanel.new )
LockTable( _M )
