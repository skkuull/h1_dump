local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AAR = InheritFrom( LUI.MenuTemplate )
function AddFooterButtons( f1_arg0 )
	if f1_arg0.footerButtonsAdded then
		return 
	end
	f1_arg0:AddBackButton( function ( f2_arg0, f2_arg1 )
		StopSounds( f1_arg0 )
		LUI.FlowManager.RequestLeaveMenu( f2_arg0 )
	end )
	f1_arg0.help:processEvent( LUI.ButtonHelperText.CommonEvents.addContinueButton )
	if Engine.IsPC() then
		local self = f1_arg0.help:getFirstDescendentById( "button_action_id" )
		self:registerEventHandler( "leftmouseup", function ( element, event )
			LUI.FlowManager.RequestLeaveMenu( element )
		end )
	end
	local self = LUI.UIBindButton.new()
	self.handlePrimary = true
	self.id = "AAR_BindButton"
	self:registerEventHandler( "button_action", function ( element, event )
		StopSounds( f1_arg0 )
		LUI.FlowManager.RequestLeaveMenu( element )
	end )
	f1_arg0:addElement( self )
	f1_arg0.footerButtonsAdded = true
end

function OnDisplayContent( f5_arg0, f5_arg1 )
	if f5_arg0.loadingWidget then
		f5_arg0.loadingWidget:animateToState( "disabled" )
	end
	f5_arg0:AddTabs()
	if not f5_arg0.footerButtonsAdded then
		AddFooterButtons( f5_arg0 )
	end
	Engine.SetUiHasNoVisibleChatUserInfo( false )
end

function StopSounds( f6_arg0 )
	if f6_arg0.progressTab then
		local f6_local0 = f6_arg0.progressTab.xpBreakdownContainer
		StopAllAarSounds( {
			rankUpSound = f6_local0.rankUpSoundIdx,
			experienceSound = f6_local0.experienceSoundIdx,
			unlockSound = f6_local0.rankUpContainer.unlockSoundIdx
		} )
	end
end

function StopAllAarSounds( f7_arg0 )
	for f7_local3, f7_local4 in pairs( f7_arg0 ) do
		if f7_local4 then
			Engine.StopSound( f7_local4 )
		end
	end
end

LUI.AAR.ChangeTab = function ( f8_arg0, f8_arg1 )
	if f8_arg0.currTab then
		f8_arg0.currTab:animateToState( "disabled" )
		f8_arg1:animateToState( "enabled" )
		f8_arg0.currTab:processEvent( {
			name = "lostFocus"
		} )
		f8_arg1:processEvent( {
			name = "gainedFocus"
		} )
	end
	if f8_arg1 ~= f8_arg0.progressTab then
		LUI.AARProgress.SetSoundsDisabled( true )
		StopSounds( f8_arg0 )
	else
		LUI.AARProgress.SetSoundsDisabled( false )
	end
	f8_arg0.currTab = f8_arg1
end

