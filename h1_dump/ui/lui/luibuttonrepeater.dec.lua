require( "LUI.LUITimer" )

LUI.UIButtonRepeater = {}
LUI.UIButtonRepeater.FirstDelay = 350
LUI.UIButtonRepeater.Delay = 210
LUI.UIButtonRepeater.DelayReduction = 25
LUI.UIButtonRepeater.AccelInterval = 150
LUI.UIButtonRepeater.MinDelay = 135
LUI.UIButtonRepeater.new = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new()
	self.id = "LUIButtonRepeater"
	self:setPriority( -1000 )
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
	self.buttonName = f1_arg0
	if type( f1_arg1 ) == "string" then
		self.event = {
			name = f1_arg1,
			buttonRepeat = true
		}
	else
		f1_arg1.buttonRepeat = true
		self.event = f1_arg1
	end
	self.eventTarget = f1_arg2
	self.firstDelay = LUI.UIButtonRepeater.FirstDelay
	self.delay = LUI.UIButtonRepeater.Delay
	self.delayReduction = LUI.UIButtonRepeater.DelayReduction
	self.accelInterval = LUI.UIButtonRepeater.AccelInterval
	self.minDelay = LUI.UIButtonRepeater.MinDelay
	self.handleGamepadButton = LUI.UIButtonRepeater.HandleGamepadButton
	self.cancelRepetition = LUI.UIButtonRepeater.CancelRepetition
	self.sendButtonRepeat = LUI.UIButtonRepeater.SendButtonRepeat
	self.setMinDelay = LUI.UIButtonRepeater.SetMinDelay
	self.enable = LUI.UIButtonRepeater.Enable
	self.disable = LUI.UIButtonRepeater.Disable
	if not Engine.IsConsoleGame() then
		self:addEventHandler( "leftmousedown", LUI.UIButtonRepeater.LeftMouseDown )
		self:addEventHandler( "leftmouseup", LUI.UIButtonRepeater.LeftMouseUp )
		self:setHandleMouseButton( true )
	end
	self:registerEventHandler( "repeat", LUI.UIButtonRepeater.Repeat )
	self:registerEventHandler( "accelerate", LUI.UIButtonRepeater.Accelerate )
	return self
end

LUI.UIButtonRepeater.Enable = function ( f2_arg0 )
	f2_arg0.m_disabled = false
end

LUI.UIButtonRepeater.Disable = function ( f3_arg0 )
	f3_arg0.m_disabled = true
	f3_arg0:cancelRepetition()
end

LUI.UIButtonRepeater.SetMinDelay = function ( f4_arg0, f4_arg1 )
	f4_arg0.minDelay = math.max( 1, f4_arg1 )
end

LUI.UIButtonRepeater.LeftMouseDown = function ( f5_arg0, f5_arg1 )
	if "leftmouse" == f5_arg0.buttonName and not f5_arg1.buttonRepeat then
		f5_arg0:cancelRepetition()
		if f5_arg0.m_disabled then
			return false
		end
		f5_arg0.controller = f5_arg1.controller
		local self = LUI.UITimer.new( f5_arg0.firstDelay, {
			name = "repeat",
			numRepeats = 1
		} )
		f5_arg0:addElement( self )
		f5_arg0.repeatTimer = self
	end
end

LUI.UIButtonRepeater.LeftMouseUp = function ( f6_arg0, f6_arg1 )
	if "leftmouse" == f6_arg0.buttonName and not f6_arg1.buttonRepeat then
		f6_arg0:cancelRepetition()
	end
end

LUI.UIButtonRepeater.HandleGamepadButton = function ( f7_arg0, f7_arg1 )
	if LUI.UIElement.handleGamepadButton( f7_arg0, f7_arg1 ) then
		return true
	elseif f7_arg1.button == f7_arg0.buttonName and not f7_arg1.buttonRepeat then
		f7_arg0:cancelRepetition()
		if f7_arg0.m_disabled then
			return false
		elseif f7_arg1.down == true then
			f7_arg0.controller = f7_arg1.controller
			local self = LUI.UITimer.new( f7_arg0.firstDelay, {
				name = "repeat",
				numRepeats = 1
			} )
			self.id = "repeatTimerID"
			f7_arg0:addElement( self )
			f7_arg0.repeatTimer = self
		end
	end
end

LUI.UIButtonRepeater.CancelRepetition = function ( f8_arg0 )
	local f8_local0 = f8_arg0.repeatTimer
	if f8_local0 ~= nil then
		f8_local0:close()
		f8_arg0.repeatTimer = nil
	end
	local f8_local1 = f8_arg0.accelTimer
	if f8_local1 ~= nil then
		f8_local1:close()
		f8_arg0.accelTimer = nil
	end
	f8_arg0.currentDelay = nil
end

LUI.UIButtonRepeater.SendButtonRepeat = function ( f9_arg0 )
	local f9_local0 = f9_arg0.eventTarget
	if f9_local0 == nil then
		f9_local0 = f9_arg0:getParent()
	end
	local f9_local1 = f9_arg0.event
	f9_local1.controller = f9_arg0.controller
	return f9_local0:processEvent( f9_local1 )
end

LUI.UIButtonRepeater.Repeat = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0.repeatTimer
	local f10_local1 = f10_arg1.numRepeats
	if f10_arg0.currentDelay == nil then
		f10_local0.interval = f10_arg0.delay
		if f10_arg0.accelTimer == nil then
			local accelTimer = LUI.UITimer.new( f10_arg0.accelInterval, "accelerate" )
			accelTimer.id = "accelerateTimerID"
			f10_arg0:addElement( accelTimer )
			f10_arg0.accelTimer = accelTimer
			
		end
	else
		f10_local0.interval = f10_arg0.currentDelay
	end
	if f10_arg0:isInputDisabledOnChain() then
		f10_arg0:cancelRepetition()
	else
		f10_arg0:sendButtonRepeat()
		f10_arg1.numRepeats = f10_local1 + 1
	end
end

LUI.UIButtonRepeater.Accelerate = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg0.currentDelay
	if f11_local0 == nil then
		f11_local0 = f11_arg0.delay
	else
		f11_local0 = f11_local0 - f11_arg0.delayReduction
		if f11_local0 < f11_arg0.minDelay then
			f11_local0 = f11_arg0.minDelay
		end
	end
	f11_arg0.currentDelay = f11_local0
end

