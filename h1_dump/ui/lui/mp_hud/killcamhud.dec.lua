local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = Engine.Localize( "@LUA_MENU_KILLCAM_CAPS" )
f0_local1 = Engine.Localize( "@LUA_MENU_VERSUS" )
f0_local2 = Engine.Localize( "@LUA_MENU_NEMESIS" )
local f0_local3 = Engine.Localize( "@LUA_MENU_SCORED_BY_CAPS" )
local f0_local4 = Engine.Localize( "@LUA_MENU_KILLCAM_FINAL_CAPS" )
local f0_local5 = RegisterMaterial( "white" )
local f0_local6 = 4
local f0_local7 = 12
local f0_local8 = 0
local f0_local9 = 1
local f0_local10 = function ( f1_arg0, f1_arg1 )
	if not f1_arg0.kcElems then
		f1_arg0.kcElems = {}
		local f1_local0 = {
			"killCamRespawnText",
			"killCamCopycatText",
			"killCamWeaponImage",
			"killCamWeaponHL",
			"killCamWeaponNameText",
			"killCamWeaponNameBg",
			"killCamAbilitiesHL",
			"spectatorPlayerCard",
			"attackerPlayerCard",
			"playerCardBg",
			"playerCardPatchBg",
			"playerCardPatch",
			"playerCardQuipText",
			"playerCardClanTagText",
			"playerCardRankIcon",
			"playerCardRankText",
			"playerCardNameText",
			"killCamVictimAttacker",
			"killCamVictimAttackerText",
			"killCamCountDownBar",
			"killCamCountDownTimerText",
			"killCamTextBarsBg",
			"killCamBottom",
			"killCamTitleText",
			"killCamVSOrNemesisText",
			"leftScoreText",
			"rightScoreText",
			"versusTriangle",
			"nemesisSkull",
			"killCamPerk1Image",
			"killCamPerk2Image",
			"killCamPerk3Image",
			"rightFactionIcon",
			"rightNameText",
			"leftFactionIcon",
			"leftNameText"
		}
		for f1_local1 = 1, #f1_local0, 1 do
			f1_arg0.kcElems[f1_local0[f1_local1]] = f1_arg0:getFirstDescendentById( f1_local0[f1_local1] )
		end
	end
end

local f0_local11 = function ( f2_arg0 )
	local f2_local0 = f2_arg0.kcElems.killCamTitleText
	local f2_local1 = f2_arg0.kcElems.killCamCountDownTimerText
	local f2_local2 = Engine.GetDvarString( "ui_game_state" ) == "postgame"
	local f2_local3 = Game.GetOmnvar( "ui_killcam_type" )
	local f2_local4 = nil
	if f2_local2 then
		f2_local4 = f0_local4
	else
		f2_local4 = f0_local0
	end
	f2_local0:setText( f2_local4 )
	local f2_local5, f2_local6, f2_local7, f2_local8 = GetTextDimensions2( f2_local4, CoD.TextSettings.TitleFontSmall.Font, CoD.TextSettings.TitleFontSmall.Height )
	f2_arg0.headerContainer:registerAnimationState( "updateWidth", {
		width = f2_local7 - f2_local5 + 15
	} )
	f2_arg0.headerContainer:animateToState( "updateWidth" )
	if f2_local2 then
		f2_local1:animateToState( "final", 0 )
		f2_arg0.countdownBG:animateToState( "hidden", 0 )
		f2_arg0.countdownFrame:animateToState( "hidden", 0 )
	else
		f2_local1:animateToState( "default", 0 )
		f2_arg0.countdownBG:animateToState( "default", 0 )
		f2_arg0.countdownFrame:animateToState( "default", 0 )
	end
end

local f0_local12 = function ( f3_arg0 )
	if GameX.gameModeIsFFA() == false then
		local f3_local0 = f3_arg0.kcElems.leftScoreText
		local f3_local1 = f3_arg0.kcElems.rightScoreText
		local f3_local2 = Game.GetPlayerTeam()
		if f3_local2 == Teams.spectator then
			f3_local2 = Teams.allies or f3_local2
		end
		local f3_local3 = GameX.GetPlayerOpposingTeam( f3_local2 )
		local f3_local4 = Game.GetTeamScore( f3_local2 ) or 0
		local f3_local5 = Game.GetTeamScore( f3_local3 ) or 0
		if Game.GetPlayerClientnum() == Game.GetOmnvar( "ui_killcam_killedby_id" ) then
			f3_local0:setText( f3_local4 )
			f3_local1:setText( f3_local5 )
		else
			f3_local0:setText( f3_local5 )
			f3_local1:setText( f3_local4 )
		end
	end
