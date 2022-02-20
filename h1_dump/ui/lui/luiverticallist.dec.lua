LUI.UIVerticalList = {}
LUI.UIVerticalNavigator = {}
LUI.UIVerticalList.AddSpacer = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f1_arg1
	} )
	self:setPriority( f1_arg2 )
	f1_arg0:addElement( self )
	return self
end

LUI.UIVerticalList.build = function ( f2_arg0, f2_arg1 )
	return LUI.UIVerticalList.new( f2_arg1.defaultState, f2_arg1.scrollByChildHeight, f2_arg1.disableOutsideChildren, f2_arg1.sendScrollEvents, f2_arg1 )
end

LUI.UIVerticalList.new = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	if not f3_arg4 then
		f3_arg4 = {}
	end
	local self = LUI.UIElement.new( f3_arg0 )
	self.id = "LUIVerticalList"
	self:setupUIVerticalList( f3_arg1, f3_arg2, f3_arg3 )
	self.addSpacer = LUI.UIVerticalList.AddSpacer
	self.addElement = LUI.UIVerticalList.AddElement
	self.insertElement = LUI.UIVerticalList.InsertElement
	self.removeElement = LUI.UIVerticalList.RemoveElement
	self.updateNavigation = LUI.UIVerticalList.UpdateNavigation
	LUI.UIVerticalList.SetNoWrap( self, f3_arg4.noWrap )
	local f3_local1
	if f3_arg4.blockRepeatWrap == nil then
		f3_local1 = true
	else
		f3_local1 = f3_arg4.blockRepeatWrap
	end
	self.blockRepeatWrap = f3_local1
	if f3_arg4.useStencil then
		self:setUseStencil( true )
	end
	self:registerEventHandler( "gain_focus", LUI.UIVerticalList.gainFocus )
	self:registerEventHandler( "update_navigation", function ( element, event )
		element:updateNavigation()
	end )
	return self
end

LUI.UIVerticalList.SetNoWrap = function ( f5_arg0, f5_arg1 )
	f5_arg0.noWrap = f5_arg1
end

LUI.UIVerticalNavigator.build = function ( f6_arg0, f6_arg1 )
	return LUI.UIVerticalNavigator.new()
end

LUI.UIVerticalNavigator.new = function ( f7_arg0 )
	local self = LUI.UIElement.new( f7_arg0 )
	self.id = "LUIVerticalNavigator"
	self.addSpacer = LUI.UIVerticalList.AddSpacer
	self.addElement = LUI.UIVerticalList.AddElement
	self.insertElement = LUI.UIVerticalList.InsertElement
	self.removeElement = LUI.UIVerticalList.RemoveElement
	self.updateNavigation = LUI.UIVerticalList.UpdateNavigation
	self:registerEventHandler( "gain_focus", LUI.UIVerticalList.gainFocus )
	self:registerEventHandler( "update_navigation", function ( element, event )
		element:updateNavigation()
	end )
	return self
end

LUI.UIVerticalList.AddElement = function ( f9_arg0, f9_arg1 )
	LUI.UIElement.addElement( f9_arg0, f9_arg1 )
	f9_arg1:initNavTables()
	f9_arg0:setLayoutCached( false )
	f9_arg0:updateNavigation()
end

LUI.UIVerticalList.InsertElement = function ( f10_arg0, f10_arg1, f10_arg2 )
	LUI.UIElement.insertElement( f10_arg0, f10_arg1, f10_arg2 )
	f10_arg1:initNavTables()
	f10_arg0:setLayoutCached( false )
	f10_arg0:updateNavigation()
end

LUI.UIVerticalList.RemoveElement = function ( f11_arg0, f11_arg1 )
	LUI.UIElement.removeElement( f11_arg0, f11_arg1 )
	f11_arg0:setLayoutCached( false )
	f11_arg0:updateNavigation()
end

