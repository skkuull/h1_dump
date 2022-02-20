local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
DebugPrint( "Registering " .. _NAME )
LUI.Leaderboard = {}
LUI.Leaderboard.CategoryIndex = 1
LUI.Leaderboard.PlayerFilterIndex = 2
LUI.Leaderboard.DurationFilterIndex = 3
LUI.Leaderboard.GametypeFilterIndex = 4
LUI.Leaderboard.disabledHighlightAlpha = 0.5
function OnBackButton( f1_arg0, f1_arg1 )
	if not OpLeaderboardDataController.activeSublist then
		LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
		OpLeaderboardMenu.menu = nil
	else
		LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist, OpLeaderboardDataController.activeSublist.vertList.parent )
	end
end

function OnButtonOver( f2_arg0, f2_arg1 )
	f2_arg0.menu.desc:setText( f2_arg0.descBtnText or "" )
end

function SwitchGameMode( f3_arg0, f3_arg1 )
	assert( f3_arg0.menuIndex )
	local f3_local0 = {
		exclusiveController = f3_arg1.controller
	}
	OpLeaderboardDataController.filterBtnList[LUI.Leaderboard.CategoryIndex] = f3_arg0.menuIndex
	LUI.FlowManager.RequestAddMenu( nil, "OpLeaderboardMain", true, f3_arg1.controller, true, f3_local0, {
		reload = true
	} )
end

function OnFilterChanged( f4_arg0, f4_arg1 )
	local f4_local0 = OpLeaderboardDataController.activeListBtnIdx
	if not (f4_local0 ~= LUI.Leaderboard.CategoryIndex or f4_arg0.menuIndex ~= 1) or f4_local0 == LUI.Leaderboard.GametypeFilterIndex then
		SwitchGameMode( f4_arg0, f4_arg1 )
	else
		local f4_local1 = OpLeaderboardDataController.GetScoped( f4_arg0 )
		if f4_local0 == LUI.Leaderboard.CategoryIndex and f4_arg0.menuIndex ~= 1 then
			local f4_local2
			if OpLeaderboardDataController.activeListBtnIdx == LUI.Leaderboard.CategoryIndex and f4_arg0.menuIndex > 1 then
				f4_local2 = f4_arg0.value
				if not f4_local2 then
				
				else
					OpLeaderboardDataController.coreMode = f4_local2
					OpLeaderboardDataController.filterType = "None"
					OpLeaderboardDataController.durationKey = "Alltime"
					OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.PlayerFilterIndex] = 1
					OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.DurationFilterIndex] = 1
					OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.GametypeFilterIndex] = 1
					SwitchGameMode( f4_arg0, f4_arg1 )
				end
			end
			f4_local2 = Engine.GetDvarInt( HardcoreDvarName ) or f4_local1.coreMode
		elseif f4_arg0.value then
			Engine.SetDvarString( FilterDvarName, f4_arg0.value )
			local f4_local2
			if f4_local0 == LUI.Leaderboard.PlayerFilterIndex then
				f4_local2 = f4_arg0.value
				if not f4_local2 then
				
				else
					f4_local1.filterType = f4_local2
					f4_local2
					if f4_local0 == LUI.Leaderboard.DurationFilterIndex then
						f4_local2 = f4_arg0.value
						if not f4_local2 then
						
						else
							f4_local1.durationKey = f4_local2
							f4_local2
							if OpLeaderboardDataController.activeListBtnIdx == LUI.Leaderboard.CategoryIndex and (f4_arg0.menuIndex == 2 or f4_arg0.menuIndex == 3) then
								f4_local2 = f4_arg0.value
								if not f4_local2 then
								
								else
									f4_local1.coreMode = f4_local2
									OpLeaderboardDataController.ChangeFilterAndDuration( f4_local1.filterType, f4_local1.durationKey, f4_local1.coreMode )
								end
							end
							f4_local2 = Engine.GetDvarInt( HardcoreDvarName ) or f4_local1.coreMode
						end
					end
					f4_local2 = Engine.GetDvarString( DurationDvarName ) or f4_local1.durationKey
				end
			end
			f4_local2 = Engine.GetDvarString( FilterDvarName ) or f4_local1.filterType
		end
	end
end

