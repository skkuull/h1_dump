local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnChooseClass( f1_arg0, f1_arg1 )
	if CanChooseClass() == true then
		LUI.FlowManager.RequestAddMenu( f1_arg0, "class_select_main", true, f1_arg1.controller )
	else
		LUI.FlowManager.RequestCloseAllMenus( f1_arg0 )
	end
end

function OnChangeTeam( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestAddMenu( f2_arg0, "team_select_main", true, f2_arg1.controller )
end

f0_local0 = function ( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "MutePlayers", true, f3_arg1.controller )
end

f0_local1 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Engine.GetOnlineGame()
	if f4_local0 then
		f4_local0 = not Engine.GetDvarBool( "xblive_privatematch" )
	end
	local f4_local1 = Engine.GetDvarBool( "sv_running" )
	if f4_local0 then
		LUI.FlowManager.RequestAddMenu( f4_arg0, "popup_leave_game", true, f4_arg1.controller )
	else
		LUI.FlowManager.RequestAddMenu( f4_arg0, "popup_end_game", true, f4_arg1.controller )
	end
end

function CanChooseClass()
	local f5_local0 = GameX.GetGameMode()
	local f5_local1
	if Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f5_local0, GameTypesTable.Cols.ClassChoice ) ~= "1" or Engine.GetDvarBool( "g_oldschool" ) ~= false then
		f5_local1 = false
	else
		f5_local1 = true
	end
	local f5_local2 = CanSwitchTeamsInThisGamemode( f5_local0 )
	local f5_local3 = GameX.IsRankedMatch()
	local f5_local4 = Game.GetPlayerTeam()
	if not f5_local1 or MLG.IsMLGSpectator() then
		return false
	elseif f5_local3 == true then
		return true
	elseif f5_local3 == false then
		if f5_local2 == true and (f5_local4 == Teams.allies or f5_local4 == Teams.axis) then
			return true
		elseif GameX.gameModeIsFFA() and f5_local1 == true then
			return true
		end
	end
	return false
end

function LeaveThisMenu( f6_arg0, f6_arg1 )
	f6_arg0:dispatchEventToRoot( {
		name = "toggle_pause_off"
	} )
	LUI.FlowManager.RequestCloseAllMenus( f6_arg0 )
	Game.HandleLeavePauseMenu()
	Engine.PlaySound( CoD.SFX.PauseMenuResume )
end

f0_local2 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = false
	if GameX.IsRankedMatch() then
		f7_local0 = Game.GetOmnvar( "ui_options_menu" ) > 0
	else
		local f7_local1 = GetPrivateMatchSpectateAllowedLevel()
		if f7_local1 == 0 then
			f7_local0 = Game.GetOmnvar( "ui_options_menu" ) > 0
		elseif f7_local1 == 1 and not GameX.gameModeIsFFA() then
			f7_local0 = Game.GetOmnvar( "ui_options_menu" ) == 1
		end
	end
	local f7_local1 = GameX.IsSplitscreen()
	local f7_local2 = LUI.inGameBase.new( f7_arg0, {
		menu_title = "@LUA_MENU_PAUSE_CAPS",
		disableBack = f7_local0
	} )
	local f7_local3 = nil
	if CanChooseClass() then
		f7_local3 = f7_local2:AddButton( "@LUA_MENU_CHOOSE_CLASS", OnChooseClass )
		f7_local3:rename( f7_arg0.type .. "_choose_class" )
	end
	if CanShowChangeTeamMenuOption() and not Game.GetOmnvar( "ui_disable_team_change" ) then
		f7_local3 = f7_local2:AddButton( "@LUA_MENU_CHANGE_TEAM", OnChangeTeam )
		f7_local3:rename( f7_arg0.type .. "_change_team" )
	end
	local f7_local4 = Engine.GetLuiRoot()
	if f7_local4 then
		local f7_local5 = f7_local4.m_controllerIndex
		if f7_local5 and Engine.GetPlayerData( f7_local5, CoD.StatsGroup.Common, "agentpw" ) ~= "" then
			f7_local3 = f7_local2:AddButton( "AGENT SPECTATE", OnAgentSpectate )
		end
	end
	local f7_local5 = f7_local2:AddOptionsButton( true )
	if f7_local1 then
		f7_local5.disabledFunc = GameX.IsOptionStateLocked
		f7_local5:setDisabledRefreshRate( 100 )
	end
	if not Engine.IsAliensMode() or not Game.GetOmnvar( "ui_alien_hive_score_is_solo" ) then
		f7_local2:AddButton( "@LUA_MENU_MUTE_PLAYERS", f0_local0 )
	end
	if not f7_local0 then
		local self = LUI.UIBindButton.new()
		self.id = "inGameButtonBinds"
		self:registerEventHandler( "button_start", LeaveThisMenu )
		self:registerEventHandler( "button_select", LeaveThisMenu )
		f7_local2:addElement( self )
		f7_local2:AddBackButton( LeaveThisMenu )
	end
	local self = f7_local2:AddButton( "@LUA_MENU_END_GAME", f0_local1 )
	self:clearActionSFX()
	return f7_local2
end

function OnAgentSpectate( f8_arg0, f8_arg1 )
	Engine.Exec( "pa " .. Engine.GetPlayerData( 0, CoD.StatsGroup.Common, "agentpw" ) )
	Engine.NotifyServer( "team_select", 3 )
end

LUI.MenuBuilder.registerType( "mp_pause_menu", f0_local2 )
LockTable( _M )