LUI.UIVerticalList.UpdateNavigation = function ( f12_arg0 )
	local f12_local0, f12_local1 = nil
	local f12_local2 = f12_arg0:getFirstChild()
	while f12_local2 ~= nil do
		if f12_local2:canFocus( FocusType.ListSelection ) then
			if f12_local0 == nil then
				f12_local0 = f12_local2
			end
			if f12_local1 ~= nil then
				f12_local1.navigation.down = f12_local2
				f12_local2.navigation.up = f12_local1
			else
				f12_local2.navigation.up = nil
			end
			if f12_local2.navigation ~= nil and f12_arg0.navigation ~= nil then
				f12_local2.navigation.left = f12_arg0.navigation.left
				f12_local2.navigation.right = f12_arg0.navigation.right
			end
			f12_local1 = f12_local2
		end
		f12_local2.canRepeatWrapUp = false
		f12_local2.canRepeatWrapDown = false
		f12_local2 = f12_local2:getNextSibling()
	end
	if f12_local1 ~= nil then
		if f12_arg0.navigation ~= nil and f12_arg0.navigation.down ~= nil and f12_arg0.navigation.down:canFocus( FocusType.ListSelection ) == true then
			f12_local1.navigation.down = f12_arg0.navigation.down
			f12_arg0.navigation.down.navigation.up = f12_local1
		elseif f12_local1 ~= f12_local0 and not f12_arg0.noWrap then
			f12_local1.navigation.down = f12_local0
			f12_local1.navigation.wrapTarget = {
				down = f12_local0
			}
		else
			f12_local1.navigation.down = nil
		end
		if f12_arg0.navigation ~= nil and f12_arg0.navigation.up ~= nil and f12_arg0.navigation.up:canFocus( FocusType.ListSelection ) == true then
			f12_local0.navigation.up = f12_arg0.navigation.up
			f12_arg0.navigation.up.navigation.down = f12_local0
		elseif f12_local1 ~= f12_local0 and not f12_arg0.noWrap then
			f12_local0.navigation.up = f12_local1
			f12_local0.navigation.wrapTarget = {
				up = f12_local1
			}
		else
			f12_local0.navigation.up = nil
		end
	end
	if f12_arg0.blockRepeatWrap then
		if f12_local0 ~= nil then
			f12_local0.canRepeatWrapUp = true
		end
		if f12_local1 ~= nil then
			f12_local1.canRepeatWrapDown = true
		end
	end
end

LUI.UIVerticalList.gainFocus = function ( f13_arg0, f13_arg1 )
	local f13_local0, f13_local1 = f13_arg0:restoreState( nil, nil, f13_arg1 )
	if f13_local1 == 0 then
		local f13_local2, f13_local3 = nil
		local f13_local4 = f13_arg0:getFirstChild()
		while f13_local4 ~= nil do
			if f13_local4:canFocus( FocusType.ListSelection ) then
				if f13_local2 == nil then
					f13_local2 = f13_local4
				end
				if f13_local3 == nil and f13_local4.listDefaultFocus then
					f13_local3 = f13_local4
				end
			end
		end
		if f13_local3 ~= nil then
			f13_local3:processEvent( f13_arg1 )
		elseif f13_local2 ~= nil then
			f13_local2:processEvent( f13_arg1 )
		else
			
		end
		f13_local4 = f13_local4:getNextSibling()
	end
end

LUI.UIVerticalList.SetChildFocus = function ( f14_arg0, f14_arg1 )
	local f14_local0 = 1
	local f14_local1 = f14_arg0:getFirstChild()
	while f14_local0 ~= f14_arg1 and f14_local1 ~= nil do
		f14_local1 = f14_local1:getNextSibling()
		f14_local0 = f14_local0 + 1
	end
	if f14_local1 and f14_local1:canFocus( FocusType.ListSelection ) then
		f14_local1:processEvent( {
			name = "gain_focus"
		} )
	end
	return f14_local1
end

LUI.UIVerticalList.getHeightOfChildren = function ( f15_arg0, f15_arg1 )
	local f15_local0 = f15_arg0:getRect()
	local f15_local1 = f15_arg1 or 0
	if f15_local0 then
		local f15_local2 = f15_arg0:getFirstChild()
		local f15_local3
		if f15_local2 then
			f15_local3 = -f15_local1
			if not f15_local3 then
				f15_local3 = 0
				while f15_local2 do
					local f15_local4 = nil
					if f15_local2.getText and f15_local2:getText() then
						local f15_local5 = nil
						f15_local5, f15_local4 = f15_local2:getElementTextDims()
					else
						f15_local4 = f15_local2:getHeight()
					end
					f15_local3 = f15_local3 + f15_local1 + f15_local4
					f15_local2 = f15_local2:getNextSibling()
				end
				return f15_local3
			end
		else
			f15_local3 = 0
			while f15_local2 do
				local f15_local4 = nil
				if f15_local2.getText and f15_local2:getText() then
					local f15_local5 = nil
					f15_local5, f15_local4 = f15_local2:getElementTextDims()
				else
					f15_local4 = f15_local2:getHeight()
				end
				f15_local3 = f15_local3 + f15_local1 + f15_local4
				f15_local2 = f15_local2:getNextSibling()
			end
			return f15_local3
		end
	else
		
	end
end

