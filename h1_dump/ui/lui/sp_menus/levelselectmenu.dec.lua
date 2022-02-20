local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.LevelSelect = InheritFrom( LUI.MenuTemplate )
f0_local0 = false
f0_local1 = Engine.GetDvarBool( "ship_progression_cheat" )
f0_local2 = false
local f0_local3 = false
local f0_local4 = false
local f0_local5 = GenericMenuDims.menu_left
local f0_local6 = GenericMenuDims.menu_right_standard + 150
local f0_local7 = 120
local f0_local8 = "level_select_"
local f0_local9 = "level_select_container_id_"
local f0_local10 = 1
local f0_local11 = false
local f0_local12 = 150
local f0_local13 = 500
local f0_local14 = 500
local f0_local15 = 500
local f0_local16 = 1500
local f0_local17 = -1
local f0_local18 = CoD.TextSettings.Font21
local f0_local19 = CoD.TextSettings.Font21
local f0_local20 = CoD.TextSettings.BodyFont18
if Engine.IsDevelopmentBuild() then
	f0_local0 = true
end
function LoadFullArcadeMode( f1_arg0, f1_arg1 )
	Engine.SetDvarBool( "arcademode_full", true )
	LUI.ComScore.LogStartCampaign( f1_arg1.controller )
	LUI.FlowManager.PushMenuStackToDVar()
	Engine.StreamingInstallMap( "cargoship", "devmap cargoship" )
end

