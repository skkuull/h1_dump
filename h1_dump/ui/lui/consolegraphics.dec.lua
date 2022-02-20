local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ConsoleGraphics = {}
function OnSafeArea( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestAddMenu( f1_arg0, "boot_screen_margins", false, f1_arg1.controller, false, {
		continueExclusive = true,
		is_in_options_menu = true
	} )
end

function OpenBrightnessMenu()
	LUI.FlowManager.RequestAddMenu( nil, "boot_brightness", true, controller, false, {
		is_in_options_menu = true
	} )
end

function DisplayKillstreakCounterToggle( f3_arg0 )
	Engine.DisplayKillstreakCounterToggle( f3_arg0 )
end

function GetDisplayKillstreakCounterText( f4_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "displayKillstreakCounter", f4_arg0 )
end

function DisplayMedalSplashesToggle( f5_arg0 )
	Engine.DisplayMedalSplashesToggle( f5_arg0 )
end

function GetDisplayMedalSplashesText( f6_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "displayMedalSplashes", f6_arg0 )
end

function DisplayWeaponEmblemsToggle( f7_arg0 )
	Engine.DisplayWeaponEmblemsToggle( f7_arg0 )
end

function GetDisplayWeaponEmblemsText( f8_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "displayWeaponEmblems", f8_arg0 )
end

LUI.ConsoleGraphics.new = function ( f9_arg0, f9_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f9_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f9_local1 = 0 ~= LUI.ConsoleOptions.FindTypeIndex( LUI.PreviousMenuName )
	local f9_local2 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f9_local2 = -15
	end
	local f9_local3 = LUI.MenuTemplate.new( f9_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_OPTIONS_UPPER_CASE" ) ),
		menu_top_indent = f9_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing + f9_local2,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = f9_local1
	} )
	f9_local3:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f9_local3:addElement( LUI.H1MenuTab.new( {
		title = function ( f10_arg0 )
			return LUI.ConsoleOptions.Categories[f10_arg0].title
		end,
		tabCount = #LUI.ConsoleOptions.Categories,
		underTabTextFunc = function ( f11_arg0 )
			return LUI.ConsoleOptions.Categories[f11_arg0].title
		end,
		top = f9_local0 + LUI.MenuTemplate.ListTop + f9_local2,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.ConsoleOptions.LoadMenu,
		activeIndex = LUI.ConsoleOptions.FindTypeIndex( "console_graphics" ),
		isTabLockedfunc = LUI.ConsoleOptions.IsOptionLocked,
		skipChangeTab = true,
		exclusiveController = f9_local3.exclusiveController
	} ) )
	LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_COLORBLIND_FILTER", "@LUA_MENU_COLOR_BLIND_DESC", LUI.Options.GetRenderColorBlindText, LUI.Options.RenderColorBlindToggle, LUI.Options.RenderColorBlindToggle )
	LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_BLOOD", "@LUA_MENU_BLOOD_DESC", LUI.Options.GetDvarEnableTextFunc( "cg_blood", false ), LUI.Options.ToggleProfiledataFunc( "showblood", Engine.GetControllerForLocalClient( 0 ) ), LUI.Options.ToggleProfiledataFunc( "showblood", Engine.GetControllerForLocalClient( 0 ) ) )
	if not Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_CROSSHAIR", "@LUA_MENU_CROSSHAIR_DESC", LUI.Options.GetDvarEnableTextFunc( "cg_drawCrosshairOption", false ), LUI.Options.ToggleDvarFunc( "cg_drawCrosshairOption" ), LUI.Options.ToggleDvarFunc( "cg_drawCrosshairOption" ) )
		LUI.Options.CreateOptionButton( f9_local3, "cg_drawDamageFeedbackOption", "@LUA_MENU_HIT_MARKER", "@LUA_MENU_HIT_MARKER_DESC", {
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
	if Engine.IsMultiplayer() and Engine.GetDvarType( "cg_paintballFx" ) == DvarTypeTable.DvarBool then
		LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_PAINTBALL", "@LUA_MENU_PAINTBALL_DESC", LUI.Options.GetDvarEnableTextFunc( "cg_paintballFx", false ), LUI.Options.ToggleDvarFunc( "cg_paintballFx" ), LUI.Options.ToggleDvarFunc( "cg_paintballFx" ) )
	end
	if Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@MENU_DISPLAY_KILLSTREAK_COUNTER", "@MENU_DISPLAY_KILLSTREAK_COUNTER_DESC", GetDisplayKillstreakCounterText, DisplayKillstreakCounterToggle, DisplayKillstreakCounterToggle )
		LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@MENU_DISPLAY_MEDAL_SPLASHES", "@MENU_DISPLAY_MEDAL_SPLASHES_DESC", GetDisplayMedalSplashesText, DisplayMedalSplashesToggle, DisplayMedalSplashesToggle )
		LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Select, "@MENU_DISPLAY_WEAPON_EMBLEMS", "@MENU_DISPLAY_WEAPON_EMBLEMS_DESC", GetDisplayWeaponEmblemsText, DisplayWeaponEmblemsToggle, DisplayWeaponEmblemsToggle )
	end
	LUI.Options.AddButtonOptionVariant( f9_local3, GenericButtonSettings.Variants.Common, "@MENU_BRIGHTNESS", "@MENU_BRIGHTNESS_DESC1", nil, nil, nil, OpenBrightnessMenu, nil, nil, nil )
	if Engine.InFrontend() or not Engine.GetSplitScreen() then
		f9_local3:AddButton( "@LUA_MENU_SAFE_AREA", OnSafeArea, nil, nil, nil, {
			desc_text = Engine.Localize( "@LUA_MENU_SAFE_AREA_DESC" )
		} )
	end
	LUI.Options.InitScrollingList( f9_local3.list, nil )
	LUI.Options.AddOptionTextInfo( f9_local3 )
	f9_local3:AddBackButton( function ( f12_arg0, f12_arg1 )
		Engine.ExecNow( "profile_menuDvarsFinish", f12_arg1.controller )
		Engine.Exec( "updategamerprofile" )
		LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
		if GameX.IsSplitscreen() then
			GameX.SetOptionState( false )
		end
	end )
	return f9_local3
end

LUI.MenuBuilder.registerType( "console_graphics", LUI.ConsoleGraphics.new )
LockTable( _M )
