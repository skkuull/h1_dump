local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Killer = {}
function updateFlashes( f1_arg0, f1_arg1 )
	f1_arg0.flash1:animateToState( "show", 15000 )
	f1_arg0.flash1:animateToState( "hide" )
	local self = LUI.UITimer.new( 200, "delay_complete", nil, true )
	self.id = "muzzle_delay_timer" .. f1_arg0.muzzleTimerIdx
	f1_arg0:registerEventHandler( "delay_complete", function ()
		f1_arg0.flash2:animateToState( "show", 15000 )
		f1_arg0.flash2:animateToState( "hide" )
		self:close()
	end )
	f1_arg0:addElement( self )
	f1_arg0.muzzleTimerIdx = f1_arg0.muzzleTimerIdx + 1
end

LUI.Playercard.Killer.new = function ()
	math.randomseed( os.time() )
	math.random()
	local f3_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local0.material = RegisterAndCacheMaterial( "em_bg_killer_layer_01" )
	local self = LUI.UIImage.new( f3_local0 )
	local f3_local2 = RegisterAndCacheMaterial( "em_bg_killer_layer_02" )
	local f3_local3, f3_local4 = GetMaterialDimensions( f3_local2 )
	local f3_local5 = f3_local3 / f3_local4
	local f3_local6 = 130
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		bottomAnchor = true,
		height = f3_local6,
		width = f3_local6 * f3_local5,
		material = f3_local2
	} )
	f3_local2 = RegisterAndCacheMaterial( "em_bg_killer_layer_03" )
	local f3_local8, self = GetMaterialDimensions( f3_local2 )
	f3_local5 = f3_local8 / self
	f3_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		bottomAnchor = true,
		height = f3_local6,
		width = f3_local6 * f3_local5,
		bottom = 8,
		alpha = 0.8,
		material = f3_local2
	} )
	f3_local2 = RegisterAndCacheMaterial( "em_bg_killer_layer_05" )
	local f3_local10, self = GetMaterialDimensions( f3_local2 )
	f3_local5 = f3_local10 / self
	f3_local6 = 60
	self = LUI.UIImage.new( {
		leftAnchor = true,
		bottomAnchor = true,
		height = f3_local6,
		width = f3_local6 * f3_local5,
		bottom = 8,
		material = f3_local2
	} )
	self:registerAnimationState( "full", {
		alpha = 1
	} )
	self:registerAnimationState( "dimmed", {
		alpha = 0.6
	} )
	local f3_local12 = {}
	local f3_local13 = {}
	local self = "dimmed"
	local f3_local15 = math.random( 500, 700 )
	f3_local12[1] = self
	f3_local13 = {}
	self = "full"
	f3_local15 = math.random( 500, 700 )
	f3_local12[2] = self
	self:animateInLoop( f3_local12 )
	f3_local2 = RegisterAndCacheMaterial( "em_bg_killer_layer_04" )
	f3_local13, self = GetMaterialDimensions( f3_local2 )
	f3_local5 = f3_local13 / self
	f3_local6 = 25
	self = LUI.UIImage.new( {
		rightAnchor = true,
		topAnchor = true,
		height = f3_local6,
		width = f3_local6 * f3_local5,
		right = -66,
		top = -7,
		material = f3_local2
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:animateToState( "hide" )
	self.hidden = true
	local self = LUI.UIImage.new( {
		rightAnchor = true,
		topAnchor = true,
		height = f3_local6,
		width = f3_local6 * f3_local5,
		right = 3,
		top = -7,
		material = f3_local2
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:animateToState( "hide" )
	self.hidden = true
	self.flash1 = self
	self.flash2 = self
	self.muzzleTimerIdx = 1
	local self = LUI.UITimer.new( 1000, "updateFlashes", nil, false )
	self.id = "muzzleFlashTimer"
	self:addElement( self )
	self:registerEventHandler( "updateFlashes", updateFlashes )
	self:processEvent( {
		name = "updateFlashes"
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

LockTable( _M )
