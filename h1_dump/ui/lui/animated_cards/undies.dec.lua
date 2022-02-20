local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Undies = {}
LUI.Playercard.Undies.runAnimations = function ( f1_arg0 )
	f1_arg0.cartoonMan1:animateInSequence( f1_arg0.cartoonMan1.animTable )
	f1_arg0.cartoonMan2:animateInSequence( f1_arg0.cartoonMan2.animTable )
	f1_arg0.undies:animateInSequence( f1_arg0.undies.animTable )
	f1_arg0.helmet:animateInSequence( f1_arg0.helmet.animTable )
	f1_arg0.bullet:animateInSequence( f1_arg0.bullet.animTable )
	f1_arg0.hit:animateInSequence( f1_arg0.hit.animTable )
end

LUI.Playercard.Undies.new = function ()
	local f2_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local0.material = RegisterAndCacheMaterial( "em_bg_undies_layer_01" )
	local self = LUI.UIImage.new( f2_local0 )
	local f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_02" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local3 / f2_local4
	local f2_local6 = 110
	
	local cartoonMan1 = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	self:addElement( cartoonMan1 )
	self.cartoonMan1 = cartoonMan1
	
	cartoonMan1:registerAnimationState( "low", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 72,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	cartoonMan1:registerAnimationState( "high", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	cartoonMan1:registerAnimationState( "hide", {
		alpha = 0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	cartoonMan1.animTable = {
		{
			"low",
			1
		},
		{
			"high",
			1199
		},
		{
			"high",
			600
		},
		{
			"hide",
			1
		},
		{
			"hide",
			2749
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_03" )
	local cartoonMan2, f2_local9 = GetMaterialDimensions( f2_local2 )
	f2_local5 = cartoonMan2 / f2_local9
	f2_local6 = 110
	
	cartoonMan2 = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 26.5,
		right = -38,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		alpha = 0
	} )
	self:addElement( cartoonMan2 )
	self.cartoonMan2 = cartoonMan2
	
	cartoonMan2:registerAnimationState( "hide", {
		alpha = 0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 26.5,
		right = -38,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	cartoonMan2:registerAnimationState( "show", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 26.5,
		right = -38,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	cartoonMan2:registerAnimationState( "low", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 73,
		right = -38,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	cartoonMan2.animTable = {
		{
			"hide",
			1
		},
		{
			"hide",
			1801
		},
		{
			"show",
			1
		},
		{
			"show",
			297
		},
		{
			"low",
			150
		},
		{
			"low",
			2300
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_04" )
	local undies, f2_local11 = GetMaterialDimensions( f2_local2 )
	f2_local5 = undies / f2_local11
	f2_local6 = 52
	
	undies = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} )
	self:addElement( undies )
	self.undies = undies
	
	undies:registerAnimationState( "low", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 33,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 0
	} )
	undies:registerAnimationState( "high", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11,
		right = -39,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 0
	} )
	undies:registerAnimationState( "left", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11,
		right = -41,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = 7
	} )
	undies:registerAnimationState( "right", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -6,
		right = -30,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -22
	} )
	undies.animTable = {
		{
			"low",
			1
		},
		{
			"low",
			2249
		},
		{
			"high",
			440
		},
		{
			"right",
			156
		},
		{
			"left",
			156
		},
		{
			"right",
			156
		},
		{
			"left",
			156
		},
		{
			"right",
			156
		},
		{
			"left",
			156
		},
		{
			"high",
			60
		},
		{
			"low",
			420
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_05" )
	local f2_local12, helmet = GetMaterialDimensions( f2_local2 )
	f2_local5 = f2_local12 / helmet
	f2_local6 = 53
	self:addElement( LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 8,
		right = 44,
		height = f2_local6,
		width = f2_local6 * f2_local5
	} ) )
	f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_06" )
	local helmet, f2_local14 = GetMaterialDimensions( f2_local2 )
	f2_local5 = helmet / f2_local14
	f2_local6 = 55
	
	helmet = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -18,
		height = f2_local6,
		right = -40,
		width = f2_local6 * f2_local5
	} )
	self:addElement( helmet )
	self.helmet = helmet
	
	helmet:registerAnimationState( "hide", {
		alpha = 0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -19,
		height = f2_local6,
		right = -40,
		width = f2_local6 * f2_local5,
		zRot = 0
	} )
	helmet:registerAnimationState( "show", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -19,
		height = f2_local6,
		right = -40,
		width = f2_local6 * f2_local5,
		zRot = 0
	} )
	helmet:registerAnimationState( "high", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -19,
		height = f2_local6,
		right = -15,
		width = f2_local6 * f2_local5,
		zRot = -90
	} )
	helmet:registerAnimationState( "low", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 10,
		right = 50,
		height = f2_local6,
		width = f2_local6 * f2_local5,
		zRot = -120
	} )
	helmet.animTable = {
		{
			"hide",
			1
		},
		{
			"hide",
			1801
		},
		{
			"show",
			1
		},
		{
			"show",
			30
		},
		{
			"high",
			100
		},
		{
			"low",
			100
		},
		{
			"low",
			2300
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_07" )
	local bullet, f2_local16 = GetMaterialDimensions( f2_local2 )
	f2_local5 = bullet / f2_local16
	f2_local6 = 27
	
	bullet = LUI.UIImage.new( {
		material = f2_local2,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = -34.5,
		height = f2_local6,
		left = -55,
		width = f2_local6 * f2_local5
	} )
	self:addElement( bullet )
	self.bullet = bullet
	
	bullet:registerAnimationState( "left", {
		alpha = 1,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = -34.5,
		height = f2_local6,
		left = -55,
		width = f2_local6 * f2_local5
	} )
	bullet:registerAnimationState( "right", {
		alpha = 1,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = -34.5,
		height = f2_local6,
		left = 83,
		width = f2_local6 * f2_local5
	} )
	bullet:registerAnimationState( "hide", {
		alpha = 0,
		leftAnchor = true,
		bottomAnchor = true,
		bottom = -34.5,
		height = f2_local6,
		left = 83,
		width = f2_local6 * f2_local5
	} )
	bullet.animTable = {
		{
			"left",
			1
		},
		{
			"left",
			1300
		},
		{
			"right",
			501
		},
		{
			"hide",
			1
		},
		{
			"hide",
			1000
		}
	}
	f2_local2 = RegisterAndCacheMaterial( "em_bg_undies_layer_08" )
	local hit, f2_local18 = GetMaterialDimensions( f2_local2 )
	f2_local5 = hit / f2_local18
	f2_local6 = 55
	
	hit = LUI.UIImage.new( {
		material = f2_local2,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -22,
		height = f2_local6,
		right = -75,
		width = f2_local6 * f2_local5
	} )
	self:addElement( hit )
	self.hit = hit
	
	hit:registerAnimationState( "hide", {
		alpha = 0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -22,
		height = f2_local6,
		right = -75,
		width = f2_local6 * f2_local5
	} )
	hit:registerAnimationState( "show", {
		alpha = 1,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -22,
		height = f2_local6,
		right = -75,
		width = f2_local6 * f2_local5
	} )
	hit.animTable = {
		{
			"hide",
			1
		},
		{
			"hide",
			1800
		},
		{
			"show",
			180
		},
		{
			"hide",
			1
		},
		{
			"hide",
			1000
		}
	}
	LUI.Playercard.Undies.runAnimations( self )
	self:addElement( LUI.UITimer.new( 5000, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Undies.runAnimations )
	return self
end

LockTable( _M )
