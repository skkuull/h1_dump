local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = nil
function new()
	local f1_local0 = {}
	setmetatable( f1_local0, {
		__index = _M
	} )
	return f1_local0
end

function setupRoot( f2_arg0, f2_arg1 )
	f2_arg1:registerEventHandler( "init_hud", hudRootEventHandler( initHud ) )
	f2_arg1:registerEventHandler( "close_hud", closeHudHandler )
	f2_arg1:registerOmnvarHandler( "ui_use_mlg_hud", resetHud )
	f2_arg1:registerOmnvarHandler( "ui_round_end", hudRootEventHandler( updateRoundEnd ) )
	f2_arg1:registerEventHandler( "intermission_began", hudRootEventHandler( beginIntermission ) )
	f2_arg1:registerEventHandler( "show_host_migration", showHostMigrationHandler )
	f2_arg1:registerEventHandler( "add_hudelement_gsc", addHudElementHandlerGsc )
	f2_arg1:registerEventHandler( "remove_hudelement_gsc", removeHudElementHandlerGsc )
end

function hudRootEventHandler( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		f3_arg0( f4_arg0.hudManager, f4_arg1, f4_arg0 )
	end
	
end

function registerHud( f5_arg0 )
	f0_local0 = f5_arg0
end

function openRegisteredHud( f6_arg0 )
	profile.beginuserevent( "hud_create" )
	local f6_local0 = LUI.MenuBuilder.buildMenu( f0_local0 )
	profile.enduserevent( "hud_create" )
	run_gc()
	f6_arg0.hud = f6_local0
	f6_arg0.hudContainer.hud = f6_local0
	f6_arg0.hudContainer:addElement( f6_local0 )
	f6_local0:processEvent( {
		name = "menu_create",
		dispatchChildren = true
	} )
end

function closeRegisteredHud( f7_arg0 )
	if f7_arg0.hudContainer then
		f7_arg0.hudContainer:removeElement( f7_arg0.hudContainer.hud )
		f7_arg0.hudContainer.hud:close()
		f7_arg0.hudContainer.hud = nil
	elseif f7_arg0.hud then
		f7_arg0.hud:close()
	end
	f7_arg0.hud = nil
end

function initHud( f8_arg0, f8_arg1, f8_arg2 )
	if not f0_local0 then
		return 
	end
	local f8_local0 = Engine.GetDvarBool( "virtualLobbyActive" )
	if not f8_arg0.hudContainer then
		f8_arg0.hudContainer = LUI.UIElement.new( {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		} )
		f8_arg0.hudContainer.id = "hudContainer"
		local f8_local1 = function ()
			
		end
		
		f8_arg0.hudContainer:registerEventHandler( "mousemove", f8_local1 )
		f8_arg0.hudContainer:registerEventHandler( "mousedown", f8_local1 )
		f8_arg0.hudContainer:registerEventHandler( "mouseup", f8_local1 )
		f8_arg0.hudContainer:registerEventHandler( "gamepad_sticks", f8_local1 )
		f8_arg0.hudContainer:setPriority( LUI.UIRoot.childPriorities.hudContainer )
		f8_arg2:addElement( f8_arg0.hudContainer )
		if not f8_arg2.m_hudElemLayer then
			local self = LUI.UIElement.new( {
				left = 0,
				right = 0,
				top = 0,
				bottom = 0,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true
			} )
			self:setHudElemLayer()
			self:setPriority( LUI.UIRoot.childPriorities.hudElems )
			f8_arg2:addElement( self )
			f8_arg2.m_hudElemLayer = self
		end
		if not Engine.IsMultiplayer() then
			if not f8_arg2.m_hudElemLayerDotMenu then
				local self = LUI.UIElement.new( {
					left = 0,
					right = 0,
					top = 0,
					bottom = 0,
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true
				} )
				self:setHudElemLayerDotMenu()
				self:setPriority( LUI.UIRoot.childPriorities.hudElemsDotMenu )
				f8_arg2:addElement( self )
				f8_arg2.m_hudElemLayerDotMenu = self
			end
			if not f8_arg2.m_deadQuoteHud then
				local self = LUI.sp_hud.gameInfo.deadQuoteDef()
				self:setPriority( LUI.UIRoot.childPriorities.deadQuoteHud )
				f8_arg2:addElement( self )
				f8_arg2.m_deadQuoteHud = self
			end
			if not Engine.IsConsoleGame() and not f8_arg2.m_objectivesHud then
				local self = LUI.Objectives.new()
				self:setPriority( LUI.UIRoot.childPriorities.objectivesHud )
				f8_arg2:addElement( self )
				f8_arg2.m_objectivesHud = self
			end
		end
	end
	if not GameX.GetScreenWidth() then
		LUI.UIRoot.ProcessEvent( f8_arg2, {
			name = "init_hud"
		} )
		return 
	elseif not Engine.HasSnapshot() then
		LUI.UIRoot.ProcessEvent( f8_arg2, {
			name = "init_hud"
		} )
		return 
	elseif not f8_arg0.hud then
		openRegisteredHud( f8_arg0 )
	end
	if f8_local0 then
		return 
	end
end

function closeHudHandler( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0.hudManager
	if f10_local0 then
		f10_local0:closeHud( f10_arg1, f10_arg0 )
		f10_local0:endIntermission( f10_arg1, f10_arg0 )
	end
end

function closeHud( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg0.hudContainer then
		f11_arg0.hudContainer:close()
		f11_arg0.hudContainer = nil
	end
	if f11_arg0.hud then
		closeRegisteredHud( f11_arg0 )
	end
	if f11_arg0.MLGHud then
		f11_arg0.MLGHud:close()
		f11_arg0.MLGHud = nil
	end
end

function resetHud( f12_arg0, f12_arg1 )
	f12_arg0:processEvent( {
		name = "close_hud",
		immediate = true
	} )
	f12_arg0:processEvent( {
		name = "init_hud",
		immediate = true
	} )
end

function getHud( f13_arg0 )
	return f13_arg0.hud
end

function updateRoundEnd( f14_arg0, f14_arg1, f14_arg2 )
	if f14_arg1.value > 0 then
		openRoundEndScreen( f14_arg0, f14_arg1, f14_arg2 )
	else
		closeRoundEndScreen( f14_arg0, f14_arg1, f14_arg2 )
	end
end

function openRoundEndScreen( f15_arg0, f15_arg1, f15_arg2 )
	if not f15_arg0.roundEndScreen then
		LUI.FlowManager.RequestCloseAllMenus()
		f15_arg0.roundEndScreen = LUI.MenuBuilder.BuildAddChild( f15_arg2, {
			type = "roundEnd"
		} )
		f15_arg0.roundEndScreen:setPriority( LUI.UIRoot.childPriorities.roundEndHud )
		Engine.SetDvarBool( "ui_drawCrosshair", false )
	end
	if not f15_arg2.talkerRoot then
		local f15_local0, f15_local1, f15_local2, f15_local3 = GameX.GetAdjustedSafeZoneSize()
		local f15_local4 = Engine.UsingSplitscreenUpscaling() and 5 or 15
		f15_arg2.talkerRoot = LUI.UIElement.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f15_local0 + f15_local4,
			top = f15_local1 + f15_local4,
			right = f15_local2 - f15_local4,
			bottom = f15_local3 - f15_local4
		} )
		f15_arg2.talkerRoot:addElement( LUI.MenuBuilder.BuildRegisteredType( "talkerHudDef", {} ) )
		f15_arg2:addElement( f15_arg2.talkerRoot )
	end
end

function closeRoundEndScreen( f16_arg0, f16_arg1, f16_arg2 )
	if f16_arg0.roundEndScreen then
		f16_arg0.roundEndScreen:processEvent( {
			name = "menu_close"
		} )
		f16_arg0.roundEndScreen:close()
		f16_arg0.roundEndScreen = nil
		Engine.SetDvarBool( "ui_drawCrosshair", true )
	end
	if f16_arg2.talkerRoot and not f16_arg0.finalScoresScreen then
		f16_arg2.talkerRoot:close()
		f16_arg2.talkerRoot = nil
	end
end

function beginIntermission( f17_arg0, f17_arg1, f17_arg2 )
	f17_arg0:closeHud( f17_arg1, f17_arg2 )
	f17_arg0:closeRoundEndScreen( f17_arg1, f17_arg2 )
	LUI.FlowManager.RequestCloseAllMenus()
	if Engine.GetDvarBool( "squad_match" ) then
		Squad.PostMatch( Engine.GetClientMatchData( "alliesScore" ), Engine.GetClientMatchData( "axisScore" ), Engine.GetClientMatchData( "alliesKills" ), Engine.GetClientMatchData( "alliesDeaths" ), false )
	end
	if not f17_arg0.finalScoresScreen then
		f17_arg0.finalScoresScreen = LUI.MenuBuilder.BuildRegisteredType( "scoreboard", {
			defAlpha = 1,
			winningTeam = Game.GetOmnvar( "ui_game_victor" ),
			overrideScoreColoring = true,
			ignoreTitleTopOffsets = true
		} )
		f17_arg2:addElement( f17_arg0.finalScoresScreen )
	end
	if not f17_arg2.talkerRoot then
		local f17_local0, f17_local1, f17_local2, f17_local3 = GameX.GetAdjustedSafeZoneSize()
		local f17_local4 = Engine.UsingSplitscreenUpscaling() and 5 or 15
		f17_arg2.talkerRoot = LUI.UIElement.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f17_local0 + f17_local4,
			top = f17_local1 + f17_local4,
			right = f17_local2 - f17_local4,
			bottom = f17_local3 - f17_local4
		} )
		f17_arg2.talkerRoot:addElement( LUI.MenuBuilder.BuildRegisteredType( "talkerHudDef", {} ) )
		f17_arg2:addElement( f17_arg2.talkerRoot )
	end
