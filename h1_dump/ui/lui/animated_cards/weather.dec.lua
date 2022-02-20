local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Weather = {}
LUI.Playercard.Weather.new = function ()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_weather_layer_01" )
	local self = LUI.UIImage.new( f1_local1 )
	self:addElement( self )
	local f1_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local3.material = RegisterAndCacheMaterial( "em_bg_weather_layer_02" )
	self:addElement( LUI.UIImage.new( f1_local3 ) )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:addElement( self )
	self:registerAnimationState( "on", {
		alpha = 1
	} )
	self:registerAnimationState( "off", {
		alpha = 0
	} )
	self:registerAnimationState( "half", {
		alpha = 0.3
	} )
	self:animateInLoop( {
		{
			"off",
			1
		},
		{
			"off",
			1000
		},
		{
			"on",
			40
		},
		{
			"on",
			300
		},
		{
			"half",
			100
		},
		{
			"on",
			100
		},
		{
			"on",
			50
		},
		{
			"half",
			60
		},
		{
			"on",
			120
		},
		{
			"on",
			100
		},
		{
			"half",
			100
		},
		{
			"on",
			50
		},
		{
			"on",
			200
		},
		{
			"half",
			300
		},
		{
			"off",
			300
		},
		{
			"off",
			900
		},
		{
			"on",
			70
		},
		{
			"half",
			50
		},
		{
			"on",
			70
		},
		{
			"half",
			70
		},
		{
			"on",
			170
		},
		{
			"half",
			150
		},
		{
			"off",
			600
		},
		{
			"off",
			600
		}
	} )
	local f1_local5 = RegisterAndCacheMaterial( "em_bg_weather_layer_04" )
	local f1_local6, f1_local7 = GetMaterialDimensions( f1_local5 )
	local f1_local8 = f1_local6 / f1_local7
	local f1_local9 = 106.5
	self:addElement( LUI.UIImage.new( {
		bottom = 23.3,
		left = -91.75,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8
	} ) )
	f1_local5 = RegisterAndCacheMaterial( "em_bg_weather_layer_03" )
	local self, f1_local11 = GetMaterialDimensions( f1_local5 )
	f1_local8 = self / f1_local11
	f1_local9 = 13
	self = LUI.UIImage.new( {
		bottom = -35,
		left = 2.25,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "regular", {
		bottom = -35,
		left = 2.25,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 0
	} )
	self:registerAnimationState( "quarter", {
		bottom = -34.6,
		left = 2.25,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 90
	} )
	self:registerAnimationState( "half", {
		bottom = -34.6,
		left = 2.8,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 180
	} )
	self:registerAnimationState( "almost", {
		bottom = -35.2,
		left = 2.75,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 270
	} )
	self:registerAnimationState( "spun", {
		bottom = -35,
		left = 2.25,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 360
	} )
	self:animateInLoop( {
		{
			"spun",
			1
		},
		{
			"almost",
			225
		},
		{
			"half",
			225
		},
		{
			"quarter",
			225
		},
		{
			"regular",
			225
		}
	} )
	f1_local5 = RegisterAndCacheMaterial( "em_bg_weather_layer_05" )
	local f1_local12, self = GetMaterialDimensions( f1_local5 )
	f1_local8 = f1_local12 / self
	f1_local9 = 109
	self:addElement( LUI.UIImage.new( {
		bottom = 21,
		left = 36.5,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8
	} ) )
	f1_local5 = RegisterAndCacheMaterial( "em_bg_weather_layer_06" )
	local self, f1_local14 = GetMaterialDimensions( f1_local5 )
	f1_local8 = self / f1_local14
	f1_local9 = 53
	self = LUI.UIImage.new( {
		bottom = 3,
		left = -120,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8
	} )
	self:addElement( self )
	self:registerAnimationState( "right", {
		bottom = 3,
		left = 80,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8
	} )
	self:registerAnimationState( "left", {
		bottom = 3,
		left = -400,
		bottomAnchor = true,
		height = f1_local9,
		width = f1_local9 * f1_local8
	} )
	self:animateInLoop( {
		{
			"right",
			1
		},
		{
			"left",
			2700
		},
		{
			"right",
			1
		},
		{
			"right",
			2500
		}
	} )
	f1_local5 = RegisterAndCacheMaterial( "em_bg_weather_layer_07" )
	local self, f1_local16 = GetMaterialDimensions( f1_local5 )
	f1_local8 = self / f1_local16
	f1_local9 = 53
	self = LUI.UIImage.new( {
		bottom = 9,
		left = 62,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 0
	} )
	self:addElement( self )
	self:registerAnimationState( "center", {
		bottom = 9,
		left = 62,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 0
	} )
	self:registerAnimationState( "right", {
		bottom = 9,
		left = 61,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = 2
	} )
	self:registerAnimationState( "left", {
		bottom = 9,
		left = 63,
		bottomAnchor = true,
		material = f1_local5,
		height = f1_local9,
		width = f1_local9 * f1_local8,
		zRot = -2
	} )
	self:animateInLoop( {
		{
			"left",
			200
		},
		{
			"center",
			220
		},
		{
			"left",
			200
		},
		{
			"right",
			160
		},
		{
			"center",
			200
		},
		{
			"right",
			120
		},
		{
			"center",
			120
		},
		{
			"left",
			160
		},
		{
			"right",
			230
		},
		{
			"left",
			220
		},
		{
			"center",
			170
		},
		{
			"right",
			210
		},
		{
			"left",
			220
		},
		{
			"right",
			120
		},
		{
			"center",
			210
		},
		{
			"right",
			240
		}
	} )
	return self
end

LockTable( _M )
