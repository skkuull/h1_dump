local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.CacBase = InheritFrom( LUI.MenuTemplate )
LUI.CacBase.AddCacButton = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.CacButton.new( f1_arg1 )
	f1_local0.menu = f1_arg0
	if f1_arg1.gridProps then
		if f1_arg0.grid == nil then
			if f1_arg0.gridMask == nil then
				f1_arg0.gridMask = LUI.UIElement.new( {
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					left = f1_arg1.gridProps.left,
					top = f1_arg1.gridProps.top,
					width = f1_arg1.width * f1_arg1.gridProps.elementsPerRow + f1_arg1.gridProps.hSpacing * (f1_arg1.gridProps.elementsPerRow + 1),
					height = f1_arg1.gridProps.rowHeight * f1_arg1.gridProps.rows + f1_arg1.gridProps.vSpacing * (f1_arg1.gridProps.rows + 1)
				} )
				f1_arg0.gridMask:setUseStencil( true )
				f1_arg0.gridMask.id = "grid_mask_id"
			end
			f1_arg0.grid = LUI.UIGrid.new( nil, f1_arg1.gridProps )
			f1_arg0.grid.id = "CacButtonGrid_" .. f1_arg0.type
			f1_arg0.grid:makeFocusable()
			f1_arg0.grid:registerAnimationState( "default", CoD.CreateState( f1_arg1.gridProps.hSpacing, f1_arg1.gridProps.vSpacing, -f1_arg1.gridProps.hSpacing, -f1_arg1.gridProps.vSpacing, CoD.AnchorTypes.All ) )
			f1_arg0.grid:animateToState( "default" )
			f1_arg0.gridMask:addElement( f1_arg0.grid )
			f1_arg0:addElement( f1_arg0.gridMask )
			if f1_arg0.list then
				f1_arg0.list:close()
			end
			f1_arg0.list = f1_arg0.grid.vlist
			f1_arg0.list.buttonCount = 0
		end
		f1_local0.id = f1_arg0.type .. "_" .. f1_arg0.list.id .. "_button_" .. f1_arg0.list.buttonCount
		f1_arg0.grid:addElement( f1_local0 )
	else
		f1_local0.id = f1_arg0.type .. "_" .. f1_arg0.list.id .. "_button_" .. f1_arg0.list.buttonCount
		f1_arg0.list:addElement( f1_local0 )
	end
	f1_arg0.list.buttonCount = f1_arg0.list.buttonCount + 1
	return f1_local0
end

LUI.CacBase.new = function ( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.MenuTemplate.new( f2_arg0, f2_arg1 )
	f2_local0:setClass( LUI.CacBase )
	return f2_local0
end

LockTable( _M )
