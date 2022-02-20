local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MemberScreen = {}
f0_local0 = {
	MemberListHolderId = "member_list_holder",
	MemberListId = "member_screen_list_id",
	MemberListHeader = "memberscreen_list_header",
	MemberListHeaderText = "memberscreen_list_header_text",
	StatsTextId = "status_text",
	TeamSettingId = "team_setting"
}
f0_local1 = CoD.TextSettings.BodyFontTiny.Height
f0_local2 = 30
TeamSettingOp = {
	Unset = 1,
	Allies = 2,
	Axis = 3,
	Broadcaster = 4,
	COUNT = 4
}
TeamSettingVar = "lui_priv_lobby_team"
function GetTeamDvar( f1_arg0 )
	return Engine.GetDvarInt( TeamSettingVar )
end

function SetTeamDvar( f2_arg0, f2_arg1 )
	Engine.SetDvarInt( TeamSettingVar, f2_arg0 )
end

function TeamOpIsAvailable( f3_arg0 )
	if f3_arg0 == TeamSettingOp.Unset then
		return true
	elseif f3_arg0 == TeamSettingOp.Allies or f3_arg0 == TeamSettingOp.Axis then
		return IsCurrentGameTypeteamBased()
	elseif f3_arg0 == TeamSettingOp.Broadcaster then
		local f3_local0 = MLG.IsFeatureAvailable()
		if f3_local0 then
			if not Engine.GetDvarBool( "splitscreen" ) then
				f3_local0 = not CoD.IsUsingAspectRatio( 1.33 )
			else
				f3_local0 = false
			end
		end
		return f3_local0
	else
		assert( nil, "TeamOpIsAvailable invalid arg" )
	end
end

