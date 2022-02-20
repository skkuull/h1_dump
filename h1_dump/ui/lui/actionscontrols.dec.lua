local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ActionControls = {}
function CreateOptions( f1_arg0 )
	LUI.Options.CreateControlProfileDataButton( f1_arg0, "autoWeaponSwitch", "profile_toggleAutoWeaponSwitch", nil, "LUA_MENU_AUTO_WEAPON_SWITCH", "LUA_MENU_AUTO_WEAPON_SWITCH_DESC", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	} )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_FIRE_WEAPON", "@MENU_FIRE_WEAPON_DESC", "+attack" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_AIM_DOWN_THE_SIGHT", "@MENU_AIM_DOWN_THE_SIGHT_DESC", "+toggleads_throw" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_HOLD_AIM_DOWN_SIGHT", "@MENU_HOLD_AIM_DOWN_SIGHT_DESC", "+speed_throw" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_RELOAD_WEAPON", "@MENU_RELOAD_WEAPON_DESC", "+reload" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_SWITCH_WEAPON", "@MENU_SWITCH_WEAPON_DESC", "weapnext" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_SWITCH_MELEE", "@MENU_SWITCH_MELEE_DESC", "weapmelee" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_MELEEATTACK", "@MENU_MELEEATTACK_DESC", "+melee_zoom" )
	if not Engine.IsMultiplayer() then
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_FRAG_GRENADE", "@MENU_ABILITY_FRAG_GRENADE_DESC", "+frag" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_SPECIAL_GRENADE", "@MENU_ABILITY_SPECIAL_GRENADE_DESC", "+smoke" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_USE_DROP", "@MENU_USE_DROP_DESC", "+activate" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_NVG", "@MENU_ABILITY_NVG_DESC", "+actionslot 1" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_GRENADE_LAUNCHER", "@MENU_ABILITY_GRENADE_LAUNCHER_DESC", "+actionslot 3" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_EQUIPMENT", "@MENU_ABILITY_EQUIPMENT_DESC", "+actionslot 4" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_C4", "@MENU_ABILITY_C4_DESC", "+actionslot 2" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_SHOW_OBJECTIVES", "@MENU_SHOW_OBJECTIVES_DESC", "+scores" )
	else
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_FRAG_EQUIPMENT", "@MENU_FRAG_EQUIPMENT_DESC", "+frag" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_THROW_SPECIAL_GRENADE", "@MENU_THROW_SPECIAL_GRENADE_DESC", "+smoke" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_USE", "@MENU_USE_DESC", "+activate" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_ABILITY_NVG", "@MENU_ABILITY_NVG_DESC", "+actionslot 1" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_WEAPON_ATTACHMENT", "@MENU_WEAPON_ATTACHMENT_DESC", "+actionslot 3" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_KILLSTREAK_REWARD_SLOT_GIMME", "@MENU_KILLSTREAK_REWARD_SLOT_GIMME_DESC", "+actionslot 4" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_INSPECT_WEAPON", "@MENU_INSPECT_WEAPON_DESC", "+actionslot 2" )
		LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_SHOW_SCORESMENU", "@MENU_SHOW_SCORESMENU_DESC", "+scores" )
	end
	LUI.Options.InitScrollingList( f1_arg0.list, nil )
end

function RefreshFunc( f2_arg0 )
	return function ( f3_arg0, f3_arg1 )
		f2_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
	
end

LUI.ActionControls.new = function ( f4_arg0, f4_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f4_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f4_local1 = LUI.MenuTemplate.new( f4_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CONTROL_OPTIONS" ) ),
		menu_top_indent = f4_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = 0 ~= LUI.PCControlOptions.FindTypeIndex( LUI.PreviousMenuName )
	} )
	f4_local1:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f4_local1:registerEventHandler( "popup_inactive", RefreshFunc( f4_local1 ) )
	f4_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f5_arg0 )
			return LUI.PCControlOptions.Categories[f5_arg0].title
		end,
		tabCount = #LUI.PCControlOptions.Categories,
		underTabTextFunc = function ( f6_arg0 )
			return LUI.PCControlOptions.Categories[f6_arg0].title
		end,
		top = f4_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.PCControlOptions.LoadMenu,
		activeIndex = LUI.PCControlOptions.FindTypeIndex( "actions_controls" ),
		isTabLockedfunc = LUI.PCControlOptions.IsCategoryDisabled,
		skipChangeTab = true,
		exclusiveController = f4_local1.exclusiveController
	} ) )
	CreateOptions( f4_local1 )
	LUI.PCControlOptions.AddResetToDefaultButton( f4_local1 )
	LUI.Options.AddOptionTextInfo( f4_local1 )
	f4_local1:AddBackButton()
	return f4_local1
end

LUI.MenuBuilder.registerType( "actions_controls", LUI.ActionControls.new )
LockTable( _M )
