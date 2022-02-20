local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function mpLobbyWidgets()
	return {
		type = "UIElement",
		id = "mpLobbyWidgets",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0
			}
		},
		children = {
			{
				type = "UIHorizontalList",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = 100,
						bottom = 132,
						left = 100,
						right = 568
					}
				},
				children = {
					{
						type = "UIImage",
						id = "left_cap",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = false,
								top = 0,
								bottom = 0,
								left = 0,
								right = 32,
								material = RegisterMaterial( "box_lobby_name_lt" ),
								red = 1,
								green = 1,
								blue = 1,
								alpha = 0.35
							}
						}
					},
					{
						type = "UIElement",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = false,
								top = 0,
								bottom = 0,
								left = 0,
								right = 468,
								red = 1,
								green = 1,
								blue = 1,
								alpha = 1
							}
						},
						children = {
							{
								type = "UIImage",
								id = "middle",
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
										material = RegisterMaterial( "box_lobby_name_mid" ),
										red = 1,
										green = 1,
										blue = 1,
										alpha = 0.35
									}
								}
							},
							{
								type = "rank_icon_name"
							}
						}
					},
					{
						type = "UIImage",
						id = "right_cap",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = false,
								top = 0,
								bottom = 0,
								left = 0,
								right = 4,
								material = RegisterMaterial( "box_lobby_name_rt" ),
								red = 1,
								green = 1,
								blue = 1,
								alpha = 0.35
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "speaker_icon",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = 0,
						bottom = 42,
						left = -21,
						right = 21,
						material = RegisterMaterial( "icon_online_chat" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					}
				}
			},
			{
				type = "online_friends_widget",
				id = "online_friends_widget_id"
			},
			{
				type = "global_activity_map",
				id = "global_activity_map_id"
			},
			{
				type = "map_digital_anim",
				id = "map_digital_anim_id"
			}
		}
	}
end

function map_digital_anim()
	return {
		type = "UIElement",
		id = "map_container",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "left_side_meters",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 0,
						bottom = 0,
						left = -48,
						right = -16,
						material = RegisterMaterial( "fluff_lobby_meters_lt" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.2
					}
				}
			},
			{
				type = "UIImage",
				id = "rt_map_arrow",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -8,
						bottom = 0,
						left = 364,
						right = 396,
						material = RegisterMaterial( "fluff_arrow_tick" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.15
					},
					moveup1 = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -8,
						bottom = 0,
						left = 364,
						right = 396,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.2
					},
					moveup2 = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -78,
						bottom = -70,
						left = 364,
						right = 396,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.3
					},
					moveup3 = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -33,
						bottom = -25,
						left = 364,
						right = 392,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.15
					},
					moveup4 = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -180,
						bottom = -172,
						left = 364,
						right = 396,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.3
					},
					moveup5 = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -8,
						bottom = 0,
						left = 364,
						right = 396,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.2
					}
				},
				handlers = {
					menu_create = MBh.AnimateLoop( {
						{
							"moveup1",
							0,
							true,
							true
						},
						{
							"moveup2",
							5000,
							true,
							true
						},
						{
							"moveup3",
							5000,
							true,
							true
						},
						{
							"moveup4",
							5000,
							true,
							true
						},
						{
							"moveup5",
							5000,
							true,
							true
						}
					} )
				}
			},
			{
				type = "UIImage",
				id = "blinky",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 16,
						bottom = 32,
						left = -32,
						right = -16,
						material = RegisterMaterial( "fluff_lobby_register_tick" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5
					},
					moveup1 = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.1,
						zRot = 0
					},
					moveup2 = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.25,
						zRot = 90
					},
					moveup3 = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.1,
						zRot = 180
					},
					moveup4 = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.35,
						zRot = 270
					},
					moveup5 = {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.1,
						zRot = 360
					}
				},
				handlers = {
					menu_create = MBh.AnimateLoop( {
						{
							"moveup1",
							0
						},
						{
							"moveup2",
							500
						},
						{
							"moveup3",
							500
						},
						{
							"moveup4",
							500
						},
						{
							"moveup5",
							500
						}
					} )
				}
			}
		}
	}
end

