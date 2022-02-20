local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function isPostGame()
	return Engine.GetDvarString( "ui_game_state" ) == "postgame"
end

function openMenuByScriptRequest( f2_arg0, f2_arg1 )
	local f2_local0 = {
		"team_select_main",
		"class_select_main",
		"generic_match_start_main"
	}
	local f2_local1 = f2_local0[f2_arg1]
	if f2_local1 and (f2_arg1 ~= 2 or Engine.GetDvarBool( "g_oldschool" ) == false) then
		if not MLG.IsMLGSpectator() then
			local f2_local2 = Engine.GetLuiRoot()
			if f2_local2:IsMenuOpenAndVisible( f2_local1 ) then
				return 
			end
			LUI.FlowManager.RequestAddMenuAndSetStack( nil, f2_local1, true, f2_local2.m_controllerIndex, false, false, {
				{
					name = "mp_pause_menu"
				}
			} )
		end
	elseif f2_arg1 == -1 or f2_arg1 == 2 and Engine.GetDvarBool( "g_oldschool" ) == true then
		LUI.FlowManager.RequestCloseAllMenus()
	end
end

function CanOpenMenu()
	local f3_local0
	if not isPostGame() then
		f3_local0 = LUI.FlowManager.IsInStack
		local f3_local1 = Engine.GetLuiRoot()
		if not f3_local0( f3_local1.flowManager, "host_migration_main" ) then
			f3_local0 = LUI.FlowManager.IsInStack
			f3_local1 = Engine.GetLuiRoot()
			f3_local0 = not f3_local0( f3_local1.flowManager, "mp_pause_menu" )
		end
	end
	f3_local0 = false
end

function pause( f4_arg0, f4_arg1 )
	if CanOpenMenu() then
		Game.HandleEnterPauseMenu()
		f4_arg0:processEvent( {
			name = "close_scoreboard"
		} )
		LUI.FlowManager.RequestAddMenu( f4_arg0, "mp_pause_menu", true, f4_arg1.controller, false )
		Engine.PlaySound( CoD.SFX.MenuAppear )
	end
end

function startHostMigration( f5_arg0 )
	f5_arg0.migrating = true
	updateHudVisibility( f5_arg0 )
end

function endHostMigration( f6_arg0 )
	f6_arg0.migrating = false
	updateHudVisibility( f6_arg0 )
	openMenuByScriptRequest( f6_arg0, Game.GetOmnvar( "ui_options_menu" ) )
end

f0_local0 = {
	{
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 10,
		left = 0,
		width = 280,
		height = 170
	}
}
f0_local1 = {
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 0,
		left = 0,
		width = 190,
		height = 95
	}
}
f0_local2 = {
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottom = 0,
		right = -10,
		width = 130,
		height = 95
	},
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottom = -90,
		right = -10,
		width = 75,
		height = 50
	},
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottom = -135,
		right = -10,
		width = 75,
		height = 50
	},
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottom = -180,
		right = -10,
		width = 75,
		height = 50
	},
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottom = 0,
		right = -140,
		width = 60,
		height = 95
	},
	{
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottom = 0,
		right = -200,
		width = 60,
		height = 95
	}
}
function updateGlitchVisibility( f7_arg0, f7_arg1 )
	assert( f7_arg0 )
	local f7_local0 = f7_arg0.widgetWrapper
	local f7_local1 = f7_arg0.glitchWrapper
	if Game.GetOmnvar( "ui_exo_reboot_end_time" ) > 0 then
		f7_local0:cancelAnimateToState()
		f7_local0:animateToState( "hide", 0 )
		f7_local1:animateToState( "show", 0 )
	else
		if f7_arg1 and f7_arg1.name ~= "playerstate_client_changed" then
			f7_local0:animateToState( "default", 0 )
			f7_local0:processEvent( {
				name = "animate_in_widget_wrapper"
			} )
		else
			f7_local0:animateToState( "default", 0 )
		end
		f7_local1:animateToState( "hide", 0 )
	end
