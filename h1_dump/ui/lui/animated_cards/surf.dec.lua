local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Surf = {}
LUI.Playercard.Surf.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_surf_layer_01" )
	local self = LUI.UIImage.new( f1_local1 )
	self:addElement( self )
	local f1_local3 = CoD.CreateState( -95, -32, 115, 32, CoD.AnchorTypes.None )
	f1_local3.material = RegisterAndCacheMaterial( "em_bg_surf_layer_02" )
	local self = LUI.UIImage.new( f1_local3 )
	self:addElement( self )
	self:registerAnimationState( "left", {
		left = -100,
		top = -32,
		right = 110,
		bottom = 32
	} )
	self:registerAnimationState( "right", {
		left = -95,
		top = -32,
		right = 115,
		bottom = 32
	} )
	self:animateInLoop( {
		{
			"left",
			1
		},
		{
			"right",
			125
		},
		{
			"left",
			225
		},
		{
			"right",
			225
		},
		{
			"left",
			125
		}
	} )
	local f1_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local5.material = RegisterAndCacheMaterial( "em_bg_surf_layer_03" )
	self:addElement( LUI.UIImage.new( f1_local5 ) )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 100, 0, nil, CoD.AnchorTypes.None ) )
	self:addElement( self )
	self:registerAnimationState( "left", {
		left = -16
	} )
	self:registerAnimationState( "right", {
		left = 0
	} )
	self:registerAnimationState( "middle", {
		left = -8
	} )
	self:animateInLoop( {
		{
			"left",
			1
		},
		{
			"right",
			200
		},
		{
			"middle",
			300
		},
		{
			"right",
			300
		},
		{
			"left",
			200
		},
		{
			"right",
			300
		},
		{
			"middle",
			300
		},
		{
			"right",
			200
		},
		{
			"middle",
			200
		},
		{
			"left",
			200
		},
		{
			"middle",
			300
		},
		{
			"left",
			300
		},
		{
			"right",
			200
		},
		{
			"left",
			300
		},
		{
			"middle",
			300
		},
		{
			"left",
			300
		},
		{
			"right",
			300
		},
		{
			"left",
			200
		},
		{
			"middle",
			200
		},
		{
			"right",
			300
		},
		{
			"middle",
			300
		},
		{
			"left",
			200
		},
		{
			"right",
			300
		},
		{
			"left",
			300
		}
	} )
	local f1_local7 = RegisterAndCacheMaterial( "em_bg_surf_layer_04" )
	local f1_local8, f1_local9 = GetMaterialDimensions( f1_local7 )
	local f1_local10 = f1_local8 / f1_local9
	local f1_local11 = 70
	local self = LUI.UIImage.new( {
		bottomAnchor = true,
		top = -33,
		material = f1_local7,
		height = f1_local11,
		width = f1_local11 * f1_local10
	} )
	self:addElement( self )
	self:registerAnimationState( "left", {
		left = -45,
		top = -33,
		bottomAnchor = true,
		height = f1_local11,
		width = f1_local11 * f1_local10,
		zRot = 1
	} )
	self:registerAnimationState( "right", {
		left = -40,
		top = -33,
		bottomAnchor = true,
		height = f1_local11,
		width = f1_local11 * f1_local10,
		zRot = -2
	} )
	self:animateInLoop( {
		{
			"left",
			1
		},
		{
			"right",
			125
		},
		{
			"left",
			225
		},
		{
			"right",
			225
		},
		{
			"left",
			125
		}
	} )
	f1_local7 = RegisterAndCacheMaterial( "em_bg_surf_layer_05" )
	local self, f1_local14 = GetMaterialDimensions( f1_local7 )
	f1_local10 = self / f1_local14
	f1_local11 = 27
	self = LUI.UIImage.new( {
		left = -80,
		top = 3,
		bottomAnchor = true,
		material = f1_local7,
		height = f1_local11,
		width = f1_local11 * f1_local10
	} )
	self:addElement( self )
	self:registerAnimationState( "left", {
		left = -87,
		top = 3,
		bottomAnchor = true,
		height = f1_local11,
		width = f1_local11 * f1_local10
	} )
	self:registerAnimationState( "right", {
		left = -84,
		top = 3,
		bottomAnchor = true,
		height = f1_local11,
		width = f1_local11 * f1_local10
	} )
	self:animateInLoop( {
		{
			"left",
			1
		},
		{
			"right",
			100
		},
		{
			"left",
			200
		},
		{
			"right",
			200
		},
		{
			"left",
			100
		}
	} )
	return self
end

LockTable( _M )
