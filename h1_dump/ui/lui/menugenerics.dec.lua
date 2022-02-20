local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
function InputFieldOpensVirtualKeyboard( f1_arg0 )
	return Engine.IsConsoleGame() or f1_arg0
end

function InputFieldAction( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetDvarString( f2_arg0.properties.dvar_hook )
	local f2_local1
	if not Engine.IsConsoleGame() and not f2_arg1.mouse then
		f2_local1 = not f2_arg1.keyboard
	else
		f2_local1 = false
	end
	f2_arg0.properties.isPCGamepad = f2_local1
	if InputFieldOpensVirtualKeyboard( f2_local1 ) then
		f2_arg0.properties.active = true
		local f2_local2 = Engine.OpenScreenKeyboard
		local f2_local3 = f2_arg1.controller
		if not f2_local3 then
			f2_local3 = Engine.GetFirstActiveController()
		end
		local f2_local4 = f2_arg0.properties.field_name
		if f2_local0 then
			local f2_local5 = f2_local0
		end
		f2_local2( f2_local3, f2_local4, f2_local5 or "", f2_arg0.properties.max_length, f2_arg0.properties.verify_string, f2_arg0.properties.filter_profanity, f2_arg0.properties.keyboard_type )
	elseif f2_arg0.properties.active then
		f2_arg0:processEvent( {
			name = "finish_editing"
		} )
		f2_arg0.properties.active = false
	else
		local f2_local2 = f2_arg0:getChildById( "input_text" )
		f2_local2:setTextEditActive()
		f2_arg0.properties.active = true
	end
end

function InputFieldUpdateText( f3_arg0, f3_arg1 )
	if f3_arg1.text then
		local f3_local0 = f3_arg0.properties.password_field and string.rep( "*", #f3_arg1.text ) or f3_arg1.text
		local f3_local1 = f3_arg0:getChildById( "input_text" )
		f3_local1:setTextEditText( f3_local0 )
		Engine.SetDvarString( f3_arg0.properties.dvar_hook, f3_arg1.text )
	end
end

function InitField( f4_arg0, f4_arg1 )
	f4_arg0:setTextEditText( f4_arg0.properties.text )
	local f4_local0 = Engine.GetDvarString( f4_arg0.properties.dvar_hook )
	if f4_local0 ~= nil and f4_local0 ~= "" then
		f4_arg0:setTextEditText( f4_arg0.properties.password_field and string.rep( "*", #f4_local0 ) or f4_local0 )
	end
end

function DefaultFieldEditedAction()
	
end

f0_local0 = function ()
	return CoD.TextSettings.TitleFontTiny.Height
end

f0_local1 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5 )
	local f7_local0 = f7_arg4 or GenericPopupAnimationSettings.Global.DelayOut
	local f7_local1 = f7_arg5 or GenericPopupAnimationSettings.Global.DurationOut
	f7_arg0:registerAnimationState( "default", f7_arg1 )
	f7_arg1.alpha = 0
	f7_arg0:registerAnimationState( "hidden", f7_arg1 )
	f7_arg0:animateInSequence( {
		{
			"hidden",
			0,
			true,
			true
		},
		{
			"hidden",
			f7_arg2,
			true,
			true
		},
		{
			"default",
			f7_arg3,
			true,
			true
		}
	} )
	f7_arg0:registerEventHandler( "close_popup", function ( element, event )
		element:animateInSequence( {
			{
				"default",
				f7_local0,
				true,
				true
			},
			{
				"hidden",
				f7_local1,
				true,
				true
			}
		} )
	end )
end

function generic_input_field()
	return {
		type = "UIButton",
		id = "generic_input_field_id",
		focusable = true,
		properties = {
			help_value = "Placeholder field help",
			field_name = "Placeholder Field name",
			dvar_hook = "override_this_with_a_DVarString_name",
			max_length = 16,
			password_field = false,
			active = false,
			isPCGamepad = false,
			field_edited_func = DefaultFieldEditedAction,
			verify_string = false,
			filter_profanity = false,
			keyboard_type = CoD.KeyboardInputTypes.Normal,
			text_alignment = LUI.Alignment.Left
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 0,
				bottom = GenericButtonDims.button_height,
				alpha = 0.5
			},
			over = {
				alpha = 1
			}
		},
		handlers = {
			button_over = MBh.AnimateToState( "over", 0 ),
			button_up = MBh.AnimateToState( "default", 0 ),
			button_action = InputFieldAction,
			text_edit_complete = function ( f10_arg0, f10_arg1 )
				if not InputFieldOpensVirtualKeyboard( f10_arg0.properties.isPCGamepad ) and f10_arg0.properties.active then
					f10_arg1.text = f10_arg0.properties:field_edited_func( f10_arg1 ) or f10_arg1.text
					InputFieldUpdateText( f10_arg0, f10_arg1 )
				end
			end
			,
			text_input_complete = function ( f11_arg0, f11_arg1 )
				if InputFieldOpensVirtualKeyboard( f11_arg0.properties.isPCGamepad ) and f11_arg0.properties.active then
					f11_arg1.text = f11_arg0.properties:field_edited_func( f11_arg1 ) or f11_arg1.text
					InputFieldUpdateText( f11_arg0, f11_arg1 )
					f11_arg0.properties.active = false
				end
			end
			,
			edit_unfocus = function ( f12_arg0, f12_arg1 )
				if not InputFieldOpensVirtualKeyboard( f12_arg0.properties.isPCGamepad ) and f12_arg0.properties.active then
					f12_arg0:processEvent( {
						name = "finish_editing"
					} )
					f12_arg0.properties.active = false
				end
			end
			
		},
		children = {
			{
				type = "UITextEdit",
				id = "input_text",
				properties = {
					text = MBh.Property( "help_value" ),
					max_length = MBh.Property( "max_length" ),
					dvar_hook = MBh.Property( "dvar_hook" ),
					password_field = MBh.Property( "password_field" ),
					text_alignment = MBh.Property( "text_alignment" )
				},
				handlers = {
					menu_create = InitField,
					finish_editing = function ( f13_arg0, f13_arg1 )
						f13_arg0:setTextEditActive( false )
					end
					,
					colorize = function ( f14_arg0, f14_arg1 )
						f14_arg0:registerAnimationState( "colorized", {
							red = f14_arg1.red,
							green = f14_arg1.green,
							blue = f14_arg1.blue
						} )
						f14_arg0:animateToState( "colorized" )
					end
					
				},
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = 0,
						top = 0,
						bottom = f0_local0(),
						font = CoD.TextSettings.TitleFontTiny.Font,
						alignment = MBh.Property( "text_alignment" )
					}
				}
			}
		}
	}
end

f0_local2 = function ( f15_arg0, f15_arg1 )
	if f15_arg1.string then
		f15_arg0:setText( f15_arg1.string )
	end
end

local f0_local3 = function ( f16_arg0, f16_arg1 )
	if f16_arg1.string then
		f16_arg0:setText( f16_arg1.string )
	end
end

