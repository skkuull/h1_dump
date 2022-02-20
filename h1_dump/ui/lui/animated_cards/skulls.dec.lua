local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Skulls = {}
AnimationTime = 2400
QuarterTime = AnimationTime * 0.25
ThreeQuarterTime = AnimationTime * 0.75
function startAnimations( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	animateFirstSkullInSequence( f1_arg0 )
	animateSecondSkullInSequence( f1_arg1 )
	animateThirdSkullInSequence( f1_arg2 )
	animateFourthSkullInSequence( f1_arg3 )
end

function handleEndOfSequence( f2_arg0, f2_arg1 )
	startAnimations( f2_arg0.container1, f2_arg0.container2, f2_arg0.container3, f2_arg0 )
end

function animateFirstSkullInSequence( f3_arg0 )
	f3_arg0:animateInSequence( {
		{
			"huge"
		},
		{
			"superHuge",
			QuarterTime
		},
		{
			"hidden",
			ThreeQuarterTime
		}
	} )
end

function animateSecondSkullInSequence( f4_arg0 )
	f4_arg0:animateInSequence( {
		{
			"sideways"
		},
		{
			"upsideDown",
			QuarterTime
		},
		{
			"huge",
			QuarterTime
		},
		{
			"superHuge",
			QuarterTime
		},
		{
			"hidden",
			QuarterTime
		}
	} )
end

function animateThirdSkullInSequence( f5_arg0 )
	f5_arg0:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			QuarterTime
		},
		{
			"start",
			0
		},
		{
			"sideways",
			QuarterTime
		},
		{
			"upsideDown",
			QuarterTime
		},
		{
			"hugeAndHidden",
			QuarterTime
		}
	} )
end

function animateFourthSkullInSequence( f6_arg0 )
	f6_arg0:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			ThreeQuarterTime
		},
		{
			"start",
			0
		},
		{
			"complete",
			QuarterTime
		}
	} )
end

LUI.Playercard.Skulls.new = function ()
	local f7_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local0.material = RegisterAndCacheMaterial( "em_bg_skulls_layer_01" )
	local self = LUI.UIImage.new( f7_local0 )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 200,
		top = -50,
		material = RegisterAndCacheMaterial( "em_bg_skulls_layer_03" )
	} )
	local f7_local3 = RegisterAndCacheMaterial( "em_bg_skulls_layer_02" )
	local f7_local4, f7_local5 = GetMaterialDimensions( f7_local3 )
	local f7_local6 = f7_local4 / f7_local5
	local f7_local7 = 25
	local f7_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		right = -100
	} )
	local self = LUI.UIElement.new( f7_local8 )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		right = -100
	} )
	local self = LUI.UIElement.new( f7_local8 )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		right = -100
	} )
	local self = LUI.UIElement.new( f7_local8 )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		right = -100
	} )
	local self = LUI.UIElement.new( f7_local8 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local f7_local17 = {
		alpha = 0
	}
	local f7_local18 = {
		scale = 0,
		zRot = -45,
		alpha = 0.5
	}
	local f7_local19 = {
		scale = 10,
		zRot = -90,
		alpha = 1
	}
	local f7_local20 = {
		scale = 25,
		zRot = -130
	}
	local f7_local21 = {
		scale = 50,
		zRot = -210
	}
	local f7_local22 = {
		scale = 50,
		zRot = -210,
		alpha = 0
	}
	local f7_local23 = {
		scale = 60,
		zRot = -305
	}
	local f7_local24 = {
		rightAnchor = true,
		topAnchor = true,
		width = f7_local7 * f7_local6,
		height = f7_local7,
		top = -11,
		right = 59,
		material = f7_local3
	}
	local self = LUI.UIImage.new( f7_local24 )
	local self = LUI.UIImage.new( f7_local24 )
	local self = LUI.UIImage.new( f7_local24 )
	local self = LUI.UIImage.new( f7_local24 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local f7_local29 = {
		self,
		self,
		self,
		self
	}
	for f7_local30 = 1, #f7_local29, 1 do
		local f7_local33 = f7_local29[f7_local30]
		f7_local33:registerAnimationState( "hidden", f7_local17 )
		f7_local33:registerAnimationState( "start", f7_local18 )
		f7_local33:registerAnimationState( "sideways", f7_local19 )
		f7_local33:registerAnimationState( "upsideDown", f7_local20 )
		f7_local33:registerAnimationState( "huge", f7_local21 )
		f7_local33:registerAnimationState( "hugeAndHidden", f7_local22 )
		f7_local33:registerAnimationState( "superHuge", f7_local23 )
	end
	self:registerAnimationState( "complete", f7_local19 )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "complete" ), handleEndOfSequence )
	self.container1 = self
	self.container2 = self
	self.container3 = self
	self:animateToState( "superHuge" )
	startAnimations( self, self, self, self )
	self:addElement( self )
	return self
end

LockTable( _M )
