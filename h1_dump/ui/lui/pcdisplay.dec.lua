local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.PCDisplay = {}
function OpenBrightnessMenu()
	LUI.FlowManager.RequestAddMenu( nil, "boot_brightness", true, controller, false, {
		is_in_options_menu = true
	} )
end

function DisplayKillstreakCounterToggle( f2_arg0 )
	Engine.DisplayKillstreakCounterToggle( f2_arg0 )
end

function GetDisplayKillstreakCounterText( f3_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "displayKillstreakCounter", f3_arg0 )
end

function DisplayMedalSplashesToggle( f4_arg0 )
	Engine.DisplayMedalSplashesToggle( f4_arg0 )
end

function GetDisplayMedalSplashesText( f5_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "displayMedalSplashes", f5_arg0 )
end

function DisplayWeaponEmblemsToggle( f6_arg0 )
	Engine.DisplayWeaponEmblemsToggle( f6_arg0 )
end

function GetDisplayWeaponEmblemsText( f7_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "displayWeaponEmblems", f7_arg0 )
end

function CreateOptions( f8_arg0 )
	LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@LUA_MENU_COLORBLIND_FILTER", "@LUA_MENU_COLOR_BLIND_DESC", LUI.Options.GetRenderColorBlindText, LUI.Options.RenderColorBlindToggle, LUI.Options.RenderColorBlindToggle )
	if Engine.IsMultiplayer() and Engine.GetDvarType( "cg_paintballFx" ) == DvarTypeTable.DvarBool then
		LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@LUA_MENU_PAINTBALL", "@LUA_MENU_PAINTBALL_DESC", LUI.Options.GetDvarEnableTextFunc( "cg_paintballFx", false ), LUI.Options.ToggleDvarFunc( "cg_paintballFx" ), LUI.Options.ToggleDvarFunc( "cg_paintballFx" ) )
	end
	LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@LUA_MENU_BLOOD", "@LUA_MENU_BLOOD_DESC", LUI.Options.GetDvarEnableTextFunc( "cg_blood", false ), LUI.Options.ToggleProfiledataFunc( "showblood", Engine.GetControllerForLocalClient( 0 ) ), LUI.Options.ToggleProfiledataFunc( "showblood", Engine.GetControllerForLocalClient( 0 ) ) )
	if not Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@LUA_MENU_CROSSHAIR", "@LUA_MENU_CROSSHAIR_DESC", LUI.Options.GetDvarEnableTextFunc( "cg_drawCrosshairOption", false ), LUI.Options.ToggleDvarFunc( "cg_drawCrosshairOption" ), LUI.Options.ToggleDvarFunc( "cg_drawCrosshairOption" ) )
		LUI.Options.CreateOptionButton( f8_arg0, "cg_drawDamageFeedbackOption", "@LUA_MENU_HIT_MARKER", "@LUA_MENU_HIT_MARKER_DESC", {
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			}
		} )
	end
	if Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@MENU_DISPLAY_KILLSTREAK_COUNTER", "@MENU_DISPLAY_KILLSTREAK_COUNTER_DESC", GetDisplayKillstreakCounterText, DisplayKillstreakCounterToggle, DisplayKillstreakCounterToggle )
		LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@MENU_DISPLAY_MEDAL_SPLASHES", "@MENU_DISPLAY_MEDAL_SPLASHES_DESC", GetDisplayMedalSplashesText, DisplayMedalSplashesToggle, DisplayMedalSplashesToggle )
		LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Select, "@MENU_DISPLAY_WEAPON_EMBLEMS", "@MENU_DISPLAY_WEAPON_EMBLEMS_DESC", GetDisplayWeaponEmblemsText, DisplayWeaponEmblemsToggle, DisplayWeaponEmblemsToggle )
	end
	LUI.Options.AddButtonOptionVariant( f8_arg0, GenericButtonSettings.Variants.Common, "@MENU_BRIGHTNESS", "@MENU_BRIGHTNESS_DESC1", nil, nil, nil, OpenBrightnessMenu, nil, nil, nil )
	LUI.Options.InitScrollingList( f8_arg0.list, nil )
end

function RefreshFunc( f9_arg0 )
	return function ( f10_arg0, f10_arg1 )
		f9_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
	
end

LUI.PCDisplay.new = function ( f11_arg0, f11_arg1 )
	local f11_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f11_local1 = LUI.MenuTemplate.new( f11_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_GRAPHIC_OPTIONS" ) ),
		menu_top_indent = f11_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		menu_width = GenericMenuDims.OptionMenuWidth,
		skipAnim = 0 ~= LUI.PCGraphicOptions.FindTypeIndex( LUI.PreviousMenuName )
	} )
	f11_local1.brightnessGuide = LUI.Options.CreateBrightnessGuide()
	f11_local1:addElement( f11_local1.brightnessGuide )
	f11_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f12_arg0 )
			return LUI.PCGraphicOptions.Categories[f12_arg0].title
		end,
		tabCount = #LUI.PCGraphicOptions.Categories,
		underTabTextFunc = function ( f13_arg0 )
			return LUI.PCGraphicOptions.Categories[f13_arg0].title
		end,
		top = f11_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.PCGraphicOptions.LoadMenu,
		activeIndex = LUI.PCGraphicOptions.FindTypeIndex( "pc_display" ),
		skipChangeTab = true,
		exclusiveController = f11_local1.exclusiveController
	} ) )
	f11_local1:registerEventHandler( "popup_inactive", RefreshFunc( f11_local1 ) )
	CreateOptions( f11_local1 )
	LUI.Options.AddOptionTextInfo( f11_local1 )
	LUI.PCControlOptions.AddOptimalVideoButton( f11_local1 )
	f11_local1:AddBackButton( function ( f14_arg0, f14_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f14_arg0 )
	end )
	return f11_local1
end

LUI.MenuBuilder.registerType( "pc_display", LUI.PCDisplay.new )
LockTable( _M )
