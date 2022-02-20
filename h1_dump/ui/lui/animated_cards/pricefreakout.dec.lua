local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.PriceFreakout = {}
LUI.Playercard.PriceFreakout.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local2.material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_02" )
	self:addElement( LUI.UIImage.new( f1_local2 ) )
	local f1_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local3.material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_03" )
	self:addElement( LUI.UIImage.new( f1_local3 ) )
	local f1_local4 = -68
	local f1_local5 = 30
	local f1_local6 = CoD.CreateState( nil, f1_local4, f1_local5, nil, CoD.AnchorTypes.TopRight )
	f1_local6.width = 200
	f1_local6.height = 200
	local self = LUI.UIElement.new( f1_local6 )
	self:addElement( self )
	local f1_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local8.material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_04" )
	local self = LUI.UIImage.new( f1_local8 )
	self:addElement( self )
	self:registerAnimationState( "flash", {
		material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_05" )
	} )
	local f1_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f1_local10.height = 768
	f1_local10.width = 96
	f1_local10.zRot = 30
	f1_local10.left = -80
	f1_local10.material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_06" )
	local self = LUI.UIImage.new( f1_local10 )
	self:addElement( self )
	self:registerAnimationState( "flash", {
		material = RegisterAndCacheMaterial( "em_bg_price_freakout_layer_07" )
	} )
	local f1_local12 = 33.33
	local f1_local13 = {}
	for f1_local14 = 0, 7, 1 do
		f1_local13[f1_local14 * 2 + 1] = {
			"default",
			f1_local12 * 2
		}
		f1_local13[f1_local14 * 2 + 2] = {
			"flash",
			f1_local12
		}
	end
	f1_local13[#f1_local13] = {
		"default",
		f1_local12 * 6
	}
	self:animateInLoop( f1_local13 )
	self:animateInLoop( f1_local13 )
	local f1_local14 = {}
	local f1_local15 = 3
	for f1_local16 = 1, 12, 1 do
		local f1_local19 = CoD.CreateState( nil, f1_local4 + math.random( -f1_local15, f1_local15 ), f1_local5 + math.random( -f1_local15, f1_local15 ), nil, CoD.AnchorTypes.TopRight )
		f1_local19.width = f1_local6.width
		f1_local19.height = f1_local6.height
		local f1_local20 = "shake" .. f1_local16
		self:registerAnimationState( f1_local20, f1_local19 )
		f1_local14[f1_local16] = {
			f1_local20,
			f1_local12 * 2
		}
	end
	f1_local14[#f1_local14] = {
		"default",
		f1_local12
	}
	f1_local14[#f1_local14] = {
		"default",
		f1_local12 * 5
	}
	self:animateInLoop( f1_local14 )
	return self
end

LockTable( _M )
