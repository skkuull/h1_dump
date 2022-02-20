local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnMainAttract( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestAddMenu( f1_arg0, "main_attract", true, f1_arg1.controller, true )
end

function FadeOutForAttract( f2_arg0, f2_arg1 )
	f2_arg0:dispatchEventToChildren( {
		name = "fadeToBlack"
	} )
	local self = LUI.UITimer.new( 750, "OnMainAttract" )
	self.id = "LockoutFadeOutTimer"
	f2_arg0:addElement( self )
	f2_arg0:registerEventHandler( "OnMainAttract", OnMainAttract )
	Engine.StopMusic( 2000 )
end

function SkipToMenu( f3_arg0 )
	local f3_local0 = Engine.GetDvarString( "ui_loadMenuName" )
	if f3_local0 == nil or f3_local0 == "" then
		return false
	end
	Engine.SetDvarString( "ui_loadMenuName", "" )
	local f3_local1 = LUI.StringSplit( f3_local0, "/" )
	local f3_local2 = f3_local1[#f3_local1]
	table.remove( f3_local1, #f3_local1 )
	if #f3_local1 == 0 then
		LUI.FlowManager.RequestAddMenu( self, f3_local2, true, f3_arg0, true )
	else
		local f3_local3 = {}
		for f3_local4 = 1, #f3_local1, 1 do
			f3_local3[f3_local4] = {
				name = f3_local1[f3_local4]
			}
		end
		LUI.FlowManager.RequestAddMenuAndSetStack( self, f3_local2, true, f3_arg0, true, nil, f3_local3 )
	end
	return true
end

function GoToMainMenu( f4_arg0 )
	Engine.SetDvarBool( "ui_skipMainLockout", false )
	if Engine.GetDvarBool( "limited_mode" ) then
		LUI.FlowManager.RequestAddMenu( self, "main_campaign", true, f4_arg0, false )
		return 
	else
		LUI.FlowManager.RequestAddMenu( self, "main_menu", true, f4_arg0, false )
	end
end

function OnStartWaitForAttract( f5_arg0 )
	if not Engine.GetDvarBool( "limited_mode" ) then
		if not f5_arg0.lockoutAttractTimer then
			f5_arg0.lockoutAttractTimer = LUI.UITimer.new( 30000, "FadeOutForAttract" )
			f5_arg0.lockoutAttractTimer.id = "LockoutAttractTimer"
			f5_arg0:addElement( f5_arg0.lockoutAttractTimer )
			f5_arg0:registerEventHandler( "FadeOutForAttract", FadeOutForAttract )
		else
			LUI.UITimer.Reset( f5_arg0.lockoutAttractTimer )
			LUI.UITimer.Enable( f5_arg0.lockoutAttractTimer )
		end
	end
end

function OnStopWaitForAttract( f6_arg0 )
	if f6_arg0.lockoutAttractTimer then
		LUI.UITimer.Disable( f6_arg0.lockoutAttractTimer )
	end
end

function CheckLanguage( f7_arg0 )
	if Engine.ShouldPromptForLanguage() then
		LUI.FlowManager.RequestAddMenu( nil, "choose_language_popup", false, f7_arg0, false, {
			callback = function ()
				LoginNextStep( f7_arg0 )
			end
		} )
	else
		LoginNextStep( f7_arg0 )
	end
end

function CheckDCache( f9_arg0 )
	if DCache.IsStartupDisabled() then
		LUI.FlowManager.RequestAddMenu( nil, "request_yesno_popup_generic", true, f9_arg0, nil, {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			yes_action = function ()
				DCache.ClearDCache( 1 )
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			no_action = function ()
				DCache.ClearStartupCount()
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			message_text = Engine.Localize( "@LUA_MENU_DCACHE_CLEAR_REQUEST" )
		} )
	else
		LoginNextStep( f9_arg0 )
	end
end

function CheckEULA( f12_arg0 )
	if Engine.HasAcceptedEULA( f12_arg0 ) then
		LoginNextStep( f12_arg0 )
	else
		LUI.FlowManager.RequestAddMenu( nil, "EULA", true, f12_arg0, false, {
			callback = function ()
				LoginNextStep( f12_arg0 )
			end
		} )
	end
end

function CheckBrightness( f14_arg0 )
	if Engine.IsProfileSignedIn( f14_arg0 ) then
		if Engine.GetProfileData( "hasEverPlayed_MainMenu", f14_arg0 ) or Engine.GetDvarBool( "limited_mode" ) then
			LoginNextStep( f14_arg0 )
		else
			LUI.FlowManager.RequestAddMenu( nil, "boot_brightness", true, f14_arg0, false, {} )
		end
	else
		LUI.FlowManager.RequestAddMenu( nil, "no_profile_warning_popmenu", false, f14_arg0, false, {} )
	end
end

function ResolveSignIn( f15_arg0 )
	if Engine.IsProfileSignedIn( f15_arg0 ) == false then
		LUI.FlowManager.RequestAddMenu( nil, "no_profile_force_popmenu", false, f15_arg0, false, {} )
	else
		LoginNextStep( f15_arg0 )
	end
end

function CheckSignedIn( f16_arg0 )
	Engine.ExecNow( "forcenosplitscreencontrol main_lockout_START", f16_arg0 )
	Engine.ExecNow( "resetViewport" )
	if Engine.IsPS4() and Engine.NeedToDeleteSaveData( f16_arg0 ) then
		LUI.FlowManager.RequestAddMenu( self, "error_corrupt_savedata", false, f16_arg0, true, {} )
		return 
	elseif (Engine.IsXB3() or Engine.IsPCApp()) and Engine.IsProfileSignedIn( f16_arg0 ) == false then
		Engine.ExecWithResolve( "xsignin", ResolveSignIn, f16_arg0 )
	else
		LoginNextStep( f16_arg0 )
	end
end

f0_local0 = 0
f0_local1 = {
	[#f0_local1 + 1] = CheckLanguage,
	[#f0_local1 + 1] = CheckDCache,
	[#f0_local1 + 1] = CheckSignedIn,
	[#f0_local1 + 1] = CheckEULA,
	[#f0_local1 + 1] = CheckBrightness,
	[#f0_local1 + 1] = GoToMainMenu
}
function LoginNextStep( f17_arg0 )
	assert( f17_arg0 ~= nil )
	if f0_local0 < #f0_local1 then
		f0_local0 = f0_local0 + 1
	end
	local f17_local0 = f0_local1[f0_local0]
	if f17_local0 ~= nil then
		f17_local0( f17_arg0 )
	end
end

function OnLockoutButton( f18_arg0, f18_arg1 )
	if not f18_arg0.m_inputDisabled then
		Engine.PlaySound( CoD.SFX.MenuAccept )
		f0_local0 = 0
		LoginNextStep( f18_arg1.controller )
	end
end

function OnBackOut( f19_arg0, f19_arg1 )
	if not f19_arg0.m_inputDisabled and not Engine.IsConsoleGame() then
		LUI.FlowManager.RequestAddMenu( f19_arg0, "quit_popmenu", false, f19_arg1.controller )
	end
end

function main_lockout()
	local f20_local0 = Engine.GetFirstActiveController()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	Engine.SetGameMode( "none" )
	Engine.SetSplitScreen( false )
	Engine.SetDvarBool( "credits_frommenu", false )
	Engine.PlayMusic( CoD.Music.MainSPMusic, 1, 660 )
	PersistentBackground.Set( PersistentBackground.Variants.Default )
	Engine.SetDvarString( "s18", "0" )
	local f20_local2 = function ()
		if Engine.GetDvarBool( "ui_skipMainLockout" ) and not SkipToMenu( f20_local0 ) then
			GoToMainMenu( f20_local0 )
		end
	end
	
	if Engine.GetDvarBool( "ui_skipMainLockout" ) then
		Engine.ExecNow( "forcenosplitscreencontrol main_lockout_START" )
		Engine.ExecNow( "resetViewport", f20_local0 )
		self:registerEventHandler( "menu_create", f20_local2 )
	else
		Engine.ExecNow( "forcesplitscreencontrol main_lockout" )
		PersistentBackground.ChangeBackground( nil, CoD.Background.SPLockout )
		local f20_local3 = CoD.CreateState( 250, 193, -250, -193, CoD.AnchorTypes.All )
		f20_local3.material = RegisterMaterial( "h1_logo_mw" )
		local self = LUI.UIImage.new( f20_local3 )
		self.id = "Logo"
		self:addElement( self )
		local f20_local5 = CoD.CreateState( 0, -65, 0, -50, CoD.AnchorTypes.BottomLeftRight )
		f20_local5.font = CoD.TextSettings.H1TitleFont.Font
		local self = LUI.UIText.new( f20_local5 )
		self.id = "LockoutLegal"
		self:setText( Engine.Localize( "@LUA_MENU_LEGAL_COPYRIGHT_SHORT" ) )
		self:addElement( self )
		local f20_local7 = CoD.CreateState( 0, 500, 0, 515, CoD.AnchorTypes.TopLeftRight )
		f20_local7.font = CoD.TextSettings.H1TitleFont.Font
		local self = LUI.UIText.new( f20_local7 )
		local self = self
		local f20_local10 = self.setText
		local self = Engine.Localize
		local f20_local12
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
			f20_local12 = "@PLATFORM_PRESS_START_BUTTON"
			if not f20_local12 then
			
			else
				f20_local10( self, self( f20_local12 ) )
				self:addElement( self )
				f20_local10 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
				f20_local10.material = RegisterMaterial( "black" )
				f20_local10.alpha = 1
				self = LUI.UIImage.new( f20_local10 )
				self.id = "LockoutFade"
				self:registerAnimationState( "default", f20_local10 )
				self:registerAnimationState( "full", {
					alpha = 0
				} )
				self:registerEventHandler( "fadeToBlack", MBh.AnimateToState( "default", 750 ) )
				self:animateInSequence( {
					{
						"default",
						1000
					},
					{
						"full",
						1000
					}
				} )
				self:addElement( self )
				self = LUI.UIBindButton.new( {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					top = 0,
					bottom = 720,
					left = 0,
					right = 1280
				} )
				self.id = "LockoutBindButton"
				self:registerEventHandler( "button_start", OnLockoutButton )
				self:registerEventHandler( "button_action", OnLockoutButton )
				self:registerEventHandler( "button_secondary", OnBackOut )
				if Engine.IsPC() then
					self:setHandleMouseButton( true )
					self:registerEventHandler( "leftmousedown", OnLockoutButton )
					self:registerEventHandler( "button_shoulderl", OnLockoutButton )
					self:registerEventHandler( "button_shoulderr", OnLockoutButton )
					self:registerEventHandler( "popup_active", function ( element, event )
						element.m_inputDisabled = true
					end )
					self:registerEventHandler( "popup_inactive", function ( element, event )
						element.m_inputDisabled = false
					end )
				end
				self.handlePrimary = true
				self:addElement( self )
			end
		end
		f20_local12 = "@PLATFORM_PRESS_START_PC"
	end
	return self
end

LUI.MenuBuilder.registerType( "main_lockout", main_lockout )
LockTable( _M )
