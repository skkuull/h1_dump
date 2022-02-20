local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
DebugPrint( "Registering " .. _NAME )
f0_local0 = false
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f1_arg0 )
	f1_local0.BrightnessOgAmount = Engine.GetProfileData( "blacklevel", Engine.GetControllerForLocalClient( 0 ) )
	f1_local0.ContinueMessageVisible = false
	f1_local0.BackMessageVisible = false
	if not f0_local0 then
		f1_local0.ContinueMessageVisible = true
		if f1_local0.is_in_options_menu then
			f1_arg0:dispatchEventToRoot( {
				name = "continue_message_visible"
			} )
			f1_local0.BackMessageVisible = true
			f1_arg0:dispatchEventToRoot( {
				name = "cancel_message_visible"
			} )
		else
			f1_arg0:dispatchEventToRoot( {
				name = "continue_message_visible_alone",
				dispatchChildren = true
			} )
		end
	end
	f1_local0.BrightnessMinAmount = MIN_BRIGHTNESS or -0.4
	f1_local0.BrightnessMaxAmount = MAX_BRIGHTNESS or 0.2
	f1_local0.BrightnessIncrement = STEP_BRIGHTNESS or -0.01
	f1_arg0:dispatchEventToChildren( {
		name = "brightness_over"
	} )
	if Engine.IsXB3() or Engine.IsPCApp() then
		local self = LUI.UIElement.new( CoD.CreateState( 0, GenericFooterDims.TopMargin_WithBackground, 400, 0, CoD.AnchorTypes.BottomLeft ) )
		f1_arg0:addElement( self )
		LUI.ButtonHelperText.AddSignInText( self )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
	local f2_local1 = Engine.GetProfileData( "blacklevel", Engine.GetControllerForLocalClient( 0 ) )
	local f2_local2 = f2_local1
	f2_local1 = math.min( f2_arg2, math.max( f2_arg1, f2_local1 + f2_arg3 ) )
	Engine.SetProfileData( "blacklevel", f2_local1, Engine.GetControllerForLocalClient( 0 ) )
	Engine.ExecNow( "updategamerprofile" )
	if f2_local1 <= f2_arg1 or f2_arg2 <= f2_local1 then
		Engine.PlaySound( CoD.SFX.DenySelect )
	elseif f2_local2 ~= f2_local1 then
		Engine.PlaySound( CoD.SFX.AdjustSlider )
	end
	local f2_local3 = f2_local0.is_in_options_menu
	if f2_local3 then
		if f2_local0.BackMessageVisible ~= false or f2_local1 == f2_local0.BrightnessOgAmount then
			f2_local3 = false
		else
			f2_local3 = true
		end
	end
	if f2_local0.ContinueMessageVisible == false and f2_local1 ~= f2_local0.BrightnessOgAmount then
		f2_local0.ContinueMessageVisible = true
		if not f2_local3 then
			f2_arg0:dispatchEventToRoot( {
				name = "continue_message_visible"
			} )
		else
			f2_arg0:dispatchEventToRoot( {
				name = "continue_message_visible_alone",
				dispatchChildren = true
			} )
		end
	end
	if f2_local3 then
		f2_arg0:dispatchEventToRoot( {
			name = "cancel_message_visible"
		} )
	end
	f2_arg0:dispatchEventToRoot( {
		name = "brightness_updated"
	} )
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f3_arg0 )
	f0_local2( f3_arg0, f3_local0.BrightnessMinAmount, f3_local0.BrightnessMaxAmount, -f3_local0.BrightnessIncrement )
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg0 )
	f0_local2( f4_arg0, f4_local0.BrightnessMinAmount, f4_local0.BrightnessMaxAmount, f4_local0.BrightnessIncrement )
end

local f0_local5 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Engine.GetProfileData( "blacklevel", Engine.GetControllerForLocalClient( 0 ) )
	local f5_local1 = nil
	if f5_arg0.id == BrightnessGuideConstants.not_visible.item_id then
		f5_local1 = BrightnessGuideConstants.not_visible.color_default
	elseif f5_arg0.id == BrightnessGuideConstants.barely_visible.item_id then
		f5_local1 = BrightnessGuideConstants.barely_visible.color_default
	elseif f5_arg0.id == BrightnessGuideConstants.easily_visible.item_id then
		f5_local1 = BrightnessGuideConstants.easily_visible.color_default
	end
	if f5_local1 ~= nil then
		local f5_local2 = (f5_local1 - f5_local0) / (1 - f5_local0)
		f5_arg0:registerAnimationState( "current", {
			red = f5_local2,
			green = f5_local2,
			blue = f5_local2
		} )
		f5_arg0:animateToState( "current", 0 )
	end
	if f5_local1 ~= nil then
		local f5_local2 = (f5_local1 - f5_local0) / (1 - f5_local0)
		local f5_local3 = {
			alpha = f5_local1 - f5_local0 + 0.4
		}
	end
