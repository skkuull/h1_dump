local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.PCAudio = {}
function GetVolume()
	return (Engine.GetProfileData( "snd_volume" ) - SliderBounds.Volume.Min) / (SliderBounds.Volume.Max - SliderBounds.Volume.Min)
end

function VolumeLess( f2_arg0 )
	LUI.Options.ProfileDataMenuOption( f2_arg0, SliderBounds.Volume.Min, SliderBounds.Volume.Max, -SliderBounds.Volume.Step, "snd_volume" )
end

function VolumeMore( f3_arg0 )
	LUI.Options.ProfileDataMenuOption( f3_arg0, SliderBounds.Volume.Min, SliderBounds.Volume.Max, SliderBounds.Volume.Step, "snd_volume" )
end

LUI.PCAudio.new = function ( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.MenuTemplate.new( f4_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_AUDIO_OPTIONS" ) ),
		menu_top_indent = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset,
		menu_width = GenericMenuDims.OptionMenuWidth
	} )
	LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Slider, "@MENU_MASTER_VOLUME", "@MENU_MASTER_VOLUME_DESC", GetVolume, VolumeLess, VolumeMore )
	local f4_local1 = {
		{
			text = "@LUA_MENU_AUTODETECT_SPEAKERS",
			value = 0
		}
	}
	local f4_local2 = Engine.GetDvarInt( "snd_detectedSpeakerConfig" )
	if f4_local2 > 1 then
		f4_local1[#f4_local1 + 1] = {
			text = "@LUA_MENU_STEREO",
			value = 2
		}
		f4_local1[#f4_local1 + 1] = {
			text = "@LUA_MENU_HEADPHONE",
			value = 50
		}
	end
	if f4_local2 > 2 then
		f4_local1[#f4_local1 + 1] = {
			text = "@LUA_MENU_FOUR_SPEAKERS",
			value = 4
		}
	end
	if f4_local2 > 4 then
		f4_local1[#f4_local1 + 1] = {
			text = "@LUA_MENU_FIVE_ONE_SPEAKERS",
			value = 6
		}
	end
	if f4_local2 > 6 then
		f4_local1[#f4_local1 + 1] = {
			text = "@LUA_MENU_SEVEN_ONE_SPEAKERS",
			value = 8
		}
	end
	LUI.Options.CreateOptionButton( f4_local0, "snd_speakerConfig", "@LUA_MENU_SPEAKER_CONFIG", "@LUA_MENU_SPEAKER_CONFIG_DESC", f4_local1 )
	if Engine.IsMultiplayer() then
		LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Select, "@LUA_MENU_MUSIC", "@LUA_MENU_MUSIC_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_musicDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_musicDisabled" ), LUI.Options.ToggleDvarFunc( "snd_musicDisabled" ) )
		LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Select, "@LUA_MENU_ANNOUNCER", "@LUA_MENU_ANNOUNCER_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_announcerDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_announcerDisabled" ), LUI.Options.ToggleDvarFunc( "snd_announcerDisabled" ) )
		LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Select, "@LUA_MENU_BATTLECHATTER", "@LUA_MENU_BATTLECHATTER_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_battleChatterDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_battleChatterDisabled" ), LUI.Options.ToggleDvarFunc( "snd_battleChatterDisabled" ) )
		LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Select, "@LUA_MENU_PUSH_TO_TALK", "@LUA_MENU_PUSH_TO_TALK_DESC", LUI.Options.GetDvarEnableTextFunc( "cl_pushToTalk", false ), LUI.Options.ToggleDvarFunc( "cl_pushToTalk" ), LUI.Options.ToggleDvarFunc( "cl_pushToTalk" ) )
	end
	if not Engine.IsMultiplayer() and Engine.ShouldShowSubtitlesOption() then
		LUI.Options.CreateControlProfileDataButton( f4_local0, "subtitles", "profile_toggleSubtitles", nil, "LUA_MENU_SUBTITLES", "PLATFORM_UI_OPTIONS_SUBTITLES_DESC", {
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
	LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Select, "@LUA_MENU_HITSOUND", "@LUA_MENU_HITSOUND_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_hitsoundDisabled", true ), LUI.Options.ToggleDvarFunc( "snd_hitsoundDisabled" ), LUI.Options.ToggleDvarFunc( "snd_hitsoundDisabled" ) )
	if Engine.IsPC() and Engine.GetDvarBool( "snd_wasapiSampleRateConverterNeeded" ) then
		LUI.Options.AddButtonOptionVariant( f4_local0, GenericButtonSettings.Variants.Select, "@LUA_MENU_LOWQUALITYAUDIO", "@LUA_MENU_LOWQUALITYAUDIO_DESC", LUI.Options.GetDvarEnableTextFunc( "snd_lowQualityAudio", false ), LUI.Options.ToggleDvarFunc( "snd_lowQualityAudio" ), LUI.Options.ToggleDvarFunc( "snd_lowQualityAudio" ) )
	end
	LUI.Options.InitScrollingList( f4_local0.list, nil )
	LUI.Options.AddOptionTextInfo( f4_local0 )
	f4_local0:AddBackButton( function ( f5_arg0, f5_arg1 )
		Engine.ExecNow( "profile_menuDvarsFinish", f5_arg1.controller )
		Engine.Exec( "updategamerprofile" )
		LUI.FlowManager.RequestLeaveMenu( f5_arg0 )
	end )
	return f4_local0
end

LUI.MenuBuilder.registerType( "pc_audio", LUI.PCAudio.new )
LockTable( _M )
