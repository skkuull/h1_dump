local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = true
f0_local1 = function ()
	Engine.SetDvarBool( "arcademode", false )
	Engine.SetDvarBool( "arcademode_full", false )
	if not Engine.GetDvarBool( "mis_cheat" ) then
		Engine.SetDvarString( "start", "" )
	end
	Engine.SetDvarBool( "solo_play", false )
	Engine.SetDvarBool( "ui_autoContinue", false )
end

f0_local2 = function ()
	if not Engine.HasAcceptedInvite() then
		Engine.ExecNow( "forcenosplitscreencontrol main_campaign" )
	end
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	if Engine.IsConsoleGame() then
		Engine.ExecNow( "forcenosplitscreencontrol main_options_menu", f3_arg1.controller )
		LUI.FlowManager.RequestAddMenu( f3_arg0, "console_controls", true, f3_arg1.controller, false )
	else
		LUI.FlowManager.RequestAddMenu( f3_arg0, "pc_controls", true, f3_arg1.controller, false )
	end
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	f0_local1()
	Engine.EnumerateContent( f4_arg1.controller )
	if Engine.CorruptSaveGame and Engine.CorruptSaveGame() or false then
		LUI.FlowManager.RequestAddMenu( f4_arg0, "save_corrupted", false, f4_arg1.controller, false )
	elseif Engine.GetDvarBool( "profileMenuOption_resumeIsGameCompleted" ) then
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "resume_newgame_menu", false, f4_arg1.controller, false )
	else
		LUI.FlowManager.RequestPopupMenu( f4_arg0, "resume_game_menu", false, f4_arg1.controller, false )
	end
end

local f0_local5 = function ()
	if LUI.PreviousMenuName == nil then
		return true
	end
	local f5_local0 = string.sub( LUI.PreviousMenuName, 1, 13 )
	local f5_local1 = false
	if Engine.IsConsoleGame() then
		f5_local1 = LUI.ConsoleOptions.FindTypeIndex( LUI.PreviousMenuName ) ~= 0
	else
		f5_local1 = LUI.PreviousMenuName == "pc_controls"
	end
	local f5_local2
	if f5_local1 or LUI.PreviousMenuName == "intel_menu" or f5_local0 == "level_select_" then
		f5_local2 = false
	else
		f5_local2 = true
	end
	return f5_local2
end

local f0_local6 = function ( f6_arg0, f6_arg1 )
	f0_local1()
	local f6_local0 = Engine.IsProfileSignedIn( f6_arg1.controller )
	Engine.EnumerateContent( f6_arg1.controller )
	if f6_local0 then
		if Engine.CanResumeGame() then
			LUI.FlowManager.RequestAddMenu( f6_arg0, "overwrite_warning_menu", true, f6_arg1.controller )
		else
			LUI.FlowManager.RequestAddMenu( f6_arg0, "popmenu_autosave_warning", true, f6_arg1.controller )
		end
	else
		LUI.FlowManager.RequestAddMenu( f6_arg0, "no_profile_warning_newgame", true, f6_arg1.controller )
	end
end

local f0_local7 = function ( f7_arg0, f7_arg1, f7_arg2 )
	f0_local1()
	Engine.EnumerateContent( f7_arg1.controller )
	Engine.SetDvarBool( "arcademode", f7_arg2 )
	Engine.SetDvarBool( "requirestats", true )
	if Engine.IsProfileSignedIn( f7_arg1.controller ) then
		LUI.FlowManager.RequestAddMenu( nil, LUI.LevelSelect.FirstCampaignMenuName, false, f7_arg1.controller, false, {} )
	else
		LUI.FlowManager.RequestAddMenu( f7_arg0, "no_profile_warning_level_select_menu", false, f7_arg1.controller )
	end
end

local f0_local8 = function ( f8_arg0, f8_arg1 )
	f0_local7( f8_arg0, f8_arg1, false )
end

local f0_local9 = function ( f9_arg0, f9_arg1 )
	f0_local7( f9_arg0, f9_arg1, true )
end

local f0_local10 = function ( f10_arg0, f10_arg1 )
	LUI.FlowManager.PushMenuStackToDVar()
	Engine.SetDvarBool( "credits_frommenu", true )
	Engine.StreamingInstallMap( "simplecredits", "set ui_play_credits 1; set ui_autoContinue 1; devmap simplecredits;" )
end

local f0_local11 = function ( f11_arg0, f11_arg1 )
	Engine.Help()
end

local f0_local12 = function ( f12_arg0, f12_arg1 )
	Engine.SetDvarString( "gamemode", "" )
	Engine.PlaySound( CoD.SFX.MenuBack )
	Engine.SetDvarString( "ui_loadMenuName", "" )
	Engine.SetDvarBool( "ui_skipMainLockout", false )
	LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
end

local f0_local13 = function ()
	local f13_local0 = Engine.CanResumeGame()
	local f13_local1 = Engine.CorruptSaveGame and Engine.CorruptSaveGame() or false
	local f13_local2
	if not f13_local0 then
		f13_local2 = not f13_local1
	else
		f13_local2 = false
	end
	return f13_local2
end

local f0_local14 = function ( f14_arg0 )
	if Engine.GetDvarBool( "limited_mode" ) then
		return false
	else
		return not LUI.LevelSelect.IsMissionEnabled( 1, false )
	end
end

local f0_local15 = function ( f15_arg0 )
	for f15_local0 = 1, 20, 1 do
		if not LUI.LevelSelect.IsMissionEnabled( f15_local0, false, false ) then
			return false
		end
	end
	return true
end

function MenuCreate( f16_arg0, f16_arg1 )
	LUI.LevelSelect.CheckCampaignCompletedNotification( f16_arg0, f16_arg1 )
	if f0_local0 or f0_local5() then
		Engine.Exec( "select_save_device" )
	end
