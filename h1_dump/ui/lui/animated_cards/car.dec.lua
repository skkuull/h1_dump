local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Car = {}
LUI.Playercard.Car.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_car_layer_01" )
	local self = LUI.UIImage.new( f1_local1 )
	self:addElement( self )
	local f1_local3 = CoD.CreateState( -13, -23, 200, 85, CoD.AnchorTypes.TopLeft )
	f1_local3.material = RegisterAndCacheMaterial( "em_bg_car_layer_02" )
	local self = LUI.UIImage.new( f1_local3 )
	self:addElement( self )
	local f1_local5 = CoD.CreateState( -13, -23, 200, 85, CoD.AnchorTypes.TopLeft )
	f1_local5.material = RegisterAndCacheMaterial( "em_bg_car_layer_03" )
	local self = LUI.UIImage.new( f1_local5 )
	self:addElement( self )
	local f1_local7 = 1
	self:hide()
	self:addElement( LUI.UITimer.new( 78, "fire" ) )
	self:registerEventHandler( "fire", function ( element, event )
		f1_local7 = f1_local7 + 1
		if f1_local7 % 2 == 0 then
			self:hide()
			self:show()
		else
			self:hide()
			self:show()
		end
	end )
	local f1_local8 = CoD.CreateState( 1, -15, 213, 93, CoD.AnchorTypes.TopLeft )
	f1_local8.material = RegisterAndCacheMaterial( "em_bg_car_layer_04" )
	self:addElement( LUI.UIImage.new( f1_local8 ) )
	local f1_local9 = CoD.CreateState( 1, -15, 213, 92, CoD.AnchorTypes.TopLeft )
	f1_local9.material = RegisterAndCacheMaterial( "em_bg_car_layer_05" )
	local self = LUI.UIImage.new( f1_local9 )
	self:addElement( self )
	self:registerAnimationState( "left1", {
		zRot = 0.75
	} )
	self:registerAnimationState( "left2", {
		zRot = 0.25
	} )
	self:registerAnimationState( "right1", {
		zRot = -0.25
	} )
	self:registerAnimationState( "right2", {
		zRot = -0.5
	} )
	self:animateInLoop( {
		{
			"left1",
			20
		},
		{
			"right2",
			65
		},
		{
			"left2",
			45
		},
		{
			"left1",
			25
		},
		{
			"right2",
			25
		},
		{
			"right1",
			85
		},
		{
			"left2",
			25
		},
		{
			"right1",
			45
		}
	} )
	return self
end

LockTable( _M )
