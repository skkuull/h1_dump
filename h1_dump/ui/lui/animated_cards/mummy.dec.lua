local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Mummy = {}
LUI.Playercard.Mummy.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_mummy_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = RegisterAndCacheMaterial( "em_bg_mummy_layer_02" )
	local f1_local3, f1_local4 = GetMaterialDimensions( f1_local2 )
	local f1_local5 = f1_local3 / f1_local4
	local f1_local6 = 106
	local self = LUI.UIImage.new( {
		material = f1_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -4,
		height = f1_local6,
		width = f1_local6 * f1_local5,
		alpha = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"on",
			1
		},
		{
			"on",
			1298
		},
		{
			"off",
			1
		},
		{
			"off",
			1100
		},
		{
			"on",
			1
		},
		{
			"on",
			2599
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_mummy_layer_03" )
	local self, self = GetMaterialDimensions( f1_local2 )
	self = LUI.UIImage.new( {
		material = f1_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 21.5,
		right = 6.5,
		height = f1_local6,
		width = f1_local6 * self / self,
		alpha = 1
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			1
		},
		{
			"off",
			1298
		},
		{
			"on",
			1
		},
		{
			"on",
			1100
		},
		{
			"off",
			1
		},
		{
			"off",
			2599
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_mummy_layer_04" )
	local self, f1_local10 = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / f1_local10
	f1_local6 = 103
	self = LUI.UIImage.new( {
		material = f1_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 21,
		right = 44,
		height = f1_local6,
		width = f1_local6 * f1_local5
	} )
	self:addElement( self )
	self:registerAnimationState( "left", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 21,
		right = -20,
		height = f1_local6,
		width = f1_local6 * f1_local5
	} )
	self:registerAnimationState( "right", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 21,
		right = 44,
		height = f1_local6,
		width = f1_local6 * f1_local5
	} )
	self:animateInLoop( {
		{
			"right",
			1
		},
		{
			"left",
			1499
		},
		{
			"left",
			1000
		},
		{
			"right",
			1500
		},
		{
			"right",
			1000
		}
	} )
	return self
end

LockTable( _M )
