LUI.UIButton = {}
LUI.UIButton.popupActive = function ( f1_arg0, f1_arg1 )
	f1_arg0.m_ignoreMouseFocus = true
end

LUI.UIButton.popupInactive = function ( f2_arg0, f2_arg1 )
	f2_arg0.m_ignoreMouseFocus = nil
end

LUI.UIButton.MouseEnter = function ( f3_arg0, f3_arg1 )
	if f3_arg0.m_leftMouseDown == nil then
		if not f3_arg0:isInFocus() then
			if f3_arg0:canFocus( FocusType.MouseOver ) then
				if f3_arg0.disabled then
					f3_arg0:processEvent( {
						name = "button_over_disable"
					} )
				else
					f3_arg0:processEvent( {
						name = "button_over",
						controller = f3_arg1.controller,
						isMouseEnter = true
					} )
				end
			elseif f3_arg0.listenMouseEnterLeave then
				f3_arg0.mouseIsOver = true
				if not f3_arg0.disabled then
					if f3_arg0.gainFocusSFX ~= nil then
						CoD.StartEventSound()
						CoD.PlayEventSound( f3_arg0.gainFocusSFX, 10 )
						CoD.EndEventSound()
					end
					f3_arg0:processEvent( {
						name = "button_over_mouse",
						controller = f3_arg1.controller
					} )
				end
			end
		end
	elseif f3_arg0.m_leftMouseDown ~= nil then
		f3_arg0:processEvent( {
			name = "button_over_down"
		} )
	end
end

LUI.UIButton.MouseLeave = function ( f4_arg0, f4_arg1 )
	if f4_arg0.m_leftMouseDown == nil then
		if not f4_arg0:isInFocus() then
			if f4_arg0.m_focusable then
				if f4_arg0.disabled then
					f4_arg0:processEvent( {
						name = "button_disable"
					} )
				else
					f4_arg0:processEvent( {
						name = "button_up"
					} )
				end
			elseif f4_arg0.listenMouseEnterLeave then
				f4_arg0.mouseIsOver = false
				if not f4_arg0.disabled then
					f4_arg0:processEvent( {
						name = "button_up_mouse"
					} )
				end
			end
		end
	else
		f4_arg0:processEvent( {
			name = "button_down"
		} )
		if f4_arg0.listenMouseEnterLeave then
			f4_arg0.mouseIsOver = false
			if not f4_arg0.disabled then
				f4_arg0:processEvent( {
					name = "button_up_mouse"
				} )
			end
		end
	end
end

LUI.UIButton.LeftMouseDown = function ( f5_arg0, f5_arg1 )
	f5_arg0:processEvent( {
		name = "button_over_down"
	} )
end

LUI.UIButton.RightMouseDown = function ( f6_arg0, f6_arg1 )
	f6_arg0:processEvent( {
		name = "button_over_down"
	} )
end

LUI.UIButton.LeftMouseUp = function ( f7_arg0, f7_arg1 )
	if f7_arg1.inside then
		LUI.UIButton.RefreshDisabled( f7_arg0 )
		if f7_arg0.disabled then
			f7_arg0:processEvent( {
				name = "button_over_disable"
			} )
		else
			f7_arg0:processEvent( {
				name = "button_over",
				controller = f7_arg1.controller,
				focusType = FocusType.MouseOver
			} )
		end
		if not f7_arg0.disabled then
			if not f7_arg0.properties or not f7_arg0.properties.muteAction then
				CoD.PlayEventSound( f7_arg0.actionSFX, 10 )
			end
			local f7_local0 = {
				name = "button_action",
				controller = f7_arg1.controller,
				mouse = true
			}
			local f7_local1 = f7_arg0:processEvent( f7_local0 )
			f7_arg0:processEvent( {
				name = "button_down",
				controller = f7_arg1.controller,
				mouse = true
			} )
			f7_arg1.handled = f7_arg1.handled or f7_local0.handled
			if f7_local1 then
				return f7_local1
			end
		elseif f7_arg0.properties and f7_arg0.properties.disableSound then
			CoD.PlayEventSound( f7_arg0.properties.disableSound, 10 )
		elseif f7_arg0.disabledSFX then
			CoD.PlayEventSound( f7_arg0.disabledSFX, 10 )
		end
		if f7_arg0.properties and f7_arg0.properties.allowDisabledAction then
			f7_arg0:processEvent( {
				name = "button_action_disable",
				controller = f7_arg1.controller
			} )
		end
	elseif not f7_arg0.disabled then
		f7_arg0:processEvent( {
			name = "button_up"
		} )
	end