function HandleMenuTitleShow( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1.preAnimTime or 0
	local f17_local1 = f17_arg1.animTime or 0
	if f17_arg0.properties.isHidden then
		local f17_local2 = MBh.AnimateSequence( {
			{
				"hidden",
				f17_local0
			},
			{
				"shown",
				f17_local1
			}
		} )
		f17_local2( f17_arg0 )
		f17_arg0.properties.isHidden = false
	end
end

function HandleMenuTitleHide( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg1.preAnimTime or 0
	local f18_local1 = f18_arg1.animTime or 0
	if not f18_arg0.properties.isHidden then
		local f18_local2 = MBh.AnimateSequence( {
			{
				"shown",
				f18_local0
			},
			{
				"hidden",
				f18_local1
			}
		} )
		f18_local2( f18_arg0 )
		f18_arg0.properties.isHidden = true
	end
end

function AddHeaderDecorations( f19_arg0 )
	local f19_local0 = {
		leftAnchor = true,
		topAnchor = true,
		height = 15,
		width = 15,
		left = -42,
		top = 25,
		material = RegisterMaterial( "h1_deco_header_icon_doublebars" )
	}
	f19_arg0:addElement( LUI.UIImage.new( f19_local0 ) )
	f19_local0.height = 15
	f19_local0.width = 15
	f19_local0.left = -25
	f19_local0.top = 25
	f19_local0.zRot = 90
	f19_local0.material = RegisterMaterial( "h1_deco_header_icon_doublebars" )
	f19_arg0:addElement( LUI.UIImage.new( f19_local0 ) )
end

function generic_menu_title( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "generic_menu_title_container_id"
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = 128
	} )
	self:registerAnimationState( "hidden", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -128,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f20_local1 = LUI.DeepCopy( controller )
	f20_local1.parent = self
	f20_local1.type = "generic_menu_title_and_breadCrumb_text"
	local f20_local2 = CoD.CreateState( -10, -14, nil, nil, CoD.AnchorTypes.TopLeft )
	f20_local2.material = RegisterMaterial( "h1_title_background" )
	f20_local2.width = 584
	f20_local2.height = 138
	f20_local2.alpha = 0.6
	local self = LUI.UIImage.new( f20_local2 )
	self.id = "generic_menu_title_background_id"
	self.properties = {
		isHidden = false
	}
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "shown", {
		alpha = 1
	} )
	self:registerEventHandler( "menu_title_show", HandleMenuTitleShow )
	self:registerEventHandler( "menu_title_hide", HandleMenuTitleHide )
	self:addElement( self )
	self:addElement( LUI.SimpleAnimatedObjects.new( {
		{
			introDelay = {
				500,
				1000
			},
			once = false,
			repeatDelay = {
				4000,
				8000
			},
			hudlist = {
				{
					material = "h1_btn_reg_selected_glow",
					anchor = CoD.AnchorTypes.TopLeft,
					top = {
						10,
						50
					},
					left = 10,
					height = 2,
					width = 100,
					alpha = 0,
					durationMultiplier = {
						0.5,
						1.5
					},
					loop = false,
					states = {
						{
							left = 0,
							alpha = 0.1,
							duration = 200
						},
						{
							left = 100,
							alpha = 0.1,
							duration = 200
						},
						{
							left = 200,
							alpha = 0,
							duration = 200
						}
					}
				}
			}
		},
		{
			introDelay = 0,
			once = true,
			hudlist = {
				{
					childFunc = AddHeaderDecorations,
					anchor = CoD.AnchorTypes.TopLeft,
					top = 0,
					left = 0,
					height = 50,
					width = 50,
					alpha = 1,
					loop = true,
					randomizeloop = true,
					scale = 0,
					alpha = 0.4,
					states = {
						{
							duration = {
								6000,
								25000
							}
						},
						{
							top = -20,
							left = 60,
							scale = 0.75,
							duration = 1
						},
						{
							top = -20,
							left = 60,
							scale = 0.75,
							duration = 33
						},
						{
							top = 14,
							left = 5,
							scale = -0.2,
							duration = 1
						},
						{
							top = 14,
							left = 5,
							scale = -0.2,
							duration = 33
						},
						{
							top = 12,
							left = 15,
							duration = 1
						},
						{
							top = 12,
							left = 15,
							duration = 33
						},
						{
							duration = 1
						}
					}
				}
			}
		},
		{
			introDelay = 0,
			repeatDelay = {
				1000,
				8000
			},
			hudlist = {
				{
					material = {
						"h1_title_splatter01",
						"h1_title_splatter02"
					},
					zRot = {
						0,
						180,
						0,
						180
					},
					flippedX = {
						true,
						false
					},
					flippedY = {
						true,
						false
					},
					scaleAdditive = {
						0.25,
						0.9
					},
					anchor = CoD.AnchorTypes.TopLeft,
					top = {
						-10,
						60
					},
					height = 32,
					width = 32,
					alpha = 0,
					states = {
						{
							left = {
								-30,
								0
							},
							alpha = 0,
							duration = 0
						},
						{
							left = {
								50,
								200
							},
							alpha = {
								0.2,
								0.6
							},
							duration = 30000
						},
						{
							left = {
								250,
								400
							},
							alpha = 0,
							duration = 30000
						}
					}
				}
			}
		},
		{
			introDelay = 0,
			repeatDelay = {
				10000,
				15000
			},
			hudlist = {
				{
					material = {
						"h1_title_splatter02"
					},
					zRot = {
						0,
						180,
						0,
						180
					},
					flippedX = {
						true,
						false
					},
					flippedY = {
						true,
						false
					},
					scaleAdditive = {
						2,
						10
					},
					anchor = CoD.AnchorTypes.TopLeft,
					top = {
						-10,
						50
					},
					height = 32,
					width = 32,
					alpha = 0,
					states = {
						{
							left = {
								-50,
								-20
							},
							scale = 0,
							alpha = 0,
							duration = 0
						},
						{
							left = {
								100,
								200
							},
							scale = 0,
							alpha = {
								0.1,
								0.3
							},
							duration = 25000
						},
						{
							left = {
								250,
								400
							},
							scale = 0,
							alpha = 0,
							duration = 25000
						}
					}
				}
			}
		},
		{
			introDelay = {
				2000,
				5000
			},
			once = false,
			repeatDelay = 12000,
			hudlist = {
				{
					material = "h1_title_glitch",
					anchor = CoD.AnchorTypes.TopLeft,
					height = {
						25,
						35
					},
					width = {
						50,
						150
					},
					alpha = 0,
					durationMultiplier = {
						0.5,
						1.5
					},
					loop = false,
					states = {
						{
							top = 10,
							left = 250,
							alpha = 0,
							duration = 1
						},
						{
							top = 10,
							left = 300,
							alpha = 0.4,
							duration = 200
						},
						{
							top = 15,
							left = 350,
							alpha = 0,
							duration = 1
						},
						{
							top = 15,
							left = 400,
							alpha = 0.5,
							duration = 200
						},
						{
							top = 20,
							left = 450,
							alpha = 0,
							duration = 1
						}
					}
				}
			}
		},
		{
			introDelay = {
				1200,
				3600
			},
			once = false,
			repeatDelay = 10000,
			hudlist = {
				{
					material = "h1_title_glitch",
					anchor = CoD.AnchorTypes.TopLeft,
					height = {
						20,
						40
					},
					width = {
						50,
						100
					},
					alpha = 0,
					durationMultiplier = {
						0.5,
						1.5
					},
					loop = false,
					states = {
						{
							top = 25,
							left = 100,
							alpha = 0,
							duration = 1
						},
						{
							top = 25,
							left = 150,
							alpha = 0.4,
							duration = 200
						},
						{
							top = 30,
							left = 200,
							alpha = 0,
							duration = 1
						},
						{
							top = 30,
							left = 250,
							alpha = 0.4,
							duration = 200
						},
						{
							top = 50,
							left = 300,
							alpha = 0,
							duration = 1
						}
					}
				}
			}
		},
		{
			introDelay = {
				1000,
				3000
			},
			once = false,
			repeatDelay = 15000,
			hudlist = {
				{
					material = "h1_title_glitch",
					anchor = CoD.AnchorTypes.TopLeft,
					height = {
						15,
						25
					},
					width = {
						30,
						60
					},
					alpha = 0,
					durationMultiplier = {
						0.5,
						1.5
					},
					loop = false,
					states = {
						{
							top = 25,
							left = 150,
							alpha = 0,
							duration = 1
						},
						{
							top = 25,
							left = 200,
							alpha = 0.5,
							duration = 200
						},
						{
							top = 30,
							left = 250,
							alpha = 0,
							duration = 1
						},
						{
							top = 30,
							left = 300,
							alpha = 0.3,
							duration = 200
						},
						{
							top = 50,
							left = 100,
							alpha = 0,
							duration = 1
						}
					}
				}
			}
		},
		{
			introDelay = 5000,
			once = false,
			repeatDelay = {
				10000,
				25000
			},
			hudlist = {
				{
					material = "h1_title_glitch",
					anchor = CoD.AnchorTypes.TopLeft,
					top = 0,
					left = 0,
					height = {
						50,
						70
					},
					width = {
						200,
						350
					},
					loop = false,
					scale = 0,
					alpha = 0.5,
					states = {
						{
							top = -10,
							left = 30,
							scale = 0.3,
							duration = 1
						},
						{
							top = -10,
							left = 30,
							scale = 0.3,
							duration = 33
						},
						{
							top = -35,
							left = 5,
							scale = -0.2,
							duration = 1
						},
						{
							top = -35,
							left = 5,
							scale = -0.2,
							duration = 33
						},
						{
							top = 15,
							left = -35,
							duration = 1
						},
						{
							top = 15,
							left = -35,
							duration = 33
						},
						{
							duration = 1
						}
					}
				}
			}
		},
		{
			introDelay = 0,
			once = true,
			hudlist = {
				{
					material = "h1_title_glitch",
					anchor = CoD.AnchorTypes.TopLeft,
					top = 14,
					height = 44,
					width = 162,
					loop = true,
					states = {
						{
							left = 40,
							scale = 1,
							alpha = 0.9,
							duration = 8000
						},
						{
							left = 20,
							scale = 0.5,
							alpha = 0.85,
							duration = 8000
						}
					}
				}
			}
		},
		{
			introDelay = 0,
			once = true,
			hudlist = {
				{
					childType = f20_local1,
					anchor = CoD.AnchorTypes.TopLeft,
					top = 0,
					left = 0,
					height = 50,
					width = 50,
					alpha = 1,
					loop = true,
					randomizeloop = true,
					states = {
						{
							alpha = 1
						}
					}
				}
			}
		}
	}, 66 ) )
	return self
end

function generic_menu_title_and_breadCrumb_text( f21_arg0, f21_arg1 )
	local f21_local0 = CoD.TextSettings.H1TitleFont
	local f21_local1 = CoD.TextSettings.TitleFontTiny
	local f21_local2 = GenericMenuDims.MenuStartX
	local f21_local3 = GenericMenuDims.TitleTop
	if f21_arg0.headerStartX ~= nil then
		f21_local2 = f21_arg0.headerStartX
	end
	if f21_arg0.headerStartY ~= nil then
		f21_local3 = f21_arg0.headerStartY
	end
	local f21_local4 = 1280 - f21_local2 - f21_local2
	if f21_arg0.menu_title_width ~= nil then
		f21_local4 = f21_arg0.menu_title_width
	end
	local f21_local5 = 0
	if f21_arg0.marqueePadding ~= nil then
		f21_local5 = f21_arg0.marqueePadding
	end
	local self = LUI.UIElement.new()
	self.id = "generic_menu_title_id"
	self.properties = {
		isHidden = false
	}
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		top = f21_local3,
		bottom = f21_local3 + f21_local0.Height,
		left = f21_local2,
		width = f21_local4
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "shown", {
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "menu_title_show", HandleMenuTitleShow )
	self:registerEventHandler( "menu_title_hide", HandleMenuTitleHide )
	local f21_local7 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -f21_local1.Height * 0.9 - 4,
		bottom = -4,
		font = f21_local1.Font,
		horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft,
		color = Colors.mw1_green
	}
	local f21_local8 = LUI.MenuTemplate.GetDefaultBreadCrumpText()
	local self = LUI.UIText.new( f21_local7 )
	self.id = "breadcrumb_text"
	local f21_local10 = f21_arg0.menu_breadcrumb
	if not f21_local10 then
		f21_local10 = f21_local8
	end
	self:setText( f21_local10 )
	self:registerAnimationState( "default", f21_local7 )
	self:registerEventHandler( "update_breadcrumb_text", f0_local2 )
	self:animateToState( "default" )
	self:addElement( self )
	local f21_local11 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = f21_local0.Height,
		font = f21_local0.Font,
		horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft,
		color = Colors.h1.light_grey
	}
	local self = LUI.UIText.new( f21_local11 )
	self.id = "header_text"
	local f21_local13 = self
	local f21_local14 = self.setText
	local f21_local15 = f21_arg0.menu_title
	if not f21_local15 then
		f21_local15 = ""
	end
	f21_local14( f21_local13, f21_local15 )
	self:registerAnimationState( "default", f21_local11 )
	self:registerEventHandler( "update_header_text", f0_local3 )
	self:animateToState( "default" )
	self:setTextStyle( CoD.TextStyle.MW1Title )
	self:addElement( self )
	return self
