local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 0.58
f0_local1 = 0.6
f0_local2 = 23
local f0_local3 = 0
local f0_local4 = PauseMenuAnimationSettings.MapGlitch.DurationIn / 7
local f0_local5 = false
local f0_local6 = false
local f0_local7 = {
	Styles = {
		Minimap = {
			Top = 155.66 - DesignGridDims.vert_gutter + f0_local3,
			Right = DesignGridDims.horz_gutter - 54.66,
			BackgroundWidth = 208,
			BackgroundHeight = 208,
			Width = 178,
			Height = 178,
			StretchingAnim = false
		},
		MapInfos = {
			Top = 6 + f0_local3,
			Right = DesignGridDims.horz_gutter - 71,
			Spacing = 20
		},
		ObjectiveBox = {
			Top = 118.66 - DesignGridDims.vert_gutter + f0_local3,
			Left = GenericMenuDims.menu_width_standard + 122
		},
		ObjectiveBar = {
			Height = 3,
			Left = -2
		},
		ObjectiveTitle = {
			Top = 7 + f0_local3
		},
		ObjectiveList = {
			Top = 38.16 + f0_local2 + f0_local3,
			Left = 19,
			Spacing = 20
		}
	},
	FirstOpening = false
}
function closePauseMenu( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetLuiRoot()
	local f1_local1 = f1_local0:getFirstDescendentById( "sp_pause_menu_container" )
	f1_local1:animateInSequence( {
		{
			"default",
			PauseMenuAnimationSettings.Background.DelayOut
		},
		{
			"out",
			PauseMenuAnimationSettings.Background.DurationOut
		}
	} )
	local f1_local2 = f1_local1.subContainer
	f1_local2:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f1_local2:animateInSequence( {
		{
			"default",
			PauseMenuAnimationSettings.SubContainer.DelayOut
		},
		{
			"hidden",
			PauseMenuAnimationSettings.SubContainer.DurationOut
		}
	} )
end

function closePauseMenuInternal( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestCloseAllMenus( f2_arg0 )
	Engine.TogglePause()
	f2_arg0:dispatchEventToRoot( {
		name = "toggle_pause_off"
	} )
	f0_local6 = false
end

function backAction( f3_arg0, f3_arg1 )
	Engine.PlaySound( CoD.SFX.PauseMenuResume )
	closePauseMenu( f3_arg0, f3_arg1 )
end

function canChangeDifficulty()
	if Engine.GetDvarBool( "arcademode" ) then
		return false
	end
	local f4_local0 = Engine.GetDvarString( "mapname" )
	local f4_local1
	if f4_local0 == "killhouse" or f4_local0 == "coup" or f4_local0 == "aftermath" then
		f4_local1 = false
	else
		f4_local1 = true
	end
	return f4_local1
end

function canShowMinimap()
	local f5_local0 = Engine.GetDvarString( "mapname" )
	local f5_local1
	if f5_local0 == "coup" or f5_local0 == "ac130" or f5_local0 == "aftermath" or f5_local0 == "jeepride" or f5_local0 == "airplane" or f5_local0 == "simplecredits" then
		f5_local1 = false
	else
		f5_local1 = true
	end
	return f5_local1
end

function getRelativeDelay( f6_arg0 )
	local f6_local0 = f0_local7.FirstOpening and PauseMenuAnimationSettings.Background.DurationIn or 0
	local f6_local1 = f6_local0 + f6_arg0
	return f6_local0
end

function QuitCreditsYesAction( f7_arg0, f7_arg1 )
	Engine.SetDvarInt( "credits_active", 0 )
	Engine.SetDvarInt( "ui_play_credits", 0 )
	Engine.Exec( "disconnect" )
end

function QuitCreditsConfirmPopup( f8_arg0, f8_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@PLATFORM_QUIT" ),
		message_text = Engine.Localize( "@MENU_QUIT_WARNING" ),
		yes_action = QuitCreditsYesAction,
		yes_text = Engine.Localize( "@MENU_QUIT" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function LowerDifficultyYesAction( f9_arg0, f9_arg1 )
	local f9_local0 = Engine.GetDvarInt( "g_gameskill" )
	if f9_local0 > 0 then
		local f9_local1 = f9_local0 - 1
		Engine.ExecNow( "profile_difficultySave " .. f9_local1 )
		Engine.SetDvarInt( "g_gameskill", f9_local1 )
		Engine.SetDvarInt( "g_gameskill_player_1", f9_local1 )
		Engine.SetDvarInt( "g_gameskill_player_2", f9_local1 )
		Engine.Exec( "updategamerprofile" )
	end
	closePauseMenu( f9_arg0, f9_arg1 )
end

function LowerDifficultyConfirmPopup10( f10_arg0, f10_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_LOWER_DIFFICULTY" ),
		message_text = Engine.Localize( "@MENU_LOWER_DIFFICULTY_1_0" ),
		yes_action = LowerDifficultyYesAction,
		yes_text = Engine.Localize( "@MENU_LOWER_DIFFICULTY_1_0_BUTTON" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function LowerDifficultyConfirmPopup21( f11_arg0, f11_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_LOWER_DIFFICULTY" ),
		message_text = Engine.Localize( "@MENU_LOWER_DIFFICULTY_2_1" ),
		yes_action = LowerDifficultyYesAction,
		yes_text = Engine.Localize( "@MENU_LOWER_DIFFICULTY_2_1_BUTTON" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function LowerDifficultyConfirmPopup32( f12_arg0, f12_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_LOWER_DIFFICULTY" ),
		message_text = Engine.Localize( "@MENU_LOWER_DIFFICULTY_3_2" ),
		yes_action = LowerDifficultyYesAction,
		yes_text = Engine.Localize( "@MENU_LOWER_DIFFICULTY_3_2_BUTTON" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

local f0_local8 = function ( f13_arg0, f13_arg1 )
	closePauseMenuInternal( f13_arg0, f13_arg1 )
	Engine.SetDvarFloat( "ui_securing_progress", 0 )
	Engine.SetDvarString( "ui_securing", "" )
	Engine.Exec( "loadgame_continue_missionfailed" )
end

function LastCheckpointConfirmPopup( f14_arg0, f14_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_LAST_CHECKPOINT" ),
		message_text = Engine.Localize( "@MENU_SP_LAST_CHECKPOINT_CONFIRMATION" ),
		callback_params = {
			saveToSlot = -1
		},
		yes_action = f0_local8,
		yes_text = Engine.Localize( "@LUA_MENU_YES" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

local f0_local9 = function ( f15_arg0, f15_arg1 )
	closePauseMenuInternal( f15_arg0, f15_arg1 )
	Engine.Exec( "stopControllerRumble" )
	if Engine.GetDvarBool( "arcademode" ) then
		local f15_local0 = Engine.GetDvarString( "mapname" )
		Engine.StreamingInstallMap( f15_local0, "devmap " .. f15_local0 )
	else
		Engine.Exec( "fast_restart" )
	end
end

function RestartMissionConfirmPopup( f16_arg0, f16_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_RESTART_MISSION" ),
		message_text = Engine.Localize( "@MENU_RESTART_TEXT_1" ),
		yes_action = f0_local9,
		yes_text = Engine.Localize( "@MENU_RESTART_MISSION" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" )
	} )
end

function tryFollowInvite( f17_arg0, f17_arg1 )
	if Friends.HasPartyGameInvite() then
		LUI.FlowManager.RequestAddMenu( nil, "live_party_invite_popmenu", true, f17_arg1.controller )
	end
end

function OnObjectivesCreate( f18_arg0, f18_arg1 )
	if Engine.GetDvarBool( "hud_showObjectives" ) == false or Engine.GetDvarBool( "credits_active" ) then
		f18_arg0:animateToState( "hidden", 0 )
	end
end

function OnMissionObjectiveBarCreate( f19_arg0, f19_arg1 )
	local f19_local0 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.MissionsObjectiveLine.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.MissionsObjectiveLine.DurationIn,
			false,
			true
		}
	} )
	f19_local0( f19_arg0 )
end

function OnMissionObjectiveHeaderCreate( f20_arg0, f20_arg1 )
	local f20_local0 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.MissionsObjectiveTitle.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.MissionsObjectiveTitle.DurationIn,
			false,
			true
		}
	} )
	f20_local0( f20_arg0 )
end

function OnMissionObjectiveListCreate( f21_arg0, f21_arg1 )
	local f21_local0 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.MissionsObjectiveList.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.MissionsObjectiveList.DurationIn,
			false,
			true
		}
	} )
	f21_local0( f21_arg0 )
end

function OnLuaMissionObjectiveListCreate( f22_arg0, f22_arg1 )
	local f22_local0 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.MissionsObjectiveList.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.MissionsObjectiveList.DurationIn,
			false,
			true
		}
	} )
	f22_local0( f22_arg0 )
