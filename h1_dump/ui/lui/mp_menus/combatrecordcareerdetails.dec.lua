local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function GetCareerBestsInfoString( f1_arg0, f1_arg1 )
	local f1_local0 = nil
	if f1_arg1 then
		f1_local0 = Engine.Localize( f1_arg1.bestsString, Engine.GetPlayerData( f1_arg0, CoD.StatsGroup.Common, "bests", f1_arg1.bestsVarName ) )
	end
	if not f1_local0 or f1_local0 == "" then
		f1_local0 = Engine.Localize( "@MPUI_COMBATRECORD_NA" )
	end
	return f1_local0
end

function bestsGridItem( f2_arg0 )
	local f2_local0 = LUI.UIVerticalList.new
	local f2_local1 = defaultState
	if not f2_local1 then
		f2_local1 = {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			left = 0,
			width = CombatRecord.MenuDimensions.width / 6,
			top = 0,
			bottom = 0
		}
	end
	f2_local0 = f2_local0( f2_local1 )
	f2_local0.id = "gridItemVL" .. f2_arg0.medalName
	f2_local0:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -50,
		width = 100,
		top = 0,
		height = 100,
		material = RegisterMaterial( f2_arg0.medalMaterial )
	} ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 5,
		height = CombatRecord.SmallFont.Height,
		font = CombatRecord.SmallFont.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center
	} )
	self:setText( Engine.Localize( "LUA_MP_FRONTEND_TIMES", f2_arg0.count ) )
	f2_local0:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		height = CombatRecord.SmallFont.Height,
		font = CombatRecord.SmallFont.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center
	} )
	self:setText( Engine.Localize( f2_arg0.medalTitle ) )
	f2_local0:addElement( self )
	return f2_local0
end

function bestsGrid( f3_arg0 )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( CombatRecord.MenuDimensions.width * 0.67, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "bestsGridContainer"
	self:addElement( CombatRecord.AddTitleText( Engine.Localize( "LUA_MP_FRONTEND_PERSONAL_BESTS" ) ) )
	local self = LUI.UIGrid.new( CoD.CreateState( 0, 40, 0, 0, CoD.AnchorTypes.All ), {
		elementsPerRow = 2,
		hSpacing = 20,
		vSpacing = 50,
		rowHeight = 100 + CoD.TextSettings.TitleFontSmall.Height,
		hAlign = LUI.Alignment.Center,
		vAlign = LUI.Alignment.Center
	} )
	for f3_local5, f3_local6 in ipairs( CombatRecord.GetBestSortedMedals( f3_arg0, 6 ) ) do
		self:addElement( bestsGridItem( f3_local6 ) )
	end
	self:addElement( self )
	return self
end

function statsItem( menu, controller )
	local self = LUI.UIHorizontalList.new( CoD.CreateState( 0, 0, 0, CoD.TextSettings.TitleFontSmall.Height, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "statsItemHL" .. menu
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CombatRecord.MenuDimensions.width / 6,
		top = 0,
		bottom = 0,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alignment = LUI.Alignment.Left
	} )
	self:setText( menu )
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		left = -(CombatRecord.MenuDimensions.width / 6),
		right = 0,
		top = 0,
		bottom = 0,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alignment = LUI.Alignment.Left
	} )
	self:setText( controller )
	self:addElement( self )
	return self
end

function statsVerticalList( f5_arg0 )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( CombatRecord.MenuDimensions.width / 3, 0, -CombatRecord.MenuDimensions.width / 3, 0, CoD.AnchorTypes.All ) )
	self.id = "statsVLContainer"
	self:addElement( CombatRecord.AddTitleText( Engine.Localize( "LUA_MP_FRONTEND_DETAILED_STATS" ) ) )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 50,
		right = 0,
		top = 40,
		bottom = 0,
		spacing = 30
	} )
	self.id = "statsVL"
	for f5_local5, f5_local6 in ipairs( CareerDetailsInfoTable ) do
		self:addElement( statsItem( Engine.Localize( f5_local6.text ), CombatRecord.GetRankedStatsInfoString( f5_arg0, f5_local6 ) ) )
	end
	self:addElement( self )
	return self
end

function combatRecordCareerDetails( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.exclusiveController
	local f6_local1 = LUI.MenuTemplate.new( f6_arg0, {
		menu_title = "@MPUI_COMBATRECORD_CAREER_CAPS"
	} )
	local self = LUI.UIHorizontalList.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = CombatRecord.MenuDimensions.left,
		width = CombatRecord.MenuDimensions.width,
		top = CombatRecord.MenuDimensions.top,
		height = CombatRecord.MenuDimensions.height
	} )
	self.id = "statsHL"
	self:addElement( CombatRecord.CareerInfoVerticalList( f6_local0 ) )
	self:addElement( statsVerticalList( f6_local0 ) )
	self:addElement( bestsGrid( f6_local0 ) )
	f6_local1:addElement( self )
	f6_local1:AddBackButton( function ( f7_arg0, f7_arg1 )
		LUI.FlowManager.RequestLeaveMenu( nil, nil, nil, f6_local0 )
	end )
	return f6_local1
end

LUI.MenuBuilder.registerType( "CombatRecordCareerDetails", combatRecordCareerDetails )
LockTable( _M )
