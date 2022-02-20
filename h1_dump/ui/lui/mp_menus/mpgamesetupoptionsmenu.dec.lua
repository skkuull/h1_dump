local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPGameSetupOptionsMenu = InheritFrom( LUI.GroupedOptionsBase )
FFAGameType = "dm"
TDMGametype = "war"
SDGameType = "sd"
DomGameType = "dom"
ConfGameType = "conf"
CTFGameType = "ctf"
HPGameType = "hp"
GunGameType = "gun"
SabGameType = "sab"
HQGameType = "koth"
DemGameType = "dd"
Category = {
	Game = 1,
	General = 2,
	Spawn = 3,
	HealthDamage = 4,
	CustomClasses = 5,
	PresetClasses = 6,
	Killstreaks = 7
}
ForcedSettings = {
	WinByCaptures = {
		scoreLimit = 0
	},
	Hardcore = {
		ffType = 1,
		maxHealth = 30,
		spectateModeAllowed = 0,
		showKillcam = false,
		radarAlwaysOn = false,
		healthRegen = 0,
		chatterDisabled = true,
		waveRespawnDelay = 15
	},
	OldSchool = {
		maxHealth = 250,
		healthRegen = 0
	},
	RadarAlwaysOn = {
		killstreakUAVKills = 0
	}
}
GameTypeRefCol = 0
GameTypeNameCol = 1
GameTypeDescCol = 2
GameTypeImageCol = 3
function GetCurrentGameTypeLocalizedInfo( f1_arg0 )
	local f1_local0 = Engine.TableLookup( "mp/gameTypesTable.csv", GameTypeRefCol, GetCurrentGameType(), f1_arg0 )
	local f1_local1 = "@"
	local f1_local2
	if f1_arg0 == GameTypeNameCol then
		f1_local2 = "_CAPS"
		if not f1_local2 then
		
		else
			local f1_local3
			if f1_local0 then
				f1_local3 = Engine.Localize( f1_local1 .. f1_local0 .. f1_local2 )
				if not f1_local3 then
				
				else
					return f1_local3
				end
			end
			f1_local3 = "GAMETYPE NOT FOUND"
		end
	end
	f1_local2 = ""
end

function GetGameTypeIcon()
	local f2_local0 = GetCurrentGameType()
	assert( f2_local0, "GAMETYPE NOT FOUND" )
	local f2_local1 = Engine.TableLookup( "mp/gameTypesTable.csv", GameTypeRefCol, f2_local0, GameTypeImageCol )
	local f2_local2
	if f2_local1 then
		f2_local2 = RegisterMaterial( f2_local1 )
		if not f2_local2 then
		
		else
			return f2_local2
		end
	end
	f2_local2 = RegisterMaterial( "icon_playlist_generic" )
end

function CreateDefaultClassesAction( f3_arg0, f3_arg1 )
	local f3_local0 = false
	local f3_local1 = true
	local f3_local2 = {
		editMatchPresets = true
	}
	Cac.SetSelectedControllerIndex( f3_arg1.controller )
	LUI.FlowManager.RequestAddMenu( f3_arg0, "CacMenu", f3_local1, f3_arg1.controller, f3_local0, f3_local2 )
end

function SaveRecipeToMyModes( f4_arg0, f4_arg1 )
	MatchRules.OpenSelectionMenu( f4_arg1.controller, {
		savedMode = "save",
		menuAction = "save",
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_MY_MODES" ) ),
		return_menu = "settings_recipe_rules_base"
	} )
end

function IsHardcoreModeFunc()
	return MatchRules.GetData( "commonOption", "hardcoreModeOn" )
end

function IsOldSchoolModeFunc()
	return MatchRules.GetData( "commonOption", "oldSchoolModeOn" )
end

function IsUsingWaveSpawning()
	return MatchRules.GetData( "commonOption", "waveRespawnDelay" ) > 0
end

function IsRadarAlwaysOnFunc()
	return MatchRules.GetData( "commonOption", "radarAlwaysOn" )
end

function LockSpectatingPOV()
	return MatchRules.GetData( "commonOption", "spectateModeAllowed" ) == 0
end

function TeamKillDisableFunc()
	local f10_local0 = MatchRules.GetData( "commonOption", "ffType" )
	local f10_local1
	if f10_local0 ~= 0 and f10_local0 ~= 2 then
		f10_local1 = false
	else
		f10_local1 = true
	end
	return f10_local1
end

function OptionsLockedForMLG()
	local f11_local0 = LUI.mp_menus.MPGameSetupMenu.DevMLGOptionsUnlocked
	if not f11_local0 then
		f11_local0 = Engine.GetDvarBool( "lui_mlg_rules_unlocked" )
	end
	local f11_local1
	if not f11_local0 then
		f11_local1 = MLG.AreMLGRulesEnabled()
	else
		f11_local1 = false
	end
	return f11_local1
end

