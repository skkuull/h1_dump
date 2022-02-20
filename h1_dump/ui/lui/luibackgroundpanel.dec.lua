LUI.UIBackgroundPanel = InheritFrom( LUI.UIElement )
LUI.UIBackgroundPanel.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIBackgroundPanel.new( nil, f1_arg1 )
end

LUI.UIBackgroundPanel.new = function ( f2_arg0, f2_arg1 )
	if not f2_arg1 then
		f2_arg1 = {}
	end
	if not f2_arg0 then
		f2_arg0 = {}
	end
	f2_arg0.material = RegisterMaterial( "black" )
	f2_arg0.alpha = 0.5
	local self = LUI.UIImage.new( f2_arg0 )
	self:setClass( LUI.UIBackgroundPanel )
	return self
end

LUI.UIBackgroundPanel.id = "LUIBackgroundPanel"
