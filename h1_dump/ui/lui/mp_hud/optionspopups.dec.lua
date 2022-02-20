local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CloseThisMenu( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	Engine.ExecNow( "profile_setSticksConfig thumbstick_default" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	Engine.ExecNow( "profile_setSticksConfig thumbstick_southpaw" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	Engine.ExecNow( "profile_setSticksConfig thumbstick_legacy" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	Engine.ExecNow( "profile_setSticksConfig thumbstick_legacysouthpaw" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f5_arg0 )
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_default" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_tactical" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f7_arg0 )
end

local f0_local6 = function ( f8_arg0, f8_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_lefty" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
end

local f0_local7 = function ( f9_arg0, f9_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_legacy" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f9_arg0 )
end

local f0_local8 = function ( f10_arg0, f10_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_nomad" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
end

local f0_local9 = function ( f11_arg0, f11_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_nomad_tactical" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f11_arg0 )
end

local f0_local10 = function ( f12_arg0, f12_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_default_alt" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
end

local f0_local11 = function ( f13_arg0, f13_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_tactical_alt" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f13_arg0 )
end

local f0_local12 = function ( f14_arg0, f14_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_lefty_alt" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f14_arg0 )
end

local f0_local13 = function ( f15_arg0, f15_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_legacy_alt" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f15_arg0 )
end

local f0_local14 = function ( f16_arg0, f16_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_nomad_alt" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f16_arg0 )
end

local f0_local15 = function ( f17_arg0, f17_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig buttons_nomad_tactical_alt" )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f17_arg0 )
end

local f0_local16 = function ()
	return {
		type = "UIElement",
		id = "mp_stick_select_menu_id",
		children = {
			{
				type = "UIImage",
				id = "optionsBG",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = -700,
						top = 0,
						bottom = 0,
						material = RegisterMaterial( "white" ),
						red = Colors.window_border_color.r,
						green = Colors.window_border_color.g,
						blue = Colors.window_border_color.b,
						alpha = 0.85
					}
				}
			},
			{
				type = "UIImage",
				id = "optionsBG01",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = 0,
						bottom = 0,
						material = RegisterMaterial( "white" ),
						red = Colors.window_border_color.r,
						green = Colors.window_border_color.g,
						blue = Colors.window_border_color.b,
						alpha = 1
					}
				}
			},
			{
				type = "generic_popup_title",
				properties = {
					text = "PICK YOUR STICK"
				}
			},
			{
				type = "mp_stick_options"
			},
			{
				type = "UIBindButton",
				id = "closeThisPopupBind",
				handlers = {
					button_start = CloseThisMenu,
					button_select = CloseThisMenu,
					button_secondary = CloseThisMenu
				}
			}
		},
		states = {
			default = {
				left = 100,
				top = 50,
				right = 600,
				bottom = 600,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false,
				alpha = 1
			},
			hidden = {
				alpha = 0
			}
		},
		handlers = {}
	}
end

local f0_local17 = function ()
	return {
		type = "UIVerticalList",
		id = "mp_stick_select_options_id",
		childrenFeeder = mp_stick_select_options_feeder,
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

function mp_stick_select_options_feeder()
	local f20_local0 = {
		[#f20_local0 + 1] = {
			type = "generic_button",
			id = "btn_STICK_0",
			properties = {
				text = "Default",
				additional_handlers = {
					button_action = f0_local0
				}
			}
		},
		[#f20_local0 + 1] = {
			type = "generic_button",
			id = "btn_STICK_1",
			properties = {
				text = "Southpaw",
				additional_handlers = {
					button_action = f0_local1
				}
			}
		},
		[#f20_local0 + 1] = {
			type = "generic_button",
			id = "btn_STICK_2",
			properties = {
				text = "Legacy",
				additional_handlers = {
					button_action = f0_local2
				}
			}
		},
		[#f20_local0 + 1] = {
			type = "generic_button",
			id = "btn_STICK_3",
			properties = {
				text = "Legacy Southpaw",
				additional_handlers = {
					button_action = f0_local3
				}
			}
		}
	}
	return f20_local0
end

local f0_local18 = function ()
	return {
		type = "UIElement",
		id = "mp_button_select_menu_id",
		children = {
			{
				type = "UIImage",
				id = "buttonOptionsBG",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = -700,
						top = 0,
						bottom = 0,
						material = RegisterMaterial( "white" ),
						red = Colors.window_border_color.r,
						green = Colors.window_border_color.g,
						blue = Colors.window_border_color.b,
						alpha = 0.75
					}
				}
			},
			{
				type = "UIImage",
				id = "buttonOptionsBG01",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = 0,
						bottom = 0,
						material = RegisterMaterial( "white" ),
						red = Colors.window_border_color.r,
						green = Colors.window_border_color.g,
						blue = Colors.window_border_color.b,
						alpha = 1
					}
				}
			},
			{
				type = "generic_popup_title",
				properties = {
					text = "PICK YOUR BUTTON LAYOUT"
				}
			},
			{
				type = "mp_button_options"
			},
			{
				type = "UIBindButton",
				id = "closeThisPopupBind",
				handlers = {
					button_start = CloseThisMenu,
					button_select = CloseThisMenu,
					button_secondary = CloseThisMenu
				}
			}
		},
		states = {
			default = {
				left = 100,
				top = 50,
				right = 600,
				bottom = 600,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false,
				alpha = 1
			},
			hidden = {
				alpha = 0
			}
		},
		handlers = {}
	}
end

local f0_local19 = function ()
	return {
		type = "UIVerticalList",
		id = "mp_button_select_options_id",
		childrenFeeder = mp_button_select_options_feeder,
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

function mp_button_select_options_feeder()
	local f23_local0 = {
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_0",
			properties = {
				text = "Default",
				additional_handlers = {
					button_action = f0_local4
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_1",
			properties = {
				text = "Tactical",
				additional_handlers = {
					button_action = f0_local5
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_2",
			properties = {
				text = "Lefty",
				additional_handlers = {
					button_action = f0_local6
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_3",
			properties = {
				text = "Legacy",
				additional_handlers = {
					button_action = f0_local7
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_4",
			properties = {
				text = "N0M4D",
				additional_handlers = {
					button_action = f0_local8
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_5",
			properties = {
				text = "N0M4D T4CTIC4L",
				additional_handlers = {
					button_action = f0_local9
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_6",
			properties = {
				text = "Default Alternate",
				additional_handlers = {
					button_action = f0_local10
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_7",
			properties = {
				text = "Default Alternate",
				additional_handlers = {
					button_action = f0_local11
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_8",
			properties = {
				text = "Lefty Alternate",
				additional_handlers = {
					button_action = f0_local12
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_9",
			properties = {
				text = "Legacy Alternate",
				additional_handlers = {
					button_action = f0_local13
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_10",
			properties = {
				text = "N0M4D 4LTERN4TE",
				additional_handlers = {
					button_action = f0_local14
				}
			}
		},
		[#f23_local0 + 1] = {
			type = "generic_button",
			id = "btn_BUTTONS_11",
			properties = {
				text = "N0M4D T4CTIC4L 4LTERN4TE",
				additional_handlers = {
					button_action = f0_local15
				}
			}
		}
	}
	return f23_local0
end

LUI.MenuBuilder.registerDef( "mp_stick_select_menu", f0_local16 )
LUI.MenuBuilder.registerDef( "mp_stick_options", f0_local17 )
LUI.MenuBuilder.registerDef( "mp_button_select_menu", f0_local18 )
LUI.MenuBuilder.registerDef( "mp_button_options", f0_local19 )
LockTable( _M )