end

function addGlitch()
	return LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		material = RegisterMaterial( "ui_hud_glitch_hacked" ),
		alpha = 1
	} )
end

function addGlitchWrapper( f9_arg0, f9_arg1, f9_arg2 )
	assert( f9_arg1 and f9_arg0 and f9_arg2, "Not all parameters were provided for addGlitchWrapper..." )
	
	local glitchWrapper = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	glitchWrapper.id = "glitch_wrapper_for_" .. f9_arg1.id
	glitchWrapper:registerAnimationState( "show", {
		alpha = 1
	} )
	glitchWrapper:registerAnimationState( "hide", {
		alpha = 0
	} )
	f9_arg0:addElement( glitchWrapper )
	f9_arg0.glitchWrapper = glitchWrapper
	
	for f9_local1 = 1, #f9_arg2, 1 do
		local self = LUI.UIElement.new( f9_arg2[f9_local1] )
		self.id = glitchWrapper.id .. "_glitch" .. f9_local1 .. "_id"
		self:addElement( addGlitch() )
		glitchWrapper:addElement( self )
	end
	f9_arg0:registerOmnvarHandler( "ui_exo_reboot_end_time", updateGlitchVisibility )
	f9_arg0:registerEventHandler( "playerstate_client_changed", updateGlitchVisibility )
	updateGlitchVisibility( f9_arg0 )
end

function shakeHud( f10_arg0 )
	assert( f10_arg0.shakeable )
	local f10_local0 = f10_arg0.shakeable
	local f10_local1 = 14
	local f10_local2 = 18
	local f10_local3 = 0.2
	local f10_local4 = 30
	local f10_local5 = 150
	local f10_local6 = {
		{
			"default",
			0
		}
	}
	for f10_local7 = 1, f10_local1, 1 do
		local f10_local10 = "shake_" .. f10_local7
		local f10_local11 = f10_local2 * (1 - f10_local3 + math.random() * 2 * f10_local3)
		local f10_local12 = f10_local2 * (1 - f10_local3 + math.random() * 2 * f10_local3)
		if math.random() > 0.5 then
			f10_local11 = -f10_local11
		end
		if math.random() > 0.5 then
			f10_local12 = -f10_local12
		end
		f10_local0:registerAnimationState( f10_local10, {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = f10_local11,
			left = f10_local12,
			right = f10_local11,
			bottom = f10_local12
		} )
		table.insert( f10_local6, {
			f10_local10,
			f10_local4
		} )
	end
	table.insert( f10_local6, {
		"default",
		f10_local5,
		false,
		true
	} )
	local f10_local8 = MBh.AnimateSequence( f10_local6 )
	f10_local8( f10_local0 )
end

function updateHudVisibility( f11_arg0 )
	local f11_local0 = Engine.GetLuiRoot()
	local f11_local1 = {}
	local f11_local2 = nil
	local f11_local3 = Game.GetOmnvar( "ui_hide_hud" )
	if not f11_local3 then
		f11_local3 = not Engine.GetDvarBool( "cg_draw2D" )
	end
	local f11_local4 = Engine.GetDvarBool( "virtualLobbyInFiringRange" )
	local f11_local5 = f11_local0:AnyActiveMenusInStack() and not f11_local4
	local f11_local6 = Engine.InFrontend() and not f11_local4
	local f11_local7 = f11_arg0.migrating
	local f11_local8 = isPostGame()
	local f11_local9 = Game.GetOmnvar( "ui_session_state" ) == "spectator"
	local f11_local10 = Game.GetPlayerClientnum() ~= Game.GetPlayerstateClientnum()
	local f11_local11 = Game.InKillCam()
	local f11_local12 = Game.GetFlashbangedRemainingTime() > 0
	local f11_local13 = Game.IsEmpJammed()
	local f11_local14 = CoD.UsingKillstreakRemote()
	local f11_local15, f11_local16 = Game.PlayerReticleZoom()
	local f11_local17 = Engine.GetDvarString( "createfx" ) == "on"
	local f11_local18 = Engine.GetDvarString( "ui_gametype" )
	local f11_local19 = Game.UnderWater()
	local f11_local20 = Game.GetOmnvar( "ui_map_location_selector" ) ~= 0
	local f11_local21 = Game.GetOmnvar( "ui_hide_hints_hud" )
	local f11_local22 = GameX.IsHardcoreMode()
	local f11_local23
	if MLG.IsMLGSpectator() then
		if not LUI.mp_hud.MLGHud then
			
		else
			f11_local23 = LUI.mp_hud.MLGHud.MLGHud_isMPHudEnabled()
		end
	end
	f11_local23 = true
