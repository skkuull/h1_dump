local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	local self = LUI.UIVerticalList.new( CoD.CreateState( -(CombatRecord.PanelDimensions.width / 2), 0, 0, CombatRecord.PanelDimensions.height * 0.6, CoD.AnchorTypes.TopRight ) )
	self.id = "rankVL"
	self:addElement( CombatRecord.AddCurrentRankPanel( CoD.CreateState( 0, 0, 0, CombatRecord.PanelDimensions.height * 0.3, CoD.AnchorTypes.TopLeftRight ), f1_arg0 ) )
	self:addElement( CombatRecord.AddNextRankPanel( CoD.CreateState( 0, -(CombatRecord.PanelDimensions.height * 0.3), 0, 0, CoD.AnchorTypes.BottomLeftRight ), f1_arg0 ) )
	return self
end

f0_local1 = function ( f2_arg0 )
	local self = LUI.UIHorizontalList.new( CoD.CreateState( 0, 0, 0, CombatRecord.PanelDimensions.height * 0.6, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "careerPanelHL"
	self:addElement( addPlayerCardPanelVerticalList( f2_arg0 ) )
	self:addElement( f0_local0( f2_arg0 ) )
	return self
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	local self = LUI.UIVerticalList.new( f3_arg2 or {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		width = CombatRecord.MenuDimensions.width / 6,
		top = 0,
		bottom = 0,
		spacing = 7
	} )
	self.id = "gridItemVL" .. f3_arg0
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		height = f3_arg3.Height,
		font = f3_arg3.Font,
		alignment = LUI.Alignment.Center
	} )
	self:setText( f3_arg0 )
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		height = f3_arg4.Height,
		font = f3_arg4.Font,
		alignment = LUI.Alignment.Center
	} )
	self:setText( f3_arg1 )
	self:addElement( self )
	return self
end

local f0_local3 = function ( f4_arg0 )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( 0, -(CombatRecord.PanelDimensions.height * 0.4), 0, 0, CoD.AnchorTypes.BottomLeftRight ) )
	self.id = "statsGridContainer"
	local self = LUI.UIGrid.new( CoD.CreateState( 0, 15, 0, 0, CoD.AnchorTypes.All ), {
		elementsPerRow = 3,
		hSpacing = 150,
		vSpacing = 80,
		rowHeight = CoD.TextSettings.TitleFontMediumLargeBold.Height + CombatRecord.SmallFont.Height,
		hAlign = LUI.Alignment.Center,
		vAlign = LUI.Alignment.Center
	} )
	for f4_local5, f4_local6 in ipairs( CareerStatsInfoTable ) do
		self:addElement( f0_local2( Engine.Localize( f4_local6.text ), CombatRecord.GetRankedStatsInfoString( f4_arg0, f4_local6 ), nil, CoD.TextSettings.TitleFontSmall, CoD.TextSettings.TitleFontSmall ) )
	end
	self:addElement( self )
	return self
end

function addPlayerCardPanelVerticalList( f5_arg0 )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( 0, 0, CombatRecord.PanelDimensions.width / 2, 0, CoD.AnchorTypes.TopBottomLeft ) )
	local self = LUI.UIVerticalList.new( CoD.CreateState( 0, 50, 0, 0, CoD.AnchorTypes.All ) )
	local f5_local2 = CombatRecord.GetRankInfo( f5_arg0 )
	self:addElement( LUI.Playercard.new( {
		width = LUI.Playercard.Width,
		height = LUI.Playercard.Height,
		scale = -0.4
	}, {
		gamertag = Engine.GetUsernameByController( f5_arg0 ),
		background = Cao.GetCallingCard( f5_arg0 ),
		emblem = Cao.GetEmblemPatch( f5_arg0 ),
		xuid = Engine.GetXUIDByController( f5_arg0 ),
		prestige = f5_local2.prestige,
		rank = f5_local2.rank
	} ) )
	self:addElement( f0_local2( Engine.Localize( "LUA_MP_FRONTEND_COMBAT_TIME" ), CombatRecord.GetRankedStatsInfoString( f5_arg0, {
		statVarName = "timePlayedTotal",
		statsType = CareerStatsType.INT_TIME_IN_SECS_WORDS
	} ), {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		spacing = 7
	}, CoD.TextSettings.TitleFontMedium, CoD.TextSettings.TitleFontMedium ) )
	self:addElement( self )
	return self
end

function combatRecordCareerPanel( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.controller
	local f6_local1 = CombatRecord.CreateInfoPanel( f6_local0 )
	local self = LUI.UIVerticalList.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "careerPanelVL"
	self.focusable = false
	local f6_local3 = LUI.FlowManager.GetMenuScopedDataFromElement( f6_arg1.menu )
	f6_local3.controller = f6_local0 or f6_local3.controller
	self:addElement( f0_local1( f6_local3.controller ) )
	self:addElement( f0_local3( f6_local3.controller ) )
	f6_local1:addElement( self )
	return f6_local1
end

LUI.MenuBuilder.registerType( "CombatRecordCareerPanel", combatRecordCareerPanel )
LockTable( _M )