end

LUI.UIButton.RightMouseUp = function ( f8_arg0, f8_arg1 )
	if f8_arg1.inside then
		LUI.UIButton.RefreshDisabled( f8_arg0 )
		if f8_arg0.disabled then
			f8_arg0:processEvent( {
				name = "button_over_disable",
				controller = f8_arg1.controller
			} )
		else
			f8_arg0:processEvent( {
				name = "button_over",
				controller = f8_arg1.controller,
				focusType = FocusType.MouseOver
			} )
		end
		if not f8_arg0.disabled then
			local f8_local0 = {
				name = "button_actionsecondary",
				controller = f8_arg1.controller,
				mouse = true
			}
			local f8_local1 = f8_arg0:processEvent( f8_local0 )
			f8_arg1.handled = f8_arg1.handled or f8_local0.handled
			if f8_local1 then
				return f8_local1
			end
		end
	else
		f8_arg0:processEvent( {
			name = "button_up"
		} )
	end
end

LUI.UIButton.excludeButtons = {
	secondary = true,
	alt1 = true,
	alt2 = true,
	right_trigger = true,
	left_trigger = true,
	shoulderl = true,
	shoulderr = true,
	start = true
}
LUI.UIButton.GamepadButton = function ( f9_arg0, f9_arg1 )
	if f9_arg0:handleGamepadButton( f9_arg1 ) then
		return true
	end
	LUI.UIButton.RefreshDisabled( f9_arg0 )
	if f9_arg0:isInFocus() and f9_arg1.down == true then
		if f9_arg1.button == "primary" then
			if not f9_arg0.disabled or f9_arg0.locked then
				if not f9_arg0.properties or not f9_arg0.properties.muteAction then
					CoD.PlayEventSound( f9_arg0.actionSFX, 10 )
				end
				local f9_local0
				if not f9_arg1.qualifier or f9_arg1.qualifier ~= ButtonQualifiers.Keyboard then
					f9_local0 = false
				else
					f9_local0 = true
				end
				f9_arg0:processEvent( {
					name = "button_action",
					controller = f9_arg1.controller,
					keyboard = f9_local0
				} )
				f9_arg0:processEvent( {
					name = "button_down",
					controller = f9_arg1.controller,
					keyboard = f9_local0
				} )
			else
				if f9_arg0.properties and f9_arg0.properties.disableSound then
					CoD.PlayEventSound( f9_arg0.properties.disableSound, 11 )
				elseif f9_arg0.disabledSFX then
					CoD.PlayEventSound( f9_arg0.disabledSFX, 10 )
				end
				if f9_arg0.properties and f9_arg0.properties.allowDisabledAction then
					f9_arg0:processEvent( {
						name = "button_action_disable",
						controller = f9_arg1.controller
					} )
				end
				if f9_arg0.m_eventHandlers.button_action ~= nil then
					return false
				end
			end
			if f9_arg0.m_eventHandlers.button_action ~= nil then
				return true
			end
		elseif f9_arg1.button == "left" then
			if not f9_arg0.disabled then
				f9_arg0:processEvent( {
					name = "button_left",
					controller = f9_arg1.controller
				} )
			elseif f9_arg0.m_eventHandlers.button_left ~= nil then
				return false
			end
			if f9_arg0.m_eventHandlers.button_left ~= nil then
				return true
			end
		elseif f9_arg1.button == "right" then
			if not f9_arg0.disabled then
				f9_arg0:processEvent( {
					name = "button_right",
					controller = f9_arg1.controller
				} )
			elseif f9_arg0.m_eventHandlers.button_right ~= nil then
				return false
			end
			if f9_arg0.m_eventHandlers.button_right ~= nil then
				return true
			end
		elseif LUI.UIButton.excludeButtons[f9_arg1.button] and f9_arg0.m_eventHandlers["button_" .. f9_arg1.button] ~= nil then
			DebugPrint( "Warning: event handler specified for button_" .. f9_arg1.button .. " on a UIButton id = " .. f9_arg0.id .. ", this won't work anymore, use a UIBindButton" )
		end
	end
	return f9_arg0:dispatchEventToChildren( f9_arg1 )
