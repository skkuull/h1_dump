local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyPublic = InheritFrom( LUI.MPLobbyBase )
LUI.MPLobbyPublic.bonusIconSize = 45
f0_local0 = function ()
	local f1_local0 = Lobby.IsInPrivateParty()
	if f1_local0 then
		f1_local0 = not Lobby.IsAloneInPrivateParty()
	end
	return f1_local0
end

f0_local1 = function ( f2_arg0 )
	local f2_local0 = Engine.GetDvarInt( "scr_xpscale" )
	local f2_local1 = Engine.GetDvarInt( "scr_xpscalewithparty" )
	local f2_local2 = Engine.GetDvarInt( "scr_depotcreditscale" )
	local f2_local3 = f0_local0()
	local f2_local4 = f2_arg0.bonusIconList
	if f2_arg0.bonusScales.xpScale ~= f2_local0 or f2_arg0.bonusScales.xpPartyScale ~= f2_local1 or f2_arg0.bonusScales.depotCreditScale ~= f2_local2 then
		f2_arg0.bonusScales.xpScale = f2_local0
		f2_arg0.bonusScales.xpPartyScale = f2_local1
		f2_arg0.bonusScales.depotCreditScale = f2_local2
		f2_local4.inParty = not f2_local3
	end
	if f2_local4.inParty ~= f2_local3 then
		f2_local4.inParty = f2_local3
		f2_local4:closeChildren()
		local f2_local5 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
		f2_local5.height = LUI.MPLobbyPublic.bonusIconSize
		f2_local5.width = LUI.MPLobbyPublic.bonusIconSize
		if f2_local0 == 4 and GameX.IsRankedMatch() == true then
			f2_local5.material = RegisterMaterial( "ui_reward_small_quad_xp" )
			f2_local4:addElement( LUI.UIImage.new( f2_local5 ) )
		elseif f2_local0 == 2 then
			f2_local5.material = RegisterMaterial( "ui_reward_small_double_xp" )
			f2_local4:addElement( LUI.UIImage.new( f2_local5 ) )
		elseif f2_local3 and f2_local1 == 2 then
			f2_local5.material = RegisterMaterial( "ui_reward_small_double_party_xp" )
			f2_local4:addElement( LUI.UIImage.new( f2_local5 ) )
		end
		if f2_local2 == 2 then
			f2_local5.material = RegisterMaterial( "depot_currency_credit_2x" )
			f2_local4:addElement( LUI.UIImage.new( f2_local5 ) )
		end
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f0_local0()
	local f3_local1 = CoD.CreateState( f3_arg1 + 25, 17, nil, nil, CoD.AnchorTypes.TopLeft )
	f3_local1.width = 120
	f3_local1.height = LUI.MPLobbyPublic.bonusIconSize
	
	local bonusIconList = LUI.UIHorizontalList.new( f3_local1 )
	f3_arg0:addElement( bonusIconList )
	f3_arg0.bonusIconList = bonusIconList
	
	bonusIconList.inParty = f3_local0
	local f3_local3 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f3_local3.height = LUI.MPLobbyPublic.bonusIconSize
	f3_local3.width = LUI.MPLobbyPublic.bonusIconSize
	if f3_arg0.bonusScales.xpScale == 4 and GameX.IsRankedMatch() == true then
		f3_local3.material = RegisterMaterial( "ui_reward_small_quad_xp" )
		bonusIconList:addElement( LUI.UIImage.new( f3_local3 ) )
	elseif f3_arg0.bonusScales.xpScale == 2 then
		f3_local3.material = RegisterMaterial( "ui_reward_small_double_xp" )
		bonusIconList:addElement( LUI.UIImage.new( f3_local3 ) )
	elseif f3_local0 and f3_arg0.bonusScales.xpPartyScale == 2 then
		f3_local3.material = RegisterMaterial( "ui_reward_small_double_party_xp" )
		bonusIconList:addElement( LUI.UIImage.new( f3_local3 ) )
	end
	if f3_arg0.bonusScales.depotCreditScale == 2 then
		f3_local3.material = RegisterMaterial( "depot_currency_credit_2x" )
		bonusIconList:addElement( LUI.UIImage.new( f3_local3 ) )
	end
	f3_arg0:registerEventHandler( "updatePartyBonusIcons", function ( element, event )
		f0_local1( f3_arg0 )
	end )
	local self = LUI.UITimer.new( 1000, "updatePartyBonusIcons" )
	self.id = "MPLobbyPublic_party_bonus_icon_update_timer"
	f3_arg0.bonusIconUpdateTimer = self
	f3_arg0:addElement( self )