end

local f0_local13 = function ( f4_arg0 )
	local f4_local0 = f4_arg0.kcElems.killCamRespawnText
	local f4_local1 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"active",
			250
		}
	} )
	f4_local1( f4_local0 )
	f4_local1 = Game.GetOmnvar( "ui_killcam_text" )
	if f4_local1 == "skip" then
		f4_local0:setText( Engine.Localize( "@PLATFORM_PRESS_TO_SKIP_CAPS" ) )
	elseif f4_local1 == "respawn" then
		f4_local0:setText( Engine.Localize( "@PLATFORM_PRESS_TO_RESPAWN_CAPS" ) )
	else
		f4_local0:setText( "" )
	end
end

local f0_local14 = function ( f5_arg0 )
	local f5_local0 = f5_arg0.kcElems.killCamCopycatText
	local f5_local1 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"active",
			250
		}
	} )
	f5_local1( f5_local0 )
	if Game.GetOmnvar( "ui_killcam_copycat" ) then
		f5_local0:setText( Engine.Localize( "@PLATFORM_PRESS_TO_COPYCAT" ) )
	else
		f5_local0:setText( "" )
	end
end

local f0_local15 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0.kcElems.killCamCopycatText
	if f6_arg1.value == false then
		f6_local0:setText( "" )
		return 
	else
		
	end
end

local f0_local16 = function ( f7_arg0 )
	local f7_local0 = f7_arg0.kcElems.killCamWeaponNameText
	local f7_local1 = f7_arg0.kcElems.killCamWeaponNameBg
	local f7_local2 = f7_arg0.kcElems.killCamWeaponImage
	local f7_local3 = {}
	for f7_local4 = 1, f0_local6, 1 do
		f7_local3[f7_local4] = f7_arg0.kcElems.killCamWeaponHL:getChildById( "killCamAttachment" .. f7_local4 )
	end
	local f7_local4 = Game.GetOmnvar( "ui_killcam_killedby_killstreak" )
	local f7_local5 = Game.GetOmnvar( "ui_killcam_killedby_weapon" )
	local f7_local6 = Game.GetOmnvar( "ui_killcam_killedby_weapon_custom" )
	local f7_local7 = Game.GetOmnvar( "ui_killcam_killedby_weapon_alt" )
	local f7_local8 = ""
	local f7_local9 = ""
	local f7_local10 = ""
	local f7_local11, f7_local12 = nil
	if f7_local5 ~= -1 then
		f7_local12 = Game.GetKillCamWeaponIcon( f7_local5, f7_local6, f7_local7 )
		f7_local9 = Game.GetKillCamWeaponName( f7_local5, f7_local6, f7_local7 )
	elseif f7_local4 ~= -1 then
		f7_local10 = Engine.TableLookupByRow( KillstreakTable.File, f7_local4, KillstreakTable.Cols.UnearnedIcon )
		f7_local9 = Engine.TableLookupByRow( KillstreakTable.File, f7_local4, KillstreakTable.Cols.Name )
		if f7_local10 ~= nil then
			f7_local12 = {
				icon = RegisterMaterial( f7_local10 ),
				flip = false
			}
			Engine.CacheMaterial( f7_local12.icon )
		end
	end
	if f7_local12 == nil then
		f7_local2:animateToState( "inactive", 0 )
	else
		local f7_local13 = 40
		local f7_local14 = f7_local13 * Engine.GetMaterialAspectRatio( f7_local12.icon )
		local f7_local15 = nil
		local f7_local16 = 0
		if f7_local12.flip then
			f7_local15 = 0
			f7_local14 = -f7_local14
			f7_local16 = nil
		end
		f7_local2:registerAnimationState( "default", {
			topAnchor = false,
			leftAnchor = true,
			bottomAnchor = false,
			rightAnchor = false,
			left = f7_local16,
			right = f7_local15,
			height = f7_local13,
			width = f7_local14,
			alpha = 1,
			material = f7_local12.icon
		} )
		f7_local2:animateToState( "default", 0 )
	end
	local f7_local13
	if f7_local9 and f7_local9 ~= "" then
		f7_local13 = Engine.Localize( f7_local9 )
		if not f7_local13 then
		
		else
			f7_local0:setText( f7_local13 )
			local f7_local17, f7_local14, f7_local15, f7_local16 = GetTextDimensions2( f7_local13, CoD.TextSettings.BodyFontTiny.Font, CoD.TextSettings.BodyFontTiny.Height )
			f7_local1:registerAnimationState( "widthOfMessage", {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				width = f7_local15 - f7_local17 + 4
			} )
			f7_local1:animateToState( "widthOfMessage", 0 )
			for f7_local18 = 1, #f7_local3, 1 do
				local f7_local21 = ""
				if f7_local21 == nil or f7_local21 == "" then
					f7_local3[f7_local18]:animateToState( "default", 0 )
				end
			end
			local f7_local18 = 0
			for f7_local19 = 1, 3, 1 do
				local f7_local23 = f7_arg0.kcElems["killCamPerk" .. f7_local19 .. "Image"]
				local f7_local24 = Game.GetPlayerPerkSlotMaterial( f7_local18 )
				if f7_local24 ~= nil then
					CoD.SetMaterial( f7_local23, f7_local24 )
				else
					f7_local23:animateToState( "empty", 0 )
				end
				f7_local18 = f7_local18 + 1
			end
			f7_arg0.kcElems.killCamWeaponHL:setLayoutCached( false )
		end
	end
	f7_local13 = ""
