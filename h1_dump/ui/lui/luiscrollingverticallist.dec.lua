LUI.UIScrollingVerticalList = {}
function RefreshScrollList( f1_arg0, f1_arg1 )
	f1_arg0:closeChildren()
	f1_arg0:clearSavedState()
	f1_arg0:processEvent( {
		name = "menu_refresh"
	} )
end

function CreateArrowButton( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7, f2_arg8 )
	local self = LUI.UIButton.new( {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = f2_arg3,
		bottomAnchor = f2_arg5,
		width = 15,
		top = f2_arg2,
		bottom = f2_arg4,
		alpha = 1,
		zRot = f2_arg6
	} )
	self.id = f2_arg0
	self.m_requireFocusType = FocusType.MouseOver
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "hidden" )
	self:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		f3_arg0:dispatchEventToRoot( {
			name = f2_arg7,
			dispatchChildren = true
		} )
	end )
	self:addEventHandler( "list_scroll", f2_arg8 )
	local self = LUI.UIImage.new()
	self.id = f2_arg0 .. "_image"
	self:registerAnimationState( "default", {
		material = RegisterMaterial( "widg_lobby_arrow" ),
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		color = Colors.s1.text_unfocused
	} )
	self:animateToState( "default" )
	self:addElement( self )
	return self
end

function CreateListDef( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	f4_arg0.scrollByChildHeight = true
	f4_arg0.disableOutsideChildren = true
	f4_arg0.sendScrollEvents = true
	return {
		type = "UIVerticalList",
		id = "scroll_list_vlist",
		focusable = true,
		properties = f4_arg0,
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = 0,
				top = f4_arg2,
				bottom = -f4_arg3
			}
		},
		handlers = {
			refresh_scroll_list = RefreshScrollList,
			scroll_up = function ( f5_arg0, f5_arg1 )
				f5_arg0:SetVerticalListScrollUp()
			end
			,
			scroll_down = function ( f6_arg0, f6_arg1 )
				f6_arg0:SetVerticalListScrollDown()
			end
			
		},
		childrenFeeder = f4_arg1
	}
end

function SetChildrenIgnoreMouse( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0:getNumChildren()
	local f7_local1 = f7_arg0:getFirstChild()
	for f7_local2 = 1, f7_local0, 1 do
		local f7_local5 = f7_local2
		f7_local1.m_focusLockedByScrolling = f7_arg1.ignore
		f7_local1 = f7_local1:getNextSibling()
	end
end

LUI.UIScrollingVerticalList.build = function ( f8_arg0, f8_arg1 )
	return LUI.UIScrollingVerticalList.new( nil, f8_arg0, f8_arg1 )
end

LUI.UIScrollingVerticalList.new = function ( f9_arg0, f9_arg1, f9_arg2 )
	local self = LUI.UIElement.new( f9_arg0 )
	if not f9_arg2 then
		f9_arg2 = {}
	end
	if not f9_arg1 then
		f9_arg1 = {}
	end
	self.id = "UIScrollingVList"
	local f9_local1 = f9_arg1.childrenFeeder
	if f9_arg1.childrenFeeder then
		f9_arg1.childrenFeeder = nil
	end
	local f9_local2 = 0
	if f9_arg2.use_arrows then
		local f9_local3 = function ( f10_arg0, f10_arg1 )
			if f10_arg1.show_up_arrow then
				f10_arg0:animateToState( "default", 0 )
				f10_arg0:processEvent( {
					name = "enable"
				} )
			else
				f10_arg0:animateToState( "hidden", 0 )
				f10_arg0:processEvent( {
					name = "disable"
				} )
			end
		end
		
		f9_local2 = 30
		self:addElement( CreateArrowButton( "scroll_list_up_arrow", self, 0, true, f9_local2, false, 90, "scroll_up", f9_local3 ) )
		self:addElement( CreateArrowButton( "scroll_list_down_arrow", self, -f9_local2, false, 0, true, -90, "scroll_down", function ( f11_arg0, f11_arg1 )
			if f11_arg1.show_down_arrow then
				f11_arg0:animateToState( "default", 0 )
				f11_arg0:processEvent( {
					name = "enable"
				} )
			else
				f11_arg0:animateToState( "hidden", 0 )
				f11_arg0:processEvent( {
					name = "disable"
				} )
			end
		end ) )
	end
	local f9_local4 = LUI.MenuBuilder.buildItems( CreateListDef( f9_arg2, f9_local1, f9_local2, f9_local2 ), f9_arg2, stencil )
	f9_local4:setUseStencil( true )
	self:addElement( f9_local4 )
	f9_local4:registerEventHandler( "set_children_ignore_mouse", SetChildrenIgnoreMouse )
	if f9_arg2.use_scrollbar then
		self:addElement( LUI.UIVerticalScrollbar.new( f9_local4, f9_arg2.bar_width, 1, 1, f9_arg2.scrollbar_move_func, f9_arg2.bar_color, f9_arg2.bar_bg_color, f9_arg2.bar_material, f9_arg2.bar_bg_material ) )
	end
	self.vlist = f9_local4
	self.addElement = LUI.UIScrollingVerticalList.AddElement
	self.removeElement = LUI.UIScrollingVerticalList.RemoveElement
	self.closeChildren = LUI.UIScrollingVerticalList.CloseChildren
	return self
end

LUI.UIScrollingVerticalList.AddElement = function ( f12_arg0, f12_arg1 )
	f12_arg0.vlist:addElement( f12_arg1 )
end

LUI.UIScrollingVerticalList.RemoveElement = function ( f13_arg0, f13_arg1 )
	f13_arg0.vlist:removeElement( f13_arg1 )
end

LUI.UIScrollingVerticalList.CloseChildren = function ( f14_arg0 )
	f14_arg0.vlist:closeChildren()
end

