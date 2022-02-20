LUI.UIText = InheritFrom( LUI.UIElement )
LUI.UIText.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIText.new()
end

LUI.UIText.postbuild = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg2 then
		if f2_arg2.textStyle then
			f2_arg0:setTextStyle( f2_arg2.textStyle )
		end
		if f2_arg2.glowColor then
			f2_arg0:setGlow( f2_arg2.glowColor, 0.25, 0.25 )
		end
		if f2_arg2.text then
			f2_arg0:setText( f2_arg2.text, f2_arg2 )
		end
	end
end

LUI.UIText.new = function ( f3_arg0 )
	local self = LUI.UIElement.new( f3_arg0 )
	self:setClass( LUI.UIText )
	self:setupUIText()
	return self
end

LUI.UIText.TransitionComplete_OutState = function ( f4_arg0, f4_arg1 )
	f4_arg0:setText( f4_arg0.replaceContentData.text )
	f4_arg0:registerEventHandler( "transition_complete_" .. f4_arg0.replaceContentData.outState, nil )
	f4_arg0:animateToState( f4_arg0.replaceContentData.inState, f4_arg0.replaceContentData.inDuration )
	f4_arg0.replaceContentData = nil
end

LUI.UIText.resizeGlow = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0:getChildById( "text_glow" )
	if f5_local0 ~= nil then
		local f5_local1 = f5_arg0:getCurrentHorizontalAlignment()
		local f5_local2 = f5_arg0:getCurrentVerticalAlignment()
		local f5_local3 = f5_arg0:getCurrentFont()
		local f5_local4, f5_local5, f5_local6, f5_local7 = f5_arg0:getLocalRect()
		local f5_local8, f5_local9, f5_local10, f5_local11 = GetTextDimensions( f5_arg1, f5_local3, f5_local7 - f5_local5 )
		local f5_local12 = {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			material = RegisterMaterial( "s1_9slice_glow" ),
			alpha = f5_local0.m_defaultAlpha
		}
		local f5_local13 = 32
		local f5_local14 = 32
		f5_local12.width = f5_local10 + 2 * f5_local13
		f5_local12.height = f5_local9 + 2 * f5_local14
		if f5_local1 == LUI.Alignment.None or f5_local1 == LUI.Alignment.Left then
			f5_local12.leftAnchor = true
			f5_local12.left = -f5_local13
		elseif f5_local1 == LUI.Alignment.Right then
			f5_local12.rightAnchor = true
			f5_local12.right = f5_local13
		end
		if f5_local2 == LUI.VerticalAlignment.None or f5_local2 == LUI.VerticalAlignment.Top then
			f5_local12.topAnchor = true
			f5_local12.top = -f5_local14
		elseif f5_local2 == LUI.VerticalAlignment.Bottom then
			f5_local12.bottomAnchor = true
			f5_local12.bottom = f5_local14
		end
		f5_local0:registerAnimationState( "default", f5_local12 )
		f5_local0:animateToState( "default", 0 )
	end
end

LUI.UIText.setText = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6 )
	local f6_local0 = assert
	local f6_local1
	if f6_arg3 then
		f6_local1 = f6_arg6
	else
		f6_local1 = true
	end
	f6_local0( f6_local1 )
	if f6_arg3 ~= nil and f6_arg4 ~= nil then
		f6_arg0.replaceContentData = {}
		f6_arg0.replaceContentData.outState = f6_arg3
		f6_arg0.replaceContentData.inState = f6_arg4
		f6_arg0.replaceContentData.outDuration = f6_arg5
		f6_arg0.replaceContentData.inDuration = f6_arg6
		f6_arg0.replaceContentData.text = f6_arg1
		f6_arg0:registerEventHandler( "transition_complete_" .. f6_arg3, LUI.UIText.TransitionComplete_OutState )
		f6_arg0:animateToState( f6_arg3, f6_arg5 )
		return 
	else
		f6_arg0:setTextInC( f6_arg1 )
		f6_arg0:resizeGlow( f6_arg1 )
	end
end

LUI.UIText.setTextStyle = function ( f7_arg0, f7_arg1 )
	f7_arg0.m_textStyle = f7_arg1
end

LUI.UIText.setTextLocalize = function ( f8_arg0, f8_arg1, f8_arg2 )
	f8_arg0:setText( Engine.Localize( f8_arg1, unpack( REG3 ) ) )
	if f8_arg2 == true then
		f8_arg0:registerEventHandler( "button_config_updated", function ( element, event )
			element:setText( Engine.Localize( f8_arg1, unpack( REG3 ) ) )
		end )
	else
		f8_arg0:registerEventHandler( "button_config_updated", nil )
	end
end

LUI.UIText.setForceLineBreaks = function ( f10_arg0, f10_arg1 )
	f10_arg0.m_forceLineBreaks = f10_arg1
end

LUI.UIText.setGlow = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	local self = f11_arg0:getChildById( "text_glow" )
	local f11_local1 = {
		color = f11_arg1,
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		topAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		material = RegisterMaterial( "s1_9slice_glow" ),
		alpha = f11_arg2
	}
	if self ~= nil then
		if f11_arg1 == nil then
			f11_arg0:removeElement( self )
		else
			self:registerAnimationState( "default", f11_local1 )
			self:animateToState( "default", 0 )
		end
	elseif f11_arg1 ~= nil then
		self = LUI.UIImage.new( f11_local1 )
		self.id = "text_glow"
		self:setup9SliceImage()
		self:registerAnimationState( "visible", {
			alpha = f11_arg3
		} )
		self:animateToState( "default", 0 )
		local f11_local2 = GenericButtonSettings.Common.visual_focus_animation_duration or 0
		self:registerEventHandler( "button_over", function ( element, event )
			element:animateToState( "visible" )
		end )
		self:registerEventHandler( "button_up", function ( element, event )
			element:animateToState( "default", f11_local2, true )
		end )
		self:registerEventHandler( "button_over_disable", function ( element, event )
			element:animateToState( "visible" )
		end )
		self:registerEventHandler( "button_disable", function ( element, event )
			element:animateToState( "default", f11_local2, true )
		end )
		self.m_defaultAlpha = f11_arg2
		f11_arg0:addElement( self )
	end
	f11_arg0:resizeGlow( f11_arg0:getText() )
	return self
end

LUI.UIText.id = "LUIText"
