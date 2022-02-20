local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.MutePlayers = InheritFrom( LUI.MenuTemplate )
f0_local0 = 24
f0_local1 = 500
f0_local2 = Colors.mp.aar_score_gold
local f0_local3 = Colors.mp.ally_row_bg_color
function buildAllPlayersList( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	if f1_arg1 then
		for f1_local1 = 1, #f1_arg0, 1 do
			f1_local0[f1_arg0[f1_local1]] = {}
		end
	else
		f1_local0[1] = {}
	end
	local f1_local1 = Game.GetPlayerClientnum()
	local f1_local2 = Game.GetAllPlayers()
	for f1_local3 = 1, #f1_local2, 1 do
		local f1_local6 = f1_local2[f1_local3]
		local f1_local7 = nil
		local f1_local8 = false
		for f1_local9 = 1, #f1_arg0, 1 do
			if f1_local6.team == f1_arg0[f1_local9] then
				f1_local8 = true
				f1_local7 = f1_local0[f1_local6.team]
				break
			end
		end
		if f1_local8 then
			if not f1_arg1 then
				f1_local7 = f1_local0[1]
			end
			local f1_local9 = {
				team = f1_local6.team,
				rankIcon = f1_local6.rankMat,
				rank = Rank.GetRankDisplay( f1_local6.rank ),
				clientNum = f1_local6.clientNum,
				name = f1_local6.name,
				isActive = true,
				isPlayer = f1_local6.clientNum == f1_local1
			}
			local f1_local10 = Game.IsPlayerMuted( f1_local6.clientNum )
			if f1_local9.isPlayer then
				
			else
				
			end
			f1_local9.isPlayerMuted = f1_local10
			f1_local7[#f1_local7 + 1] = f1_local9
		end
	end
	return f1_local0
end

local f0_local4 = function ( f2_arg0 )
	local f2_local0
	if f2_arg0 ~= Game.GetPlayerClientnum() then
		f2_local0 = Game.CanChangePlayerMute( f2_arg0 )
	else
		f2_local0 = false
	end
	return f2_local0
end

local f0_local5 = function ( f3_arg0 )
	f3_arg0.isMuted = true
	f3_arg0.muteIcon:animateToState( "muted" )
	f3_arg0.muteText:animateToState( "visible" )
end

local f0_local6 = function ( f4_arg0 )
	f4_arg0.isMuted = false
	f4_arg0.muteIcon:animateToState( "unmuted" )
	f4_arg0.muteText:animateToState( "hidden" )
end

local f0_local7 = function ( f5_arg0 )
	f5_arg0.allMuted = true
	Game.MuteAllPlayers()
	for f5_local0 = 1, #f5_arg0.buttons, 1 do
		local f5_local3 = f5_arg0.buttons[f5_local0]
		if not f5_local3.notMutable then
			f0_local5( f5_local3 )
		end
	end
end

local f0_local8 = function ( f6_arg0 )
	f6_arg0.allMuted = false
	f6_arg0.allMutedButFriends = false
	f6_arg0.allMutedButParty = false
	Game.UnmuteAllPlayers()
	for f6_local0 = 1, #f6_arg0.buttons, 1 do
		local f6_local3 = f6_arg0.buttons[f6_local0]
		if not f6_local3.notMutable then
			f0_local6( f6_local3 )
		end
	end
end

local f0_local9 = function ( f7_arg0 )
	for f7_local0 = 1, #f7_arg0.buttons, 1 do
		local f7_local3 = f7_arg0.buttons[f7_local0]
		if not f7_local3.notMutable and f7_local3.properties.clientNum ~= nil and Game.IsPlayerMuted( f7_local3.properties.clientNum ) then
			f0_local5( f7_local3 )
		end
	end
end

local f0_local10 = function ( f8_arg0 )
	Game.MuteAllPlayersButFriends()
	f0_local9( f8_arg0 )
end

local f0_local11 = function ( f9_arg0 )
	Game.MuteAllPlayersButParty()
	f0_local9( f9_arg0 )
end

local f0_local12 = function ( f10_arg0 )
	if f0_local4( f10_arg0.properties.clientNum ) then
		if f10_arg0.isMuted then
			f0_local6( f10_arg0 )
		else
			f0_local5( f10_arg0 )
		end
	end
end

function addToggleMuteButton( f11_arg0 )
	LUI.ButtonHelperText.AddHelperTextObject( f11_arg0.help, {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@XBOXLIVE_PLAYER_MUTE" ),
		side = "left",
		clickable = true,
		priority = -1000
	} )
end

function addViewGamercardButton( f12_arg0 )
	if Engine.IsConsoleGame() or Engine.IsPCApp() then
		LUI.ButtonHelperText.AddHelperTextObject( f12_arg0.help, {
			name = "add_button_helper_text",
			button_ref = "button_alt2",
			helper_text = Engine.Localize( "@XBOXLIVE_VIEW_PROFILE" ),
			side = "right",
			clickable = true,
			priority = -1000
		}, function ( f13_arg0, f13_arg1 )
			local f13_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f13_arg0 )
			if f13_local0.activeClientNum ~= nil then
				f13_local0 = Friends.ShowPlayerGamercard
				local f13_local1 = f13_arg1.controller
				local f13_local2 = LUI.FlowManager.GetMenuScopedDataFromElement( f13_arg0 )
				f13_local0( f13_local1, f13_local2.activeClientNum )
			end
		end )
	end
end

function createButtonHighlight()
	local self = LUI.UIElement.new( {
		width = f0_local1 + 4,
		topAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Highlight ) )
	return self
end

function updateAvailableButtons( f15_arg0, f15_arg1 )
	if not f0_local4( f15_arg1 ) then
		LUI.ButtonHelperText.AddHelperTextObject( f15_arg0.help, {
			name = "add_button_helper_text",
			button_ref = "button_action",
			helper_text = "",
			side = "left"
		} )
		if Engine.IsConsoleGame() or Engine.IsPCApp() then
			LUI.ButtonHelperText.AddHelperTextObject( f15_arg0.help, {
				name = "add_button_helper_text",
				button_ref = "button_alt2",
				helper_text = "",
				side = "right"
			} )
		end
	else
		addToggleMuteButton( f15_arg0 )
		addViewGamercardButton( f15_arg0 )
	end
end

local f0_local13 = function ( f16_arg0, f16_arg1 )
	if f16_arg0.isPlayer then
		Engine.PlaySound( CoD.SFX.DenySelect )
		return 
	end
	local f16_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f16_arg0 )
	if f16_local0.activeClientNum and f0_local4( f16_local0.activeClientNum ) then
		Game.TogglePlayerMute( f16_local0.activeClientNum )
		f0_local12( f16_arg0 )
		Engine.PlaySound( CoD.SFX.MouseClick )
	else
		Engine.PlaySound( CoD.SFX.DenySelect )
	end
	for f16_local1 = 1, #f16_arg0.menu.buttons, 1 do
		local f16_local4 = f16_arg0.menu.buttons[f16_local1]
		if not f16_local4.notMutable and f16_local4.properties.clientNum ~= nil then
			if Game.IsPlayerMuted( f16_local4.properties.clientNum ) then
				f0_local5( f16_local4 )
			else
				f0_local6( f16_local4 )
			end
		end
	end
