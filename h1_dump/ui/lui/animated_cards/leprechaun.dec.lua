local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Leprechaun = {}
LUI.Playercard.Leprechaun.spawnCoin = function ( f1_arg0 )
	local f1_local0 = nil
	local f1_local1 = math.random()
	if f1_local1 > 0 and f1_local1 < 0.2 then
		f1_local0 = "em_bg_leprechaun_layer_09"
	elseif f1_local1 > 0.2 and f1_local1 < 0.4 then
		f1_local0 = "em_bg_leprechaun_layer_10"
	elseif f1_local1 > 0.4 and f1_local1 < 0.6 then
		f1_local0 = "em_bg_leprechaun_layer_11"
	elseif f1_local1 > 0.6 and f1_local1 < 0.8 then
		f1_local0 = "em_bg_leprechaun_layer_12"
	elseif f1_local1 > 0.8 then
		f1_local0 = "em_bg_leprechaun_layer_13"
	end
	local f1_local2 = 0
	f1_local1 = math.random()
	if f1_local1 > 0 and f1_local1 < 0.33 then
		f1_local2 = -0.5
	elseif f1_local1 > 0.33 and f1_local1 < 0.66 then
		f1_local2 = 1
	end
	local f1_local3 = RegisterAndCacheMaterial( f1_local0 )
	local f1_local4, f1_local5 = GetMaterialDimensions( f1_local3 )
	local f1_local6 = f1_local4 / f1_local5
	local f1_local7 = 6
	local f1_local8 = {
		material = f1_local3,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -11.5,
		right = -21.5 + f1_local2,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		alpha = 1,
		zRot = 360 * f1_local1
	}
	local f1_local9 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 10,
		right = -21.5 + f1_local2,
		height = f1_local7,
		width = f1_local7 * f1_local6,
		zRot = 360 * f1_local1
	}
	f1_arg0:registerAnimationState( "up", f1_local8 )
	f1_arg0:registerAnimationState( "down", f1_local9 )
	f1_arg0:animateInSequence( {
		{
			"up",
			1
		},
		{
			"down",
			600
		}
	} )
end

LUI.Playercard.Leprechaun.checkSpawnCoin1 = function ( f2_arg0 )
	if math.random() > 0.55 then
		LUI.Playercard.Leprechaun.spawnCoin( f2_arg0.coin1 )
	end
end

LUI.Playercard.Leprechaun.checkSpawnCoin2 = function ( f3_arg0 )
	if math.random() > 0.65 then
		LUI.Playercard.Leprechaun.spawnCoin( f3_arg0.coin2 )
	end
end

LUI.Playercard.Leprechaun.checkSpawnCoin3 = function ( f4_arg0 )
	if math.random() > 0.75 then
		LUI.Playercard.Leprechaun.spawnCoin( f4_arg0.coin3 )
	end
end

LUI.Playercard.Leprechaun.checkSpawnCoin4 = function ( f5_arg0 )
	if math.random() > 0.85 then
		LUI.Playercard.Leprechaun.spawnCoin( f5_arg0.coin4 )
	end
end

