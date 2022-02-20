local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.StandOff = {}
LUI.Playercard.StandOff.runAnimations = function ( f1_arg0 )
	f1_arg0.gun:animateInSequence( f1_arg0.gun.animTable )
	f1_arg0.hand1:animateInSequence( f1_arg0.hand1.animTable )
	f1_arg0.hand2:animateInSequence( f1_arg0.hand2.animTable )
	f1_arg0.hand3:animateInSequence( f1_arg0.hand3.animTable )
	f1_arg0.hand4:animateInSequence( f1_arg0.hand4.animTable )
	f1_arg0.hand5:animateInSequence( f1_arg0.hand5.animTable )
	f1_arg0.holster1:animateInSequence( f1_arg0.holster1.animTable )
	f1_arg0.holster2:animateInSequence( f1_arg0.holster2.animTable )
	f1_arg0.shot:animateInSequence( f1_arg0.shot.animTable )
end

LUI.Playercard.StandOff.buildGunAnims = function ( f2_arg0 )
	local f2_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_02" )
	local f2_local1, f2_local2 = GetMaterialDimensions( f2_local0 )
	local f2_local3 = f2_local1 / f2_local2
	local f2_local4 = 54
	local f2_local5 = {
		material = f2_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 14,
		right = -32.5,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 50
	}
	local f2_local6 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 8.5,
		right = 10.5,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 25
	}
	local f2_local7 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 7.75,
		right = 17,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 82
	}
	local f2_local8 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -1.5,
		right = 18.5,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 150
	}
	local f2_local9 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -14,
		right = 11,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 232
	}
	local f2_local10 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -5.5,
		right = -9.5,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = -22
	}
	local f2_local11 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 25,
		right = 1,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 75
	}
	local f2_local12 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 18.5,
		right = 34,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 159
	}
	local f2_local13 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -22,
		right = 23,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = -77
	}
	local f2_local14 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -6,
		right = -9,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 44
	}
	local f2_local15 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 7,
		right = -22,
		height = f2_local4,
		width = f2_local4 * f2_local3,
		alpha = 1,
		zRot = 46
	}
	local f2_local16 = {
		alpha = 0
	}
	
	local gun = LUI.UIImage.new( f2_local5 )
	gun:registerAnimationState( "gunState1", f2_local5 )
	gun:registerAnimationState( "gunState2", f2_local6 )
	gun:registerAnimationState( "gunState3", f2_local7 )
	gun:registerAnimationState( "gunState4", f2_local8 )
	gun:registerAnimationState( "gunState5", f2_local9 )
	gun:registerAnimationState( "gunState6", f2_local10 )
	gun:registerAnimationState( "gunState7", f2_local11 )
	gun:registerAnimationState( "gunState8", f2_local12 )
	gun:registerAnimationState( "gunState9", f2_local13 )
	gun:registerAnimationState( "gunState10", f2_local14 )
	gun:registerAnimationState( "gunState11", f2_local15 )
	gun:registerAnimationState( "hidden", f2_local16 )
	f2_arg0:addElement( gun )
	f2_arg0.gun = gun
	
	gun.animTable = {
		{
			"gunState1",
			1
		},
		{
			"gunState1",
			24
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			299
		},
		{
			"gunState2",
			1
		},
		{
			"gunState2",
			9
		},
		{
			"gunState3",
			1
		},
		{
			"gunState3",
			9
		},
		{
			"gunState4",
			1
		},
		{
			"gunState4",
			9
		},
		{
			"gunState5",
			1
		},
		{
			"gunState5",
			9
		},
		{
			"gunState6",
			1
		},
		{
			"gunState6",
			9
		},
		{
			"gunState7",
			1
		},
		{
			"gunState7",
			9
		},
		{
			"gunState8",
			1
		},
		{
			"gunState8",
			9
		},
		{
			"gunState9",
			1
		},
		{
			"gunState9",
			9
		},
		{
			"gunState10",
			1
		},
		{
			"gunState10",
			9
		},
		{
			"gunState11",
			1
		},
		{
			"gunState11",
			9
		},
		{
			"gunState1",
			1
		},
		{
			"gunState1",
			24
		}
	}
end

