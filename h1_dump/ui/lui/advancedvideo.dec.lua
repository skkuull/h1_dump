local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AdvancedVideo = {}
function RefreshAdapterInfo()
	local f1_local0 = Engine.GetLuiRoot()
	local f1_local1 = f1_local0:getFirstDescendentById( "videoAdapterInfoContainer" )
	f1_local1:processEvent( {
		name = "menu_refresh"
	} )
end

function RefreshVideoSettingAndAdapterInfo()
	LUI.Options.RefreshVideoSetting()
	RefreshAdapterInfo()
end

function CreateExtraSpace( f3_arg0 )
	f3_arg0.list:addElement( LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 33.33
	} ) )
end

function CreateDivider( f4_arg0, f4_arg1, f4_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 33.33
	} )
	self.scrollingToNext = true
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "h1_option_menu_titlebar", {
		title_bar_text = Engine.ToUpperCase( Engine.Localize( f4_arg1 ) )
	} ) )
	f4_arg0.list:addElement( self )
end

function OnVideoChange( f5_arg0, f5_arg1 )
	LUI.PCOptions.TransferSettingsToUI()
	local f5_local0 = Engine.GetLuiRoot()
	local f5_local1 = f5_local0:getFirstDescendentById( "videoAdapterInfoContainer" )
	f5_local1:processEvent( {
		name = "menu_refresh"
	} )
	local f5_local2 = LUI.FlowManager.GetMenuScopedDataByMenuName( "pc_controls" )
	if f5_local2.selectorButtonId ~= nil then
		local f5_local3 = f5_local0:getFirstDescendentById( f5_local2.selectorButtonId )
		f5_local3:processEvent( {
			name = "button_action"
		} )
	end
	f5_arg0.list:processEvent( {
		name = "content_refresh",
		dispatchChildren = true
	} )
end