LUI.Playercard.Leprechaun.new = function ()
	local f6_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f6_local0.material = RegisterAndCacheMaterial( "em_bg_leprechaun_layer_01" )
	local self = LUI.UIImage.new( f6_local0 )
	local f6_local2 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -13,
		height = 1,
		width = 1
	}
	local self = LUI.UIImage.new( f6_local2 )
	self:addElement( self )
	local self = LUI.UIImage.new( f6_local2 )
	self:addElement( self )
	local self = LUI.UIImage.new( f6_local2 )
	self:addElement( self )
	local self = LUI.UIImage.new( f6_local2 )
	self:addElement( self )
	local f6_local7 = 0
	local f6_local8 = {
		self,
		self,
		self,
		self
	}
	local f6_local9 = {
		-80,
		-120,
		-160,
		-180
	}
	local f6_local10 = {
		40,
		-40,
		-80,
		-120
	}
	local f6_local11 = {
		"em_bg_leprechaun_layer_02",
		"em_bg_leprechaun_layer_03",
		"em_bg_leprechaun_layer_04",
		"em_bg_leprechaun_layer_05"
	}
	local f6_local12 = 0.15
	self:addElement( LUI.UITimer.new( 93, "leaf" ) )
	self:registerEventHandler( "leaf", function ( element, event )
		if math.random() < f6_local12 then
			f6_local12 = 0.15
			f6_local7 = f6_local7 + 1
			if f6_local7 > 4 then
				f6_local7 = 1
			end
			local f7_local0 = math.random()
			local f7_local1 = -1
			if f7_local0 > 0.5 then
				f7_local1 = 1
			end
			local f7_local2 = math.floor( f7_local0 * 4 ) + 1
			local f7_local3 = f7_local0 * 20 * f7_local1
			local f7_local4 = RegisterAndCacheMaterial( f6_local11[f7_local2] )
			f7_local2 = math.floor( math.random() * 4 ) + 1
			local f7_local5, f7_local6 = GetMaterialDimensions( f7_local4 )
			local f7_local7 = f7_local5 / f7_local6
			local f7_local8 = 17
			f6_local8[f6_local7]:registerAnimationState( "up", {
				material = f7_local4,
				rightAnchor = true,
				bottomAnchor = true,
				bottom = -60,
				right = f6_local9[f7_local2] + f7_local3,
				height = f7_local8,
				width = f7_local8 * f7_local7
			} )
			f6_local8[f6_local7]:registerAnimationState( "down", {
				rightAnchor = true,
				bottomAnchor = true,
				bottom = 20,
				right = f6_local10[f7_local2] + f7_local3,
				height = f7_local8,
				width = f7_local8 * f7_local7
			} )
			f6_local8[f6_local7]:animateInSequence( {
				{
					"up",
					1
				},
				{
					"down",
					600
				},
				{
					"down",
					2300
				}
			} )
		else
			f6_local12 = f6_local12 + 0.05
		end
	end )
	local f6_local13 = RegisterAndCacheMaterial( "em_bg_leprechaun_layer_14" )
	local f6_local14, f6_local15 = GetMaterialDimensions( f6_local13 )
	local f6_local16 = f6_local14 / f6_local15
	local f6_local17 = 61
	self:addElement( LUI.UIImage.new( {
		material = f6_local13,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 0,
		right = 1,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		material = f6_local13
	} ) )
	f6_local13 = RegisterAndCacheMaterial( "em_bg_leprechaun_layer_07" )
	local f6_local18, self = GetMaterialDimensions( f6_local13 )
	f6_local16 = f6_local18 / self
	f6_local17 = 55
	self = LUI.UIElement.new( {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 1,
		right = -22,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		zRot = -9
	} )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		material = f6_local13,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		right = 11,
		material = f6_local13
	} ) )
	self:registerAnimationState( "up", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 1,
		right = -22,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		zRot = -3
	} )
	self:animateInLoop( {
		{
			"default",
			1
		},
		{
			"up",
			210
		},
		{
			"default",
			219
		}
	} )
	f6_local13 = RegisterAndCacheMaterial( "em_bg_leprechaun_layer_06" )
	local f6_local20, f6_local21 = GetMaterialDimensions( f6_local13 )
	f6_local16 = f6_local20 / f6_local21
	f6_local17 = 53
	self:addElement( LUI.UIImage.new( {
		material = f6_local13,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = 0,
		right = 0,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		material = f6_local13
	} ) )
	f6_local13 = RegisterAndCacheMaterial( "em_bg_leprechaun_layer_08" )
	local f6_local22, self = GetMaterialDimensions( f6_local13 )
	f6_local16 = f6_local22 / self
	f6_local17 = 54
	self = LUI.UIImage.new( {
		material = f6_local13,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -18,
		right = -20,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		zRot = 29,
		material = f6_local13
	} )
	self:addElement( self )
	self:registerAnimationState( "back", {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -19,
		right = -18.6,
		height = f6_local17,
		width = f6_local17 * f6_local16,
		zRot = 20
	} )
	self:animateInLoop( {
		{
			"default",
			1
		},
		{
			"back",
			700
		},
		{
			"default",
			599
		}
	} )
	local f6_local24 = {
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -13,
		right = -21,
		height = 1,
		width = 1,
		alpha = 0
	}
	
	local coin1 = LUI.UIImage.new( f6_local24 )
	self:addElement( coin1 )
	self.coin1 = coin1
	
	local coin2 = LUI.UIImage.new( f6_local24 )
	self:addElement( coin2 )
	self.coin2 = coin2
	
	local coin3 = LUI.UIImage.new( f6_local24 )
	self:addElement( coin3 )
	self.coin3 = coin3
	
	local coin4 = LUI.UIImage.new( f6_local24 )
	self:addElement( coin4 )
	self.coin4 = coin4
	
	self:addElement( LUI.UITimer.new( 368, "checkSpawnCoin1" ) )
	self:registerEventHandler( "checkSpawnCoin1", LUI.Playercard.Leprechaun.checkSpawnCoin1 )
	self:addElement( LUI.UITimer.new( 763, "checkSpawnCoin2" ) )
	self:registerEventHandler( "checkSpawnCoin2", LUI.Playercard.Leprechaun.checkSpawnCoin2 )
	self:addElement( LUI.UITimer.new( 891, "checkSpawnCoin3" ) )
	self:registerEventHandler( "checkSpawnCoin3", LUI.Playercard.Leprechaun.checkSpawnCoin3 )
	self:addElement( LUI.UITimer.new( 1403, "checkSpawnCoin4" ) )
	self:registerEventHandler( "checkSpawnCoin4", LUI.Playercard.Leprechaun.checkSpawnCoin4 )
	local f6_local29 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f6_local29.material = RegisterAndCacheMaterial( "em_bg_leprechaun_layer_15" )
	self:addElement( LUI.UIImage.new( f6_local29 ) )
	return self
end

LockTable( _M )