function OptionFactory( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5, f12_arg6, f12_arg7, f12_arg8 )
	local f12_local0 = function ()
		local f13_local0 = 1
		local f13_local1 = MatchRules.GetData( f12_arg0, f12_arg1 )
		for f13_local5, f13_local6 in pairs( f12_arg3 ) do
			if f13_local6.value == f13_local1 then
				return f13_local5
			end
		end
		DebugPrint( "MatchRules data matched no option, default to option 1: " .. f12_arg0 .. " " .. f12_arg1 )
		return 1
	end
	
	local f12_local1 = function ( f14_arg0, f14_arg1 )
		MatchRules.SetData( f12_arg0, f12_arg1, f12_arg3[f14_arg1].value )
		f14_arg0:dispatchEventToRoot( {
			name = "rule_changed_" .. f12_arg0 .. "_" .. f12_arg1,
			immediate = true
		} )
		f14_arg0:dispatchEventToRoot( {
			name = "content_refresh",
			immediate = true
		} )
		f14_arg0:dispatchEventToRoot( {
			name = "refresh_disabled",
			immediate = true
		} )
	end
	
	return {
		type = "UIGenericButton",
		id = "option_" .. f12_arg0 .. "_" .. f12_arg1,
		disabledFunc = function ( f15_arg0, f15_arg1 )
			if not f12_arg6 and OptionsLockedForMLG() then
				return true
			elseif f12_arg4 then
				return f12_arg4( f15_arg0, f15_arg1 )
			else
				return false
			end
		end
		,
		audio = {
			button_over = CoD.SFX.SubMenuMouseOver
		},
		properties = {
			style = GenericButtonSettings.Styles.GlassButton,
			substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu,
			variant = GenericButtonSettings.Variants.Select,
			button_text = Engine.Localize( f12_arg2 ),
			text_align_with_content = LUI.Alignment.Left,
			button_display_func = function ( f16_arg0, f16_arg1 )
				if f12_arg7 ~= nil then
					local f16_local0 = f12_arg7( f16_arg0, f16_arg1 )
					if f16_local0 ~= nil then
						return Engine.Localize( f16_local0 )
					end
				end
				local f16_local0 = f12_local0()
				return Engine.Localize( f12_arg3[f12_local0()].text )
			end
			,
			button_left_func = function ( f17_arg0, f17_arg1 )
				local f17_local0 = f12_local0()
				repeat
					f17_local0 = 1 + (#f12_arg3 + f17_local0 - 1 - 1) % #f12_arg3
				until f12_arg8 == nil or f12_arg8( f12_arg3[f17_local0].value )
				f12_local1( f17_arg0, f17_local0 )
			end
			,
			button_right_func = function ( f18_arg0, f18_arg1 )
				local f18_local0 = f12_local0()
				repeat
					f18_local0 = 1 + (f18_local0 - 1 + 1) % #f12_arg3
				until f12_arg8 == nil or f12_arg8( f12_arg3[f18_local0].value )
				f12_local1( f18_arg0, f18_local0 )
			end
			
		},
		handlers = f12_arg5 or {}
	}
end

function ChangeForcedSettings( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f19_arg0 )
	if f19_local0.savedSettings == nil then
		f19_local0.savedSettings = {}
	end
	if f19_arg2 then
		local f19_local1 = ForcedSettings[f19_arg1]
		local f19_local2 = {}
		f19_local0.savedSettings[f19_arg1] = f19_local2
		for f19_local6, f19_local7 in pairs( f19_local1 ) do
			f19_local2[f19_local6] = MatchRules.GetData( "commonOption", f19_local6 )
			MatchRules.SetData( "commonOption", f19_local6, f19_local7 )
		end
	else
		local f19_local1 = f19_local0.savedSettings[f19_arg1]
		if f19_local1 == nil then
			LoadMatchRules()
			f19_arg0:dispatchEventToRoot( {
				name = "rules_reset",
				immediate = true
			} )
			return 
		end
		for f19_local5, f19_local6 in pairs( f19_local1 ) do
			MatchRules.SetData( "commonOption", f19_local5, f19_local6 )
		end
	end
end

function GetOptionClassForGameType( f20_arg0 )
	if f20_arg0 == DomGameType then
		return "domData"
	elseif f20_arg0 == DemGameType then
		return "demData"
	elseif f20_arg0 == HQGameType then
		return "hqData"
	elseif f20_arg0 == SabGameType then
		return "sabData"
	elseif f20_arg0 == GunGameType then
		return "gunData"
	elseif f20_arg0 == HPGameType then
		return "hpData"
	elseif f20_arg0 == SDGameType then
		return "sdData"
	else
		assert( false, "No Option Class for Game Type" .. f20_arg0 )
		return ""
	end
end

function OnCTFWinConditionChanged( f21_arg0, f21_arg1 )
	ChangeForcedSettings( f21_arg0, "WinByCaptures", MatchRules.GetData( "ctfData", "winByCaptures" ) )
end

function IsCTFCaptureLimitDisabled()
	return MatchRules.GetData( "ctfData", "winByCaptures" )
end

function GameOptionsFeeder()
	local f23_local0 = {}
	local f23_local1 = GetCurrentGameType()
	local f23_local2 = function ()
		return true
	end
	
	if f23_local1 == FFAGameType or f23_local1 == TDMGametype or f23_local1 == DomGameType or f23_local1 == ConfGameType or f23_local1 == CTFGameType or f23_local1 == HPGameType or f23_local1 == GunGameType or f23_local1 == SabGameType or f23_local1 == HQGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "timeLimit", "@LUA_MENU_RULES_TIME_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_2_5MINUTES",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5MINUTES",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_10MINUTES",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15MINUTES",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20MINUTES",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_30MINUTES",
				value = 30
			}
		} )
	end
	if f23_local1 == SDGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "sdData", "roundLength", "@LUA_MENU_RULES_ROUND_LENGTH", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1MINUTE",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_1_25MINUTES",
				value = 1.25
			},
			{
				text = "@LUA_MENU_RULES_1_5MINUTES",
				value = 1.5
			},
			{
				text = "@LUA_MENU_RULES_2_5MINUTES",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_3MINUTES",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_5MINUTES",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_8MINUTES",
				value = 8
			},
			{
				text = "@LUA_MENU_RULES_10MINUTES",
				value = 10
			}
		} )
	end
	if f23_local1 == DemGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "demData", "roundLength", "@LUA_MENU_RULES_ROUND_LENGTH", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1MINUTE",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_1_25MINUTES",
				value = 1.25
			},
			{
				text = "@LUA_MENU_RULES_1_5MINUTES",
				value = 1.5
			},
			{
				text = "@LUA_MENU_RULES_2_5MINUTES",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_3MINUTES",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_5MINUTES",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_8MINUTES",
				value = 8
			}
		} )
	end
	if f23_local1 == FFAGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_10POINTS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15POINTS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20POINTS",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_25POINTS",
				value = 25
			},
			{
				text = "@LUA_MENU_RULES_30POINTS",
				value = 30
			},
			{
				text = "@LUA_MENU_RULES_50POINTS",
				value = 50
			},
			{
				text = "@LUA_MENU_RULES_60POINTS",
				value = 60
			},
			{
				text = "@LUA_MENU_RULES_100POINTS",
				value = 100
			},
			{
				text = "@LUA_MENU_RULES_140POINTS",
				value = 140
			}
		} )
	end
	if f23_local1 == TDMGametype then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_25POINTS",
				value = 25
			},
			{
				text = "@LUA_MENU_RULES_50POINTS",
				value = 50
			},
			{
				text = "@LUA_MENU_RULES_75POINTS",
				value = 75
			},
			{
				text = "@LUA_MENU_RULES_100POINTS",
				value = 100
			},
			{
				text = "@LUA_MENU_RULES_125POINTS",
				value = 125
			},
			{
				text = "@LUA_MENU_RULES_150POINTS",
				value = 150
			}
		} )
	end
	if f23_local1 == SDGameType or f23_local1 == SabGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1POINT",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2POINTS",
				value = 2
			},
			{
				text = "@LUA_MENU_RULES_4POINTS",
				value = 4
			},
			{
				text = "@LUA_MENU_RULES_6POINTS",
				value = 6
			},
			{
				text = "@LUA_MENU_RULES_8POINTS",
				value = 8
			},
			{
				text = "@LUA_MENU_RULES_12POINTS",
				value = 12
			}
		} )
	end
	if f23_local1 == DomGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_50POINTS",
				value = 50
			},
			{
				text = "@LUA_MENU_RULES_100POINTS",
				value = 100
			},
			{
				text = "@LUA_MENU_RULES_200POINTS",
				value = 200
			},
			{
				text = "@LUA_MENU_RULES_500POINTS",
				value = 500
			},
			{
				text = "@LUA_MENU_RULES_750POINTS",
				value = 750
			}
		} )
	end
	if f23_local1 == ConfGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_10POINTS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_30POINTS",
				value = 30
			},
			{
				text = "@LUA_MENU_RULES_65POINTS",
				value = 65
			},
			{
				text = "@LUA_MENU_RULES_80POINTS",
				value = 80
			},
			{
				text = "@LUA_MENU_RULES_100POINTS",
				value = 100
			},
			{
				text = "@LUA_MENU_RULES_120POINTS",
				value = 120
			}
		} )
	end
	if f23_local1 == CTFGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_CAPTURE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_3POINTS",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_5POINTS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_10POINTS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_20POINTS",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_30POINTS",
				value = 30
			}
		}, IsCTFCaptureLimitDisabled )
	end
	if f23_local1 == HPGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_75POINTS",
				value = 75
			},
			{
				text = "@LUA_MENU_RULES_150POINTS",
				value = 150
			},
			{
				text = "@LUA_MENU_RULES_250POINTS",
				value = 250
			},
			{
				text = "@LUA_MENU_RULES_300POINTS",
				value = 300
			},
			{
				text = "@LUA_MENU_RULES_500POINTS",
				value = 500
			}
		} )
	end
	if f23_local1 == HQGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "commonOption", "scoreLimit", "@LUA_MENU_RULES_SCORE_LIMIT", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_75POINTS",
				value = 75
			},
			{
				text = "@LUA_MENU_RULES_150POINTS",
				value = 150
			},
			{
				text = "@LUA_MENU_RULES_250POINTS",
				value = 250
			},
			{
				text = "@LUA_MENU_RULES_300POINTS",
				value = 300
			},
			{
				text = "@LUA_MENU_RULES_500POINTS",
				value = 500
			}
		} )
	end
	if f23_local1 == HQGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "hqData", "HQLifetime", "@MPUI_RULES_HQ_HOLD_TIME", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			},
			{
				text = "@LUA_MENU_RULES_45SECONDS",
				value = 45
			},
			{
				text = "@LUA_MENU_RULES_1MINUTE",
				value = 60
			},
			{
				text = "@LUA_MENU_RULES_90SECONDS",
				value = 90
			},
			{
				text = "@LUA_MENU_RULES_120SECONDS",
				value = 120
			},
			{
				text = "@LUA_MENU_RULES_5MINUTES",
				value = 300
			},
			{
				text = "@LUA_MENU_RULES_10MINUTES",
				value = 600
			}
		} )
	end
	if f23_local1 == HQGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "hqData", "HQActivateDelay", "@MPUI_RULES_HQ_RESPAWN_DELAY", {
			{
				text = "@MPUI_RULES_INSTANT",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			},
			{
				text = "@LUA_MENU_RULES_1MINUTE",
				value = 60
			}
		} )
	end
	if f23_local1 == HQGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "hqData", "HQClassicMode", "@MPUI_RULES_CLASSIC_HQ", {
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			}
		} )
	end
	if f23_local1 == SDGameType or f23_local1 == SabGameType or f23_local1 == DemGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( GetOptionClassForGameType( f23_local1 ), "bombTimer", "@LUA_MENU_RULES_BOMB_TIMER", {
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			},
			{
				text = "@LUA_MENU_RULES_45SECONDS",
				value = 45
			},
			{
				text = "@LUA_MENU_RULES_1MINUTE",
				value = 60
			}
		} )
	end
	if f23_local1 == SDGameType or f23_local1 == SabGameType or f23_local1 == DemGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( GetOptionClassForGameType( f23_local1 ), "plantTime", "@LUA_MENU_RULES_PLANT_TIME", {
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			}
		} )
	end
	if f23_local1 == SDGameType or f23_local1 == SabGameType or f23_local1 == DemGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( GetOptionClassForGameType( f23_local1 ), "defuseTime", "@LUA_MENU_RULES_DEFUSE_TIME", {
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			}
		} )
	end
	if f23_local1 == SDGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "sdData", "multiBomb", "@LUA_MENU_RULES_MULTI_BOMB", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		} )
	end
	if f23_local1 == SDGameType or f23_local1 == SabGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( GetOptionClassForGameType( f23_local1 ), "roundSwitch", "@LUA_MENU_RULES_ROUND_SWITCH", {
			{
				text = "@LUA_MENU_RULES_NEVER",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_EVERY_ROUND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_EVERY_2ROUNDS",
				value = 2
			},
			{
				text = "@LUA_MENU_RULES_EVERY_3ROUNDS",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_EVERY_4ROUNDS",
				value = 4
			}
		} )
	end
	if f23_local1 == SDGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "sdData", "silentPlant", "@LUA_MENU_RULES_SILENT_PLANT", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		} )
	end
	if f23_local1 == SabGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "sabData", "sharedBombTimer", "@MPUI_RULES_SHARE_BOMB_TIMER", {
			{
				text = "@LUA_MENU_NO",
				value = false
			},
			{
				text = "@LUA_MENU_YES",
				value = true
			}
		} )
	end
	if f23_local1 == SabGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "sabData", "silentPlant", "@LUA_MENU_RULES_SILENT_PLANT", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		} )
	end
	if f23_local1 == DemGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "demData", "silentPlant", "@LUA_MENU_RULES_SILENT_PLANT", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		} )
	end
	if f23_local1 == DemGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "demData", "extraTime", "@MPUI_RULES_ADD_TIME", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 0.5
			},
			{
				text = "@LUA_MENU_RULES_1MINUTE",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_1_5MINUTES",
				value = 1.5
			},
			{
				text = "@LUA_MENU_RULES_2_5MINUTES",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_3MINUTES",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_5MINUTES",
				value = 5
			}
		} )
	end
	if f23_local1 == GunGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "gunData", "weaponList", "@LUA_MENU_RULES_GUN_PROGRESSION", {
			{
				text = "@LUA_MENU_RULES_NORMAL",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_GUN_CQC",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_GUN_MARKSMAN",
				value = 2
			},
			{
				text = "@LUA_MENU_RULES_GUN_ASSAULT",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_GUN_SMG",
				value = 4
			},
			{
				text = "@LUA_MENU_RULES_GUN_SNIPER",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_GUN_SHOTGUN",
				value = 6
			},
			{
				text = "@LUA_MENU_RULES_GUN_LMG",
				value = 7
			},
			{
				text = "@LUA_MENU_RULES_GUN_PISTOL",
				value = 8
			},
			{
				text = "@LUA_MENU_RULES_GUN_TUBES",
				value = 9
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "gunData", "weaponOrder", "@LUA_MENU_RULES_GUN_ORDER", {
			{
				text = "@LUA_MENU_RULES_NORMAL",
				value = 0
			},
			{
				text = "@LUA_MENU_RANDOM",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_REVERSE",
				value = 2
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "gunData", "weaponListEnd", "@LUA_MENU_RULES_GUN_PROGRESSION_END", {
			{
				text = "@LUA_MENU_RULES_GUN_RPG_MELEE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_GUN_MELEE_RPG",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_GUN_RPG",
				value = 2
			},
			{
				text = "@LUA_MENU_RULES_GUN_MELEE",
				value = 3
			},
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 4
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "gunData", "weaponAttachments", "@LUA_MENU_RULES_GUN_ATTACHMENTS", {
			{
				text = "@LUA_MENU_RULES_NORMAL",
				value = 0
			},
			{
				text = "@LUA_MENU_RANDOM",
				value = 1
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "gunData", "cycleCount", "@LUA_MENU_RULES_GUN_CYCLES", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "@LUA_MENU_1",
				value = 1
			},
			{
				text = "@LUA_MENU_2",
				value = 2
			},
			{
				text = "@LUA_MENU_3",
				value = 3
			},
			{
				text = "@LUA_MENU_4",
				value = 4
			},
			{
				text = "@LUA_MENU_5",
				value = 5
			},
			{
				text = "@LUA_MENU_6",
				value = 6
			},
			{
				text = "@LUA_MENU_7",
				value = 7
			},
			{
				text = "@LUA_MENU_8",
				value = 8
			},
			{
				text = "@LUA_MENU_9",
				value = 9
			},
			{
				text = "@LUA_MENU_10",
				value = 10
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "gunData", "setbackLevels", "@LUA_MENU_RULES_SETBACK_LEVELS", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_1",
				value = 1
			},
			{
				text = "@LUA_MENU_2",
				value = 2
			},
			{
				text = "@LUA_MENU_3",
				value = 3
			}
		} )
	elseif f23_local1 == DomGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "domData", "captureTime", "@LUA_MENU_RULES_CAPTURE_TIME", {
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "domData", "allowNeutral", "@LUA_MENU_RULES_ALLOW_NEUTRAL", {
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			}
		} )
		local f23_local3 = {
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			}
		}
		f23_local0[#f23_local0 + 1] = OptionFactory( "domData", "halfTime", "@LUA_MENU_RULES_HALFTIME", f23_local3 )
		f23_local0[#f23_local0 + 1] = OptionFactory( "domData", "halfTimeSwitchSides", "@LUA_MENU_RULES_HALFTIME_SWITCH_SIDES", f23_local3 )
	elseif f23_local1 == CTFGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "ctfData", "winByCaptures", "@LUA_MENU_RULES_WIN_CONDITION", {
			{
				text = "@LUA_MENU_RULES_ROUNDS_WON",
				value = false
			},
			{
				text = "@LUA_MENU_RULES_FLAG_CAPTURES",
				value = true
			}
		}, nil, {
			rule_changed_ctfData_winByCaptures = OnCTFWinConditionChanged
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "ctfData", "returnTime", "@LUA_MENU_RULES_RETURN_TIME", {
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			},
			{
				text = "@LUA_MENU_RULES_45SECONDS",
				value = 45
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "ctfData", "pickupTime", "@LUA_MENU_RULES_PICKUP_TIME", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "ctfData", "enemyCarrierIcon", "@LUA_MENU_RULES_CARRIER_ICON", {
			{
				text = "@LUA_MENU_ENABLED",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_DELAYED",
				value = 1
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = 2
			}
		} )
	elseif f23_local1 == HPGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "hpData", "initDelay", "@LUA_MENU_RULES_ACTIVE_DELAY", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			}
		} )
		f23_local0[#f23_local0 + 1] = OptionFactory( "hpData", "randomZones", "@LUA_MENU_RULES_LOCATION_ORDER", {
			{
				text = "@LUA_MENU_RULES_NORMAL",
				value = false
			},
			{
				text = "@LUA_MENU_RANDOM",
				value = true
			}
		} )
	elseif f23_local1 == ConfGameType then
		f23_local0[#f23_local0 + 1] = OptionFactory( "confData", "killstreakPointsType", "@LUA_MENU_RULES_KILLSTREAK_POINTS_FROM", {
			{
				text = "@LUA_MENU_RULES_KILLSTREAK_KILLS",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_KILLSTREAK_TAGS",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_KILLSTREAK_KILLS_AND_TAGS",
				value = 2
			}
		} )
	end
	return f23_local0
