local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
LUI.H1BoxDeco = {}
LUI.H1CrossDeco = {}
LUI.H1Cross = {}
LUI.H1Cross.Width = 50
LUI.H1Cross.Height = 50
LUI.H1BoxDeco.new = function ( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {}
	end
	local self = LUI.UIImage.new()
	if f1_arg0 then
		self.id = f1_arg0.id
	end
	local f1_local1 = true
	if f1_arg1.bottomAnchor ~= nil then
		f1_local1 = f1_arg1.bottomAnchor
	end
	local f1_local2 = true
	if f1_arg1.rightAnchor ~= nil then
		f1_local2 = f1_arg1.rightAnchor
	end
	local f1_local3 = self
	local f1_local4 = self.registerAnimationState
	local f1_local5 = "default"
	local f1_local6 = {
		material = RegisterMaterial( "h1_bg_option_popupbox" ),
		topAnchor = true,
		bottomAnchor = f1_local1,
		leftAnchor = true,
		rightAnchor = f1_local2
	}
	local f1_local7 = f1_arg1.decoTopOffset
	if not f1_local7 then
		f1_local7 = 0
	end
	f1_local6.top = f1_local7
	f1_local7 = f1_arg1.decoBottomOffset
	if not f1_local7 then
		f1_local7 = 0
	end
	f1_local6.bottom = f1_local7
	f1_local7 = f1_arg1.decoLeftOffset
	if not f1_local7 then
		f1_local7 = 0
	end
	f1_local6.left = f1_local7
	f1_local7 = f1_arg1.decoRightOffset
	if not f1_local7 then
		f1_local7 = 0
	end
	f1_local6.right = f1_local7
	f1_local4( f1_local3, f1_local5, f1_local6 )
	self:setup3SliceRatio()
	f1_local4 = CoD.CreateState( 0, -0.5, 8, -0.5, CoD.AnchorTypes.BottomLeft )
	f1_local4.color = Colors.h1.light_grey
	self:addElement( LUI.UILine.new( f1_local4 ) )
	f1_local5 = CoD.CreateState( 0, -0.5, -8, -0.5, CoD.AnchorTypes.BottomRight )
	f1_local5.color = Colors.h1.light_grey
	self:addElement( LUI.UILine.new( f1_local5 ) )
	self:animateToState( "default" )
	return self
end

LUI.H1CrossDeco.new = function ( f2_arg0, f2_arg1 )
	if not f2_arg1 then
		f2_arg1 = {}
	end
	local self = LUI.UIElement.new()
	if f2_arg0 then
		self.id = f2_arg0.id
	end
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = f2_arg1.decoTopOffset or 0,
		bottom = f2_arg1.decoBottomOffset or 0,
		left = f2_arg1.decoLeftOffset or 0,
		right = f2_arg1.decoRightOffset or 0
	} )
	self:animateToState( "default" )
	self:addElement( LUI.H1Cross.new( {
		topAnchor = true,
		leftAnchor = true,
		zRot = 270
	} ) )
	self:addElement( LUI.H1Cross.new( {
		topAnchor = true,
		rightAnchor = true,
		zRot = 180
	} ) )
	self:addElement( LUI.H1Cross.new( {
		bottomAnchor = true,
		rightAnchor = true,
		zRot = 90
	} ) )
	self:addElement( LUI.H1Cross.new( {
		bottomAnchor = true,
		leftAnchor = true,
		zRot = 0
	} ) )
	return self
end

LUI.H1Cross.new = function ( f3_arg0 )
	if not f3_arg0 then
		f3_arg0 = {}
	end
	local self = LUI.UIImage.new()
	self:registerAnimationState( "default", {
		topAnchor = f3_arg0.topAnchor or false,
		leftAnchor = f3_arg0.leftAnchor or false,
		bottomAnchor = f3_arg0.bottomAnchor or false,
		rightAnchor = f3_arg0.rightAnchor or false,
		top = -LUI.H1Cross.Height / 2,
		height = LUI.H1Cross.Height,
		left = -LUI.H1Cross.Width / 2,
		width = LUI.H1Cross.Width,
		zRot = f3_arg0.zRot or 0,
		material = RegisterMaterial( "h1_deco_cross" )
	} )
	self:animateToState( "default" )
	return self
end

LUI.H1BoxDeco.build = function ( f4_arg0, f4_arg1, f4_arg2 )
	return LUI.H1BoxDeco.new( f4_arg0, f4_arg1 )
end

LUI.H1CrossDeco.build = function ( f5_arg0, f5_arg1, f5_arg2 )
	return LUI.H1CrossDeco.new( f5_arg0, f5_arg1 )
end

LUI.MenuBuilder.registerType( "h1_box_deco", LUI.H1BoxDeco.build )
LUI.MenuBuilder.registerType( "h1_cross_deco", LUI.H1CrossDeco.build )
LockTable( _M )
