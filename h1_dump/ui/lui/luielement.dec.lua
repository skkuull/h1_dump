LUI.UIElement = {
	id = "LUIElement",
	m_defaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		alphaMultiplier = 1
	}
}
LUI.UIContainer = {}
LUI.UIElement.addChildRecord = function ( f1_arg0, f1_arg1 )
	local f1_local0 = rawget
	local f1_local1 = getmetatable( f1_arg1 )
	f1_local0 = f1_local0( f1_local1.__newindex, "id" )
	if f1_local0 ~= nil then
		if not f1_arg0.childRecord then
			f1_arg0.childRecord = {}
		end
		if f1_arg0.childRecord[f1_local0] ~= nil then
			error( "LUI Error: Element has duplicate id "" .. f1_local0 .. """ )
		end
		f1_arg0.childRecord[f1_local0] = f1_arg1
	end
end

LUI.UIElement.removeChildRecord = function ( f2_arg0, f2_arg1 )
	local f2_local0 = rawget
	local f2_local1 = getmetatable( f2_arg1 )
	f2_local0 = f2_local0( f2_local1.__newindex, "id" )
	if f2_local0 ~= nil then
		if f2_arg0.childRecord and f2_arg0.childRecord[f2_local0] then
			f2_arg0.childRecord[f2_local0] = nil
		else
			DebugPrint( "LUI Warning: Removing element from an element which does not contain it: "" .. f2_local0 .. """ )
		end
	end
end

LUI.UIElement.rename = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getParent()
	if f3_local0 ~= nil then
		f3_local0:removeChildRecord( f3_arg0 )
	end
	f3_arg0.id = f3_arg1
	if f3_local0 ~= nil then
		f3_local0:addChildRecord( f3_arg0 )
	end
end

LUI.UIElement.addElement = function ( f4_arg0, f4_arg1 )
	if f4_arg0:canAddElement( f4_arg1 ) then
		f4_arg0:addElementToC( f4_arg1 )
		f4_arg0:addChildRecord( f4_arg1 )
		return f4_arg1
	else
		return nil
	end
end

LUI.UIElement.insertElement = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg2 and f5_arg0:canAddElement( f5_arg1 ) then
		local f5_local0 = f5_arg0:getNumChildren()
		if f5_arg2 == f5_local0 + 1 then
			f5_arg0:addElement( f5_arg1 )
			return 
		end
		local f5_local1 = assert
		local f5_local2
		if f5_arg2 <= 0 or f5_arg2 > f5_local0 then
			f5_local2 = false
		else
			f5_local2 = true
		end
		f5_local1( f5_local2, "LUI.UIElement.insertElement : Index out of bounds" )
		f5_local1 = f5_arg0:getFirstChild()
		while f5_local1 and f5_arg2 > 1 do
			f5_local1 = f5_local1:getNextSibling()
			f5_arg2 = f5_arg2 - 1
		end
		if f5_local1 then
			f5_arg1:addElementBefore( f5_local1 )
		end
	end
end

LUI.UIElement.addElementBefore = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1:getParent()
	if not f6_local0 then
		error( "LUI Error: Element has no parent!" )
		return 
	elseif f6_local0:canAddElement( f6_arg0 ) then
		f6_arg0:addElementBeforeInC( f6_arg1 )
		f6_local0:addChildRecord( f6_arg0 )
	end
end

LUI.UIElement.addElementAfter = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg1:getParent()
	if not f7_local0 then
		error( "LUI Error: Element has no parent!" )
		return 
	elseif f7_local0:canAddElement( f7_arg0 ) then
		f7_arg0:addElementAfterInC( f7_arg1 )
		f7_local0:addChildRecord( f7_arg0 )
	end
end

LUI.UIElement.removeElement = function ( f8_arg0, f8_arg1 )
	if f8_arg0.removeElementInC then
		f8_arg0:removeElementInC( f8_arg1 )
		f8_arg0:removeChildRecord( f8_arg1 )
	end
end

LUI.UIElement.canAddElement = function ( f9_arg0, f9_arg1 )
	if f9_arg1 == nil then
		error( "LUI Error: Tried to add nil element!" )
		return false
	elseif f9_arg1:getParent() == f9_arg0 then
		return false
	else
		return true
	end
end

LUI.UIElement.isClosed = function ( f10_arg0 )
	local f10_local0
	if f10_arg0:getParent() == nil then
		f10_local0 = not f10_arg0.isaroot
	else
		f10_local0 = false
	end
	return f10_local0
end