end

local f0_local14 = function ( f17_arg0, f17_arg1 )
	if not f17_arg0.highlight then
		local f17_local0 = createButtonHighlight()
		f17_arg0.highlight = f17_local0
		f17_arg0:addElement( f17_local0 )
	end
	local f17_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f17_arg0 )
	f17_local0.activeClientNum = f17_arg0.properties.clientNum
	updateAvailableButtons( f17_arg0.menu, f17_local0.activeClientNum )
end

local f0_local15 = function ( f18_arg0, f18_arg1 )
	if f18_arg0.highlight then
		f18_arg0:removeElement( f18_arg0.highlight )
		f18_arg0.highlight = nil
	end
end

local f0_local16 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		height = f0_local0
	} )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.black
	} ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 7,
		leftAnchor = true,
		left = 7,
		color = Colors.white,
		height = 11,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:addElement( self )
	self:setText( f19_arg0 )
	local f19_local2, f19_local3, f19_local4, f19_local5 = GetTextDimensions( f19_arg1, CoD.TextSettings.BodyFont.Font, 14 )
	local f19_local6 = f19_local4 - f19_local2
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		left = f0_local1 - f19_local6 + 15,
		spacing = 5,
		topAnchor = true,
		bottomAnchor = true
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 7,
		color = Colors.h1.medium_grey,
		height = 11,
		width = f19_local6,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( f19_arg1 )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		height = 12,
		width = 3,
		material = RegisterMaterial( "white" ),
		color = f19_arg2
	} ) )
	if Game.GetPlayerTeam() == Teams.spectator then
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self:animateToState( "hidden" )
	end
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		alpha = 0.6,
		height = 0.5,
		color = Colors.h1.medium_grey
	} ) )
	return self