end

function AddObjectives( f23_arg0 )
	local f23_local0 = Engine.GetPauseMenuObjectives()
	if #f23_local0 == 0 then
		return 
	end
	local f23_local1 = f0_local1
	local f23_local2 = f0_local0
	if Engine.IsCurrentGen() then
		f23_local1 = 1
		f23_local2 = 0.8
	end
	local f23_local3 = CoD.CreateState( f0_local7.Styles.ObjectiveBox.Left, f0_local7.Styles.ObjectiveBox.Top, nil, nil, CoD.AnchorTypes.TopLeft )
	f23_local3.width = 775
	f23_local3.height = 600
	f23_local3.alpha = 1
	local self = LUI.UIElement.new( f23_local3 )
	self.id = "missionObjectiveBoxId"
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "menu_create", OnObjectivesCreate )
	local f23_local5 = CoD.CreateState( 0, f0_local7.Styles.ObjectiveTitle.Top, nil, nil, CoD.AnchorTypes.TopLeft )
	f23_local5.alignment = LUI.Alignment.Left
	f23_local5.font = CoD.TextSettings.TitleFontSmall.Font
	f23_local5.color = Colors.h1.light_grey
	f23_local5.alpha = 1
	local f23_local6 = LUI.MenuBuilder.BuildRegisteredType( "UIOwnerdraw", {
		ownerDraw = CoD.Ownerdraw.CGMissionObjectiveHeader,
		ownerDrawTextScale = f23_local2,
		defAnimState = f23_local5
	} )
	f23_local6.id = "missionObjectiveHeaderId"
	f23_local6:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f23_local6:registerEventHandler( "menu_create", OnMissionObjectiveHeaderCreate )
	self:addElement( f23_local6 )
	local f23_local7 = 9
	local f23_local8 = 18
	local f23_local9 = 10.66
	local f23_local10 = 27
	local f23_local11 = {
		[0] = Colors.white,
		[1] = Colors.h1.light_grey,
		[2] = Colors.white,
		[3] = Colors.grey_4,
		[4] = Colors.h1.yellow,
		[5] = Colors.white
	}
	local f23_local12 = CoD.CreateState( f0_local7.Styles.ObjectiveList.Left + f23_local9 + f23_local7, f0_local7.Styles.ObjectiveList.Top - CoD.TextSettings.BodyFontSmall.Height / 2 - f23_local9 / 2, 500, CoD.TextSettings.BodyFontSmall.Height, CoD.AnchorTypes.TopLeft )
	f23_local12.spacing = f23_local8
	local self = LUI.UIVerticalList.new( f23_local12 )
	local f23_local14 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f23_local14.width = 500
	f23_local14.height = CoD.TextSettings.BodyFontSmall.Height
	f23_local14.horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft
	f23_local14.alpha = 1
	f23_local14.font = CoD.TextSettings.BodyFontSmall.Font
	local f23_local15 = CoD.CreateState( -(f23_local9 + f23_local7), 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f23_local15.width = f23_local9
	f23_local15.height = f23_local9
	if f23_local0 then
		for f23_local16 = 1, #f23_local0, 1 do
			if f23_local0[f23_local16] ~= nil then
				f23_local14.color = f23_local11[f23_local0[f23_local16].state]
				f23_local14.left = f23_local0[f23_local16].indentLevel * f23_local10
				local self = LUI.UIText.new( f23_local14 )
				self.id = "objective" .. f23_local16
				self.properties = {
					text = "",
					textStyle = CoD.TextStyle.Shadowed
				}
				self:setText( f23_local0[f23_local16].name )
				self:registerAnimationState( "hidden", {
					alpha = 0
				} )
				self:registerEventHandler( "menu_create", OnLuaMissionObjectiveListCreate )
				if f23_local0[f23_local16].iconMaterial ~= nil then
					f23_local15.width = f23_local15.height * Engine.GetMaterialAspectRatio( f23_local0[f23_local16].iconMaterial )
					f23_local15.material = f23_local0[f23_local16].iconMaterial
					f23_local15.color = f23_local11[f23_local0[f23_local16].state]
					local self = LUI.UIImage.new( f23_local15 )
					self.id = "objectiveIcon" .. f23_local16
					self:registerAnimationState( "hidden", {
						alpha = 0
					} )
					self:addElement( self )
				end
				self:addElement( self )
			end
		end
	end
	self:addElement( self )
	f23_arg0:addElement( self )
end

function OnMiniMapBGCreate( f24_arg0, f24_arg1 )
	local f24_local0 = Engine.GetDvarBool( "compass" )
	if f24_local0 then
		f24_local0 = Engine.GetDvarBool( "hud_drawHud" )
	end
	if not f24_local0 then
		f24_arg0:animateToState( "hidden", 0 )
	else
		
	end
end

function OnMiniMapCreate( f25_arg0, f25_arg1 )
	local f25_local0 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.Background.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.Background.DurationIn,
			false,
			true
		}
	} )
	f25_local0( f25_arg0 )