function rank_icon_name()
	return {
		type = "UIHorizontalList",
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
				alpha = 1,
				spacing = 3
			},
			dim = {
				alpha = 0.65
			},
			disabled = {
				alpha = 0.2
			}
		},
		handlers = {
			button_over = MBh.AnimateLoop( {
				{
					"dim",
					200
				},
				{
					"default",
					200
				}
			} ),
			button_up = MBh.AnimateToState( "default" ),
			button_disable = MBh.AnimateToState( "disabled", 0 )
		},
		children = {
			{
				type = "UIText",
				id = "rank_text",
				properties = {
					text = "65"
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 3,
						bottom = -3,
						left = 0,
						right = 32,
						font = CoD.TextSettings.BodyFont.Font
					}
				}
			},
			{
				type = "UIImage",
				id = "rank_icon",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 5,
						bottom = -5,
						left = 0,
						right = 21,
						material = RegisterMaterial( "icon_mp_rank" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "clan_tag_text",
				properties = {
					text = "[WWWW]"
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 3,
						bottom = -3,
						left = 0,
						right = 75,
						red = 0.5,
						green = 0.5,
						blue = 0.5,
						font = CoD.TextSettings.BodyFont.Font
					}
				}
			},
			{
				type = "UIText",
				id = "gamertag_text",
				properties = {
					text = "WWWWWWWWWWWWWWWW"
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 3,
						bottom = -3,
						left = 0,
						right = -200,
						font = CoD.TextSettings.BodyFont.Font
					}
				}
			}
		}
	}
end

