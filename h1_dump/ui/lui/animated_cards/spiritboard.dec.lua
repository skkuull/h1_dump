local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.SpiritBoard = {}
function animateElements( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6 )
	f1_arg4:animateInSequence( {
		{
			"start",
			0
		},
		{
			"loop1",
			1000
		},
		{
			"p",
			800
		},
		{
			"p",
			0
		},
		{
			"p",
			800
		},
		{
			"loop2",
			800
		},
		{
			"w",
			800
		},
		{
			"w",
			0
		},
		{
			"w",
			800
		},
		{
			"loop3",
			500
		},
		{
			"n",
			800
		},
		{
			"n",
			0
		},
		{
			"n",
			800
		},
		{
			"loop4",
			500
		},
		{
			"t",
			800
		},
		{
			"t",
			0
		},
		{
			"t",
			1800
		},
		{
			"hide",
			1000
		}
	} )
	f1_arg0:animateInSequence( {
		{
			"original",
			0
		},
		{
			"original",
			1700
		},
		{
			"end",
			500
		},
		{
			"end",
			0
		},
		{
			"end",
			8000
		},
		{
			"hide",
			1000
		}
	} )
	f1_arg1:animateInSequence( {
		{
			"original",
			0
		},
		{
			"original",
			4200
		},
		{
			"end",
			500
		},
		{
			"end",
			0
		},
		{
			"end",
			5500
		},
		{
			"hide",
			1000
		}
	} )
	f1_arg2:animateInSequence( {
		{
			"original",
			0
		},
		{
			"original",
			6400
		},
		{
			"end",
			500
		},
		{
			"end",
			0
		},
		{
			"end",
			3300
		},
		{
			"hide",
			1000
		}
	} )
	f1_arg3:animateInSequence( {
		{
			"original",
			0
		},
		{
			"original",
			8500
		},
		{
			"end",
			500
		},
		{
			"end",
			0
		},
		{
			"end",
			1200
		},
		{
			"hide",
			1000
		}
	} )
	f1_arg5:animateInSequence( {
		{
			"hidden",
			1400
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			1400
		},
		{
			"visible",
			1400
		},
		{
			"visible",
			0
		},
		{
			"visible",
			1400
		},
		{
			"hidden",
			1400
		},
		{
			"hidden",
			0
		},
		{
			"hidden",
			1400
		},
		{
			"visible",
			1400
		},
		{
			"visible",
			0
		},
		{
			"end",
			1400
		}
	} )
	f1_arg6:animateInSequence( {
		{
			"down",
			5600
		},
		{
			"up",
			5600
		}
	} )
end

