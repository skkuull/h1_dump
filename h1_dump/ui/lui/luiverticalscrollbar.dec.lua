LUI.UIVerticalScrollbar = {}
LUI.UIVerticalScrollbar.InactiveDelay = 500
LUI.UIVerticalScrollbar.InactiveDuration = 250
function OnMouseMove( f1_arg0, f1_arg1 )
	if f1_arg0.scrolling then
		local f1_local0 = f1_arg0:getParent()
		local f1_local1 = f1_local0:getHeight()
		local f1_local2, f1_local3, f1_local4, f1_local5 = f1_local0:getRect()
		local f1_local6, f1_local7 = f1_arg1.root:pixelsToUnits( f1_arg1.x, f1_arg1.y )
		f1_local2, f1_local3 = f1_arg1.root:pixelsToUnits( f1_local2, f1_local3 )
		local f1_local8 = (f1_local7 - f1_local3) / f1_local1
		if f1_local8 < 0 then
			f1_local8 = 0
		elseif f1_local8 > 1 then
			f1_local8 = 1
		end
		if f1_arg0.onMoveFunc then
			f1_arg0.onMoveFunc( f1_local0, f1_local0.verticalList, f1_local8, f1_local0.properties )
		end
	end
end

function MouseMoveEvent( f2_arg0, f2_arg1 )
	f2_arg0:applyElementTransform()
	local f2_local0, f2_local1 = ProjectRootCoordinate( f2_arg1.rootName, f2_arg1.x, f2_arg1.y )
	OnMouseMove( f2_arg0, {
		controller = f2_arg1.controller,
		root = f2_arg1.root,
		x = f2_local0,
		y = f2_local1
	} )
	f2_arg0:undoElementTransform()
end

function ScrollbarMoved( f3_arg0, f3_arg1, f3_arg2 )
	if not f3_arg1 then
		DebugPrint( "Warning: Tried to scroll a scrollbar without a vertical list. Make sure the vertical list was manually added. E.G. scrollBar:setList( <vList> )." )
		return 
	elseif not f3_arg2 then
		DebugPrint( "Warning: Tried to scroll a scrollbar without a scroll percentage. This is very bad." )
		return 
	end
	local f3_local0 = f3_arg1:getNumChildren()
	local f3_local1 = math.min( math.floor( f3_arg2 * f3_local0 ), f3_local0 - 1 )
	if f3_local1 == f3_arg1.lastFocusIndex then
		return 
	end
	f3_arg1.lastFocusIndex = f3_local1
	local f3_local2 = f3_arg1:getFirstChild()
	local f3_local3 = nil
	for f3_local4 = 0, f3_local0 - 1, 1 do
		if f3_local4 == f3_local1 then
			f3_local3 = f3_local2
		end
		f3_local2:processEvent( {
			name = "lose_focus",
			immediate = true
		} )
		f3_local2 = f3_local2:getNextSibling()
	end
	while f3_local3 and f3_local3.scrollingToNext do
		f3_local3 = f3_local3:getNextSibling()
	end
	if f3_local3 then
		f3_local3:processEvent( {
			name = "gain_focus",
			immediate = true
		} )
	end
end

function OnMouseDown( f4_arg0, f4_arg1 )
	f4_arg0.scrolling = true
	local f4_local0 = Engine.SetUsingScrollbar
	local f4_local1 = f4_arg1.controller
	if not f4_local1 then
		f4_local1 = Engine.GetFirstActiveController()
	end
	f4_local0( f4_local1, true )
	OnMouseMove( f4_arg0, f4_arg1 )
	f4_local0 = f4_arg0:getParent()
	if f4_local0.verticalList then
		f4_local0.verticalList:processEvent( {
			name = "set_children_ignore_mouse",
			ignore = true,
			immediate = true
		} )
	end
	f4_local0.buttonImage:setImage( f4_local0.buttonImageSelectedMaterial )
	f4_local0.buttonImage:animateToState( "default" )
	f4_local0.bgImage:setImage( f4_local0.bgImageSelectedMaterial )
	if f4_local0.dimBackgroundWhenUnselected then
		f4_local0.bgImage:setAlpha( 1 )
	end
	f4_local0.bgImage:animateToState( "default" )
