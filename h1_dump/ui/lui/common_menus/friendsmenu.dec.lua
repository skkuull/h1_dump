local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.FriendsMenu = InheritFrom( LUI.MenuTemplate )
LUI.FriendsMenu.NumButtons = 7
LUI.FriendsMenu.TopOffset = 30
LUI.FriendsMenu.ContentTop = LUI.MenuTemplate.ListTop + LUI.FriendsMenu.TopOffset
LUI.FriendsMenu.ButtonRefreshRate = 1000
LUI.FriendsMenu.ActiveSublist = nil
LUI.FriendsMenu.ActiveSublistOwner = nil
LUI.FriendsMenu.Menu = nil
PLAYER_LIMIT_MIN = 2
PLAYER_LIMIT_MAX = 18
LUI.FriendsMenu.FriendsMenuHasFocus = function ()
	return LUI.FlowManager.IsMenuTopmost( Engine.GetLuiRoot(), "FriendsMenu" )
end

function PlatformShouldShowGameInvites()
	local f2_local0 = Engine.IsPS3()
	if not f2_local0 then
		f2_local0 = Engine.IsPS4()
	end
	return f2_local0
end

function PlatformShouldShowPartyGameInvites()
	local f3_local0 = Engine.IsXB3()
	if not f3_local0 then
		f3_local0 = Engine.IsPCApp()
	end
	return f3_local0
end

function PlatformShouldShowPartyUI()
	return Engine.IsXbox360()
end

LUI.FriendsMenu.AddPlayerCard = function ( f5_arg0 )
	local f5_local0 = LUI.FriendsMenu.ContentTop
	local f5_local1 = CoD.DesignGridHelper( 8 )
	local self = LUI.UIElement.new( CoD.CreateState( f5_local1, f5_local0, f5_local1 + CoD.DesignGridHelper( 11 ), f5_local0 + CoD.DesignGridHelper( 3 ), CoD.AnchorTypes.TopLeft ) )
	self.id = "playercardcontainer_id"
	f5_arg0.subContainer:addElement( self )
	self:addElement( LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) ) )
	local f5_local3 = CoD.CreateState( 96.5, 22, nil, nil, CoD.AnchorTypes.TopLeft )
	f5_local3.scale = CoD.DesignGridHelper( 11, 1 ) / LUI.Playercard.Width - 1
	
	local playerCard = LUI.Playercard.new( f5_local3, {
		emblemDataSource = EmblemDataSource.Profile,
		controller = f5_arg0.controller
	} )
	self:addElement( playerCard )
	f5_arg0.playerCard = playerCard
	
end

LUI.FriendsMenu.AddPlayerDetails = function ( f6_arg0 )
	local f6_local0 = LUI.FriendsMenu.ContentTop
	local f6_local1 = CoD.DesignGridHelper( 8 )
	local f6_local2 = CoD.DesignGridHelper( 11, 1 )
	local f6_local3 = CoD.DesignGridHelper( 10.2 )
	local self = LUI.UIElement.new( CoD.CreateState( f6_local1, f6_local0, f6_local1 + f6_local2, f6_local0 + f6_local3, CoD.AnchorTypes.TopLeft ) )
	self.id = "playerdetailescontainer_id"
	f6_arg0.subContainer:addElement( self )
	local f6_local5 = CoD.CreateState( 0, 104, nil, nil, CoD.AnchorTypes.TopLeft )
	f6_local5.width = CoD.DesignGridHelper( 11, 1 )
	f6_local5.height = CoD.DesignGridHelper( 1.5, 1 )
	local self = LUI.UIImage.new( f6_local5 )
	self:addElement( self )
	self:registerAnimationState( "online", {
		material = RegisterMaterial( "h1_ui_social_bg_online" )
	} )
	self:registerAnimationState( "offline", {
		material = RegisterMaterial( "h1_ui_social_bg_offline" )
	} )
	self:hide()
	local f6_local7 = CoD.CreateState( 1, 13, 5, 72, CoD.AnchorTypes.TopLeft )
	f6_local7.material = RegisterMaterial( "h1_ui_social_deco_online" )
	local self = LUI.UIImage.new( f6_local7 )
	self:addElement( self )
	self:hide()
	local self = LUI.UIElement.new( CoD.CreateState( 22, 120, f6_local2, f6_local3, CoD.AnchorTypes.TopLeft ) )
	self:addElement( self )
	local f6_local10 = CoD.TextSettings.Font46
	local f6_local11 = CoD.CreateState( nil, 0, nil, f6_local10.Height, CoD.AnchorTypes.TopLeft )
	f6_local11.font = f6_local10.Font
	f6_local11.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f6_local11 )
	self:addElement( self )
	self:registerAnimationState( "online", {
		color = Colors.mw1_green
	} )
	self:registerAnimationState( "offline", {
		color = Colors.grey_4
	} )
	self:registerAnimationState( "recent", {
		color = Colors.white
	} )
	local f6_local13 = CoD.TextSettings.Font24
	local f6_local14 = CoD.CreateState( 2, 34, nil, f6_local13.Height + 34, CoD.AnchorTypes.TopLeft )
	f6_local14.font = f6_local13.Font
	f6_local14.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f6_local14 )
	self:addElement( self )
	self:registerAnimationState( "online", {
		color = Colors.white
	} )
	self:registerAnimationState( "offline", {
		color = Colors.grey_4
	} )
	self:registerAnimationState( "recent", {
		color = Colors.white
	} )
	self.presenceBackground = self
	self.presenceDeco = self
	self.presenceHeader = self
	self.presenceText = self
	f6_arg0.playerDetails = self
end

LUI.FriendsMenu.RefreshPlayerDetails = function ( f7_arg0, f7_arg1 )
	local f7_local0 = ""
	f7_arg0.playerDetails.presenceBackground:show()
	if f7_arg1.isOnline == true then
		f7_arg0.playerDetails.presenceBackground:animateToState( "online" )
		f7_arg0.playerDetails.presenceText:animateToState( "online" )
		f7_arg0.playerDetails.presenceHeader:animateToState( "online" )
		f7_arg0.playerDetails.presenceHeader:setText( Engine.ToUpperCase( Engine.Localize( "@XBOXLIVE_ONLINE" ) ) )
		f7_arg0.playerDetails.presenceDeco:show()
		f7_local0 = Engine.MarkLocalized( f7_arg1.presence )
	elseif f7_arg1.isOnline == false then
		f7_arg0.playerDetails.presenceBackground:animateToState( "offline" )
		f7_arg0.playerDetails.presenceText:animateToState( "offline" )
		f7_arg0.playerDetails.presenceHeader:animateToState( "offline" )
		f7_arg0.playerDetails.presenceHeader:setText( Engine.ToUpperCase( Engine.Localize( "@XBOXLIVE_OFFLINE" ) ) )
		f7_arg0.playerDetails.presenceDeco:hide()
	elseif f7_arg1.defaultHeader then
		f7_arg0.playerDetails.presenceBackground:show()
		f7_arg0.playerDetails.presenceHeader:setText( f7_arg1.defaultHeader )
		f7_arg0.playerDetails.presenceBackground:animateToState( "offline" )
		f7_arg0.playerDetails.presenceText:animateToState( "recent" )
		f7_arg0.playerDetails.presenceHeader:animateToState( "recent" )
		f7_arg0.playerDetails.presenceDeco:hide()
	end
	f7_arg0.playerDetails.presenceText:setText( f7_local0 )
end

LUI.FriendsMenu.RemoveDescription = function ( f8_arg0 )
	if f8_arg0.description then
		f8_arg0.subContainer:removeElement( f8_arg0.description )
		f8_arg0.description = nil
	end
end

LUI.FriendsMenu.AddDescription = function ( f9_arg0, f9_arg1, f9_arg2 )
	if not f9_arg0.description then
		local f9_local0 = CoD.DesignGridHelper( 8 )
		local f9_local1 = LUI.FriendsMenu.ContentTop + CoD.DesignGridHelper( 5 )
		local f9_local2 = CoD.DesignGridHelper( 11, 1 )
		local self = LUI.UIElement.new( CoD.CreateState( f9_local0, f9_local1, f9_local0 + f9_local2, f9_local1 + LUI.FriendsMenu.NumButtons * LUI.FriendsListItem.Height - CoD.DesignGridHelper( 7 ), CoD.AnchorTypes.TopLeft ) )
		self.id = "descriptioncontainer_id"
		f9_arg0.subContainer:addElement( self )
		self:addElement( LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) ) )
		local f9_local4 = CoD.TextSettings.Font24
		local f9_local5 = f9_local4.Height / 2
		local f9_local6 = f9_local2 / 2
		local f9_local7 = CoD.CreateState( -f9_local6, -f9_local5, f9_local6, f9_local5, CoD.AnchorTypes.None )
		f9_local7.font = f9_local4.Font
		
		local text = LUI.UIText.new( f9_local7 )
		text:setTextStyle( CoD.TextStyle.ForceUpperCase )
		self:addElement( text )
		self.text = text
		
		f9_arg0.description = self
	end
	if f9_arg2 then
		f9_arg0.description.text:setText( Engine.Localize( f9_arg1, Engine.MarkLocalized( f9_arg2 ) ) )
	else
		f9_arg0.description.text:setText( Engine.Localize( f9_arg1 ) )
	end
end

