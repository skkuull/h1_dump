local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Tank = {}
AnimationStep = 200
function animateElements( f1_arg0 )
	f1_arg0.tankRegular:animateInSequence( {
		{
			"visible",
			0
		},
		{
			"visible",
			100
		},
		{
			"shakeRight",
			0
		},
		{
			"shakeRight",
			50
		},
		{
			"shakeLeft",
			0
		},
		{
			"shakeLeft",
			50
		},
		{
			"shakeRight",
			0
		},
		{
			"shakeRight",
			50
		},
		{
			"normalVisible",
			0
		},
		{
			"normalVisible",
			50
		},
		{
			"visible",
			0
		},
		{
			"visible",
			1000
		}
	} )
	f1_arg0.smallFlash:animateInSequence( {
		{
			"hidden",
			50
		},
		{
			"visible",
			0
		},
		{
			"visible",
			50
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			200
		},
		{
			"visible",
			0
		},
		{
			"visible",
			200
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			800
		}
	} )
	f1_arg0.bigFlash:animateInSequence( {
		{
			"hidden",
			100
		},
		{
			"visible",
			0
		},
		{
			"visible",
			200
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			1000
		}
	} )
	f1_arg0.firstFlachette:animateInSequence( {
		{
			"hidden",
			50
		},
		{
			"visible",
			0
		},
		{
			"visible",
			100
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			1150
		}
	} )
	f1_arg0.secondFlachette:animateInSequence( {
		{
			"hidden",
			100
		},
		{
			"visible",
			0
		},
		{
			"visible",
			200
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			1000
		}
	} )
	f1_arg0.thirdFlachette:animateInSequence( {
		{
			"hidden",
			300
		},
		{
			"visible",
			0
		},
		{
			"visible",
			200
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			800
		}
	} )
	f1_arg0.fourthFlachette:animateInSequence( {
		{
			"hidden",
			500
		},
		{
			"visible",
			0
		},
		{
			"visible",
			300
		},
		{
			"hidden",
			0
		},
		{
			"hiddenDone",
			1000
		}
	} )
end

LUI.Playercard.Tank.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_tank_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_04" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 125
	local f2_local7 = f2_local6
	local f2_local8 = f2_local6 * f2_local5
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -7,
		material = f2_local2,
		width = f2_local8,
		height = f2_local7
	} )
	local f2_local10 = f2_local2
	local f2_local11 = f2_local6 * f2_local5
	local f2_local12 = f2_local6
	local f2_local13 = RegisterAndCacheMaterial( "em_bg_tank_layer_05" )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_02" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 40
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 17.5,
		top = 2.5,
		material = f2_local2,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_03" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = -12,
		top = -9,
		material = f2_local2,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_06" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 15,
		top = -8,
		material = f2_local2,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_07" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 5,
		top = -8,
		material = f2_local2,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_08" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = -15,
		top = -8,
		material = f2_local2,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_tank_layer_09" )
	local self, f2_local20 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local20
	f2_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = -25,
		top = -8,
		material = f2_local2,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	f2_local20 = {
		smallFlash = self,
		bigFlash = self,
		tankRegular = self,
		firstFlachette = self,
		secondFlachette = self,
		thirdFlachette = self,
		fourthFlachette = self
	}
	local f2_local21 = {
		self,
		self,
		self,
		self,
		self,
		self,
		self
	}
	for f2_local22 = 1, #f2_local21, 1 do
		local f2_local25 = f2_local21[f2_local22]
		f2_local25:registerAnimationState( "visible", {
			alpha = 1
		} )
		f2_local25:registerAnimationState( "hidden", {
			alpha = 0
		} )
		f2_local25:animateToState( "hidden" )
	end
	self:registerAnimationState( "visible", {
		material = f2_local10,
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -7,
		width = f2_local8,
		height = f2_local7,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		material = f2_local10,
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -7,
		width = f2_local8,
		height = f2_local7,
		alpha = 0
	} )
	self:registerAnimationState( "normalHidden", {
		material = f2_local13,
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -7,
		width = f2_local11,
		height = f2_local12,
		alpha = 0
	} )
	self:registerAnimationState( "normalVisible", {
		material = f2_local13,
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -7,
		width = f2_local11,
		height = f2_local12,
		alpha = 1
	} )
	self:registerAnimationState( "shakeRight", {
		material = f2_local13,
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -6,
		width = f2_local11,
		height = f2_local12,
		alpha = 1
	} )
	self:registerAnimationState( "shakeLeft", {
		material = f2_local13,
		leftAnchor = true,
		topAnchor = true,
		top = -27,
		left = -8,
		width = f2_local11,
		height = f2_local12,
		alpha = 1
	} )
	self:registerAnimationState( "hiddenDone", {
		alpha = 0
	} )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "hiddenDone" ), function ( element, event )
		animateElements( f2_local20 )
	end )
	self:animateToState( "visible" )
	animateElements( f2_local20 )
	return self
end

LockTable( _M )
