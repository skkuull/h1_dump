local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function statsresetaction( f1_arg0, f1_arg1 )
	f1_arg0:dispatchEventToRoot( {
		name = "prestige_shop_reset_all_stats",
		controller = f1_arg1.controller
	} )
end

function statsreset3( f2_arg0, f2_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_PRESTIGE_RESET_WARNING3" ),
		popup_title = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE3" ),
		yes_action = statsresetaction,
		yes_text = Engine.Localize( "@MPUI_PRESTIGE_RESET_STATS" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function statsreset2( f3_arg0, f3_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_RESET_STATS_WARNING2" ),
		popup_title = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE2" ),
		yes_action = MBh.OpenMenu( "stats_reset3", true ),
		yes_text = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE3" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function statsreset( f4_arg0, f4_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_RESET_STATS_WARNING1" ),
		popup_title = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE1" ),
		yes_action = MBh.OpenMenu( "stats_reset2", true ),
		yes_text = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE2" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

LUI.MenuBuilder.registerPopupType( "stats_reset", statsreset )
LUI.MenuBuilder.registerPopupType( "stats_reset2", statsreset2 )
LUI.MenuBuilder.registerPopupType( "stats_reset3", statsreset3 )
LockTable( _M )