end

function OnMiniMapOverlayCreate( f26_arg0, f26_arg1 )
	local f26_local0 = 33
	local f26_local1 = f26_arg0
	local f26_local2 = f26_arg0.animateInLoop
	local f26_local3 = {
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f26_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f26_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f26_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f26_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f26_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f26_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f26_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f26_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f26_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f26_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f26_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f26_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f26_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f26_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f26_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f26_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f26_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f26_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f26_local0,
			false,
			false
		}
	}
	local f26_local4 = {
		"rot_270",
		0,
		false,
		false
	}
	local f26_local5 = {
		"rot_270",
		f26_local0,
		false,
		false
	}
	local f26_local6 = {
		"rot_180",
		0,
		false,
		false
	}
	local f26_local7 = {
		"rot_180",
		f26_local0,
		false,
		false
	}
	local f26_local8 = {
		"rot_90",
		0,
		false,
		false
	}
	local f26_local9 = {
		"rot_90",
		f26_local0,
		false,
		false
	}
	local f26_local10 = {
		"rot_180",
		0,
		false,
		false
	}
	local f26_local11 = {
		"rot_180",
		f26_local0,
		false,
		false
	}
	local f26_local12 = {
		"default",
		0,
		false,
		false
	}
	local f26_local13 = {
		"default",
		f26_local0,
		false,
		false
	}
	local f26_local14 = {
		"rot_90",
		0,
		false,
		false
	}
	local f26_local15 = {
		"rot_90",
		f26_local0,
		false,
		false
	}
	local f26_local16 = {
		"rot_270",
		0,
		false,
		false
	}
	local f26_local17 = {
		"rot_270",
		f26_local0,
		false,
		false
	}
	f26_local3[33] = f26_local4
	f26_local3[34] = f26_local5
	f26_local3[35] = f26_local6
	f26_local3[36] = f26_local7
	f26_local3[37] = f26_local8
	f26_local3[38] = f26_local9
	f26_local3[39] = f26_local10
	f26_local3[40] = f26_local11
	f26_local3[41] = f26_local12
	f26_local3[42] = f26_local13
	f26_local3[43] = f26_local14
	f26_local3[44] = f26_local15
	f26_local3[45] = f26_local16
	f26_local3[46] = f26_local17
	f26_local2( f26_local1, f26_local3, nil, nil, true )