function OnTopOfListButton( f5_arg0, f5_arg1 )
	local f5_local0 = OpLeaderboardDataController.GetScoped( f5_arg0 )
	f5_local0.leaderboardPageTop = 0
	f5_local0.leaderboardPageRow = 1
	OpLeaderboardDataController.FixCoords( f5_local0 )
	OpLeaderboardDataController.SelectDelta( 0 )
	Engine.PlaySound( CoD.SFX.MenuScroll )
end

function OnFindMeButton( f6_arg0, f6_arg1 )
	if OpLeaderboardDataController.activeSublist then
		LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist )
	end
	local f6_local0 = OpLeaderboardDataController.GetScoped( f6_arg0 )
	f6_local0.initialFetch = true
	OpLeaderboardDataController.Fetch()
	OnGamepadButton( nil, {
		button = "right",
		down = true
	} )
end

function OnGamepadButton( f7_arg0, f7_arg1 )
	local f7_local0 = OpLeaderboardDataController.GetScoped( f7_arg0 )
	if f7_arg1.button == "right" and f7_arg1.down and not f7_local0.isLeaderboardFocused then
		if OpLeaderboardDataController.activeSublist then
			LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist )
		end
		LUI.Leaderboard.SelectedLeaderboardBtnChangeFocus( {
			filterFocusEventName = "lose_focus",
			isLeaderboardFocused = true
		} )
		Engine.PlaySound( CoD.SFX.MenuScroll )
		return true
	else
		return false
	end
end

function SetAlphaInactiveListButtons( f8_arg0 )
	for f8_local0 = OpLeaderboardDataController.activeListBtnIdx + 1, #OpLeaderboardDataController.filterBtnList, 1 do
		if f8_arg0 == 0 then
			OpLeaderboardDataController.filterBtnList[f8_local0]:registerAnimationState( "visiblility", {
				left = -1000,
				right = -800,
				topAnchor = true,
				leftAnchor = true
			} )
			OpLeaderboardDataController.filterBtnList[f8_local0]:animateToState( "visiblility" )
		else
			OpLeaderboardDataController.filterBtnList[f8_local0]:animateToState( "default" )
		end
	end
	if OpLeaderboardMenu.menu.list.bottomDivider then
		OpLeaderboardMenu.menu.list.bottomDivider:setAlpha( f8_arg0 )
	end
end

function HelperAddFilterSublist( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5 )
	local f9_local0 = 24
	local f9_local1 = 4
	local f9_local2 = f9_local1 + f9_local0 * f9_arg3
	local f9_local3, f9_local4, f9_local5, f9_local6 = f9_arg0:getRect()
	local f9_local7 = 1
	if Engine.GetLuiRootScale then
		f9_local7 = Engine.GetLuiRootScale()
	end
	local f9_local8, f9_local9, f9_local10, f9_local11 = f9_arg1:getRect()
	local f9_local12 = (f9_local4 - f9_local9 + f9_local6 - f9_local4) / f9_local7
	local f9_local13 = LUI.SubList.CreateSublist( CoD.CreateState( 0, f9_local12, (f9_local5 - f9_local3) / f9_local7, f9_local12 + f9_local2, CoD.AnchorTypes.TopLeft ), f9_local1 / 2 )
	f9_local13.vertList.buttonCount = f9_arg3
	f9_local13.vertList.parent = f9_arg1
	f9_local13.vertList.button = f9_arg0
	for f9_local17, f9_local18 in ipairs( f9_arg2 ) do
		local f9_local19 = LUI.SubList.CreateSubListButton( f9_local17, f9_local0, 20, -12, 14 )
		f9_local19.text:setText( f9_local18.label )
		f9_local19.label = f9_local18.label
		f9_local19.menuIndex = f9_local17
		f9_local19.value = f9_local18.value
		f9_local19:registerEventHandler( "button_action", function ( element, event )
			f9_arg4( element, event )
			OpLeaderboardDataController.activeSublistBtnIndexes[OpLeaderboardDataController.activeListBtnIdx] = element.menuIndex
			LUI.Leaderboard.RemoveFilterSubList( f9_local13, f9_arg1.list )
			f9_local13.vertList.button:setText( element.label )
		end )
		f9_local13.vertList:addElement( f9_local19 )
	end
	LUI.UIVerticalList.SetChildFocus( f9_local13.vertList, OpLeaderboardDataController.activeSublistBtnIndexes[f9_arg5] )
	f9_arg1:insertElement( f9_local13, 2 )
	f9_arg1.list:processEvent( {
		name = "lose_focus"
	} )
	OpLeaderboardDataController.activeSublist = f9_local13
	OpLeaderboardDataController.activeSublistOwner = f9_arg0
	SetAlphaInactiveListButtons( 0 )
