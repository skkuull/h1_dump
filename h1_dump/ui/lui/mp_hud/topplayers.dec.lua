local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.TopPlayers = InheritFrom( LUI.UIElement )
LUI.TopPlayers.CONTAINER_WIDTH = 380
LUI.TopPlayers.CONTAINER_HEIGHT = 100
LUI.TopPlayers.PlayerCardVertSpacing = LUI.TopPlayers.CONTAINER_HEIGHT + 27
f0_local0 = CoD.TextSettings.Font14
f0_local1 = CoD.TextSettings.Font27
f0_local2 = Colors.mp.aar_score_gold
local f0_local3 = Colors.h1.light_grey
local f0_local4 = 0
local f0_local5 = nil
local f0_local6 = 10
local f0_local7 = "@LUA_MENU_SCORE"
local f0_local8 = "@LUA_MENU_KILLS"
local f0_local9 = "@LUA_MENU_DEATHS"
local f0_local10 = "@MENU_RATIO"
local f0_local11 = "@MENU_ASSISTS"
local f0_local12 = 22
local f0_local13 = 1.32
local f0_local14 = 20
local f0_local15 = 3
function AddStat( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = 2
	local f1_local1 = Engine.ToUpperCase( Engine.Localize( f1_arg2 ) )
	local f1_local2, f1_local3, f1_local4, f1_local5 = GetTextDimensions2( f1_local1, f0_local0.Font, f0_local0.Height )
	local f1_local6 = f1_local4 - f1_local2
	local f1_local7, f1_local8, self, f1_local10 = GetTextDimensions2( f1_arg3, f0_local1.Font, f0_local1.Height )
	f1_local5 = f1_local10
	f1_local4 = self
	f1_local3 = f1_local8
	f1_local7 = f1_local4 - f1_local7
	f1_local8 = CoD.CreateState( f1_arg1, nil, nil, nil, CoD.AnchorTypes.Left )
	f1_local8.width = f1_local7 + f1_local6 + f1_local0
	f1_local8.height = f0_local1.Height
	self = LUI.UIElement.new( f1_local8 )
	f1_arg0:addElement( self )
	f1_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeft )
	f1_local10.width = f1_local6
	f1_local10.height = f0_local0.Height
	f1_local10.font = f0_local0.Font
	f1_local10.color = f0_local3
	local self = LUI.UIText.new( f1_local10 )
	self:setText( f1_local1 )
	self:addElement( self )
	local f1_local12 = CoD.CreateState( f1_local6 + f1_local0, -f0_local1.Height + f0_local15, nil, nil, CoD.AnchorTypes.BottomLeft )
	f1_local12.width = f1_local7
	f1_local12.height = f0_local1.Height
	f1_local12.font = f0_local1.Font
	f1_local12.color = f0_local2
	local self = LUI.UIText.new( f1_local12 )
	self:setText( f1_arg3 )
	self:addElement( self )
	return f1_local8.width + f0_local6
end

