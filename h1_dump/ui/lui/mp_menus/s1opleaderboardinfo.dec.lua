local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
OpLeaderboardDebugCounter = 0
f0_local0 = 210
f0_local1 = CoD.TextSettings.Font15
f0_local2 = CoD.TextSettings.Font18
function DebugGetDebugTextString( f1_arg0, f1_arg1 )
	return "C#:" .. tostring( OpLeaderboardMenu.controllerIndex ) .. ", file=" .. tostring( f1_arg0.file ) .. ", duration=" .. tostring( f1_arg0.durationDef.Duration )
end

function DebugGetDebugButtonRenderModeString( f2_arg0, f2_arg1 )
	local f2_local0 = OperatorMenuUtil.GetDebugRenderMode()
	if f2_local0 == 1 then
		return "RM:WIREFRAME"
	elseif f2_local0 == 2 then
		return "RM:COLOR"
	else
		return "RM:NORMAL"
	end
end

function DebugButtonRenderModeHandler( f3_arg0, f3_arg1 )
	OperatorMenuUtil.IncrementDebugRenderMode()
	RebuildCurrentMenu()
end

function ButtonOverHandler( f4_arg0, f4_arg1 )
	return MBh.AnimateToState( "focused" )
end

function ButtonUpHandler( f5_arg0, f5_arg1 )
	return MBh.AnimateToState( "default" )
end

function ButtonActionHandlerPageUpButton( f6_arg0, f6_arg1 )
	OpLeaderboardDataController.SelectPagePrev()
end

function ButtonActionHandlerPageDownButton( f7_arg0, f7_arg1 )
	OpLeaderboardDataController.SelectPageNext()
end

function RebuildCurrentMenu()
	SelectMenu( OpLeaderboardMenu.SelectedIndex, true )
end