end

headerHeight = 35
function generic_border( f22_arg0, f22_arg1 )
	local f22_local0 = false
	if f22_arg1.inner ~= nil then
		f22_local0 = f22_arg1.inner
	end
	local f22_local1 = f22_arg1.thickness
	if not f22_local1 then
		f22_local1 = 1
	end
	if not f22_arg1.border_red then
		local f22_local2 = 1
	end
	if not f22_arg1.border_green then
		local f22_local3 = 1
	end
	if not f22_arg1.border_blue then
		local f22_local4 = 1
	end
	local f22_local5 = f22_arg1.border_alpha
	if not f22_local5 then
		f22_local5 = 1
	end
	if f22_arg1.border_color then
		local f22_local2 = f22_arg1.border_color.r
		local f22_local3 = f22_arg1.border_color.g
		local f22_local4 = f22_arg1.border_color.b
	end
	local f22_local6 = f22_arg1.hide_bottom
	if not f22_local6 then
		f22_local6 = false
	end
	local self = LUI.UIElement.new( f22_arg1.defAnimState )
	local self = self
	local self = self.registerAnimationState
	local self = "default"
	local self = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	}
	if f22_local0 then
		local f22_local12 = f22_local1
	end
	self.top = f22_local12 or 0
	local f22_local13
	if f22_local0 then
		f22_local13 = -f22_local1
		if not f22_local13 then
		
		else
			self.bottom = f22_local13
			if f22_local0 then
				local f22_local14 = f22_local1
			end
			self.left = f22_local14 or 0
			f22_local13
			if f22_local0 then
				f22_local13 = -f22_local1
				if not f22_local13 then
				
				else
					self.right = f22_local13
					self( self, self, self )
					self:animateToState( "default" )
					self = LUI.UIImage.new()
					self.id = "top"
					self:registerAnimationState( "default", {
						material = RegisterMaterial( "white" ),
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = -f22_local1,
						bottom = 0,
						left = 0,
						right = 0
					} )
					self:animateToState( "default" )
					self:addElement( self )
					self = nil
					if not f22_local6 then
						self = LUI.UIImage.new()
						self.id = "bottom"
						self:registerAnimationState( "default", {
							material = RegisterMaterial( "white" ),
							topAnchor = false,
							bottomAnchor = true,
							leftAnchor = true,
							rightAnchor = true,
							top = 0,
							bottom = f22_local1 or 0,
							left = 0,
							right = 0
						} )
						self:animateToState( "default" )
						self:addElement( self )
					end
					self = LUI.UIImage.new()
					self.id = "left"
					f22_local13 = self
					self = self.registerAnimationState
					local f22_local15 = "default"
					local f22_local16 = {
						material = RegisterMaterial( "white" ),
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -f22_local1
					}
					if not f22_local6 then
						local f22_local17 = f22_local1
					end
					f22_local16.bottom = f22_local17 or 0
					f22_local16.left = -f22_local1
					f22_local16.right = 0
					self( f22_local13, f22_local15, f22_local16 )
					self:animateToState( "default" )
					self:addElement( self )
					self = LUI.UIImage.new()
					self.id = "right"
					f22_local15 = self
					f22_local13 = self.registerAnimationState
					f22_local16 = "default"
					local f22_local18 = {
						material = RegisterMaterial( "white" ),
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = false,
						rightAnchor = true,
						top = -f22_local1
					}
					if not f22_local6 then
						local f22_local19 = f22_local1
					end
					f22_local18.bottom = f22_local19 or 0
					f22_local18.left = 0
					f22_local18.right = f22_local1
					f22_local13( f22_local15, f22_local16, f22_local18 )
					self:animateToState( "default" )
					self:addElement( self )
					self.colorize = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
						for f23_local3, f23_local4 in ipairs( {
							self,
							self,
							self,
							self
						} ) do
							f23_local4:registerAnimationState( "current", {
								red = f23_arg0,
								green = f23_arg1,
								blue = f23_arg2,
								alpha = f23_arg3
							} )
							f23_local4:animateToState( "current" )
						end
					end
					
					self.colorize( f22_local2, f22_local3, f22_local4, f22_local5 )
					self:registerEventHandler( "updateBorderColor", function ( element, event )
						element.colorize( event.red, event.green, event.blue, event.alpha )
					end )
					return self
				end
			end
			f22_local13 = 0
		end
	end
	f22_local13 = 0
end

genericPopupMessageWidth = 300
genericPopupMessageHeight = 75
function generic_popup_message( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "generic_test_id"
	self.properties = {
		message_text = controller.message_text
	}
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" ) )
	local f25_local1 = CoD.CreateState( -200, -75, 200, nil, CoD.AnchorTypes.None )
	f25_local1.height = 85
	local self = LUI.UIElement.new( f25_local1 )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_popup_background" ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Green ) )
	local f25_local3 = CoD.CreateState( 0, nil, 0, nil, CoD.AnchorTypes.LeftRight )
	f25_local3.height = CoD.TextSettings.PopupFont.Height
	f25_local3.font = CoD.TextSettings.PopupFont.Font
	f25_local3.alignment = LUI.Alignment.Center
	f25_local3.red = Colors.secondary_text_color.r
	f25_local3.green = Colors.secondary_text_color.g
	f25_local3.blue = Colors.secondary_text_color.b
	local self = LUI.UIText.new( f25_local3 )
	self:setText( controller.message_text )
	self.properties = {
		text = controller.message_text
	}
	self:addElement( self )
	self:addElement( self )
	return self
end

local f0_local4 = function ()
	return {
		type = "UIElement",
		id = "spacer",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 0,
				right = 0,
				top = 0,
				bottom = 12
			}
		}
	}
end

local f0_local5 = function ( f27_arg0, f27_arg1 )
	f27_arg0:setText( f27_arg1.message_text )
	f27_arg0:dispatchEventToRoot( {
		name = "resize_popup"
	} )
end

