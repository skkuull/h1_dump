local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyBase = InheritFrom( LUI.MenuTemplate )
LUI.MPLobbyBase.AddReadyUpButton = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = Engine.GetDvarInt( f1_arg1 )
	if f1_local0 ~= nil and f1_local0 ~= 0 then
		local f1_local1 = f1_arg0:AddButton( "", f1_arg2, f1_arg3 )
		f1_local1:registerEventHandler( "ready_up_button_refresh", f1_arg4 )
		local self = LUI.UITimer.new( 100, "ready_up_button_refresh" )
		self.id = "MPLobbyBase_ready_timer"
		f1_arg0.readyTimer = self
		f1_arg0:addElement( self )
		return f1_local1
	else
		return nil
	end
end

LUI.MPLobbyBase.IsCacLocked = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetMaxControllerCount()
	local f2_local1, f2_local2, f2_local3 = nil
	for f2_local4 = 0, f2_local0 - 1, 1 do
		if Engine.HasActiveLocalClient( f2_local4 ) then
			local f2_local7, f2_local8, f2_local9 = Cac.GetItemLockState( f2_local4, nil, "feature_cac" )
			f2_local3 = f2_local9
			f2_local2 = f2_local8
			if f2_local7 == "Unlocked" then
				return false, false
			end
		end
	end
	return true, f2_local3
end

LUI.MPLobbyBase.OnCAC = function ( f3_arg0, f3_arg1 )
	if Cac.IsItemUnlocked( f3_arg1.controller, "feature_cac" ) then
		Cac.SetSelectedControllerIndex( f3_arg1.controller )
		LUI.FlowManager.RequestAddMenu( f3_arg0, "CacMenu", true, f3_arg1.controller )
	end
end

LUI.MPLobbyBase.AddCACButton = function ( f4_arg0, f4_arg1 )
	local f4_local0 = {
		showLockOnDisable = true
	}
	if f4_arg1 then
		f4_local0.canShowRestricted = true
	end
	if IsPublicMatch() and LUI.InventoryUtils.GetAnyCACItemNewStickerState() then
		f4_local0.showNewSticker = true
	end
	local f4_local1, f4_local2 = LUI.MPLobbyBase.IsCacLocked()
	if f4_local1 then
		f4_local0.desc_text = f4_local2
	end
	local f4_local3 = f4_arg0:AddButton( "@LUA_MENU_CREATE_A_CLASS", f4_arg0.OnCAC, LUI.MPLobbyBase.IsCacLocked, nil, nil, f4_local0 )
	f4_local3:rename( f4_arg0.type .. "_cac" )
	if f4_arg1 then
		local self = LUI.UITimer.new( 16, "check_restricted", nil, false )
		self.id = "check_restricted_timer"
		f4_arg0:addElement( self )
		f4_arg0:registerEventHandler( "check_restricted", function ( element, event )
			local f5_local0 = Cac.IsAnyCustomClassRestricted( true )
			if f4_local3.restricted ~= f5_local0 then
				f4_local3.restricted = f5_local0
				f4_local3:processEvent( {
					name = "update_restricted",
					isRestricted = f5_local0
				} )
			end
		end )
		f4_arg0:processEvent( {
			name = "check_restricted"
		} )
	end
end

LUI.MPLobbyBase.OnPersonalization = function ( f6_arg0, f6_arg1 )
	local f6_local0 = {}
	if IsPublicMatch() and LUI.InventoryUtils.GetAnyPersonalizationNewStickerState() then
		f6_local0.showNewSticker = true
	end
	Cac.SetSelectedControllerIndex( f6_arg1.controller )
	LUI.FlowManager.RequestAddMenu( f6_arg0, "PlayercardMenu", true, f6_arg1.controller, false, f6_local0 )
end

LUI.MPLobbyBase.AddPersonalizationButton = function ( f7_arg0 )
	f7_arg0:AddButton( "@LUA_MENU_PERSONALIZATION", f7_arg0.OnPersonalization )
end

LUI.MPLobbyBase.OnBarracks = function ( f8_arg0, f8_arg1 )
	Cac.SetSelectedControllerIndex( f8_arg1.controller )
	LUI.FlowManager.RequestAddMenu( f8_arg0, "OperatorMenu", true, f8_arg1.controller )
end

LUI.MPLobbyBase.OnDepot = function ( f9_arg0, f9_arg1 )
	Cac.SetSelectedControllerIndex( f9_arg1.controller )
	LUI.FlowManager.RequestAddMenu( f9_arg0, "MPDepotMenu", true, f9_arg1.controller )
end

f0_local0 = LUI.MPLobbyBase
f0_local0.AddBarracksButton = function ( f10_arg0 )
	local f10_local0 = f10_arg0:AddButton( "@LUA_MENU_BARRACKS_CAPS", f10_arg0.OnBarracks )
	f10_local0:rename( f10_arg0.type .. "_barracks" )
end

