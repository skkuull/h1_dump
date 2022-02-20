LUI.UILitImage = InheritFrom( LUI.UIElement )
LUI.UILitImage.build = function ( f1_arg0, f1_arg1 )
	return LUI.UILitImage.new()
end

LUI.UILitImage.new = function ( f2_arg0 )
	local self = LUI.UIElement.new( f2_arg0 )
	self:setClass( LUI.UILitImage )
	self:setupUILitImage()
	return self
end

LUI.UILitImage.id = "LUILitImage"