function generic_confirmation_popup( f28_arg0, f28_arg1 )
	if not f28_arg1 then
		f28_arg1 = {}
	end
	local f28_local0 = f28_arg1.message_text_alignment
	if not f28_local0 then
		f28_local0 = LUI.Alignment.Left
	end
	f28_arg1.message_text_alignment = f28_local0
	f28_arg1.popup_title = f28_arg1.popup_title or ""
	f28_arg1.message_text = f28_arg1.message_text or ""
	f28_local0 = f28_arg1.button_text
	if not f28_local0 then
		f28_local0 = Engine.Localize( "@MENU_EXIT" )
	end
	f28_arg1.button_text = f28_local0
	f28_arg1.confirmation_action = f28_arg1.confirmation_action or function ( f29_arg0, f29_arg1 )
		DebugPrint( "Running generic_confirmation_popup default action" )
	end
	
	f28_arg1.callback_params = f28_arg1.callback_params or {}
	f28_arg1.padding_top = f28_arg1.padding_top or 12
	if f28_arg1.cancel_will_close == nil then
		f28_local0 = true
	else
		f28_local0 = f28_arg1.cancel_will_close
	end
	f28_arg1.cancel_will_close = f28_local0
	if f28_arg1.confirm_will_close == nil then
		f28_local0 = true
	else
		f28_local0 = f28_arg1.confirm_will_close
	end
	f28_arg1.confirm_will_close = f28_local0
	if f28_arg1.popup_childfeeder == nil then
		f28_arg1.popup_childfeeder = function ( f30_arg0 )
			return {
				{
					type = "UIText",
					id = "message_text_id",
					properties = {
						text = MBh.Property( "message_text" ),
						message_text_alignment = MBh.Property( "message_text_alignment" )
					},
					states = {
						default = {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = true,
							top = 0,
							bottom = CoD.TextSettings.PopupFont.Height,
							left = 12,
							right = -12,
							alignment = LUI.AdjustAlignmentForLanguage( f30_arg0.message_text_alignment ),
							font = CoD.TextSettings.PopupFont.Font,
							color = Colors.h1.light_grey,
							lineSpacingRatio = 0.2
						}
					},
					handlers = {
						update_message = f0_local5
					}
				},
				f0_local4(),
				{
					type = "UIGenericButton",
					id = "exit_button_id",
					audio = {
						button_over = CoD.SFX.SubMenuMouseOver
					},
					properties = {
						confirmation_action = MBh.Property( "confirmation_action" ),
						button_text = MBh.Property( "button_text" ),
						confirm_will_close = MBh.Property( "confirm_will_close" ),
						button_action_func = function ( f31_arg0, f31_arg1 )
							local f31_local0 = function ( f32_arg0, f32_arg1 )
								f32_arg0.properties:confirmation_action( f32_arg1 )
								if f32_arg0.properties.confirm_will_close then
									LUI.FlowManager.RequestLeaveMenu( f32_arg0, nil, nil, f32_arg1.controller )
								end
							end
							
							if f31_arg0.properties.parent_popup then
								if f31_arg1 ~= nil then
									f31_arg1.name = "close_popup"
									f31_arg1.dispatchChildren = true
								end
								f31_arg0.properties.parent_popup:dispatchEventToChildren( f31_arg1 )
								f31_arg0:registerEventHandler( "popup_closed", f31_local0 )
							else
								f31_local0( f31_arg0, f31_arg1 )
							end
						end
						,
						callback_params = MBh.Property( "callback_params" ),
						text_align_without_content = LUI.Alignment.Center,
						parent_popup = nil
					}
				}
			}
		end
		
	end
	f28_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", f28_arg1 )
	f28_local0:registerAnimationState( "default", CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	return f28_local0
end

function addLoadingAnimationWidget( f33_arg0, f33_arg1 )
	local f33_local0 = CoD.CreateState( nil, -LoadingAnimationDims.Height / 2, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f33_local0.height = LoadingAnimationDims.Height
	f33_local0.horizontalAlignment = LUI.HorizontalAlignment.Center
	f33_arg0.loadingAnimationContainer = LUI.UIElement.new( f33_local0 )
	f33_arg0.loadingAnimationContainer.id = "animation_container"
	f33_arg0:addElement( f33_arg0.loadingAnimationContainer )
	f33_arg0.loadingAnimationContainer:addElement( LUI.MenuBuilder.BuildRegisteredType( "loading_animation_widget" ) )
end

function generic_waiting_popup( f34_arg0, f34_arg1 )
	if not f34_arg1 then
		f34_arg1 = {}
	end
	local f34_local0 = f34_arg1.message_text_alignment
	if not f34_local0 then
		f34_local0 = LUI.Alignment.Left
	end
	f34_arg1.message_text_alignment = f34_local0
	f34_arg1.popup_title = f34_arg1.popup_title or ""
	f34_local0 = f34_arg1.button_text
	if not f34_local0 then
		f34_local0 = Engine.Localize( "@MENU_EXIT" )
	end
	f34_arg1.button_text = f34_local0
	f34_arg1.confirmation_action = f34_arg1.confirmation_action or function ( f35_arg0, f35_arg1 )
		DebugPrint( "Running generic_waiting_popup default action" )
	end
	
	f34_arg1.callback_params = f34_arg1.callback_params or {}
	f34_arg1.padding_top = f34_arg1.padding_top or 12
	if f34_arg1.cancel_will_close == nil then
		f34_local0 = true
	else
		f34_local0 = f34_arg1.cancel_will_close
	end
	f34_arg1.cancel_will_close = f34_local0
	if f34_arg1.confirm_will_close == nil then
		f34_local0 = true
	else
		f34_local0 = f34_arg1.confirm_will_close
	end
	f34_arg1.confirm_will_close = f34_local0
	if f34_arg1.popup_childfeeder == nil then
		f34_arg1.popup_childfeeder = function ( f36_arg0 )
			return {
				{
					type = "UIElement",
					id = "loading_icon",
					states = {
						default = {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = true,
							top = 0,
							bottom = CoD.TextSettings.PopupFont.Height
						}
					},
					handlers = {
						menu_create = addLoadingAnimationWidget
					}
				},
				{
					type = "UIGenericButton",
					id = "exit_button_id",
					audio = {
						button_over = CoD.SFX.SubMenuMouseOver
					},
					properties = {
						confirmation_action = MBh.Property( "confirmation_action" ),
						button_text = MBh.Property( "button_text" ),
						confirm_will_close = MBh.Property( "confirm_will_close" ),
						button_action_func = function ( f37_arg0, f37_arg1 )
							local f37_local0 = function ( f38_arg0, f38_arg1 )
								f38_arg0.properties:confirmation_action( f38_arg1 )
								if f38_arg0.properties.confirm_will_close then
									LUI.FlowManager.RequestLeaveMenu( f38_arg0, nil, nil, f38_arg1.controller )
								end
							end
							
							if f37_arg0.properties.parent_popup then
								if f37_arg1 ~= nil then
									f37_arg1.name = "close_popup"
									f37_arg1.dispatchChildren = true
								end
								f37_arg0.properties.parent_popup:dispatchEventToChildren( f37_arg1 )
								f37_arg0:registerEventHandler( "popup_closed", f37_local0 )
							else
								f37_local0( f37_arg0, f37_arg1 )
							end
						end
						,
						callback_params = MBh.Property( "callback_params" ),
						text_align_without_content = LUI.Alignment.Center,
						parent_popup = nil
					}
				}
			}
		end
		
	end
	f34_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", f34_arg1 )
	f34_local0:registerAnimationState( "default", CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	return f34_local0
end

function CreatePurchasePopupRow( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
	local f39_local0 = 15
	local f39_local1 = 16
	return {
		type = "UIHorizontalList",
		id = "yesno_message_" .. f39_arg0 .. "_hl_id",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = true,
				top = 0,
				left = 12 + f39_arg1,
				right = -32,
				height = CoD.TextSettings.TitleFontSmall.Height
			}
		},
		children = {
			{
				type = "UIText",
				id = "yesno_message_" .. f39_arg0 .. "_text_id",
				properties = {
					text = MBh.Property( f39_arg2 )
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = false,
						rightAnchor = true,
						top = 0,
						left = 0,
						right = -(f39_local1 + 32 + f39_local0),
						height = CoD.TextSettings.TitleFontSmall.Height,
						font = CoD.TextSettings.TitleFontSmall.Font,
						alignment = LUI.Alignment.Right,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b
					}
				}
			},
			{
				type = "UIElement",
				id = "yesno_message_" .. f39_arg0 .. "_spacer",
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = true,
						rightAnchor = false,
						top = 0,
						left = 0,
						width = f39_local0
					}
				}
			},
			{
				type = "UIImage",
				id = "yesno_message_" .. f39_arg0 .. "_image_id",
				states = {
					default = {
						topAnchor = false,
						leftAnchor = false,
						bottomAnchor = false,
						rightAnchor = false,
						top = -f39_local1 * 0.5,
						left = -f39_local1 * 0.5,
						bottom = f39_local1 * 0.5,
						right = f39_local1 * 0.5,
						material = f39_arg3
					}
				}
			},
			{
				type = "UIText",
				id = "yesno_message_" .. f39_arg0 .. "_id",
				properties = {
					text = MBh.Property( f39_arg4 )
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = false,
						rightAnchor = true,
						top = 0,
						left = 0,
						right = -12,
						height = CoD.TextSettings.BodyFont.Height,
						font = CoD.TextSettings.BodyFont.Font,
						alignment = LUI.Alignment.Left,
						red = Colors.white.r,
						green = Colors.white.g,
						blue = Colors.white.b
					}
				}
			}
		}
	}