f0_local0 = function ( f11_arg0, f11_arg1 )
	if not Engine.GetDvarBool( "virtualLobbyPresentable" ) then
		f11_arg0:registerDvarHandler( "virtualLobbyPresentable", f0_local0 )
	else
		LUI.MPLobbyBase.RemoveLoadingWidgetFromButton( f11_arg0 )
	end
end

LUI.MPLobbyBase.AddLoadingWidgetToButton = function ( f12_arg0 )
	local f12_local0 = CoD.CreateState( -10, -(LoadingAnimationDims.Height / 2) - 4, nil, nil, CoD.AnchorTypes.Right )
	f12_local0.height = LoadingAnimationDims.Height
	f12_local0.width = LoadingAnimationDims.Width + 5
	f12_local0.scale = -0.4
	f12_local0.horizontalAlignment = LUI.HorizontalAlignment.Center
	f12_arg0.loadingAnimationContainer = LUI.UIElement.new( f12_local0 )
	f12_arg0.loadingAnimationContainer.id = "animation_container"
	f12_arg0:addElement( f12_arg0.loadingAnimationContainer )
	f12_arg0.loadingAnimationContainer:addElement( LUI.MenuBuilder.BuildRegisteredType( "loading_animation_widget" ) )
end

LUI.MPLobbyBase.RemoveLoadingWidgetFromButton = function ( f13_arg0 )
	local f13_local0 = f13_arg0.loadingAnimationContainer
	if f13_local0 ~= nil then
		f13_arg0.loadingAnimationContainer = nil
		f13_local0:closeChildren()
		f13_local0:close()
	end
end

LUI.MPLobbyBase.AddDepotButton = function ( f14_arg0 )
	if Engine.IsDepotEnabled() then
		local f14_local0 = f14_arg0:AddButton( "@DEPOT_DEPOT", f14_arg0.OnDepot, function ()
			return not Engine.GetDvarBool( "virtualLobbyPresentable" )
		end )
		f14_local0:rename( f14_arg0.type .. "_depot" )
		f14_local0:setDisabledRefreshRate( 500 )
		LUI.MPLobbyBase.AddLoadingWidgetToButton( f14_local0 )
		f0_local0( f14_local0 )
	end
end

LUI.MPLobbyBase.AddCODAnywhereButton = function ( f16_arg0 )
	f16_arg0:AddButton( "@LUA_MENU_COD_ANYWHERE", OpenCoDAnywhere )
end

LUI.MPLobbyBase.OnBack = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0, f17_local1, f17_local2, f17_local3 = f17_arg2.subContainer:getLocalRect()
	if f17_local0 ~= 0 then
		local f17_local4 = f17_arg2:getFirstInFocus()
		if f17_local4 ~= nil then
			f17_local4:processEvent( {
				name = "lose_focus"
			} )
		end
		f17_arg2.list:processEvent( {
			name = "gain_focus"
		} )
	else
		f17_arg2:HandleBack( f17_arg0, f17_arg1 )
	end
end

LUI.MPLobbyBase.HandleBack = function ( f18_arg0, f18_arg1 )
	PromptToLeaveLobby( f18_arg0, f18_arg1 )
end

LUI.MPLobbyBase.SetBackButtonVisibility = function ( f19_arg0, f19_arg1 )
	f19_arg0:dispatchEventToRoot( {
		name = "show_back_button",
		immediate = false,
		dispatchChildren = true,
		hide = not f19_arg1
	} )
end

LUI.MPLobbyBase.AddLobbyBackButton = function ( f20_arg0, f20_arg1 )
	LUI.MenuTemplate.AddBackButton( f20_arg0, function ( f21_arg0, f21_arg1 )
		f20_arg1( f21_arg0, f21_arg1 )
	end, "show_back_button" )
	if not Engine.GetDvarBool( "virtualLobbyEnabled" ) then
		LUI.MPLobbyBase.SetBackButtonVisibility( f20_arg0, true )
	elseif not Engine.GetDvarBool( "virtualLobbyReady" ) then
		LUI.MPLobbyBase.SetBackButtonVisibility( f20_arg0, false )
		f20_arg0:registerDvarHandler( "virtualLobbyReady", function ( f22_arg0, f22_arg1 )
			LUI.MPLobbyBase.SetBackButtonVisibility( f22_arg0, true )
		end )
	end
end

function UpdateTitleMatchInfo( f23_arg0 )
	if MLG.AreMLGRulesEnabled() then
		f23_arg0:setText( "/ " .. Engine.Localize( "LUA_MENU_MLG_RULES_VERSION", MLG.GetRulesVersionNumber() ) )
		f23_arg0:animateToState( "visible" )
	else
		f23_arg0:animateToState( "default" )
	end
end