end

function setWidgetsVisibility( f12_arg0, f12_arg1 )
	local f12_local0
	if f12_arg1 then
		f12_local0 = "hud_on"
		if not f12_local0 then
		
		else
			for f12_local4, f12_local5 in pairs( f12_arg0 ) do
				if f12_local5.current_state ~= f12_local0 then
					f12_local5:processEvent( {
						name = f12_local0
					} )
					f12_local5:animateToState( f12_local0, 100 )
					f12_local5.current_state = f12_local0
				end
			end
		end
	end
	f12_local0 = "hud_off"
end

function addWidget( f13_arg0, f13_arg1, f13_arg2 )
	assert( f13_arg1 )
	assert( f13_arg1.id )
	if not f13_arg2 then
		f13_arg2 = {}
	end
	local f13_local0 = f13_arg2.shakeable
	local f13_local1 = f13_arg2.scalable
	local f13_local2 = f13_arg2.glitches
	local f13_local3 = f13_arg2.botLayer
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:registerAnimationState( "hud_on", {
		alpha = 1
	} )
	self:registerAnimationState( "hud_off", {
		alpha = 0
	} )
	self.id = "wrapper_for_" .. f13_arg1.id
	self.widget = f13_arg1
	local f13_local5 = 32
	local f13_local6 = {
		{
			"show",
			0
		},
		{
			"show",
			f13_local5
		},
		{
			"hide",
			0
		},
		{
			"hide",
			f13_local5
		},
		{
			"show",
			0
		},
		{
			"show",
			f13_local5
		},
		{
			"hide",
			0
		},
		{
			"hide",
			f13_local5
		},
		{
			"show",
			0
		}
	}
	
	local widgetWrapper = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 1
	} )
	widgetWrapper.id = "widget_wrapper_for_" .. f13_arg1.id
	widgetWrapper:registerAnimationState( "show", {
		alpha = 1
	} )
	widgetWrapper:registerAnimationState( "hide", {
		alpha = 0
	} )
	widgetWrapper:registerEventHandler( "animate_in_widget_wrapper", MBh.AnimateSequence( f13_local6 ) )
	widgetWrapper:addElement( f13_arg1 )
	self:addElement( widgetWrapper )
	self.widgetWrapper = widgetWrapper
	
	if not f13_arg2.allowInput then
		self:registerEventHandler( "gamepad_button", function ()
			
		end )
	end
	local f13_local8 = f13_arg0
	if f13_local3 then
		f13_local8 = f13_local8.botLayer
	else
		if f13_local0 then
			local f13_local9 = f13_local8.shakeable
		end
		f13_local8 = f13_local9 or f13_local8.static
		if f13_local1 then
			local f13_local10 = f13_local8.scalable
		end
		f13_local8 = f13_local10 or f13_local8.fullscreen
	end
	f13_local8:addElement( self )
	table.insert( f13_arg0.allWidgets, self )
	return self
end