function OnChangeFilterButton( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestAddMenu( nil, "opLeaderboardFilter", true, f9_arg1.controller, false, {} )
end

function OnBackButton( f10_arg0, f10_arg1 )
	Leaderboards.Clear()
	LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
end

function MenuCreateHandler( f11_arg0, f11_arg1 )
	
end

function CreateInfoPanel()
	local f12_local0 = OperatorMenuUtil.UIGetItemUIElement( nil, OpLeaderboard.CenterPanel.Rect )
	f12_local0:registerEventHandler( "menu_create", MenuCreateHandler )
	return f12_local0
end

function GetFilterText()
	local f13_local0 = OpLeaderboardDataController.GetScoped()
	local f13_local1 = OpLeaderboard.GetDurationDef( f13_local0.categoryId, f13_local0.durationKey )
	local f13_local2 = Engine.Localize( tostring( OpLeaderboard.GetFilterOptionText( f13_local0.filterType ) ) )
	local f13_local3 = Engine.Localize( tostring( f13_local1.OptionText ) )
	local f13_local4 = ""
	if OpLeaderboard.IsCoreModeFilterEnabled( f13_local0.categoryId ) then
		f13_local4 = " / " .. Engine.Localize( tostring( OpLeaderboard.GetCoreModeFilterOptionText( f13_local0.categoryId, f13_local0.coreMode ) ) )
	end
	return f13_local2 .. " / " .. f13_local3 .. f13_local4
end

function UpdateFilterText( f14_arg0 )
	f14_arg0:setText( GetFilterText() )
end

function FilterTextClearHandler( f15_arg0, f15_arg1 )
	UpdateFilterText( f15_arg0 )
end

function FilterTextUpdateHandler( f16_arg0, f16_arg1 )
	UpdateFilterText( f16_arg0 )
end

function GetFilterOffset( f17_arg0 )
	if MLG.AreMLGRulesEnabled() then
		return {
			top = 18,
			height = f17_arg0.Height * 0.7
		}
	else
		return nil
	end
end

function AddFilterText( f18_arg0, f18_arg1 )
	local f18_local0 = CoD.TextSettings.TitleFontMediumBold
	local f18_local1 = OperatorMenuUtil.UIGetItemUIElement( nil, OpLeaderboard.CenterPanel.FilterText.Rect )
	local f18_local2 = OperatorMenuUtil.UIGetItemUIText( "opleaderboardFilterTextId", GetFilterOffset( f18_local0 ), GetFilterText(), CoD.TextStyle.ForceUpperCase, f18_local0, Swatches.OpLeaderboard.FontColor, Swatches.OpLeaderboard.FontAlpha, LUI.Alignment.Left )
	f18_local2:registerEventHandler( "opleaderboard_clear_elements", FilterTextClearHandler )
	f18_local2:registerEventHandler( "opleaderboard_update_elements", FilterTextUpdateHandler )
	f18_local1:addElement( f18_local2 )
	f18_arg1:addElement( f18_local1 )
end

function RowButtonGamepadButtonHandler( f19_arg0, f19_arg1 )
	local f19_local0 = OpLeaderboardDataController.GetScoped( f19_arg0 )
	if not Leaderboards.IsUpdating() and f19_local0.gotLeaderboardData == true and f19_local0.isLeaderboardFocused and f19_arg1.down then
		local f19_local1 = false
		if f19_arg0:isInFocus() then
			if f19_arg1.button == "left_trigger" then
				OpLeaderboardDataController.SelectPagePrev()
				f19_local1 = true
			elseif f19_arg1.button == "right_trigger" then
				OpLeaderboardDataController.SelectPageNext()
				f19_local1 = true
			elseif f19_arg1.button == "up" then
				OpLeaderboardDataController.SelectPrev()
				f19_local1 = true
			elseif f19_arg1.button == "down" then
				OpLeaderboardDataController.SelectNext()
				f19_local1 = true
			elseif f19_arg1.button == "left" then
				if OpLeaderboardDataController.activeSublist then
					LUI.Leaderboard.RemoveFilterSubList( OpLeaderboardDataController.activeSublist )
				end
				LUI.Leaderboard.SelectedLeaderboardBtnChangeFocus( {
					filterFocusEventName = "gain_focus",
					isLeaderboardFocused = false
				} )
				f19_local1 = true
			end
		elseif f19_arg1.button == "page_up" then
			OpLeaderboardDataController.SelectPagePrev()
			f19_local1 = true
		elseif f19_arg1.button == "page_down" then
			OpLeaderboardDataController.SelectPageNext()
			f19_local1 = true
		end
		if f19_local1 then
			Engine.PlaySound( CoD.SFX.MenuScroll )
			return f19_local1
		end
	end
	return LUI.UIButton.GamepadButton( f19_arg0, f19_arg1 )
end

function RowButtonOverHandler( f20_arg0, f20_arg1 )
	if f20_arg1.focusType ~= FocusType.MouseOver then
		f20_arg0:animateToState( "focused" )
	end
end

function RowButtonUpHandler( f21_arg0, f21_arg1 )
	if f21_arg1.focusType ~= FocusType.MouseOver then
		f21_arg0:animateToState( "default" )
	end
end

function RowButtonActionHandler( f22_arg0, f22_arg1 )
	local f22_local0 = OpLeaderboardDataController.GetScoped( f22_arg0 )
	if (Engine.IsConsoleGame() or Engine.IsPCApp() and OpLeaderboardDataController.IsSelectedByItem( f22_arg0 )) and f22_local0.isLeaderboardFocused then
		if not f22_local0.localPlayerIsUnranked then
			Leaderboards.ShowGamercard( f22_arg1.controller, 0 )
		else
			Leaderboards.ShowGamercard( f22_arg1.controller, -1 )
		end
	elseif f22_arg1.mouse == true then
		OpLeaderboardDataController.SelectByItem( f22_arg0 )
	end
end

function rowButtonGainFocus( f23_arg0, f23_arg1 )
	local f23_local0 = f23_arg1.focusType == FocusType.MouseOver
	local f23_local1 = f23_arg0:isInFocus()
	if not f23_local0 then
		LUI.UIElement.gainFocus( f23_arg0, f23_arg1 )
		if f23_arg0.disabled then
			f23_arg0:processEvent( {
				name = "button_over_disable",
				controller = f23_arg1.controller,
				dispatchChildren = true,
				focusType = f23_arg1.focusType,
				duration = f23_arg1.duration,
				button = f23_arg1.button
			} )
		else
			f23_arg0:processEvent( {
				name = "button_over",
				controller = f23_arg1.controller,
				dispatchChildren = true,
				focusType = f23_arg1.focusType,
				duration = f23_arg1.duration,
				button = f23_arg1.button
			} )
		end
	end
end

function rowButtonLoseFocus( f24_arg0, f24_arg1 )
	if f24_arg1.focusType ~= FocusType.MouseOver then
		LUI.UIElement.loseFocus( f24_arg0, f24_arg1 )
		if f24_arg0.disabled then
			f24_arg0:processEvent( {
				name = "button_disable",
				dispatchChildren = true
			} )
		else
			local f24_local0 = f24_arg0.m_ignoreMouseFocus
			if f24_local0 then
				f24_local0 = f24_arg1.focusType == FocusType.MouseOver
			end
			if not f24_local0 then
				f24_arg0:processEvent( {
					name = "button_up",
					dispatchChildren = true
				} )
			end
		end
	end
end

function PanelUpdateTimerHandler( f25_arg0, f25_arg1 )
	local f25_local0 = OpLeaderboardDataController.GetScoped( f25_arg0 )
	if f25_local0.readDelayFail == true and f25_local0.readDelayTime < Engine.GetMilliseconds() then
		f25_local0.readDelayFail = false
		f25_local0.readDelayTime = 0
		OpLeaderboardDataController.Fetch()
	end
end

function PanelLeaderboardClearHandler( f26_arg0, f26_arg1 )
	f26_arg0:processEvent( {
		name = "opleaderboard_clear_elements",
		dispatchChildren = true
	} )
end

function PanelLeaderboardReadDelayFailHandler( f27_arg0, f27_arg1 )
	local f27_local0 = OpLeaderboardDataController.GetScoped( f27_arg0 )
	f27_local0.readDelayFail = true
	f27_local0.readDelayTime = Engine.GetMilliseconds() + 500
	f27_local0.gotLeaderboardData = false
end

function PanelLeaderboardRefreshHandler( f28_arg0, f28_arg1 )
	collectgarbage( "collect" )
	local f28_local0 = OpLeaderboardDataController.GetScoped( f28_arg0 )
	f28_local0.readDelayFail = false
	f28_local0.readDelayTime = 0
	f28_local0.gotLeaderboardData = true
	if f28_local0.initialFetch == true then
		f28_local0.initialFetch = false
		f28_local0.leaderboardPageTop = 0
		f28_local0.leaderboardPageRow = tonumber( Leaderboards.GetCurrentIndex( OpLeaderboardMenu.controllerIndex ) ) + 1
		f28_local0.newPlayerRow = f28_local0.leaderboardPageRow
		OpLeaderboardDataController.FixCoords( f28_local0 )
	end
	OpLeaderboardDataController.SelectDelta( 0 )
end

function CellTextClearHandler( f29_arg0, f29_arg1 )
	f29_arg0:setText( "" )
end

function CellTextUpdateHandler( f30_arg0, f30_arg1 )
	local f30_local0 = OpLeaderboardDataController.GetScoped( f30_arg0 )
	local f30_local1 = f30_arg0.properties.controllerIndex
	local f30_local2 = f30_local0.leaderboardPageTop
	local f30_local3 = f30_arg0.properties.rowScreenIndex
	local f30_local4 = f30_arg0.properties.colScreenIndex
	local f30_local5 = f30_arg0.properties.colDataIndex
	local f30_local6 = ""
	if not Leaderboards.IsUpdating() and f30_local0.gotLeaderboardData == true then
		f30_local0.localPlayerIsUnranked = Leaderboards.GetPlayerValue( f30_local1, OpLeaderboard.Boards.NameDataIndex ) == "UNRANKED"
		local f30_local7 = Leaderboards.GetPlayerCount()
		local f30_local8 = f30_local7
		if (f30_local8 or 0) < OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay then
			f30_local8 = OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay
		end
		local f30_local9 = f30_local2 + f30_local3
		if f30_local0.localPlayerIsUnranked then
			f30_local9 = f30_local9 - 1
		end
		if f30_local9 > -1 and f30_local9 <= f30_local8 then
			f30_arg0:animateToState( "default" )
			if f30_local5 == OpLeaderboard.Boards.NameDataIndex then
				local f30_local10 = Leaderboards.GetPlayerValue( f30_local1, OpLeaderboard.Boards.NameDataIndex )
				local f30_local11
				if f30_local9 ~= 0 then
					f30_local11 = Leaderboards.GetValue( f30_local1, f30_local9 - 1, OpLeaderboard.Boards.NameDataIndex )
				else
					f30_local11 = false
				end
				if f30_local10 ~= "" and f30_local10 == f30_local11 then
					f30_arg0:animateToState( "default_you" )
				end
			end
			if f30_local3 == f30_local0.leaderboardPageRow then
				f30_arg0:animateToState( "focused" )
			end
			if f30_local9 ~= 0 then
				local f30_local12 = tostring( Leaderboards.GetValue( f30_local1, f30_local9 - 1, f30_local5 ) )
			end
			f30_local6 = f30_local12 or "--"
			if f30_local6 and f30_local6 ~= "" and f30_local0.categoryId == "Hardpoint" and f30_local5 == 5 and f30_local9 ~= 0 then
				local f30_local11 = tonumber( f30_local6 )
				local f30_local13 = tonumber( Leaderboards.GetValue( f30_local1, f30_local9 - 1, 9 ) )
				if f30_local11 and f30_local11 > 0 then
					local f30_local14 = f30_local11
				end
				local f30_local15 = f30_local14 or 0
				if f30_local13 and f30_local13 > 0 then
					local f30_local16 = f30_local13
				end
				f30_local6 = FormatTimeMinutesSeconds( f30_local15 / (f30_local16 or 1) )
			end
			if f30_local0.localPlayerIsUnranked and f30_local9 == 0 then
				if f30_local5 == OpLeaderboard.Boards.PositionDataIndex then
					f30_local6 = Engine.Localize( "LUA_MENU_LB_UNRANKED" )
				elseif f30_local5 == OpLeaderboard.Boards.NameDataIndex then
					f30_local6 = Engine.GetUsernameByController( f30_local1 )
				elseif f30_local5 == OpLeaderboard.Boards.RankDataIndex then
					local f30_local11 = Engine.GetPlayerDataMPXP( f30_local1, CoD.StatsGroup.Ranked, "experience" )
					f30_local0.localPlayerPrestige = Lobby.GetPlayerPrestigeLevel( f30_local1 )
					f30_local0.localPlayerRank = Lobby.GetRankForXP( f30_local11, f30_local0.localPlayerPrestige )
					f30_local6 = Rank.GetRankDisplay( f30_local0.localPlayerRank )
				end
			end
			if f30_local5 == OpLeaderboard.Boards.PositionDataIndex and f30_local6 then
				local f30_local17 = math.ceil( (tonumber( f30_local6 ) or f30_local7) / f30_local7 * 100 )
				local f30_local13 = nil
				if f30_local17 == 1 then
					f30_local13 = "h1_ui_deco_leaderboard_top1"
				elseif f30_local17 > 1 and f30_local17 <= 5 then
					f30_local13 = "h1_ui_deco_leaderboard_top5"
				elseif f30_local17 > 5 and f30_local17 <= 10 then
					f30_local13 = "h1_ui_deco_leaderboard_top10"
				else
					f30_arg0.percentMat:setAlpha( 0 )
				end
				if f30_local13 then
					f30_arg0.percentMat:registerAnimationState( "default", {
						material = RegisterMaterial( f30_local13 )
					} )
					f30_arg0.percentMat:animateToState( "default" )
					f30_arg0.percentMat:setAlpha( 1 )
				end
			end
			if f30_local5 == OpLeaderboard.Boards.NameDataIndex then
				
			else
				
			end
			if f30_local5 == OpLeaderboard.Boards.RankDataIndex then
				
			else
				
			end
			if f30_local5 == 4 then
				
			else
				
			end
		end
	end
	if Leaderboards.IsUpdating() or f30_local0.gotLeaderboardData == false then
		f30_local6 = ""
	end
	UpdateHeaderStatRow()
	f30_arg0:setText( f30_local6 )
end

function CellRankIconClearHandler( f31_arg0, f31_arg1 )
	f31_arg0:animateToState( "default" )
end

function CellRankIconUpdateHandler( f32_arg0, f32_arg1 )
	local f32_local0 = OpLeaderboardDataController.GetScoped( f32_arg0 )
	if Leaderboards.IsUpdating() or f32_local0.gotLeaderboardData ~= true then
		f32_arg0:animateToState( "default" )
	else
		local f32_local1 = OpLeaderboardDataController.GetScoped( f32_arg0 )
		local f32_local2 = f32_arg0.properties.controllerIndex
		local f32_local3 = f32_local1.leaderboardPageTop
		local f32_local4 = f32_arg0.properties.rowScreenIndex
		local f32_local5 = f32_arg0.properties.colScreenIndex
		local f32_local6 = f32_arg0.properties.colDataIndex
		local f32_local7 = ""
		local f32_local8 = Leaderboards.GetPlayerCount()
		local f32_local9 = f32_local3 + f32_local4
		if f32_local1.localPlayerIsUnranked then
			f32_local9 = f32_local9 - 1
		end
		if f32_local1.localPlayerIsUnranked and f32_local9 == 0 then
			f32_local7 = Rank.GetRankIcon( f32_local1.localPlayerRank, f32_local1.localPlayerPrestige )
		elseif f32_local9 > 0 and f32_local9 <= f32_local8 then
			f32_local7 = Leaderboards.GetValue( f32_local2, f32_local9 - 1, f32_local6 )
		end
		if Leaderboards.IsUpdating() or f32_local1.gotLeaderboardData == false then
			f32_local7 = ""
		end
		if f32_local7 and f32_local7 ~= "" then
			f32_arg0:setImage( RegisterMaterial( f32_local7 ) )
			f32_arg0:animateToState( "showicon" )
		else
			f32_arg0:animateToState( "default" )
		end
	end
end

function RowButtonImageUpdateState( f33_arg0 )
	local f33_local0 = OpLeaderboardDataController.GetScoped( f33_arg0 )
	if Leaderboards.IsUpdating() or f33_local0.gotLeaderboardData ~= true then
		f33_arg0:animateToState( "default" )
	elseif f33_arg0.properties.rowScreenIndex == f33_local0.leaderboardPageRow then
		f33_arg0:animateToState( "focused" )
	else
		local f33_local1 = Leaderboards.GetPlayerCount()
		local f33_local2 = f33_local0.leaderboardPageTop + f33_arg0.properties.rowScreenIndex
		if f33_local2 < 1 or f33_local1 < f33_local2 then
			f33_arg0:animateToState( "hidden" )
		else
			local f33_local3 = false
			local f33_local4 = Leaderboards.GetPlayerValue( OpLeaderboardMenu.controllerIndex, 0 )
			if f33_local4 ~= "" and f33_local0.leaderboardPageTop + f33_arg0.properties.rowScreenIndex == tonumber( f33_local4 ) then
				f33_local3 = true
			end
			if Leaderboards.IsUpdating() or f33_local0.gotLeaderboardData == false then
				f33_arg0:animateToState( "default" )
			elseif f33_local3 == true then
				f33_arg0:animateToState( "default_you" )
			else
				f33_arg0:animateToState( "default" )
			end
		end
	end
end

function RowButtonImageSelectionChangedHandler( f34_arg0, f34_arg1 )
	RowButtonImageUpdateState( f34_arg0 )
end

function RowButtonImageButtonOverHandler( f35_arg0, f35_arg1 )
	RowButtonImageUpdateState( f35_arg0 )
end

function RowButtonImageButtonUpHandler( f36_arg0, f36_arg1 )
	RowButtonImageUpdateState( f36_arg0 )
end

function RowButtonBorderGeneralHandler( f37_arg0, f37_arg1 )
	local f37_local0 = OpLeaderboardDataController.GetScoped( f37_arg0 )
	if Leaderboards.IsUpdating() or f37_local0.gotLeaderboardData ~= true then
		f37_arg0:animateToState( "default" )
	elseif f37_arg0.properties.rowScreenIndex == f37_local0.leaderboardPageRow then
		f37_local0.activeLeaderboardButtonHighlight = f37_arg0
		if f37_arg1.mouse and not f37_local0.isLeaderboardFocused then
			LUI.Leaderboard.SelectedLeaderboardBtnChangeFocus( {
				filterFocusEventName = "lose_focus",
				isLeaderboardFocused = true
			} )
		end
		if f37_local0.isLeaderboardFocused then
			f37_arg0:animateToState( "focused" )
		else
			f37_arg0:animateToState( "disabledFocus" )
		end
	else
		f37_arg0:animateToState( "default" )
	end
end

function GetFooterText( f38_arg0 )
	local f38_local0 = OpLeaderboardDataController.GetScoped( f38_arg0 )
	local f38_local1 = nil
	if Leaderboards.IsUpdating() or f38_local0.gotLeaderboardData ~= true then
		f38_local1 = ""
		f38_arg0:setAlpha( 0 )
	else
		local f38_local2 = Leaderboards.GetPlayerCount()
		if f38_local2 < 1 then
			f38_local1 = ""
			f38_arg0:setAlpha( 0 )
		else
			f38_arg0:setAlpha( 1 )
			local f38_local3 = f38_local0.leaderboardPageTop + f38_local0.leaderboardPageRow
			if f38_local0.localPlayerIsUnranked then
				f38_local3 = f38_local3 - 1
			end
			local f38_local4
			if f38_local3 == 0 then
				f38_local4 = "--"
				if not f38_local4 then
				
				else
					f38_local1 = f38_local4 .. " / " .. f38_local2
				end
			end
			f38_local4 = f38_local3
		end
		local f38_local3 = OpLeaderboard.CenterPanel.Leaderboard.Footer.Font
		local f38_local5, f38_local6, f38_local7, f38_local8 = GetTextDimensions( f38_local2 .. " / " .. f38_local2, f38_local3.Font, f38_local3.Height )
		f38_arg0:registerAnimationState( "default", {
			width = f38_local7 - f38_local5 + 20,
			alignment = LUI.Alignment.Center
		} )
		f38_arg0:animateToState( "default" )
	end
	return f38_local1
end

function FooterTextItemSelectionChangedHandler( f39_arg0, f39_arg1 )
	f39_arg0:setText( GetFooterText( f39_arg0 ) )
end

function FooterTextItemUpdateHandler( f40_arg0, f40_arg1 )
	f40_arg0:setText( GetFooterText( f40_arg0 ) )
end

function AddTextElement( f41_arg0, f41_arg1 )
	local f41_local0, f41_local1, f41_local2, f41_local3 = GetTextDimensions( f41_arg1.maxLocalizedText or f41_arg1.localizedText, f41_arg1.font.Font, f41_arg1.font.Height )
	local f41_local4 = f41_local2 - f41_local0
	local f41_local5 = CoD.CreateState( f41_arg1.left, -f41_arg1.font.Height / 2 + (f41_arg1.top or 2), nil, nil, f41_arg1.anchorType )
	f41_local5.font = f41_arg1.font.Font
	f41_local5.color = f41_arg1.color
	f41_local5.height = f41_arg1.font.Height
	f41_local5.width = f41_local4
	local self = LUI.UIText.new( f41_local5 )
	self:setText( f41_arg1.localizedText )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	f41_arg0:addElement( self )
	if f41_arg1.storedId then
		OpLeaderboardDataController[f41_arg1.storedId] = self
	end
	return f41_local4
end

function AddPercentMaterial( f42_arg0, f42_arg1, f42_arg2 )
	local f42_local0 = "h1_ui_deco_leaderboard_top1"
	if f42_arg2.percentNum == 5 then
		f42_local0 = "h1_ui_deco_leaderboard_top5"
	elseif f42_arg2.percentNum == 10 then
		f42_local0 = "h1_ui_deco_leaderboard_top10"
	end
	local f42_local1 = nil
	if f42_arg2.leftOffset ~= nil then
		f42_local1 = f42_arg2.leftOffset - f42_arg0.percentMatWidth
	end
	local f42_local2 = nil
	if f42_arg2.topOffset ~= nil then
		f42_local2 = f42_arg2.topOffset + -f42_arg2.height / 2
	end
	local f42_local3 = CoD.CreateState( f42_local1, f42_local2, nil, nil, CoD.AnchorTypes.Left )
	f42_local3.width = f42_arg0.percentMatWidth
	f42_local3.height = f42_arg2.height
	f42_local3.alpha = f42_arg2.alpha and 1 or f42_arg2.alpha
	f42_local3.material = RegisterMaterial( f42_local0 )
	local self = LUI.UIImage.new( f42_local3 )
	self.defState = f42_local3
	f42_arg1:addElement( self )
	return self
end

function AddTopPlayersPercentElement( f43_arg0, f43_arg1 )
	local f43_local0 = CoD.CreateState( f43_arg1.left, nil, nil, nil, f43_arg1.anchorType )
	f43_local0.width = f43_arg1.width
	f43_local0.height = f43_arg1.height
	local self = LUI.UIElement.new( f43_local0 )
	f43_arg0:addElement( self )
	local f43_local2 = OpLeaderboardDataController.GetScoped()
	local f43_local3 = 0.2
	f43_local2.percentMatWidth = f43_local0.width * f43_local3
	AddPercentMaterial( f43_local2, self, {
		percentNum = f43_arg1.percentNum,
		height = OpLeaderboard.CenterPanel.Leaderboard.List.RowHeight
	} )
	local f43_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
	f43_local4.width = f43_local0.width * (1 - f43_local3)
	f43_local4.height = f43_local0.height
	f43_local4.material = RegisterMaterial( "h1_ui_deco_leaderboard_top_diaglines_bg" )
	local self = LUI.UIImage.new( f43_local4 )
	self:addElement( self )
	AddTextElement( self, {
		localizedText = f43_arg1.percentNum .. "%",
		font = f43_arg1.percentNumFont,
		color = f43_arg1.textColor,
		anchorType = CoD.AnchorTypes.None
	} )
	return f43_arg1.width
end

function AddHeaderStatRow( f44_arg0, f44_arg1 )
	local f44_local0 = CoD.TextSettings.Font21
	local f44_local1 = CoD.TextSettings.Font27
	local f44_local2 = LUI.Scoreboard.DataGrayColor
	local f44_local3 = Colors.white
	local f44_local4 = 45
	local f44_local5 = 10
	local f44_local6 = 3
	local f44_local7 = OpLeaderboard.CenterPanel.Leaderboard.Header.Rect
	local f44_local8 = f44_local7.top
	f44_local7.top = 16
	f44_local7.material = RegisterMaterial( "black" )
	local self = LUI.UIElement.new( f44_local7 )
	f44_local7.top = f44_local8
	f44_local6 = f44_local6 + f44_local5 + AddTextElement( self, {
		left = f44_local6,
		localizedText = Engine.ToUpperCase( Engine.Localize( "@MENU_TOP_PLAYERS" ) ),
		font = f44_local0,
		color = f44_local2,
		anchorType = CoD.AnchorTypes.Left
	} )
	local f44_local10 = {
		left = f44_local6,
		anchorType = CoD.AnchorTypes.Left,
		width = 50,
		height = OpLeaderboard.CenterPanel.Leaderboard.List.RowHeight,
		percentNum = 1,
		percentNumFont = f44_local0,
		textColor = f44_local3
	}
	f44_local6 = f44_local6 + f44_local5 + AddTopPlayersPercentElement( self, f44_local10 )
	f44_local10.left = f44_local6
	f44_local10.percentNum = 5
	f44_local6 = f44_local6 + f44_local5 + AddTopPlayersPercentElement( self, f44_local10 )
	f44_local10.left = f44_local6
	f44_local10.percentNum = 10
	f44_local6 = f44_local6 + f44_local4 + AddTopPlayersPercentElement( self, f44_local10 )
	local f44_local11 = 1
	f44_local6 = f44_local6 + 10 + AddTextElement( self, {
		left = f44_local6,
		localizedText = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_INTHETOP" ) ),
		font = f44_local0,
		color = f44_local2,
		anchorType = CoD.AnchorTypes.Left
	} )
	f44_local6 = f44_local6 + f44_local4 + AddTextElement( self, {
		left = f44_local6,
		top = f44_local11,
		localizedText = "--",
		font = f44_local1,
		color = f44_local3,
		anchorType = CoD.AnchorTypes.Left,
		storedId = "topPlayersText",
		maxLocalizedText = "100%"
	} )
	f44_local6 = f44_local6 + 15 + AddTextElement( self, {
		left = f44_local6,
		localizedText = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_NUMOFPLAYERS" ) ),
		font = f44_local0,
		color = f44_local2,
		anchorType = CoD.AnchorTypes.Left
	} )
	f44_local6 = f44_local6 + f44_local4 + AddTextElement( self, {
		left = f44_local6,
		top = f44_local11,
		localizedText = "--",
		font = f44_local1,
		color = f44_local3,
		anchorType = CoD.AnchorTypes.Left,
		storedId = "numPlayersText"
	} )
	f44_arg1:addElement( self )
end

function UpdateHeaderStatRow()
	local f45_local0 = OpLeaderboardDataController.GetScoped()
	local f45_local1 = f45_local0.leaderboardPageTop + f45_local0.leaderboardPageRow
	local f45_local2 = Leaderboards.GetPlayerCount()
	if f45_local2 ~= 0 and f45_local1 then
		if f45_local0.localPlayerIsUnranked then
			f45_local1 = f45_local1 - 1
		end
		if f45_local1 ~= 0 then
			OpLeaderboardDataController.topPlayersText:setText( math.ceil( f45_local1 or f45_local2 / f45_local2 * 100 - 0 ) .. "%" )
		else
			OpLeaderboardDataController.topPlayersText:setText( "--" )
		end
	end
	if f45_local2 and f45_local2 >= 0 then
		OpLeaderboardDataController.numPlayersText:setText( f45_local2 )
	end
end

function AddLeaderboardHeader( f46_arg0, f46_arg1 )
	local f46_local0 = f0_local1
	local f46_local1 = OperatorMenuUtil.UIGetItemUIElement( nil, OpLeaderboard.CenterPanel.Leaderboard.Header.Rect )
	local f46_local2 = OperatorMenuUtil.UIGetItemUIImageColor( nil, OpLeaderboard.CenterPanel.Leaderboard.Header.Rect, Swatches.OpLeaderboard.Header.BackgroundColor, Swatches.OpLeaderboard.Header.BackgroundAlpha )
	local f46_local3 = OpLeaderboard.CenterPanel.Leaderboard.List.RowInitialXOffset - OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap
	f46_local1:addElement( f46_local2 )
	local f46_local4 = #f46_arg0.columnInfo
	for f46_local16, f46_local17 in ipairs( f46_arg0.columnInfo ) do
		local f46_local8 = f46_local17.width
		if f46_local16 == OpLeaderboard.GetDynamicColumnIndex( f46_arg0.categoryId ) then
			f46_local8 = OpLeaderboard.CenterPanel.Leaderboard.List.Rect.width
			for f46_local12, f46_local13 in ipairs( f46_arg0.columnInfo ) do
				if f46_local12 ~= f46_local16 then
					f46_local8 = f0_local0
				end
			end
		end
		local f46_local9 = CoD.CreateState( f46_local3, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
		if f46_local16 == OpLeaderboard.Boards.RankDataIndex then
			local f46_local14 = f46_local8
		end
		f46_local9.width = f46_local14 or f46_local8 - OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap
		f46_local9.material = RegisterMaterial( "h1_ui_scoreboard_dataheader_bg" )
		f46_local1:addElement( LUI.UIImage.new( f46_local9 ) )
		local f46_local11 = Engine.ToUpperCase( Engine.Localize( f46_local17.text ) )
		local f46_local12 = f46_local17.alignment
		local f46_local13 = {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = f46_local3 + OpLeaderboard.CenterPanel.Leaderboard.List.RowTextHPadding,
			width = f46_local8 - 2 * OpLeaderboard.CenterPanel.Leaderboard.List.RowTextHPadding,
			top = -0.5 * f46_local0.Height,
			height = f46_local0.Height
		}
		if f46_local16 == OpLeaderboard.Boards.RankDataIndex then
			f46_local13.left = f46_local13.left + f46_arg0.positionGapOffset + 2
		end
		local f46_local15 = OperatorMenuUtil.UIGetItemUIElement( nil, f46_local13 )
		f46_local15:addElement( OperatorMenuUtil.UIGetItemUIText( nil, nil, f46_local11, CoD.TextStyle.None, f46_local0, Swatches.OpLeaderboard.Header.FontColor, Swatches.OpLeaderboard.Header.FontAlpha, f46_local12 ) )
		f46_local1:addElement( f46_local15 )
		f46_local3 = f46_local3 + f46_local8
	end
	f46_arg1:addElement( f46_local1 )
end

function AddLeaderboardAddRow( f47_arg0, f47_arg1, f47_arg2 )
	local f47_local0 = f0_local2
	local f47_local1 = f0_local2
	local f47_local2 = OpLeaderboardMenu.controllerIndex
	local f47_local3 = #f47_arg0.columnInfo
	local f47_local4, f47_local5, f47_local6 = nil
	f47_local4 = {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		width = OpLeaderboard.CenterPanel.Leaderboard.List.Rect.width,
		top = (f47_arg2 - 3) * OpLeaderboard.CenterPanel.Leaderboard.List.RowVSkip + OpLeaderboard.CenterPanel.Leaderboard.List.RowOffset,
		height = OpLeaderboard.CenterPanel.Leaderboard.List.RowHeight
	}
	f47_local6 = OperatorMenuUtil.UIGetItemUIButtonNoStates( "opleaderboard_row_button_" .. tostring( f47_arg2 ) )
	f47_local6:makeFocusable()
	f47_local6:setHandleMouseButton( true )
	f47_local6.properties = {
		rowScreenIndex = f47_arg2
	}
	local f47_local7 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local7, f47_local4 )
	f47_local7.top = f47_local7.top - 50
	f47_local6:registerAnimationState( "default", f47_local7 )
	local f47_local8 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local8, f47_local4 )
	f47_local6:registerAnimationState( "focused", f47_local8 )
	f47_local6:registerEventHandler( "button_over", RowButtonOverHandler )
	f47_local6:registerEventHandler( "button_up", RowButtonUpHandler )
	f47_local6:registerEventHandler( "gamepad_button", RowButtonGamepadButtonHandler )
	f47_local6:registerEventHandler( "button_action", RowButtonActionHandler )
	f47_local6:registerEventHandler( "gain_focus", rowButtonGainFocus )
	f47_local6:registerEventHandler( "lose_focus", rowButtonLoseFocus )
	local f47_local9 = OperatorMenuUtil.UIGetItemUIImage( nil, nil, RegisterMaterial( "white" ), 1 )
	f47_local9.properties = {
		rowScreenIndex = f47_arg2
	}
	local f47_local10 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local10, nil )
	OperatorMenuUtil.UIItemDefAppendStateMaterial( f47_local10, RegisterMaterial( "white" ) )
	OperatorMenuUtil.UIItemDefAppendStateColor( f47_local10, Swatches.OpLeaderboard.List.BackgroundColor )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local10, Swatches.OpLeaderboard.List.BackgroundAlpha )
	f47_local9:registerAnimationState( "default", f47_local10 )
	local f47_local11 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local11, nil )
	OperatorMenuUtil.UIItemDefAppendStateMaterial( f47_local11, RegisterMaterial( "white" ) )
	OperatorMenuUtil.UIItemDefAppendStateColor( f47_local11, Swatches.OpLeaderboard.List.BackgroundYouColor )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local11, Swatches.OpLeaderboard.List.BackgroundYouAlpha )
	f47_local9:registerAnimationState( "default_you", f47_local11 )
	local f47_local12 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local12, nil )
	OperatorMenuUtil.UIItemDefAppendStateMaterial( f47_local12, RegisterMaterial( "white" ) )
	OperatorMenuUtil.UIItemDefAppendStateColor( f47_local12, Swatches.OpLeaderboard.List.SelectedColor )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local12, Swatches.OpLeaderboard.List.SelectedAlpha )
	f47_local9:registerAnimationState( "focused", f47_local12 )
	local f47_local13 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local13, nil )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local13, 0 )
	f47_local9:registerAnimationState( "hidden", f47_local13 )
	f47_local9:animateToState( "default" )
	f47_local9:registerEventHandler( "opleaderboard_selection_changed", RowButtonImageSelectionChangedHandler )
	f47_local9:registerEventHandler( "button_over", RowButtonImageButtonOverHandler )
	f47_local9:registerEventHandler( "button_up", RowButtonImageButtonUpHandler )
	f47_local6:addElement( f47_local9 )
	local f47_local14 = OpLeaderboard.CenterPanel.Leaderboard.List.RowInitialXOffset - OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap
	for f47_local36, f47_local37 in ipairs( f47_arg0.columnInfo ) do
		local f47_local18 = f47_local37.width
		if f47_local36 == OpLeaderboard.GetDynamicColumnIndex( f47_arg0.categoryId ) then
			f47_local18 = OpLeaderboard.CenterPanel.Leaderboard.List.Rect.width
			for f47_local22, f47_local23 in ipairs( f47_arg0.columnInfo ) do
				if f47_local22 ~= f47_local36 then
					f47_local18 = f0_local0
				end
			end
		end
		local f47_local19 = f47_local37.dataIndex
		local f47_local20 = f47_local37.lbVarType
		local f47_local21 = f47_local37.alignment
		local f47_local22 = 0
		if f47_local20 == LBVarType.Rank then
			f47_local22 = OpLeaderboard.CenterPanel.Leaderboard.List.RankIconX1 + OpLeaderboard.CenterPanel.Leaderboard.List.RankIconWidth + OpLeaderboard.CenterPanel.Leaderboard.List.RankIconX2
			local f47_local23 = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = f47_local14 + OpLeaderboard.CenterPanel.Leaderboard.List.RankIconX1,
				width = OpLeaderboard.CenterPanel.Leaderboard.List.RankIconWidth - OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap,
				top = OpLeaderboard.CenterPanel.Leaderboard.List.RankIconY + OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap,
				height = OpLeaderboard.CenterPanel.Leaderboard.List.RankIconHeight
			}
			local f47_local24 = nil
			local f47_local25 = OperatorMenuUtil.UIGetItemUIImage( "opleaderboard_rankicon_" .. tostring( f47_arg2 ) .. "_" .. tostring( f47_local36 ), f47_local23, RegisterMaterial( "white" ), 0 )
			local f47_local26 = {}
			OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local26, f47_local23 )
			OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local26, 1 )
			f47_local25:registerAnimationState( "showicon", f47_local26 )
			f47_local25.properties = {}
			f47_local25.properties.controllerIndex = f47_local2
			f47_local25.properties.rowScreenIndex = f47_arg2
			f47_local25.properties.colScreenIndex = f47_local36
			f47_local25.properties.colDataIndex = f47_local19
			f47_local25.properties.lbVarType = f47_local20
			f47_local25.properties.alignment = f47_local21
			f47_local25:registerEventHandler( "opleaderboard_clear_elements", CellRankIconClearHandler )
			f47_local25:registerEventHandler( "opleaderboard_update_elements", CellRankIconUpdateHandler )
			f47_local25:setPriority( 500 )
			f47_local6:addElement( f47_local25 )
			f47_local19 = f47_local37.dataIndex + 1
		end
		local f47_local24 = OperatorMenuUtil.UIGetItemUIElement( nil, {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = f47_local14,
			width = f47_local18,
			top = OpLeaderboard.CenterPanel.Leaderboard.List.RowTextOffset,
			height = OpLeaderboard.CenterPanel.Leaderboard.List.RowHeight
		} )
		local f47_local25 = f47_arg2 % 2 and LUI.Scoreboard.RowGrayColor or Colors.black
		local f47_local26 = CoD.CreateState
		local f47_local27 = 0
		local f47_local28 = OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap
		local f47_local29
		if f47_local19 == OpLeaderboard.Boards.RankDataIndex then
			f47_local29 = 0
			if not f47_local29 then
			
			else
				f47_local26 = f47_local26( f47_local27, f47_local28, f47_local29, 0, CoD.AnchorTypes.All )
				f47_local26.material = RegisterMaterial( "white" )
				f47_local26.color = f47_local25
				f47_local24:addElement( LUI.UIImage.new( f47_local26 ) )
				f47_local28 = f47_local22
				if f47_local20 ~= LBVarType.Rank then
					f47_local28 = f47_local28 + OpLeaderboard.CenterPanel.Leaderboard.List.RowTextHPadding
				end
				f47_local29 = 0
				if f47_local20 ~= LBVarType.Rank then
					f47_local29 = f47_local29 - OpLeaderboard.CenterPanel.Leaderboard.List.RowTextHPadding
				end
				local f47_local30 = {
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true
				}
				local f47_local31
				if f47_local36 == OpLeaderboard.Boards.RankDataIndex then
					f47_local31 = f47_local28 + f47_arg0.positionGapOffset
					if not f47_local31 then
					
					else
						f47_local30.left = f47_local31
						f47_local30.right = f47_local29
						f47_local30.top = -0.5 * f47_local0.Height + OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap
						f47_local30.height = f47_local0.Height
						f47_local31 = OperatorMenuUtil.UIGetItemUIElement( nil, f47_local30 )
						f47_local24:addElement( f47_local31 )
						local f47_local32 = nil
						f47_local32 = "opleaderboard_cell_" .. tostring( f47_arg2 ) .. "_" .. tostring( f47_local36 )
						local f47_local33
						if f47_local19 == OpLeaderboard.Boards.RankDataIndex then
							f47_local33 = LUI.Scoreboard.RankNumColor
							if not f47_local33 then
							
							else
								local f47_local34 = Swatches.OpLeaderboard.List.FontAlpha
								local f47_local35 = OperatorMenuUtil.UIGetItemUIText( f47_local32, nil, "", CoD.TextStyle.None, f47_local0, f47_local33, f47_local34, f47_local21 )
								f47_local35.properties = {}
								f47_local35.properties.controllerIndex = f47_local2
								f47_local35.properties.rowScreenIndex = f47_arg2
								f47_local35.properties.colScreenIndex = f47_local36
								f47_local35.properties.colDataIndex = f47_local19
								f47_local35.properties.lbVarType = f47_local20
								f47_local35.properties.alignment = f47_local21
								f47_local35:registerAnimationState( "default_you", {
									topAnchor = true,
									bottomAnchor = false,
									leftAnchor = true,
									rightAnchor = true,
									height = f47_local1.Height,
									font = f47_local1.Font,
									color = f47_local33,
									alpha = f47_local34,
									glowColor = nil
								} )
								if f47_local19 ~= OpLeaderboard.Boards.RankDataIndex then
									f47_local35:registerAnimationState( "focused", {
										color = LUI.Scoreboard.PlayerNameHighlightColor,
										alpha = Swatches.OpLeaderboard.List.FontFocusedAlpha,
										glowColor = Colors.generic_highlight_glow
									} )
								end
								f47_local35:registerEventHandler( "opleaderboard_clear_elements", CellTextClearHandler )
								f47_local35:registerEventHandler( "opleaderboard_update_elements", CellTextUpdateHandler )
								if f47_local19 == OpLeaderboard.Boards.PositionDataIndex then
									f47_local35.percentMat = AddPercentMaterial( f47_arg0, f47_local6, {
										percentNum = 1,
										height = OpLeaderboard.CenterPanel.Leaderboard.List.RowHeight - 2,
										topOffset = 0,
										leftOffset = 1,
										alpha = 0
									} )
								end
								if Engine.IsPC() and f47_local19 == OpLeaderboard.Boards.NameDataIndex and f47_local35.setupAutoScaleText then
									f47_local35:setupAutoScaleText()
								end
								f47_local31:addElement( f47_local35 )
								f47_local6:addElement( f47_local24 )
								f47_local14 = f47_local14 + f47_local18
							end
						end
						f47_local33 = LUI.Scoreboard.DataGrayColor
					end
				end
				f47_local31 = f47_local28
			end
		end
		f47_local29 = -OpLeaderboard.CenterPanel.Leaderboard.List.RowAndColumnGap
	end
	f47_local15 = "opleaderboard_cellborder_" .. tostring( f47_arg2 ) .. "_" .. tostring( colScreenIndex )
	f47_local16 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = -1,
		right = 1,
		top = -1,
		bottom = 2
	}
	
	highlight = OperatorMenuUtil.UIGetItemUIImage( f47_local15, f47_local16, RegisterMaterial( "btn_focused_rect_innerglow" ), 0 )
	highlight.properties = {}
	highlight.properties.rowScreenIndex = f47_arg2
	highlight:setup9SliceImage( 8, 8, 0.1, 0.1 )
	highlight:setTileHorizontally( false )
	highlight:setTileVertically( false )
	f47_local36 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f47_local36, f47_local16 )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local36, 1 )
	highlight:registerAnimationState( "focused", f47_local36 )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f47_local36, LUI.Leaderboard.disabledHighlightAlpha )
	highlight:registerAnimationState( "disabledFocus", f47_local36 )
	highlight:registerEventHandler( "opleaderboard_selection_changed", RowButtonBorderGeneralHandler )
	highlight:registerEventHandler( "opleaderboard_update_elements", RowButtonBorderGeneralHandler )
	highlight:registerEventHandler( "button_over", RowButtonBorderGeneralHandler )
	highlight:registerEventHandler( "button_up", RowButtonBorderGeneralHandler )
	f47_local6:addElement( highlight )
	f47_local6.highlight = highlight
	
	f47_local6:animateToState( "default" )
	f47_arg1:addElement( f47_local6 )
	return f47_local6
