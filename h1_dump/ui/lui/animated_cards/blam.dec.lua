local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Blam = {}
function handleFirstBlamComplete( f1_arg0, f1_arg1 )
	f1_arg0.blam1:animateToState( "visible", 0 )
	f1_arg0.flame:animateToState( "visible", 50 )
end

function handleSecondBlamComplete( f2_arg0, f2_arg1 )
	f2_arg0.blam2:animateToState( "visible", 0 )
	f2_arg0.flame:animateToState( "visible", 50 )
end

function handleBlamInvisible( f3_arg0, f3_arg1 )
	f3_arg0.blam1:animateToState( "hidden", 100 )
	f3_arg0.blam2:animateToState( "hidden", 100 )
	f3_arg0.flame:animateToState( "hidden", 0 )
end

function handleBlamNormal( f4_arg0, f4_arg1 )
	f4_arg0.flame:animateToState( "hidden", 0 )
end

LUI.Playercard.Blam.new = function ()
	local f5_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local0.material = RegisterAndCacheMaterial( "em_bg_blam_layer_01" )
	local self = LUI.UIImage.new( f5_local0 )
	local f5_local2 = RegisterAndCacheMaterial( "em_bg_blam_layer_03" )
	local f5_local3, f5_local4 = GetMaterialDimensions( f5_local2 )
	local f5_local5 = f5_local3 / f5_local4
	local f5_local6 = 50
	local self = LUI.UIImage.new( {
		material = f5_local2,
		leftAnchor = true,
		topAnchor = true,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		top = -5,
		alpha = 0
	} )
	local self = LUI.UIImage.new( {
		material = f5_local2,
		leftAnchor = true,
		topAnchor = true,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		top = 13,
		left = 54,
		alpha = 0
	} )
	local f5_local9 = {
		alpha = 0
	}
	local f5_local10 = {
		alpha = 1
	}
	self:registerAnimationState( "hidden", f5_local9 )
	self:registerAnimationState( "visible", f5_local10 )
	self:registerAnimationState( "hidden", f5_local9 )
	self:registerAnimationState( "visible", f5_local10 )
	self:addElement( self )
	self:addElement( self )
	f5_local2 = RegisterAndCacheMaterial( "em_bg_blam_layer_02" )
	local self, f5_local12 = GetMaterialDimensions( f5_local2 )
	f5_local5 = self / f5_local12
	f5_local6 = 55
	self = LUI.UIElement.new( {
		rightAnchor = true,
		topAnchor = true,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		right = 65,
		top = -5
	} )
	self:addElement( LUI.UIImage.new( {
		material = f5_local2,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		rightAnchor = true,
		topAnchor = true,
		right = -50,
		top = 5
	} ) )
	local f5_local13 = {
		rightAnchor = true,
		topAnchor = true,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		right = 65,
		top = -5,
		zRot = 0
	}
	local f5_local14 = {
		rightAnchor = true,
		topAnchor = true,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		right = 63,
		top = 2,
		zRot = -7
	}
	self:registerAnimationState( "normal", f5_local13 )
	self:registerAnimationState( "end", f5_local13 )
	self:registerAnimationState( "shooting1", f5_local14 )
	self:registerAnimationState( "shooting2", f5_local14 )
	self:animateInLoop( {
		{
			"normal",
			220
		},
		{
			"shooting1",
			220
		},
		{
			"normal",
			220
		},
		{
			"shooting2",
			220
		},
		{
			"normal",
			220
		},
		{
			"normal",
			400
		},
		{
			"end",
			1
		}
	}, nil, nil, nil, true )
	self.blam1 = self
	self.blam2 = self
	f5_local2 = RegisterAndCacheMaterial( "em_bg_blam_layer_04" )
	local self, f5_local16 = GetMaterialDimensions( f5_local2 )
	f5_local5 = self / f5_local16
	f5_local6 = 20
	self = LUI.UIImage.new( {
		material = f5_local2,
		rightAnchor = true,
		topAnchor = true,
		width = f5_local6 * f5_local5,
		height = f5_local6,
		right = -151.5,
		top = 24,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.flame = self
	f5_local16 = LUI.FormatAnimStateFinishStepEvent( "shooting1" )
	local f5_local17 = LUI.FormatAnimStateFinishStepEvent( "shooting2" )
	local f5_local18 = LUI.FormatAnimStateFinishStepEvent( "end" )
	local f5_local19 = LUI.FormatAnimStateFinishStepEvent( "normal" )
	self:registerEventHandler( f5_local16, handleFirstBlamComplete )
	self:registerEventHandler( f5_local17, handleSecondBlamComplete )
	self:registerEventHandler( f5_local18, handleBlamInvisible )
	self:registerEventHandler( f5_local19, handleBlamNormal )
	self:addElement( self )
	self:addElement( self )
	return self
end

LockTable( _M )
