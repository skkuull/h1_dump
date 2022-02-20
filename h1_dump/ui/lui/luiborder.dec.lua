LUI.UIBorder = InheritFrom( LUI.UIElement )
LUI.UIBorder.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIBorder.new()
end

LUI.UIBorder.new = function ( f2_arg0 )
	local self = LUI.UIElement.new( f2_arg0 )
	self:setClass( LUI.UIBorder )
	self:setupUIBorder()
	return self
end

LUI.UIImage.id = "LUIImage"
