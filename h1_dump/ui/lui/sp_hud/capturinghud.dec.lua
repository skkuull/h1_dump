local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 1
f0_local1 = 64 * f0_local0
f0_local2 = 256 * f0_local0
local f0_local3 = 16 * f0_local0
local f0_local4 = 210 * f0_local0
local f0_local5 = 256 * f0_local0
local f0_local6 = 16 * f0_local0
local f0_local7 = 16 * f0_local0
local f0_local8 = false
local f0_local9 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0
	local f1_local1 = f1_arg0:getFirstDescendentById( "capturing_bar" )
	local f1_local2 = f1_arg0:getFirstDescendentById( "capturing_refresh_timer" )
	local f1_local3 = f1_arg0:getFirstDescendentById( "capturing_text" )
	local f1_local4 = f1_arg0:getFirstDescendentById( "capturing_bar_bg" )
	local f1_local5 = f1_arg0:getFirstDescendentById( "capturing_bar_hl" )
	local f1_local6 = f1_local5:getFirstDescendentById( "start_cap" )
	local f1_local7 = f1_local5:getFirstDescendentById( "middle" )
	local f1_local8 = f1_local5:getFirstDescendentById( "end_cap" )
	f0_local8 = false
	if Engine.GetDvarFloat( "ui_securing_progress" ) == 1 and not f0_local8 then
		f0_local8 = true
		f1_local3:setText( Engine.Localize( "@SCRIPT_INTELLIGENCE_UPLOADED" ) )
	end
	if f1_local4.current_state ~= "default" then
		f1_local4:animateToState( "default", 0 )
		f1_local4.current_state = "default"
	end
	if f0_local8 then
		if f1_local1.current_state ~= "secured" then
			local f1_local9 = MBh.AnimateSequence( {
				{
					"active",
					500
				},
				{
					"blink_off",
					50
				},
				{
					"blink_off",
					50
				},
				{
					"blink_on",
					0
				},
				{
					"blink_on",
					50
				},
				{
					"blink_off",
					50
				},
				{
					"blink_off",
					50
				},
				{
					"blink_on",
					0
				},
				{
					"blink_on",
					50
				},
				{
					"blink_off",
					150
				}
			} )
			f1_local9( f1_local1 )
			f1_local1.current_state = "secured"
		end
		if f1_local3.current_state ~= "secured" then
			local f1_local9 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"opening",
					50
				},
				{
					"secured",
					0
				}
			} )
			f1_local9( f1_local3 )
			f1_local3.current_state = "secured"
		end
		if f1_local6.current_state ~= "secured" then
			f1_local6:animateToState( "secured" )
			f1_local6.current_state = "secured"
		end
		if f1_local7.current_state ~= "secured" then
			f1_local7:animateToState( "secured" )
			f1_local7.current_state = "secured"
		end
		if f1_local8.current_state ~= "secured" then
			f1_local8:animateToState( "secured" )
			f1_local8.current_state = "secured"
		end
	else
		if f1_local1.current_state ~= "default" then
			f1_local1:animateToState( "default", 0 )
			f1_local1.current_state = "default"
		end
		if f1_local5.current_state ~= "default" then
			f1_local5:animateToState( "default", 0 )
			f1_local5.current_state = "default"
		end
		if f1_local3.current_state ~= "default" then
			f1_local3:animateToState( "default", 0 )
			f1_local3.current_state = "default"
		end
		if f1_local7.current_state ~= "default" then
			f1_local7:animateToState( "default", 0 )
			f1_local7.current_state = "default"
		end
	end
end

local f0_local10 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0
	local f2_local1 = f2_arg0:getFirstDescendentById( "capturing_refresh_timer" )
	local f2_local2 = f2_arg0:getFirstDescendentById( "capturing_text" )
	local f2_local3 = f2_arg0:getFirstDescendentById( "capturing_bar_bg" )
	local f2_local4 = f2_arg0:getFirstDescendentById( "capturing_bar_hl" )
	local f2_local5 = f2_local4:getFirstDescendentById( "start_cap" )
	local f2_local6 = f2_local4:getFirstDescendentById( "middle" )
	local f2_local7 = f2_local4:getFirstDescendentById( "end_cap" )
	local f2_local8 = Engine.GetDvarString( "ui_securing" )
	local f2_local9 = Engine.GetDvarFloat( "ui_securing_progress" )
	if f2_local8 == "" then
		LUI.UITimer.Stop( f2_local1 )
		if f2_local0.current_state ~= "default" then
			f2_local0:animateToState( "default", 0 )
			f2_local0.current_state = "default"
		end
		if f2_local4.current_state ~= "default" then
			f2_local4:animateToState( "default", 0 )
			f2_local4.current_state = "default"
		end
		if f2_local2.current_state ~= "default" then
			f2_local2:animateToState( "default", 0 )
			f2_local2.current_state = "default"
		end
		if f2_local6.current_state ~= "default" then
			f2_local6:animateToState( "default", 0 )
			f2_local6.current_state = "default"
		end
		return 
	elseif f2_local8 == "intel" then
		f2_local2:setText( Engine.Localize( "@SCRIPT_INTELLIGENCE_UPLOADING" ) .. " " .. math.floor( f2_local9 * 100 ) .. Engine.Localize( "@SCRIPT_INTELLIGENCE_PERCENT" ) )
	end
	if f2_local0.current_state ~= "active" then
		f2_local0:animateToState( "active", 50 )
		f2_local0.current_state = "active"
	end
	if f2_local3.current_state ~= "active" then
		f2_local3:animateToState( "active", 50 )
		f2_local3.current_state = "active"
	end
	if f2_local4.current_state ~= "active" then
		f2_local4:animateToState( "active", 50 )
		f2_local4.current_state = "active"
	end
	if f2_local5.current_state ~= "default" then
		f2_local5:animateToState( "default" )
		f2_local5.current_state = "default"
	end
	if f2_local6.current_state ~= "default" then
		f2_local6:animateToState( "default" )
		f2_local6.current_state = "default"
	end
	if f2_local7.current_state ~= "default" then
		f2_local7:animateToState( "default" )
		f2_local7.current_state = "default"
	end
	if f2_local2.current_state ~= "securing" then
		local f2_local10 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"opening",
				250
			},
			{
				"active",
				0
			}
		} )
		f2_local10( f2_local2 )
		f2_local2.current_state = "securing"
	end
	f2_local6:registerAnimationState( "move_bar", {
		right = f2_local6.m_maxWidth * f2_local9
	} )
	f2_local6:animateToState( "move_bar", 25 )