end

function PresetClassesOptionsFeeder()
	local f25_local0 = {
		[#f25_local0 + 1] = {
			type = "UIGenericButton",
			id = "create_default_classes",
			disabledFunc = OptionsLockedForMLG,
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu,
				variant = GenericButtonSettings.Variants.Info,
				button_display_func = function ( f26_arg0, f26_arg1 )
					local f26_local0 = Cac.HasCustomClasses( "defaultClassesTeam1" )
					if not f26_local0 then
						f26_local0 = Cac.HasCustomClasses( "defaultClassesTeam2" )
					end
					local f26_local1
					if f26_local0 then
						f26_local1 = Engine.Localize( "MENU_CUSTOM" )
						if not f26_local1 then
						
						else
							return f26_local1
						end
					end
					f26_local1 = Engine.Localize( "@LUA_MENU_DEFAULT" )
				end,
				button_text = Engine.Localize( "@LUA_MENU_RULES_EDIT_DEF_CLASSES" ),
				button_action_func = CreateDefaultClassesAction
			},
			handlers = {
				element_refresh = MBh.EmitEvent( "content_refresh" )
			}
		}
	}
	return f25_local0
end

function AreRestrictionsDisabled()
	if OptionsLockedForMLG() then
		return true
	else
		return not MatchRules.AllowCustomClasses()
	end