function StartFullArcadeMode( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestAddMenu( f2_arg0, "difficulty_selection_menu", true, f2_arg1.controller, false, {
		acceptFunc = LoadFullArcadeMode
	} )
end

local f0_local21 = {
	{
		loc_string = "@MENU_SP_H1_PROLOGUE",
		actName = "h1_prologue",
		mapInfoList = {
			{
				mapName = "killhouse",
				levelNumber = 1,
				levelTitle = "KILLHOUSE",
				menuTitle = "@MENU_SP_H1_KILLHOUSE",
				menuDesc = Engine.Localize( "@MENU_SP_H1_KILLHOUSE_DESC" ),
				narativeLevel = true,
				locationImage = "h1_minimap_prologue_m1_fng",
				blipPosX = 90,
				blipPosY = 103,
				challenge = "LB_TIMETRIAL_FNG",
				challengeName = "@MENU_SP_H1_KILLHOUSE_TIMETRIAL",
				storyChallenge = true
			},
			{
				mapName = "cargoship",
				levelNumber = 2,
				levelTitle = "CARGOSHIP",
				menuTitle = "@MENU_SP_H1_CARGOSHIP",
				menuDesc = Engine.Localize( "@MENU_SP_H1_CARGOSHIP_DESC" ),
				intel = {
					4,
					5
				},
				locationImage = "h1_minimap_prologue_m2_crewexpandable",
				blipPosX = 65,
				blipPosY = 72,
				challenge = "LB_AM_CARGOSHIP",
				challengeName = "@MENU_SP_H1_CARGOSHIP"
			},
			{
				mapName = "coup",
				levelNumber = 3,
				levelTitle = "COUP",
				menuTitle = "@MENU_SP_H1_COUP",
				menuDesc = Engine.Localize( "@MENU_SP_H1_COUP_DESC" ),
				narativeLevel = true,
				locationImage = "h1_minimap_act1_m3_thebog",
				blipPosX = 58,
				blipPosY = 80
			}
		}
	},
	{
		loc_string = "@MENU_SP_H1_ACT1",
		actName = "h1_act1",
		mapInfoList = {
			{
				mapName = "blackout",
				levelNumber = 4,
				levelTitle = "BLACKOUT",
				menuTitle = "@MENU_SP_H1_BLACKOUT",
				menuDesc = Engine.Localize( "@MENU_SP_H1_BLACKOUT_DESC" ),
				intel = {
					29,
					30
				},
				locationImage = "h1_minimap_act1_m1_blackout",
				blipPosX = 70,
				blipPosY = 60,
				challenge = "LB_AM_BLACKOUT",
				challengeName = "@MENU_SP_H1_BLACKOUT"
			},
			{
				mapName = "armada",
				levelNumber = 5,
				levelTitle = "ARMADA",
				menuTitle = "@MENU_SP_H1_ARMADA",
				menuDesc = Engine.Localize( "@MENU_SP_H1_ARMADA_DESC" ),
				intel = {
					1,
					2,
					3
				},
				locationImage = "h1_minimap_act1_m2_charliedontsurf",
				blipPosX = 85,
				blipPosY = 45,
				challenge = "LB_AM_ARMADA",
				challengeName = "@MENU_SP_H1_ARMADA"
			},
			{
				mapName = "bog_a",
				levelNumber = 6,
				levelTitle = "BOG_A",
				menuTitle = "@MENU_SP_H1_BOG_A",
				menuDesc = Engine.Localize( "@MENU_SP_H1_BOG_A_DESC" ),
				intel = {
					25,
					26
				},
				locationImage = "h1_minimap_act1_m3_thebog",
				blipPosX = 60,
				blipPosY = 70,
				challenge = "LB_AM_BOG_A",
				challengeName = "@MENU_SP_H1_BOG_A"
			},
			{
				mapName = "hunted",
				levelNumber = 7,
				levelTitle = "HUNTED",
				menuTitle = "@MENU_SP_H1_HUNTED",
				menuDesc = Engine.Localize( "@MENU_SP_H1_HUNTED_DESC" ),
				intel = {
					21,
					22
				},
				locationImage = "h1_minimap_act1_m4_hunted",
				blipPosX = 65,
				blipPosY = 70,
				challenge = "LB_AM_HUNTED",
				challengeName = "@MENU_SP_H1_HUNTED"
			},
			{
				mapName = "ac130",
				levelNumber = 8,
				levelTitle = "AC130",
				menuTitle = "@MENU_SP_H1_AC130",
				menuDesc = Engine.Localize( "@MENU_SP_H1_AC130_DESC" ),
				locationImage = "h1_minimap_act1_m5_deathfromabove",
				blipPosX = 70,
				blipPosY = 55,
				challenge = "LB_AM_AC130",
				challengeName = "@MENU_SP_H1_AC130"
			},
			{
				mapName = "bog_b",
				levelNumber = 9,
				levelTitle = "BOG_B",
				menuTitle = "@MENU_SP_H1_BOG_B",
				menuDesc = Engine.Localize( "@MENU_SP_H1_BOG_B_DESC" ),
				intel = {
					11,
					12,
					13
				},
				locationImage = "h1_minimap_act1_m6_warpig",
				blipPosX = 76,
				blipPosY = 54,
				challenge = "LB_AM_BOG_B",
				challengeName = "@MENU_SP_H1_BOG_B"
			},
			{
				mapName = "airlift",
				levelNumber = 10,
				levelTitle = "AIRLIFT",
				menuTitle = "@MENU_SP_H1_AIRLIFT",
				menuDesc = Engine.Localize( "@MENU_SP_H1_AIRLIFT_DESC" ),
				intel = {
					16,
					17
				},
				locationImage = "h1_minimap_act1_m7_shockandawe",
				blipPosX = 65,
				blipPosY = 50,
				challenge = "LB_AM_AIRLIFT",
				challengeName = "@MENU_SP_H1_AIRLIFT"
			},
			{
				mapName = "aftermath",
				levelNumber = 11,
				levelTitle = "AFTERMATH",
				menuTitle = "@MENU_SP_H1_AFTERMATH",
				menuDesc = Engine.Localize( "@MENU_SP_H1_AFTERMATH_DESC" ),
				narativeLevel = true,
				locationImage = "h1_minimap_act1_m8_aftermath",
				blipPosX = 65,
				blipPosY = 50
			}
		}
	},
	{
		loc_string = "@MENU_SP_H1_ACT2",
		actName = "h1_act2",
		mapInfoList = {
			{
				mapName = "village_assault",
				levelNumber = 12,
				levelTitle = "VILLAGE_ASSAULT",
				menuTitle = "@MENU_SP_H1_VILLAGE_ASSAULT",
				menuDesc = Engine.Localize( "@MENU_SP_H1_VILLAGE_ASSAULT_DESC" ),
				intel = {
					9,
					10
				},
				locationImage = "h1_minimap_act2_m1_safehouse",
				blipPosX = 68,
				blipPosY = 58,
				challenge = "LB_AM_VILLAGE_ASSAULT",
				challengeName = "@MENU_SP_H1_VILLAGE_ASSAULT"
			},
			{
				mapName = "scoutsniper",
				levelNumber = 13,
				levelTitle = "SCOUTSNIPER",
				menuTitle = "@MENU_SP_H1_SCOUTSNIPER",
				menuDesc = Engine.Localize( "@MENU_SP_H1_SCOUTSNIPER_DESC" ),
				intel = {
					7,
					8,
					18
				},
				locationImage = "h1_minimap_act2_m2_allghilliedup",
				blipPosX = 50,
				blipPosY = 60,
				challenge = "LB_AM_SCOUTSNIPER",
				challengeName = "@MENU_SP_H1_SCOUTSNIPER"
			},
			{
				mapName = "sniperescape",
				levelNumber = 14,
				levelTitle = "SNIPERESCAPE",
				menuTitle = "@MENU_SP_H1_SNIPERESCAPE",
				menuDesc = Engine.Localize( "@MENU_SP_H1_SNIPERESCAPE_DESC" ),
				intel = {
					27,
					28
				},
				locationImage = "h1_minimap_act2_m3_oneshotonekill",
				blipPosX = 50,
				blipPosY = 65,
				challenge = "LB_AM_SNIPERESCAPE",
				challengeName = "@MENU_SP_H1_SNIPERESCAPE"
			},
			{
				mapName = "village_defend",
				levelNumber = 15,
				levelTitle = "VILLAGE_DEFEND",
				menuTitle = "@MENU_SP_H1_VILLAGE_DEFEND",
				menuDesc = Engine.Localize( "@MENU_SP_H1_VILLAGE_DEFEND_DESC" ),
				locationImage = "h1_minimap_act2_m4_heat",
				blipPosX = 68,
				blipPosY = 58,
				challenge = "LB_AM_VILLAGE_DEFEND",
				challengeName = "@MENU_SP_H1_VILLAGE_DEFEND"
			},
			{
				mapName = "ambush",
				levelNumber = 16,
				levelTitle = "AMBUSH",
				menuTitle = "@MENU_SP_H1_AMBUSH",
				menuDesc = Engine.Localize( "@MENU_SP_H1_AMBUSH_DESC" ),
				intel = {
					19,
					20
				},
				locationImage = "h1_minimap_act2_m5_thesinsofthefather",
				blipPosX = 60,
				blipPosY = 78,
				challenge = "LB_AM_AMBUSH",
				challengeName = "@MENU_SP_H1_AMBUSH"
			}
		}
	},
	{
		loc_string = "@MENU_SP_H1_ACT3",
		actName = "h1_act3",
		mapInfoList = {
			{
				mapName = "icbm",
				levelNumber = 17,
				levelTitle = "ICBM",
				menuTitle = "@MENU_SP_H1_ICBM",
				menuDesc = Engine.Localize( "@MENU_SP_H1_ICBM_DESC" ),
				intel = {
					6
				},
				locationImage = "h1_minimap_act3_m1_ultimatum",
				blipPosX = 55,
				blipPosY = 60,
				challenge = "LB_AM_ICBM",
				challengeName = "@MENU_SP_H1_ICBM"
			},
			{
				mapName = "launchfacility_a",
				levelNumber = 18,
				levelTitle = "LAUNCHFACILITY_A",
				menuTitle = "@MENU_SP_H1_LAUNCHFACILITY_A",
				menuDesc = Engine.Localize( "@MENU_SP_H1_LAUNCHFACILITY_A_DESC" ),
				intel = {
					14,
					15
				},
				locationImage = "h1_minimap_act3_m2_allin",
				blipPosX = 60,
				blipPosY = 60,
				challenge = "LB_AM_LAUNCHFACILITY_A",
				challengeName = "@MENU_SP_H1_LAUNCHFACILITY_A"
			},
			{
				mapName = "launchfacility_b",
				levelNumber = 19,
				levelTitle = "LAUNCHFACILITY_B",
				menuTitle = "@MENU_SP_H1_LAUNCHFACILITY_B",
				menuDesc = Engine.Localize( "@MENU_SP_H1_LAUNCHFACILITY_B_DESC" ),
				intel = {
					23,
					24
				},
				locationImage = "h1_minimap_act3_m3_nofightinginthewarroom",
				blipPosX = 60,
				blipPosY = 60,
				challenge = "LB_AM_LAUNCHFACILITY_B",
				challengeName = "@MENU_SP_H1_LAUNCHFACILITY_B"
			},
			{
				mapName = "jeepride",
				levelNumber = 20,
				levelTitle = "JEEPRIDE",
				menuTitle = "@MENU_SP_H1_JEEPRIDE",
				menuDesc = Engine.Localize( "@MENU_SP_H1_JEEPRIDE_DESC" ),
				locationImage = "h1_minimap_act3_m4_gameover",
				blipPosX = 80,
				blipPosY = 30,
				challenge = "LB_AM_JEEPRIDE",
				challengeName = "@MENU_SP_H1_JEEPRIDE"
			}
		}
	},
	{
		loc_string = "@MENU_SP_H1_EPILOGUE",
		actName = "h1_epilogue",
		mapInfoList = {
			{
				mapName = "airplane",
				levelNumber = 21,
				levelTitle = "AIRPLANE",
				menuTitle = "@MENU_SP_H1_AIRPLANE",
				menuDesc = Engine.Localize( "@MENU_SP_H1_AIRPLANE_DESC" ),
				locationImage = "h1_minimap_epilogue_m1_airplane",
				blipPosX = 78,
				blipPosY = 78,
				challenge = "LB_AM_AIRPLANE",
				challengeName = "@MENU_SP_H1_AIRPLANE"
			}
		}
	},
	{
		loc_string = "@MENU_ARCADE_FULL",
		tab_string = "@MENU_ARCADE_FULL_TAB",
		actName = "full_arcade",
		mapInfoList = {
			{
				mapName = "fullArcade",
				actionFunc = StartFullArcadeMode,
				levelNumber = 0,
				levelTitle = "FULL_ARCADE",
				menuTitle = "@MENU_SP_H1_FULL_ARCADE",
				menuDesc = Engine.Localize( "@MENU_SP_H1_FULL_ARCADE_DESC" ),
				locationImage = "h1_minimap_full_arcade",
				blipPosX = 78,
				blipPosY = 78,
				challenge = "LB_AM_FULLCHALLENGE",
				challengeName = "@MENU_ARCADE_FULL"
			}
		},
		arcadeOnly = true
	},
	{
		loc_string = "DEV",
		actName = "dev",
		mapInfoList = {
			{
				mapName = "simplecredits",
				levelNumber = 22,
				levelTitle = "SIMPLECREDITS",
				menuTitle = "@MENU_SP_H1_SIMPLECREDITS",
				menuDesc = Engine.Localize( "@MENU_SP_H1_SIMPLECREDITS_DESC" )
			},
			{
				mapName = "bx_h1_showroom_day",
				levelNumber = 23,
				levelTitle = "SIMPLECREDITS",
				menuTitle = "showroom_day",
				menuDesc = "bx_h1_showroom_day"
			},
			{
				mapName = "bx_h1_showroom_night",
				levelNumber = 24,
				levelTitle = "SIMPLECREDITS",
				menuTitle = "showroom_night",
				menuDesc = "bx_h1_showroom_night"
			},
			{
				mapName = "bx_h1_showroom_sunset",
				levelNumber = 25,
				levelTitle = "SIMPLECREDITS",
				menuTitle = "showroom_sunset",
				menuDesc = "bx_h1_showroom_sunset"
			}
		},
		dev = true
	}
}
local f0_local22 = 22
local f0_local23 = {}
LUI.LevelSelect.FindActData = function ( f3_arg0 )
	for f3_local0 = 1, #f0_local21, 1 do
		if f0_local21[f3_local0].menuName == f3_arg0 then
			return f0_local21[f3_local0]
		end
	end
	return nil
end

LUI.LevelSelect.FindLevelTitle = function ( f4_arg0 )
	for f4_local0 = 1, #f0_local21, 1 do
		for f4_local3 = 1, #f0_local21[f4_local0].mapInfoList, 1 do
			if f0_local21[f4_local0].mapInfoList[f4_local3].mapName == f4_arg0 then
				return f0_local21[f4_local0].mapInfoList[f4_local3].menuTitle
			end
		end
	end
	return nil
end

LUI.LevelSelect.UpdateLockWithDVar = function ()
	if not f0_local1 then
		return 
	end
	local f5_local0 = Engine.GetDvarBool( "ui_cheat_unlock_all_mission" )
	if f5_local0 ~= nil then
		f0_local2 = not f5_local0
		f0_local3 = f5_local0
	end
	if f0_local4 then
		if LUI.LevelSelect.ProgressionEnabled() then
			if LUI.LevelSelect.CheatDebutText then
				LUI.LevelSelect.CheatDebutText:close()
				LUI.LevelSelect.CheatDebutText = nil
			end
		else
			local f5_local1 = Engine.GetLuiRoot()
			local self = LUI.UIText.new( {
				topAnchor = true,
				top = 15,
				left = -100,
				width = 200,
				height = 12,
				font = CoD.TextSettings.BodyFont.Font
			} )
			self:setText( "Progression cheat enabled." )
			LUI.LevelSelect.CheatDebutText = self
			f5_local1:addElement( self )
		end
	end
end

LUI.LevelSelect.GetDifficultyText = function ( f6_arg0, f6_arg1 )
	if not f6_arg1 then
		f6_arg1 = 0
	end
	local f6_local0 = Engine.GetHighestDifficultyForLevel( f6_arg0 - 1, f6_arg1 )
	if f6_local0 and f6_local0 ~= "" then
		return Engine.Localize( f6_local0 )
	else
		return ""
	end
end

LUI.LevelSelect.ProgressionEnabled = function ()
	local f7_local0
	if Engine.IsDevelopmentBuild() or Engine.GetDvarBool( "mis_cheat" ) then
		f7_local0 = f0_local2
		if f7_local0 then
		
		else
			return f7_local0
		end
	end
	f7_local0 = not f0_local3
end

LUI.LevelSelect.IsMissionEnabled = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	if f8_arg0 == 0 then
		return true
	elseif Engine.GetDvarBool( "limited_mode" ) then
		if f8_arg0 == 10 then
			return true
		else
			return false
		end
	elseif f8_arg2 and Engine.GetDvarBool( "profileMenuOption_hasUnlockedAll_SP" ) then
		return true
	elseif f8_arg3 and f0_local23[f8_arg0] then
		return true
	elseif f0_local22 <= f8_arg0 then
		return true
	elseif LUI.LevelSelect.GetDifficultyText( f8_arg0, Engine.GetControllerForLocalClient( 0 ) ) == "" and LUI.LevelSelect.ProgressionEnabled() then
		if f8_arg1 then
			return LUI.LevelSelect.IsMissionEnabled( f8_arg0 - 1, false, f8_arg2 )
		else
			return false
		end
	else
		return true
	end
end

LUI.LevelSelect.IsAllLevelCompleted = function ()
	for f9_local0 = 1, 20, 1 do
		if not LUI.LevelSelect.IsMissionEnabled( f9_local0, false, false ) then
			return false
		end
	end
	return true
end

LUI.LevelSelect.ResumeSetIsGameCompleted = function ( f10_arg0 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	Engine.SetDvarBool( "profileMenuOption_resumeIsGameCompleted", f10_arg0 )
	Engine.ExecNow( "profile_menuDvarsFinish" )
	Engine.Exec( "updategamerprofile" )
end

LUI.LevelSelect.CheckCampaignCompletedNotification = function ( f11_arg0, f11_arg1 )
	if not LUI.LevelSelect.ProgressionEnabled() then
		return 
	elseif Engine.GetDvarBool( "profileMenuOption_hasBeenNotifiedCampaignCompleted" ) then
		return 
	elseif not LUI.LevelSelect.IsAllLevelCompleted() then
		return 
	else
		Engine.SetDvarBool( "profileMenuOption_hasBeenNotifiedCampaignCompleted", true )
		Engine.ExecNow( "profile_menuDvarsFinish" )
		Engine.Exec( "updategamerprofile" )
		LUI.FlowManager.RequestPopupMenu( nil, "campaign_arcade_cheat_unlocked", true, f11_arg1.controller, false )
	end
end

function InitMapInfos()
	local f12_local0 = nil
	if not f0_local0 then
		f12_local0 = 1
		while true do
			if #f0_local21 < f12_local0 then
				break
			elseif f0_local21[f12_local0].dev then
				table.remove( f0_local21, f12_local0 )
				f12_local0 = f12_local0 - 1
			end
			f12_local0 = f12_local0 + 1
		end
	end
	for f12_local1 = 1, #f0_local21, 1 do
		f0_local21[f12_local1].locked = not LUI.LevelSelect.IsMissionEnabled( f0_local21[f12_local1].mapInfoList[1].levelNumber, true, true )
	end
	for f12_local1 = 1, #f0_local21, 1 do
		f0_local21[f12_local1].menuName = f0_local8 .. f0_local21[f12_local1].actName
		f0_local21[f12_local1].menuIndex = f12_local1
		local f12_local4 = Engine.GetDvarBool( "arcademode" )
		local f12_local5 = f0_local21[f12_local1]
		local f12_local6
		if f12_local4 then
			f12_local6 = f0_local21[f12_local1].dev
			if not f12_local6 then
				if not f12_local4 then
					f12_local6 = f0_local21[f12_local1].arcadeOnly
				else
					f12_local6 = false
				end
			end
		elseif not f12_local4 then
			f12_local6 = f0_local21[f12_local1].arcadeOnly
		else
			f12_local6 = false
		end
		f12_local5.hidden = f12_local6
		f12_local5 = f12_local1 - 1
		if f12_local5 == 0 then
			f12_local5 = #f0_local21
			while f0_local21[f12_local5].hidden do
				f12_local5 = f12_local5 - 1
				if f12_local5 == 0 then
					f12_local5 = #f0_local21
				end
				if f12_local5 == f12_local1 - 1 then
					break
				end
			end
			f12_local6 = f12_local1 + 1
			if #f0_local21 < f12_local6 then
				f12_local6 = 1
				while f0_local21[f12_local6].hidden do
					f12_local6 = f12_local6 + 1
					if #f0_local21 < f12_local6 then
						f12_local6 = 1
					end
					if f12_local6 == f12_local1 + 1 then
						break
					end
				end
				if not f0_local21[f12_local5].locked then
					f0_local21[f12_local1].previousActMenu = f0_local8 .. f0_local21[f12_local5].actName
				else
					f0_local21[f12_local1].previousActMenu = nil
				end
				if not f0_local21[f12_local6].locked then
					f0_local21[f12_local1].nextActMenu = f0_local8 .. f0_local21[f12_local6].actName
				else
					f0_local21[f12_local1].nextActMenu = nil
				end
				for f12_local7 = 1, #f0_local21[f12_local1].mapInfoList, 1 do
					if f0_local21[f12_local1].mapInfoList[f12_local7].narativeLevel then
						f0_local23[f0_local21[f12_local1].mapInfoList[f12_local7].levelNumber] = true
					end
				end
			end
		end
	end
end

function GetRealActCount()
	local f13_local0 = 0
	for f13_local1 = 1, #f0_local21, 1 do
		if not f0_local21[f13_local1].hidden then
			f13_local0 = f13_local0 + 1
		end
	end
	return f13_local0
end

function GetRealActIndex( f14_arg0 )
	local f14_local0 = 0
	for f14_local1 = 1, #f0_local21, 1 do
		if not f0_local21[f14_local1].hidden and f14_arg0 == f14_local0 + 1 then
			return f14_local1
		end
	end
	assert( false, "No real index found for index " .. f14_arg0 )
end

function GetRelativeActIndex( f15_arg0 )
	local f15_local0 = 0
	assert( f15_arg0 <= #f0_local21 )
	for f15_local1 = 1, f15_arg0, 1 do
		if not f0_local21[f15_local1].hidden then
			f15_local0 = f15_local0 + 1
		end
	end
	return f15_local0
end

if f0_local1 then
	LUI.LevelSelect.UpdateLockWithDVar()
end
InitMapInfos()
if not Engine.GetDvarBool( "limited_mode" ) then
	LUI.LevelSelect.FirstCampaignMenuName = f0_local21[1].menuName
else
	LUI.LevelSelect.FirstCampaignMenuName = f0_local21[2].menuName
end
function GetActiveMapCount( f16_arg0 )
	local f16_local0 = 0
	for f16_local1 = 1, #f16_arg0, 1 do
		if not Engine.GetDvarBool( "arcademode" ) or not f16_arg0[f16_local1].narativeLevel then
			f16_local0 = f16_local0 + 1
		end
	end
	return f16_local0
end

function WrapperTabEvent( f17_arg0 )
	return function ( f18_arg0, f18_arg1 )
		LUI.FlowManager.RequestAddMenu( f18_arg0, f17_arg0, true, f18_arg1.controller, true, LUI.LevelSelect.FindActData( f17_arg0 ) )
		CoD.PlayEventSound( CoD.SFX.MouseClick, 10 )
	end
	
end

function overwrite_warning_level_select_menu( f19_arg0, f19_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_WARNING_CHECKPOINT_RESET_TITLE" ),
		message_text = Engine.Localize( "@MENU_WARNING_CHECKPOINT_RESET" ),
		yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
		yes_action = function ( f20_arg0, f20_arg1 )
			CheckDifficulty( f20_arg0, f20_arg1 )
		end
		,
		no_text = Engine.Localize( "@MENU_NO_CAPS" ),
		no_action = MBh.LeaveMenu()
	} )
end

LUI.MenuBuilder.registerPopupType( "overwrite_warning_level_select_menu", overwrite_warning_level_select_menu )
function LoadSpecificMap( f21_arg0, f21_arg1 )
	local f21_local0 = LUI.FlowManager.GetNextMapToLoad()
	LUI.FlowManager.PushMenuStackToDVar()
	LUI.LevelSelect.ResumeSetIsGameCompleted( false )
	Engine.StreamingInstallMap( f21_local0, "devmap " .. f21_local0 )
end

function CheckDifficulty( f22_arg0, f22_arg1 )
	local f22_local0 = LUI.FlowManager.GetNextMapToLoad()
	if f22_local0 == "killhouse" then
		LUI.FlowManager.PushMenuStackToDVar()
		LUI.LevelSelect.ResumeSetIsGameCompleted( false )
		Engine.StreamingInstallMap( f22_local0, "devmap " .. f22_local0 )
	else
		LUI.FlowManager.RequestAddMenu( f22_arg0, "difficulty_selection_menu", true, f22_arg1.controller, false, {
			acceptFunc = LoadSpecificMap
		} )
	end
end

function StartMap( f23_arg0, f23_arg1, f23_arg2 )
	LUI.FlowManager.SetNextMapToLoad( f23_arg2 )
	if Engine.CanResumeGame() and not Engine.GetDvarBool( "arcademode" ) and not Engine.GetDvarBool( "limited_mode" ) then
		LUI.FlowManager.RequestAddMenu( f23_arg0, "overwrite_warning_level_select_menu", true, f23_arg1.controller )
	else
		CheckDifficulty( f23_arg0, f23_arg1, f23_arg2 )
	end
end

function GetIntelText( f24_arg0 )
	if f24_arg0.intel == nil or #f24_arg0.intel == 0 then
		return Engine.Localize( "@LUA_MENU_INTEL_NONE" )
	end
	local f24_local0 = 0
	local f24_local1 = #f24_arg0.intel
	for f24_local2 = 1, #f24_arg0.intel, 1 do
		if Engine.GetPlayerIntelIsFound( f24_arg0.intel[f24_local2] ) then
			f24_local0 = f24_local0 + 1
		end
	end
	return Engine.Localize( "@LUA_MENU_STATUS_INTEL", f24_local0, f24_local1 )
end

function UpdateDescriptionBoxWidth( f25_arg0, f25_arg1 )
	
end

function OnFirstLevelButton( f26_arg0, f26_arg1 )
	local f26_local0 = f26_arg0.list.buttonCount > 0
	assert( f26_local0, "Requires at least one button to select and update level info" )
	if f26_local0 then
		local f26_local1 = f26_arg0.list:getFirstChild()
		f26_local1:processEvent( {
			name = "button_over"
		} )
	end
end

local f0_local24 = function ( f27_arg0, f27_arg1 )
	local f27_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f27_arg0 )
	local f27_local1 = f27_local0.currentLevelNumber
	f27_local0.currentLocationTitle = f27_arg0.properties.button_text
	f27_local0.currentObjectiveText = f27_arg0.properties.objective_text
	f27_local0.currentLevelNumber = f27_arg0.properties.level_number
	f27_local0.currentButtonNumber = f27_arg0.properties.map_index
	local f27_local2 = f27_local0.currentLevelNumber == f27_local1
	local f27_local3 = f27_arg0:getParent()
	if not f27_local2 then
		LocationWindowUpdate( f27_local3, f27_arg1 )
		if not f27_local0.fromLeaderboard then
			PersistentBackground.ChangeBackground( nil, "mission_select_bg_" .. string.lower( f27_arg0.properties.mapInfo.levelTitle ) )
			local f27_local4 = Engine.GetLuiRoot()
			assert( f27_local4 )
			local f27_local5 = LUI.FlowManager.GetTopMenuInfo( f27_local4.flowManager.menuInfoStack )
			assert( f27_local5 )
			local f27_local6 = f27_local5.menu.bgBlack
			assert( f27_local6 )
			f27_local6:animateInSequence( {
				{
					"BlackScreen",
					0
				},
				{
					"Faded",
					2000
				}
			} )
		end
		f27_local0.fromLeaderboard = false
	end
end

function ChangeActBtnAction( f28_arg0, f28_arg1 )
	LUI.FlowManager.RequestAddMenu( f28_arg0, f28_arg0.properties.actToSelect, true, f28_arg1.controller, true, LUI.LevelSelect.FindActData( f28_arg0.properties.actToSelect ) )
end

function LocationWindowUpdateFromChild( f29_arg0, f29_arg1 )
	local f29_local0 = LocationWindowUpdate
	local f29_local1 = f29_arg0:getParent()
	f29_local0( f29_local1.list, f29_arg1 )
end

local f0_local25 = 0
function LocationWindowUpdate( f30_arg0, f30_arg1 )
	local f30_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f30_arg0 )
	local f30_local1 = f30_local0.currentLevelNumber
	local f30_local2 = f30_local0.currentButtonNumber
	if f30_local2 == nil then
		return 
	elseif not f30_local0.currentLocationTitle then
		f30_local0.currentLocationTitle = Engine.Localize( "@MENU_SP_IW6_PROLOGUE" )
	end
	local f30_local3 = Engine.GetLuiRoot()
	assert( f30_local3 )
	local f30_local4 = LUI.FlowManager.GetTopMenuInfo( f30_local3.flowManager.menuInfoStack, false )
	assert( f30_local4 )
	local f30_local5 = LUI.LevelSelect.FindActData( f30_local4.name )
	f30_local5 = f30_local5.mapInfoList[f30_local2]
	local f30_local6 = GetIntelText( f30_local5 )
	local f30_local7 = f30_local5.mapName
	local f30_local8 = Engine.Localize( "@LUA_MENU_SP_LOCATION_" .. f30_local5.levelTitle )
	local f30_local9
	if f30_arg1 then
		f30_local9 = f30_arg1.controller
		if not f30_local9 then
		
		else
			f30_arg0:processEvent( {
				name = "menu_refresh"
			} )
			local f30_local10 = f30_arg0:getParent()
			local f30_local11 = 0
			if Engine.GetDvarBool( "arcademode" ) then
				if f30_local1 == 0 then
					f30_local11 = Engine.GetPlayerData( f30_local9, CoD.StatsGroup.SP, "fullChallengeScore" )
				else
					f30_local11 = Engine.GetPlayerData( f30_local9, CoD.StatsGroup.SP, "arcadeScore", f30_local7 )
				end
			end
			if f30_local7 == "killhouse" then
				f30_local11 = Engine.GetPlayerData( f30_local9, CoD.StatsGroup.SP, "timeTrialTime", "fng" )
			end
			if f30_local1 == 1 then
				ClearInfoBoxLeftBottom( f30_local10.infoBox )
				ClearInfoBoxRightBottom( f30_local10.infoBox )
				SetupInfoBoxLeftForArcadeMode( f30_local10.infoBox, {
					highscore = f30_local11,
					mapname = f30_local7,
					challengeName = f30_local5.challenge
				} )
				SetupInfoBoxRightForArcadeMode( f30_local10.infoBox, {
					highscore = f30_local11,
					mapname = f30_local7
				} )
			elseif f0_local25 == 1 and not Engine.GetDvarBool( "arcademode" ) then
				ClearInfoBoxLeftBottom( f30_local10.infoBox )
				ClearInfoBoxRightBottom( f30_local10.infoBox )
				SetupInfoBoxLeftForMissionSelect( f30_local10.infoBox )
				SetupInfoBoxRightForMissionSelect( f30_local10.infoBox )
			end
			f0_local25 = f30_local1
			if Engine.GetDvarBool( "loc_arabic_sku" ) or Engine.GetCurrentLanguage() == 12 then
				local f30_local12 = {
					h1_minimap_act1_m2_charliedontsurf = true,
					h1_minimap_act1_m3_thebog = true,
					h1_minimap_act1_m6_warpig = true,
					h1_minimap_act1_m7_shockandawe = true,
					h1_minimap_act1_m8_aftermath = true
				}
				if f30_local12[f30_local5.locationImage] then
					f30_local5.locationImage = "h1_minimap_epilogue_m1_airplane"
				end
				f30_local5.blipPosX = 68
				f30_local5.blipPosY = 70
			end
			local f30_local13 = f30_local10
			local f30_local12 = f30_local10.dispatchEventToChildren
			local f30_local14 = {
				name = "update_levelInfo",
				level_number = f30_local1,
				title_text = f30_local0.currentLocationTitle,
				map_name = f30_local7,
				location_text = f30_local8,
				intel_text = f30_local6,
				level_controller = f30_local9,
				narative_level = f30_local5.narativeLevel,
				location_image = f30_local5.locationImage
			}
			local f30_local15 = f30_local5.blipPosX
			if not f30_local15 then
				f30_local15 = f0_local7 / 2
			end
			f30_local14.blipPosX = f30_local15
			f30_local15 = f30_local5.blipPosY
			if not f30_local15 then
				f30_local15 = f0_local7 / 2
			end
			f30_local14.blipPosY = f30_local15
			f30_local14.immediate = true
			f30_local14.highscore = f30_local11
			f30_local14.challengeName = f30_local5.challenge
			f30_local12( f30_local13, f30_local14 )
			if f30_local0.currentObjectiveText then
				f30_local10:dispatchEventToChildren( {
					name = "update_objective_text",
					objective_text = f30_local0.currentObjectiveText,
					immediate = true
				} )
			end
		end
	end
	f30_local9 = Engine.GetSignedInAsController()