end

local f0_local17 = function ( f20_arg0 )
	local f20_local0 = 0
	local f20_local1 = 0
	local f20_local2 = {}
	local self = LUI.UIElement.new( {
		width = f0_local1,
		topAnchor = true,
		top = 150
	} )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "white" ),
		color = f0_local3
	} ) )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	local f20_local5 = nil
	local f20_local6 = Engine.GetDvarString( "ui_gametype" )
	local f20_local7 = Game.GetPlayerTeam()
	if GameX.gameModeIsFFA( f20_local6 ) or f20_local7 == Teams.spectator or Engine.IsAliensMode() then
		f20_local5 = buildAllPlayersList( {
			Teams.free,
			Teams.allies,
			Teams.axis,
			Teams.spectator
		} )
	else
		f20_local5 = buildAllPlayersList( {
			Teams.allies,
			Teams.axis,
			Teams.spectator
		}, true )
	end
	local f20_local8 = assert
	local f20_local9
	if 0 >= #f20_local5 or #f20_local5 >= 4 then
		f20_local9 = false
	else
		f20_local9 = true
	end
	f20_local8( f20_local9 )
	f20_local8 = ""
	f20_local9 = ""
	local f20_local10 = Colors.blue
	local f20_local11 = Colors.red
	local f20_local12 = nil
	if f20_local7 == Teams.allies then
		f20_local8 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) )
		f20_local9 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) )
		f20_local12 = Teams.axis
	elseif f20_local7 == Teams.axis then
		f20_local8 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) )
		f20_local9 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) )
		f20_local12 = Teams.allies
	elseif f20_local7 == Teams.spectator then
		f20_local8 = Engine.ToUpperCase( Engine.Localize( "@MENU_PLAYERS" ) )
	end
	self:addElement( f0_local16( Engine.ToUpperCase( f20_local8 ), Engine.Localize( "@LUA_MENU_TEAM_CAPS" ), f20_local10, false ) )
	f20_local1 = f20_local1 + 1
	local f20_local13 = 1
	local f20_local14 = nil
	if f20_local7 == Teams.spectator or GameX.gameModeIsFFA( f20_local6 ) then
		f20_local14 = f20_local5[1]
	else
		f20_local14 = f20_local5[f20_local7]
	end
	if f20_local14 and 0 < #f20_local14 then
		for f20_local15 = 1, #f20_local14, 1 do
			local f20_local18 = f20_local14[f20_local15]
			if f20_local18.isActive then
				local f20_local19 = createListRow( scoped, f20_local13, f20_local18, f20_arg0 )
				f20_local0 = f20_local0 + 1
				f20_local19.id = "playerBtn_" .. f20_local13
				self:addElement( f20_local19 )
				f20_local2[f20_local13] = f20_local19
				f20_local13 = f20_local13 + 1
			end
		end
	end
	local f20_local15 = f20_local5[f20_local12]
	if f20_local15 and 0 < #f20_local15 then
		self:addElement( f0_local16( Engine.ToUpperCase( f20_local9 ), Engine.Localize( "@LUA_MENU_OPPOSING_TEAM_CAPS" ), f20_local11, true ) )
		f20_local1 = f20_local1 + 1
		for f20_local17 = 1, #f20_local15, 1 do
			local f20_local21 = f20_local15[f20_local17]
			if f20_local21.isActive then
				local f20_local22 = createListRow( scoped, f20_local13, f20_local21, f20_arg0 )
				f20_local2[f20_local13] = f20_local22
				f20_local0 = f20_local0 + 1
				f20_local22.id = "playerBtn_" .. f20_local13
				self:addElement( f20_local22 )
				f20_local13 = f20_local13 + 1
			end
		end
	end
	local f20_local16 = f20_local5[3]
	if f20_local16 and 0 < #f20_local16 then
		self:addElement( f0_local16( Engine.Localize( "@LUA_MENU_SPECTATOR_CAPS" ), Engine.Localize( "@LUA_MENU_SPECTATOR_CAPS" ), Colors.yellow, true ) )
		f20_local1 = f20_local1 + 1
		for f20_local20 = 1, #f20_local16, 1 do
			local f20_local22 = f20_local16[f20_local20]
			if f20_local22.isActive then
				local f20_local23 = createListRow( scoped, f20_local13, f20_local22, f20_arg0 )
				f20_local2[f20_local13] = f20_local23
				f20_local0 = f20_local0 + 1
				f20_local23.id = "playerBtn_" .. f20_local13
				self:addElement( f20_local23 )
				f20_local13 = f20_local13 + 1
			end
		end
	end
	self:registerAnimationState( "updateHeight", {
		height = (f20_local0 + f20_local1) * f0_local0
	} )
	self:animateToState( "updateHeight" )
	self.totalNumButtons = f20_local0
	f20_arg0.buttons = f20_local2
	self:addElement( self )
	self:processEvent( {
		name = "gain_focus"
	} )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	return self
