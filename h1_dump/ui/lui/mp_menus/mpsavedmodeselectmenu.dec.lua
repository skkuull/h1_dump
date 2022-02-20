MatchRules.OpenSelectionMenu = function ( f1_arg0, f1_arg1 )
	if Engine.UserIsGuest( f1_arg0 ) or not Engine.IsUserSignedIn( f1_arg0 ) then
		LUI.FlowManager.RequestAddMenu( self, "recipe_save_failed_no_guests_popup", false, f1_arg0, false )
	elseif not Engine.HasSaveDevice( f1_arg0 ) then
		if Engine.IsXbox360() then
			Engine.ForceSelectSaveDevice( f1_arg0 )
		else
			LUI.FlowManager.RequestAddMenu( self, "recipe_save_failed_no_device_popup", false, f1_arg0, false )
		end
	else
		Engine.ExecNow( "incnosplitscreencontrol menu_RECIPE_SELECT" )
		LUI.FlowManager.RequestAddMenu( self, "savedmode_select_main", true, f1_arg0, false, f1_arg1 )
	end
end

local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.SavedModeSelect = InheritFrom( LUI.MenuTemplate )
MaxRecipeNameLen = 18
function RenameModeItem( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
	local f2_local1 = MatchRules.GetMetaData( "save", f2_local0.index, "name" ) or ""
	local f2_local2
	if f2_local1 ~= nil and f2_local1 ~= "" then
		f2_local2 = false
	else
		f2_local2 = true
	end
	if not f2_local2 then
		f2_local0.rename = true
		Engine.PlaySound( CoD.SFX.MouseClick )
		Engine.OpenScreenKeyboard( f2_arg1.controller, Engine.Localize( "@LUA_MENU_EDIT_MODE_NAME_CAPS_SYSTEM_DIALOG" ), f2_local1, MaxRecipeNameLen, true, true )
	end
end

function SaveModeItem( f3_arg0, f3_arg1 )
	local f3_local0 = MatchRules.GetMetaData( "save", f3_arg1, "name" )
	if f3_local0 == nil or f3_local0 == "" then
		f3_local0 = MatchRules.GetLocalizedMatchRulesName( Engine.GetDvarString( "ui_gametype" ) )
	end
	Engine.OpenScreenKeyboard( f3_arg0, Engine.Localize( "@LUA_MENU_EDIT_MODE_NAME_CAPS_SYSTEM_DIALOG" ), f3_local0, MaxRecipeNameLen, true, true )
end

function SelectMode( f4_arg0, f4_arg1 )
	local f4_local0 = MatchRules.GetData( "gametype" )
	local f4_local1 = f4_arg1.idx
	if f4_arg1.savedMode == "save" then
		if f4_arg1.menuAction == "save" then
			local f4_local2 = MatchRules.GetMetaData( f4_arg1.savedMode, f4_local1, "name" )
			local f4_local3
			if f4_local2 ~= nil and f4_local2 ~= "" then
				f4_local3 = false
			else
				f4_local3 = true
			end
			if f4_local3 then
				SaveModeItem( f4_arg1.controller, f4_local1 )
			else
				LUI.FlowManager.RequestAddMenu( f4_arg0, "generic_yesno_popup", true, f4_arg1.controller, false, {
					popup_title = Engine.Localize( "@MENU_ONLINEVAULT_CONFIRM_OVERWRITE" ),
					message_text = Engine.Localize( "@MENU_OVERWRITE_EXISTING_FILE" ),
					callback_params = {
						slotIndex = -1
					},
					yes_action = function ( f5_arg0, f5_arg1 )
						SaveModeItem( f5_arg1.controller, f4_local1 )
					end
				} )
			end
			return 
		elseif f4_arg1.menuAction == "load" then
			MatchRules.LoadDataFromPlayer( f4_local1 )
		end
	elseif f4_arg1.savedMode == "history" then
		MatchRules.LoadDataFromHistory( f4_local1 )
	end
	FixTeamLimitsAndDifficultiesIfNecessary( f4_local0, MatchRules.GetData( "gametype" ) )
	local f4_local3 = MatchRules.GetData( "mlgVersion" ) ~= ""
	if f4_local3 ~= MLG.AreMLGRulesEnabled() then
		MLG.SetMLGRulesEnabled( f4_local3, true )
	end
	LUI.FlowManager.RequestRestoreMenu( f4_arg0, "gamesetup_menu_main", true, f4_arg1.controller, true )
end

function UpdateSelection( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.idx
	local f6_local1 = LUI.FlowManager.GetMenuScopedDataFromElement( f6_arg0 )
	f6_local1.mode = f6_arg1.savedMode
	f6_local1.index = f6_local0
	f6_local1.rename = false
	f6_arg0:dispatchEventToChildren( {
		name = "mode_details_update",
		idx = f6_local0
	} )
end

function OnCreate( f7_arg0, f7_arg1 )
	f7_arg0:clearSavedState()
	if f7_arg0.properties.savedMode == "save" and f7_arg0.properties.menuAction == "save" then
		f7_arg0:dispatchEventToRoot( {
			name = "add_button_helper_text",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@MENU_RENAME" ),
			side = "right",
			clickable = true,
			priority = -1000,
			func = RenameModeItem
		} )
	end
	local f7_local0 = LUI.ButtonHelperText.CommonEvents.addBackButton
	f7_local0.immediate = true
	f7_arg0:dispatchEventToRoot( f7_local0 )
end

function OnTextInputComplete( f8_arg0, f8_arg1 )
	local f8_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f8_arg0 )
	local f8_local1 = f8_local0.index
	local f8_local2 = f8_arg1.text
	if f8_local2 and f8_local2 ~= "" then
		if #f8_local2 > MaxRecipeNameLen then
			f8_local2 = string.sub( f8_local2, 1, MaxRecipeNameLen )
		end
		if f8_local0.rename then
			MatchRules.LoadDataFromPlayer( f8_local1 )
		end
		MatchRules.SetData( "recipeName", f8_local2 )
		MatchRules.SaveDataToPlayer( f8_local1 )
		LUI.FlowManager.RequestLeaveMenuByName( "savedmode_select_main" )
		f8_local0.rename = false
	end
end

function SavedModeDetailsWindowUpdate( f9_arg0, f9_arg1 )
	local f9_local0 = "default"
	if f9_arg1 >= 0 then
		local f9_local1 = f9_arg0.modesData[f9_arg1 + 1]
		if f9_local1.gameType ~= nil and f9_local1.gameType ~= "" then
			f9_arg0.title:processEvent( {
				name = "update_title",
				title_text = Engine.ToUpperCase( f9_local1.gameType )
			} )
			f9_arg0.timeInfo:setText( Engine.Localize( "@LUA_MENU_DATE_CREATED", f9_local1.timeStamp or "" ) )
			f9_local0 = "visible"
		end
	end
	f9_arg0:animateToState( f9_local0 )
end

function WrapperDispatchEventToRoot( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4, f10_arg5, f10_arg6 )
	f10_arg0:dispatchEventToRoot( {
		name = f10_arg1,
		savedMode = f10_arg2,
		idx = f10_arg3,
		showVaultText = f10_arg4,
		menuAction = f10_arg5,
		controller = f10_arg6
	} )
end

function SavedModeBtnAction( f11_arg0, f11_arg1 )
	WrapperDispatchEventToRoot( f11_arg0, "select_mode", f11_arg0.properties.savedMode, f11_arg0.properties.index, nil, f11_arg0.properties.menuAction, f11_arg1.controller )
end

function SavedModeBtnOver( f12_arg0, f12_arg1 )
	WrapperDispatchEventToRoot( f12_arg0, "update_selection", f12_arg0.properties.savedMode, f12_arg0.properties.index, true, nil, f12_arg1.controller )
end

function SavedModeBtnDisableOver( f13_arg0, f13_arg1 )
	WrapperDispatchEventToRoot( f13_arg0, "update_selection", f13_arg0.properties.savedMode, -1, false, false, f13_arg1.controller )
end

LUI.SavedModeSelect.AddSavedModeButtons = function ( f14_arg0 )
	local f14_local0 = CoD.CreateState( GenericMenuDims.menu_left, GenericMenuDims.menu_top, GenericMenuDims.menu_right_standard + 8, GenericMenuDims.menu_bottom, CoD.AnchorTypes.TopLeft )
	f14_local0.alignment = LUI.Alignment.Top
	local self = LUI.UIElement.new( f14_local0 )
	local f14_local2 = MatchRules.GetSavedModeMax()
	local f14_local3 = Engine.Localize( "@MPUI_EMPTY" )
	for f14_local4 = 0, f14_local2 - 1, 1 do
		local f14_local7 = MatchRules.GetMetaData( f14_arg0.savedMode, f14_local4, "name" )
		local f14_local8
		if f14_local7 ~= nil and f14_local7 ~= "" then
			f14_local8 = false
		else
			f14_local8 = true
		end
		local f14_local9 = false
		if f14_local8 then
			f14_local7 = f14_local3
		end
		f14_local9 = f14_local8
		if f14_arg0.savedMode == "save" and f14_arg0.menuAction == "save" then
			f14_local9 = false
		end
		f14_arg0:AddButton( f14_local7, SavedModeBtnAction, f14_local9, nil, nil, {
			button_text = f14_local7,
			button_over_func = SavedModeBtnOver,
			button_over_disable_func = SavedModeBtnDisableOver,
			savedMode = f14_arg0.savedMode,
			menuAction = f14_arg0.menuAction,
			index = f14_local4,
			muteAction = not f14_local8
		} )
	end
end

LUI.SavedModeSelect.AddDetailsWindow = function ( f15_arg0 )
	local f15_local0 = CoD.CreateState( GenericMenuDims.menu_right_standard + 120, GenericMenuDims.MenuStartY, nil, 0, CoD.AnchorTypes.TopBottomLeft )
	f15_local0.width = 360
	f15_local0.alignment = LUI.Alignment.Top
	f15_local0.alpha = 0
	local self = LUI.UIVerticalList.new( f15_local0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:animateToState( "default" )
	
	local title = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_titlebar", {
		title_bar_text = ""
	} )
	self:addElement( title )
	self.title = title
	
	local timeInfo = LUI.MenuBuilder.BuildRegisteredType( "UIGenericButton", {
		style = GenericButtonSettings.Styles.GlassButton,
		substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu,
		button_text = "",
		text_align_without_content = LUI.Alignment.Left
	} )
	timeInfo.focusable = false
	self:addElement( timeInfo )
	self.timeInfo = timeInfo
	
	local f15_local4 = {}
	local f15_local5 = MatchRules.GetSavedModeMax()
	for f15_local6 = 0, f15_local5 - 1, 1 do
		local f15_local9 = MatchRules.GetMetaData( f15_arg0.savedMode, f15_local6, "gametype" )
		local f15_local10 = ""
		local f15_local11 = MatchRules.GetMetaData( f15_arg0.savedMode, f15_local6, "timestamp" )
		if f15_local11 ~= nil and f15_local11 ~= "" then
			f15_local10 = Engine.GetFormattedDateTime( f15_local11, true )
		end
		f15_local4[f15_local6 + 1] = {
			gameType = f15_local9,
			timeStamp = f15_local10
		}
	end
	self.modesData = f15_local4
	self:registerEventHandler( "mode_details_update", function ( element, event )
		SavedModeDetailsWindowUpdate( element, event.idx )
	end )
	f15_arg0:addElement( self )
