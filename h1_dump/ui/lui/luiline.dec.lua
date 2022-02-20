LUI.UILine = InheritFrom( LUI.UIElement )
LUI.UILine.build = function ( f1_arg0, f1_arg1 )
	return LUI.UILine.new()
end

LUI.UILine.new = function ( f2_arg0 )
	local self = LUI.UIElement.new( f2_arg0 )
	self:setClass( LUI.UILine )
	self:setupUILine()
	return self
end