function global_activity_map()
	return {
		type = "UIElement",
		id = "map_container",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 395,
				bottom = 567,
				left = 90,
				right = 432
			}
		},
		handlers = {
			map_scan = MBh.EmitEvent( "start_map_scan" )
		},
		children = {
			{
				type = "UIImage",
				id = "map_shadow",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = -39,
						bottom = 75,
						left = -37,
						right = 37,
						material = RegisterMaterial( "box_xbl_map_shadow" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.95
					}
				}
			},
			{
				type = "UIImage",
				id = "map_bg_color",
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
						material = RegisterMaterial( "white" ),
						red = 0.1,
						green = 0.14,
						blue = 0.16,
						alpha = 0.9
					}
				}
			},
			{
				type = "UIStencil",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 0,
						bottom = 0,
						left = 0,
						right = 0
					}
				},
				children = {
					{
						type = "UIImage",
						id = "lobby_map_glow",
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
								material = RegisterMaterial( "img_lobby_map_glow" ),
								red = 1,
								green = 1,
								blue = 1,
								alpha = 0
							},
							glow1 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0,
								alpha = 0.12
							},
							glow2 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0,
								alpha = 0.08
							},
							glow3 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0,
								alpha = 0
							}
						},
						handlers = {
							menu_create = MBh.AnimateLoop( {
								{
									"default",
									0
								},
								{
									"glow1",
									1000
								},
								{
									"glow2",
									500
								},
								{
									"glow3",
									1000
								}
							} )
						}
					},
					{
						type = "UIImage",
						id = "lobby_map_grid",
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
								material = RegisterMaterial( "img_lobby_map_grid" ),
								red = 1,
								green = 1,
								blue = 1,
								alpha = 0.7
							}
						}
					},
					{
						type = "UIImage",
						id = "lobby_map",
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
								material = RegisterMaterial( "img_lobby_map" ),
								red = 1,
								green = 1,
								blue = 1,
								alpha = 0.2
							}
						}
					},
					{
						type = "UIElement",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = -15,
								bottom = 15,
								left = 0,
								right = 0
							},
							move1 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = -15,
								bottom = 15,
								left = 0,
								right = 0
							},
							move2 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = -15,
								bottom = 15,
								left = 342,
								right = 342
							}
						},
						handlers = {
							menu_create = MBh.AnimateLoop( {
								{
									"move1",
									0
								},
								{
									"move2",
									0
								}
							} )
						},
						children = {
							{
								type = "UIImage",
								id = "evening_curve1",
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
										material = RegisterMaterial( "box_lobby_map_evening" ),
										red = 1,
										green = 1,
										blue = 1,
										alpha = 0.75
									}
								}
							},
							{
								type = "UIImage",
								id = "evening_curve2",
								states = {
									default = {
										topAnchor = true,
										bottomAnchor = true,
										leftAnchor = true,
										rightAnchor = true,
										top = 0,
										bottom = 0,
										left = -342,
										right = -342,
										material = RegisterMaterial( "box_lobby_map_evening" ),
										red = 1,
										green = 1,
										blue = 1,
										alpha = 0.75
									}
								}
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "map_graph",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 168,
						bottom = 44,
						left = -85,
						right = 85,
						material = RegisterMaterial( "img_lobby_map_graph_bg" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.75
					}
				}
			},
			{
				type = "UIText",
				id = "players_online_label",
				properties = {
					text = Engine.Localize( "@LUA_MENU_PLAYERS_ONLINE" )
				},
				states = {
					default = {
						alignment = LUI.Alignment.Left,
						font = CoD.TextSettings.BodyFont.Font,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = true,
						left = 6,
						right = 0,
						top = -22,
						bottom = -6,
						red = 0.39,
						green = 0.39,
						blue = 0.39,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "players_online",
				properties = {
					text = "4,443,235,012"
				},
				states = {
					default = {
						alignment = LUI.Alignment.Left,
						font = CoD.TextSettings.BodyFont.Font,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = true,
						left = 100,
						right = 0,
						top = -22,
						bottom = -6,
						red = 0.6,
						green = 0.6,
						blue = 0.6,
						alpha = 0
					}
				}
			},
			{
				type = "UIImage",
				id = "map_blip_color",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 48,
						bottom = -102,
						left = 45,
						right = 67,
						material = RegisterMaterial( "icon_lobby_map_blip1" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					alpha1 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 48,
						bottom = -102,
						left = 45,
						right = 67,
						alpha = 0.25
					},
					alpha2 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 48,
						bottom = -102,
						left = 45,
						right = 67,
						alpha = 0.1
					},
					alpha3 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 48,
						bottom = -102,
						left = 45,
						right = 67,
						alpha = 0.65
					},
					alpha4 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 48,
						bottom = -102,
						left = 45,
						right = 67,
						alpha = 0.15
					},
					alpha5 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 48,
						bottom = -102,
						left = 45,
						right = 67,
						alpha = 0.25
					}
				},
				handlers = {
					menu_create = MBh.AnimateLoop( {
						{
							"alpha1",
							250
						},
						{
							"alpha2",
							100
						},
						{
							"alpha3",
							1500
						},
						{
							"alpha4",
							150
						}
					} )
				}
			},
			{
				type = "UIImage",
				id = "map_blip_color2",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 49,
						bottom = -101,
						left = 46,
						right = 68,
						material = RegisterMaterial( "icon_lobby_map_blip1" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					alpha1 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 49,
						bottom = -101,
						left = 46,
						right = 68,
						alpha = 0.1
					},
					alpha2 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 49,
						bottom = -101,
						left = 46,
						right = 68,
						alpha = 0.25
					},
					alpha3 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 49,
						bottom = -101,
						left = 46,
						right = 68,
						alpha = 0.15
					},
					alpha4 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 49,
						bottom = -101,
						left = 46,
						right = 68,
						alpha = 0.45
					},
					alpha5 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 49,
						bottom = -101,
						left = 46,
						right = 68,
						alpha = 0.1
					}
				},
				handlers = {
					menu_create = MBh.AnimateLoop( {
						{
							"alpha1",
							250
						},
						{
							"alpha2",
							100
						},
						{
							"alpha3",
							1000
						},
						{
							"alpha4",
							500
						},
						{
							"alpha5",
							1000
						}
					} )
				}
			},
			{
				type = "UITimer",
				id = "map_scan_timer",
				properties = {
					event = "map_scan",
					interval = 10000
				}
			},
			{
				type = "UIImage",
				id = "map_blip_blink_on",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						material = RegisterMaterial( "icon_lobby_map_blip3" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					alpha1 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						alpha = 1
					},
					alpha2 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						alpha = 1
					},
					alpha3 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						alpha = 0
					}
				},
				handlers = {
					menu_create = MBh.EmitEvent( "start_map_scan" ),
					start_map_scan = MBh.AnimateSequence( {
						{
							"default",
							1500
						},
						{
							"alpha1",
							500
						},
						{
							"alpha2",
							4000
						},
						{
							"alpha3",
							3000
						}
					} )
				}
			},
			{
				type = "UIImage",
				id = "map_blip_blink",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						material = RegisterMaterial( "icon_lobby_map_blip3" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0
					},
					alpha1 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						alpha = 1
					},
					alpha2 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						alpha = 0
					},
					alpha3 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 42,
						right = 70,
						alpha = 0
					}
				},
				handlers = {
					menu_create = MBh.EmitEvent( "start_map_scan" ),
					start_map_scan = MBh.AnimateSequence( {
						{
							"default",
							1500
						},
						{
							"alpha1",
							500
						},
						{
							"alpha2",
							500
						},
						{
							"alpha3",
							6500
						}
					} )
				}
			},
			{
				type = "UIImage",
				id = "map_blip",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = -16,
						right = 12,
						material = RegisterMaterial( "icon_lobby_map_blip3" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5
					},
					move1 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = -16,
						right = 12
					},
					move2 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 188,
						bottom = 48,
						left = 332,
						right = 360
					}
				},
				handlers = {
					menu_create = MBh.EmitEvent( "start_map_scan" ),
					start_map_scan = MBh.AnimateLoop( {
						{
							"move1",
							0
						},
						{
							"move2",
							10000
						}
					} )
				}
			},
			{
				type = "UIImage",
				id = "map_graph_line",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = -23,
						bottom = 233,
						left = -8,
						right = 0,
						material = RegisterMaterial( "img_lobby_map_graph_line" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5
					},
					move1 = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = -23,
						bottom = 233,
						left = -8,
						right = 0
					},
					move2 = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = -23,
						bottom = 233,
						left = 340,
						right = 348
					}
				},
				handlers = {
					menu_create = MBh.EmitEvent( "start_map_scan" ),
					start_map_scan = MBh.AnimateSequence( {
						{
							"move1",
							0
						},
						{
							"move2",
							10000
						}
					} )
				}
			},
			{
				type = "UIImage",
				id = "map_graph_brackets",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 168,
						bottom = 44,
						left = -8,
						right = 4,
						material = RegisterMaterial( "img_lobby_map_graph_brackets" ),
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					},
					move1 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 168,
						bottom = 44,
						left = -8,
						right = 4
					},
					move2 = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = 168,
						bottom = 44,
						left = 340,
						right = 352
					}
				},
				handlers = {
					menu_create = MBh.EmitEvent( "start_map_scan" ),
					start_map_scan = MBh.AnimateLoop( {
						{
							"move1",
							0
						},
						{
							"move2",
							10000
						}
					} )
				}
			},
			{
				type = "map_digital_anim",
				id = "side_anim_id"
			}
		}
	}