end

LUI.SavedModeSelect.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "savedmode_select_root"
	self:registerEventHandler( "menu_create", OnCreate )
	self:registerEventHandler( "select_mode", SelectMode )
	self:registerEventHandler( "update_selection", UpdateSelection )
	self:registerEventHandler( "text_input_complete", OnTextInputComplete )
	local f17_local1 = LUI.MenuTemplate.new( menu, {
		menu_title = controller.menu_title
	} )
	f17_local1:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@MPUI_MODE" ) ) )
	f17_local1.savedMode = controller.savedMode
	f17_local1.menuAction = controller.menuAction
	f17_local1:setClass( LUI.SavedModeSelect )
	f17_local1:AddSavedModeButtons()
	f17_local1:AddDetailsWindow()
	local self = LUI.UIBindButton.new()
	self.id = self.id .. "savedmode_bind_buttons"
	self:registerEventHandler( "button_secondary", MBh.LeaveMenu() )
	f17_local1:addElement( self )
	self:addElement( f17_local1 )
	return self
end

LUI.MenuBuilder.registerType( "savedmode_select_main", LUI.SavedModeSelect.new )
LUI.FlowManager.RegisterStackPushBehaviour( "savedmode_select_main", function ()
	MatchRules.ClearMetaDataCache()
end )
LUI.FlowManager.RegisterStackPopBehaviour( "savedmode_select_main", function ()
	Engine.ExecNow( "decnosplitscreencontrol menu_RECIPE_SELECT" )
end )
LockTable( _M )
