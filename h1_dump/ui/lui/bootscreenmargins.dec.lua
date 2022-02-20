local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
DebugPrint( "Registering " .. _NAME )
f0_local0 = false
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f1_arg0 )
	f1_local0.ContinueMessageVisible = false
	if f1_arg0.properties.linkTo == "console_graphics" or not f0_local0 then
		f1_local0.ContinueMessageVisible = true
		if f1_arg0.properties.is_in_options_menu then
			f1_arg0:dispatchEventToRoot( {
				name = "continue_message_visible"
			} )
			f1_local0.BackMessageVisible = true
			f1_arg0:dispatchEventToRoot( {
				name = "back_message_visible"
			} )
		else
			f1_arg0:dispatchEventToRoot( {
				name = "continue_message_visible_alone",
				dispatchChildren = true
			} )
		end
	end
	f1_local0.OriginalVertMargin = Engine.GetProfileData( "safeareaVertical", Engine.GetControllerForLocalClient( 0 ) )
	f1_local0.OriginalHorzMargin = Engine.GetProfileData( "safeareaHorizontal", Engine.GetControllerForLocalClient( 0 ) )
	f1_local0.VertMarginMinAmount = SliderBounds.VertMargin.Min
	f1_local0.VertMarginMaxAmount = SliderBounds.VertMargin.Max
	f1_local0.VertMarginIncrement = SliderBounds.VertMargin.Step
	f1_local0.HorzMarginMinAmount = SliderBounds.HorzMargin.Min
	f1_local0.HorzMarginMaxAmount = SliderBounds.HorzMargin.Max
	f1_local0.HorzMarginIncrement = SliderBounds.HorzMargin.Step
	f1_arg0:dispatchEventToChildren( {
		name = "vertical_margin_over"
	} )
	f1_arg0:dispatchEventToChildren( {
		name = "horizontal_margin_over"
	} )
	if f1_local0.showSignIn and (Engine.IsXB3() or Engine.IsPCApp()) then
		local self = LUI.UIElement.new( CoD.CreateState( 0, GenericFooterDims.TopMargin_WithBackground, 400, 0, CoD.AnchorTypes.BottomLeft ) )
		f1_arg0:addElement( self )
		LUI.ButtonHelperText.AddSignInText( self )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5 )
	if f2_arg3 == 0 then
		Engine.SetProfileData( f2_arg4, f2_arg5, Engine.GetControllerForLocalClient( 0 ) )
	else
		local f2_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
		local f2_local1 = math.min( f2_arg2, math.max( f2_arg1, Engine.GetProfileData( f2_arg4, Engine.GetControllerForLocalClient( 0 ) ) + f2_arg3 ) )
		Engine.SetProfileData( f2_arg4, f2_local1, Engine.GetControllerForLocalClient( 0 ) )
		f2_arg0:dispatchEventToRoot( {
			name = "margin_updated"
		} )
		if f2_local1 <= f2_arg1 or f2_arg2 <= f2_local1 then
			Engine.PlaySound( CoD.SFX.DenyAdjustSafeArea )
		else
			Engine.PlaySound( CoD.SFX.AdjustSafeArea )
		end
		if f2_local0.ContinueMessageVisible == false and f2_local1 ~= f2_arg5 then
			f2_local0.ContinueMessageVisible = true
			f2_arg0:dispatchEventToRoot( {
				name = "continue_message_visible"
			} )
		end
	end
	Engine.Exec( "updategamerprofile " .. Engine.GetControllerForLocalClient( 0 ) )
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f3_arg0 )
	if f3_arg0.properties.linkTo == "boot_brightness" then
		local f3_local1 = LUI.FlowManager.RequestAddMenu
		local f3_local2 = f3_arg0
		local f3_local3 = "main_menu"
		local f3_local4 = f3_arg0:getParent()
		f3_local1( f3_local2, f3_local3, f3_local4.properties.continueExclusive, f3_arg1.controller, true )
	elseif f3_local0.ContinueMessageVisible then
		LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
	end
	local f3_local1 = Engine.GetLuiRoot()
	if f3_local1 then
		f3_local1:processEvent( {
			name = "update_hud_margins"
		} )
	end
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg0 )
	if f4_local0.BackMessageVisible then
		f0_local2( f4_arg0, f4_local0.VertMarginMinAmount, f4_local0.VertMarginMaxAmount, 0, "safeareaVertical", f4_local0.OriginalVertMargin )
		f0_local2( f4_arg0, f4_local0.HorzMarginMinAmount, f4_local0.HorzMarginMaxAmount, 0, "safeareaHorizontal", f4_local0.OriginalHorzMargin )
		if f4_arg0.properties.linkTo == "boot_brightness" then
			LUI.FlowManager.RequestAddMenu( nil, "boot_brightness", false, controller, true, {} )
		else
			LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
		end
		Engine.PlaySound( CoD.SFX.PauseMenuBack )
	end
