local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 6
f0_local1 = 3
f0_local2 = 10
local f0_local3 = 18
local f0_local4 = -25
function medalsGridItem( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0 = LUI.MedalCard.new( f1_arg0, f1_arg1, true )
	f1_local0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		f1_arg5.specificsPanel:Update( f1_arg1.medalName, f1_arg0 )
		f2_arg0:registerAnimationState( "enlarge", {
			scale = 0.05
		} )
		f2_arg0:animateToState( "enlarge", 100 )
		f2_arg0.border:animateToState( "focus" )
	end )
	f1_local0:addEventHandler( "button_up", function ( f3_arg0, f3_arg1 )
		f3_arg0:registerAnimationState( "normalSize", {
			scale = 0
		} )
		f3_arg0:animateToState( "normalSize", 100 )
		f3_arg0.border:animateToState( "default" )
	end )
	return f1_local0
end

function getMedalsGrid( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = 28
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		left = -f4_local0 / 2,
		top = -f4_local0 / 2,
		width = LUI.MedalCard.GridItemWidth * f0_local0 + f0_local2 * (f0_local0 - 1) + f4_local0,
		height = LUI.MedalCard.GridRowHeight * f0_local1 + f0_local3 * (f0_local1 - 1) + f4_local0
	} )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:setUseStencil( true )
	self:addElement( self )
	local self = LUI.UIGrid.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		top = f4_local0 / 2,
		left = f4_local0 / 2,
		height = LUI.MedalCard.GridRowHeight * f0_local1 + f0_local3 * (f0_local1 - 1),
		width = LUI.MedalCard.GridItemWidth * f0_local0 + f0_local2 * (f0_local0 - 1)
	}, {
		elementsPerRow = f0_local0,
		hSpacing = f0_local2,
		vSpacing = f0_local3,
		rowHeight = LUI.MedalCard.GridRowHeight,
		hAlign = LUI.Alignment.Left,
		vAlign = LUI.Alignment.Center
	} )
	self.id = "MedalsGrid_" .. f4_arg1
	local f4_local4 = getMedalItemsByType( f4_arg1 )
	for self, f4_local9 in ipairs( f4_local4 ) do
		self:addElement( medalsGridItem( f4_arg0, f4_local9, self, #f4_local4, f4_arg2, f4_arg3 ) )
	end
	self:registerEventHandler( "tab_changed", function ( element, event )
		local f5_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		if not f5_local0.subMenu then
			element:processEvent( {
				name = "gain_focus"
			} )
		else
			f5_local0.subMenu = false
		end
	end )
	self:addElement( self )
	f4_local5 = f0_local0 * LUI.MedalCard.GridItemWidth
	f4_local6 = {
		containerWidth = f4_local5,
		containerHeight = 32
	}
	self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		left = f4_local5 / 2 - 25,
		top = 0,
		height = f4_local6.containerHeight
	} )
	self:addElement( self )
	ListPaging.InitGrid( self, f0_local1, nil, false, self, f4_local6 )
	return self
end

function getMedalItemsByType( f6_arg0 )
	local f6_local0 = 0
	local f6_local1 = {}
	local f6_local2 = Engine.TableGetRowCount( CombatRecord.AwardsTable.File )
	while f6_local0 < f6_local2 do
		if Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f6_local0, CombatRecord.AwardsTable.Cols.IsMedal ) == "1" and Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f6_local0, CombatRecord.AwardsTable.Cols.AwardType ) == f6_arg0 and Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f6_local0, CombatRecord.AwardsTable.Cols.Hide ) == "0" then
			f6_local1[#f6_local1 + 1] = {
				medalName = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f6_local0, CombatRecord.AwardsTable.Cols.ReferenceName ),
				medalMaterial = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f6_local0, CombatRecord.AwardsTable.Cols.Icon ),
				medalTitle = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f6_local0, CombatRecord.AwardsTable.Cols.Title )
			}
		end
		f6_local0 = f6_local0 + 1
	end
	return f6_local1