end

function OnArrowLeftMouseDown( f48_arg0, f48_arg1 )
	if f48_arg0.arrowImage ~= nil then
		f48_arg0.arrowImage:animateInSequence( {
			{
				"highlight",
				0
			},
			{
				"pulse",
				100
			},
			{
				"highlight",
				100
			}
		} )
	end
end

function OnArrowMouseEnter( f49_arg0, f49_arg1 )
	if f49_arg0.arrowImage ~= nil then
		f49_arg0.arrowImage:animateToState( "highlight" )
	end
end

function OnArrowMouseLeave( f50_arg0, f50_arg1 )
	if f50_arg0.arrowImage ~= nil then
		f50_arg0.arrowImage:animateToState( "default" )
	end
end

function AddLeaderboard( f51_arg0, f51_arg1 )
	local f51_local0 = OpLeaderboardMenu.controllerIndex
	local f51_local1 = OperatorMenuUtil.UIGetItemUIElement( nil, OpLeaderboard.CenterPanel.Leaderboard.Rect )
	AddLeaderboardHeader( f51_arg0, f51_local1 )
	AddHeaderStatRow( f51_arg0, f51_local1 )
	local f51_local2 = nil
	local f51_local3 = OperatorMenuUtil.UIGetItemUIVerticalList( nil, OpLeaderboard.CenterPanel.Leaderboard.List.Rect )
	OpLeaderboardDataController.uiitemList = f51_local3
	LUI.UIVerticalList.SetNoWrap( f51_local3, true )
	for f51_local4 = 1, OpLeaderboard.CenterPanel.Leaderboard.List.NumRowsToDisplay, 1 do
		local f51_local7 = AddLeaderboardAddRow( f51_arg0, f51_local3, f51_local4 )
		if f51_local4 == f51_arg0.leaderboardPageRow then
			f51_local2 = f51_local7
		end
	end
	f51_local3:animateToState( "default" )
	f51_local3:setHandleMouse( true )
	f51_local3:registerEventHandler( "mouseenter", listLeaderboardMouseEnter )
	f51_local1:addElement( f51_local3 )
	local f51_local4 = OpLeaderboard.CenterPanel.Leaderboard.Footer.Font
	local f51_local5 = OpLeaderboard.CenterPanel.Leaderboard.Footer.Rect.width
	local f51_local6 = OpLeaderboard.CenterPanel.Leaderboard.Footer.Rect.height
	local f51_local8 = OpLeaderboard.CenterPanel.Leaderboard.Footer.TextWidth
	local f51_local7 = OpLeaderboard.CenterPanel.Leaderboard.Footer.GapX
	local f51_local9 = 32
	local f51_local10 = 32
	local f51_local11 = OpLeaderboard.CenterPanel.Leaderboard.Footer.ButtonWidth
	local f51_local12 = OpLeaderboard.CenterPanel.Leaderboard.Footer.ButtonHeight
	local f51_local13 = OperatorMenuUtil.UIGetItemUIElement( nil, OpLeaderboard.CenterPanel.Leaderboard.Footer.Rect )
	OpLeaderboardDataController.uiitemFooter = f51_local13
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = -f51_local8 / 2,
		width = f51_local8,
		top = -f51_local4.Height * 0.5,
		height = f51_local4.Height,
		font = f51_local4.Font,
		color = Swatches.OpLeaderboard.Footer.FontColor,
		alpha = Swatches.OpLeaderboard.Footer.FontAlpha
	} )
	self:registerEventHandler( "opleaderboard_selection_changed", FooterTextItemSelectionChangedHandler )
	self:registerEventHandler( "opleaderboard_update_elements", FooterTextItemUpdateHandler )
	f51_local13:addElement( self )
	local f51_local15 = {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		left = f51_local7,
		width = f51_local11,
		top = -f51_local12 * 0.5 - 1,
		height = f51_local12
	}
	local f51_local16 = OperatorMenuUtil.UIGetItemUIButtonNoStates( "opleaderboard_page_down_button" )
	f51_local16:setHandleMouseMove( true )
	f51_local16:makeFocusable()
	f51_local16:setHandleMouseButton( true )
	local f51_local17 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f51_local17, f51_local15 )
	f51_local16:registerAnimationState( "default", f51_local17 )
	f51_local16:registerEventHandler( "button_action", ButtonActionHandlerPageDownButton )
	f51_local16:animateToState( "default" )
	local f51_local18 = OperatorMenuUtil.UIGetItemUIImage( nil, nil, RegisterMaterial( "s1_icon_down" ), 1 )
	local f51_local19 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f51_local19.width = f51_local9
	f51_local19.height = f51_local10
	OperatorMenuUtil.UIItemDefAppendStateMaterial( f51_local19, RegisterMaterial( "s1_icon_down" ) )
	OperatorMenuUtil.UIItemDefAppendStateColor( f51_local19, {
		r = 1,
		g = 1,
		b = 1
	} )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f51_local19, Engine.IsPC() and 0.8 or 1 )
	if Engine.IsPC() then
		f51_local19.scale = 0
	end
	f51_local18:registerAnimationState( "default", f51_local19 )
	f51_local18:animateToState( "default" )
	f51_local16.arrowImage = f51_local18
	if Engine.IsPC() then
		f51_local16:registerEventHandler( "leftmousedown", OnArrowLeftMouseDown )
		f51_local18:registerAnimationState( "highlight", {
			alpha = 1,
			scale = 0
		} )
		f51_local18:registerAnimationState( "pulse", {
			scale = -0.1
		} )
		f51_local16:registerEventHandler( "mouseenter", OnArrowMouseEnter )
		f51_local16:registerEventHandler( "mouseleave", OnArrowMouseLeave )
	end
	f51_local16:addElement( f51_local18 )
	self:addElement( f51_local16 )
	local f51_local20 = {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = -f51_local11 - f51_local7,
		width = f51_local11,
		top = -f51_local12 * 0.5 - 1,
		height = f51_local12
	}
	local f51_local21 = OperatorMenuUtil.UIGetItemUIButtonNoStates( "opleaderboard_page_up_button" )
	f51_local21:setHandleMouseMove( true )
	f51_local21:makeFocusable()
	f51_local21:setHandleMouseButton( true )
	local f51_local22 = {}
	OperatorMenuUtil.UIItemDefAppendStateFullRect( f51_local22, f51_local20 )
	f51_local21:registerAnimationState( "default", f51_local22 )
	f51_local21:registerEventHandler( "button_action", ButtonActionHandlerPageUpButton )
	f51_local21:animateToState( "default" )
	local f51_local23 = OperatorMenuUtil.UIGetItemUIImage( nil, nil, RegisterMaterial( "s1_icon_up" ), 1 )
	local f51_local24 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f51_local24.width = f51_local9
	f51_local24.height = f51_local10
	OperatorMenuUtil.UIItemDefAppendStateMaterial( f51_local24, RegisterMaterial( "s1_icon_up" ) )
	OperatorMenuUtil.UIItemDefAppendStateColor( f51_local24, {
		r = 1,
		g = 1,
		b = 1
	} )
	OperatorMenuUtil.UIItemDefAppendStateAlpha( f51_local24, Engine.IsPC() and 0.8 or 1 )
	if Engine.IsPC() then
		f51_local24.scale = 0
	end
	f51_local23:registerAnimationState( "default", f51_local24 )
	f51_local23:animateToState( "default" )
	f51_local21.arrowImage = f51_local23
	if Engine.IsPC() then
		f51_local21:registerEventHandler( "leftmousedown", OnArrowLeftMouseDown )
		f51_local23:registerAnimationState( "highlight", {
			alpha = 1,
			scale = 0
		} )
		f51_local23:registerAnimationState( "pulse", {
			scale = -0.1
		} )
		f51_local21:registerEventHandler( "mouseenter", OnArrowMouseEnter )
		f51_local21:registerEventHandler( "mouseleave", OnArrowMouseLeave )
	end
	f51_local21:addElement( f51_local23 )
	self:addElement( f51_local21 )
	f51_local1:addElement( f51_local13 )
	f51_arg1:addElement( f51_local1 )
	if f51_local2 then
		f51_local2:processEvent( {
			name = "lose_focus"
		} )
	end
