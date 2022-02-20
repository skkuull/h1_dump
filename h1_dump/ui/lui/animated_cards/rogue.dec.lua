local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Rogue = {}
LUI.Playercard.Rogue.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_rogue_layer_01" )
	local self = LUI.UIImage.new( f1_local1 )
	self:addElement( self )
	local f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_03" )
	local f1_local4, f1_local5 = GetMaterialDimensions( f1_local3 )
	local f1_local6 = f1_local4 / f1_local5
	local f1_local7 = 32
	local self = LUI.UIImage.new( {
		bottom = 8,
		bottomAnchor = true,
		material = f1_local3,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "right", {
		bottom = 8,
		left = 10,
		bottomAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:registerAnimationState( "left", {
		bottom = 8,
		left = -120,
		bottomAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:animateInLoop( {
		{
			"left",
			1
		},
		{
			"right",
			6000
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_02" )
	local self, f1_local10 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local10
	f1_local7 = 47
	self = LUI.UIImage.new( {
		bottom = 8,
		left = -25,
		bottomAnchor = true,
		material = f1_local3,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "right", {
		bottom = 8,
		left = 10,
		bottomAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:registerAnimationState( "left", {
		bottom = 8,
		left = -150,
		bottomAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:animateInLoop( {
		{
			"right",
			1
		},
		{
			"left",
			6000
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_04" )
	local f1_local11, self = GetMaterialDimensions( f1_local3 )
	f1_local6 = f1_local11 / self
	f1_local7 = 110
	self:addElement( LUI.UIImage.new( {
		material = f1_local3,
		left = -73,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} ) )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_05" )
	local self, f1_local13 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local13
	f1_local7 = 7
	self = LUI.UIImage.new( {
		material = f1_local3,
		left = -5.3,
		top = -6.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "jingle1", {
		left = -5,
		top = -6.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 5
	} )
	self:registerAnimationState( "jingle2", {
		left = -5.6,
		top = -6.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = -5
	} )
	self:animateInLoop( {
		{
			"jingle1",
			600
		},
		{
			"jingle2",
			600
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_06" )
	local self, f1_local15 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local15
	f1_local7 = 12
	self = LUI.UIImage.new( {
		material = f1_local3,
		left = -12.6,
		top = -8,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "jingle1", {
		left = -12.3,
		top = -8,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 5
	} )
	self:registerAnimationState( "jingle2", {
		left = -12.9,
		top = -8,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = -5
	} )
	self:animateInLoop( {
		{
			"jingle2",
			600
		},
		{
			"jingle1",
			600
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_07" )
	local self, f1_local17 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local17
	f1_local7 = 11
	self = LUI.UIImage.new( {
		material = f1_local3,
		left = -33.5,
		top = -6.5,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "jingle1", {
		left = -33.2,
		top = -6.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 5
	} )
	self:registerAnimationState( "jingle2", {
		left = -33.8,
		top = -6.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = -5
	} )
	self:animateInLoop( {
		{
			"jingle1",
			600
		},
		{
			"jingle2",
			600
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_08" )
	local self, f1_local19 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local19
	f1_local7 = 11
	self = LUI.UIImage.new( {
		material = f1_local3,
		left = -44,
		top = -7,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:addElement( self )
	self:registerAnimationState( "jingle1", {
		left = -43.7,
		top = -7,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 5
	} )
	self:registerAnimationState( "jingle2", {
		left = -44.3,
		top = -7,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = -5
	} )
	self:animateInLoop( {
		{
			"jingle2",
			600
		},
		{
			"jingle1",
			600
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_09" )
	local f1_local20, self = GetMaterialDimensions( f1_local3 )
	f1_local6 = f1_local20 / self
	f1_local7 = 109
	self:addElement( LUI.UIImage.new( {
		material = f1_local3,
		left = -107,
		top = -55,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} ) )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_10" )
	local self, f1_local22 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local22
	f1_local7 = 50
	self = LUI.UIImage.new( {
		material = f1_local3,
		left = 21,
		top = -34,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "armLeft1", {
		left = 10.5,
		top = -34.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 21
	} )
	self:registerAnimationState( "armLeft2", {
		left = 9,
		top = -33.5,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 27
	} )
	self:registerAnimationState( "armRight", {
		left = 21,
		top = -34,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 0
	} )
	self:animateInLoop( {
		{
			"armRight",
			1
		},
		{
			"armLeft1",
			1000
		},
		{
			"armLeft2",
			2000
		},
		{
			"armLeft2",
			800
		},
		{
			"armRight",
			600
		},
		{
			"armRight",
			1500
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_rogue_layer_11" )
	local self, f1_local24 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local24
	f1_local7 = 97
	self = LUI.UIImage.new( {
		material = f1_local3,
		left = 58,
		top = -75,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "armLeft1", {
		left = 45.5,
		top = -73,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 17
	} )
	self:registerAnimationState( "armLeft2", {
		left = 43,
		top = -72,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 22
	} )
	self:registerAnimationState( "armRight", {
		left = 58,
		top = -75,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 0
	} )
	self:animateInLoop( {
		{
			"armRight",
			1
		},
		{
			"armLeft1",
			1000
		},
		{
			"armLeft2",
			2000
		},
		{
			"armLeft2",
			800
		},
		{
			"armRight",
			600
		},
		{
			"armRight",
			1500
		}
	} )
	return self
end

LockTable( _M )