LUI.UIElement.setLeftRight = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	return f11_arg0:setLeftRightInC( f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
end

LUI.UIElement.setTopBottom = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	return f12_arg0:setTopBottomInC( f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
end

LUI.UIElement.hide = function ( f13_arg0 )
	f13_arg0:setAlpha( 0 )
end

LUI.UIElement.show = function ( f14_arg0 )
	f14_arg0:setAlpha( 1 )
end

LUI.UIElement.setAlpha = function ( f15_arg0, f15_arg1 )
	f15_arg0:setAlphaMultiplierInC( f15_arg1 )
end

LUI.UIElement.close = function ( f16_arg0 )
	local f16_local0 = f16_arg0:getParent()
	if f16_local0 ~= nil then
		f16_local0:removeElement( f16_arg0 )
	end
end

LUI.UIElement.closeChildren = function ( f17_arg0 )
	local f17_local0 = f17_arg0:getFirstChild()
	if not f17_local0 then
		return 
	end
	while f17_local0 do
		local f17_local1 = f17_local0:getNextSibling()
		f17_local0:close()
		f17_local0 = f17_local1
	end
end

LUI.UIElement.closeTree = function ( f18_arg0 )
	local f18_local0 = f18_arg0:getFirstChild()
	while f18_local0 do
		local f18_local1 = f18_local0:getNextSibling()
		f18_local0:closeTree()
		f18_local0 = f18_local1
	end
	local f18_local1 = f18_arg0:getParent()
	if f18_local1 ~= nil then
		f18_local1:removeElementInC( f18_arg0 )
		f18_local1:removeChildRecord( f18_arg0 )
	end
end

LUI.UIElement.getFullID = function ( f19_arg0 )
	local f19_local0 = f19_arg0.id
	local f19_local1 = f19_arg0:getParent()
	while f19_local1 do
		f19_local0 = f19_local1.id .. "/" .. f19_local0
		f19_local1 = f19_local1:getParent()
	end
	return f19_local0
end

LUI.UIElement.getChildById = function ( f20_arg0, f20_arg1 )
	local f20_local0 = f20_arg0.childRecord
	if f20_local0 then
		f20_local0 = f20_arg0.childRecord[f20_arg1]
	end
	return f20_local0
end

LUI.UIElement.getFirstDescendentById = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg0.childRecord
	if f21_local0 then
		f21_local0 = f21_arg0.childRecord[f21_arg1]
	end
	if f21_local0 ~= nil then
		return f21_local0
	end
	f21_local0 = f21_arg0:getFirstChild()
	while f21_local0 ~= nil do
		local f21_local1 = f21_local0:getFirstDescendentById( f21_arg1 )
		if f21_local1 ~= nil then
			return f21_local1
		end
		f21_local0 = f21_local0:getNextSibling()
	end
	return nil
end

LUI.UIElement.getChildByIdTraverse = function ( f22_arg0, f22_arg1 )
	local f22_local0 = f22_arg0:getFirstChild()
	if f22_local0 == nil then
		return 
	end
	while f22_local0 ~= nil do
		local f22_local1 = f22_local0:getNextSibling()
		if f22_local0.id and f22_local0.id == f22_arg1 then
			return f22_local0
		end
		f22_local0 = f22_local1
	end
end

LUI.UIElement.isInputDisabledOnChain = function ( f23_arg0 )
	while f23_arg0 do
		if f23_arg0.m_inputDisabled then
			return true
		end
		f23_arg0 = f23_arg0:getParent()
	end
	return false
end

LUI.UIElement.setHandleMouse = function ( f24_arg0, f24_arg1 )
	f24_arg0.handleMouseMove = f24_arg1
	f24_arg0.handleMouseButton = f24_arg1
end

LUI.UIElement.setHandleMouseMove = function ( f25_arg0, f25_arg1 )
	f25_arg0.handleMouseMove = f25_arg1
end

LUI.UIElement.setHandleMouseButton = function ( f26_arg0, f26_arg1 )
	f26_arg0.handleMouseButton = f26_arg1
end

LUI.UIElement.MouseMoveEvent = function ( f27_arg0, f27_arg1 )
	if f27_arg0.m_inputDisabled then
		return 
	elseif f27_arg0.m_ignoreMouseFocus or f27_arg0.m_outsideParentList or f27_arg0.m_focusLockedByScrolling then
		return 
	elseif not Engine.UsesMouseCursor() then
		return 
	end
	local f27_local0 = Engine.GetLuiRoot()
	if f27_local0.m_blockMouseMove and f27_arg0.id ~= "mouse_cursor" then
		return 
	end
	f27_local0 = LUI.UIElement.lastMouseWheelTime
	if f27_local0 ~= nil then
		local f27_local1 = Engine.GetTimeMsecs()
		if f27_local0 < f27_local1 and f27_local1 < f27_local0 + 350 then
			return 
		end
		LUI.UIElement.lastMouseWheelTime = nil
	end
	local f27_local1 = false
	f27_arg0:applyElementTransform()
	if f27_arg0.handleMouseMove and not f27_arg1.waitingForKeyBind then
		local f27_local2, f27_local3 = ProjectRootCoordinate( f27_arg1.rootName, f27_arg1.x, f27_arg1.y )
		if f27_local2 == nil or f27_local3 == nil then
			f27_arg0:undoElementTransform()
			return 
		end
		local f27_local4 = false
		local f27_local5, f27_local6, f27_local7, f27_local8 = f27_arg0:getRect()
		if f27_arg1.mouse_outside == nil and f27_local5 ~= nil and f27_local6 <= f27_local3 and f27_local3 <= f27_local8 and f27_local5 <= f27_local2 and f27_local2 <= f27_local7 then
			f27_local4 = true
		end
		if f27_local4 then
			if f27_arg0:canFocus( FocusType.MouseOver ) and not f27_arg0:isInFocus() and f27_arg0.m_mouseOver then
				f27_arg0.m_mouseOver = nil
			end
			if f27_arg0.m_mouseOver == nil then
				f27_arg0.m_mouseOver = true
				if f27_arg0:canFocus( FocusType.MouseOver ) and (not f27_arg0:isInFocus() or f27_arg0.shareFocus ~= nil and f27_arg0.shareFocus) then
					if f27_arg0.shareFocus == nil or not f27_arg0.shareFocus then
						f27_arg0:dispatchEventToRoot( {
							name = "lose_focus",
							immediate = true,
							controller = f27_arg1.controller,
							focusType = FocusType.MouseOver
						} )
					end
					f27_arg0:processEvent( {
						name = "gain_focus",
						controller = f27_arg1.controller,
						focusType = FocusType.MouseOver
					} )
					local f27_local9 = f27_arg0:getParent()
					if f27_local9 and f27_local9:isIDNamed() then
						f27_local9.shouldSaveState = true
					end
				end
				if f27_arg0.m_eventHandlers.mouseenter ~= nil then
					f27_arg0.m_eventHandlers:mouseenter( {
						name = "mouseenter",
						controller = f27_arg1.controller,
						root = f27_arg1.root,
						x = f27_local2,
						y = f27_local3
					} )
				end
			end
			if f27_arg0.m_eventHandlers.mouseover ~= nil then
				f27_arg0.m_eventHandlers:mouseover( {
					name = "mouseover",
					controller = f27_arg1.controller,
					root = f27_arg1.root,
					x = f27_local2,
					y = f27_local3
				} )
			end
		elseif f27_arg0.m_mouseOver ~= nil then
			f27_arg0.m_mouseOver = nil
			if f27_arg0:isInFocus() then
				f27_arg0:processEvent( {
					name = "lose_focus",
					controller = f27_arg1.controller,
					focusType = FocusType.MouseOver
				} )
			end
			if f27_arg0.m_eventHandlers.mouseleave ~= nil then
				f27_arg0.m_eventHandlers:mouseleave( {
					name = "mouseleave",
					controller = f27_arg1.controller,
					root = f27_arg1.root
				} )
			end
		end
		if not f27_local4 and f27_arg1.mouse_outside == nil then
			f27_arg1.mouse_outside = true
			f27_local1 = true
		end
	end
	f27_arg0:dispatchEventToChildren( f27_arg1 )
	if f27_arg0.shouldSaveState then
		f27_arg0:saveState()
		f27_arg0.shouldSaveState = nil
	end
	if f27_local1 then
		f27_arg1.mouse_outside = nil
	end
	f27_arg0:undoElementTransform()
end

LUI.UIElement.MouseButtonEvent = function ( f28_arg0, f28_arg1 )
	if f28_arg0.m_inputDisabled then
		return 
	elseif f28_arg0.m_ignoreMouseFocus or f28_arg0.m_outsideParentList or f28_arg0.m_focusLockedByScrolling then
		return 
	end
	f28_arg0:applyElementTransform()
	if f28_arg0.handleMouseButton then
		local f28_local0, f28_local1 = ProjectRootCoordinate( f28_arg1.rootName, f28_arg1.x, f28_arg1.y )
		if f28_local0 == nil or f28_local1 == nil then
			f28_arg0:undoElementTransform()
			return 
		end
		local f28_local2 = false
		local f28_local3, f28_local4, f28_local5, f28_local6 = f28_arg0:getRect()
		if f28_arg1.mouse_outside == nil and f28_local3 ~= nil and f28_local4 <= f28_local1 and f28_local1 <= f28_local6 and f28_local3 <= f28_local0 and f28_local0 <= f28_local5 then
			f28_local2 = true
		end
		if f28_arg1.name == "mouseup" then
			if f28_arg1.button == "left" and f28_arg0.m_leftMouseDown ~= nil then
				f28_arg0.m_leftMouseDown = nil
				if f28_arg0.m_eventHandlers.leftmouseup ~= nil then
					local f28_local7 = {
						name = "leftmouseup",
						controller = f28_arg1.controller,
						root = f28_arg1.root,
						x = f28_local0,
						y = f28_local1,
						inside = f28_local2
					}
					local f28_local8 = f28_arg0.m_eventHandlers:leftmouseup( f28_local7 )
					f28_arg1.handled = f28_arg1.handled or f28_local7.handled
					if f28_local8 then
						f28_arg0:undoElementTransform()
						return f28_local8
					end
				end
			end
			if f28_arg1.button == "right" and f28_arg0.m_rightMouseDown ~= nil then
				f28_arg0.m_rightMouseDown = nil
				if f28_arg0.m_eventHandlers.rightmouseup ~= nil then
					local f28_local7 = {
						name = "rightmouseup",
						controller = f28_arg1.controller,
						root = f28_arg1.root,
						x = f28_local0,
						y = f28_local1,
						inside = f28_local2
					}
					local f28_local8 = f28_arg0.m_eventHandlers:rightmouseup( f28_local7 )
					f28_arg1.handled = f28_arg1.handled or f28_local7.handled
					if f28_local8 then
						f28_arg0:undoElementTransform()
						return f28_local8
					end
				end
			end
		end
		if f28_local2 and f28_arg1.name == "mousedown" then
			if f28_arg1.button == "left" and f28_arg0.m_leftMouseDown == nil then
				f28_arg0.m_leftMouseDown = true
				if f28_arg0.m_eventHandlers.leftmousedown ~= nil then
					f28_arg0.m_eventHandlers:leftmousedown( {
						name = "leftmousedown",
						controller = f28_arg1.controller,
						root = f28_arg1.root,
						x = f28_local0,
						y = f28_local1,
						inside = f28_local2
					} )
				end
			end
			if f28_arg1.button == "right" and f28_arg0.m_rightMouseDown == nil then
				f28_arg0.m_rightMouseDown = true
				if f28_arg0.m_eventHandlers.rightmousedown ~= nil then
					f28_arg0.m_eventHandlers:rightmousedown( {
						name = "rightmousedown",
						controller = f28_arg1.controller,
						root = f28_arg1.root,
						x = f28_local0,
						y = f28_local1,
						inside = f28_local2
					} )
				end
			end
		end
		if f28_arg0.m_eventHandlers.mousedrag ~= nil and f28_arg0.m_leftMouseDown ~= nil then
			f28_arg0.m_eventHandlers:mousedrag( {
				name = "mousedrag",
				controller = f28_arg1.controller,
				root = f28_arg1.root,
				x = f28_local0,
				y = f28_local1
			} )
		end
	end
	f28_arg0:dispatchEventToChildren( f28_arg1 )
	f28_arg0:undoElementTransform()
end

LUI.UIElement.GamepadButton = function ( f29_arg0, f29_arg1 )
	if f29_arg0.m_inputDisabled then
		return 
	elseif not f29_arg0:handleGamepadButton( f29_arg1 ) then
		if f29_arg0.m_ownerController == nil or f29_arg0.m_ownerController == f29_arg1.controller then
			return f29_arg0:dispatchEventToChildren( f29_arg1 )
		else
			DebugPrint( "Item Exclusive to controller " .. f29_arg1.controller )
			
		end
	else
		return true
	end
end

LUI.UIElement.processNavigationEvent = function ( f30_arg0, f30_arg1, f30_arg2 )
	local f30_local0 = f30_arg0:getParent()
	if f30_local0 == nil then
		return false
	elseif f30_local0:isIDNamed() then
		f30_local0:saveState()
	end
	local f30_local1, f30_local2, f30_local3 = nil
	if f30_arg1 then
		f30_local1 = f30_arg1.controller
		f30_local2 = f30_arg1.button
		f30_local3 = f30_arg1.extraNavData
	end
	f30_arg0:processEvent( {
		name = "lose_focus",
		controller = f30_local1,
		button = f30_local2,
		extraNavData = f30_local3
	} )
	if f30_arg2:processEvent( {
		name = "gain_focus",
		controller = f30_local1,
		button = f30_local2,
		extraNavData = f30_local3,
		flowType = FocusType.Gamepad
	} ) ~= false then
		if f30_local0:isIDNamed() and f30_local0 == f30_arg2:getParent() then
			f30_local0:saveState()
		end
		return true
	end
	return false
end

LUI.UIElement.handleGamepadButton = function ( f31_arg0, f31_arg1 )
	local f31_local0 = false
	if (f31_arg0:isInFocus() or f31_arg1.handleEvenIfNotInFocus and f31_arg1.handleEvenIfNotInFocus > 0 and f31_arg0.navigation ~= nil) and f31_arg1.down == true then
		f31_arg1.repeats = f31_arg1.repeats or 0
		local f31_local1 = false
		if f31_arg1.repeats > 1 then
			if f31_arg1.button == "down" then
				f31_local1 = f31_arg0.canRepeatWrapDown
			elseif f31_arg1.button == "up" then
				f31_local1 = f31_arg0.canRepeatWrapUp
			elseif f31_arg1.button == "left" then
				f31_local1 = f31_arg0.canRepeatWrapLeft
			elseif f31_arg1.button == "right" then
				f31_local1 = f31_arg0.canRepeatWrapRight
			end
		end
		if f31_arg0.m_disableNavigation ~= true and not f31_local1 then
			if f31_arg1.oldFocus == nil then
				f31_arg1.oldFocus = f31_arg0
				f31_arg1.oldFocusRecursionCount = 1
			else
				f31_arg1.oldFocusRecursionCount = f31_arg1.oldFocusRecursionCount + 1
			end
			assert( not f31_arg0.uiElement_handleGamepadButton_recursionPreventionFlag, "You've somehow recursed into the same object, this will cause an infinite loop!" )
			f31_arg0.uiElement_handleGamepadButton_recursionPreventionFlag = true
			if f31_arg0.navigation[f31_arg1.button] then
				if f31_arg0.navigation[f31_arg1.button]:canFocus( FocusType.Gamepad ) then
					if f31_arg1.qualifier == "mousewheel" and f31_arg0.navigation.wrapTarget ~= nil and f31_arg0.navigation.wrapTarget[f31_arg1.button] == f31_arg0.navigation[f31_arg1.button] then
						f31_local0 = true
					else
						f31_local0 = LUI.UIElement.processNavigationEvent( f31_arg1.oldFocus, f31_arg1, f31_arg0.navigation[f31_arg1.button] )
					end
				end
				if not f31_local0 then
					if not f31_arg1.handleEvenIfNotInFocus then
						f31_arg1.handleEvenIfNotInFocus = 1
					else
						f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus + 1
					end
					local f31_local2 = f31_arg1.dispatchChildren
					f31_arg1.dispatchChildren = false
					f31_local0 = f31_arg0.navigation[f31_arg1.button]:processEvent( f31_arg1 )
					f31_arg1.dispatchChildren = f31_local2
					f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus - 1
				end
			end
			if not f31_local0 and f31_arg0:getParent() then
				local f31_local2 = f31_arg0:getParent()
				if f31_local2.navigationFromChild then
					f31_local2 = f31_arg0:getParent()
					if f31_local2.navigationFromChild[f31_arg1.button] then
						if not f31_arg1.handleEvenIfNotInFocus then
							f31_arg1.handleEvenIfNotInFocus = 1
						else
							f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus + 1
						end
						f31_local2 = f31_arg1.dispatchChildren
						f31_arg1.dispatchChildren = false
						local f31_local3 = f31_arg0:getParent()
						f31_local0 = f31_local3:processEvent( f31_arg1 )
						f31_arg1.dispatchChildren = f31_local2
						f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus - 1
					end
				end
			end
			if not f31_local0 and f31_arg0.navigationByParent[f31_arg1.button] then
				if not f31_arg1.handleEvenIfNotInFocus then
					f31_arg1.handleEvenIfNotInFocus = 1
				else
					f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus + 1
				end
				local f31_local2 = f31_arg1.dispatchChildren
				f31_arg1.dispatchChildren = false
				local f31_local3 = f31_arg0:getParent()
				f31_local0 = f31_local3:processEvent( f31_arg1 )
				f31_arg1.dispatchChildren = f31_local2
				f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus - 1
			end
			if not f31_local0 and f31_arg0.navigationPostParent[f31_arg1.button] then
				if f31_arg0.navigationPostParent[f31_arg1.button]:canFocus( FocusType.Gamepad ) then
					f31_local0 = LUI.UIElement.processNavigationEvent( f31_arg1.oldFocus, f31_arg1, f31_arg0.navigationPostParent[f31_arg1.button] )
				end
				if not f31_local0 then
					if not f31_arg1.handleEvenIfNotInFocus then
						f31_arg1.handleEvenIfNotInFocus = 1
					else
						f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus + 1
					end
					local f31_local2 = f31_arg1.dispatchChildren
					f31_arg1.dispatchChildren = false
					f31_local0 = f31_arg0.navigationPostParent[f31_arg1.button]:processEvent( f31_arg1 )
					f31_arg1.dispatchChildren = f31_local2
					f31_arg1.handleEvenIfNotInFocus = f31_arg1.handleEvenIfNotInFocus - 1
				end
			end
			f31_arg1.oldFocusRecursionCount = f31_arg1.oldFocusRecursionCount - 1
			if f31_arg1.oldFocusRecursionCount == 0 then
				f31_arg1.oldFocus = nil
				f31_arg1.oldFocusRecursionCount = nil
			end
			f31_arg0.uiElement_handleGamepadButton_recursionPreventionFlag = nil
		end
	end
	if f31_local0 and f31_arg1.qualifier == "mousewheel" then
		LUI.UIElement.lastMouseWheelTime = Engine.GetTimeMsecs()
	end
	return f31_local0
end

LUI.UIElement.disableTreeFocus = function ( f32_arg0, f32_arg1 )
	f32_arg0.m_disableTreeFocus = true
end

LUI.UIElement.enableTreeFocus = function ( f33_arg0, f33_arg1 )
	f33_arg0.m_disableTreeFocus = nil
end

LUI.UIElement.canFocus = function ( f34_arg0, f34_arg1 )
	local f34_local0 = f34_arg0.m_focusable
	if f34_local0 and f34_arg0.m_requireFocusType then
		f34_local0 = f34_arg1 == f34_arg0.m_requireFocusType
	end
	return f34_local0
end

LUI.UIElement.gainFocus = function ( f35_arg0, f35_arg1 )
	if f35_arg0:canFocus( f35_arg1.focusType ) then
		if not (f35_arg1.button == "up" or f35_arg1.button == "down") or LUI.floatingFocus.x == nil then
			LUI.floatingFocus.x = f35_arg0
		end
		if not (f35_arg1.button == "left" or f35_arg1.button == "right") or LUI.floatingFocus.y == nil then
			LUI.floatingFocus.y = f35_arg0
		end
		f35_arg0:setFocus( true )
	end
	if not f35_arg0.m_disableTreeFocus then
		f35_arg0:dispatchEventToChildren( f35_arg1 )
	end
end

LUI.UIElement.loseFocus = function ( f36_arg0, f36_arg1 )
	if f36_arg0.m_focusable and f36_arg0:isInFocus() then
		if f36_arg1.button == "left" or f36_arg1.button == "right" or LUI.floatingFocus.x == nil then
			LUI.floatingFocus.x = f36_arg0
		end
		if f36_arg1.button == "up" or f36_arg1.button == "down" or LUI.floatingFocus.y == nil then
			LUI.floatingFocus.y = f36_arg0
		end
		f36_arg0:setFocus( false )
	end
	f36_arg0:dispatchEventToChildren( f36_arg1 )
end

LUI.UIElement.processEvent = function ( f37_arg0, f37_arg1 )
	local f37_local0 = f37_arg0.m_eventHandlers[f37_arg1.name]
	if f37_local0 ~= nil then
	
	else
		return f37_arg0:dispatchEventToChildren( f37_arg1 )
	end
	while type( f37_local0 ) == "table" and f37_local0.isProperty do
		f37_local0 = f37_local0.func( f37_arg0.properties )
	end
	if f37_arg1.dispatchChildren then
		f37_arg0:dispatchEventToChildren( f37_arg1 )
	end
	return f37_local0( f37_arg0, f37_arg1 )
end

LUI.UIElement.dispatchEventToParent = function ( f38_arg0, f38_arg1 )
	local f38_local0 = f38_arg0:getParent()
	while f38_local0 do
		local f38_local1 = f38_local0.m_eventHandlers[f38_arg1.name]
		if f38_local1 then
		
		else
			f38_local0 = f38_local0:getParent()
		end
		while type( f38_local1 ) == "table" and f38_local1.isProperty do
			f38_local1 = f38_local1.func( f38_local0.properties )
		end
		if f38_arg1.dispatchChildren then
			f38_local0:dispatchEventToChildren( f38_arg1 )
		end
		return f38_local1( f38_local0, f38_arg1 )
	end
end

LUI.UIElement.dispatchEventToChildren = function ( f39_arg0, f39_arg1 )
	if f39_arg1.dispatchChildren == false then
		return 
	end
	local f39_local0 = f39_arg0:getFirstChild()
	while f39_local0 ~= nil do
		local f39_local1 = f39_local0:getNextSibling()
		local f39_local2 = f39_local0:processEvent( f39_arg1 )
		if f39_local2 then
			return f39_local2
		end
		f39_local0 = f39_local1
	end
end

LUI.UIElement.getRootParent = function ( f40_arg0 )
	return Engine.GetLuiRoot()
end

LUI.UIElement.dispatchEventToRoot = function ( f41_arg0, f41_arg1 )
	LUI.UIRoot.ProcessEvent( f41_arg0:getRootParent(), f41_arg1 )
end

LUI.UIElement.dispatchEventToAllOtherRoots = function ( f42_arg0, f42_arg1 )
	local f42_local0 = f42_arg0:getRootParent()
	for f42_local4, f42_local5 in pairs( LUI.roots ) do
		if f42_local0 ~= f42_local5 and f42_local5 ~= LUI.primaryRoot then
			f42_local5:processEvent( f42_arg1 )
		end
	end
end

LUI.UIElement.getRootController = function ( f43_arg0 )
	local f43_local0 = f43_arg0:getRootParent()
	return f43_local0.m_controllerIndex
end

LUI.UIElement.registerEventHandler = function ( f44_arg0, f44_arg1, f44_arg2 )
	f44_arg0.m_eventHandlers[f44_arg1] = f44_arg2
	if not f44_arg0.isaroot and LUI.EventCatcher.isDirectDispatchEventType( f44_arg1 ) then
		local f44_local0 = f44_arg0:getRootParent()
		f44_local0.eventCatcher:registerDirectDispatchHandler( f44_arg0, f44_arg1, f44_arg2 )
	end
end

LUI.UIElement.registerOmnvarHandler = function ( f45_arg0, f45_arg1, f45_arg2 )
	local f45_local0 = f45_arg0
	if not f45_arg0.isaroot then
		f45_local0 = f45_arg0:getRootParent()
	end
	f45_local0.eventCatcher:registerOmnvarHandler( f45_arg0, f45_arg1, f45_arg2 )
end

LUI.UIElement.registerDvarHandler = function ( f46_arg0, f46_arg1, f46_arg2 )
	local f46_local0 = f46_arg0
	if not f46_arg0.isaroot then
		f46_local0 = f46_arg0:getRootParent()
	end
	f46_local0.eventCatcher:registerDvarHandler( f46_arg0, f46_arg1, f46_arg2 )
end

LUI.UIElement.registerEventHandlerIfFree = function ( f47_arg0, f47_arg1, f47_arg2 )
	if f47_arg0.m_eventHandlers[f47_arg1] == nil then
		f47_arg0:registerEventHandler( f47_arg1, f47_arg2 )
	end
end

LUI.UIElement.registerAnyKeyEventHandler = function ( f48_arg0, f48_arg1 )
	for f48_local3, f48_local4 in ipairs( {
		"button_action",
		"button_secondary",
		"button_alt1",
		"button_alt2",
		"button_right_trigger",
		"button_left_trigger",
		"button_shoulderr",
		"button_shoulderl",
		"button_start",
		"button_select",
		"button_options",
		"button_r3",
		"button_l3",
		"key_insert"
	} ) do
		assert( not f48_arg0.m_eventHandlers[f48_local4], "Trying to bind AnyKey but this key is already registered " .. f48_local4 )
		f48_arg0.m_eventHandlers[f48_local4] = f48_arg1
	end
end

local f0_local0 = function ( f49_arg0, f49_arg1 )
	local f49_local0 = f49_arg0
	local f49_local1 = f49_arg1
	return function ( f50_arg0, f50_arg1 )
		local f50_local0, f50_local1 = nil
		return f49_local0( f50_arg0, f50_arg1 ) or f49_local1( f50_arg0, f50_arg1 )
	end
	
end

LUI.UIElement.addEventHandler = function ( f51_arg0, f51_arg1, f51_arg2 )
	if f51_arg0.m_eventHandlers[f51_arg1] then
		f51_arg0:registerEventHandler( f51_arg1, f0_local0( f51_arg2, f51_arg0.m_eventHandlers[f51_arg1] ) )
	else
		f51_arg0:registerEventHandler( f51_arg1, f51_arg2 )
	end
end

LUI.UIElement.makeFocusable = function ( f52_arg0 )
	f52_arg0.m_focusable = true
	if f52_arg0.navigation == nil then
		f52_arg0:initNavTables()
	end
end

LUI.UIElement.initNavTables = function ( f53_arg0 )
	f53_arg0.navigation = {}
	f53_arg0.navigationByParent = {}
	f53_arg0.navigationPostParent = {}
end

LUI.UIElement.makeNotFocusable = function ( f54_arg0 )
	f54_arg0.m_focusable = false
end

LUI.UIElement.isIDNamed = function ( f55_arg0 )
	if string.find( f55_arg0.id, "." ) then
		return true
	else
		return false
	end
end

LUI.UIElement.getFirstInFocus = function ( f56_arg0 )
	if f56_arg0:isInFocus() then
		return f56_arg0
	end
	local f56_local0 = f56_arg0:getFirstChild()
	while f56_local0 do
		local f56_local1 = f56_local0:getFirstInFocus()
		if f56_local1 then
			return f56_local1
		end
		f56_local0 = f56_local0:getNextSibling()
	end
end

LUI.UIElement.getAllFocusedChildren = function ( f57_arg0, f57_arg1 )
	if not f57_arg1 then
		f57_arg1 = {}
	end
	local f57_local0 = f57_arg0:getFirstChild()
	while f57_local0 do
		local f57_local1 = f57_local0:getNextSibling()
		if f57_local0:isInFocus() then
			f57_arg1[#f57_arg1 + 1] = f57_local0
		else
			f57_arg1 = f57_local0:getAllFocusedChildren( f57_arg1 )
		end
		f57_local0 = f57_local1
	end
	return f57_arg1
end

LUI.UIElement.isParentInFocus = function ( f58_arg0 )
	local f58_local0 = f58_arg0:getParent()
	if f58_local0 and f58_local0:isInFocus() then
		return true
	else
		return false
	end
end

LUI.UIElement.saveState = function ( f59_arg0 )
	if not f59_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f59_arg0:getFullID() )
		return 
	end
	local f59_local0 = Engine.GetLuiRoot()
	if f59_local0.savedMenuStates == nil then
		f59_local0.savedMenuStates = {}
	end
	f59_local0.savedMenuStates[f59_arg0.id] = {}
	for f59_local4, f59_local5 in ipairs( f59_arg0:getAllFocusedChildren() ) do
		if not f59_local5:isIDNamed() then
			error( "LUI Error: Tried to save menu state, but focused element has no name: " .. f59_local5:getFullID() )
			return 
		end
		f59_local0.savedMenuStates[f59_arg0.id][#f59_local0.savedMenuStates[f59_arg0.id] + 1] = {
			id = f59_local5.id,
			data = f59_local5.saveData
		}
	end
end

LUI.UIElement.setSavedStateFocusChild = function ( f60_arg0, f60_arg1, f60_arg2 )
	if not f60_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f60_arg0:getFullID() )
		return 
	end
	local f60_local0 = Engine.GetLuiRoot()
	if f60_local0.savedMenuStates == nil then
		f60_local0.savedMenuStates = {}
	end
	f60_local0.savedMenuStates[f60_arg0.id] = {}
	f60_local0.savedMenuStates[f60_arg0.id][1] = {
		id = f60_arg1,
		data = f60_arg2
	}
end

LUI.UIElement.getSavedStateFocusId = function ( f61_arg0, f61_arg1 )
	if not f61_arg0 then
		error( "LUI Error: Tried to get menu state, but element has no name." )
		return 
	elseif not f61_arg1 then
		f61_arg1 = 1
	end
	local f61_local0 = nil
	local f61_local1 = Engine.GetLuiRoot()
	if f61_local1.savedMenuStates ~= nil and f61_local1.savedMenuStates[f61_arg0] ~= nil and f61_local1.savedMenuStates[f61_arg0][f61_arg1] ~= nil then
		f61_local0 = f61_local1.savedMenuStates[f61_arg0][f61_arg1].id
	end
	return f61_local0
end

LUI.UIElement.clearSavedState = function ( f62_arg0 )
	if not f62_arg0:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. f62_arg0:getFullID() )
		return 
	end
	local f62_local0 = f62_arg0:getFirstChild()
	while f62_local0 do
		local f62_local1 = f62_local0:getNextSibling()
		f62_local0:clearSavedState()
		f62_local0 = f62_local1
	end
	local f62_local1 = Engine.GetLuiRoot()
	if f62_local1.savedMenuStates ~= nil then
		f62_local1.savedMenuStates[f62_arg0.id] = nil
	end
