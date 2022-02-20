local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.GroupedOptionsBase = InheritFrom( LUI.MenuTemplate )
LUI.GroupedOptionsBase.MenuWidth = GenericMenuDims.menu_right_standard - GenericMenuDims.menu_left
LUI.GroupedOptionsBase.BetweenMenuSpace = 52
LUI.GroupedOptionsBase.SubMenuLeft = LUI.GroupedOptionsBase.MenuWidth + LUI.GroupedOptionsBase.BetweenMenuSpace
LUI.GroupedOptionsBase.SubMenuTop = LUI.MenuTemplate.ListTop
function ElementChangeFocus( f1_arg0, f1_arg1 )
	local f1_local0
	if f1_arg1 then
		f1_local0 = "gain_focus"
		if not f1_local0 then
		
		else
			f1_arg0:processEvent( {
				name = f1_local0,
				immediate = true
			} )
		end
	end
	f1_local0 = "lose_focus"
end

LUI.GroupedOptionsBase.LeaveSubMenu = function ( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
	f2_local0.buttonToGoBackTo = nil
	Engine.PlaySound( CoD.SFX.SelectBack )
	f2_arg0:dispatchEventToRoot( {
		name = "button_unpin",
		immediate = true
	} )
	f2_local0.lockedButton = nil
	ElementChangeFocus( f2_arg0.subMenu, false )
	ElementChangeFocus( f2_arg0, true )
	f2_arg1:processEvent( {
		name = "gain_focus",
		immediate = true
	} )
end

LUI.GroupedOptionsBase.UpdateSubMenu = function ( f3_arg0, f3_arg1 )
	
end

LUI.GroupedOptionsBase.CheckUpdateSubMenu = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = nil
	if Engine.IsConsoleGame() then
		f4_local0 = f4_arg2.name == "button_over"
	elseif f4_arg2.name ~= "button_action" and (f4_arg2.name ~= "button_over" or f4_arg2.focusType == FocusType.MouseOver) then
		f4_local0 = false
	else
		f4_local0 = true
	end
	if f4_local0 then
		local f4_local1 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg0 )
		if f4_local1.lockedButton then
			f4_arg0.menuButtons[f4_local1.lockedButton]:processEvent( {
				name = "button_unpin"
			} )
			f4_local1.lockedButton = nil
		end
		f4_arg0.subMenu:clearSavedState()
		f4_arg0:UpdateSubMenu( f4_arg1 )
	end
end

LUI.GroupedOptionsBase.OnMainButtonSelect = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0:CheckUpdateSubMenu( f5_arg2.subOptionsData, f5_arg1 )
	local f5_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f5_arg0 )
	local f5_local1 = f5_arg2.subOptionsData.buttonIdx
	f5_arg0.list:dispatchEventToChildren( {
		name = "button_unpin",
		immediate = true
	} )
	if not f5_arg1.mouse then
		f5_local0.buttonToGoBackTo = f5_local1
		ElementChangeFocus( f5_arg0, false )
		ElementChangeFocus( f5_arg0.subMenu, true )
	end
	f5_local0.lockedButton = f5_local1
	f5_arg2:processEvent( {
		name = "button_pin"
	} )
end

LUI.GroupedOptionsBase.OnMainButtonFocus = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f6_arg0 )
	f6_local0.buttonToGoBackTo = nil
	f6_arg0:CheckUpdateSubMenu( f6_arg1, f6_arg2 )
end

LUI.GroupedOptionsBase.DoBackAction = function ( f7_arg0, f7_arg1 )
	local f7_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f7_arg0 )
	if f7_local0.buttonToGoBackTo ~= nil then
		f7_arg0:LeaveSubMenu( f7_arg0.menuButtons[f7_local0.buttonToGoBackTo] )
	else
		f7_arg0:leaveMenuFunc( f7_arg1 )
	end
end

LUI.GroupedOptionsBase.InitLockedButton = function ( f8_arg0 )
	local f8_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f8_arg0 )
	if f8_local0.lockedButton ~= nil then
		local f8_local1 = f8_arg0.menuButtons[f8_local0.lockedButton]
		f8_local1:processEvent( {
			name = "lose_focus"
		} )
		f8_local1:processEvent( {
			name = "button_pin"
		} )
	end
end

LUI.GroupedOptionsBase.OnGainFocus = function ( f9_arg0, f9_arg1 )
	local f9_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f9_arg0 )
	if f9_local0.lockedButton == nil then
		f9_arg0.list:processEvent( f9_arg1 )
	end
	f9_arg0:InitLockedButton()
end

LUI.GroupedOptionsBase.OnRestoreFocus = function ( f10_arg0, f10_arg1 )
	LUI.UIElement.restoreFocus( f10_arg0, f10_arg1 )
	f10_arg0:InitLockedButton()
end

LUI.GroupedOptionsBase.InitOptionsMenu = function ( f11_arg0, f11_arg1, f11_arg2, subMenu, f11_arg4, f11_arg5 )
	if f11_arg5 == nil then
		f11_arg5 = MBh.LeaveMenu()
	end
	f11_arg0.leaveMenuFunc = f11_arg5
	f11_arg0.menuButtons = f11_arg1
	f11_arg0:AddBackButton( function ( f12_arg0, f12_arg1 )
		f11_arg0:DoBackAction( f12_arg1 )
	end )
	for f11_local0 = 1, #f11_arg1, 1 do
		local f11_local3 = f11_arg1[f11_local0]
		f11_local3.subOptionsData = f11_arg2[f11_local0]
		f11_local3.subOptionsData.buttonIdx = f11_local0
		f11_local3:addEventHandler( "button_over", function ( f13_arg0, f13_arg1 )
			f11_arg0:OnMainButtonFocus( f13_arg0.subOptionsData, f13_arg1 )
		end )
		f11_local3.properties.button_action_func = function ( f14_arg0, f14_arg1 )
			f11_arg0:OnMainButtonSelect( f14_arg1, f11_local3 )
		end
		
	end
	if f11_arg4 ~= nil and f11_arg4 > 0 then
		f11_arg0:AddMenuDescription( f11_arg4 )
	end
	f11_arg0:addElement( subMenu )
	f11_arg0.subMenu = subMenu
	
end

LUI.GroupedOptionsBase.new = function ( f15_arg0, f15_arg1 )
	local f15_local0 = nil
	if not Engine.IsMultiplayer() then
		f15_local0 = LUI.MenuTemplate.spMenuOffset
	end
	local f15_local1 = LUI.MenuTemplate.new( f15_arg0, {
		menu_title = f15_arg1.menu_title,
		menu_width = LUI.GroupedOptionsBase.MenuWidth,
		menu_top_indent = f15_local0
	} )
	f15_local1:setClass( LUI.GroupedOptionsBase )
	f15_local1:registerEventHandler( "gain_focus", LUI.GroupedOptionsBase.OnGainFocus )
	f15_local1:registerEventHandler( "restore_focus", LUI.GroupedOptionsBase.OnRestoreFocus )
	return f15_local1
end

LockTable( _M )