end

function theater_recording_widget()
	return {
		type = "UIImage",
		id = "theater_recording_widget_id",
		states = {
			default = {
				material = RegisterMaterial( "box_theater_bg" ),
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				left = 790,
				right = 955,
				top = 651,
				bottom = 683
			}
		},
		children = {
			{
				type = "UIText",
				id = "theater_text_id",
				properties = {
					text = Engine.Localize( "@LUA_MENU_THEATER" )
				},
				states = {
					default = {
						alignment = LUI.Alignment.Left,
						font = CoD.TextSettings.BodyFont.Font,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 8,
						right = 0,
						top = 8,
						bottom = 24,
						red = 0.39,
						green = 0.39,
						blue = 0.39
					}
				}
			},
			{
				type = "UIText",
				id = "recording_text_id",
				properties = {
					text = Engine.Localize( "@LUA_MENU_RECORDING" )
				},
				states = {
					default = {
						alignment = LUI.Alignment.Left,
						font = CoD.TextSettings.BodyFont.Font,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 80,
						right = 0,
						top = 8,
						bottom = 24,
						red = Colors.cac_ability_text.r,
						green = Colors.cac_ability_text.g,
						blue = Colors.cac_ability_text.b
					}
				}
			},
			{
				type = "UIText",
				id = "onoff_text_id",
				properties = {
					text = Engine.Localize( "@MENU_ON" )
				},
				states = {
					default = {
						alignment = LUI.Alignment.Left,
						font = CoD.TextSettings.BodyFont.Font,
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = 137,
						right = 0,
						top = 8,
						bottom = 24,
						red = 0.39,
						green = 0.39,
						blue = 0.39
					}
				},
				handlers = {
					theater_widget_recording_on = function ( f6_arg0, f6_arg1 )
						f6_arg0.setText( Engine.Localize( "@MENU_ON" ) )
					end
					,
					theater_widget_recording_off = function ( f7_arg0, f7_arg1 )
						f7_arg0.setText( Engine.Localize( "@MENU_OFF" ) )
					end
					
				}
			},
			{
				type = "UIImage",
				id = "recording_light_id",
				states = {
					default = {
						material = RegisterMaterial( "fluff_circle" ),
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = true,
						left = 114,
						right = 129,
						top = 8,
						bottom = -8,
						red = 0.95,
						green = 0.42,
						blue = 0.31
					}
				}
			}
		}
	}
end

function leaveprelobbywarning( f8_arg0, f8_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@XBOXLIVE_LEAVEPARTYANDLOBBY" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_action = MBh.EmitEventToRoot( {
			name = "exit_live_lobby",
			immediate = true
		} ),
		default_focus_index = 2
	} )
end

function leaveLobbyWarningYesAction( f9_arg0, f9_arg1 )
	LeaveLobby( f9_arg1.controller )
	local f9_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "leavelobbywarning" )
	if f9_local0 and f9_local0.extraYesAction then
		f9_local0.extraYesAction( f9_arg0, f9_arg1 )
	end