end

function OnMiniMapGlitchCreate( f27_arg0, f27_arg1 )
	f27_arg0:animateInLoop( {
		{
			"default",
			0,
			false,
			false
		},
		{
			"wait",
			PauseMenuAnimationSettings.MapGlitch.DelayIn,
			false,
			false
		},
		{
			"opacity50_rot0",
			f0_local4,
			false,
			false
		},
		{
			"opacity50_rot180",
			0,
			false,
			false
		},
		{
			"opacity50_rot180",
			f0_local4,
			false,
			false
		},
		{
			"opacity50_rot0",
			0,
			false,
			false
		},
		{
			"opacity50_rot0",
			f0_local4,
			false,
			false
		},
		{
			"opacity50_rot180",
			0,
			false,
			false
		},
		{
			"opacity50_rot180",
			f0_local4,
			false,
			false
		},
		{
			"opacity50_rot0",
			0,
			false,
			false
		},
		{
			"opacity50_rot0",
			f0_local4,
			false,
			false
		},
		{
			"opacity50_rot180",
			0,
			false,
			false
		},
		{
			"opacity50_rot180",
			f0_local4,
			false,
			false
		}
	}, nil, nil, true, true )
end

function OnStartGlitchWhiteSquare( f28_arg0, f28_arg1 )
	f28_arg0:animateInSequence( {
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f0_local4,
			false,
			false
		},
		{
			"opacity10",
			f0_local4,
			false,
			false
		},
		{
			"default",
			f0_local4,
			false,
			false
		},
		{
			"default",
			f0_local4 * 4,
			false,
			false
		}
	}, nil, true )
end

function OnStartGlitchBlackSquare( f29_arg0, f29_arg1 )
	f29_arg0:animateInSequence( {
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f0_local4 * 4,
			false,
			false
		},
		{
			"opacity15",
			f0_local4,
			false,
			false
		},
		{
			"default",
			f0_local4,
			false,
			false
		},
		{
			"default",
			f0_local4,
			false,
			false
		}
	}, nil, true )
end

