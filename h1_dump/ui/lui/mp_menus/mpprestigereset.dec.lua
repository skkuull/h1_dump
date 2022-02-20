local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function prestigeresetaction( f1_arg0, f1_arg1 )
	Engine.PlaySound( "h1_ui_prestige" )
	Lobby.ExecPrestigeReset( f1_arg1.controller )
	AAR.ClearAAR()
	LUI.ComScore.LogPrestige( f1_arg1.controller )
	LUI.FlowManager.RequestAddMenu( f1_arg0, "PrestigeFanfare", true, f1_arg1.controller, true )
end

function prestigereset3( f2_arg0, f2_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_PRESTIGE_RESET_WARNING3" ),
		popup_title = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE3" ),
		yes_action = prestigeresetaction,
		yes_text = Engine.Localize( "@MENU_PRESTIGE_ENTER" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function prestigereset2( f3_arg0, f3_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_PRESTIGE_RESET_WARNING2" ),
		popup_title = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE2" ),
		yes_action = MBh.OpenMenu( "prestige_reset3", true ),
		yes_text = Engine.Localize( "@MENU_OK" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function prestigereset( f4_arg0, f4_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.Localize( "@MENU_PRESTIGE_RESET_WARNING1" ),
		popup_title = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE1" ),
		yes_action = MBh.OpenMenu( "prestige_reset2", true ),
		yes_text = Engine.Localize( "@MENU_PRESTIGE_RESET_TITLE2" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

LUI.MenuBuilder.registerPopupType( "prestige_reset", prestigereset )
LUI.MenuBuilder.registerPopupType( "prestige_reset2", prestigereset2 )
LUI.MenuBuilder.registerPopupType( "prestige_reset3", prestigereset3 )
LockTable( _M )
