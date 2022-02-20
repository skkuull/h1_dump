local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Revolution = {}
LUI.Playercard.Revolution.runAnimations = function ( f1_arg0 )
	f1_arg0.fireContainer.fire1:animateInSequence( f1_arg0.fireContainer.fire1.animTable )
	f1_arg0.fireContainer.fire2:animateInSequence( f1_arg0.fireContainer.fire2.animTable )
	f1_arg0.fireContainer.fire3:animateInSequence( f1_arg0.fireContainer.fire3.animTable )
end

function makeFireContainer( f2_arg0, f2_arg1 )
	local f2_local0 = RegisterAndCacheMaterial( "em_bg_revolution_layer_04" )
	local f2_local1, f2_local2 = GetMaterialDimensions( f2_local0 )
	local f2_local3 = f2_local1 / f2_local2
	local f2_local4 = 55
	
	local fire1 = LUI.UIImage.new( {
		material = f2_local0,
		height = f2_local4,
		width = f2_local4 * f2_local3
	} )
	f2_arg0:addElement( fire1 )
	f2_arg0.fire1 = fire1
	
	fire1:registerAnimationState( "hide", {
		alpha = 0
	} )
	fire1:registerAnimationState( "show", {
		alpha = 1
	} )
	fire1.animTable = {
		{
			"show",
			50
		},
		{
			"show",
			130
		},
		{
			"hide",
			70
		},
		{
			"hide",
			350
		}
	}
	local f2_local6 = RegisterAndCacheMaterial( "em_bg_revolution_layer_05" )
	local f2_local7, fire2 = GetMaterialDimensions( f2_local6 )
	
	fire2 = LUI.UIImage.new( {
		material = f2_local6,
		height = f2_local4,
		width = f2_local4 * f2_local7 / fire2
	} )
	f2_arg0:addElement( fire2 )
	f2_arg0.fire2 = fire2
	
	fire2:registerAnimationState( "hide", {
		alpha = 0
	} )
	fire2:registerAnimationState( "show", {
		alpha = 1
	} )
	fire2.animTable = {
		{
			"hide",
			50
		},
		{
			"hide",
			130
		},
		{
			"show",
			50
		},
		{
			"show",
			130
		},
		{
			"hide",
			70
		},
		{
			"hide",
			170
		}
	}
	local f2_local9 = RegisterAndCacheMaterial( "em_bg_revolution_layer_06" )
	local f2_local10, fire3 = GetMaterialDimensions( f2_local9 )
	
	fire3 = LUI.UIImage.new( {
		material = f2_local9,
		height = f2_local4,
		width = f2_local4 * f2_local10 / fire3
	} )
	f2_arg0:addElement( fire3 )
	f2_arg0.fire3 = fire3
	
	fire3:registerAnimationState( "hide", {
		alpha = 0
	} )
	fire3:registerAnimationState( "show", {
		alpha = 1
	} )
	fire3.animTable = {
		{
			"hide",
			50
		},
		{
			"hide",
			309
		},
		{
			"show",
			50
		},
		{
			"show",
			190
		}
	}
	local f2_local12 = RegisterAndCacheMaterial( "em_bg_revolution_layer_04" )
	local f2_local13, self = GetMaterialDimensions( f2_local9 )
	self = LUI.UIImage.new( {
		material = f2_local12,
		height = f2_local4,
		width = f2_local4 * f2_local13 / self
	} )
	f2_arg0:addElement( self )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerAnimationState( "show", {
		alpha = 0.5
	} )
	self:animateInLoop( {
		{
			"hide",
			1
		},
		{
			"hide",
			1637
		},
		{
			"show",
			20
		},
		{
			"show",
			300
		},
		{
			"hide",
			10
		}
	} )
end

