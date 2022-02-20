local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Television = {}
LUI.Playercard.Television.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_tv_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		height = 18,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -22,
		right = -2,
		alpha = 0.5
	} )
	self:registerAnimationState( "show", {
		alpha = 0.5
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:setText( Engine.Localize( "@LUA_MENU_GAME_OVER" ) )
	self:animateInLoop( {
		{
			"show",
			600
		},
		{
			"hide",
			600
		}
	} )
	local f1_local3 = RegisterAndCacheMaterial( "em_bg_tv_layer_03" )
	local f1_local4, f1_local5 = GetMaterialDimensions( f1_local3 )
	local f1_local6 = f1_local4 / f1_local5
	local f1_local7 = 350
	local self = LUI.UIImage.new( {
		material = f1_local3,
		leftAnchor = true,
		topAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"show",
			1500
		},
		{
			"hide",
			7000
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_tv_layer_02" )
	local self, f1_local10 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local10
	f1_local7 = 350
	self = LUI.UIImage.new( {
		material = f1_local3,
		leftAnchor = true,
		topAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateInLoop( {
		{
			"show",
			1500
		},
		{
			"hide",
			7000
		}
	} )
	f1_local3 = RegisterAndCacheMaterial( "em_bg_tv_layer_04" )
	local self, f1_local12 = GetMaterialDimensions( f1_local3 )
	f1_local6 = self / f1_local12
	f1_local7 = 60
	self = LUI.UIImage.new( {
		material = f1_local3,
		leftAnchor = true,
		topAnchor = true,
		height = f1_local7,
		width = f1_local7 * f1_local6
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateToState( "hide" )
	self:animateInLoop( {
		{
			"show",
			1500
		},
		{
			"hide",
			7000
		}
	} )
	local f1_local13 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local13.material = RegisterAndCacheMaterial( "em_bg_tv_layer_05" )
	local self = LUI.UIImage.new( f1_local13 )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		height = 12,
		rightAnchor = true,
		topAnchor = true,
		top = 3,
		right = -4,
		color = {
			r = 0.22,
			g = 1,
			b = 0.07
		}
	} )
	self:setText( Engine.Localize( "@LUA_MENU_CHANNEL_THREE" ) )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateToState( "hide" )
	self:animateInLoop( {
		{
			"hide",
			1000
		},
		{
			"show"
		},
		{
			"hide",
			3000
		}
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

LockTable( _M )
