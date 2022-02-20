LUI.UIMouseCursor = {}
LUI.UIMouseCursor.priority = 1000
LUI.UIMouseCursor.mouseTimeout = 3000
LUI.UIMouseCursor.MouseMove = function ( f1_arg0, f1_arg1 )
	f1_arg0:applyElementTransform()
	f1_arg0.id = "mouse_cursor"
	local f1_local0, f1_local1 = ProjectRootCoordinate( f1_arg1.rootName, f1_arg1.x, f1_arg1.y )
	if f1_local0 ~= nil and f1_local1 ~= nil then
		f1_local0, f1_local1 = f1_arg1.root:pixelsToUnits( f1_local0, f1_local1 )
		if f1_local0 ~= nil and f1_local1 ~= nil then
			f1_arg0:registerAnimationState( "default", {
				left = f1_local0 - 30,
				right = f1_local0 + 34,
				top = f1_local1 - 25,
				bottom = f1_local1 + 39,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false,
				alpha = 1
			} )
			f1_arg0:animateToState( "default" )
		end
	end
	f1_arg0:dispatchEventToChildren( f1_arg1 )
	f1_arg0:undoElementTransform()
	f1_arg0.lastMoveTime = Engine.GetMilliseconds()
end

LUI.UIMouseCursor.Hide = function ( f2_arg0, f2_arg1 )
	f2_arg0:animateToState( "hidden", 400 )
end

LUI.UIMouseCursor.Show = function ( f3_arg0, f3_arg1 )
	f3_arg0:animateToState( "default" )
	f3_arg0.lastMoveTime = Engine.GetMilliseconds()
end

LUI.UIMouseCursor.new = function ( f4_arg0 )
	local self = LUI.UIImage.new( f4_arg0 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:setPriority( LUI.UIMouseCursor.priority )
	self.lastMoveTime = Engine.GetMilliseconds()
	self.id = "mouse_cursor"
	self.hide = LUI.UIMouseCursor.Hide
	self.show = LUI.UIMouseCursor.Show
	self:registerEventHandler( "mousemove", LUI.UIMouseCursor.MouseMove )
	local self = LUI.UITimer.new( 1000, {
		name = "update_mouse"
	}, nil, false, element, false )
	self.id = "mouse_update_timer"
	self:addElement( self )
	self:registerEventHandler( "update_mouse", function ( element, event )
		if not CoD.UsingController() then
			return 
		elseif Engine.GetMilliseconds() - element.lastMoveTime > LUI.UIMouseCursor.mouseTimeout then
			element:hide()
		end
	end )
	return self
end

