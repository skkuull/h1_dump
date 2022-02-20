local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.EULABase = InheritFrom( LUI.MenuTemplate )
LUI.EULABase.Font = Font23
LUI.EULABase.Width = 800
LUI.EULABase.Height = 480
LUI.EULABase.BGPaddingLR = 10
LUI.EULABase.BGPaddingTop = 10
LUI.EULABase.BGPaddingBottom = 60
LUI.EULABase.TextPadding = 12
LUI.EULABase.TextWidth = LUI.EULABase.Width - 2 * LUI.EULABase.BGPaddingLR - 2 * LUI.EULABase.TextPadding
LUI.EULABase.TextHeight = LUI.EULABase.Height - 2 * LUI.EULABase.TextPadding - LUI.EULABase.BGPaddingTop - LUI.EULABase.BGPaddingBottom
LUI.EULABase.ScrollRate = LUI.EULABase.Height / 3
LUI.EULABase.ScrollTime = 100
LUI.EULABase.TopBuffer = 4
if Engine.IsAsianLanguage() then
	LUI.EULABase.TextWidth = LUI.EULABase.TextWidth - LUI.EULABase.TextPadding
end
LUI.EULABase.CreateTextStrings = function ( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	for f1_local1 = 1, f1_arg1, 1 do
		f1_local0[f1_local1] = f1_arg0 .. f1_local1
	end
	return f1_local0
end

f0_local0 = function ( f2_arg0 )
	local f2_local0 = f2_arg0:getFirstChild()
	while f2_local0 ~= nil do
		if f2_local0.min + f2_arg0.targetY > LUI.EULABase.TextHeight or f2_local0.max + f2_arg0.targetY < 0 then
			f2_local0:animateToState( "hidden" )
		else
			f2_local0:animateToState( "visible" )
		end
		f2_local0 = f2_local0:getNextSibling()
	end
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	f3_arg0.minY = LUI.EULABase.TextHeight
	local f3_local0 = 0
	local f3_local1 = f3_arg0:getFirstChild()
	for f3_local2 = 1, #f3_arg1, 1 do
		local f3_local5, f3_local6, f3_local7 = GetTextDimensions2( Engine.LocalizeLong( f3_arg1[f3_local2] ), LUI.EULABase.Font.Font, LUI.EULABase.Font.Height, LUI.EULABase.TextWidth, true )
		local f3_local8 = (f3_local6 + LUI.EULABase.Font.Height) * 1.2
		local f3_local9 = CoD.CreateState( 0, f3_local0, LUI.EULABase.TextWidth, nil, CoD.AnchorTypes.TopLeft )
		f3_local9.height = LUI.EULABase.Font.Height
		f3_local9.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
		f3_local9.font = LUI.EULABase.Font.Font
		f3_local9.lineSpacingRatio = 0.2
		f3_local1:registerAnimationState( "default", f3_local9 )
		f3_local1.min = f3_local0
		f3_local1:animateToState( "default" )
		f3_arg0.minY = f3_arg0.minY - f3_local8
		f3_local0 = f3_local0 + f3_local8
		f3_local1.max = f3_local0
		f3_local1 = f3_local1:getNextSibling()
	end
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	for f4_local0 = 1, #f4_arg1, 1 do
		local f4_local3 = Engine.LocalizeLong( f4_arg1[f4_local0] )
		local self = LUI.UIText.new()
		self.id = "eula_text_line" .. f4_local0
		self:setText( f4_local3 )
		f4_arg0:addElement( self )
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self:registerAnimationState( "visible", {
			alpha = 1
		} )
	end
	f0_local1( f4_arg0, f4_arg1 )
end

local f0_local3 = function ( f5_arg0 )
	f5_arg0:registerAnimationState( "animate", CoD.CreateState( LUI.EULABase.TextPadding, f5_arg0.targetY, -LUI.EULABase.TextPadding, 0, CoD.AnchorTypes.All ) )
	f5_arg0:animateToState( "animate", LUI.EULABase.ScrollTime )
	f0_local0( f5_arg0 )
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	if f6_arg0.targetY < LUI.EULABase.TopBuffer then
		f6_arg0.targetY = f6_arg0.targetY + LUI.EULABase.ScrollRate
		if f6_arg0.targetY > LUI.EULABase.TopBuffer then
			f6_arg0.targetY = LUI.EULABase.TopBuffer
		end
		f0_local3( f6_arg0 )
		Engine.PlaySound( CoD.SFX.MouseOver )
	end
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	if f7_arg0.minY < f7_arg0.targetY then
		f7_arg0.targetY = f7_arg0.targetY - LUI.EULABase.ScrollRate
		if f7_arg0.targetY < f7_arg0.minY then
			f7_arg0.targetY = f7_arg0.minY
		end
		f0_local3( f7_arg0 )
		Engine.PlaySound( CoD.SFX.MouseOver )
	end
end

LUI.EULABase.new = function ( f8_arg0, f8_arg1 )
	if not f8_arg1 then
		f8_arg1 = {}
	end
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:addElement( LUI.MenuGenerics.generic_popup_screen_overlay() )
	local f8_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f8_local1.width = LUI.EULABase.Width
	f8_local1.height = LUI.EULABase.Height
	local self = LUI.UIElement.new( f8_local1 )
	self:addElement( self )
	local f8_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f8_local3.material = RegisterMaterial( "white" )
	f8_local3.color = Colors.h1.dark_grey
	self:addElement( LUI.UIImage.new( f8_local3 ) )
	local f8_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f8_local4.borderThickness = 2
	f8_local4.color = Colors.grey_5
	self:addElement( LUI.UIBorder.new( f8_local4 ) )
	self:addElement( LUI.Divider.new( CoD.CreateState( 0, -8, 0, nil, CoD.AnchorTypes.TopLeftRight ) ) )
	local f8_local5 = CoD.CreateState( LUI.EULABase.BGPaddingLR, LUI.EULABase.BGPaddingLR, -LUI.EULABase.BGPaddingTop, -LUI.EULABase.BGPaddingBottom, CoD.AnchorTypes.All )
	f8_local5.material = RegisterMaterial( "white" )
	f8_local5.color = Colors.grey_125
	local self = LUI.UIImage.new( f8_local5 )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( 0, LUI.EULABase.TextPadding, -LUI.EULABase.TopBuffer, -LUI.EULABase.TextPadding, CoD.AnchorTypes.All ) )
	self:setUseStencil( true )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( LUI.EULABase.TextPadding, LUI.EULABase.TopBuffer, -LUI.EULABase.TextPadding, 0, CoD.AnchorTypes.All ) )
	self.targetY = LUI.EULABase.TopBuffer
	self.minY = LUI.EULABase.TextHeight
	self:addElement( self )
	f0_local2( self, f8_arg1.textStrings )
	local f8_local9 = CoD.CreateState( nil, nil, nil, -14, CoD.AnchorTypes.Bottom )
	if 2 == Engine.GetCurrentLanguage() then
		f8_local9.left = -120
	end
	f8_local9.width = 200
	f8_local9.height = 32
	local self = LUI.UIElement.new( f8_local9 )
	self:addElement( self )
	local f8_local11 = function ( f9_arg0, f9_arg1 )
		if f8_arg1.acceptCallback then
			f8_arg1.acceptCallback( f9_arg1.controller )
		end
		Engine.PlaySound( CoD.SFX.MouseClick )
		LUI.FlowManager.RequestLeaveMenu( f9_arg0 )
		if f8_arg1.callback then
			f8_arg1.callback( f9_arg1.controller )
		end
	end
	
	local f8_local12 = function ( f10_arg0, f10_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
		if f8_arg1.declineCallback then
			f8_arg1.declineCallback( f10_arg1.controller )
		end
	end
	
	local f8_local13 = {
		style = GenericButtonSettings.Styles.FlatButton
	}
	local f8_local14 = Engine.Localize
	local f8_local15 = f8_arg1.acceptString
	if not f8_local15 then
		f8_local15 = "@LUA_MENU_ACCEPT"
	end
	f8_local13.button_text = f8_local14( f8_local15 )
	f8_local13.text_align_without_content = LUI.Alignment.Center
	f8_local13.button_action_func = function ( f11_arg0, f11_arg1 )
		f8_local11( f11_arg0, f11_arg1 )
	end
	
	f8_local14 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "UIGenericButton",
		id = "accept_button",
		properties = f8_local13
	} )
	f8_local15 = -48
	local f8_local16 = 40
	if Engine.GetCurrentLanguage() == 6 or 2 == Engine.GetCurrentLanguage() then
		f8_local16 = 55
	end
	local self = LUI.UIElement.new( CoD.CreateState( f8_local15, 0, f8_local16, 18, CoD.AnchorTypes.All ) )
	self:addElement( self )
	local f8_local18 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	local f8_local19 = {
		name = "add_button_helper_text",
		button_ref = "button_secondary"
	}
	local self = Engine.Localize
	local f8_local21 = f8_arg1.declineString
	if not f8_local21 then
		f8_local21 = "@LUA_MENU_DECLINE"
	end
	f8_local19.helper_text = self( f8_local21 )
	f8_local19.side = "left"
	f8_local19.clickable = true
	f8_local19.priority = -2000
	f8_local18:processEvent( f8_local19 )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		f8_local18:processEvent( LUI.ButtonHelperText.CommonEvents.addSelectButton )
		f8_local18:processEvent( {
			name = "add_button_helper_text",
			button_ref = "button_dpad_up",
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP" ),
			side = "right",
			clickable = true
		} )
		f8_local18:processEvent( {
			name = "add_button_helper_text",
			button_ref = "button_dpad_down",
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_DOWN" ),
			side = "right",
			clickable = true
		} )
	else
		f8_local18:processEvent( {
			name = "add_button_helper_text",
			button_ref = "button_page_up",
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_UP" ),
			side = "right",
			clickable = true,
			muteAction = true,
			func = function ( f12_arg0, f12_arg1 )
				f0_local4( self, f12_arg1 )
				return true
			end
		} )
		f8_local18:processEvent( {
			name = "add_button_helper_text",
			button_ref = "button_page_down",
			helper_text = Engine.Localize( "@LUA_MENU_PAGE_DOWN" ),
			side = "right",
			clickable = true,
			muteAction = true,
			func = function ( f13_arg0, f13_arg1 )
				f0_local5( self, f13_arg1 )
				return true
			end
		} )
	end
	self = LUI.UIBindButton.new()
	self:registerEventHandler( "button_up", function ( element, event )
		f0_local4( self, event )
		return true
	end )
	self:registerEventHandler( "button_down", function ( element, event )
		f0_local5( self, event )
		return true
	end )
	self:registerEventHandler( "button_secondary", function ( element, event )
		f8_local12( element, event )
	end )
	self:registerEventHandler( "button_action", function ( element, event )
		f8_local11( element, event )
	end )
	self.handlePrimary = true
	self:addElement( self )
	if Engine.IsXB3() or Engine.IsPCApp() then
		local self = LUI.UIElement.new( CoD.CreateState( 0, GenericFooterDims.TopMargin_WithBackground, 400, 0, CoD.AnchorTypes.BottomLeft ) )
		self:addElement( self )
		LUI.ButtonHelperText.AddSignInText( self )
	end
	f0_local0( self )
	function RefreshFunc( f18_arg0, f18_arg1 )
		f0_local1( self, f8_arg1.textStrings )
	end
	
	self:registerEventHandler( "onVideoChange", RefreshFunc )
	return self
end

