local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.CardTest = {}
LUI.Playercard.CardTest.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:setUseStencil( true )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_012" )
	self:addElement( LUI.UIImage.new( f1_local1 ) )
	local f1_local2 = CoD.CreateState( nil, nil, -20, nil, CoD.AnchorTypes.Right )
	f1_local2.width = 32
	f1_local2.height = 32
	f1_local2.material = RegisterAndCacheMaterial( "h1_ui_nemesis_skull" )
	f1_local2.alpha = 1
	local self = LUI.UIImage.new( f1_local2 )
	self:addElement( self )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"hidden",
			1500
		},
		{
			"default",
			1500
		}
	} )
	return self
end

LockTable( _M )