function initWidgets( f15_arg0 )
	local f15_local0 = Engine.GetDvarString( "ui_gametype" )
	local f15_local1 = GameX.IsHardcoreMode()
	if not Engine.InFrontend() then
		f15_arg0.lowHealth = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "lowHealthHudDef"
		} ), {
			botLayer = true
		} )
		f15_arg0.gameMessage = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "gameMessageHudDef"
		} ), {
			scalable = true
		} )
		if not Engine.GetDvarBool( "cg_e3TrailerHacks" ) and not f15_local1 then
			f15_arg0.lowAmmoWarning = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "lowAmmoWarningHudDef"
			} ), {
				shakeable = true,
				scalable = true
			} )
		end
		f15_arg0.talkerHud = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "talkerHudDef"
		} ), {
			scalable = true
		} )
		f15_arg0.killcam = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "killCamHudDef"
		} ), {
			botLayer = true
		} )
		f15_arg0.damageFlash = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "damageFlashDef"
		} ), {} )
		f15_arg0.pointsPopup = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "pointsPopup"
		} ), {} )
		f15_arg0.spectating = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "spectatorHudDef"
		} ), {
			scalable = true
		} )
		f15_arg0.killstreakEarned = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "killstreakEarned"
		} ), {
			shakeable = true,
			scalable = true
		} )
		f15_arg0.splashes = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "splashesFanoutHudDef"
		} ), {
			shakeable = true,
			scalable = true
		} )
		f15_arg0.minimap = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "minimapHudDef"
		} ), {
			shakeable = true,
			scalable = true,
			glitches = f0_local0
		} )
		f15_arg0.obituary = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "obituary"
		} ), {
			shakeable = true,
			scalable = true
		} )
		f15_arg0.useBar = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "useBar"
		} ), {
			shakeable = true,
			scalable = true
		} )
		if f15_local0 == "dom" or f15_local0 == "koth" or f15_local0 == "sd" or f15_local0 == "sab" or f15_local0 == "dd" then
			f15_arg0.capture = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "captureHud"
			} ), {
				shakeable = true,
				scalable = true
			} )
		end
		if f15_local0 == "koth" then
			f15_arg0.gscMessageHud = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "gscMessageHud"
			} ), {
				shakeable = true,
				scalable = true
			} )
		end
		if f15_local0 == "hp" then
			f15_arg0.hardpointCapture = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "hardpointCapture"
			} ), {
				shakeable = true,
				scalable = true
			} )
			f15_arg0.hardpointStatus = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "hardpointStatus"
			} ), {
				shakeable = true,
				scalable = true
			} )
		end
		if f15_local0 == "ctf" then
			f15_arg0.ctfHud = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "ctfHudDef"
			} ), {
				shakeable = true,
				scalable = true
			} )
		end
		if f15_local0 == "sd" or f15_local0 == "ctf" or f15_local0 == "dd" or f15_local0 == "sab" then
			f15_arg0.personalObjectiveHud = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "personalObjectiveHud"
			} ), {
				shakeable = true,
				scalable = true
			} )
		end
		if not f15_local1 then
			f15_arg0.teamScores = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
				type = "teamScoresHudDef"
			} ), {
				shakeable = true,
				scalable = true,
				glitches = f0_local1
			} )
			if GameX.IsRankedMatch() and not GameX.IsSplitscreen() then
				f15_arg0.experienceBar = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
					type = "experienceBar"
				} ), {
					scalable = true
				} )
			end
			if f15_local0 == "sd" or f15_local0 == "sab" or f15_local0 == "dd" then
				f15_arg0.bombTimers = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
					type = "bombHudDef"
				} ), {
					shakeable = true,
					scalable = true
				} )
			end
			if f15_local0 == "sd" then
				f15_arg0.playerCount = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
					type = "sdPlayerCountDef"
				} ), {
					shakeable = true,
					scalable = true
				} )
			end
		end
		f15_arg0.scoreboard = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "scoreboard",
			properties = {
				enabledAlpha = 1
			}
		} ), {
			scalable = true,
			allowInput = true
		} )
	else
		f15_arg0.FiringRangeRoundTimer = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "VlobbyFiringRangeHudMain"
		} ), {} )
	end
	f15_arg0.damageFeedback = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
		type = "damageFeedbackHudDef"
	} ), {} )
	f15_arg0.overlay = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
		type = "overlayHudDef"
	} ), {} )
	f15_arg0.hints = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
		type = "hintsHudDef"
	} ), {
		scalable = true
	} )
	if not f15_local1 then
		f15_arg0.weaponInfo = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "weaponInfoHudDef"
		} ), {
			shakeable = true,
			scalable = true,
			glitches = f0_local2
		} )
		f15_arg0.actionSlot = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "actionSlotHudDef"
		} ), {
			shakeable = true,
			scalable = true
		} )
	end
	f15_arg0.adsOverlay = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
		type = "adsOverlayHud"
	} ), {
		shakeable = true
	} )
	if not f15_local1 then
		f15_arg0.perks = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "perksHudDef"
		} ), {
			scalable = true
		} )
	end
	if not Engine.InFrontend() then
		f15_arg0.killstreakBlackoutHud = LUI.MenuBuilder.buildItems( {
			type = "killstreakBlackoutHudDef"
		} )
		f15_arg0.static.fullscreen:addElement( f15_arg0.killstreakBlackoutHud )
	end
	if not Engine.InFrontend() then
		f15_arg0.matchCountdown = addWidget( f15_arg0, LUI.MenuBuilder.buildItems( {
			type = "matchCountdown"
		} ), {} )
	end