end

local f0_local6 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f6_arg0 )
	Engine.SetProfileData( "blacklevel", f6_local0.BrightnessOgAmount, Engine.GetControllerForLocalClient( 0 ) )
	Engine.ExecNow( "updategamerprofile" )
	LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
end

local f0_local7 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f7_arg0 )
	if f7_local0.ContinueMessageVisible then
		if Engine.IsConsoleGame() then
			LUI.FlowManager.RequestAddMenu( f7_arg0, "boot_screen_margins", false, f7_arg1.controller, true, {
				linkTo = "boot_brightness",
				showSignIn = true,
				is_in_options_menu = false
			} )
		else
			LUI.FlowManager.RequestAddMenu( f7_arg0, "main_menu", false, f7_arg1.controller, true )
		end
		Engine.PlaySound( CoD.SFX.PauseMenuBack )
	end
end

function boot_brightness( menu, controller )
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
	self.id = "boot_brightness_id"
	self:registerEventHandler( "menu_create", f0_local1 )
	local f8_local1 = 1
	local f8_local2 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f8_local1 = 0.5
		f8_local2 = 30
	end
	local f8_local3, f8_local4 = nil
	if controller.is_in_options_menu == true then
		f8_local3 = MBh.LeaveMenu()
		f8_local4 = f0_local6
	else
		f8_local3 = f0_local7
	end
	local self = LUI.UIBindButton.new()
	self.id = "boot_brightness_bind_btn_id"
	self:registerEventHandler( "button_left", f0_local3 )
	self:registerEventHandler( "button_right", f0_local4 )
	self:registerEventHandler( "button_action", f8_local3 )
	if f8_local4 then
		self:registerEventHandler( "button_secondary", f8_local4 )
	end
	self.handlePrimary = true
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		material = RegisterMaterial( "white" ),
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	self.id = "boot_brightness_bg_id"
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 165 * f8_local1,
		height = CoD.TextSettings.BodyFont.Height,
		left = 0,
		right = 0,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center,
		red = Colors.primary_text_color.r,
		green = Colors.primary_text_color.g,
		blue = Colors.primary_text_color.b
	} )
	self.id = "boot_brightness_instruction_txt1_id"
	self:setText( Engine.Localize( "@MENU_ADJUST_BRIGHTNESS" ) )
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 215 * f8_local1,
		height = CoD.TextSettings.BodyFontSmall.Height,
		left = 0,
		right = 0,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center,
		red = Colors.primary_text_color.r,
		green = Colors.primary_text_color.g,
		blue = Colors.primary_text_color.b
	} )
	self.id = "boot_brightness_instruction_txt2_id"
	self:setText( Engine.Localize( "@MENU_BRIGHTNESS_DESC2" ) )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( 410, nil, -410, -65, CoD.AnchorTypes.All ) )
	self:addElement( self )
	local f8_local10 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	if f8_local4 then
		f8_local10:processEvent( {
			name = "add_button_helper_text",
			button_ref = "button_secondary",
			helper_text = Engine.Localize( "@MENU_CANCEL" ),
			side = "left",
			clickable = true,
			priority = -2000
		} )
	end
	f8_local10:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@MENU_APPLY" ),
		side = "right",
		clickable = true,
		priority = -1000
	} )
	if Engine.IsPC() then
		if f8_local4 then
			local f8_local11 = f8_local10:getFirstDescendentById( "button_secondary_id" )
			f8_local11:registerEventHandler( "leftmouseup", f8_local4 )
		end
		local f8_local11 = f8_local10:getFirstDescendentById( "button_action_id" )
		f8_local11:registerEventHandler( "leftmouseup", f8_local3 )
	end
	self:addElement( boot_brightness_guide( f8_local1, f8_local2 ) )
	return self
end

