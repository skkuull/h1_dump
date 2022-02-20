local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Crystal = {}
function animateSubliminalMessages( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			2200
		},
		{
			"visible",
			1000
		},
		{
			"visible",
			3200
		},
		{
			"hidden",
			1000
		},
		{
			"hidden",
			2000
		}
	} )
	f1_arg1:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			2000
		},
		{
			"visible",
			100
		},
		{
			"hidden",
			100
		},
		{
			"hidden",
			2000
		},
		{
			"partiallyVisible",
			1000
		},
		{
			"hidden",
			1000
		},
		{
			"hidden",
			1000
		},
		{
			"visible",
			100
		},
		{
			"hidden",
			100
		},
		{
			"hidden",
			2000
		}
	} )
	f1_arg2:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			7400
		},
		{
			"visible",
			200
		},
		{
			"hidden",
			200
		},
		{
			"hidden",
			1600
		}
	} )
	f1_arg3:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			7400
		},
		{
			"visible",
			200
		},
		{
			"hidden",
			300
		},
		{
			"end",
			1500
		}
	} )
end

LUI.Playercard.Crystal.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "white" )
	f2_local0.color = Colors.black
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_crystal_layer_01" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 200
	local self = LUI.UIImage.new( {
		zRot = 0,
		topAnchor = true,
		top = -25,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "spin1", {
		zRot = 0,
		topAnchor = true,
		top = -25,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "spin2", {
		zRot = -360,
		topAnchor = true,
		top = -25,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:animateInLoop( {
		{
			"spin1",
			0
		},
		{
			"spin2",
			20000
		}
	} )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		left = 210,
		top = -10
	} )
	self:registerAnimationState( "down", {
		topAnchor = true,
		leftAnchor = true,
		left = 210,
		top = -10
	} )
	self:registerAnimationState( "up", {
		topAnchor = true,
		leftAnchor = true,
		left = 210,
		top = -20
	} )
	self:animateInLoop( {
		{
			"up",
			1000,
			true,
			false
		},
		{
			"down",
			1000
		}
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_crystal_layer_02" )
	local self, f2_local10 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local10
	f2_local6 = 42
	self = LUI.UIImage.new( {
		alpha = 0,
		topAnchor = true,
		top = 10,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 0.3
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_crystal_layer_04" )
	local f2_local10, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local10 / self
	f2_local6 = 65
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} ) )
	self:addElement( self )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_crystal_layer_03" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 65
	self = LUI.UIImage.new( {
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self = LUI.UIImage.new( {
		material = RegisterAndCacheMaterial( "em_bg_crystal_layer_05" ),
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	local f2_local13 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local13.material = RegisterAndCacheMaterial( "em_bg_crystal_layer_06" )
	f2_local13.alpha = 0
	local self = LUI.UIImage.new( f2_local13 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "partiallyVisible", {
		alpha = 0.5
	} )
	f2_local13.material = RegisterAndCacheMaterial( "white" )
	f2_local13.color = Colors.red
	local self = LUI.UIImage.new( f2_local13 )
	self:registerAnimationState( "visible", {
		alpha = 0.05
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f2_local13.material = RegisterAndCacheMaterial( "em_bg_crystal_layer_07" )
	local self = LUI.UIImage.new( f2_local13 )
	self:registerAnimationState( "visible", {
		alpha = 0.5
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "end", {
		alpha = 0
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	animateSubliminalMessages( self, self, self, self )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "end" ), function ( element, event )
		animateSubliminalMessages( self, self, self, self )
	end )
	return self
end

LockTable( _M )