end

function UpdateLocationTitle( f31_arg0, f31_arg1 )
	if f0_local11 then
		f31_arg0:animateToState( "hide", 0 )
	end
	f31_arg0:setText( f31_arg1.title_text )
	local f31_local0 = nil
	local f31_local1, f31_local2, f31_local3 = GetTextDimensions( Engine.ToUpperCase( f31_arg1.title_text ), CoD.TextSettings.H1TitleFont.Font, locationInfoWindowTitleFontSize )
	local f31_local4, f31_local5, f31_local6 = GetTextDimensions( Engine.ToUpperCase( f31_arg1.location_text ), CoD.TextSettings.H1TitleFont.Font, locationInfoWindowTitleFontSize )
	f31_local0 = f31_local3
	if f31_local3 < f31_local6 then
		f31_local0 = f31_local6
	end
	UpdateDescriptionBoxWidth( f31_arg0, f31_local0 )
	if f0_local11 then
		f31_arg0:animateToState( "show", f0_local12 )
	end
end

function UpdateLocationMap( f32_arg0, f32_arg1 )
	f32_arg0:registerAnimationState( f32_arg1.map_name, {
		material = RegisterMaterial( f32_arg1.location_image ),
		alpha = 0
	} )
	f32_arg0:animateToState( f32_arg1.map_name, 0 )
	if f0_local11 then
		f32_arg0:animateToState( "show", f0_local13 )
	else
		f32_arg0:animateToState( "show", 0 )
	end
	f32_arg0.mapBlipPulse:delete( "loc_info" )
	f32_arg0.mapBlipPulse:addPulse( {
		name = "loc_info",
		posX = f32_arg1.blipPosX,
		posY = f32_arg1.blipPosY,
		delay = LevelSelectMinimapBlipSettings.delay,
		pulseDuration = LevelSelectMinimapBlipSettings.pulseDuration
	} )