end

function GetCategoryRestrictState( f28_arg0 )
	local f28_local0 = Cac.Restrict.CategData[f28_arg0]
	for f28_local1 = 1, #f28_local0.SubtypeData, 1 do
		local f28_local4 = LUI.mp_menus.MPCustomClassRestrictions.GetRestrictState( f28_arg0, f28_local1 )
		if f28_local4 ~= Cac.Restrict.State.AllowAll then
			return f28_local4
		end
	end
	return Cac.Restrict.State.AllowAll
end

function AddRestrictButton( f29_arg0, f29_arg1 )
	f29_arg0[#f29_arg0 + 1] = {
		type = "UIGenericButton",
		id = "restrict_btn_" .. f29_arg1,
		disabledFunc = AreRestrictionsDisabled,
		properties = {
			style = GenericButtonSettings.Styles.GlassButton,
			substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu,
			variant = GenericButtonSettings.Variants.Info,
			button_display_func = function ( f30_arg0, f30_arg1 )
				if not MatchRules.AllowCustomClasses() then
					return Engine.Localize( "@LUA_MENU_RESTRICTED" )
				elseif GetCategoryRestrictState( f29_arg1 ) ~= Cac.Restrict.State.AllowAll then
					return Engine.Localize( "MENU_CUSTOM" )
				else
					return Engine.Localize( "@LUA_MENU_UNRESTRICTED" )
				end
			end,
			button_text = Engine.Localize( Cac.Restrict.CategData[f29_arg1].ActionText ),
			button_action_func = function ( f31_arg0, f31_arg1 )
				LUI.FlowManager.RequestAddMenu( f31_arg0, "ClassRestrictMenu", true, f31_arg1.controller, false, {
					category = f29_arg1
				} )
			end,
			text_align_with_content = LUI.Alignment.Left
		},
		handlers = {
			element_refresh = MBh.EmitEvent( "content_refresh" )
		}
	}
