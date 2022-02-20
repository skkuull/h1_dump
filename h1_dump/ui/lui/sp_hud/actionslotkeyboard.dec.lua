local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 47
f0_local1 = 1
f0_local2 = 0.5
local f0_local3 = 19
local f0_local4 = 24
KeyBindings = {
	[Engine.LocalizeLong( "@KEY_MOUSE1" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE1" ),
	[Engine.LocalizeLong( "@KEY_MOUSE2" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE2" ),
	[Engine.LocalizeLong( "@KEY_MOUSE3" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE3" ),
	[Engine.LocalizeLong( "@KEY_MOUSE4" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE4" ),
	[Engine.LocalizeLong( "@KEY_MOUSE5" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE5" ),
	[Engine.LocalizeLong( "@KEY_MWHEELUP" )] = Engine.LocalizeLong( "@LUA_HUD_MWHEELUP" ),
	[Engine.LocalizeLong( "@KEY_MWHEELDOWN" )] = Engine.LocalizeLong( "@LUA_HUD_MWHEELDOWN" ),
	[Engine.LocalizeLong( "@KEY_PGUP" )] = Engine.LocalizeLong( "@LUA_HUD_PGUP" ),
	[Engine.LocalizeLong( "@KEY_PGDN" )] = Engine.LocalizeLong( "@LUA_HUD_PGDN" ),
	[Engine.LocalizeLong( "@KEY_TAB" )] = Engine.LocalizeLong( "@LUA_HUD_TAB" ),
	[Engine.LocalizeLong( "@KEY_SHIFT" )] = Engine.LocalizeLong( "@LUA_HUD_SHIFT" ),
	[Engine.LocalizeLong( "@KEY_CTRL" )] = Engine.LocalizeLong( "@LUA_HUD_CTRL" ),
	[Engine.LocalizeLong( "@KEY_DEL" )] = Engine.LocalizeLong( "@LUA_HUD_DEL" ),
	[Engine.LocalizeLong( "@KEY_ENTER" )] = Engine.LocalizeLong( "@LUA_HUD_ENTER" ),
	[Engine.LocalizeLong( "@KEY_CAPSLOCK" )] = Engine.LocalizeLong( "@LUA_HUD_CAPSLOCK" ),
	[Engine.LocalizeLong( "@KEY_KP_NUMLOCK" )] = Engine.LocalizeLong( "@LUA_HUD_KP_NUMLOCK" ),
	[Engine.LocalizeLong( "@KEY_SPACE" )] = Engine.LocalizeLong( "@LUA_HUD_SPACE" ),
	[Engine.LocalizeLong( "@KEY_HOME" )] = Engine.LocalizeLong( "@LUA_HUD_HOME" ),
	[Engine.LocalizeLong( "@KEY_END" )] = Engine.LocalizeLong( "@LUA_HUD_END" ),
	[Engine.LocalizeLong( "@KEY_INS" )] = Engine.LocalizeLong( "@LUA_HUD_INS" ),
	[Engine.LocalizeLong( "@KEY_UPARROW" )] = Engine.LocalizeLong( "@LUA_HUD_UPARROW" ),
	[Engine.LocalizeLong( "@KEY_DOWNARROW" )] = Engine.LocalizeLong( "@LUA_HUD_DOWNARROW" ),
	[Engine.LocalizeLong( "@KEY_LEFTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_LEFTARROW" ),
	[Engine.LocalizeLong( "@KEY_RIGHTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_RIGHTARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_HOME" )] = Engine.LocalizeLong( "@LUA_HUD_KP_HOME" ),
	[Engine.LocalizeLong( "@KEY_KP_UPARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_UPARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_PGUP" )] = Engine.LocalizeLong( "@LUA_HUD_KP_PGUP" ),
	[Engine.LocalizeLong( "@KEY_KP_LEFTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_LEFTARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_5" )] = Engine.LocalizeLong( "@LUA_HUD_KP_5" ),
	[Engine.LocalizeLong( "@KEY_KP_RIGHTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_RIGHTARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_END" )] = Engine.LocalizeLong( "@LUA_HUD_KP_END" ),
	[Engine.LocalizeLong( "@KEY_KP_DOWNARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_DOWNARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_PGDN" )] = Engine.LocalizeLong( "@LUA_HUD_KP_PGDN" ),
	[Engine.LocalizeLong( "@KEY_KP_INS" )] = Engine.LocalizeLong( "@LUA_HUD_KP_INS" ),
	[Engine.LocalizeLong( "@KEY_KP_DEL" )] = Engine.LocalizeLong( "@LUA_HUD_KP_DEL" ),
	[Engine.LocalizeLong( "@KEY_KP_ENTER" )] = Engine.LocalizeLong( "@LUA_HUD_KP_ENTER" ),
	[Engine.LocalizeLong( "@KEY_KP_SLASH" )] = Engine.LocalizeLong( "@LUA_HUD_KP_SLASH" ),
	[Engine.LocalizeLong( "@KEY_KP_STAR" )] = Engine.LocalizeLong( "@LUA_HUD_KP_STAR" ),
	[Engine.LocalizeLong( "@KEY_KP_MINUS" )] = Engine.LocalizeLong( "@LUA_HUD_KP_MINUS" ),
	[Engine.LocalizeLong( "@KEY_KP_PLUS" )] = Engine.LocalizeLong( "@LUA_HUD_KP_PLUS" ),
	[Engine.LocalizeLong( "@KEY_UNBOUND" )] = Engine.LocalizeLong( "@LUA_HUD_UNBOUND" )
}
local f0_local5 = function ( f1_arg0 )
	local f1_local0 = KeyBindings[f1_arg0]
	if f1_local0 ~= nil then
		return f1_local0
	else
		return f1_arg0
	end
end

local f0_local6 = function ()
	return {
		type = "UIElement",
		id = "equip1Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				right = f0_local0,
				alpha = 1
			}
		},
		children = {
			{
				type = "UIImage",
				id = "equip1ContainerBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_box_blur" ),
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "equip1ContainerOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIElement",
				id = "equip1LabelM203",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip1LabelM203Image",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_m203" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_m203_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "equip1LabelGP25",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip1LabelGP25Image",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_gp25" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_gp25_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "equip1ContainerIcon",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = nil,
						bottom = CoD.HudStandards.icoYpos,
						right = CoD.HudStandards.icoXpos,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			},
			{
				type = "UIText",
				id = "equip1ContainerAmmoText",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -3.33,
						right = -4.67,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					}
				},
				properties = {
					text = "equip1ContainerAmmoText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			},
			{
				type = "UIText",
				id = "equip1ContainerKeyBindingText",
				states = {
					default = {
						bottomAnchor = true,
						bottom = -39,
						right = f0_local3,
						alignment = LUI.Alignment.Left,
						width = 42,
						height = CoD.TextSettings.SP_HudItemKeybindFont.Height,
						font = CoD.TextSettings.SP_HudItemKeybindFont.Font,
						alpha = 0.25,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					},
					on = {
						alpha = f0_local2,
						color = {
							r = 0.96,
							g = 0.81,
							b = 0
						}
					},
					selected = {
						alpha = f0_local1,
						color = {
							r = 1,
							g = 1,
							b = 0.2
						}
					},
					off = {
						alpha = 0,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					}
				},
				properties = {
					text = "equip1ContainerKeyBindingText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local7 = function ()
	return {
		type = "UIElement",
		id = "equip2Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				right = f0_local0 + CoD.HudStandards.boxSpacing,
				alpha = 1
			}
		},
		children = {
			{
				type = "UIImage",
				id = "equip2ContainerBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_box_blur" ),
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "equip2ContainerOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIElement",
				id = "equip2LabelNVG",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip2LabelNVGImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_nvg" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_nvg_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "equip2ContainerIcon",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = nil,
						bottom = CoD.HudStandards.icoYpos,
						right = CoD.HudStandards.icoXpos,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			},
			{
				type = "UIText",
				id = "equip2ContainerKeyBindingText",
				states = {
					default = {
						bottomAnchor = true,
						bottom = -39,
						right = f0_local3 + f0_local4,
						alignment = LUI.Alignment.Left,
						width = 42,
						height = CoD.TextSettings.SP_HudItemKeybindFont.Height,
						font = CoD.TextSettings.SP_HudItemKeybindFont.Font,
						alpha = 0.25,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					},
					on = {
						alpha = f0_local2,
						color = {
							r = 0.96,
							g = 0.81,
							b = 0
						}
					},
					selected = {
						alpha = f0_local1,
						color = {
							r = 1,
							g = 1,
							b = 0.2
						}
					},
					off = {
						alpha = 0,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					}
				},
				properties = {
					text = "equip2ContainerKeyBindingText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local8 = function ()
	return {
		type = "UIElement",
		id = "equip3Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				right = f0_local0 + CoD.HudStandards.boxSpacing * 2,
				alpha = 1
			}
		},
		children = {
			{
				type = "UIImage",
				id = "equip3ContainerBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_box_blur" ),
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "equip3ContainerOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIElement",
				id = "equip3LabelHELI",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip3LabelHELIImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_heli" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_heli_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "equip3LabelCLM",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip3LabelCLMImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_clm" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_clm_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "equip3ContainerIcon",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = nil,
						bottom = CoD.HudStandards.icoYpos,
						right = CoD.HudStandards.icoXpos,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			},
			{
				type = "UIText",
				id = "equip3ContainerAmmoText",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -3.33,
						right = -4.67,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					}
				},
				properties = {
					text = "equip3ContainerAmmoText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			},
			{
				type = "UIText",
				id = "equip3ContainerKeyBindingText",
				states = {
					default = {
						bottomAnchor = true,
						bottom = -39,
						right = f0_local3 + f0_local4 * 2,
						alignment = LUI.Alignment.Left,
						width = 42,
						height = CoD.TextSettings.SP_HudItemKeybindFont.Height,
						font = CoD.TextSettings.SP_HudItemKeybindFont.Font,
						alpha = 0.25,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					},
					on = {
						alpha = f0_local2,
						color = {
							r = 0.96,
							g = 0.81,
							b = 0
						}
					},
					selected = {
						alpha = f0_local1,
						color = {
							r = 1,
							g = 1,
							b = 0.2
						}
					},
					off = {
						alpha = 0,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					}
				},
				properties = {
					text = "equip3ContainerKeyBindingText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local9 = function ()
	return {
		type = "UIElement",
		id = "equip4Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				right = f0_local0 + CoD.HudStandards.boxSpacing * 3,
				alpha = 1
			}
		},
		children = {
			{
				type = "UIImage",
				id = "equip4ContainerBlur",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = RegisterMaterial( "h1_hud_box_blur" ),
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIImage",
				id = "equip4ContainerOverlay",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						width = 85.32,
						height = 85.32,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_box_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_box_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIElement",
				id = "equip4LabelC4",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip4LabelC4Image",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_c4" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_c4_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							},
							off = {
								alpha = 0
							}
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "equip4LabelAIR",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "equip4LabelAIRImage",
						states = {
							default = {
								bottomAnchor = true,
								rightAnchor = true,
								bottom = CoD.HudStandards.labelsYpos,
								right = CoD.HudStandards.labelsXpos,
								width = 21.33,
								height = 5.33,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_box_labels_air" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_box_labels_air_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "equip4ContainerIcon",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						material = nil,
						bottom = CoD.HudStandards.icoYpos,
						right = CoD.HudStandards.icoXpos,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			},
			{
				type = "UIText",
				id = "equip4ContainerAmmoText",
				states = {
					default = {
						bottomAnchor = true,
						rightAnchor = true,
						bottom = -3.33,
						right = -4.67,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					}
				},
				properties = {
					text = "equip4ContainerAmmoText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			},
			{
				type = "UIText",
				id = "equip4ContainerKeyBindingText",
				states = {
					default = {
						bottomAnchor = true,
						bottom = -39,
						right = f0_local3 + f0_local4 * 3,
						alignment = LUI.Alignment.Left,
						width = 42,
						height = CoD.TextSettings.SP_HudItemKeybindFont.Height,
						font = CoD.TextSettings.SP_HudItemKeybindFont.Font,
						alpha = 0.25,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					},
					on = {
						alpha = f0_local2,
						color = {
							r = 0.96,
							g = 0.81,
							b = 0
						}
					},
					selected = {
						alpha = f0_local1,
						color = {
							r = 1,
							g = 1,
							b = 0.2
						}
					},
					off = {
						alpha = 0,
						color = {
							r = 1,
							g = 1,
							b = 1
						}
					}
				},
				properties = {
					text = "equip4ContainerKeyBindingText",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local10 = function ()
	local f6_local0 = {
		type = "UIElement",
		id = "dpadBase",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				left = CoD.HudStandards.borderX,
				bottom = -CoD.HudStandards.borderY,
				alpha = 1
			}
		}
	}
	local f6_local1 = {}
	local f6_local2 = {
		type = "UIElement",
		id = "leftTickMarks",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				alpha = 1
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "leftTickMarksImage",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						bottom = CoD.HudStandards.ticksYpos,
						left = -6.33,
						width = 10.67,
						height = 85.32,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_crosshairs" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_crosshairs_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			}
		}
	}
	local f6_local3 = {
		type = "UIElement",
		id = "rightTickMarks",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				alpha = 1
			},
			on = {
				alpha = 1
			},
			off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "rightTickMarksImage",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						bottom = CoD.HudStandards.ticksYpos,
						left = 186.98,
						width = 10.67,
						height = 85.32,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_crosshairs" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_crosshairs_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			}
		}
	}
	local f6_local4 = f0_local6()
	local f6_local5 = f0_local7()
	local f6_local6 = f0_local8()
	local f6_local7 = f0_local9()
	f6_local0.children = f6_local2
	return f6_local0
end

local f0_local11 = {
	[3] = 4,
	[1] = 3,
	[2] = 1,
	2
}
local f0_local12 = function ( f7_arg0, f7_arg1 )
	if f7_arg0.slotKeyBind == nil then
		f7_arg0.slotKeyBind = {}
		f7_arg0.slotKeyBind[1] = f7_arg0:getFirstDescendentById( "equip1ContainerKeyBindingText" )
		f7_arg0.slotKeyBind[2] = f7_arg0:getFirstDescendentById( "equip2ContainerKeyBindingText" )
		f7_arg0.slotKeyBind[3] = f7_arg0:getFirstDescendentById( "equip3ContainerKeyBindingText" )
		f7_arg0.slotKeyBind[4] = f7_arg0:getFirstDescendentById( "equip4ContainerKeyBindingText" )
	end
	for f7_local0 = 1, #f7_arg0.slotKeyBind, 1 do
		if f7_arg0.slotKeyBind[f7_local0] ~= nil then
			local f7_local3 = Engine.GetBinding( "+actionslot " .. f0_local11[f7_local0], true )
			if f7_arg0.slotKeyBind[f7_local0].bindKey ~= f7_local3 then
				f7_arg0.slotKeyBind[f7_local0].bindKey = f7_local3
				f7_arg0.slotKeyBind[f7_local0]:setText( f0_local5( f7_local3 ) )
			end
		end
	end
end

LUI.MenuBuilder.registerDef( "actionSlotKeyboardDef", function ()
	return {
		type = "UIElement",
		id = "actionSlotKeyboardId",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = 0,
				left = 0
			},
			hud_on = {
				alpha = 1
			},
			hud_off = {
				alpha = 0
			}
		},
		handlers = {
			weapon_info_refresh = f0_local12
		},
		children = {
			f0_local10(),
			{
				type = "UITimer",
				id = "actionSlotKeyboardRefreshTimer",
				properties = {
					event = "weapon_info_refresh",
					group = "hud",
					interval = 100
				}
			}
		}
	}
end )
LockTable( _M )
