local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function NoProfileWarningYesAction( f1_arg0, f1_arg1 )
	Engine.Exec( "xsignin" )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

function NoProfileWarningLevelSelectNoAction( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
	LUI.FlowManager.RequestAddMenuCampaign( f2_arg0, true, f2_arg1.controller, false )
end

function no_profile_warning_level_select_menu( f3_arg0, f3_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@MENU_SP_PROFILE_WARNING_SP" ),
		yes_action = NoProfileWarningYesAction,
		no_action = NoProfileWarningLevelSelectNoAction
	} )
end

function ResumeGameYesAction( f4_arg0, f4_arg1 )
	LUI.ComScore.LogResumeCampaign( f4_arg1.controller )
	Engine.SetDvarString( "ui_char_museum_mode", "credits_1" )
	Engine.SetDvarBool( "prologue_select", false )
	Engine.Exec( "profile_difficultyLoad" )
	Engine.Exec( "loadgame_continue" )
	LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
end

function resume_game_menu( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.LevelSelect.FindLevelTitle( Engine.GetDvarString( "loadgame_mapname" ) )
	local f5_local1 = {
		popup_title = Engine.Localize( "@MENU_RESUMEGAME_Q" )
	}
	local f5_local2
	if f5_local0 then
		f5_local2 = Engine.Localize( "@MENU_RESUMEGAME_Q_DESC" ) .. "\n" .. Engine.Localize( f5_local0 )
		if not f5_local2 then
		
		else
			f5_local1.message_text = f5_local2
			f5_local1.yes_text = Engine.Localize( "@MENU_YES_CAPS" )
			f5_local1.yes_action = ResumeGameYesAction
			f5_local1.no_text = Engine.Localize( "@MENU_NO_CAPS" )
			f5_local1.no_action = MBh.LeaveMenu()
			return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", f5_local1 )
		end
	end
	f5_local2 = nil
end

function resume_newgame_menu( f6_arg0, f6_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_RESUMEGAME_Q" ),
		message_text = Engine.Localize( "@MENU_RESUME_NEWGAME" ),
		yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
		yes_action = OpenFirstLevel,
		no_text = Engine.Localize( "@MENU_NO_CAPS" ),
		no_action = MBh.LeaveMenu(),
		cancel_means_no = false
	} )
end

function RecommendMpYesAction( f7_arg0, f7_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f7_arg0 )
	Engine.Exec( "profile_SetStartCRPLobby", f7_arg1.controller )
	Engine.Exec( "updategamerprofile" )
	Engine.StartMultiplayer()
end

function RecommendMpNoAction( f8_arg0, f8_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f8_arg0 )
	Engine.StartMultiplayer()
end

function recommend_mp_menu( f9_arg0, f9_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@MENU_SP_RECOMMENDATION" ),
		yes_text = Engine.Localize( "@LUA_MENU_CAMPAIGN_DESC" ),
		yes_action = RecommendMpYesAction,
		no_text = Engine.Localize( "@MENU_SP_CONTINUE_TO_MULTIPLAYER" ),
		no_action = RecommendMpNoAction,
		cancel_means_no = false
	} )
end

