local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ShaderCacheDialog = InheritFrom( LUI.UIElement )
require( "LUI.mp_hud.GenericProgressBar" )
LUI.ShaderCacheDialog.Refresh = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1 = Engine.ShaderUploadFrontendGetProgress()
	f1_arg0.remainingTime:setText( Engine.MarkLocalized( string.format( "%02d", f1_local1 * 100 ) ) .. "%" )
	f1_arg0.bar:completeIn( 10000000, f1_local1 )
	if f1_local0 then
		if f1_arg0.timer then
			LUI.UITimer.Stop( f1_arg0.timer )
			f1_arg0.timer:close()
			LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
		end
		LUI.FlowManager.RequestAddMenu( f1_arg0, "ShaderCacheAllDone" )
	end
end

LUI.ShaderCacheDialog.StopCache = function ( f2_arg0, f2_arg1 )
	Engine.ShaderUploadFrontendStop()
end

LUI.ShaderCacheDialog.ContinueCache = function ( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "ShaderCacheDialog" )
end

LUI.ShaderCacheDialog.ShaderCacheConfirmation = function ( f4_arg0, f4_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@PLATFORM_SHADER_PRECACHE_WARNING" ),
		yes_action = function ()
			LUI.FlowManager.RequestAddMenu( f4_arg0, "ShaderCacheCancelling" )
		end
		,
		yes_text = Engine.Localize( "@LUA_MENU_CANCEL" ),
		no_action = LUI.ShaderCacheDialog.ContinueCache,
		no_text = Engine.Localize( "@MENU_CONTINUE" ),
		default_focus_index = 2,
		cancel_will_close = false
	} )
end

LUI.ShaderCacheDialog.ShaderCacheAllDone = function ( f6_arg0, f6_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_COMPLETE" ),
		message_text = Engine.Localize( "@PLATFORM_SHADER_PRECACHE_ALLDONE" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		cancel_will_close = false
	} )
end

LUI.ShaderCacheDialog.ShaderCacheCancelling = function ( f7_arg0, f7_arg1 )
	local f7_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_popup_message", {
		message_text = Engine.Localize( "@MENU_PLEASE_WAIT" )
	} )
	local self = LUI.UITimer.new( 1000, "check_dialog_removal" )
	f7_local0:addElement( self )
	f7_local0:registerEventHandler( "check_dialog_removal", function ( element, event )
		if Engine.ShaderUploadFrontendGetStopComplete() then
			LUI.UITimer.Stop( self )
			LUI.FlowManager.RequestLeaveMenu( element )
		end
	end )
	LUI.ShaderCacheDialog.StopCache()
	return f7_local0
end

LUI.ShaderCacheDialog.OnCancel = function ( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestAddMenu( f9_arg0, "ShaderCacheConfirmation" )
end

f0_local0 = function ( f10_arg0, f10_arg1, f10_arg2 )
	if not f10_arg0.buttonCount then
		f10_arg0.buttonCount = 0
	end
	LUI.MenuBuilder.BuildAddChild( f10_arg0, {
		type = "UIGenericButton",
		id = "popup_button_" .. f10_arg0.buttonCount,
		properties = {
			button_text = Engine.Localize( f10_arg1 ),
			text_align_without_content = LUI.Alignment.Center,
			button_action_func = f10_arg2
		}
	} )
	f10_arg0.buttonCount = f10_arg0.buttonCount + 1
end

LUI.ShaderCacheDialog.OnShaderCacheChoiceResume = function ( f11_arg0, f11_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f11_arg0 )
	if not Engine.ShaderUploadFrontendRequestRestart() then
		LUI.FlowManager.RequestAddMenu( f11_arg0, "ShaderCacheAllDone" )
	end
end

LUI.ShaderCacheDialog.OnShaderCacheChoiceRestart = function ( f12_arg0, f12_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
	Engine.ShaderUploadFrontendForceRestart()
end

LUI.ShaderCacheDialog.OnShaderCacheChoiceCancel = function ( f13_arg0, f13_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f13_arg0 )
end

LUI.ShaderCacheDialog.ShaderCacheChoiceDialog = function ()
	local f14_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_title = Engine.Localize( "@PLATFORM_SHADER_PRECACHE_QUESTION_TITLE" )
	} )
	local f14_local1 = f14_local0:getFirstDescendentById( "generic_selectionList_content_id" )
	local f14_local2 = CoD.TextSettings.Font21
	local f14_local3 = CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f14_local3.height = f14_local2.Height
	f14_local3.font = f14_local2.Font
	f14_local3.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f14_local3.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f14_local3 )
	self:setText( Engine.LocalizeLong( "@PLATFORM_SHADER_PRECACHE_QUESTION" ) )
	f14_local1:addElement( self )
	f14_local1:addElement( LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 16, CoD.AnchorTypes.TopLeft ) ) )
	f0_local0( f14_local1, "@PLATFORM_SHADER_PRECACHE_RESUME", LUI.ShaderCacheDialog.OnShaderCacheChoiceResume )
	f0_local0( f14_local1, "@PLATFORM_SHADER_PRECACHE_RESTART", LUI.ShaderCacheDialog.OnShaderCacheChoiceRestart )
	f0_local0( f14_local1, "@LUA_MENU_CANCEL", LUI.ShaderCacheDialog.OnShaderCacheChoiceCancel )
	return f14_local0
end

LUI.ShaderCacheDialog.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:registerEventHandler( "ShaderCacheDialogProgress", LUI.ShaderCacheDialog.Refresh )
	local f15_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@PLATFORM_SHADER_PRECACHE_DESC" ),
		button_text = Engine.Localize( "@LUA_MENU_CANCEL" ),
		confirmation_action = LUI.ShaderCacheDialog.OnCancel,
		cancel_will_close = false
	} )
	self:addElement( f15_local1 )
	local f15_local2 = f15_local1:getFirstDescendentById( "generic_selectionList_content_id" )
	local f15_local3 = f15_local2:getFirstDescendentById( "exit_button_id" )
	local f15_local4 = CoD.TextSettings.Font21
	local f15_local5 = 120
	local f15_local6 = CoD.CreateState( 0, f15_local5, 0, f15_local5 + f15_local4.Height, CoD.AnchorTypes.TopLeftRight )
	f15_local6.font = f15_local4.Font
	local self = LUI.UIText.new( f15_local6 )
	self:addElementBefore( f15_local3 )
	self.remainingTime = self
	local f15_local8 = LUI.MenuBuilder.BuildRegisteredType( "progressBar" )
	f15_local8:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 50,
		height = 40
	} )
	f15_local8:animateToState( "default" )
	f15_local8:addElementBefore( f15_local3 )
	self.bar = f15_local8
	local self = LUI.UITimer.new( 250, "ShaderCacheDialogProgress" )
	self.timer = self
	self:addElement( self )
	Engine.ShaderUploadFrontendStart()
	return self
end

LUI.MenuBuilder.registerPopupType( "ShaderCacheChoiceDialog", LUI.ShaderCacheDialog.ShaderCacheChoiceDialog )
LUI.MenuBuilder.registerPopupType( "ShaderCacheDialog", LUI.ShaderCacheDialog.new )
LUI.MenuBuilder.registerPopupType( "ShaderCacheConfirmation", LUI.ShaderCacheDialog.ShaderCacheConfirmation )
LUI.MenuBuilder.registerPopupType( "ShaderCacheAllDone", LUI.ShaderCacheDialog.ShaderCacheAllDone )
LUI.MenuBuilder.registerPopupType( "ShaderCacheCancelling", LUI.ShaderCacheDialog.ShaderCacheCancelling )
LockTable( _M )
