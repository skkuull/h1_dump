local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnCreateCallback( f1_arg0, f1_arg1 )
	Engine.ExecNow( "forcenosplitscreencontrol menu_xenon_install_main_START" )
end

function OnCloseCallback( f2_arg0, f2_arg1 )
	Engine.CancelInstallXenonDiscContent()
	Engine.PlayMusic( CoD.Music.MainSPMusic, 1, 660 )
	PersistentBackground.ChangeBackground( background_start )
	Engine.ExecNow( "forcesplitscreencontrol menu_xenon_install_main_START" )
end

f0_local0 = nil
function IsFirstPackageInstalled()
	return Engine.IsXenonDiscContentPackageAvailable( 0 )
end

function IsSecondPackageInstalled()
	return Engine.IsXenonDiscContentPackageAvailable( 1 )
end

function UpdateInstalledPackage()
	if f0_local0 == 0 then
		Engine.SetXenonDiscContentInstalled( 0, true )
	else
		Engine.SetXenonDiscContentInstalled( 1, true )
	end
end

function RefreshProgressText( f6_arg0, f6_arg1 )
	local f6_local0, f6_local1, f6_local2, f6_local3, f6_local4 = nil
	f6_local0, f6_local1, f6_local2, f6_local3, f6_local4 = Engine.InstallXenonDiscContentStatus()
	if f6_local4 == true then
		if f6_local0 == 0 then
			LUI.FlowManager.RequestAddMenu( f6_arg0, "menu_xenon_install_error_popup", false, 0, false )
		elseif f6_local1 == f6_local2 and f6_local1 == f6_local0 and f6_local2 == f6_local0 then
			UpdateInstalledPackage()
			if IsSecondPackageInstalled() then
				LUI.FlowManager.RequestAddMenu( f6_arg0, "menu_xenon_install_complete", false, 0, true, {
					message = Engine.Localize( "@LUA_MENU_CONTENT_PACKAGE_INSTALL_DONE" )
				} )
			else
				LUI.FlowManager.RequestAddMenu( f6_arg0, "menu_xenon_install_main", false, 0, true, data )
			end
		else
			LUI.FlowManager.RequestAddMenu( f6_arg0, "menu_xenon_install_error_popup", false, 0, false )
		end
	else
		local f6_local5, f6_local6 = nil
		if f6_local0 == 0 then
			return 
		end
		f6_local5 = f6_local3 * 100
		f6_arg0:setText( string.format( "%d", f6_local5 ) .. "%" )
		local f6_local7 = ""
		if f6_local5 < 10 then
			f6_local7 = "background_start"
		elseif f6_local5 < 20 then
			f6_local7 = "img_install_01"
		elseif f6_local5 < 30 then
			f6_local7 = "img_install_02"
		elseif f6_local5 < 40 then
			f6_local7 = "img_install_03"
		elseif f6_local5 < 50 then
			f6_local7 = "img_install_04"
		elseif f6_local5 < 60 then
			f6_local7 = "img_install_05"
		elseif f6_local5 < 70 then
			f6_local7 = "img_install_06"
		elseif f6_local5 < 80 then
			f6_local7 = "img_install_07"
		elseif f6_local5 < 90 then
			f6_local7 = "img_install_08"
		else
			f6_local7 = "background_start"
		end
		if f6_local7 == f6_arg0.properties.current_background then
			return 
		end
		PersistentBackground.ChangeBackground( f6_local7 )
		f6_arg0.properties.current_background = f6_local7
	end
end

function RefreshProgressBar( f7_arg0, f7_arg1 )
	local f7_local0, f7_local1, f7_local2, f7_local3, f7_local4 = nil
	local f7_local5 = 0
	local f7_local6, f7_local7, f7_local8, f7_local9, f7_local10 = Engine.InstallXenonDiscContentStatus()
	f7_local4 = f7_local10
	f7_local3 = f7_local9
	f7_local2 = f7_local8
	f7_local1 = f7_local7
	if f7_local6 ~= 0 then
		f7_local5 = f7_local3 * 1080
	end
	f7_arg0:registerAnimationState( "updated", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = 100,
		width = f7_local5,
		top = 290 + -CoD.TextSettings.BodyFont.Height / 2,
		bottom = 290
	} )
	f7_arg0:animateToState( "updated", 50 )
