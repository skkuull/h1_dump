local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestAddMenu( f1_arg0, "level_select_h1_Prologue", true, f1_arg1.controller, false )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestAddMenu( f2_arg0, "level_select_h1_act1", true, f2_arg1.controller, false )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "level_select_h1_act2", true, f3_arg1.controller, false )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	LUI.FlowManager.RequestAddMenu( f4_arg0, "level_select_h1_act3", false, f4_arg1.controller, false )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	LUI.FlowManager.RequestAddMenu( f5_arg0, "level_select_h1_epilogue", true, f5_arg1.controller, false )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	LUI.FlowManager.RequestAddMenu( f6_arg0, "level_select_dev", true, f6_arg1.controller, false )
end

local f0_local6 = function ()
	return {
		type = "UIElement",
		id = "act_selection_container",
		focusable = true,
		properties = {
			title_loc_string = Engine.Localize( "@MENU_MISSIONS_CAP" )
		},
		children = {
			{
				type = "generic_menu_title",
				id = "select_menu_title_text_id",
				properties = {
					text = MBh.Property( "title_loc_string" )
				}
			},
			{
				type = "act_selection_options"
			},
			{
				type = "button_helper_text_main",
				id = "sp_main_button_helper_text_id"
			},
			{
				type = "generic_back_button",
				id = "act_select_back_id"
			}
		},
		states = {
			default = {
				left = 0,
				top = 0,
				right = 0,
				bottom = 0,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = true
			}
		}
	}
end

function act_selection_options()
	return {
		type = "UIVerticalList",
		id = "acts_list",
		focusable = true,
		children = {
			{
				type = "UIGenericButton",
				id = "btn_s1a1_id",
				properties = {
					button_text = Engine.Localize( "Blacksmith Levels" ),
					button_action_func = S1A1LevelsAction
				}
			}
		},
		states = {
			default = {
				alignment = LUI.Alignment.Top,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				left = GenericMenuDims.menu_left,
				right = GenericMenuDims.menu_right,
				top = GenericMenuDims.menu_top,
				bottom = GenericMenuDims.menu_bottom
			}
		}
	}
end

LUI.MenuBuilder.registerDef( "act_selection", f0_local6 )
LUI.MenuBuilder.registerDef( "act_selection_options", act_selection_options )
LockTable( _M )
