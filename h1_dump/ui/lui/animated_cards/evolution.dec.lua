local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Evolution = {}
LUI.Playercard.Evolution.runAnimations = function ( f1_arg0 )
	f1_arg0.torso:animateInSequence( f1_arg0.torso.animTable )
	f1_arg0.head1:animateInSequence( f1_arg0.head1.animTable )
	f1_arg0.headContainer:animateInSequence( f1_arg0.headContainer.animTable )
end

LUI.Playercard.Evolution.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_evolution_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_evolution_layer_04" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 105
	
	local torso = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -37,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	self:addElement( torso )
	self.torso = torso
	
	torso:registerAnimationState( "hide", {
		alpha = 0,
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -37,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	torso:registerAnimationState( "show", {
		alpha = 1,
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -37,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	torso.animTable = {
		{
			"hide",
			1
		},
		{
			"show",
			599
		},
		{
			"hide",
			600
		},
		{
			"show",
			599
		},
		{
			"hide",
			600
		},
		{
			"show",
			599
		},
		{
			"hide",
			600
		},
		{
			"show",
			599
		},
		{
			"hide",
			600
		}
	}
	
	local headContainer = LUI.UIElement.new( {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 0,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	self:addElement( headContainer )
	self.headContainer = headContainer
	
	headContainer:registerAnimationState( "high", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 0,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	headContainer:registerAnimationState( "low", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -1,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	headContainer.animTable = {
		{
			"high",
			1
		},
		{
			"low",
			599
		},
		{
			"high",
			600
		},
		{
			"low",
			599
		},
		{
			"high",
			600
		},
		{
			"low",
			599
		},
		{
			"high",
			600
		},
		{
			"low",
			599
		},
		{
			"high",
			600
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_evolution_layer_03" )
	local f2_local9, head1 = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local9 / head1
	f2_local6 = 52
	headContainer:addElement( LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		right = -42,
		bottom = -17,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} ) )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_evolution_layer_02" )
	local head1, f2_local11 = GetMaterialDimensions( f2_local2 )
	f2_local5 = head1 / f2_local11
	f2_local6 = 52
	
	head1 = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		right = -42,
		bottom = -17,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	headContainer:addElement( head1 )
	self.head1 = head1
	
	head1:registerAnimationState( "hide", {
		alpha = 0
	} )
	head1:registerAnimationState( "show", {
		alpha = 1
	} )
	head1.animTable = {
		{
			"hide",
			1
		},
		{
			"hide",
			2399
		},
		{
			"show",
			1
		},
		{
			"show",
			2399
		}
	}
	LUI.Playercard.Evolution.runAnimations( self )
	self:addElement( LUI.UITimer.new( 4800, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Evolution.runAnimations )
	return self
end

LockTable( _M )