end

function menu_xenon_install()
	return {
		type = "UIElement",
		id = "xenon_install_menu_id",
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
		handlers = {
			menu_create = OnCreateCallback,
			menu_close = OnCloseCallback
		},
		children = {
			{
				type = "UIImage",
				id = "logo_img_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = 50,
						left = 0,
						bottom = 178,
						right = 512,
						material = RegisterMaterial( "img_install_cod_logo" )
					}
				}
			},
			{
				type = "UIImage",
				id = "xenon_install_load_bg",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = false,
						bottomAnchor = false,
						left = 100,
						width = 1080,
						top = 290 + -CoD.TextSettings.BodyFont.Height / 2,
						bottom = 290,
						material = RegisterMaterial( "white" ),
						red = 0.5,
						green = 0.5,
						blue = 0.5,
						alpha = 0.5
					}
				}
			},
			{
				type = "UIImage",
				id = "xenon_install_load_bar",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = false,
						topAnchor = false,
						bottomAnchor = false,
						left = 100,
						width = 0,
						top = 290 + -CoD.TextSettings.BodyFont.Height / 2,
						bottom = 290,
						material = RegisterMaterial( "white" ),
						red = 0.75,
						green = 0.75,
						blue = 0.75,
						alpha = 0.5
					}
				},
				handlers = {
					refresh_progress = RefreshProgressBar
				}
			},
			{
				type = "UIText",
				id = "xenon_install_static_text",
				properties = {
					text = Engine.Localize( "@LUA_MENU_DISC_CONTENT_INSTALLING" )
				},
				states = {
					default = {
						font = CoD.TextSettings.BodyFont.Font,
						textStyle = CoD.TextStyle.Shadowed,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = false,
						left = 100,
						right = 100,
						top = 225 + -CoD.TextSettings.BodyFont.Height / 2,
						bottom = 225 + CoD.TextSettings.BodyFont.Height / 2,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "xenon_install_static_device_text",
				properties = {
					text = Engine.Localize( "@LUA_MENU_REMOVE_DEVICE" )
				},
				states = {
					default = {
						font = CoD.TextSettings.BodyFont.Font,
						textStyle = CoD.TextStyle.Shadowed,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = false,
						left = 100,
						right = 100,
						top = 255 + -CoD.TextSettings.BodyFont.Height / 2,
						bottom = 255 + CoD.TextSettings.BodyFont.Height / 2,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "xenon_install_text_elem",
				properties = {
					text = Engine.Localize( "@MENU_PLEASE_WAIT" ),
					current_background = "background_start"
				},
				states = {
					default = {
						font = CoD.TextSettings.BodyFont.Font,
						textStyle = CoD.TextStyle.Shadowed,
						alignment = LUI.Alignment.Right,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = false,
						left = -100,
						right = -100,
						top = 255 + -CoD.TextSettings.BodyFont.Height / 2,
						bottom = 255 + CoD.TextSettings.BodyFont.Height / 2,
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1
					}
				},
				handlers = {
					refresh_progress = RefreshProgressText
				}
			},
			{
				type = "UITimer",
				id = "refresh_progress_text_id",
				properties = {
					event = "refresh_progress",
					interval = 50,
					disposable = false,
					broadcastToRoot = true
				}
			}
		}
	}
end

function installMenuError_ConfirmAction( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestAddMenu( f9_arg0, "menu_xenon_install_main", false, f9_arg1.controller, true )
end

function menu_xenon_install_error_popup( f10_arg0, f10_arg1 )
	local f10_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_ERROR" ),
		message_text = Engine.Localize( "@PLATFORM_SAVE_DEVICE_LOST" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = installMenuError_ConfirmAction
	} )
	f10_local0:registerEventHandler( "popup_back", installMenuError_ConfirmAction )
	return f10_local0
end

function installMenuCreateCallback( f11_arg0, f11_arg1 )
	Engine.SetBackgroundVideo( "", Engine.GetDvarInt( "ui_startupActiveController" ) )
	Engine.SetSplitScreen( false )
end

function setMenuTextHandler( f12_arg0, f12_arg1 )
	
end

function installMenuButtonHandler( f13_arg0, f13_arg1 )
	installMenuCheckState( f13_arg0, f13_arg1 )
end

function installMenuCheckState( f14_arg0, f14_arg1 )
	local f14_local0, f14_local1 = nil
	f14_local0 = IsFirstPackageInstalled()
	if f14_local0 and IsSecondPackageInstalled() then
		LUI.FlowManager.RequestAddMenu( f14_arg0, "menu_xenon_install_complete", false, f14_arg1.controller, true, {
			message = Engine.Localize( "@LUA_MENU_DISC_CONTENT_ALREADY_INSTALLED" )
		} )
		return 
	elseif Engine.IsProfileSignedIn( f14_arg1.controller ) then
		if not f14_local0 then
			f0_local0 = 0
		else
			f0_local0 = 1
		end
		if Engine.InstallXenonDiscContent( f14_arg1.controller, f0_local0 ) then
			LUI.FlowManager.RequestAddMenu( f14_arg0, "menu_xenon_install", false, f14_arg1.controller, true )
			Engine.StopMusic( 200 )
		else
			LUI.FlowManager.RequestAddMenu( f14_arg0, "menu_xenon_install_device_popup", true, f14_arg1.controller, false )
		end
	else
		LUI.FlowManager.RequestAddMenu( f14_arg0, "menu_xenon_install_signin_popup", true, f14_arg1.controller, false )
	end
end

f0_local1 = function ()
	for f15_local0 = 0, 3, 1 do
		if Engine.IsProfileSignedIn( f15_local0 ) then
			return true
		end
	end
	return false
end

f0_local2 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f0_local1()
	local f16_local1 = IsFirstPackageInstalled()
	local f16_local2 = IsSecondPackageInstalled()
	if not f16_local0 then
		f16_arg0:setText( Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE" ) )
	elseif not f16_local1 then
		f16_arg0:setText( Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE_1" ) )
	elseif not f16_local2 then
		f16_arg0:setText( Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE_2" ) )
	end
end

function menu_xenon_install_main()
	return {
		type = "UIElement",
		id = "menu_xenon_install_main_id",
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
				type = "UIElement",
				id = "logo_container_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 193,
						bottom = -292,
						left = 394,
						right = -394
					},
					normal = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 177,
						bottom = -276,
						left = 369,
						right = -369
					}
				},
				handlers = {
					menu_create = MBh.AnimateToState( "normal", 9000 )
				},
				children = {
					{
						type = "UIImage",
						id = "logo_blur_sm_img_id",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 0,
								blue = 0,
								green = 0,
								material = RegisterMaterial( "logo_game_big_glow" )
							},
							fadein = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 0.5,
								blue = 0.5,
								green = 0.5
							},
							fadeout = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 0,
								blue = 0,
								green = 0
							}
						},
						handlers = {
							menu_create = MBh.AnimateSequence( {
								{
									"default",
									500,
									false,
									false
								},
								{
									"fadein",
									1000,
									false,
									false
								},
								{
									"fadeout",
									2000,
									false,
									false
								}
							} )
						}
					},
					{
						type = "UIImage",
						id = "logo_blur_img_id",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 0,
								blue = 0,
								green = 0,
								material = RegisterMaterial( "logo_game_big_blur" )
							},
							fadein = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 0.7,
								blue = 0.7,
								green = 0.7
							},
							fadeout = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 0,
								blue = 0,
								green = 0
							}
						},
						handlers = {
							menu_create = MBh.AnimateSequence( {
								{
									"default",
									1500,
									false,
									false
								},
								{
									"fadein",
									1000,
									false,
									false
								},
								{
									"fadeout",
									2000,
									false,
									false
								}
							} )
						}
					},
					{
						type = "UIImage",
						id = "logo_img_id",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								alpha = 0,
								material = RegisterMaterial( "logo_game_big" )
							},
							normal = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								red = 1,
								blue = 1,
								green = 1,
								alpha = 1
							}
						},
						handlers = {
							menu_create = MBh.AnimateSequence( {
								{
									"default",
									2000,
									false,
									false
								},
								{
									"normal",
									1000,
									false,
									false
								}
							} )
						}
					}
				}
			},
			{
				type = "UIText",
				id = "legal_text_id",
				properties = {
					text = Engine.Localize( "@LUA_MENU_LEGAL_COPYRIGHT_SHORT" )
				},
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = -1 * (CoD.TextSettings.BodyFont.Height + 55),
						bottom = -55,
						left = 0,
						right = 0,
						font = CoD.TextSettings.BodyFont.Font,
						alignment = LUI.Alignment.Center,
						red = Colors.primary_text_color.r,
						green = Colors.primary_text_color.g,
						blue = Colors.primary_text_color.b,
						alpha = 0.3
					}
				}
			},
			{
				type = "UIElement",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = false,
						rightAnchor = false,
						top = 396,
						bottom = 421,
						left = 0,
						right = 0,
						alpha = 0
					},
					full = {
						alpha = 1
					},
					half = {
						alpha = 0.5
					}
				},
				handlers = {
					menu_create = MBh.AnimateSequence( {
						{
							"default",
							2500
						},
						{
							"full",
							2000
						}
					} ),
					transition_complete_full = MBh.AnimateLoop( {
						{
							"half",
							1000,
							true,
							true
						},
						{
							"full",
							1000,
							true,
							true
						}
					} )
				},
				children = {
					{
						type = "UIButton",
						id = "button_prompt_id",
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = false,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0
							}
						},
						handlers = {
							button_action = installMenuButtonHandler
						},
						children = {
							{
								type = "UIText",
								id = "button_prompt_text_id",
								properties = {
									text = Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE" )
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
										red = 0.7,
										blue = 0.7,
										green = 0.7,
										alpha = 1,
										font = CoD.TextSettings.BodyFont.Font
									}
								},
								handlers = {
									menu_create = function ( f18_arg0, f18_arg1 )
										local f18_local0 = f0_local1()
										local f18_local1 = IsFirstPackageInstalled()
										local f18_local2 = IsSecondPackageInstalled()
										if f18_local1 and f18_local2 then
											LUI.FlowManager.RequestAddMenu( f18_arg0, "menu_xenon_install_complete", false, f18_arg1.controller, true, {
												message = Engine.Localize( "@LUA_MENU_DISC_CONTENT_ALREADY_INSTALLED" )
											} )
											return 
										elseif not f18_local0 then
											f18_arg0:setText( Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE" ) )
										elseif not f18_local1 then
											f18_arg0:setText( Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE_1" ) )
										elseif not f18_local2 then
											f18_arg0:setText( Engine.Localize( "@LUA_MENU_DISC_CONTENT_MESSAGE_2" ) )
										end
										f18_arg0:addElement( LUI.UITimer.new( 200, "menu_text_tick" ) )
										f18_arg0:registerEventHandler( "menu_text_tick", f0_local2 )
									end
									
								}
							}
						}
					}
				}
			},
			{
				type = "UIBindButton",
				id = "bind_button_prompt_id",
				handlers = {
					button_start = installMenuButtonHandler
				}
			}
		},
		handlers = {
			menu_create = installMenuCreateCallback
		}
	}