function xenon_disc_dlc_menu( f10_arg0, f10_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_INSERT_DISC_2" ),
		message_text = Engine.Localize( "@LUA_MENU_INSERT_DISC_2_MESSAGE" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function xenon_damaged_disc2_content_menu( f11_arg0, f11_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@LUA_MENU_DAMAGED_DISC_2_MESSAGE" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function GamesOnDemandInstallContent( f12_arg0, f12_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
	Engine.DownloadXenonDiscContent( f12_arg1.controller )
end

function xenon_gamesondemand_install_menu( f13_arg0, f13_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_DOWNLOAD_SP_PROMPT" ),
		message_text = Engine.Localize( "@LUA_MENU_DOWNLOAD_SP_DESC" ),
		yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
		yes_action = GamesOnDemandInstallContent,
		no_text = Engine.Localize( "@MENU_NO_CAPS" ),
		no_action = MBh.LeaveMenu()
	} )
end

function xenon_gamesondemand_isdownloading_menu( f14_arg0, f14_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_DOWNLOAD_IN_PROGRESS" ),
		message_text = Engine.Localize( "@LUA_MENU_DOWNLOAD_WAIT" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function OpenFirstLevel( f15_arg0, f15_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f15_arg0 )
	LUI.ComScore.LogStartCampaign( f15_arg1.controller )
	LUI.FlowManager.PushMenuStackToDVar()
	LUI.LevelSelect.ResumeSetIsGameCompleted( false )
	Engine.StreamingInstallMap( "killhouse", "devmap killhouse" )
end

function ResetAndOpenFirstLevel( f16_arg0, f16_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f16_arg0 )
	LUI.ComScore.LogStartCampaign( f16_arg1.controller )
	LUI.LevelSelect.ResumeSetIsGameCompleted( false )
	LUI.FlowManager.PushMenuStackToDVar()
	Engine.StreamingInstallMap( "killhouse", "devmap killhouse" )
end

function overwrite_warning_menu( f17_arg0, f17_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NEWGAME" ),
		message_text = Engine.Localize( "@MENU_WARNING_NEWGAME_RESET" ),
		yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
		yes_action = ResetAndOpenFirstLevel,
		no_text = Engine.Localize( "@MENU_NO_CAPS" ),
		no_action = MBh.LeaveMenu()
	} )
end

function request_yesno_popup_generic( f18_arg0, f18_arg1 )
	local f18_local0 = assert
	local f18_local1 = f18_arg1
	local f18_local2 = f18_arg1.popup_title
	if f18_local2 then
		f18_local2 = f18_arg1.yes_action
		if f18_local2 then
			f18_local2 = f18_local1 and f18_arg1.message_text
		end
	end
	f18_local0( f18_local2 )
	f18_local0 = {
		popup_title = Engine.Localize( f18_arg1.popup_title ),
		message_text = Engine.Localize( f18_arg1.message_text ),
		yes_text = Engine.Localize( f18_arg1.yes_text or "@MENU_YES_CAPS" ),
		yes_action = f18_arg1.yes_action,
		no_text = Engine.Localize( f18_arg1.no_text or "@MENU_NO_CAPS" )
	}
	f18_local2 = f18_arg1.no_action
	if not f18_local2 then
		f18_local2 = MBh.LeaveMenu()
	end
	f18_local0.no_action = f18_local2
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", f18_local0 )
end

function no_profile_warning_newgame( f19_arg0, f19_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING" ),
		message_text = Engine.Localize( "@MENU_SP_PROFILE_WARNING_SP" ),
		yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
		yes_action = NoProfileWarningYesAction,
		no_text = Engine.Localize( "@MENU_NO_CAPS" ),
		no_action = OpenFirstLevel,
		cancel_action = MBh.LeaveMenu(),
		cancel_means_no = false,
		default_focus_index = 1
	} )
end

function popmenu_autosave_warning( f20_arg0, f20_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@PLATFORM_WARNING_AUTOSAVE" ),
		button_text = Engine.Localize( "@MENU_CONTINUE" ),
		confirmation_action = OpenFirstLevel
	} )
end

function save_corrupted( f21_arg0, f21_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_SAVE_CORRUPTED" ),
		message_text = Engine.Localize( "@MENU_SAVEDATA_CORRUPTED" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu(),
		cancel_will_close = false
	} )
end

function not_signed_in_warning( f22_arg0, f22_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@XBOXLIVE_NOTSIGNEDIN" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function speech_reduced( f23_arg0, f23_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_KINECT_NOTICE" ),
		message_text = Engine.Localize( "@MENU_KINECT_FEATURE_REDUCED" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function campaign_arcade_cheat_unlocked( f24_arg0, f24_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_CAMPAIGN_ARCADE_CHEAT_UNLOCKED" ),
		message_text = Engine.GetDvarBool( "loc_german_sku" ) and Engine.Localize( "@MENU_CAMPAIGN_ARCADE_CHEAT_UNLOCKED_DESC_GERMAN_SKU" ) or Engine.Localize( "@MENU_CAMPAIGN_ARCADE_CHEAT_UNLOCKED_DESC" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = MBh.LeaveMenu()
	} )
end

function difficulty_childfeeder( f25_arg0 )
	local f25_local0 = {}
	local self = LUI.UIElement.new()
	self.type = "difficulty_selection_menu_detailed"
	self.id = self.type .. "_container"
	local f25_local2 = nil
	if f25_arg0.subContainer then
		local subContainer = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		subContainer.id = self.type .. "_sub_container"
		self:addElement( subContainer )
		self.subContainer = subContainer
		
		f25_local2 = subContainer
	else
		f25_local2 = self
	end
	local self = nil
	if f25_arg0.scrollInSplitScreen and GameX.IsSplitscreen() then
		listState.bottom = listTop + 265
		self = LUI.UIScrollingVerticalList.new( listState, nil, {
			use_arrows = true,
			sendScrollEvents = true,
			autoScroll = LUI.AutoScroll.AnchoredEdges,
			autoScrollTime = 200
		} )
		self.id = self.type .. "_list"
		f25_local2:addElement( self )
	else
		self = LUI.UIVerticalList.build( nil, {
			defaultState = listState,
			noWrap = f25_arg0.listNoWrap
		} )
		self.id = self.type .. "_list"
		f25_local2:addElement( self )
	end
	self.buttonCount = 0
	self.list = self
	f25_local0[#f25_local0 + 1] = {
		type = "UIElement",
		id = "difficulty_info_text_wrapper_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = CoD.TextSettings.PopupFont.Height * 2,
				left = 12,
				right = -12
			}
		},
		children = {
			{
				type = "UIText",
				id = "difficulty_info_text_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 0,
						bottom = CoD.TextSettings.PopupFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.PopupFont.Font,
						color = Colors.h1.light_grey,
						alignment = LUI.AdjustAlignmentForLanguage( f25_arg0.message_text_alignment )
					}
				},
				handlers = {
					update_info_text = function ( f26_arg0, f26_arg1 )
						f26_arg0:setText( f26_arg1.message_text )
					end
				}
			}
		}
	}
	for f25_local7, f25_local8 in pairs( CoD.DifficultyList ) do
		f25_local0[#f25_local0 + 1] = {
			type = "UIGenericButton",
			id = "difficulty_button_" .. f25_local7 .. "_id",
			listDefaultFocus = f25_local8.value == Engine.GetDvarInt( "g_gameskill" ),
			audio = {
				button_over = CoD.SFX.SubMenuMouseOver
			},
			properties = {
				button_text = f25_local8.text,
				button_action_func = function ( f27_arg0, f27_arg1 )
					DebugPrint( "setting player 1 & 2 difficulty to " .. f25_local8.value )
					Engine.SetDvarInt( "g_gameskill_player_1", f25_local8.value )
					Engine.SetDvarInt( "g_gameskill_player_2", f25_local8.value )
					Engine.SetDvarInt( "g_gameskill", f25_local8.value )
					if not Engine.GetDvarBool( "arcademode" ) then
						Engine.Exec( "profile_difficultySave " .. f25_local8.value )
						Engine.Exec( "updategamerprofile" )
					end
					if f25_arg0.acceptFunc then
						f25_arg0.acceptFunc( f27_arg0, f27_arg1 )
					end
				end,
				text_align_without_content = LUI.Alignment.Center,
				fade_in = GenericPopupAnimationSettings.Buttons.DelayIn,
				parent_popup = nil,
				button_over_func = function ( f28_arg0, f28_arg1 )
					local f28_local0 = f28_arg0:getParent()
					f28_local0:dispatchEventToChildren( {
						name = "update_info_text",
						message_text = f25_local8.description
					} )
				end
			}
		}
	end
	return f25_local0