end

local f0_local17 = function ( f8_arg0 )
	local f8_local0, f8_local1, f8_local2, f8_local3 = nil
	local f8_local4 = f8_arg0.kcElems.leftFactionIcon
	local f8_local5 = f8_arg0.kcElems.leftNameText
	local f8_local6 = f8_arg0.kcElems.rightFactionIcon
	local f8_local7 = f8_arg0.kcElems.rightNameText
	if Game.GetPlayerTeam() == 1 then
		f8_local0 = Engine.GetDvarString( "g_TeamIcon_Axis" )
		f8_local2 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) )
		f8_local1 = Engine.GetDvarString( "g_TeamIcon_Allies" )
		f8_local3 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) )
	else
		f8_local0 = Engine.GetDvarString( "g_TeamIcon_Allies" )
		f8_local2 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) )
		f8_local1 = Engine.GetDvarString( "g_TeamIcon_Axis" )
		f8_local3 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) )
	end
	if Game.GetPlayerClientnum() == Game.GetOmnvar( "ui_killcam_killedby_id" ) then
		f8_local4:Update( f8_local0 )
		f8_local6:Update( f8_local1 )
		f8_local5:setText( f8_local2 )
		f8_local7:setText( f8_local3 )
	else
		f8_local4:Update( f8_local1 )
		f8_local6:Update( f8_local0 )
		f8_local5:setText( f8_local3 )
		f8_local7:setText( f8_local2 )
	end
end

local f0_local18 = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = f9_arg0.kcElems[f9_arg1]
	f9_local0:show()
	local f9_local1 = f9_arg0.kcElems.killCamVSOrNemesisText
	if f9_arg2 == -1 then
		f9_local0:animateToState( "default", 0 )
		f9_local1:setText( "" )
	else
		if Engine.GetDvarString( "ui_game_state" ) == "postgame" then
			f9_local0:animateToState( "postgame" )
		else
			f9_local0:animateToState( "default" )
		end
		f9_local0:processEvent( {
			name = "update_playercard_for_clientnum",
			clientNum = f9_arg2
		} )
		if Game.GetOmnvar( "ui_killcam_type" ) == 1 then
			f9_local1:setText( f0_local3 )
		elseif Engine.GetDvarString( "ui_game_state" ) == "postgame" then
			f9_local1:animateToState( "hidden" )
		elseif Game.GetOmnvar( "ui_killcam_killedby_nemesis" ) == true then
			f9_local1:setText( f0_local2 )
			f9_local1:animateToState( "nemesis" )
		else
			f9_local1:setText( f0_local1 )
			f9_local1:animateToState( "default" )
		end
	end
end

local f0_local19 = function ( f10_arg0, f10_arg1 )
	f10_arg0.kcElems[f10_arg1]:hide()
end

local f0_local20 = function ( f11_arg0 )
	f0_local18( f11_arg0, "attackerPlayerCard", Game.GetOmnvar( "ui_killcam_killedby_id" ) )