function CreateVideoAdapterInfoElement()
	local f6_local0 = CoD.TextSettings.Font23
	local f6_local1 = CoD.TextSettings.Font23
	local f6_local2 = 5
	local f6_local3 = 37
	local self = LUI.UIElement.new()
	self.id = "videoAdapterInfoContainer"
	local f6_local5 = 265 - f6_local1.Height
	local self = LUI.UIText.new( {
		font = f6_local1.Font,
		alignment = LUI.Alignment.Right,
		top = f6_local5,
		left = 97,
		width = 485,
		height = f6_local1.Height,
		alpha = 1
	} )
	self.id = "videoAdapterMemory"
	local f6_local7 = f6_local5 - f6_local2 - f6_local0.Height
	local self = LUI.UIText.new( {
		font = f6_local0.Font,
		alignment = LUI.Alignment.Right,
		top = f6_local7,
		left = 97,
		width = 485,
		height = f6_local0.Height,
		color = Colors.s1.text_unfocused,
		alpha = 1
	} )
	self.id = "videoAdapterMemoryTitle"
	self:setText( Engine.Localize( "@PLATFORM_UI_DEDICATED_VIDEO_MEMORY" ) )
	local f6_local9 = f6_local7 - f6_local3 - f6_local1.Height
	local self = LUI.UIText.new( {
		font = f6_local1.Font,
		alignment = LUI.Alignment.Right,
		top = f6_local9,
		left = 97,
		width = 485,
		height = f6_local1.Height,
		color = Colors.h1.medium_grey,
		alpha = 1
	} )
	self.id = "videoAdapter"
	self:setText( LUI.PCOptions.GetDvarValue( "r_adapterName" ) )
	local self = LUI.UIText.new( {
		font = f6_local0.Font,
		alignment = LUI.Alignment.Right,
		top = f6_local9 - f6_local2 - f6_local0.Height,
		left = 97,
		width = 485,
		height = f6_local0.Height,
		color = Colors.s1.text_unfocused,
		alpha = 1
	} )
	self.id = "videoAdapterTitle"
	self:setText( Engine.Localize( "@PLATFORM_UI_VIDEO_ADAPTER" ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local f6_local12 = function ()
		self:setText( LUI.PCOptions.GetDvarValue( "r_adapterName" ) )
		local f7_local0 = Engine.GetEstimatedVRAMUsageFromUISettingsMB()
		local f7_local1 = Engine.GetAvailableTextureMemMB()
		local f7_local2, f7_local3 = nil
		if Engine.ShouldWarnLowVRAM() then
			f7_local2 = Colors.red
		else
			f7_local2 = Colors.h1.medium_grey
		end
		if Engine.HasNoDedicatedVRAM() then
			f7_local3 = tostring( f7_local0 ) .. Engine.Localize( "@PLATFORM_UI_MB_USED" )
		else
			f7_local3 = tostring( f7_local0 ) .. " / " .. tostring( f7_local1 ) .. " " .. Engine.Localize( "@PLATFORM_UI_MB_USED" )
		end
		self:registerAnimationState( "color", {
			color = f7_local2
		} )
		self:animateToState( "color" )
		self:setText( f7_local3 )
	end
	
	f6_local12()
	self:registerEventHandler( "menu_refresh", f6_local12 )
	return self
end

function VSyncDisplayFunc( f8_arg0, f8_arg1 )
	if Engine.GetVSyncControlDisable() then
		return Engine.Localize( "@MENU_ON" )
	else
		return nil
	end
end

function CreateDisplayOptions( f9_arg0 )
	LUI.Options.CreateDVarVideoOptionHelper( f9_arg0, "ui_r_adapter", "@PLATFORM_UI_ADAPTER", function ()
		local f10_local0 = LUI.Options.StringOptionListFromList( Engine.GetAdapterList() )
		for f10_local1 = 1, #f10_local0, 1 do
			f10_local0[f10_local1].text = Engine.MarkLocalized( f10_local0[f10_local1].text )
		end
		return f10_local0
	end, {
		button_desc = "@PLATFORM_UI_ADAPTER_DESC",
		refreshFunc = function ()
			RefreshAdapterInfo()
			Engine.Exec( "vid_restart" )
		end
	} )
	LUI.Options.CreateOptionButton( f9_arg0, "ui_r_vsync", "@MENU_SYNC_EVERY_FRAME", "@PLATFORM_SYNC_EVERY_FRAME_DESCRIPTION", {
		{
			text = "@MENU_ON",
			value = "1"
		},
		{
			text = "@MENU_OFF",
			value = "0"
		}
	}, nil, function ()
		return Engine.GetVSyncControlDisable()
	end, LUI.Options.RefreshVideoSetting, VSyncDisplayFunc )
	if not Engine.IsPCApp() then
		LUI.Options.CreateDVarVideoOptionHelper( f9_arg0, "ui_r_aspectRatio", "@PLATFORM_MONITOR_ASPECT_RATIO", {
			{
				text = "@MENU_AUTO",
				value = "auto"
			},
			{
				text = "@MENU_STANDARD_4_3",
				value = "standard"
			},
			{
				text = "@MENU_WIDE_16_10",
				value = "wide 16:10"
			},
			{
				text = "@MENU_WIDE_16_9",
				value = "wide 16:9"
			},
			{
				text = "@MENU_WIDE_21_9",
				value = "wide 21:9"
			}
		}, {
			button_desc = "@PLATFORM_ASPECT_RATIO_DESCRIPTION",
			disabledFunc = function ()
				local f13_local0
				if Engine.GetDvarBool( "r_fullscreen" ) ~= false and Engine.GetDvarBool( "r_fullscreenWindow" ) ~= true then
					f13_local0 = false
				else
					f13_local0 = true
				end
				return f13_local0
			end
		} )
	end
	LUI.Options.CreateOptionButton( f9_arg0, "ui_r_renderResolutionNative", "@PLATFORM_UI_NATIVE_RENDER_RESOLUTION", "@PLATFORM_UI_NATIVE_RENDER_RESOLUTION_DESC", {
		{
			text = "@MENU_ON",
			value = true
		},
		{
			text = "@MENU_OFF",
			value = false
		}
	}, nil, nil, function ()
		LUI.Options.RefreshVideoSetting()
		f9_arg0:RefreshButtonDisabled()
	end )
	LUI.Options.CreateDVarVideoOptionHelper( f9_arg0, "ui_r_renderResolution", "@PLATFORM_UI_IMAGE_QUALITY", function ()
		return Engine.GetRenderResolutionOptions()
	end, {
		button_desc = "@PLATFORM_IMAGE_QUALITY_DESCRIPTION",
		disabledFunc = function ()
			return Engine.GetDvarBool( "ui_r_renderResolutionNative" )
		end
	} )
end

function CreateTextureOptions( f17_arg0 )
	CreateDivider( f17_arg0, "@PLATFORM_UI_TEXTURE_OPTIONS", 8 )
	LUI.Options.CreateOptionButton( f17_arg0, "ui_r_picmip", "@MENU_TEXTURE_RESOLUTION", "@PLATFORM_TEXTURE_RESOLUTION_DESCRIPTION", {
		{
			text = "@MENU_LOW",
			value = "3"
		},
		{
			text = "@MENU_NORMAL",
			value = "2"
		},
		{
			text = "@MENU_HIGH",
			value = "1"
		},
		{
			text = "@MENU_EXTRA",
			value = "0"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f17_arg0, "ui_r_picmip_bump", "@MENU_NORMAL_MAP_RESOLUTION", "@PLATFORM_NORMAL_MAP_RESOLUTION_DESCRIPTION", {
		{
			text = "@MENU_LOW",
			value = "3"
		},
		{
			text = "@MENU_NORMAL",
			value = "2"
		},
		{
			text = "@MENU_HIGH",
			value = "1"
		},
		{
			text = "@MENU_EXTRA",
			value = "0"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f17_arg0, "ui_r_picmip_spec", "@MENU_SPECULAR_MAP_RESOLUTION", "@PLATFORM_SPECULAR_MAP_RESOLUTION_DESCRIPTION", {
		{
			text = "@MENU_LOW",
			value = "3"
		},
		{
			text = "@MENU_NORMAL",
			value = "2"
		},
		{
			text = "@MENU_HIGH",
			value = "1"
		},
		{
			text = "@MENU_EXTRA",
			value = "0"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f17_arg0, "ui_r_fill_texture_memory", "@MENU_FILL_MEMORY_TEXTURES", "@PLATFORM_FILL_MEMORY_TEXTURES_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "false"
		},
		{
			text = "@MENU_ON",
			value = "true"
		}
	}, nil, function ()
		return Engine.HasNoDedicatedVRAM()
	end, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f17_arg0, "ui_r_texFilterAnisoMin", "@LUA_MENU_ANISOTROPIC_FILTERING", "@PLATFORM_ANISOTROPIC_FILTERING_DESCRIPTION", {
		{
			text = "@MENU_LOW",
			value = "1"
		},
		{
			text = "@MENU_NORMAL",
			value = "8"
		},
		{
			text = "@MENU_HIGH",
			value = "16"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
end

function CreateShadowOptions( f19_arg0 )
	CreateDivider( f19_arg0, "@PLATFORM_UI_SHADOW_OPTIONS" )
	LUI.Options.CreateOptionButton( f19_arg0, "ui_sm_enable", "@MENU_SHADOWS", "@PLATFORM_SHADOWS_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "false"
		},
		{
			text = "@MENU_ON",
			value = "true"
		}
	}, nil, nil, function ()
		LUI.Options.RefreshVideoSetting()
		f19_arg0:RefreshButtonDisabled()
	end )
	LUI.Options.CreateOptionButton( f19_arg0, "ui_sm_tileResolution", "@PLATFORM_UI_SHADOW_MAP_RESOLUTION", "@PLATFORM_SHADOW_MAP_RESOLUTION_DESCRIPTION", {
		{
			text = "@MENU_NORMAL",
			value = "Normal"
		},
		{
			text = "@MENU_HIGH",
			value = "High"
		},
		{
			text = "@MENU_EXTRA",
			value = "Extra"
		}
	}, nil, function ()
		return Engine.GetDvarBool( "sm_enable" ) == false
	end, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f19_arg0, "ui_sm_cacheSunShadow", "@PLATFORM_UI_CACHED_SUN_SHADOWS", "@PLATFORM_CACHED_SUN_SHADOWS_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "Disabled"
		},
		{
			text = "@MENU_ON",
			value = "Enabled"
		}
	}, nil, function ()
		return Engine.GetDvarBool( "sm_enable" ) == false
	end, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f19_arg0, "ui_sm_cacheSpotShadows", "@PLATFORM_UI_CACHED_SPOT_SHADOWS", "@PLATFORM_CACHED_SPOT_SHADOWS_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "Disabled"
		},
		{
			text = "@MENU_ON",
			value = "Enabled"
		}
	}, nil, function ()
		return Engine.GetDvarBool( "sm_enable" ) == false
	end, LUI.Options.RefreshVideoSetting )
end

function CreatePostProcessOptions( f24_arg0 )
	CreateDivider( f24_arg0, "@PLATFORM_UI_POST_PROCESS_OPTIONS" )
	if not Engine.IsMultiplayer() then
		LUI.Options.CreateOptionButton( f24_arg0, "ui_r_dof_limit", "@MENU_DOF", "@PLATFORM_DOF_DESCRIPTION", {
			{
				text = "@MENU_OFF",
				value = "0"
			},
			{
				text = "@PLATFORM_LOW_QUALITY",
				value = "1"
			},
			{
				text = "@PLATFORM_MEDIUM_QUALITY",
				value = "2"
			},
			{
				text = "@PLATFORM_HIGH_QUALITY",
				value = "3"
			}
		}, nil, nil, LUI.Options.RefreshVideoSetting )
	else
		LUI.Options.CreateOptionButton( f24_arg0, "ui_r_dof_limit", "@MENU_DOF", "@PLATFORM_DOF_DESCRIPTION", {
			{
				text = "@MENU_OFF",
				value = "0"
			},
			{
				text = "@MENU_ON",
				value = "2"
			}
		}, nil, nil, LUI.Options.RefreshVideoSetting )
	end
	if not Engine.IsMultiplayer() then
		LUI.Options.CreateOptionButton( f24_arg0, "ui_r_mbLimit", "@PLATFORM_MOTIONBLUR", "@PLATFORM_MOTIONBLUR_DESCRIPTION", {
			{
				text = "@MENU_OFF",
				value = "0"
			},
			{
				text = "@PLATFORM_LOW_QUALITY",
				value = "1"
			},
			{
				text = "@PLATFORM_MEDIUM_QUALITY",
				value = "2"
			},
			{
				text = "@PLATFORM_HIGH_QUALITY",
				value = "3"
			}
		}, nil, nil, LUI.Options.RefreshVideoSetting )
	end
	LUI.Options.CreateOptionButton( f24_arg0, "ui_r_ssaoLimit", "@PLATFORM_SSAO", "@PLATFORM_SSAO_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "0"
		},
		{
			text = "@MENU_NORMAL",
			value = "1"
		},
		{
			text = "@MENU_HIGH",
			value = "2"
		},
		{
			text = "@PLATFORM_HBAO",
			value = "3"
		}
	}, nil, nil, function ()
		LUI.Options.RefreshVideoSetting()
		f24_arg0:RefreshButtonDisabled()
	end )
	LUI.Options.CreateOptionButton( f24_arg0, "ui_r_mdaoLimit", "@PLATFORM_MDAO", "@PLATFORM_MDAO_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "0"
		},
		{
			text = "@MENU_ON",
			value = "2"
		}
	}, nil, function ()
		local f26_local0
		if LUI.PCOptions.GetDvarValue( "ui_r_ssaoLimit" ) ~= "0" and LUI.PCOptions.GetDvarValue( "ui_r_depthPrepass" ) ~= "None" then
			f26_local0 = false
		else
			f26_local0 = true
		end
		return f26_local0
	end, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f24_arg0, "ui_r_sssLimit", "@PLATFORM_UI_SUBSURFACE_SCATTERING", "@PLATFORM_SUBSURFACE_SCATTERING_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "0"
		},
		{
			text = "@MENU_ON",
			value = "1"
		}
	}, nil, function ()
		return LUI.PCOptions.GetDvarValue( "ui_r_depthPrepass" ) == "None"
	end, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f24_arg0, "ui_r_depthPrepass", "@PLATFORM_UI_DEPTH_PREPASS", "@PLATFORM_DEPTH_PREPASS_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "None"
		},
		{
			text = "@MENU_ON",
			value = "All"
		}
	}, nil, nil, function ()
		LUI.Options.RefreshVideoSetting()
		f24_arg0:RefreshButtonDisabled()
	end )
