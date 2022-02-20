local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
MedalsTable = {
	"medal_rapidkill_kill_chain",
	"medal_gamemode_contagious",
	"medal_destroyscorestreak_winged",
	"medal_kill_after_life"
}
f0_local0 = function ( f1_arg0 )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( 0, 0, 0, CombatRecord.PanelDimensions.height * 0.6, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "medalGridContainer"
	local self = LUI.UIGrid.new( CoD.CreateState( 0, 15, 0, 0, CoD.AnchorTypes.All ), {
		elementsPerRow = 2,
		hSpacing = 120,
		vSpacing = 40,
		rowHeight = 100,
		hAlign = LUI.Alignment.Center,
		vAlign = LUI.Alignment.Center
	} )
	for f1_local5, f1_local6 in ipairs( MedalsTable ) do
		self:addElement( LUI.UIImage.new( {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			left = -50,
			width = 130,
			top = 0,
			height = 130,
			material = RegisterMaterial( f1_local6 )
		} ) )
	end
	self:addElement( self )
	return self
end

function combatRecordMedalsPanel( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	local f2_local1 = CombatRecord.CreateInfoPanel( f2_local0 )
	local self = LUI.UIVerticalList.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "careerPanelVL"
	self:addElement( f0_local0( f2_local0 ) )
	self:addElement( CombatRecord.AddPanelInfo( Engine.Localize( "LUA_MENU_MEDALS_CAPS" ), Engine.Localize( "LUA_MP_FRONTEND_COMBAT_RECORD_MEDALS_DESC" ) ) )
	f2_local1:addElement( self )
	return f2_local1
end

LUI.MenuBuilder.registerType( "CombatRecordMedalsPanel", combatRecordMedalsPanel )
LockTable( _M )
