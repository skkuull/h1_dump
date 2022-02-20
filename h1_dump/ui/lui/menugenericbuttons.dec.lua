local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
DebugPrint( "Registering " .. _NAME )
LUI.UIGenericButton = {}
ButtonLabelFont = CoD.TextSettings.TitleFontTiny
f0_local0 = CoD.TextSettings.TitleFontTiny
f0_local1 = CoD.TextSettings.TitleFontTiny
LUI.UIGenericButton.fontScale = 0.8
f0_local2 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 then
		if f1_arg1.itemProps and f1_arg1.itemProps[f1_arg0] ~= nil then
			return f1_arg1.itemProps[f1_arg0]
		elseif f1_arg1.substyle and f1_arg1.substyle[f1_arg0] ~= nil then
			return f1_arg1.substyle[f1_arg0]
		elseif f1_arg1.style and f1_arg1.style[f1_arg0] ~= nil then
			return f1_arg1.style[f1_arg0]
		elseif GenericButtonSettings.Common[f1_arg0] ~= nil then
			return GenericButtonSettings.Common[f1_arg0]
		end
	end
	DebugPrint( "WARNING: MenuGenericButtons tried to read a setting that does not exist (" .. f1_arg0 .. "). You should be worried." )
end

LUI.UIGenericButton.ButtonLabelFactory = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5 )
	local f2_local0 = f2_arg0.align
	if not f2_local0 then
		f2_local0 = LUI.Alignment.Right
	end
	local f2_local1 = f2_arg0.padding or 0
	local f2_local2 = f2_arg0.paddingFocus or 0
	local f2_local3 = f2_arg0.yOffset or 0
	local f2_local4 = f2_local0 == LUI.Alignment.Right
	local f2_local5 = f2_local0 == LUI.Alignment.Left
	local f2_local6 = 0
	local f2_local7 = f2_arg5 or ButtonLabelFont
	local f2_local8 = f2_local7.Height * LUI.UIGenericButton.fontScale
	local f2_local9 = nil
	if f2_arg1 then
		f2_local9 = Engine.ToUpperCase( f2_arg1 )
		if f2_arg4 then
			local f2_local10, self, f2_local12 = GetTextDimensions( f2_local9, f2_local7.Font, f2_local8 )
			if f2_arg4 < f2_local12 then
				local f2_local13 = f2_arg4 / f2_local12
				f2_local8 = f2_local8 * f2_local13
				f2_local3 = f2_local3 * f2_local13
			end
		end
	end
	local f2_local10 = f2_local8 / 2
	local self = LUI.UIText.new()
	self.id = "text_label"
	local f2_local13 = self
	local f2_local12 = self.registerAnimationState
	local f2_local14 = "default"
	local f2_local15 = CoD.ColorizeState
	local f2_local16 = f2_arg0.text_default_color
	local f2_local17 = {
		alignment = f2_local0,
		font = f2_local7.Font,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true
	}
	if f2_local5 then
		local f2_local18 = f2_local1
	end
	f2_local17.left = f2_local18 or 0
	local f2_local19
	if f2_local4 then
		f2_local19 = -f2_local1
		if not f2_local19 then
		
		else
			f2_local17.right = f2_local19
			f2_local17.top = f2_local3 - f2_local10
			f2_local17.bottom = f2_local3 + f2_local10
			f2_local17.glow = LUI.GlowState.None
			f2_local12( f2_local13, f2_local14, f2_local15( f2_local16, f2_local17 ) )
			self:animateToState( "default" )
			f2_local12 = nil
			f2_local14 = self
			f2_local13 = self.registerAnimationState
			f2_local15 = "focus"
			f2_local16 = CoD.ColorizeState
			f2_local17 = f2_arg0.text_focus_color
			f2_local19 = {
				alignment = f2_local0,
				font = f2_local7.Font,
				topAnchor = false,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = not f2_local5
			}
			if f2_local5 then
				local f2_local20 = f2_local2
			end
			f2_local19.left = f2_local20 or 0
			local f2_local21
			if f2_local4 then
				f2_local21 = -f2_local2
				if not f2_local21 then
				
				else
					f2_local19.right = f2_local21
					f2_local19.top = f2_local3 - f2_local10
					f2_local19.bottom = f2_local3 + f2_local10
					f2_local19.glow = f2_local12
					f2_local13( f2_local14, f2_local15, f2_local16( f2_local17, f2_local19 ) )
					self:registerAnimationState( "locked", CoD.ColorizeState( f2_arg0.text_lock_color, {
						glow = LUI.GlowState.None
					} ) )
					self:registerAnimationState( "pinned", CoD.ColorizeState( f2_arg0.pinned_color, {
						glow = LUI.GlowState.None
					} ) )
					f2_local13 = {
						alignment = f2_local0,
						font = f2_local7.Font,
						topAnchor = false,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true
					}
					if f2_local5 then
						local f2_local22 = f2_local1
					end
					f2_local13.left = f2_local22 or 0
					if f2_local4 then
						f2_local14 = -f2_local1
						if not f2_local14 then
						
						else
							f2_local13.right = f2_local14
							f2_local13.top = f2_local3 - f2_local10
							f2_local13.bottom = f2_local3 + f2_local10
							f2_local13.glow = LUI.GlowState.None
							self:registerAnimationState( "disabled", CoD.ColorizeState( f2_arg0.text_disabled_color, f2_local13 ) )
							self:registerAnimationState( "over_disabled", CoD.ColorizeState( f2_arg0.text_over_disabled_color, f2_local13 ) )
							self:registerAnimationState( "over_disabled_pulse", CoD.ColorizeState( f2_arg0.text_over_disabled_pulse_color, f2_local13 ) )
							self:registerEventHandler( "button_over", MBh.AnimateToState( "focus", f2_local6 ) )
							self:registerEventHandler( "button_up", MBh.AnimateToState( "default", f2_local6 ) )
							self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "over_disabled", f2_local6 ) )
							self:registerEventHandler( "button_disable", MBh.AnimateToState( "disabled", f2_local6 ) )
							self:registerEventHandler( "visual_focused_lowlighted", MBh.AnimateToState( "focus", f2_local6 ) )
							self:registerEventHandler( "visual_lowlighted", MBh.AnimateToState( "disabled", f2_local6 ) )
							self:registerEventHandler( "visual_unlighted", function ( element, event )
								if f2_arg2 and f2_arg2.disabled then
									element:animateToState( "disabled", f2_local6 )
								else
									element:animateToState( "default", f2_local6 )
								end
							end )
							if f2_arg0.additional_handlers then
								for f2_local17, f2_local19 in pairs( f2_arg0.additional_handlers ) do
									self:addEventHandler( f2_local17, f2_local19 )
								end
							end
							if f2_arg3 then
								self:setTextStyle( f2_arg3 )
							end
							if f2_local9 then
								self:setText( f2_local9 )
							end
							return self
						end
					end
					f2_local14 = 0
				end
			end
			f2_local21 = 0
		end
	end
	f2_local19 = 0
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0.width or 160
	local f4_local1 = f4_arg0.margin or 0
	local f4_local2 = f4_arg0.useText
	local f4_local3 = f4_arg0.yOffset or 0
	local f4_local4 = f4_arg0.useBackground
	local f4_local5 = f4_arg0.useBackgroundBypass
	local f4_local6 = f4_arg0.backgroundMarginTop or 0
	local f4_local7 = f4_arg0.backgroundMarginBottom or 0
	local f4_local8 = f4_arg0.useArrows
	local f4_local9 = f4_arg0.toggleClick
	local f4_local10 = f4_arg0.arrowsMargin
	local f4_local11 = f4_arg0.useSlider
	local f4_local12 = f4_arg0.sliderWidth
	local f4_local13 = f4_arg0.sliderHeight
	local f4_local14 = f4_arg0.useCap
	local f4_local15 = f4_arg0.useCap and f4_arg0.capWidth or 0
	local f4_local16 = f4_arg0.useInput
	local f4_local17 = f4_arg0.field_edited_func or nil
	local f4_local18 = f4_arg0.max_length or 20
	local f4_local19 = f4_arg0.password_field or false
	local f4_local20 = f4_arg0.text_alignment
	if not f4_local20 then
		f4_local20 = LUI.Alignment.Left
	end
	local f4_local21 = f4_arg0.keyboard_type
	if not f4_local21 then
		f4_local21 = CoD.KeyboardInputTypes.Normal
	end
	local f4_local22 = f4_arg0.field_name or "Placeholder Field Name"
	local f4_local23
	if f4_arg0.disable_highlight_glow == nil then
		f4_local23 = true
	else
		f4_local23 = not f4_arg0.disable_highlight_glow
	end
	local self = LUI.UIElement.new()
	self.id = "button_value"
	self.properties = f4_arg1 or {}
	local f4_local25 = {
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		width = f4_local0
	}
	if f4_arg0.align == LUI.Alignment.Left then
		f4_local25.rightAnchor = true
		f4_local25.right = -f4_local1
	else
		f4_local25.leftAnchor = true
		f4_local25.left = f4_local1
	end
	self:registerAnimationState( "default", f4_local25 )
	self:animateToState( "default" )
	if f4_local4 then
		local self = LUI.UIImage.new()
		self.id = "background"
		self:registerAnimationState( "default", {
			material = RegisterMaterial( "white" ),
			red = 0,
			green = 0,
			blue = 0,
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = f4_local6,
			bottom = -f4_local7,
			left = 0,
			right = -f4_local15,
			alpha = 0
		} )
		self:animateToState( "default" )
		self:registerAnimationState( "focus", {
			alpha = 1
		} )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
		self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "default" ) )
		self:addElement( self )
	end
	if f4_local14 then
		local self = LUI.UIImage.new()
		self.id = "cap"
		self:registerAnimationState( "default", {
			material = RegisterMaterial( "box_angle_rtcap" ),
			red = 0,
			green = 0,
			blue = 0,
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = true,
			top = f4_local6,
			bottom = -f4_local7,
			left = -f4_local15,
			right = 0,
			alpha = 0
		} )
		self:animateToState( "default" )
		self:registerAnimationState( "focus", {
			alpha = 1
		} )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
		self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "default" ) )
		self:addElement( self )
	end
	local self = function ( f5_arg0, f5_arg1, f5_arg2 )
		local f5_local0 = self:getParent()
		f5_local0 = f5_local0:getParent()
		f5_local0 = f5_local0:getParent()
		if f5_local0.genericListAction then
			f5_local0 = self:getParent()
			f5_local0 = f5_local0:getParent()
			f5_local0 = f5_local0:getParent()
			f5_local0:genericListAction( f5_arg1 )
		end
		f5_local0 = self.properties.button_display_func( f5_arg0 )
		if f5_arg2 then
			f5_arg2( self, f5_arg1 )
		end
		local f5_local1 = self.properties.button_display_func( f5_arg0 )
		if f4_local11 then
			if f5_local0 ~= f5_local1 then
				Engine.PlaySound( CoD.SFX.AdjustSlider )
			else
				Engine.PlaySound( CoD.SFX.DenySelect )
			end
		elseif f5_local0 ~= f5_local1 then
			Engine.PlaySound( CoD.SFX.OtherAdjust )
		else
			Engine.PlaySound( CoD.SFX.DenySelect )
		end
		self:processEvent( {
			name = "content_refresh"
		} )
	end
	
	local f4_local27 = function ( f6_arg0, f6_arg1 )
		self( f6_arg0, f6_arg1, self.properties.button_left_func )
		f6_arg0:processEvent( {
			name = "content_arrow_left"
		} )
	end
	
	local f4_local28 = function ( f7_arg0, f7_arg1 )
		self( f7_arg0, f7_arg1, self.properties.button_right_func )
		f7_arg0:processEvent( {
			name = "content_arrow_right"
		} )
	end
	
	if f4_local8 then
		local f4_local29 = function ( f8_arg0, f8_arg1 )
			local f8_local0 = 12
			if f8_arg1 then
				f8_local0 = -f8_local0 or f8_local0
			end
			local f8_local1 = 12
			local f8_local2 = 0.9
			local self = LUI.UIImage.new()
			self.id = "arrow_gfx"
			local self = self
			local f8_local5 = self.registerAnimationState
			local f8_local6 = "default"
			local f8_local7 = {
				material = RegisterMaterial( "h1_deco_option_scrollbar_arrows" ),
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 10
			}
			local self
			if f8_arg1 then
				self = 25
				if not self then
				
				else
					f8_local7.left = self
					f8_local7.width = f8_local0
					f8_local7.height = f8_local1
					f8_local7.red = 1
					f8_local7.green = 1
					f8_local7.blue = 1
					f8_local7.alpha = 0
					f8_local5( self, f8_local6, f8_local7 )
					self:animateToState( "default" )
					self:registerAnimationState( "unselected", {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 0.5,
						width = f8_local0,
						height = f8_local1
					} )
					self:registerAnimationState( "hover", {
						red = 1,
						green = 1,
						blue = 1,
						alpha = 1,
						width = f8_local0,
						height = f8_local1
					} )
					self:registerAnimationState( "pulse", {
						red = 0.27,
						green = 0.65,
						blue = 0.33,
						alpha = 1,
						width = f8_local0 * f8_local2,
						height = f8_local1 * f8_local2
					} )
					self = self
					f8_local5 = self.registerEventHandler
					f8_local6 = "content_arrow_"
					if f8_arg1 then
						f8_local7 = "left"
						if not f8_local7 then
						
						else
							f8_local5( self, f8_local6 .. f8_local7, function ( f9_arg0, f9_arg1 )
								if self.hasFocus then
									local f9_local0 = MBh.AnimateSequence( {
										{
											"pulse",
											100
										},
										{
											"hover",
											200
										}
									} )
									f9_local0( f9_arg0, f9_arg1 )
								else
									local f9_local0 = MBh.AnimateSequence( {
										{
											"pulse",
											100
										},
										{
											"unselected",
											200
										}
									} )
									f9_local0( f9_arg0, f9_arg1 )
								end
							end )
							f8_local5 = f4_local3
							self = LUI.UIButton.new()
							self.id = "arrow_" .. f8_arg0
							self.m_requireFocusType = FocusType.MouseOver
							f8_local7 = self
							f8_local6 = self.registerAnimationState
							self = "default"
							local f8_local9 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = f8_arg1,
								rightAnchor = not f8_arg1,
								top = 0,
								bottom = 0
							}
							local f8_local10 = f4_local10
							local f8_local11
							if f8_arg1 then
								f8_local11 = 1
								if not f8_local11 then
								
								else
									f8_local10 = f8_local10 * f8_local11
									f8_local11
									if f8_arg1 then
										f8_local11 = 0
										if not f8_local11 then
										
										else
											f8_local9.left = f8_local10 + 10 * f8_local11 - 11
											f8_local10 = f4_local10
											f8_local11
											if f8_arg1 then
												f8_local11 = 1
												if not f8_local11 then
												
												else
													f8_local10 = f8_local10 * f8_local11
													f8_local11
													if f8_arg1 then
														f8_local11 = 1
														if not f8_local11 then
														
														else
															f8_local9.right = f8_local10 + 10 * f8_local11 + 11
															f8_local6( f8_local7, self, f8_local9 )
															self.properties = self.properties or {}
															self.properties.muteAction = true
															self:animateToState( "default" )
															self:registerEventHandler( "hide_arrows", function ( element, event )
																if self.visible then
																	self:animateToState( "default" )
																	self.visible = nil
																	element.gainFocusSFX = nil
																end
															end )
															self:registerEventHandler( "show_arrows", function ( element, event )
																if not self.visible then
																	self.hasFocus = false
																	self:animateToState( "unselected" )
																	self.visible = true
																	element.gainFocusSFX = CoD.SFX.MouseOver
																end
															end )
															self:registerEventHandler( "button_over", function ( element, event )
																self.hasFocus = true
																self:animateToState( "hover" )
															end )
															self:registerEventHandler( "button_up", function ( element, event )
																self.hasFocus = false
																if self:getAnimationStateName() == "hover" then
																	self:animateToState( "unselected" )
																end
															end )
															self:processEvent( {
																name = "hide_arrows"
															} )
															self:addElement( self )
															if f8_arg1 then
																f8_local6 = "left"
																if not f8_local6 then
																
																else
																	if f8_arg1 then
																		f8_local7 = f4_local27
																		if not f8_local7 then
																		
																		else
																			self:registerEventHandler( "button_" .. f8_local6, f8_local7 )
																			if not Engine.IsConsoleGame() then
																				self:registerEventHandler( "button_action", f8_local7 )
																				self = LUI.UIButtonRepeater.new( "leftmouse", "button_action", self )
																				self:disable()
																				self:registerEventHandler( "button_up", self.disable )
																				self:registerEventHandler( "button_over", self.enable )
																				self:registerEventHandler( "button_over_disable", self.disable )
																				self:addElement( self )
																				self.shareFocus = true
																				if f4_local2 then
																					self:setMinDelay( 240 )
																				end
																			end
																			return self
																		end
																	end
																	f8_local7 = f4_local28
																end
															end
															f8_local6 = "right"
														end
													end
													f8_local11 = 0
												end
											end
											f8_local11 = -1
										end
									end
									f8_local11 = -1
								end
							end
							f8_local11 = -1
						end
					end
					f8_local7 = "right"
				end
			end
			self = 10
		end
		
		self:addElement( f4_local29( "left", true ) )
		self:addElement( f4_local29( "right", false ) )
		if f4_arg1.button_left_func then
			self.properties.button_left_func = f4_arg1.button_left_func
		end
		if f4_arg1.button_right_func then
			self.properties.button_right_func = f4_arg1.button_right_func
		end
		if f4_local9 and not Engine.IsConsoleGame() then
			local self = 30
			local self = 2
			local self = LUI.UIButton.new( {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = self,
				bottom = -self,
				left = self,
				right = -self
			} )
			self.m_requireFocusType = FocusType.MouseOver
			self:registerEventHandler( "button_action", f4_local28 )
			self.shareFocus = true
			self:addElement( self )
		end
	end
	if f4_local2 then
		local f4_local29 = f4_local3
		local self = f0_local0
		local self = LUI.UIText.new()
		self.id = "content_text_label"
		self:setText( "Placeholder" )
		local self = self
		local self = self.registerAnimationState
		local f4_local34 = "default"
		local f4_local35 = {}
		local f4_local36 = f4_arg0.labelAlign
		if not f4_local36 then
			f4_local36 = LUI.Alignment.Center
		end
		f4_local35.alignment = f4_local36
		f4_local35.font = self.Font
		f4_local35.topAnchor = false
		f4_local35.bottomAnchor = false
		f4_local35.leftAnchor = false
		f4_local35.rightAnchor = false
		f4_local35.left = -f4_local0 / 2
		f4_local35.right = f4_local0 / 2
		f4_local35.top = f4_local29 - self.Height * LUI.UIGenericButton.fontScale / 2
		f4_local35.bottom = f4_local29 + self.Height * LUI.UIGenericButton.fontScale / 2
		self( self, f4_local34, f4_local35 )
		if f4_local4 or f4_local5 then
			self = f4_arg0.content_focus_color
			if not self then
			
			else
				if f4_local23 then
					self = LUI.GlowState.Orange
					if not self then
					
					else
						self:animateToState( "default" )
						self:registerAnimationState( "unfocus", CoD.ColorizeState( f4_arg0.content_default_color, {
							glow = LUI.GlowState.None
						} ) )
						self:animateToState( "unfocus" )
						self:registerAnimationState( "focus", CoD.ColorizeState( self, {
							glow = self
						} ) )
						self:registerAnimationState( "locked", CoD.ColorizeState( f4_arg0.content_lock_color, {
							glow = LUI.GlowState.None
						} ) )
						self:registerAnimationState( "disabled", CoD.ColorizeState( f4_arg0.text_disabled_color, {
							glow = LUI.GlowState.None
						} ) )
						self:registerAnimationState( "over_disabled", CoD.ColorizeState( f4_arg0.text_over_disabled_pulse_color, {
							glow = LUI.GlowState.None
						} ) )
						self:registerEventHandler( "button_over", MBh.AnimateToState( "focus" ) )
						self:registerEventHandler( "button_up", MBh.AnimateToState( "unfocus" ) )
						self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "disabled" ) )
						self:registerEventHandler( "button_disable", MBh.AnimateToState( "disabled" ) )
						if not f4_local4 then
							self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "over_disabled" ) )
						end
						f4_local34 = function ( f14_arg0, f14_arg1 )
							if f14_arg0.properties and f14_arg0.properties.button_display_func then
								if not f14_arg1 then
									f14_arg1 = {}
								end
								local f14_local0 = f14_arg0.properties:button_display_func( f14_arg1 )
								if f14_local0 then
									f14_arg0:setText( f14_local0 )
									if f4_arg1.maxContentWidth then
										local f14_local1 = ButtonLabelFont.Height * LUI.UIGenericButton.fontScale
										local f14_local2, f14_local3, f14_local4 = GetTextDimensions( f14_local0, self.Font, self.Height * LUI.UIGenericButton.fontScale )
										if f14_arg0.properties.maxContentWidth < f14_local4 then
											local f14_local5 = self:getAnimationStateInC( "default" )
											local f14_local6 = f4_arg1.maxContentWidth / f14_local4
											f14_local5.top = f4_local29 - self.Height * LUI.UIGenericButton.fontScale / 2 * f14_local6
											f14_local5.bottom = f4_local29 + self.Height * LUI.UIGenericButton.fontScale / 2 * f14_local6
											self:registerAnimationState( "default", f14_local5 )
											self:animateToState( "default" )
											self.isScale = true
										elseif self.isScale then
											local f14_local5 = self:getAnimationStateInC( "default" )
											f14_local5.top = f4_local29 - self.Height * LUI.UIGenericButton.fontScale / 2
											f14_local5.bottom = f4_local29 + self.Height * LUI.UIGenericButton.fontScale / 2
											self:registerAnimationState( "default", f14_local5 )
											self:animateToState( "default" )
											self.isScale = false
										end
									end
								end
							end
						end
						
						self:registerEventHandler( "content_refresh", f4_local34 )
						self:registerEventHandler( "menu_create", f4_local34 )
						if f4_arg1.button_display_func then
							self.properties = f4_arg1 or {}
							self.properties.button_display_func = f4_arg1.button_display_func
							f4_local34( self, {
								exclusiveController = f4_arg1.exclusiveController
							} )
						end
						self:addElement( self )
					end
				end
				self = LUI.GlowState.None
			end
		end
		self = f4_arg0.content_focus_color_without_bg
	end
	if f4_local11 then
		local f4_local29 = f4_local3 - 2
		local self = LUI.UIElement.new()
		self.id = "slider"
		self:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			top = f4_local29 - f4_local13 / 2,
			bottom = f4_local29 + f4_local13 / 2,
			left = -f4_local12 / 2,
			right = f4_local12 / 2
		} )
		self:animateToState( "default" )
		local self = CoD.CreateState( -4, -4, 4, 4, CoD.AnchorTypes.All )
		self.material = RegisterMaterial( "h1_bg_option_slider_outline_glow" )
		self.alpha = 0
		local self = LUI.UIImage.new( self )
		self.id = "backgroundGlow"
		self:registerAnimationState( "buttonOver", {
			alpha = 1
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "buttonOver" ) )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
		self:addElement( self )
		local self = LUI.UIImage.new()
		self.id = "background"
		self:setHandleMouseButton( not Engine.IsConsoleGame() )
		self:registerAnimationState( "default", {
			material = RegisterMaterial( "h1_bg_option_slider_bg" ),
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			alpha = 0.3
		} )
		self:registerAnimationState( "buttonOver", {
			alpha = 0.8
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "buttonOver" ) )
		self:animateToState( "default" )
		self:addElement( self )
		local f4_local34 = 1
		local f4_local35 = f4_local12 - (1 + f4_local34) * 2
		local f4_local36 = CoD.CreateState( f4_local34 + 1, f4_local34 + 1, nil, -f4_local34 - 1, CoD.AnchorTypes.TopBottomLeft )
		f4_local36.width = 0
		local self = LUI.UIElement.new( f4_local36 )
		self.id = "fill"
		self:addElement( self )
		local f4_local38 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f4_local38.material = RegisterMaterial( "h1_bg_option_slider_bar" )
		f4_local38.color = Colors.h1.medium_grey
		local self = LUI.UIImage.new( f4_local38 )
		self.id = "fillImage"
		self:registerAnimationState( "button_over", CoD.ColorizeState( f4_arg0.content_focus_color ) )
		self:registerAnimationState( "button_up", {
			color = Colors.h1.medium_grey
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "button_over" ) )
		self:registerEventHandler( "button_up", function ( element, event )
			local f15_local0 = MBh.AnimateToState( "button_up" )
			f15_local0( element, event )
			self:animateToState( "default" )
		end )
		self:addElement( self )
		local f4_local40 = function ( f16_arg0, f16_arg1 )
			if f16_arg0.properties and f16_arg0.properties.button_display_func then
				local f16_local0 = f16_arg0.properties.button_display_func()
				if f16_local0 == nil then
					f16_local0 = 0
				end
				f4_local36.width = f4_local35 * f16_local0
				self:registerAnimationState( "default", f4_local36 )
				self:animateToState( "default", 0 )
			end
		end
		
		if not Engine.IsConsoleGame() then
			local f4_local41 = function ( f17_arg0, f17_arg1 )
				local f17_local0, f17_local1 = nil
				if f17_arg1.rootName ~= nil then
					f17_local0, f17_local1 = ProjectRootCoordinate( f17_arg1.rootName, f17_arg1.x, f17_arg1.y )
				elseif f17_arg1.name == "leftmousedown" then
					f17_local0 = f17_arg1.x
					f17_local1 = f17_arg1.y
				end
				if not f17_arg0.disabled and f17_arg0.m_leftMouseDown ~= nil and f17_local0 ~= nil and f17_local1 ~= nil then
					local f17_local2 = f4_local35
					local f17_local3, f17_local4, f17_local5, f17_local6 = f17_arg0:getRect()
					local f17_local7, f17_local8 = f17_arg1.root:pixelsToUnits( f17_local3, f17_local4 )
					f17_local4 = f17_local8
					f17_local7 = (f17_arg1.root:pixelsToUnits( f17_local0, f17_local1 ) - f17_local7 + 1 + f4_local34) / f17_local2
					f17_local8 = f4_arg1.button_display_func()
					local f17_local9
					if f17_local8 < f17_local7 then
						f17_local9 = self.properties.button_right_func
						if not f17_local9 then
						
						else
							local f17_local10 = f17_local8
							local f17_local11 = nil
							while (f17_local7 - f17_local8) * (f17_local7 - f17_local10) > 0 do
								f17_local9( self, f17_arg1 )
								f17_local11 = f17_local10
								f17_local10 = f4_arg1.button_display_func()
								if f17_local11 == f17_local10 then
									break
								end
							end
							if f17_local7 < f17_local8 and f17_local7 > 0 then
								self.properties:button_right_func( f17_arg1 )
							elseif f17_local10 ~= 1 then
								self.properties:button_left_func( f17_arg1 )
							end
							Engine.PlaySound( CoD.SFX.MenuAccept )
							self:processEvent( {
								name = "content_refresh"
							}, f17_arg1 )
						end
					end
					f17_local9 = self.properties.button_left_func
				end
			end
			
			if f4_arg1.button_display_func then
				self:registerEventHandler( "mousemove", f4_local41 )
				self:registerEventHandler( "leftmousedown", f4_local41 )
				self:registerEventHandler( "button_disable", function ( element, event )
					element.disabled = true
				end )
				self:registerEventHandler( "button_up", function ( element, event )
					self:animateToState( "default" )
					element.disabled = false
				end )
			end
		end
		self:registerEventHandler( "content_refresh", f4_local40 )
		self:registerEventHandler( "menu_create", f4_local40 )
		if f4_arg1.button_display_func then
			self.properties = f4_arg1 or {}
			self.properties.slider_width = f4_local12
			self.properties.button_display_func = f4_arg1.button_display_func
			f4_local40( self, {} )
		end
		self:addElement( self )
	end
	if f4_local16 then
		local self = LUI.MenuBuilder.buildItems( {
			type = "generic_input_field",
			properties = {
				textLeft = 0,
				textAlign = LUI.Alignment.Center,
				field_edited_func = f4_local17,
				max_length = f4_local18,
				password_field = f4_local19,
				verify_string = false,
				filter_profanity = false,
				help_value = "",
				field_name = f4_local22,
				keyboard_type = f4_local21,
				text_alignment = f4_local20
			}
		}, {} )
		self.id = "input"
		local self = self
		local self = self.registerAnimationState
		local self = "default"
		local f4_local34 = {}
		local f4_local35 = f4_arg0.labelAlign
		if not f4_local35 then
			f4_local35 = LUI.Alignment.Center
		end
		f4_local34.alignment = f4_local35
		f4_local34.font = f0_local1.Font
		f4_local34.topAnchor = false
		f4_local34.bottomAnchor = false
		f4_local34.leftAnchor = false
		f4_local34.rightAnchor = false
		f4_local34.left = -f4_local0 / 2
		f4_local34.right = f4_local0 / 2
		f4_local34.top = f4_local3 - f0_local1.Height / 2
		f4_local34.bottom = f4_local3 + f0_local1.Height / 2
		f4_local34.alpha = 1
		self( self, self, f4_local34 )
		self:animateToState( "default" )
		self:registerEventHandler( "button_over", function ( element, event )
			MBh.AnimateToState( "focus" )
			element:processEvent( {
				name = "colorize",
				red = f4_arg0.content_focus_color.r,
				green = f4_arg0.content_focus_color.g,
				blue = f4_arg0.content_focus_color.b
			} )
		end )
		self:registerEventHandler( "button_up", function ( element, event )
			MBh.AnimateToState( "default" )
			element:processEvent( {
				name = "colorize",
				red = f4_arg0.content_default_color.r,
				green = f4_arg0.content_default_color.g,
				blue = f4_arg0.content_default_color.b
			} )
			element:processEvent( {
				name = "edit_unfocus"
			} )
		end )
		self:addElement( self )
	end
	return self
