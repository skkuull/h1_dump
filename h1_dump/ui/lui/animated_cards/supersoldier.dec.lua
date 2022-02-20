local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.SuperSoldier = {}
function animateBackgrounds( f1_arg0, f1_arg1 )
	f1_arg0:animateInSequence( {
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
			0
		},
		{
			"visible",
			1000
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			3000
		}
	} )
	f1_arg1:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			5000
		},
		{
			"visible",
			0
		},
		{
			"finish",
			1000
		}
	} )
end

LUI.Playercard.SuperSoldier.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_super_soldier_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_super_soldier_layer_02" )
	local self = LUI.UIImage.new( f2_local0 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:animateToState( "hidden" )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_super_soldier_layer_03" )
	local self = LUI.UIImage.new( f2_local0 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "finish", {
		alpha = 1
	} )
	self:animateToState( "hidden" )
	self:addElement( self )
	self:addElement( self )
	animateBackgrounds( self, self )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "finish" ), function ( element, event )
		animateBackgrounds( self, self )
	end )
	return self
end

LockTable( _M )
