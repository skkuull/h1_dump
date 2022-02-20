local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Eyeball = {}
function animateElements( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0:animateInSequence( {
		{
			"armState1",
			0
		},
		{
			"armState2",
			800,
			true,
			false
		},
		{
			"armState5",
			100,
			true,
			false
		},
		{
			"armState6",
			500,
			true,
			false
		},
		{
			"armState6",
			0
		},
		{
			"armState6",
			1000
		},
		{
			"armState7",
			100,
			true,
			false
		},
		{
			"armState8",
			100,
			true,
			false
		},
		{
			"armState9",
			100,
			true,
			false
		},
		{
			"armState10",
			300,
			true,
			false
		},
		{
			"armState11",
			500,
			true,
			false
		},
		{
			"armState11",
			0
		},
		{
			"armState11",
			1000
		},
		{
			"armState12",
			500,
			true,
			false
		},
		{
			"armState12",
			0
		},
		{
			"armState12",
			1000
		},
		{
			"armState13",
			500,
			true,
			false
		},
		{
			"armState14",
			500,
			true,
			false
		},
		{
			"armState1",
			500,
			true,
			false
		},
		{
			"armState15",
			1500
		},
		{
			"armState15",
			0
		},
		{
			"armState15",
			1000
		},
		{
			"armState16",
			500,
			true,
			false
		},
		{
			"armState1",
			500,
			true,
			false
		},
		{
			"armState1",
			0
		},
		{
			"finish",
			1390
		}
	} )
	f1_arg1:animateInSequence( {
		{
			"container1",
			0
		},
		{
			"container1",
			930
		},
		{
			"container2",
			530,
			true,
			false
		},
		{
			"container2",
			0,
			true,
			false
		},
		{
			"container2",
			1030,
			true,
			false
		},
		{
			"container1",
			830,
			true,
			false
		},
		{
			"container2",
			430,
			true,
			false
		},
		{
			"container2",
			0,
			true,
			false
		},
		{
			"container2",
			930,
			true,
			false
		},
		{
			"container1",
			1030,
			true,
			false
		},
		{
			"container1",
			0,
			true,
			false
		},
		{
			"container1",
			1030,
			true,
			false
		},
		{
			"container1",
			1230,
			true,
			false
		},
		{
			"container2",
			1430,
			true,
			false
		},
		{
			"container2",
			0,
			true,
			false
		},
		{
			"container2",
			1030,
			true,
			false
		},
		{
			"container1",
			1030,
			true,
			false
		},
		{
			"container1",
			0,
			true,
			false
		},
		{
			"container1",
			930,
			true,
			false
		}
	} )
	f1_arg2:animateInSequence( {
		{
			"matte1",
			0
		},
		{
			"matte2",
			830,
			true,
			false
		},
		{
			"matte1",
			130,
			true,
			false
		},
		{
			"matte1",
			0,
			true,
			false
		},
		{
			"matte1",
			1530,
			true,
			false
		},
		{
			"matte4",
			1030,
			true,
			false
		},
		{
			"matte4",
			0,
			true,
			false
		},
		{
			"matte4",
			1030,
			true,
			false
		},
		{
			"matte1",
			1030,
			true,
			false
		},
		{
			"matte1",
			0,
			true,
			false
		},
		{
			"matte1",
			1030,
			true,
			false
		},
		{
			"matte4",
			2030,
			true,
			false
		},
		{
			"matte4",
			0,
			true,
			false
		},
		{
			"matte4",
			1660,
			true,
			false
		},
		{
			"matte1",
			1030,
			true,
			false
		},
		{
			"matte1",
			0,
			true,
			false
		},
		{
			"matte1",
			1060,
			true,
			false
		}
	} )
end

LUI.Playercard.Eyeball.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_eyeball_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_eyeball_layer_02" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 65
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} ) )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_eyeball_layer_03" )
	local self, f2_local8 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local8
	f2_local6 = 110
	self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 40,
		left = -50,
		width = 20,
		height = 20,
		zRot = -10
	} )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		left = -35,
		top = -65,
		height = f2_local6,
		material = f2_local2
	} ) )
	self:addElement( self )
	local f2_local9 = {
		leftAnchor = true,
		topAnchor = true,
		top = 40,
		left = -50,
		zRot = -10
	}
	local f2_local10 = {
		leftAnchor = true,
		topAnchor = true,
		top = 65,
		left = -50,
		zRot = -10
	}
	local f2_local11 = {
		leftAnchor = true,
		topAnchor = true,
		top = 65,
		left = -50,
		zRot = -1
	}
	local f2_local12 = {
		leftAnchor = true,
		topAnchor = true,
		top = 65,
		left = -30,
		zRot = -1
	}
	local f2_local13 = {
		leftAnchor = true,
		topAnchor = true,
		top = 60,
		left = -38,
		zRot = -3
	}
	local f2_local14 = {
		leftAnchor = true,
		topAnchor = true,
		top = 50,
		left = -42,
		zRot = -6
	}
	local f2_local15 = {
		leftAnchor = true,
		topAnchor = true,
		top = 45,
		left = -46,
		zRot = -9
	}
	local f2_local16 = {
		leftAnchor = true,
		topAnchor = true,
		top = 40,
		left = -50,
		zRot = -12
	}
	local f2_local17 = {
		leftAnchor = true,
		topAnchor = true,
		top = 40,
		left = -30,
		zRot = -12
	}
	local f2_local18 = {
		leftAnchor = true,
		topAnchor = true,
		top = 75,
		left = -30,
		zRot = 3
	}
	local f2_local19 = {
		leftAnchor = true,
		topAnchor = true,
		top = 10,
		left = -5,
		zRot = -75
	}
	local f2_local20 = {
		leftAnchor = true,
		topAnchor = true,
		top = 35,
		left = -30,
		zRot = -75
	}
	local f2_local21 = {
		leftAnchor = true,
		topAnchor = true,
		top = 40,
		left = -30,
		zRot = -10
	}
	local f2_local22 = {
		leftAnchor = true,
		topAnchor = true,
		top = 120,
		left = -30,
		zRot = 45
	}
	local f2_local23 = {
		leftAnchor = true,
		topAnchor = true,
		top = 40,
		left = -50,
		zRot = -10
	}
	self:registerAnimationState( "armState1", f2_local9 )
	self:registerAnimationState( "armState2", f2_local10 )
	self:registerAnimationState( "armState5", f2_local11 )
	self:registerAnimationState( "armState6", f2_local12 )
	self:registerAnimationState( "armState7", f2_local13 )
	self:registerAnimationState( "armState8", f2_local14 )
	self:registerAnimationState( "armState9", f2_local15 )
	self:registerAnimationState( "armState10", f2_local16 )
	self:registerAnimationState( "armState11", f2_local17 )
	self:registerAnimationState( "armState12", f2_local18 )
	self:registerAnimationState( "armState13", f2_local19 )
	self:registerAnimationState( "armState14", f2_local20 )
	self:registerAnimationState( "armState15", f2_local21 )
	self:registerAnimationState( "armState16", f2_local22 )
	self:registerAnimationState( "finish", f2_local23 )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_eyeball_layer_04" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_eyeball_layer_05" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	self = LUI.UIElement.new( {
		width = 20,
		height = 20
	} )
	self:addElement( self )
	self:addElement( self )
	local f2_local27 = {
		zRot = -3,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	local f2_local28 = {
		zRot = 50,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	local f2_local29 = {
		zRot = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	local f2_local30 = {
		zRot = -20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	self:registerAnimationState( "matte1", f2_local27 )
	self:registerAnimationState( "matte2", f2_local28 )
	self:registerAnimationState( "matte3", f2_local29 )
	self:registerAnimationState( "matte4", f2_local30 )
	local f2_local31 = {
		rightAnchor = true,
		topAnchor = true,
		top = 20,
		right = -17,
		width = 20,
		height = 20
	}
	local f2_local32 = {
		rightAnchor = true,
		topAnchor = true,
		top = 25,
		right = 0,
		width = 20,
		height = 20
	}
	self:registerAnimationState( "container1", f2_local31 )
	self:registerAnimationState( "container2", f2_local32 )
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		topAnchor = true,
		right = -5,
		top = 10,
		width = 20,
		height = 20
	} )
	self:addElement( self )
	self:addElement( self )
	local f2_local34 = {
		rightAnchor = true,
		topAnchor = true,
		right = -4,
		top = 9
	}
	local f2_local35 = {
		rightAnchor = true,
		topAnchor = true,
		right = -5,
		top = 10
	}
	local f2_local36 = {
		rightAnchor = true,
		topAnchor = true,
		right = -6,
		top = 11
	}
	local f2_local37 = {
		rightAnchor = true,
		topAnchor = true,
		right = -5,
		top = 10
	}
	local f2_local38 = {
		rightAnchor = true,
		topAnchor = true,
		right = -6,
		top = 9
	}
	local f2_local39 = {
		rightAnchor = true,
		topAnchor = true,
		right = -4,
		top = 10
	}
	self:registerAnimationState( "shake1", f2_local34 )
	self:registerAnimationState( "shake2", f2_local35 )
	self:registerAnimationState( "shake3", f2_local36 )
	self:registerAnimationState( "shake4", f2_local37 )
	self:registerAnimationState( "shake5", f2_local38 )
	self:registerAnimationState( "shake6", f2_local39 )
	self:animateInLoop( {
		{
			"shake1",
			80,
			true,
			false
		},
		{
			"shake2",
			80,
			true,
			false
		},
		{
			"shake3",
			80,
			true,
			false
		},
		{
			"shake4",
			80,
			true,
			false
		},
		{
			"shake5",
			80,
			true,
			false
		},
		{
			"shake6",
			80,
			true,
			false
		}
	} )
	animateElements( self, self, self, self )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "finish" ), function ( element, event )
		animateElements( self, self, self, self )
	end )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_eyeball_layer_06" )
	local f2_local40, f2_local41 = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local40 / f2_local41
	f2_local6 = 45
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		bottomAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} ) )
	return self
end

LockTable( _M )