end

function CanLeavePartyBehind()
	if Engine.GetOnlineGame() and Lobby.IsInPrivateParty() and Lobby.IsPrivatePartyHost() and not Lobby.IsAloneInPrivateParty() then
		return true
	else
		return false
	end
end

function leaveLobbyPullPartyNoAction( f11_arg0, f11_arg1 )
	if CanLeavePartyBehind() then
		Engine.Exec( "xstopprivateparty" )
		Engine.Exec( "xstopparty lobbynopullparty" )
		LeaveLobby_NoStopParty( f11_arg1.controller )
		ExitLobby( f11_arg0, f11_arg1 )
	end
end

function leavelobbypullparty( f12_arg0, f12_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@LUA_MENU_PULL_PARTY_DESC" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_action = MBh.DoMultiple( {
			leaveLobbyWarningYesAction,
			ExitLobby
		} ),
		no_action = MBh.DoMultiple( {
			leaveLobbyPullPartyNoAction,
			ExitLobby
		} ),
		default_focus_index = 1
	} )
end

function leaveLobbyWarningCheckHostYesAction( f13_arg0, f13_arg1 )
	if CanLeavePartyBehind() then
		LUI.FlowManager.RequestAddMenu( f13_arg0, "leavelobbypullparty", true, f13_arg1.controller, false )
	else
		leaveLobbyWarningYesAction( f13_arg0, f13_arg1 )
		ExitLobby( f13_arg0, f13_arg1 )
	end
end

function leavelobbywarning( f14_arg0, f14_arg1 )
	local f14_local0 = Engine.Localize( "@XBOXLIVE_LEAVELOBBY" )
	local f14_local1 = LUI.FlowManager.GetMenuScopedDataByMenuName( "leavelobbywarning" )
	if f14_local1 and f14_local1.extraMessage then
		f14_local0 = f14_local1.extraMessage .. "\n" .. f14_local0
	end
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = f14_local0,
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_action = leaveLobbyWarningCheckHostYesAction,
		default_focus_index = 2
	} )
end

function leavelobbybadsquad( f15_arg0, f15_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		message_text = Engine.Localize( "@LUA_MENU_BAD_SQUAD" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		confirmation_action = MBh.DoMultiple( {
			leaveLobbyWarningYesAction,
			ExitLobby
		} )
	} )
end

function leaveLobbyAndPartyYesAction( f16_arg0, f16_arg1 )
	LeaveLobbyAndParty( f16_arg1.execNow )
	local f16_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "leavelobbyandpartywarning" )
	if f16_local0 and f16_local0.extraYesAction then
		f16_local0.extraYesAction( f16_arg0, f16_arg1 )
	end
end

function leaveLobbyAndPartyYesActionWithExitLobby( f17_arg0, f17_arg1 )
	leaveLobbyAndPartyYesAction( f17_arg0, f17_arg1 )
	ExitLobby( f17_arg0, f17_arg1 )
end

function leavelobbyandpartywarning( f18_arg0, f18_arg1 )
	local f18_local0 = Engine.Localize( "@XBOXLIVE_LEAVEPARTYANDLOBBY" )
	local f18_local1 = LUI.FlowManager.GetMenuScopedDataByMenuName( "leavelobbyandpartywarning" )
	if f18_local1 and f18_local1.extraMessage then
		f18_local0 = f18_local1.extraMessage .. "\n" .. f18_local0
	end
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = f18_local0,
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_action = MBh.DoMultiple( {
			leaveLobbyAndPartyYesAction,
			ExitLobby
		} ),
		default_focus_index = 2
	} )
end

function leaveLobbyBlockedPlayerWarningYesAction( f19_arg0, f19_arg1 )
	if AreWePrivatePartyHost() then
		Engine.Exec( "xstoplobbybackout leavelobbyblockedplayerwarning", f19_arg1.controller )
	else
		Engine.Exec( "xstopparty leavelobbyblockedplayerwarning", f19_arg1.controller )
	end
	local f19_local0 = Engine.Exec
	f19_local0( "xstopprivateparty" )
	f19_local0( "xstartprivateparty" )
	f19_local0( "xblive_privatematch 0" )
	SetIsAliensSolo( false )
	if Lobby.BotsAreAllowed() then
		SetBotsConnectType( 0 )
		SetBotsDifficulty( Lobby.BotTeams.Friendly, 1 )
		SetBotsDifficulty( Lobby.BotTeams.Enemy, 1 )
		SetBotsDifficulty( Lobby.BotTeams.FFA, 1 )
		SetBotsTeamLimit( Lobby.BotTeams.Friendly, 0 )
		SetBotsTeamLimit( Lobby.BotTeams.Enemy, 0 )
		SetBotsTeamLimit( Lobby.BotTeams.FFA, 0 )
	end
