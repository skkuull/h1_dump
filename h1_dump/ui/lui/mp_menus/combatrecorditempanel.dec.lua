local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function categoryImage( menu, controller )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( 0, 0, CombatRecord.PanelDimensions.width * 0.3, 0, CoD.AnchorTypes.TopBottomLeft ) )
	local self = LUI.UIImage.new( CoD.CreateState( -80, -80, 80, 80, CoD.AnchorTypes.None ) )
	self:setImage( RegisterMaterial( controller.categoryMaterial ) )
	self:addElement( self )
	return self
end

function rightPanel( menu, controller )
	local self = LUI.UIBackgroundPanel.new( CoD.CreateState( -CombatRecord.PanelDimensions.width * 0.7, 0, 0, 0, CoD.AnchorTypes.TopBottomRight ) )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 50,
		bottom = 0,
		spacing = 10
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		height = CombatRecord.SmallFont.Height,
		font = CombatRecord.SmallFont.Font,
		alignment = LUI.Alignment.Center
	} )
	self:setText( Engine.Localize( controller.rightPanelTitle ) )
	self:addElement( self )
	if controller.showTrends then
		self:addElement( CombatRecord.KDTrendsPanel( menu, {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = -275,
			width = 550,
			top = 90,
			height = 180
		} ) )
	else
		local f2_local3 = controller.favoriteStatsFunction( menu, CombatRecord.GetWeaponList( controller.favoriteCategoryArray, nil, controller.addKnife ) )
		local f2_local4 = f2_local3[controller.favoriteStat]
		local f2_local5 = controller.lookupTable
		local self = LUI.UIText.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = 0,
			height = CombatRecord.SmallFont.Height,
			font = CombatRecord.SmallFont.Font,
			alignment = LUI.Alignment.Center
		} )
		if controller.concatenateMP and f2_local4 then
			f2_local4.name = f2_local4.name .. "_mp"
		end
		local f2_local7 = self
		local self = self.setText
		local f2_local9
		if f2_local4 then
			f2_local9 = Engine.Localize( Engine.TableLookup( f2_local5.File, f2_local5.Cols.Ref, f2_local4.name, f2_local5.Cols.Name ) )
			if not f2_local9 then
			
			else
				self( f2_local7, f2_local9 )
				self:addElement( self )
				if f2_local4 then
					self = LUI.UIImage.new( controller.favoriteImageState )
					self:setImage( RegisterMaterial( Engine.TableLookup( f2_local5.File, f2_local5.Cols.Ref, f2_local4.name, f2_local5.Cols.Image ) ) )
					self:addElement( self )
				end
			end
		end
		f2_local9 = Engine.Localize( "MPUI_COMBATRECORD_NO_DATA_YET" )
	end
	self:addElement( self )
	return self
end

function itemPanelHorizontalList( menu, controller )
	local self = LUI.UIHorizontalList.new( CoD.CreateState( 0, 0, 0, CombatRecord.PanelDimensions.height * 0.6, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "itemPanelHL"
	self:addElement( categoryImage( menu, controller ) )
	self:addElement( rightPanel( menu, controller ) )
	return self
end

function combatRecordItemPanel( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.controller
	local f4_local1 = CombatRecord.CreateInfoPanel( f4_local0 )
	local f4_local2 = f4_arg1.inputTable
	local self = LUI.UIVerticalList.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "itemPanelVL"
	local f4_local4 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg1.menu )
	f4_local4.controller = f4_local0 or f4_local4.controller
	self:addElement( itemPanelHorizontalList( f4_local4.controller, f4_local2 ) )
	self:addElement( CombatRecord.AddPanelInfo( Engine.Localize( f4_local2.infoTitle ), Engine.Localize( f4_local2.infoDesc ) ) )
	f4_local1:addElement( self )
	return f4_local1
end

LUI.MenuBuilder.registerType( "CombatRecordItemPanel", combatRecordItemPanel )
LockTable( _M )
