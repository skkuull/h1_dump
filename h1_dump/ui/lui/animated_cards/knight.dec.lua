local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Knight = {}
LUI.Playercard.Knight.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_knight_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = RegisterAndCacheMaterial( "em_bg_knight_layer_02" )
	local f1_local3, f1_local4 = GetMaterialDimensions( f1_local2 )
	local f1_local5 = f1_local3 / f1_local4
	local f1_local6 = 100
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = -40,
		top = -8,
		zRot = 10,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 96,
		top = -3,
		zRot = -2,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} )
	self:addElement( self )
	self:addElement( self )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_knight_layer_03" )
	local f1_local9, f1_local10 = GetMaterialDimensions( f1_local2 )
	f1_local5 = f1_local9 / f1_local10
	f1_local6 = 55
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 75,
		top = 20,
		material = f1_local2,
		width = f1_local6 * f1_local5,
		height = f1_local6
	} ) )
	self:registerAnimationState( "hitHand", {
		zRot = 14
	} )
	self:registerAnimationState( "normal", {
		zRot = -9
	} )
	self:registerAnimationState( "bounceUp1", {
		zRot = 13
	} )
	self:animateInLoop( {
		{
			"hitHand",
			600
		},
		{
			"hitHand",
			0
		},
		{
			"bounceUp1",
			100
		},
		{
			"hitHand",
			100
		},
		{
			"hitHand",
			600
		},
		{
			"normal",
			600,
			true,
			false
		}
	} )
	return self
end

LockTable( _M )