end

local f0_local18 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg0 or {}
	local f21_local1 = CoD.TextSettings.BodyFont
	local self = LUI.UIButton.new( f21_arg0 )
	self.menu = f21_arg1
	self.properties = f21_arg0
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = f0_local0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:registerEventHandler( "button_over", f0_local14 )
	self:registerEventHandler( "button_up", f0_local15 )
	self:registerEventHandler( "button_action", f0_local13 )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		color = f0_local3
	} )
	self:animateToState( "default" )
	self.id = "background"
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		alpha = 0.6,
		height = 0.5,
		color = Colors.h1.medium_grey
	} ) )
	local self = LUI.UIHorizontalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 4,
		right = 0,
		alignment = LUI.HorizontalAlignment.Left,
		spacing = 40
	} )
	self.id = "lhs"
	self:addElement( self )
	if not IsMLGMatch() then
		local self = LUI.UIImage.new( {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			height = 21,
			width = 21,
			material = f21_local0.rankIcon
		} )
		self.id = "rankIcon"
		self:addElement( self )
		local self = LUI.UIText.new( {
			alignment = LUI.Alignment.Center,
			topAnchor = true,
			top = 5,
			width = 16,
			height = 16,
			font = f21_local1.Font,
			color = f0_local2
		} )
		self.id = "rankNumber"
		self:setText( f21_local0.rankNumber or 0 )
		self:addElement( self )
	end
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		height = 18,
		width = 18,
		material = RegisterMaterial( "white" )
	} )
	self.isMuted = f21_local0.isPlayerMuted and f21_local0.isPlayerMuted or false
	self:registerAnimationState( "unmuted", {
		material = RegisterMaterial( "icon_online_chat_quiet" )
	} )
	self:registerAnimationState( "muted", {
		material = RegisterMaterial( "icon_online_chat_mute_quiet" )
	} )
	self:registerAnimationState( "locked", {
		material = RegisterMaterial( "s1_icon_locked_full" ),
		color = Colors.h1.light_grey,
		alpha = 0.5
	} )
	self.muteIcon = self
	self.id = "statusIcon"
	self:addElement( self )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		top = 6,
		font = f21_local1.Font,
		height = 13,
		color = Colors.white
	} )
	self.id = "gamertag"
	self:setText( f21_local0.name )
	self:addElement( self )
	self:registerAnimationState( "locked", {
		color = Colors.h1.light_grey,
		alpha = 0.5
	} )
	local self = LUI.UIText.new( {
		rightAnchor = true,
		topAnchor = true,
		top = 6,
		font = f21_local1.Font,
		height = 13,
		color = Colors.red,
		alpha = 0,
		right = -8
	} )
	self:setText( Engine.Localize( "@MP_MUTED" ) )
	self.muteText = self
	self.muteText:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self.muteText:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:addElement( self )
	if f21_arg0.isPlayerMuted and not f21_arg0.isPlayer then
		self:animateToState( "muted" )
		self:animateToState( "visible" )
	else
		self:animateToState( "unmuted" )
		self:animateToState( "hidden" )
	end
	if f21_arg0.isPlayer or not f0_local4( f21_arg0.clientNum ) then
		self.notMutable = true
		self:animateToState( "locked" )
		self:animateToState( "locked" )
	end
	return self