LUI.FriendsMenu.RemoveNoFriends = function ( f10_arg0 )
	if f10_arg0.noFriends then
		f10_arg0:removeElement( f10_arg0.noFriends )
		f10_arg0.noFriends = nil
	end
end

LUI.FriendsMenu.AddNoFriends = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = nil
	if type( f11_arg1 ) == "function" then
		f11_local0 = f11_arg1( f11_arg2 )
	else
		f11_local0 = f11_arg1
	end
	if not f11_arg0.noFriends then
		local f11_local1 = CoD.TextSettings.TitleFontSmall
		local f11_local2 = f11_local1.Height / 2
		local f11_local3 = CoD.CreateState( 0, -f11_local2, 0, f11_local2, CoD.AnchorTypes.LeftRight )
		f11_local3.font = f11_local1.Font
		local self = LUI.UIText.new( f11_local3 )
		f11_arg0:addElement( self )
		f11_arg0.noFriends = self
	end
	f11_arg0.noFriends:setText( Engine.Localize( f11_local0 ) )
end

LUI.FriendsMenu.BuildSublist = function ( f12_arg0 )
	local f12_local0 = CoD.DesignGridHelper( 8 )
	local f12_local1 = LUI.FriendsMenu.ContentTop + 192
	local f12_local2 = CoD.CreateState( f12_local0, f12_local1, f12_local0 + CoD.DesignGridHelper( 11, 1 ), f12_local1 + LUI.FriendsMenu.NumButtons * LUI.FriendsListItem.Height - CoD.DesignGridHelper( 7 ), CoD.AnchorTypes.TopLeft )
	f12_local2.alpha = 1
	local self = LUI.UIVerticalList.new( f12_local2 )
	self:registerAnimationState( "default", f12_local2 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self.buttonCount = 0
	return self
end

LUI.FriendsMenu.RemovePlayerOptions = function ( f13_arg0 )
	if f13_arg0.playerOptions ~= nil then
		f13_arg0:removeElement( f13_arg0.playerOptions )
		f13_arg0.playerOptions = nil
	end
end

LUI.FriendsMenu.RemoveReportOptions = function ( f14_arg0 )
	if f14_arg0.reportOptions ~= nil then
		f14_arg0:removeElement( f14_arg0.reportOptions )
		f14_arg0.reportOptions = nil
	end
end

LUI.FriendsMenu.AddReportOptions = function ( f15_arg0 )
	local f15_local0 = f15_arg0:BuildSublist()
	f15_local0.id = "ReportOptions"
	f15_arg0:addElement( f15_local0 )
	local f15_local1 = f15_arg0.list
	f15_arg0.list = f15_local0
	local f15_local2 = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		f16_arg0.menu.currentTab.reportFunc( f16_arg1.controller, f16_arg2 )
		f16_arg0.menu:AddDescription( f16_arg3 )
		f16_arg0.menu:FocusMainList()
	end
	
	f15_arg0:AddButton( "@MENU_REPORT_OFFENSIVE", function ( f17_arg0, f17_arg1 )
		f15_local2( f17_arg0, f17_arg1, Friends.Constants.reportOffensiveLobbyPlayer, "@MENU_REPORT_OFFENSIVE_SUBMIT" )
	end, nil, nil, nil, nil, true )
	f15_arg0:AddButton( "@MENU_REPORT_EXPLOITING", function ( f18_arg0, f18_arg1 )
		f15_local2( f18_arg0, f18_arg1, Friends.Constants.reportExploitingLobbyPlayer, "@MENU_REPORT_EXPLOITING_SUBMIT" )
	end, nil, nil, nil, nil, true )
	f15_arg0:AddButton( "@MENU_REPORT_CHEATING", function ( f19_arg0, f19_arg1 )
		f15_local2( f19_arg0, f19_arg1, Friends.Constants.reportCheatingLobbyPlayer, "@MENU_REPORT_CHEATING_SUBMIT" )
	end, nil, nil, nil, nil, true )
	f15_arg0:AddButton( "@MENU_REPORT_BOOSTING", function ( f20_arg0, f20_arg1 )
		f15_local2( f20_arg0, f20_arg1, Friends.Constants.reportBoostingLobbyPlayer, "@MENU_REPORT_BOOSTING_SUBMIT" )
	end, nil, nil, nil, nil, true )
	if Engine.EmblemsEnabled() then
		f15_arg0:AddButton( "@MENU_REPORT_EMBLEM", function ( f21_arg0, f21_arg1 )
			f15_local2( f21_arg0, f21_arg1, Friends.Constants.reportEmblemLobbyPlayer, "@MENU_REPORT_EMBLEM_SUBMIT" )
		end, nil, nil, nil, nil, true )
	end
	f15_arg0.reportOptions = f15_local0
	f15_arg0.list = f15_local1
	f15_local0:clearSavedState()
end

function OnReport( f22_arg0, f22_arg1 )
	f22_arg0.menu:RemoveDescription()
	f22_arg0.menu:RemoveReportOptions()
	f22_arg0.menu.playerOptions:processEvent( {
		name = "lose_focus",
		immediate = true
	} )
	f22_arg0.menu.playerOptions:animateToState( "hidden" )
	f22_arg0.menu.playerOptions.m_inputDisabled = true
	f22_arg0.menu:AddReportOptions()
	f22_arg0.menu.reportOptions:processEvent( {
		name = "gain_focus",
		immediate = true
	} )
end

LUI.FriendsMenu.InviteSentCommon = function ( f23_arg0 )
	f23_arg0:FocusMainList()
end

LUI.FriendsMenu.AddOnlineFriendOptions = function ( f24_arg0 )
	local f24_local0 = f24_arg0:BuildSublist()
	f24_local0.id = "OnlineFriendOptions"
	f24_arg0:addElement( f24_local0 )
	local f24_local1 = f24_arg0.controller
	local f24_local2 = f24_arg0.list
	f24_arg0.list = f24_local0
	local f24_local3 = not Engine.InFrontend()
	local f24_local4 = Engine.InLobby()
	local f24_local5 = nil
	if Engine.IsMultiplayer() then
		local f24_local6 = function ()
			local f25_local0
			if Engine.GetOnlineGame() then
				f25_local0 = not Friends.IsFriendInvitable( f24_local1 )
			else
				f25_local0 = true
			end
			return f25_local0
		end
		
		local f24_local7
		if f24_local3 or f24_local4 then
			f24_local7 = "@MENU_INVITE_TO_GAME"
			if not f24_local7 then
			
			else
				f24_local5 = f24_arg0:AddButton( f24_local7, function ( f26_arg0, f26_arg1 )
					f26_arg0.menu:InviteSentCommon()
					Friends.InviteOnlineFriend( f26_arg1.controller )
				end, f24_local6, nil, nil, nil, true )
				f24_local5:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
			end
		end
		f24_local7 = "@MENU_INVITE_TO_PARTY"
	end
	f24_local5 = f24_arg0:AddButton( "@MENU_JOIN_GAME", function ( f28_arg0, f28_arg1 )
		Friends.JoinOnlineFriend( f28_arg1.controller )
	end, function ()
		local f27_local0
		if Engine.UserCanPlayOnline( f24_local1 ) then
			f27_local0 = not Friends.IsFriendJoinable( f24_local1 )
		else
			f27_local0 = true
		end
		return f27_local0
	end, nil, nil, nil, true )
	f24_local5:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
	if Engine.IsXbox360() or Engine.IsXB3() or Engine.IsPCApp() or Engine.IsPS4() then
		f24_local5 = f24_arg0:AddButton( "@XBOXLIVE_VIEW_PROFILE", function ( f30_arg0, f30_arg1 )
			Friends.ShowOnlineFriendGamercard( f30_arg1.controller )
		end, function ()
			return not Friends.CanShowFriendGamercard( f24_local1 )
		end, nil, nil, nil, true )
		f24_local5:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
	end
	f24_arg0:AddButton( "@MENU_REPORT_PLAYER", OnReport, nil, nil, nil, nil, true )
	f24_arg0.playerOptions = f24_local0
	f24_arg0.list = f24_local2
	f24_local0:clearSavedState()
end

LUI.FriendsMenu.AddPartyManagementOptions = function ( f31_arg0 )
	local f31_local0 = f31_arg0:BuildSublist()
	f31_local0.id = "PartyOptions"
	f31_arg0:addElement( f31_local0 )
	local f31_local1 = f31_arg0.controller
	local f31_local2 = f31_arg0.list
	f31_arg0.list = f31_local0
	local f31_local3 = {}
	if Engine.IsConsoleGame() or Engine.IsPCApp() then
		local f31_local4 = {}
		local f31_local5
		if Engine.IsXB3() or Engine.IsPCApp() or Engine.IsPS4() then
			f31_local5 = LobbyMember.Options.xboxProfile
			if not f31_local5 then
			
			else
				local f31_local6 = LobbyMember.Options.toggleMute
				local f31_local7 = LobbyMember.Options.tryMigrateHost
				local f31_local8 = LobbyMember.Options.reportPlayer
				local f31_local9 = LobbyMember.Options.kickPlayer
				f31_local4[1] = f31_local5
				f31_local4[2] = f31_local6
				f31_local4[3] = f31_local7
				f31_local4[4] = f31_local8
				f31_local4[5] = f31_local9
				f31_local3 = f31_local4
			end
		end
		f31_local5 = LobbyMember.Options.psSendFriendInvite
	else
		f31_local3 = {
			LobbyMember.Options.toggleMute,
			LobbyMember.Options.tryMigrateHost,
			LobbyMember.Options.reportPlayer,
			LobbyMember.Options.kickPlayer
		}
	end
	local f31_local4 = nil
	for f31_local5 = 1, #f31_local3, 1 do
		local f31_local8 = f31_local5
		if not f31_local3[f31_local8].exclude or f31_local3[f31_local8].exclude( f31_local1 ) == false then
			local f31_local9 = function ()
				return f31_local3[f31_local8].disabled( f31_local1 )
			end
			
			local f31_local10 = f31_local3[f31_local8].customActionFunc
			if not f31_local10 then
				f31_local10 = f31_local3[f31_local8].action
			end
			f31_local4 = f31_arg0:AddButton( f31_local3[f31_local8].text, f31_local10, f31_local9, nil, nil, nil, true )
			f31_local4:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
		end
	end
	f31_arg0.playerOptions = f31_local0
	f31_arg0.list = f31_local2
	f31_local0:clearSavedState()
end

LUI.FriendsMenu.AddOnlineFriendHelp = function ( f33_arg0 )
	local f33_local0 = f33_arg0.controller
	local f33_local1 = f33_arg0
	local f33_local2 = CoD.UsingController() and "button_left" or "button_page_up"
	local f33_local3 = CoD.UsingController() and "button_right" or "button_page_down"
	f33_arg0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = f33_local2,
		helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP" ),
		side = "right",
		clickable = true,
		priority = -1000,
		func = function ( f34_arg0, f34_arg1 )
			f33_local1:Page( -LUI.FriendsMenu.NumButtons )
		end
	} )
	f33_arg0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = f33_local3,
		helper_text = Engine.Localize( "@LUA_MENU_PAGE_DOWN" ),
		side = "right",
		clickable = true,
		priority = -1000,
		func = function ( f35_arg0, f35_arg1 )
			f33_local1:Page( LUI.FriendsMenu.NumButtons )
		end
	} )
	f33_arg0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_TOP" ),
		side = "right",
		clickable = true,
		priority = -1000
	}, function ( f36_arg0, f36_arg1 )
		f33_local1:JumpToTop()
	end )
	if PlatformShouldShowGameInvites() and Friends.CountPendingPlaystationInvites and Friends.CountPendingPlaystationInvites( f33_local0 ) > 0 then
		f33_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_start",
			helper_text = Engine.Localize( "@PLATFORM_VIEW_GAME_INVITES" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f37_arg0, f37_arg1 )
			if PlatformShouldShowGameInvites() and Friends.CountPendingPlaystationInvites and Friends.CountPendingPlaystationInvites( f37_arg1.controller ) > 0 then
				Engine.Exec( "gameInvitesReceived", f37_arg1.controller )
			end
		end )
	end
