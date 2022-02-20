local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Pirate = {}
LUI.Playercard.Pirate.runAnimations = function ( f1_arg0 )
	f1_arg0.flag1:animateInSequence( f1_arg0.flag1.animTable )
	f1_arg0.flag2:animateInSequence( f1_arg0.flag2.animTable )
	f1_arg0.flag3:animateInSequence( f1_arg0.flag3.animTable )
end

LUI.Playercard.Pirate.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f2_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local1.material = RegisterAndCacheMaterial( "em_bg_pirate_layer_01" )
	local self = LUI.UIImage.new( f2_local1 )
	self:addElement( self )
	local f2_local3 = RegisterAndCacheMaterial( "em_bg_pirate_layer_02" )
	local f2_local4, f2_local5 = GetMaterialDimensions( f2_local3 )
	local f2_local6 = f2_local4 / f2_local5
	local f2_local7 = 22
	local self = LUI.UIImage.new( {
		bottom = -23,
		left = -140,
		bottomAnchor = true,
		material = f2_local3,
		height = f2_local7,
		width = f2_local7 * f2_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "right", {
		bottom = -23,
		left = 100,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6
	} )
	self:registerAnimationState( "left", {
		bottom = -23,
		left = -250,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6
	} )
	self:animateInLoop( {
		{
			"left",
			1
		},
		{
			"right",
			4600
		}
	} )
	f2_local3 = RegisterAndCacheMaterial( "em_bg_pirate_layer_03" )
	local flag1, f2_local10 = GetMaterialDimensions( f2_local3 )
	f2_local6 = flag1 / f2_local10
	f2_local7 = 108
	
	flag1 = LUI.UIImage.new( {
		bottom = 26,
		left = -75,
		bottomAnchor = true,
		material = f2_local3,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 0
	} )
	self:addElement( flag1 )
	self.flag1 = flag1
	
	flag1:registerAnimationState( "on", {
		alpha = 1
	} )
	flag1:registerAnimationState( "off", {
		alpha = 0
	} )
	f2_local10 = {
		{
			"on",
			10
		},
		{
			"on",
			199
		},
		{
			"off",
			83
		},
		{
			"off",
			208
		}
	}
	flag1:animateInLoop( f2_local10 )
	flag1.animTable = f2_local10
	f2_local3 = RegisterAndCacheMaterial( "em_bg_pirate_layer_04" )
	local flag2, f2_local12 = GetMaterialDimensions( f2_local3 )
	f2_local6 = flag2 / f2_local12
	f2_local7 = 108
	
	flag2 = LUI.UIImage.new( {
		bottom = 26,
		left = -75,
		bottomAnchor = true,
		material = f2_local3,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 0
	} )
	self:addElement( flag2 )
	self.flag2 = flag2
	
	flag2:registerAnimationState( "on", {
		alpha = 1
	} )
	flag2:registerAnimationState( "off", {
		alpha = 0
	} )
	f2_local12 = {
		{
			"off",
			83
		},
		{
			"off",
			83
		},
		{
			"on",
			10
		},
		{
			"on",
			199
		},
		{
			"off",
			83
		},
		{
			"off",
			41.5
		}
	}
	flag2:animateInLoop( f2_local12 )
	flag2.animTable = f2_local12
	f2_local3 = RegisterAndCacheMaterial( "em_bg_pirate_layer_05" )
	local flag3, f2_local14 = GetMaterialDimensions( f2_local3 )
	f2_local6 = flag3 / f2_local14
	f2_local7 = 108
	
	flag3 = LUI.UIImage.new( {
		bottom = 26,
		left = -75,
		bottomAnchor = true,
		material = f2_local3,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 0
	} )
	self:addElement( flag3 )
	self.flag3 = flag3
	
	flag3:registerAnimationState( "on", {
		alpha = 1
	} )
	flag3:registerAnimationState( "off", {
		alpha = 0
	} )
	f2_local14 = {
		{
			"on",
			41.5
		},
		{
			"off",
			43
		},
		{
			"off",
			298
		},
		{
			"on",
			10
		},
		{
			"on",
			105.5
		}
	}
	flag3:animateInLoop( f2_local14 )
	flag3.animTable = f2_local14
	LUI.Playercard.Pirate.runAnimations( self )
	self:addElement( LUI.UITimer.new( 520, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Pirate.runAnimations )
	return self
end

LockTable( _M )