end

LUI.MPLobbyPublic.CheckAddMapAndMarketingPanels = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg0.addedDeferredContent then
		return true
	elseif Lobby.GetPartyStatus() ~= "" then
		f5_arg0:AddMapDisplay( LUI.MPLobbyMapVote.new, true )
		local f5_local0 = Engine.GetDvarString( "playlist_name" )
		if f5_local0 then
			f5_local0 = Engine.ToUpperCase( f5_local0 )
			f5_arg0:dispatchEventToChildren( {
				name = "update_header_text",
				string = f5_local0,
				dispatchChildren = true
			} )
			if f5_arg0.wholeTitle ~= nil and f5_arg0.wholeTitle.dotElement ~= nil then
				f5_arg0.wholeTitle.dotElement:close()
				LUI.MenuTemplate.AddDotElement( f5_arg0.wholeTitle, f5_local0, 0, 0 )
			end
		else
			f5_local0 = ""
		end
		local f5_local1, f5_local2, f5_local3, f5_local4 = LUI.MenuTemplate.GetTitleDimensions( f5_local0 )
		f0_local2( f5_arg0, f5_local3 )
		if f5_arg0.mapTimer ~= nil then
			LUI.UITimer.Stop( f5_arg0.mapTimer )
			f5_arg0:removeElement( f5_arg0.mapTimer )
			f5_arg0.mapTimer = nil
		end
		f5_arg0.addedDeferredContent = true
		return true
	else
		return false
	end
end

function ReadyUpAction( f6_arg0, f6_arg1 )
	if Lobby.UsingReadyUpFeature() and not Lobby.GetLocalReadyUpFlag() then
		Lobby.SetLocalReadyUpFlag()
		UpdateReadyUpText( f6_arg0, f6_arg1 )
	end
end

function GetReadyUpDisableValue()
	if not Lobby.UsingReadyUpFeature() then
		return true
	elseif not Lobby.GetLocalReadyUpFlag() then
		return false
	else
		return true
	end
end

function GetReadyUpDisplayString( f8_arg0, f8_arg1 )
	if Lobby.UsingReadyUpFeature() then
		if not Lobby.GetLocalReadyUpFlag() then
			return Engine.Localize( "@LUA_MENU_READY_UP_CAPS" )
		end
		local f8_local0 = Engine.GetDvarInt( "party_minplayers" )
		local f8_local1 = Lobby.GetCurrentMemberCount( Lobby.MemberListStates.Lobby )
		local f8_local2 = 0
		for f8_local3 = 1, f8_local1, 1 do
			if Lobby.IsActiveMemberSlot( f8_local3 - 1 ) then
				f8_local2 = f8_local2 + 1
			end
		end
		if f8_local2 < 1 then
			return Engine.Localize( "@MENU_WAITING" )
		end
		local f8_local3 = f8_local0 - f8_local2
		if f8_local3 == 1 then
			return Engine.Localize( "@LUA_MENU_WAITING_FOR_1_MORE_PLAYER_CAPS" )
		elseif f8_local3 > 1 then
			return Engine.Localize( "@LUA_MENU_WAITING_FOR_MORE_PLAYERS_CAPS" )
		elseif not Lobby.GetPartyReadyUpStatus() then
			return Engine.Localize( "@LUA_MENU_WAITING_FOR_OTHER_PLAYERS_CAPS" )
		end
		return Engine.Localize( "@LUA_MENU_WAITING_FOR_GAME_TO_START_CAPS" )
	else
		return Engine.Localize( "@MENU_WAITING" )
	end
