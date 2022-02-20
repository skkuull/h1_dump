local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = RegisterMaterial( "scorestreak_hud_timer_bar" )
	local f1_local1 = RegisterMaterial( "scorestreak_hud_timer_bracket" )
	local f1_local2 = 240 * RES_CONVERT
	local f1_local3 = 24 * RES_CONVERT
	local f1_local4 = 316 * RES_CONVERT
	local f1_local5 = 24 * RES_CONVERT
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		hideInKillcam = true
	} )
	self.id = "ScorestreakHUDHorizontalTimer"
	local self = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -0.5 * f1_local4,
		width = f1_local4,
		top = -0.5 * f1_local5,
		height = f1_local5
	} )
	self.id = "timerBarContainer"
	self:addElement( self )
	local self = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -0.5 * f1_local4,
		width = f1_local4,
		top = -0.5 * f1_local5,
		height = f1_local5
	} )
	self.id = "timerBarScale"
	self:registerAnimationState( "empty", {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0
	} )
	self:registerEventHandler( "scorestreak_timer_set_time", function ( element, event )
		element:animateToState( event.isCountingDown and "empty" or "default", event.duration or 0 )
	end )
	self:registerEventHandler( "scorestreak_timer_set_percent", function ( element, event )
		local f3_local0 = event.percent or 1
		if f3_local0 < 0 then
			f3_local0 = 0
		elseif f3_local0 > 1 then
			f3_local0 = 1
		end
		local f3_local1 = event.duration or 0
		element:registerAnimationState( "customFill", {
			leftAnchor = false,
			rightAnchor = false,
			left = -0.5 * f3_local0 * f1_local4,
			right = 0.5 * f3_local0 * f1_local4
		} )
		element:animateToState( "customFill", f3_local1 )
	end )
	self:addElement( self )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		material = f1_local0,
		color = Colors.s1Hud_red
	} )
	self.id = "timerBar"
	self:registerEventHandler( "scorestreak_timer_set_color", function ( element, event )
		if event.color then
			element:registerAnimationState( "new_color", {
				color = event.color
			} )
			element:animateToState( "new_color", 0 )
		end
	end )
	self:addElement( self )
	local f1_local10 = 0
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		right = -f1_local10,
		width = f1_local2,
		top = -0.5 * f1_local3,
		height = f1_local3,
		material = f1_local1
	} )
	self.id = "timerBracketLeft"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		left = f1_local10 + f1_local2,
		right = f1_local10,
		top = -0.5 * f1_local3,
		height = f1_local3,
		material = f1_local1
	} )
	self.id = "timerBracketRight"
	self:addElement( self )
	return self
end

function ScorestreakHUDVignette( f5_arg0, f5_arg1 )
	local f5_local0 = RegisterMaterial( "scorestreak_hud_vignette" )
	local f5_local1 = 960 * RES_CONVERT
	local f5_local2 = 540 * RES_CONVERT
	if Engine.UsingSplitscreenUpscaling() then
		f5_local1 = GameX.GetScreenWidth() / 2
		f5_local2 = GameX.GetScreenHeight() / 2 + 0.5
	end
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 1
	} )
	self.id = "ScorestreakHUDVignette_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = f5_local2,
		left = 0,
		right = f5_local1,
		material = f5_local0
	} )
	self.id = "ScorestreakHUDVignetteTopLeft_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = 0,
		bottom = f5_local2,
		left = 0,
		right = -f5_local1,
		material = f5_local0
	} )
	self.id = "ScorestreakHUDVignetteTopRight_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = -f5_local2,
		left = 0,
		right = f5_local1,
		material = f5_local0
	} )
	self.id = "ScorestreakHUDVignetteBottomLeft_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		top = 0,
		bottom = -f5_local2,
		left = 0,
		right = -f5_local1,
		material = f5_local0
	} )
	self.id = "ScorestreakHUDVignetteBottomRight_id"
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "ScorestreakHUDHorizontalTimer", f0_local0 )
LUI.MenuBuilder.registerType( "ScorestreakHUDVignette", ScorestreakHUDVignette )
LockTable( _M )
