local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
PushAndPopsTable = {}
function new()
	local f1_local0 = {}
	setmetatable( f1_local0, {
		__index = _M
	} )
	f1_local0.menuInfoStack = {}
	f1_local0.debug = true
	f1_local0.flowEvents = {}
	f1_local0.menuInfoData = {}
	setmetatable( f1_local0.menuInfoData, {
		__mode = "k"
	} )
	return f1_local0
end

function RegisterStackPushBehaviour( f2_arg0, f2_arg1 )
	PushAndPopsTable[f2_arg0] = PushAndPopsTable[f2_arg0] or {}
	PushAndPopsTable[f2_arg0].pushFunc = f2_arg1 or PushAndPopsTable[f2_arg0].pushFunc
end

function RegisterStackPopBehaviour( f3_arg0, f3_arg1 )
	PushAndPopsTable[f3_arg0] = PushAndPopsTable[f3_arg0] or {}
	PushAndPopsTable[f3_arg0].popFunc = f3_arg1 or PushAndPopsTable[f3_arg0].popFunc
end

function RegisterStackResumeBehaviour( f4_arg0, f4_arg1 )
	PushAndPopsTable[f4_arg0] = PushAndPopsTable[f4_arg0] or {}
	PushAndPopsTable[f4_arg0].resumeFunc = f4_arg1 or PushAndPopsTable[f4_arg0].resumeFunc
end

function RegisterMenuStack( f5_arg0, f5_arg1 )
	PushAndPopsTable[f5_arg0] = PushAndPopsTable[f5_arg0] or {}
	PushAndPopsTable[f5_arg0].stackMenuList = f5_arg1 or PushAndPopsTable[f5_arg0].stackMenuList
end

function tryAddMouseCursor( f6_arg0 )
	if Engine.UsesMouseCursor() and not f6_arg0:getChildById( "mouse_cursor" ) then
		f6_arg0:addElement( LUI.UIMouseCursor.new( {
			material = RegisterMaterial( "ui_cursor" )
		} ) )
	end
end

function GetMenuBuildProps( f7_arg0, f7_arg1 )
	local f7_local0 = {}
	if f7_arg0.menuInfoData[f7_arg1] and f7_arg0.menuInfoData[f7_arg1].buildData then
		f7_local0 = f7_arg0.menuInfoData[f7_arg1].buildData
	end
	f7_local0.exclusiveController = f7_arg1.exclusiveControllerIndex
	return f7_local0
end

