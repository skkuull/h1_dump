local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
defaultWidth = 300
c = 0.67
height = 50 * c
completionTimeAnticipation = 200
function progressBarBackground()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "progressBarBackground"
	local f1_local1 = 12
	local f1_local2 = -12
	local f1_local3 = 15
	local f1_local4 = -15
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = f1_local1,
		bottom = f1_local2,
		left = f1_local3,
		right = f1_local4,
		red = 0.32,
		green = 0.31,
		blue = 0.31,
		alpha = 1
	} ) )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = f1_local1,
		bottom = f1_local1 + 1,
		left = f1_local3,
		right = f1_local4,
		red = 0.26,
		green = 0.26,
		blue = 0.26,
		alpha = 1
	} ) )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = f1_local1,
		bottom = f1_local2,
		left = f1_local3,
		right = f1_local3 + 1,
		red = 0.26,
		green = 0.26,
		blue = 0.26,
		alpha = 1
	} ) )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		top = f1_local1,
		bottom = f1_local2,
		left = f1_local4 - 1,
		right = f1_local4,
		red = 0.26,
		green = 0.26,
		blue = 0.26,
		alpha = 1
	} ) )
	self:addElement( LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = f1_local2 - 1,
		bottom = f1_local2,
		left = f1_local3,
		right = f1_local4,
		red = 0.26,
		green = 0.26,
		blue = 0.26,
		alpha = 1
	} ) )
	return self
end

function progressBarFill( f2_arg0, f2_arg1 )
	local f2_local0 = 12
	local f2_local1 = -12
	local f2_local2 = 15
	local f2_local3 = 269
	if f2_arg1 then
		f2_local3 = f2_arg0 - (f2_local2 + 1) * 2
	end
	local self = LUI.UIElement.new( {
		alignment = LUI.HorizontalAlignment.Left,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	local self = LUI.UIImage.new( {
		alignment = LUI.HorizontalAlignment.Left,
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		left = f2_local2,
		right = f2_local2 + 1,
		top = f2_local0,
		bottom = f2_local1,
		red = 0.26,
		green = 0.65,
		blue = 0.33,
		alpha = 1
	} )
	self.id = "progressBarFill"
	local f2_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local6.alpha = 0.5
	f2_local6.material = RegisterMaterial( "gradient_slow_fadein" )
	self:addElement( LUI.UIImage.new( f2_local6 ) )
	self:addElement( self )
	local f2_local7 = 15
	local f2_local8 = 6
	local f2_local9 = -10
	local f2_local10 = -2
	local f2_local11 = CoD.CreateState( f2_local2 + f2_local9, f2_local0 + f2_local10, f2_local2 + f2_local9 + f2_local7, f2_local0 + f2_local8 + f2_local10, {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false
	} )
	f2_local11.material = RegisterMaterial( "h1_ui_loadscreen_progress_highlight" )
	local self = LUI.UIImage.new( f2_local11 )
	self:addElement( self )
	self.completeIn = function ( f3_arg0, f3_arg1, f3_arg2 )
		f3_arg2 = LUI.clamp( f3_arg2, 0, 1 )
		self:registerAnimationState( "default", {
			alignment = LUI.HorizontalAlignment.Left,
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			left = f2_local2,
			right = f2_local2 + 1 + f3_arg2 * f2_local3,
			top = f2_local0 + 1,
			bottom = f2_local1 - 0.5
		} )
		self:animateToState( "default" )
		self:registerAnimationState( "default", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = f2_local2 + f2_local9 + f3_arg2 * f2_local3,
			right = f2_local2 + f2_local9 + f2_local7 + f3_arg2 * f2_local3,
			top = f2_local0 + f2_local10,
			bottom = f2_local0 + f2_local8 + f2_local10
		} )
		self:animateToState( "default" )
	end
	
	self.animateFill = function ( f4_arg0, f4_arg1 )
		self:registerAnimationState( "filled", {
			alignment = LUI.HorizontalAlignment.Left,
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			left = f2_local2,
			right = f2_local2 + 1 + f2_local3,
			top = f2_local0 + 1,
			bottom = f2_local1 - 0.5
		} )
		self:registerAnimationState( "filled", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			left = f2_local2 + f2_local9 + f2_local3,
			right = f2_local2 + f2_local9 + f2_local7 + f2_local3,
			top = f2_local0 + f2_local10,
			bottom = f2_local0 + f2_local8 + f2_local10
		} )
		self:animateToState( "filled", f4_arg1 )
		self:animateToState( "filled", f4_arg1 )
	end
	
	return self
end

function progressBar( f5_arg0, f5_arg1 )
	if not f5_arg1 then
		f5_arg1 = {}
	end
	local f5_local0 = f5_arg1.width or defaultWidth
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "progressBar"
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		height = height,
		left = -f5_local0 / 2,
		width = f5_local0,
		alpha = 1
	} )
	self.id = "progressBarInner"
	self:addElement( self )
	self:addElement( progressBarBackground() )
	local f5_local3 = progressBarFill( f5_local0, f5_arg1.useWidthParameter )
	self:addElement( f5_local3 )
	self.completeIn = function ( f6_arg0, f6_arg1, f6_arg2 )
		f6_arg1 = f6_arg1 - completionTimeAnticipation
		self:animateToState( "default", 0 )
		f6_arg1 = math.max( 0, f6_arg1 )
		if not f6_arg2 then
			f6_arg2 = 0
		end
		f5_local3:completeIn( f6_arg1, f6_arg2 )
	end
	
	self.animateFill = function ( f7_arg0, f7_arg1 )
		f5_local3:animateFill( f7_arg1 )
	end
	
	return self
end

LUI.MenuBuilder.registerType( "progressBar", progressBar )
LockTable( _M )