end

function YesNoFeeder( f40_arg0 )
	local f40_local0 = {}
	if not f40_arg0.message_image then
		f40_local0[#f40_local0 + 1] = {
			type = "UIText",
			id = "yesno_message_text_id",
			properties = {
				text = MBh.Property( "message_text" )
			},
			states = {
				default = {
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true,
					top = 0,
					bottom = CoD.TextSettings.PopupFont.Height,
					left = 12,
					right = -12,
					font = CoD.TextSettings.PopupFont.Font,
					color = Colors.h1.light_grey,
					alignment = LUI.AdjustAlignmentForLanguage( f40_arg0.message_text_alignment ),
					spacing = 6,
					lineSpacingRatio = 0.2
				}
			},
			handlers = {
				update_message = f0_local5
			}
		}
	else
		f40_local0[#f40_local0 + 1] = {
			type = "UIElement",
			id = "yesno_message_container_id",
			states = {
				default = {
					topAnchor = true,
					leftAnchor = true,
					bottomAnchor = false,
					rightAnchor = true,
					top = 0,
					left = 12,
					right = -12,
					height = 0
				}
			},
			children = {
				{
					type = "UIImage",
					id = "yesno_message_image_id",
					states = {
						default = {
							topAnchor = true,
							leftAnchor = true,
							bottomAnchor = false,
							rightAnchor = false,
							top = f40_arg0.message_image_top,
							left = f40_arg0.message_image_left,
							height = f40_arg0.message_image_height,
							width = f40_arg0.message_image_width,
							material = f40_arg0.message_image
						}
					}
				}
			}
		}
		if f40_arg0.message_text then
			f40_local0[#f40_local0 + 1] = {
				type = "UIText",
				id = "yesno_message_text_id",
				properties = {
					text = MBh.Property( "message_text" )
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = false,
						rightAnchor = true,
						top = 0,
						left = 12 + f40_arg0.message_image_width + 20,
						right = -12,
						height = CoD.TextSettings.PopupFont.Height,
						font = CoD.TextSettings.PopupFont.Font,
						alignment = LUI.AdjustAlignmentForLanguage( f40_arg0.message_text_alignment ),
						color = Colors.h1.light_grey,
						lineSpacingRatio = 0.2
					}
				}
			}
		else
			if f40_arg0.message_required_rank_image then
				f40_local0[#f40_local0 + 1] = CreatePurchasePopupRow( "required_rank", f40_arg0.message_image_width, "message_required_rank_text", f40_arg0.message_required_rank_image, "message_required_rank" )
				f40_local0[#f40_local0 + 1] = CreatePurchasePopupRow( "current_rank", f40_arg0.message_image_width, "message_current_rank_text", f40_arg0.message_current_rank_image, "message_current_rank" )
				f40_local0[#f40_local0 + 1] = {
					type = "UIElement",
					id = "yesno_message_separator_container_id",
					states = {
						default = {
							topAnchor = true,
							leftAnchor = false,
							bottomAnchor = false,
							rightAnchor = true,
							top = 0,
							right = 0,
							height = 5,
							width = 300
						}
					},
					children = {
						{
							type = "UIImage",
							id = "yesno_message_separator_image_id",
							states = {
								default = {
									topAnchor = true,
									leftAnchor = true,
									bottomAnchor = false,
									rightAnchor = true,
									top = 2,
									left = 0,
									height = 1,
									material = RegisterMaterial( "white" ),
									alpha = 0.1
								}
							}
						}
					}
				}
			end
			if f40_arg0.message_cost_image then
				f40_local0[#f40_local0 + 1] = CreatePurchasePopupRow( "cost", f40_arg0.message_image_width, "message_cost_text", f40_arg0.message_cost_image, "message_cost" )
				f40_local0[#f40_local0 + 1] = CreatePurchasePopupRow( "squad_points", f40_arg0.message_image_width, "message_squad_points_text", f40_arg0.message_squad_points_image, "message_squad_points" )
			end
		end
	end
	f40_local0[#f40_local0 + 1] = f0_local4()
	if f40_arg0.yes_text then
		f40_local0[#f40_local0 + 1] = {
			type = "UIGenericButton",
			id = "yes_button_id",
			audio = {
				button_over = CoD.SFX.SubMenuMouseOver
			},
			properties = {
				yes_action = MBh.Property( "yes_action" ),
				button_text = MBh.Property( "yes_text" ),
				button_action_func = function ( f41_arg0, f41_arg1 )
					local f41_local0 = function ( f42_arg0, f42_arg1 )
						f42_arg0.properties:yes_action( f42_arg1 )
						LUI.FlowManager.RequestLeaveMenu( f42_arg0 )
					end
					
					if f41_arg0.properties.parent_popup then
						if f41_arg1 ~= nil then
							f41_arg1.name = "close_popup"
							f41_arg1.dispatchChildren = true
						end
						f41_arg0.properties.parent_popup:dispatchEventToChildren( f41_arg1 )
						f41_arg0:registerEventHandler( "popup_closed", f41_local0 )
					else
						f41_local0( f41_arg0, f41_arg1 )
					end
				end,
				callback_params = MBh.Property( "callback_params" ),
				text_align_without_content = LUI.Alignment.Center,
				fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
				parent_popup = nil
			}
		}
	end
	f40_local0[#f40_local0 + 1] = {
		type = "UIGenericButton",
		id = "no_button_id",
		audio = {
			button_over = CoD.SFX.SubMenuMouseOver
		},
		properties = {
			no_action = MBh.Property( "no_action" ),
			button_text = MBh.Property( "no_text" ),
			button_action_func = function ( f43_arg0, f43_arg1 )
				local f43_local0 = function ( f44_arg0, f44_arg1 )
					f44_arg0.properties:no_action( f44_arg1 )
					LUI.FlowManager.RequestLeaveMenu( f44_arg0 )
				end
				
				if f43_arg0.properties.parent_popup then
					if f43_arg1 ~= nil then
						f43_arg1.name = "close_popup"
						f43_arg1.dispatchChildren = true
					end
					f43_arg0.properties.parent_popup:dispatchEventToChildren( f43_arg1 )
					f43_arg0:registerEventHandler( "popup_closed", f43_local0 )
				else
					f43_local0( f43_arg0, f43_arg1 )
				end
			end,
			callback_params = MBh.Property( "callback_params" ),
			text_align_without_content = LUI.Alignment.Center,
			fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
			parent_popup = nil
		}
	}
	if f40_arg0.default_focus_index then
		local f40_local1 = assert
		local f40_local2
		if f40_arg0.default_focus_index <= 0 or f40_arg0.default_focus_index > #f40_local0 then
			f40_local2 = false
		else
			f40_local2 = true
		end
		f40_local1( f40_local2 )
		f40_local1 = #f40_local0 - 2
		f40_local0[#f40_local0 - 2 + f40_arg0.default_focus_index].listDefaultFocus = true
	end
	return f40_local0
end

function generic_yesno_popup( f45_arg0, f45_arg1 )
	if not f45_arg1 then
		f45_arg1 = {}
	end
	local f45_local0 = f45_arg1.message_text_alignment
	if not f45_local0 then
		f45_local0 = LUI.Alignment.Left
	end
	f45_arg1.message_text_alignment = f45_local0
	f45_arg1.popup_title = f45_arg1.popup_title or ""
	f45_arg1.message_text = f45_arg1.message_text or ""
	f45_arg1.padding_top = f45_arg1.padding_top or 25
	if f45_arg1.cancel_means_no == nil then
		f45_local0 = true
	else
		f45_local0 = false
	end
	f45_arg1.cancel_means_no = f45_local0
	f45_arg1.yes_action = f45_arg1.yes_action or function ( f46_arg0, f46_arg1 )
		DebugPrint( "Running generic_confirmation_popup yes action" )
	end
	
	f45_arg1.no_action = f45_arg1.no_action or function ( f47_arg0, f47_arg1 )
		DebugPrint( "Running generic_confirmation_popup no action" )
	end
	
	f45_local0 = f45_arg1.yes_text
	if not f45_local0 then
		f45_local0 = Engine.Localize( "@LUA_MENU_YES" )
	end
	f45_arg1.yes_text = f45_local0
	f45_local0 = f45_arg1.no_text
	if not f45_local0 then
		f45_local0 = Engine.Localize( "@LUA_MENU_NO" )
	end
	f45_arg1.no_text = f45_local0
	f45_arg1.callback_params = f45_arg1.callback_params or {}
	f45_arg1.default_focus_index = f45_arg1.default_focus_index or 2
	f45_arg1.popup_childfeeder = f45_arg1.popup_childfeeder or YesNoFeeder
	f45_local0 = f45_arg1.popup_list_spacing
	if not f45_local0 then
		f45_local0 = H1MenuDims.spacing
	end
	f45_arg1.popup_list_spacing = f45_local0
	f45_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", f45_arg1 )
	f45_local0:registerAnimationState( "default", CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	f45_local0:registerEventHandler( "popup_back", function ( element, event )
		if f45_arg1.cancel_means_no then
			f45_arg1.no_action( element, event )
		elseif f45_arg1.cancel_action then
			f45_arg1.cancel_action( element, event )
		end
	end )
	f45_local0:registerEventHandler( "menu_create", function ( element, event )
		element:clearSavedState()
	end )
	return f45_local0
end

local f0_local6 = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4, f50_arg5 )
	local f50_local0 = 30
	if f50_arg0:getRect() then
		local f50_local1 = GenericTitleBarDims.TitleBarHeight + f50_arg3 + f50_arg4 + f50_arg5 * (f50_arg1:getNumChildren() - 1)
		local f50_local2 = f50_arg1:getFirstChild()
		while f50_local2 do
			local f50_local3 = nil
			if f50_local2.getText and f50_local2:getText() then
				local f50_local4 = nil
				f50_local4, f50_local3 = f50_local2:getElementTextDims()
			else
				f50_local3 = f50_local2:getHeight()
			end
			f50_local1 = f50_local1 + f50_local3
			f50_local2 = f50_local2:getNextSibling()
		end
		local f50_local3 = {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			left = -f50_arg2 / 2,
			right = f50_arg2 / 2,
			top = -(f50_local1 / 2 + f50_local0),
			bottom = f50_local1 / 2 - f50_local0,
			alpha = 1
		}
		f50_arg0:registerAnimationState( "final_state", f50_local3 )
		f50_local3.alpha = 0
		f50_arg0:registerAnimationState( "start_state", f50_local3 )
		f50_arg0:registerAnimationState( "wait", f50_local3 )
		f50_arg0:animateInSequence( {
			{
				"start_state",
				0
			},
			{
				"final_state",
				0,
				true,
				true
			}
		}, nil, true, true )
	else
		f50_arg0:animateToState( "start", 1 )
	end
end

function AddDarken( f51_arg0 )
	f51_arg0:addElement( LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "black" ),
		alpha = 0.5,
		color = Colors.white
	} ) )
end

function generic_popup_screen_overlay( f52_arg0 )
	local f52_local0 = f52_arg0 or {}
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "h1_popup_dark_vignetting" )
	} )
	self.id = "generic_popup_screen_overlay_blur"
	self:setupFullWindowElement()
	return self
