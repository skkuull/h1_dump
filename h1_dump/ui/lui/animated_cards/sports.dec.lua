local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Sports = {}
function animateElements( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0:animateInSequence( {
		{
			"topMiddle",
			1100
		},
		{
			"lowerLeft",
			1100,
			false,
			true
		},
		{
			"start",
			0
		},
		{
			"start",
			3000
		}
	} )
	f1_arg1:animateInSequence( {
		{
			"start",
			0
		},
		{
			"start",
			1500
		},
		{
			"topMiddle",
			1100
		},
		{
			"lowerLeft",
			1100,
			false,
			true
		},
		{
			"start",
			0
		},
		{
			"start",
			1500
		}
	} )
	f1_arg2:animateInSequence( {
		{
			"start",
			0
		},
		{
			"start",
			3000
		},
		{
			"topMiddle",
			1100
		},
		{
			"lowerLeft",
			1100,
			false,
			true
		}
	} )
	f1_arg3:animateInSequence( {
		{
			"downOne",
			0
		},
		{
			"downOne",
			5000
		},
		{
			"upOne",
			250
		},
		{
			"downTwo",
			250
		},
		{
			"upTwo",
			250
		},
		{
			"downThree",
			250
		},
		{
			"upThree",
			250
		},
		{
			"downFour",
			250
		},
		{
			"upFour",
			250
		},
		{
			"downFive",
			250
		}
	} )
end

LUI.Playercard.Sports.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_sports_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_sports_layer_02" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 80
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	local self = LUI.UIImage.new( {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	self:registerAnimationState( "start", {
		rightAnchor = true,
		bottomAnchor = true,
		right = 200,
		bottom = 70,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "topMiddle", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -100,
		bottom = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "lowerLeft", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -400,
		bottom = 70,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:animateToState( "start" )
	self:registerAnimationState( "spin", {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 360
	} )
	self:registerAnimationState( "noSpin", {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 0
	} )
	self:animateInLoop( {
		{
			"noSpin",
			0
		},
		{
			"spin",
			2200
		}
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_sports_layer_04" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 80
	self = LUI.UIImage.new( {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2,
		zRot = -10
	} )
	self:registerAnimationState( "start", {
		rightAnchor = true,
		bottomAnchor = true,
		right = 200,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = -20
	} )
	self:registerAnimationState( "topMiddle", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -100,
		bottom = 5,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 0
	} )
	self:registerAnimationState( "lowerLeft", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -400,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 0
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_sports_layer_03" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 100
	self = LUI.UIElement.new( {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self = LUI.UIImage.new( {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	self:registerAnimationState( "start", {
		rightAnchor = true,
		bottomAnchor = true,
		right = 200,
		bottom = 70,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "topMiddle", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -100,
		bottom = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "lowerLeft", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -400,
		bottom = 70,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "spin", {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 360
	} )
	self:registerAnimationState( "noSpin", {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 0
	} )
	self:animateInLoop( {
		{
			"noSpin",
			0
		},
		{
			"spin",
			2200
		}
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_sports_layer_05" )
	local self, f2_local13 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local13
	f2_local6 = 80
	self = LUI.UIImage.new( {
		rightAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	self:registerAnimationState( "downOne", {
		rightAnchor = true,
		bottomAnchor = true,
		right = 100,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "upOne", {
		rightAnchor = true,
		bottomAnchor = true,
		right = 60,
		bottom = -10,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "downTwo", {
		rightAnchor = true,
		bottomAnchor = true,
		right = 20,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "upTwo", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -20,
		bottom = -5,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "downThree", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -60,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "upThree", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -100,
		bottom = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "downFour", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -140,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "upFour", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -180,
		bottom = 5,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "downFive", {
		rightAnchor = true,
		bottomAnchor = true,
		right = -220,
		bottom = 40,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "downFive" ), function ( element, event )
		animateElements( self, self, self, self )
	end )
	animateElements( self, self, self, self )
	return self
end

LockTable( _M )
