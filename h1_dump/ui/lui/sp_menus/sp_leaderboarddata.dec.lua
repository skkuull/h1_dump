local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 10
f0_local1 = {
	{
		value = "TRK_ALLTIME",
		display = Engine.Localize( "@LUA_MENU_LB_FILTER_DURATION_ALLTIME" )
	},
	{
		value = "TRK_WEEKLY",
		display = Engine.Localize( "@LUA_MENU_LB_FILTER_DURATION_WEEKLY" )
	},
	{
		value = "TRK_MONTHLY",
		display = Engine.Localize( "@LUA_MENU_LB_FILTER_DURATION_MONTHLY" )
	}
}
f0_local2 = {
	{
		value = "none",
		display = Engine.Localize( "@LUA_MENU_PLAYERS_FILTER" ) .. Engine.Localize( "@LUA_MENU_LB_FILTER_GROUP_ALL" )
	},
	{
		value = "friends",
		display = Engine.Localize( "@LUA_MENU_PLAYERS_FILTER" ) .. Engine.Localize( "@LUA_MENU_LB_FILTER_GROUP_FRIENDS" )
	}
}
if Engine.IsRightToLeftLanguage() then
	f0_local2 = {
		{
			value = "none",
			display = Engine.Localize( "@LUA_MENU_LB_FILTER_GROUP_ALL" ) .. Engine.Localize( "@LUA_MENU_PLAYERS_FILTER" )
		},
		{
			value = "friends",
			display = Engine.Localize( "@LUA_MENU_LB_FILTER_GROUP_FRIENDS" ) .. Engine.Localize( "@LUA_MENU_PLAYERS_FILTER" )
		}
	}
end
local f0_local3 = {
	{
		display = Engine.Localize( "@LUA_MENU_TOP" )
	}
}
local f0_local4 = nil
local f0_local5 = {
	socialFilter = 1,
	durationFilter = 1,
	isBusy = false,
	isNewFilter = false,
	playerRank = -1,
	startValue = -1,
	selectedRow = -1,
	isTimeTrial = false,
	currentPlayerCount = 0,
	exitedWhileUpdating = false,
	currentPlayerRow = -1,
	currentPlayerIndex = -1,
	fetchingShown = false
}
local f0_local6 = 572
local f0_local7 = 27
local f0_local8 = 12
local f0_local9 = 7.5
local f0_local10 = 5
function SPLeaderboardDataCanShowSelectButton()
	local f1_local0 = Engine.IsXB3()
	if not f1_local0 then
		f1_local0 = Engine.IsPS4()
	end
	return f1_local0
end

function SPLeaderboardDataUpdateStatus( f2_arg0, f2_arg1 )
	if f2_arg1.playerIndex then
		f0_local5.currentPlayerIndex = f2_arg1.playerIndex + 1
	end
	if f2_arg1.isUpdating then
		SPLeaderboardDataShowFetching( f2_arg0, f2_arg1.controller )
		f0_local5.isBusy = true
	else
		SPLeaderboardDataRefresh( f2_arg0 )
		f0_local5.isBusy = false
	end
end

function SPLeaderboardDataReadDelay( f3_arg0, f3_arg1 )
	SPLeaderboardDataShowFetching( f3_arg0, f3_arg1.controller )
	f0_local5.isBusy = true
	if f3_arg0.leaderboardRefreshRetryTimer ~= nil then
		LUI.UITimer.Reset( f3_arg0.leaderboardRefreshRetryTimer )
	else
		local self = LUI.UITimer.new( 1000, "leaderboardRefreshRetry", nil, false )
		self.id = "leaderboardRefreshRetry"
		f3_arg0:registerEventHandler( "leaderboardRefreshRetry", function ( element, event )
			if Leaderboards.IsUpdating() then
				return 
			else
				f0_local5.isBusy = false
				event.timer:close()
				element.leaderboardRefreshRetryTimer = nil
				Leaderboards.UpdateLeaderboard( element.exclusiveController, Leaderboards.GetOffset( element.exclusiveController ) )
			end
		end )
		f3_arg0:addElement( self )
		f3_arg0.leaderboardRefreshRetryTimer = self
	end
end

function GetRowFromRank( f5_arg0 )
	return f5_arg0 - f0_local5.startValue + 1
end

function SPLeaderboardDataFillRow( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6, f6_arg7 )
	local f6_local0 = f6_arg1:getChildById( "background" )
	f6_local0:setImage( RegisterMaterial( f6_arg5 ) )
	local f6_local1
	if f6_arg7 then
		f6_local1 = "^3"
		if not f6_local1 then
		
		else
			local f6_local2 = f6_local0:getChildById( "rank" )
			f6_local2:setText( f6_local1 .. f6_arg2 )
			if f6_arg7 then
				f6_arg3 = Engine.GetUsernameByController( f6_arg0.properties.exclusiveController )
			end
			if f6_arg3 then
				local f6_local3 = f6_local0:getChildById( "name" )
				f6_local3:setText( f6_local1 .. f6_arg3 )
			end
			local f6_local3 = f6_local0:getChildById( "score" )
			f6_local3:setText( f6_local1 .. f6_arg4 )
			if f6_arg6 then
				f6_arg1.m_focusable = true
			end
			f6_arg1:setAlpha( 1 )
		end
	end
	f6_local1 = ""
