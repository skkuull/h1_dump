LUI.UIGrid = {}
LUI.UIGrid.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIGrid.new( nil, f1_arg1 )
end

LUI.UIGrid.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	if not controller then
		controller = {}
	end
	self.width = math.max( 1, controller.elementsPerRow or 5 )
	self.rowHeight = controller.rowHeight or 80
	self.disableHWrap = controller.disableHWrap or false
	self.hSpacing = controller.hSpacing or 0
	local f2_local1 = controller.hAlign
	if not f2_local1 then
		f2_local1 = LUI.Alignment.Left
	end
	self.hAlign = f2_local1
	if controller.blockRepeatWrap == nil then
		f2_local1 = true
	else
		f2_local1 = controller.blockRepeatWrap
	end
	self.blockRepeatWrap = f2_local1
	if controller.id then
		self.id = controller.id
	else
		self.id = "LUIGrid"
	end
	self.vlist = LUI.UIVerticalList.new( nil, controller.scrollByChildHeight, nil, controller.sendScrollEvents )
	self.vlist.id = self.id .. "_vlist"
	self.vlist:makeFocusable()
	LUI.UIVerticalList.SetNoWrap( self.vlist, controller.disableVWrap )
	f2_local1 = self.vlist
	local f2_local2 = f2_local1
	f2_local1 = f2_local1.registerAnimationState
	local f2_local3 = "default"
	local f2_local4 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		spacing = controller.vSpacing or 0
	}
	local f2_local5 = controller.vAlign
	if not f2_local5 then
		f2_local5 = LUI.Alignment.Top
	end
	f2_local4.alignment = f2_local5
	f2_local1( f2_local2, f2_local3, f2_local4 )
	self.vlist:animateToState( "default" )
	self.vlist.properties = {
		autoScroll = controller and controller.autoScroll,
		autoScrollTime = controller and controller.autoScrollTime
	}
	self:addElement( self.vlist )
	if controller.sendScrollEvents then
		self:registerEventHandler( "list_scroll", function ( element, event )
			if not event.repeatCatch then
				event.repeatCatch = true
				local f3_local0 = element:getParent()
				f3_local0:processEvent( event )
			end
		end )
	end
	self.addRow = LUI.UIGrid.AddRow
	self.addElement = LUI.UIGrid.AddElement
	self.removeElement = LUI.UIGrid.RemoveElement
	self.shiftFirstElementFromNextRow = LUI.UIGrid.ShiftFirstElementFromNextRow
	self.rowEmptinessCheck = LUI.UIGrid.RowEmptinessCheck
	self.updateNavigation = LUI.UIGrid.UpdateNavigation
	self.updateRowFocusability = LUI.UIGrid.UpdateRowFocusability
	self.getChildById = LUI.UIGrid.GetChildById
	self.getAllFocusedChildren = LUI.UIGrid.GetAllFocusedChildren
	self.clearSavedState = LUI.UIGrid.ClearSavedState
	self:registerEventHandler( "update_navigation", self.updateNavigation )
	return self
end

LUI.UIGrid.GetAllFocusedChildren = function ( f4_arg0 )
	local f4_local0 = {}
	local f4_local1 = f4_arg0.vlist:getFirstChild()
	while f4_local1 do
		for f4_local5, f4_local6 in ipairs( f4_local1:getAllFocusedChildren() ) do
			table.insert( f4_local0, f4_local6 )
		end
		f4_local1 = f4_local1:getNextSibling()
	end
	return f4_local0
end

LUI.UIGrid.ClearSavedState = function ( f5_arg0 )
	LUI.UIElement.clearSavedState( f5_arg0 )
	local f5_local0 = f5_arg0.vlist:getFirstChild()
	while f5_local0 do
		f5_local0.listDefaultFocus = nil
		local f5_local1 = f5_local0:getFirstChild()
		while f5_local1 do
			f5_local1.listDefaultFocus = nil
			f5_local1 = f5_local1:getNextSibling()
		end
		f5_local0 = f5_local0:getNextSibling()
	end
end