end

local f0_local11 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getFirstDescendentById( "capturing_refresh_timer" )
	if f3_arg1.value ~= "" then
		LUI.UITimer.Reset( f3_local0 )
	else
		LUI.UITimer.Stop( f3_local0 )
		f0_local9( f3_arg0, f3_arg1 )
	end
	f3_local0.value = f3_arg1.value
end

local f0_local12 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	if type( f4_arg1 ) == "table" then
		f4_local0 = LUI.MenuBuilder.buildItems( f4_arg1, f4_arg0.properties, f4_arg0 )
	else
		f4_local0 = f4_arg1
	end
	f4_arg0:addElement( f4_local0 )
	return f4_local0
end

local f0_local13 = function ( f5_arg0 )
	local f5_local0 = RegisterMaterial( "progress_bar_fill_mid" )
	local f5_local1 = RegisterMaterial( "progress_bar_fill_right_cap" )
	local self = LUI.UIElement.new()
	self.id = "capturing_bar"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -(f0_local1 / 2),
		left = -(f0_local2 / 2),
		height = f0_local1,
		width = f0_local2,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerAnimationState( "blink_on", {
		alpha = 1
	} )
	self:registerAnimationState( "blink_off", {
		alpha = 0
	} )
	self:registerEventHandler( "capture_refresh", f5_arg0 )
	local self = LUI.UITimer.new( 50, "capture_refresh", nil, false, false, false, true )
	self.id = "capturing_refresh_timer"
	self.value = ""
	local self = LUI.UIElement.new()
	self.id = "capturing_bar_bg"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIHorizontalList.new()
	self.id = "capturing_bar_hl"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -33,
		left = 27,
		height = f0_local3,
		width = f0_local4,
		alignment = LUI.Alignment.Left,
		spacing = 0,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local self = LUI.UIImage.new()
	self.id = "start_cap"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f0_local3,
		width = f0_local7,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		material = f5_local1,
		zRot = 180
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "secured", {
		red = Colors.cyan.r,
		green = Colors.cyan.g,
		blue = Colors.cyan.b
	} )
	local self = LUI.UIImage.new()
	self.id = "middle"
	self.m_maxWidth = f0_local4 - f0_local7 - f0_local7
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f0_local3,
		width = 0,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		material = f5_local0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "secured", {
		red = Colors.cyan.r,
		green = Colors.cyan.g,
		blue = Colors.cyan.b
	} )
	local self = LUI.UIImage.new()
	self.id = "end_cap"
	self:registerAnimationState( "default", {
		topAnchor = true,
		rightAnchor = true,
		top = 0,
		right = 0,
		height = f0_local3,
		width = f0_local7,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		material = f5_local1
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "secured", {
		red = Colors.cyan.r,
		green = Colors.cyan.g,
		blue = Colors.cyan.b
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIText.new()
	self.id = "capturing_text"
	self:setText( "" )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -8,
		left = -400,
		height = CoD.TextSettings.BodyFont18.Height,
		width = f0_local5,
		font = CoD.TextSettings.BodyFont18.Font,
		alignment = LUI.Alignment.Right,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	local f5_local10 = -30
	self:registerAnimationState( "opening", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -8,
		left = f5_local10,
		height = CoD.TextSettings.BodyFont18.Height,
		width = f0_local5,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		alpha = 1
	} )
	self:registerAnimationState( "active", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -8,
		left = f5_local10,
		height = CoD.TextSettings.BodyFont18.Height,
		width = f0_local5,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		alpha = 1
	} )
	self:registerAnimationState( "secured", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -8,
		left = f5_local10,
		height = CoD.TextSettings.BodyFont18.Height,
		width = f0_local5,
		red = Colors.cyan.r,
		green = Colors.cyan.g,
		blue = Colors.cyan.b,
		alpha = 1
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "captureHudDef", function ()
	local self = LUI.UIElement.new()
	self.id = "capture_hud"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -200,
		left = -(f0_local2 / 2),
		height = f0_local1,
		width = f0_local2
	} )
	self:animateToState( "default", 0 )
	self:registerDvarHandler( "ui_securing", f0_local11 )
	self:addElement( f0_local13( f0_local10 ) )
	return self
end )
LockTable( _M )
