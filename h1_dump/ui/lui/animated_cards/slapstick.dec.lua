local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Slapstick = {}
LUI.Playercard.Slapstick.runAnimations = function ( f1_arg0 )
	f1_arg0.peanutMan:animateInSequence( f1_arg0.peanutMan.animTable )
	f1_arg0.beanMan:animateInSequence( f1_arg0.beanMan.animTable )
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	local f2_local0
	if math.random() > 0.5 then
		f2_local0 = 1
		if not f2_local0 then
		
		else
			local f2_local1 = f2_arg1.right + math.random() * f2_local0
			if math.random() > 0.5 then
				local f2_local2 = 1
			end
			local f2_local3 = f2_arg1.top + math.random() * 1.5 * (f2_local2 or -1)
			local f2_local4 = 300 * math.random() + 300
			f2_arg1.right = f2_local1
			f2_arg1.top = f2_local3
			f2_arg0:registerAnimationState( "randPos", f2_arg1 )
			f2_arg0:animateToState( "randPos", f2_local4 )
		end
	end
	f2_local0 = -1
end

f0_local1 = function ( f3_arg0 )
	local f3_local0, f3_local1 = GetMaterialDimensions( RegisterAndCacheMaterial( "em_bg_slapstick_layer_07" ) )
	local f3_local2 = f3_local0 / f3_local1
	local f3_local3 = 14
	local f3_local4 = {
		rightAnchor = true,
		topAnchor = true,
		right = -49,
		top = 48,
		height = f3_local3,
		width = f3_local3 * f3_local2
	}
	local f3_local5, f3_local6 = GetMaterialDimensions( RegisterAndCacheMaterial( "em_bg_slapstick_layer_03" ) )
	f3_local5 = {
		rightAnchor = true,
		topAnchor = true,
		right = -47.5,
		top = 46,
		height = f3_local3,
		width = f3_local3 * f3_local5 / f3_local6
	}
	f0_local0( f3_arg0.peanutEyes, f3_local4 )
	f0_local0( f3_arg0.beanEyes, f3_local5 )
end

LUI.Playercard.Slapstick.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f4_local1 = CoD.CreateState( 0, -100, 0, 100, CoD.AnchorTypes.All )
	f4_local1.material = RegisterAndCacheMaterial( "em_bg_slapstick_layer_01" )
	local self = LUI.UIImage.new( f4_local1 )
	self:addElement( self )
	local f4_local3 = RegisterAndCacheMaterial( "em_bg_slapstick_layer_06" )
	local f4_local4, f4_local5 = GetMaterialDimensions( f4_local3 )
	local f4_local6 = f4_local4 / f4_local5
	local f4_local7 = 107
	
	local peanutMan = LUI.UIImage.new( {
		material = f4_local3,
		rightAnchor = true,
		topAnchor = true,
		right = -32,
		top = -31,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	self:addElement( peanutMan )
	self.peanutMan = peanutMan
	
	peanutMan:registerAnimationState( "high", {
		rightAnchor = true,
		topAnchor = true,
		right = -32,
		top = -32,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	peanutMan:registerAnimationState( "low", {
		rightAnchor = true,
		topAnchor = true,
		right = -32,
		top = -28,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	peanutMan.animTable = {
		{
			"low",
			900
		},
		{
			"high",
			900
		}
	}
	f4_local3 = RegisterAndCacheMaterial( "em_bg_slapstick_layer_07" )
	local peanutEyes, beanMan = GetMaterialDimensions( f4_local3 )
	f4_local6 = peanutEyes / beanMan
	f4_local7 = 14
	
	peanutEyes = LUI.UIImage.new( {
		material = f4_local3,
		rightAnchor = true,
		topAnchor = true,
		right = -46,
		top = 48,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	peanutMan:addElement( peanutEyes )
	self.peanutEyes = peanutEyes
	
	f4_local3 = RegisterAndCacheMaterial( "em_bg_slapstick_layer_02" )
	local beanMan, f4_local11 = GetMaterialDimensions( f4_local3 )
	f4_local6 = beanMan / f4_local11
	f4_local7 = 103
	
	beanMan = LUI.UIImage.new( {
		material = f4_local3,
		rightAnchor = true,
		topAnchor = true,
		right = 14,
		top = -35,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	self:addElement( beanMan )
	self.beanMan = beanMan
	
	beanMan:registerAnimationState( "high", {
		rightAnchor = true,
		topAnchor = true,
		right = 14,
		top = -36,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	beanMan:registerAnimationState( "low", {
		rightAnchor = true,
		topAnchor = true,
		right = 14,
		top = -33,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	beanMan.animTable = {
		{
			"high",
			900
		},
		{
			"low",
			900
		}
	}
	f4_local3 = RegisterAndCacheMaterial( "em_bg_slapstick_layer_03" )
	local beanEyes, f4_local13 = GetMaterialDimensions( f4_local3 )
	f4_local6 = beanEyes / f4_local13
	f4_local7 = 14
	
	beanEyes = LUI.UIImage.new( {
		material = f4_local3,
		rightAnchor = true,
		topAnchor = true,
		right = -48,
		top = 47,
		height = f4_local7,
		width = f4_local7 * f4_local6
	} )
	beanMan:addElement( beanEyes )
	self.beanEyes = beanEyes
	
	f4_local3 = RegisterAndCacheMaterial( "em_bg_slapstick_layer_04" )
	local f4_local13, f4_local14 = GetMaterialDimensions( f4_local3 )
	f4_local6 = f4_local13 / f4_local14
	f4_local7 = 24.5
	beanMan:addElement( LUI.UIImage.new( {
		material = f4_local3,
		rightAnchor = true,
		topAnchor = true,
		right = -49,
		top = 45.5,
		height = f4_local7,
		width = f4_local7 * f4_local6,
		alpha = 1
	} ) )
	f4_local3 = RegisterAndCacheMaterial( "em_bg_slapstick_layer_05" )
	local f4_local14, f4_local15 = GetMaterialDimensions( f4_local3 )
	f4_local6 = f4_local14 / f4_local15
	f4_local7 = 52
	beanMan:addElement( LUI.UIImage.new( {
		material = f4_local3,
		rightAnchor = true,
		topAnchor = true,
		right = -26.5,
		top = 36,
		height = f4_local7,
		width = f4_local7 * f4_local6,
		alpha = 1
	} ) )
	LUI.Playercard.Slapstick.runAnimations( self )
	self:addElement( LUI.UITimer.new( 1800, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Slapstick.runAnimations )
	self:addElement( LUI.UITimer.new( 500, "runEyes" ) )
	self:registerEventHandler( "runEyes", f0_local1 )
	return self
end

LockTable( _M )
