local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnAllies( f1_arg0, f1_arg1 )
	Engine.NotifyServer( "team_select", 1 )
end

function OnAxis( f2_arg0, f2_arg1 )
	Engine.NotifyServer( "team_select", 0 )
end

function OnRandom( f3_arg0, f3_arg1 )
	if not f3_arg0.menu.hasSelectedAutoAssign then
		Engine.NotifyServer( "team_select", 2 )
		f3_arg0.menu.hasSelectedAutoAssign = true
	end
end

function OnSpectate( f4_arg0, f4_arg1 )
	Engine.NotifyServer( "team_select", 3 )
	local f4_local0 = MBh.EmitEventToRoot( "toggle_pause_off" )
	f4_local0( f4_arg0 )
	LUI.FlowManager.RequestCloseAllMenus( f4_arg0 )
end

function OnGenericStartGame( f5_arg0, f5_arg1 )
	Engine.NotifyServer( "team_select", 2 )
	local f5_local0 = MBh.EmitEventToRoot( "toggle_pause_off" )
	f5_local0( f5_arg0 )
	LUI.FlowManager.RequestCloseAllMenus( f5_arg0 )
end

LUI.MenuBuilder.registerType( "team_select_main", function ( f6_arg0, f6_arg1 )
	local f6_local0 = LUI.inGameBase.new( f6_arg0, {
		menu_title = "@LUA_MENU_CHANGE_TEAM_CAPS"
	} )
	f6_local0.hasSelectedAutoAssign = false
	local f6_local1 = Game.GetPlayerTeam()
	if GameX.gameModeIsFFA() and f6_local1 == Teams.free then
		f6_local1 = Game.GetOmnvar( "ui_team_selected" )
	end
	local f6_local2 = nil
	Engine.NotifyServer( "open_team_select_menu", -1 )
	local f6_local3 = {
		text_default_color = Colors.mw1_green
	}
	local f6_local4 = nil
	local f6_local5 = GameX.GetGameMode()
	local f6_local6 = IsSpectatorAllowed()
	if CanSwitchTeamsInThisGamemode( f6_local5 ) then
		f6_local0:AddButton( "@LUA_MENU_AUTOASSIGN", OnRandom )
		local f6_local7 = Engine.GetDvarString( "g_TeamName_Allies" )
		local f6_local8 = Engine.GetDvarString( "g_TeamName_Axis" )
		if f6_local1 == Teams.allies then
			local f6_local9 = f6_local3
		end
		f6_local4 = f6_local9 or nil
		f6_local2 = f6_local0:AddButton( f6_local7, OnAllies, nil, nil, nil, f6_local4 )
		f6_local2.listDefaultFocus = f6_local4 ~= nil
		if f6_local1 == Teams.axis then
			local f6_local10 = f6_local3
		end
		f6_local4 = f6_local10 or nil
		f6_local2 = f6_local0:AddButton( f6_local8, OnAxis, nil, nil, nil, f6_local4 )
		f6_local2.listDefaultFocus = f6_local4 ~= nil
	elseif f6_local6 then
		if Game.GetOmnvar( "ui_spectator_selected" ) ~= 1 then
			local f6_local11 = f6_local3
		end
		f6_local4 = f6_local11 or nil
		f6_local2 = f6_local0:AddButton( "@LUA_MENU_ENTER_COMBAT", OnGenericStartGame, nil, nil, nil, f6_local4 )
		f6_local2.listDefaultFocus = f6_local4 ~= nil
	end
	if f6_local6 then
		if Game.GetOmnvar( "ui_spectator_selected" ) == 1 then
			local f6_local12 = f6_local3
		end
		f6_local4 = f6_local12 or nil
		f6_local2 = f6_local0:AddButton( "@LUA_MENU_SPECTATOR", OnSpectate, nil, nil, nil, f6_local4 )
		f6_local2.listDefaultFocus = f6_local4 ~= nil
	end
	local f6_local7 = Engine.GetDvarInt( "lui_priv_lobby_team" )
	if f6_local7 == Teams.allies or f6_local7 == Teams.axis then
		Engine.SetDvarInt( "lui_priv_lobby_team", Teams.free )
		if Engine.GetSystemLink() or Engine.GetDvarBool( "xblive_privatematch" ) then
			f6_local0:setAlpha( 0 )
			if f6_local7 == Teams.allies then
				OnAllies()
			else
				OnAxis()
			end
		end
	end
	return f6_local0
end )
LockTable( _M )
