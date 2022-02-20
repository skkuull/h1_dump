local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 0.5
function mantleHintDef()
	local self = LUI.UIElement.new()
	self.id = "mantleHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGMantleHint, f0_local0, CoD.TextStyle.Shadowed )
	local f1_local1 = {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -55,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alpha = 0.75
	}
	if Engine.UsingSplitscreenUpscaling() then
		f1_local1.bottom = -20
	end
	self:registerAnimationState( "default", f1_local1 )
	self:animateToState( "default", 0 )
	return self
end

function cursorHintDef()
	local self = LUI.UIElement.new()
	self.id = "cursorHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGCursorHint, f0_local0, CoD.TextStyle.Shadowed )
	local f2_local1 = {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -120,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontSmall.Font,
		alpha = 0.75
	}
	if Engine.UsingSplitscreenUpscaling() then
		f2_local1.bottom = -60
	end
	self:registerAnimationState( "default", f2_local1 )
	self:animateToState( "default", 0 )
	return self
end

function invalidCmdHintDef()
	local self = LUI.UIElement.new()
	self.id = "invalidCmdHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGInvalidCmdHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 162,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMediumLarge.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function spectatorControlsDef()
	local self = LUI.UIElement.new()
	self.id = "spectatorControlsId"
	local f4_local1 = CoD.TextStyle.Shadowed
	local f4_local2 = -60
	local f4_local3 = S1MenuDims.safe_area_horz
	local f4_local4 = false
	self:setupOwnerdraw( CoD.Ownerdraw.CGSpectatorControls, f0_local0, f4_local1 )
	local f4_local5 = {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -55,
		width = 400,
		height = 20,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		alpha = 1
	}
	if GameX.IsRankedMatch() and not Engine.UsingSplitscreenUpscaling() then
		f4_local5.bottom = f4_local5.bottom + -32
	end
	self:registerAnimationState( "default", f4_local5 )
	self:animateToState( "default", 0 )
	return self
end

function breathHintDef()
	local self = LUI.UIElement.new()
	self.id = "breathHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGHoldBreathHint, f0_local0, CoD.TextStyle.Shadowed )
	local f5_local1 = {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = -30,
		left = 0,
		right = 0,
		alignment = LUI.Alignment.Center,
		height = CoD.TextSettings.TitleFontMedium.Height,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alpha = 0.6
	}
	if Engine.UsingSplitscreenUpscaling() then
		f5_local1.bottom = -20
	end
	self:registerAnimationState( "default", f5_local1 )
	self:animateToState( "default", 0 )
	return self
end

function varGrenadeHintDef()
	local self = LUI.UIElement.new()
	self.id = "varGrenadeHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGVarGrenadeHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 300,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function zoomHintDef()
	local self = LUI.UIElement.new()
	self.id = "zoomHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGChangeZoomHint, f0_local0, CoD.TextStyle.Shadowed )
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
		font = CoD.TextSettings.TitleFontMedium.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function toggleHybridHintDef()
	local self = LUI.UIElement.new()
	self.id = "toggleHybridHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGToggleHybridHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 40,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function toggleThermalHintDef()
	local self = LUI.UIElement.new()
	self.id = "toggleThermalHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGToggleThermalHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 40,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function DoubleTapHintDef()
	local self = LUI.UIText.new()
	self:setupOwnerdraw( CoD.Ownerdraw.CGDoubleTapDetonateHint, f0_local0, CoD.TextStyle.Shadowed )
	self.id = "DoubleTapHintId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 300,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alpha = 0.6
	} )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:animateToState( "default", 0 )
	return self
end

function hintsHudDef()
	local self = LUI.UIElement.new()
	self.id = "hintsContainerHudId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:animateToState( "default", 0 )
	if not Engine.InFrontend() then
		self:addElement( cursorHintDef() )
		self:addElement( invalidCmdHintDef() )
		self:addElement( toggleThermalHintDef() )
	end
	self:addElement( mantleHintDef() )
	self:addElement( breathHintDef() )
	self:addElement( zoomHintDef() )
	self:addElement( toggleHybridHintDef() )
	self:addElement( varGrenadeHintDef() )
	self:addElement( DoubleTapHintDef() )
	return self
end

LUI.MenuBuilder.registerType( "hintsHudDef", hintsHudDef )
LockTable( _M )