end

function SPLeaderboardDataFillRankRow( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	local f7_local0 = f7_arg0.list:getChildById( "row" .. f7_arg1 )
	local f7_local1 = "h1_leaderboard_row01"
	if f7_arg1 % 2 == 1 then
		f7_local1 = "h1_leaderboard_row02"
	end
	local f7_local2
	if f0_local5.playerRank == nil or f0_local5.playerRank <= 0 then
		f7_local2 = false
	else
		f7_local2 = true
	end
	local f7_local3
	if f7_arg1 == f0_local5.currentPlayerRow then
		f7_local3 = f7_local2
	else
		f7_local3 = false
	end
	SPLeaderboardDataFillRow( f7_arg0, f7_local0, f7_arg2, f7_arg3, f7_arg4, f7_local1, true, f7_local3 )
end

function SPLeaderboardDataFillPlayerRow( f8_arg0 )
	local f8_local0 = f8_arg0.list:getChildById( "playerHeader" )
	local f8_local1 = Leaderboards.GetPlayerValue( f8_arg0.properties.exclusiveController, 0 )
	if f8_local1 then
		SPLeaderboardDataFillRow( f8_arg0, f8_local0, f8_local1, playerName, Leaderboards.GetPlayerValue( f8_arg0.properties.exclusiveController, 2 ), "h1_leaderboard_rowplayer", false, false )
	end
	f8_local0:setAlpha( 1 )
end

function disableRow( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0.list:getChildById( "row" .. f9_arg1 )
	f9_local0.m_focusable = false
	f9_local0:setAlpha( 0 )
end

function SPLeaderboardCreateRow( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4, f10_arg5, f10_arg6, f10_arg7, f10_arg8 )
	local self = LUI.UIButton.new( CoD.CreateState( 0, 0, f0_local6, f0_local7, CoD.AnchorTypes.TopLeft ) )
	if not SPLeaderboardDataCanShowSelectButton() then
		self.properties = {
			muteAction = true
		}
	end
	self.id = f10_arg1
	self.m_focusable = false
	self.m_ignoreMouseFocus = false
	self:setAlpha( f10_arg2 )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		alpha = 1
	} )
	self.id = "background"
	if f10_arg3 then
		self:setImage( RegisterMaterial( f10_arg3 ) )
	end
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		font = CoD.TextSettings.Font14.Font,
		color = f10_arg7,
		alignment = LUI.Alignment.Center,
		width = 142,
		top = f0_local9,
		height = f0_local8
	} )
	self.id = "rank"
	if f10_arg4 then
		self:setText( f10_arg4 )
	end
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		font = CoD.TextSettings.Font14.Font,
		color = f10_arg7,
		alignment = LUI.Alignment.Center,
		left = 147,
		width = 270,
		top = f0_local9,
		height = f0_local8
	} )
	self.id = "name"
	if Engine.IsPC() then
		self:setupAutoScaleText()
	end
	if f10_arg5 then
		self:setText( f10_arg5 )
	end
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		font = CoD.TextSettings.Font14.Font,
		color = f10_arg7,
		alignment = LUI.Alignment.Center,
		left = 422,
		width = 142,
		top = f0_local9,
		height = f0_local8
	} )
	self.id = "score"
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		color = Colors.h1.dark_grey,
		left = 142,
		width = 1
	} )
	self.id = "leftLine"
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		color = Colors.h1.dark_grey,
		left = 422,
		width = 1
	} )
	self.id = "rightLine"
	if f10_arg6 then
		self:setText( f10_arg6 )
	end
	if f10_arg8 then
		self:registerAnimationState( "default", {
			color = f10_arg7
		} )
		self:registerAnimationState( "focused", {
			color = f10_arg8
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 133 ) )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 133 ) )
		self:registerAnimationState( "default", {
			color = f10_arg7
		} )
		self:registerAnimationState( "focused", {
			color = f10_arg8
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 133 ) )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 133 ) )
		self:registerAnimationState( "default", {
			color = f10_arg7
		} )
		self:registerAnimationState( "focused", {
			color = f10_arg8
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 133 ) )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 133 ) )
	end
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	f10_arg0.list:addElement( self )
	return self
end

function HandleRowAction( f11_arg0, f11_arg1 )
	if Engine.IsConsoleGame() or Engine.IsPCApp() then
		Leaderboards.ShowGamercard( f11_arg1.controller, 0 )
	end
end