end

LUI.FriendsMenu.AddAllFriendOptions = function ( f38_arg0 )
	LUI.FriendsMenu.AddOnlineFriendOptions( f38_arg0 )
end

LUI.FriendsMenu.AddAllFriendHelp = function ( f39_arg0 )
	if PlatformShouldShowGameInvites() and Friends.CountPendingPlaystationInvites and Friends.CountPendingPlaystationInvites( f39_arg0.controller ) > 0 then
		f39_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_start",
			helper_text = Engine.Localize( "@PLATFORM_VIEW_GAME_INVITES" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f40_arg0, f40_arg1 )
			if PlatformShouldShowGameInvites() and Friends.CountPendingPlaystationInvites and Friends.CountPendingPlaystationInvites( f40_arg1.controller ) > 0 then
				Engine.Exec( "gameInvitesReceived", f40_arg1.controller )
			end
		end )
	end
end

LUI.FriendsMenu.AddRecentPlayerOptions = function ( f41_arg0 )
	local f41_local0 = f41_arg0:BuildSublist()
	f41_local0.id = "RecentPlayerOptions"
	f41_arg0:addElement( f41_local0 )
	local f41_local1 = f41_arg0.controller
	local f41_local2 = f41_arg0.list
	f41_arg0.list = f41_local0
	if not Engine.IsXbox360() and not Engine.IsXB3() and not Engine.IsPCApp() then
		local f41_local3 = Engine.IsPS4()
	end
	local f41_local4 = not Engine.InFrontend()
	local f41_local5 = Engine.InLobby()
	local f41_local6 = nil
	if Engine.IsMultiplayer() and not Engine.IsPC() then
		local f41_local7 = function ()
			local f42_local0
			if Engine.GetOnlineGame() then
				f42_local0 = not Friends.IsRecentPlayerInvitable( f41_local1 )
			else
				f42_local0 = true
			end
			return f42_local0
		end
		
		local f41_local8
		if f41_local4 or f41_local5 then
			f41_local8 = Engine.Localize( "@MENU_INVITE_TO_GAME" )
			if not f41_local8 then
			
			else
				f41_local6 = f41_arg0:AddButton( f41_local8, function ( f43_arg0, f43_arg1 )
					f43_arg0.menu:InviteSentCommon()
					Friends.InviteRecentPlayer( f43_arg1.controller )
				end, f41_local7, nil, nil, nil, true )
				f41_local6:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
			end
		end
		f41_local8 = Engine.Localize( "@MENU_INVITE_TO_PARTY" )
	end
	if not Engine.IsPCApp() then
		f41_local6 = f41_arg0:AddButton( "@MENU_JOIN_GAME", function ( f45_arg0, f45_arg1 )
			Friends.JoinRecentPlayer( f41_local1 )
		end, function ()
			local f44_local0
			if Engine.UserCanPlayOnline( f41_local1 ) then
				f44_local0 = not Friends.IsRecentPlayerJoinable( f41_local1 )
			else
				f44_local0 = true
			end
			return f44_local0
		end, nil, nil, nil, true )
		f41_local6:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
	end
	if Engine.IsXbox360() or Engine.IsXB3() or Engine.IsPCApp() or Engine.IsPS4() then
		f41_arg0:AddButton( "@XBOXLIVE_VIEW_PROFILE", function ( f46_arg0, f46_arg1 )
			Friends.ShowRecentPlayerGamercard( f41_local1 )
		end, nil, nil, nil, nil, true )
	end
	if not Engine.IsPS4() then
		local f41_local7
		if Engine.IsXB3() or Engine.IsPCApp() then
			f41_local7 = "@LUA_MENU_FRIEND_FOLLOW"
			if not f41_local7 then
			
			else
				f41_local6 = f41_arg0:AddButton( f41_local7, function ( f48_arg0, f48_arg1 )
					Friends.RequestRecentPlayerAsFriend( f41_local1 )
				end, function ()
					return Friends.IsRecentPlayerAFriend( f41_local1 )
				end, nil, nil, nil, true )
				f41_local6:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
			end
		end
		f41_local7 = "@MENU_FRIEND_REQUEST"
	end
	f41_arg0:AddButton( "@MENU_REPORT_PLAYER", OnReport, nil, nil, nil, nil, true )
	f41_arg0.playerOptions = f41_local0
	f41_arg0.list = f41_local2
	f41_local0:clearSavedState()
end

LUI.FriendsMenu.AddRecentPlayerHelp = function ( f49_arg0 )
	f49_arg0:AddOnlineFriendHelp()
end

LUI.FriendsMenu.AddLivePartyPlayerOptions = function ( f50_arg0 )
	local f50_local0 = f50_arg0:BuildSublist()
	f50_local0.id = "RecentPlayerOptions"
	f50_arg0:addElement( f50_local0 )
	local f50_local1 = f50_arg0.controller
	local f50_local2 = f50_arg0.list
	f50_arg0.list = f50_local0
	if not Engine.IsXbox360() and not Engine.IsXB3() and not Engine.IsPCApp() then
		local f50_local3 = Engine.IsPS4()
	end
	local f50_local4 = not Engine.InFrontend()
	local f50_local5 = Engine.InLobby()
	local f50_local6 = nil
	if Engine.IsMultiplayer() then
		local f50_local7 = function ()
			local f51_local0 = Friends.IsLivePartyLocal( f50_local1 )
			if not f51_local0 then
				if Engine.GetOnlineGame() then
					f51_local0 = not Friends.IsLivePartyFriendInvitable( f50_local1 )
				else
					f51_local0 = true
				end
			end
			return f51_local0
		end
		
		local f50_local8
		if f50_local4 or f50_local5 then
			f50_local8 = Engine.Localize( "@MENU_INVITE_TO_GAME" )
			if not f50_local8 then
			
			else
				f50_local6 = f50_arg0:AddButton( f50_local8, function ( f52_arg0, f52_arg1 )
					f52_arg0.menu:InviteSentCommon()
					Friends.InviteLivePartyFriend( f52_arg1.controller )
				end, f50_local7, nil, nil, nil, true )
				f50_local6:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
			end
		end
		f50_local8 = Engine.Localize( "@MENU_INVITE_TO_PARTY" )
	end
	f50_local6 = f50_arg0:AddButton( "@MENU_JOIN_GAME", function ( f54_arg0, f54_arg1 )
		Friends.JoinLivePartyFriend( f54_arg1.controller )
	end, function ()
		local f53_local0 = Friends.IsLivePartyLocal( f50_local1 )
		if not f53_local0 then
			if Engine.UserCanPlayOnline( f50_local1 ) then
				f53_local0 = not Friends.IsLivePartyFriendJoinable( f50_local1 )
			else
				f53_local0 = true
			end
		end
		return f53_local0
	end, nil, nil, nil, true )
	f50_local6:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
	if Engine.IsXbox360() or Engine.IsXB3() or Engine.IsPCApp() or Engine.IsPS4() then
		f50_arg0:AddButton( "@XBOXLIVE_VIEW_PROFILE", function ( f55_arg0, f55_arg1 )
			Friends.ShowLivePartyFriendGamercard( f55_arg1.controller )
		end, nil, nil, nil, nil, true )
	end
	f50_local6 = f50_arg0:AddButton( "@MENU_REPORT_PLAYER", OnReport, function ()
		return Friends.IsLivePartyFriendMe( f50_local1, f50_arg0.focusedButton.friendIndex )
	end, nil, nil, nil, true )
	f50_local6:setDisabledRefreshRate( LUI.FriendsMenu.ButtonRefreshRate )
	f50_arg0.playerOptions = f50_local0
	f50_arg0.list = f50_local2
	f50_local0:clearSavedState()