end

LUI.UIButton.gainFocus = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0:isInFocus()
	LUI.UIElement.gainFocus( f10_arg0, f10_arg1 )
	local f10_local1 = f10_arg1.focusType == FocusType.MouseOver
	if f10_local1 then
		CoD.StartEventSound()
	end
	if not f10_local0 and f10_arg0:isInFocus() and f10_arg0.gainFocusSFX ~= nil and f10_arg1.focusType ~= FocusType.MenuFlow then
		CoD.PlayEventSound( f10_arg0.gainFocusSFX, 10 )
	end
	if f10_local1 then
		CoD.EndEventSound()
	end
	if f10_local1 or f10_arg0.m_requireFocusType ~= FocusType.MouseOver then
		if f10_arg0.disabled then
			f10_arg0:processEvent( {
				name = "button_over_disable",
				controller = f10_arg1.controller,
				dispatchChildren = true,
				focusType = f10_arg1.focusType,
				duration = f10_arg1.duration,
				button = f10_arg1.button
			} )
		else
			f10_arg0:processEvent( {
				name = "button_over",
				controller = f10_arg1.controller,
				dispatchChildren = true,
				focusType = f10_arg1.focusType,
				duration = f10_arg1.duration,
				button = f10_arg1.button
			} )
		end
	end
end

LUI.UIButton.loseFocus = function ( f11_arg0, f11_arg1 )
	LUI.UIElement.loseFocus( f11_arg0, f11_arg1 )
	if f11_arg0.disabled then
		f11_arg0:processEvent( {
			name = "button_disable",
			dispatchChildren = true
		} )
	else
		local f11_local0 = f11_arg0.m_ignoreMouseFocus
		if f11_local0 then
			f11_local0 = f11_arg1.focusType == FocusType.MouseOver
		end
		if not f11_local0 then
			f11_arg0:processEvent( {
				name = "button_up",
				dispatchChildren = true
			} )
		end
	end
end

LUI.UIButton.Up = function ( f12_arg0, f12_arg1 )
	f12_arg0:dispatchEventToChildren( f12_arg1 )
	if f12_arg0:isInFocus() then
		f12_arg0:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.UIButton.Over = function ( f13_arg0, f13_arg1 )
	if f13_arg0.disabled and f13_arg0:hasAnimationState( "button_over_disabled" ) then
		f13_arg0:animateToState( "button_over_disabled", f13_arg0.disableDuration )
	elseif f13_arg0:hasAnimationState( "button_over" ) then
		f13_arg0:animateToState( "button_over", f13_arg0.overDuration, f13_arg0.overEaseIn, f13_arg0.overEaseOut )
	end
end

LUI.UIButton.ElementUp = function ( f14_arg0, f14_arg1 )
	
end

LUI.UIButton.ElementDown = function ( f15_arg0, f15_arg1 )
	if f15_arg0:hasAnimationState( "button_down" ) then
		f15_arg0:animateToState( "button_down", f15_arg0.downDuration )
	else
		LUI.UIButton.ElementUp( f15_arg0, f15_arg1 )
	end
	f15_arg0:dispatchEventToChildren( f15_arg1 )
end

LUI.UIButton.ElementOverDown = function ( f16_arg0, f16_arg1 )
	if f16_arg0:hasAnimationState( "button_over_down" ) then
		f16_arg0:animateToState( "button_over_down", f16_arg0.overDownDuration )
	else
		LUI.UIButton.Over( f16_arg0, f16_arg1 )
	end
	f16_arg0:dispatchEventToChildren( f16_arg1 )
end

