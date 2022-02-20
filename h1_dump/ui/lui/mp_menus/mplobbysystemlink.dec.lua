local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbySystemLink = InheritFrom( LUI.MPLobbyPrivate )
LUI.MPLobbySystemLink.new = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.MPLobbyPrivate.new( f1_arg0, {
		menu_title = "@PLATFORM_SYSTEM_LINK_TITLE"
	} )
	f1_local0:setClass( LUI.MPLobbySystemLink )
	f1_local0:SetBreadCrumb( LUI.MenuTemplate.GetDefaultBreadCrumpText() )
	Engine.SetDvarBool( "xblive_privatematch", true )
	return f1_local0
end

LUI.MenuBuilder.registerType( "menu_gamesetup_systemlink", LUI.MPLobbySystemLink.new )
LUI.FlowManager.RegisterMenuStack( "menu_gamesetup_systemlink", {
	"mp_main_menu",
	"menu_systemlink"
} )
LUI.FlowManager.RegisterStackPopBehaviour( "menu_gamesetup_systemlink", LUI.MPLobbyBase.CollectGarbage )
LockTable( _M )