end

function AddFilterButton( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4, f11_arg5 )
	local f11_local0 = f11_arg0:AddButton( Engine.ToUpperCase( Engine.Localize( f11_arg2 ) ), function ( f12_arg0, f12_arg1 )
		local f12_local0 = false
		if OpLeaderboardDataController.activeSublist then
			if OpLeaderboardDataController.activeSublistOwner == f12_arg0 then
				f12_local0 = true
			end
			LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist, f11_arg0.list )
		end
		if not f12_local0 then
			local f12_local1 = {}
			OpLeaderboardDataController.activeListBtnIdx = f11_arg1
			for f12_local2 = 1, #f11_arg3, 1 do
				local f12_local5 = f11_arg3[f12_local2]
				f12_local1[f12_local2] = {
					label = Engine.ToUpperCase( Engine.Localize( f12_local5.categoryId and OpLeaderboard.GetLabel( f12_local5.categoryId ) or f12_local5.text ) ),
					value = f12_local5.value
				}
			end
			HelperAddFilterSublist( f12_arg0, f11_arg0, f12_local1, #f11_arg3, f11_arg4, f11_arg1 )
		end
	end, nil, nil, nil, {
		hasSublist = true
	} )
	f11_local0.descBtnText = ""
	if f11_arg5 then
		f11_local0.descBtnText = Engine.Localize( "@LUA_MENU_NOT_AVAILABLE_CAREER" )
		f11_local0:processEvent( {
			name = "disable"
		} )
		f11_local0:registerEventHandler( "button_over_disable", OnButtonOver )
	end
	f11_local0.menu = f11_arg0
	f11_local0:registerEventHandler( "button_over", OnButtonOver )
	OpLeaderboardDataController.filterBtnList[f11_arg1] = f11_local0
end

function AddFilterSublists( f13_arg0 )
	OpLeaderboardDataController.filterBtnList = {}
	local f13_local0 = CoD.TextSettings.Font21
	local f13_local1 = CoD.CreateState( 0, 271, 240, nil, CoD.AnchorTypes.TopLeft )
	f13_local1.height = f13_local0.Height
	f13_local1.font = f13_local0.Font
	f13_local1.color = Colors.mw1_green
	f13_local1.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	
	local desc = LUI.UIText.new( f13_local1 )
	f13_arg0:addElement( desc )
	f13_arg0.desc = desc
	
	if not OpLeaderboardDataController.activeListBtnIdx then
		OpLeaderboardDataController.activeListBtnIdx = LUI.Leaderboard.CategoryIndex
	end
	local f13_local3 = LUI.Leaderboard.CategoryIndex
	local f13_local4 = OpLeaderboardDataController.activeSublistBtnIndexes[f13_local3]
	local f13_local5 = f13_local4
	local f13_local6 = OpLeaderboardMenu.Options[f13_local4].categoryId and OpLeaderboard.GetLabel( OpLeaderboardMenu.Options[f13_local4].categoryId ) or OpLeaderboardMenu.Options[f13_local4].text
	local f13_local7 = OpLeaderboardDataController.GetScoped()
	AddFilterButton( f13_arg0, f13_local3, f13_local6, OpLeaderboardMenu.Options, OnFilterChanged )
	f13_local3 = LUI.Leaderboard.PlayerFilterIndex
	AddFilterButton( f13_arg0, f13_local3, OpLeaderboardMenu.PlayerFilterOptions[OpLeaderboardDataController.activeSublistBtnIndexes[f13_local3]].text, OpLeaderboardMenu.PlayerFilterOptions, OnFilterChanged )
	f13_local3 = LUI.Leaderboard.DurationFilterIndex
	AddFilterButton( f13_arg0, f13_local3, OpLeaderboardMenu.DurationFilterOptions[OpLeaderboardDataController.activeSublistBtnIndexes[f13_local3]].text, OpLeaderboardMenu.DurationFilterOptions, OnFilterChanged )
	local f13_local8 = OpLeaderboardMenu.Options[f13_local5].refId
	if f13_local8 then
		f13_local3 = LUI.Leaderboard.GametypeFilterIndex
		f13_local4 = OpLeaderboardDataController.activeSublistBtnIndexes[f13_local3]
		AddFilterButton( f13_arg0, f13_local3, OpLeaderboard.GetLabel( OpLeaderboardMenu.GametypeFilterOptions[f13_local8][OpLeaderboardDataController.activeSublistBtnIndexes[f13_local3]].categoryId ), OpLeaderboardMenu.GametypeFilterOptions[f13_local8], OnFilterChanged )
	end