function AddMiniMap( f30_arg0 )
	local f30_local0 = CoD.CreateState( nil, f0_local7.Styles.Minimap.Top, f0_local7.Styles.Minimap.Right, nil, CoD.AnchorTypes.TopRight )
	f30_local0.width = f0_local7.Styles.Minimap.BackgroundWidth
	f30_local0.height = f0_local7.Styles.Minimap.BackgroundHeight
	f30_local0.alpha = 1
	f30_local0.material = RegisterMaterial( "h1_bg_map" )
	local self = LUI.UIImage.new( f30_local0 )
	self.id = "map_mini_bg"
	f30_local0.material = nil
	f30_local0.right = f0_local7.Styles.Minimap.Right - f0_local7.Styles.Minimap.BackgroundWidth
	f30_local0.width = 0
	f30_local0.height = 0
	f30_local0.alpha = 0
	self:registerAnimationState( "hidden", f30_local0 )
	f30_local0.right = f0_local7.Styles.Minimap.Right - f0_local7.Styles.Minimap.BackgroundWidth * 0.75
	f30_local0.width = f0_local7.Styles.Minimap.BackgroundWidth * 0.25
	f30_local0.height = f0_local7.Styles.Minimap.BackgroundHeight * 0.7
	f30_local0.alpha = 0.5
	self:registerAnimationState( "animation_state_1", f30_local0 )
	f30_local0.right = f0_local7.Styles.Minimap.Right - f0_local7.Styles.Minimap.BackgroundWidth * 0.3
	f30_local0.width = f0_local7.Styles.Minimap.BackgroundWidth * 0.7
	f30_local0.height = f0_local7.Styles.Minimap.BackgroundHeight * 0.9
	f30_local0.alpha = 0.8
	self:registerAnimationState( "animation_state_2", f30_local0 )
	f30_local0.right = f0_local7.Styles.Minimap.Right + f0_local7.Styles.Minimap.BackgroundWidth * 0.02
	f30_local0.width = f0_local7.Styles.Minimap.BackgroundWidth * 1.02
	f30_local0.height = f0_local7.Styles.Minimap.BackgroundHeight * 1.02
	f30_local0.alpha = 1
	self:registerAnimationState( "animation_state_3", f30_local0 )
	f30_local0.top = f0_local7.Styles.Minimap.Top + f0_local7.Styles.Minimap.BackgroundHeight / 2
	f30_local0.right = f0_local7.Styles.Minimap.Right
	f30_local0.width = f0_local7.Styles.Minimap.BackgroundWidth
	f30_local0.height = 0
	f30_local0.alpha = 0
	self:registerAnimationState( "hidden_anim_stretching", f30_local0 )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerEventHandler( "menu_create", OnMiniMapBGCreate )
	f30_arg0:addElement( self )
	local f30_local2 = LUI.MenuBuilder.BuildRegisteredType( "UIMinimap", {
		compassType = CoD.CompassType.Partial,
		defAnimState = {
			width = f0_local7.Styles.Minimap.Width,
			height = f0_local7.Styles.Minimap.Height,
			alpha = 1
		}
	} )
	f30_local2.id = "map_mini_id"
	f30_local2:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f30_local2:registerEventHandler( "menu_create", OnMiniMapCreate )
	self:addElement( f30_local2 )
	local f30_local3 = LUI.MenuBuilder.BuildRegisteredType( "UIMinimapIcons", {
		compassType = CoD.CompassType.Partial,
		defAnimState = {
			topAnchor = true,
			rightAnchor = true,
			width = f0_local7.Styles.Minimap.Width,
			height = f0_local7.Styles.Minimap.Height,
			alpha = 1
		}
	} )
	f30_local3.id = "map_mini_icons_id"
	f30_local3:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f30_local3.properties = {
		drawPlayer = true,
		drawObjectives = false
	}
	f30_local3:setUseStencil( true )
	f30_local2:addElement( f30_local3 )
	f30_local3.mapBlipPulse = LUI.MapBlipPulse.new( f30_local3 )
	local f30_local4 = Engine.GetPlayerObjectivePositions( f0_local7.Styles.Minimap.Width / 1.5, f0_local7.Styles.Minimap.Height / 1.5 )
	if f30_local4 then
		for f30_local5 = 1, #f30_local4, 1 do
			f30_local3.mapBlipPulse:addPulse( {
				name = "objective_" .. f30_local5,
				posX = f30_local4[f30_local5].x * 1.5,
				posY = f30_local4[f30_local5].y * 1.5,
				anchor = CoD.AnchorTypes.None
			} )
		end
	end
	local f30_local5 = {
		width = f0_local7.Styles.Minimap.Width,
		height = f0_local7.Styles.Minimap.Height,
		material = RegisterMaterial( "h1_deco_map_glitch_01" ),
		alpha = 0.1,
		zRot = 0
	}
	local self = LUI.UIImage.new( f30_local5 )
	self.id = "map_overlay_id"
	f30_local5.zRot = -90
	self:registerAnimationState( "rot_90", f30_local5 )
	f30_local5.zRot = -180
	self:registerAnimationState( "rot_180", f30_local5 )
	f30_local5.zRot = -270
	self:registerAnimationState( "rot_270", f30_local5 )
	self:registerEventHandler( "menu_create", OnMiniMapOverlayCreate )
	f30_local2:addElement( self )
	local f30_local7 = {
		width = f0_local7.Styles.Minimap.Width,
		height = f0_local7.Styles.Minimap.Height,
		material = RegisterMaterial( "h1_deco_map_glitch_02" ),
		alpha = 0,
		zRot = 0
	}
	local self = LUI.UIImage.new( f30_local7 )
	self.id = "map_glitch_id"
	self:registerAnimationState( "wait", {
		alpha = 0
	} )
	f30_local7.alpha = 0.25
	self:registerAnimationState( "opacity50_rot0", f30_local7 )
	f30_local7.zRot = 180
	self:registerAnimationState( "opacity50_rot180", f30_local7 )
	self:registerEventHandler( "menu_create", OnMiniMapGlitchCreate )
	self:registerEventHandler( "transition_step_complete_wait", function ( element, event )
		local f31_local0 = element:getParent()
		f31_local0:dispatchEventToChildren( {
			name = "startGlitch"
		} )
	end )
	f30_local2:addElement( self )
	local f30_local9 = {
		width = f0_local7.Styles.Minimap.Width,
		height = f0_local7.Styles.Minimap.Height,
		material = RegisterMaterial( "white" ),
		alpha = 0
	}
	local self = LUI.UIImage.new( f30_local9 )
	self.id = "map_white_square_id"
	f30_local9.alpha = 0.75
	self:registerAnimationState( "opacity10", f30_local9 )
	self:registerEventHandler( "startGlitch", OnStartGlitchWhiteSquare )
	f30_local2:addElement( self )
	local f30_local11 = {
		width = f0_local7.Styles.Minimap.Width,
		height = f0_local7.Styles.Minimap.Height,
		material = RegisterMaterial( "black" ),
		alpha = 0
	}
	local self = LUI.UIImage.new( f30_local11 )
	self.id = "map_black_square_id"
	f30_local11.alpha = 0.75
	self:registerAnimationState( "opacity15", f30_local11 )
	self:registerEventHandler( "startGlitch", OnStartGlitchBlackSquare )
	f30_local2:addElement( self )
