local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Deep = {}
LUI.Playercard.Deep.runAnimations = function ( f1_arg0 )
	f1_arg0.sub:animateInSequence( f1_arg0.sub.animTable )
	f1_arg0.fishContainer:animateInSequence( f1_arg0.fishContainer.animTable )
	f1_arg0.fish1:animateInSequence( f1_arg0.fish1.animTable )
	f1_arg0.fish2:animateInSequence( f1_arg0.fish2.animTable )
end

LUI.Playercard.Deep.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f2_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local1.material = RegisterAndCacheMaterial( "em_bg_deep_layer_01" )
	local self = LUI.UIImage.new( f2_local1 )
	self:addElement( self )
	local f2_local3 = RegisterAndCacheMaterial( "em_bg_deep_layer_02" )
	local f2_local4, f2_local5 = GetMaterialDimensions( f2_local3 )
	local f2_local6 = f2_local4 / f2_local5
	local f2_local7 = 52
	local f2_local8 = 1
	local f2_local9 = 3
	local f2_local10 = 17
	local f2_local11 = 85
	local f2_local12 = 900
	
	local sub = LUI.UIImage.new( {
		bottom = 0,
		left = f2_local11,
		material = f2_local3,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	self:addElement( sub )
	self.sub = sub
	
	sub:registerAnimationState( "1", {
		bottom = f2_local8,
		left = f2_local11,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "2", {
		bottom = f2_local9,
		left = f2_local11 - f2_local10,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "3", {
		bottom = f2_local8,
		left = f2_local11 - f2_local10 * 2,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "4", {
		bottom = f2_local9,
		left = f2_local11 - f2_local10 * 3,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "5", {
		bottom = f2_local8,
		left = f2_local11 - f2_local10 * 4,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "6", {
		bottom = f2_local9,
		left = f2_local11 - f2_local10 * 5,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "7", {
		bottom = f2_local8,
		left = f2_local11 - f2_local10 * 6,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "8", {
		bottom = f2_local9,
		left = f2_local11 - f2_local10 * 7,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "9", {
		bottom = f2_local8,
		left = f2_local11 - f2_local10 * 8,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "10", {
		bottom = f2_local9,
		left = f2_local11 - f2_local10 * 8,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	sub:registerAnimationState( "11", {
		bottom = f2_local9,
		left = f2_local11 - f2_local10 * 7.75,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 0
	} )
	sub.animTable = {
		{
			"1",
			1
		},
		{
			"1",
			f2_local12
		},
		{
			"2",
			f2_local12
		},
		{
			"3",
			f2_local12
		},
		{
			"4",
			f2_local12
		},
		{
			"5",
			f2_local12
		},
		{
			"6",
			f2_local12
		},
		{
			"7",
			f2_local12
		},
		{
			"8",
			f2_local12
		},
		{
			"9",
			f2_local12
		},
		{
			"10",
			450
		},
		{
			"11",
			200
		}
	}
	
	local fishContainer = LUI.UIElement.new( {
		bottom = 26,
		left = 20,
		bottomAnchor = true,
		height = 1
	} )
	self:addElement( fishContainer )
	self.fishContainer = fishContainer
	
	fishContainer:registerAnimationState( "1", {
		bottom = 26,
		left = 140,
		bottomAnchor = true,
		height = 1
	} )
	fishContainer:registerAnimationState( "2", {
		bottom = 26,
		left = -147,
		bottomAnchor = true,
		height = 1
	} )
	fishContainer:registerAnimationState( "3", {
		bottom = 26,
		left = -620,
		bottomAnchor = true,
		height = 1
	} )
	fishContainer.animTable = {
		{
			"1",
			1
		},
		{
			"1",
			6400
		},
		{
			"2",
			1800
		},
		{
			"2",
			1400
		},
		{
			"3",
			1000
		}
	}
	f2_local3 = RegisterAndCacheMaterial( "em_bg_deep_layer_03" )
	local fish1, f2_local16 = GetMaterialDimensions( f2_local3 )
	f2_local6 = fish1 / f2_local16
	f2_local7 = 107
	
	fish1 = LUI.UIImage.new( {
		bottom = 0,
		left = 0,
		material = f2_local3,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * f2_local6,
		alpha = 1
	} )
	fishContainer:addElement( fish1 )
	self.fish1 = fish1
	
	fish1:registerAnimationState( "off", {
		alpha = 0
	} )
	fish1:registerAnimationState( "on", {
		alpha = 1
	} )
	fish1.animTable = {
		{
			"on",
			1
		},
		{
			"on",
			8300
		},
		{
			"off",
			1
		}
	}
	f2_local3 = RegisterAndCacheMaterial( "em_bg_deep_layer_04" )
	local fish2, f2_local18 = GetMaterialDimensions( f2_local3 )
	
	fish2 = LUI.UIImage.new( {
		bottom = 0,
		left = 0,
		material = f2_local3,
		bottomAnchor = true,
		height = f2_local7,
		width = f2_local7 * fish2 / f2_local18,
		alpha = 0
	} )
	fishContainer:addElement( fish2 )
	self.fish2 = fish2
	
	fish2:registerAnimationState( "off", {
		alpha = 0
	} )
	fish2:registerAnimationState( "on", {
		alpha = 1
	} )
	fish2.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			8300
		},
		{
			"on",
			1
		}
	}
	LUI.Playercard.Deep.runAnimations( self )
	self:addElement( LUI.UITimer.new( 11000, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Deep.runAnimations )
	return self
end

LockTable( _M )