end

function leavelobbyblockedplayerwarning( f20_arg0, f20_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@XBOXLIVE_LEAVELOBBYBLOCKEDPLAYER" ),
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		yes_action = MBh.DoMultiple( {
			leaveLobbyBlockedPlayerWarningYesAction,
			ExitLobby
		} ),
		default_focus_index = 2
	} )
end

function MapInfoSetMapName( f21_arg0, f21_arg1 )
	if IsPublicMatch() then
		if Lobby.HasVotePassed() then
			f21_arg0:animateToState( "default", 0 )
		else
			f21_arg0:animateToState( "hidden", 0 )
			return 
		end
	end
	local f21_local0 = Lobby.GetMapName()
	local f21_local1 = CoD.TextSettings.BodyFontBold
	local f21_local2, f21_local3, f21_local4, f21_local5 = GetTextDimensions( f21_local0, f21_local1.Font, f21_local1.Height )
	f21_arg0:registerAnimationState( "current", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 20 + f21_local4 - f21_local2,
		top = 0,
		bottom = 0
	} )
	f21_arg0:setText( f21_local0 )
	f21_arg0:animateToState( "current", 0 )
end

function MapInfoSetGameMode( f22_arg0, f22_arg1 )
	if IsPublicMatch() then
		if Lobby.HasVotePassed() or squad_mode == true then
			f22_arg0:animateToState( "default", 0 )
		else
			f22_arg0:animateToState( "hidden", 0 )
			return 
		end
	end
	local f22_local0 = Lobby.GameTypeNameAbbreviated()
	local f22_local1 = CoD.TextSettings.BodyFont
	local f22_local2, f22_local3, f22_local4, f22_local5 = GetTextDimensions( f22_local0, f22_local1.Font, f22_local1.Height )
	f22_arg0:registerAnimationState( "current", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 20 + f22_local4 - f22_local2,
		top = 0,
		bottom = 0
	} )
	f22_arg0:setText( f22_local0 )
	f22_arg0:animateToState( "current", 0 )
end

function map_info_text()
	local f23_local0, f23_local1, f23_local2, f23_local3 = GetTextDimensions( text, CoD.TextSettings.BodyFontBold.Font, CoD.TextSettings.BodyFontBold.Height )
	local f23_local4, f23_local5, f23_local6, f23_local7 = GetTextDimensions( text, CoD.TextSettings.BodyFont.Font, CoD.TextSettings.BodyFont.Height )
	return {
		type = "UIElement",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				left = 100,
				right = 0,
				top = 620,
				bottom = 620 + CoD.TextSettings.BodyFont.Height,
				alignment = LUI.Alignment.Left,
				alpha = 1
			},
			hidden = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "bg_bot",
				states = {
					default = {
						material = RegisterMaterial( "box_white_gradient_bot" ),
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = true,
						left = -200,
						right = 0,
						top = -38,
						bottom = 5,
						red = 0,
						green = 0,
						blue = 0,
						alpha = 0.5
					}
				}
			},
			{
				type = "UIHorizontalList",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = 0,
						bottom = 0
					}
				},
				children = {
					{
						type = "UIText",
						id = "map_name_text",
						properties = {
							text = Lobby.GetMapName()
						},
						states = {
							default = {
								font = CoD.TextSettings.BodyFontBold.Font,
								alignment = LUI.Alignment.Center,
								leftAnchor = true,
								rightAnchor = false,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 20 + f23_local2 - f23_local0,
								top = 0,
								bottom = 0,
								red = 1,
								green = 1,
								blue = 1,
								alpha = 1
							},
							hidden = {
								alpha = 0
							}
						},
						handlers = {
							update_info_text = MapInfoSetMapName,
							menu_create = MapInfoSetMapName
						}
					},
					{
						type = "UIText",
						id = "game_mode_text",
						properties = {
							text = Lobby.GameTypeNameAbbreviated()
						},
						states = {
							default = {
								font = CoD.TextSettings.BodyFont.Font,
								alignment = LUI.Alignment.Center,
								leftAnchor = true,
								rightAnchor = false,
								topAnchor = true,
								bottomAnchor = true,
								left = 0,
								right = 20 + f23_local6 - f23_local4,
								top = 0,
								bottom = 0,
								red = 0.7,
								green = 0.7,
								blue = 0.7,
								alpha = 1
							},
							hidden = {
								alpha = 0
							}
						},
						handlers = {
							update_info_text = MapInfoSetGameMode,
							menu_create = MapInfoSetGameMode
						}
					}
				}
			},
			{
				type = "UITimer",
				id = "map_info_text_timer_id",
				properties = {
					event = "update_info_text",
					interval = 200,
					disposable = false
				}
			}
		}
	}