end

function UpdateDifficultyText( f32_arg0, f32_arg1 )
	local f32_local0 = Engine.GetDvarInt( "g_gameskill" )
	f32_arg0:setText( CoD.DifficultyList[Engine.GetDvarInt( "g_gameskill" ) + 1].tipText )
	local f32_local1 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.Intel.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.Intel.DurationIn,
			false,
			true
		}
	} )
	f32_local1( f32_arg0 )
end

function OnIntelTextCreate( f33_arg0, f33_arg1 )
	if Engine.GetDvarBool( "hud_showIntel" ) == false or Engine.GetDvarBool( "credits_active" ) then
		f33_arg0:animateToState( "hidden", 0 )
	else
		local f33_local0, f33_local1 = GetIntelCount( Engine.GetDvarString( "mapname" ) )
		if f33_local0 > 0 then
			f33_arg0:setText( Engine.Localize( "@LUA_MENU_INTEL_FOUND", f33_local1, f33_local0 ) )
		end
		local f33_local2 = MBh.AnimateSequence( {
			{
				"hidden",
				0
			},
			{
				"hidden",
				PauseMenuAnimationSettings.Intel.DelayIn + 1
			},
			{
				"default",
				PauseMenuAnimationSettings.Intel.DurationIn,
				false,
				true
			}
		} )
		f33_local2( f33_arg0 )
	end
end

