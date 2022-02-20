LUI.UILongCountdown = InheritFrom( LUI.UIElement )
LUI.UILongCountdown.build = function ( f1_arg0, f1_arg1 )
	return LUI.UILongCountdown.new( f1_arg1.end_time )
end

LUI.UILongCountdown.new = function ( menu, controller )
	local self = LUI.UIElement.new( controller )
	if LUI.UIElement.setupUILongCountdown ~= nil then
		self:setupUILongCountdown( menu )
	end
	self:setClass( LUI.UILongCountdown )
	self.setEndTime = LUI.UILongCountdown.setEndTime
	if menu then
		self:setEndTime( menu )
	end
	return self
end

LUI.UILongCountdown.setEndTime = function ( f3_arg0, f3_arg1 )
	if LUI.UIElement.setEndTimeInC ~= nil then
		f3_arg0:setEndTimeInC( f3_arg1 )
	end
end

LUI.UILongCountdown.id = "LUICountdown"