end

function lobbyWidget_status( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "lobby_status_widget_id"
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 655,
		width = 525,
		top = 43,
		bottom = 0,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIText.new()
	self.id = "status_text_line_one"
	self:registerAnimationState( "default", CoD.ColorizeState( Colors.primary_text_color, {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = -10,
		height = CoD.TextSettings.BodyFont.Height,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Right,
		alpha = 1
	} ) )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "lobby_page_enter", function ( element, event )
		element:animateToState( "default", event.animTime or 0 )
	end )
	self:addElement( self )
	local f24_local2 = function ( f26_arg0, f26_arg1 )
		self:setText( Lobby.GetPartyStatus() )
	end
	
	local self = LUI.UITimer.new( 200, {
		name = "refresh_lobby_status_text"
	}, nil, false, self, false )
	self.id = "lobby_status_refresh_timer_id"
	self:addElement( self )
	self:registerEventHandler( "menu_create", f24_local2 )
	self:registerEventHandler( "refresh_lobby_status_text", f24_local2 )
	self:registerEventHandler( "lobby_page_leave", function ( element, event )
		element:animateToState( "hidden", event.animTime or 0 )
	end )
	self:registerEventHandler( "lobby_page_enter", function ( element, event )
		element:animateToState( "default", event.animTime or 0 )
	end )
	return self
end

function lobby_search_status( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "lobby_search_status_widget_id"
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 655,
		width = 525,
		top = 43,
		bottom = 0,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIText.new()
	self.id = "search_status_text_line_two"
	self:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 50,
		height = CoD.TextSettings.BodyFont.Height,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Left,
		alpha = 1
	} ) )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self:addElement( self )
	local f29_local2 = function ( f30_arg0, f30_arg1 )
		self:setText( Lobby.GetSearchStatus() )
	end
	
	local self = LUI.UITimer.new( 200, {
		name = "refresh_lobby_search_status_text"
	}, nil, false, self, false )
	self.id = "lobby_search_status_refresh_timer_id"
	self:addElement( self )
	self:registerEventHandler( "menu_create", f29_local2 )
	self:registerEventHandler( "refresh_lobby_search_status_text", f29_local2 )
	self:registerEventHandler( "lobby_page_leave", function ( element, event )
		element:animateToState( "hidden", event.animTime or 0 )
	end )
	self:registerEventHandler( "lobby_page_enter", function ( element, event )
		element:animateToState( "default", event.animTime or 0 )
	end )
	return self
end

function lobby_game_type_title()
	return {
		type = "UIText",
		id = "game_type_name_id",
		properties = {
			text = "",
			textStyle = CoD.TextStyle.OutlinedMore
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				left = 202,
				right = 438,
				top = 56,
				bottom = 96,
				alpha = 0,
				font = CoD.TextSettings.TitleFont.Font
			},
			visible = {
				alpha = 1
			}
		},
		handlers = {
			lobby_transition_to_game = function ( f34_arg0, f34_arg1 )
				if not Engine.IsAliensMode() then
					f34_arg0:setText( Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, Engine.GetDvarString( "ui_gametype" ), GameTypesTable.Cols.Name ) ) )
				else
					f34_arg0:setText( Lobby.GameTypeNameAbbreviated() )
				end
				f34_arg0:animateToState( "visible", 500 )
			end
			
		}
	}
end

function GetLobbyIconMaterial( f35_arg0 )
	if f35_arg0 and Engine.GetDvarString( "playlist_image" ) then
		return RegisterMaterial( Engine.GetDvarString( "playlist_image" ) )
	else
		return RegisterMaterial( GetGameTypeIcon( Engine.GetDvarString( "ui_gametype" ) ) )
	end
end

function lobby_game_type_icon( menu, controller )
	local self = LUI.UIImage.new()
	self.id = "game_type_icon_id"
	if not controller then
		controller = {}
	end
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = 88,
		right = 217,
		top = 24,
		bottom = 148,
		alpha = 0,
		material = GetLobbyIconMaterial( controller.online )
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "lobby_transition_to_game", function ( element, event )
		element:registerAnimationState( "visible", {
			alpha = 1,
			material = GetLobbyIconMaterial( element.properties.online )
		} )
		element:animateToState( "visible", 500 )
	end )
	return self
