local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Mythic = {}
LUI.Playercard.Mythic.runAnimations = function ( f1_arg0 )
	f1_arg0.frontwingContainer:animateInSequence( f1_arg0.frontwingContainer.animTable )
	f1_arg0.backwingContainer:animateInSequence( f1_arg0.backwingContainer.animTable )
end

LUI.Playercard.Mythic.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_mythic_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_mythic_layer_02" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = CoD.CreateState( nil, -19, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local6.height = 100
	f2_local6.width = f2_local6.height * f2_local5
	f2_local6.material = f2_local2
	self:addElement( LUI.UIImage.new( f2_local6 ) )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_mythic_layer_03" )
	local f2_local7, f2_local8 = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local7 / f2_local8
	f2_local7 = CoD.CreateState( nil, 19, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local7.height = 53
	f2_local7.width = f2_local7.height * f2_local5
	f2_local7.material = f2_local2
	self:addElement( LUI.UIImage.new( f2_local7 ) )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_mythic_layer_06" )
	local f2_local9, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local9 / self
	f2_local9 = CoD.CreateState( -73, -64, nil, nil, CoD.AnchorTypes.TopRight )
	f2_local9.height = 105
	f2_local9.width = f2_local9.height * f2_local5
	f2_local9.material = f2_local2
	self = LUI.UIImage.new( f2_local9 )
	local f2_local11 = CoD.CreateState( 115, 40, nil, nil, CoD.AnchorTypes.All )
	f2_local11.zRot = 0
	
	local backwingContainer = LUI.UIElement.new( f2_local11 )
	backwingContainer:addElement( self )
	self:addElement( backwingContainer )
	self.backwingContainer = backwingContainer
	
	backwingContainer:registerAnimationState( "up", {
		zRot = 5
	} )
	backwingContainer:registerAnimationState( "down", {
		zRot = -30
	} )
	backwingContainer.animTable = {
		{
			"down",
			900
		},
		{
			"up",
			425
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_mythic_layer_04" )
	local f2_local13, f2_local14 = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local13 / f2_local14
	f2_local13 = CoD.CreateState( nil, -23, 40, nil, CoD.AnchorTypes.TopRight )
	f2_local13.height = 105
	f2_local13.width = f2_local13.height * f2_local5
	f2_local13.material = f2_local2
	self:addElement( LUI.UIImage.new( f2_local13 ) )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_mythic_layer_05" )
	local f2_local15, self = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local15 / self
	f2_local15 = CoD.CreateState( -110, -86, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local15.height = 108
	f2_local15.width = f2_local15.height * f2_local5
	f2_local15.material = f2_local2
	self = LUI.UIImage.new( f2_local15 )
	local f2_local17 = CoD.CreateState( 74, 47, nil, nil, CoD.AnchorTypes.All )
	f2_local17.zRot = 0
	
	local frontwingContainer = LUI.UIElement.new( f2_local17 )
	frontwingContainer:addElement( self )
	self:addElement( frontwingContainer )
	self.frontwingContainer = frontwingContainer
	
	frontwingContainer:registerAnimationState( "up", {
		zRot = -11
	} )
	frontwingContainer:registerAnimationState( "down", {
		zRot = 23
	} )
	frontwingContainer.animTable = {
		{
			"down",
			950
		},
		{
			"up",
			425
		}
	}
	LUI.Playercard.Mythic.runAnimations( self )
	self:addElement( LUI.UITimer.new( 1375, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Mythic.runAnimations )
	return self
end

LockTable( _M )