end

function StopScrolling( f5_arg0, f5_arg1 )
	f5_arg0.scrolling = false
	local f5_local0 = Engine.SetUsingScrollbar
	local f5_local1 = f5_arg1.controller
	if not f5_local1 then
		f5_local1 = Engine.GetFirstActiveController()
	end
	f5_local0( f5_local1, false )
	f5_local0 = f5_arg0:getParent()
	if f5_local0.verticalList then
		f5_local0.verticalList:processEvent( {
			name = "set_children_ignore_mouse",
			ignore = false,
			immediate = true
		} )
	end
	f5_local0.buttonImage:setImage( f5_local0.buttonImageUnselectedMaterial )
	f5_local0.buttonImage:animateToState( "default" )
	f5_local0.bgImage:setImage( f5_local0.bgImageUnselectedMaterial )
	if f5_local0.dimBackgroundWhenUnselected then
		f5_local0.bgImage:setAlpha( 0.5 )
	end
	f5_local0.bgImage:animateToState( "default" )
end

LUI.UIVerticalScrollbar.build = function ( f6_arg0, f6_arg1 )
	return LUI.UIVerticalScrollbar.new( nil, f6_arg1.vlist, f6_arg1.bar_width, f6_arg1.border, f6_arg1.active_alpha, f6_arg1.inactive_alpha, f6_arg1.on_move_func, f6_arg1.bar_color, f6_arg1.bg_color, f6_arg1.bar_material_unselected, f6_arg1.bg_material_unselected, f6_arg1.bar_material_selected, f6_arg1.bg_material_selected )
end

LUI.UIVerticalScrollbar.new = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7, f7_arg8, f7_arg9, f7_arg10, f7_arg11, f7_arg12 )
	if not f7_arg2 then
		f7_arg2 = 20
	end
	if not f7_arg4 then
		f7_arg4 = 1
	end
	if not f7_arg5 then
		f7_arg5 = 1
	end
	if not f7_arg6 then
		f7_arg6 = ScrollbarMoved
	end
	if not f7_arg7 then
		f7_arg7 = {
			red = 0.3,
			green = 0.3,
			blue = 0.3,
			alpha = 1
		}
	end
	if not f7_arg8 then
		f7_arg8 = {
			red = 0.05,
			green = 0.05,
			blue = 0.05,
			alpha = 1
		}
	end
	if not f7_arg9 then
		f7_arg9 = "black"
	end
	if not f7_arg10 then
		f7_arg10 = "white"
	end
	if not f7_arg11 then
		f7_arg11 = "black"
	end
	local f7_local0 = nil
	if f7_arg12 == nil then
		f7_local0 = true
		f7_arg12 = f7_arg10
	end
	if f7_arg0 then
		f7_arg0.alpha = f7_arg0.alpha or f7_arg4
	end
	local self = LUI.UIElement.new( f7_arg0 or {
		left = 0,
		top = 0,
		right = f7_arg2,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = f7_arg4
	} )
	self.id = "LUIVerticalScrollbar"
	self:registerAnimationState( "inactive", {
		alpha = f7_arg5
	} )
	self:registerEventHandler( "list_scroll", LUI.UIVerticalScrollbar.UpdateScrollbar )
	self:registerEventHandler( "focus_changed", LUI.UIVerticalScrollbar.FocusChanged )
	self:registerEventHandler( "inactive", LUI.UIVerticalScrollbar.Inactive )
	self.bgImageUnselectedMaterial = RegisterMaterial( f7_arg10 )
	self.bgImageSelectedMaterial = RegisterMaterial( f7_arg12 )
	self.bgImage = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		color = f7_arg8,
		alpha = f7_arg8.alpha,
		material = RegisterMaterial( f7_arg10 )
	} )
	if f7_local0 then
		self.dimBackgroundWhenUnselected = true
		self.bgImage:setAlpha( 0.5 )
	end
	self.bgImage:animateToState( "default" )
	self:addElement( self.bgImage )
	self.VPadding = 1.5
	if f7_arg3 then
		self.bgImage:addElement( LUI.UIBorder.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			alpha = 0.65,
			borderThickness = 1,
			color = Colors.grey_6
		} ) )
	end
	self.scrollButton = LUI.UIButton.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self.buttonImageUnselectedMaterial = RegisterMaterial( f7_arg9 )
	self.buttonImageSelectedMaterial = RegisterMaterial( f7_arg11 )
	self.buttonImage = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		left = 1,
		right = -1,
		color = f7_arg7,
		alpha = f7_arg7.alpha,
		material = RegisterMaterial( f7_arg9 )
	} )
	self.scrollButton.onMoveFunc = f7_arg6
	self.scrollButton:registerEventHandler( "leftmousedown", OnMouseDown )
	self.scrollButton:registerEventHandler( "leftmouseup", StopScrolling )
	self.scrollButton:addEventHandler( "popup_active", StopScrolling )
	self.scrollButton:addEventHandler( "mousemove", MouseMoveEvent )
	self.scrollButton:addElement( self.buttonImage )
	self:addElement( self.scrollButton )
	self.setList = LUI.UIVerticalScrollbar.SetVerticalList
	self.manualUpdate = LUI.UIVerticalScrollbar.ManualUpdate
	self:setList( f7_arg1 )
	return self