function SPLeaderboardDataAddRow( f12_arg0, f12_arg1 )
	local f12_local0 = SPLeaderboardCreateRow( f12_arg0, "row" .. f12_arg1, 0, nil, nil, nil, nil, Colors.h1.second_medium_grey, Colors.white )
	local f12_local1 = f12_local0:getChildById( "background" )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		color = Colors.grey,
		alpha = 0,
		alignment = LUI.Alignment.Center,
		material = RegisterMaterial( "btn_focused_rect_innerglow" )
	} )
	self:setup9SliceImage( 6.67, 6.67, 0.2, 0.2 )
	self:registerAnimationState( "default", {
		alpha = 0
	} )
	self:registerAnimationState( "focused", {
		alpha = 1
	} )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "focused", 133 ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 133 ) )
	f12_local1:addElement( self )
	f12_local1:registerEventHandler( "button_action", HandleRowAction )
	f12_arg0.list:addElement( f12_local0 )
	LUI.UIVerticalList.SetNoWrap( f12_arg0.list, true )
	return f12_local0
end

function SPLeaderboardDataAddPlayerHeader( f13_arg0, f13_arg1 )
	local f13_local0 = Engine.GetUsernameByController( f13_arg1 )
	local f13_local1 = "0"
	if f0_local5.isTimeTrial then
		f13_local1 = Engine.Localize( "--:--" )
	end
	local f13_local2 = SPLeaderboardCreateRow( f13_arg0, "playerHeader", 0, "h1_leaderboard_rowplayer", Engine.Localize( "@LUA_MENU_LB_UNRANKED" ), f13_local0, f13_local1, Colors.h1.yellow, nil )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		color = Colors.grey_4,
		bottom = -2,
		height = 1
	} )
	self.id = "doubleLine"
	f13_local2:addElement( self )
	return f13_local2
end

function SPLeaderboardDataAddHeader( f14_arg0 )
	local f14_local0 = ""
	if f0_local5.isTimeTrial then
		f14_local0 = Engine.Localize( "@LUA_MENU_LB_TIME_HEADER" )
	else
		f14_local0 = Engine.Localize( "@LUA_MENU_LB_SCORE_HEADER" )
	end
	return SPLeaderboardCreateRow( f14_arg0, "header", 1, "h1_leaderboard_header", Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_LB_RANK_HEADER" ) ), Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_LB_PLAYER_HEADER" ) ), Engine.ToUpperCase( f14_local0 ), Colors.white, nil )
end

function SPLeaderboardDataShowFetching( f15_arg0, f15_arg1 )
	if not f0_local5.fetchingShown then
		local f15_local0 = f15_arg0:getChildById( "listCenteredContainer" )
		if f15_local0 then
			f15_local0:processEvent( {
				name = "show_no_result",
				text = Engine.Localize( "@LUA_MENU_LEADERBOARD_REFRESH" )
			} )
			local self = LUI.UITimer.new( 2000, "leaderboardFetchingPopup", nil, false )
			f15_local0:registerEventHandler( "leaderboardFetchingPopup", function ( element, event )
				event.timer:close()
				f15_local0.leaderboardFetchingTimer = nil
				LUI.FlowManager.RequestAddMenu( element, "leaderboard_fetching_data", false, f15_arg1, false )
			end )
			f15_local0.leaderboardFetchingTimer = self
			f15_local0:addElement( self )
		end
		f0_local5.fetchingShown = true
	end
end

function SPLeaderboardDataHideFetching( f17_arg0 )
	if f0_local5.fetchingShown then
		local f17_local0 = f17_arg0:getChildById( "listCenteredContainer" )
		if f17_local0 then
			f17_local0:processEvent( {
				name = "hide_no_result"
			} )
			if f17_local0.leaderboardFetchingTimer then
				LUI.UITimer.Stop( f17_local0.leaderboardFetchingTimer )
				f17_local0.leaderboardFetchingTimer:close()
				f17_local0.leaderboardFetchingTimer = nil
			else
				LUI.FlowManager.RequestLeaveMenuByName( "leaderboard_fetching_data", nil, false, true )
			end
		end
		f0_local5.fetchingShown = false
	end
end

