local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnBackButton( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

function MainMenu( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( DesignGridDims.horz_gutter, DesignGridDims.vert_gutter, -DesignGridDims.horz_gutter, -DesignGridDims.vert_gutter, CoD.AnchorTypes.All ) )
	self:setClass( LUI.MenuTemplate )
	self:disableTreeFocus()
	self:registerEventHandler( "gain_focus", LUI.MenuTemplate.OnGainFocus )
	self.type = menu.type
	self.id = self.type .. "_container"
	self.exclusiveController = menu.properties and menu.properties.exclusiveController or Engine.GetSignedInAsController()
	local f2_local1 = LUI.MenuTemplate.ListTop + 56
	local f2_local2 = 200 + f2_local1
	local f2_local3 = 0
	local f2_local4 = GenericMenuDims.menu_width_standard + f2_local3 + 35
	local f2_local5 = CoD.CreateState( f2_local3, f2_local1, f2_local4, f2_local2, CoD.AnchorTypes.TopLeft )
	f2_local5.font = CoD.TextSettings.BodyFontSmall.Font
	f2_local5.spacing = H1MenuDims.spacing
	self.width = f2_local4 - f2_local3
	local f2_local6 = LUI.UIVerticalList.build( nil, {
		defaultState = f2_local5,
		noWrap = nil
	} )
	f2_local6.id = self.type .. "_list"
	self:addElement( f2_local6 )
	f2_local6.buttonCount = 0
	self.list = f2_local6
	local f2_local7 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main",
		id = self.type .. "_help"
	} )
	f2_local7:setupFullWindowElement()
	self.help = f2_local7:getFirstDescendentById( "container" )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		self:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	LUI.MenuTemplate.SetBreadCrumb( self, "" )
	Engine.ExecNow( "profile_SetHasEverPlayed_MainMenu" )
	Engine.Exec( "updategamerprofile" )
	local f2_local8 = CoD.CreateState( 0, 0, 270, 135, CoD.AnchorTypes.TopLeft )
	f2_local8.material = RegisterMaterial( "h1_logo_mw_small" )
	local self = LUI.UIImage.new( f2_local8 )
	self.id = "Logo"
	self:addElement( self )
	local f2_local10 = LUI.MenuTemplate.AddButton( self, "@LUA_MENU_CAMPAIGN_CAPS", OnSinglePlayerButtonAction )
	local f2_local11 = LUI.MenuTemplate.AddButton( self, "@LUA_MENU_MULTIPLAYER_CAPS", OnMultiPlayerButtonAction )
	if Engine.IsConsoleGame() then
		local f2_local12 = LUI.MenuTemplate.AddButton( self, "@LUA_MENU_CALL_OF_DUTY_INFINITE_WARFARE", OnIWButtonAction )
	end
	if not Engine.IsConsoleGame() then
		self:AddButton( Engine.Localize( "@LUA_MENU_EXIT_GAME" ), HandleQuitPC )
	end
	self:AddBackButton( OnBackButton )
	PersistentBackground.ChangeBackground( nil, CoD.Background.SPLockout )
	if Engine.ShouldDisplayTimebombMessage() then
		LUI.FlowManager.RequestAddMenu( self, "generic_confirmation_popup", false, self.exclusiveController, false, {
			cancel_will_close = false,
			message_text = Engine.LocalizeLong( "@LUA_SP_COMMON_TIMEBOMB_DESC" ),
			button_text = Engine.Localize( "@MENU_OK" )
		} )
	end
	if Engine.IsPC() and not Engine.GetDisplayDriverMeetsMinVer() then
		LUI.FlowManager.RequestAddMenu( self, "PCDriverDialog" )
	end
	return self
end

function OnSinglePlayerButtonAction( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "main_campaign", true, f3_arg1.controller, false )
end

function OnMultiPlayerButtonAction( f4_arg0, f4_arg1 )
	if Engine.IsXB3() then
		Engine.StreamingInstallMap( "mp_full", "startMultiplayer;" )
	else
		Engine.StreamingInstallMap( "mp_initial", "startMultiplayer;" )
	end
end

function OnIWButtonAction( f5_arg0, f5_arg1 )
	DebugPrint( "IW Button Action!" )
	Engine.StartSingleplayerIW()
end

function HandleQuitPC( f6_arg0, f6_arg1 )
	LUI.FlowManager.RequestAddMenu( f6_arg0, "quit_popmenu", false, f6_arg1.controller )
end

LUI.MenuBuilder.registerType( "main_menu", MainMenu )
LockTable( _M )
