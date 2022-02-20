local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
	Lobby.SetFiringRangeController( Cac.GetSelectedControllerIndex() )
end

function FiringRange()
	Cac.SetVirtualLobbyLoadout( Cac.GetSelectedControllerIndex() )
	Engine.SetDvarBool( "virtualLobbyInFiringRange", true )
	Engine.SetLuiInUse( false )
	local self = LUI.UIElement.new()
	self:registerEventHandler( "toggle_pause", f0_local0 )
	self:registerEventHandler( "menu_close", function ( element, event )
		PersistentBackground.FadeFromBlackSlow()
		Engine.SetLuiInUse( true )
		Engine.SetDvarBool( "virtualLobbyInFiringRange", false )
	end )
	self:registerEventHandler( "closeallmenus", function ( element, event )
		PersistentBackground.FadeFromBlackSlow()
		Lobby.SetFiringRangeController( Cac.GetSelectedControllerIndex() )
		Engine.SetLuiInUse( true )
		Engine.SetDvarBool( "virtualLobbyInFiringRange", false )
	end )
	self:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
		Engine.SetLuiInUse( false )
	end )
	local f2_local1 = Engine.GetLuiRoot()
	local f2_local2 = f2_local1:getChildById( "mouse_cursor" )
	if f2_local2 then
		f2_local2:hide()
	end
	return self
end

LUI.MenuBuilder.registerType( "FiringRange", FiringRange )
LockTable( _M )