function SPLeaderboardDataRefresh( f18_arg0 )
	local f18_local0 = f0_local5.isBusy
	f0_local5.currentPlayerCount = Leaderboards.GetPlayerCount()
	if f18_local0 ~= f0_local5.isBusy then
		return 
	elseif f0_local5.currentPlayerCount == 0 then
		if not Leaderboards.IsUpdating() or not f0_local5.isBusy then
			SPLeaderboardDataHideFetching( f18_arg0 )
			SPLeaderboardDataFillPlayerRow( f18_arg0 )
			ShowNoResultContainer( f18_arg0 )
		end
		return 
	end
	SPLeaderboardDataHideFetching( f18_arg0 )
	HideNoResultContainer( f18_arg0 )
	f0_local5.playerRank = Leaderboards.GetPlayerValue( f18_arg0.properties.exclusiveController, 0 )
	f0_local5.playerRank = tonumber( f0_local5.playerRank )
	if f0_local5.isNewFilter and f0_local5.playerRank ~= nil then
		f0_local5.startValue = math.min( f0_local5.playerRank - f0_local10 + 1, f0_local5.currentPlayerCount - f0_local0 + 1 )
		f0_local5.startValue = math.max( f0_local5.startValue, 1 )
		Leaderboards.UpdateOffset( f18_arg0.properties.exclusiveController, SPLeaderboardDataCalcPaging( f18_arg0.properties.exclusiveController, f0_local5.startValue - 1 ) )
		Leaderboards.Refresh()
		Leaderboards.UpdateLeaderboard( f18_arg0.properties.exclusiveController, f0_local5.startValue )
		f0_local5.isNewFilter = false
		return 
	elseif f0_local5.selectedRow == -1 and f0_local5.playerRank ~= nil then
		f0_local5.currentPlayerRow = GetRowFromRank( f0_local5.currentPlayerIndex )
	end
	SPLeaderboardDataFillPlayerRow( f18_arg0 )
	local f18_local1 = math.min( f0_local5.startValue + f0_local0 - 1, f0_local5.currentPlayerCount )
	assert( f0_local5.startValue > 0 )
	for f18_local2 = f0_local5.startValue, f18_local1, 1 do
		local f18_local5 = Leaderboards.GetValue( f18_arg0.properties.exclusiveController, f18_local2 - 1, 0 )
		local f18_local6 = Leaderboards.GetValue( f18_arg0.properties.exclusiveController, f18_local2 - 1, 1 )
		local f18_local7 = Leaderboards.GetValue( f18_arg0.properties.exclusiveController, f18_local2 - 1, 2 )
		if f18_arg0.properties.leaderBoardData.challenge == "LB_GB_TOTALXP_LT" then
			f18_local5 = Leaderboards.GetValue( f18_arg0.properties.exclusiveController, f18_local2 - 1, 0 )
			f18_local6 = Leaderboards.GetValue( f18_arg0.properties.exclusiveController, f18_local2 - 1, 3 )
			f18_local7 = Leaderboards.GetValue( f18_arg0.properties.exclusiveController, f18_local2 - 1, 4 )
		end
		assert( not Leaderboards.IsUpdating() )
		SPLeaderboardDataFillRankRow( f18_arg0, f18_local2 - f0_local5.startValue - 1, f18_local5, f18_local6, f18_local7 )
	end
	local f18_local2 = f0_local0 - f18_local1
	if f18_local2 > 0 then
		for f18_local3 = f0_local0 - f18_local2 - 1, f0_local0, 1 do
			disableRow( f18_arg0, f18_local3, rank, player_name, score_value )
		end
	end
	SPLeaderboardUpdatePlayerCountContainer( f18_arg0 )
	if f0_local5.selectedRow == -1 then
		if f0_local5.playerRank ~= nil then
			if f0_local5.currentPlayerRow < 1 or f0_local0 < f0_local5.currentPlayerRow then
				highlightRow( f18_arg0, f18_arg0.properties.exclusiveController, 1 )
			else
				highlightRow( f18_arg0, f18_arg0.properties.exclusiveController, f0_local5.currentPlayerRow )
			end
		elseif f0_local5.startValue == 1 then
			highlightRow( f18_arg0, f18_arg0.properties.exclusiveController, 1 )
		else
			highlightRow( f18_arg0, f18_arg0.properties.exclusiveController, f0_local10 )
		end
	end
end

function SPLeaderboardDataCalcPaging( f19_arg0, f19_arg1 )
	local f19_local0 = Leaderboards.GetOffset( f19_arg0 )
	if f19_arg1 < f19_local0 or f19_local0 + f0_local0 * 2 <= f19_arg1 then
		return math.max( f19_arg1 - f0_local0, 0 )
	else
		return f19_local0
	end
end

function backButtonHandler( f20_arg0 )
	LUI.FlowManager.RequestLeaveMenu( f20_arg0 )
end

function highlightRow( f21_arg0, f21_arg1, f21_arg2 )
	if f0_local5.selectedRow == f21_arg2 and (f21_arg2 == 1 or f21_arg2 == f0_local0 or f21_arg2 == f0_local5.currentPlayerCount) then
		return 
	elseif f0_local5.selectedRow ~= -1 then
		local f21_local0 = f21_arg0.list:getChildById( "row" .. f0_local5.selectedRow )
		f21_local0:processEvent( {
			name = "lose_focus"
		} )
	end
	local f21_local0 = f21_arg0.list:getChildById( "row" .. f21_arg2 )
	f21_local0:processEvent( {
		name = "gain_focus"
	} )
	f0_local5.selectedRow = f21_arg2
	Leaderboards.UpdateCurrentIndex( f21_arg1, f0_local5.selectedRow - 1 + f0_local5.startValue - 1 )
	SPLeaderboardUpdatePlayerCountContainer( f21_arg0 )
end