end

function UpdateLocationMapInfo( f33_arg0, f33_arg1 )
	if f0_local11 then
		f33_arg0:animateToState( "hide", 0 )
	end
	f33_arg0:setDescription( f33_arg1.objective_text )
	if f0_local11 then
		f33_arg0:animateToState( "show", f0_local14 )
	end
end

function UpdateLeaderboardPosition( f34_arg0 )
	local f34_local0 = Engine.Localize( "@LUA_MENU_POSITION" )
	local f34_local1 = ": "
	local f34_local2 = f0_local17
	if f0_local17 == nil or f0_local17 == "" then
		f34_local2 = Engine.Localize( "@LUA_MENU_LEADERBOARD_REFRESH" )
	elseif f0_local17 == -1 then
		f34_local2 = Engine.Localize( "@LUA_MENU_LB_UNRANKED" )
	end
	if Engine.IsRightToLeftLanguage() then
		local f34_local3 = f34_local2
		local f34_local4 = " :"
		f34_local2 = f34_local0
		f34_local1 = f34_local4
		f34_local0 = f34_local3
	end
	f34_arg0:setText( "(" .. f34_local0 .. f34_local1 .. f34_local2 .. ")" )
end

function SetupPlayerPosition( f35_arg0, f35_arg1 )
	if not f35_arg0.positionText then
		return 
	end
	f35_arg1.highscore = f35_arg1.highscore and "0" or f35_arg1.highscore
	local f35_local0 = f35_arg1.highscore
	if f35_arg0.scoreText then
		f35_local0 = f35_arg0.scoreText:getText()
	end
	local f35_local1, f35_local2, f35_local3 = GetTextDimensions( f35_local0, f0_local20.Font, f0_local20.Height )
	f35_arg1.playerPosition = f35_arg1.playerPosition and "... " or f35_arg1.playerPosition
	UpdateLeaderboardPosition( f35_arg0.positionText )
	f35_arg0.positionText:registerAnimationState( "default", {
		left = f35_local3 + 3,
		leftAnchor = true
	} )
	f35_arg0.positionText:animateToState( "default" )