end

function initHandlers( f16_arg0 )
	if not Engine.InFrontend() then
		f16_arg0:registerEventHandler( "toggle_pause", pause )
		f16_arg0:registerEventHandler( "show_host_migration_triggered", startHostMigration )
		f16_arg0:registerEventHandler( "hide_host_migration", endHostMigration )
	end
	f16_arg0:registerOmnvarHandler( "ui_hud_shake", function ( f17_arg0, f17_arg1 )
		if f17_arg1.value then
			shakeHud( f17_arg0 )
		end
	end )
	f16_arg0:registerOmnvarHandler( "ui_round_end", updateHudVisibility )
	f16_arg0:registerOmnvarHandler( "ui_session_state", updateHudVisibility )
	f16_arg0:registerOmnvarHandler( "ui_hide_hud", updateHudVisibility )
	f16_arg0:registerDvarHandler( "virtualLobbyInFiringRange", updateHudVisibility )
	f16_arg0:registerDvarHandler( "cg_draw2D", updateHudVisibility )
	f16_arg0:registerDvarHandler( "ui_game_state", updateHudVisibility )
	f16_arg0:registerEventHandler( "weapon_change", updateHudVisibility )
	f16_arg0:registerEventHandler( "mlg_minimap_change", updateHudVisibility )
	f16_arg0:registerEventHandler( "mlg_hud_enabled_change", updateHudVisibility )
	f16_arg0:registerEventHandler( "playerstate_client_changed", updateHudVisibility )
	f16_arg0:registerEventHandler( "empty_menu_stack", updateHudVisibility )
	f16_arg0:registerEventHandler( "non_empty_menu_stack", updateHudVisibility )
	f16_arg0:registerOmnvarHandler( "ui_map_location_selector", updateHudVisibility )
	f16_arg0:registerOmnvarHandler( "ui_hide_hints_hud", updateHudVisibility )
	f16_arg0:registerDvarHandler( "bg_compassShowEnemies", updateHudVisibility )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "Jammed" )
	self.id = "jammedWatch"
	self:registerEventHandler( "int_watch_alert", function ()
		updateHudVisibility( f16_arg0 )
	end )
	f16_arg0:addElement( self )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "Stunned" )
	self.id = "stunnedWatch"
	self:registerEventHandler( "int_watch_alert", function ()
		updateHudVisibility( f16_arg0 )
	end )
	f16_arg0:addElement( self )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "PlayerADS" )
	self.id = "zoomWatch"
	self:registerEventHandler( "int_watch_alert", function ()
		updateHudVisibility( f16_arg0 )
	end )
	f16_arg0:addElement( self )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "RadarEnabled" )
	self.id = "radarWatch"
	self:registerEventHandler( "int_watch_alert", function ()
		updateHudVisibility( f16_arg0 )
	end )
	f16_arg0:addElement( self )
	f16_arg0:registerOmnvarHandler( "ui_options_menu", function ( f22_arg0, f22_arg1 )
		openMenuByScriptRequest( f22_arg0, f22_arg1.value )
	end )
	openMenuByScriptRequest( f16_arg0, Game.GetOmnvar( "ui_options_menu" ) )
