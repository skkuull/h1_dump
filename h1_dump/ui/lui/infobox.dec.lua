local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
LUI.InfoBox = InheritFrom( LUI.UIElement )
f0_local0 = 474
f0_local1 = 150
f0_local2 = -21
local f0_local3 = 620
local f0_local4 = 18
local f0_local5 = 13
local f0_local6 = 1050 * CoD.FullHDToHD
local f0_local7 = f0_local1
local f0_local8 = -9
local f0_local9 = -2
local f0_local10 = f0_local1 - 10
local f0_local11 = 17
local f0_local12 = 3
local f0_local13 = {
	leftAnchor = true,
	topAnchor = true,
	top = -5,
	height = 60,
	material = RegisterMaterial( "h1_popup_info_title_bg_mission_select" )
}
LUI.InfoBox.setTitle = function ( f1_arg0, f1_arg1 )
	f1_arg0.title:setText( f1_arg1 )
end

LUI.InfoBox.setDescription = function ( f2_arg0, f2_arg1 )
	f2_arg0.description:setText( f2_arg1 )
end

LUI.InfoBox.setBottomLeftText = function ( f3_arg0, f3_arg1 )
	f3_arg0.bottomLeftText:setText( f3_arg1 )
end

LUI.InfoBox.setBottomRightText = function ( f4_arg0, f4_arg1 )
	f4_arg0.bottomRightText:setText( f4_arg1 )
end

LUI.InfoBox.enableRightPanel = function ( f5_arg0 )
	f0_local13.width = f0_local3 - f0_local10
	f0_local13.left = -10
	f5_arg0.titleBackground:registerAnimationState( "default", f0_local13 )
	f5_arg0.titleBackground:animateToState( "default" )
	local self = LUI.UIElement.new( CoD.CreateState( -f0_local10 + f0_local11 + 2, f0_local12, f0_local11 + 2, f0_local10 + f0_local12, CoD.AnchorTypes.TopRight ) )
	self.id = "window_right_panel_id"
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	f5_arg0.rightPanel = self
	f5_arg0:addElement( self )
	local f5_local1 = CoD.CreateState( -f0_local10 + f0_local11, f0_local12 - 2, f0_local11 + 4, f0_local10 + f0_local12 + 1, CoD.AnchorTypes.TopRight )
	f5_local1.material = RegisterMaterial( "h1_popup_info_box_mission_select" )
	local self = LUI.UIImage.new( f5_local1 )
	self.id = "window_right_panel_overlay_id"
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	f5_arg0:addElement( self )
end

LUI.InfoBox.new = function ( f6_arg0, f6_arg1 )
	if not f6_arg1 then
		f6_arg1 = {}
	end
	local f6_local0 = CoD.CreateState( f0_local2 - f0_local3 - 50, f0_local0, f0_local2, f0_local0 + f0_local1, CoD.AnchorTypes.TopRight )
	f6_local0.alpha = 1
	local self = LUI.UIElement.new( f6_local0 )
	self.id = "infobox_window_id"
	self:setClass( LUI.InfoBox )
	if not f6_arg1.skipAnim then
		self:registerAnimationState( "dimmed", {
			alpha = 0.5
		} )
		self:registerAnimationState( "hide", {
			alpha = 0
		} )
		self:animateToState( "hide" )
		self:registerEventHandler( "menu_create", function ( element, event )
			self:animateInSequence( {
				{
					"default",
					66
				},
				{
					"dimmed",
					66
				},
				{
					"default",
					66
				},
				{
					"dimmed",
					66
				},
				{
					"default",
					66
				}
			} )
		end )
	end
	local f6_local2 = CoD.CreateState( f0_local8, f0_local9, f0_local6, f0_local7 + f0_local9, CoD.AnchorTypes.TopLeft )
	f6_local2.material = RegisterMaterial( "h1_popup_info_mission_select" )
	local self = LUI.UIImage.new( f6_local2 )
	self.id = "infobox_background_id"
	self:addElement( self )
	f0_local13.width = f0_local3
	f0_local13.left = -15
	local self = LUI.UIImage.new( f0_local13 )
	self.id = "infobox_title_background_id"
	self.titleBackground = self
	self:addElement( self )
	local f6_local5 = CoD.CreateState( 8, 11, nil, nil, CoD.AnchorTypes.TopLeft )
	f6_local5.height = f0_local4
	f6_local5.font = CoD.TextSettings.H1TitleFont.Font
	f6_local5.alignment = LUI.Alignment.Left
	f6_local5.width = f0_local6 - f0_local10 - f0_local11 + f0_local8
	local self = LUI.UIText.new( f6_local5 )
	self.id = "infobox_title_text"
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self.title = self
	self:addElement( self )
	local f6_local7 = CoD.CreateState( 8, 42, nil, nil, CoD.AnchorTypes.TopLeft )
	f6_local7.width = f0_local6 - f0_local10 - f0_local11 + f0_local8 - 4
	f6_local7.font = CoD.TextSettings.BodyFont18.Font
	f6_local7.height = f0_local5
	f6_local7.alignment = LUI.Alignment.Left
	f6_local7.color = Colors.grey_5
	f6_local7.lineSpacingRatio = 0.2
	local self = LUI.UIText.new( f6_local7 )
	self.id = "infobox_description_text"
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.description = self
	self:addElement( self )
	self.setDescription = function ( f8_arg0, f8_arg1 )
		local f8_local0, f8_local1, f8_local2 = GetTextDimensions( f8_arg1, CoD.TextSettings.BodyFont18.Font, f0_local5 )
		local f8_local3 = f6_local7.width * 3
		local f8_local4 = 1
		local f8_local5 = 0.2
		if f8_local3 < f8_local2 then
			f8_local4 = f8_local3 / f8_local2
			f8_local5 = 0.1
		end
		f8_arg0:setText( f8_arg1 )
		f8_arg0:registerAnimationState( "show", {
			alpha = 1,
			height = f0_local5 * f8_local4,
			top = 42,
			topAnchor = true,
			lineSpacingRatio = f8_local5
		} )
		f8_arg0:animateToState( "show" )
	end
	
	local f6_local9 = CoD.CreateState( 8, nil, -f0_local3 / 2, -12, CoD.AnchorTypes.BottomLeftRight )
	f6_local9.height = f0_local5
	local self = LUI.UIElement.new( f6_local9 )
	self.id = "bottom_left_elements"
	self:registerAnimationState( "show", {
		alpha = 0.5
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.bottomLeftElements = self
	self:addElement( self )
	local f6_local11 = CoD.CreateState( (f0_local3 - f0_local10) / 2, nil, -f0_local10, -12, CoD.AnchorTypes.BottomLeftRight )
	f6_local11.height = f0_local5
	local self = LUI.UIElement.new( f6_local11 )
	self.id = "bottom_right_elements"
	self:registerAnimationState( "show", {
		alpha = 0.5
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.bottomRightElements = self
	self:addElement( self )
	return self
end

LUI.InfoBox.build = function ( f9_arg0, f9_arg1, f9_arg2 )
	return LUI.InfoBox.new( f9_arg0, f9_arg1 )
end

LUI.MenuBuilder.registerType( "InfoBox", LUI.InfoBox.build )
LockTable( _M )