LUI.Playercard.StandOff.buildHandAnims = function ( f3_arg0 )
	local f3_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_03" )
	local f3_local1, f3_local2 = GetMaterialDimensions( f3_local0 )
	local f3_local3 = f3_local1 / f3_local2
	local f3_local4 = 104
	local f3_local5 = {
		material = f3_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 11.5,
		right = -7.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	f3_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_04" )
	local f3_local6, f3_local7 = GetMaterialDimensions( f3_local0 )
	f3_local3 = f3_local6 / f3_local7
	f3_local4 = 106.5
	f3_local6 = {
		material = f3_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 16,
		right = 50,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	f3_local7 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 15,
		right = 70,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = -15,
		alpha = 1
	}
	f3_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_05" )
	local f3_local8, f3_local9 = GetMaterialDimensions( f3_local0 )
	f3_local3 = f3_local8 / f3_local9
	f3_local4 = 106
	f3_local8 = {
		material = f3_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 21,
		right = 13,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	f3_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_06" )
	local f3_local9, f3_local10 = GetMaterialDimensions( f3_local0 )
	f3_local3 = f3_local9 / f3_local10
	f3_local9 = {
		material = f3_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 21.5,
		right = 13.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	f3_local10 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 19,
		right = 17,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = -4,
		alpha = 1
	}
	f3_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_07" )
	local f3_local11, f3_local12 = GetMaterialDimensions( f3_local0 )
	f3_local3 = f3_local11 / f3_local12
	f3_local11 = {
		material = f3_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 30.5,
		right = 48.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	f3_local12 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 17.5,
		right = 48.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local13 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 9,
		right = 34.25,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local14 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 14,
		right = 22,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local15 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 26,
		right = 22.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local16 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 35,
		right = 34.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local17 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 31,
		right = 49,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local18 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 12,
		right = 43.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local19 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 9.75,
		right = 28.5,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local20 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 14,
		right = 10,
		height = f3_local4,
		width = f3_local4 * f3_local3,
		zRot = 0,
		alpha = 1
	}
	local f3_local21 = {
		alpha = 0
	}
	
	local hand1 = LUI.UIImage.new( f3_local5 )
	
	local hand2 = LUI.UIImage.new( f3_local6 )
	
	local hand3 = LUI.UIImage.new( f3_local8 )
	
	local hand4 = LUI.UIImage.new( f3_local9 )
	
	local hand5 = LUI.UIImage.new( f3_local11 )
	hand1:registerAnimationState( "hand1state1", f3_local5 )
	hand1:registerAnimationState( "hidden", f3_local21 )
	hand2:registerAnimationState( "hand2state1", f3_local6 )
	hand2:registerAnimationState( "hand2state2", f3_local7 )
	hand2:registerAnimationState( "hidden", f3_local21 )
	hand3:registerAnimationState( "hand3state1", f3_local8 )
	hand3:registerAnimationState( "hidden", f3_local21 )
	hand4:registerAnimationState( "hand4state1", f3_local9 )
	hand4:registerAnimationState( "hand4state2", f3_local10 )
	hand4:registerAnimationState( "hidden", f3_local21 )
	hand5:registerAnimationState( "hand5state1", f3_local11 )
	hand5:registerAnimationState( "hand5state2", f3_local12 )
	hand5:registerAnimationState( "hand5state3", f3_local13 )
	hand5:registerAnimationState( "hand5state4", f3_local14 )
	hand5:registerAnimationState( "hand5state5", f3_local15 )
	hand5:registerAnimationState( "hand5state6", f3_local16 )
	hand5:registerAnimationState( "hand5state7", f3_local17 )
	hand5:registerAnimationState( "hand5state8", f3_local18 )
	hand5:registerAnimationState( "hand5state9", f3_local19 )
	hand5:registerAnimationState( "hand5state10", f3_local20 )
	hand5:registerAnimationState( "hidden", f3_local21 )
	f3_arg0:addElement( hand1 )
	f3_arg0.hand1 = hand1
	
	f3_arg0:addElement( hand2 )
	f3_arg0.hand2 = hand2
	
	f3_arg0:addElement( hand3 )
	f3_arg0.hand3 = hand3
	
	f3_arg0:addElement( hand4 )
	f3_arg0.hand4 = hand4
	
	f3_arg0:addElement( hand5 )
	f3_arg0.hand5 = hand5
	
	hand1.animTable = {
		{
			"hand1state1",
			1
		},
		{
			"hand1state1",
			24
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			649
		},
		{
			"hand1state1",
			1
		},
		{
			"hand1state1",
			24
		}
	}
	hand2.animTable = {
		{
			"hidden",
			1
		},
		{
			"hidden",
			24
		},
		{
			"hand2state1",
			1
		},
		{
			"hand2state1",
			49
		},
		{
			"hand2state2",
			1
		},
		{
			"hand2state2",
			49
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			324
		}
	}
	hand3.animTable = {
		{
			"hidden",
			1
		},
		{
			"hidden",
			124
		},
		{
			"hand3state1",
			1
		},
		{
			"hand3state1",
			99
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			224
		}
	}
	hand4.animTable = {
		{
			"hidden",
			1
		},
		{
			"hidden",
			224
		},
		{
			"hand4state1",
			1
		},
		{
			"hand4state1",
			49
		},
		{
			"hand4state2",
			1
		},
		{
			"hand4state2",
			49
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			124
		}
	}
	hand5.animTable = {
		{
			"hidden",
			1
		},
		{
			"hidden",
			324
		},
		{
			"hand5state1",
			1
		},
		{
			"hand5state1",
			9
		},
		{
			"hand5state2",
			1
		},
		{
			"hand5state2",
			9
		},
		{
			"hand5state3",
			1
		},
		{
			"hand5state3",
			9
		},
		{
			"hand5state4",
			1
		},
		{
			"hand5state4",
			9
		},
		{
			"hand5state5",
			1
		},
		{
			"hand5state5",
			9
		},
		{
			"hand5state6",
			1
		},
		{
			"hand5state6",
			9
		},
		{
			"hand5state7",
			1
		},
		{
			"hand5state7",
			9
		},
		{
			"hand5state8",
			1
		},
		{
			"hand5state8",
			9
		},
		{
			"hand5state9",
			1
		},
		{
			"hand5state9",
			9
		},
		{
			"hand5state10",
			1
		},
		{
			"hand5state10",
			9
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			24
		}
	}
end

LUI.Playercard.StandOff.buildHolster1Anims = function ( f4_arg0 )
	local f4_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_08" )
	local f4_local1, f4_local2 = GetMaterialDimensions( f4_local0 )
	local f4_local3 = f4_local1 / f4_local2
	local f4_local4 = 53.4
	local f4_local5 = {
		material = f4_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 13.4,
		right = -42.45,
		height = f4_local4,
		width = f4_local4 * f4_local3,
		alpha = 1
	}
	local f4_local6 = {
		alpha = 0
	}
	
	local holster1 = LUI.UIImage.new( f4_local5 )
	holster1:registerAnimationState( "holsterState1", f4_local5 )
	holster1:registerAnimationState( "hidden", f4_local6 )
	f4_arg0:addElement( holster1 )
	f4_arg0.holster1 = holster1
	
	holster1.animTable = {
		{
			"holsterState1",
			1
		},
		{
			"holsterState1",
			249
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			224
		},
		{
			"holsterState1",
			1
		},
		{
			"holsterState1",
			24
		}
	}
end

LUI.Playercard.StandOff.buildHolster2Anims = function ( f5_arg0 )
	local f5_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_08" )
	local f5_local1, f5_local2 = GetMaterialDimensions( f5_local0 )
	local f5_local3 = f5_local1 / f5_local2
	local f5_local4 = 53.4
	local f5_local5 = {
		material = f5_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 13.4,
		right = -42.45,
		height = f5_local4,
		width = f5_local4 * f5_local3,
		alpha = 1
	}
	local f5_local6 = {
		alpha = 0
	}
	
	local holster2 = LUI.UIImage.new( f5_local5 )
	holster2:registerAnimationState( "holsterState1", f5_local5 )
	holster2:registerAnimationState( "hidden", f5_local6 )
	f5_arg0:addElement( holster2 )
	f5_arg0.holster2 = holster2
	
	holster2.animTable = {
		{
			"hidden",
			1
		},
		{
			"hidden",
			24
		},
		{
			"holsterState1",
			1
		},
		{
			"holsterState1",
			199
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			299
		},
		{
			"holsterState1",
			1
		},
		{
			"holsterState1",
			49
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			24
		}
	}
end

LUI.Playercard.StandOff.buildShotAnims = function ( f6_arg0 )
	local f6_local0 = RegisterAndCacheMaterial( "em_bg_standoff_layer_09" )
	local f6_local1, f6_local2 = GetMaterialDimensions( f6_local0 )
	local f6_local3 = f6_local1 / f6_local2
	local f6_local4 = 53
	local f6_local5 = {
		material = f6_local0,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11.25,
		right = -84,
		height = f6_local4,
		width = f6_local4 * f6_local3,
		alpha = 1
	}
	local f6_local6 = {
		alpha = 0
	}
	
	local shot = LUI.UIImage.new( f6_local5 )
	shot:registerAnimationState( "shotState1", f6_local5 )
	shot:registerAnimationState( "hidden", f6_local6 )
	f6_arg0:addElement( shot )
	f6_arg0.shot = shot
	
	shot.animTable = {
		{
			"hidden",
			1
		},
		{
			"hidden",
			229
		},
		{
			"shotState1",
			5
		},
		{
			"shotState1",
			20
		},
		{
			"hidden",
			1
		},
		{
			"hidden",
			104
		}
	}
end

LUI.Playercard.StandOff.new = function ()
	local f7_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local0.material = RegisterAndCacheMaterial( "em_bg_standoff_layer_01" )
	local self = LUI.UIImage.new( f7_local0 )
	LUI.Playercard.StandOff.buildGunAnims( self )
	LUI.Playercard.StandOff.buildHolster1Anims( self )
	LUI.Playercard.StandOff.buildHandAnims( self )
	LUI.Playercard.StandOff.buildHolster2Anims( self )
	LUI.Playercard.StandOff.buildShotAnims( self )
	LUI.Playercard.StandOff.runAnimations( self )
	self:addElement( LUI.UITimer.new( 1150, "runAnims" ) )
	self:registerEventHandler( "runAnims", LUI.Playercard.StandOff.runAnimations )
	return self
end

LockTable( _M )
