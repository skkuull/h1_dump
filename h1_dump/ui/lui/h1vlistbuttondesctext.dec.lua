local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
LUI.H1VlistButtonDescTitle = {}
LUI.H1VlistButtonDescTitle.Font = CoD.TextSettings.BodyFont18
LUI.H1VlistButtonDescTitle.TopOffset = 4
LUI.H1VlistButtonDescTitle.FontHeight = 16
LUI.H1VlistButtonDescTitle.Width = 190
LUI.H1VlistButtonDescText = {}
LUI.H1VlistButtonDescText.Font = CoD.TextSettings.BodyFont18
LUI.H1VlistButtonDescText.Height = 66.67
LUI.H1VlistButtonDescText.TextPaddingX = 10
LUI.H1VlistButtonDescText.TextPaddingY = 16
LUI.H1VlistButtonDescText.DecoHorizontalOffset = 15
LUI.H1VlistButtonDescText.DecoVerticalOffset = 15
if Engine.IsConsoleGame() then
	LUI.H1VlistButtonDescText.FontHeight = 12
else
	LUI.H1VlistButtonDescText.FontHeight = 10
end
LUI.H1VlistButtonDescText.Color = Colors.generic_description_text_default_color
LUI.H1VlistButtonDescText.Alpha = 1
LUI.H1VlistButtonDescText.BoxVerticalOffset = -10
LUI.H1VlistButtonDescText.ListVerticalOffset = 0
LUI.H1VlistButtonDescText.new = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.width
	if not f1_local0 then
		f1_local0 = GenericMenuDims.SubmenuWidth
	end
	if not f1_arg1 then
		f1_arg1 = {}
	end
	local f1_local1 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f1_local1 = -10
	end
	local f1_local2 = f1_arg1.height
	if not f1_local2 then
		f1_local2 = LUI.H1VlistButtonDescText.Height
	end
	local f1_local3 = LUI.UIImage.new
	local f1_local4 = {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false
	}
	local self = f1_arg1.left
	if not self then
		self = 0
	end
	f1_local4.left = self
	f1_local4.width = f1_local0
	self = f1_arg1.top
	if not self then
		self = 0
	end
	f1_local4.top = self + f1_local1
	f1_local4.height = f1_local2
	f1_local4.material = RegisterMaterial( "h1_bg_option_infobox" )
	f1_local4.alpha = f1_arg1.fadeIn and 0 or 1
	f1_local3 = f1_local3( f1_local4 )
	f1_local3:setup3SliceRatio()
	if f1_arg0 then
		f1_local3.id = f1_arg0.id
	end
	if f1_arg1.fadeIn then
		f1_local3:registerAnimationState( "fadeIn", {
			alpha = 1
		} )
		f1_local3:animateInSequence( {
			{
				"default",
				GenericMenuAnimationSettings.ButtonWidgetFadeInStartFade
			},
			{
				"fadeIn",
				GenericMenuAnimationSettings.ButtonFadeInDuration
			}
		} )
	end
	f1_local4 = {
		font = LUI.H1VlistButtonDescText.Font.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = LUI.H1VlistButtonDescText.TextPaddingY,
		height = LUI.H1VlistButtonDescText.FontHeight,
		left = LUI.H1VlistButtonDescText.TextPaddingX,
		right = -LUI.H1VlistButtonDescText.TextPaddingX,
		color = LUI.H1VlistButtonDescText.Color,
		alpha = LUI.H1VlistButtonDescText.Alpha,
		alignment = LUI.Alignment.Center,
		lineSpacingRatio = 0.2
	}
	self = LUI.UIText.new( f1_local4 )
	self:animateToState( "default" )
	self:registerEventHandler( "set_button_info_text", function ( element, event )
		if event.text then
			local f2_local0, f2_local1 = GetTextDimensions( event.text, LUI.H1VlistButtonDescText.Font.Font, LUI.H1VlistButtonDescText.FontHeight, f1_local0 - 20 )
			local f2_local2 = 9
			f1_local4.top = f2_local2 + (f1_local2 - f2_local2 - f2_local1) / 2
			self:registerAnimationState( "default", f1_local4 )
			self:animateToState( "default" )
			element:setText( event.text )
		else
			element:setText( "" )
		end
	end )
	f1_local3:addElement( self )
	return f1_local3
end

LUI.H1VlistButtonDescText.build = function ( f3_arg0, f3_arg1, f3_arg2 )
	return LUI.H1VlistButtonDescText.new( f3_arg0, f3_arg1 )
end

LUI.MenuBuilder.registerType( "h1_vlist_button_desc_text", LUI.H1VlistButtonDescText.build )
LockTable( _M )
