local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = false
CATEGORYCLASS_DIRECTDISPLAY = 8
LOBBY_THROTTLED = 1
LOBBY_UNAVAILABLE = 2
function PlaylistHasClanModifiers( f1_arg0, f1_arg1, f1_arg2 )
	if not Clan.IsEnabled() then
		return false
	else
		local f1_local0 = Clan.GetModifierForPlaylist( f1_arg0, f1_arg1, f1_arg2 )
		return f1_local0 and #f1_local0 > 0
	end
end

function CreateModifierMark()
	local f2_local0 = CoD.CreateState( -8, 4, -4, -4, CoD.AnchorTypes.TopBottomRight )
	f2_local0.color = Colors.yellow
	return LUI.UIImage.new( f2_local0 )
end

function CreateTargetMark()
	local f3_local0 = CoD.CreateState( -12, 4, -8, -4, CoD.AnchorTypes.TopBottomRight )
	f3_local0.color = Colors.red
	return LUI.UIImage.new( f3_local0 )
end

f0_local1 = nil
function OpenLobby( f4_arg0, f4_arg1 )
	local f4_local0 = Lobby.EnteringLobby()
	if f4_local0 == LOBBY_UNAVAILABLE then
		LUI.FlowManager.RequestAddMenu( nil, "throttle_error_popmenu", false, controller, false, {} )
	elseif f4_local0 == LOBBY_THROTTLED then
		f0_local1 = f4_arg0
		LUI.FlowManager.RequestAddMenu( f4_arg0, "popup_throttling", true, f4_arg1.controller, false )
	elseif not f0_local0 and Engine.AnyoneHasBadReputation() then
		f0_local0 = true
		LUI.FlowManager.RequestAddMenu( f4_arg0, "mp_reputation_warning_popup", true, f4_arg1.controller, false )
	elseif Playlist.DoAction( f4_arg0.category, f4_arg0.index, false, false ) then
		if Engine.GetDvarBool( "squad_match" ) then
			Squad.StartMatch( f4_arg1.controller )
			Engine.SetDvarBool( "squad_find_match", true )
		end
		OpenNextMenu( f4_arg0, f4_arg1 )
	end
end

function OpenPendingLobby( f5_arg0, f5_arg1 )
	if f0_local1 and Playlist.GetItemEnabled( f0_local1.category, f0_local1.index ) then
		OpenLobby( f0_local1, f5_arg1 )
	end
	f0_local1 = nil
end

function OpenNextMenu( f6_arg0, f6_arg1 )
	LUI.FlowManager.RequestAddMenu( f6_arg0, f6_arg0.nextMenu, false, f6_arg1.controller, false, {
		category = f6_arg0.category,
		index = f6_arg0.index,
		categoryClass = f6_arg0.categoryClass
	} )
end