end

function difficulty_selection_menu( f29_arg0, f29_arg1 )
	if not f29_arg1 then
		f29_arg1 = {}
	end
	f29_arg1.message_text_alignment = LUI.Alignment.Center
	f29_arg1.popup_title = Engine.Localize( "MENU_SELECT_DIFFICULTY" )
	f29_arg1.message_text = Engine.Localize( "MENU_WARNING_CHECKPOINT_RESET2" )
	f29_arg1.message_text_alignment = LUI.Alignment.Center
	f29_arg1.padding_top = 25
	f29_arg1.default_focus_index = Engine.GetDvarInt( "g_gameskill" )
	f29_arg1.popup_childfeeder = difficulty_childfeeder
	local f29_local0 = f29_arg1.popup_list_spacing
	if not f29_local0 then
		f29_local0 = H1MenuDims.spacing
	end
	f29_arg1.popup_list_spacing = f29_local0
	f29_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", f29_arg1 )
	f29_local0:registerAnimationState( "default", CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	f29_local0:registerEventHandler( "menu_create", function ( element, event )
		element:clearSavedState()
	end )
	return f29_local0
end

function leaderboard_fetching_data( f31_arg0, f31_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_waiting_popup", {
		popup_title = Engine.Localize( "@LUA_MENU_LEADERBOARD_REFRESH" ),
		button_text = Engine.Localize( "@MENU_CANCEL" ),
		cancel_will_close = false,
		padding_top = 30,
		popup_list_spacing = 30,
		confirmation_action = function ( f32_arg0, f32_arg1 )
			LUI.FlowManager.RequestLeaveMenuByName( "leaderboard_fetching_data" )
			LUI.FlowManager.RequestLeaveMenuByName( "sp_leaderboard_data" )
		end
		
	} )
