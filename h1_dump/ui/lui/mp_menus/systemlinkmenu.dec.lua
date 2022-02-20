local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbySystemLinkStaging = InheritFrom( LUI.MPLobbyBase )
function OnJoinGame( f1_arg0, f1_arg1 )
	if Engine.IsConsoleGame() then
		if Engine.OfflineProfileCanSave( f1_arg1.controller ) then
			if Engine.IsPS3() and not Engine.OfflineProfileIsSelected( f1_arg1.controller ) then
				LUI.FlowManager.RequestAddMenu( f1_arg0, "no_profile_ps3_error_systemlink", true, f1_arg1.controller, false, {
					nextmenu = "menu_systemlink_join"
				} )
			else
				LUI.FlowManager.RequestAddMenu( f1_arg0, "menu_systemlink_join", true, f1_arg1.controller, false )
			end
		else
			LUI.FlowManager.RequestAddMenu( f1_arg0, "savegame_error_systemlink", true, f1_arg1.controller, false, {
				nextmenu = "menu_systemlink_join"
			} )
		end
	end
end

function OnCreateGame( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.OfflineProfileCanSave( f2_arg1.controller )
	if Lobby.UsingSystemLinkParty() then
		Engine.ExecNow( "xstartlobby", Engine.GetFirstActiveController() )
	end
	if f2_local0 then
		if Engine.IsPS3() and not Engine.OfflineProfileIsSelected( f2_arg1.controller ) then
			LUI.FlowManager.RequestAddMenu( f2_arg0, "no_profile_ps3_error_systemlink", true, f2_arg1.controller, false, {
				nextmenu = "menu_gamesetup_systemlink"
			} )
		else
			LUI.FlowManager.RequestAddMenu( f2_arg0, "menu_gamesetup_systemlink", false, f2_arg1.controller, false, {} )
		end
	else
		LUI.FlowManager.RequestAddMenu( f2_arg0, "savegame_error_systemlink", true, f2_arg1.controller, false, {
			nextmenu = "menu_gamesetup_systemlink"
		} )
	end
end

function OnBack( f3_arg0, f3_arg1 )
	if Engine.IsCoreMode() and not Engine.GetDvarBool( "virtualLobbyReady" ) and Engine.GetDvarBool( "virtualLobbyEnabled" ) then
		return 
	else
		clearMatchData()
		Engine.SetSystemLink( false )
		Engine.SetSplitScreen( false )
		Engine.Exec( "forcesplitscreencontrol systemLinkExit" )
		LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
		local f3_local0 = Engine.GetFirstActiveController()
		Engine.ExecNow( "xstopprivateparty", f3_local0 )
		Cac.NotifyVirtualLobby( "leave_lobby", Engine.GetXUIDByController( f3_local0 ) )
		Engine.ExecNow( "clearcontrollermap" )
	end
end

function menu_systemlink( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.MPLobbyBase.new( f4_arg0, {
		menu_title = "@PLATFORM_SYSTEM_LINK_TITLE",
		memberListState = Lobby.MemberListStates.Prelobby
	} )
	f4_local0:setClass( LUI.MPLobbySystemLinkStaging )
	local f4_local1 = f4_arg1.exclusiveController
	if not f4_local1 then
		f4_local1 = Engine.GetFirstActiveController()
	end
	Cac.SetSelectedControllerIndex( f4_local1 )
	local f4_local2 = f4_local0:AddButton( "@MENU_JOIN_GAME", OnJoinGame, IsStreamingInstall )
	f4_local2:setDisabledRefreshRate( 1000 )
	f4_local0:AddButton( "@MENU_CREATE_GAME", OnCreateGame )
	f4_local0:AddOptionsButton( false )
	if Engine.IsCoreMode() then
		LUI.MPLobbyBase.AddCACButton( f4_local0, true )
		f4_local0:AddPersonalizationButton()
	end
	LUI.MPLobbyBase.AddLobbyBackButton( f4_local0, OnBack )
	if Lobby.UsingSystemLinkParty() then
		Engine.SetDvarBool( "xblive_privatematch", true )
	else
		Engine.SetDvarBool( "xblive_privatematch", false )
	end
	Engine.Exec( "xstartlocalprivateparty" )
	f4_local0.isSignInMenu = true
	f4_local0:addElement( LUI.LANWarningWidget.new() )
	return f4_local0
end

LUI.MenuBuilder.registerType( "menu_systemlink", menu_systemlink )
LUI.FlowManager.RegisterMenuStack( "menu_systemlink", {
	"mp_main_menu"
} )
VLobby.InitMenuMode( "menu_systemlink", VirtualLobbyModes.LUI_MODE_LOBBY )
LockTable( _M )
