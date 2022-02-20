local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.SubList = {}
LUI.SubList.CreateSublist = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self:setUseStencil( true )
	local f1_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f1_local1.material = RegisterMaterial( "black" )
	f1_local1.alpha = 0.35
	self:addElement( LUI.UIImage.new( f1_local1 ) )
	
	local vertList = LUI.UIVerticalList.new( CoD.CreateState( nil, controller, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( vertList )
	self.vertList = vertList
	
	return self
end

LUI.SubList.CreateSubListButton = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	local f2_local0 = f2_arg1
	local f2_local1 = f2_arg1 - 2
	local self = LUI.UIButton.new( CoD.CreateState( 4, 0, -4, f2_local0, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "sublistbutton_" .. f2_arg0
	local f2_local3 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		bottom = f2_arg1,
		material = RegisterMaterial( "white" ),
		color = Colors.dark_grey,
		alpha = 0
	}
	local f2_local4 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 6,
		top = 0,
		right = -6,
		bottom = f2_local1,
		material = RegisterMaterial( "btn_focused_rect_innerglow" ),
		color = GenericButtonSettings.Common.content_focus_color,
		alpha = 1
	}
	
	local focusBackground = LUI.UIImage.new( f2_local3 )
	focusBackground.id = "memberListButton_focusBg"
	focusBackground:registerAnimationState( "focused", f2_local4 )
	focusBackground:setup9SliceImage( 10, 5, 0.25, 0.12 )
	self:addElement( focusBackground )
	self.focusBackground = focusBackground
	
	local f2_local6 = CoD.CreateState( f2_arg2, f2_arg1 / 2 - f2_arg4 / 2, f2_arg3, nil, CoD.AnchorTypes.TopLeftRight )
	f2_local6.height = f2_arg4
	f2_local6.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f2_local6.font = CoD.TextSettings.TitleFontTiny.Font
	f2_local6.color = Colors.h1.medium_grey
	
	local text = LUI.UIText.new( f2_local6 )
	text:registerAnimationState( "focused", {
		color = Colors.white
	} )
	self:addElement( text )
	self.text = text
	
	self:registerEventHandler( "button_over", function ( element, event )
		element:animateToState( "focused", 0 )
		element.text:animateToState( "focused" )
		element.focusBackground:animateToState( "focused" )
	end )
	self:registerEventHandler( "button_up", function ( element, event )
		element:animateToState( "unfocused", 0 )
		element.text:animateToState( "default" )
		element.focusBackground:animateToState( "default" )
	end )
	return self
end

LockTable( _M )
