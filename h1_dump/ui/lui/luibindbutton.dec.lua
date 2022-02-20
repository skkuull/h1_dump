LUI.UIBindButton = {}
LUI.UIBindButton.GamepadButton = function ( f1_arg0, f1_arg1 )
	if f1_arg0:handleGamepadButton( f1_arg1 ) then
		return true
	elseif f1_arg0.m_ownerController ~= nil and f1_arg0.m_ownerController ~= f1_arg1.controller then
		DebugPrint( "Item Exclusive to controller " .. f1_arg1.controller )
		return false
	elseif f1_arg1.down == true then
		local f1_local0 = false
		local f1_local1 = {
			controller = f1_arg1.controller,
			qualifier = f1_arg1.qualifier
		}
		if not f1_arg0.disabled then
			f1_local0 = true
			f1_local1.name = GetButtonEventName( f1_arg1.button, f1_arg0.handlePrimary )
			if f1_local1.name == "" then
				f1_local0 = false
			end
		elseif f1_arg1.button == "friends" and not f1_arg0.disabled then
			f1_arg0:processEvent( {
				name = "button_friends",
				controller = f1_arg1.controller
			} )
			handledEvent = true
		end
		if f1_local0 and f1_arg0:processEvent( f1_local1 ) then
			if f1_arg0.actionSFX then
				Engine.PlaySound( f1_arg0.actionSFX )
			end
			return true
		end
	elseif f1_arg0.handleRelease then
		local f1_local0 = false
		local f1_local1 = {
			controller = f1_arg1.controller,
			qualifier = f1_arg1.qualifier
		}
		if not f1_arg0.disabled then
			f1_local0 = true
			f1_local1.name = GetButtonEventName( f1_arg1.button, f1_arg0.handlePrimary )
			if f1_local1.name == "" then
				f1_local0 = false
			end
		end
		if f1_local0 == true then
			f1_local1.name = f1_local1.name .. "_released"
		end
		if f1_local0 and f1_arg0:processEvent( f1_local1 ) then
			return true
		end
	end
	return f1_arg0:dispatchEventToChildren( f1_arg1 )
end

function GetButtonEventName( f2_arg0, f2_arg1 )
	if f2_arg0 == "primary" and f2_arg1 then
		return "button_action"
	elseif f2_arg0 == "secondary" then
		return "button_secondary"
	elseif f2_arg0 == "alt1" then
		return "button_alt1"
	elseif f2_arg0 == "alt2" then
		return "button_alt2"
	elseif f2_arg0 == "right_trigger" then
		return "button_right_trigger"
	elseif f2_arg0 == "left_trigger" then
		return "button_left_trigger"
	elseif f2_arg0 == "shoulderr" then
		return "button_shoulderr"
	elseif f2_arg0 == "shoulderl" then
		return "button_shoulderl"
	elseif f2_arg0 == "left" then
		return "button_left"
	elseif f2_arg0 == "right" then
		return "button_right"
	elseif f2_arg0 == "up" then
		return "button_up"
	elseif f2_arg0 == "down" then
		return "button_down"
	elseif f2_arg0 == "start" then
		return "button_start"
	elseif f2_arg0 == "select" then
		return "button_select"
	elseif f2_arg0 == "options" then
		return "button_options"
	elseif f2_arg0 == "right_stick_pressed" then
		return "button_r3"
	elseif f2_arg0 == "left_stick_pressed" then
		return "button_l3"
	elseif f2_arg0 == "ins" then
		return "key_insert"
	elseif f2_arg0 == "page_up" then
		return "button_page_up"
	elseif f2_arg0 == "page_down" then
		return "button_page_down"
	else
		return ""
	end
end

LUI.UIBindButton.ElementEnable = function ( f3_arg0, f3_arg1 )
	f3_arg0.disabled = nil
end

LUI.UIBindButton.ElementDisable = function ( f4_arg0, f4_arg1 )
	f4_arg0.disabled = true
end

LUI.UIBindButton.Enable = function ( f5_arg0 )
	f5_arg0:processEvent( {
		name = "enable",
		dispatchChildren = true
	} )
end

LUI.UIBindButton.Disable = function ( f6_arg0 )
	f6_arg0:processEvent( {
		name = "disable",
		dispatchChildren = true
	} )
end

LUI.UIBindButton.SetActionSFX = function ( f7_arg0, f7_arg1 )
	f7_arg0.actionSFX = f7_arg1
end

LUI.UIBindButton.ClearActionSFX = function ( f8_arg0 )
	f8_arg0.actionSFX = nil
end

LUI.UIBindButton.build = function ( f9_arg0, f9_arg1 )
	return LUI.UIBindButton.new()
end

LUI.UIBindButton.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self.id = "LUIBindButton"
	self.enable = LUI.UIBindButton.Enable
	self.disable = LUI.UIBindButton.Disable
	self.setActionSFX = LUI.UIBindButton.SetActionSFX
	self.clearActionSFX = LUI.UIBindButton.ClearActionSFX
	self:registerEventHandlerIfFree( "enable", LUI.UIBindButton.ElementEnable )
	self:registerEventHandlerIfFree( "disable", LUI.UIBindButton.ElementDisable )
	self:registerEventHandlerIfFree( "popup_active", LUI.UIBindButton.ElementDisable )
	self:registerEventHandlerIfFree( "popup_inactive", LUI.UIBindButton.ElementEnable )
	self:registerEventHandler( "gamepad_button", LUI.UIBindButton.GamepadButton )
	return self
end