end

function deviceMenuSignin_YesAction( f19_arg0, f19_arg1 )
	installMenuCheckState( f19_arg0, f19_arg1 )
end

function menu_xenon_install_device_popup( f20_arg0, f20_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@LUA_MENU_DISC_CONTENT_DEVICE" ),
		yes_action = deviceMenuSignin_YesAction,
		no_action = MBh.LeaveMenu(),
		default_focus_index = 1
	} )
end

function installMenuSignin_YesAction( f21_arg0, f21_arg1 )
	Engine.ExecNow( "forcenosplitscreencontrol main_lockout_signin_START", f21_arg1.controller )
	Engine.Exec( "xsignin", f21_arg1.controller )
	Engine.Exec( "forcesplitscreencontrol main_lockout_signin_START" )
end

function menu_xenon_install_signin_popup( f22_arg0, f22_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@LUA_MENU_DISC_CONTENT_SIGNIN" ),
		yes_action = installMenuSignin_YesAction,
		no_action = MBh.LeaveMenu(),
		default_focus_index = 1
	} )
end

function OnXenonInstallCompleteReposition( f23_arg0, f23_arg1 )
	local f23_local0 = 40
	local f23_local1 = f23_arg0:getParent()
	local f23_local2, f23_local3, f23_local4, f23_local5 = GetTextDimensions( f23_local1.properties.message, CoD.TextSettings.BodyFont.Font, CoD.TextSettings.BodyFont.Height )
	local f23_local6 = f23_local0 + f23_local4 - f23_local2
	f23_arg0:registerAnimationState( "updated", {
		left = -f23_local6 / 2,
		right = f23_local6 / 2
	} )
	f23_arg0:animateToState( "updated", 0 )