end

local f0_local21 = function ( f12_arg0 )
	local f12_local0 = Game.GetOmnvar( "ui_killcam_victim_id" )
	if f12_local0 == -1 then
		f12_local0 = Game.GetPlayerClientnum()
	end
	f0_local18( f12_arg0, "spectatorPlayerCard", f12_local0 )
end

local f0_local22 = function ( f13_arg0 )
	if Game.GetOmnvar( "ui_killcam_victim_id" ) == -1 then
		local f13_local0 = Game.GetPlayerClientnum()
	end
	f0_local19( f13_arg0, "spectatorPlayerCard" )
end

local f0_local23 = function ( f14_arg0 )
	if Game.GetOmnvar( "ui_killcam_killedby_nemesis" ) == true then
		f14_arg0.kcElems.versusTriangle:animateToState( "nemesis" )
		f14_arg0.kcElems.nemesisSkull:animateToState( "nemesis" )
	else
		f14_arg0.kcElems.versusTriangle:animateToState( "default" )
		f14_arg0.kcElems.nemesisSkull:animateToState( "default" )
	end
end

local f0_local24 = function ( f15_arg0 )
	f15_arg0.kcElems.versusTriangle:animateToState( "hidden" )
	f15_arg0.kcElems.nemesisSkull:animateToState( "default" )
end

local f0_local25 = function ( f16_arg0, f16_arg1 )
	if f16_arg1.value <= 0 then
		f16_arg0:processEvent( {
			name = "killcam_off"
		} )
		return 
	end
	f0_local11( f16_arg0 )
	f0_local12( f16_arg0 )
	f0_local13( f16_arg0 )
	f0_local14( f16_arg0 )
	f0_local16( f16_arg0 )
	if not GameX.gameModeIsFFA() then
		f0_local17( f16_arg0 )
	end
	f0_local20( f16_arg0 )
	if Engine.GetDvarString( "ui_game_state" ) ~= "postgame" then
		f0_local21( f16_arg0 )
		f0_local23( f16_arg0 )
	else
		f0_local22( f16_arg0 )
		f0_local24( f16_arg0 )
	end
	f16_arg0.kcElems.killCamBottom:animateToState( "active", 0 )
	f16_arg0.kcElems.killCamTitleText:animateToState( "active", 0 )
	f16_arg0:dispatchEventToChildren( {
		name = "killcam_on"
	} )
	f16_arg0:processEvent( {
		name = "killcam_on"
	} )
	f16_arg0:animateToState( "active", 0 )
end

local f0_local26 = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg0.kcElems.killCamCountDownBar
	local f17_local1 = f17_arg0.kcElems.killCamVictimAttacker
	local f17_local2 = f17_arg0.kcElems.killCamVictimAttackerText
	local f17_local3 = f17_arg0.kcElems.spectatorPlayerCard
	local f17_local4 = f17_arg0.kcElems.killCamBottom
	local f17_local5 = f17_arg0.kcElems.killCamTitleText
	f17_local0:animateToState( "inactive", 0 )
	if f17_arg1.value == f0_local8 then
		f0_local21( f17_arg0 )
		f17_arg0:animateToState( "active", 0 )
		f17_local4:animateToState( "default", 0 )
		local f17_local6 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				250
			},
			{
				"active",
				1250
			},
			{
				"default",
				250
			}
		} )
		f17_local6( f17_local3 )
		f17_local2:setText( "" )
		f17_local6 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				250
			},
			{
				"active",
				1250
			},
			{
				"default",
				250
			}
		} )
		f17_local6( f17_local1 )
	elseif f17_arg1.value == f0_local9 then
		f0_local20( f17_arg0 )
		f17_arg0:animateToState( "active", 0 )
		f17_local5:animateToState( "inactive", 0 )
		local f17_local6 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				250
			},
			{
				"active",
				4500
			}
		} )
		f17_local6( f17_local3 )
		f17_local2:setText( "" )
		f17_local6 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				250
			},
			{
				"active",
				2000
			},
			{
				"default",
				250
			}
		} )
		f17_local6( f17_local1 )
		f17_local6 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				250
			}
		} )
		f17_local6( f17_local4 )
	else
		f17_arg0:animateToState( "default", 0 )
	end
end

