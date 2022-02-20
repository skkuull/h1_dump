local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.GameSetup = InheritFrom( LUI.MenuTemplate )
infoVariant = GenericButtonSettings.Variants.Info
selectVariant = GenericButtonSettings.Variants.Select
DevMLGOptionsUnlocked = false
JIP = {
	InitAllowed = nil,
	CurAllowed = nil
}
function PrivatePartyHostSetupMapAction( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestAddMenu( f1_arg0, "mapsetup_menu_main", true, f1_arg1.controller, false, {
		rotationAllowed = true
	} )
end

function SetupMapAction( f2_arg0, f2_arg1 )
	local f2_local0 = {
		rotationAllowed = false
	}
	LUI.FlowManager.RequestAddMenu( f2_arg0, "mapsetup_menu_main", true, f2_arg1.controller, false )
end

function SetupModeAction( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "popup_recipesetup_modes", true, f3_arg1.controller )
end

function SetupOptionsAction( f4_arg0, f4_arg1 )
	LUI.FlowManager.RequestAddMenu( f4_arg0, "settings_recipe_rules_base", true, f4_arg1.controller, false )
end

function SaveDefaultsAction( f5_arg0, f5_arg1 )
	SetMatchRulesDefaults()
	MatchRules.SaveMatchRulesDataDefault()
end

function SaveForPlaylistAction( f6_arg0, f6_arg1 )
	MatchRules.SaveMatchRulesDataDefault()
end

function SaveMLGRecipe( f7_arg0, f7_arg1 )
	local f7_local0 = Engine.GetDvarString( "mlgVersion" )
	if not f7_local0 or #f7_local0 == 0 then
		DebugPrint( "Warning, you should set the 'mlgVersion' DVar before saving an MLG ruleset. Default value '0.1' will be saved." )
		f7_local0 = "0.1"
	end
	if MatchRules.SetData( "mlgVersion", f7_local0 ) then
		SetMatchRulesDefaults()
		MatchRules.SaveMatchRulesDataDefault()
	else
		DebugPrint( "Error setting mlgVersion" )
	end
end

function ResaveAllRecipes( f8_arg0, f8_arg1 )
	local f8_local0 = MatchRules.GetData( "gametype" )
	local f8_local1 = MatchRules.GetData( "modePrefix" )
	local f8_local2 = MLG.AreMLGRulesEnabled()
	local f8_local3 = {}
	AddRecipeList( Cac.GameModes.Group.Standard, f8_local3 )
	AddRecipeList( Cac.GameModes.Group.Esports, f8_local3 )
	AddRecipeList( Cac.GameModes.Group.Party, f8_local3 )
	for f8_local4 = 1, #f8_local3, 1 do
		local f8_local7 = f8_local3[f8_local4]
		LUI.mp_menus.MPGameModeSelectMenu.LoadGameTypeRecipe( f8_local7.mode, f8_local7.modeGroup )
		SaveForPlaylistAction( f8_arg0, f8_arg1 )
	end
	MatchRules.SetData( "gametype", f8_local0 )
	MatchRules.SetData( "modePrefix", f8_local1 )
	MLG.SetMLGRulesEnabled( f8_local2 )
end

function UnlockMLGOptions( f9_arg0, f9_arg1 )
	DevMLGOptionsUnlocked = true
end

function OnMapSelection( f10_arg0, f10_arg1 )
	LUI.FlowManager.RequestAddMenu( f10_arg0, "survival_level_select", true, f10_arg1.controller, false )
end

function ChangePassBtnAction( f11_arg0, f11_arg1 )
	Engine.ExecNow( "setfromdvar ui_password privateMatch_serverPassword" )
	Engine.OpenScreenKeyboard( f11_arg1.controller, Engine.Localize( "@LUA_MENU_CODA_REGISTER_PASSWORD_SYSTEM_DIALOG" ), Engine.GetDvarString( "ui_password" ) or "", Lobby.PasswordLength, false, false, CoD.KeyboardInputTypes.Password )
end

function SetMatchRulesDefaults()
	SetMatchRulesLoadoutDefaults()
end

function SetMatchRulesLoadoutDefaults()
	for f13_local0 = 0, 5, 1 do
		MatchRules.SetData( "defaultClasses", "axis", f13_local0, "class", "inUse", false )
		MatchRules.SetData( "defaultClasses", "allies", f13_local0, "class", "inUse", false )
		MatchRules.SetData( "defaultClasses", "axis", f13_local0, "class", "name", "" )
		MatchRules.SetData( "defaultClasses", "allies", f13_local0, "class", "name", "" )
	end
end

function AddRecipeList( f14_arg0, f14_arg1 )
	local f14_local0 = Cac.GameModes.Data[f14_arg0]
	if f14_local0 == nil then
		f14_local0 = {
			f14_arg0
		}
	else
		f14_local0 = f14_local0.List
	end
	for f14_local1 = 1, #f14_local0, 1 do
		f14_arg1[#f14_arg1 + 1] = {
			mode = f14_local0[f14_local1],
			modeGroup = f14_arg0
		}
	end
end

function GenerateExtraProps( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
	local f15_local0
	if f15_arg5 then
		f15_local0 = Engine.Localize( f15_arg5 )
		if not f15_local0 then
		
		else
			return {
				variant = f15_arg0,
				button_display_func = f15_arg1,
				button_left_func = f15_arg2,
				button_right_func = f15_arg3,
				button_over_func = f15_arg4,
				desc_text = f15_local0
			}
		end
	end
	f15_local0 = nil
end

function GameSetupMenuCreate( f16_arg0, f16_arg1 )
	MatchRules.SetUsingMatchRulesData( 1 )
	if Lobby.IsInPrivateParty() and Lobby.IsPrivatePartyHost() then
		Lobby.StopIntermissionTimer()
	end
	local f16_local0 = Engine.GetFirstActiveController()
	if f16_arg0.properties.exclusiveController then
		f16_local0 = f16_arg0.properties.exclusiveController
	end
	Engine.SetOldLocalVarBool( f16_local0, "lui_gamesetup_menu", false )
	f16_arg0:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	if Engine.IsCoreMode() then
		f16_arg0:processEvent( {
			name = "add_button_helper_text",
			button_ref = "button_select",
			helper_text = Engine.Localize( "@LUA_MENU_RECIPE_SAVE_CUSTOM" ) or "",
			side = "right",
			clickable = true
		} )
	end
	BotButtonRefresh( f16_arg0, f16_arg1 )
end

function SaveRecipeToMyModes( f17_arg0, f17_arg1 )
	if Engine.IsCoreMode() then
		MatchRules.OpenSelectionMenu( f17_arg1.controller, {
			savedMode = "save",
			menuAction = "save",
			menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_MY_MODES" ) ),
			return_menu = "gamesetup_menu_main"
		} )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end
end

function ChangePassHandler( f18_arg0, f18_arg1 )
	if f18_arg1.text then
		Engine.SetDvarString( "privateMatch_serverPassword", f18_arg1.text )
		f18_arg0:processEvent( {
			name = "content_refresh"
		} )
	end
end

function MenuBindButtonHandler( f19_arg0, f19_arg1 )
	if JIP.CurAllowed ~= JIP.InitAllowed then
		Engine.Exec( "xtogprivateslots; xsessionupdate;" )
	end
	JIP.InitAllowed = nil
	JIP.CurAllowed = nil
	LUI.FlowManager.RequestLeaveMenu( f19_arg0 )
end

function JIPButtonDisplayText()
	if JIP.CurAllowed then
		return Engine.Localize( "@LUA_MENU_ALLOWED" )
	else
		return Engine.Localize( "@LUA_MENU_NOTALLOWED" )
	end
end

function IntermissionButtonDisplayText()
	if Lobby.IsUsingIntermissionTimer() then
		return Engine.Localize( "@LUA_MENU_ENABLED" )
	else
		return Engine.Localize( "@LUA_MENU_DISABLED" )
	end
end

function JIPHandleOptionToggle()
	JIP.CurAllowed = not JIP.CurAllowed
end

function IntermissionHandleOptionToggle()
	if Lobby.IsUsingIntermissionTimer() then
		Lobby.UseIntermissionTimer( false )
	else
		Lobby.UseIntermissionTimer( true )
	end
end

function SetMatchRulesLoadoutDefaults()
	for f24_local0 = 0, 5, 1 do
		MatchRules.SetData( "defaultClasses", "axis", "defaultClass", f24_local0, "class", "inUse", false )
		MatchRules.SetData( "defaultClasses", "allies", "defaultClass", f24_local0, "class", "inUse", false )
		MatchRules.SetData( "defaultClasses", "axis", "defaultClass", f24_local0, "class", "name", "" )
		MatchRules.SetData( "defaultClasses", "allies", "defaultClass", f24_local0, "class", "name", "" )
	end
end

function ModeButtonDisplayFunc()
	return Lobby.GameTypeNameAbbreviated()
end

function ChangePassBtnDisplay()
	local f26_local0 = Engine.GetDvarString( "privateMatch_serverPassword" )
	if f26_local0 then
		f26_local0 = Engine.GetDvarString( "privateMatch_serverPassword" ) ~= ""
	end
	local f26_local1
	if f26_local0 then
		f26_local1 = Engine.Localize( "LUA_MENU_PASSWORD_SET" )
		if not f26_local1 then
		
		else
			return f26_local1
		end
	end
	f26_local1 = Engine.Localize( "MENU_NONE" )
end

function SetupOptionsDisplayFunc()
	local f27_local0 = "PATCH_MENU_MATCHRULES_CUSTOM"
	if MLG.AreMLGRulesEnabled() then
		f27_local0 = "PATCH_MENU_MATCHRULES_MLG"
	elseif MatchRules.AreMatchRulesDefaultFromFF() then
		f27_local0 = "PATCH_MENU_MATCHRULES_DEFAULT"
	end
	return Engine.Localize( f27_local0 )
end

LUI.GameSetup.AddPrivacyOption = function ( f28_arg0 )
	if not Engine.GetSystemLink() and Engine.GetOnlineGame() and not f28_arg0.properties.isSoloMode then
		if Engine.IsConsoleGame() then
			if JIP.InitAllowed == nil then
				JIP.InitAllowed = Engine.GetDvarInt( "sv_privateClients" ) ~= Engine.GetDvarInt( "party_maxPlayers" )
				JIP.CurAllowed = JIP.InitAllowed
			end
			f28_arg0:AddButton( "@LUA_MENU_JIP", nil, nil, nil, nil, GenerateExtraProps( selectVariant, JIPButtonDisplayText, JIPHandleOptionToggle, JIPHandleOptionToggle, nil, "@LUA_MENU_JIP_DESC" ) )
		elseif Engine.GetDvarBool( "xblive_privatematch" ) then
			local f28_local0 = f28_arg0:AddButton( "@LUA_MENU_CHANGE_PASSWORD", ChangePassBtnAction, nil, nil, nil, GenerateExtraProps( infoVariant, ChangePassBtnDisplay ) )
			f28_local0:registerEventHandler( "text_input_complete", ChangePassHandler )
		end
	end
end

LUI.GameSetup.GameSetupMenuOptionsFeeder = function ( f29_arg0 )
	local f29_local0 = "@MENU_MAP"
	local f29_local1 = SetupMapAction
	if Lobby.IsInPrivateParty() and Lobby.IsPrivatePartyHost() then
		f29_local0 = "@MENU_MAPS"
		f29_local1 = PrivatePartyHostSetupMapAction
	end
	local f29_local2 = "None"
	if Lobby.IsInPrivateParty() and MatchRules.IsUsingCustomMapRotation() then
		f29_local2 = Engine.Localize( "@LUA_MENU_ROTATION" )
	else
		f29_local2 = Lobby.GetMapName()
	end
	f29_arg0:AddButton( f29_local0, f29_local1, nil, nil, nil, GenerateExtraProps( infoVariant, function ()
		return f29_local2
	end ) )
	f29_arg0:AddButton( "@MPUI_MODE", SetupModeAction, nil, nil, nil, GenerateExtraProps( infoVariant, ModeButtonDisplayFunc ) )
	f29_arg0:AddButton( "@LUA_MENU_OPTIONS", SetupOptionsAction, nil, nil, nil, GenerateExtraProps( infoVariant, SetupOptionsDisplayFunc ) )
	f29_arg0:AddPrivacyOption()
	if Lobby.IsInPrivateParty() and Lobby.IsPrivatePartyHost() and Engine.IsCoreMode() then
		f29_arg0:AddButton( "@MENU_INTERMISSION", nil, nil, nil, nil, GenerateExtraProps( selectVariant, IntermissionButtonDisplayText, IntermissionHandleOptionToggle, IntermissionHandleOptionToggle ) )
	end
	local f29_local3 = Engine.GetDvarString( "ui_gametype" )
	if Engine.IsCoreMode() and (Lobby.IsGameHost() or Engine.GetSplitScreen()) then
		local f29_local4 = BotIsTeamBased( f29_local3 )
		local f29_local5 = GenerateExtraProps( selectVariant, FriendlyBotButtonDisplayText, FriendlyBotButtonLeft, FriendlyBotButtonRight, MBh.EmitEventToRoot( {
			name = "lobby_slide_disable",
			dispatchChildren = true,
			immediate = true
		} ), "@LUA_MENU_FRIENDLY_BOTS_DESC" )
		if f29_local4 and f29_local4 == 1 then
			f29_local5.button_display_func = FriendlyBotButtonDisplayText
			f29_local5.button_left_func = FriendlyBotButtonLeft
			f29_local5.button_right_func = FriendlyBotButtonRight
			f29_local5.desc_text = "@LUA_MENU_FRIENDLY_BOTS_DESC"
			f29_arg0:AddButton( "@LUA_MENU_FRIENDLY_BOTS", nil, nil, nil, nil, f29_local5 )
			f29_local5.button_display_func = FriendlyBotsDifficultyButtonDisplayText
			f29_local5.button_left_func = FriendlyBotsDifficultyButtonLeft
			f29_local5.button_right_func = FriendlyBotsDifficultyButtonRight
			f29_local5.desc_text = "@LUA_MENU_FRIENDLY_BOTDIFFICULTY_DESC"
			f29_arg0:AddButton( "@LUA_MENU_BOT_DIFFICULTY", nil, nil, nil, nil, f29_local5 )
			f29_local5.button_display_func = EnemyBotButtonDisplayText
			f29_local5.button_left_func = EnemyBotButtonLeft
			f29_local5.button_right_func = EnemyBotButtonRight
			f29_local5.desc_text = "@LUA_MENU_ENEMY_BOTS_DESC"
			f29_arg0:AddButton( "@LUA_MENU_ENEMY_BOTS", nil, nil, nil, nil, f29_local5 )
			f29_local5.button_display_func = EnemyBotsDifficultyButtonDisplayText
			f29_local5.button_left_func = EnemyBotsDifficultyButtonLeft
			f29_local5.button_right_func = EnemyBotsDifficultyButtonRight
			f29_local5.desc_text = "@LUA_MENU_ENEMY_BOTDIFFICULTY_DESC"
			f29_arg0:AddButton( "@LUA_MENU_BOT_DIFFICULTY", nil, nil, nil, nil, f29_local5 )
		else
			f29_local5.button_display_func = FFABotButtonDisplayText
			f29_local5.button_left_func = FFABotButtonLeft
			f29_local5.button_right_func = FFABotButtonRight
			f29_local5.desc_text = "@LUA_MENU_BOTS_DESC"
			f29_arg0:AddButton( "@LUA_MENU_BOTS", nil, nil, nil, nil, f29_local5 )
			f29_local5.button_display_func = FFABotsDifficultyButtonDisplayText
			f29_local5.button_left_func = FFABotsDifficultyButtonLeft
			f29_local5.button_right_func = FFABotsDifficultyButtonRight
			f29_local5.desc_text = "@LUA_MENU_ENEMY_BOTDIFFICULTY_DESC"
			f29_arg0:AddButton( "@LUA_MENU_BOT_DIFFICULTY", nil, nil, nil, nil, f29_local5 )
		end
		f29_arg0:addElement( LUI.UITimer.new( 200, "bot_button_refresh" ) )
	end
	if Engine.IsDevelopmentBuild() and Engine.IsCoreMode() then
		local f29_local4 = 20
		f29_arg0:AddButton( "[Dev]  Save default recipe", SaveDefaultsAction, nil, nil, nil, {
			height = f29_local4
		} )
		f29_arg0:AddButton( "[Dev]  Save for Playlist/MLG", SaveForPlaylistAction, nil, nil, nil, {
			height = f29_local4
		} )
		f29_arg0:AddButton( "[Dev]  Save MLG recipe", SaveMLGRecipe, nil, nil, nil, {
			height = f29_local4
		} )
		f29_arg0:AddButton( "[Dev]  Re-save all recipes", ResaveAllRecipes, nil, nil, nil, {
			height = f29_local4
		} )
		f29_arg0:AddButton( "[Dev]  Unlock MLG options", UnlockMLGOptions, nil, nil, nil, {
			height = f29_local4
		} )
	end
end

LUI.GameSetup.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "gamesetup_menu_main_root"
	self.properties = {
		isSoloMode = false
	}
	self:registerEventHandler( "menu_create", GameSetupMenuCreate )
	self:registerEventHandler( "bot_button_refresh", BotButtonRefresh )
	local f31_local1 = LUI.MenuTemplate.new( menu, {
		menu_title = "@LUA_MENU_GAME_SETUP_CAPS",
		menu_width = 548 - GenericMenuDims.menu_left,
		scrollInSplitScreen = true
	} )
	if true == IsOnlineMatch() then
		f31_local1:SetBreadCrumb( Engine.Localize( "@LUA_MENU_PRIVATE_MATCH_CAPS" ) )
	else
		f31_local1:SetBreadCrumb( Engine.Localize( "@PLATFORM_SYSTEM_LINK_TITLE" ) )
	end
	f31_local1:setClass( LUI.GameSetup )
	f31_local1.controller = controller.exclusiveControlController
	f31_local1.properties = {
		isSoloMode = MBh.Property( "isSoloMode" )
	}
	f31_local1:registerEventHandler( "mode_changed", function ( element, event )
		element:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end )
	Engine.MenuDvarsSetup( controller.exclusiveController )
	f31_local1:GameSetupMenuOptionsFeeder()
	local self = LUI.UIBindButton.new()
	self.id = self.id .. "gamesetup_bind_buttons_id"
	self:registerEventHandler( "button_secondary", MenuBindButtonHandler )
	f31_local1:addElement( self )
	local self = LUI.UIBindButton.new()
	self.id = "save_recipe_bind"
	self:registerEventHandler( "button_select", SaveRecipeToMyModes )
	f31_local1:addElement( self )
	local self = LUI.UIText.new()
	self.id = self.id .. "btn_desc_text_id"
	self.states = {
		default = CoD.CreateState( DesignGridDims.horz_gutter, -S1MenuDims.safe_area_vert - CoD.TextSettings.TitleFontSmall.Height, nil, -S1MenuDims.safe_area_vert, CoD.AnchorTypes.BottomLeft )
	}
	f31_local1:addElement( self )
	self:addElement( f31_local1 )
	return self
end

LUI.MenuBuilder.registerType( "gamesetup_menu_main", LUI.GameSetup.new )
VLobby.InitMenuMode( "gamesetup_menu_main", VirtualLobbyModes.LUI_MODE_OBSCURED, nil, PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
