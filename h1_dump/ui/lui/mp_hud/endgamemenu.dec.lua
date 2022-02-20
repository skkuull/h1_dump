local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:setText( f2_arg1.message_text )
	f2_arg0:dispatchEventToRoot( {
		name = "resize_popup"
	} )
end

f0_local2 = function ( f3_arg0 )
	Engine.ExecFirstClient( "xpartybackout" )
	Engine.ExecFirstClient( "disconnect" )
end

local f0_local3 = function ( f4_arg0 )
	if Engine.GetDvarBool( "squad_match" ) then
		Engine.ExecFirstClient( "disconnect" )
	else
		Engine.ExecFirstClient( "xpartydisbandafterround" )
		Engine.ExecFirstClient( "hostmigration_start_backout" )
	end
end

local f0_local4 = function ( f5_arg0 )
	return Engine.GetOnlineGame()
end

local f0_local5 = function ( f6_arg0 )
	if f0_local4( f6_arg0 ) then
		Engine.ExecFirstClient( "xstopprivateparty" )
		Engine.ExecFirstClient( "disconnect" )
		Engine.ExecFirstClient( "xblive_privatematch 0" )
		Engine.ExecFirstClient( "onlinegame 1" )
		Engine.ExecFirstClient( "xstartprivateparty" )
	else
		Engine.ExecFirstClient( "disconnect" )
	end
end

local f0_local6 = function ( f7_arg0 )
	local f7_local0 = Engine.GetDvarBool( "squad_match" )
	Engine.ExecFirstClient( "xstopprivateparty" )
	Engine.ExecFirstClient( "xpartydisbandafterround" )
	if f7_local0 then
		Engine.ExecFirstClient( "disconnect" )
		Engine.ExecFirstClient( "xblive_privatematch 0" )
		Engine.ExecFirstClient( "onlinegame 1" )
		Engine.ExecFirstClient( "xstartprivateparty" )
	else
		Engine.ExecFirstClient( "hostmigration_start" )
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.GetDvarBool( "sv_running" )
	Game.HandleLeavePauseMenu()
	if f8_local0 then
		Engine.NotifyServer( "end_game", 1 )
	else
		f0_local5( f8_arg0 )
	end
	LUI.FlowManager.RequestCloseAllMenus( f8_arg0 )
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f9_arg0 )
	Game.HandleLeavePauseMenu()
	Engine.Exec( "onPlayerQuit" )
	local f9_local0 = Engine.GetDvarBool( "sv_running" )
	if Engine.GetDvarBool( "squad_match" ) then
		Squad.PostMatch( 0, 0, 0, 0, true )
	end
	if f9_local0 then
		f0_local3( f9_arg0 )
	else
		f0_local2( f9_arg0 )
	end
	LUI.FlowManager.RequestCloseAllMenus( f9_arg0 )
end

local f0_local9 = function ( f10_arg0, f10_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
	Game.HandleLeavePauseMenu()
	Engine.Exec( "onPlayerQuit" )
	local f10_local0 = Engine.GetDvarBool( "sv_running" )
	if Engine.GetDvarBool( "squad_match" ) then
		Squad.PostMatch( 0, 0, 0, 0, true )
	end
	if f10_local0 then
		f0_local6( f10_arg0 )
	else
		f0_local5( f10_arg0 )
	end
	LUI.FlowManager.RequestCloseAllMenus( f10_arg0 )
end

local f0_local10 = function ( f11_arg0 )
	local f11_local0 = Lobby.IsInPrivateParty()
	if f11_local0 then
		f11_local0 = Lobby.IsPrivatePartyHost()
		if f11_local0 then
			f11_local0 = not Lobby.IsAloneInPrivateParty()
		end
	end
	return f11_local0
end

local f0_local11 = function ( f12_arg0, f12_arg1 )
	if f0_local10( f12_arg0 ) then
		LUI.FlowManager.RequestLeaveMenu( f12_arg0, true )
		LUI.FlowManager.RequestAddMenu( f12_arg0, "popup_pull_party", false )
	else
		Game.HandleLeavePauseMenu()
		Engine.Exec( "onPlayerQuit" )
		local f12_local0 = Engine.GetDvarBool( "sv_running" )
		if Engine.GetDvarBool( "squad_match" ) then
			Squad.PostMatch( 0, 0, 0, 0, true )
		end
		if f12_local0 then
			f0_local6( f12_arg0 )
		else
			f0_local5( f12_arg0 )
		end
		LUI.FlowManager.RequestCloseAllMenus( f12_arg0 )
	end
end

local f0_local12 = function ()
	local self = LUI.UIElement.new()
	self.id = "end_game_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	local f13_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text_alignment = LUI.Alignment.Left,
		message_text = Engine.Localize( "@LUA_MENU_END_GAME_DESC" ),
		popup_title = Engine.Localize( "@LUA_MENU_LEAVE_GAME_TITLE" ),
		padding_top = 12,
		yes_action = f0_local7
	} )
	f13_local1.id = "privateGame_options_list_id"
	self:addElement( f13_local1 )
	local self = LUI.UIBindButton.new()
	self.id = "endBackToGameStartButton"
	self:registerEventHandler( "button_start", f0_local0 )
	self:addElement( self )
	return self
end

local f0_local13 = function ()
	local self = LUI.UIElement.new()
	self.id = "leave_game_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	local f14_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text_alignment = LUI.Alignment.Left,
		message_text = Engine.Localize( "@LUA_MENU_LEAVE_GAME_DESC" ),
		popup_title = Engine.Localize( "@LUA_MENU_LEAVE_GAME_TITLE" ),
		padding_top = 12,
		yes_action = f0_local11
	} )
	f14_local1.id = "publicGame_options_list_id"
	self:addElement( f14_local1 )
	local self = LUI.UIBindButton.new()
	self.id = "leaveBackToGameStartButton"
	self:registerEventHandler( "button_start", f0_local0 )
	self:addElement( self )
	return self
end

local f0_local14 = function ()
	local self = LUI.UIElement.new()
	self.id = "pull_party_out_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	local f15_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text_alignment = LUI.Alignment.Left,
		message_text = Engine.Localize( "@LUA_MENU_PULL_PARTY_DESC" ),
		popup_title = Engine.Localize( "@LUA_MENU_LEAVE_GAME_TITLE" ),
		padding_top = 12,
		yes_action = f0_local8,
		no_action = f0_local9,
		cancel_means_no = false
	} )
	f15_local1.id = "party_pullout_list_id"
	self:addElement( f15_local1 )
	local self = LUI.UIBindButton.new()
	self.id = "leavePullPartyButton"
	self:registerEventHandler( "button_start", f0_local0 )
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerPopupType( "popup_end_game", f0_local12 )
LUI.MenuBuilder.registerPopupType( "popup_leave_game", f0_local13 )
LUI.MenuBuilder.registerPopupType( "popup_pull_party", f0_local14 )
LockTable( _M )