function AddIntelAndDifficulty( f34_arg0 )
	local f34_local0 = Engine.GetDvarString( "mapname" )
	local f34_local1 = f0_local7.Styles.ObjectiveBox.Top + f0_local7.Styles.MapInfos.Top
	if f34_local0 ~= "killhouse" and f34_local0 ~= "coup" and f34_local0 ~= "aftermath" then
		local f34_local2 = CoD.CreateState( nil, f34_local1, f0_local7.Styles.MapInfos.Right, nil, CoD.AnchorTypes.TopRight )
		f34_local2.height = CoD.TextSettings.BodyFontSmall.Height
		f34_local2.font = CoD.TextSettings.BodyFontSmall.Font
		f34_local2.color = Colors.h1.second_medium_grey
		f34_local2.alpha = 1
		local self = LUI.UIText.new( f34_local2 )
		self.id = "difficultyText"
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self:registerEventHandler( "menu_create", UpdateDifficultyText )
		f34_arg0:addElement( self )
		f34_local1 = f34_local1 + f0_local7.Styles.MapInfos.Spacing
	end
	local f34_local2 = CoD.CreateState( nil, f34_local1, f0_local7.Styles.MapInfos.Right, nil, CoD.AnchorTypes.TopRight )
	f34_local2.height = CoD.TextSettings.BodyFontSmall.Height
	f34_local2.font = CoD.TextSettings.BodyFontSmall.Font
	f34_local2.color = Colors.h1.second_medium_grey
	f34_local2.alpha = 1
	local self = LUI.UIText.new( f34_local2 )
	self.id = "intelText"
	self.properties = {
		text = "",
		textStyle = CoD.TextStyle.Shadowed
	}
	self:registerAnimationState( "not_found", {
		red = 1,
		blue = 0,
		green = 0
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "menu_create", OnIntelTextCreate )
	f34_arg0:addElement( self )
end

function BuildDefs( f35_arg0, f35_arg1 )
	for f35_local0 = 1, #f35_arg1, 1 do
		LUI.MenuBuilder.BuildAddChild( f35_arg0, f35_arg1[f35_local0] )
	end
end

function sp_pause_menu( f36_arg0, f36_arg1 )
	f0_local7.FirstOpening = LUI.PreviousMenuName == nil
	local f36_local0 = LUI.MenuTemplate.new( f36_arg0, {
		menu_title = "@LUA_MENU_PAUSED_CAPS",
		subContainer = true,
		menu_top_indent = LUI.MenuTemplate.spMenuOffset,
		delay_display = PauseMenuAnimationSettings.Background.DelayIn
	} )
	f36_local0:registerAnimationState( "out", {
		alpha = 0
	} )
	f36_local0:registerEventHandler( "transition_complete_out", function ( element, event )
		closePauseMenuInternal( element, event )
	end )
	local f36_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f36_local1.alpha = 1
	local self = LUI.UIElement.new( f36_local1 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	if not f0_local6 then
		self:animateToState( "hidden" )
	end
	self:registerEventHandler( "menu_create", MBh.AnimateToState( "default", PauseMenuAnimationSettings.Background.DurationIn ) )
	self:addElement( f36_local0 )
	local f36_local3 = Engine.GetDvarBool( "credits_active" )
	local f36_local4 = Engine.GetDvarInt( "g_gameskill" )
	local f36_local5 = true
	local f36_local6 = Engine.IsSaveAvailable()
	if f36_local3 then
		f36_local0:AddButton( "@MENU_RESUME_CREDITS", closePauseMenu, nil, nil, nil )
	else
		local f36_local7 = f36_local0:AddButton( "@MENU_RESUMEGAME", closePauseMenu, nil, nil, nil )
		f36_local7:setActionSFX( CoD.SFX.PauseMenuResume )
	end
	if not Engine.IsMultiplayer() and not Engine.GetDvarBool( "limited_mode" ) and not f36_local3 then
		f36_local0:AddButton( "@MENU_INTEL", "intel_menu", Engine.GetDvarBool( "arcademode" ), nil, nil, {
			desc_text = Engine.Localize( "@LUA_MENU_INTEL_SELECT_MESSAGE" )
		} )
	end
	f36_local0:AddOptionsButton( true )
	if f36_local3 == nil or not f36_local3 then
		if f36_local4 > 0 and canChangeDifficulty() then
			local f36_local7 = {
				"LowerDifficultyConfirmPopup10",
				"LowerDifficultyConfirmPopup21",
				"LowerDifficultyConfirmPopup32"
			}
			f36_local0:AddButton( "@MENU_LOWER_DIFFICULTY", MBh.OpenMenu( f36_local7[f36_local4], false, false ), nil, nil, nil )
		end
		local f36_local7 = Engine.GetDvarString( "mapname" )
		if f36_local7 ~= "airplane" and f36_local7 ~= "coup" and f36_local7 ~= "aftermath" then
			f36_local0:AddButton( "@MENU_LAST_CHECKPOINT", MBh.OpenMenu( "LastCheckpointConfirmPopup", false, false ), Engine.GetDvarBool( "arcademode" ), nil, nil, {
				showLockOnDisable = true
			} )
		end
		f36_local0:AddButton( "@MENU_RESTART_MISSION", MBh.OpenMenu( "RestartMissionConfirmPopup", false, false ), Engine.GetDvarBool( "arcademode_full" ), nil, nil, {
			showLockOnDisable = true
		} )
		if not f36_local5 or not f36_local6 or Engine.GetDvarBool( "arcademode" ) then
			f36_local0:AddButton( "@PLATFORM_QUIT", MBh.OpenMenu( "quit_confirm_popup", false, false ), nil, nil, nil )
		else
			f36_local0:AddButton( "@PLATFORM_SAVE_AND_QUIT", MBh.OpenMenu( "save_and_quit_confirm_popup", false, false ), nil, nil, nil )
		end
	else
		f36_local0:AddButton( "@PLATFORM_QUIT", MBh.OpenMenu( "quit_confirm_popup", false, false ), nil, nil, nil )
	end
	if f0_local5 then
		local f36_local7 = CoD.CreateState( -800, 95, 0, nil, CoD.AnchorTypes.TopRight )
		f36_local7.height = 1
		f36_local7.material = RegisterMaterial( "white" )
		f36_local0.subContainer:addElement( LUI.UIImage.new( f36_local7 ) )
	end
	local f36_local7 = Engine.GetDvarString( "mapname" )
	local f36_local8 = CoD.CreateState( -500, 40, 0, nil, CoD.AnchorTypes.TopRight )
	f36_local8.alignment = LUI.Alignment.Right
	f36_local8.font = CoD.TextSettings.TitleFontSmaller.Font
	f36_local8.height = CoD.TextSettings.TitleFontSmaller.Height
	f36_local8.color = Colors.h1.light_green
	local self = LUI.UIText.new( f36_local8 )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@MENU_SP_H1_" .. Engine.ToUpperCase( f36_local7 ) ) ) )
	f36_local0.subContainer:addElement( self )
	if Engine.GetDvarBool( "hud_drawHud" ) then
		AddObjectives( f36_local0.subContainer )
	end
	if canShowMinimap() then
		AddMiniMap( f36_local0.subContainer )
	end
	if not f36_local3 then
		AddIntelAndDifficulty( f36_local0.subContainer )
	end
	if Friends.HasPartyGameInvite() then
		f36_local0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt2",
			helper_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE_ACCEPT" ),
			side = "right",
			clickable = false
		}, tryFollowInvite )
	end
	local self = LUI.UIBindButton.new()
	self.id = "inGameButtonBinds"
	self:registerEventHandler( "button_start", backAction )
	f36_local0:addElement( self )
	local f36_local11 = f36_local0:AddBackButton( backAction )
	f0_local6 = true
	return self