end

LUI.MenuGenerics.InAnim = function ( f53_arg0 )
	f53_arg0.backgroundBorder:animateInSequence( {
		{
			"default",
			67
		},
		{
			"default",
			66
		},
		{
			"border_dimmed",
			33
		},
		{
			"default",
			33
		},
		{
			"border_dimmed",
			33
		},
		{
			"default",
			33
		}
	} )
	f53_arg0.background:animateInSequence( {
		{
			"default",
			67
		}
	} )
	f53_arg0.titleText:animateInSequence( {
		{
			"hidden",
			GenericPopupAnimationSettings.Window.DelayIn
		},
		{
			"default",
			GenericPopupAnimationSettings.Window.DurationIn
		}
	} )
	f53_arg0.title:animateInSequence( {
		{
			"default",
			67
		},
		{
			"default",
			66
		},
		{
			"title_dimmed",
			33
		},
		{
			"default",
			33
		},
		{
			"title_dimmed",
			33
		},
		{
			"default",
			33
		}
	} )
end

LUI.MenuGenerics.OutAnim = function ( f54_arg0 )
	f54_arg0.backgroundBorder:animateInSequence( {
		{
			"hidden",
			67
		}
	} )
	f54_arg0.background:animateInSequence( {
		{
			"hidden",
			67
		}
	} )
	f54_arg0.titleText:animateInSequence( {
		{
			"hidden",
			GenericPopupAnimationSettings.Window.DurationOut
		}
	} )
	f54_arg0.title:animateInSequence( {
		{
			"hidden",
			67
		}
	} )
end

LUI.MenuGenerics.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local self = LUI.UIImage.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		material = RegisterMaterial( "black" ),
		alpha = 0.6
	} )
	self:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		alpha = 0
	} )
	self:animateToState( "hidden" )
	self.background = self
	self:addElement( self )
	local self = LUI.UIImage.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = GenericTitleBarDims.TitleBarHeight - 1,
		bottom = 0,
		material = RegisterMaterial( "h1_popup_bg" ),
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		alpha = 0
	} )
	self:registerAnimationState( "border_dimmed", {
		alpha = 0.5
	} )
	self:animateToState( "hidden" )
	self.backgroundBorder = self
	self:addElement( self )
	local f55_local3 = controller.titleBarTextIndent
	if not f55_local3 then
		f55_local3 = GenericTitleBarDims.TitleBarLCapWidth
	end
	local f55_local4 = controller.titleAlign
	if not f55_local4 then
		f55_local4 = LUI.Alignment.Left
	end
	local f55_local5 = controller.title or "PLACEMENT TEXT"
	local f55_local6 = controller.titleFont
	if not f55_local6 then
		f55_local6 = CoD.TextSettings.TitleFontSmaller
	end
	local f55_local7 = controller.vertOffset
	if not f55_local7 then
		f55_local7 = GenericTitleBarDims.TitleBarHeight / 2 - f55_local6.Height / 2 + 2
	end
	local f55_local8 = controller.color
	if not f55_local8 then
		f55_local8 = Colors.white
	end
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, GenericTitleBarDims.TitleBarHeight, CoD.AnchorTypes.TopLeftRight, {
		alpha = 1
	} ) )
	self:animateToState( "default" )
	local f55_local10 = generic_menu_titlebar_background( nil, controller )
	f55_local10:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		alpha = 0
	} )
	f55_local10:registerAnimationState( "title_dimmed", {
		alpha = 0.4
	} )
	f55_local10:animateToState( "hidden" )
	self.title = f55_local10
	self:addElement( f55_local10 )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = f55_local7,
		height = f55_local6.Height,
		left = f55_local3,
		right = -f55_local3,
		font = f55_local6.Font,
		color = f55_local8,
		alignment = f55_local4,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "hidden" )
	self.id = "titleText"
	self:setText( f55_local5 )
	self:registerEventHandler( "update_title", setTitleText )
	self.titleText = self
	self:addElement( self )
	self:addElement( self )
	self:registerEventHandler( "menu_create", LUI.MenuGenerics.InAnim )
	self:registerEventHandler( "close_popup", LUI.MenuGenerics.OutAnim )
	return self
end