function changeStartValue( f22_arg0, f22_arg1, f22_arg2 )
	if Leaderboards.IsUpdating() or f0_local5.isBusy then
		return 
	elseif f0_local5.currentPlayerCount == 0 then
		return 
	end
	local f22_local0 = f0_local10
	local f22_local1 = f0_local5.startValue + f22_arg1 - f0_local10 - f0_local5.selectedRow
	local f22_local2 = f0_local5.currentPlayerCount - f0_local0 + 1
	if f22_local2 < 1 then
		f22_local1 = 1
		f22_local0 = LUI.clamp( f0_local5.selectedRow + f22_arg1, 1, f0_local5.currentPlayerCount )
	elseif f22_local1 < 1 then
		local f22_local3 = f22_local1 - 1
		f22_local1 = 1
		f22_local0 = math.max( f0_local10 + f22_local3, 1 )
	elseif f22_local2 < f22_local1 then
		local f22_local3 = f22_local1 - f22_local2
		f22_local1 = f22_local2
		f22_local0 = math.min( f0_local10 + f22_local3, f0_local0 )
	end
	f0_local5.currentPlayerRow = f0_local5.currentPlayerRow - f22_local1 - f0_local5.startValue
	setStartValue( f22_arg0, f22_arg2, f22_local1, f22_local0 )
end