end

local f0_local5 = function ( f5_arg0, f5_arg1 )
	if not LUI.FlowManager.IsTopMenuModal() and f5_arg1.down == true then
		local f5_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f5_arg0 )
		if f5_arg1.button == "up" then
			f0_local2( f5_arg0, f5_local0.VertMarginMinAmount, f5_local0.VertMarginMaxAmount, f5_local0.VertMarginIncrement, "safeareaVertical", f5_local0.OriginalVertMargin )
			return true
		elseif f5_arg1.button == "down" then
			f0_local2( f5_arg0, f5_local0.VertMarginMinAmount, f5_local0.VertMarginMaxAmount, -f5_local0.VertMarginIncrement, "safeareaVertical", f5_local0.OriginalVertMargin )
			return true
		elseif f5_arg1.button == "left" then
			f0_local2( f5_arg0, f5_local0.HorzMarginMinAmount, f5_local0.HorzMarginMaxAmount, -f5_local0.HorzMarginIncrement, "safeareaHorizontal", f5_local0.OriginalHorzMargin )
			return true
		elseif f5_arg1.button == "right" then
			f0_local2( f5_arg0, f5_local0.HorzMarginMinAmount, f5_local0.HorzMarginMaxAmount, f5_local0.HorzMarginIncrement, "safeareaHorizontal", f5_local0.OriginalHorzMargin )
			return true
		end
	end
	return LUI.UIButton.GamepadButton( f5_arg0, f5_arg1 )
end

function boot_screen_margins()
	return {
		type = "UIImage",
		id = "boot_screen_margins_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0,
				color = {
					r = 0,
					g = 0,
					b = 0
				}
			}
		},
		handlers = {
			menu_create = f0_local1
		},
		properties = {
			linkTo = "main_menu",
			continueExclusive = false
		},
		children = {
			{
				type = "margins_guide"
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt1_id",
				properties = {
					text = Engine.Localize( "@MENU_ADJUST_SCREENMARGINS" )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 140,
						bottom = 140 + CoD.TextSettings.BodyFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.BodyFont.Font,
						alignment = LUI.Alignment.Center,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b
					}
				}
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt2_id",
				properties = {
					text = Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_DESC" )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 170 + CoD.TextSettings.BodyFontSmall.Height,
						bottom = 170 + 2 * CoD.TextSettings.BodyFontSmall.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.BodyFontSmall.Font,
						alignment = LUI.Alignment.Center,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b
					}
				}
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt3_id",
				properties = {
					text = Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_INST1" )
				},
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = -1.2 * CoD.TextSettings.BodyFontTiny.Height,
						bottom = 0,
						left = -20,
						right = 0,
						font = CoD.TextSettings.BodyFontTiny.Font,
						alignment = LUI.Alignment.Center,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b
					}
				}
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt4_id",
				properties = {
					text = Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_INST2" )
				},
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 40,
						bottom = 1.2 * CoD.TextSettings.BodyFontTiny.Height + 40,
						left = -20,
						right = 0,
						font = CoD.TextSettings.BodyFontTiny.Font,
						alignment = LUI.Alignment.Center,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b
					}
				}
			},
			{
				type = "UIButton",
				id = "boot_screen_margins_continue_btn_id",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = false,
						rightAnchor = false,
						top = -1 * (CoD.TextSettings.BodyFontTiny.Height + 105),
						bottom = -100,
						left = -300,
						right = -40,
						alpha = 0
					},
					visible = {
						alpha = 1
					},
					visibleAlone = {
						alpha = 1,
						leftAnchor = true,
						rightAnchor = true,
						left = 0,
						right = 0
					}
				},
				handlers = {
					button_action = f0_local3,
					continue_message_visible = MBh.AnimateToState( "visible", 0 ),
					continue_message_visible_alone = MBh.AnimateToState( "visibleAlone", 0 )
				},
				children = {
					{
						type = "UIText",
						properties = {
							text = Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_APPLY" )
						},
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0,
								font = CoD.TextSettings.BodyFontTiny.Font,
								alignment = LUI.Alignment.Right
							},
							visibleAlone = {
								alignment = LUI.Alignment.Center
							}
						},
						handlers = {
							continue_message_visible_alone = MBh.AnimateToState( "visibleAlone", 0 )
						}
					}
				}
			},
			{
				type = "UIBindButton",
				id = "boot_screen_margins_back_btn_id",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = false,
						rightAnchor = false,
						top = -1 * (CoD.TextSettings.BodyFontTiny.Height + 105),
						bottom = -100,
						left = 40,
						right = 300,
						alpha = 0
					},
					visible = {
						alpha = 1
					}
				},
				handlers = {
					button_secondary = f0_local4,
					back_message_visible = MBh.AnimateToState( "visible", 0 )
				},
				children = {
					{
						type = "UIText",
						properties = {
							text = Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_BACK" )
						},
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0,
								font = CoD.TextSettings.BodyFontTiny.Font,
								horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft
							}
						}
					}
				}
			},
			{
				type = "UIBindButton",
				id = "boot_screen_margins_bind_btn_id",
				handlers = {
					gamepad_button = f0_local5
				}
			}
		}
	}