LUI.AAR.AddTabs = function ( f9_arg0 )
	local f9_local0 = GameX.IsRankedMatch()
	local f9_local1 = {
		defState = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeftRight ),
		numOfTabs = 2
	}
	local f9_local2 = AAR.GetItemsUnlockedLastGame( f9_arg0.controller )
	if #f9_local2 > 0 then
		f9_local1.numOfTabs = f9_local1.numOfTabs + 1
	end
	local f9_local3 = AAR.GetMedalsData( f9_arg0.controller )
	if #f9_local3 > 0 then
		f9_local1.numOfTabs = f9_local1.numOfTabs + 1
	end
	local f9_local4 = AAR.GetChallengesData( f9_arg0.controller )
	if #f9_local4 > 0 then
		f9_local1.numOfTabs = f9_local1.numOfTabs + 1
	end
	if not f9_local0 then
		f9_local1.numOfTabs = 1
	end
	local f9_local5 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", f9_local1 )
	f9_local5:keepRightBumperAlignedToHeader( true )
	f9_local5.tabSelected = 1
	local f9_local6 = {}
	if f9_local0 then
		local f9_local7 = LUI.MenuBuilder.BuildRegisteredType( "aarProgress", {
			controller = f9_arg0.controller
		} )
		f9_local6[#f9_local6 + 1] = f9_local7
		f9_arg0.progressTab = f9_local7
		f9_arg0:addElement( f9_local7 )
		if #f9_local2 > 0 then
			local f9_local8 = LUI.MenuBuilder.BuildRegisteredType( "aar_new_unlocks_main", {
				controller = f9_arg0.controller
			} )
			f9_local6[#f9_local6 + 1] = f9_local8
			f9_arg0:addElement( f9_local8 )
		end
		if #f9_local3 > 0 then
			local f9_local8 = LUI.MenuBuilder.BuildRegisteredType( "aar_medals_main", {
				controller = f9_arg0.controller
			} )
			f9_local6[#f9_local6 + 1] = f9_local8
			f9_arg0:addElement( f9_local8 )
		end
		if #f9_local4 > 0 then
			local f9_local8 = LUI.MenuBuilder.BuildRegisteredType( "aar_challenges_main", {
				controller = f9_arg0.controller
			} )
			f9_local6[#f9_local6 + 1] = f9_local8
			f9_arg0:addElement( f9_local8 )
		end
	end
	local f9_local7 = LUI.MenuBuilder.BuildRegisteredType( "aarScoreboard", {
		controller = f9_arg0.controller
	} )
	f9_local6[#f9_local6 + 1] = f9_local7
	f9_arg0:addElement( f9_local7 )
	for f9_local8 = 1, #f9_local6, 1 do
		local f9_local11 = f9_local8
		f9_local5:addTab( f9_arg0.controller, f9_local6[f9_local11]:GetTabLabel(), function ()
			f9_arg0:ChangeTab( f9_local6[f9_local11] )
		end )
	end
	f9_local5:refreshTab( f9_arg0.controller )
	f9_arg0:addElement( f9_local5 )
end

function SetupPrivatePartyBindText( f11_arg0 )
	if not IsPublicMatch() and Lobby.IsUsingIntermissionTimer() then
		LUI.MenuTemplate.AddPartyStatus( f11_arg0, true )
	end
end

LUI.AAR.new = function ( f12_arg0, f12_arg1 )
	local f12_local0 = LUI.MenuTemplate.new( f12_arg0, {
		menu_title = "@LUA_MENU_AAR_CAPS",
		uppercase_title = true,
		disableDeco = true,
		do_not_add_friends_helper = true,
		showSelectButton = false,
		persistentBackground = PersistentBackground.Variants.AAR
	} )
	f12_local0:setClass( LUI.AAR )
	local f12_local1 = f12_arg1.controller
	if not f12_local1 then
		f12_local1 = f12_arg1.exclusiveController
		if not f12_local1 then
			f12_local1 = Engine.GetFirstActiveController()
		end
	end
	f12_local0.controller = f12_local1
	f12_local0.isPostMatch = f12_arg1.postMatch
	if Engine.GetDvarBool( "virtualLobbyReady" ) and Engine.GetDvarBool( "virtualLobbyActive" ) and Engine.GetDvarBool( "virtualLobbyPresentable" ) and Engine.GetDvarBool( "virtualLobbyEnabled" ) and Engine.GetDvarBool( "virtualLobbyAllocated" ) then
		OnDisplayContent( f12_local0 )
	else
		Engine.SetUiHasNoVisibleChatUserInfo( true )
		local f12_local2 = LUI.MenuBuilder.BuildRegisteredType( "waiting_popup", {
			message_text = Engine.Localize( "@MENU_LOADING_DOTS" )
		} )
		local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ) )
		self:setupFullWindowElement()
		f12_local2:registerAnimationState( "disabled", {
			alpha = 0
		} )
		f12_local0.loadingWidget = f12_local2
		f12_local0:addElement( self )
		self:addElement( f12_local2 )
		f12_local0:registerDvarHandler( "virtualLobbyReady", OnDisplayContent )
	end
	if not f12_arg1.postMatch then
		AddFooterButtons( f12_local0 )
	end
	SetupPrivatePartyBindText( f12_local0 )
	return f12_local0
end

LUI.MenuBuilder.registerType( "aar_summary_main", LUI.AAR.new )
VLobby.InitMenuMode( "aar_summary_main", VirtualLobbyModes.LUI_MODE_OBSCURED )
LockTable( _M )