end

local f0_local3 = function ( f23_arg0 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self.id = "worldBlurCG"
	self:setupWorldBlur()
	f23_arg0:registerOmnvarHandler( "ui_cg_world_blur", function ( f24_arg0, f24_arg1 )
		if not f24_arg0.worldBlurCG then
			f24_arg0:addElement( self )
		end
	end )
	f23_arg0:registerOmnvarHandler( "ui_cg_world_blur_fade_out", function ( f25_arg0, f25_arg1 )
		f25_arg0:removeElement( self )
	end )
end

function mp_hud()
	local f26_local0 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 1
	}
	local self = LUI.UIElement.new( f26_local0 )
	self.id = "mp_hud"
	self.allWidgets = {}
	if Engine.IsCurrentGen() then
		f0_local3( self )
	end
	self.botLayer = LUI.UIElement.new( f26_local0 )
	self.botLayer.id = "botLayer"
	self:addElement( self.botLayer )
	self.shakeable = LUI.UIElement.new( f26_local0 )
	self.shakeable.id = "shakeable"
	self:addElement( self.shakeable )
	self.static = LUI.UIElement.new( f26_local0 )
	self.static.id = "static"
	self:addElement( self.static )
	self.static.fullscreen = LUI.UIElement.new( f26_local0 )
	self.static.fullscreen.id = "fullscreen"
	self.static:addElement( self.static.fullscreen )
	self.shakeable.fullscreen = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.shakeable.fullscreen.id = "fullscreen"
	self.shakeable:addElement( self.shakeable.fullscreen )
	local f26_local2 = function ( f27_arg0 )
		local f27_local0, f27_local1, f27_local2, f27_local3 = GameX.GetAdjustedSafeZoneSize()
		local f27_local4 = Engine.UsingSplitscreenUpscaling() and 5 or 15
		f27_arg0:registerAnimationState( "current", {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			left = f27_local0 + f27_local4,
			top = f27_local1 + f27_local4,
			right = f27_local2 - f27_local4,
			bottom = f27_local3 - f27_local4
		} )
		f27_arg0:animateToState( "current" )
	end
	
	self.static.scalable = LUI.UIElement.new( f26_local0 )
	self.static.scalable.id = "scalable"
	self.static:addElement( self.static.scalable )
	self.static.scalable:registerEventHandler( "update_hud_margins", f26_local2 )
	f26_local2( self.static.scalable )
	self.shakeable.scalable = LUI.UIElement.new( f26_local0 )
	self.shakeable.scalable.id = "scalable"
	self.shakeable:addElement( self.shakeable.scalable )
	self.shakeable.scalable:registerEventHandler( "update_hud_margins", f26_local2 )
	f26_local2( self.shakeable.scalable )
	initWidgets( self )
	initHandlers( self )
	self.isScoreboardOpen = function ( f28_arg0 )
		if f28_arg0.scoreboard then
			return LUI.Scoreboard.isScoreboardOpen( f28_arg0.scoreboard.widget )
		else
			return false
		end
	end
	
	updateHudVisibility( self )
	return self
end

LUI.MenuBuilder.registerType( "mp_hud", mp_hud )
LUI.HudManager.registerHud( "mp_hud" )
LockTable( _M )
