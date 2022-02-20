local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.CODAnywhereOptions = {}
LUI.CODAnywhereOptions.new = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f1_local1 = LUI.MenuTemplate.new( f1_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_OPTIONS_UPPER_CASE" ) ),
		menu_top_indent = f1_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = isPreviousLevelIsControlOption
	} )
	f1_local1:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f1_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f2_arg0 )
			return LUI.ConsoleOptions.Categories[f2_arg0].title
		end,
		tabCount = #LUI.ConsoleOptions.Categories,
		underTabTextFunc = function ( f3_arg0 )
			return LUI.ConsoleOptions.Categories[f3_arg0].title
		end,
		top = f1_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.ConsoleOptions.LoadMenu,
		activeIndex = LUI.ConsoleOptions.FindTypeIndex( "cod_anywhere_options" ),
		isTabLockedfunc = LUI.ConsoleOptions.IsOptionLocked,
		skipChangeTab = true,
		exclusiveController = f1_local1.exclusiveController
	} ) )
	local f1_local2 = "@LUA_MENU_CODA_SET_UP_ACCOUNT"
	local f1_local3 = false
	if not Engine.GetOnlineGame() then
		f1_local2 = "@LUA_MENU_CODA_ONLINE_REQUIRED"
		f1_local3 = true
	elseif not Engine.IsCODAccountEnabled( f1_arg1.exclusiveController ) then
		f1_local2 = "@LUA_MENU_COD_ANYWHERE_UNAVAILABLE"
		f1_local3 = true
	end
	LUI.Options.AddButtonOptionVariant( f1_local1, GenericButtonSettings.Variants.Info, "@LUA_MENU_COD_ANYWHERE_CAPS", f1_local2, function ()
		return ""
	end, nil, nil, OpenCoDAnywhere, nil, nil, f1_local3 )
	LUI.Options.InitScrollingList( f1_local1.list, nil )
	LUI.Options.AddOptionTextInfo( f1_local1 )
	f1_local1:AddBackButton()
	return f1_local1
end

LUI.MenuBuilder.registerType( "cod_anywhere_options", LUI.CODAnywhereOptions.new )
LockTable( _M )