end

function UpdateLocationDifficultyScore( f36_arg0, f36_arg1 )
	local f36_local0 = Engine.IsRightToLeftLanguage()
	if f0_local11 then
		f36_arg0:animateToState( "hide", 0 )
	end
	if not Engine.GetDvarBool( "arcademode" ) and f36_arg1.level_number ~= 1 then
		local f36_local1 = LUI.LevelSelect.GetDifficultyText( f36_arg1.level_number, f36_arg1.level_controller )
		if f36_local1 ~= "" then
			if f36_arg1.narative_level then
				f36_arg0.difficultyText:setText( Engine.Localize( "@LUA_MENU_NARRATIVECOMPLETED" ) )
			else
				local f36_local2 = Engine.Localize( "@LUA_MENU_DIFFICULTYCOMPLETED" )
				local f36_local3 = " : "
				local f36_local4 = Engine.Localize( f36_local1 )
				if f36_local0 then
					local f36_local5 = f36_local4
					f36_local4 = f36_local2
					f36_local2 = f36_local5
				end
				f36_arg0.difficultyText:setText( f36_local2 .. f36_local3 .. f36_local4 )
			end
		else
			f36_arg0.difficultyText:setText( Engine.Localize( "@LUA_MENU_NOT_COMPLETED" ) )
		end
	else
		if f36_arg1.highscore ~= nil then
			if f36_arg1.highscore == 0 or f36_arg1.level_number == 1 and string.len( f36_arg1.highscore ) <= 2 then
				ClearInfoBoxLeftBottom( f36_arg0:getParent() )
				SetupInfoBoxLeftForMissionSelect( f36_arg0:getParent() )
				f36_arg0.difficultyText:setText( Engine.Localize( "@LUA_MENU_NOT_COMPLETED" ) )
			elseif f36_arg1.level_number == 1 then
				local f36_local3 = string.sub( f36_arg1.highscore, 0, -3 ) .. "." .. string.sub( f36_arg1.highscore, -2 )
				local f36_local4 = Engine.Localize( "@MENU_SECONDS_ABBREVIATION" )
				if f36_local0 then
					local f36_local5 = f36_local4
					f36_local4 = f36_local3
					f36_local3 = f36_local5
				end
				f36_arg0.scoreText:setText( f36_local3 .. f36_local4 )
			else
				ClearInfoBoxLeftBottom( f36_arg0:getParent() )
				SetupInfoBoxLeftForArcadeMode( f36_arg0:getParent(), {
					challengeName = f36_arg1.challengeName
				} )
				f36_arg0.scoreText:setText( f36_arg1.highscore )
			end
		end
		SetupPlayerPosition( f36_arg0, f36_arg1 )
	end
	if f0_local11 then
		f36_arg0:animateToState( "show", timeOfInfoBoxAnimDifficulty )
	end
end

function UpdateLocationIntel( f37_arg0, f37_arg1 )
	if f0_local11 then
		f37_arg0:animateToState( "hide", 0 )
	end
	f37_arg0:setText( f37_arg1.intel_text )
	if f0_local11 then
		f37_arg0:animateToState( "show", f0_local16 )
	end
	f37_arg0.properties.currentIntel = f37_arg1.intel_text
end

function ClearInfoBoxLeftBottom( f38_arg0 )
	for f38_local3, f38_local4 in pairs( {
		f38_arg0.bottomLeftElements.scoreText,
		f38_arg0.bottomLeftElements.positionText,
		f38_arg0.bottomLeftElements.highscoreText,
		f38_arg0.bottomLeftElements.lineText,
		f38_arg0.bottomLeftElements.difficultyText
	} ) do
		if f38_local4 ~= nil then
			f38_arg0.bottomLeftElements:removeElement( f38_local4 )
		end
	end
	f38_arg0.bottomLeftElements.scoreText = nil
	f38_arg0.bottomLeftElements.positionText = nil
	f38_arg0.bottomLeftElements.highscoreText = nil
	f38_arg0.bottomLeftElements.lineText = nil
	f38_arg0.bottomLeftElements.difficultyText = nil
