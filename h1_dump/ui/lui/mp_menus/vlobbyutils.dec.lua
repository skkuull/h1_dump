VLobby = {
	ModeStack = {},
	GetMode = function ()
		local f1_local0 = Engine.GetDvarInt( "virtualLobbyMode" )
		if f1_local0 == nil then
			return VirtualLobbyModes.LUI_MODE_PRELOBBY
		else
			return f1_local0
		end
	end,
	SetMode = function ( f2_arg0 )
		Engine.SetDvarInt( "virtualLobbyMode", f2_arg0 )
	end,
	PushMode = function ( f3_arg0 )
		VLobby.ModeStack[#VLobby.ModeStack + 1] = VLobby.GetMode()
		VLobby.SetMode( f3_arg0 )
	end,
	PopMode = function ()
		if #VLobby.ModeStack == 0 then
			DebugPrint( "VLobby.PopMode called with no stack, this is definitely bad." )
			return 
		else
			local f4_local0 = VLobby.ModeStack[#VLobby.ModeStack]
			table.remove( VLobby.ModeStack )
			VLobby.SetMode( f4_local0 )
		end
	end,
	InitMenuMode = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		LUI.FlowManager.RegisterStackPushBehaviour( f5_arg0, function ()
			VLobby.PushMode( f5_arg1 )
			if f5_arg2 then
				f5_arg2()
			end
		end )
		LUI.FlowManager.RegisterStackPopBehaviour( f5_arg0, function ()
			VLobby.PopMode()
			if f5_arg3 then
				f5_arg3()
			end
		end )
	end
}
function VLobbyCharRotArea_OnMouseDown( f8_arg0 )
	if f8_arg0.popupActive then
		return 
	elseif not Engine.GetDvarBool( "virtualLobbyActive" ) then
		return 
	else
		f8_arg0.isRotating = true
	end
end

function VLobbyCharRotArea_OnMouseUp( f9_arg0 )
	f9_arg0.isRotating = false
end

function VLobbyCharRotArea_OnMouseMove( f10_arg0, f10_arg1 )
	if not f10_arg0.isRotating then
		f10_arg0.prevX = f10_arg1
		return 
	elseif f10_arg0.prevX == nil then
		f10_arg0.prevX = f10_arg1
	end
	local f10_local0 = f10_arg1 - f10_arg0.prevX
	f10_arg0.prevX = f10_arg1
	local f10_local1 = 30
	f10_local0 = LUI.clamp( f10_local0 * 60, -f10_local1, f10_local1 )
	local f10_local2 = Engine.GetDvarFloat( "ui_mouse_char_rot" )
	if not f10_local2 then
		f10_local2 = 0
	end
	Engine.SetDvarFloat( "ui_mouse_char_rot", f10_local2 + f10_local0 )
end

function VLobbyCharRotArea( f11_arg0, f11_arg1 )
	if not f11_arg1 then
		f11_arg1 = {}
	end
	local f11_local0 = CoD.DesignGridHelper( 7, 1 )
	local f11_local1 = 500
	local f11_local2 = 0
	local f11_local3 = 610
	if f11_arg1.vLobbyMode == VirtualLobbyModes.LUI_MODE_CAO then
		f11_local0 = CoD.DesignGridHelper( 16, 1 )
		f11_local1 = CoD.DesignGridHelper( 8, 1 )
	elseif f11_arg1.vLobbyMode == VirtualLobbyModes.LUI_MODE_CAC then
		f11_local2 = 80
		f11_local0 = CoD.DesignGridHelper( 13, 1 )
		f11_local1 = CoD.DesignGridHelper( 15, 1 )
	elseif f11_arg1.vLobbyMode == VirtualLobbyModes.LUI_MODE_CAC_WEAP then
		f11_local2 = 120
		f11_local0 = CoD.DesignGridHelper( 8, 1 )
		f11_local1 = CoD.DesignGridHelper( 20, 1 )
	end
	local self = LUI.UIElement.new()
	self.id = "vlobby_char_rot_area"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f11_local2,
		left = f11_local0,
		bottom = f11_local3,
		width = f11_local1
	} )
	self:animateToState( "default" )
	self:setHandleMouseButton( true )
	self:setHandleMouseMove( true )
	self:registerEventHandler( "leftmousedown", function ( element, event )
		VLobbyCharRotArea_OnMouseDown( self )
	end )
	self:registerEventHandler( "leftmouseup", function ( element, event )
		VLobbyCharRotArea_OnMouseUp( self )
	end )
	self:registerEventHandler( "mousemove", function ( element, event )
		VLobbyCharRotArea_OnMouseMove( self, event.x )
	end )
	self:registerEventHandler( "popup_active", function ( element, event )
		self.popupActive = true
	end )
	self:registerEventHandler( "popup_inactive", function ( element, event )
		self.popupActive = false
	end )
	return self
end

LUI.MenuBuilder.registerType( "VLobbyCharRotArea", VLobbyCharRotArea )
