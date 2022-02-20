LUI.UIHorizontalList = {}
LUI.UIHorizontalNavigator = {}
LUI.UIHorizontalAlignGroup = {}
local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f1_arg1,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:setPriority( f1_arg2 )
	f1_arg0:addElement( self )
	return self
end

LUI.UIHorizontalList.build = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {} )
	LUI.UIHorizontalList.SetNoWrap( self, controller.noWrap )
	self.useMouseWheel = controller.useMouseWheel
	return self
end

LUI.UIHorizontalList.new = function ( f3_arg0 )
	local self = LUI.UIElement.new( f3_arg0 )
	self.id = "LUIHorizontalList"
	self:setupUIHorizontalList()
	self.addSpacer = f0_local0
	self.addElement = LUI.UIHorizontalList.AddElement
	self.removeElement = LUI.UIHorizontalList.RemoveElement
	self.updateNavigation = LUI.UIHorizontalList.UpdateNavigation
	self:registerEventHandler( "gain_focus", LUI.UIHorizontalList.gainFocus )
	self:registerEventHandler( "update_navigation", function ( element, event )
		element:updateNavigation()
	end )
	return self
end

LUI.UIHorizontalNavigator.build = function ( menu, controller )
	local self = LUI.UIHorizontalNavigator.new( {}, controller.noWrap )
	LUI.UIHorizontalList.SetNoWrap( self, controller.noWrap )
	return self
end

LUI.UIHorizontalNavigator.new = function ( f6_arg0 )
	local self = LUI.UIElement.new( f6_arg0 )
	self.id = "LUIHorizontalList"
	self.addSpacer = f0_local0
	self.addElement = LUI.UIHorizontalList.AddElement
	self.removeElement = LUI.UIHorizontalList.RemoveElement
	self.updateNavigation = LUI.UIHorizontalList.UpdateNavigation
	self:registerEventHandler( "gain_focus", LUI.UIHorizontalList.gainFocus )
	self:registerEventHandler( "update_navigation", function ( element, event )
		element:updateNavigation()
	end )
	return self
end

LUI.UIHorizontalList.SetNoWrap = function ( f8_arg0, f8_arg1 )
	f8_arg0.noWrap = f8_arg1
end

LUI.UIHorizontalAlignGroup.build = function ( f9_arg0, f9_arg1 )
	return LUI.UIHorizontalAlignGroup.new( nil )
end

LUI.UIHorizontalAlignGroup.new = function ( f10_arg0 )
	local self = LUI.UIElement.new( f10_arg0 )
	self.id = "LUIHorizontalAlignGroup"
	self.focusable = true
	self:setupUIHorizontalList()
	self.building = true
	return self
end

LUI.UIHorizontalList.AddElement = function ( f11_arg0, f11_arg1 )
	LUI.UIElement.addElement( f11_arg0, f11_arg1 )
	f11_arg1:initNavTables()
	f11_arg0:setLayoutCached( false )
	f11_arg0:updateNavigation()
end

LUI.UIHorizontalList.RemoveElement = function ( f12_arg0, f12_arg1 )
	LUI.UIElement.removeElement( f12_arg0, f12_arg1 )
	f12_arg0:setLayoutCached( false )
	f12_arg0:updateNavigation()
end

LUI.UIHorizontalList.UpdateNavigation = function ( f13_arg0 )
	local f13_local0, f13_local1 = nil
	local f13_local2
	if Engine.IsConsoleGame() or f13_arg0.properties == nil or f13_arg0.properties.useMouseWheel ~= true then
		f13_local2 = false
	else
		f13_local2 = true
	end
	local f13_local3 = f13_arg0:getFirstChild()
	while f13_local3 ~= nil do
		if f13_local3:canFocus( FocusType.ListSelection ) then
			if f13_local0 == nil then
				f13_local0 = f13_local3
			end
			if f13_local1 ~= nil then
				f13_local1.navigation.right = f13_local3
				f13_local3.navigation.left = f13_local1
			else
				f13_local3.navigation.left = nil
			end
			if f13_local3.navigation ~= nil and f13_arg0.navigation ~= nil and not f13_local2 then
				f13_local3.navigation.down = f13_arg0.navigation.down
				f13_local3.navigation.up = f13_arg0.navigation.up
			end
			f13_local3.canRepeatWrapLeft = false
			f13_local3.canRepeatWrapRight = false
			f13_local1 = f13_local3
		end
		f13_local3 = f13_local3:getNextSibling()
	end
	if f13_local1 ~= nil then
		if f13_arg0.navigation ~= nil and f13_arg0.navigation.right ~= nil and f13_arg0.navigation.right:canFocus( FocusType.ListSelection ) == true then
			f13_local1.navigation.right = f13_arg0.navigation.right
			f13_arg0.navigation.right.navigation.left = f13_local1
		elseif f13_local1 ~= f13_local0 and not f13_arg0.noWrap then
			f13_local1.navigation.right = f13_local0
		else
			f13_local1.navigation.right = nil
		end
		if f13_arg0.navigation ~= nil and f13_arg0.navigation.left ~= nil and f13_arg0.navigation.left:canFocus( FocusType.ListSelection ) == true then
			f13_local0.navigation.left = f13_arg0.navigation.left
			f13_arg0.navigation.left.navigation.right = f13_local0
		elseif f13_local1 ~= f13_local0 and not f13_arg0.noWrap then
			f13_local0.navigation.left = f13_local1
		else
			f13_local0.navigation.left = nil
		end
	end
	if f13_local0 ~= nil then
		f13_local0.canRepeatWrapLeft = true
	end
	if f13_local1 ~= nil then
		f13_local1.canRepeatWrapRight = true
	end
	if f13_local2 then
		local f13_local4 = f13_arg0:getFirstChild()
		while f13_local4 ~= nil do
			f13_local4.navigation.up = f13_local4.navigation.left
			f13_local4.navigation.down = f13_local4.navigation.right
			f13_local4 = f13_local4:getNextSibling()
		end
	end
end

LUI.UIHorizontalList.gainFocus = function ( f14_arg0, f14_arg1 )
	local f14_local0, f14_local1 = f14_arg0:restoreState( nil, nil, f14_arg1 )
	if f14_local1 == 0 then
		local f14_local2, f14_local3 = nil
		local f14_local4 = f14_arg0:getFirstChild()
		while f14_local4 ~= nil do
			if f14_local4:canFocus( FocusType.ListSelection ) then
				if f14_local2 == nil then
					f14_local2 = f14_local4
				end
				if f14_local3 == nil and f14_local4.listDefaultFocus then
					f14_local3 = f14_local4
				end
			end
		end
		if f14_local3 ~= nil then
			f14_local3:processEvent( f14_arg1 )
		elseif f14_local2 ~= nil then
			f14_local2:processEvent( f14_arg1 )
		else
			
		end
		f14_local4 = f14_local4:getNextSibling()
	end
end

