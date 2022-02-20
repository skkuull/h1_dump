DebugPrint( "Running MenuData.lua" )
MPConfig = {
	default_dvars = "exec dvar_defaults.cfg",
	default_xboxlive = "exec default_xboxlive.cfg",
	default_splitscreen = "exec default_splitscreen.cfg",
	default_systemlink = "exec default_systemlink.cfg"
}
function ConfigureResolution()
	if Engine.GetDvarBool( "hidef" ) then
		Engine.Exec( "exec default_720p.cfg" )
	else
		Engine.Exec( "exec default_480p.cfg" )
	end
end

FireTeam = {
	tactic_name = "@MPUI_FT_TACTIC_NONE"
}
WaitingForNetworkType = {
	None = 0,
	Online = 1,
	SystemLink = 2,
	Store = 3
}
function GetWaitingForNetworkType()
	return Engine.GetDvarInt( "lui_waitingfornetworktype" )
end

function SetWaitingForNetworkType( f3_arg0, f3_arg1 )
	assert( f3_arg0 ~= nil )
	Engine.SetDvarInt( "lui_waitingfornetworktype", f3_arg0 )
	if f3_arg0 ~= WaitingForNetworkType.None then
		Engine.SetDvarInt( "lui_waitingforonlinedatafetch_controller", f3_arg1 )
	end
end

function MenuHasSignedInController()
	local f4_local0 = Engine.GetMaxControllerCount()
	for f4_local1 = 0, f4_local0 - 1, 1 do
		if Engine.IsUserSignedIn( f4_local1 ) then
			return true
		end
	end
	return false
end

function MenuWaitForContent( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	if f5_arg1 then
		f5_arg0:setAlpha( 0 )
	end
	f5_arg0:registerEventHandler( "content_load_done", function ( element, event )
		if f5_arg1 then
			f5_arg0:setAlpha( 1 )
		end
		f5_arg3( event.notSignedIn )
	end )
	if f5_arg2 and not MenuHasSignedInController() then
		f5_arg0:dispatchEventToRoot( {
			name = "content_load_done",
			notSignedIn = true
		} )
		return 
	elseif Engine.Content_IsEnumerationDone() then
		f5_arg0:dispatchEventToRoot( {
			name = "content_load_done"
		} )
		return 
	else
		LUI.FlowManager.RequestAddMenu( f5_arg0, "popup_loading_content", false, false, false )
	end
end

