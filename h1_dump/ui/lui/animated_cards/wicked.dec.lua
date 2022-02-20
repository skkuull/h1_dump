local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Wicked = {}
LUI.Playercard.Wicked.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_wicked_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local2.alpha = 0
	f1_local2.material = RegisterAndCacheMaterial( "em_bg_wicked_layer_02" )
	local self = LUI.UIImage.new( f1_local2 )
	self:addElement( self )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"show",
			1500
		},
		{
			"show",
			1000
		},
		{
			"hide",
			1500
		},
		{
			"hide",
			1000
		}
	} )
	return self
end

LockTable( _M )