end

function createListRow( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
	return f0_local18( {
		id = "playerBtn_" .. f22_arg1,
		name = f22_arg2.name,
		rankNumber = f22_arg2.rank,
		rankIcon = f22_arg2.rankIcon,
		clientNum = f22_arg2.clientNum,
		listIndex = f22_arg1,
		firstItem = f22_arg1 == 1,
		isPlayer = f22_arg2.isPlayer,
		isPlayerMuted = f22_arg2.isPlayerMuted
	}, f22_arg3 )
end

function addBottomButtons( f23_arg0 )
	f23_arg0:AddBackButton()
	local f23_local0 = LUI.ButtonHelperText.AddHelperTextObject( f23_arg0.help, {
		name = "add_button_helper_text",
		button_ref = "button_start",
		helper_text = Engine.Localize( "@LUA_MENU_MUTE_ALL" ),
		side = "right",
		clickable = true,
		priority = 12000
	}, function ( f24_arg0, f24_arg1 )
		f0_local7( f23_arg0 )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	local f23_local1 = LUI.ButtonHelperText.AddHelperTextObject( f23_arg0.help, {
		name = "add_button_helper_text",
		button_ref = "button_select",
		helper_text = Engine.Localize( "@LUA_MENU_UNMUTE_ALL" ),
		side = "right",
		clickable = true,
		priority = 11000
	}, function ( f25_arg0, f25_arg1 )
		f0_local8( f23_arg0 )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	if Engine.GetOnlineGame() == true then
		local f23_local2 = nil
		if Engine.IsVita( f23_arg0.exclusiveController ) then
			f23_local2 = "button_shoulderr_vita"
		end
		local f23_local3 = LUI.ButtonHelperText.AddHelperTextObject( f23_arg0.help, {
			name = "add_button_helper_text",
			button_ref = "button_shoulderl",
			button_ref_vita = f23_local2,
			helper_text = Engine.Localize( "@LUA_MENU_MUTE_ALL_BUT_FRIENDS" ),
			side = "right",
			clickable = true,
			priority = 10000
		}, function ( f26_arg0, f26_arg1 )
			f0_local10( f23_arg0 )
			Engine.PlaySound( CoD.SFX.MouseClick )
		end )
	end
	local f23_local2 = nil
	if Engine.IsVita( f23_arg0.exclusiveController ) then
		f23_local2 = "button_shoulderl_vita"
	end
	local f23_local3 = LUI.ButtonHelperText.AddHelperTextObject( f23_arg0.help, {
		name = "add_button_helper_text",
		button_ref = "button_shoulderr",
		button_ref_vita = f23_local2,
		helper_text = Engine.Localize( "@LUA_MENU_MUTE_ALL_BUT_PARTY" ),
		side = "right",
		clickable = true,
		priority = 9000
	}, function ( f27_arg0, f27_arg1 )
		f0_local11( f23_arg0 )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
end

LUI.MutePlayers.new = function ( f28_arg0 )
	local f28_local0 = LUI.MenuTemplate.new( f28_arg0, {
		menu_title = "@LUA_MENU_MUTE_PLAYERS_CAPS",
		do_not_add_friends_helper = true
	} )
	f28_local0:setClass( LUI.MutePlayers )
	addBottomButtons( f28_local0, true, true, true )
	f28_local0:addElement( f0_local17( f28_local0 ) )
	return f28_local0
end

LUI.MenuBuilder.registerType( "MutePlayers", LUI.MutePlayers.new )
LockTable( _M )