end

function CustomClassOptionsFeeder()
	local f32_local0 = {
		[#f32_local0 + 1] = OptionFactory( "commonOption", "allowCustomClasses", "@LUA_MENU_RULES_CUSTOM_CLASSES", {
			{
				text = "@LUA_MENU_YES",
				value = true
			},
			{
				text = "@LUA_MENU_NO",
				value = false
			}
		} )
	}
	local f32_local1 = {}
	for f32_local2 = 3, 20, 1 do
		f32_local1[#f32_local1 + 1] = {
			text = f32_local2,
			value = f32_local2
		}
	end
	for f32_local2 = 1, #Cac.Restrict.CategData, 1 do
		local f32_local5
		if Cac.Restrict.CategData[f32_local2].CategKey ~= "Melee" or false ~= IsOnlineMatch() then
			f32_local5 = false
		else
			f32_local5 = true
		end
		if f32_local5 == false then
			AddRestrictButton( f32_local0, f32_local2 )
		end
	end
	return f32_local0
end

function GeneralOptionsFeeder()
	local f33_local0 = {}
	local f33_local1 = GetCurrentGameType()
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "preMatchTimer", "@LUA_MENU_RULES_PREMATCH_TIMER", {
		{
			text = "@LUA_MENU_RULES_5SECONDS",
			value = 5
		},
		{
			text = "@LUA_MENU_RULES_10SECONDS",
			value = 10
		},
		{
			text = "@LUA_MENU_RULES_15SECONDS",
			value = 15
		},
		{
			text = "@LUA_MENU_RULES_30SECONDS",
			value = 30
		},
		{
			text = "@LUA_MENU_RULES_45SECONDS",
			value = 45
		},
		{
			text = "@LUA_MENU_RULES_1MINUTE",
			value = 60
		}
	}, nil, nil, true )
	if IsGameTypeRoundBased( f33_local1 ) then
		f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "preRoundTimer", "@LUA_MENU_RULES_PREROUND_TIMER", {
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20SECONDS",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_25SECONDS",
				value = 25
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			}
		}, nil, nil, true )
	end
	if IsCurrentGameTypeteamBased() then
		f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "switchTeamDisabled", "@LUA_MENU_RULES_TEAM_SWITCH", {
			{
				text = "@LUA_MENU_ENABLED",
				value = false
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = true
			}
		} )
	end
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "spectateModeAllowed", "@LUA_MENU_RULES_SPECTATING", {
		{
			text = "@LUA_MENU_DISABLED",
			value = 0
		},
		{
			text = IsCurrentGameTypeteamBased() and "@LUA_MENU_RULES_TEAM_ONLY" or "@LUA_MENU_RULES_PLAYERS_ONLY",
			value = 1
		},
		{
			text = "@LUA_MENU_RULES_FREE",
			value = 2
		}
	} )
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "spectateModePOV", "@LUA_MENU_RULES_SPECTATE_POV", {
		{
			text = "@LUA_MENU_RULES_FIRST_OR_THIRD_PERSON",
			value = 0
		},
		{
			text = "@LUA_MENU_RULES_FIRST_PERSON",
			value = 1
		},
		{
			text = "@LUA_MENU_RULES_THIRD_PERSON",
			value = 2
		}
	}, LockSpectatingPOV )
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "showKillcam", "@LUA_MENU_RULES_KILLCAM", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	} )
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "radarAlwaysOn", "@LUA_MENU_RULES_MINIMAP_RADAR", {
		{
			text = "@LUA_MENU_RULES_NORMAL",
			value = false
		},
		{
			text = "@LUA_MENU_RULES_ALWAYS_ON",
			value = true
		}
	}, nil, {
		rule_changed_commonOption_radarAlwaysOn = function ( f34_arg0, f34_arg1 )
			ChangeForcedSettings( f34_arg0, "RadarAlwaysOn", IsRadarAlwaysOnFunc() )
		end
	} )
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "chatterDisabled", "@LUA_MENU_RULES_BATTLE_CHATTER", {
		{
			text = "@LUA_MENU_ENABLED",
			value = false
		},
		{
			text = "@LUA_MENU_DISABLED",
			value = true
		}
	} )
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "announcerDisabled", "@LUA_MENU_RULES_ANNOUNCER", {
		{
			text = "@LUA_MENU_ENABLED",
			value = false
		},
		{
			text = "@LUA_MENU_DISABLED",
			value = true
		}
	} )
	f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "disableSprint", "@LUA_MENU_RULES_DISABLE_SPRINT", {
		{
			text = "@LUA_MENU_ENABLED",
			value = false
		},
		{
			text = "@LUA_MENU_DISABLED",
			value = true
		}
	} )
	if f33_local1 ~= GunGameType then
		f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "deleteTurrets", "@LUA_MENU_RULES_DELETE_TURRETS", {
			{
				text = "@LUA_MENU_ENABLED",
				value = false
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = true
			}
		} )
	end
	if f33_local1 == SDGameType or f33_local1 == DomGameType or f33_local1 == CTFGameType or f33_local1 == SabGameType or f33_local1 == DemGameType then
		f33_local0[#f33_local0 + 1] = OptionFactory( "commonOption", "killCountPersists", "@LUA_MENU_RULES_KILL_COUNT", {
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			},
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			}
		} )
	end
	return f33_local0