end

function RedrawMarginGuide( f7_arg0, f7_arg1 )
	local f7_local0 = Engine.GetProfileData( "safeareaHorizontal", Engine.GetControllerForLocalClient( 0 ) )
	local f7_local1 = Engine.GetProfileData( "safeareaVertical", Engine.GetControllerForLocalClient( 0 ) )
	local f7_local2 = (1 - (f7_local0 - SliderBounds.HorzMargin.Min) / (SliderBounds.HorzMargin.Max - SliderBounds.HorzMargin.Min)) * 1280 * (1 - SliderBounds.HorzMargin.Min) / 2
	local f7_local3 = (1 - (f7_local1 - SliderBounds.VertMargin.Min) / (SliderBounds.VertMargin.Max - SliderBounds.VertMargin.Min)) * 720 * (1 - SliderBounds.VertMargin.Min) / 2
	f7_arg0:registerAnimationState( "current", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = f7_local2,
		right = -f7_local2,
		top = f7_local3,
		bottom = -f7_local3
	} )
	f7_arg0:animateToState( "current", 0 )
end

function margins_guide()
	local f8_local0 = {
		type = "UIElement",
		id = "horizontal_margins_guide_id",
		states = {
			default = {
				alpha = 0
			},
			visible = {
				alpha = 1
			}
		}
	}
	local f8_local1 = {}
	local f8_local2 = MBh.DoMultiple
	local f8_local3 = {}
	local f8_local4 = MBh.AnimateToState( "visible", 0 )
	local f8_local5 = RedrawMarginGuide
	local f8_local6 = MBh.EmitEvent( {
		name = "horizontal_margin_over_children"
	} )
	f8_local1.horizontal_margin_over = f8_local2( f8_local4 )
	f8_local2 = MBh.DoMultiple
	f8_local3 = {}
	f8_local4 = MBh.AnimateToState( "visible", 0 )
	f8_local5 = RedrawMarginGuide
	f8_local6 = MBh.EmitEvent( {
		name = "vertical_margin_over_children"
	} )
	f8_local1.vertical_margin_over = f8_local2( f8_local4 )
	f8_local2 = MBh.DoMultiple
	f8_local3 = {}
	f8_local4 = MBh.AnimateToState( "default", 100, true, false )
	f8_local5 = MBh.EmitEvent( {
		name = "horizontal_margin_up_children"
	} )
	f8_local1.horizontal_margin_up = f8_local2( f8_local4 )
	f8_local2 = MBh.DoMultiple
	f8_local3 = {}
	f8_local4 = MBh.AnimateToState( "default", 100, true, false )
	f8_local5 = MBh.EmitEvent( {
		name = "vertical_margin_up_children"
	} )
	f8_local1.vertical_margin_up = f8_local2( f8_local4 )
	f8_local1.margin_updated = RedrawMarginGuide
	f8_local0.handlers = f8_local1
	f8_local0.children = {
		{
			type = "UIImage",
			id = "margins_guide_dim",
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
					red = 0.21,
					green = 0.21,
					blue = 0.21,
					alpha = 0.5
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_lt",
			handlers = {
				horizontal_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				horizontal_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = 0,
					right = 32,
					top = -32,
					bottom = 32,
					material = RegisterMaterial( "h1_deco_arrows_left" ),
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_rt",
			handlers = {
				horizontal_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				horizontal_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = false,
					bottomAnchor = false,
					left = -32,
					right = 0,
					top = -32,
					bottom = 32,
					material = RegisterMaterial( "h1_deco_arrows_right" ),
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_top",
			handlers = {
				vertical_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				vertical_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					left = -32,
					right = 32,
					top = 0,
					bottom = 32,
					material = RegisterMaterial( "h1_deco_arrows_up" ),
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_bot",
			handlers = {
				vertical_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				vertical_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = true,
					left = -32,
					right = 32,
					top = -32,
					bottom = 0,
					material = RegisterMaterial( "h1_deco_arrows" ),
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "generic_border"
		}
	}
	return f8_local0
end

LUI.MenuBuilder.registerDef( "margins_guide", margins_guide )
LUI.MenuBuilder.registerDef( "boot_screen_margins", boot_screen_margins )
LockTable( _M )
