local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.CombatRecordMedalsSpecificDetails = InheritFrom( LUI.UIElement )
f0_local0 = 148
f0_local1 = 3
f0_local2 = 18
function medalIconContainer( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, CombatRecord.MenuDimensions.height / 2, CoD.AnchorTypes.TopLeftRight ) )
	local self = LUI.UIImage.new( CoD.CreateState( -120, -120, 120, 120, CoD.AnchorTypes.None ) )
	self.icon = self
	self:addElement( self )
	return self
end

function medalDescContainer( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, CombatRecord.MenuDimensions.height / 2, 0, 0, CoD.AnchorTypes.All ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = -10,
		height = 50,
		leftAnchor = true,
		rightAnchor = true,
		font = CoD.TextSettings.TitleFontSmall.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center
	} )
	self.earnedText = self
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		width = 25,
		topAnchor = true,
		top = 52,
		height = 2,
		alpha = 0.8,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey
	} ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 54,
		height = 20,
		leftAnchor = true,
		rightAnchor = true,
		font = CoD.TextSettings.TitleFontSmall.Font,
		color = Colors.mw1_green,
		alignment = LUI.Alignment.Center
	} )
	self.titleText = self
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 80,
		height = 14,
		width = 320,
		font = CoD.TextSettings.TitleFontSmall.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center,
		lineSpacingRatio = 0.2
	} )
	self.descText = self
	self:addElement( self )
	return self
end

LUI.CombatRecordMedalsSpecificDetails.Update = function ( f3_arg0, f3_arg1, f3_arg2 )
	CoD.SetMaterial( f3_arg0.iconContainer.icon, RegisterMaterial( Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f3_arg1, CombatRecord.AwardsTable.Cols.Icon ) ) )
	f3_arg0.descContainer.earnedText:setText( Engine.GetPlayerData( f3_arg2, CoD.StatsGroup.Common, "awards", f3_arg1 ) )
	f3_arg0.descContainer.titleText:setText( Engine.Localize( Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f3_arg1, CombatRecord.AwardsTable.Cols.Title ) ) )
	f3_arg0.descContainer.descText:setText( Engine.Localize( Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f3_arg1, CombatRecord.AwardsTable.Cols.Desc ) ) )
end

LUI.CombatRecordMedalsSpecificDetails.new = function ( menu, controller )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		topAnchor = true,
		width = 380,
		top = CombatRecord.MenuDimensions.top + 10,
		height = f0_local0 * f0_local1 + f0_local2 * (f0_local1 - 1) + 4
	} )
	self:setClass( LUI.CombatRecordMedalsSpecificDetails )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		topAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.dark_grey,
		alpha = 0.5
	} ) )
	local f4_local1 = 175
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		height = f4_local1,
		material = RegisterMaterial( "white" ),
		color = Colors.black,
		alpha = 0.4
	} ) )
	local f4_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local2.material = RegisterMaterial( "h1_ui_dot_pattern_lg" )
	local self = LUI.UIImage.new( f4_local2 )
	self:setupTiles( 24 )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -f4_local1,
		alpha = 0.8,
		height = 1,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey
	} ) )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 25
	} )
	self.id = "specificsVL"
	local f4_local5 = medalIconContainer( controllerIndex )
	self.iconContainer = f4_local5
	self:addElement( f4_local5 )
	local f4_local6 = medalDescContainer( controllerIndex )
	self.descContainer = f4_local6
	self:addElement( f4_local6 )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	return self
end

LockTable( _M )