end

LUI.FriendsMenu.AddLivePartyPlayerHelp = function ( f57_arg0 )
	local f57_local0 = f57_arg0
	if Engine.GetOnlineGame() then
		f57_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_alt2",
			helper_text = Engine.Localize( "@PLATFORM_INVITE_XBOX_LIVE_PARTY" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f58_arg0, f58_arg1 )
			Engine.PlaySound( CoD.SFX.MouseClick )
			Friends.InviteAllLiveParty( f58_arg1.controller )
		end )
	end
	if Engine.GetOnlineGame() and PlatformShouldShowPartyGameInvites() then
		f57_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_start",
			helper_text = Engine.Localize( "@MENU_INVITE_FRIENDS" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f59_arg0, f59_arg1 )
			if Friends.OpenSystemFriendsList then
				Friends.OpenSystemFriendsList( f59_arg1.controller )
			else
				Engine.Exec( "xshowfriendslist" )
			end
		end )
	end
	if PlatformShouldShowPartyUI() then
		f57_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_select",
			helper_text = Engine.Localize( "@PLATFORM_PARTY_UI" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f60_arg0, f60_arg1 )
			Friends.OpenLivePartyUI( f60_arg1.controller )
		end )
	end
	if PlatformShouldShowPartyGameInvites() and Friends.HasPartyGameInvite() then
		f57_arg0:AddHelp( {
			name = "add_button_helper_text",
			button_ref = "button_start",
			helper_text = Engine.Localize( "@XBOXLIVE_PARTY_INVITE_ACCEPT" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f61_arg0, f61_arg1 )
			if Friends.HasPartyGameInvite() then
				Engine.PlaySound( CoD.SFX.MouseClick )
				Friends.AcceptLivePartyInvitation( f61_arg1.controller )
			end
		end )
	end
end

LUI.FriendsMenu.AddPartyManagementHelp = function ( f62_arg0 )
	local f62_local0 = f62_arg0
	f62_local0.sublistFocused = false
	local f62_local1 = function ( f63_arg0, f63_arg1 )
		f62_local0.subPanel:processEvent( {
			name = "lose_focus"
		} )
		f62_local0.list:processEvent( {
			name = "gain_focus",
			flowType = FocusType.Gamepad
		} )
		f62_local0.sublistFocused = false
	end
	
	local f62_local2 = function ( f64_arg0, f64_arg1 )
		f62_local0:RemoveDescription()
		f62_local0.list:processEvent( {
			name = "lose_focus"
		} )
		if f62_local0.sublistFocused == false then
			f62_local0.subPanel:processEvent( {
				name = "gain_focus",
				flowType = FocusType.Gamepad
			} )
		end
		if f62_local0.focusedButton ~= nil then
			f62_local0.focusedButton:SetHighlight( false )
			f62_local0.focusedButton = nil
		end
		f62_local0.sublistFocused = true
	end
	
	f62_arg0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_left",
		button_ref2 = "button_right",
		helper_text = Engine.Localize( "@LUA_MENU_NAVIGATE" ),
		side = "right",
		clickable = false,
		priority = -1000,
		func = f62_local1,
		func2 = f62_local2,
		leftIconClickFunc = f62_local1,
		rightIconClickFunc = f62_local2
	} )
end

LUI.FriendsMenu.AddMoreOptionsDescription = function ( f65_arg0 )
	f65_arg0:AddDescription( "@LUA_MENU_FRIENDS_OPTIONS", Engine.Localize( CoD.UsingController() and ButtonMap.button_action.string or ButtonMap.button_action.keyboard_mouse_string ) )
	f65_arg0.currentTab:helpFunc()
end

LUI.FriendsMenu.UpdateScrollText = function ( f66_arg0, f66_arg1, f66_arg2 )
	f66_arg0.scrollText:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f66_arg1, f66_arg2 ) )
	if f66_arg0.friendCount > LUI.FriendsMenu.NumButtons then
		f66_arg0.upArrow:show()
		f66_arg0.downArrow:show()
	else
		f66_arg0.upArrow:hide()
		f66_arg0.downArrow:hide()
	end
end

function OnFocusFriend( f67_arg0, f67_arg1 )
	if Engine.IsPC() and f67_arg0.menu.playerOptions ~= nil then
		return 
	elseif f67_arg0.menu.highlightedButton ~= f67_arg0 then
		if f67_arg0.menu.highlightedButton ~= nil then
			f67_arg0.menu.highlightedButton:SetHighlight( false )
		end
		f67_arg0.menu.currentTab.xuidFunc( f67_arg0.menu.controller, f67_arg0.friendIndex )
		f67_arg0.menu.playerCard:feedContent( f67_arg0.data )
		f67_arg0.menu:RefreshPlayerDetails( f67_arg0.data )
		f67_arg0.menu:AddMoreOptionsDescription()
		if Engine.IsPC() then
			f67_arg0.menu:RemoveReportOptions()
			f67_arg0.menu:RemovePlayerOptions()
		end
	end
	f67_arg0:SetHighlight( true )
	if f67_arg0.menu.focusedButton and f67_arg0.menu.focusedButton ~= f67_arg0 then
		f67_arg0.menu.focusedButton:SetHighlight( false )
		f67_arg0.menu.focusedButton:setFocus( false )
	end
	f67_arg0.menu:UpdateScrollText( f67_arg0.friendIndex + 1, f67_arg0.menu.friendCount )
	f67_arg0.menu.focusedButton = f67_arg0
	f67_arg0.menu.highlightedButton = nil
	f67_arg0.menu.list:setLayoutCached( false )
end

function OnSelectFriend( f68_arg0, f68_arg1 )
	f68_arg0.menu:RemoveReportOptions()
	f68_arg0.menu:RemovePlayerOptions()
	if Engine.IsPC() and f68_arg0 ~= f68_arg0.menu.focusedButton then
		OnFocusFriend( f68_arg0, f68_arg1 )
	end
	Friends.UpdatePartyDvars( f68_arg0.menu.controller, f68_arg0.friendIndex )
	LUI.ButtonHelperText.ClearHelperTextObjects( f68_arg0.menu.help, {
		side = "right"
	} )
	LUI.FriendsMenu.Menu:AddHelpButtons()
	f68_arg0.menu:RemoveDescription()
	f68_arg0.menu.currentTab.optionsFunc( f68_arg0.menu )
	f68_arg0.menu.list:processEvent( {
		name = "lose_focus"
	} )
	f68_arg0.menu.playerOptions:processEvent( {
		name = "gain_focus"
	} )
	f68_arg0.menu.highlightedButton = f68_arg0
	f68_arg0.menu.list:setLayoutCached( false )
end

LUI.FriendsMenu.Page = function ( f69_arg0, f69_arg1 )
	if f69_arg0.focusedButton ~= nil then
		local f69_local0 = f69_arg0.focusedButton.index
		local f69_local1 = LUI.clamp( f69_arg0.focusedButton.index + f69_arg0.friendOffset - 1 + f69_arg1, 0, math.max( 0, f69_arg0.friendCount - 1 ) )
		local f69_local2 = f69_arg0.friendOffset
		f69_arg0.friendOffset = LUI.clamp( f69_arg0.friendOffset + f69_arg1, 0, math.max( 0, f69_arg0.friendCount - LUI.FriendsMenu.NumButtons ) )
		local f69_local3 = 1 + f69_local1 - f69_arg0.friendOffset
		if f69_local0 ~= f69_local3 then
			LUI.UIElement.processNavigationEvent( f69_arg0.focusedButton, nil, LUI.FriendsMenu.GetButtonForIndex( f69_arg0, f69_local3 ) )
		end
		if f69_local2 ~= f69_arg0.friendOffset then
			f69_arg0.currentTab.xuidFunc( f69_arg0.controller, f69_local1 )
			f69_arg0:RefreshList()
		end
	end
end

function OnFriendGamepadButton( f70_arg0, f70_arg1 )
	if f70_arg1.down and f70_arg0:isInFocus() then
		if f70_arg1.qualifier == ButtonQualifiers.Mousewheel then
			if f70_arg1.button == "up" then
				f70_arg0.menu:Page( -1 )
			elseif f70_arg1.button == "down" then
				f70_arg0.menu:Page( 1 )
			end
			return true
		elseif f70_arg1.button == "up" and f70_arg0.index == 1 then
			f70_arg0.menu:Page( -1 )
			return true
		elseif f70_arg1.button == "down" and f70_arg0.index == LUI.FriendsMenu.NumButtons then
			f70_arg0.menu:Page( 1 )
			return true
		end
	end
	return LUI.UIButton.GamepadButton( f70_arg0, f70_arg1 )
