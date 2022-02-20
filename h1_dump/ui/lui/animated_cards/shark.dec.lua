local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Shark = {}
AnimationStep = 120
function animateElements( f1_arg0 )
	f1_arg0:animateInSequence( {
		{
			"state1",
			0
		},
		{
			"state1",
			AnimationStep,
			true
		},
		{
			"state2",
			0
		},
		{
			"state2",
			AnimationStep,
			true
		},
		{
			"state3",
			0
		},
		{
			"state3",
			AnimationStep,
			true
		},
		{
			"state4",
			0
		},
		{
			"state4",
			AnimationStep,
			true
		},
		{
			"state5",
			0
		},
		{
			"state5",
			AnimationStep,
			true
		},
		{
			"state6",
			0
		},
		{
			"state6",
			AnimationStep,
			true
		},
		{
			"state7",
			0
		},
		{
			"state7",
			AnimationStep,
			true
		},
		{
			"state8",
			0
		},
		{
			"state8",
			AnimationStep,
			true
		},
		{
			"state9",
			0
		},
		{
			"state9",
			AnimationStep,
			true
		},
		{
			"state10",
			0
		},
		{
			"state10",
			AnimationStep,
			true
		},
		{
			"state11",
			0
		},
		{
			"state11",
			AnimationStep,
			true
		},
		{
			"state12",
			0
		},
		{
			"state12",
			AnimationStep,
			true
		},
		{
			"state13",
			0
		},
		{
			"state13",
			AnimationStep,
			true
		},
		{
			"state14",
			0
		},
		{
			"state14",
			AnimationStep,
			true
		},
		{
			"state15",
			0
		},
		{
			"state15",
			AnimationStep,
			true
		},
		{
			"state16",
			0
		},
		{
			"endState",
			AnimationStep,
			true
		}
	} )
end

LUI.Playercard.Shark.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_shark_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local2.material = RegisterAndCacheMaterial( "em_bg_shark_layer_02" )
	local self = LUI.UIImage.new( f2_local2 )
	local f2_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local4.material = RegisterAndCacheMaterial( "em_bg_shark_layer_03" )
	local self = LUI.UIImage.new( f2_local4 )
	local f2_local6 = RegisterAndCacheMaterial( "em_bg_shark_layer_04" )
	local f2_local7, f2_local8 = GetMaterialDimensions( f2_local6 )
	local f2_local9 = f2_local7 / f2_local8
	local f2_local10 = 100
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		left = 120,
		top = -10,
		material = f2_local6,
		width = f2_local10 * f2_local9,
		height = f2_local10
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self.width = f2_local10 * f2_local9
	self.height = f2_local10
	local f2_local12 = {
		leftAnchor = true,
		topAnchor = true,
		left = 120,
		top = -10,
		width = self.width,
		height = self.height
	}
	local f2_local13 = {
		leftAnchor = true,
		topAnchor = true,
		left = 100,
		top = -11,
		width = self.width - 15,
		height = self.height - 2
	}
	local f2_local14 = {
		leftAnchor = true,
		topAnchor = true,
		left = 80,
		top = -12,
		width = self.width - 30,
		height = self.height - 4
	}
	local f2_local15 = {
		leftAnchor = true,
		topAnchor = true,
		left = 70,
		top = -13,
		width = self.width - 45,
		height = self.height - 6
	}
	local f2_local16 = {
		leftAnchor = true,
		topAnchor = true,
		left = 60,
		top = -14,
		width = self.width - 60,
		height = self.height - 8
	}
	local f2_local17 = {
		leftAnchor = true,
		topAnchor = true,
		left = 80,
		top = -14,
		width = self.width - 45,
		height = self.height - 8,
		yRot = 180
	}
	local f2_local18 = {
		leftAnchor = true,
		topAnchor = true,
		left = 85,
		top = -14,
		width = self.width - 35,
		height = self.height - 8,
		yRot = 180
	}
	local f2_local19 = {
		leftAnchor = true,
		topAnchor = true,
		left = 95,
		top = -14,
		width = self.width - 25,
		height = self.height - 8,
		yRot = 180
	}
	local f2_local20 = {
		leftAnchor = true,
		topAnchor = true,
		left = 100,
		top = -14,
		width = self.width - 15,
		height = self.height - 8,
		yRot = 180
	}
	local f2_local21 = {
		leftAnchor = true,
		topAnchor = true,
		left = 115,
		top = -14,
		width = self.width - 25,
		height = self.height - 8,
		yRot = 180
	}
	local f2_local22 = {
		leftAnchor = true,
		topAnchor = true,
		left = 135,
		top = -14,
		width = self.width - 35,
		height = self.height - 6,
		yRot = 180
	}
	local f2_local23 = {
		leftAnchor = true,
		topAnchor = true,
		left = 155,
		top = -14,
		width = self.width - 45,
		height = self.height - 4,
		yRot = 180
	}
	local f2_local24 = {
		leftAnchor = true,
		topAnchor = true,
		left = 175,
		top = -13,
		width = self.width - 55,
		height = self.height - 2,
		yRot = 180
	}
	local f2_local25 = {
		leftAnchor = true,
		topAnchor = true,
		left = 165,
		top = -12,
		width = self.width - 45,
		height = self.height,
		yRot = 0
	}
	local f2_local26 = {
		leftAnchor = true,
		topAnchor = true,
		left = 155,
		top = -11,
		width = self.width - 35,
		height = self.height
	}
	local f2_local27 = {
		leftAnchor = true,
		topAnchor = true,
		left = 145,
		top = -10,
		width = self.width - 25,
		height = self.height
	}
	self:registerAnimationState( "state1", f2_local12 )
	self:registerAnimationState( "state2", f2_local13 )
	self:registerAnimationState( "state3", f2_local14 )
	self:registerAnimationState( "state4", f2_local15 )
	self:registerAnimationState( "state5", f2_local16 )
	self:registerAnimationState( "state6", f2_local17 )
	self:registerAnimationState( "state7", f2_local18 )
	self:registerAnimationState( "state8", f2_local19 )
	self:registerAnimationState( "state9", f2_local20 )
	self:registerAnimationState( "state10", f2_local21 )
	self:registerAnimationState( "state11", f2_local22 )
	self:registerAnimationState( "state12", f2_local23 )
	self:registerAnimationState( "state13", f2_local24 )
	self:registerAnimationState( "state14", f2_local25 )
	self:registerAnimationState( "state15", f2_local26 )
	self:registerAnimationState( "state16", f2_local27 )
	self:registerAnimationState( "endState", f2_local27 )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "endState" ), function ( element, event )
		animateElements( self )
	end )
	animateElements( self )
	return self
end

LockTable( _M )