end

function SpawnOptionsFeeder()
	local f35_local0 = {
		[#f35_local0 + 1] = OptionFactory( "commonOption", "respawnDelay", "@LUA_MENU_RULES_RESPAWN_DELAY", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20SECONDS",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			}
		} ),
		[#f35_local0 + 1] = OptionFactory( "commonOption", "forceRespawn", "@LUA_MENU_RULES_FORCE_RESPAWN", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, IsUsingWaveSpawning, nil, nil, function ()
			if IsUsingWaveSpawning() then
				return "@LUA_MENU_ENABLED"
			else
				
			end
		end
		 ),
		[#f35_local0 + 1] = OptionFactory( "commonOption", "waveRespawnDelay", "@LUA_MENU_RULES_WAVE_DELAY", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20SECONDS",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			}
		} ),
		[#f35_local0 + 1] = OptionFactory( "commonOption", "suicidePenalty", "@LUA_MENU_RULES_SUICIDE_PENALTY", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20SECONDS",
				value = 20
			}
		} )
	}
	if IsCurrentGameTypeteamBased() then
		f35_local0[#f35_local0 + 1] = OptionFactory( "commonOption", "teamKillPenalty", "@LUA_MENU_RULES_TEAMKILL_PENALTY", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20SECONDS",
				value = 20
			}
		}, TeamKillDisableFunc )
	end
	return f35_local0
end

function HealthDamageOptionsFeeder()
	local f37_local0 = {}
	local f37_local1 = GetCurrentGameType()
	if f37_local1 == FFAGameType or f37_local1 == TDMGametype or f37_local1 == ConfGameType or f37_local1 == SDGameType or f37_local1 == DomGameType or f37_local1 == CTFGameType or f37_local1 == HPGameType or f37_local1 == SabGameType or f37_local1 == HQGameType or f37_local1 == DemGameType then
		f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "hardcoreModeOn", "@LUA_MENU_RULES_HARDCORE", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, nil, {
			rule_changed_commonOption_hardcoreModeOn = function ( f38_arg0, f38_arg1 )
				ChangeForcedSettings( f38_arg0, "Hardcore", IsHardcoreModeFunc() )
			end
		} )
	end
	if f37_local1 == FFAGameType or f37_local1 == TDMGametype or f37_local1 == ConfGameType or f37_local1 == SDGameType or f37_local1 == DomGameType or f37_local1 == CTFGameType or f37_local1 == HPGameType or f37_local1 == SabGameType or f37_local1 == HQGameType or f37_local1 == DemGameType then
		f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "oldSchoolModeOn", "@LUA_MENU_RULES_OLDSCHOOL", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, nil, {
			rule_changed_commonOption_oldSchoolModeOn = function ( f39_arg0, f39_arg1 )
				ChangeForcedSettings( f39_arg0, "OldSchool", IsOldSchoolModeFunc() )
			end
		} )
	end
	f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "maxHealth", "@LUA_MENU_RULES_MAX_HEALTH", {
		{
			text = "30%",
			value = 30
		},
		{
			text = "50%",
			value = 50
		},
		{
			text = "@LUA_MENU_RULES_NORMAL",
			value = 100
		},
		{
			text = "130%",
			value = 130
		},
		{
			text = "150%",
			value = 150
		},
		{
			text = "200%",
			value = 200
		},
		{
			text = "250%",
			value = 250
		}
	} )
	f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "healthRegen", "@LUA_MENU_RULES_HEALTH_REGEN", {
		{
			text = "@LUA_MENU_RULES_NONE",
			value = 0
		},
		{
			text = "@LUA_MENU_RULES_SLOW",
			value = 10
		},
		{
			text = "@LUA_MENU_RULES_NORMAL",
			value = 5
		},
		{
			text = "@LUA_MENU_RULES_FAST",
			value = 2
		}
	} )
	if f37_local1 ~= GunGameType and IsCurrentGameTypeteamBased() then
		f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "ffType", "@LUA_MENU_RULES_FRIENDLY_FIRE", {
			{
				text = "@LUA_MENU_DISABLED",
				value = 0
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = 1
			},
			{
				text = "@MPUI_RULES_REFLECT",
				value = 2
			},
			{
				text = "@MPUI_RULES_SHARED",
				value = 3
			}
		} )
	end
	f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "numLives", "@LUA_MENU_RULES_NUMBER_OF_LIVES", {
		{
			text = "@LUA_MENU_RULES_UNLIMITED",
			value = 0
		},
		{
			text = "@LUA_MENU_RULES_ITEM_LIFE",
			value = 1
		},
		{
			text = "@LUA_MENU_RULES_ITEM_2LIVES",
			value = 2
		},
		{
			text = "@LUA_MENU_RULES_ITEM_3LIVES",
			value = 3
		},
		{
			text = "@LUA_MENU_RULES_ITEM_5LIVES",
			value = 5
		},
		{
			text = "@LUA_MENU_RULES_ITEM_9LIVES",
			value = 9
		}
	} )
	if f37_local1 ~= GunGameType and IsCurrentGameTypeteamBased() then
		f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "teamKillKickLimit", "@LUA_MENU_RULES_TEAMKILL_KICK", {
			{
				text = "@LUA_MENU_RULES_UNLIMITED",
				value = 0
			},
			{
				text = "1",
				value = 1
			},
			{
				text = "2",
				value = 2
			},
			{
				text = "3",
				value = 3
			},
			{
				text = "4",
				value = 4
			},
			{
				text = "5",
				value = 5
			}
		}, TeamKillDisableFunc )
	end
	f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "headshotsOnly", "@LUA_MENU_RULES_HEADSHOTS_ONLY", {
		{
			text = "@LUA_MENU_DISABLED",
			value = false
		},
		{
			text = "@LUA_MENU_ENABLED",
			value = true
		}
	} )
	f37_local0[#f37_local0 + 1] = OptionFactory( "commonOption", "grenadeGracePeriod", "@LUA_MENU_RULES_GRENADE_GRACE_PERIOD", {
		{
			text = "@LUA_MENU_RULES_NONE",
			value = 0
		},
		{
			text = "@LUA_MENU_RULES_2_5SECONDS",
			value = 2.5
		},
		{
			text = "@LUA_MENU_RULES_5SECONDS",
			value = 5
		},
		{
			text = "@LUA_MENU_RULES_7_5SECONDS",
			value = 7.5
		},
		{
			text = "@LUA_MENU_RULES_10SECONDS",
			value = 10
		},
		{
			text = "@LUA_MENU_RULES_15SECONDS",
			value = 15
		},
		{
			text = "@LUA_MENU_RULES_20SECONDS",
			value = 20
		},
		{
			text = "@LUA_MENU_RULES_30SECONDS",
			value = 30
		}
	} )
	return f37_local0
