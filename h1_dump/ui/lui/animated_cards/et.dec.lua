local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.ET = {}
LUI.Playercard.ET.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_et_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:addElement( self )
	local f1_local3 = CoD.CreateState( 0, -18, 0, 20, CoD.AnchorTypes.All )
	f1_local3.material = RegisterAndCacheMaterial( "em_bg_et_layer_04" )
	self:addElement( LUI.UIImage.new( f1_local3 ) )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "half", {
		alpha = 0.2
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"on",
			41
		},
		{
			"on",
			35
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"on",
			41
		},
		{
			"on",
			33
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"on",
			35
		},
		{
			"off",
			47
		},
		{
			"off",
			603
		},
		{
			"on",
			41
		},
		{
			"on",
			35
		},
		{
			"half",
			17
		},
		{
			"half",
			9
		},
		{
			"on",
			47
		},
		{
			"off",
			47
		},
		{
			"off",
			713
		}
	} )
	local f1_local4 = RegisterAndCacheMaterial( "em_bg_et_layer_05" )
	local f1_local5, f1_local6 = GetMaterialDimensions( f1_local4 )
	local f1_local7 = f1_local5 / f1_local6
	local f1_local8 = 55
	local self = LUI.UIImage.new( {
		material = f1_local4,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -6.5,
		right = -41.5,
		height = f1_local8,
		width = f1_local8 * f1_local7
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "half", {
		alpha = 0.2
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			41
		},
		{
			"on",
			35
		},
		{
			"off",
			17
		},
		{
			"half",
			13
		},
		{
			"on",
			41
		},
		{
			"on",
			33
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"off",
			35
		},
		{
			"on",
			41
		},
		{
			"off",
			35
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"off",
			41
		},
		{
			"on",
			33
		},
		{
			"off",
			17
		},
		{
			"half",
			13
		},
		{
			"off",
			35
		},
		{
			"off",
			41
		},
		{
			"off",
			35
		},
		{
			"off",
			17
		},
		{
			"off",
			13
		},
		{
			"off",
			41
		},
		{
			"off",
			33
		},
		{
			"off",
			17
		},
		{
			"off",
			13
		},
		{
			"on",
			35
		},
		{
			"half",
			41
		},
		{
			"on",
			35
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"off",
			41
		},
		{
			"off",
			33
		},
		{
			"half",
			17
		},
		{
			"off",
			13
		},
		{
			"on",
			35
		},
		{
			"on",
			41
		},
		{
			"half",
			35
		},
		{
			"off",
			17
		},
		{
			"off",
			13
		},
		{
			"on",
			61
		},
		{
			"on",
			33
		},
		{
			"half",
			17
		},
		{
			"half",
			83
		},
		{
			"off",
			35
		},
		{
			"off",
			247
		},
		{
			"off",
			284
		}
	} )
	f1_local4 = RegisterAndCacheMaterial( "em_bg_et_layer_06" )
	local self, f1_local11 = GetMaterialDimensions( f1_local4 )
	f1_local7 = self / f1_local11
	f1_local8 = 55
	self = LUI.UIImage.new( {
		material = f1_local4,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -6.5,
		right = -41.5,
		height = f1_local8,
		width = f1_local8 * f1_local7
	} )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "half", {
		alpha = 0.2
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"off",
			41
		},
		{
			"on",
			33
		},
		{
			"off",
			17
		},
		{
			"off",
			13
		},
		{
			"off",
			35
		},
		{
			"on",
			41
		},
		{
			"on",
			35
		},
		{
			"half",
			17
		},
		{
			"off",
			13
		},
		{
			"half",
			41
		},
		{
			"on",
			33
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"off",
			35
		},
		{
			"off",
			41
		},
		{
			"off",
			35
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"on",
			41
		},
		{
			"off",
			33
		},
		{
			"off",
			17
		},
		{
			"on",
			13
		},
		{
			"off",
			35
		},
		{
			"on",
			41
		},
		{
			"off",
			35
		},
		{
			"off",
			17
		},
		{
			"half",
			13
		},
		{
			"half",
			41
		},
		{
			"off",
			33
		},
		{
			"half",
			17
		},
		{
			"off",
			13
		},
		{
			"off",
			35
		},
		{
			"on",
			41
		},
		{
			"on",
			35
		},
		{
			"off",
			17
		},
		{
			"off",
			13
		},
		{
			"on",
			41
		},
		{
			"off",
			33
		},
		{
			"half",
			17
		},
		{
			"half",
			13
		},
		{
			"on",
			55
		},
		{
			"off",
			41
		},
		{
			"on",
			35
		},
		{
			"half",
			87
		},
		{
			"off",
			13
		},
		{
			"off",
			247
		},
		{
			"off",
			284
		}
	} )
	f1_local4 = RegisterAndCacheMaterial( "em_bg_et_layer_02" )
	local f1_local11, f1_local12 = GetMaterialDimensions( f1_local4 )
	f1_local7 = f1_local11 / f1_local12
	f1_local8 = 107
	self:addElement( LUI.UIImage.new( {
		material = f1_local4,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 23,
		right = -7,
		height = f1_local8,
		width = f1_local8 * f1_local7
	} ) )
	f1_local4 = RegisterAndCacheMaterial( "em_bg_et_layer_03" )
	local f1_local12, self = GetMaterialDimensions( f1_local4 )
	f1_local7 = f1_local12 / self
	f1_local8 = 107
	self:addElement( LUI.UIImage.new( {
		material = f1_local4,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 23,
		right = -7,
		height = f1_local8,
		width = f1_local8 * f1_local7
	} ) )
	f1_local4 = RegisterAndCacheMaterial( "em_bg_et_layer_07" )
	local self, self = GetMaterialDimensions( f1_local4 )
	f1_local7 = self / self
	f1_local8 = 54
	self = LUI.UIImage.new( {
		material = f1_local4,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11,
		right = -31,
		height = f1_local8,
		width = f1_local8 * f1_local7,
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
			"off",
			1700
		},
		{
			"on",
			1
		},
		{
			"on",
			600
		}
	} )
	f1_local4 = RegisterAndCacheMaterial( "em_bg_et_layer_08" )
	local self, f1_local15 = GetMaterialDimensions( f1_local4 )
	f1_local7 = self / f1_local15
	f1_local8 = 54
	self = LUI.UIImage.new( {
		material = f1_local4,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11.5,
		right = -31.5,
		height = f1_local8,
		width = f1_local8 * f1_local7,
		alpha = 1
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
			"on",
			1
		},
		{
			"on",
			1700
		},
		{
			"off",
			1
		},
		{
			"off",
			600
		}
	} )
	return self
end

LockTable( _M )