LUI.UIGrid.GetChildById = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0.vlist:getFirstChild()
	while f6_local0 do
		local f6_local1 = f6_local0:getChildById( f6_arg1 )
		if f6_local1 then
			return f6_local1
		end
		f6_local0 = f6_local0:getNextSibling()
	end
end

LUI.UIGrid.AddRow = function ( f7_arg0 )
	local f7_local0 = f7_arg0.vlist:getLastChild()
	local f7_local1 = f7_arg0
	local self = LUI.UIHorizontalList.new()
	LUI.UIHorizontalList.SetNoWrap( self, f7_local1.disableHWrap )
	self.id = f7_arg0.id .. "_row_" .. f7_arg0.vlist:getNumChildren()
	self.removeElement = function ( f8_arg0, f8_arg1 )
		f7_local1:removeElement( f8_arg1 )
	end
	
	self:makeNotFocusable()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = f7_arg0.rowHeight,
		left = 0,
		right = 0,
		spacing = f7_arg0.hSpacing,
		alignment = f7_arg0.hAlign
	} )
	self:registerEventHandler( "menu_refresh", function ( element, event )
		f7_local1:processEvent( event )
	end )
	self:animateToState( "default" )
	f7_arg0.vlist:addElement( self )
	if f7_local0 then
		LUI.UIHorizontalList.UpdateNavigation( f7_local0 )
	end
	local f7_local3 = f7_arg0.vlist:getFirstChild()
	if f7_local3 then
		LUI.UIHorizontalList.UpdateNavigation( f7_local3 )
	end
end

LUI.UIGrid.AddElement = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0
	local f10_local1 = f10_local0.vlist:getLastChild()
	local f10_local2
	if f10_local1 ~= nil and f10_arg0.width > f10_local1:getNumChildren() then
		f10_local2 = false
	else
		f10_local2 = true
	end
	if f10_local2 then
		f10_arg0:addRow()
	end
	f10_local1 = f10_local0.vlist:getLastChild()
	f10_local1:addElement( f10_arg1 )
	if f10_arg1.listDefaultFocus then
		f10_local1.listDefaultFocus = true
	end
	f10_arg0:updateNavigation()
	local f10_local3 = function ( f11_arg0, f11_arg1 )
		local f11_local0 = 1
		local f11_local1 = f11_arg0:getParent()
		f11_local1 = f11_local1:getFirstChild()
		while f11_local1 do
			if f11_local1 == f11_arg0 then
				break
			end
			f11_local0 = f11_local0 + 1
			f11_local1 = f11_local1:getNextSibling()
		end
		f10_local0:processEvent( {
			name = "grid_navigation_update",
			dispatchChildren = true,
			column = f11_local0,
			immediate = true
		} )
		local f11_local2 = f11_arg0:getParent()
		f11_local2:setFocus( true )
		f11_local2 = f11_arg0:getParent()
		f11_local2:saveState()
	end
	
	if not f10_arg1.hasGridHandlers then
		f10_arg1.hasGridHandlers = true
		f10_arg1:addEventHandler( "element_refresh", function ( f12_arg0, f12_arg1 )
			if f12_arg0:isInFocus() then
				f10_local3( f12_arg0, f12_arg1 )
			end
		end )
		f10_arg1:addEventHandler( "button_over", f10_local3 )
		f10_arg1:addEventHandler( "button_over_disable", f10_local3 )
		f10_arg1:addEventHandler( "visual_focused", f10_local3 )
	end
	f10_arg1:registerEventHandler( "grid_navigation_update", function ( element, event )
		local f13_local0 = 1
		local f13_local1 = element:getParent()
		local f13_local2 = f13_local1:getFirstChild()
		while f13_local2 do
			if f13_local2 == element then
				break
			end
			f13_local0 = f13_local0 + 1
			f13_local2 = f13_local2:getNextSibling()
		end
		f13_local1:clearSavedState()
		f13_local1:setFocus( false )
		local f13_local3 = event.column == f13_local0
		local f13_local4 = false
		local f13_local5 = true
		local f13_local6 = 0
		local f13_local7 = f13_local1:getFirstChild()
		while f13_local7 do
			if f13_local7.m_focusable then
				f13_local6 = f13_local6 + 1
				f13_local5 = f13_local7 == element
				f13_local4 = f13_local6 < event.column
			end
			f13_local7 = f13_local7:getNextSibling()
		end
		element.listDefaultFocus = f13_local4 and (f13_local3 or f13_local5)
	end )
