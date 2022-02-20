local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 1
f0_local1 = function ()
	return {
		type = "UIElement",
		id = "equip1Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = -42.33,
				left = 1,
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
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_dpad_blur" ),
						width = 85.32,
						height = 85.32,
						left = -30.33,
						bottom = 21.33,
						zRot = 90,
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
						leftAnchor = true,
						width = 85.32,
						height = 85.32,
						left = -30.33,
						bottom = 21.33,
						zRot = 90,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_dpad_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_dpad_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIImage",
				id = "equip1Selected",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_equipwidget_selected" ),
						width = 85.32,
						height = 85.32,
						left = -30.33,
						bottom = 21.33,
						zRot = 90,
						alpha = f0_local0
					},
					on = {
						alpha = f0_local0
					},
					off = {
						alpha = 0
					}
				}
			},
			{
				type = "UIElement",
				id = "equip1LabelM203",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = -25.66,
								left = 32.33,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = -25.66,
								left = 32.33,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
						leftAnchor = true,
						material = nil,
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
						leftAnchor = true,
						bottom = 3.33,
						left = 20.66,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					}
				},
				properties = {
					text = "e1",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

f0_local2 = function ()
	return {
		type = "UIElement",
		id = "equip2Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = -83.32,
				left = 42.33,
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
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_dpad_blur" ),
						width = 85.32,
						height = 85.32,
						left = -22,
						bottom = 12.67,
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
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_dpad_border" ),
						width = 85.32,
						height = 85.32,
						left = -22,
						bottom = 12.67,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_dpad_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_dpad_border_nightvision" ),
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
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = 5.67,
								left = 6,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
				id = "equip2Selected",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_equipwidget_selected" ),
						width = 85.32,
						height = 85.32,
						left = -22,
						bottom = 12.67,
						alpha = f0_local0
					},
					on = {
						alpha = f0_local0
					},
					off = {
						alpha = 0
					}
				}
			},
			{
				type = "UIImage",
				id = "equip2ContainerIcon",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						material = nil,
						width = 42.66,
						height = 42.66,
						alpha = CoD.HudStandards.iconAlpha
					}
				}
			}
		}
	}
end

local f0_local3 = function ()
	return {
		type = "UIElement",
		id = "equip3Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = -42.33,
				left = 82.99,
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
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_dpad_blur" ),
						width = 85.32,
						height = 85.32,
						left = -13,
						bottom = 21,
						zRot = -90,
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
						leftAnchor = true,
						width = 85.32,
						height = 85.32,
						left = -13,
						bottom = 21,
						zRot = -90,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_dpad_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_dpad_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIImage",
				id = "equip3Selected",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_equipwidget_selected" ),
						width = 85.32,
						height = 85.32,
						left = -13,
						bottom = 21.33,
						zRot = -90,
						alpha = f0_local0
					},
					on = {
						alpha = f0_local0
					},
					off = {
						alpha = 0
					}
				}
			},
			{
				type = "UIElement",
				id = "equip3LabelHELI",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = -9.33,
								left = -8.67,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = -9.33,
								left = -8.67,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
						leftAnchor = true,
						material = nil,
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
						leftAnchor = true,
						bottom = 3.33,
						left = 29.33,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					}
				},
				properties = {
					text = "e3",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local4 = function ()
	return {
		type = "UIElement",
		id = "equip4Container",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = -1,
				left = 42.33,
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
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_dpad_blur" ),
						width = 85.32,
						height = 85.32,
						left = -21.66,
						bottom = 29.66,
						zRot = 180,
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
						leftAnchor = true,
						width = 85.32,
						height = 85.32,
						left = -21.66,
						bottom = 29.66,
						zRot = 180,
						alpha = CoD.HudStandards.overlayAlpha
					},
					on = {
						material = RegisterMaterial( "h1_hud_dpad_border" ),
						color = CoD.HudStandards.overlayTint,
						alpha = CoD.HudStandards.overlayAlpha
					},
					nvg_on = {
						material = RegisterMaterial( "h1_hud_dpad_border_nightvision" ),
						color = CoD.HudStandards.nvgOverlayTint,
						alpha = CoD.HudStandards.overlayAlphaNVG
					}
				}
			},
			{
				type = "UIImage",
				id = "equip4Selected",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
						material = RegisterMaterial( "h1_hud_equipwidget_selected" ),
						width = 85.32,
						height = 85.32,
						left = -21.66,
						bottom = 29.66,
						zRot = 180,
						alpha = f0_local0
					},
					on = {
						alpha = f0_local0
					},
					off = {
						alpha = 0
					}
				}
			},
			{
				type = "UIElement",
				id = "equip4LabelC4",
				states = {
					default = {
						bottomAnchor = true,
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = -38.33,
								left = 20,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
						leftAnchor = true,
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
								leftAnchor = true,
								bottom = -38.33,
								left = 20,
								width = 21.33,
								height = 5.33,
								zRot = -45,
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
						leftAnchor = true,
						bottom = -2.67,
						left = -1,
						material = nil,
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
						leftAnchor = true,
						bottom = 1,
						left = 29.33,
						width = 42,
						height = CoD.TextSettings.SP_HudItemAmmoFont.Height,
						font = CoD.TextSettings.SP_HudItemAmmoFont.Font,
						alpha = 1
					}
				},
				properties = {
					text = "e4",
					textStyle = CoD.TextStyle.ShadowedMore
				}
			}
		}
	}
end

local f0_local5 = function ()
	local f5_local0 = {
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
	local f5_local1 = {}
	local f5_local2 = {
		type = "UIImage",
		id = "equipExtraOverlay",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				width = 85.32,
				height = 85.32,
				left = 20.66,
				bottom = -21,
				zRot = -90,
				alpha = CoD.HudStandards.overlayAlpha
			},
			on = {
				material = RegisterMaterial( "h1_hud_dpad_extra" ),
				color = CoD.HudStandards.overlayTint,
				alpha = CoD.HudStandards.overlayAlpha
			},
			nvg_on = {
				material = RegisterMaterial( "h1_hud_dpad_extra_nightvision" ),
				color = CoD.HudStandards.nvgOverlayTint,
				alpha = CoD.HudStandards.overlayAlphaNVG
			}
		}
	}
	local f5_local3 = f0_local1()
	local f5_local4 = f0_local2()
	local f5_local5 = f0_local3()
	local f5_local6 = f0_local4()
	f5_local0.children = f5_local2
	return f5_local0
end

LUI.MenuBuilder.registerDef( "actionSlotDpadDef", function ()
	local f6_local0 = {
		type = "UIElement",
		id = "actionSlotDpadId",
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
		}
	}
	local f6_local1 = {}
	f6_local0.children = f0_local5()
	return f6_local0
end )
LockTable( _M )