function SetMenuBuildProps( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0.menuInfoData[f8_arg1] = f8_arg0.menuInfoData[f8_arg1] or {}
	f8_arg0.menuInfoData[f8_arg1].buildData = f8_arg2
end

function SetNextMapToLoad( f9_arg0 )
	local f9_local0 = Engine.GetLuiRoot()
	f9_local0.flowManager.nextMapToLoad = f9_arg0
end

function GetNextMapToLoad()
	local f10_local0 = Engine.GetLuiRoot()
	return f10_local0.flowManager.nextMapToLoad
end

function GetMenuScopedData( f11_arg0, f11_arg1 )
	if not f11_arg0.menuInfoData[f11_arg1] then
		f11_arg0.menuInfoData[f11_arg1] = {}
	end
	if not f11_arg0.menuInfoData[f11_arg1].scopedData then
		f11_arg0.menuInfoData[f11_arg1].scopedData = {}
	end
	return f11_arg0.menuInfoData[f11_arg1].scopedData
end

function GetMenuScopedDataFromElement( f12_arg0 )
	if f12_arg0._scoped then
		return f12_arg0._scoped
	else
		local f12_local0 = f12_arg0:getParent()
		if f12_local0 then
			return GetMenuScopedDataFromElement( f12_local0 )
		else
			DebugPrint( "WARNING: could not find scoped data for supplied menu element. This is expected if you've just hit LUI Reload, otherwise not so much." )
			return {}
		end
	end
end

function GetTopMenuScopedData()
	local f13_local0 = Engine.GetLuiRoot()
	f13_local0 = f13_local0.flowManager
	return f13_local0:GetMenuScopedData( f13_local0.menuInfoStack[#f13_local0.menuInfoStack] )
end

function GetBottomMenuScopedData()
	local f14_local0 = Engine.GetLuiRoot()
	f14_local0 = f14_local0.flowManager
	return f14_local0:GetMenuScopedData( f14_local0.menuInfoStack[1] )
end

function GetMenuScopedDataByMenuName( f15_arg0 )
	local f15_local0 = Engine.GetLuiRoot()
	f15_local0 = f15_local0.flowManager
	for f15_local1 = #f15_local0.menuInfoStack, 1, -1 do
		local f15_local4 = f15_local0.menuInfoStack[f15_local1]
		if f15_local4.name == f15_arg0 then
			return f15_local0:GetMenuScopedData( f15_local4 )
		end
	end
	if f15_arg0 then
		DebugPrint( "WARNING: could not find scoped data for menu named " .. f15_arg0 .. ". This is expected if you've just hit LUI Reload, otherwise not so much." )
	end
	return {}
end

function IsTopSignInMenu( f16_arg0 )
	local f16_local0 = false
	local f16_local1 = f16_arg0.flowManager
	if f16_local1.menuInfoStack then
		local f16_local2 = f16_local1.menuInfoStack[#f16_local1.menuInfoStack]
		if f16_local2 and f16_local2.menu and f16_local2.menu.isSignInMenu then
			f16_local0 = true
		end
	end
	return f16_local0
end

function IsExclusiveMenu( f17_arg0, f17_arg1 )
	local f17_local0 = false
	local f17_local1 = f17_arg0.flowManager
	if f17_local1.menuInfoStack then
		local f17_local2 = f17_local1.menuInfoStack[#f17_local1.menuInfoStack]
		if f17_local2 and f17_local2.menu and f17_local2.menu.m_ownerController and f17_local2.menu.m_ownerController == f17_arg1 then
			f17_local0 = true
		end
	end
	return f17_local0
end

function PushMenuInfo( f18_arg0, f18_arg1, f18_arg2 )
	if f18_arg1.isModal or #f18_arg0.menuInfoStack == 0 then
		table.insert( f18_arg0.menuInfoStack, f18_arg1 )
	else
		local f18_local0 = #f18_arg0.menuInfoStack + 1
		while f18_local0 > 1 and f18_arg0.menuInfoStack[f18_local0 - 1].isModal do
			f18_local0 = f18_local0 - 1
		end
		if f18_arg2 then
			f18_local0 = math.max( 1, f18_local0 - 1 )
		end
		table.insert( f18_arg0.menuInfoStack, f18_local0, f18_arg1 )
	end
	if not f18_arg2 and PushAndPopsTable[f18_arg1.name] and PushAndPopsTable[f18_arg1.name].stackMenuList then
		local f18_local0 = Engine.GetLuiRoot()
		local f18_local1 = {
			stackData = {}
		}
		local f18_local2 = PushAndPopsTable[f18_arg1.name].stackMenuList
		if type( f18_local2 ) == "function" then
			f18_local2 = f18_local2()
		end
		if f18_local2 then
			for f18_local3 = 1, #f18_local2, 1 do
				f18_local1.stackData[f18_local3] = {
					name = f18_local2[f18_local3]
				}
			end
			f18_arg0:setStack( f18_local0, f18_local1 )
		end
	end
	if PushAndPopsTable[f18_arg1.name] and PushAndPopsTable[f18_arg1.name].pushFunc then
		PushAndPopsTable[f18_arg1.name].pushFunc()
	end
	if #f18_arg0.menuInfoStack == 1 then
		local f18_local0 = Engine.GetLuiRoot()
		f18_local0:processEvent( {
			name = "non_empty_menu_stack"
		} )
	end
end

function PopMenuInfo( f19_arg0, f19_arg1 )
	local f19_local0 = nil
	local f19_local1 = #f19_arg0.menuInfoStack
	while f19_local1 >= 1 and (not (f19_arg1 or not f19_arg0.menuInfoStack[f19_local1].isModal) or f19_arg1 and f19_arg0.menuInfoStack[f19_local1] ~= f19_arg1) do
		f19_local1 = f19_local1 - 1
	end
	if f19_local1 >= 1 then
		f19_local0 = f19_arg0.menuInfoStack[f19_local1]
		if f19_local0 then
			if PushAndPopsTable[f19_local0.name] and PushAndPopsTable[f19_local0.name].popFunc then
				PushAndPopsTable[f19_local0.name].popFunc()
			end
			table.remove( f19_arg0.menuInfoStack, f19_local1 )
		end
	end
	if f19_local0 and #f19_arg0.menuInfoStack == 0 then
		local f19_local2 = Engine.GetLuiRoot()
		f19_local2:processEvent( {
			name = "empty_menu_stack"
		} )
	else
		local f19_local2 = f19_arg0.menuInfoStack[#f19_arg0.menuInfoStack]
		if f19_local2 and PushAndPopsTable[f19_local2.name] and PushAndPopsTable[f19_local2.name].resumeFunc then
			PushAndPopsTable[f19_local2.name].resumeFunc()
		end
	end
	return f19_local0
end

function GetTopMenuInfo( f20_arg0, f20_arg1 )
	local f20_local0 = nil
	local f20_local1 = #f20_arg0
	if not f20_arg1 then
	
	else
		if 1 <= f20_local1 then
			f20_local0 = f20_arg0[f20_local1]
		end
		return f20_local0
	end
	while 1 <= f20_local1 and f20_arg0[f20_local1].isModal do
		f20_local1 = f20_local1 - 1
	end
	if 1 <= f20_local1 then
		f20_local0 = f20_arg0[f20_local1]
	end
	return f20_local0
end

f0_local0 = function ( f21_arg0 )
	local f21_local0 = false
	local f21_local1 = f21_arg0[#f21_arg0]
	if f21_local1 and f21_local1.isModal then
		f21_local0 = true
	end
	return f21_local0
end

function IsTopMenuModal()
	local f22_local0 = Engine.GetLuiRoot()
	if not f22_local0 then
		return false
	else
		return f0_local0( f22_local0.flowManager.menuInfoStack )
	end
end

function IsElementAChildOf( f23_arg0, f23_arg1 )
	if not f23_arg0 or not f23_arg1 then
		return false
	end
	while f23_arg0 do
		if f23_arg0 == f23_arg1 then
			return true
		end
		f23_arg0 = f23_arg0:getParent()
	end
	return false
end

function CloseMenuInfo( f24_arg0, f24_arg1, f24_arg2 )
	if f24_arg1.menu then
		if not f24_arg2 then
			f24_arg1.menu:processEvent( {
				name = "lose_focus"
			} )
		end
		if not f24_arg2 or f24_arg1.menu.alwaysSendMenuClose then
			f24_arg1.menu:processEvent( {
				name = "menu_close",
				dispatchChildren = true,
				controller = f24_arg1.exclusiveControllerIndex
			} )
		end
		f24_arg1.menu:clearSavedState()
		f24_arg1.menu:closeTree()
		f24_arg1.menu:close()
		f24_arg1.menu = nil
	end
end

function RestoreMenuInfo( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
	local f25_local0 = false
	if f25_arg1.menu and f25_arg4 and f25_arg4.replaceTop then
		f25_arg1.menu:closeTree()
		f25_arg1.menu:close()
		f25_arg1.menu = nil
	end
	if not f25_arg1.menu then
		LUI.ActiveScoped = f25_arg0:GetMenuScopedData( f25_arg1 )
		f25_arg1.menu = LUI.MenuBuilder.buildMenu( f25_arg1.name, f25_arg0:GetMenuBuildProps( f25_arg1 ) )
		tryAddMouseCursor( f25_arg2 )
		f25_arg0.menuRoot:addElement( f25_arg1.menu )
		local f25_local1 = {
			name = "update_navigation",
			dispatchChildren = true
		}
		local f25_local2 = {
			name = "menu_create",
			dispatchChildren = true,
			controller = f25_arg1.exclusiveControllerIndex
		}
		if f25_arg4 ~= nil then
			f25_local2.userData = f25_arg4.userData
			f25_local1.userData = f25_arg4.userData
		end
		f25_arg1.menu:processEvent( f25_local1 )
		f25_arg1.menu:processEvent( f25_local2 )
		LUI.ActiveScoped = nil
		f25_local0 = true
	end
	if GetTopMenuInfo( f25_arg0.menuInfoStack, true ) == f25_arg1 then
		if f25_arg3 then
			f25_arg1.menu:processEvent( {
				name = "popup_inactive",
				dispatchChildren = true
			} )
		end
		local f25_local1, f25_local2 = f25_arg1.menu:restoreState( nil, nil, f25_arg4 )
		if not f25_local1 or f25_local2 == 0 then
			DebugPrint( "LUI Warning: no saved state found for menu " .. f25_arg1.name )
			f25_arg1.menu:processEvent( {
				name = "gain_focus",
				controller = f25_arg4 and f25_arg4.controller
			} )
		end
	elseif f25_local0 then
		f25_arg1.menu:processEvent( {
			name = "popup_active",
			dispatchChildren = true
		} )
	end
	return f25_arg1.menu
end

function CloseAllModalMenus( f26_arg0 )
	for f26_local0 = #f26_arg0.menuInfoStack, 1, -1 do
		local f26_local3 = f26_arg0.menuInfoStack[f26_local0]
		if f26_local3.menu and f26_local3.isModal then
			f26_arg0:CloseMenuInfo( f26_local3 )
			f26_arg0:PopMenuInfo( f26_local3 )
		end
	end
end

function CloseVisibleInStack( f27_arg0, f27_arg1 )
	local f27_local0 = true
	for f27_local1 = #f27_arg0.menuInfoStack, 1, -1 do
		local f27_local4 = f27_arg0.menuInfoStack[f27_local1]
		if f27_local4.menu and not f27_local4.isModal then
			if f27_local0 then
				if f27_arg1 then
					f27_arg0.previousMenuId = f27_local4.menu.id
					f27_local4.menu:clearSavedState()
				else
					f27_local4.menu:saveState()
				end
				f27_local4.menu:processEvent( {
					name = "lose_focus"
				} )
				LUI.PreviousMenuName = f27_local4.name
			end
			f27_local4.menu:processEvent( {
				name = "menu_close",
				dispatchChildren = true,
				controller = f27_local4.exclusiveControllerIndex
			} )
			f27_local4.menu:closeTree()
			f27_local4.menu:close()
			f27_local4.menu = nil
			f27_local0 = false
		end
	end
end

f0_local1 = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = {
		name = f28_arg0,
		menu = f28_arg1,
		isOldMenu = f28_arg2
	}
	setmetatable( f28_local0, {
		__mode = "v"
	} )
	return f28_local0
end

function printStack( f29_arg0 )
	DebugPrint( "Menu Stack:" )
	DebugPrint( "Top" )
	for f29_local0 = #f29_arg0.menuInfoStack, 1, -1 do
		local f29_local3 = f29_arg0.menuInfoStack[f29_local0]
		local f29_local4 = "Not Visible"
		local f29_local5 = ""
		if f29_local3.menu ~= nil then
			f29_local4 = "Visible"
		end
		if f29_local3.isOldMenuthen then
			f29_local5 = " Old Menu"
		end
		DebugPrint( f29_local0 .. ") " .. f29_local3.name .. " " .. f29_local4 .. f29_local5 )
	end
	DebugPrint( "Bottom" )
end

function setupRoot( f30_arg0, f30_arg1 )
	f30_arg0.menuRoot = f30_arg1
	f30_arg0.menuRoot = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0
	} )
	if not Engine.UsingSplitscreenUpscaling() then
		f30_arg0.menuRoot:setupLetterboxElement()
	end
	f30_arg0.menuRoot:setPriority( LUI.UIRoot.childPriorities.menuRoot )
	f30_arg1:addElement( f30_arg0.menuRoot )
	for f30_local3, f30_local4 in pairs( m_flowEvents ) do
		f30_arg1:registerEventHandler( f30_local3, f30_local4 )
	end
end

function RequestOldMenu( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	local f31_local0 = {
		name = "openOldMenu",
		menu = f31_arg1,
		replaceTop = f31_arg2,
		controller = f31_arg3
	}
	local f31_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f31_local1, true, "RequestOldMenu" )
	LUI.UIRoot.ProcessEvent( f31_local1, f31_local0 )
end

function RequestAddMenu( f32_arg0, f32_arg1, f32_arg2, f32_arg3, f32_arg4, f32_arg5, f32_arg6 )
	local f32_local0 = {
		name = "addmenu",
		menu = f32_arg1,
		exclusiveController = f32_arg2,
		controller = f32_arg3,
		replaceTop = f32_arg4,
		data = f32_arg5
	}
	local f32_local1
	if f32_arg6 then
		f32_local1 = f32_arg6.reload
		if not f32_local1 then
		
		else
			f32_local0.reload = f32_local1
			f32_local1 = LUI.MenuBuilder.getPopupData( f32_arg1 )
			if f32_local1 then
				f32_local0.immediate = f32_local1.immediateProcessing
			end
			local f32_local2 = Engine.GetLuiRoot()
			LUI.UIRoot.BlockButtonInput( f32_local2, true, "RequestAddMenu" )
			LUI.UIRoot.ProcessEvent( f32_local2, f32_local0 )
		end
	end
	f32_local1 = nil
end

function RequestPopupMenu( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5 )
	local f33_local0 = {
		name = "popupmenu",
		menu = f33_arg1,
		exclusiveController = f33_arg2,
		controller = f33_arg3,
		replaceTop = f33_arg4,
		data = f33_arg5,
		immediate = true
	}
	local f33_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f33_local1, true, "RequestPopupMenu " .. f33_arg1 )
	LUI.UIRoot.ProcessEvent( f33_local1, f33_local0 )
end

function RequestLeaveMenu( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
	local f34_local0 = {
		name = "leavemenu",
		element = f34_arg0,
		userData = f34_arg1,
		immediate = f34_arg2,
		controller = f34_arg3
	}
	local f34_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f34_local1, true, "RequestLeaveMenu" )
	LUI.UIRoot.ProcessEvent( f34_local1, f34_local0 )
	if not f34_arg4 then
		Engine.PlaySound( CoD.SFX.PauseMenuBack )
	end
end

function RequestLeaveMenuByName( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = {
		name = "leavemenu",
		menu = f35_arg0,
		userData = f35_arg1,
		immediate = f35_arg2
	}
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), true, "RequestLeaveMenuByName" )
	local f35_local1 = Engine.GetLuiRoot()
	f35_local1:processEvent( f35_local0 )
	if not f35_arg3 then
		Engine.PlaySound( CoD.SFX.PauseMenuBack )
	end
end

function RequestRestoreMenu( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4, f36_arg5 )
	local f36_local0 = {
		name = "restoreMenu",
		menu = f36_arg1,
		immediate = true,
		replaceTop = f36_arg4,
		exclusiveController = f36_arg2,
		controller = f36_arg3,
		userData = f36_arg5
	}
	local f36_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f36_local1, true, "RequestRestoreMenu" )
	LUI.UIRoot.ProcessEvent( f36_local1, f36_local0 )
end

function RequestCloseAllMenus( f37_arg0, f37_arg1 )
	DebugPrint( "FlowManager: RequestCloseAllMenus" )
	LUI.UIRoot.ProcessEvent( Engine.GetLuiRoot(), {
		name = "closeallmenus",
		menu = f37_arg1
	} )
	LUI.PreviousMenuName = nil
end

function RequestSetStack( f38_arg0, f38_arg1, f38_arg2 )
	if f38_arg2 == nil then
		f38_arg2 = true
	end
	LUI.UIRoot.ProcessEvent( Engine.GetLuiRoot(), {
		name = "setStack",
		stackData = f38_arg1,
		immediate = f38_arg2
	} )
end

function RequestAddMenuAndSetStack( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4, f39_arg5, f39_arg6 )
	local f39_local0 = {
		name = "addmenu_setstack",
		menu = f39_arg1,
		exclusiveController = f39_arg2,
		controller = f39_arg3,
		replaceTop = f39_arg4,
		data = f39_arg5,
		immediate = true,
		stackData = f39_arg6
	}
	local f39_local1 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f39_local1, true, "RequestAddMenuAndSetStack" )
	LUI.UIRoot.ProcessEvent( f39_local1, f39_local0 )
end

function openOldMenuHandler( f40_arg0, f40_arg1 )
	f40_arg0.flowManager:openOldMenu( f40_arg1, f40_arg0 )
	LUI.UIRoot.BlockButtonInput( f40_arg0, false, "openOldMenu" )
	LUI.UIRoot.BlockMouseMove( f40_arg0, false, "openOldMenu" )
end

function openOldMenu( f41_arg0, f41_arg1, f41_arg2 )
	local f41_local0 = f41_arg1.menu
	f41_arg0:CloseAllModalMenus()
	local f41_local1 = GetTopMenuInfo( f41_arg0.menuInfoStack )
	local self = LUI.UIElement.new()
	local f41_local3 = f0_local1( f41_local0, self, true )
	f41_arg0:CloseVisibleInStack( f41_arg1.replaceTop )
	local f41_local4 = f41_arg2:getChildById( "mouse_cursor" )
	if f41_local4 then
		f41_local4:close()
	end
	f41_arg0.menuRoot:addElement( self )
	if f41_arg1.replaceTop then
		f41_arg0:PopMenuInfo()
	end
	f41_arg0:PushMenuInfo( f41_local3 )
	if f41_arg0.debug then
		f41_arg0:printStack()
	end
	Engine.SetLuiInUse( false )
	Engine.OpenOldMenu( f41_local0, f41_arg1.controller, f41_arg1.ignorePriority )
	return f41_local3.menu
end

function closeAllMenusHandler( f42_arg0, f42_arg1 )
	DebugPrint( "FlowManager: handling close all menus" )
	f42_arg0.flowManager:closeAllMenus( f42_arg0, f42_arg1 )
end

function closeAllMenus( f43_arg0, f43_arg1, f43_arg2 )
	Engine.SetLuiInUse( false )
	for f43_local0 = #f43_arg0.menuInfoStack, 1, -1 do
		local f43_local3 = f43_arg0.menuInfoStack[f43_local0]
		f43_arg0:CloseMenuInfo( f43_local3, true )
		f43_arg0:PopMenuInfo( f43_local3 )
	end
	local f43_local0 = f43_arg1:getChildById( "mouse_cursor" )
	if f43_local0 then
		f43_local0:close()
	end
	f43_arg0.menuInfoStack = {}
end

function IsInStack( f44_arg0, f44_arg1 )
	local f44_local0 = false
	for f44_local4, f44_local5 in ipairs( f44_arg0.menuInfoStack ) do
		if f44_local5.name == f44_arg1 and not f44_local5.isOldMenu then
			f44_local0 = true
			break
		end
	end
	return f44_local0
end

function IsInStackRoot( f45_arg0 )
	local f45_local0 = Engine.GetLuiRoot()
	assert( f45_local0 )
	return IsInStack( f45_local0.flowManager, f45_arg0 )
end

function AnyActiveMenusInStack( f46_arg0 )
	local f46_local0 = f46_arg0.flowManager
	if f46_local0.menuInfoStack then
		for f46_local4, f46_local5 in ipairs( f46_local0.menuInfoStack ) do
			if f46_local5.menu ~= nil then
				return true
			end
		end
	end
	return false
end

function IsMenuOpenAndVisible( f47_arg0, f47_arg1 )
	local f47_local0 = f47_arg0.flowManager
	if f47_local0.menuInfoStack then
		for f47_local4, f47_local5 in ipairs( f47_local0.menuInfoStack ) do
			if f47_local5.name == f47_arg1 and f47_local5.menu ~= nil then
				return f47_local5.menu
			end
		end
	end
	return false
end

function IsMenuInStack( f48_arg0, f48_arg1 )
	local f48_local0 = f48_arg0.flowManager
	if f48_local0.menuInfoStack then
		for f48_local4, f48_local5 in ipairs( f48_local0.menuInfoStack ) do
			if f48_local5.name == f48_arg1 then
				return true
			end
		end
	end
	return false
end

function IsMenuTopmost( f49_arg0, f49_arg1 )
	local f49_local0 = f49_arg0.flowManager
	if f49_local0.menuInfoStack then
		local f49_local1 = f49_local0.menuInfoStack[#f49_local0.menuInfoStack]
		if f49_local1 ~= nil and f49_local1.name == f49_arg1 then
			return true
		end
	end
	return false
end

function GetTopOpenAndVisibleMenuName( f50_arg0 )
	local f50_local0 = nil
	if not f50_arg0 then
		f50_arg0 = Engine.GetLuiRoot()
	end
	if f50_arg0 then
		local f50_local1 = f50_arg0.flowManager
		if f50_local1.menuInfoStack then
			for f50_local5, f50_local6 in ipairs( f50_local1.menuInfoStack ) do
				if f50_local6.name and f50_local6.menu and not f50_local6.isModal then
					f50_local0 = f50_local6.name
				end
			end
		end
	end
	return f50_local0
end

function GetTopOpenAndVisibleMenu( f51_arg0 )
	local f51_local0 = nil
	if not f51_arg0 then
		f51_arg0 = Engine.GetLuiRoot()
	end
	if f51_arg0 then
		local f51_local1 = f51_arg0.flowManager
		if f51_local1.menuInfoStack then
			for f51_local5, f51_local6 in ipairs( f51_local1.menuInfoStack ) do
				if f51_local6.name and f51_local6.menu and not f51_local6.isModal then
					f51_local0 = f51_local6.menu
				end
			end
		end
	end
	return f51_local0
end

function restoreMenuHandler( f52_arg0, f52_arg1 )
	f52_arg0.flowManager:restoreMenu( f52_arg1, f52_arg0 )
	LUI.UIRoot.BlockButtonInput( f52_arg0, false, "restoreMenu" )
	LUI.UIRoot.BlockMouseMove( f52_arg0, false, "restoreMenu" )
end

function restoreMenu( f53_arg0, f53_arg1, f53_arg2 )
	local f53_local0 = f53_arg1.menu
	Engine.SetLuiInUse( true )
	if not IsInStack( f53_arg0, f53_local0 ) then
		return addMenu( f53_arg0, f53_arg1, f53_arg2 )
	end
	local f53_local1 = GetTopMenuInfo( f53_arg0.menuInfoStack, true )
	if f53_local1.name == f53_local0 then
		return f53_local1.menu
	end
	local f53_local2 = nil
	local f53_local3 = false
	for f53_local4 = #f53_arg0.menuInfoStack, 1, -1 do
		local f53_local7 = f53_arg0.menuInfoStack[f53_local4]
		if f53_local7.name ~= f53_local0 then
		
		else
			f53_local2 = f53_local7
			break
		end
		if f53_local7.isPopup then
			f53_local3 = true
		end
		f53_arg0:CloseMenuInfo( f53_local7 )
		f53_arg0:PopMenuInfo( f53_arg0.menuInfoStack[f53_local4] )
	end
	assert( f53_local2 )
	return f53_arg0:RestoreMenuInfo( f53_local2, f53_arg2, f53_local3, f53_arg1 )
end

f0_local2 = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
	local f54_local0 = f54_arg2.menu
	f54_local0:processEvent( {
		name = "update_navigation",
		dispatchChildren = true
	} )
	f54_local0:processEvent( {
		name = "menu_create",
		dispatchChildren = true,
		controller = f54_arg1
	} )
	if f54_arg2 == f54_arg0.menuInfoStack[#f54_arg0.menuInfoStack] then
		f54_local0:processEvent( {
			name = "gain_focus",
			controller = f54_arg1,
			focusType = FocusType.MenuFlow
		} )
	elseif not f54_arg2.isModal then
		f54_local0:processEvent( {
			name = "popup_active",
			dispatchChildren = true
		} )
	end
end

local f0_local3 = function ( f55_arg0, f55_arg1, f55_arg2 )
	local f55_local0 = f55_arg0.menuInfoStack[#f55_arg0.menuInfoStack]
	if f55_local0 then
		assert( f55_local0 ~= f55_arg1 )
		local f55_local1 = f55_local0.isModal
		if f55_local1 then
			f55_local1 = not f55_arg1.isModal
		end
		if f55_local0.menu and not f55_local1 then
			f55_local0.menu:saveState()
			f55_local0.menu:processEvent( {
				name = "lose_focus",
				immediate = true
			} )
			f55_local0.menu:processEvent( {
				name = "popup_active",
				dispatchChildren = true,
				popup_name = f55_arg2
			} )
		else
			for f55_local2 = #f55_arg0.menuInfoStack, 1, -1 do
				if f55_arg0.menuInfoStack[f55_local2].menu and not f55_arg0.menuInfoStack[f55_local2].isPopup then
					f55_arg0.menuInfoStack[f55_local2].menu:processEvent( {
						name = "popup_active",
						dispatchChildren = true,
						popup_name = f55_arg2
					} )
					break
				end
			end
		end
	end
end

function addMenuHandler( f56_arg0, f56_arg1 )
	f56_arg0.flowManager:addMenu( f56_arg1, f56_arg0 )
	LUI.UIRoot.BlockButtonInput( f56_arg0, false, "addMenu" )
	LUI.UIRoot.BlockMouseMove( f56_arg0, false, "addMenu" )
end

function addMenuAndSetStackHandler( f57_arg0, f57_arg1 )
	f57_arg0.flowManager:addMenu( f57_arg1, f57_arg0 )
	f57_arg0.flowManager:setStack( f57_arg0, f57_arg1 )
	LUI.UIRoot.BlockButtonInput( f57_arg0, false, "addMenu_setStack" )
	LUI.UIRoot.BlockMouseMove( f57_arg0, false, "addMenu_setStack" )
end

function addMenu( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = f58_arg1.menu
	local f58_local1 = IsMenuOpenAndVisible( f58_arg2, f58_local0 )
	local f58_local2 = LUI.MenuBuilder.getPopupData( f58_local0 )
	Engine.SetLuiInUse( true )
	local f58_local3 = nil
	if f58_arg1.exclusiveController and f58_arg1.controller ~= nil then
		if not Engine.IsControllerInUse( f58_arg1.controller ) then
			DebugPrint( "addMenu Failure: exclusiveController is not in use" )
			return 
		end
		DebugPrint( "Setting exclusiveControllerIndex to " .. tostring( f58_arg1.controller ) )
		f58_local3 = f58_arg1.controller
	end
	if f58_local1 and not f58_arg1.reload then
		return 
	end
	local f58_local4 = Engine.GetBytesFree()
	if not f58_local2 then
		f58_arg0:CloseVisibleInStack( f58_arg1.replaceTop )
	end
	local f58_local5 = f0_local1( f58_local0 )
	f58_arg0:SetMenuBuildProps( f58_local5, f58_arg1.data )
	f58_local5.exclusiveControllerIndex = f58_local3
	if f58_local2 then
		f58_local5.isPopup = true
		f58_local5.isModal = true
		if f58_arg1.replaceTop == true then
			DebugPrint( "Replacing top with a modal dialog is not supported!" )
		end
	elseif f58_arg1.replaceTop then
		f58_arg0:PopMenuInfo()
	end
	local f58_local6 = f58_arg0:GetMenuScopedData( f58_local5 )
	local f58_local7 = f58_arg0:GetMenuBuildProps( f58_local5 )
	if f58_local3 then
		f58_local6.exclusiveControllerIndex = f58_local3
	end
	for f58_local11, f58_local12 in pairs( f58_local7 ) do
		f58_local6[f58_local11] = f58_local12
	end
	LUI.ActiveScoped = f58_local6
	if f58_local5.isPopup then
		f0_local3( f58_arg0, f58_local5, f58_local0 )
	end
	f58_arg0:PushMenuInfo( f58_local5 )
	f58_local8 = LUI.MenuBuilder.buildMenu( f58_local0, f58_local7 )
	assert( f58_local8, "Could not build " .. f58_local0 )
	if f58_local2 then
		f58_local8:setPriority( f58_local2.priority )
	end
	f58_local5.menu = f58_local8
	f58_arg0.menuRoot:addElement( f58_local8 )
	tryAddMouseCursor( f58_arg2 )
	f0_local2( f58_arg0, f58_local3, f58_local5, f58_local0 )
	if f58_arg0.debug then
		f58_arg0:printStack()
	end
	f58_local9 = Engine.GetBytesFree()
	if not Engine.BBPrint( "lua_menu_info", "menu_name %s memory_delta_bytes %d init_free_bytes %d post_free_bytes %d in_game %d completed_menu %d", f58_local0, f58_local9 - f58_local4, f58_local4, f58_local9, Engine.InFrontend(), true ) then
		DebugPrint( "Failed to write to blackbox" )
	end
	LUI.ActiveScoped = nil
	return f58_local5.menu
end

function popupMenuHandler( f59_arg0, f59_arg1 )
	assert( f59_arg1.menu )
	if not LUI.MenuBuilder.m_popups[f59_arg1.menu] then
		LUI.MenuBuilder.m_popups[f59_arg1.menu] = {
			priority = LUI.UIRoot.childPriorities.modal
		}
	end
	f59_arg0.flowManager:addMenu( f59_arg1, f59_arg0 )
	LUI.UIRoot.BlockButtonInput( f59_arg0, false, "popupMenu " .. f59_arg1.menu )
	LUI.UIRoot.BlockMouseMove( f59_arg0, false, "popupMenu " .. f59_arg1.menu )
end

function leaveMenuHandler( f60_arg0, f60_arg1 )
	f60_arg0.flowManager:leaveMenu( f60_arg0, f60_arg1 )
	LUI.UIRoot.BlockButtonInput( f60_arg0, false, "leaveMenu" )
	LUI.UIRoot.BlockMouseMove( f60_arg0, false, "leaveMenu" )
end

function leaveMenuByNameHandler( f61_arg0, f61_arg1 )
	RequestLeaveMenuByName( f61_arg1.menu )
	LUI.UIRoot.BlockButtonInput( f61_arg0, false, "leaveMenuByName" )
	LUI.UIRoot.BlockMouseMove( f61_arg0, false, "leaveMenuByName" )
end

function leaveMenu( f62_arg0, f62_arg1, f62_arg2 )
	local f62_local0 = nil
	if f62_arg2.element then
		for f62_local1 = #f62_arg0.menuInfoStack, 1, -1 do
			local f62_local4 = f62_arg0.menuInfoStack[f62_local1]
			if f62_local4.menu and IsElementAChildOf( f62_arg2.element, f62_local4.menu ) then
				f62_local0 = f62_local4
				break
			end
		end
		if not f62_local0 then
			DebugPrint( "Warning: LeaveMenu was called with an element ref, but that element was not found, it is likely the menu was already closed." )
			return nil
		end
	end
	if not f62_local0 and f62_arg2.menu then
		for f62_local1 = #f62_arg0.menuInfoStack, 1, -1 do
			local f62_local4 = f62_arg0.menuInfoStack[f62_local1]
			if f62_local4.name == f62_arg2.menu then
				f62_local0 = f62_local4
				break
			end
		end
		if not f62_local0 then
			DebugPrint( "Warning: LeaveMenu was called with a menu name, but that menu was not found in the stack, it is likely the menu was already closed: " .. f62_arg2.menu )
			return nil
		end
	end
	if not f62_local0 and not f62_arg2.menu and not f62_arg2.element then
		f62_local0 = GetTopMenuInfo( f62_arg0.menuInfoStack, true )
	end
	if not f62_local0 then
		DebugPrint( "WARNING: LeaveMenu failed because the requested menu could not be found or the menu stack is empty." )
		return 
	elseif not f62_local0.isPopup then
		LUI.PreviousMenuName = f62_local0.name
	end
	if f62_local0.menu then
		f62_arg0:CloseMenuInfo( f62_local0 )
	end
	f62_arg0:PopMenuInfo( f62_local0 )
	local f62_local1 = GetTopMenuInfo( f62_arg0.menuInfoStack, f62_local0.isModal )
	local f62_local2 = Engine.SetLuiInUse
	local f62_local3
	if f62_local1 ~= nil then
		f62_local3 = not f62_local1.isOldMenu
	else
		f62_local3 = false
	end
	f62_local2( f62_local3 )
	if f62_local1 then
		if f62_local1.isOldMenu then
			f62_local2 = f62_arg1:getChildById( "mouse_cursor" )
			if f62_local2 then
				f62_local2:close()
			end
		else
			return f62_arg0:RestoreMenuInfo( f62_local1, f62_arg1, f62_local0.isPopup, f62_arg2 )
		end
	end
	f62_local2 = f62_arg1:getChildById( "mouse_cursor" )
	if f62_local2 then
		f62_local2:close()
	end
	return nil
end

function setStackHandler( f63_arg0, f63_arg1 )
	f63_arg0.flowManager:setStack( f63_arg0, f63_arg1 )
end

function setStack( f64_arg0, f64_arg1, f64_arg2 )
	DebugPrint( "FlowManager: Rewriting menu stack " )
	local f64_local0 = GetTopMenuInfo( f64_arg0.menuInfoStack )
	if f64_arg0.debug then
		local f64_local1 = ""
		for f64_local6, f64_local7 in ipairs( f64_arg0.menuInfoStack ) do
			local f64_local8 = f64_local1
			local f64_local5
			if f64_local6 > 1 then
				f64_local5 = " > "
				if not f64_local5 then
				
				else
					f64_local1 = f64_local8 .. f64_local5 .. f64_local7.name
				end
			end
			f64_local5 = ""
		end
		DebugPrint( "    Current stack: " .. f64_local1 )
		f64_local2 = ""
		for f64_local7, f64_local8 in ipairs( f64_arg2.stackData ) do
			local f64_local5 = f64_local2
			local f64_local9
			if f64_local7 > 1 then
				f64_local9 = " > "
				if not f64_local9 then
				
				else
					f64_local2 = f64_local5 .. f64_local9 .. f64_local8.name
				end
			end
			f64_local9 = ""
		end
		DebugPrint( "    Requesting: " .. f64_local2 .. " > " .. f64_local0.name )
	end
	local f64_local1 = 0
	for f64_local6, f64_local7 in ipairs( f64_arg0.menuInfoStack ) do
		if not (not f64_arg2.stackData[f64_local6] or f64_arg2.stackData[f64_local6].name ~= f64_local7.name) or f64_local6 == #f64_arg2.stackData + 1 and f64_local0.name == f64_local7.name then
			f64_local1 = f64_local6
		end
	end
	for f64_local2 = #f64_arg0.menuInfoStack - 1, f64_local1 + 1, -1 do
		if not f64_arg0.menuInfoStack[f64_local2 + 1] or not f64_arg0.menuInfoStack[f64_local2 + 1].isModal then
			f64_arg0:CloseMenuInfo( f64_arg0.menuInfoStack[f64_local2] )
			f64_arg0:PopMenuInfo( f64_arg0.menuInfoStack[f64_local2] )
		end
	end
	for f64_local2 = f64_local1 + 1, #f64_arg2.stackData, 1 do
		f64_local7 = f0_local1( f64_arg2.stackData[f64_local2].name )
		f64_arg0:SetMenuBuildProps( f64_local7, f64_arg2.stackData[f64_local2].data )
		f64_arg0:PushMenuInfo( f64_local7, true )
	end
end

function CheckRestoreFocus( f65_arg0 )
	if f65_arg0.menuInfoStack[#f65_arg0.menuInfoStack] and f65_arg0.menuInfoStack[#f65_arg0.menuInfoStack].menu and not f65_arg0.menuInfoStack[#f65_arg0.menuInfoStack].menu:getFirstInFocus() then
		DebugPrint( "FLowManager: No child in focus, trying to restore focus.  This should probably only happen when using a mouse" )
		f65_arg0.menuInfoStack[#f65_arg0.menuInfoStack].menu:processEvent( {
			name = "gain_focus"
		} )
	end
end

function SaveMenuStack( f66_arg0 )
	local f66_local0 = f66_arg0.flowManager
	local f66_local1 = {}
	if f66_local0.menuInfoStack then
		for f66_local8, f66_local9 in ipairs( f66_local0.menuInfoStack ) do
			local f66_local10 = {}
			for f66_local5, f66_local6 in pairs( f66_local9 ) do
				if f66_local5 == "menu" then
					if f66_local6 then
						f66_local10.menu = true
					else
						f66_local10.menu = false
						goto basicblock_9:
					end
				end
				f66_local10[f66_local5] = f66_local6
			end
			if f66_local0.menuInfoData[f66_local9] and f66_local0.menuInfoData[f66_local9].scopedData then
				DebugPrint( "WARNING: Menu scoped data lost during the debug luiReload process, UI may act inconsistent" )
			end
			f66_local1[#f66_local1 + 1] = f66_local10
		end
	end
	return serialize.persist( {}, f66_local1 )
end

function RestoreMenuStack( f67_arg0, f67_arg1 )
	if f67_arg1 then
		local f67_local0 = f67_arg0.flowManager
		for f67_local7, f67_local8 in ipairs( serialize.unpersist( {}, f67_arg1 ) ) do
			local f67_local9 = f0_local1()
			for f67_local4, f67_local5 in pairs( f67_local8 ) do
				if f67_local4 ~= "menu" then
					f67_local9[f67_local4] = f67_local5
				end
			end
			f67_local0:PushMenuInfo( f67_local9, false )
			if f67_local8.menu then
				if not f67_local8.isOldMenu then
					LUI.ActiveScoped = f67_local0:GetMenuScopedData( f67_local9 )
					f67_local9.menu = LUI.MenuBuilder.buildMenu( f67_local8.name, f67_local0:GetMenuBuildProps( f67_local9 ) )
					f67_local0.menuRoot:addElement( f67_local9.menu )
					f67_local9.menu:processEvent( {
						name = "update_navigation",
						dispatchChildren = true
					} )
					f67_local9.menu:processEvent( {
						name = "menu_create",
						dispatchChildren = true,
						stackRestore = true,
						controller = f67_local9.exclusiveControllerIndex
					} )
					LUI.ActiveScoped = nil
				else
					Engine.SetLuiInUse( false )
					Engine.OpenOldMenu( f67_local8.name )
				end
			end
		end
		f67_local1 = f67_local0.menuInfoStack[#f67_local0.menuInfoStack]
		if f67_local1 and f67_local1.menu then
			Engine.SetLuiInUse( true )
			f67_local1.menu:processEvent( {
				name = "gain_focus"
			} )
			tryAddMouseCursor( f67_arg0 )
		end
	end
end

function BlockInputForDelayedMenuAction()
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), true, "BlockInputFordelayedMenuAction" )
	LUI.UIRoot.BlockMouseMove( Engine.GetLuiRoot(), true, "BlockInputFordelayedMenuAction" )
end

function UnblockInputForDelayedMenuAction()
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), false, "UnblockInputForDelayedMenuAction" )
	LUI.UIRoot.BlockMouseMove( Engine.GetLuiRoot(), false, "UnblockInputForDelayedMenuAction" )
end

LUI.FlowManager.PushMenuStackToDVar = function ()
	local f70_local0 = Engine.GetLuiRoot()
	f70_local0 = f70_local0.flowManager
	local f70_local1 = ""
	if f70_local0.menuInfoStack then
		for f70_local5, f70_local6 in ipairs( f70_local0.menuInfoStack ) do
			if not f70_local6.isPopup then
				f70_local1 = f70_local1 .. f70_local6.name .. "/"
			end
		end
	end
	Engine.SetDvarString( "ui_loadMenuName", f70_local1 )
end

m_flowEvents = {
	addmenu = addMenuHandler,
	addmenu_setstack = addMenuAndSetStackHandler,
	openOldMenu = openOldMenuHandler,
	popupmenu = popupMenuHandler,
	leavemenu = leaveMenuHandler,
	leavemenubyname = leaveMenuByNameHandler,
	restoreMenu = restoreMenuHandler,
	closeallmenus = closeAllMenusHandler,
	setStack = setStackHandler
}
LockTable( _M )
