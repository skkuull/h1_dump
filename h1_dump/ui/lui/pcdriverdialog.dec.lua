local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.PCDriverDialog = {}
LUI.PCDriverDialog.OnContinuePastWarning = function ()
	if Engine.IsMultiplayer() and Engine.ShaderUploadFrontendShouldShowDialog() then
		LUI.FlowManager.RequestAddMenu( self, "ShaderCacheDialog" )
	end
end

LUI.PCDriverDialog.OnGoBackToDriverDialog = function ()
	LUI.FlowManager.RequestAddMenu( self, "PCDriverDialog" )
end

LUI.PCDriverDialog.PCDriverDialogWarning = function ()
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@PLATFORM_UI_WARNING_CAPS" ),
		message_text = Engine.Localize( "@PLATFORM_UI_DISPLAY_DRIVER_UPDATE_MESSAGE_WARNING" ),
		yes_action = LUI.PCDriverDialog.OnContinuePastWarning,
		no_action = LUI.PCDriverDialog.OnGoBackToDriverDialog,
		default_focus_index = 2,
		cancel_will_close = false
	} )
end

LUI.PCDriverDialog.new = function ()
	local f4_local0 = nil
	if Engine.GetDvarBool( "r_amdGPU" ) == true then
		f4_local0 = Engine.Localize( "@PLATFORM_UI_DISPLAY_DRIVER_UPDATE_MESSAGE_AMD", Engine.GetDvarString( "r_amdMinRadeonSoftwareRevReqString" ) )
	elseif Engine.GetDvarBool( "r_nvidiaGPU" ) == true then
		f4_local0 = Engine.Localize( "@PLATFORM_UI_DISPLAY_DRIVER_UPDATE_MESSAGE_NVIDIA", Engine.GetDvarString( "r_nvidiaMinDriverRevReqString" ) )
	end
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@PLATFORM_UI_DISPLAY_DRIVER_UPDATE_TITLE_CAPS" ),
		message_text = f4_local0,
		yes_action = function ()
			LUI.FlowManager.RequestAddMenu( self, "PCDriverDialogWarning" )
		end
		,
		yes_text = Engine.Localize( "@MENU_CONTINUE" ),
		no_action = Engine.Quit,
		no_text = Engine.Localize( "@PLATFORM_UI_EXIT_GAME_CAPS" ),
		default_focus_index = 2,
		cancel_will_close = false
	} )
end

LUI.MenuBuilder.registerPopupType( "PCDriverDialog", LUI.PCDriverDialog.new )
LUI.MenuBuilder.registerPopupType( "PCDriverDialogWarning", LUI.PCDriverDialog.PCDriverDialogWarning )
LockTable( _M )
