LUI.UICountdown = InheritFrom( LUI.UIElement )
LUI.UICountdown.build = function ( f1_arg0, f1_arg1 )
	return LUI.UICountdown.new( f1_arg1 )
end

LUI.UICountdown.postbuild = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg2 and f2_arg2.textStyle then
		f2_arg0:setTextStyle( f2_arg2.textStyle )
	end
end

LUI.UICountdown.new = function ( f3_arg0 )
	local self = LUI.UIElement.new()
	if not f3_arg0 then
		f3_arg0 = {}
	end
	if LUI.UIElement.setupUICountdown ~= nil then
		if f3_arg0.endTime == "round_end" then
			self:setupUICountdown()
		else
			self:setupUICountdown( f3_arg0.endTime or 0 )
		end
	end
	self:setClass( LUI.UICountdown )
	self.m_decimals = true
	return self
end

LUI.UICountdown.freeze = function ( f4_arg0 )
	f4_arg0.m_frozen = true
end

LUI.UICountdown.unfreeze = function ( f5_arg0 )
	f5_arg0.m_frozen = false
end

LUI.UICountdown.setEndTime = function ( f6_arg0, f6_arg1 )
	if LUI.UIElement.setEndTimeInC ~= nil then
		f6_arg0:setEndTimeInC( f6_arg1 )
	end
end

LUI.UICountdown.setTextStyle = function ( f7_arg0, f7_arg1 )
	f7_arg0.m_textStyle = f7_arg1
end

LUI.UICountdown.id = "LUICountdown"