end

function character_playing_as( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "character_playing_as_widget_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 55,
		right = -100,
		height = CoD.TextSettings.BodyFont.Height,
		width = 400,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default" )
	if not Engine.IsAliensMode() then
		local f38_local1 = Engine.GetFirstActiveController()
		local f38_local2 = Cac.GetSquadMemberName( f38_local1, Cac.GetSquadLoc(), Cac.GetActiveSquadMember( f38_local1 ) ) or ""
		local f38_local3 = Engine.Localize( "@LUA_MENU_PLAYING_AS", Engine.MarkLocalized( f38_local2 ) )
		local self = LUI.UIText.new()
		self.id = "character_playing_as_text"
		local f38_local5 = self
		local f38_local6 = self.setText
		if f38_local2 then
			local f38_local7 = f38_local3
		end
		f38_local6( f38_local5, f38_local7 or "" )
		self:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = false,
			rightAnchor = true,
			top = 0,
			right = 0,
			height = CoD.TextSettings.BodyFont.Height,
			font = CoD.TextSettings.BodyFont.Font,
			alignment = LUI.Alignment.Right
		} ) )
		self:animateToState( "default" )
		self:addElement( self )
		self:registerEventHandler( "online_data_finished", function ( element, event )
			local f39_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
			local f39_local1 = f39_local0.exclusiveController
			if not f39_local1 then
				f39_local1 = Engine.GetFirstActiveController()
			end
			local f39_local2 = Cac.GetSquadMemberName( f39_local1, Cac.GetSquadLoc(), Cac.GetActiveSquadMember( f39_local1 ) ) or ""
			local f39_local3 = Engine.Localize( "@LUA_MENU_PLAYING_AS", Engine.MarkLocalized( f39_local2 ) )
			local f39_local4 = element
			local f39_local5 = element.setText
			if f39_local2 then
				local f39_local6 = f39_local3
			end
			f39_local5( f39_local4, f39_local6 or "" )
		end )
		self:registerEventHandler( "menu_create", function ( element, event )
			local f40_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
			local f40_local1 = f40_local0.exclusiveController
			if not f40_local1 then
				f40_local1 = Engine.GetFirstActiveController()
			end
			local f40_local2 = Cac.GetSquadMemberName( f40_local1, Cac.GetSquadLoc(), Cac.GetActiveSquadMember( f40_local1 ) ) or ""
			local f40_local3 = Engine.Localize( "@LUA_MENU_PLAYING_AS", Engine.MarkLocalized( f40_local2 ) )
			local f40_local4 = element
			local f40_local5 = element.setText
			if f40_local2 then
				local f40_local6 = f40_local3
			end
			f40_local5( f40_local4, f40_local6 or "" )
		end )
	end
	return self
end

LUI.MenuBuilder.registerType( "lobbyWidget_status", lobbyWidget_status )
LUI.MenuBuilder.registerType( "lobby_search_status", lobby_search_status )
LUI.MenuBuilder.registerDef( "theater_recording_widget", theater_recording_widget )
LUI.MenuBuilder.registerPopupType( "leaveprelobbywarning", leaveprelobbywarning )
LUI.MenuBuilder.registerPopupType( "leavelobbywarning", leavelobbywarning )
LUI.MenuBuilder.registerPopupType( "leavelobbyandpartywarning", leavelobbyandpartywarning )
LUI.MenuBuilder.registerPopupType( "leavelobbypullparty", leavelobbypullparty )
LUI.MenuBuilder.registerDef( "global_activity_map", global_activity_map )
LUI.MenuBuilder.registerDef( "mpLobbyWidgets", mpLobbyWidgets )
LUI.MenuBuilder.registerDef( "rank_icon_name", rank_icon_name )
LUI.MenuBuilder.registerPopupType( "leavelobbyblockedplayerwarning", leavelobbyblockedplayerwarning )
LUI.MenuBuilder.registerDef( "map_info_text", map_info_text )
LUI.MenuBuilder.registerDef( "map_digital_anim", map_digital_anim )
LUI.MenuBuilder.registerPopupType( "leavelobbybadsquad", leavelobbybadsquad )
LUI.MenuBuilder.registerDef( "lobby_game_type_title", lobby_game_type_title )
LUI.MenuBuilder.registerType( "lobby_game_type_icon", lobby_game_type_icon )
LUI.MenuBuilder.registerType( "character_playing_as", character_playing_as )
LockTable( _M )