end

function request_generic_confirmation_popup( f33_arg0, f33_arg1 )
	local f33_local0 = assert
	local f33_local1 = f33_arg1
	local f33_local2 = f33_arg1.popup_title
	if f33_local2 then
		f33_local2 = f33_local1 and f33_arg1.message_text
	end
	f33_local0( f33_local2 )
	f33_local0 = {
		popup_title = Engine.Localize( f33_arg1.popup_title ),
		message_text = Engine.Localize( f33_arg1.message_text ),
		button_text = Engine.Localize( f33_arg1.button_text or "@MENU_OK" )
	}
	f33_local2 = f33_arg1.confirmation_action
	if not f33_local2 then
		f33_local2 = MBh.LeaveMenu()
	end
	f33_local0.confirmation_action = f33_local2
	f33_local0.cancel_will_close = f33_arg1.cancel_will_close
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", f33_local0 )
end

LUI.MenuBuilder.registerPopupType( "resume_game_menu", resume_game_menu )
LUI.MenuBuilder.registerPopupType( "resume_newgame_menu", resume_newgame_menu )
LUI.MenuBuilder.registerPopupType( "no_profile_warning_level_select_menu", no_profile_warning_level_select_menu )
LUI.MenuBuilder.registerPopupType( "recommend_mp_menu", recommend_mp_menu )
LUI.MenuBuilder.registerPopupType( "xenon_disc_dlc_menu", xenon_disc_dlc_menu )
LUI.MenuBuilder.registerPopupType( "xenon_damaged_disc2_content_menu", xenon_damaged_disc2_content_menu )
LUI.MenuBuilder.registerPopupType( "xenon_gamesondemand_install_menu", xenon_gamesondemand_install_menu )
LUI.MenuBuilder.registerPopupType( "xenon_gamesondemand_isdownloading_menu", xenon_gamesondemand_isdownloading_menu )
LUI.MenuBuilder.registerPopupType( "overwrite_warning_menu", overwrite_warning_menu )
LUI.MenuBuilder.registerPopupType( "request_yesno_popup_generic", request_yesno_popup_generic )
LUI.MenuBuilder.registerPopupType( "request_generic_confirmation_popup", request_generic_confirmation_popup )
LUI.MenuBuilder.registerPopupType( "no_profile_warning_newgame", no_profile_warning_newgame )
LUI.MenuBuilder.registerPopupType( "popmenu_autosave_warning", popmenu_autosave_warning )
LUI.MenuBuilder.registerPopupType( "save_corrupted", save_corrupted )
LUI.MenuBuilder.registerPopupType( "not_signed_in_warning", not_signed_in_warning )
LUI.MenuBuilder.registerPopupType( "speech_reduced", speech_reduced )
LUI.MenuBuilder.registerPopupType( "campaign_arcade_cheat_unlocked", campaign_arcade_cheat_unlocked )
LUI.MenuBuilder.registerPopupType( "difficulty_selection_menu", difficulty_selection_menu )
LUI.MenuBuilder.registerPopupType( "leaderboard_fetching_data", leaderboard_fetching_data )
LockTable( _M )