end

LUI.FriendsMenu.OnBackButton = function ( f71_arg0, f71_arg1, f71_arg2 )
	if f71_arg2.reportOptions then
		f71_arg2:RemoveReportOptions()
		f71_arg2.playerOptions.m_inputDisabled = false
		f71_arg2.playerOptions:animateToState( "default" )
		f71_arg2.playerOptions:processEvent( {
			name = "gain_focus"
		} )
		Engine.PlaySound( CoD.SFX.SelectBack )
	elseif f71_arg2.playerOptions then
		f71_arg2:FocusMainList()
		f71_arg2:AddHelpButtons()
		f71_arg2:AddMoreOptionsDescription()
		Engine.PlaySound( CoD.SFX.SelectBack )
	elseif LUI.FriendsMenu.ActiveSublist then
		assert( LUI.FriendsMenu.ActiveSublistOwner ~= nil )
		removeOptionsSubList( LUI.FriendsMenu.ActiveSublistOwner:getParent() )
		f71_arg2:AddHelpButtons()
		f71_arg2.currentTab:helpFunc()
		Engine.PlaySound( CoD.SFX.SelectBack )
	else
		LUI.FlowManager.RequestLeaveMenu( f71_arg0 )
	end
end

LUI.FriendsMenu.FocusMainList = function ( f72_arg0 )
	if LUI.FriendsMenu.FriendsMenuHasFocus() then
		f72_arg0:RemoveReportOptions()
		f72_arg0:RemovePlayerOptions()
		if f72_arg0.focusedButton ~= nil then
			f72_arg0.focusedButton:setFocus( true )
			f72_arg0.list:saveState()
		end
		f72_arg0.list:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.FriendsMenu.TickRefresh = function ( f73_arg0 )
	f73_arg0:RefreshList()
end

LUI.FriendsMenu.GetButtonForIndex = function ( f74_arg0, f74_arg1 )
	return f74_arg0.list:getChildById( "FriendsListItem" .. f74_arg1 )
end

LUI.FriendsMenu.RefreshList = function ( f75_arg0 )
	if Engine.IsXB3() or Engine.IsPCApp() then
		Engine.ExecNow( "friends_refresh" )
	end
	Engine.ExecNow( "refreshfacebookfriends" )
	local f75_local0 = f75_arg0.friendCount
	f75_arg0.friendCount = f75_arg0.currentTab.countFunc( f75_arg0.controller )
	f75_arg0.friendData = {}
	local f75_local1 = f75_arg0.focusedButton and f75_arg0.focusedButton.friendIndex or 0
	if f75_arg0.focusedButton ~= nil then
		local f75_local2 = f75_arg0.focusedButton.data
		local f75_local3 = f75_arg0.focusedButton.data.xuid
	end
	local f75_local4 = f75_local2 and f75_local3 or -1
	local f75_local5 = f75_local1
	f75_arg0.friendOffset, f75_local5 = f75_arg0.currentTab.cursorFunc( f75_arg0.controller, LUI.FriendsMenu.NumButtons, f75_local1, f75_arg0.friendOffset )
	for f75_local6 = 1, LUI.FriendsMenu.NumButtons, 1 do
		local f75_local9 = LUI.FriendsMenu.GetButtonForIndex( f75_arg0, f75_local6 )
		if f75_local9 ~= nil then
			local f75_local10 = f75_local6 + f75_arg0.friendOffset - 1
			if f75_local10 < f75_arg0.friendCount then
				f75_local9.friendIndex = f75_local10
				f75_local9:animateToState( "default" )
				local f75_local11 = {
					xuid = f75_arg0.currentTab.xuidGetFunc( f75_arg0.controller, f75_local10 ),
					gamertag = CoD.FormatClanAndGamerTags( f75_arg0.currentTab.clanTagFunc( f75_arg0.controller, f75_local10 ), f75_arg0.currentTab.gamerTagFunc( f75_arg0.controller, f75_local10 ) ),
					presence = f75_arg0.currentTab.presenceFunc( f75_arg0.controller, f75_local10 )
				}
				if f75_arg0.currentTab.isOnlineFunc then
					f75_local11.isOnline = f75_arg0.currentTab.isOnlineFunc( f75_arg0.controller, f75_local10 )
				else
					f75_local11.defaultHeader = Engine.Localize( f75_arg0.currentTab.defaultHeader )
				end
				f75_local11.rank = f75_arg0.currentTab.rankFunc( f75_arg0.controller, f75_local10 )
				f75_local11.prestige = f75_arg0.currentTab.prestigeFunc( f75_arg0.controller, f75_local10 )
				f75_local11.rankIcons = f75_arg0.currentTab.rankIconsFunc( f75_arg0.controller, f75_local10 )
				f75_local11.background = f75_arg0.currentTab.backgroundFunc( f75_arg0.controller, f75_local10 )
				f75_local11.emblem = f75_arg0.currentTab.emblemFunc( f75_arg0.controller, f75_local10 )
				f75_local9:Refresh( f75_local11 )
				f75_local9:makeFocusable()
				if not Engine.IsConsoleGame() then
					f75_local9:setHandleMouseButton( true )
				end
				if f75_local11.isOnline == true then
					if f75_local9.isSelected ~= true then
						f75_local9.onlineDeco:show()
					end
				end
				f75_local9.onlineDeco:hide()
			end
			f75_local9:animateToState( "hidden" )
			f75_local9:makeNotFocusable()
			if not Engine.IsConsoleGame() then
				f75_local9:setHandleMouseButton( false )
			end
		end
	end
	if f75_arg0.friendCount > 0 then
		f75_arg0:RemoveNoFriends()
		if f75_local0 and f75_local0 < 1 then
			f75_arg0:FocusMainList()
		end
		if f75_arg0.focusedButton ~= nil then
			local f75_local6 = LUI.FriendsMenu.GetButtonForIndex( f75_arg0, f75_local5 - f75_arg0.friendOffset + 1 )
			if f75_local1 ~= f75_local5 then
				if f75_arg0.focusedButton:isInFocus() then
					LUI.UIElement.processNavigationEvent( f75_arg0.focusedButton, {
						controller = f75_arg0.controller
					}, f75_local6 )
				else
					f75_arg0.focusedButton:SetHighlight( false )
					f75_local6:SetHighlight( true )
					f75_arg0.highlightedButton = f75_local6
					f75_arg0.focusedButton:setFocus( false )
					f75_local6:setFocus( true )
					f75_arg0.list:saveState()
					f75_local6:setFocus( false )
					f75_arg0:UpdateScrollText( f75_local5 + 1, f75_arg0.friendCount )
				end
				f75_arg0.focusedButton = f75_local6
			elseif f75_local4 ~= -1 and f75_local6 ~= nill and f75_local4 ~= f75_local6.data.xuid then
				f75_arg0:JumpToTop()
			end
			f75_arg0.playerCard:feedContent( f75_arg0.focusedButton.data )
			f75_arg0:RefreshPlayerDetails( f75_arg0.focusedButton.data )
		end
		f75_arg0.subContainer:animateToState( "default" )
	else
		f75_arg0:AddNoFriends( f75_arg0.currentTab.noFriends, f75_arg0.controller )
		f75_arg0.subContainer:animateToState( "hidden" )
	end
	if f75_local0 ~= f75_arg0.friendCount then
		f75_arg0.list:updateNavigation()
	end
end

LUI.FriendsMenu.JumpToTop = function ( f76_arg0 )
	f76_arg0:RemovePlayerOptions()
	f76_arg0:RemoveReportOptions()
	f76_arg0.friendOffset = 0
	f76_arg0.currentTab.xuidFunc( f76_arg0.controller, 0 )
	f76_arg0.list:processEvent( {
		name = "lose_focus"
	} )
	f76_arg0.list:clearSavedState()
	f76_arg0:RefreshList()
	if LUI.FriendsMenu.FriendsMenuHasFocus() then
		f76_arg0.list:processEvent( {
			name = "gain_focus",
			flowType = FocusType.Gamepad
		} )
	end
end

LUI.FriendsMenu.ChangeTab = function ( f77_arg0, f77_arg1 )
	f77_arg0.currentTab = f77_arg1
	f77_arg0.currentTab:subPanelFunc()
	f77_arg0:JumpToTop()
	f77_arg0:AddHelpButtons()
	f77_arg0.currentTab:helpFunc()
end

LUI.FriendsMenu.AddSubPanel = function ( f78_arg0 )
	removeOptionsSubList()
	if f78_arg0.subPanel then
		f78_arg0:removeElement( f78_arg0.subPanel )
		f78_arg0.subPanel = nil
	end
	local subPanel = LUI.UIElement.new( CoD.CreateState( -382, -195, nil, 182, CoD.AnchorTypes.Right ) )
	f78_arg0:addElement( subPanel )
	f78_arg0.subPanel = subPanel
	
end

function PartyPrivacyDisplayFunc()
	local f79_local0 = Lobby.IsPrivatePartyOpen()
	local f79_local1 = nil
	if f79_local0 then
		f79_local1 = Lobby.PrivacySettings.Open
	else
		f79_local1 = Lobby.PrivacySettings.Closed
	end
	return Lobby.PrivacySettings.Texts[f79_local1]
end

