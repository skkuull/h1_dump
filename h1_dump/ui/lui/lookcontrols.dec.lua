local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.LookControls = {}
function UpdateMousePitch( f1_arg0, f1_arg1, f1_arg2 )
	if not Engine.IsMultiplayer() then
		Engine.SetDvarBool( "ui_mousePitch", f1_arg2 )
	else
		Engine.SetDvarString( "ui_mousePitch", f1_arg2 )
	end
	if f1_arg2 == "1" or f1_arg2 == true then
		Engine.SetDvarFloat( "m_pitch", -MousePitchTable.PitchFloat )
	else
		Engine.SetDvarFloat( "m_pitch", MousePitchTable.PitchFloat )
	end
end

function GetPitchValues()
	if not Engine.IsMultiplayer() then
		return {
			{
				text = "@LUA_MENU_YES",
				value = true
			},
			{
				text = "@LUA_MENU_NO",
				value = false
			}
		}
	else
		return {
			{
				text = "@LUA_MENU_YES",
				value = "1"
			},
			{
				text = "@LUA_MENU_NO",
				value = "0"
			}
		}
	end
end

function GetSensitivityText()
	local f3_local0 = Engine.GetDvarFloat( "sensitivity" )
	if f3_local0 < 6 then
		return Engine.Localize( "@MENU_LOW" ) .. " " .. f3_local0
	elseif f3_local0 < 12 then
		return Engine.Localize( "@MENU_MEDIUM" ) .. " " .. f3_local0
	elseif f3_local0 < 18 then
		return Engine.Localize( "@MENU_HIGH" ) .. " " .. f3_local0
	elseif f3_local0 < 24 then
		return Engine.Localize( "@MENU_VERY_HIGH" ) .. " " .. f3_local0
	elseif f3_local0 >= 24 then
		return Engine.Localize( "@MENU_INSANE" ) .. " " .. f3_local0
	else
		return f3_local0 .. ""
	end
end

function SensitivityChange( f4_arg0, f4_arg1, f4_arg2 )
	Engine.SetDvarFloat( f4_arg2, math.min( SliderBounds.MouseSensitivity.Max, math.max( SliderBounds.MouseSensitivity.Min, Engine.GetDvarFloat( f4_arg2 ) + f4_arg1 ) ) )
	Engine.MenuDvarsFinish( f4_arg0 )
end

function OptionsMainClose( f5_arg0, f5_arg1 )
	Engine.ExecNow( "profile_menuDvarsFinish" )
end

function CreateOptions( f6_arg0 )
	f6_arg0:AddButton( nil, nil, GamepadDisabledFunc, nil, nil, {
		variant = GenericButtonSettings.Variants.Select,
		button_text = Engine.Localize( "MENU_MOUSE_SENSITIVITY" ),
		desc_text = Engine.Localize( "MENU_MOUSE_SENSITIVITY_DESC" ),
		H1OptionButton = true,
		button_display_func = GetSensitivityText,
		button_left_func = function ( f7_arg0, f7_arg1 )
			return SensitivityChange( f6_arg0.exclusiveController, -SliderBounds.MouseSensitivity.Step, "sensitivity" )
		end,
		button_right_func = function ( f8_arg0, f8_arg1 )
			return SensitivityChange( f6_arg0.exclusiveController, SliderBounds.MouseSensitivity.Step, "sensitivity" )
		end,
		buttonActionIsRightAction = true
	} )
	LUI.Options.CreateOptionButton( f6_arg0, "ui_mousePitch", "@MENU_INVERT_MOUSE", "@MENU_INVERT_MOUSE_DESC", GetPitchValues(), UpdateMousePitch )
	LUI.Options.CreateOptionButton( f6_arg0, "m_filter", "@MENU_SMOOTH_MOUSE", "@MENU_SMOOTH_MOUSE_DESC", {
		{
			text = "@LUA_MENU_YES",
			value = true
		},
		{
			text = "@LUA_MENU_NO",
			value = false
		}
	} )
	LUI.Options.CreateOptionButton( f6_arg0, "cl_freelook", "@MENU_FREE_LOOK", "@MENU_FREE_LOOK_DESC", {
		{
			text = "@LUA_MENU_YES",
			value = true
		},
		{
			text = "@LUA_MENU_NO",
			value = false
		}
	} )
	LUI.Options.CreateControlBindButton( f6_arg0, "@MENU_LEAN_LEFT", "@MENU_LEAN_LEFT_DESC", "+leanleft" )
	LUI.Options.CreateControlBindButton( f6_arg0, "@MENU_LEAN_RIGHT", "@MENU_LEAN_RIGHT_DESC", "+leanright" )
	LUI.Options.CreateControlBindButton( f6_arg0, "@MENU_LOOK_UP", "@MENU_LOOK_UP_DESC", "+lookup" )
	LUI.Options.CreateControlBindButton( f6_arg0, "@MENU_LOOK_DOWN", "@MENU_LOOK_DOWN_DESC", "+lookdown" )
	LUI.Options.CreateControlBindButton( f6_arg0, "@MENU_HOLD_MOUSE_LOOK", "@MENU_HOLD_MOUSE_LOOK_DESC", "+mlook" )
	LUI.Options.CreateControlBindButton( f6_arg0, "@MENU_CENTER_VIEW", "@MENU_CENTER_VIEW_DESC", "centerview" )
	LUI.Options.InitScrollingList( f6_arg0.list, nil )
end

function RefreshFunc( f9_arg0 )
	return function ( f10_arg0, f10_arg1 )
		f9_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
	
end

LUI.LookControls.new = function ( f11_arg0, f11_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f11_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f11_local1 = LUI.MenuTemplate.new( f11_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CONTROL_OPTIONS" ) ),
		menu_top_indent = f11_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = 0 ~= LUI.PCControlOptions.FindTypeIndex( LUI.PreviousMenuName )
	} )
	f11_local1:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f11_local1:registerEventHandler( "menu_close", OptionsMainClose )
	f11_local1:registerEventHandler( "popup_inactive", RefreshFunc( f11_local1 ) )
	f11_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f12_arg0 )
			return LUI.PCControlOptions.Categories[f12_arg0].title
		end,
		tabCount = #LUI.PCControlOptions.Categories,
		underTabTextFunc = function ( f13_arg0 )
			return LUI.PCControlOptions.Categories[f13_arg0].title
		end,
		top = f11_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.PCControlOptions.LoadMenu,
		activeIndex = LUI.PCControlOptions.FindTypeIndex( "look_controls" ),
		isTabLockedfunc = LUI.PCControlOptions.IsCategoryDisabled,
		skipChangeTab = true,
		exclusiveController = f11_local1.exclusiveController
	} ) )
	CreateOptions( f11_local1 )
	LUI.Options.AddOptionTextInfo( f11_local1 )
	LUI.PCControlOptions.AddResetToDefaultButton( f11_local1 )
	f11_local1:AddBackButton()
	return f11_local1
end

LUI.MenuBuilder.registerType( "look_controls", LUI.LookControls.new )
LockTable( _M )