end

local f0_local4 = function ( f22_arg0, f22_arg1 )
	local f22_local0 = f22_arg0.margin or 0
	local f22_local1 = f22_arg0.width or 50
	local f22_local2 = (f22_arg0.yOffset or 0) - 2
	local f22_local3 = -f22_local0 - f22_local1 / 2
	local f22_local4 = 10
	if Engine.IsRightToLeftLanguage() then
		f22_local3 = f22_local3 * -1
	end
	local self = LUI.UIImage.new()
	self.id = "checkbox"
	self.properties = {
		isVisible = true
	}
	local f22_local6 = "box_empty"
	local f22_local7 = "box_check"
	if f22_arg0.negativeColor then
		f22_local6 = "dest_alpha_zero"
		f22_local7 = CoD.Material.RestrictedIcon
	end
	local f22_local8 = {
		material = RegisterMaterial( f22_local6 ),
		topAnchor = false,
		bottomAnchor = false,
		top = f22_local2 - f22_local4,
		bottom = f22_local2 + f22_local4,
		left = f22_local3 - f22_local4,
		right = f22_local3 + f22_local4,
		alpha = 1
	}
	if Engine.IsRightToLeftLanguage() then
		f22_local8.leftAnchor = true
		f22_local8.rightAnchor = false
	else
		f22_local8.leftAnchor = false
		f22_local8.rightAnchor = true
	end
	self:registerAnimationState( "default", f22_local8 )
	self:animateToState( "default" )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "show_checkbox", function ( element, event )
		element.properties.isVisible = true
		if event.showBox ~= nil then
			element.properties.isVisible = event.showBox
		end
		element:animateToState( element.properties.isVisible and "default" or "hidden", 0 )
	end )
	local self = LUI.UIImage.new()
	self.id = "checkmark"
	self.properties = {
		isChecked = false
	}
	self:registerAnimationState( "default", {
		material = RegisterMaterial( f22_local7 ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	self:animateToState( "default" )
	self:registerAnimationState( "checked", {
		alpha = 1
	} )
	self:registerEventHandler( "toggle_checked", function ( element, event )
		event.name = "set_checked"
		event.checkBox = not element.properties.isChecked
		element:processEvent( event )
	end )
	self:registerEventHandler( "set_checked", function ( element, event )
		element.properties.isChecked = true
		if event.checkBox ~= nil then
			element.properties.isChecked = event.checkBox
		end
		element:animateToState( element.properties.isChecked and "checked" or "default", 0 )
	end )
	self:addElement( self )
	return self
end

function CommonButtonBackgroundFactory( f26_arg0 )
	return LUI.H1ButtonBackground.new( f26_arg0.rarity )
end

function addButtonBorder( f27_arg0 )
	local self = LUI.UIBackgroundPanel.new( nil, {
		borderAlpha = 0
	} )
	self.id = "border"
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	return self
end

LUI.UIGenericButton.new = function ( f28_arg0, f28_arg1, f28_arg2 )
	if not f28_arg1 then
		f28_arg1 = {}
	end
	local f28_local0 = f28_arg1.childNum
	if not f28_arg2 then
		f28_arg2 = f28_local0 or 0
	end
	local f28_local1 = nil
	local f28_local2 = f28_arg1.style
	if not f28_local2 then
		f28_local2 = GenericButtonSettings.Styles.GradientButton
	end
	local f28_local3 = f28_arg1.variant
	if not f28_local3 then
		f28_local3 = GenericButtonSettings.Variants.Plain
	end
	local f28_local4 = f28_local3 == GenericButtonSettings.Variants.Checkbox
	local f28_local5 = f28_local3 == GenericButtonSettings.Variants.Plain
	local f28_local6 = f28_local3 == GenericButtonSettings.Variants.Info
	local f28_local7 = f28_local3 == GenericButtonSettings.Variants.Select
	local f28_local8 = f28_local3 == GenericButtonSettings.Variants.Slider
	local f28_local9 = f28_local3 == GenericButtonSettings.Variants.Input
	local f28_local10 = f28_local8 or f28_local7 or f28_local6 or f28_local9
	local f28_local11 = false
	local f28_local12 = f28_arg1.fade_in
	if not f28_local12 then
		f28_local12 = GenericMenuAnimationSettings.ButtonFadeInStartFade
	end
	if f28_local2 == GenericButtonSettings.Styles.FlatButton then
		f28_local1 = f28_arg1.substyle or GenericButtonSettings.Styles.FlatButton.SubStyles.Default
	elseif f28_local2 == GenericButtonSettings.Styles.GlassButton then
		f28_local1 = f28_arg1.substyle or GenericButtonSettings.Styles.GlassButton.SubStyles.Default
	end
	if not f28_local1 then
		f28_local1 = {}
	end
	local f28_local13 = {
		style = f28_local2,
		substyle = f28_local1,
		itemProps = f28_arg1
	}
	local self = LUI.UIButton.new()
	self.id = f28_arg1.id or "UIGenericButton"
	self.properties = self.properties or {}
	local f28_local15 = self
	local self = self.registerAnimationState
	local f28_local17 = "default"
	local f28_local18 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f0_local2( "height", f28_local13 )
	}
	local f28_local19
	if f28_local2 == GenericButtonSettings.Styles.GradientButton then
		f28_local19 = -f0_local2( "focus_animation_distance", f28_local13 )
		if not f28_local19 then
		
		else
			f28_local18.right = f28_local19
			f28_local18.left = 0
			self( f28_local15, f28_local17, f28_local18 )
			self:animateToState( "default" )
			if f28_arg1.muteAction then
				self:clearActionSFX()
			end
			self = LUI.UIElement.new()
			self.id = "button"
			self:addElement( self )
			f28_local15 = not f0_local2( "disable_height_guard", f28_local13 )
			if f28_local11 then
				f28_local18 = self
				f28_local17 = self.registerAnimationState
				f28_local19 = "default"
				local self = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = not f28_local15,
					top = 0
				}
				local f28_local21
				if f28_local15 then
					f28_local21 = f0_local2( "height", f28_local13 )
					if not f28_local21 then
					
					else
						self.bottom = f28_local21
						self.left = -f0_local2( "lt_cap_width", f28_local13 ) - f0_local2( "rt_cap_width", f28_local13 )
						self.right = 0
						f28_local17( f28_local18, f28_local19, self )
						f28_local18 = self
						f28_local17 = self.registerAnimationState
						f28_local19 = "ready"
						self = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = not f28_local15,
							left = 0,
							right = 0,
							top = 0
						}
						f28_local21
						if f28_local15 then
							f28_local21 = f0_local2( "height", f28_local13 )
							if not f28_local21 then
							
							else
								self.bottom = f28_local21
								f28_local17( f28_local18, f28_local19, self )
								f28_local18 = MBh.AnimateSequence( {
									{
										"default",
										0,
										false,
										false
									},
									{
										"ready",
										f0_local2( "slide_in_min_duration", f28_local13 ) + f0_local2( "slide_in_duration_step", f28_local13 ) * f28_arg2,
										false,
										true
									}
								} )
								f28_local18( self, {} )
								if f28_arg2 == 1 then
									Engine.PlaySound( CoD.SFX.ChangeScreen )
								end
							end
						end
						f28_local21 = 0
					end
				end
				f28_local21 = 0
			elseif f0_local2( "fadeIn", f28_local13 ) then
				f28_local17 = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = not f28_local15,
					left = 0,
					right = 0,
					top = 0
				}
				if f28_local15 then
					f28_local18 = f0_local2( "height", f28_local13 )
					if not f28_local18 then
					
					else
						f28_local17.bottom = f28_local18
						f28_local17.alpha = 1
						self:registerAnimationState( "default", f28_local17 )
						f28_local18 = f28_local17
						f28_local18.alpha = 0
						self:registerAnimationState( "hide", f28_local18 )
						self:registerAnimationState( "wait", {} )
						self:animateInSequence( {
							{
								"hide",
								0
							},
							{
								"wait",
								f28_local12 + (f28_arg0.listIndex or 0) * GenericMenuAnimationSettings.ButtonFadeInDelay
							},
							{
								"default",
								GenericMenuAnimationSettings.ButtonFadeInDuration
							}
						} )
					end
				end
				f28_local18 = 0
			else
				f28_local18 = self
				f28_local17 = self.registerAnimationState
				f28_local19 = "default"
				local self = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = not f28_local15,
					left = 0,
					right = 0,
					top = 0
				}
				local f28_local21
				if f28_local15 then
					f28_local21 = f0_local2( "height", f28_local13 )
					if not f28_local21 then
					
					else
						self.bottom = f28_local21
						f28_local17( f28_local18, f28_local19, self )
						self:animateToState( "default" )
					end
				end
				f28_local21 = 0
			end
			f28_local17 = {
				style = f28_local2,
				substyle = f28_local1,
				itemProps = f28_arg1,
				useActionButton = f28_local6 or f28_local5 or f28_local9
			}
			f28_local18 = assert
			f28_local19
			if f0_local2( "force_disable_action_button", f28_local13 ) then
				f28_local19 = not f0_local2( "force_enable_action_button", f28_local13 )
			else
				f28_local19 = true
			end
			f28_local18( f28_local19, "Trying to force enable and force disable the button prompt." )
			f28_local18 = f28_local17.useActionButton
			if f28_local18 then
				f28_local18 = not f0_local2( "force_disable_action_button", f28_local13 )
			end
			f28_local17.useActionButton = f28_local18
			f28_local18 = f28_local17.useActionButton
			if not f28_local18 then
				f28_local18 = f0_local2( "force_enable_action_button", f28_local13 )
			end
			f28_local17.useActionButton = f28_local18
			f28_local18 = f28_local17.useActionButton
			if f28_local18 then
				f28_local18 = Engine.IsConsoleGame()
				if not f28_local18 then
					f28_local18 = Engine.IsGamepadEnabled()
				end
			end
			f28_local17.useActionButton = f28_local18
			if not f28_local5 and not f28_local6 and not f28_local9 then
				f28_local18 = f0_local2( "force_enable_action_button", f28_local13 )
				if f28_local18 then
				
				else
					f28_local17.extendOnFocus = f28_local18
					f28_local17.actionButtonMargin = f0_local2( "action_button_margin", f28_local13 )
					f28_local17.rarity = f28_arg1.rarity
					self:addElement( CommonButtonBackgroundFactory( f28_local17 ) )
					f28_local19 = {
						yOffset = f0_local2( "y_offset", f28_local13 ),
						text_focus_color = f0_local2( "text_focus_color", f28_local13 ),
						text_lock_color = f0_local2( "text_lock_color", f28_local13 ),
						text_default_color = f0_local2( "text_default_color", f28_local13 ),
						text_disabled_color = f0_local2( "text_disabled_color", f28_local13 ),
						text_over_disabled_color = f0_local2( "text_over_disabled_color", f28_local13 ),
						text_over_disabled_pulse_color = f0_local2( "text_over_disabled_pulse_color", f28_local13 ),
						overDisabledAnimationDuration = f0_local2( "over_disabled_animation_duration", f28_local13 ),
						pinned_color = f0_local2( "pinned_color", f28_local13 )
					}
					if f28_local10 then
						f28_local19.padding = f0_local2( "text_padding_with_content", f28_local13 )
						f28_local19.paddingFocus = f0_local2( "text_padding_focus_with_content", f28_local13 )
						f28_local19.align = f0_local2( "text_align_with_content", f28_local13 )
					else
						f28_local19.padding = f0_local2( "text_padding_without_content", f28_local13 )
						f28_local19.paddingFocus = f0_local2( "text_padding_focus_without_content", f28_local13 )
						f28_local19.align = f0_local2( "text_align_without_content", f28_local13 )
					end
					f28_local19.lockedHighlight = f0_local2( "lockedHighlight", f28_local13 )
					f28_local19.align = LUI.AdjustAlignmentForLanguage( f28_local19.align )
					if f28_local2 == GenericButtonSettings.Styles.FlatButton or f28_local2 == GenericButtonSettings.Styles.GlassButton then
						f28_local19.additional_handlers = {
							button_pin = function ( f29_arg0, f29_arg1 )
								if not Engine.IsConsoleGame() then
									self.m_ignoreMouseFocus = true
									if not Engine.IsGamepadEnabled() then
										self:processEvent( {
											name = "lose_focus",
											immediate = true
										} )
										self.m_ignoreMouseFocus = true
										self.m_mouseOver = nil
									end
								end
								f29_arg0:animateToState( "pinned" )
							end,
							button_unpin = function ( f30_arg0, f30_arg1 )
								if not f30_arg1.graphicsOnly then
									if self.disabled then
										return 
									end
									f30_arg0:animateToState( "default" )
									if not Engine.IsConsoleGame() then
										self.m_ignoreMouseFocus = false
										if not Engine.IsGamepadEnabled() then
											self.m_focusable = true
										end
									end
									self:processEvent( {
										name = "button_up",
										immediate = true,
										dispatchChildren = true
									} )
								end
							end
						}
					end
					if f28_arg1.hasSublist then
						local self = LUI.UIImage.new( {
							rightAnchor = true,
							width = 21,
							height = 13,
							right = -25,
							material = RegisterMaterial( "h1_deco_icon_mwdoublearrow" ),
							color = LUI.CacStaticLayout.imageGray
						} )
						self:registerAnimationState( "focus", {
							color = GenericButtonSettings.Common.content_focus_color
						} )
						self:registerEventHandler( "button_over", function ( element, event )
							element:animateToState( "focus" )
						end )
						self:registerEventHandler( "button_up", function ( element, event )
							element:animateToState( "default" )
						end )
						self:addElement( self )
						if f28_local19.align == LUI.Alignment.Right then
							f28_local19.padding = 51
							f28_local19.paddingFocus = f28_local19.padding
						end
					end
					self.textLabel = LUI.UIGenericButton.ButtonLabelFactory( f28_local19, f28_arg1.button_text, self, f28_arg1.textStyle, f28_arg1.maxLabelWidth )
					self.setText = function ( f33_arg0, f33_arg1 )
						self.textLabel:setText( f33_arg1 )
					end
					
					self:addElement( self.textLabel )
					if f28_local10 then
						local self = {
							align = f28_local19.align
						}
						local f28_local21
						if not f28_local8 then
							f28_local21 = not f28_local9
						else
							f28_local21 = false
						end
						self.useText = f28_local21
						self.useInput = f28_local9
						self.field_edited_func = f0_local2( "field_edited_func", f28_local13 )
						self.max_length = f0_local2( "max_length", f28_local13 )
						self.password_field = f0_local2( "password_field", f28_local13 )
						self.keyboard_type = f0_local2( "keyboard_type", f28_local13 )
						self.field_name = f0_local2( "field_name", f28_local13 )
						self.text_alignment = f0_local2( "text_alignment", f28_local13 )
						self.useBackground = false
						f28_local21
						if not f28_local6 then
							f28_local21 = not f28_local9
						else
							f28_local21 = false
						end
						self.useArrows = f28_local21
						self.toggleClick = f28_local7
						self.arrowsMargin = f0_local2( "content_arrows_margin", f28_local13 )
						self.useSlider = f28_local8
						self.sliderWidth = f0_local2( "content_slider_width", f28_local13 )
						self.sliderHeight = f0_local2( "content_slider_height", f28_local13 )
						f28_local21 = self.useBackground
						if f28_local21 then
							f28_local21 = f28_local2 == GenericButtonSettings.Styles.GradientButton
						end
						self.useCap = f28_local21
						self.margin = f0_local2( "content_margin", f28_local13 )
						self.width = f0_local2( "content_width", f28_local13 )
						self.yOffset = f0_local2( "y_offset", f28_local13 )
						self.backgroundMarginTop = f0_local2( "content_background_margin_top", f28_local13 )
						self.backgroundMarginBottom = f0_local2( "content_background_margin_bottom", f28_local13 )
						self.capWidth = f0_local2( "content_cap_width", f28_local13 )
						self.labelAlign = f0_local2( "label_align", f28_local13 )
						self.text_focus_color = f0_local2( "text_focus_color", f28_local13 )
						self.content_default_color = f0_local2( "content_default_color", f28_local13 )
						self.content_lock_color = f0_local2( "content_lock_color", f28_local13 )
						self.content_focus_color = f0_local2( "content_focus_color", f28_local13 )
						self.content_focus_color_without_bg = f0_local2( "content_focus_color_without_bg", f28_local13 )
						self.text_disabled_color = f0_local2( "text_disabled_color", f28_local13 )
						self.text_over_disabled_color = f0_local2( "text_over_disabled_color", f28_local13 )
						self.text_over_disabled_pulse_color = f0_local2( "text_over_disabled_pulse_color", f28_local13 )
						if f28_local2 == GenericButtonSettings.Styles.FlatButton then
							f28_local21 = f0_local2( "background_bypass", f28_local13 )
						else
							f28_local21 = false
						end
						self.useBackgroundBypass = f28_local21
						self.disable_highlight_glow = f0_local2( "disable_highlight_glow", f28_local13 )
						self:addElement( f0_local3( self, f28_arg1 ) )
					elseif f28_local4 then
						self:addElement( f0_local4( {
							margin = f0_local2( "content_margin", f28_local13 ),
							width = f0_local2( "content_width", f28_local13 ),
							yOffset = f0_local2( "y_offset", f28_local13 ),
							negativeColor = f0_local2( "negative_color", f28_local13 )
						}, f28_arg1 ) )
					end
					local self = function ( f34_arg0, f34_arg1 )
						local f34_local0 = ""
						if f34_arg0.properties.desc_text then
							if type( f34_arg0.properties.desc_text ) == "string" then
								f34_local0 = f34_arg0.properties.desc_text
							elseif type( f34_arg0.properties.desc_text ) == "function" then
								f34_local0 = f34_arg0.properties:desc_text( f34_arg1 )
								assert( type( f34_local0 ) == "string" )
							end
						end
						f34_arg0:dispatchEventToRoot( {
							name = "set_button_info_text",
							text = f34_local0,
							immediate = true
						} )
					end
					
					self:registerEventHandler( "button_over", function ( element, event )
						self( element, event )
						if element.properties.button_over_func then
							element.properties:button_over_func( event )
						end
						if f28_local10 and not f28_local6 then
							element:processEvent( {
								name = "show_arrows"
							} )
						end
					end )
					self:registerEventHandler( "button_up", function ( element, event )
						if element.properties.button_up_func then
							element.properties:button_up_func( event )
						end
						if f28_local10 and not f28_local6 then
							element:processEvent( {
								name = "hide_arrows"
							} )
						end
					end )
					self:registerEventHandler( "button_action", function ( element, event )
						if Engine.IsPC() and not event.noRefocus and not element:isClosed() and not element:isInFocus() then
							element:dispatchEventToRoot( {
								name = "lose_focus",
								controller = event.controller,
								immediate = true
							} )
							element:processEvent( {
								name = "gain_focus",
								controller = event.controller,
								immediate = true
							} )
						end
						if f28_local4 then
							element:processEvent( {
								name = "toggle_checked"
							} )
						end
						if f28_local9 and not event.mouse then
							element:dispatchEventToChildren( event )
						end
						if element.properties.button_instant_action_func then
							element.properties:button_instant_action_func( event )
						end
						local f37_local0 = element.properties.button_action_func
						if not event.mouse and element.properties.buttonActionIsRightAction and element.properties.button_right_func then
							assert( element.properties.button_action_func == nil, "Should buttonActionIsRightAction and button_action_func are colliding, should not be use together" )
							f37_local0 = element.properties.button_right_func
						end
						if f37_local0 then
							local f37_local1 = element:getParent()
							if f37_local1.genericListAction then
								f37_local1 = element:getParent()
								f37_local1:genericListAction( event )
							end
							if element.properties.delay and element.properties.delay > 0 then
								f37_local1 = event
								local f37_local2 = function ( f38_arg0, f38_arg1 )
									f37_local0( f38_arg0, f37_local1 )
									f38_arg0:processEvent( {
										name = "content_refresh"
									} )
									f38_arg0:registerEventHandler( "delayed_action", nil )
									local f38_local0 = Engine.GetLuiRoot()
									assert( f38_local0 )
									f38_local0.flowManager:UnblockInputForDelayedMenuAction()
								end
								
								element:addElement( LUI.UITimer.new( element.properties.delay, "delayed_action", nil, true ) )
								element:registerEventHandler( "delayed_action", f37_local2 )
								local f37_local3 = Engine.GetLuiRoot()
								assert( f37_local3 )
								f37_local3.flowManager:BlockInputForDelayedMenuAction()
								event.handled = true
							else
								f37_local1 = nil
								if element.properties.button_display_func and element.properties.valueActionAudio then
									f37_local1 = element.properties.button_display_func()
								end
								f37_local0( element, event )
								if f37_local1 ~= nil then
									if f37_local1 ~= element.properties.button_display_func() then
										if element.actionSFX or element.properties.buttonActionIsRightAction then
											local f37_local3 = Engine.PlaySound
											local f37_local4 = element.actionSFX
											if not f37_local4 then
												f37_local4 = CoD.SFX.MenuAccept
											end
											f37_local3( f37_local4 )
										end
									else
										Engine.PlaySound( CoD.SFX.DenySelect )
									end
								end
								element:processEvent( {
									name = "content_refresh"
								} )
								event.handled = true
							end
						end
					end )
					self.properties.button_over_disable_func = f28_arg1.button_over_disable_func
					self:registerEventHandler( "button_over_disable", function ( element, event )
						self( element, event )
						if element.properties.button_over_disable_func then
							element.properties:button_over_disable_func( event )
						end
						if f28_local10 and not f28_local6 then
							element:processEvent( {
								name = "hide_arrows"
							} )
						end
					end )
					self:registerEventHandler( "lose_focus", function ( element, event )
						LUI.UIElement.loseFocus( element, event )
						if element.disabled then
							element:processEvent( {
								name = "button_disable",
								dispatchChildren = true
							} )
						else
							local f40_local0 = element.m_ignoreMouseFocus
							if f40_local0 then
								f40_local0 = event.focusType == FocusType.MouseOver
							end
							if not f40_local0 then
								element:processEvent( {
									name = "button_up",
									dispatchChildren = true
								} )
							end
						end
					end )
					local f28_local21 = function ( f41_arg0, f41_arg1 )
						local f41_local0 = nil
						if f41_arg1 ~= nil then
							f41_local0 = f41_arg1
						else
							f41_local0 = 14
						end
						if Engine.IsRightToLeftLanguage() then
							f41_arg0.leftAnchor = true
							f41_arg0.left = f41_local0
						else
							f41_arg0.rightAnchor = true
							f41_arg0.right = -f41_local0
						end
						return f41_arg0
					end
					
					if f28_arg1.canShowRestricted then
						local self = LUI.UIImage.new()
						self:registerAnimationState( "default", f28_local21( {
							topAnchor = false,
							bottomAnchor = false,
							leftAnchor = false,
							rightAnchor = false,
							width = 20,
							height = 20,
							material = RegisterMaterial( CoD.Material.RestrictedIcon ),
							alpha = 0
						}, 28 ) )
						self:registerAnimationState( "visible", {
							alpha = 1
						} )
						self:animateToState( "default" )
						self:addElement( self )
						self:registerEventHandler( "update_restricted", function ( element, event )
							local f42_local0 = "default"
							if event.isRestricted then
								f42_local0 = "visible"
							end
							element:animateToState( f42_local0, 0 )
						end )
					end
					if f28_arg1.customIcon ~= nil then
						local self = f28_arg1.customIcon
						local self = self.size or 24
						local f28_local24 = self.material
						local f28_local25 = self.offset
						local f28_local26 = self.initVisible
						local self = LUI.UIImage.new()
						local f28_local28 = {
							topAnchor = false,
							bottomAnchor = false,
							leftAnchor = false,
							rightAnchor = false,
							width = self,
							height = self,
							material = RegisterMaterial( f28_local24 ),
							alpha = 0
						}
						f28_local21( f28_local28, f28_local25 )
						self:registerAnimationState( "default", f28_local28 )
						self:registerAnimationState( "visible", {
							alpha = 1
						} )
						self:animateToState( "default" )
						self:addElement( self )
						self:registerEventHandler( "update_custom_icon", function ( element, event )
							local f43_local0 = "default"
							if event.isVisible then
								f43_local0 = "visible"
							end
							element:animateToState( f43_local0, 0 )
						end )
						if f28_local26 then
							self:animateToState( "visible" )
						end
					end
					if f28_arg1.showNewSticker or f28_arg1.shouldShowNewStoreSticker then
						self.newSticker = LUI.NewSticker.new( f28_local21( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ) ), f28_arg1.newStickerMode )
						self:addElement( self.newSticker )
						if f28_arg1.newStickerUpdateFunction ~= nil then
							self.newSticker:registerEventHandler( "update_new_sticker", f28_arg1.newStickerUpdateFunction )
							f28_arg1.newStickerUpdateFunction( self.newSticker )
						end
					end
					if f28_arg1.canShowLocked or f28_arg1.showLockOnDisable then
						if f28_arg1.showLockOnDisable then
							f28_arg1.allowDisabledAction = true
						end
						local self = 16
						local self = LUI.UIImage.new()
						self:registerAnimationState( "default", f28_local21( {
							topAnchor = false,
							bottomAnchor = false,
							leftAnchor = false,
							rightAnchor = false,
							width = self,
							height = self,
							material = RegisterMaterial( CoD.Material.LockedIcon ),
							alpha = 0
						} ) )
						self:registerAnimationState( "visible", {
							alpha = 1
						} )
						self:animateToState( "default" )
						self:addElement( self )
						if f28_arg1.showLockOnDisable then
							local f28_local25 = function ( f44_arg0, f44_arg1 )
								f44_arg0:animateToState( "visible", 0 )
							end
							
							local f28_local26 = function ( f45_arg0, f45_arg1 )
								f45_arg0:animateToState( "default", 0 )
							end
							
							self:registerEventHandler( "button_disable", f28_local25 )
							self:registerEventHandler( "button_over_disable", f28_local25 )
							self:registerEventHandler( "button_over", f28_local26 )
							self:registerEventHandler( "button_up", f28_local26 )
						else
							self:registerEventHandler( "update_lock", function ( element, event )
								local f46_local0 = "default"
								if event.isLocked then
									f46_local0 = "visible"
								end
								element:animateToState( f46_local0, 0 )
							end )
						end
					end
					if f28_arg1.xpScalarObj ~= nil then
						local self = nil
						if Engine.IsRightToLeftLanguage() then
							self = CoD.CreateState( -115, nil, nil, nil, CoD.AnchorTypes.None )
						else
							self = CoD.CreateState( 80, nil, nil, nil, CoD.AnchorTypes.None )
						end
						self.width = 30
						self.height = 30
						if f28_arg1.xpScalarObj.xpScale == 4 then
							self.material = RegisterMaterial( "ui_reward_small_quad_xp" )
						elseif f28_arg1.xpScalarObj.xpScale == 2 then
							if f28_arg1.xpScalarObj.depotScale == 2 then
								self.material = RegisterMaterial( "ui_reward_2xp_depot_2xp" )
								self.width = 38
							else
								self.material = RegisterMaterial( "ui_reward_small_double_xp" )
							end
						elseif f28_arg1.xpScalarObj.xpScaleWithParty == 2 then
							if f28_arg1.xpScalarObj.depotScale == 2 then
								self.material = RegisterMaterial( "ui_reward_party_2xp_depot_2xp" )
								self.width = 38
							else
								self.material = RegisterMaterial( "ui_reward_small_double_party_xp" )
							end
						elseif f28_arg1.xpScalarObj.depotScale == 2 then
							self.material = RegisterMaterial( "depot_currency_credit_2x" )
						end
						if self.material then
							local self = LUI.UIImage.new( self )
							self:addElement( self )
							self.scalarXpElement = self
						end
					end
					return self
				end
			end
			f28_local18 = not f0_local2( "force_disable_action_button", f28_local13 )
		end
	end
	f28_local19 = 0
end

LUI.MenuBuilder.registerType( "UIGenericButton", LUI.UIGenericButton.new )
LockTable( _M )