function PartyPrivacySetFunc( f80_arg0 )
	if Lobby.IsPrivatePartyOpen() then
		if f80_arg0 == 0 then
			Lobby.TogglePrivatePartyOpen()
		end
	elseif f80_arg0 == 1 then
		Lobby.TogglePrivatePartyOpen()
	end
end

f0_local0 = function ()
	local f81_local0 = Engine.GetDvarInt( "party_partyPlayerCountNum" )
	if f81_local0 < PLAYER_LIMIT_MIN then
		f81_local0 = PLAYER_LIMIT_MIN
	end
	return f81_local0
end

f0_local1 = function ()
	return Engine.GetDvarInt( "party_maxPrivatePartyPlayers" )
end

f0_local2 = function ( f83_arg0 )
	local f83_local0 = f0_local0()
	if f83_arg0 < f83_local0 then
		f83_arg0 = f83_local0
	end
	if PLAYER_LIMIT_MAX < f83_arg0 then
		f83_arg0 = PLAYER_LIMIT_MAX
	end
	Engine.SetDvarInt( "party_maxPrivatePartyPlayers", f83_arg0 )
end

function PlayerLimitDisplayFunc()
	return f0_local1()
end

function PlayerLimitSetFunc( f85_arg0 )
	f0_local2( f85_arg0 )
end

function removeOptionsSubList( f86_arg0 )
	if LUI.FriendsMenu.ActiveSublist then
		LUI.FriendsMenu.ActiveSublist:clearSavedState()
		local f86_local0 = LUI.FriendsMenu.ActiveSublist:getParent()
		f86_local0:removeElement( LUI.FriendsMenu.ActiveSublist )
		LUI.FriendsMenu.ActiveSublist = nil
		LUI.FriendsMenu.ActiveSublistOwner = nil
		if f86_arg0 then
			f86_arg0:processEvent( {
				name = "gain_focus"
			} )
		end
		LUI.FriendsMenu.Menu:AddHelpButtons()
		LUI.FriendsMenu.Menu.currentTab.helpFunc( LUI.FriendsMenu.Menu )
	end
end

function addOptionsSublist( f87_arg0, f87_arg1, f87_arg2, f87_arg3, f87_arg4, f87_arg5, f87_arg6 )
	removeOptionsSubList()
	local f87_local0 = 24
	local f87_local1 = 4
	local f87_local2 = 5
	local f87_local3 = false
	local f87_local4 = f87_local1 + f87_local0 * f87_arg4
	if f87_local2 * f87_local0 < f87_local4 then
		f87_local4 = f87_local2 * f87_local0
		f87_local3 = true
	end
	local f87_local5, f87_local6, f87_local7, f87_local8 = f87_arg0:getRect()
	local f87_local9 = 1
	if Engine.GetLuiRootScale then
		f87_local9 = Engine.GetLuiRootScale()
	end
	local f87_local10, f87_local11, f87_local12, f87_local13 = f87_arg2:getRect()
	local f87_local14 = (f87_local6 - f87_local11 + f87_local8 - f87_local6) / f87_local9
	local f87_local15 = LUI.SubList.CreateSublist( CoD.CreateState( (f87_local5 - f87_local10) / f87_local9, f87_local14, (f87_local7 - f87_local10) / f87_local9, f87_local14 + f87_local4, CoD.AnchorTypes.TopLeft ), f87_local1 / 2 )
	f87_local15.vertList.id = "partyManagementOptions_sublist"
	f87_local15.vertList.buttonCount = f87_arg4
	f87_local15.vertList.parent = f87_arg2
	f87_local15.vertList.button = f87_arg0
	for f87_local19, f87_local20 in ipairs( f87_arg3 ) do
		local f87_local21 = LUI.SubList.CreateSubListButton( f87_local19, f87_local0, 20, -12, 14 )
		f87_local21.text:setText( f87_local20.label )
		f87_local21:addEventHandler( "button_action", function ( f88_arg0, f88_arg1 )
			f87_arg5( f87_local20.value )
			removeOptionsSubList( f87_arg1 )
			f87_local15.vertList.button:setText( Engine.ToUpperCase( Engine.Localize( f87_arg6() ) ) )
			f87_arg2:AddHelpButtons()
			f87_arg2.currentTab:helpFunc()
		end )
		f87_local21.listDefaultFocus = f87_local20.isDefault
		f87_local15.vertList:addElement( f87_local21 )
	end
	if f87_local3 == true then
		LUI.Options.InitScrollingList( f87_local15.vertList, nil, {
			rows = f87_local2,
			scrollBarLeftOffset = 0
		} )
	end
	f87_arg2:insertElement( f87_local15, 1 )
	LUI.FriendsMenu.ActiveSublist = f87_local15
	LUI.FriendsMenu.ActiveSublistOwner = f87_arg0
	f87_arg1:processEvent( {
		name = "lose_focus"
	} )
	f87_local15.vertList:processEvent( {
		name = "gain_focus"
	} )
	LUI.ButtonHelperText.ClearHelperTextObjects( f87_arg2.help, {
		side = "all"
	} )
	LUI.FriendsMenu.Menu:AddHelpButtons()
end

LUI.FriendsMenu.AddPartyBonusXpSplash = function ( f89_arg0 )
	local f89_local0 = CoD.CreateState( -40, -30, nil, nil, CoD.AnchorTypes.BottomLeft )
	local f89_local1 = RegisterMaterial( "h1_ui_icon_party_bonus_bg" )
	local f89_local2, f89_local3 = GetMaterialDimensions( f89_local1 )
	local f89_local4 = f89_local2 / f89_local3
	local f89_local5 = 112
	f89_local0.material = f89_local1
	f89_local0.height = f89_local5
	f89_local0.width = f89_local4 * f89_local5
	local self = LUI.UIImage.new( f89_local0 )
	local f89_local7 = CoD.CreateState( 10.5, 24, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f89_local7.font = CoD.TextSettings.TitleFontSmaller.Font
	f89_local7.color = Colors.h1.light_grey
	f89_local7.height = 25
	f89_local7.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f89_local7 )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_DOUBLE_XP" ) ) )
	self:addElement( self )
	local f89_local9 = CoD.CreateState( 12, 49, nil, nil, CoD.AnchorTypes.TopLeft )
	f89_local9.width = 130
	f89_local9.font = CoD.TextSettings.TitleFontSmaller.Font
	f89_local9.color = Colors.h1.yellow
	f89_local9.height = 11
	f89_local9.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f89_local9 )
	self:setText( Engine.Localize( "@LUA_MENU_DOUBLE_XP_FOR_PARTY" ) )
	self:addElement( self )
	local f89_local11 = CoD.CreateState( 145, -7, nil, nil, CoD.AnchorTypes.TopLeft )
	f89_local1 = RegisterMaterial( "ui_reward_double_party_xp" )
	local f89_local12, f89_local13 = GetMaterialDimensions( f89_local1 )
	f89_local4 = f89_local12 / f89_local13
	f89_local5 = 135
	f89_local11.material = f89_local1
	f89_local11.height = f89_local5
	f89_local11.width = f89_local4 * f89_local5
	self:addElement( LUI.UIImage.new( f89_local11 ) )
	f89_arg0.partyXp = self
	f89_arg0:addElement( self )
end

