LUI.UIScrollIndicator = InheritFrom( LUI.UIElement )
LUI.UIScrollIndicator.UpdateEvent = "scroll_indicator_label_update"
LUI.UIScrollIndicator.HideEvent = "scroll_indicator_label_hide"
LUI.UIScrollIndicator.DefaultWidth = 100
LUI.UIScrollIndicator.DefaultHeight = 32
LUI.UIScrollIndicator.DefaultFont = CoD.TextSettings.TitleFontSmallBold
LUI.UIScrollIndicator.GetMaxTextWidth = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f1_arg0, f1_arg0 ), f1_arg1.Font, f1_arg1.Height )
	return f1_local2 - f1_local0
end

local f0_local0 = function ( f2_arg0, f2_arg1 )
	f2_arg0:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f2_arg0:animateToState( "hidden", 0 )
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg1.currentFocusIndex ~= nil )
	assert( f3_arg1.totalItemCount ~= nil )
	assert( f3_arg1.canScrollUp ~= nil )
	assert( f3_arg1.canScrollDown ~= nil )
	if not f3_arg1.canScrollUp and not f3_arg1.canScrollDown then
		f0_local0( f3_arg0, {} )
		return 
	end
	local f3_local0 = f3_arg0:getChildById( "UIScrollIndicatorText" )
	local f3_local1 = f3_arg0:getChildById( "UIScrollIndicatorUpArrow" )
	local f3_local2 = f3_arg0:getChildById( "UIScrollIndicatorDownArrow" )
	local f3_local3 = Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f3_arg1.currentFocusIndex, f3_arg1.totalItemCount )
	local f3_local4 = LUI.UIScrollIndicator.GetMaxTextWidth( f3_arg1.totalItemCount, f3_arg0.labelConfig.labelFont )
	local f3_local5 = f3_local4
	if f3_arg1.canScrollUp or f3_arg1.canScrollDown then
		f3_local5 = f3_local5 + f3_arg0.labelConfig.arrowIconSize
	end
	local f3_local6 = (f3_arg0.labelConfig.containerWidth - f3_local5) * 0.5 - 5
	if f3_arg1.canScrollUp or f3_arg1.canScrollDown then
		f3_local6 = f3_local6 + f3_arg0.labelConfig.arrowIconSize
	end
	f3_local0:setText( f3_local3 )
	f3_local1:registerAnimationState( "updated", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		width = f3_arg0.labelConfig.arrowIconSize,
		height = f3_arg0.labelConfig.arrowIconSize,
		top = -21.5,
		alpha = 1
	} )
	f3_local2:registerAnimationState( "updated", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		width = f3_arg0.labelConfig.arrowIconSize,
		height = f3_arg0.labelConfig.arrowIconSize,
		top = -22.5,
		alpha = 1
	} )
	f3_local0:registerAnimationState( "updated", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		font = CoD.TextSettings.BodyFont.Font,
		height = 14,
		width = f3_local4,
		alignment = LUI.Alignment.Center,
		top = -f3_arg0.labelConfig.labelFont.Height * 0.5,
		left = f3_local6
	} )
	f3_local0:animateToState( "updated", 0 )
	f3_arg0:registerAnimationState( "visible", {
		alpha = 1
	} )
	f3_arg0:animateToState( "visible", 0 )
end

LUI.UIScrollIndicator.build = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	if f4_arg0 and f4_arg0.states and f4_arg0.states.default then
		f4_local0 = f4_arg0.states.default
	end
	return LUI.UIScrollIndicator.new( f4_local0, f4_arg1 )
end

function SendKey( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = Engine.GetLuiRoot()
	f5_arg2.controller = f5_arg1.controller
	LUI.UIRoot.ProcessEvent( f5_local0, f5_arg2 )
end

LUI.UIScrollIndicator.new = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.containerWidth
	if not f6_local0 then
		f6_local0 = LUI.UIScrollIndicator.DefaultWidth
	end
	local f6_local1 = f6_arg1.containerHeight
	if not f6_local1 then
		f6_local1 = LUI.UIScrollIndicator.DefaultHeight
	end
	local f6_local2 = f6_local1
	local f6_local3 = f6_arg1.labelFont
	if not f6_local3 then
		f6_local3 = LUI.UIScrollIndicator.DefaultFont
	end
	local self = LUI.UIHorizontalList.new( f6_arg0 or {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	} )
	self:setClass( LUI.UIScrollIndicator )
	self.id = "UIScrollIndicatorContainer"
	self.labelConfig = {
		containerHeight = f6_local1,
		containerWidth = f6_local0,
		arrowIconSize = f6_local1,
		labelFont = f6_local3
	}
	local f6_local5 = CoD.CreateState( nil, -21.5, nil, nil, CoD.AnchorTypes.Left )
	f6_local5.width = f6_local2
	f6_local5.height = f6_local2
	f6_local5.material = RegisterMaterial( "s1_icon_up" )
	if Engine.IsPC() then
		f6_local5.alpha = 0.8
		f6_local5.scale = 0
	end
	local self = LUI.UIImage.new( f6_local5 )
	self.id = "UIScrollIndicatorUpArrow"
	self.listRoot = f6_arg1.listRoot
	if Engine.IsPC() then
		self:setHandleMouseMove( true )
		self:setHandleMouseButton( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			if element.listRoot ~= nil then
				element.listRoot:processEvent( {
					name = "gain_focus"
				} )
			end
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
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		font = f6_local3.Font,
		height = 14,
		alignment = LUI.Alignment.Center,
		color = {
			r = 1,
			g = 1,
			b = 1
		},
		alpha = 1
	} )
	self.id = "UIScrollIndicatorText"
	self:addElement( self )
	f6_local5.material = RegisterMaterial( "s1_icon_down" )
	f6_local5.top = -22.5
	local self = LUI.UIImage.new( f6_local5 )
	self.id = "UIScrollIndicatorDownArrow"
	self.listRoot = f6_arg1.listRoot
	if Engine.IsPC() then
		self:setHandleMouseMove( true )
		self:setHandleMouseButton( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			if element.listRoot ~= nil then
				element.listRoot:processEvent( {
					name = "gain_focus"
				} )
			end
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
	self:registerEventHandler( LUI.UIScrollIndicator.UpdateEvent, f0_local1 )
	self:registerEventHandler( LUI.UIScrollIndicator.HideEvent, f0_local0 )
	self:hide()
	return self
end

LUI.UIScrollIndicator.id = "LUIScrollIndicator"
