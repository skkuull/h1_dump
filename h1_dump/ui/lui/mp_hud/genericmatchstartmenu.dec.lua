local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OnStartGame( f1_arg0, f1_arg1 )
	Engine.NotifyServer( "class_select", 0 )
	local f1_local0 = MBh.EmitEventToRoot( "toggle_pause_off" )
	f1_local0( f1_arg0 )
	LUI.FlowManager.RequestCloseAllMenus( f1_arg0 )
end

function OnSpectate( f2_arg0, f2_arg1 )
	Engine.NotifyServer( "team_select", 3 )
	local f2_local0 = MBh.EmitEventToRoot( "toggle_pause_off" )
	f2_local0( f2_arg0 )
	LUI.FlowManager.RequestCloseAllMenus( f2_arg0 )
end

f0_local0 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetOnlineGame()
	if f3_local0 then
		f3_local0 = not Engine.GetDvarBool( "xblive_privatematch" )
	end
	local f3_local1 = Engine.GetDvarBool( "sv_running" )
	if f3_local0 then
		LUI.FlowManager.RequestAddMenu( f3_arg0, "popup_leave_game", true, f3_arg1.controller )
	else
		LUI.FlowManager.RequestAddMenu( f3_arg0, "popup_end_game", true, f3_arg1.controller )
	end
end

function generic_match_start_main( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.inGameBase.new( f4_arg0, {
		menu_title = Engine.Localize( "@LUA_MENU_PAUSE_CAPS" ),
		disableBack = true
	} )
	f4_local0:AddButton( Engine.Localize( "@LUA_MENU_ENTER_COMBAT" ), OnStartGame )
	local f4_local1, f4_local2 = nil
	local f4_local3 = IsSpectatorAllowed()
	if f4_local3 then
		f4_local3 = not NeverAllowChangeTeams()
	end
	if f4_local3 then
		if Game.GetOmnvar( "ui_spectator_selected" ) == 1 then
			local f4_local4 = highlightButton
		end
		f4_local1 = f4_local4 or nil
		f4_local2 = f4_local0:AddButton( "@LUA_MENU_SPECTATOR", OnSpectate, nil, nil, nil, f4_local1 )
		f4_local2.listDefaultFocus = f4_local1 ~= nil
	end
	local f4_local5 = f4_local0:AddButton( "@LUA_MENU_END_GAME", f0_local0 )
	f4_local5:clearActionSFX()
	return f4_local0
end

LUI.MenuBuilder.registerType( "generic_match_start_main", generic_match_start_main )
LockTable( _M )
