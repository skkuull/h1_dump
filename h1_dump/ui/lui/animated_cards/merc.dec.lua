local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Merc = {}
LUI.Playercard.Merc.runAnimations = function ( f1_arg0 )
	f1_arg0.arm1:animateInSequence( f1_arg0.arm1.animTable )
	f1_arg0.arm2:animateInSequence( f1_arg0.arm2.animTable )
	f1_arg0.swoosh:animateInSequence( f1_arg0.swoosh.animTable )
	f1_arg0.eye:animateInSequence( f1_arg0.eye.animTable )
end

LUI.Playercard.Merc.new = function ()
	local f2_local0 = 250
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f2_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local2.material = RegisterAndCacheMaterial( "em_bg_merc_layer_01" )
	local self = LUI.UIImage.new( f2_local2 )
	self:addElement( self )
	local f2_local4 = RegisterAndCacheMaterial( "em_bg_merc_layer_02" )
	local f2_local5, f2_local6 = GetMaterialDimensions( f2_local4 )
	local f2_local7 = f2_local5 / f2_local6
	local f2_local8 = 26
	
	local eye = LUI.UIImage.new( {
		bottom = -28.5,
		left = 35.5,
		material = f2_local4,
		bottomAnchor = true,
		height = f2_local8,
		width = f2_local8 * f2_local7
	} )
	self:addElement( eye )
	self.eye = eye
	
	eye:registerAnimationState( "off", {
		alpha = 0
	} )
	eye:registerAnimationState( "on", {
		alpha = 1
	} )
	eye.animTable = {
		{
			"off",
			f2_local0 - 40
		},
		{
			"on",
			30
		},
		{
			"on",
			100
		},
		{
			"off",
			30
		}
	}
	f2_local4 = RegisterAndCacheMaterial( "em_bg_merc_layer_03" )
	local arm1, f2_local11 = GetMaterialDimensions( f2_local4 )
	f2_local7 = arm1 / f2_local11
	f2_local8 = 54
	
	arm1 = LUI.UIImage.new( {
		bottom = 3,
		left = -86,
		bottomAnchor = true,
		material = f2_local4,
		height = f2_local8,
		width = f2_local8 * f2_local7
	} )
	self:addElement( arm1 )
	self.arm1 = arm1
	
	arm1:registerAnimationState( "high", {
		bottom = 4,
		left = -86,
		bottomAnchor = true,
		height = f2_local8,
		width = f2_local8 * f2_local7
	} )
	arm1:registerAnimationState( "low", {
		bottom = 7,
		left = -86,
		bottomAnchor = true,
		height = f2_local8,
		width = f2_local8 * f2_local7
	} )
	arm1.animTable = {
		{
			"high",
			f2_local0 - 20
		},
		{
			"low",
			40
		},
		{
			"low",
			30
		},
		{
			"high",
			1
		}
	}
	f2_local4 = RegisterAndCacheMaterial( "em_bg_merc_layer_04" )
	local arm2, f2_local13 = GetMaterialDimensions( f2_local4 )
	f2_local7 = arm2 / f2_local13
	f2_local8 = 205
	
	arm2 = LUI.UIImage.new( {
		bottom = 17,
		left = -122,
		material = f2_local4,
		bottomAnchor = true,
		height = f2_local8,
		width = f2_local8 * f2_local7,
		alpha = 1,
		zRot = 0
	} )
	self:addElement( arm2 )
	self.arm2 = arm2
	
	arm2:registerAnimationState( "up", {
		bottom = 17,
		left = -122,
		bottomAnchor = true,
		height = f2_local8,
		width = f2_local8 * f2_local7,
		alpha = 1,
		zRot = 0
	} )
	arm2:registerAnimationState( "down", {
		bottom = 72,
		left = -133,
		bottomAnchor = true,
		height = f2_local8,
		width = f2_local8 * f2_local7,
		alpha = 1,
		zRot = -36
	} )
	arm2.animTable = {
		{
			"down",
			f2_local0
		},
		{
			"up",
			f2_local0
		}
	}
	f2_local4 = RegisterAndCacheMaterial( "em_bg_merc_layer_05" )
	local swoosh, f2_local15 = GetMaterialDimensions( f2_local4 )
	f2_local7 = swoosh / f2_local15
	f2_local8 = 100
	
	swoosh = LUI.UIImage.new( {
		bottom = 18,
		left = -7,
		bottomAnchor = true,
		material = f2_local4,
		height = f2_local8,
		width = f2_local8 * f2_local7,
		alpha = 1
	} )
	self:addElement( swoosh )
	self.swoosh = swoosh
	
	swoosh:registerAnimationState( "off", {
		alpha = 0
	} )
	swoosh:registerAnimationState( "on", {
		alpha = 1
	} )
	swoosh.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0
		},
		{
			"on",
			9
		},
		{
			"on",
			20
		},
		{
			"off",
			10
		}
	}
	LUI.Playercard.Merc.runAnimations( self )
	self:addElement( LUI.UITimer.new( f2_local0 * 2 + 70, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Merc.runAnimations )
	return self
end

LockTable( _M )