function AddPlayerCard( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.CreateState( f0_local4, f2_arg1.top + LUI.TopPlayers.PlayerCardVertSpacing, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local0.width = LUI.TopPlayers.CONTAINER_WIDTH
	f2_local0.height = LUI.TopPlayers.CONTAINER_HEIGHT
	local self = LUI.UIElement.new( f2_local0 )
	f2_arg0:addElement( self )
	local f2_local2 = Game.GetPlayerName()
	local f2_local3, f2_local4 = nil
	if Engine.InFrontend() then
		local f2_local5 = AAR.GetPlayerId( AAR.GetScoreboardType( f0_local5 ), f2_arg1.playerIndex - 1 )
		local f2_local6 = AAR.GetLocalPlayer( f0_local5 )
		f2_local2 = f2_local6 and AAR.GetPlayerFullName( f2_local6 )
		f2_local3 = AAR.GetPlayerCallingCard( f2_local5 )
		f2_local4 = AAR.GetPlayerEmblem( f2_local5 )
	else
		local f2_local7 = Game.GetPlayerCard( f2_arg1.data.client )
		if f2_local7 then
			local f2_local8 = f2_local7.background
		end
		f2_local3 = f2_local8 or 0
		if f2_local7 then
			local f2_local9 = f2_local7.patch
		end
		f2_local4 = f2_local9 or 0
	end
	if f2_arg1.data.client == Game.GetPlayerClientnum() or f2_arg1.data.isLocalPlayer then
		local f2_local7 = CoD.CreateState( nil, 0, nil, nil, CoD.AnchorTypes.Top )
		f2_local7.width = LUI.Playercard.Width * f0_local13 + f0_local12 + 21
		f2_local7.height = LUI.TopPlayers.CONTAINER_HEIGHT + f0_local1.Height + 12
		self:addElement( LUI.DecoFrame.new( f2_local7, LUI.DecoFrame.Highlight ) )
	end
	self:addElement( LUI.Playercard.new( {
		scale = f0_local13 - 1,
		left = 63,
		leftAnchor = true
	}, {
		gamertag = f2_arg1.data.name,
		background = f2_local3,
		emblem = f2_local4,
		rank = f2_arg1.data.rank,
		leftBorderExtension = f0_local12,
		layoutName = "TopPlayers"
	} ) )
	local f2_local6 = "h1_ffa_1st_place_bar"
	if f2_arg1.placeNum == 2 then
		f2_local6 = "h1_ffa_2nd_place_bar"
	elseif f2_arg1.placeNum == 3 then
		f2_local6 = "h1_ffa_3rd_place_bar"
	end
	local f2_local10 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.Left )
	f2_local10.material = RegisterMaterial( f2_local6 )
	f2_local10.width = f0_local14
	f2_local10.height = LUI.Playercard.Height * f0_local13
	self:addElement( LUI.UIImage.new( f2_local10 ) )
	local f2_local11 = 10
	local f2_local12 = LUI.TopPlayers.CONTAINER_WIDTH
	local f2_local13 = f0_local1.Height
	local f2_local14 = CoD.CreateState( nil, f2_local10.height / 2 + f2_local11, nil, nil, CoD.AnchorTypes.None )
	f2_local14.width = f2_local12
	f2_local14.height = f2_local13
	local self = LUI.UIElement.new( f2_local14 )
	self:addElement( self )
	local f2_local16 = 0
	local f2_local17 = GameX.GetGameMode()
	if not f2_local17 then
		f2_local17 = AAR.GetGameMode( f0_local5 )
	end
	local f2_local18, f2_local19 = nil
	if not Engine.InFrontend() then
		f2_local18 = string.format( "%.2f", tostring( f2_arg1.data.deaths and f2_arg1.data.kills or f2_arg1.data.kills / f2_arg1.data.deaths ) )
		local f2_local20 = {}
		local f2_local21 = LUI.ScoreboardStats.SCORE
		local f2_local22
		if f2_local17 == "dm" then
			f2_local22 = f2_arg1.data.extrascore0
			if not f2_local22 then
			
			else
				f2_local20[f2_local21] = f2_local22
				f2_local20[LUI.ScoreboardStats.KILLS] = f2_arg1.data.kills
				f2_local20[LUI.ScoreboardStats.DEATHS] = f2_arg1.data.deaths
				f2_local20[LUI.ScoreboardStats.KDR] = f2_local18
				f2_local20[LUI.ScoreboardStats.ASSISTS] = f2_arg1.data.assists
				f2_local20[LUI.ScoreboardStats.EXTRASCORE0] = f2_arg1.data.extrascore0
				f2_local20[LUI.ScoreboardStats.EXTRASCORE1] = f2_arg1.data.extrascore1
				f2_local19 = f2_local20
			end
		end
		f2_local22 = f2_arg1.data.score
	end
	for f2_local20 = LUI.ScoreboardStats.SCORE, #LUI.ScoreboardStats.CustomStats[f2_local17].statNames, 1 do
		f2_local16 = f2_local16 + AddStat( self, f2_local16, LUI.ScoreboardStats.CustomStats[f2_local17].statNames[f2_local20], Engine.InFrontend() and f2_arg1.data.stats[f2_local20 - 1] or f2_local19[LUI.ScoreboardStats.CustomStats[f2_local17].statValsIdx[f2_local20]] )
	end
	f2_local14.width = f2_local16 - f0_local6
	self:registerAnimationState( "default", f2_local14 )
	self:animateToState( "default" )
end

LUI.TopPlayers.new = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controller
	if not f3_local0 then
		f3_local0 = Engine.GetFirstActiveController()
	end
	f0_local5 = f3_local0
	f3_local0 = f3_arg1.playerData
	f0_local4 = f3_arg1.leftOffset or 0
	local f3_local1 = f3_arg1.defState
	if not f3_local1 then
		f3_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	end
	f3_local1.width = LUI.Playercard.Width * f0_local13 + f0_local14
	f3_local1.height = LUI.TopPlayers.PlayerCardVertSpacing * #f3_local0
	local self = LUI.UIElement.new( f3_local1 )
	local f3_local3 = f3_local0[1]
	local f3_local4 = f3_local0[1]
	f3_local3.placingNum = 1
	AddPlayerCard( self, {
		left = f3_local4.left,
		top = f3_local4.top,
		data = f3_local4.data,
		placeNum = f3_local3.placingNum,
		playerIndex = 1
	} )
	for f3_local5 = 2, #f3_local0, 1 do
		f3_local4 = f3_local0[f3_local5]
		local f3_local8 = nil
		if (Engine.InFrontend() and f3_local4.data.stats[LUI.ScoreboardStats.SCORE] or f3_local4.data.score) == (Engine.InFrontend() and f3_local3.data.stats[LUI.ScoreboardStats.SCORE] or f3_local3.data.score) and (Engine.InFrontend() and f3_local4.data.stats[LUI.ScoreboardStats.DEATHS] or f3_local4.data.deaths) == (Engine.InFrontend() and f3_local3.data.stats[LUI.ScoreboardStats.DEATHS] or f3_local3.data.deaths) then
			f3_local8 = f3_local3.placingNum
		else
			f3_local8 = f3_local5
		end
		f3_local4.placingNum = f3_local8
		AddPlayerCard( self, {
			left = f3_local4.left,
			top = f3_local4.top,
			data = f3_local4.data,
			placeNum = f3_local8,
			playerIndex = f3_local5
		} )
		f3_local3 = f3_local4
	end
	return self
end

LUI.MenuBuilder.registerType( "topPlayers", LUI.TopPlayers.new )
LockTable( _M )