function UpdateClanWarInfo( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = Clan.GetModifierForPlaylist( f7_arg1, f7_arg2, f7_arg3 )
	f7_arg0:processEvent( {
		name = "update_clan_playlist_info",
		shouldShow = f7_local0 and #f7_local0 > 0,
		clanName = Clan.GetName( f7_arg1 ),
		activeTarget = Clan.GetActiveTarget( f7_arg1 ),
		modifierList = f7_local0
	} )
end

function FindGameBase( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	local f8_local0 = nil
	if f8_arg3 and f8_arg4 then
		f8_local0 = Engine.MarkLocalized( Playlist.GetItemName( f8_arg3, f8_arg4 ) )
	else
		f8_local0 = "@PLATFORM_FIND_GAME_CAPS"
	end
	local f8_local1 = LUI.MenuTemplate.new( f8_arg0, {
		menu_title = f8_local0,
		uppercase_title = true
	} )
	local f8_local2 = Playlist.GetCategoryCount( f8_arg2 )
	local f8_local3, f8_local4 = nil
	local f8_local5 = LUI.PlaylistDetailsPanel.new()
	f8_local1:addElement( f8_local5 )
	local f8_local6 = nil
	local f8_local7 = f8_arg1.clanWarsController or 0
	local f8_local8 = Clan.IsEnabled()
	if f8_local8 then
		f8_local8 = Clan.AlreadyMember( f8_local7 )
		if f8_local8 then
			f8_local8 = not Engine.IsCoopMPMode()
		end
	end
	if f8_local8 then
		f8_local6 = LUI.ClanPlaylistInfoWidget.new()
		f8_local1:addElement( f8_local6 )
	end
	for f8_local9 = 0, f8_local2 - 1, 1 do
		local f8_local12 = f8_local9
		f8_local3 = Playlist.GetItemCategoryClass( f8_arg2, f8_local12 )
		if f8_local3 == CATEGORYCLASS_DIRECTDISPLAY then
			local f8_local13 = Playlist.GetCategory( f8_arg2, f8_local12 )
			local f8_local14 = Playlist.GetCategoryCount( f8_local13 )
			for f8_local15 = 0, f8_local14 - 1, 1 do
				local f8_local18 = f8_local15
				f8_local4 = f8_local1:AddButton( Engine.MarkLocalized( Playlist.GetItemName( f8_local13, f8_local18 ) ), nil, function ()
					return not Playlist.GetItemEnabled( f8_local13, f8_local18 )
				end, nil, nil, {
					showLockOnDisable = true
				} )
				f8_local4.index = f8_local18
				f8_local4.category = f8_local13
				f8_local4.categoryClass = f8_local3
				f8_local4:setDisabledRefreshRate( 100 )
				assert( Playlist.IsItemACategory( f8_local13, f8_local18 ) == false )
				f8_local4:addEventHandler( "button_over", function ( f10_arg0, f10_arg1 )
					f8_local5:processEvent( {
						name = "update_playlist_panel",
						category = f8_local13,
						index = f8_local18
					} )
					if f8_local8 then
						UpdateClanWarInfo( f8_local6, f8_local7, f8_local13, f8_local18 )
					end
				end )
				f8_local4:addEventHandler( "button_over_disable", function ( f11_arg0, f11_arg1 )
					f8_local5:processEvent( {
						name = "update_playlist_panel",
						category = f8_local13,
						index = f8_local18
					} )
					if f8_local8 then
						UpdateClanWarInfo( f8_local6, f8_local7, f8_local13, f8_local18 )
					end
				end )
				f8_local4.nextMenu = "menu_xboxlive_lobby"
				if f8_local13 == 8 then
					f8_local4:addEventHandler( "button_action", OpenRankedPlay )
				else
					f8_local4:addEventHandler( "button_action", OpenLobby )
				end
				if f8_local8 and PlaylistHasClanModifiers( f8_local7, f8_local13, f8_local18 ) then
					f8_local4:addElement( CreateModifierMark() )
				end
				if f8_local8 and Clan.DoesPlaylistContainTarget( f8_local7, f8_local13, f8_local18 ) then
					f8_local4:addElement( CreateTargetMark() )
				end
			end
		else
			f8_local4 = f8_local1:AddButton( Engine.MarkLocalized( Playlist.GetItemName( f8_arg2, f8_local12 ) ), nil, function ()
				return not Playlist.GetItemEnabled( f8_arg2, f8_local12 )
			end, nil, nil, {
				showLockOnDisable = true,
				xpScalarObj = LUI.MenuTemplate.GetXpScalarObj( f8_arg2, f8_local12 )
			} )
			f8_local4.index = f8_local12
			f8_local4.category = f8_arg2
			f8_local4.categoryClass = f8_local3
			f8_local4:setDisabledRefreshRate( 100 )
			f8_local4:addEventHandler( "button_over", function ( f13_arg0, f13_arg1 )
				f8_local5:processEvent( {
					name = "update_playlist_panel",
					category = f8_arg2,
					index = f8_local12
				} )
				if f8_local8 then
					UpdateClanWarInfo( f8_local6, f8_local7, f8_arg2, f8_local12 )
				end
			end )
			f8_local4:addEventHandler( "button_over_disable", function ( f14_arg0, f14_arg1 )
				f8_local5:processEvent( {
					name = "update_playlist_panel",
					category = f8_arg2,
					index = f8_local12
				} )
				if f8_local8 then
					UpdateClanWarInfo( f8_local6, f8_local7, f8_arg2, f8_local12 )
				end
			end )
			if Playlist.IsItemACategory( f8_arg2, f8_local12 ) then
				f8_local4.nextMenu = "FindGameSubMenu"
				f8_local4:addEventHandler( "button_action", OpenNextMenu )
			else
				f8_local4.nextMenu = "menu_xboxlive_lobby"
				f8_local4:addEventHandler( "button_action", OpenLobby )
			end
			if f8_local8 and PlaylistHasClanModifiers( f8_local7, f8_arg2, f8_local12 ) then
				f8_local4:addElement( CreateModifierMark() )
			end
			if f8_local8 and Clan.DoesPlaylistContainTarget( f8_local7, f8_arg2, f8_local12 ) then
				f8_local4:addElement( CreateTargetMark() )
			end
		end
	end
	f8_local1:addEventHandler( "find_match_after_throttle", OpenPendingLobby )
	f8_local1:AddBackButton()
	f8_local1:AddCurrencyInfoPanel()
	return f8_local1
end

function FindExoSurvivalPlaylistCategory()
	local f15_local0 = Playlist.GetCategoryCount( 0 )
	local f15_local1 = nil
	for f15_local2 = 0, f15_local0 - 1, 1 do
		f15_local1 = Playlist.GetItemCategoryClass( 0, f15_local2 )
	end
	return 0
end

function FindGameMenu( f16_arg0, f16_arg1 )
	local f16_local0 = 0
	local f16_local1 = 0
	local f16_local2 = FindGameBase( f16_arg0, f16_arg1, f16_local0 )
	f16_local2:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@PLATFORM_UI_HEADER_PLAY_MP_CAPS" ) ) )
	return f16_local2
end

function FindGameSubMenu( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1.category
	local f17_local1 = f17_arg1.index
	local f17_local2 = f17_arg1.categoryClass
	if f17_local0 == nil then
		f17_local0, f17_local1 = Playlist.GetCategoryParent( Playlist.GetPreselectedCategory() )
	end
	if f17_local2 == CATEGORYCLASS_DIRECTDISPLAY then
		f17_local0, f17_local1 = Playlist.GetCategoryParent( currentCategory )
	end
	local f17_local3 = FindGameBase( f17_arg0, f17_arg1, Playlist.GetCategory( f17_local0, f17_local1 ), f17_local0, f17_local1 )
	f17_local3:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@PLATFORM_FIND_GAME" ) ) )
	f17_local3:InitScrolling()
	return f17_local3
end

LUI.MenuBuilder.registerType( "FindGameMenu", FindGameMenu )
LUI.MenuBuilder.registerType( "FindGameSubMenu", FindGameSubMenu )
VLobby.InitMenuMode( "FindGameMenu", VirtualLobbyModes.LUI_MODE_OBSCURED )
LockTable( _M )
