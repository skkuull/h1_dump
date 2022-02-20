local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyMapVote = InheritFrom( LUI.MPLobbyMap )
LUI.MPLobbyMapVote.DataProviders = {}
LUI.MPLobbyMapVote.DataProviders[1] = function ()
	return LUI.MPLobbyMapVote.MapVoteDataProvider( MapVoting.MapA )
end

LUI.MPLobbyMapVote.DataProviders[2] = function ()
	return LUI.MPLobbyMapVote.MapVoteDataProvider( MapVoting.MapB )
end

LUI.MPLobbyMapVote.DataProviders[3] = function ()
	return LUI.MPLobbyMapVote.RandomMapDataProvider( MapVoting.Random )
end

LUI.MPLobbyMapVote.TitleHeight = GenericButtonSettings.Styles.FlatButton.height
LUI.MPLobbyMapVote.Width = GenericMenuDims.menu_width_standard
LUI.MPLobbyMapVote.Height = 74.5
f0_local0 = function ( f4_arg0 )
	local f4_local0 = f4_arg0.memberList
	f4_arg0:processEvent( {
		name = "gamepad_button",
		button = "right",
		down = true,
		qualifier = "dpad",
		dummy = true
	} )
	f4_local0.navigation.left = nil
end

f0_local1 = function ( f5_arg0 )
	f5_arg0.memberList.navigation.left = f5_arg0.parentList
end

LUI.MPLobbyMapVote.Refresh = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0.parentList.navigation.right
	if not f6_arg0.memberList then
		f6_arg0.memberList = f6_local0
	end
	updateVoteButtons( f6_arg0 )
	if IsVotingFinished() then
		if f6_arg0:isInFocus() then
			if f6_arg0.parentList.buttonCount > 0 then
				f6_arg0:processEvent( {
					name = "gamepad_button",
					button = "up",
					down = true,
					qualifier = "dpad",
					dummy = true
				} )
			else
				f0_local0( f6_arg0 )
			end
		elseif f6_arg0.parentList.buttonCount == 0 and f6_local0.navigation.left ~= nil then
			f0_local0( f6_arg0 )
		end
		f6_arg0:makeNotFocusable()
		LUI.MPLobbyMap.Refresh( f6_arg0, f6_arg1 )
		hideUnvotedMapButtons( f6_arg0 )
		setHeaderToVotedState( f6_arg0 )
	else
		if f6_arg0.parentList.buttonCount == 0 and f6_local0.navigation.left == nil then
			f0_local1( f6_arg0 )
		end
		f6_arg0:makeFocusable()
	end
end

function updateVoteButtons( f7_arg0 )
	if f7_arg0.buttonsHid == true then
		return 
	end
	local f7_local0 = "black"
	local f7_local1 = -1
	local f7_local2 = 1
	for f7_local3 = 1, #LUI.MPLobbyMapVote.DataProviders, 1 do
		local f7_local6 = f7_arg0.buttons[f7_local3].dataProvider()
		if f7_local1 < f7_local6.votes then
			f7_local1 = f7_local6.votes
			f7_local2 = f7_local3
		end
		f7_arg0.buttons[f7_local3]:Refresh( f7_local6.name, f7_local6.gameMode, f7_local6.votes, f7_local6.image )
		f7_arg0.buttons[f7_local3]:SetColor( Colors.white )
		if f7_arg0.focusedIndex == f7_local3 then
			f7_local0 = f7_local6.image
		elseif f7_arg0.focusedIndex == nil and f7_local2 == f7_local3 then
			f7_local0 = f7_local6.image
		end
		f7_arg0.buttons[f7_local3].winning = false
	end
	f7_arg0.buttons[f7_local2]:SetColor( Colors.generic_button_text_focus_color )
	f7_arg0.buttons[f7_local2].winning = true
end

function hideUnvotedMapButtons( f8_arg0 )
	if f8_arg0.buttonsHid == true then
		return 
	end
	f8_arg0.list:closeChildren()
	local f8_local0, f8_local1 = nil
	local f8_local2 = 0
	local f8_local3 = Lobby.GetMapName()
	for f8_local4 = 1, #LUI.MPLobbyMapVote.DataProviders, 1 do
		local f8_local7 = f8_arg0.buttons[f8_local4].dataProvider()
		if f8_local3 == f8_local7.name and f8_local7.gameMode == Lobby.GameTypeNameAbbreviated() and (f8_local2 < f8_local7.votes or f8_local2 == 0) then
			f8_local2 = f8_local7.votes
			f8_local1 = f8_arg0.buttons[f8_local4]
			f8_local0 = f8_local7
		end
	end
	if f8_local0 == nil then
		for f8_local4 = 1, #LUI.MPLobbyMapVote.DataProviders, 1 do
			local f8_local7 = f8_arg0.buttons[f8_local4].dataProvider()
			if f8_local3 == f8_local7.name and f8_local7.gameMode == Lobby.GameTypeNameAbbreviated() then
				f8_local2 = f8_local7.votes
				f8_local1 = f8_arg0.buttons[f8_local4]
				f8_local0 = f8_local7
				break
			end
		end
	end
	if f8_local0 == nil then
		local f8_local4 = f8_arg0.buttons[3].dataProvider()
		f8_local2 = f8_local4.votes
		f8_local1 = f8_arg0.buttons[3]
		f8_local0 = f8_local4
	end
	f8_arg0.list:addElement( f8_local1 )
	f8_local1:Refresh( f8_local0.name, f8_local0.gameMode, f8_local0.votes, f8_local0.image, true )
	f8_local1:SetColor( Colors.white )
	f8_arg0.buttonsHid = true
end