end

LUI.UIGrid.RemoveElement = function ( f14_arg0, f14_arg1 )
	local f14_local0 = nil
	local f14_local1 = f14_arg0.vlist:getFirstChild()
	while f14_local1 do
		if f14_arg1:getParent() == f14_local1 then
			LUI.UIHorizontalList.RemoveElement( f14_local1, f14_arg1 )
			f14_arg0:shiftFirstElementFromNextRow( f14_local1 )
			f14_arg0:rowEmptinessCheck( f14_local1, f14_local0 )
			break
		end
		f14_local0 = f14_local1
		f14_local1 = f14_local1:getNextSibling()
	end
	f14_arg0:updateNavigation()
end

LUI.UIGrid.UpdateNavigation = function ( f15_arg0, f15_arg1 )
	local f15_local0 = f15_arg0.vlist:getFirstChild()
	local f15_local1, f15_local2 = nil
	while f15_local0 do
		if f15_local1 == nil then
			f15_local1 = f15_local0
		end
		f15_arg0:updateRowFocusability( f15_local0 )
		f15_local2 = f15_local0
		f15_local0 = f15_local0:getNextSibling()
	end
	LUI.UIVerticalList.UpdateNavigation( f15_arg0.vlist )
	f15_local0 = f15_arg0.vlist:getFirstChild()
	while f15_local0 do
		LUI.UIHorizontalList.UpdateNavigation( f15_local0 )
		local f15_local3 = f15_local0:getFirstChild()
		while f15_local3 do
			if f15_local3:canFocus() then
				f15_local3.canRepeatWrapUp = false
				f15_local3.canRepeatWrapDown = false
			end
			f15_local3 = f15_local3:getNextSibling()
		end
		f15_local0 = f15_local0:getNextSibling()
	end
	if f15_local1 then
		local f15_local3 = f15_local1:getFirstChild()
		while f15_local3 do
			if f15_local3:canFocus() then
				f15_local3.canRepeatWrapUp = true
			end
			f15_local3 = f15_local3:getNextSibling()
		end
	end
	if f15_local2 then
		local f15_local3 = f15_local2:getFirstChild()
		while f15_local3 do
			if f15_local3:canFocus() then
				f15_local3.canRepeatWrapDown = true
			end
			f15_local3 = f15_local3:getNextSibling()
		end
	end
end

LUI.UIGrid.UpdateRowFocusability = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg1:canFocus()
	local f16_local1 = false
	local f16_local2 = f16_arg1:getFirstChild()
	while f16_local2 do
		if f16_local2:canFocus() then
			f16_local1 = true
			break
		end
		f16_local2 = f16_local2:getNextSibling()
	end
	if f16_local1 ~= f16_local0 then
		if f16_local1 then
			f16_arg1:makeFocusable()
		else
			f16_arg1:makeNotFocusable()
		end
	end
end

LUI.UIGrid.RowEmptinessCheck = function ( f17_arg0, f17_arg1, f17_arg2 )
	if f17_arg1:getNumChildren() == 0 then
		f17_arg0.vlist:removeElement( f17_arg1 )
	end
end

LUI.UIGrid.ShiftFirstElementFromNextRow = function ( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg1:getNextSibling()
	if f18_local0 then
		local f18_local1 = f18_local0:getFirstChild()
		if f18_local1 then
			LUI.UIHorizontalList.RemoveElement( f18_local0, f18_local1 )
			f18_arg0:rowEmptinessCheck( f18_local0, f18_arg1 )
			f18_arg1:addElement( f18_local1 )
			f18_arg0:shiftFirstElementFromNextRow( f18_local0 )
		end
	end
end