LUI.Playercard.Revolution.new = function ()
	local f3_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local0.material = RegisterAndCacheMaterial( "em_bg_revolution_layer_01" )
	local self = LUI.UIImage.new( f3_local0 )
	
	local fireContainer = LUI.UIElement.new( CoD.CreateState( -2, 5, nil, nil, CoD.AnchorTypes.All ) )
	makeFireContainer( fireContainer )
	self:addElement( fireContainer )
	self.fireContainer = fireContainer
	
	local f3_local3 = RegisterAndCacheMaterial( "em_bg_revolution_layer_02" )
	local f3_local4, f3_local5 = GetMaterialDimensions( f3_local3 )
	local f3_local6 = f3_local4 / f3_local5
	local f3_local7 = 105
	
	local raisedFist = LUI.UIImage.new( {
		material = f3_local3,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = 37,
		left = -10,
		height = f3_local7,
		width = f3_local7 * f3_local6
	} )
	self:addElement( raisedFist )
	self.raisedFist = raisedFist
	
	raisedFist:registerAnimationState( "low", {
		material = f3_local3,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = 44,
		left = -10,
		height = f3_local7,
		width = f3_local7 * f3_local6
	} )
	raisedFist:registerAnimationState( "high", {
		material = f3_local3,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = 31,
		left = -10,
		height = f3_local7,
		width = f3_local7 * f3_local6
	} )
	raisedFist:registerAnimationState( "mid", {
		material = f3_local3,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = 35,
		left = -10,
		height = f3_local7,
		width = f3_local7 * f3_local6
	} )
	raisedFist:registerAnimationState( "midlow", {
		material = f3_local3,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = 42,
		left = -10,
		height = f3_local7,
		width = f3_local7 * f3_local6
	} )
	raisedFist:animateInLoop( {
		{
			"low",
			270
		},
		{
			"high",
			270
		},
		{
			"mid",
			200
		},
		{
			"high",
			200
		},
		{
			"midlow",
			160
		},
		{
			"high",
			160
		},
		{
			"low",
			150
		},
		{
			"high",
			150
		},
		{
			"mid",
			150
		},
		{
			"high",
			170
		}
	} )
	f3_local3 = RegisterAndCacheMaterial( "em_bg_revolution_layer_03" )
	local armFlag, f3_local10 = GetMaterialDimensions( f3_local3 )
	f3_local6 = armFlag / f3_local10
	f3_local7 = 102
	
	armFlag = LUI.UIImage.new( {
		material = f3_local3,
		height = f3_local7,
		rightAnchor = true,
		right = 0,
		top = -45,
		width = f3_local7 * f3_local6
	} )
	self:addElement( armFlag )
	self.armFlag = armFlag
	
	armFlag:registerAnimationState( "low", {
		material = f3_local3,
		height = f3_local7,
		rightAnchor = true,
		right = 0,
		top = -42,
		width = f3_local7 * f3_local6
	} )
	armFlag:registerAnimationState( "high", {
		material = f3_local3,
		height = f3_local7,
		rightAnchor = true,
		right = 0,
		top = -46,
		width = f3_local7 * f3_local6
	} )
	armFlag:animateInLoop( {
		{
			"high",
			130
		},
		{
			"low",
			130
		},
		{
			"high",
			160
		},
		{
			"low",
			220
		},
		{
			"high",
			150
		},
		{
			"low",
			130
		},
		{
			"high",
			130
		},
		{
			"low",
			130
		},
		{
			"high",
			400
		},
		{
			"low",
			210
		}
	} )
	local f3_local11 = RegisterAndCacheMaterial( "em_bg_revolution_layer_07" )
	local f3_local12, f3_local13 = GetMaterialDimensions( f3_local11 )
	local f3_local14 = f3_local12 / f3_local13
	f3_local7 = 112
	local self = LUI.UIImage.new( {
		material = f3_local11,
		rightAnchor = true,
		height = f3_local7,
		top = -50,
		right = -39,
		width = f3_local7 * f3_local14
	} )
	self:addElement( self )
	self:registerAnimationState( "higher", {
		material = f3_local11,
		rightAnchor = true,
		height = f3_local7,
		top = -56,
		right = -39.15,
		width = f3_local7 * f3_local14
	} )
	self:registerAnimationState( "high", {
		material = f3_local11,
		rightAnchor = true,
		height = f3_local7,
		top = -55,
		right = -39,
		width = f3_local7 * f3_local14
	} )
	self:registerAnimationState( "mid", {
		material = f3_local11,
		rightAnchor = true,
		height = f3_local7,
		top = -52,
		right = -39,
		width = f3_local7 * f3_local14
	} )
	self:registerAnimationState( "low", {
		material = f3_local11,
		rightAnchor = true,
		height = f3_local7,
		top = -49,
		right = -39,
		width = f3_local7 * f3_local14
	} )
	self:animateInLoop( {
		{
			"mid",
			240
		},
		{
			"high",
			200
		},
		{
			"mid",
			200
		},
		{
			"high",
			200
		},
		{
			"low",
			280
		},
		{
			"high",
			170
		},
		{
			"mid",
			190
		},
		{
			"high",
			180
		},
		{
			"mid",
			190
		},
		{
			"high",
			140
		},
		{
			"higher",
			160
		}
	} )
	local f3_local16 = RegisterAndCacheMaterial( "em_bg_revolution_layer_08" )
	local f3_local17, f3_local18 = GetMaterialDimensions( f3_local16 )
	local f3_local19 = f3_local17 / f3_local18
	f3_local7 = 103
	local self = LUI.UIImage.new( {
		material = f3_local16,
		rightAnchor = true,
		height = f3_local7,
		top = -40,
		right = 39,
		width = f3_local7 * f3_local19
	} )
	self:addElement( self )
	self:registerAnimationState( "high", {
		material = f3_local16,
		rightAnchor = true,
		height = f3_local7,
		top = -45,
		right = 39,
		width = f3_local7 * f3_local19
	} )
	self:registerAnimationState( "midUp", {
		material = f3_local16,
		rightAnchor = true,
		height = f3_local7,
		top = -42,
		right = 39,
		width = f3_local7 * f3_local19
	} )
	self:registerAnimationState( "midDown", {
		material = f3_local16,
		rightAnchor = true,
		height = f3_local7,
		top = -39,
		right = 39,
		width = f3_local7 * f3_local19
	} )
	self:registerAnimationState( "low", {
		material = f3_local16,
		rightAnchor = true,
		height = f3_local7,
		top = -37,
		right = 39,
		width = f3_local7 * f3_local19
	} )
	self:animateInLoop( {
		{
			"midUp",
			300
		},
		{
			"midDown",
			100
		},
		{
			"high",
			180
		},
		{
			"midDown",
			170
		},
		{
			"midUp",
			170
		},
		{
			"low",
			180
		},
		{
			"midUp",
			200
		},
		{
			"midDown",
			190
		},
		{
			"midUp",
			200
		},
		{
			"midDown",
			190
		}
	} )
	LUI.Playercard.Revolution.runAnimations( self )
	self:addElement( LUI.UITimer.new( 600, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Revolution.runAnimations )
	return self
end

LockTable( _M )