function generic_selectionList_popup( f56_arg0, f56_arg1 )
	f56_arg1.paddingBottom = f56_arg1.padding_bottom or 11
	f56_arg1.paddingRight = f56_arg1.padding_right or 11
	f56_arg1.paddingLeft = f56_arg1.padding_left or 11
	f56_arg1.paddingTop = f56_arg1.padding_top or 11
	local f56_local0 = f56_arg1.popup_title_alignment
	if not f56_local0 then
		f56_local0 = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	end
	f56_arg1.titleAlign = f56_local0
	f56_local0 = f56_arg1.titleAlign
	local f56_local1 = LUI.Alignment.Left
	f56_arg1.titleBarTextIndent = REG23 and 12 or 0
	f56_arg1.title = Engine.ToUpperCase( f56_arg1.popup_title ) or "popup_title property"
	if f56_arg1.cancel_will_close ~= nil then
		f56_local0 = f56_arg1.cancel_will_close
	else
		f56_local0 = true
	end
	f56_arg1.cancel_will_close = f56_local0
	f56_arg1.titleFont = CoD.TextSettings.TitleFontSmaller
	f56_local0 = f56_arg1.popup_list_spacing
	if not f56_local0 then
		f56_local0 = H1MenuDims.spacing
	end
	f56_arg1.listSpacing = f56_local0
	local f56_local0, f56_local1, f56_local2, f56_local3 = GetTextDimensions( f56_arg1.title, f56_arg1.titleFont.Font, f56_arg1.titleFont.Height )
	local self = f56_arg1.popup_width
	if not self then
		self = LUI.clamp( f56_local2 - f56_local0 + 60, GenericPopupDims.Width, 1200 )
	end
	f56_arg1.width = self
	self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local f56_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f56_local5.alpha = 1
	local self = LUI.UIElement.new( f56_local5 )
	self.id = "generic_selectionList_intermediate"
	self:registerAnimationState( "default", f56_local5 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "gain_focus", function ( element, event )
		if event.focusType ~= FocusType.MouseOver then
			element:animateToState( "default" )
		end
		element:dispatchEventToChildren( event )
	end )
	self:registerEventHandler( "restore_focus", function ( element, event )
		element:animateToState( "default" )
	end )
	self:registerEventHandler( "lose_focus", function ( element, event )
		if event.focusType ~= FocusType.MouseOver then
			element:animateToState( "hidden" )
		end
		element:dispatchEventToChildren( event )
	end )
	self:addElement( self )
	self:addElement( generic_popup_screen_overlay() )
	local self = LUI.UIElement.new()
	self.id = "generic_selectionList_window_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		left = -f56_arg1.width / 2,
		right = f56_arg1.width / 2,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self:registerAnimationState( "start", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		left = -f56_arg1.width / 2,
		right = f56_arg1.width / 2,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self:animateToState( "default" )
	self:animateToState( "start", 1 )
	self:addElement( self )
	self:addElement( LUI.MenuGenerics.new( self, f56_arg1 ) )
	local self = LUI.UIVerticalList.new()
	self.id = "generic_selectionList_content_id"
	f0_local1( self, {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = f56_arg1.paddingLeft,
		right = -f56_arg1.paddingRight,
		top = GenericTitleBarDims.TitleBarHeight + f56_arg1.paddingTop,
		bottom = -f56_arg1.paddingBottom,
		spacing = f56_arg1.listSpacing,
		alpha = 1
	}, GenericPopupAnimationSettings.Window.DelayIn, GenericPopupAnimationSettings.Window.DurationIn, GenericPopupAnimationSettings.Window.DelayOut, GenericPopupAnimationSettings.Window.DurationOut )
	self:addElement( self )
	local f56_local9 = function ( f60_arg0, f60_arg1 )
		f0_local6( f60_arg0, self, f56_arg1.width, f56_arg1.paddingTop, f56_arg1.paddingBottom, f56_arg1.listSpacing )
	end
	
	self:addEventHandler( "menu_create", f56_local9 )
	self:addEventHandler( "resize_popup", f56_local9 )
	self:addEventHandler( "transition_step_complete_final_state", function ( f61_arg0, f61_arg1 )
		Engine.PlaySound( CoD.SFX.PopupAppears )
	end )
	self:registerEventHandler( "close_popup", function ( element, event )
		if self.animOutTimer == nil then
			local self = LUI.UITimer.new( 66, "wait_for_anim_end" )
			self.id = "timer_wait_for_anim_end"
			self.loop = false
			self.animOutTimer = self
			self:addElement( self )
			self:registerEventHandler( "wait_for_anim_end", function ( element, event )
				if event ~= nil then
					event.name = "popup_closed"
				end
				self:dispatchEventToChildren( event )
			end )
		end
	end )
	self:addEventHandler( "transition_complete_start", f56_local9 )
	local f56_local10 = f56_arg1.popup_childfeeder or function ()
		return {}
	end
	
	if type( f56_local10 ) == "table" and f56_local10.isProperty then
		f56_local10 = f56_local10.func( f56_arg1 )
	end
	assert( type( f56_local10 ) == "function", "Feeders must be a function or referenced by the MBh.Property helper" )
	local f56_local11 = f56_local10( f56_arg1 )
	self.childrenFeeder = f56_local10
	if f56_local11 then
		for f56_local15, f56_local16 in ipairs( f56_local11 ) do
			if f56_local16.type == "UIGenericButton" then
				f56_local16.properties.parent_popup = self
				f56_local16.properties.muteAction = f56_arg1.muteAction
			end
		end
		LUI.MenuBuilder.buildChildren( self, f56_arg1, f56_local11 )
	end
	local self = LUI.UIBindButton.new()
	self.id = "generic_selectionList_back_id"
	self:registerEventHandler( "button_secondary", function ( element, event )
		if f56_arg1.cancel_will_close then
			if event ~= nil then
				event.name = "close_popup"
				event.dispatchChildren = true
			end
			self:dispatchEventToChildren( event )
			element:registerEventHandler( "popup_closed", function ( element, event )
				self:processEvent( {
					name = "popup_back",
					controller = event.controller
				} )
				LUI.FlowManager.RequestLeaveMenu( element )
			end )
		else
			self:processEvent( {
				name = "popup_back",
				controller = event.controller
			} )
		end
	end )
	self:addElement( self )
	return self
end

function generic_menu_background( f67_arg0, f67_arg1 )
	if not f67_arg1 then
		f67_arg1 = {}
	end
	local f67_local0 = f67_arg1.bottom_offset or 0
	local f67_local1 = f67_arg1.top_offset
	if not f67_local1 then
		f67_local1 = GenericTitleBarDims.TitleBarHeight
	end
	local self = LUI.UIBackgroundPanel.new( nil, f67_arg1 )
	self.id = "generic_menu_background"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = f67_local1,
		bottom = -f67_local0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	return self
end

function generic_menu_titlebar_background( f68_arg0, f68_arg1 )
	local f68_local0 = CoD.CreateState( 0, 0, 0, GenericTitleBarDims.TitleBarHeight, CoD.AnchorTypes.TopLeftRight )
	f68_local0.material = RegisterMaterial( "h1_popup_title_bg" )
	f68_local0.alpha = 0.6
	local self = LUI.UIImage.new( f68_local0 )
	self.id = "generic_menu_titlebar_background_id"
	return self
end

local f0_local7 = function ( f69_arg0, f69_arg1 )
	f69_arg0:setText( f69_arg1.title_text )
end

function generic_menu_titlebar( f70_arg0, f70_arg1 )
	local f70_local0 = f70_arg1.title_bar_text_indent
	if not f70_local0 then
		f70_local0 = GenericTitleBarDims.TitleBarLCapWidth
	end
	local f70_local1 = f70_arg1.title_bar_alignment
	if not f70_local1 then
		f70_local1 = LUI.Alignment.Left
	end
	local f70_local2 = f70_arg1.title_bar_text or ""
	local f70_local3 = f70_arg1.font
	if not f70_local3 then
		f70_local3 = CoD.TextSettings.TitleFontSmaller
	end
	local f70_local4 = f70_arg1.vertOffset or 2
	local f70_local5 = f70_arg1.color
	if not f70_local5 then
		f70_local5 = Colors.white
	end
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, GenericTitleBarDims.TitleBarHeight, CoD.AnchorTypes.TopLeftRight, {
		alpha = 1
	} ) )
	self:animateToState( "default" )
	self:addElement( generic_menu_titlebar_background( nil, f70_arg1 ) )
	local self = LUI.UIText.new()
	self.id = "title"
	self:setText( f70_local2 )
	f0_local1( self, {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -f70_local3.Height / 2 + f70_local4,
		height = f70_local3.Height,
		left = f70_local0,
		right = -f70_local0,
		font = f70_local3.Font,
		color = f70_local5,
		alignment = f70_local1,
		alpha = 1
	}, GenericPopupAnimationSettings.Title.DelayIn, GenericPopupAnimationSettings.Title.DurationIn )
	self:registerEventHandler( "update_title", f0_local7 )
	self:addElement( self )
	return self
end

function h1_option_menu_titlebar( f71_arg0, f71_arg1 )
	if f71_arg1 == nil then
		f71_arg1 = {}
	end
	local f71_local0 = f71_arg1.title_bar_text_indent
	if not f71_local0 then
		f71_local0 = GenericTitleBarDims.TitleBarLCapWidth
	end
	local f71_local1 = f71_arg1.title_bar_alignment
	if not f71_local1 then
		f71_local1 = LUI.Alignment.Left
	end
	local f71_local2 = f71_arg1.title_bar_text or ""
	local f71_local3 = f71_arg1.font
	if not f71_local3 then
		f71_local3 = CoD.TextSettings.BodyFont24
	end
	local self = LUI.UIElement.new()
	self.id = "title_base_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		height = H1MenuDims.popupTitleBgHeight,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIImage.new()
	self.id = "title_bg_id"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -3,
		height = 1,
		left = f71_local0,
		right = 30,
		material = RegisterMaterial( "h1_deco_option_title" ),
		alpha = 0.5
	} )
	self:animateToState( "default" )
	self:addElement( self )
	local self = LUI.UIText.new()
	self.id = "title_text_id"
	self:setText( f71_local2 )
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = H1MenuDims.popupTitleTextTopOffset,
		height = H1MenuDims.popupTitleBgFontHeight,
		left = f71_local0,
		right = -f71_local0,
		font = f71_local3.Font,
		alignment = f71_local1
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "update_title", f0_local7 )
	self:addElement( self )
	return self