end

function CreateLeaderboard( f14_arg0 )
	local f14_local0 = OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.CategoryIndex]
	local f14_local1 = OpLeaderboardMenu.Options[f14_local0].categoryId
	local f14_local2 = OpLeaderboardMenu.Options[f14_local0].refId
	if f14_local0 ~= 1 then
		local f14_local3 = OpLeaderboardDataController.activeSublistBtnIndexes
		f14_local1 = OpLeaderboardMenu.GametypeFilterOptions[f14_local2][OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.GametypeFilterIndex]].categoryId
	end
	f14_arg0:addElement( LUI.MenuBuilder.BuildRegisteredType( "OpLeaderboardInfo", {
		categoryId = f14_local1
	} ) )
end

LUI.Leaderboard.RemoveFilterSubList = function ( f15_arg0, f15_arg1 )
	if f15_arg0.vertList.parent then
		f15_arg0.vertList.parent:removeElement( f15_arg0 )
		OpLeaderboardDataController.activeSublist = nil
		OpLeaderboardDataController.activeSublistOwner = nil
	end
	if f15_arg1 then
		f15_arg1:processEvent( {
			name = "gain_focus"
		} )
	end
	SetAlphaInactiveListButtons( 1 )
end

LUI.Leaderboard.SelectedLeaderboardBtnChangeFocus = function ( f16_arg0 )
	local f16_local0 = OpLeaderboardDataController.GetScoped()
	if f16_local0.isLeaderboardFocused == f16_arg0.isLeaderboardFocused then
		return 
	elseif OpLeaderboardDataController.activeSublist then
		LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist, OpLeaderboardDataController.activeSublist.vertList.parent )
	end
	OpLeaderboardMenu.menu.list:processEvent( {
		name = f16_arg0.filterFocusEventName
	} )
	LUI.Leaderboard.DisableLeaderboardHelperButtons( not f16_arg0.isLeaderboardFocused )
	f16_local0.isLeaderboardFocused = f16_arg0.isLeaderboardFocused
	if f16_local0.activeLeaderboardButtonHighlight then
		if f16_arg0.isLeaderboardFocused then
			f16_local0.activeLeaderboardButtonHighlight:animateToState( "focused" )
		else
			f16_local0.activeLeaderboardButtonHighlight:animateToState( "disabledFocus" )
		end
	end
end

LUI.Leaderboard.DisableLeaderboardHelperButtons = function ( f17_arg0 )
	local f17_local0 = OpLeaderboardMenu.menu
	local f17_local1 = OpLeaderboardMenu.menu.list:isInFocus()
	LUI.ButtonHelperText.ClearHelperTextObjects( f17_local0.help, {
		side = "all"
	} )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f17_local0:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	LUI.ButtonHelperText.AddHelperTextObject( f17_local0.help, {
		name = "add_button_helper_text",
		button_ref = "button_alt2",
		helper_text = Engine.Localize( "@LUA_MENU_FINDME" ),
		side = "right",
		clickable = true,
		priority = 0
	}, OnFindMeButton )
	if not f17_arg0 then
		LUI.ButtonHelperText.AddHelperTextObject( f17_local0.help, {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@LUA_MENU_TOP" ),
			side = "right",
			clickable = true,
			priority = 0
		}, OnTopOfListButton )
		if Engine.IsGamepadEnabled() then
			local f17_local2, f17_local3 = nil
			if Engine.IsVita( Engine.GetFirstActiveController() ) then
				f17_local2 = "button_left_trigger_vita"
				f17_local3 = "button_right_trigger_vita"
			end
			LUI.ButtonHelperText.AddHelperTextObject( f17_local0.help, {
				name = "add_button_helper_text",
				button_ref = "button_left_trigger",
				button_ref2 = "button_right_trigger",
				button_ref_vita = f17_local2,
				button_ref_vita_2 = f17_local3,
				helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP_SLASH_DOWN" ),
				side = "right",
				clickable = true,
				priority = 0,
				groupLRButtons = true
			} )
		else
			LUI.ButtonHelperText.AddHelperTextObject( f17_local0.help, {
				name = "add_button_helper_text",
				button_ref = "button_page_down",
				helper_text = Engine.Localize( "@LUA_MENU_PAGE_DOWN" ),
				side = "right",
				clickable = true,
				priority = 0
			}, OnPageDownButton )
			LUI.ButtonHelperText.AddHelperTextObject( f17_local0.help, {
				name = "add_button_helper_text",
				button_ref = "button_page_up",
				helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP" ),
				side = "right",
				clickable = true,
				priority = 0
			}, OnPageUpButton )
		end
	end
	f17_local0:AddBackButton( OnBackButton )
