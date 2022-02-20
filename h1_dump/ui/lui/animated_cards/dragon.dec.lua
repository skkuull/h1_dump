local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Dragon = {}
LUI.Playercard.Dragon.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_dragon_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = RegisterAndCacheMaterial( "em_bg_dragon_layer_02" )
	local f1_local3, f1_local4 = GetMaterialDimensions( f1_local2 )
	local f1_local5 = f1_local3 / f1_local4
	local f1_local6 = 275
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		material = f1_local2
	} ) )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_dragon_layer_03" )
	local f1_local7, f1_local8 = GetMaterialDimensions( f1_local2 )
	f1_local5 = f1_local7 / f1_local8
	f1_local6 = 53
	self:addElement( LUI.UIImage.new( {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -1,
		right = -2,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} ) )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_dragon_layer_04" )
	local f1_local8, f1_local9 = GetMaterialDimensions( f1_local2 )
	f1_local5 = f1_local8 / f1_local9
	f1_local6 = 110
	f1_local8 = {
		zRot = 15
	}
	f1_local9 = {
		zRot = 2
	}
	local self = LUI.UIImage.new( {
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		top = -80,
		left = -100
	} )
	local f1_local11 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local11.zRot = 2
	f1_local11.bottom = 90
	f1_local11.left = 10
	local self = LUI.UIElement.new( f1_local11 )
	self:addElement( self )
	self:addElement( self )
	self:registerAnimationState( "left", f1_local8 )
	self:registerAnimationState( "right", f1_local9 )
	self:animateInLoop( {
		{
			"left",
			1500
		},
		{
			"right",
			1500
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_dragon_layer_05" )
	local self, f1_local14 = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / f1_local14
	f1_local6 = 97
	self = LUI.UIImage.new( {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 20,
		right = -35,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		zRot = 0
	} )
	f1_local14 = {
		zRot = -10,
		right = -35,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local15 = {
		zRot = 10,
		right = -35,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local16 = {
		zRot = 0,
		right = -35,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local17 = {
		zRot = 0,
		right = -36,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local18 = {
		zRot = 0,
		right = -34,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local19 = {
		zRot = 0,
		right = -35,
		bottom = 19,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local20 = {
		zRot = 0,
		right = -35,
		bottom = 21,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local21 = {
		zRot = 0,
		right = -35,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	local f1_local22 = {
		zRot = 0,
		right = -35,
		bottom = 20,
		width = f1_local6 * f1_local5,
		height = f1_local6,
		rightAnchor = true,
		bottomAnchor = true
	}
	self:registerAnimationState( "rotateLeft", f1_local14 )
	self:registerAnimationState( "rotateRight", f1_local15 )
	self:registerAnimationState( "rotateNone", f1_local16 )
	self:registerAnimationState( "slideLeft", f1_local17 )
	self:registerAnimationState( "slideRight", f1_local18 )
	self:registerAnimationState( "slideHorizNone", f1_local22 )
	self:registerAnimationState( "slideUp", f1_local19 )
	self:registerAnimationState( "slideDown", f1_local20 )
	self:registerAnimationState( "slideVertNone", f1_local21 )
	self:animateInLoop( {
		{
			"rotateRight",
			400
		},
		{
			"rotateLeft",
			400
		},
		{
			"rotateRight",
			400
		},
		{
			"rotateNone",
			400
		},
		{
			"slideLeft",
			150
		},
		{
			"slideRight",
			150
		},
		{
			"slideLeft",
			150
		},
		{
			"slideRight",
			150
		},
		{
			"slideHorizNone",
			150
		},
		{
			"rotateRight",
			400
		},
		{
			"rotateLeft",
			400
		},
		{
			"rotateRight",
			400
		},
		{
			"rotateNone",
			400
		},
		{
			"slideUp",
			150
		},
		{
			"slideDown",
			150
		},
		{
			"slideUp",
			150
		},
		{
			"slideDown",
			150
		},
		{
			"slideVertNone",
			150
		}
	} )
	self:addElement( self )
	return self
end

LockTable( _M )