end

function UpdateReadyUpText( f9_arg0, f9_arg1 )
	f9_arg0:processEvent( {
		name = "refresh_disabled"
	} )
	f9_arg0:setText( GetReadyUpDisplayString( f9_arg0, f9_arg1 ) )
end

function OnLeaveLobby( f10_arg0 )
	LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
end

function menu_xboxlive_lobby( f11_arg0, f11_arg1 )
	local f11_local0 = false
	if Engine.GetDvarBool( "ui_opensummary" ) then
		f11_local0 = true
	end
	local f11_local1 = LUI.MPLobbyBase.new( f11_arg0, {
		menu_title = " ",
		has_match_summary = true
	}, true )
	f11_local1:setClass( LUI.MPLobbyPublic )
	f11_local1:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@PLATFORM_PLAY_ONLINE" ) ) )
	f11_local1.bonusScales = {}
	if f11_arg1.category and f11_arg1.index then
		f11_local1.bonusScales.xpScale = Playlist.GetPlaylistXpScale( f11_arg1.category, f11_arg1.index )
		f11_local1.bonusScales.xpPartyScale = Playlist.GetPlaylistXpScaleWithParty( f11_arg1.category, f11_arg1.index )
		f11_local1.bonusScales.depotCreditScale = Playlist.GetPlaylistDepotCreditScale( f11_arg1.category, f11_arg1.index )
	else
		f11_local1.bonusScales.xpScale = Engine.GetDvarInt( "scr_xpscale" )
		f11_local1.bonusScales.xpPartyScale = Engine.GetDvarInt( "scr_xpscalewithparty" )
		f11_local1.bonusScales.depotCreditScale = Engine.GetDvarInt( "scr_depotcreditscale" )
	end
	if Engine.IsCoreMode() then
		f11_local1:AddCACButton()
		f11_local1:AddBarracksButton()
		f11_local1:AddPersonalizationButton()
		f11_local1:AddDepotButton()
	end
	f11_local1:AddOptionsButton()
	f11_local1:AddMenuDescription( 3 )
	if not f11_local1:CheckAddMapAndMarketingPanels( f11_local0 ) then
		f11_local1:registerEventHandler( "CheckAddMapAndMarketingPanels", function ( element, event )
			LUI.MPLobbyPublic.CheckAddMapAndMarketingPanels( element, f11_local0 )
		end )
		local self = LUI.UITimer.new( 100, "CheckAddMapAndMarketingPanels" )
		self.id = "MPLobbyPublic_add_map_timer"
		f11_local1.mapTimer = self
		f11_local1:addElement( self )
	end
	f11_local1:registerEventHandler( "exit_public_lobby", OnLeaveLobby )
	f11_local1:registerEventHandler( "player_joined", Cac.PlayerJoinedEvent )
	f11_local1:registerEventHandler( "loadout_request", Cac.PlayerJoinedEvent )
	Lobby.EnteredLobby()
	f11_local1:AddCurrencyInfoPanel()
	return f11_local1
end

LUI.MenuBuilder.registerType( "menu_xboxlive_lobby", menu_xboxlive_lobby )
LUI.FlowManager.RegisterMenuStack( "menu_xboxlive_lobby", function ()
	if Engine.IsCoreMode() and Playlist.GetPreselectedCategoryClass() ~= 8 then
		return {
			"mp_main_menu",
			"menu_xboxlive",
			"FindGameMenu",
			"FindGameSubMenu"
		}
	else
		return {
			"mp_main_menu",
			"menu_xboxlive",
			"FindGameMenu"
		}
	end
end )
VLobby.InitMenuMode( "menu_xboxlive_lobby", VirtualLobbyModes.LUI_MODE_LOBBY, nil, LUI.MPLobbyBase.CollectGarbage )
LockTable( _M )