end

function ClearInfoBoxRightBottom( f39_arg0 )
	for f39_local3, f39_local4 in pairs( {
		f39_arg0.bottomRightElements.containerButton,
		f39_arg0.bottomRightElements.intelText
	} ) do
		if f39_local4 ~= nil then
			f39_arg0.bottomRightElements:removeElement( f39_local4 )
		end
	end
	f39_arg0.bottomRightElements.containerButton = nil
	f39_arg0.bottomRightElements.intelText = nil
end

function SPLeaderboardDataUpdateStatus( f40_arg0, f40_arg1 )
	if f40_arg0.leaderboardOpenRetryTimer == nil then
		f0_local17 = Leaderboards.GetPlayerValue( Engine.GetControllerForLocalClient( 0 ), 0 )
		if f40_arg1 and f40_arg1.isUpdating then
			return 
		elseif f0_local17 == nil then
			f0_local17 = -1
		end
		local f40_local0 = Engine.GetLuiRoot()
		local f40_local1 = LUI.FlowManager.GetTopMenuInfo( f40_local0.flowManager.menuInfoStack, false )
		f40_local1.menu:processEvent( {
			name = "update_leaderboard_position"
		} )
	end
end

function FetchLeaderboardData( f41_arg0 )
	if Leaderboards.IsUpdating() then
		if f41_arg0.leaderboardOpenRetryTimer == nil then
			f0_local17 = -1
			local f41_local0 = Engine.GetLuiRoot()
			local f41_local1 = LUI.FlowManager.GetTopMenuInfo( f41_local0.flowManager.menuInfoStack, false )
			f41_local1.menu:processEvent( {
				name = "update_leaderboard_position"
			} )
			
			local leaderboardOpenRetryTimer = LUI.UITimer.new( 1000, "leaderboardOpenRetry", nil, false )
			leaderboardOpenRetryTimer.id = "leaderboardOpenRetry"
			f41_arg0:registerEventHandler( "leaderboardOpenRetry", function ( element, event )
				if Leaderboards.IsUpdating() then
					return 
				else
					event.timer:close()
					element.leaderboardOpenRetryTimer = nil
					FetchLeaderboardData( element )
				end
			end )
			f41_arg0:addElement( leaderboardOpenRetryTimer )
			f41_arg0.leaderboardOpenRetryTimer = leaderboardOpenRetryTimer
			
		end
	else
		Leaderboards.Open( f41_arg0.currentChallengeName, "TRK_ALLTIME" )
		if not Leaderboards.IsUpdating() then
			Leaderboards.UpdateLeaderboard( Engine.GetControllerForLocalClient( 0 ), 1 )
		end
		if not Leaderboards.IsUpdating() then
			SPLeaderboardDataUpdateStatus( f41_arg0 )
		end
	end
end

function SetupInfoBoxLeftForArcadeMode( f43_arg0, f43_arg1 )
	local f43_local0 = Engine.IsRightToLeftLanguage()
	local f43_local1 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.BottomLeft )
	f43_local1.font = f0_local20.Font
	f43_local1.height = f0_local20.Height
	local self
	if f43_local0 then
		self = LUI.HorizontalAlignment.RTL_ForcedLeft
		if not self then
		
		else
			f43_local1.alignment = self
			f43_local1.color = Colors.h1.yellow
			self = LUI.UIText.new( f43_local1 )
			self.id = "infobox_score_text"
			f43_arg0.bottomLeftElements:addElement( self )
			f43_arg0.bottomLeftElements.scoreText = self
			f0_local17 = -1
			if f43_arg1 and f43_arg1.challengeName and Engine.UserCanPlayOnline( Engine.GetControllerForLocalClient( 0 ) ) then
				local f43_local3 = CoD.CreateState( 0, nil, 0, -2, CoD.AnchorTypes.BottomLeft )
				f43_local3.font = f0_local19.Font
				f43_local3.height = f0_local19.Height
				local self
				if f43_local0 then
					self = LUI.HorizontalAlignment.RTL_ForcedLeft
					if not self then
					
					else
						f43_local3.alignment = self
						f43_local3.color = Colors.h1.medium_grey
						self = LUI.UIText.new( f43_local3 )
						self.id = "infobox_position_text"
						f43_arg0.bottomLeftElements:addElement( self )
						f43_arg0.bottomLeftElements.positionText = self
						self:registerEventHandler( "update_leaderboard_position", UpdateLeaderboardPosition )
						Engine.SetDvarInt( "lb_maxrows", 1 )
						f43_arg0:registerEventHandler( "leaderboard_update_status", SPLeaderboardDataUpdateStatus )
						f43_arg0.currentChallengeName = f43_arg1.challengeName
						f0_local17 = -1
						FetchLeaderboardData( f43_arg0 )
					end
				end
				self = LUI.HorizontalAlignment.Left
			end
			local f43_local3 = -f43_local1.height - 5
			local self = CoD.CreateState( 0, nil, 0, f43_local3, CoD.AnchorTypes.BottomLeft )
			self.font = f0_local19.Font
			self.height = f0_local19.Height
			local self
			if f43_local0 then
				self = LUI.HorizontalAlignment.RTL_ForcedLeft
				if not self then
				
				else
					self.alignment = self
					self.color = Colors.h1.light_grey
					self = LUI.UIText.new( self )
					self.id = "infobox_highscore_text"
					self:setText( Engine.Localize( "@LUA_MENU_HIGHSCORE" ) )
					if f43_arg1 ~= nil and f43_arg1.mapname == "killhouse" then
						local f43_local6 = Engine.Localize( "@MENU_SP_LEVEL_YOUR_BEST_TIME" )
						local f43_local7 = ":"
						if f43_local0 then
							local self = f43_local7
							f43_local7 = f43_local6
							f43_local6 = self
						end
						self:setText( f43_local6 .. f43_local7 )
					end
					f43_arg0.bottomLeftElements:addElement( self )
					f43_arg0.bottomLeftElements.highscoreText = self
					local f43_local7 = CoD.CreateState( 0, nil, 0, f43_local3 - self.height - 5, CoD.AnchorTypes.BottomLeft )
					f43_local7.font = f0_local19.Font
					f43_local7.height = f0_local19.Height
					local self
					if f43_local0 then
						self = LUI.HorizontalAlignment.RTL_ForcedLeft
						if not self then
						
						else
							f43_local7.alignment = self
							f43_local7.color = Colors.white
							self = LUI.UIText.new( f43_local7 )
							self.id = "infobox_line_text"
							self:setText( "___" )
							f43_arg0.bottomLeftElements:addElement( self )
							f43_arg0.bottomLeftElements.lineText = self
						end
					end
					self = LUI.HorizontalAlignment.Left
				end
			end
			self = LUI.HorizontalAlignment.Left
		end
	end
	self = LUI.HorizontalAlignment.Left
end