end

LUI.UIVerticalScrollbar.UpdateScrollbar = function ( f8_arg0, f8_arg1 )
	if f8_arg0.verticalList and f8_arg1.list == f8_arg0.verticalList then
		local f8_local0, f8_local1 = nil
		if f8_arg1.newElementsHeight <= f8_arg1.newLayoutHeight then
			f8_local1 = f8_arg1.newLayoutHeight
			f8_local0 = 0
		else
			f8_local1 = math.min( f8_arg1.newLayoutHeight, f8_arg1.newLayoutHeight * f8_arg1.newLayoutHeight / f8_arg1.newElementsHeight )
			f8_local0 = (f8_arg1.newLayoutHeight - f8_local1) * f8_arg1.newTopOffset / (f8_arg1.newLayoutHeight - f8_arg1.newElementsHeight)
		end
		f8_arg0.buttonImage:registerAnimationState( "default", {
			top = f8_local0,
			bottom = f8_local0 + f8_local1,
			topAnchor = true,
			bottomAnchor = false
		} )
		f8_arg0.buttonImage:animateToState( "default" )
	end
	f8_arg0:dispatchEventToChildren( f8_arg1 )
end

LUI.UIVerticalScrollbar.FocusChanged = function ( f9_arg0, f9_arg1 )
	f9_arg0:animateToState( "default" )
	if f9_arg0.inactiveTimer then
		f9_arg0.inactiveTimer:close()
		f9_arg0.inactiveTimer:reset()
		f9_arg0:addElement( f9_arg0.inactiveTimer )
	else
		f9_arg0.inactiveTimer = LUI.UITimer.new( LUI.UIVerticalScrollbar.InactiveDelay, "inactive", true )
		f9_arg0:addElement( f9_arg0.inactiveTimer )
	end
end

LUI.UIVerticalScrollbar.Inactive = function ( f10_arg0, f10_arg1 )
	f10_arg0:animateToState( "inactive", LUI.UIVerticalScrollbar.InactiveDuration )
end

LUI.UIVerticalScrollbar.SetVerticalList = function ( f11_arg0, f11_arg1 )
	f11_arg0.verticalList = f11_arg1
end

LUI.UIVerticalScrollbar.ManualUpdate = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	local f12_local0 = f12_arg2 * f12_arg4 - 8
	local f12_local1 = f12_local0
	local f12_local2 = 0
	if f12_arg3 ~= 0 then
		f12_local1 = math.min( f12_local0, f12_local0 * f12_arg2 / f12_arg3 )
		if f12_arg3 ~= f12_arg2 then
			f12_local2 = LUI.clamp( f12_arg1 / (f12_arg3 - f12_arg2) * (f12_local0 - f12_local1), f12_arg0.VPadding, f12_local0 - f12_local1 - f12_arg0.VPadding )
		end
	end
	f12_arg0.buttonImage:registerAnimationState( "default", {
		top = f12_local2,
		bottom = f12_local2 + f12_local1,
		topAnchor = true,
		bottomAnchor = false
	} )
	f12_arg0.buttonImage:animateToState( "default" )
end