function GetAvailableTeamOps()
	local f4_local0 = {}
	for f4_local1 = 1, TeamSettingOp.COUNT, 1 do
		if TeamOpIsAvailable( f4_local1 ) then
			f4_local0[#f4_local0 + 1] = f4_local1
		end
	end
	return f4_local0
end

function MemberListGetLocalPlayer( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0:getFirstChild()
	while f5_local0 ~= nil do
		local f5_local1 = f5_local0.properties
		if f5_local1.isActiveMemberSlot and Lobby.GetMemberControllerIndex( f5_local1.memberListState, f5_local1.memberSlot, f5_local1.team ) == f5_arg1 then
			return f5_local1
		end
		f5_local0 = f5_local0:getNextSibling()
	end
	return nil
end

function MemberListInitTeamOp( f6_arg0, f6_arg1 )
	local f6_local0 = MemberListGetLocalPlayer( f6_arg0, f6_arg1 )
	if f6_local0 and Lobby.IsMemberMLGSpectator( f6_local0.memberSlot, f6_arg1 ) then
		if TeamOpIsAvailable( TeamSettingOp.Broadcaster ) then
			return TeamSettingOp.Broadcaster
		end
		ClearTeamSetting( TeamSettingOp.Broadcaster, f6_arg1 )
	end
	local f6_local1 = GetTeamDvar( f6_arg1 )
	local f6_local2 = TeamSettingOp.Unset
	if f6_local1 == Teams.allies then
		f6_local2 = TeamSettingOp.Allies
	elseif f6_local1 == Teams.axis then
		f6_local2 = TeamSettingOp.Axis
	end
	if TeamOpIsAvailable( f6_local2 ) then
		return f6_local2
	end
	ClearTeamSetting( f6_local2, f6_arg1 )
	return TeamSettingOp.Unset
end

function ClearTeamSetting( f7_arg0, f7_arg1 )
	if f7_arg0 == TeamSettingOp.Allies or f7_arg0 == TeamSettingOp.Axis then
		SetTeamDvar( Teams.free, f7_arg1 )
	elseif f7_arg0 == TeamSettingOp.Broadcaster then
		LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( false, f7_arg1 )
	end
end

function MemberListTeamSet( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg0.curTeamSetting == f8_arg1 then
		return 
	end
	ClearTeamSetting( f8_arg0.curTeamSetting, f8_arg2 )
	f8_arg0.curTeamSetting = f8_arg1
	local f8_local0 = nil
	if f8_arg1 == TeamSettingOp.Unset then
		f8_local0 = Engine.Localize( "@LUA_MENU_TEAM_UNSET" )
	elseif f8_arg1 == TeamSettingOp.Allies then
		f8_local0 = AAR.GetFactionNameByRef( Lobby.GetMapCustomField( "allieschar" ) )
		SetTeamDvar( Teams.allies, f8_arg2 )
	elseif f8_arg1 == TeamSettingOp.Axis then
		f8_local0 = AAR.GetFactionNameByRef( Lobby.GetMapCustomField( "axischar" ) )
		SetTeamDvar( Teams.axis, f8_arg2 )
	elseif f8_arg1 == TeamSettingOp.Broadcaster then
		f8_local0 = Engine.Localize( "@LUA_MENU_TEAM_CODCASTER" )
		LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( true, f8_arg2 )
	end
	LobbyMember.SelectedMember_SetLocalPrivateMatchTeam( f8_arg1 - 1, f8_arg2 )
	f8_arg0.teamText:setText( f8_local0 )
end

function MemberListRefreshOptionName( f9_arg0 )
	local f9_local0 = nil
	if f9_arg0.curTeamSetting == TeamSettingOp.Allies then
		f9_local0 = AAR.GetFactionNameByRef( Lobby.GetMapCustomField( "allieschar" ) )
	elseif f9_arg0.curTeamSetting == TeamSettingOp.Axis then
		f9_local0 = AAR.GetFactionNameByRef( Lobby.GetMapCustomField( "axischar" ) )
	end
	if f9_local0 then
		f9_arg0.teamText:setText( f9_local0 )
	end
end

function MemberListTeamCycle( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = GetAvailableTeamOps()
	local f10_local1 = nil
	Engine.PlaySound( CoD.SFX.MouseClick )
	for f10_local2 = 1, #f10_local0, 1 do
		if f10_arg0.curTeamSetting == f10_local0[f10_local2] then
			f10_local1 = f10_local2
			break
		end
	end
	local f10_local2 = 1
	if f10_local1 ~= nil then
		f10_local2 = f10_local1 + f10_arg1
		if #f10_local0 < f10_local2 then
			f10_local2 = 1
		elseif f10_local2 < 1 then
			f10_local2 = #f10_local0
		end
	end
	MemberListTeamSet( f10_arg0, f10_local0[f10_local2], f10_arg2 )
end

function MemberListTeamRefreshVisibility( f11_arg0 )
	local f11_local0 = "default"
	local f11_local1 = false
	if #GetAvailableTeamOps() > 1 then
		f11_local0 = "visible"
		f11_local1 = true
	end
	f11_arg0:animateToState( f11_local0 )
	LUI.NavBumpers.SetBumpersEnabled( f11_arg0.navBumpers, f11_local1, f11_local1 )
end

function MemberListTeamRefresh( f12_arg0 )
	if not f12_arg0.teamSettingActive then
		return 
	elseif not TeamOpIsAvailable( f12_arg0.curTeamSetting ) then
		MemberListTeamSet( f12_arg0, TeamSettingOp.Unset, f12_arg0.controller )
	else
		MemberListRefreshOptionName( f12_arg0 )
	end
	MemberListTeamRefreshVisibility( f12_arg0 )
end

function MemberListTeamInit( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg0:getChildById( f0_local0.TeamSettingId )
	if f13_local0.teamSettingInited then
		MemberListTeamRefresh( f13_local0 )
		return 
	elseif Engine.GetSplitScreen() == false and (Engine.GetSystemLink() or IsPrivateMatch()) then
		local navBumpers = LUI.NavBumpers.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			height = CoD.TextSettings.TitleFontMedium.Height
		}, function ( f14_arg0, f14_arg1 )
			MemberListTeamCycle( f13_local0, -1, f14_arg1.controller )
		end, function ( f15_arg0, f15_arg1 )
			MemberListTeamCycle( f13_local0, 1, f15_arg1.controller )
		end )
		f13_local0:addElement( navBumpers )
		f13_local0.navBumpers = navBumpers
		
		f13_local0.teamText = f13_local0:getChildById( "team_text" )
		f13_local0.parentMenu = f13_arg0.parentMenu
		f13_local0.controller = Engine.GetFirstActiveController()
		f13_local0.teamSettingActive = true
		MemberListTeamSet( f13_local0, MemberListInitTeamOp( f13_arg1, f13_local0.controller ), f13_local0.controller )
		MemberListTeamRefreshVisibility( f13_local0 )
	else
		local f13_local2 = Engine.GetMaxControllerCount()
		for f13_local3 = 0, f13_local2 - 1, 1 do
			if Engine.HasActiveLocalClient( f13_local3 ) then
				LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( false, f13_local3 )
				SetTeamDvar( Teams.free, controller )
			end
		end
	end
	f13_local0.teamSettingInited = true
end

function UpdateMemberList( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0:getChildById( f0_local0.MemberListHolderId )
	local f16_local1 = f16_arg0:getChildById( f0_local0.MemberListHeader )
	if not f16_local0 or not f16_local1 then
		return 
	end
	local f16_local2 = f16_local1:getChildById( f0_local0.MemberListHeaderText )
	local f16_local3 = f16_arg0:getChildById( f0_local0.StatsTextId )
	local f16_local4 = f16_local0:getChildById( f0_local0.MemberListId )
	if f16_local4 and f16_local2 and f16_local3 then
		local f16_local5 = ""
		if f16_arg0.properties.memberListState == Lobby.MemberListStates.Prelobby then
			if Engine.GetSystemLink() then
				f16_local5 = ""
			else
				f16_local5 = Engine.GetDvarString( "party_lobbyPlayerCount" )
			end
		elseif f16_arg0.properties.memberListState == Lobby.MemberListStates.Lobby or f16_arg0.properties.memberListState == Lobby.MemberListStates.Teams then
			f16_local5 = Engine.GetDvarString( "party_lobbyPlayerCount" )
		end
		f16_local2:setText( f16_local5 )
		local f16_local6 = ""
		if f16_arg0.properties.isPublicLobby then
			f16_local6 = Lobby.GetSearchStatus()
		end
		f16_local3:setText( f16_local6 )
		if f16_arg0.properties.memberListState == Lobby.MemberListStates.Prelobby then
			local f16_local7 = Lobby.GetCurrentMemberCount( f16_arg0.properties.memberListState )
			if f16_arg0.properties.cachedMemberCount ~= f16_local7 then
				f16_arg0.properties.cachedMemberCount = f16_local7
				f16_local4:processEvent( {
					name = "member_list_update",
					immediate = true
				} )
				if Engine.IsCoreMode() and Engine.GetOnlineGame() then
					LUI.InventoryUtils.ValidateEquippedLootItemsForAll()
				end
			else
				f16_local4:processEvent( {
					name = "member_list_update",
					immediate = true
				} )
			end
		else
			f16_arg0.properties.memberListState = LobbyMemberListGetState( f16_arg0.properties.memberListState )
			if not (not f16_arg0.properties.isPublicLobby or f16_local4.numActiveSlots == GetPartyMaxPlayers()) or f16_arg0.properties.memberListState == Lobby.MemberListStates.Teams then
				f16_local4.numActiveSlots = GetPartyMaxPlayers()
				f16_local4:processEvent( {
					name = "menu_refresh"
				} )
			else
				f16_local4:processEvent( {
					name = "member_list_update",
					immediate = true
				} )
			end
		end
	end
end

local f0_local3 = function ( f17_arg0 )
	local f17_local0 = f17_arg0 ~= nil
	local f17_local1 = nil
	if f17_local0 then
		f17_local1 = f17_arg0
	else
		f17_local1 = Lobby.MemberListStates.None
	end
	return f17_local1
end

local f0_local4 = function ( f18_arg0 )
	local f18_local0 = f18_arg0 ~= nil
	local f18_local1 = nil
	if f18_local0 then
		f18_local1 = f18_arg0
	else
		f18_local1 = IsPublicMatch()
	end
	return f18_local1
end

local f0_local5 = function ( f19_arg0 )
	local f19_local0 = f19_arg0 ~= nil
	local f19_local1 = nil
	if f19_local0 then
		f19_local1 = f19_arg0
	else
		f19_local1 = IsPrivateMatch() or Engine.GetSystemLink()
	end
	return f19_local1
end

local f0_local6 = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, f0_local2, 0, 0, CoD.AnchorTypes.All ) )
	self.properties = {
		autoScroll = LUI.AutoScroll.None
	}
	self.id = f0_local0.MemberListHolderId
	local f20_local1 = f0_local3( menu.memberListState )
	local f20_local2 = f0_local4( menu.isPublicLobby )
	local f20_local3 = f0_local5( menu.isPrivateLobby )
	
	local list = LUI.UIMemberList.new( {
		memberListState = f20_local1,
		isPublicLobby = f20_local2,
		isPrivateLobby = f20_local3,
		menu = menu.parentMenu
	} )
	list.id = f0_local0.MemberListId
	list.properties = {
		memberListState = f20_local1,
		isPublicLobby = f20_local2,
		isPrivateLobby = f20_local3
	}
	self:addElement( list )
	controller.list = list
	
	self:makeFocusable()
	controller:addElement( self )
end

local f0_local7 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = CoD.CreateState( nil, -CoD.TextSettings.BodyFontSmall.Height - S1MenuDims.menu_padding - 2, nil, nil, CoD.AnchorTypes.TopLeft )
	f21_local0.height = CoD.TextSettings.BodyFontVeryTiny.Height
	f21_local0.width = f21_arg0
	f21_local0.font = CoD.TextSettings.BodyFontVeryTiny.Font
	f21_local0.color = Colors.white
	f21_local0.alpha = 0.25
	local self = LUI.UIText.new( f21_local0 )
	self.id = f0_local0.StatsTextId
	f21_arg1:addElement( self )
end

local f0_local8 = function ( f22_arg0, f22_arg1 )
	local f22_local0 = CoD.TextSettings.TitleFontTiny
	local f22_local1 = CoD.CreateState( nil, -f22_local0.Height - S1MenuDims.menu_padding, nil, nil, CoD.AnchorTypes.TopLeft )
	f22_local1.height = f22_local0.Height
	f22_local1.width = f22_arg0
	f22_local1.alpha = 0
	local f22_local2 = {
		alpha = 1
	}
	local self = LUI.UIElement.new( f22_local1 )
	self:registerAnimationState( "visible", f22_local2 )
	self.id = f0_local0.TeamSettingId
	local f22_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f22_local4.alignment = LUI.Alignment.Center
	f22_local4.height = f22_local0.Height
	f22_local4.font = f22_local0.Font
	f22_local4.color = Colors.s1.text_unfocused
	local self = LUI.UIText.new( f22_local4 )
	self.id = "team_text"
	self:addElement( self )
	f22_arg1:addElement( self )
end

local f0_local9 = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f23_local0.width = f23_arg0
	f23_local0.height = f0_local2
	f23_local0.material = RegisterMaterial( "h1_ui_playerlist_titlebar" )
	local self = LUI.UIImage.new( f23_local0 )
	self.id = f0_local0.MemberListHeader
	local f23_local2 = CoD.CreateState( S1MenuDims.menu_padding, (f0_local2 - f23_arg1.Height) * 0.5 + 1, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f23_local2.font = f23_arg1.Font
	f23_local2.height = f23_arg1.Height
	f23_local2.color = Colors.white
	f23_local2.alpha = 1
	f23_local2.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f23_local2 )
	self.id = f0_local0.MemberListHeaderText
	self:addElement( self )
	f23_arg2:addElement( self )
end

LUI.MemberScreen.new = function ( f24_arg0 )
	local f24_local0 = CoD.TextSettings.BodyFontTiny
	local f24_local1 = CoD.DesignGridHelper( 6, 1 )
	local self = LUI.UIElement.new( CoD.CreateState( CoD.DesignGridHelper( 22 ), S1MenuDims.menu_top, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "member_screen_id"
	self.properties = f24_arg0
	self:registerEventHandler( "update_member_list", UpdateMemberList )
	local f24_local3 = CoD.CreateState( 0, -H1MenuDims.spacing, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f24_local3.height = 2
	self:addElement( LUI.Divider.new( f24_local3 ) )
	f0_local6( f24_arg0, self )
	f0_local7( f24_local1, self )
	f0_local8( f24_local1, self )
	f0_local9( f24_local1, f24_local0, self )
	local self = LUI.UITimer.new( 200, "update_member_list", nil, false )
	self.id = "memberlist_refresh_timer_id"
	self:addElement( self )
	UpdateMemberList( self, {} )
	return self
end

LockTable( _M )