function SetupInfoBoxRightForArcadeMode( f44_arg0, f44_arg1 )
	if f44_arg1 ~= nil and f44_arg1.mapname == "killhouse" and f44_arg1.highscore == 0 then
		local f44_local0 = false
	else
		local f44_local0 = true
	end
	local f44_local0 = true
	local f44_local1 = "button_alt2"
	local self = nil
	if f44_local0 then
		self = LUI.UIButton.new( CoD.CreateState( nil, nil, 0, 0, CoD.AnchorTypes.BottomRight ) )
	else
		self = LUI.UIElement.new( CoD.CreateState( nil, nil, 0, 0, CoD.AnchorTypes.BottomRight ) )
	end
	self.id = "infobox_leaderboard_button"
	if f44_local0 then
		self:registerEventHandler( "button_action", OpenLeaderboard )
		self.m_requireFocusType = FocusType.MouseOver
		self.listenMouseEnterLeave = true
		self.bindButton = LUI.UIBindButton.new()
		self.bindButton.id = "BindButtonLeaderboards"
		self.bindButton:registerEventHandler( f44_local1, OpenLeaderboard )
		self.bindButton.func = OpenLeaderboard
		self:addElement( self.bindButton )
	end
	local f44_local3 = CoD.CreateState( nil, nil, 0, 0, CoD.AnchorTypes.BottomRight )
	f44_local3.font = f0_local18.Font
	f44_local3.height = f0_local18.Height
	if f44_local0 then
		f44_local3.color = Colors.white
	else
		f44_local3.color = Colors.dark_grey
	end
	local self = LUI.UIText.new( f44_local3 )
	self.id = "infobox_leaderboard_text"
	if f44_local0 then
		f44_local3.color = Colors.h1.light_green
		self:registerAnimationState( "over", f44_local3 )
		self:registerEventHandler( "lose_focus", MBh.AnimateToState( "default" ) )
		self:registerEventHandler( "gain_focus", MBh.AnimateToState( "over" ) )
	end
	self.text = Engine.Localize( "@MENU_LEADERBOARD" )
	local f44_local5 = ""
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f44_local5 = ButtonMap[f44_local1].string
	end
	f44_local5 = Engine.Localize( f44_local5 )
	self:setText( f44_local5 .. " " .. self.text )
	if not Engine.IsConsoleGame() and not Engine.IsGamepadEnabled() and f44_local0 then
		local f44_local6 = CoD.CreateState( 10, -4, 0, nil, CoD.AnchorTypes.TopLeft )
		f44_local6.font = CoD.TextSettings.TitleFontMediumLarge.Font
		f44_local6.height = f0_local18.Height + 4
		f44_local5 = Engine.Localize( ButtonMap[f44_local1].keyboard_string )
		self:addElement( LUI.UIButtonText.new( f44_local6, f44_local5, nil, nil, true, false, OpenLeaderboard ) )
	end
	self:addElement( self )
	local f44_local6, f44_local7, f44_local8 = GetTextDimensions2( f44_local5 .. self.text, f0_local18.Font, f0_local18.Height )
	self:registerAnimationState( "default", {
		rightAnchor = true,
		right = 0,
		height = f0_local18.Height,
		width = f44_local8 + 25
	} )
	self:animateToState( "default" )
	f44_arg0.bottomRightElements:addElement( self )
	f44_arg0.bottomRightElements.containerButton = self
end

function SetupInfoBoxLeftForMissionSelect( f45_arg0 )
	local f45_local0 = CoD.CreateState( 0, nil, 0, nil, CoD.AnchorTypes.BottomLeft )
	f45_local0.font = f0_local18.Font
	f45_local0.height = f0_local18.Height
	f45_local0.horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft
	f45_local0.alpha = 0.5
	local self = LUI.UIText.new( f45_local0 )
	self.id = "infobox_difficulty_text"
	f45_arg0.bottomLeftElements:addElement( self )
	f45_arg0.bottomLeftElements.difficultyText = self
end

function SetupInfoBoxRightForMissionSelect( f46_arg0 )
	local f46_local0 = CoD.CreateState( nil, nil, 0, 0, CoD.AnchorTypes.BottomRight )
	f46_local0.font = f0_local18.Font
	f46_local0.height = f0_local18.Height
	f46_local0.alpha = 0.5
	local self = LUI.UIText.new( f46_local0 )
	self.id = "infobox_intel_text"
	f46_arg0.bottomRightElements:addElement( self )
	f46_arg0.bottomRightElements.intelText = self
	f46_arg0.bottomRightElements.intelText:registerEventHandler( "update_levelInfo", UpdateLocationIntel )
	f46_arg0.bottomRightElements.intelText.properties = {
		currentIntel = ""
	}
end

LUI.LevelSelect.AddLocationInfoWindow = function ( f47_arg0, f47_arg1 )
	local infoBox = LUI.MenuBuilder.BuildRegisteredType( "InfoBox", {
		skipAnim = f47_arg1.skipAnim
	} )
	infoBox.title:registerEventHandler( "menu_create", MBh.EmitEventToParent( "location_window_title_update" ) )
	infoBox.title:registerEventHandler( "update_levelInfo", UpdateLocationTitle )
	infoBox.description:registerEventHandler( "update_objective_text", UpdateLocationMapInfo )
	infoBox.description:setText( "Prologue placeholder objective text" )
	if Engine.GetDvarBool( "arcademode" ) then
		SetupInfoBoxLeftForArcadeMode( infoBox )
		SetupInfoBoxRightForArcadeMode( infoBox )
	else
		SetupInfoBoxLeftForMissionSelect( infoBox )
		SetupInfoBoxRightForMissionSelect( infoBox )
	end
	infoBox.bottomLeftElements:registerEventHandler( "update_levelInfo", UpdateLocationDifficultyScore )
	infoBox:enableRightPanel()
	local self = LUI.UIImage.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerEventHandler( "update_levelInfo", UpdateLocationMap )
	self.mapBlipPulse = LUI.MapBlipPulse.new( self )
	infoBox.rightPanel:addElement( self )
	f47_arg0:addElement( infoBox )
	f47_arg0.infoBox = infoBox
	
end

LUI.LevelSelect.AddLevelListEntry = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
	local f48_local0 = f48_arg2.levelNumber
	if not LUI.LevelSelect.IsMissionEnabled( f48_local0, true, true ) then
		return 
	else
		local f48_local1 = f48_arg2.menuTitle
		local f48_local2 = f48_arg2.menuDesc
		local f48_local3 = f48_arg2.mapName
		local f48_local4 = f48_arg0:AddButton( Engine.Localize( f48_local1 ), f48_arg2.actionFunc or function ( f49_arg0, f49_arg1 )
			StartMap( f49_arg0, f49_arg1, f48_local3 )
		end
		, f48_arg3, true, false, {
			style = GenericButtonSettings.Styles.FlatButton,
			textStyle = CoD.TextStyle.ForceUpperCase,
			disableSound = CoD.SFX.DenySelect,
			button_map = f48_local3,
			objective_text = f48_local2,
			level_number = f48_local0,
			map_index = f48_arg1,
			mapInfo = f48_arg2
		} )
		f48_local4.id = "btn_levels_id_" .. f48_arg1
		f48_local4:registerEventHandler( "button_over", f0_local24 )
	end
end

LUI.LevelSelect.AddLevelListButtons = function ( f50_arg0, f50_arg1 )
	for f50_local0 = 1, #f50_arg1, 1 do
		if not Engine.GetDvarBool( "arcademode" ) or not f50_arg1[f50_local0].narativeLevel then
			f50_arg0:AddLevelListEntry( f50_local0, f50_arg1[f50_local0] )
		end
	end
end

function backButtonHandler( f51_arg0 )
	LUI.FlowManager.RequestLeaveMenu( f51_arg0 )
end

LUI.LevelSelect.InitializeCheat = function ( f52_arg0, f52_arg1 )
	if not f0_local1 or Engine.GetDvarBool( "limited_mode" ) then
		return 
	else
		local f52_local0 = function ( f53_arg0, f53_arg1 )
			local f53_local0 = Engine.GetDvarBool( "ui_cheat_unlock_all_mission" )
			if f53_local0 == nil then
				f53_local0 = Engine.IsDevelopmentBuild()
			end
			Engine.SetDvarBool( "ui_cheat_unlock_all_mission", not f53_local0, true )
			LUI.LevelSelect.UpdateLockWithDVar()
			InitMapInfos()
			if f52_arg1 then
				f52_arg1( f53_arg0, f53_arg1 )
			end
		end
		
		local self = LUI.UIBindButton.new()
		self.id = "level_select_cheat_button"
		self:registerEventHandler( "button_l3", f52_local0 )
		self:registerEventHandler( "key_insert", f52_local0 )
		f52_arg0:addElement( self )
	end
end

function ClickTabBtnAction( f54_arg0, f54_arg1, f54_arg2 )
	LUI.FlowManager.RequestAddMenu( f54_arg0, f0_local21[GetRealActIndex( f54_arg2 )].menuName, true, f54_arg1.controller, true, f0_local21[GetRealActIndex( f54_arg2 )] )
	CoD.PlayEventSound( CoD.SFX.H1TabChange, 10 )
end

function OpenLeaderboard( f55_arg0, f55_arg1 )
	if not Engine.UserCanPlayOnline( f55_arg1.controller ) then
		Engine.Exec( "xrequirelivesignin", f55_arg1.controller )
		return 
	end
	local f55_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f55_arg0 )
	f55_local0.fromLeaderboard = true
	local f55_local1 = f55_local0.currentButtonNumber
	local f55_local2 = Engine.GetLuiRoot()
	assert( f55_local2 )
	local f55_local3 = LUI.FlowManager.GetTopMenuInfo( f55_local2.flowManager.menuInfoStack, true )
	assert( f55_local3 )
	local f55_local4 = LUI.LevelSelect.FindActData( f55_local3.name )
	f55_local4 = f55_local4.mapInfoList[f55_local1]
	assert( f55_local4.challengeName )
	assert( f55_local4.challenge )
	local f55_local5 = LUI.FlowManager.RequestAddMenu
	local f55_local6 = f55_arg0
	local f55_local7 = "sp_leaderboard_data"
	local f55_local8 = true
	local f55_local9 = f55_arg1.controller
	local f55_local10 = false
	local f55_local11 = {
		leaderBoardData = {
			challenge = f55_local4.challenge,
			challengeName = f55_local4.challengeName
		},
		startValue = 1,
		newFilter = true
	}
	local f55_local12
	if f55_local4.storyChallenge then
		f55_local12 = true
	else
		f55_local12 = false
	end
	f55_local11.isTimeTrial = f55_local12
	f55_local5( f55_local6, f55_local7, f55_local8, f55_local9, f55_local10, f55_local11 )