end

LUI.UIElement.restoreState = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
	if not f63_arg0:isIDNamed() then
		error( "LUI Error: Tried to restore menu state, but element has no name: " .. f63_arg0:getFullID() )
		return 
	end
	local f63_local0 = false
	local f63_local1 = 0
	local f63_local2 = Engine.GetLuiRoot()
	if f63_local2.savedMenuStates ~= nil and f63_local2.savedMenuStates[f63_arg0.id] ~= nil then
		f63_local0 = true
		for f63_local6, f63_local7 in ipairs( f63_local2.savedMenuStates[f63_arg0.id] ) do
			if f63_local7.id and f63_arg0:processEvent( {
				name = "restore_focus",
				id = f63_local7.id,
				data = f63_local7.data,
				isRefresh = f63_arg1,
				controller = f63_arg3 and f63_arg3.controller,
				flowType = f63_arg3 and f63_arg3.flowType
			} ) then
				f63_local1 = f63_local1 + 1
			end
		end
	end
	return f63_local0, f63_local1
end

LUI.UIElement.restoreFocus = function ( f64_arg0, f64_arg1 )
	local f64_local0 = f64_arg1.flowType and f64_arg1.flowType or FocusType.MenuFlow
	if f64_arg0.id == f64_arg1.id and f64_arg0:canFocus( FocusType.MenuFlow ) then
		if not f64_arg1.isRefresh or f64_arg1.isRefresh and not f64_arg0._isRefresh then
			local f64_local1 = f64_arg0
			local f64_local2 = f64_arg0.processEvent
			local f64_local3 = {
				name = "gain_focus",
				focusType = f64_local0,
				controller = f64_arg1 and f64_arg1.controller
			}
			if f64_arg1 then
				local f64_local4 = f64_arg1.duration
				local f64_local5 = f64_arg1.duration
			end
			f64_local3.duration = f64_local4 and f64_local5 or 0
			f64_local2( f64_local1, f64_local3 )
		end
		return true
	else
		return f64_arg0:dispatchEventToChildren( f64_arg1 )
	end
