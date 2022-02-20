local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 0.65
if Engine.IsPS3() or Engine.IsXbox360() then
	f0_local0 = 1.25
end
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:getParent()
	if f1_arg1.newValue == 1 then
		f1_local0:animateToState( "hidden", 500 )
	elseif f1_arg1.newValue == 0 then
		f1_local0:animateToState( "default", 500 )
	end
end

function mantleHintDef()
	local self = LUI.UIElement.new()
	self.id = "mantleHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGMantleHint, f0_local0, CoD.TextStyle.ShadowedMore )
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -129.99,
		alignment = LUI.Alignment.Center,
		height = 32,
		font = CoD.TextSettings.SP_HudCarbon27.Font,
		alpha = 0.6
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "IsShowingSubtitles" )
	self.id = "subtitleWatchId"
	self:registerEventHandler( "int_watch_alert", f0_local1 )
	self:addElement( self )
	return self
end

function cursorHintDef()
	local self = LUI.UIElement.new()
	self.id = "cursorHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGCursorHint, f0_local0, CoD.TextStyle.ShadowedMore )
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -163.32,
		left = -42.66,
		right = 42.66,
		alignment = LUI.Alignment.Center,
		height = 85.32,
		font = CoD.TextSettings.SP_HudCarbon27.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	f4_arg0:registerAnimationState( "fade", {
		alpha = Game.GetInvalidCmdHintAlpha()
	} )
	f4_arg0:animateToState( "fade" )
end

function invalidCmdHintDef()
	local self = LUI.UIElement.new()
	self.id = "invalidCmdHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGInvalidCmdHint, f0_local0, CoD.TextStyle.ShadowedMore )
	local self = LUI.UIImage.new( {
		top = -60,
		width = 840,
		height = 37.5,
		material = RegisterMaterial( "h1_hud_tutorial_blur" ),
		alpha = 0.9
	} )
	self.id = "blurId"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		top = -60.5,
		width = 840,
		height = 1.5,
		material = RegisterMaterial( "h1_hud_tutorial_border" ),
		alpha = 0.05
	} )
	self.id = "borderTopId"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		top = -23.5,
		width = 840,
		height = 1.5,
		material = RegisterMaterial( "h1_hud_tutorial_border" ),
		alpha = 0.05
	} )
	self.id = "borderBottomId"
	self:addElement( self )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 138,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.SP_HudCarbon27.Font,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self.timer = LUI.UITimer.new( 10, "timer_event", "hud", false )
	self:registerEventHandler( "timer_event", f0_local2 )
	self:addElement( self.timer )
	return self
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	f6_arg0:registerAnimationState( "fade", {
		alpha = Game.GetBreathHintAlpha()
	} )
	f6_arg0:animateToState( "fade" )
end

function breathHintDef()
	local self = LUI.UIElement.new()
	self.id = "breathHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGHoldBreathHint, f0_local0, CoD.TextStyle.ShadowedMore )
	local self = LUI.UIImage.new( {
		top = -60,
		width = 840,
		height = 37.5,
		material = RegisterMaterial( "h1_hud_tutorial_blur" ),
		alpha = 0.9
	} )
	self.id = "blurId"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		top = -60,
		width = 840,
		height = 1.5,
		material = RegisterMaterial( "h1_hud_tutorial_border" ),
		alpha = 0.05
	} )
	self.id = "borderTopId"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		top = -23.5,
		width = 840,
		height = 1.5,
		material = RegisterMaterial( "h1_hud_tutorial_border" ),
		alpha = 0.05
	} )
	self.id = "borderBottomId"
	self:addElement( self )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 125,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.SP_HudCarbon27.Font,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self.timer = LUI.UITimer.new( 10, "timer_event", "hud", false )
	self:registerEventHandler( "timer_event", f0_local3 )
	self:addElement( self.timer )
	return self
end

function zoomHintDef()
	local self = LUI.UIElement.new()
	self.id = "zoomHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGChangeZoomHint, f0_local0, CoD.TextStyle.ShadowedMore )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 70,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.BodyFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function toggleHybridHintDef()
	local f9_local0 = 50
	if Engine.IsCurrentGen() then
		f9_local0 = 80
	end
	local self = LUI.UIElement.new()
	self.id = "toggleHybridHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGToggleHybridHint, f0_local0, CoD.TextStyle.ShadowedMore )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f9_local0,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.BodyFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function toggleThermalHintDef()
	local self = LUI.UIElement.new()
	self.id = "toggleThermalHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGToggleThermalHint, f0_local0, CoD.TextStyle.ShadowedMore )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 50,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.BodyFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function deadQuoteDef()
	local self = LUI.UIElement.new()
	self.id = "deadQuoteId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGDeadQuote, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = 300,
		height = 64,
		left = 240,
		right = -240,
		alignment = LUI.Alignment.Left,
		font = CoD.TextSettings.BodyFont18.Font,
		alpha = 0.6
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerEventHandler( "toggle_pause", function ( element, event )
		element:animateToState( "hidden", 1 )
	end )
	self:registerEventHandler( "toggle_pause_off", function ( element, event )
		element:animateToState( "default", 1 )
	end )
	return self
end

function savingDef()
	local self = LUI.UIElement.new()
	self.id = "savingId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGSaving, f0_local0, CoD.TextStyle.ShadowedMore )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = 300,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.BodyFont.Font,
		alpha = 0.6,
		red = 1,
		green = 0,
		blue = 1
	} )
	self:animateToState( "default", 0 )
	return self
end

LockTable( _M )
