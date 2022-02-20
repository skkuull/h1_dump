LUI.UITimer = {}
local f0_local0 = {}
Queue = {
	new = function ()
		local f1_local0 = {
			first = 0,
			last = -1
		}
		setmetatable( f1_local0, Queue )
		Queue.__index = Queue
		return f1_local0
	end,
	push = function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0.last + 1
		f2_arg0.last = f2_local0
		f2_arg0[f2_local0] = f2_arg1
	end,
	pop = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0.first
		if f3_arg0.last < f3_local0 then
			return nil
		else
			local f3_local1 = f3_arg0[f3_local0]
			f3_arg0[f3_local0] = nil
			f3_arg0.first = f3_local0 + 1
			return f3_local1
		end
	end
}
LUI.UITimer.build = function ( f4_arg0, f4_arg1 )
	assert( f4_arg1.interval, "No property for interval set for timer" )
	assert( f4_arg1.event, "No property for event set for timer" )
	return LUI.UITimer.new( f4_arg1.interval, f4_arg1.event, f4_arg1.group, f4_arg1.disposable, f4_arg1.eventTarget, f4_arg1.broadcastToRoot, f4_arg1.stopped )
end

LUI.UITimer.new = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7 )
	local self = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 1,
		bottom = 1,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	self:setPriority( LUI.UIRoot.childPriorities.timer )
	self:setupUITimer()
	self.enable = true
	self.interval = math.max( 1, f5_arg0 )
	self.disposable = f5_arg3
	if f5_arg7 == nil then
		f5_arg7 = true
	end
	self.loop = f5_arg7
	self.deferNextFrame = f5_arg5
	if type( f5_arg1 ) == "string" then
		self.timerEvent = {
			name = f5_arg1,
			timer = self
		}
	else
		f5_arg1.timer = self
		self.timerEvent = f5_arg1
	end
	self.timerEventTarget = f5_arg4
	self.timerGroup = f5_arg2
	local f5_local1 = "TE_" .. (self.timerGroup and self.timerGroup .. "_" or "") .. self.timerEvent.name
	self.profileID = profile.lookupusereventid( f5_local1 ) or profile.createuserevent( f5_local1, "duration" )
	if not f5_arg6 then
		LUI.UITimer.Reset( self )
	end
	self:registerEventHandler( "enable", LUI.UITimer.Enable )
	self:registerEventHandler( "disable", LUI.UITimer.Disable )
	return self
end

LUI.UITimer.Reset = function ( f6_arg0 )
	f6_arg0:registerEventHandler( "transition_complete_default", nil )
	f6_arg0:animateToState( "default", f6_arg0.interval )
	f6_arg0:registerEventHandler( "transition_complete_default", LUI.UITimer.Tick )
end

LUI.UITimer.Stop = function ( f7_arg0 )
	f7_arg0:registerEventHandler( "transition_complete_default", nil )
	f7_arg0:animateToState( "default", 0 )
end

LUI.UITimer.Enable = function ( f8_arg0, f8_arg1 )
	f8_arg0.disabled = nil
end

LUI.UITimer.Disable = function ( f9_arg0, f9_arg1 )
	f9_arg0.disabled = true
end

LUI.UITimer.Tick = function ( f10_arg0, f10_arg1 )
	local f10_local0 = nil
	if f10_arg0.enable ~= true then
		return 
	elseif f10_arg0.disabled then
		LUI.UITimer.Reset( f10_arg0 )
		return 
	elseif f10_arg0.timerEventTarget ~= nil then
		f10_local0 = f10_arg0.timerEventTarget
	else
		f10_local0 = f10_arg0:getParent()
	end
	local f10_local1 = f10_arg0.timerEvent
	f10_local1.timeElapsed = f10_arg0.interval + f10_arg1.lateness
	if f10_arg0.timerGroup then
		f10_local1.target = f10_local0
		local f10_local2 = f10_arg0:getRootParent()
		local f10_local3 = f10_arg0.timerGroup
		if not f10_local2.timerGroupQueues[f10_local3] then
			f10_local2.timerGroupQueues[f10_local3] = Queue.new()
		end
		f10_local2.timerGroupQueues[f10_local3]:push( f10_local1 )
	else
		if not f10_arg0.deferNextFrame and Engine.IsMainThread() then
			profile.beginuserevent( f10_arg0.profileID )
			f10_local0:processEvent( f10_local1 )
			profile.enduserevent( f10_arg0.profileID )
		else
			f10_local1.target = f10_local0
			f10_local1.noDuplicates = true
			f10_arg0:dispatchEventToRoot( f10_local1 )
		end
		if f10_arg0.disposable then
			f10_arg0:close()
		elseif f10_arg0.loop then
			LUI.UITimer.Reset( f10_arg0 )
		else
			LUI.UITimer.Stop( f10_arg0 )
		end
	end
end

LUI.UITimer.DispatchEventsFromQueue = function ( f11_arg0 )
	for f11_local4, f11_local5 in pairs( f11_arg0.timerGroupQueues ) do
		local f11_local6 = f11_local5:pop()
		if f11_local6 then
			profile.beginuserevent( f11_local6.timer.profileID )
			f11_local6.target:processEvent( f11_local6 )
			profile.enduserevent( f11_local6.timer.profileID )
			local f11_local3 = f11_local6.timer
			if f11_local3.disposable then
				f11_local3:close()
			else
				LUI.UITimer.Reset( f11_local3 )
			end
		end
	end
end