end

function getCombatMedalsGrid( f7_arg0, f7_arg1 )
	return getMedalsGrid( f7_arg1, "combat", 1, f7_arg0.parentContainer )
end

function getStreakMedalsGrid( f8_arg0, f8_arg1 )
	return getMedalsGrid( f8_arg1, "streak", 2, f8_arg0.parentContainer )
end

function getAntiStreakMedalsGrid( f9_arg0, f9_arg1 )
	return getMedalsGrid( f9_arg1, "antistreak", 3, f9_arg0.parentContainer )
end

function getGameModeMedalsGrid( f10_arg0, f10_arg1 )
	return getMedalsGrid( f10_arg1, "gamemode", 4, f10_arg0.parentContainer )
end

function addCombatRecordTabManager( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			top = 10
		},
		numOfTabs = 4,
		vPadding = 20
	} )
	f11_local0:keepRightBumperAlignedToHeader( true )
	f11_arg2.tabManager = f11_local0
	f11_local0.tabContentPane = f11_arg1
	local f11_local1 = {
		{
			menu = getCombatMedalsGrid,
			name = Engine.ToUpperCase( Engine.Localize( "MENU_COMBAT" ) ),
			type = "combat"
		},
		{
			menu = getStreakMedalsGrid,
			name = Engine.Localize( "MENU_SCORESTREAKS_CAPS" ),
			type = "streak"
		},
		{
			menu = getAntiStreakMedalsGrid,
			name = Engine.ToUpperCase( Engine.Localize( "LUA_MP_FRONTEND_ANTI_SCORESTREAKS" ) ),
			type = "antistreak"
		},
		{
			menu = getGameModeMedalsGrid,
			name = Engine.Localize( "MPUI_COMBATRECORD_GAMEMODES_CAPS" ),
			type = "gamemode"
		}
	}
	for f11_local2 = 1, #f11_local1, 1 do
		f11_local0:addTab( f11_arg0, f11_local1[f11_local2].name, f11_local1[f11_local2].menu )
	end
	local f11_local2 = LUI.FlowManager.GetMenuScopedDataFromElement( f11_arg1 )
	f11_local0.tabSelected = f11_local2.paneIndex or 1
	f11_local0.parentContainer = f11_arg2
	f11_arg2:addElement( f11_local0 )
	local f11_local4 = getMedalItemsByType( f11_local1[f11_local0.tabSelected].type )
	f11_arg2.specificsPanel:Update( f11_local4[1].medalName, f11_arg0 )
	f11_local0:refreshTab( f11_arg0 )
end

function combatRecordMedalsDetails( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg1.exclusiveController
	local f12_local1 = LUI.MenuTemplate.new( f12_arg0, {
		menu_title = "LUA_MENU_MEDALS_CAPS"
	} )
	LUI.MenuTemplate.SetBreadCrumb( f12_local1, Engine.Localize( "@LUA_MENU_BARRACKS_CAPS" ) )
	
	local specificsPanel = LUI.CombatRecordMedalsSpecificDetails.new( "" )
	f12_local1:addElement( specificsPanel )
	f12_local1.specificsPanel = specificsPanel
	
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = CombatRecord.MenuDimensions.left + 2,
		width = CombatRecord.MenuDimensions.width,
		top = CombatRecord.MenuDimensions.top + 12,
		height = CombatRecord.MenuDimensions.height
	} )
	self.id = "detailsVL"
	addCombatRecordTabManager( f12_local0, self, f12_local1 )
	f12_local1:addElement( self )
	f12_local1:AddBackButton( function ( f13_arg0, f13_arg1 )
		LUI.FlowManager.RequestLeaveMenu( nil, nil, nil, f12_local0 )
	end )
	return f12_local1
end

LUI.MenuBuilder.registerType( "CombatRecordMedalsDetails", combatRecordMedalsDetails )
LockTable( _M )
