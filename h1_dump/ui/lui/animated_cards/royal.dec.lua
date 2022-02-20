local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Royal = {}
LUI.Playercard.Royal.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_royal_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = RegisterAndCacheMaterial( "em_bg_royal_layer_02" )
	local f1_local3, f1_local4 = GetMaterialDimensions( f1_local2 )
	local f1_local5 = f1_local3 / f1_local4
	local f1_local6 = 220
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_royal_layer_03" )
	local self, self = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / self
	f1_local6 = 130
	self = LUI.UIImage.new( {
		rightAnchor = true,
		topAnchor = true,
		top = -25,
		right = 18,
		alpha = 0.8,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:registerAnimationState( "normal", {
		zRot = 360,
		rightAnchor = true,
		topAnchor = true,
		top = -25,
		right = 18,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:registerAnimationState( "rotate", {
		zRot = 0,
		rightAnchor = true,
		topAnchor = true,
		top = -25,
		right = 18,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:animateInLoop( {
		{
			"normal",
			0
		},
		{
			"rotate",
			8000
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_royal_layer_04" )
	local self, f1_local10 = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / f1_local10
	f1_local6 = 110
	self = LUI.UIImage.new( {
		zRot = -3,
		rightAnchor = true,
		topAnchor = true,
		top = -25,
		right = 10,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:registerAnimationState( "tilt1", {
		zRot = 3,
		rightAnchor = true,
		topAnchor = true,
		top = -25,
		right = 10,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:registerAnimationState( "tilt2", {
		zRot = -3,
		rightAnchor = true,
		topAnchor = true,
		top = -25,
		right = 10,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:animateInLoop( {
		{
			"tilt1",
			1000,
			true,
			false
		},
		{
			"tilt2",
			1000,
			true,
			false
		}
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

LockTable( _M )