end

function main_campaign( f17_arg0, f17_arg1 )
	Engine.SetDvarBool( "ui_skipMainLockout", true )
	Engine.SetDvarBool( "arcademode", false )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f17_local0 = LUI.MenuTemplate.new( f17_arg0, {
		menu_title = Engine.Localize( "@MENU_SP_CAMPAIGN" ),
		exclusiveController = 0,
		menu_top_indent = LUI.MenuTemplate.spMenuOffset
	} )
	f17_local0.id = "main_campaign_container"
	LUI.MenuTemplate.SetBreadCrumb( f17_local0, "" )
	f17_local0:registerEventHandler( "menu_create", MenuCreate )
	f17_local0:AddBackButton( f0_local12 )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f17_local0:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	if Engine.IsXB3() or Engine.IsPCApp() then
		LUI.ButtonHelperText.AddSignInAndSwitchUserHelp( f17_local0 )
	end
	local f17_local1 = function ()
		f17_local0.list:closeChildren()
		if f17_local0.optionTextInfo then
			f17_local0.optionTextInfo:close()
		end
		if not Engine.GetDvarBool( "limited_mode" ) then
			if not f0_local13() then
				local f18_local0 = f17_local0:AddButton( "@LUA_MENU_RESUME_GAME", f0_local4, f0_local13, true, false, {
					desc_text = Engine.Localize( "@LUA_MENU_RESUME_GAME_DESC" ),
					disableSound = CoD.SFX.MenuAcceptDisabled
				} )
				f18_local0.listDefaultFocus = true
				f18_local0:clearActionSFX()
			end
			local f18_local0 = f17_local0:AddButton( "@LUA_MENU_NEW_GAME", f0_local6, nil, true, nil, {
				desc_text = Engine.Localize( "@LUA_MENU_NEW_GAME_DESC" )
			} )
			f18_local0:clearActionSFX()
			f18_local0.listDefaultFocus = f0_local13()
		end
		f17_local0:AddButton( "@LUA_MENU_MISSION_SELECT", f0_local8, nil, true, nil, {
			desc_text = Engine.Localize( "@LUA_MENU_MISSION_SELECT_DESC" )
		} )
		if not Engine.GetDvarBool( "limited_mode" ) then
			local f18_local0 = nil
			if not f0_local15() then
				f18_local0 = Engine.Localize( "MENU_ARCADE_UNLOCK_DESC" )
			else
				f18_local0 = Engine.Localize( "MENU_SELECT_ARCADEMODE" )
			end
			if not Engine.GetDvarBool( "loc_german_sku" ) then
				f17_local0:AddButton( "@MENU_ARCADEMODE", f0_local9, not f0_local15(), true, nil, {
					desc_text = f18_local0,
					showLockOnDisable = true,
					disableSound = CoD.SFX.MenuAcceptDisabled
				} )
			end
			f17_local0:AddButton( "@MENU_INTEL", "intel_menu", Engine.GetDvarBool( "arcademode" ), nil, nil, {
				desc_text = Engine.Localize( "@LUA_MENU_INTEL_SELECT_MESSAGE" )
			} )
		end
		f17_local0:AddOptionsButton( true )
		if not Engine.GetDvarBool( "limited_mode" ) then
			f17_local0:AddButton( "@LUA_MENU_CREDITS", f0_local10, nil, true, nil, {
				desc_text = Engine.Localize( "@LUA_MENU_CREDITS_DESC" )
			} )
		end
		LUI.Options.InitScrollingList( f17_local0.list, nil )
		f17_local0.optionTextInfo = LUI.Options.AddOptionTextInfo( f17_local0 )
	end
	
	if not f0_local0 and not f0_local5() then
		f17_local1()
	end
	f0_local1()
	CoD.ChangeCampaignBackground( self, event, Engine.GetDvarInt( "g_gameskill" ) or 1 )
	Engine.SetGameMode( "sp" )
	Engine.SetDvarBool( "specialops", false )
	Engine.SetDvarBool( "so_survival", false )
	Engine.SetSplitScreen( false )
	Engine.SetDvarString( "ui_prev_map", "" )
	Engine.SetDvarBool( "prologue_select", false )
	Engine.SetDvarBool( "credits_active", false )
	Engine.SetDvarInt( "ui_play_credits", 0 )
	if not Engine.GetDvarBool( "limited_mode" ) then
		Engine.SetDvarString( "ui_loadMenuName", "main_campaign" )
	end
	LUI.LevelSelect.InitializeCheat( f17_local0, function ( f19_arg0, f19_arg1 )
		LUI.FlowManager.RequestAddMenu( nil, "main_campaign", true, f19_arg1.controller, true, nil, {
			reload = true
		} )
	end )
	f17_local0:registerEventHandler( "finishreadingsavedevice", function ( element, event )
		f0_local0 = false
		Engine.Exec( "Updatedvarsfromprofile" )
		Engine.Exec( "profile_difficultyLoad" )
		Engine.Exec( "loadgame_fetch_mapname" )
		f17_local1()
		if not LUI.FlowManager.IsTopMenuModal() then
			f17_local0:processEvent( {
				name = "gain_focus"
			} )
		end
	end )
	if (f0_local0 or f0_local5()) and not Engine.IsConsoleGame() and not Engine.IsPCApp() then
		f17_local0:processEvent( {
			name = "finishreadingsavedevice"
		} )
	end
	return f17_local0
end

LUI.MenuBuilder.registerType( "main_campaign", main_campaign )
LUI.FlowManager.RegisterStackPushBehaviour( "main_campaign", f0_local2 )
LockTable( _M )
