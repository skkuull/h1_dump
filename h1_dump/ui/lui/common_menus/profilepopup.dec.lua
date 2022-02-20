local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function profileMenuOptionsFeeder( f1_arg0 )
	return {
		{
			type = "UIGenericButton",
			id = "offile_profile_create_btn",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@MENU_CREATE_NEW_OFFLINE_PROFILE" ),
				button_action_func = function ( f2_arg0, f2_arg1 )
					DebugPrint( "button offile_profile_create_btn press" )
					Engine.Exec( "newOfflineProfile", f2_arg1.controller )
					LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
				end
				
			}
		},
		{
			type = "UIGenericButton",
			id = "offile_profile_load_btn",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@MENU_LOAD_EXISTING_OFFLINE_PROFILE" ),
				button_action_func = function ( f3_arg0, f3_arg1 )
					DebugPrint( "button offile_profile_load_btn press" )
					Engine.Exec( "loadOfflineProfile", f3_arg1.controller )
					LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
				end
				
			}
		},
		{
			type = "UIGenericButton",
			id = "offile_profile_delete_btn",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@MENU_DELETE_OFFLINE_PROFILE" ),
				button_action_func = function ( f4_arg0, f4_arg1 )
					DebugPrint( "button offile_profile_delete_btn press" )
					Engine.Exec( "deleteOfflineProfile", f4_arg1.controller )
					LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
				end
				
			}
		}
	}
end

function OnCreatePS3ProfileMenu( f5_arg0, f5_arg1 )
	DebugPrint( "On Create PS3 profile menu" )
	Engine.ExecNow( "incnosplitscreencontrol menu_ps3_profile" )
end

function OnClosePS3ProfileMenu( f6_arg0, f6_arg1 )
	DebugPrint( "On Close PS3 profile menu" )
	Engine.ExecNow( "decnosplitscreencontrol menu_ps3_profile" )
	local f6_local0 = Engine.GetLuiRoot()
	if f6_local0:IsMenuOpenAndVisible( "menu_splitscreensignin" ) and not f6_local0:IsMenuOpenAndVisible( "menu_resetstats_warning" ) and not f6_local0:IsMenuOpenAndVisible( "menu_ps3_savegame_warning" ) then
		Engine.Exec( "startsplitscreensignin" )
	end
end

function OnBackPS3ProfileMenu( f7_arg0, f7_arg1 )
	DebugPrint( "On Back PS3 profile menu" )
	local f7_local0 = Engine.GetLuiRoot()
	if f7_local0:IsMenuOpenAndVisible( "menu_systemlink" ) and not Engine.OfflineProfileIsSelected( Engine.GetFirstActiveController() ) then
		f7_arg0:dispatchEventToRoot( {
			name = "exit_system_link"
		} )
	end
end

function menu_ps3_profile()
	return {
		type = "generic_selectionList_popup",
		id = "offline_profile_management_popup",
		properties = {
			popup_title = Engine.Localize( "@MENU_LOAD_OFFLINE_PROFILE" ),
			popup_childfeeder = profileMenuOptionsFeeder
		},
		handlers = {
			menu_create = OnCreatePS3ProfileMenu,
			menu_close = OnClosePS3ProfileMenu,
			popup_back = OnBackPS3ProfileMenu
		}
	}
end

function SaveErrorContinue( f9_arg0, f9_arg1 )
	DebugPrint( "Save Error Continue" )
	if Engine.GetSplitScreen() then
		Engine.Exec( "endsplitscreensignin" )
		LUI.FlowManager.RequestAddMenu( f9_arg0, "menu_gamesetup_splitscreen", false, f9_arg1.controller, false, {} )
	else
		assert( f9_arg0.properties.callback_params.continue_to_menu )
		LUI.FlowManager.RequestOldMenu( f9_arg0, f9_arg0.properties.callback_params.continue_to_menu, false )
	end
end

function SaveErrorReturn( f10_arg0, f10_arg1 )
	DebugPrint( "Save Error Cancel" )
	if Engine.GetSplitScreen() then
		Engine.Exec( "startsplitscreensignin" )
	end
end

function GetSomeText()
	return "my cool text"
end

function menu_ps3_savegame_error( f12_arg0, f12_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		message_text = Engine.UserWithoutOfflineProfile(),
		popup_title = Engine.Localize( "@MENU_SAVE_ERROR_MP" ),
		yes_text = Engine.Localize( "@MENU_RESUMEGAME_NOSAVE_MP" ),
		no_text = Engine.Localize( "@MENU_RETURN_SIGNIN_MP" ),
		yes_action = SaveErrorContinue,
		no_action = SaveErrorReturn
	} )
end

LUI.MenuBuilder.registerDef( "menu_ps3_profile", menu_ps3_profile )
LUI.MenuBuilder.registerPopupType( "menu_ps3_savegame_error", menu_ps3_savegame_error )
LockTable( _M )