end

function menu_xenon_install_complete()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "xenon_install_exists_menu_id"
	self.properties = {
		message = ""
	}
	local f24_local1 = CoD.CreateState( 0, 50, 512, 178, CoD.AnchorTypes.TopLeft )
	f24_local1.material = RegisterMaterial( "img_install_cod_logo" )
	local self = LUI.UIImage.new( f24_local1 )
	self.id = "logo_img_id"
	self:addElement( self )
	local f24_local3 = CoD.CreateState( 0, CoD.TextSettings.BodyFont.Height * -2, 0, CoD.TextSettings.BodyFont.Height * 2, CoD.AnchorTypes.None )
	f24_local3.alignment = LUI.Alignment.Center
	f24_local3.alpha = 1
	local self = LUI.UIElement.new( f24_local3 )
	self:registerEventHandler( "menu_create", MBh.EmitEvent( "reposition_elements" ) )
	self:registerEventHandler( "reposition_elements", OnXenonInstallCompleteReposition )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_popup_background" ) )
	local f24_local5 = CoD.CreateState( 0, -CoD.TextSettings.BodyFont.Height / 2 - CoD.TextSettings.BodyFont.Height, 0, CoD.TextSettings.BodyFont.Height / 2 - CoD.TextSettings.BodyFont.Height, CoD.AnchorTypes.LeftRight )
	f24_local5.font = CoD.TextSettings.BodyFont.Font
	f24_local5.alignment = LUI.Alignment.Center
	f24_local5.red = Colors.secondary_text_color.r
	f24_local5.green = Colors.secondary_text_color.g
	f24_local5.blue = Colors.secondary_text_color.b
	f24_local5.alpha = 1
	local self = LUI.UIText.new( f24_local5 )
	self.id = "menu_xenon_install_complete_text_elem"
	self:setText( self.properties.message )
	self:addElement( self )
	self:addElement( self )
	return self
end

function PushInstall()
	Engine.PlayMusic( CoD.Music.MainSPMusic, 1, 660 )
	PersistentBackground.Set( PersistentBackground.Variants.Default )
end

LUI.MenuBuilder.registerDef( "menu_xenon_install_main", menu_xenon_install_main )
LUI.MenuBuilder.registerPopupType( "menu_xenon_install_signin_popup", menu_xenon_install_signin_popup )
LUI.MenuBuilder.registerPopupType( "menu_xenon_install_device_popup", menu_xenon_install_device_popup )
LUI.MenuBuilder.registerPopupType( "menu_xenon_install_error_popup", menu_xenon_install_error_popup )
LUI.MenuBuilder.registerDef( "menu_xenon_install", menu_xenon_install )
LUI.MenuBuilder.registerType( "menu_xenon_install_complete", menu_xenon_install_complete )
LUI.FlowManager.RegisterStackPushBehaviour( "menu_xenon_install_main", PushInstall )
LockTable( _M )