local f0_local27 = function ( f18_arg0 )
	local self = LUI.UIElement.new()
	self.id = "killCamTextBarsBg"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		height = 93.33,
		alpha = 0.9,
		material = RegisterMaterial( "h1_ui_killcam_header_bg_not_tiled" )
	} )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		left = 276,
		height = 106.67,
		width = 728,
		alpha = 0.9,
		material = RegisterMaterial( "h1_ui_topbar_title_bg" )
	} )
	local f18_local3 = GameX.gameModeIsFFA()
	local f18_local4 = {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		left = 73,
		top = 48,
		width = 100,
		height = 100
	}
	local f18_local5
	if f18_local3 then
		f18_local5 = 0
		if not f18_local5 then
		
		else
			f18_local4.alpha = f18_local5
			f18_local5 = LUI.FactionIcon.new( f18_local4 )
			f18_local5.id = "leftFactionIcon"
			local self = LUI.UIText.new()
			self.id = "leftNameText"
			local f18_local7 = self
			local self = self.registerAnimationState
			local f18_local9 = "default"
			local self = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = false,
				top = 120,
				left = 186,
				height = CoD.TextSettings.BodyFontSmall.Height,
				font = CoD.TextSettings.BodyFontSmall.Font,
				alignment = LUI.Alignment.Left,
				color = Colors.white
			}
			local self
			if f18_local3 then
				self = 0
				if not self then
				
				else
					self.alpha = self
					self( f18_local7, f18_local9, self )
					self:animateToState( "default", 0 )
					self:setTextStyle( CoD.TextStyle.Shadowed )
					self = LUI.UIText.new()
					self.id = "leftScoreText"
					self:registerAnimationState( "default", {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = false,
						rightAnchor = true,
						top = 73,
						left = 184,
						height = CoD.TextSettings.TitleFontBold.Height,
						font = CoD.TextSettings.TitleFontBold.Font,
						alignment = LUI.Alignment.Left,
						color = Colors.white
					} )
					self:animateToState( "default", 0 )
					self:setTextStyle( CoD.TextStyle.Shadowed )
					f18_local7 = {
						topAnchor = true,
						leftAnchor = false,
						bottomAnchor = false,
						rightAnchor = true,
						right = -73,
						top = 48,
						height = 100,
						width = 100
					}
					if f18_local3 then
						f18_local9 = 0
						if not f18_local9 then
						
						else
							f18_local7.alpha = f18_local9
							f18_local9 = LUI.FactionIcon.new( f18_local7 )
							f18_local9.id = "rightFactionIcon"
							self = LUI.UIText.new()
							self.id = "rightNameText"
							local self = self
							self = self.registerAnimationState
							local f18_local13 = "default"
							local self = {
								topAnchor = true,
								leftAnchor = true,
								bottomAnchor = false,
								rightAnchor = true,
								top = 120,
								right = -186,
								height = CoD.TextSettings.BodyFontSmall.Height,
								font = CoD.TextSettings.BodyFontSmall.Font,
								alignment = LUI.Alignment.Right,
								color = Colors.white
							}
							local f18_local15
							if f18_local3 then
								f18_local15 = 0
								if not f18_local15 then
								
								else
									self.alpha = f18_local15
									self( self, f18_local13, self )
									self:animateToState( "default", 0 )
									self:setTextStyle( CoD.TextStyle.Shadowed )
									self = LUI.UIText.new()
									self.id = "rightScoreText"
									self:registerAnimationState( "default", {
										topAnchor = true,
										leftAnchor = true,
										bottomAnchor = false,
										rightAnchor = true,
										top = 73,
										right = -184,
										height = CoD.TextSettings.TitleFontBold.Height,
										font = CoD.TextSettings.TitleFontBold.Font,
										alignment = LUI.Alignment.Right,
										color = Colors.white
									} )
									self:animateToState( "default", 0 )
									self:setTextStyle( CoD.TextStyle.Shadowed )
									self = LUI.UIElement.new( {
										topAnchor = true,
										leftAnchor = false,
										bottomAnchor = false,
										rightAnchor = false,
										left = -62,
										top = 41,
										height = 42,
										width = 125,
										alpha = 0.7,
										material = RegisterMaterial( "h1_ui_topbar_titletext_bg_not_tiled" )
									} )
									f18_arg0.headerContainer = self
									self = LUI.UIBorder.new( {
										leftAnchor = true,
										topAnchor = true,
										bottomAnchor = true,
										rightAnchor = true,
										borderThickness = 4,
										depth = CoD.Depths.Default,
										color = Colors.black,
										alpha = 0.7
									} )
									local f18_local16 = LUI.DecoFrame.new( {
										leftAnchor = true,
										topAnchor = true,
										bottomAnchor = true,
										rightAnchor = true
									} )
									local self = LUI.UIImage.new( {
										topAnchor = true,
										leftAnchor = true,
										bottomAnchor = true,
										rightAnchor = true,
										alpha = 0.7,
										material = RegisterMaterial( "h1_ui_topbar_titletext_bg_not_tiled" )
									} )
									self:addElement( self )
									self:addElement( f18_local16 )
									self:addElement( self )
									local f18_local18 = 640.5
									local f18_local19 = 293.33
									if Engine.UsingSplitscreenUpscaling() or Engine.IsPC() then
										f18_local18 = GameX.GetScreenWidth() / 2
										if f18_local18 < 640.5 then
											f18_local18 = 640.5
										end
									end
									local self = LUI.UIImage.new( {
										topAnchor = false,
										leftAnchor = false,
										bottomAnchor = true,
										rightAnchor = false,
										right = 0,
										bottom = 0,
										height = f18_local19,
										width = f18_local18,
										alpha = 1,
										material = RegisterMaterial( "h1_ui_bottombar_bg" )
									} )
									self:setup3SliceRatio( 160, 0.25 )
									local self = LUI.UIImage.new( {
										topAnchor = false,
										leftAnchor = false,
										bottomAnchor = true,
										rightAnchor = false,
										left = 0,
										bottom = 0,
										height = f18_local19,
										width = f18_local18,
										alpha = 1,
										material = RegisterMaterial( "h1_ui_bottombar_bg_right" )
									} )
									self:setup3SliceRatio( 160, 0.25 )
									local self = LUI.UIImage.new( {
										bottomAnchor = true,
										width = 310,
										height = 155,
										alpha = 1,
										top = -160,
										material = RegisterMaterial( "h1_ui_bottombar_vs_bg" )
									} )
									self.id = "versusTriangle"
									self:registerAnimationState( "nemesis", {
										material = RegisterMaterial( "h1_ui_bottombar_vs_nemesis_bg" )
									} )
									self:registerAnimationState( "hidden", {
										alpha = 0
									} )
									local self = LUI.UIImage.new( {
										bottomAnchor = true,
										height = 50.67,
										width = 45.33,
										alpha = 0,
										top = -140,
										material = RegisterMaterial( "h1_ui_nemesis_skull" )
									} )
									self.id = "nemesisSkull"
									self:registerAnimationState( "nemesis", {
										alpha = 1
									} )
									local f18_local24 = LUI.Playercard.new( {
										bottomAnchor = true,
										left = 162,
										bottom = -52,
										leftAnchor = false,
										rightAnchor = false
									} )
									f18_local24.id = "spectatorPlayerCard"
									local f18_local25 = LUI.Playercard.new( {
										bottomAnchor = true,
										left = -436,
										bottom = -52,
										leftAnchor = false,
										rightAnchor = false
									} )
									f18_local25.id = "attackerPlayerCard"
									f18_local25:registerAnimationState( "postgame", {
										bottomAnchor = true,
										bottom = -52,
										left = -138,
										width = LUI.Playercard.Width,
										height = LUI.Playercard.Height,
										leftAnchor = false,
										rightAnchor = false
									} )
									local self = LUI.UIText.new()
									self.id = "killCamVSOrNemesisText"
									self:registerAnimationState( "default", {
										topAnchor = false,
										leftAnchor = true,
										bottomAnchor = true,
										rightAnchor = true,
										bottom = -62,
										height = CoD.TextSettings.TitleFontSmall.Height,
										font = CoD.TextSettings.TitleFontSmall.Font,
										alignment = LUI.Alignment.Center,
										color = Colors.white,
										alpha = 1
									} )
									self:animateToState( "default", 0 )
									self:registerAnimationState( "nemesis", {
										topAnchor = false,
										leftAnchor = true,
										bottomAnchor = true,
										rightAnchor = true,
										bottom = -67,
										height = CoD.TextSettings.TitleFontVeryTiny.Height,
										font = CoD.TextSettings.TitleFontVeryTiny.Font,
										alignment = LUI.Alignment.Center,
										color = Colors.white,
										alpha = 1
									} )
									self:registerAnimationState( "hidden", {
										alpha = 0
									} )
									self:addElement( self )
									self:addElement( self )
									self:addElement( f18_local5 )
									self:addElement( self )
									self:addElement( self )
									self:addElement( f18_local9 )
									self:addElement( self )
									self:addElement( self )
									self:addElement( self )
									self:addElement( self )
									self:addElement( self )
									self:addElement( self )
									self:addElement( self )
									self:addElement( f18_local24 )
									self:addElement( f18_local25 )
									self:addElement( self )
									return self
								end
							end
							f18_local15 = 1
						end
					end
					f18_local9 = 1
				end
			end
			self = 1
		end
	end
	f18_local5 = 1