end

LUI.UIElement.buildState = function ( f65_arg0, f65_arg1, f65_arg2 )
	local f65_local0 = type( f65_arg0 )
	if f65_local0 == "function" then
		return LUI.UIElement.buildState( f65_arg0( f65_arg1, f65_arg2 ), f65_arg1, f65_arg2 )
	end
	assert( f65_local0 == "table", "Current state is not a table, did you forget {}?" )
	for f65_local4, f65_local5 in pairs( f65_arg0 ) do
		local f65_local6 = type( f65_local5 )
		if f65_local6 == "function" then
			f65_arg0[f65_local4] = f65_local5( f65_arg2 )
		end
		if f65_local6 == "table" and f65_local5.isProperty then
			f65_arg0[f65_local4] = f65_local5.func( f65_arg2 )
		else
			f65_arg0[f65_local4] = f65_local5
		end
	end
	return f65_arg0
end

LUI.UIElement.hasAnimationState = function ( f66_arg0, f66_arg1 )
	local f66_local0 = f66_arg0:hasAnimationStateInC( f66_arg1 )
	if not f66_local0 and f66_arg0.states then
		return f66_arg0.states[f66_arg1]
	else
		return f66_local0
	end
end

LUI.UIElement.animateToState = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4, f67_arg5, f67_arg6 )
	if f67_arg0.states ~= nil and f67_arg0.states[f67_arg1] then
		f67_arg0:registerAnimationState( f67_arg1, LUI.UIElement.buildState( f67_arg0.states[f67_arg1], nil, f67_arg0.properties ) )
		f67_arg0.states[f67_arg1] = nil
	end
	if f67_arg0:hasAnimationStateInC( f67_arg1 ) then
		f67_arg0:animateToStateInC( f67_arg1, f67_arg2, f67_arg3, f67_arg4, f67_arg5, f67_arg6 )
	end
