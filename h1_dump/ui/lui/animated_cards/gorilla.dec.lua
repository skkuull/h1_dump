local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Gorilla = {}
function animateFaceAndCigar( f1_arg0, f1_arg1 )
	f1_arg0:animateInSequence( f1_arg0.table, nil, nil, true )
	f1_arg1:animateInSequence( f1_arg1.table )
end

LUI.Playercard.Gorilla.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_gorilla_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_gorilla_layer_02" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 20
	local self = LUI.UIImage.new( {
		material = f2_local2,
		leftAnchor = true,
		left = 118,
		topAnchor = true,
		top = 31,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		zRot = 3
	} )
	self:addElement( self )
	self:registerAnimationState( "left", {
		zRot = -3
	} )
	self:registerAnimationState( "right", {
		zRot = 3
	} )
	self:animateInLoop( {
		{
			"left",
			100,
			true
		},
		{
			"right",
			100,
			true
		}
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_gorilla_layer_03" )
	local self, f2_local9 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local9
	f2_local6 = 22
	self = LUI.UIImage.new( {
		material = f2_local2,
		leftAnchor = true,
		left = 125,
		topAnchor = true,
		top = 25,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "hidden", {
		alpha = 0.4
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.table = {
		{
			"visible",
			695,
			true
		},
		{
			"hidden",
			506,
			true
		}
	}
	local f2_local10 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local10.material = RegisterAndCacheMaterial( "em_bg_gorilla_layer_04" )
	local self = LUI.UIImage.new( f2_local10 )
	self:addElement( self )
	self:registerAnimationState( "hidden", {
		alpha = 0.2
	} )
	self:registerAnimationState( "partiallyVisible", {
		alpha = 0.4
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "endState", {
		alpha = 0.2
	} )
	self.table = {
		{
			"hidden",
			100,
			true
		},
		{
			"partiallyVisible",
			100,
			true
		},
		{
			"hidden",
			100,
			true
		},
		{
			"partiallyVisible",
			100,
			true
		},
		{
			"hidden",
			100,
			true
		},
		{
			"visible",
			300,
			true
		},
		{
			"hidden",
			400,
			true
		},
		{
			"endState",
			1,
			true
		}
	}
	self:registerEventHandler( LUI.FormatAnimStateFinishStepEvent( "endState" ), function ( element, event )
		animateFaceAndCigar( self, self )
	end )
	animateFaceAndCigar( self, self )
	return self
end

LockTable( _M )