end

LUI.Leaderboard.new = function ( f18_arg0, f18_arg1 )
	Engine.SetDvarString( FilterDvarName, OpLeaderboardMenu.PlayerFilterOptions[1].value )
	OpLeaderboardMenu.controllerIndex = f18_arg1.exclusiveController or 0
	if Engine.IsUserAGuest( OpLeaderboardMenu.controllerIndex ) then
		OpLeaderboardMenu.controllerIndex = Engine.GetSignedInAsController()
	end
	local f18_local0 = LUI.MenuTemplate.new( f18_arg0, {
		menu_title = "@LUA_MENU_LEADERBOARDS_CAPS",
		do_not_add_friends_helper = true,
		genericListAction = function ( f19_arg0, f19_arg1 )
			LUI.Leaderboard.SelectedLeaderboardBtnChangeFocus( {
				filterFocusEventName = "gain_focus",
				isLeaderboardFocused = false
			} )
		end
	} )
	LUI.MenuTemplate.SetBreadCrumb( f18_local0, Engine.Localize( "@LUA_MENU_BARRACKS_CAPS" ) )
	f18_local0:addEventHandler( "closeallmenus", OnBackButton )
	f18_local0.list:addEventHandler( "gamepad_button", OnGamepadButton )
	f18_local0.list:addEventHandler( "menu_create", OpLeaderboardDataController.OnMenuCreate )
	f18_local0.list:addEventHandler( "menu_close", OpLeaderboardDataController.OnMenuClose )
	OpLeaderboardMenu.menu = f18_local0
	f18_local0:registerEventHandler( "unhandled_leftmouseup", function ( element, event )
		if OpLeaderboardDataController.activeSublist then
			LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist )
		end
	end )
	f18_local0:registerEventHandler( "unhandled_rightmouseup", function ( element, event )
		if OpLeaderboardDataController.activeSublist then
			LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist )
		end
	end )
	if not OpLeaderboardDataController.activeSublistBtnIndexes then
		OpLeaderboardDataController.activeSublistBtnIndexes = {}
	end
	if not OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.CategoryIndex] then
		OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.CategoryIndex] = 1
	end
	if not OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.PlayerFilterIndex] then
		OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.PlayerFilterIndex] = 1
	end
	if not OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.DurationFilterIndex] then
		OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.DurationFilterIndex] = 1
	end
	if not OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.GametypeFilterIndex] then
		OpLeaderboardDataController.activeSublistBtnIndexes[LUI.Leaderboard.GametypeFilterIndex] = 1
	end
	CreateLeaderboard( f18_local0 )
	AddFilterSublists( f18_local0 )
	LUI.Leaderboard.DisableLeaderboardHelperButtons( true )
	f18_local0.list:processEvent( {
		name = "gain_focus"
	} )
	OpLeaderboardDataController.filterBtnList[LUI.Leaderboard.CategoryIndex]:processEvent( {
		name = "lose_focus"
	} )
	OpLeaderboardDataController.filterBtnList[OpLeaderboardDataController.activeListBtnIdx]:processEvent( {
		name = "gain_focus"
	} )
	return f18_local0
end

LUI.MenuBuilder.registerType( "OpLeaderboardMain", LUI.Leaderboard.new )
LockTable( _M )