end

function CreateAntiAliasingOptions( f29_arg0 )
	CreateDivider( f29_arg0, "@PLATFORM_UI_ANTI_ALIASING_OPTIONS" )
	LUI.Options.CreateOptionButton( f29_arg0, "ui_r_postAA", "@PLATFORM_UI_POST_AA", "@PLATFORM_POST_AA_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "None"
		},
		{
			text = "@PLATFORM_FXAA",
			value = "FXAA"
		},
		{
			text = "@PLATFORM_SMAA_1X",
			value = "SMAA 1x"
		},
		{
			text = "@PLATFORM_SMAA_T2X",
			value = "SMAA T2x"
		},
		{
			text = "@PLATFORM_FILMIC_SMAA_1X",
			value = "Filmic SMAA 1x"
		},
		{
			text = "@PLATFORM_FILMIC_SMAA_T2X",
			value = "Filmic SMAA T2x"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
	LUI.Options.CreateOptionButton( f29_arg0, "ui_r_ssaaSamples", "@MENU_SUPERSAMPLING", "@PLATFORM_SUPERSAMPLING_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "1"
		},
		{
			text = "@MENU_2X",
			value = "2"
		},
		{
			text = "@MENU_4X",
			value = "4"
		},
		{
			text = "@MENU_8X",
			value = "8"
		},
		{
			text = "@MENU_16X",
			value = "16"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
end

function CreateShaderPreloadOptions( f30_arg0 )
	if Engine.GetDvarInt( "enable_video_options_preload_shader_controls" ) ~= 0 then
		CreateDivider( f30_arg0, "@PLATFORM_UI_SHADER_PRELOAD" )
		LUI.Options.CreateOptionButton( f30_arg0, "ui_r_preloadShaders", "@PLATFORM_UI_SHADER_PRELOAD", "@PLATFORM_SHADER_PRELOAD_DESCRIPTION", {
			{
				text = "@MENU_OFF",
				value = "false"
			},
			{
				text = "@MENU_ON",
				value = "true"
			}
		}, nil, nil, LUI.Options.RefreshVideoSetting )
		if not Engine.IsMultiplayer() then
			LUI.Options.CreateOptionButton( f30_arg0, "ui_r_preloadShadersAfterCinematic", "@PLATFORM_UI_SHADER_PRELOAD_AFTER_CINEMATIC", "@PLATFORM_SHADER_PRELOAD_AFTER_CINEMATIC_DESCRIPTION", {
				{
					text = "@MENU_OFF",
					value = "true"
				},
				{
					text = "@MENU_ON",
					value = "false"
				}
			}, nil, function ()
				return LUI.PCOptions.GetDvarValue( "ui_r_preloadShaders" ) == "false"
			end, LUI.Options.RefreshVideoSetting )
		end
	end
end

function CreateMiscellaneousOption( f32_arg0 )
	CreateDivider( f32_arg0, "@PLATFORM_UI_MISCELLANEOUS_OPTIONS" )
	LUI.Options.CreateOptionButton( f32_arg0, "ui_fx_marks", "@MENU_BULLET_IMPACTS", "@PLATFORM_BULLET_IMPACTS_DESCRIPTION", {
		{
			text = "@MENU_OFF",
			value = "false"
		},
		{
			text = "@MENU_ON",
			value = "true"
		}
	}, nil, nil, LUI.Options.RefreshVideoSetting )
	local f32_local0 = {}
	local f32_local1 = 8
	local f32_local2 = 2
	for f32_local3 = 0, f32_local1 - f32_local2, 1 do
		local f32_local6 = f32_local2 + f32_local3
		f32_local0[f32_local3 + 1] = {
			text = Engine.MarkLocalized( tostring( f32_local6 ) ),
			value = tostring( f32_local6 )
		}
	end
	LUI.Options.CreateOptionButton( f32_arg0, "ui_r_dlightForceLimit", "@PLATFORM_UI_DLIGHT_FORCE_LIMIT", "@PLATFORM_DLIGHT_FORCE_LIMIT_DESCRIPTION", f32_local0, nil, nil, LUI.Options.RefreshVideoSetting )
	if not Engine.IsConsoleGame() then
		LUI.Options.CreateOptionButton( f32_arg0, "ragdoll_enable", "@MENU_RAGDOLL", "@PLATFORM_RAGDOLL_DESC", {
			{
				text = "@MENU_OFF",
				value = false
			},
			{
				text = "@MENU_ON",
				value = true
			}
		} )
	end
end

function CreateOptions( f33_arg0 )
	CreateDisplayOptions( f33_arg0 )
	CreateTextureOptions( f33_arg0 )
	CreateShadowOptions( f33_arg0 )
	CreatePostProcessOptions( f33_arg0 )
	CreateAntiAliasingOptions( f33_arg0 )
	CreateShaderPreloadOptions( f33_arg0 )
	CreateMiscellaneousOption( f33_arg0 )
	LUI.Options.InitScrollingList( f33_arg0.list, nil )
end

function RefreshFunc( f34_arg0 )
	return function ( f35_arg0, f35_arg1 )
		LUI.PCOptions.TransferSettingsToUI()
		Engine.ExecNow( "profile_menuDvarsSetup" )
		LUI.Options.RefreshVideoSetting()
		f34_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
	
end

function DelayedRefreshFunc( f36_arg0 )
	f36_arg0:registerEventHandler( "video_option_update_delay", RefreshFunc( f36_arg0 ) )
	return function ( f37_arg0, f37_arg1 )
		f36_arg0:addElement( LUI.UITimer.new( 200, "video_option_update_delay", nil, true ) )
	end
	
end

LUI.AdvancedVideo.new = function ( f38_arg0, f38_arg1 )
	LUI.PCOptions.TransferSettingsToUI()
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f38_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f38_local1 = LUI.MenuTemplate.new( f38_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_GRAPHIC_OPTIONS" ) ),
		menu_top_indent = f38_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		genericListAction = function ( f39_arg0, f39_arg1 )
			LUI.Options.CloseSelectionMenu( f39_arg1.menu )
		end,
		skipAnim = LUI.PCGraphicOptions.FindTypeIndex( LUI.PreviousMenuName ) ~= 0
	} )
	f38_local1:registerEventHandler( "onVideoChange", OnVideoChange )
	f38_local1:registerEventHandler( "menu_create", function ( element, event )
		local f40_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "pc_controls" )
		f40_local0.selectorValues = nil
		f40_local0.selectorUpdateValueFunc = nil
		f40_local0.selectorButtonId = nil
		f40_local0.selectorDefaultDesc = nil
		f40_local0.selectorUpdateValueFunc = nil
		f40_local0.selectorPriorValueIndex = -1
	end )
	f38_local1:registerEventHandler( "popup_inactive", RefreshFunc( f38_local1 ) )
	f38_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f41_arg0 )
			return LUI.PCGraphicOptions.Categories[f41_arg0].title
		end,
		tabCount = #LUI.PCGraphicOptions.Categories,
		underTabTextFunc = function ( f42_arg0 )
			return LUI.PCGraphicOptions.Categories[f42_arg0].title
		end,
		top = f38_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.PCGraphicOptions.LoadMenu,
		activeIndex = LUI.PCGraphicOptions.FindTypeIndex( "advanced_video" ),
		skipChangeTab = true,
		exclusiveController = f38_local1.exclusiveController
	} ) )
	CreateOptions( f38_local1 )
	LUI.PCControlOptions.AddOptimalVideoButton( f38_local1 )
	LUI.Options.AddOptionTextInfo( f38_local1 )
	f38_local1:addElement( CreateVideoAdapterInfoElement() )
	f38_local1:AddBackButtonWithSelector()
	return f38_local1
end

LUI.MenuBuilder.registerType( "advanced_video", LUI.AdvancedVideo.new )
LockTable( _M )
