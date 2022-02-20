local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Grotesque = {}
LUI.Playercard.Grotesque.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_grotesque_layer_01" )
	self:addElement( LUI.UIImage.new( f1_local1 ) )
	local f1_local2 = RegisterAndCacheMaterial( "em_bg_grotesque_layer_02" )
	local f1_local3, f1_local4 = GetMaterialDimensions( f1_local2 )
	local f1_local5 = f1_local3 / f1_local4
	local f1_local6 = 59.5
	local self = LUI.UIImage.new( {
		material = f1_local2,
		right = 9.5,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		height = f1_local6,
		width = f1_local6 * f1_local5,
		alpha = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			1
		},
		{
			"on",
			650
		},
		{
			"off",
			650
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_grotesque_layer_03" )
	local self, f1_local9 = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / f1_local9
	f1_local6 = 60
	self = LUI.UIImage.new( {
		material = f1_local2,
		right = 0,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		height = f1_local6,
		width = f1_local6 * f1_local5
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			1
		},
		{
			"on",
			600
		},
		{
			"off",
			600
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_grotesque_layer_04" )
	local self, f1_local11 = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / f1_local11
	f1_local6 = 59
	self = LUI.UIImage.new( {
		material = f1_local2,
		right = 0,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		height = f1_local6,
		width = f1_local6 * f1_local5
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			1
		},
		{
			"on",
			500
		},
		{
			"off",
			500
		}
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_grotesque_layer_05" )
	local self, f1_local13 = GetMaterialDimensions( f1_local2 )
	f1_local5 = self / f1_local13
	f1_local6 = 23
	self = LUI.UIImage.new( {
		material = f1_local2,
		left = 19.25,
		top = -27.75,
		rightAnchor = false,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		height = f1_local6,
		width = f1_local6 * f1_local5
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			1
		},
		{
			"on",
			100
		},
		{
			"on",
			700
		},
		{
			"off",
			100
		},
		{
			"off",
			1600
		}
	} )
	return self
end

LockTable( _M )