LUI.UIButton.ElementEnable = function ( f17_arg0, f17_arg1 )
	f17_arg0.disabled = nil
	f17_arg0.locked = nil
	f17_arg0:dispatchEventToChildren( f17_arg1 )
	if f17_arg0:isInFocus() then
		f17_arg0:processEvent( {
			name = "button_over",
			dispatchChildren = true,
			controller = f17_arg1.controller
		} )
	else
		f17_arg0:processEvent( {
			name = "button_up",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.ElementDisable = function ( f18_arg0, f18_arg1 )
	f18_arg0.disabled = true
	f18_arg0:dispatchEventToChildren( f18_arg1 )
	if f18_arg0:isInFocus() then
		f18_arg0:processEvent( {
			name = "button_over_disable",
			dispatchChildren = true
		} )
	else
		f18_arg0:processEvent( {
			name = "button_disable",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.ElementLock = function ( f19_arg0, f19_arg1 )
	f19_arg0.locked = true
	f19_arg0:dispatchEventToChildren( f19_arg1 )
	if f19_arg0:isInFocus() then
		f19_arg0:processEvent( {
			name = "button_over_disable",
			dispatchChildren = true
		} )
	else
		f19_arg0:processEvent( {
			name = "button_disable",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.UpdateOutsideList = function ( f20_arg0, f20_arg1 )
	f20_arg0.m_outsideParentList = f20_arg1.outside_list
end

LUI.UIButton.RefreshDisabled = function ( f21_arg0, f21_arg1 )
	if f21_arg0.disabledFunc then
		local f21_local0 = f21_arg0:disabledFunc( f21_arg0.properties )
		if f21_arg0.disabled and not f21_local0 then
			f21_arg0:processEvent( {
				name = "enable",
				dispatchChildren = true
			} )
		elseif not f21_arg0.disabled and f21_local0 then
			f21_arg0:processEvent( {
				name = "disable",
				dispatchChildren = true
			} )
		end
	end
end

LUI.UIButton.setDisabledRefreshRate = function ( f22_arg0, f22_arg1 )
	if f22_arg0.disabledTimer then
		f22_arg0.disabledTimer:close()
		f22_arg0.disabledTimer = nil
	end
	if f22_arg1 and f22_arg1 > 0 then
		f22_arg0.disabledTimer = LUI.UITimer.new( f22_arg1, "refresh_disabled" )
		f22_arg0.disabledTimer.id = "disabledFuncTimer"
		f22_arg0.disabledTimer:registerEventHandler( "disable", nil )
		f22_arg0:addElement( f22_arg0.disabledTimer )
	end
end

LUI.UIButton.Enable = function ( f23_arg0, f23_arg1 )
	f23_arg0:processEvent( {
		name = "enable",
		dispatchChildren = true
	} )
	if f23_arg0:isInFocus() then
		f23_arg0:processEvent( {
			name = "button_over",
			dispatchChildren = true,
			controller = f23_arg1.controller
		} )
	else
		f23_arg0:processEvent( {
			name = "button_up",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.Disable = function ( f24_arg0 )
	f24_arg0:processEvent( {
		name = "disable",
		dispatchChildren = true
	} )
	if f24_arg0:isInFocus() then
		f24_arg0:processEvent( {
			name = "button_over_disable",
			dispatchChildren = true
		} )
	else
		f24_arg0:processEvent( {
			name = "button_disable",
			dispatchChildren = true
		} )
	end
end

LUI.UIButton.SetupElement = function ( f25_arg0 )
	f25_arg0:registerEventHandlerIfFree( "enable", LUI.UIButton.ElementEnable )
	f25_arg0:registerEventHandlerIfFree( "disable", LUI.UIButton.ElementDisable )
	f25_arg0:registerEventHandlerIfFree( "lock", LUI.UIButton.ElementLock )
	f25_arg0:registerEventHandlerIfFree( "button_up", LUI.UIButton.Up )
	f25_arg0:registerEventHandlerIfFree( "button_over", LUI.UIButton.Over )
	f25_arg0:registerEventHandlerIfFree( "button_down", LUI.UIButton.ElementDown )
	f25_arg0:registerEventHandlerIfFree( "button_over_down", LUI.UIButton.ElementOverDown )
end

LUI.UIButton.SetGainFocusSFX = function ( f26_arg0, f26_arg1 )
	f26_arg0.gainFocusSFX = f26_arg1
end

LUI.UIButton.SetActionSFX = function ( f27_arg0, f27_arg1 )
	f27_arg0.actionSFX = f27_arg1
end

LUI.UIButton.ClearGainFocusSFX = function ( f28_arg0 )
	f28_arg0.gainFocusSFX = nil
end

LUI.UIButton.ClearActionSFX = function ( f29_arg0 )
	f29_arg0.actionSFX = nil
end

LUI.UIButton.build = function ( f30_arg0, f30_arg1 )
	return LUI.UIButton.new()
end

LUI.UIButton.postbuild = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = f31_arg0.disabled or false
	f31_arg0.disabled = false
	if f31_arg1.disabledFunc then
		f31_arg0.disabled = f31_arg1.disabledFunc( f31_arg0, f31_arg2 )
		f31_arg0.disabledFunc = f31_arg1.disabledFunc
		if f31_arg1.disabledFuncRefreshRate then
			f31_arg0:setDisabledRefreshRate( f31_arg1.disabledFuncRefreshRate )
		end
	end
	if f31_arg1.disabled then
		f31_arg0.disabled = true
	end
	if f31_local0 ~= f31_arg0.disabled then
		if f31_arg0.disabled then
			f31_arg0:processEvent( {
				name = "disable"
			} )
		else
			f31_arg0:processEvent( {
				name = "enable"
			} )
		end
	end
	if f31_arg1.audio then
		if f31_arg1.audio.button_over then
			f31_arg0:setGainFocusSFX( f31_arg1.audio.button_over )
		elseif f31_arg1.audio.no_button_over then
			f31_arg0:clearGainFocusSFX()
		end
		if f31_arg1.audio.button_action then
			f31_arg0:setActionSFX( f31_arg1.audio.button_action )
		elseif f31_arg1.audio.no_button_action then
			f31_arg0:clearActionSFX()
		end
	end
end

LUI.UIButton.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self.id = "LUIButton"
	self:makeFocusable()
	self:setHandleMouse( true )
	self.enable = LUI.UIButton.Enable
	self.disable = LUI.UIButton.Disable
	self.lock = LUI.UIButton.Disable
	self.actionEventName = controller
	self.setActionEventName = LUI.UIButton.setActionEventName
	self.setDisabledRefreshRate = LUI.UIButton.setDisabledRefreshRate
	self.setGainFocusSFX = LUI.UIButton.SetGainFocusSFX
	self.setActionSFX = LUI.UIButton.SetActionSFX
	self.clearActionSFX = LUI.UIButton.ClearActionSFX
	self.clearGainFocusSFX = LUI.UIButton.ClearGainFocusSFX
	self.gainFocusSFX = CoD.SFX.MouseOver
	self.actionSFX = CoD.SFX.MouseClick
	self.disabledSFX = CoD.SFX.MenuAcceptDisabled
	self:registerEventHandler( "mouseenter", LUI.UIButton.MouseEnter )
	self:registerEventHandler( "mouseleave", LUI.UIButton.MouseLeave )
	self:registerEventHandler( "leftmousedown", LUI.UIButton.LeftMouseDown )
	self:registerEventHandler( "leftmouseup", LUI.UIButton.LeftMouseUp )
	self:registerEventHandler( "rightmousedown", LUI.UIButton.RightMouseDown )
	self:registerEventHandler( "rightmouseup", LUI.UIButton.RightMouseUp )
	self:registerEventHandler( "gamepad_button", LUI.UIButton.GamepadButton )
	self:registerEventHandler( "gain_focus", LUI.UIButton.gainFocus )
	self:registerEventHandler( "lose_focus", LUI.UIButton.loseFocus )
	self:registerEventHandler( "popup_active", LUI.UIButton.popupActive )
	self:registerEventHandler( "popup_inactive", LUI.UIButton.popupInactive )
	self:registerEventHandler( "update_outside_list", LUI.UIButton.UpdateOutsideList )
	self:registerEventHandler( "refresh_disabled", LUI.UIButton.RefreshDisabled )
	LUI.UIButton.SetupElement( self )
	return self
end

