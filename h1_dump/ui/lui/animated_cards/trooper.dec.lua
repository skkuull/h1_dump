local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Trooper = {}
LUI.Playercard.Trooper.runAnimations = function ( f1_arg0 )
	f1_arg0.sword:animateInSequence( f1_arg0.sword.animTable )
	f1_arg0.torso:animateInSequence( f1_arg0.torso.animTable )
	f1_arg0.arm:animateInSequence( f1_arg0.arm.animTable )
	f1_arg0.deadGuy:animateInSequence( f1_arg0.deadGuy.animTable )
	f1_arg0.blood:animateInSequence( f1_arg0.blood.animTable )
end

LUI.Playercard.Trooper.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_trooper_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_trooper_layer_04" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 50
	
	local sword = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -36,
		right = -66,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 15,
		material = f2_local2
	} )
	self:addElement( sword )
	self.sword = sword
	
	sword:registerAnimationState( "highest", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -42,
		right = -66,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 15
	} )
	sword:registerAnimationState( "higher", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -37,
		right = -66,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 15
	} )
	sword:registerAnimationState( "high", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -36.5,
		right = -66,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 15
	} )
	sword:registerAnimationState( "downLeft", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -16,
		right = -70.5,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 15
	} )
	sword:registerAnimationState( "downRight", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -14,
		right = -70.2,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 18
	} )
	sword.animTable = {
		{
			"higher",
			1
		},
		{
			"high",
			300
		},
		{
			"higher",
			300
		},
		{
			"downLeft",
			200
		},
		{
			"downLeft",
			50
		},
		{
			"highest",
			400
		},
		{
			"highest",
			100
		},
		{
			"downRight",
			70
		},
		{
			"downRight",
			200
		},
		{
			"higher",
			299
		}
	}
	local f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_02" )
	local f2_local9 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local9.material = f2_local8
	self:addElement( LUI.UIImage.new( f2_local9 ) )
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_03" )
	local f2_local10, torso = GetMaterialDimensions( f2_local8 )
	f2_local5 = f2_local10 / torso
	f2_local6 = 54
	
	torso = LUI.UIImage.new( {
		material = f2_local8,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -18,
		right = -25,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -15,
		material = f2_local8
	} )
	self:addElement( torso )
	self.torso = torso
	
	torso:registerAnimationState( "hunch", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -18,
		right = -25.8,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 0
	} )
	torso:registerAnimationState( "uprightHigh", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -18,
		right = -24.7,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -15
	} )
	torso:registerAnimationState( "uprightLow", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -17.4,
		right = -24.7,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -15
	} )
	torso.animTable = {
		{
			"uprightHigh",
			1
		},
		{
			"uprightLow",
			300
		},
		{
			"uprightHigh",
			300
		},
		{
			"hunch",
			200
		},
		{
			"hunch",
			50
		},
		{
			"uprightHigh",
			400
		},
		{
			"uprightHigh",
			100
		},
		{
			"hunch",
			70
		},
		{
			"hunch",
			200
		},
		{
			"uprightHigh",
			299
		}
	}
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_05" )
	local f2_local12, deadGuy = GetMaterialDimensions( f2_local8 )
	f2_local5 = f2_local12 / deadGuy
	f2_local6 = 52
	
	deadGuy = LUI.UIImage.new( {
		material = f2_local8,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -1,
		right = -81,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 0,
		material = f2_local8
	} )
	self:addElement( deadGuy )
	self.deadGuy = deadGuy
	
	deadGuy:registerAnimationState( "hunch", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -0.5,
		right = -81,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -1
	} )
	deadGuy.animTable = {
		{
			"default",
			1
		},
		{
			"default",
			750
		},
		{
			"hunch",
			100
		},
		{
			"default",
			100
		},
		{
			"default",
			520
		},
		{
			"hunch",
			100
		},
		{
			"default",
			100
		},
		{
			"default",
			799
		}
	}
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_06" )
	local f2_local14, f2_local15 = GetMaterialDimensions( f2_local8 )
	f2_local5 = f2_local14 / f2_local15
	f2_local6 = 50
	f2_local14 = 60
	
	local blood = LUI.UIImage.new( {
		material = f2_local8,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -7,
		right = -69,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		alpha = 0,
		zRot = 0,
		material = f2_local8
	} )
	self:addElement( blood )
	self.blood = blood
	
	blood:registerAnimationState( "splash1", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -8,
		right = -69,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		alpha = 1,
		zRot = 0
	} )
	blood:registerAnimationState( "splash2Default", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -8.5,
		right = -70 - f2_local14 * f2_local5,
		height = f2_local14,
		width = f2_local14 * f2_local5 * -1,
		alpha = 0,
		zRot = -50
	} )
	blood:registerAnimationState( "splash2", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -8.5,
		right = -70 - f2_local14 * f2_local5,
		height = f2_local14,
		width = f2_local14 * f2_local5 * -1,
		alpha = 1,
		zRot = -50
	} )
	blood.animTable = {
		{
			"default",
			1
		},
		{
			"default",
			800
		},
		{
			"splash1",
			200
		},
		{
			"default",
			200
		},
		{
			"default",
			320
		},
		{
			"splash2Default",
			1
		},
		{
			"splash2",
			199
		},
		{
			"splash2Default",
			200
		},
		{
			"default",
			549
		}
	}
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_07" )
	local f2_local17, helmetArrows = GetMaterialDimensions( f2_local8 )
	f2_local5 = f2_local17 / helmetArrows
	f2_local6 = 53
	
	helmetArrows = LUI.UIImage.new( {
		material = f2_local8,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 0,
		right = -93.5,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		material = f2_local8
	} )
	self:addElement( helmetArrows )
	self.helmetArrows = helmetArrows
	
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_08" )
	local f2_local19, arm = GetMaterialDimensions( f2_local8 )
	f2_local5 = f2_local19 / arm
	f2_local6 = 58
	
	arm = LUI.UIImage.new( {
		material = f2_local8,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -19,
		right = -16,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -35,
		material = f2_local8
	} )
	torso:addElement( arm )
	self.arm = arm
	
	arm:registerAnimationState( "swivel", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -13,
		right = -12.5,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 12
	} )
	arm:registerAnimationState( "swivelMore", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -12.5,
		right = -12.5,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 16
	} )
	arm:registerAnimationState( "up", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -21,
		right = -17,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -35
	} )
	arm.animTable = {
		{
			"up",
			1
		},
		{
			"up",
			300
		},
		{
			"up",
			300
		},
		{
			"swivel",
			200
		},
		{
			"swivel",
			50
		},
		{
			"up",
			400
		},
		{
			"up",
			100
		},
		{
			"swivelMore",
			70
		},
		{
			"swivelMore",
			200
		},
		{
			"up",
			299
		}
	}
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_09" )
	f2_local3, f2_local4 = GetMaterialDimensions( f2_local8 )
	local self = LUI.UIImage.new( {
		material = f2_local8,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		height = 56,
		alpha = 0.2,
		material = f2_local8
	} )
	self:addElement( self )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"default",
			600
		},
		{
			"default",
			900
		},
		{
			"hide",
			600
		},
		{
			"hide",
			200
		}
	} )
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_10" )
	f2_local3, f2_local4 = GetMaterialDimensions( f2_local8 )
	local f2_local22 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local22.material = f2_local8
	local self = LUI.UIImage.new( f2_local22 )
	self:addElement( self )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	local f2_local24 = {
		{
			"show",
			1
		},
		{
			"show",
			200
		},
		{
			"hide",
			500
		},
		{
			"hide",
			900
		},
		{
			"show",
			499
		}
	}
	self:animateInLoop( f2_local24 )
	local self = LUI.UIImage.new( f2_local22 )
	self:addElement( self )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateInLoop( f2_local24 )
	f2_local8 = RegisterAndCacheMaterial( "em_bg_trooper_layer_11" )
	f2_local3, f2_local4 = GetMaterialDimensions( f2_local8 )
	local f2_local26 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local26.material = f2_local8
	local self = LUI.UIImage.new( f2_local26 )
	self:addElement( self )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0.6
	} )
	self:animateInLoop( {
		{
			"hide",
			200
		},
		{
			"hide",
			999
		},
		{
			"show",
			300
		},
		{
			"show",
			200
		},
		{
			"hide",
			150
		},
		{
			"hide",
			350
		}
	} )
	LUI.Playercard.Trooper.runAnimations( self )
	self:addElement( LUI.UITimer.new( 2120, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Trooper.runAnimations )
	return self
end

LockTable( _M )