end

function UnlockAllPopup( f56_arg0, f56_arg1 )
	Engine.PlaySound( "mission_unlock_cheat" )
	LUI.FlowManager.RequestAddMenu( nil, "request_yesno_popup_generic", true, f56_arg1.controller, nil, {
		popup_title = Engine.Localize( "@MENU_COMPLETED_CHEAT" ) .. " - " .. Engine.Localize( "@LUA_MENU_CAMPAIGN_UNLOCKED_ALL_TITLE" ),
		yes_action = SetUnlockAll,
		message_text = Engine.Localize( "@LUA_MENU_CAMPAIGN_UNLOCKED_ALL_DESC" )
	} )
end

function SetUnlockAll( f57_arg0, f57_arg1 )
	Engine.SetDvarBool( "profileMenuOption_hasUnlockedAll_SP", true )
	Engine.ExecNow( "profile_menuDvarsFinish" )
	Engine.Exec( "updategamerprofile" )
	local f57_local0 = LUI.FlowManager.GetTopOpenAndVisibleMenuName()
	LUI.FlowManager.RequestAddMenu( nil, f57_local0, true, f57_arg1.controller, true, LUI.LevelSelect.FindActData( f57_local0 ), {
		reload = true
	} )
end

function MenuCreate( f58_arg0, f58_arg1 )
	OnFirstLevelButton( f58_arg0, f58_arg1 )
	LUI.LevelSelect.CheckCampaignCompletedNotification( f58_arg0, f58_arg1 )
end

local f0_local26 = false
local f0_local27 = false
local f0_local28 = 1
local f0_local29 = {
	"up",
	"up",
	"down",
	"down",
	"alt1",
	"alt2"
}
function genericAction( f59_arg0, f59_arg1 )
	if f59_arg1.button == "left_trigger" then
		f0_local26 = f59_arg1.down
		f0_local28 = 1
		return 
	elseif f59_arg1.button == "right_trigger" then
		f0_local27 = f59_arg1.down
		f0_local28 = 1
		return 
	elseif f0_local26 and f0_local27 and f59_arg1.down then
		if f0_local29[f0_local28] == f59_arg1.button then
			if f0_local28 == #f0_local29 then
				UnlockAllPopup( f59_arg0, f59_arg1 )
			else
				f0_local28 = f0_local28 + 1
			end
			return 
		end
		f0_local28 = 1
	end
end

function DisplayLeaderboardFooterPrompt( f60_arg0, f60_arg1 )
	if f60_arg1 then
		f60_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt2",
			helper_text = Engine.Localize( "@MENU_LEADERBOARD" ),
			side = "right",
			clickable = true
		}, OpenLeaderboard )
	else
		f60_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt2",
			helper_text = "",
			side = "right",
			clickable = false
		}, OpenLeaderboard )
	end
end

LUI.LevelSelect.new = function ( f61_arg0, f61_arg1 )
	InitMapInfos()
	Engine.SetDvarBool( "arcademode_full", false )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	Engine.Exec( "profile_difficultyLoad" )
	if f61_arg1.menuIndex == nil then
		f61_arg1 = LUI.LevelSelect.FindActData( f61_arg0.type )
	end
	f0_local10 = f61_arg1.menuIndex
	local f61_local0 = Engine.Localize( "@MENU_MISSION_SELECT_CAPS" )
	if not Engine.IsConsoleGame() then
		local f61_local1 = Engine.IsGamepadEnabled()
	end
	local f61_local2 = f61_arg1.previousActMenu and WrapperTabEvent( f61_arg1.previousActMenu ) or nil
	local f61_local3 = f61_arg1.nextActMenu and WrapperTabEvent( f61_arg1.nextActMenu ) or nil
	local f61_local4 = Engine.GetDvarBool( "arcademode" )
	if f61_local4 then
		f61_local0 = Engine.Localize( "@MENU_ARCADEMODE" )
	end
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = f0_local9 .. f61_arg1.actName
	self:makeFocusable()
	self.properties = {
		mapInfoList = f61_arg1.mapInfoList,
		previousActMenu = f61_arg1.previousActMenu,
		nextActMenu = f61_arg1.nextActMenu,
		title_loc_string = f61_local0
	}
	local f61_local6 = LUI.PreviousMenuName
	local f61_local7 = false
	if f61_local6 then
		f61_local7 = string.find( f61_local6, f0_local8 ) ~= nil
	end
	local f61_local8 = LUI.MenuTemplate.new( f61_arg0, {
		menu_title = f61_local0,
		uppercase_title = true,
		menu_top_indent = LUI.MenuTemplate.spMenuOffset + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		menu_width = f0_local6 - f0_local5,
		skipAnim = f61_local7
	} )
	f61_local8:setClass( LUI.LevelSelect )
	local f61_local9 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f61_local9.red = 0
	f61_local9.blue = 0
	f61_local9.green = 0
	f61_local9.alpha = 0
	
	local bgBlack = LUI.UIImage.new( f61_local9 )
	bgBlack.id = "black_bg_id"
	bgBlack:registerAnimationState( "BlackScreen", {
		alpha = 1
	} )
	bgBlack:registerAnimationState( "Faded", {
		alpha = 0
	} )
	self:addElement( bgBlack )
	self.bgBlack = bgBlack
	
	if f61_local4 then
		f61_local8:SetBreadCrumb( "" )
	end
	f61_local8:addElement( LUI.H1MenuTab.new( {
		title = function ( f63_arg0 )
			return f0_local21[GetRealActIndex( f63_arg0 )].loc_string
		end,
		top = LUI.MenuTemplate.spMenuOffset + LUI.MenuTemplate.ListTop,
		width = f0_local6 - f0_local5,
		tabCount = GetRealActCount( index ),
		clickTabBtnAction = ClickTabBtnAction,
		activeIndex = GetRelativeActIndex( f61_arg1.menuIndex ),
		underTabTextFunc = function ( f64_arg0 )
			local f64_local0 = f0_local21[GetRealActIndex( f64_arg0 )].tab_string
			if not f64_local0 then
				f64_local0 = f0_local21[GetRealActIndex( f64_arg0 )].loc_string
			end
			return f64_local0
		end,
		isTabLockedfunc = function ( f62_arg0 )
			return f0_local21[GetRealActIndex( f62_arg0 )].locked
		end,
		previousDisabled = f61_arg1.previousActMenu == nil,
		nextDisabled = f61_arg1.nextActMenu == nil,
		enableRightLeftNavigation = true,
		skipChangeTab = true,
		exclusiveController = f61_local8.exclusiveController
	} ) )
	f61_local8:AddLevelListButtons( f61_arg1.mapInfoList )
	f61_local8:registerEventHandler( "menu_create", MenuCreate )
	if not f61_local4 and not Engine.GetDvarBool( "profileMenuOption_hasUnlockedAll_SP" ) and not LUI.LevelSelect.IsAllLevelCompleted() then
		local self = LUI.UIBindButton.new()
		self.id = "bindbutton"
		self:registerEventHandler( "gamepad_button", genericAction )
		self:addElement( self )
	end
	f61_local8:AddLocationInfoWindow( {
		skipAnim = f61_local7
	} )
	f61_local8:AddBackButton( backButtonHandler )
	f61_local8:registerEventHandler( "menu_close", function ( element, event )
		local f65_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		f65_local0.currentLevelNumber = nil
	end )
	self:addElement( f61_local8 )
	LUI.LevelSelect.InitializeCheat( f61_local8, function ( f66_arg0, f66_arg1 )
		LUI.FlowManager.RequestAddMenu( nil, LUI.LevelSelect.FirstCampaignMenuName, true, f66_arg1.controller, true, LUI.LevelSelect.FindActData( LUI.LevelSelect.FirstCampaignMenuName ), {
			reload = true
		} )
	end )
	return self
end

for f0_local30 = 1, #f0_local21, 1 do
	LUI.MenuBuilder.registerType( f0_local8 .. f0_local21[f0_local30].actName, LUI.LevelSelect.new )
end
LockTable( _M )