LUI.Playercard.SpiritBoard.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIElement.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_01" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 220
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	local f2_local8 = {
		alpha = 0.6
	}
	local f2_local9 = {
		alpha = 0
	}
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_01a" ),
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 0.6
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_01b" ),
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 0.6
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_01c" ),
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 0.6
	} )
	self:registerAnimationState( "fade1", f2_local8 )
	self:registerAnimationState( "fade2", f2_local9 )
	self:registerAnimationState( "fade1", f2_local8 )
	self:registerAnimationState( "fade2", f2_local9 )
	self:registerAnimationState( "fade1", f2_local8 )
	self:registerAnimationState( "fade2", f2_local9 )
	self:animateInLoop( {
		{
			"fade2",
			1000
		},
		{
			"fade1",
			1000
		}
	} )
	self:animateInLoop( {
		{
			"fade2",
			1500
		},
		{
			"fade1",
			1500
		}
	} )
	self:animateInLoop( {
		{
			"fade2",
			2000
		},
		{
			"fade1",
			2000
		}
	} )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_02" )
	local self = LUI.UIImage.new( f2_local0 )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_03" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 58
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "up", {
		leftAnchor = true,
		topAnchor = true,
		top = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "down", {
		leftAnchor = true,
		topAnchor = true,
		top = 4,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:animateToState( "up" )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_04" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 30
	self = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		top = 19,
		left = 89,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hidden", {
		topAnchor = true,
		leftAnchor = true,
		top = 19,
		left = 89,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		topAnchor = true,
		leftAnchor = true,
		top = 19,
		left = 89,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 1
	} )
	self:registerAnimationState( "end", {
		topAnchor = true,
		leftAnchor = true,
		top = 19,
		left = 89,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 1
	} )
	self:animateToState( "hidden" )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_05" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "shake1", {
		left = -1,
		top = 5,
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "shake2", {
		left = 5,
		top = -1,
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "shake3", {
		left = 1,
		top = -5,
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "shake4", {
		left = -5,
		top = 1,
		leftAnchor = true,
		topAnchor = true,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:animateInLoop( {
		{
			"shake1",
			500
		},
		{
			"shake2",
			500
		},
		{
			"shake3",
			500
		},
		{
			"shake4",
			500
		}
	} )
	self:registerAnimationState( "start", {
		zRot = -20,
		left = 90,
		top = 90,
		width = f2_local6 * f2_local5,
		height = f2_local6,
		alpha = 1
	} )
	self:registerAnimationState( "loop1", {
		zRot = -15,
		left = -20,
		top = -40,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "p", {
		zRot = 0,
		left = -75,
		top = -30,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "loop2", {
		left = -45,
		top = -5,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "w", {
		zRot = -10,
		left = 0,
		top = -30,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "loop3", {
		zRot = -15,
		left = -20,
		top = -60,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "n", {
		zRot = 20,
		left = -97,
		top = -20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "loop4", {
		zRot = 20,
		left = -70,
		top = 0,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "t", {
		zRot = 0,
		left = -33,
		top = -33,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hide", {
		alpha = 0,
		zRot = 0,
		left = -33,
		top = -33,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	local f2_local18 = 18
	local f2_local19 = 80
	local f2_local20 = 25
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_06" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	f2_local6 = 40
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		alpha = 0
	} )
	self:registerAnimationState( "original", {
		zRot = 20,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = 63,
		top = 24,
		width = 0,
		height = 0
	} )
	self:registerAnimationState( "end", {
		zRot = 0,
		alpha = 1,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hide", {
		zRot = 0,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_08" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		alpha = 0
	} )
	self:registerAnimationState( "original", {
		zRot = -20,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = 155,
		top = 25,
		width = 0,
		height = 0
	} )
	self:registerAnimationState( "end", {
		zRot = 0,
		alpha = 1,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19 + f2_local18,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hide", {
		zRot = 0,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19 + f2_local18,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_07" )
	local self, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / self
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		alpha = 0
	} )
	self:registerAnimationState( "original", {
		zRot = 23,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = 20,
		top = 35,
		width = 0,
		height = 0
	} )
	self:registerAnimationState( "end", {
		zRot = 0,
		alpha = 1,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19 + f2_local18 * 2,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hide", {
		zRot = 0,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19 + f2_local18 * 2,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_spirit_board_layer_09" )
	local self, f2_local25 = GetMaterialDimensions( f2_local2 )
	f2_local5 = self / f2_local25
	self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		material = f2_local2,
		alpha = 0
	} )
	self:registerAnimationState( "original", {
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = 98,
		top = 15,
		width = 0,
		height = 0
	} )
	self:registerAnimationState( "end", {
		zRot = 0,
		alpha = 1,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19 + f2_local18 * 3,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:registerAnimationState( "hide", {
		zRot = 0,
		alpha = 0,
		leftAnchor = true,
		topAnchor = true,
		left = f2_local19 + f2_local18 * 3,
		top = f2_local20,
		width = f2_local6 * f2_local5,
		height = f2_local6
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	animateElements( self, self, self, self, self, self, self )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "end" ), function ( element, event )
		animateElements( self, self, self, self, self, self, self )
	end )
	return self
end

LockTable( _M )