function setStartValue( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
	local f23_local0 = f23_arg2 ~= f0_local5.startValue
	f0_local5.startValue = f23_arg2
	highlightRow( f23_arg0, f23_arg1.controller, f23_arg3 )
	if f23_local0 then
		Leaderboards.UpdateOffset( f23_arg1.controller, SPLeaderboardDataCalcPaging( f23_arg1.controller, f23_arg2 - 1 ) )
		SPLeaderboardDataRefresh( f23_arg0 )
	end
end

function SendKey( f24_arg0, f24_arg1, f24_arg2 )
	local f24_local0 = Engine.GetLuiRoot()
	f24_arg2.controller = f24_arg1.controller
	f24_arg2.fake = true
	LUI.UIRoot.ProcessEvent( f24_local0, f24_arg2 )
end

function SPLeaderboardCreatePlayerCountContainer( f25_arg0 )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f0_local6,
		alpha = 0
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		font = CoD.TextSettings.Font18.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center,
		height = CoD.TextSettings.Font18.Height
	} )
	self:setText( "-- / --" )
	self.id = "playerCountContainer"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = Engine.IsPC(),
		leftAnchor = Engine.IsPC(),
		rightAnchor = Engine.IsPC(),
		material = RegisterMaterial( "h1_deco_option_scrollbar_arrows" ),
		color = Colors.white,
		alpha = Engine.IsPC() and 0.5 or 1,
		scale = 0,
		zRot = 90
	} )
	if Engine.IsPC() then
		local self = f25_arg0
		self:setHandleMouseButton( true )
		self:setHandleMouseMove( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			if f0_local5.startValue + f0_local5.selectedRow - 1 > 1 then
				self:animateInSequence( {
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
				SendKey( element, event, {
					target = self,
					down = "true",
					button = "up",
					name = "gamepad_button"
				} )
			end
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
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = Engine.IsPC(),
		leftAnchor = Engine.IsPC(),
		rightAnchor = Engine.IsPC(),
		material = RegisterMaterial( "h1_deco_option_scrollbar_arrows" ),
		color = Colors.white,
		alpha = Engine.IsPC() and 0.5 or 1,
		scale = 0,
		zRot = -90
	} )
	if Engine.IsPC() then
		local self = f25_arg0
		self:setHandleMouseButton( true )
		self:setHandleMouseMove( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "leftmousedown", function ( element, event )
			if f0_local5.startValue + f0_local5.selectedRow - 1 < f0_local5.currentPlayerCount then
				self:animateInSequence( {
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
				SendKey( element, event, {
					target = self,
					down = "true",
					button = "down",
					name = "gamepad_button"
				} )
			end
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
	local self = LUI.UIImage.new( {
		topAnchor = true,
		color = Colors.black,
		alpha = 0.5
	} )
	self:addElement( self )
	self:addElement( self )
	if Engine.IsPC() then
		self.arrowUp = LUI.UIElement.new( {
			topAnchor = true
		} )
		self.arrowDown = LUI.UIElement.new( {
			topAnchor = true
		} )
		self:addElement( self.arrowUp )
		self:addElement( self.arrowDown )
		self.arrowUp:addElement( self )
		self.arrowDown:addElement( self )
	else
		self:addElement( self )
		self:addElement( self )
		self.arrowUp = self
		self.arrowDown = self
	end
	self.text = self
	self.background = self
	f25_arg0.playerCountContainer = self
end

function GetLastVisibleRow( f30_arg0 )
	local f30_local0 = nil
	if f0_local0 < f0_local5.currentPlayerCount then
		f30_local0 = f30_arg0:getChildById( "row" .. f0_local0 )
	else
		f30_local0 = f30_arg0:getChildById( "row" .. f0_local5.currentPlayerCount )
	end
	return f30_local0
end

function SPLeaderboardUpdatePlayerCountContainer( f31_arg0 )
	if f31_arg0.playerCountContainer then
		if f0_local5.currentPlayerCount < 1 then
			f31_arg0.playerCountContainer:setAlpha( 0 )
		else
			f31_arg0.playerCountContainer:setAlpha( 1 )
			local f31_local0 = f0_local5.startValue + f0_local5.selectedRow - 1 .. " / " .. f0_local5.currentPlayerCount
			f31_arg0.playerCountContainer.text:setText( f31_local0 )
			local f31_local1 = 0
			if f0_local5.usePersistentRelativeBottom then
				f31_local1 = f0_local5.persistentRelativeBottom
			else
				local f31_local2 = GetLastVisibleRow( f31_arg0.list )
				local f31_local3, f31_local4, f31_local5, f31_local6 = f31_local2:getRect()
				local f31_local7 = 1
				if Engine.GetLuiRootScale then
					f31_local7 = Engine.GetLuiRootScale()
				end
				local f31_local8, f31_local9, f31_local10, f31_local11 = f31_arg0:getRect()
				f31_local1 = (f31_local4 - f31_local9 + f31_local6 - f31_local4) / f31_local7
				f0_local5.persistentRelativeBottom = f31_local1
			end
			f31_arg0:addElement( f31_arg0.playerCountContainer )
			f31_arg0.playerCountContainer:setTopBottom( true, false, f31_local1 + 15, f31_local1 + 15 + CoD.TextSettings.Font18.Height )
			local f31_local2, f31_local3, f31_local4, f31_local5 = GetTextDimensions( f31_local0, CoD.TextSettings.Font18.Font, CoD.TextSettings.Font18.Height )
			local f31_local6, f31_local7 = GetMaterialDimensions( RegisterMaterial( "h1_deco_option_scrollbar_arrows" ) )
			f31_local6 = f31_local6 / 2
			f31_local7 = f31_local7 / 2
			local f31_local8 = f0_local6 / 2
			local f31_local10 = (f31_local4 - f31_local2) / 2 + f31_local6 + 15
			local f31_local11 = -3
			f31_arg0.playerCountContainer.arrowUp:setLeftRight( true, false, f31_local8 - f31_local10, f31_local8 - f31_local10 + f31_local6 )
			f31_arg0.playerCountContainer.arrowUp:setTopBottom( true, false, f31_local11, f31_local7 + f31_local11 )
			f31_arg0.playerCountContainer.arrowDown:setLeftRight( true, false, f31_local8 + f31_local10 - f31_local6, f31_local8 + f31_local10 )
			f31_arg0.playerCountContainer.arrowDown:setTopBottom( true, false, f31_local11, f31_local7 + f31_local11 )
			f31_arg0.playerCountContainer.background:setLeftRight( true, false, f31_local8 - f31_local10 - 10, f31_local8 + f31_local10 + 10 )
			f31_arg0.playerCountContainer.background:setTopBottom( true, false, f31_local11 - 3, f31_local7 + f31_local11 + 3 )
		end
	end
end

function SPLeaderboardCreateListCenteredContainer( f32_arg0 )
	local f32_local0 = 16
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 327,
		height = f32_local0 + 18,
		left = 0,
		width = 25,
		material = RegisterMaterial( "h1_leaderboard_header" ),
		alpha = 0
	} )
	self.id = "listCenteredContainer"
	self:setup3SliceRatio( 12, 0.02 )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		font = CoD.TextSettings.Font24.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center,
		height = f32_local0,
		top = 10
	} )
	self.textField = self
	self:addElement( self )
	self:registerAnimationState( "default", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerEventHandler( "show_no_result", function ( element, event )
		local f33_local0, f33_local1, f33_local2, f33_local3 = GetTextDimensions( event.text, CoD.TextSettings.Font24.Font, 16 )
		local f33_local4 = f33_local2 - f33_local0
		local f33_local5 = f0_local6 / 2 - (f33_local4 + 25) / 2
		element:setLeftRight( true, false, f33_local5, f33_local5 + f33_local4 + 25 )
		element.textField:setText( event.text )
		element:animateToState( "visible", 133 )
	end )
	self:registerEventHandler( "hide_no_result", MBh.AnimateToState( "default", 0 ) )
	f32_arg0:addElement( self )
end

function ShowNoResultContainer( f34_arg0 )
	for f34_local0 = 1, f0_local0, 1 do
		local f34_local3 = f34_arg0.list:getChildById( "row" .. f34_local0 )
		local f34_local4 = "h1_leaderboard_row01"
		if f34_local0 % 2 == 1 then
			f34_local4 = "h1_leaderboard_row02"
		end
		SPLeaderboardDataFillRow( f34_arg0, f34_local3, "", "", "", f34_local4, false, false )
	end
	f34_arg0:dispatchEventToRoot( LUI.ButtonHelperText.CommonEvents.removeSelectButton )
	local f34_local0 = f34_arg0:getChildById( "listCenteredContainer" )
	if f34_local0 then
		f34_local0:processEvent( {
			name = "show_no_result",
			text = Engine.Localize( "@MENU_SP_LB_EMPTY" )
		} )
	end
end

function HideNoResultContainer( f35_arg0 )
	for f35_local0 = 1, f0_local0, 1 do
		disableRow( f35_arg0, f35_local0 )
	end
	if SPLeaderboardDataCanShowSelectButton() then
		f35_arg0:dispatchEventToRoot( LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	local f35_local0 = f35_arg0:getChildById( "listCenteredContainer" )
	if f35_local0 then
		f35_local0:processEvent( {
			name = "hide_no_result"
		} )
	end
end

function previousEntryFunc( f36_arg0, f36_arg1 )
	changeStartValue( f0_local4, -1, f36_arg1 )
end

function nextEntryFunc( f37_arg0, f37_arg1 )
	changeStartValue( f0_local4, 1, f37_arg1 )
end

function previousPageFunc( f38_arg0, f38_arg1 )
	changeStartValue( f0_local4, -f0_local0, f38_arg1 )
end

function nextPageFunc( f39_arg0, f39_arg1 )
	changeStartValue( f0_local4, f0_local0, f39_arg1 )
end

function gotoHandler( f40_arg0, f40_arg1 )
	if Leaderboards.IsUpdating() or f0_local5.isBusy then
		return 
	elseif f0_local4 then
		changeStartValue( f0_local4, -f0_local5.startValue - f0_local0, f40_arg1 )
	end
end

function leaveMenuHandler( f41_arg0, f41_arg1 )
	SPLeaderboardDataHideFetching( f41_arg0 )
	f0_local5.exitedWhileUpdating = Leaderboards.IsUpdating()
	f0_local4 = nil
end

function gamepadButtonHandler( f42_arg0, f42_arg1 )
	if f42_arg1.down then
		local f42_local0 = Engine.GetLuiRoot()
		local f42_local1 = LUI.FlowManager.GetTopMenuInfo( f42_local0.flowManager.menuInfoStack, true )
		if f42_local1.menu == f42_arg0 then
			if f42_arg1.button == "up" then
				previousEntryFunc( f42_arg0, f42_arg1 )
				return true
			elseif f42_arg1.button == "down" then
				nextEntryFunc( f42_arg0, f42_arg1 )
				return true
			elseif f42_arg1.button == "page_up" then
				previousPageFunc( f42_arg0, f42_arg1 )
				return true
			elseif f42_arg1.button == "page_down" then
				nextPageFunc( f42_arg0, f42_arg1 )
				return true
			end
		end
	end
	return LUI.UIButton.GamepadButton( f42_arg0, f42_arg1 )
end

function SPLeaderboardDataCreateMenu( f43_arg0, f43_arg1 )
	local f43_local0 = LUI.MenuTemplate.new( f43_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( f43_arg1.leaderBoardData.challengeName ) ),
		menu_top_indent = LUI.MenuTemplate.spMenuOffset + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		spacing = 0,
		showSelectButton = false
	} )
	f0_local5.isTimeTrial = f43_arg1.isTimeTrial
	f0_local5.isBusy = false
	if f0_local5.isTimeTrial then
		LUI.MenuTemplate.SetBreadCrumb( f43_local0, Engine.Localize( "@LUA_MENU_TIME_TRIAL_LEADERBOARD" ) )
	else
		LUI.MenuTemplate.SetBreadCrumb( f43_local0, Engine.Localize( "@LUA_MENU_ARCADE_LEADERBOARD" ) )
	end
	f0_local4 = f43_local0
	assert( f43_arg1.startValue )
	f0_local5.startValue = f43_arg1.startValue
	f0_local5.selectedRow = -1
	if not Leaderboards.IsUpdating() then
		Leaderboards.Clear()
	end
	if not f0_local5.isNewFilter then
		f0_local5.socialFilter = 1
		f0_local5.durationFilter = 1
		f0_local5.playerRank = -1
	end
	local f43_local1 = f43_arg0.exclusiveController
	if not f43_local1 then
		f43_local1 = Engine.GetFirstActiveController()
	end
	local f43_local2 = function ( f44_arg0, f44_arg1 )
		local f44_local0 = assert
		local f44_local1
		if f0_local5.durationFilter < 1 or f0_local5.durationFilter > #f0_local1 then
			f44_local1 = false
		else
			f44_local1 = true
		end
		f44_local0( f44_local1 )
		f44_local0 = assert
		f44_local1
		if f0_local5.socialFilter < 1 or f0_local5.socialFilter > #f0_local2 then
			f44_local1 = false
		else
			f44_local1 = true
		end
		f44_local0( f44_local1 )
		Engine.SetDvarString( "lb_filter", f0_local2[f0_local5.socialFilter].value )
		Engine.SetDvarInt( "lb_maxrows", f0_local0 * 3 )
		if not f0_local5.isNewFilter then
			Leaderboards.Clear()
		end
		if f43_arg1.newFilter then
			f0_local5.isNewFilter = true
		end
		Leaderboards.Open( f43_arg1.leaderBoardData.challenge, f0_local1[f0_local5.durationFilter].value )
		if Leaderboards.IsUpdating() then
			DebugPrint( "Leaderboard was already updating!" )
		else
			Leaderboards.UpdateLeaderboard( f43_local1, Leaderboards.GetOffset( f43_local1 ) )
		end
		if not (Leaderboards.IsUpdating() or f0_local5.isBusy) or f0_local5.exitedWhileUpdating and not Leaderboards.IsUpdating() then
			f0_local5.usePersistentRelativeBottom = true
			SPLeaderboardDataRefresh( f44_arg0 )
			f0_local5.usePersistentRelativeBottom = false
			if f0_local5.exitedWhileUpdating then
				f0_local5.isBusy = false
			end
		end
	end
	
	f43_local0:registerEventHandler( "leaderboard_read_delayfail", SPLeaderboardDataReadDelay )
	f43_local0:registerEventHandler( "leaderboard_update_status", SPLeaderboardDataUpdateStatus )
	f43_local0:registerEventHandler( "menu_create", f43_local2 )
	local f43_local3 = function ( f45_arg0, f45_arg1 )
		if Leaderboards.IsUpdating() or f0_local5.isBusy then
			return 
		elseif f0_local5.socialFilter == #f0_local2 then
			f0_local5.socialFilter = 1
		else
			f0_local5.socialFilter = f0_local5.socialFilter + 1
		end
		f0_local5.isNewFilter = true
		LUI.FlowManager.RequestAddMenu( f43_local0, "sp_leaderboard_data", true, f45_arg1.controller, true, {
			leaderBoardData = f43_arg1.leaderBoardData,
			startValue = 1,
			isTimeTrial = f0_local5.isTimeTrial
		}, {
			reload = true
		} )
	end
	
	f43_local0:addElement( LUI.H1MenuTab.new( {
		title = function ( f48_arg0 )
			return f0_local1[f48_arg0].display
		end,
		top = LUI.MenuTemplate.spMenuOffset + LUI.MenuTemplate.ListTop,
		tabCount = #f0_local1,
		width = f0_local6,
		clickTabBtnAction = function ( f46_arg0, f46_arg1, f46_arg2 )
			local f46_local0 = true
			local f46_local1 = true
			if Leaderboards.IsUpdating() or f0_local5.isBusy then
				return 
			else
				f0_local5.durationFilter = f46_arg2
				f0_local5.isNewFilter = true
				LUI.FlowManager.RequestAddMenu( f46_arg0, "sp_leaderboard_data", true, f46_arg1.controller, true, {
					leaderBoardData = f43_arg1.leaderBoardData,
					startValue = 1,
					isTimeTrial = f0_local5.isTimeTrial
				}, {
					reload = true
				} )
				CoD.PlayEventSound( CoD.SFX.H1TabChange, 10 )
			end
		end,
		activeIndex = f0_local5.durationFilter,
		underTabTextFunc = function ( f49_arg0 )
			return f0_local1[f49_arg0].display
		end,
		enableRightLeftNavigation = true,
		exclusiveController = f43_local0.exclusiveController,
		tabChangeLockedFunc = function ( f47_arg0 )
			local f47_local0
			if not Leaderboards.IsUpdating() then
				f47_local0 = not f0_local5.isBusy
			else
				f47_local0 = false
			end
			return f47_local0
		end
	} ) )
	SPLeaderboardDataAddHeader( f43_local0 )
	SPLeaderboardDataAddPlayerHeader( f43_local0, f43_local1 )
	for f43_local4 = 1, f0_local0, 1 do
		SPLeaderboardDataAddRow( f43_local0, f43_local4 )
	end
	SPLeaderboardCreatePlayerCountContainer( f43_local0 )
	SPLeaderboardCreateListCenteredContainer( f43_local0 )
	local f43_local4 = 0
	if f0_local5.socialFilter == #f0_local2 then
		f43_local4 = 1
	else
		f43_local4 = f0_local5.socialFilter + 1
	end
	f43_local0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt2",
		helper_text = f0_local2[f43_local4].display,
		side = "right",
		clickable = true
	}, f43_local3 )
	f43_local0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( f0_local3[1].display ),
		side = "right",
		clickable = true
	}, gotoHandler )
	local f43_local5 = CoD.UsingController() and "button_left_trigger" or "button_page_up"
	local f43_local6 = CoD.UsingController() and "button_right_trigger" or "button_page_down"
	if Engine.IsVita( f43_local0.exclusiveController ) then
		f43_local5 = "button_left"
		f43_local6 = "button_right"
	end
	f43_local0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = f43_local5,
		helper_text = Engine.Localize( "@LUA_MENU_PREV_PAGE" ),
		side = "right",
		clickable = true,
		imageSize = 24,
		priority = 10
	}, previousPageFunc )
	f43_local0:AddHelp( {
		name = "add_button_helper_text",
		button_ref = f43_local6,
		helper_text = Engine.Localize( "@LUA_MENU_NEXT_PAGE" ),
		side = "right",
		clickable = true,
		imageSize = 24,
		priority = 5
	}, nextPageFunc )
	LUI.MenuTemplate.AddListDivider( f43_local0, -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing) )
	f43_local0:registerEventHandler( "gamepad_button", gamepadButtonHandler )
	f43_local0:registerEventHandler( "menu_close", leaveMenuHandler )
	local f43_local7 = f43_local0:AddBackButton( backButtonHandler )
	return f43_local0
end

LUI.MenuBuilder.registerType( "sp_leaderboard_data", SPLeaderboardDataCreateMenu )
LockTable( _M )
