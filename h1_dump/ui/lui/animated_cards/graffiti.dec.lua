local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Graffiti = {}
LUI.Playercard.Graffiti.runAnimations = function ( f1_arg0 )
	f1_arg0.artistContainer:animateInSequence( f1_arg0.artistContainer.animTable )
	f1_arg0.graffiti1:animateInSequence( f1_arg0.graffiti1.animTable )
	f1_arg0.graffiti2:animateInSequence( f1_arg0.graffiti2.animTable )
	f1_arg0.graffiti3:animateInSequence( f1_arg0.graffiti3.animTable )
	f1_arg0.graffiti4:animateInSequence( f1_arg0.graffiti4.animTable )
	f1_arg0.graffiti5:animateInSequence( f1_arg0.graffiti5.animTable )
	f1_arg0.graffiti6:animateInSequence( f1_arg0.graffiti6.animTable )
	f1_arg0.graffiti7:animateInSequence( f1_arg0.graffiti7.animTable )
	f1_arg0.graffiti8:animateInSequence( f1_arg0.graffiti8.animTable )
	f1_arg0.graffiti9:animateInSequence( f1_arg0.graffiti9.animTable )
	f1_arg0.sprayDot:animateInSequence( f1_arg0.sprayDot.animTable )
end

LUI.Playercard.Graffiti.new = function ()
	local f2_local0 = 650
	local f2_local1 = 1300
	local f2_local2 = 11
	local f2_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local3.material = RegisterAndCacheMaterial( "em_bg_graffiti_layer_01" )
	local self = LUI.UIImage.new( f2_local3 )
	local f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_02" )
	local f2_local6, f2_local7 = GetMaterialDimensions( f2_local5 )
	local f2_local8 = f2_local6 / f2_local7
	local f2_local9 = 107
	
	local graffiti1 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 52,
		bottom = 24.5,
		height = f2_local9,
		width = f2_local9 * f2_local8
	} )
	self:addElement( graffiti1 )
	self.graffiti1 = graffiti1
	
	graffiti1:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti1:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti1.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_03" )
	local graffiti2, f2_local12 = GetMaterialDimensions( f2_local5 )
	
	graffiti2 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 59,
		bottom = 25,
		height = f2_local9,
		width = f2_local9 * graffiti2 / f2_local12
	} )
	self:addElement( graffiti2 )
	self.graffiti2 = graffiti2
	
	graffiti2:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti2:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti2.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 2.5
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_04" )
	local graffiti3, f2_local14 = GetMaterialDimensions( f2_local5 )
	
	graffiti3 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 40,
		bottom = 24.5,
		height = f2_local9,
		width = f2_local9 * graffiti3 / f2_local14
	} )
	self:addElement( graffiti3 )
	self.graffiti3 = graffiti3
	
	graffiti3:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti3:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti3.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 3.5
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_05" )
	local graffiti4, f2_local16 = GetMaterialDimensions( f2_local5 )
	
	graffiti4 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 54,
		bottom = 24,
		height = f2_local9,
		width = f2_local9 * graffiti4 / f2_local16
	} )
	self:addElement( graffiti4 )
	self.graffiti4 = graffiti4
	
	graffiti4:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti4:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti4.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 4.5
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_06" )
	local graffiti5, f2_local18 = GetMaterialDimensions( f2_local5 )
	
	graffiti5 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 57,
		bottom = 24,
		height = f2_local9,
		width = f2_local9 * graffiti5 / f2_local18
	} )
	self:addElement( graffiti5 )
	self.graffiti5 = graffiti5
	
	graffiti5:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti5:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti5.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 5
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_07" )
	local graffiti6, f2_local20 = GetMaterialDimensions( f2_local5 )
	
	graffiti6 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 17,
		bottom = 24,
		height = f2_local9,
		width = f2_local9 * graffiti6 / f2_local20
	} )
	self:addElement( graffiti6 )
	self.graffiti6 = graffiti6
	
	graffiti6:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti6:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti6.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 6.1
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_08" )
	local graffiti7, f2_local22 = GetMaterialDimensions( f2_local5 )
	
	graffiti7 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 17,
		bottom = 24,
		height = f2_local9,
		width = f2_local9 * graffiti7 / f2_local22
	} )
	self:addElement( graffiti7 )
	self.graffiti7 = graffiti7
	
	graffiti7:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti7:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti7.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 7
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_09" )
	local graffiti8, f2_local24 = GetMaterialDimensions( f2_local5 )
	
	graffiti8 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 17,
		bottom = 24,
		height = f2_local9,
		width = f2_local9 * graffiti8 / f2_local24
	} )
	self:addElement( graffiti8 )
	self.graffiti8 = graffiti8
	
	graffiti8:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti8:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti8.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 7.25
		},
		{
			"on",
			f2_local1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_10" )
	local graffiti9, f2_local26 = GetMaterialDimensions( f2_local5 )
	
	graffiti9 = LUI.UIImage.new( {
		material = f2_local5,
		leftAnchor = true,
		bottomAnchor = true,
		left = 23,
		bottom = 23.5,
		height = f2_local9,
		width = f2_local9 * graffiti9 / f2_local26
	} )
	self:addElement( graffiti9 )
	self.graffiti9 = graffiti9
	
	graffiti9:registerAnimationState( "on", {
		alpha = 1
	} )
	graffiti9:registerAnimationState( "off", {
		alpha = 0
	} )
	graffiti9.animTable = {
		{
			"off",
			1
		},
		{
			"off",
			f2_local0 * 8.25
		},
		{
			"on",
			f2_local1
		}
	}
	
	local artistContainer = LUI.UIElement.new( {
		leftAnchor = true,
		bottomAnchor = true,
		left = 40,
		bottom = -20,
		height = 1,
		width = 1
	} )
	self:addElement( artistContainer )
	self.artistContainer = artistContainer
	
	local f2_local28 = -2
	local f2_local29 = -5
	local f2_local30 = -56
	local f2_local31 = 76
	local f2_local32 = 63
	local f2_local33 = 18
	artistContainer:registerAnimationState( "1", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31,
		bottom = f2_local28,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "2", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local32,
		bottom = f2_local30,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "3", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31,
		bottom = f2_local29,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "4", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 1,
		bottom = f2_local30,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "5", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 2,
		bottom = f2_local29,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "6", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 3,
		bottom = f2_local30,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "7", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 4,
		bottom = f2_local29,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "8", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 5,
		bottom = f2_local30,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "9", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 6,
		bottom = f2_local29,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "10", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 7,
		bottom = f2_local30,
		height = 1,
		width = 1
	} )
	artistContainer:registerAnimationState( "11", {
		leftAnchor = true,
		bottomAnchor = true,
		left = f2_local31 + f2_local33 * 8,
		bottom = f2_local29,
		height = 1,
		width = 1
	} )
	artistContainer.animTable = {
		{
			"1",
			1
		},
		{
			"2",
			f2_local0
		},
		{
			"3",
			f2_local0
		},
		{
			"4",
			f2_local0
		},
		{
			"5",
			f2_local0
		},
		{
			"6",
			f2_local0
		},
		{
			"7",
			f2_local0
		},
		{
			"8",
			f2_local0
		},
		{
			"9",
			f2_local0
		},
		{
			"10",
			f2_local0
		},
		{
			"11",
			f2_local0 - 1
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_11" )
	local sprayDot, f2_local35 = GetMaterialDimensions( f2_local5 )
	f2_local8 = sprayDot / f2_local35
	f2_local9 = 37
	
	sprayDot = LUI.UIImage.new( {
		material = f2_local5,
		height = f2_local9,
		width = f2_local9 * f2_local8
	} )
	artistContainer:addElement( sprayDot )
	self.sprayDot = sprayDot
	
	sprayDot:registerAnimationState( "off", {
		alpha = 0
	} )
	sprayDot:registerAnimationState( "on", {
		alpha = 1
	} )
	sprayDot.animTable = {
		{
			"off",
			50
		},
		{
			"off",
			f2_local0 * 1.15
		},
		{
			"on",
			150
		},
		{
			"on",
			f2_local0 * 8
		},
		{
			"off",
			50
		}
	}
	f2_local5 = RegisterAndCacheMaterial( "em_bg_graffiti_layer_12" )
	local arm, f2_local37 = GetMaterialDimensions( f2_local5 )
	f2_local8 = arm / f2_local37
	f2_local9 = 110
	
	arm = LUI.UIImage.new( {
		material = f2_local5,
		left = -11.5,
		bottom = 95.5,
		height = f2_local9,
		width = f2_local9 * f2_local8
	} )
	artistContainer:addElement( arm )
	self.arm = arm
	
	LUI.Playercard.Graffiti.runAnimations( self )
	self:addElement( LUI.UITimer.new( (f2_local2 - 1) * (f2_local0 + 20), "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.Graffiti.runAnimations )
	return self
end

LockTable( _M )