end

function RefreshScrollList( f72_arg0, f72_arg1 )
	f72_arg0:closeChildren()
	f72_arg0:clearSavedState()
	f72_arg0:processEvent( {
		name = "menu_refresh"
	} )
end

function GetRandValue( f73_arg0, f73_arg1 )
	if not f73_arg0 then
		return f73_arg1 or 0
	elseif type( f73_arg0 ) == "table" then
		if #f73_arg0 == 2 and type( f73_arg0[1] ) == "number" then
			return math.random( 0, 1000 ) / 1000 * (f73_arg0[2] - f73_arg0[1]) + f73_arg0[1]
		else
			return f73_arg0[math.random( 1, #f73_arg0 )]
		end
	else
		return f73_arg0
	end
end

function TryCopyField( f74_arg0, f74_arg1, f74_arg2 )
	if f74_arg2[f74_arg0] then
		f74_arg1[f74_arg0] = GetRandValue( f74_arg2[f74_arg0] )
	end
end

function RegisterAnimimationState( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
	local f75_local0 = {}
	for f75_local4, f75_local5 in ipairs( f75_arg1.states ) do
		local f75_local6 = LUI.DeepCopy( f75_arg2 )
		TryCopyField( "left", f75_local6, f75_local5 )
		TryCopyField( "top", f75_local6, f75_local5 )
		TryCopyField( "width", f75_local6, f75_local5 )
		TryCopyField( "height", f75_local6, f75_local5 )
		TryCopyField( "alpha", f75_local6, f75_local5 )
		TryCopyField( "zRot", f75_local6, f75_local5 )
		if f75_local5.scale then
			f75_local6.scale = GetRandValue( f75_local5.scale ) * f75_arg3.scaleMultiplier + f75_arg3.scaleAdditive
		end
		f75_arg0:registerAnimationState( "animateState" .. f75_local4, f75_local6 )
		f75_local0[#f75_local0 + 1] = {
			"animateState" .. f75_local4,
			GetRandValue( f75_local5.duration ) * f75_arg3.durationMultiplier
		}
	end
	return f75_local0
end

function CreateAnimatedHuds( f76_arg0, f76_arg1, f76_arg2 )
	for f76_local7, f76_local8 in ipairs( f76_arg1.hudlist ) do
		local self = nil
		local f76_local9 = GetRandValue( f76_local8.left )
		local f76_local10 = GetRandValue( f76_local8.top )
		local f76_local11 = GetRandValue( f76_local8.width )
		local f76_local12 = GetRandValue( f76_local8.height )
		local f76_local13 = {
			durationMultiplier = GetRandValue( f76_local8.durationMultiplier, 1 ),
			scaleMultiplier = GetRandValue( f76_local8.scaleMultiplier, 1 ),
			scaleAdditive = GetRandValue( f76_local8.scaleAdditive, 0 )
		}
		local f76_local4 = CoD.CreateState
		local f76_local6, f76_local14, f76_local15, f76_local16 = nil
		local f76_local3 = f76_local8.anchor
		if not f76_local3 then
			f76_local3 = CoD.AnchorTypes.TopLeft
		end
		f76_local4 = f76_local4( f76_local6, f76_local14, f76_local15, f76_local16, f76_local3 )
		f76_local4.left = GetRandValue( f76_local8.left )
		f76_local4.top = GetRandValue( f76_local8.top )
		f76_local4.width = GetRandValue( f76_local8.width )
		f76_local4.height = GetRandValue( f76_local8.height )
		f76_local4.alpha = GetRandValue( f76_local8.alpha, 1 )
		f76_local4.scale = GetRandValue( f76_local8.scale, 0 ) * f76_local13.scaleMultiplier + f76_local13.scaleAdditive
		f76_local4.zRot = GetRandValue( f76_local8.zRot )
		if GetRandValue( f76_local8.flippedY ) == true then
			assert( f76_local8.text == nil, "Cannot flip text" )
			f76_local4.left = f76_local4.left + f76_local4.width
			f76_local4.width = -f76_local4.width
		end
		if GetRandValue( f76_local8.flippedX ) == true then
			assert( f76_local8.text == nil, "Cannot flip text" )
			f76_local4.top = f76_local4.top + f76_local4.height
			f76_local4.height = -f76_local4.height
		end
		if f76_local8.material then
			f76_local4.material = RegisterMaterial( GetRandValue( f76_local8.material ) )
			self = LUI.UIImage.new( f76_local4 )
		elseif f76_local8.color then
			f76_local4.color = GetRandValue( f76_local8.color )
			self = LUI.UIImage.new( f76_local4 )
		elseif f76_local8.text then
			self = LUI.UIText.new( f76_local4 )
			self:setText( Engine.Localize( GetRandValue( f76_local8.text ) ) )
		else
			self = LUI.UIElement.new( f76_local4 )
		end
		if f76_local8.childFunc then
			if type( f76_local8.childType ) == "table" then
				f76_local6 = GetRandValue( f76_local8.childFunc )
				f76_local6( self )
			else
				f76_local8.childFunc( self )
			end
		end
		if f76_local8.childType then
			if type( f76_local8.childType ) == "table" then
				LUI.MenuBuilder.BuildAddChild( self, f76_local8.childType )
			else
				LUI.MenuBuilder.BuildAddChild( self, {
					f76_local8.childType
				} )
			end
		end
		f76_local6 = RegisterAnimimationState( self, f76_local8, f76_local4, f76_local13 )
		if f76_local8.loop then
			if f76_local8.randomizeloop then
				self:animateInSequence( f76_local6, nil, true, true )
				self:registerEventHandler( LUI.FormatAnimStateFinishStepEvent( f76_local6[#f76_local6][1] ), function ( element, event )
					self:animateInSequence( RegisterAnimimationState( element, f76_local8, f76_local4, f76_local13 ), nil, true, true )
				end )
			else
				self:animateInLoop( f76_local6 )
			end
		else
			self:animateInSequence( f76_local6, nil, true, false, true )
		end
		f76_arg0:addElement( self )
	end
end

LUI.SimpleAnimatedObjects = {}
LUI.SimpleAnimatedObjects.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.currentTime = 0
	for f78_local4, f78_local5 in ipairs( menu ) do
		f78_local5.nextTriggerTime = GetRandValue( f78_local5.introDelay )
	end
	f78_local1 = function ( f79_arg0, f79_arg1 )
		local f79_local0 = controller
		if f79_arg1.lateness < controller then
			f79_local0 = f79_local0 + f79_arg1.lateness
		end
		f79_arg0.currentTime = f79_arg0.currentTime + f79_local0
		for f79_local4, f79_local5 in ipairs( menu ) do
			if f79_local5.nextTriggerTime > -1 and f79_local5.nextTriggerTime < f79_arg0.currentTime then
				CreateAnimatedHuds( f79_arg0, f79_local5 )
				if not f79_local5.once then
					f79_local5.nextTriggerTime = f79_local5.nextTriggerTime + GetRandValue( f79_local5.repeatDelay )
				else
					f79_local5.nextTriggerTime = -1
				end
			end
		end
		self:animateToState( "default", controller )
	end
	
	self:animateToState( "default", controller )
	self:registerEventHandler( "transition_complete_default", f78_local1 )
	f78_local1( self, {
		lateness = 0
	} )
	return self
end

LUI.MenuBuilder.registerType( "generic_menu_title", generic_menu_title )
LUI.MenuBuilder.registerType( "generic_menu_title_and_breadCrumb_text", generic_menu_title_and_breadCrumb_text )
LUI.MenuBuilder.registerDef( "generic_input_field", generic_input_field )
LUI.MenuBuilder.registerType( "generic_border", generic_border )
LUI.MenuBuilder.registerType( "generic_popup_message", generic_popup_message )
LUI.MenuBuilder.registerPopupType( "generic_confirmation_popup", generic_confirmation_popup )
LUI.MenuBuilder.registerPopupType( "generic_waiting_popup", generic_waiting_popup )
LUI.MenuBuilder.registerPopupType( "generic_yesno_popup", generic_yesno_popup )
LUI.MenuBuilder.registerType( "generic_menu_background", generic_menu_background )
LUI.MenuBuilder.registerType( "generic_popup_screen_overlay", generic_popup_screen_overlay )
LUI.MenuBuilder.registerType( "generic_menu_titlebar", generic_menu_titlebar )
LUI.MenuBuilder.registerType( "h1_option_menu_titlebar", h1_option_menu_titlebar )
LUI.MenuBuilder.registerType( "generic_selectionList_popup", generic_selectionList_popup )
LockTable( _M )