end

function killstreakKillsValueAllowed( f40_arg0, f40_arg1, f40_arg2 )
	if f40_arg0 == 0 then
		return true
	elseif f40_arg0 == MatchRules.GetData( "commonOption", f40_arg1 ) then
		return false
	elseif f40_arg0 == MatchRules.GetData( "commonOption", f40_arg2 ) then
		return false
	else
		return true
	end
end

function killstreakKillsValueAllowedUAV( f41_arg0 )
	return killstreakKillsValueAllowed( f41_arg0, "killstreakAirStrikeKills", "killstreakHeliKills" )
end

function killstreakKillsValueAllowedAirStrike( f42_arg0 )
	return killstreakKillsValueAllowed( f42_arg0, "killstreakUAVKills", "killstreakHeliKills" )
end

function killstreakKillsValueAllowedHeli( f43_arg0 )
	return killstreakKillsValueAllowed( f43_arg0, "killstreakUAVKills", "killstreakAirStrikeKills" )
end

function KillstreaksOptionsFeeder()
	local f44_local0 = {
		[#f44_local0 + 1] = OptionFactory( "commonOption", "streakGracePeriod", "@LUA_MENU_RULES_STREAK_GRACE_PERIOD", {
			{
				text = "@LUA_MENU_RULES_NONE",
				value = 0
			},
			{
				text = "@LUA_MENU_RULES_1SECOND",
				value = 1
			},
			{
				text = "@LUA_MENU_RULES_2_5SECONDS",
				value = 2.5
			},
			{
				text = "@LUA_MENU_RULES_5SECONDS",
				value = 5
			},
			{
				text = "@LUA_MENU_RULES_7_5SECONDS",
				value = 7.5
			},
			{
				text = "@LUA_MENU_RULES_10SECONDS",
				value = 10
			},
			{
				text = "@LUA_MENU_RULES_15SECONDS",
				value = 15
			},
			{
				text = "@LUA_MENU_RULES_20SECONDS",
				value = 20
			},
			{
				text = "@LUA_MENU_RULES_30SECONDS",
				value = 30
			}
		} )
	}
	local f44_local1 = {
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_DISABLED",
			value = 0
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_1KILL",
			value = 1
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_2KILLS",
			value = 2
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_3KILLS",
			value = 3
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_4KILLS",
			value = 4
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_5KILLS",
			value = 5
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_6KILLS",
			value = 6
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_7KILLS",
			value = 7
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_8KILLS",
			value = 8
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_9KILLS",
			value = 9
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_10KILLS",
			value = 10
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_11KILLS",
			value = 11
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_12KILLS",
			value = 12
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_13KILLS",
			value = 13
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_14KILLS",
			value = 14
		},
		{
			text = "@LUA_MENU_RULES_KILLSTREAK_15KILLS",
			value = 15
		}
	}
	f44_local0[#f44_local0 + 1] = OptionFactory( "commonOption", "killstreakUAVKills", "@LUA_MENU_RULES_KILLSTREAK_UAV", f44_local1, IsRadarAlwaysOnFunc, nil, nil, nil, killstreakKillsValueAllowedUAV )
	f44_local0[#f44_local0 + 1] = OptionFactory( "commonOption", "killstreakAirStrikeKills", "@LUA_MENU_RULES_KILLSTREAK_AIRSTRIKE", f44_local1, nil, nil, nil, nil, killstreakKillsValueAllowedAirStrike )
	f44_local0[#f44_local0 + 1] = OptionFactory( "commonOption", "killstreakHeliKills", "@LUA_MENU_RULES_KILLSTREAK_HELI", f44_local1, nil, nil, nil, nil, killstreakKillsValueAllowedHeli )
	return f44_local0
end

function OptionsFeeder()
	local f45_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "settings_recipe_rules_base" )
	local f45_local1 = f45_local0.currentOptionsCategory
	if f45_local1 == Category.General then
		return GeneralOptionsFeeder()
	elseif f45_local1 == Category.Spawn then
		return SpawnOptionsFeeder()
	elseif f45_local1 == Category.HealthDamage then
		return HealthDamageOptionsFeeder()
	elseif f45_local1 == Category.CustomClasses then
		return CustomClassOptionsFeeder()
	elseif f45_local1 == Category.PresetClasses then
		return PresetClassesOptionsFeeder()
	elseif f45_local1 == Category.Game then
		return GameOptionsFeeder()
	elseif f45_local1 == Category.Killstreaks then
		return KillstreaksOptionsFeeder()
	else
		
	end
end

LUI.MPGameSetupOptionsMenu.OnRulesReset = function ( f46_arg0 )
	local f46_local0 = f46_arg0.subMenu
	f46_local0:processEvent( {
		name = "menu_refresh"
	} )
	f46_local0:processEvent( {
		name = "content_refresh"
	} )
end

LUI.MPGameSetupOptionsMenu.UpdateSubMenu = function ( f47_arg0, f47_arg1 )
	local f47_local0 = f47_arg0.subMenu
	f47_local0:processEvent( {
		name = "pre_menu_refresh",
		options_category = f47_arg1.category,
		categoryName = f47_arg1.label
	} )
	f47_local0:processEvent( {
		name = "menu_refresh"
	} )
	f47_local0:processEvent( {
		name = "content_refresh"
	} )
	OptionsWindowTitleUpdate( f47_local0 )
end

LUI.MPGameSetupOptionsMenu.OnMLGToggle = function ( f48_arg0 )
	local f48_local0 = f48_arg0.subMenu
	Engine.SetDvarBool( "lui_mlg_rules_unlocked", true )
	f48_local0:processEvent( {
		name = "menu_refresh"
	} )
	f48_local0:processEvent( {
		name = "content_refresh"
	} )
end

function OptionsWindowTitleUpdate( f49_arg0 )
	local f49_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f49_arg0 )
	local f49_local1 = ""
	if f49_local0.currentCategoryName then
		f49_local1 = Engine.ToUpperCase( Engine.Localize( f49_local0.currentCategoryName ) )
	end
	f49_arg0:processEvent( {
		name = "update_title",
		title_text = f49_local1
	} )
end

function PrepareMenuRefresh( f50_arg0, f50_arg1 )
	f50_arg0:closeChildren()
	local f50_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f50_arg0 )
	if f50_arg1.options_category then
		f50_local0.currentOptionsCategory = f50_arg1.options_category
		f50_local0.currentCategoryName = f50_arg1.categoryName
	end