function boot_brightness_guide( f9_arg0, f9_arg1 )
	local f9_local0 = 250 * f9_arg0 + f9_arg1
	local f9_local1 = 360
	local f9_local2 = 96 * f9_arg0 + f9_arg1 * 0.5
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f9_local0,
		bottom = f9_local0 + f9_local2 * 3,
		left = -1 * f9_local1 * 0.5,
		right = f9_local1 * 0.5,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "brightness_guide_mini_id"
	local self = self
	local self = self.registerEventHandler
	local self = "brightness_over"
	local self = MBh.DoMultiple
	local self = {}
	local self = MBh.AnimateToState( "visible", 0 )
	local self = MBh.EmitEvent( {
		name = "brightness_over_children"
	} )
	self( self, self, self( self ) )
	self:registerEventHandler( "brightness_up", MBh.AnimateToState( "default", 0 ) )
	self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = f9_local2,
		left = 0,
		right = f9_local1,
		material = RegisterMaterial( "white" ),
		red = BrightnessGuideConstants.not_visible.color_default,
		green = BrightnessGuideConstants.not_visible.color_default,
		blue = BrightnessGuideConstants.not_visible.color_default
	} )
	self.id = BrightnessGuideConstants.not_visible.item_id
	self:registerEventHandler( "brightness_over_children", f0_local5 )
	self:registerEventHandler( "brightness_updated", f0_local5 )
	self:addElement( self )
	self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -9,
		bottom = 9,
		left = 0,
		right = f9_local1,
		font = CoD.TextSettings.BodyFont.Font,
		red = 0,
		green = 0,
		blue = 0,
		alignment = LUI.Alignment.Center
	} )
	self.id = "text_not_visible"
	self:setText( Engine.Localize( "@MENU_BRIGHTNESS_NOT_VISIBLE" ) )
	self:addElement( self )
	self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f9_local2,
		bottom = 2 * f9_local2,
		left = 0,
		right = f9_local1,
		material = RegisterMaterial( "white" ),
		red = BrightnessGuideConstants.barely_visible.color_default,
		green = BrightnessGuideConstants.barely_visible.color_default,
		blue = BrightnessGuideConstants.barely_visible.color_default
	} )
	self.id = BrightnessGuideConstants.barely_visible.item_id
	self:registerEventHandler( "brightness_over_children", f0_local5 )
	self:registerEventHandler( "brightness_updated", f0_local5 )
	self:addElement( self )
	self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -9,
		bottom = 9,
		left = 0,
		right = f9_local1,
		font = CoD.TextSettings.BodyFont.Font,
		red = 0,
		green = 0,
		blue = 0,
		alignment = LUI.Alignment.Center
	} )
	self.id = "text_barely_visible"
	self:setText( Engine.Localize( "@MENU_BRIGHTNESS_BARELY_VISIBLE" ) )
	self:addElement( self )
	self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 2 * f9_local2,
		bottom = 3 * f9_local2,
		left = 0,
		right = f9_local1,
		material = RegisterMaterial( "white" ),
		red = BrightnessGuideConstants.easily_visible.color_default,
		green = BrightnessGuideConstants.easily_visible.color_default,
		blue = BrightnessGuideConstants.easily_visible.color_default
	} )
	self.id = BrightnessGuideConstants.easily_visible.item_id
	self:registerEventHandler( "brightness_over_children", f0_local5 )
	self:registerEventHandler( "brightness_updated", f0_local5 )
	self:addElement( self )
	self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -9,
		bottom = 9,
		left = 0,
		right = f9_local1,
		font = CoD.TextSettings.BodyFont.Font,
		red = 0,
		green = 0,
		blue = 0,
		alignment = LUI.Alignment.Center
	} )
	self.id = "text_easily_visible"
	self:setText( Engine.Localize( "@MENU_BRIGHTNESS_EASILY_VISIBLE" ) )
	self:addElement( self )
	self = LUI.UIButton.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -32,
		bottom = 32,
		left = -52,
		right = -20
	} )
	self:registerAnimationState( "offset", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -32,
		bottom = 32,
		left = -55,
		right = -23
	} )
	self.id = "boot_brightness_left_arrow_btn_id"
	if Engine.IsPC() then
		self:setHandleMouseButton( true )
		self:registerEventHandler( "leftmousedown", f0_local3 )
	end
	self:registerEventHandler( "menu_create", MBh.AnimateLoop( {
		{
			"offset",
			500,
			true,
			true
		},
		{
			"default",
			500,
			true,
			true
		}
	} ) )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		material = RegisterMaterial( "h1_deco_arrows_left" )
	} ) )
	local self = LUI.UIButton.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -32,
		bottom = 32,
		left = 20,
		right = 52
	} )
	self:registerAnimationState( "offset", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -32,
		bottom = 32,
		left = 23,
		right = 55
	} )
	self.id = "boot_brightness_right_arrow_btn_id"
	if Engine.IsPC() then
		self:setHandleMouseButton( true )
		self:registerEventHandler( "leftmousedown", f0_local4 )
	end
	self:registerEventHandler( "menu_create", MBh.AnimateLoop( {
		{
			"offset",
			500,
			true,
			true
		},
		{
			"default",
			500,
			true,
			true
		}
	} ) )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		material = RegisterMaterial( "h1_deco_arrows_right" )
	} ) )
	return self
end

LUI.MenuBuilder.registerType( "boot_brightness", boot_brightness )
LockTable( _M )