LUI.FriendsMenu.AddPartyManagementSubPanel = function ( f90_arg0 )
	if f90_arg0.subPanel then
		f90_arg0:removeElement( f90_arg0.subPanel )
		f90_arg0.subPanel = nil
	end
	local f90_local0 = f90_arg0
	local subPanel = LUI.UIElement.new( CoD.CreateState( -247, -191, nil, 178, CoD.AnchorTypes.Right ) )
	local f90_local2 = GetContentPromos()
	local f90_local3 = false
	for f90_local4 = 1, #f90_local2, 1 do
		if f90_local2[f90_local4] == LUI.MPDepot.ExclusiveCrates.SHAMROCK_AND_AWE then
			f90_local3 = true
		end
	end
	if f90_local3 then
		LUI.FriendsMenu.AddPartyBonusXpSplash( subPanel )
	end
	f90_arg0:addElement( subPanel )
	f90_arg0.subPanel = subPanel
	
	if not Lobby.IsPrivatePartyHost() then
		return 
	end
	local f90_local4 = CoD.CreateState( -150, 30, nil, nil, CoD.AnchorTypes.Top )
	f90_local4.height = 15
	f90_local4.width = 250
	local self = LUI.UIVerticalList.new( f90_local4 )
	self.buttonCount = 0
	local f90_local6 = f90_arg0.list
	f90_arg0.list = self
	local f90_local7 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f90_local7.font = CoD.TextSettings.TitleFontSmaller.Font
	f90_local7.color = Colors.h1.light_grey
	f90_local7.height = 15
	f90_local7.alignment = LUI.Alignment.Left
	if Engine.IsConsoleGame() or Engine.IsPCApp() then
		local self = LUI.UIText.new( f90_local7 )
		self:setText( Engine.Localize( "@PATCH_MENU_PARTY_PRIVACY_CAPS" ) )
		self:addElement( self )
		local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 8, 5, CoD.AnchorTypes.TopLeft ) )
		self.id = "sublistDivider_partyPrivacy"
		local f90_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.LeftRight )
		f90_local10.height = 1
		f90_local10.material = RegisterMaterial( "white" )
		f90_local10.color = GenericButtonSettings.Common.content_focus_color
		self:addElement( LUI.UIImage.new( f90_local10 ) )
		self:addElement( self )
		f90_arg0:AddSpacing( 2 )
		f90_arg0:AddButton( PartyPrivacyDisplayFunc(), function ( f91_arg0, f91_arg1 )
			local f91_local0 = {}
			for f91_local1 = 1, Lobby.PrivacySettings.NumOptions, 1 do
				local f91_local4 = f91_local1 - 1
				local f91_local5 = false
				if Lobby.IsPrivatePartyOpen() then
					if f91_local4 == 1 then
						f91_local5 = true
					end
				elseif f91_local4 == 0 then
					f91_local5 = true
				end
				f91_local0[f91_local1] = {
					label = Engine.ToUpperCase( Engine.Localize( Lobby.PrivacySettings.Texts[f91_local4] ) ),
					value = f91_local4,
					isDefault = f91_local5
				}
			end
			if f91_arg0 == LUI.FriendsMenu.ActiveSublistOwner then
				removeOptionsSubList()
			else
				addOptionsSublist( f91_arg0, self, f90_local0, f91_local0, Lobby.PrivacySettings.NumOptions, PartyPrivacySetFunc, PartyPrivacyDisplayFunc )
			end
		end, nil, nil, nil, {
			hasSublist = true
		}, true )
	end
	f90_arg0:AddSpacing( 70 )
	local self = LUI.UIText.new( f90_local7 )
	self:setText( Engine.Localize( "@PATCH_MENU_PLAYER_LIMIT_CAPS" ) )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 8, 5, CoD.AnchorTypes.TopLeft ) )
	self.id = "sublistDivider_partyLimit"
	self:addElement( LUI.UIImage.new( dividerState ) )
	self:addElement( self )
	f90_arg0:AddSpacing( 2 )
	f90_arg0:AddButton( PlayerLimitDisplayFunc(), function ( f92_arg0, f92_arg1 )
		local f92_local0 = f0_local0()
		local f92_local1 = PLAYER_LIMIT_MAX - f92_local0 + 1
		local f92_local2 = {}
		for f92_local3 = 1, f92_local1, 1 do
			local f92_local6 = f92_local0 + f92_local3 - 1
			f92_local2[f92_local3] = {
				label = f92_local6,
				value = f92_local6,
				isDefault = f92_local6 == f0_local1()
			}
		end
		if f92_arg0 == LUI.FriendsMenu.ActiveSublistOwner then
			removeOptionsSubList()
		else
			addOptionsSublist( f92_arg0, self, f90_local0, f92_local2, f92_local1, PlayerLimitSetFunc, PlayerLimitDisplayFunc )
		end
	end, nil, nil, nil, {
		hasSublist = true
	}, true )
	f90_arg0:AddSpacing( 104 )
	f90_arg0.list = f90_local6
	subPanel:addElement( self )
end

LUI.FriendsMenu.OnlineFriendsTab = {
	label = "@LUA_MENU_FRIENDS",
	noFriends = Engine.IsPCApp() and "@PLATFORM_NO_FRIENDS_XBOXLIVE" or "@PLATFORM_NO_FRIENDS",
	cursorFunc = Friends.GetOnlineFriendsCursorPos,
	countFunc = Friends.GetOnlineFriendsCount,
	clanTagFunc = Friends.GetOnlineFriendClanTag,
	gamerTagFunc = Friends.GetOnlineFriendGamertag,
	presenceFunc = Friends.GetOnlineFriendPresence,
	isOnlineFunc = Friends.GetOnlineFriendIsOnline,
	rankFunc = Friends.GetOnlineFriendRank,
	rankIconsFunc = Friends.GetOnlineFriendCustomRankIcons,
	prestigeFunc = Friends.GetOnlineFriendPrestige,
	backgroundFunc = Friends.GetOnlineFriendBackground,
	emblemFunc = Friends.GetOnlineFriendPatch,
	xuidFunc = Friends.SetOnlineFriendStoredXUID,
	xuidGetFunc = Friends.GetOnlineFriendXUID,
	reportFunc = Friends.ReportOnlineFriend,
	optionsFunc = LUI.FriendsMenu.AddOnlineFriendOptions,
	helpFunc = LUI.FriendsMenu.AddOnlineFriendHelp,
	subPanelFunc = LUI.FriendsMenu.AddSubPanel
}
LUI.FriendsMenu.RecentPlayersTab = {
	label = "@MENU_RECENT_PLAYERS",
	noFriends = "@LUA_MENU_NO_RECENT_PLAYERS",
	cursorFunc = Friends.GetRecentPlayersCursorPos,
	countFunc = Friends.GetRecentPlayersCount,
	clanTagFunc = Friends.GetRecentPlayerClanTag,
	gamerTagFunc = Friends.GetRecentPlayerGamertag,
	presenceFunc = Friends.GetRecentPlayerPresence,
	rankFunc = Friends.GetRecentPlayerRank,
	rankIconsFunc = Friends.GetRecentPlayerCustomRankIcons,
	prestigeFunc = Friends.GetRecentPlayerPrestige,
	backgroundFunc = Friends.GetRecentPlayerBackground,
	emblemFunc = Friends.GetRecentPlayerPatch,
	xuidFunc = Friends.SetRecentPlayerStoredXUID,
	xuidGetFunc = Friends.GetRecentPlayerXUID,
	reportFunc = Friends.ReportRecentPlayer,
	optionsFunc = LUI.FriendsMenu.AddRecentPlayerOptions,
	helpFunc = LUI.FriendsMenu.AddRecentPlayerHelp,
	subPanelFunc = LUI.FriendsMenu.AddSubPanel,
	defaultHeader = "@MENU_RECENT_CAPS"
}
LUI.FriendsMenu.ReturnTrue = function ()
	return true
end