LUI.MPLobbyBase.CheckForAddESportsInfo = function ( f24_arg0, f24_arg1, f24_arg2 )
	if not f24_arg2.disableMLGRulesVersionNumber and Engine.InFrontend() and MLG ~= nil and MLG.IsFeatureAvailable and MLG.IsFeatureAvailable() then
		local f24_local0 = GenericMenuDims.MenuStartX
		local f24_local1 = GenericMenuDims.TitleTop
		if f24_arg2.headerStartX ~= nil then
			f24_local0 = f24_arg2.headerStartX
		end
		if f24_arg2.headerStartY ~= nil then
			f24_local1 = f24_arg2.headerStartY
		end
		local f24_local2 = CoD.TextSettings.TitleFontTiny
		local f24_local3 = LUI.MenuTemplate.GetDefaultBreadCrumpText()
		local f24_local4 = f24_arg1.menu_breadcrumb
		if not f24_local4 then
			f24_local4 = f24_local3
		end
		local f24_local5, f24_local6, f24_local7, f24_local8 = GetTextDimensions( f24_local4, f24_local2.Font, f24_local2.Height )
		local self = LUI.UIText.new()
		self.id = "codEsportText"
		self:registerAnimationState( "default", CoD.ColorizeState( Colors.primary_text_color, {
			font = f24_local2.Font,
			alignment = LUI.Alignment.Left,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = f24_local7 - 9,
			top = 7.5,
			right = 0,
			bottom = f24_local2.Height * 0.82 + 8.5,
			alpha = 0
		} ) )
		self:registerAnimationState( "visible", {
			alpha = 0.4
		} )
		self:animateToState( "default" )
		f24_arg0:addElement( self )
		local self = LUI.UITimer.new( 500, "refresh" )
		self:registerEventHandler( "refresh", UpdateTitleMatchInfo )
		self:addElement( self )
		UpdateTitleMatchInfo( self )
	end
end

LUI.MPLobbyBase.CollectGarbage = function ()
	collectgarbage( "collect" )
end

LUI.MPLobbyBase.OnClose = function ( f26_arg0, f26_arg1 )
	LUI.MPLobbyBase.CollectGarbage()
	local f26_local0, f26_local1, f26_local2, f26_local3 = f26_arg0.subContainer:getLocalRect()
	if f26_local0 ~= 0 then
		f26_arg0:clearSavedState()
	end
end

LUI.MPLobbyBase.new = function ( f27_arg0, f27_arg1 )
	LUI.MPLobbyBase.CollectGarbage()
	local f27_local0 = f27_arg1 or {}
	f27_local0.subContainer = true
	f27_local0.persistentBackground = PersistentBackground.Variants.VirtualLobby
	local f27_local1 = LUI.MenuTemplate.new( f27_arg0, f27_local0 )
	f27_local1:setClass( LUI.MPLobbyBase )
	LUI.CacStaticLayout.ClassLoc = Cac.GetCustomClassLoc()
	f27_local1:registerEventHandler( "menu_close", LUI.MPLobbyBase.OnClose )
	f27_local1.list:makeFocusable()
	local f27_local2 = f27_local0.memberListState
	if not f27_local2 then
		f27_local2 = Lobby.MemberListStates.Lobby
	end
	local f27_local3 = LUI.MemberScreen.new
	local f27_local4 = {
		parentMenu = f27_local1,
		memberListState = f27_local2,
		isPublicLobby = IsPublicMatch()
	}
	local f27_local5 = IsPrivateMatch()
	if not f27_local5 then
		f27_local5 = Engine.GetSystemLink()
	end
	f27_local4.isPrivateLobby = f27_local5
	f27_local3 = f27_local3( f27_local4 )
	f27_local1.subContainer:addElement( f27_local3 )
	f27_local3.parentMenu = f27_local1
	f27_local1.memberList = f27_local3
	f27_local3:initNavTables()
	f27_local1.memberList:makeFocusable()
	f27_local1.list.navigation.right = f27_local3
	f27_local3.navigation.left = f27_local1.list
	f27_local1:AddLobbyBackButton( function ( f28_arg0, f28_arg1 )
		if Engine.IsCoreMode() and Engine.GetDvarBool( "virtualLobbyEnabled" ) and not Engine.GetDvarBool( "virtualLobbyReady" ) then
			return 
		else
			LUI.MPLobbyBase.OnBack( f28_arg0, f28_arg1, f27_local1 )
		end
	end )
	if Engine.IsCoreMode() then
		LUI.InventoryUtils.ValidateEquippedLootItemsForAll()
	end
	Cac.IsAnyCustomClassRestrictedCache = false
	Cac.CustomClassIndexForRestrictCheck = 0
	SetupTheLobby( f27_local1 )
	if f27_local0.has_match_summary then
		LobbyInitAAR( f27_local1, Lobby.AARTypes.Normal )
	end
	f27_local4 = LUI.CacFactionWidget.new( f27_local1, f27_local1.exclusiveController, false )
	f27_local1.factionWidget = f27_local4
	f27_local1:addElement( f27_local4 )
	LUI.MPLobbyBase.CheckForAddESportsInfo( f27_local1, f27_arg0, f27_local0 )
	f27_local1:setBlur( false )
	return f27_local1
end

LockTable( _M )
