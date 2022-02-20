LUI.UISequence = InheritFrom( LUI.UIElement )
LUI.UISequence.new = function ( f1_arg0 )
	local self = LUI.UIElement.new()
	self:setClass( LUI.UISequence )
	local self = LUI.UITimer.new( 100, "sequence_tick" )
	self.id = "timer"
	self:addElement( self )
	self:reset()
	self:registerEventHandler( "sequence_tick", function ( element, event )
		if element.stopped then
			return 
		elseif #f1_arg0 < 1 then
			return 
		end
		element.clock = element.clock + 100
		if f1_arg0[element.nextStep].delay <= element.clock then
			f1_arg0[element.nextStep].action()
			element.nextStep = 1 + element.nextStep % #f1_arg0
			element.clock = 0
		end
	end )
	return self
end

LUI.UISequence.reset = function ( f3_arg0 )
	f3_arg0.nextStep = 1
	f3_arg0.clock = 0
end

LUI.UISequence.stop = function ( f4_arg0 )
	f4_arg0.stopped = true
	f4_arg0:reset()
end

LUI.UISequence.start = function ( f5_arg0 )
	f5_arg0.stopped = false
end