end

function gamesetup_options_window()
	return {
		type = "UIElement",
		id = "gamesetup_options_window_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = LUI.GroupedOptionsBase.SubMenuTop,
				height = 99,
				left = LUI.GroupedOptionsBase.SubMenuLeft,
				width = 580
			}
		},
		handlers = {
			options_window_title_update = OptionsWindowTitleUpdate
		},
		children = {
			{
				type = "generic_menu_titlebar",
				id = "gamesetup_options_window_title",
				properties = {
					title_bar_text = "",
					title_bar_alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
				},
				handlers = {
					menu_create = MBh.EmitEventToParent( "options_window_title_update" )
				}
			},
			{
				type = "UIVerticalList",
				id = "gamesetup_options_window_content",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = GenericTitleBarDims.TitleBarHeight,
						bottom = 600
					}
				},
				handlers = {
					pre_menu_refresh = PrepareMenuRefresh
				},
				childrenFeeder = OptionsFeeder
			}
		}
	}
end

LUI.MPGameSetupOptionsMenu.AddCategory = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3, f52_arg4, f52_arg5 )
	local f52_local0 = #f52_arg3 + 1
	f52_arg3[f52_local0] = f52_arg0:AddButton( f52_arg2, nil, f52_arg5, nil, false )
	f52_arg4[f52_local0] = {
		category = f52_arg1,
		label = f52_arg2
	}
	return f52_arg3[f52_local0]
end

f0_local0 = function ( f53_arg0, f53_arg1 )
	if f53_arg1.oldSchoolModeOn then
		f53_arg0.isDisabled = true
		f53_arg0:processEvent( {
			name = "disable"
		} )
	else
		f53_arg0.isDisabled = false
		f53_arg0:processEvent( {
			name = "enable"
		} )
	end
end

LUI.MPGameSetupOptionsMenu.new = function ( f54_arg0, f54_arg1 )
	local f54_local0 = f54_arg1 or {}
	local f54_local1 = f54_local0.numDescriptionLines or 0
	local f54_local2 = LUI.GroupedOptionsBase.new( f54_arg0, {
		menu_title = GetCurrentGameTypeLocalizedInfo( GameTypeNameCol )
	} )
	f54_local2:setClass( LUI.MPGameSetupOptionsMenu )
	f54_local2:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_GAME_SETUP_CAPS" ) ) )
	local f54_local3 = {}
	local f54_local4 = {}
	local f54_local5 = GetCurrentGameType()
	f54_local2:AddCategory( Category.Game, "@LUA_MENU_GAME_RULES", f54_local3, f54_local4 )
	f54_local2:AddCategory( Category.General, "@LUA_MENU_GENERAL_SETTINGS", f54_local3, f54_local4 )
	if f54_local5 ~= GunGameType then
		f54_local2:AddCategory( Category.Killstreaks, "@LUA_MENU_KILLSTREAK_SETTINGS", f54_local3, f54_local4 )
		f54_local2:AddCategory( Category.Spawn, "@LUA_MENU_SPAWN_SETTINGS", f54_local3, f54_local4 )
	end
	f54_local2:AddCategory( Category.HealthDamage, "@LUA_MENU_HEALTH_AND_DAMAGE", f54_local3, f54_local4 )
	if f54_local5 ~= GunGameType then
		local f54_local6 = function ()
			return MatchRules.GetData( "commonOption", "oldSchoolModeOn" )
		end
		
		local f54_local7 = f54_local2:AddCategory( Category.CustomClasses, "@MPUI_CUSTOM_CLASSES", f54_local3, f54_local4, f54_local6 )
		local f54_local8 = f54_local2:AddCategory( Category.PresetClasses, "@LUA_MENU_PRESET_CLASSES", f54_local3, f54_local4, f54_local6 )
	end
	local f54_local7 = LUI.MenuBuilder.buildItems( gamesetup_options_window(), {}, f54_local2, 0, false )
	f54_local7:close()
	f54_local2:InitOptionsMenu( f54_local3, f54_local4, f54_local7, f54_local1 )
	f54_local2:dispatchEventToRoot( {
		name = "set_button_info_text",
		text = GetCurrentGameTypeLocalizedInfo( GameTypeDescCol )
	} )
	f54_local2:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_select",
		helper_text = Engine.Localize( "@LUA_MENU_RECIPE_SAVE_CUSTOM" ),
		side = "right",
		clickable = true,
		priority = -1000
	}, function ( f56_arg0, f56_arg1 )
		SaveRecipeToMyModes( f54_local2, f56_arg1 )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	f54_local2:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_RESET" ),
		side = "right",
		clickable = true,
		priority = -1000
	}, function ( f57_arg0, f57_arg1 )
		LUI.FlowManager.RequestAddMenu( f54_local2, "popup_reset_game_options", true, f57_arg1.controller )
	end )
	f54_local2:registerEventHandler( "rules_reset", function ( element, event )
		Engine.SetDvarBool( "lui_mlg_rules_unlocked", false )
		f54_local2:OnRulesReset()
	end )
	if MLG.AreMLGRulesEnabled() then
		f54_local2:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_start",
			helper_text = Engine.Localize( "@LUA_MENU_TOGGLE" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f59_arg0, f59_arg1 )
			if Engine.GetDvarBool( "lui_mlg_rules_unlocked" ) then
				LUI.FlowManager.RequestAddMenu( f54_local2, "popup_reset_game_options", true, f59_arg1.controller )
			else
				f54_local2:OnMLGToggle()
			end
		end )
	end
	return f54_local2
end

LUI.MenuBuilder.registerDef( "gamesetup_options_window", gamesetup_options_window )
LUI.MenuBuilder.registerType( "settings_recipe_rules_base", LUI.MPGameSetupOptionsMenu.new )
LockTable( _M )