end

function InvertFlightControlsPopup( f38_arg0, f38_arg1 )
	local f38_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@LUA_SP_COMMON_FLIGHT_CONTROLS" ),
		message_text = Engine.Localize( "@LUA_SP_COMMON_REVERSE_FLIGHT_CONTROLS" ),
		cancel_will_close = false,
		no_action = function ( f39_arg0, f39_arg1 )
			Engine.ExecNow( "profile_toggleInvertedFlightPitch", f39_arg1.controller )
			Engine.SetDvarInt( "cl_paused", 0 )
		end,
		yes_action = function ( f40_arg0, f40_arg1 )
			Engine.SetDvarInt( "cl_paused", 0 )
		end,
		default_focus_index = 1
	} )
	f38_local0:registerEventHandler( "menu_create", function ( element, event )
		Engine.SetDvarInt( "cl_paused", 1 )
	end )
	return f38_local0
end

function flight_controls_setting_popmenu( f42_arg0, f42_arg1 )
	local f42_local0 = LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@LUA_SP_COMMON_FLIGHT_CONTROLS" ),
		message_text = Engine.Localize( "@LUA_SP_COMMON_FLIGHT_CONTROLS_OPTIONS" ),
		button_text = Engine.Localize( "@MENU_OK" ),
		confirmation_action = function ( f43_arg0, f43_arg1 )
			Engine.SetDvarInt( "cl_paused", 0 )
		end,
		default_focus_index = 1
	} )
	f42_local0:registerEventHandler( "menu_create", function ( element, event )
		Engine.SetDvarInt( "cl_paused", 1 )
	end )
	f42_local0:registerEventHandler( "popup_back", function ( element, event )
		Engine.SetDvarInt( "cl_paused", 0 )
	end )
	return f42_local0
end

LUI.MenuBuilder.registerType( "sp_pause_menu", sp_pause_menu )
LUI.MenuBuilder.registerPopupType( "InvertFlightControlsPopup", InvertFlightControlsPopup )
LUI.MenuBuilder.registerPopupType( "QuitCreditsConfirmPopup", QuitCreditsConfirmPopup )
LUI.MenuBuilder.registerPopupType( "LowerDifficultyConfirmPopup10", LowerDifficultyConfirmPopup10 )
LUI.MenuBuilder.registerPopupType( "LowerDifficultyConfirmPopup21", LowerDifficultyConfirmPopup21 )
LUI.MenuBuilder.registerPopupType( "LowerDifficultyConfirmPopup32", LowerDifficultyConfirmPopup32 )
LUI.MenuBuilder.registerPopupType( "LastCheckpointConfirmPopup", LastCheckpointConfirmPopup )
LUI.MenuBuilder.registerPopupType( "RestartMissionConfirmPopup", RestartMissionConfirmPopup )
LUI.MenuBuilder.registerPopupType( "flight_controls_setting_popmenu", flight_controls_setting_popmenu )
LockTable( _M )