function setHeaderToVotedState( f9_arg0 )
	f9_arg0:SetHeaderToVotedState()
end

LUI.MPLobbyMapVote.MapVoteDataProvider = function ( f10_arg0 )
	return {
		name = Lobby.GetVoteMapName( f10_arg0.refNum ),
		image = Lobby.GetVoteMapImage( f10_arg0.refNum ),
		gameMode = Lobby.GetVoteMapGametype( f10_arg0.refNum ),
		votes = Engine.GetDvarInt( f10_arg0.votesDvar )
	}
end

LUI.MPLobbyMapVote.RandomMapDataProvider = function ( f11_arg0 )
	return {
		name = Engine.Localize( "@LUA_MENU_RANDOM" ),
		image = "s1_preview_mp_random",
		gameMode = nil,
		votes = Engine.GetDvarInt( f11_arg0.votesDvar )
	}
end

LUI.MPLobbyMapVote.OnButtonOver = function ( f12_arg0, f12_arg1 )
	f12_arg0.mapWidget.focusedIndex = f12_arg0.index
	f12_arg0.mapWidget:Refresh()
end

LUI.MPLobbyMapVote.GamepadButton = function ( f13_arg0, f13_arg1 )
	local f13_local0 = false
	if IsVotingFinished() == false then
		f13_local0 = f13_arg0:dispatchEventToChildren( f13_arg1 )
	end
	if not f13_local0 then
		f13_local0 = f13_arg0:handleGamepadButton( f13_arg1 )
	end
	return f13_local0
end

LUI.MPLobbyMapVote.ListGainFocus = function ( f14_arg0, f14_arg1 )
	local f14_local0 = nil
	if f14_arg1.button == "down" then
		f14_local0 = f14_arg0:getFirstChild()
	elseif f14_arg1.button == "up" then
		f14_local0 = f14_arg0:getLastChild()
	else
		f14_arg0:restoreState()
	end
	if f14_arg0.mapWidget.parentList.buttonCount == 0 and not f14_arg0.mapWidget.focusedIndex then
		f14_local0 = f14_arg0:getFirstChild()
	end
	if f14_local0 ~= nil then
		f14_local0:processEvent( f14_arg1 )
	end
end

LUI.MPLobbyMapVote.ListLoseFocus = function ( f15_arg0, f15_arg1 )
	LUI.UIElement.loseFocus( f15_arg0, f15_arg1 )
	f15_arg0.mapWidget.focusedIndex = nil
	f15_arg0.mapWidget:Refresh()
end

LUI.MPLobbyMapVote.VoteForMap = function ( f16_arg0, f16_arg1 )
	if Engine.GetMilliseconds then
		local f16_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f16_arg0 )
		if f16_local0.voteDelayEndTime and Engine.GetMilliseconds() < f16_local0.voteDelayEndTime then
			local f16_local1 = f16_local0.voteCount or 1
			return 
		elseif not f16_local0.voteCount then
			f16_local0.voteCount = 1
		elseif f16_local0.voteCount < 6 then
			f16_local0.voteCount = f16_local0.voteCount + 1
		end
		f16_local0.voteDelayEndTime = Engine.GetMilliseconds() + 1000 * f16_local0.voteCount
	end
	Engine.ExecNow( "xpartyvote " .. tostring( f16_arg0.index ), f16_arg1.controller )
	f16_arg0.mapWidget:Refresh()
end

LUI.MPLobbyMapVote.new = function ()
	local f17_local0 = LUI.MPLobbyMap.new( nil, CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), true )
	f17_local0:setClass( LUI.MPLobbyMapVote )
	f17_local0:makeFocusable()
	f17_local0:registerEventHandler( "gamepad_button", LUI.MPLobbyMapVote.GamepadButton )
	local f17_local1 = CoD.CreateState( 0, -2, LUI.MPLobbyMapVote.Width, LUI.MPLobbyMapVote.Height - 2, CoD.AnchorTypes.TopLeft )
	f17_local1.alpha = 1
	f17_local1.spacing = 3
	f17_local1.left = -1
	local self = LUI.UIVerticalList.new( f17_local1 )
	self.id = "lobby_map_list"
	self.noWrap = true
	self.mapWidget = f17_local0
	self:registerEventHandler( "gain_focus", LUI.MPLobbyMapVote.ListGainFocus )
	self:registerEventHandler( "lose_focus", LUI.MPLobbyMapVote.ListLoseFocus )
	self:registerAnimationState( "default", f17_local1 )
	f17_local0.list = self
	f17_local0:addElement( self )
	f17_local0.buttons = {}
	for f17_local3 = 1, #LUI.MPLobbyMapVote.DataProviders, 1 do
		local f17_local6 = LUI.MPLobbyMapVoteButton.new()
		f17_local6.id = "map_vote_button_" .. f17_local3
		f17_local6.votes = 0
		f17_local6.index = f17_local3
		f17_local6.mapWidget = f17_local0
		f17_local6.dataProvider = LUI.MPLobbyMapVote.DataProviders[f17_local3]
		f17_local6:addEventHandler( "button_over", LUI.MPLobbyMapVote.OnButtonOver )
		f17_local6:addEventHandler( "button_action", LUI.MPLobbyMapVote.VoteForMap )
		self:addElement( f17_local6 )
		f17_local0.buttons[#f17_local0.buttons + 1] = f17_local6
	end
	updateVoteButtons( f17_local0 )
	if IsVotingFinished() then
		hideUnvotedMapButtons( f17_local0 )
		setHeaderToVotedState( f17_local0 )
	else
		f17_local0:registerEventHandler( "refresh", LUI.MPLobbyMapVote.Refresh )
	end
	return f17_local0
end

LockTable( _M )
