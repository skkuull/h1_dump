local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Teabag = {}
function animateHandAndRipples( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg0:animateInSequence( f1_arg0.table, nil, nil, true )
	f1_arg1:animateInSequence( f1_arg1.table )
	f1_arg2:animateInSequence( f1_arg2.table )
	f1_arg3:animateInSequence( f1_arg3.table )
end

LUI.Playercard.Teabag.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_teabag_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_teabag_layer_02" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 45
	local f2_local7 = {
		rightAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		top = 6
	}
	local f2_local8 = {
		rightAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		top = 16
	}
	local self = LUI.UIElement.new( f2_local7 )
	self:registerAnimationState( "default", f2_local7 )
	self:registerAnimationState( "dip", f2_local8 )
	self:registerAnimationState( "endState", f2_local7 )
	self:addElement( LUI.UIImage.new( {
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} ) )
	self:addElement( self )
	self.table = {
		{
			"dip",
			400
		},
		{
			"default",
			400
		},
		{
			"dip",
			400
		},
		{
			"default",
			400
		},
		{
			"default",
			700
		},
		{
			"endState",
			1
		}
	}
	local f2_local10 = 42
	local f2_local11 = 40
	local f2_local12 = 40
	local f2_local13 = -10
	local f2_local14 = -10
	local f2_local15 = -10
	f2_local2 = RegisterAndCacheMaterial( "em_bg_teabag_layer_04" )
	local self, f2_local17 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local17
	f2_local6 = 25
	self = LUI.UIImage.new( {
		rightAnchor = true,
		right = f2_local13,
		topAnchor = true,
		top = f2_local10,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	f2_local17 = {
		alpha = 0,
		rightAnchor = true,
		right = f2_local13,
		topAnchor = true,
		top = f2_local10,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	local f2_local18 = {
		alpha = 1,
		rightAnchor = true,
		right = f2_local13,
		topAnchor = true,
		top = f2_local10,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	self:registerAnimationState( "hidden", f2_local17 )
	self:registerAnimationState( "shown", f2_local18 )
	self:animateToState( "hidden" )
	self.table = {
		{
			"hidden",
			300
		},
		{
			"shown",
			0
		},
		{
			"shown",
			200
		},
		{
			"hidden",
			300
		},
		{
			"shown",
			200
		},
		{
			"hidden",
			1301
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_teabag_layer_05" )
	local self, f2_local20 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local20
	f2_local6 = 25
	self = LUI.UIImage.new( {
		rightAnchor = true,
		right = f2_local14,
		topAnchor = true,
		top = f2_local11,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	f2_local20 = {
		rightAnchor = true,
		right = f2_local14,
		topAnchor = true,
		top = f2_local11,
		alpha = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	local f2_local21 = {
		rightAnchor = true,
		right = f2_local14,
		topAnchor = true,
		top = f2_local11,
		alpha = 1,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	self:registerAnimationState( "hidden", f2_local20 )
	self:registerAnimationState( "shown", f2_local21 )
	self:animateToState( "hidden" )
	self.table = {
		{
			"hidden",
			500
		},
		{
			"shown",
			0
		},
		{
			"shown",
			400
		},
		{
			"hidden",
			1401
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_teabag_layer_06" )
	local self, f2_local23 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local23
	f2_local6 = 25
	self = LUI.UIImage.new( {
		rightAnchor = true,
		right = f2_local15,
		topAnchor = true,
		top = f2_local12,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		material = f2_local2
	} )
	f2_local23 = {
		rightAnchor = true,
		right = f2_local15,
		topAnchor = true,
		top = f2_local12,
		alpha = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	local f2_local24 = {
		rightAnchor = true,
		right = f2_local15,
		topAnchor = true,
		top = f2_local12,
		alpha = 1,
		width = f2_local6 * f2_local5,
		height = f2_local6
	}
	self:registerAnimationState( "hidden", f2_local23 )
	self:registerAnimationState( "shown", f2_local24 )
	self:animateToState( "hidden" )
	self.table = {
		{
			"hidden",
			700
		},
		{
			"shown",
			0
		},
		{
			"shown",
			500
		},
		{
			"hidden",
			1101
		}
	}
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:registerEventHandler( LUI.FormatAnimStateFinishStepEvent( "endState" ), function ( element, event )
		animateHandAndRipples( self, self, self, self )
	end )
	animateHandAndRipples( self, self, self, self )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterAndCacheMaterial( "em_bg_teabag_layer_03" )
	} ) )
	return self
end

LockTable( _M )
