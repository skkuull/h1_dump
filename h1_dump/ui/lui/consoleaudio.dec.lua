local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ConsoleAudio = {}
function GetVolume()
	return (Engine.GetProfileData( "snd_volume", Engine.GetControllerForLocalClient( 0 ) ) - SliderBounds.Volume.Min) / (SliderBounds.Volume.Max - SliderBounds.Volume.Min)
end

function VolumeLess( f2_arg0 )
	LUI.Options.ProfileDataMenuOption( Engine.GetControllerForLocalClient( 0 ), SliderBounds.Volume.Min, SliderBounds.Volume.Max, -SliderBounds.Volume.Step, "snd_volume" )
end

function VolumeMore( f3_arg0 )
	LUI.Options.ProfileDataMenuOption( Engine.GetControllerForLocalClient( 0 ), SliderBounds.Volume.Min, SliderBounds.Volume.Max, SliderBounds.Volume.Step, "snd_volume" )
end

function SubtitlesToggle( f4_arg0 )
	Engine.SetSubtitlesEnabled( f4_arg0, not Engine.SubtitlesEnabled( f4_arg0 ) )
end

function ChooseLanguageAction( f5_arg0, f5_arg1 )
	LUI.FlowManager.RequestAddMenu( nil, "choose_language_popup", false, controller, false, {} )
end

function GetSubtitlesText( f6_arg0 )
	return LUI.Options.GetToggleTextForProfileData( "subtitles", f6_arg0 )
end

LUI.ConsoleAudio.new = function ( f7_arg0, f7_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f7_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f7_local1 = 0 ~= LUI.ConsoleOptions.FindTypeIndex( LUI.PreviousMenuName )
	local f7_local2 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f7_local2 = -15
	end
	local f7_local3 = LUI.MenuTemplate.new( f7_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_OPTIONS_UPPER_CASE" ) ),
		menu_top_indent = f7_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing + f7_local2,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
		skipAnim = f7_local1
	} )
	f7_local3:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f7_local3:addElement( LUI.H1MenuTab.new( {
		title = function ( f8_arg0 )
			return LUI.ConsoleOptions.Categories[f8_arg0].title
		end,
		tabCount = #LUI.ConsoleOptions.Categories,
		underTabTextFunc = function ( f9_arg0 )
			return LUI.ConsoleOptions.Categories[f9_arg0].title
		end,
		top = f7_local0 + LUI.MenuTemplate.ListTop + f7_local2,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.ConsoleOptions.LoadMenu,
		activeIndex = LUI.ConsoleOptions.FindTypeIndex( "console_audio" ),
		isTabLockedfunc = LUI.ConsoleOptions.IsOptionLocked,
		skipChangeTab = true,
		exclusiveController = f7_local3.exclusiveController
	} ) )
	LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Slider, "@MENU_VOLUME", "@PLATFORM_OPTIONS_GAME_VOLUME_DESC", GetVolume, VolumeLess, VolumeMore )
	if Engine.IsLanguageChoiceAllowed() then
		local f7_local4 = LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Info, "@LUA_MENU_CHOOSE_LANGUAGE", "@LUA_MENU_CHOOSE_LANGUAGE_DESC", function ()
			return ""
		end, nil, nil, ChooseLanguageAction )
		f7_local4.disabledFunc = function ()
			local f11_local0
			if Engine.InFrontend() then
				f11_local0 = Engine.IsMultiplayer()
			else
				f11_local0 = true
			end
			return f11_local0
		end
		
		LUI.UIButton.RefreshDisabled( f7_local4 )
	end
	if Engine.ShouldShowSubtitlesOption() and not Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Select, "@MENU_SUBTITLES", "@PLATFORM_OPTIONS_SUBTITLES_DESC", GetSubtitlesText, SubtitlesToggle, SubtitlesToggle )
	end
	if Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_MUSIC", "@LUA_MENU_MUSIC_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_musicDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_musicDisabled" ), LUI.Options.ToggleDvarFunc( "snd_musicDisabled" ) )
		LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_ANNOUNCER", "@LUA_MENU_ANNOUNCER_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_announcerDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_announcerDisabled" ), LUI.Options.ToggleDvarFunc( "snd_announcerDisabled" ) )
		LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_BATTLECHATTER", "@LUA_MENU_BATTLECHATTER_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_battleChatterDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_battleChatterDisabled" ), LUI.Options.ToggleDvarFunc( "snd_battleChatterDisabled" ) )
	end
	if Engine.IsPS4() then
		LUI.Options.CreateControlProfileDataButton( f7_local3, "padAudioEnabled", "profile_toggleGamepadAudio", nil, "LUA_MENU_CONTROLLER_SOUND", "LUA_MENU_CONTROLLER_SOUND_DESC", {
			{
				text = "@LUA_MENU_DISABLED",
				value = false
			},
			{
				text = "@LUA_MENU_ENABLED",
				value = true
			}
		}, GamepadDisabledFunc )
	end
	LUI.Options.AddButtonOptionVariant( f7_local3, GenericButtonSettings.Variants.Select, "@LUA_MENU_HITSOUND", "@LUA_MENU_HITSOUND_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_hitsoundDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_hitsoundDisabled" ), LUI.Options.ToggleDvarFunc( "snd_hitsoundDisabled" ) )
	LUI.Options.InitScrollingList( f7_local3.list, nil )
	LUI.Options.AddOptionTextInfo( f7_local3 )
	f7_local3:AddBackButton( function ( f12_arg0, f12_arg1 )
		Engine.ExecNow( "profile_menuDvarsFinish", f12_arg1.controller )
		Engine.Exec( "updategamerprofile" )
		LUI.FlowManager.RequestLeaveMenu( f12_arg0 )
		if GameX.IsSplitscreen() then
			GameX.SetOptionState( false )
		end
	end )
	return f7_local3
end

LUI.MenuBuilder.registerType( "console_audio", LUI.ConsoleAudio.new )
LockTable( _M )