LUI.FriendsMenu.LivePartyTab = {
	label = "@XBOXLIVE_LIVE_PARTY",
	noFriends = "@PLATFORM_NOT_IN_PARTY",
	cursorFunc = Friends.GetLivePartyFriendsCursorPos,
	countFunc = Friends.GetLivePartyFriendsCount,
	clanTagFunc = Friends.GetLivePartyFriendClanTag,
	gamerTagFunc = Friends.GetLivePartyFriendGamertag,
	presenceFunc = Friends.GetLivePartyFriendPresence,
	rankFunc = Friends.GetLivePartyFriendRank,
	rankIconsFunc = Friends.GetLivePartyFriendCustomRankIcons,
	prestigeFunc = Friends.GetLivePartyFriendPrestige,
	isOnlineFunc = LUI.FriendsMenu.ReturnTrue,
	backgroundFunc = Friends.GetLivePartyFriendBackground,
	emblemFunc = Friends.GetLivePartyFriendPatch,
	xuidFunc = Friends.SetLivePartyFriendStoredXUID,
	xuidGetFunc = Friends.GetLivePartyFriendXUID,
	reportFunc = Friends.ReportLivePartyFriend,
	optionsFunc = LUI.FriendsMenu.AddLivePartyPlayerOptions,
	helpFunc = LUI.FriendsMenu.AddLivePartyPlayerHelp,
	subPanelFunc = LUI.FriendsMenu.AddSubPanel
}
LUI.FriendsMenu.PartyManagementTab = {
	label = "@MENU_MANAGE_PARTY",
	noFriends = " ",
	cursorFunc = Friends.GetPartyManagementCursorPos,
	countFunc = Friends.GetPartyManagementCount,
	clanTagFunc = Friends.GetPartyManagementClanTag,
	gamerTagFunc = Friends.GetPartyManagementGamertag,
	presenceFunc = Friends.GetPartyManagementPresence,
	rankFunc = Friends.GetPartyManagementRank,
	isOnlineFunc = LUI.FriendsMenu.ReturnTrue,
	rankIconsFunc = Friends.GetPartyManagementCustomRankIcons,
	prestigeFunc = Friends.GetPartyManagementPrestige,
	backgroundFunc = Friends.GetPartyManagementBackground,
	emblemFunc = Friends.GetPartyManagementPatch,
	xuidFunc = Friends.SetPartyManagementStoredXUID,
	xuidGetFunc = Friends.GetPartyManagementXUID,
	reportFunc = Friends.ReportPartyManagement,
	optionsFunc = LUI.FriendsMenu.AddPartyManagementOptions,
	helpFunc = LUI.FriendsMenu.AddPartyManagementHelp,
	subPanelFunc = LUI.FriendsMenu.AddPartyManagementSubPanel
}
LUI.FriendsMenu.AddTabs = function ( f94_arg0, f94_arg1 )
	local f94_local0 = Engine.IsXbox360()
	if not f94_local0 then
		f94_local0 = Engine.IsXB3()
	end
	local f94_local1 = {
		[#f94_local1 + 1] = LUI.FriendsMenu.OnlineFriendsTab,
		[#f94_local1 + 1] = LUI.FriendsMenu.RecentPlayersTab
	}
	if Engine.InFrontend() then
		f94_local1[#f94_local1 + 1] = LUI.FriendsMenu.PartyManagementTab
	end
	local f94_local2 = {
		defState = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight )
	}
	local f94_local3
	if f94_local0 then
		f94_local3 = #f94_local1 + 1
		if not f94_local3 then
		
		else
			f94_local2.numOfTabs = f94_local3
			f94_local3 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", f94_local2 )
			f94_local3:keepRightBumperAlignedToHeader( true )
			f94_local3.tabSelected = 1
			f94_arg0:addElement( f94_local3 )
			if f94_arg1 then
				f94_local3.tabSelected = #f94_local1
			end
			if f94_local0 then
				f94_local1[#f94_local1 + 1] = LUI.FriendsMenu.LivePartyTab
				if Friends.HasPartyGameInvite() and not f94_arg1 then
					f94_local3.tabSelected = #f94_local1
				end
			end
			for f94_local4 = 1, #f94_local1, 1 do
				local f94_local7 = f94_local4
				f94_local3:addTab( f94_arg0.controller, f94_local1[f94_local7].label, function ()
					f94_arg0:ChangeTab( f94_local1[f94_local7] )
				end )
			end
			f94_local3:refreshTab( f94_arg0.controller )
		end
	end
	f94_local3 = #f94_local1
end

LUI.FriendsMenu.AddScrollText = function ( f96_arg0 )
	local f96_local0 = 547
	local f96_local1 = CoD.TextSettings.TitleFontTiny
	local f96_local2 = CoD.CreateState( 0, f96_local0, 267, f96_local0 + 14, CoD.AnchorTypes.TopLeft )
	local f96_local3 = Engine.GetServerType()
	local f96_local4 = nil
	if f96_local3 == 0 then
		f96_local4 = Colors.white
	elseif f96_local3 == 1 then
		f96_local4 = Colors.grey_5
	else
		f96_local4 = Colors.grey_4
	end
	f96_local2.color = f96_local4
	f96_local2.font = f96_local1.Font
	f96_local2.alignment = LUI.Alignment.Center
	local self = LUI.UIText.new( f96_local2 )
	f96_arg0.subContainer:addElement( self )
	f96_arg0.scrollText = self
	local f96_local6 = 32
	local f96_local7 = CoD.DesignGridHelper( 2 )
	local f96_local8 = CoD.CreateState( CoD.DesignGridHelper( 2.4 ) - f96_local6, f96_local0 - 8, nil, nil, CoD.AnchorTypes.TopLeft )
	f96_local8.width = f96_local6
	f96_local8.height = f96_local6
	f96_local8.material = RegisterMaterial( "s1_icon_up" )
	if Engine.IsPC() then
		f96_local8.alpha = 0.8
		f96_local8.scale = 0
	end
	local self = LUI.UIImage.new( f96_local8 )
	self:hide()
	f96_arg0.subContainer:addElement( self )
	f96_arg0.upArrow = self
	if Engine.IsPC() then
		local self = f96_arg0
		self:setHandleMouseButton( true )
		self:setHandleMouseMove( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			element:animateInSequence( {
				{
					"hightlight",
					0
				},
				{
					"pulse",
					100
				},
				{
					"hightlight",
					100
				}
			} )
			self.focusedButton:setFocus( true )
			OnFriendGamepadButton( self.focusedButton, {
				down = true,
				button = "up",
				name = "gamepad_button"
			} )
		end )
		self:registerAnimationState( "hightlight", {
			alpha = 1,
			scale = 0
		} )
		self:registerAnimationState( "pulse", {
			scale = -0.1
		} )
		self:registerEventHandler( "mouseenter", function ( element, event )
			element:animateToState( "hightlight" )
		end )
		self:registerEventHandler( "mouseleave", MBh.AnimateToState( "default" ) )
	end
	f96_local8.material = RegisterMaterial( "s1_icon_down" )
	f96_local8.left = CoD.DesignGridHelper( 4.2 )
	f96_local8.top = f96_local0 - 9
	local self = LUI.UIImage.new( f96_local8 )
	if Engine.IsPC() then
		local f96_local11 = f96_arg0
		self:setHandleMouseButton( true )
		self:setHandleMouseMove( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			element:animateInSequence( {
				{
					"hightlight",
					0
				},
				{
					"pulse",
					100
				},
				{
					"hightlight",
					100
				}
			} )
			f96_local11.focusedButton:setFocus( true )
			OnFriendGamepadButton( f96_local11.focusedButton, {
				down = true,
				button = "down",
				name = "gamepad_button"
			} )
		end )
		self:registerAnimationState( "hightlight", {
			alpha = 1,
			scale = 0
		} )
		self:registerAnimationState( "pulse", {
			scale = -0.1
		} )
		self:registerEventHandler( "mouseenter", function ( element, event )
			element:animateToState( "hightlight" )
		end )
		self:registerEventHandler( "mouseleave", MBh.AnimateToState( "default" ) )
	end
	self:hide()
	f96_arg0.subContainer:addElement( self )
	f96_arg0.downArrow = self
end

LUI.FriendsMenu.AddHelpButtons = function ( f101_arg0 )
	LUI.ButtonHelperText.ClearHelperTextObjects( f101_arg0.help, {
		side = "all"
	} )
	local f101_local0 = f101_arg0
	f101_arg0:AddBackButton( function ( f102_arg0, f102_arg1 )
		LUI.FriendsMenu.OnBackButton( f102_arg0, f102_arg1, f101_local0 )
	end )
end

function OnLiveConnectionUpdate( f103_arg0, f103_arg1 )
	if f103_arg1.signed_in == nil then
		local f103_local0 = Engine.IsNetworkConnected()
		if f103_local0 then
			f103_local0 = Engine.IsUserSignedInToLive()
		end
		f103_arg1.signed_in = f103_local0
	end
	if f103_arg1.signed_in == false then
		LUI.FlowManager.RequestLeaveMenu( f103_arg0 )
	end
end

LUI.FriendsMenu.AddRefreshTimer = function ( f104_arg0 )
	local self = LUI.UITimer.new( 1000, "TickRefresh", nil, false )
	self.id = "RefreshTimer"
	local f104_local1 = f104_arg0
	f104_arg0:addEventHandler( "TickRefresh", function ( f105_arg0, f105_arg1 )
		f104_local1:TickRefresh()
	end )
	f104_arg0:addElement( self )
end

LUI.FriendsMenu.OnClose = function ()
	Friends.SetExclusiveController( -1 )
end

LUI.FriendsMenu.new = function ( f107_arg0, f107_arg1 )
	local f107_local0 = "@LUA_MENU_SOCIAL_TITLE"
	local f107_local1 = CoD.DesignGridHelper( 6 )
	local f107_local2 = LUI.MenuTemplate.new( f107_arg0, {
		menu_title = f107_local0,
		menu_title_width = f107_local1,
		menu_width = f107_local1,
		menu_top_indent = LUI.FriendsMenu.TopOffset,
		menu_height = LUI.FriendsMenu.NumButtons * LUI.FriendsListItem.Height,
		do_not_add_friends_helper = true,
		uppercase_title = true,
		disableDeco = true,
		spacing = 8
	} )
	f107_local2:setClass( LUI.FriendsMenu )
	local f107_local3 = f107_arg1.exclusiveController
	if not f107_local3 then
		f107_local3 = Engine.GetFirstActiveController()
	end
	f107_local2.controller = f107_local3
	f107_local2.list.noWrap = true
	LUI.FriendsMenu.Menu = f107_local2
	Friends.SetExclusiveController( f107_local2.controller )
	f107_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f107_local3.alpha = 1
	
	local subContainer = LUI.UIElement.new( f107_local3 )
	subContainer:registerAnimationState( "default", f107_local3 )
	subContainer:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f107_local2:addElement( subContainer )
	f107_local2.subContainer = subContainer
	
	f107_local2:registerEventHandler( "live_connection", OnLiveConnectionUpdate )
	f107_local2:registerEventHandler( "unhandled_leftmouseup", function ( element, event )
		removeOptionsSubList()
	end )
	f107_local2:registerEventHandler( "unhandled_rightmouseup", function ( element, event )
		removeOptionsSubList()
	end )
	f107_local2:AddScrollText()
	f107_local2:AddPlayerDetails()
	f107_local2:AddPlayerCard()
	for f107_local5 = 1, LUI.FriendsMenu.NumButtons, 1 do
		local f107_local8 = LUI.FriendsListItem.new( f107_local2.controller )
		f107_local8.id = "FriendsListItem" .. f107_local5
		f107_local8:registerEventHandler( "button_over", OnFocusFriend )
		f107_local8:registerEventHandler( "button_action", OnSelectFriend )
		f107_local8:registerEventHandler( "gamepad_button", OnFriendGamepadButton )
		f107_local8.menu = f107_local2
		f107_local8.index = f107_local5
		f107_local2.list:addElement( f107_local8 )
	end
	f107_local2:AddTabs( f107_arg1.defaultToRecent )
	f107_local2:AddRefreshTimer()
	return f107_local2
end

function popup_friend_invite_sent( f110_arg0, f110_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_confirmation_popup", {
		popup_title = Engine.Localize( "@MENU_POPUP_INVITE_SENT" ),
		message_text = Engine.Localize( "@MENU_POPUP_INVITE_SENT" ),
		dialog_top = -100,
		dialog_bottom = 100
	} )
end

LUI.MenuBuilder.registerType( "FriendsMenu", LUI.FriendsMenu.new )
LUI.MenuBuilder.registerPopupType( "popup_friend_invite_sent", popup_friend_invite_sent )
LUI.FlowManager.RegisterStackPopBehaviour( "FriendsMenu", LUI.FriendsMenu.OnClose )
LUI.FlowManager.RegisterStackPushBehaviour( "FriendsMenu", function ()
	if Engine.IsPS4() then
		Engine.HidePsStoreIcon()
	end
end )
LockTable( _M )