end

local f0_local28 = function ( f19_arg0 )
	local self = LUI.UIElement.new()
	self.id = "killCamCountDownBar"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -205,
		width = 130,
		height = CoD.TextSettings.TitleFontSmall.Height + 10,
		color = Colors.black,
		alpha = 0.4
	} )
	local f19_local2 = LUI.DecoFrame.new( {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -205,
		width = 130,
		height = CoD.TextSettings.TitleFontSmall.Height + 10,
		alpha = 1
	}, LUI.DecoFrame.Grey )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f19_local2:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f19_arg0.countdownBG = self
	f19_arg0.countdownFrame = f19_local2
	local f19_local3 = {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = -208,
		height = CoD.TextSettings.TitleFontSmall.Height,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alignment = LUI.Alignment.Center,
		alpha = 1
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f19_local3.bottom = -210
	end
	local self = LUI.UICountdown.new( {} )
	self.id = "killCamCountDownTimerText"
	self:registerAnimationState( "default", f19_local3 )
	self:animateToState( "default" )
	self:registerAnimationState( "final", {
		alpha = 0
	} )
	self:registerEventHandler( "killcam_on", function ( element, event )
		element:setEndTime( Game.GetOmnvar( "ui_killcam_end_milliseconds" ) )
	end )
	self:addElement( self )
	self:addElement( f19_local2 )
	self:addElement( self )
	return self
end

local f0_local29 = function ()
	local self = LUI.UIElement.new()
	self.id = "killCamBottom"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		right = 0,
		left = 0,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local f21_local1 = {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = 52,
		height = CoD.TextSettings.TitleFontSmall.Height,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alignment = LUI.Alignment.Center,
		alpha = 1
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f21_local1.top = 48
	end
	local self = LUI.UIText.new( f21_local1 )
	self.id = "killCamTitleText"
	self:setText( "" )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerEventHandler( "toggle_cam_header", function ( element, event )
		if event.scoreboardExists then
			element:animateToState( "active", 100 )
		else
			element:animateToState( "inactive", 100 )
		end
	end )
	local self = LUI.UIText.new()
	self.id = "killCamRespawnText"
	self:setText( "" )
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = -165,
		height = CoD.TextSettings.TitleFontSmall.Height,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alignment = LUI.Alignment.Center
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIText.new()
	self.id = "killCamCopycatText"
	self:setText( "" )
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = -35,
		right = 0,
		height = CoD.TextSettings.BodyFont.Height,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIHorizontalList.new()
	self.id = "killCamWeaponHL"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -120,
		left = 204,
		height = 64,
		width = 512,
		alignment = LUI.Alignment.Left,
		spacing = 5
	} )
	self:animateToState( "default", 0 )
	local f21_local6 = function ( f23_arg0 )
		local self = LUI.UIImage.new()
		self.id = "killCamPerk" .. f23_arg0 .. "Image"
		self:registerAnimationState( "default", {
			topAnchor = false,
			leftAnchor = true,
			bottomAnchor = false,
			rightAnchor = false,
			left = 0,
			height = 32,
			width = 32,
			alpha = 1
		} )
		self:registerAnimationState( "empty", {
			material = RegisterMaterial( "specialty_null" )
		} )
		self:animateToState( "default", 0 )
		return self
	end
	
	local f21_local7 = f21_local6( 1 )
	local f21_local8 = f21_local6( 2 )
	local f21_local9 = f21_local6( 3 )
	local self = LUI.UIElement.new()
	self.id = "weaponNameContainer"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		bottom = (CoD.TextSettings.BodyFontTiny.Height + 4) * 0.5,
		left = 0,
		width = 260,
		height = CoD.TextSettings.BodyFontTiny.Height + 4
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIText.new()
	self.id = "killCamWeaponNameText"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		bottom = CoD.TextSettings.BodyFontTiny.Height * 0.5,
		left = 2,
		height = CoD.TextSettings.BodyFontTiny.Height,
		width = 256,
		font = CoD.TextSettings.BodyFontTiny.Font,
		alignment = LUI.Alignment.Left
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIImage.new()
	self.id = "killCamWeaponNameBg"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		left = 0,
		width = 260,
		color = Colors.black,
		alpha = 0.8
	} )
	self:animateToState( "default" )
	local self = LUI.UIImage.new()
	self.id = "killCamWeaponImage"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		bottom = 0,
		left = 0,
		height = 0,
		width = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "inactive", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		bottom = 0,
		left = 0,
		height = 0,
		width = 0,
		alpha = 0
	} )
	self:addElement( f21_local7 )
	self:addElement( f21_local8 )
	self:addElement( f21_local9 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	for self = 1, f0_local6, 1 do
		local self = LUI.UIImage.new()
		self.id = "killCamAttachment" .. self
		self:registerAnimationState( "default", {
			topAnchor = false,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = false,
			bottom = 0,
			left = 0,
			height = 32,
			width = 32,
			material = f0_local5,
			alpha = 0
		} )
		self:animateToState( "default", 0 )
		self:registerAnimationState( "active", {
			alpha = 0
		} )
		self:addElement( self )
	end
	local self = LUI.UIHorizontalList.new()
	self.id = "killCamAbilitiesHL"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -26,
		left = 90,
		height = 32,
		width = 512,
		alignment = LUI.Alignment.Left,
		spacing = 0
	} )
	self:animateToState( "default", 0 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

local f0_local30 = function ()
	local self = LUI.UIElement.new()
	self.id = "killCamVictimAttacker"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnhor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 110,
		right = 0,
		height = CoD.TextSettings.BodyFont.Height,
		width = 512,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local self = LUI.UIText.new()
	self.id = "killCamVictimAttackerText"
	self:setText( "" )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Right
	} )
	self:animateToState( "default", 0 )
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "killCamHudDef", function ()
	local self = LUI.UIElement.new()
	self.id = "killCamHudId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerEventHandler( "menu_create", f0_local10 )
	self:registerOmnvarHandler( "ui_killcam_end_milliseconds", f0_local25 )
	self:registerOmnvarHandler( "ui_killcam_copycat", f0_local15 )
	self:registerOmnvarHandler( "ui_killcam_victim_or_attacker", f0_local26 )
	self:registerEventHandler( "killcam_on", MBh.AnimateToState( "active", 0 ) )
	self:registerEventHandler( "killcam_off", function ( element, event )
		local f26_local0 = MBh.DoMultiple
		local f26_local1 = {}
		local f26_local2 = MBh.AnimateToState( "default", 0 )
		local f26_local3 = MBh.EmitOmnvarUpdateEventToRoot( "ui_predator_missile" )
		f26_local0 = f26_local0( f26_local2 )
		f26_local0( element, event )
	end )
	self:addElement( f0_local27( self ) )
	self:addElement( f0_local28( self ) )
	self:addElement( f0_local29() )
	self:addElement( f0_local30() )
	local f25_local1 = 256
	local f25_local2 = not GameX.IsSplitscreen()
	local f25_local3 = GameX.IsSplitscreen() and -f25_local1 or -190
	local f25_local4 = GameX.IsSplitscreen() and -f25_local1 or -260
	local f25_local5 = GameX.IsSplitscreen() and 140 or 110
	local self = LUI.UIElement.new( {
		leftAnchor = f25_local2,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = not f25_local2,
		top = f25_local5,
		left = f25_local3,
		height = f25_local1,
		width = f25_local1
	} )
	self:registerAnimationState( "extended", {
		leftAnchor = f25_local2,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = not f25_local2,
		top = f25_local5,
		left = f25_local4,
		height = f25_local1,
		width = f25_local1
	} )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "PlayerPerkChanged", Game.GetPerkIndexForName( "specialty_moreminimap" ) )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		if Game.PlayerHasPerk( "specialty_moreminimap" ) then
			self:animateToState( "extended" )
		else
			self:animateToState( "default" )
		end
	end )
	self:addElement( self )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "talkerHudDef", {} ) )
	self:addElement( self )
	return self
end )
LockTable( _M )