end

function endIntermission( f18_arg0, f18_arg1, f18_arg2 )
	if f18_arg0.finalScoresScreen then
		f18_arg0.finalScoresScreen:close()
		f18_arg0.finalScoresScreen = nil
	end
	if f18_arg2.talkerRoot and not f18_arg0.roundEndScreen then
		f18_arg2.talkerRoot:close()
		f18_arg2.talkerRoot = nil
	end
end

function showHostMigrationHandler( f19_arg0, f19_arg1 )
	LUI.FlowManager.RequestAddMenu( nil, "host_migration_main" )
	f19_arg0:processEvent( {
		name = "show_host_migration_triggered"
	} )
end

function registerHudElement( f20_arg0 )
	assert( "HudManager.registerHudElement has been deprecated. Remove this call and follow examples in OverlayHud.lua to add a new hud element" )
end

function addHudElementHandlerGsc( f21_arg0, f21_arg1 )
	assert( "add_hudelement_gsc has been deprecated.  Use SetOmnvar and follow examples in OverlayHud.lua to add new hud elements" )
end

function removeHudElementHandlerGsc( f22_arg0, f22_arg1 )
	assert( "remove_hudelement_gsc has been deprecated.  Use SetOmnvar and follow examples in OverlayHud.lua to add new hud elements" )
end

LockTable( _M )