end

function listLeaderboardMouseEnter( f52_arg0, f52_arg1 )
	Engine.PlaySound( CoD.SFX.MouseOver )
end

function OpLeaderboardInfo( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( CoD.DesignGridHelper( 6, 1 ), 0, 0, 0, CoD.AnchorTypes.TopLeft ) )
	local f53_local1 = OpLeaderboardDataController.GetScoped()
	f53_local1.isLeaderboardFocused = false
	OpLeaderboardDataController.uiitemPanel = nil
	OpLeaderboardDataController.uiitemList = nil
	OpLeaderboardDataController.uiitemFooter = nil
	OpLeaderboardDataController.Init( controller.categoryId )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.properties = {}
	self:addElement( self )
	OperatorMenuUtil.InitPanels( "opleaderboard", 0 )
	local f53_local3 = CreateInfoPanel()
	OpLeaderboardDataController.uiitemPanel = f53_local3
	f53_local1.positionGapOffset = 0
	AddLeaderboard( f53_local1, f53_local3 )
	f53_local3:registerEventHandler( "opleaderboard_update_timer", PanelUpdateTimerHandler )
	f53_local3:addElement( OperatorMenuUtil.UIGetItemUITimer( "opleaderboard_update_timer_id", "opleaderboard_update_timer", 1000, false ) )
	f53_local3:registerEventHandler( "leaderboard_clear", PanelLeaderboardClearHandler )
	f53_local3:registerEventHandler( "leaderboard_read_delayfail", PanelLeaderboardReadDelayFailHandler )
	f53_local3:registerEventHandler( "leaderboard_refresh", PanelLeaderboardRefreshHandler )
	f53_local3:registerEventHandler( "menu_create", function ( element, event )
		OpLeaderboardDataController.Fetch()
	end )
	self:addElement( f53_local3 )
	Engine.SetNpPlusNotifyAsyncMultiplay()
	OpLeaderboardMenu.menu.list:processEvent( {
		name = "gain_focus"
	} )
	return self
end

LUI.MenuBuilder.registerType( "OpLeaderboardInfo", OpLeaderboardInfo )
LockTable( _M )