end

LUI.UIElement.animationTimeLeft = function ( f68_arg0 )
	local f68_local0
	if f68_arg0.animationTimeLeftInC then
		f68_local0 = f68_arg0:animationTimeLeftInC()
		if not f68_local0 then
		
		else
			return f68_local0
		end
	end
	f68_local0 = 0
end

LUI.UIElement.animate = function ( f69_arg0, f69_arg1 )
	if f69_arg0:hasAnimationState( f69_arg1.animationStateName ) then
		f69_arg0:animateToState( f69_arg1.animationStateName, f69_arg1.duration, f69_arg1.easeIn, f69_arg1.easeOut, nil, f69_arg1.easing )
		if f69_arg1.animateChildren then
			f69_arg0:dispatchEventToChildren( f69_arg1 )
		end
	else
		f69_arg0:dispatchEventToChildren( f69_arg1 )
	end
end

LUI.UIElement.intAnimate = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3, f70_arg4, f70_arg5 )
	local f70_local0 = f70_arg0
	local f70_local1 = 2
	local f70_local2 = f70_arg1
	local f70_local3 = 0
	local f70_local4 = f70_arg2
	local f70_local5 = f70_arg3
	local f70_local6 = f70_arg5
	local f70_local7 = f70_arg4
	return function ( f71_arg0, f71_arg1 )
		if f70_local6 then
			local f71_local0 = f70_local1 - 1
			if f71_local0 == 0 then
				f71_local0 = #f70_local0
			end
			local f71_local1 = LUI.FormatAnimStateFinishStepEvent( f70_local0[f71_local0][1] )
			local f71_local2 = LUI.DeepCopy( f71_arg1 )
			f71_local2.name = f71_local1
			f71_arg0:processEvent( f71_local2 )
		end
		if #f70_local0 < f70_local1 then
			f70_local1 = 1
			f70_local3 = f70_local3 + 1
			if f70_local4 and f70_local4 <= f70_local3 then
				return 
			end
		end
		local f71_local0 = f70_local0[f70_local1]
		f71_arg0:registerEventHandler( f71_arg1.name, nil )
		if f70_local2 and not f71_arg0:isInFocus() and not f71_arg0:isParentInFocus() then
			return 
		elseif f71_arg1.interrupted then
			if Engine.GetDvarBool( "lui_print_anim_states" ) then
				local f71_local3 = "None"
				if f71_arg0.id ~= nil then
					f71_local3 = f71_arg0.id
				end
				DebugPrint( "LUI: Animation to state '" .. f71_local0[1] .. "' interrupted! id: " .. f71_local3 )
			end
			return 
		end
		local f71_local3 = LUI.FormatAnimStateFinishEvent( f71_local0[1] )
		local f71_local1 = f71_local0[2]
		if f70_local7 and f71_arg1.lateness < f71_local1 then
			f71_local1 = f71_local1 - f71_arg1.lateness
		end
		f71_arg0:animateToState( f71_local0[1], f71_local1, f71_local0[3], f71_local0[4], nil, f71_local0[6] )
		if not (f70_local4 == 0 and (f70_local1 == #f70_local0 or f70_local4 ~= 0)) or f70_local6 and f70_local1 == #f70_local0 then
			f71_arg0:registerEventHandler( f71_local3, REG14 )
		end
		if f70_local1 == #f70_local0 and f70_local4 == 0 and f70_local5 then
			f71_arg0:registerEventHandler( f71_local3, function ( element, event )
				element:close()
			end )
		end
		f70_local1 = f70_local1 + 1
	end
	
end

LUI.UIElement.animateInLoop = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3, f73_arg4, f73_arg5 )
	if Engine.GetDvarBool( "lui_print_anim_states" ) then
		local f73_local0 = "None"
		if f73_arg0.id ~= nil then
			f73_local0 = f73_arg0.id
		end
		DebugPrint( "LUI: AnimateLoop: id: " .. f73_local0 )
	end
	if Engine.GetDvarBool( "lui_print_anim_states" ) then
		for f73_local3, f73_local4 in ipairs( f73_arg1 ) do
			DebugPrint( "	->" .. f73_local4[1] )
		end
	end
	assert( f73_arg1 and #f73_arg1, "AnimateLoop does not have animation states!" )
	local f73_local0 = f73_arg1[1]
	local f73_local1 = LUI.FormatAnimStateFinishEvent( f73_local0[1] )
	if #f73_arg1 == 1 then
		DebugPrint( "LUI Warning: AnimateLoop only has one animation state! " .. f73_arg1[1][1] )
	else
		f73_arg0:registerEventHandler( f73_local1, LUI.UIElement.intAnimate( f73_arg1, f73_arg2, f73_arg3, nil, f73_arg4, f73_arg5 ) )
	end
	f73_arg0:animateToState( f73_local0[1], f73_local0[2], f73_local0[3], f73_local0[4], nil, f73_local0[6] )
end

LUI.UIElement.animateInSequence = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4, f74_arg5 )
	if Engine.GetDvarBool( "lui_print_anim_states" ) then
		local f74_local0 = "None"
		if f74_arg0.id ~= nil then
			f74_local0 = f74_arg0.id
		end
		DebugPrint( "LUI: AnimateSequence: id: " .. f74_local0 )
	end
	if Engine.GetDvarBool( "lui_print_anim_states" ) then
		for f74_local3, f74_local4 in ipairs( f74_arg1 ) do
			DebugPrint( "	->" .. f74_local4[1] )
		end
	end
	assert( f74_arg1 and #f74_arg1, "AnimateSequence does not have animation states!" )
	local f74_local0 = f74_arg1[1]
	local f74_local1 = LUI.FormatAnimStateFinishEvent( f74_local0[1] )
	if #f74_arg1 == 1 then
		DebugPrint( "LUI Warning: AnimateSequence only has one animation state! " .. f74_arg1[1][1] )
	else
		f74_arg0:registerEventHandler( f74_local1, LUI.UIElement.intAnimate( f74_arg1, f74_arg2, 0, f74_arg5, f74_arg3, f74_arg4 ) )
	end
	f74_arg0:animateToState( f74_local0[1], f74_local0[2], f74_local0[3], f74_local0[4], f74_local0[5], f74_local0[6] )
end

LUI.UIElement.rotateRandomly = function ( f75_arg0, f75_arg1 )
	if not f75_arg0.m_eventHandlers.rotate_randomly then
		f75_arg0:registerEventHandler( "rotate_randomly", LUI.UIElement.rotateRandomly )
		f75_arg0:addElement( LUI.UITimer.new( 2500, "rotate_randomly", false, f75_arg0 ) )
	end
	f75_arg0:registerAnimationState( "rotate_randomly", {
		xRot = math.random( -45, 45 ),
		yRot = math.random( -45, 45 )
	} )
	f75_arg0:animateToState( "rotate_randomly", 2500, true, true )
end

LUI.UIElement.ViewportAnimation = function ( f76_arg0, f76_arg1 )
	if not f76_arg0.viewportScaleTime then
		f76_arg0.viewportScaleTime = f76_arg1.timeElapsed
	else
		f76_arg0.viewportScaleTime = f76_arg0.viewportScaleTime + f76_arg1.timeElapsed
	end
	local f76_local0 = f76_arg0.viewportScaleTime / f76_arg1.scaleDuration
	if f76_local0 > 1 then
		f76_local0 = 1
		f76_arg1.timer:close()
		f76_arg0.viewportScaleTime = nil
	end
	local f76_local1 = f76_arg1.startScale + (f76_arg1.endScale - f76_arg1.startScale) * f76_local0
	Engine.SetViewport( f76_arg1.controller, 0, 0.5 - f76_local1 / 2, f76_local1 )
end

LUI.UIElement.animateViewport = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3, f77_arg4 )
	f77_arg0:addElement( LUI.UITimer.new( 1, {
		name = "viewport_animation",
		controller = f77_arg1,
		startScale = f77_arg2,
		endScale = f77_arg3,
		scaleDuration = f77_arg4
	}, false, f77_arg0 ) )
end

LUI.UIElement.delayCallFunc = function ( f78_arg0, f78_arg1, f78_arg2 )
	if not f78_arg1 or f78_arg1 == 0 then
		f78_arg2()
	else
		f78_arg0.timerIdx = (f78_arg0.timerIdx or 0) + 1
		local self = LUI.UITimer.new( f78_arg1, "delay_complete_" .. f78_arg0.timerIdx, nil, true )
		self.func = f78_arg2
		self.id = "delay_timer_" .. f78_arg0.timerIdx
		self:registerEventHandler( "delay_complete_" .. f78_arg0.timerIdx, function ( element, event )
			element.func()
			element:close()
		end )
		f78_arg0:addElement( self )
	end
end

LUI.UIElement.setClass = function ( f80_arg0, f80_arg1 )
	local f80_local0 = getmetatable( f80_arg0 )
	local f80_local1 = f80_local0.__newindex
	local f80_local2 = getmetatable( f80_local1 )
	if not f80_local2 then
		setmetatable( f80_local1, {
			__index = f80_arg1
		} )
	else
		f80_local2.__index = f80_arg1
	end
	local f80_local3 = getmetatable( f80_local1.m_eventHandlers )
	if not f80_local3 then
		setmetatable( f80_local1.m_eventHandlers, {
			__index = f80_arg1.m_eventHandlers
		} )
	else
		f80_local3.__index = f80_arg1.m_eventHandlers
	end
end

LUI.UIElement.m_eventHandlers = {
	mousemove = LUI.UIElement.MouseMoveEvent,
	mousedown = LUI.UIElement.MouseButtonEvent,
	mouseup = LUI.UIElement.MouseButtonEvent,
	gamepad_button = LUI.UIElement.GamepadButton,
	gain_focus = LUI.UIElement.gainFocus,
	lose_focus = LUI.UIElement.loseFocus,
	restore_focus = LUI.UIElement.restoreFocus,
	close = LUI.UIElement.close,
	animate = LUI.UIElement.animate,
	viewport_animation = LUI.UIElement.ViewportAnimation
}
LUI.UIElement.build = function ( f81_arg0, f81_arg1 )
	return LUI.UIElement.new()
end

LUI.UIElement.new = function ( f82_arg0 )
	local f82_local0 = ConstructLUIElement()
	LUI.UIElement.setClass( f82_local0, LUI.UIElement )
	f82_local0._scoped = LUI.ActiveScoped
	f82_local0:setLayoutCached( false )
	if not f82_arg0 then
		f82_local0:registerAnimationState( "default", LUI.UIElement.m_defaultAnimationState )
	else
		f82_local0:registerAnimationState( "default", f82_arg0 )
	end
	f82_local0:animateToState( "default" )
	return f82_local0
end

LUI.UIContainer.new = function ()
	return LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
end

LUI.UIElement.debugDraw = function ( f84_arg0, f84_arg1 )
	if not f84_arg1 then
		f84_arg1 = 10
	end
	f84_arg0:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		red = 0,
		blue = 0,
		green = 1,
		alpha = 0.2
	} ) )
	f84_arg0:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		red = 1,
		blue = 0,
		green = 0,
		alpha = 1,
		bottom = f84_arg1
	} ) )
	f84_arg0:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		red = 1,
		blue = 0,
		green = 0,
		alpha = 1,
		left = -1 * f84_arg1
	} ) )
	f84_arg0:addElement( LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		red = 1,
		blue = 0,
		green = 0,
		alpha = 1,
		top = -1 * f84_arg1
	} ) )
	f84_arg0:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		material = RegisterMaterial( "white" ),
		red = 1,
		blue = 0,
		green = 0,
		alpha = 1,
		right = f84_arg1
	} ) )
end

