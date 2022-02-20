LUI.UIImage = InheritFrom( LUI.UIElement )
LUI.UIImage.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIImage.new()
end

LUI.UIImage.new = function ( f2_arg0 )
	local self = LUI.UIElement.new( f2_arg0 )
	self:setClass( LUI.UIImage )
	self:setupUIImage()
	return self
end

LUI.UIImage.id = "LUIImage"
