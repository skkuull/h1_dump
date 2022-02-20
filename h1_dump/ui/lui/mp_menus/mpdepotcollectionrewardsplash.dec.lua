local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotCollectionRewardSplash = InheritFrom( LUI.MenuTemplate )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6 )
	local f1_local0 = RegisterMaterial( "collection_laurel_double_leaf" )
	local f1_local1, f1_local2 = GetMaterialDimensions( f1_local0 )
	local f1_local3 = f1_local1 / f1_local2
	local f1_local4 = f1_arg5
	local f1_local5 = f1_local4 * f1_local3
	local f1_local6 = RegisterMaterial( "collection_laurel_single_leaf" )
	local f1_local7, f1_local8 = GetMaterialDimensions( f1_local6 )
	local f1_local9 = f1_arg6 * f1_local8 / f1_local2
	local f1_local10 = f1_local9 * f1_local7 / f1_local8
	local f1_local11 = CoD.CreateState( f1_arg0, f1_arg1, f1_arg0, f1_arg1, CoD.AnchorTypes.None )
	f1_local11.alpha = 1
	local self = LUI.UIElement.new( f1_local11 )
	local f1_local13 = (f1_arg3 - f1_arg2) / (f1_arg4 - 1)
	local f1_local14
	if f1_arg2 >= 0 then
		f1_local14 = -1
		if not f1_local14 then
		
		else
			f1_local14 = f1_local5 * f1_local14
			local f1_local15 = -f1_local4
			local f1_local16 = f1_local14 + f1_local5
			local f1_local17 = f1_local15 + f1_local4
			local f1_local18 = CoD.CreateState( f1_local14, f1_local15, f1_local16, f1_local17, CoD.AnchorTypes.Bottom )
			f1_local18.material = f1_local0
			f1_local18.zRot = f1_arg2
			local f1_local19 = CoD.CreateState( f1_local14 + f1_local5 / 2, f1_local17, f1_local16 - f1_local5 / 2, f1_local17, CoD.AnchorTypes.Bottom )
			if f1_arg2 >= 0 then
				f1_local18.rightAnchor = true
				f1_local19.rightAnchor = true
			else
				f1_local18.leftAnchor = true
				f1_local19.leftAnchor = true
			end
			self.leaves = {}
			local f1_local20 = f1_local5
			local f1_local21 = f1_local4
			local f1_local22 = 0
			local f1_local23 = 0
			local f1_local24 = nil
			for f1_local25 = 1, f1_arg4, 1 do
				if f1_local25 == f1_arg4 then
					f1_local18.material = f1_local6
					f1_local21 = f1_local9
					f1_local20 = f1_local10
					f1_local24 = f1_local9 * 0.75
					f1_local18.top = f1_local18.bottom - f1_local9
					if f1_arg3 <= 0 then
						f1_local18.left = f1_local18.left + f1_local20 / 2
						f1_local18.right = f1_local18.left + f1_local20
					else
						f1_local18.right = f1_local18.right - f1_local20 / 2
						f1_local18.left = f1_local18.right - f1_local20
					end
				else
					f1_local24 = f1_local4 * 0.9
					f1_local4 = f1_arg5 - (f1_arg5 - f1_arg6) * (f1_local25 - 1) / (f1_arg4 - 1)
					f1_local21 = f1_local4
					f1_local20 = f1_local4 * f1_local3
				end
				if f1_local25 > 1 then
					local f1_local28 = f1_local18.zRot + f1_local13 * 0.5
					local f1_local29 = 90 - math.abs( f1_local28 )
					local f1_local30
					if f1_local28 >= 0 then
						f1_local30 = 1
						if not f1_local30 then
						
						else
							f1_local29 = math.rad( f1_local29 * f1_local30 )
							f1_local30 = math.cos( f1_local29 )
							local f1_local31 = math.sin( f1_local29 )
							local f1_local32
							if f1_local31 >= 0 then
								f1_local32 = 1
								if not f1_local32 then
								
								else
									local f1_local33 = math.abs( f1_local30 ) * f1_local24 * -f1_local32
									local f1_local34 = math.abs( f1_local31 ) * f1_local24 * (math.abs( f1_local18.zRot ) and -1 or 1)
									if f1_arg2 >= 0 then
										f1_local18.left = f1_local18.left + f1_local33
										f1_local18.right = f1_local18.left + f1_local20
									else
										f1_local18.right = f1_local18.right + f1_local33
										f1_local18.left = f1_local18.right - f1_local20
									end
									f1_local18.bottom = f1_local18.bottom + f1_local34
									f1_local18.top = f1_local18.bottom - f1_local21
									f1_local18.zRot = f1_local18.zRot + f1_local13
									f1_local19.left = f1_local18.left + f1_local20 / 2
									f1_local19.right = f1_local18.right - f1_local20 / 2
									f1_local19.top = f1_local18.bottom
									f1_local19.bottom = f1_local18.bottom
								end
							end
							f1_local32 = -1
						end
					end
					f1_local30 = -1
				end
				if f1_arg2 >= 0 then
					if f1_local18.left < f1_local22 then
						f1_local22 = f1_local18.left
					end
				elseif f1_local22 < f1_local18.right then
					f1_local22 = f1_local18.right
				end
				if f1_local18.top < f1_local23 then
					f1_local23 = f1_local18.top
				end
				self.leaves[f1_local25] = LUI.UIImage.new( f1_local18 )
				self.leaves[f1_local25]:registerAnimationState( "collapsed", f1_local19 )
				self:addElement( self.leaves[f1_local25] )
			end
			if f1_arg2 >= 0 then
				f1_local11.left = f1_local22
			else
				f1_local11.right = f1_local22
			end
			f1_local11.top = f1_arg1 + f1_local23 / 2
			f1_local11.bottom = f1_arg1 - f1_local23 / 2
			self:registerAnimationState( "default", f1_local11 )
			self:animateToState( "default" )
			self:registerAnimationState( "faded", {
				alpha = 1
			} )
			return self
		end
	end
	f1_local14 = 0
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:getAnimationStateInC( "default" )
	local f2_local1 = f2_local0.bottom - f2_local0.top
	local f2_local2 = RegisterMaterial( "reward_flare_glint" )
	local f2_local3, f2_local4 = GetMaterialDimensions( f2_local2 )
	local f2_local5 = f2_local1 * 1.5
	local f2_local6 = f2_local5 * f2_local4 / f2_local3
	local f2_local7 = f2_local1 * 0.08
	local f2_local8 = 90 - math.abs( f2_local0.zRot )
	local f2_local9
	if f2_local0.zRot >= 0 then
		f2_local9 = 1
		if not f2_local9 then
		
		else
			f2_local9 = math.rad( f2_local8 * f2_local9 )
			local f2_local10 = math.cos( f2_local9 )
			local f2_local11 = math.sin( f2_local9 )
			local f2_local12 = math.abs( f2_local10 ) * f2_local7
			local f2_local13 = math.abs( f2_local11 ) * f2_local7
			local f2_local14 = CoD.CreateState( f2_local13 - f2_local6 / 2, f2_local12 - f2_local5 / 2, f2_local13 + f2_local6 / 2, f2_local12 + f2_local5 / 2, CoD.AnchorTypes.Top )
			f2_local14.material = f2_local2
			f2_local14.alpha = 1
			f2_local14.zRot = -f2_local0.zRot
			f2_arg0.glint = LUI.UIImage.new( f2_local14 )
			f2_arg0.glint:registerAnimationState( "shrunk", CoD.CreateState( f2_local13, xOffset0, f2_local13, f2_local12, CoD.AnchorTypes.Top ) )
			f2_arg0:addElement( f2_arg0.glint )
			local f2_local15 = f2_arg0.glint
			local f2_local16 = f2_local15
			f2_local15 = f2_local15.animateInSequence
			local f2_local17 = {}
			local f2_local18 = {
				"shrunk",
				0
			}
			local f2_local19 = {
				"shrunk",
				f2_arg1
			}
			local f2_local20 = {}
			local f2_local21 = "default"
			local f2_local22 = 750
			local f2_local23, f2_local24, f2_local25 = nil
			local f2_local26 = LUI.Easing.OutBack
			f2_local20[1] = f2_local21
			f2_local20[2] = f2_local22
			f2_local20[3] = f2_local23
			f2_local20[4] = f2_local24
			f2_local20[5] = f2_local25
			f2_local20[6] = f2_local26
			f2_local21 = {}
			f2_local22 = "shrunk"
			f2_local23 = 750
			f2_local24, f2_local25, f2_local26 = nil
			local f2_local27 = LUI.Easing.InQuadratic
			f2_local21[1] = f2_local22
			f2_local21[2] = f2_local23
			f2_local21[3] = f2_local24
			f2_local21[4] = f2_local25
			f2_local21[5] = f2_local26
			f2_local21[6] = f2_local27
			f2_local17[1] = f2_local18
			f2_local17[2] = f2_local19
			f2_local17[3] = f2_local20
			f2_local17[4] = f2_local21
			f2_local15( f2_local16, f2_local17, nil, true, true )
		end
	end
	f2_local9 = -1
end

f0_local2 = function ( f3_arg0 )
	f3_arg0.leftLaurel = f0_local0( -f3_arg0.props.spacing, f3_arg0.props.yOffset, f3_arg0.props.startAngle, f3_arg0.props.endAngle, f3_arg0.props.numLeaves, f3_arg0.props.startLeafHeight, f3_arg0.props.endLeafHeight )
	f3_arg0.rightLaurel = f0_local0( f3_arg0.props.spacing, f3_arg0.props.yOffset, -f3_arg0.props.startAngle, -f3_arg0.props.endAngle, f3_arg0.props.numLeaves, f3_arg0.props.startLeafHeight, f3_arg0.props.endLeafHeight )
	f3_arg0:addElement( f3_arg0.leftLaurel )
	f3_arg0:addElement( f3_arg0.rightLaurel )
	local f3_local0 = f3_arg0.props.growTime / f3_arg0.props.numLeaves * f3_arg0.props.numSimultaneouslyGrowingLeaves
	local f3_local1 = {
		f3_arg0.leftLaurel,
		f3_arg0.rightLaurel
	}
	for f3_local2 = 1, #f3_local1, 1 do
		f3_local1[f3_local2].leaves[1]:animateInSequence( {
			{
				"collapsed",
				0
			},
			{
				"default",
				f3_local0
			}
		}, nil, true, true )
		for f3_local5 = 2, f3_arg0.props.numLeaves, 1 do
			f3_local1[f3_local2].leaves[f3_local5]:animateInSequence( {
				{
					"collapsed",
					0
				},
				{
					"collapsed",
					f3_local0 * (f3_local5 - 1) / f3_arg0.props.numSimultaneouslyGrowingLeaves
				},
				{
					"default",
					f3_local0
				}
			}, nil, true, true )
		end
		f3_local1[f3_local2]:animateInSequence( {
			{
				"default",
				0
			},
			{
				"default",
				f3_arg0.props.growTime / 2
			},
			{
				"faded",
				f3_arg0.props.growTime / 2
			}
		}, nil, true, true )
		f0_local1( f3_local1[f3_local2].leaves[f3_arg0.props.numLeaves], f3_arg0.props.growTime * (f3_local2 + 0.5) )
	end
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0 = 5
	local f4_local1 = RegisterMaterial( "reward_splash_backing_1" )
	local f4_local2, f4_local3 = GetMaterialDimensions( f4_local1 )
	local f4_local4 = f4_arg0.props.backingHeight
	local f4_local5 = f4_local4 * f4_local2 / f4_local3
	local f4_local6 = CoD.CreateState( -f4_local5 / 2, f4_arg0.props.backingYOffset - f4_local4 / 2, f4_local5 / 2, f4_arg0.props.backingYOffset + f4_local4 / 2, CoD.AnchorTypes.None )
	f4_local6.material = f4_local1
	f4_local6.alpha = 1
	f4_arg0.backingImg = LUI.UIImage.new( f4_local6 )
	f4_arg0.backingImg:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local f4_local7 = {
		{
			"hidden",
			0
		},
		{
			"default",
			f4_arg0.props.backingAnimTime / f4_local0
		}
	}
	for f4_local8 = 2, f4_local0, 1 do
		f4_arg0.backingImg:registerAnimationState( "mat_" .. f4_local8, {
			material = RegisterMaterial( "reward_splash_backing_" .. f4_local8 )
		} )
		f4_local7[f4_local8 + 1] = {
			"mat_" .. f4_local8,
			f4_arg0.props.backingAnimTime / f4_local0
		}
	end
	f4_arg0.backingImg:animateInSequence( f4_local7, nil, true, true )
	f4_arg0.backingImg:setPriority( -10 )
	f4_arg0:addElement( f4_arg0.backingImg )
end

local f0_local4 = function ( f5_arg0 )
	local f5_local0 = RegisterMaterial( "reward_splash_light_rays" )
	local f5_local1, f5_local2 = GetMaterialDimensions( f5_local0 )
	local f5_local3, f5_local4, f5_local5, f5_local6 = f5_arg0.leftLaurel:getLocalRect()
	local f5_local7 = math.abs( f5_local6 - f5_local4 ) * 1.75
	local f5_local8 = f5_local7 * f5_local1 / f5_local2
	local f5_local9 = f5_arg0.props.yOffset + f5_arg0.props.startLeafHeight * 2
	local f5_local10 = -f5_local8 * 0.15
	local f5_local11 = CoD.CreateState( f5_local10 - f5_local8 / 2, f5_local9 + f5_local6 - f5_local7, f5_local10 + f5_local8 / 2, f5_local9 + f5_local6, CoD.AnchorTypes.None )
	f5_local11.material = f5_local0
	f5_local11.alpha = 1
	f5_arg0.lightRays = LUI.UIImage.new( f5_local11 )
	f5_local11.left = 0
	f5_local11.right = 0
	f5_local11.top = f5_local6
	f5_local11.bottom = f5_local6
	f5_arg0.lightRays:registerAnimationState( "collapsed", f5_local11 )
	f5_arg0.lightRays:animateInSequence( {
		{
			"collapsed",
			0
		},
		{
			"default",
			f5_arg0.props.growTime
		}
	}, nil, true, true )
	f5_arg0.lightRays:setPriority( -5 )
	f5_arg0:addElement( f5_arg0.lightRays )
	f5_arg0.lightRays:registerAnimationState( "dimmed", {
		alpha = 0.75
	} )
	f5_arg0.lightRays:registerEventHandler( "light_ray_loop", function ( element, event )
		element:animateInLoop( {
			{
				"dimmed",
				2000
			},
			{
				"default",
				2000
			}
		}, nil, nil, true, true )
	end )
	f5_arg0.lightRays:addElement( LUI.UITimer.new( f5_arg0.props.growTime, "light_ray_loop", nil, true ) )
	f5_arg0.lightRays.defaultAnimState = f5_arg0.lightRays:getAnimationStateInC( "default" )
	f5_arg0.lightRays.defaultAnimState.height = f5_local7
	f5_arg0.lightRays.defaultAnimState.width = f5_local8
end

local f0_local5 = function ( f7_arg0 )
	local f7_local0 = math.random( 100, 150 )
	local f7_local1 = f7_local0 * f7_arg0.matHeightWidthRatio
	local f7_local2 = math.random( f7_arg0.lightRayInfo.left + f7_arg0.lightRayInfo.width * 0.55, f7_arg0.lightRayInfo.right - f7_arg0.lightRayInfo.width * 0.3 )
	local f7_local3 = math.random( -f7_arg0.lightRayInfo.height * 0.1, f7_arg0.lightRayInfo.height * 0.1 )
	local f7_local4 = CoD.CreateState( f7_local2 - f7_local0 / 2, f7_local3, f7_local2 + f7_local0 / 2, f7_local3 + f7_local1, CoD.AnchorTypes.Bottom )
	f7_local4.alpha = 0
	f7_arg0:registerAnimationState( "start", f7_local4 )
	f7_local3 = math.random( f7_arg0.lightRayInfo.height * 0.2, f7_arg0.lightRayInfo.height * 0.4 )
	f7_local4.alpha = 1
	f7_local4.top = f7_local4.top - f7_local3
	f7_local4.bottom = f7_local4.bottom - f7_local3
	local f7_local5 = f7_local3
	f7_arg0:registerAnimationState( "fade_in", f7_local4 )
	f7_local3 = math.random( f7_arg0.lightRayInfo.height * 0.1, f7_arg0.lightRayInfo.height * 0.2 )
	f7_local4.top = f7_local4.top - f7_local3
	f7_local4.bottom = f7_local4.bottom - f7_local3
	local f7_local6 = f7_local3
	f7_arg0:registerAnimationState( "move", f7_local4 )
	f7_local3 = math.random( f7_arg0.lightRayInfo.height * 0.2, f7_arg0.lightRayInfo.height * 0.4 )
	f7_local4.alpha = 0
	f7_local4.top = f7_local4.top - f7_local3
	f7_local4.bottom = f7_local4.bottom - f7_local3
	local f7_local7 = f7_local3
	f7_arg0:registerAnimationState( "fade_out", f7_local4 )
	local f7_local8 = math.random( 15, 30 )
	f7_arg0:animateInSequence( {
		{
			"start",
			0
		},
		{
			"fade_in",
			f7_local5 / f7_local8 * 1000
		},
		{
			"move",
			f7_local6 / f7_local8 * 1000
		},
		{
			"fade_out",
			f7_local7 / f7_local8 * 1000
		}
	}, nil, true, true )
	f7_arg0:addElement( LUI.UITimer.new( (f7_local5 + f7_local6 + f7_local7) / f7_local8 * 1000 + math.random( 200, 1000 ), "update_dust_mote", nil, true ) )
end

local f0_local6 = function ( f8_arg0 )
	local f8_local0 = 8
	local f8_local1 = 4
	local f8_local2, f8_local3, f8_local4, f8_local5 = f8_arg0.leftLaurel:getLocalRect()
	local f8_local6 = f8_arg0.lightRays.defaultAnimState
	local f8_local7 = f8_local6.right - f8_local6.left
	f8_arg0.dustMotesMask = LUI.UIElement.new( CoD.CreateState( -f8_local7 * 0.5, f8_local6.top - (f8_local6.bottom - f8_local6.top) * 0.5, f8_local7 * 0.5, f8_local5, CoD.AnchorTypes.None ) )
	f8_arg0.dustMotesMask:setUseStencil( true )
	f8_arg0.dustMotesMask:setPriority( -2 )
	f8_arg0:addElement( f8_arg0.dustMotesMask )
	f8_arg0.dustMotes = {}
	local f8_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.Bottom )
	f8_local8.alpha = 0
	for f8_local9 = 1, f8_local0, 1 do
		f8_local8.material = RegisterMaterial( "reward_splash_particles_" .. f8_local9 % f8_local1 + 1 )
		f8_arg0.dustMotes[f8_local9] = LUI.UIImage.new( f8_local8 )
		local f8_local12, f8_local13 = GetMaterialDimensions( f8_local8.material )
		f8_arg0.dustMotes[f8_local9].matHeightWidthRatio = f8_local13 / f8_local12
		f8_arg0.dustMotes[f8_local9].lightRayInfo = f8_local6
		f8_arg0.dustMotes[f8_local9]:registerEventHandler( "update_dust_mote", f0_local5 )
		f8_arg0.dustMotes[f8_local9]:addElement( LUI.UITimer.new( math.random( 10, 25 ) * math.pow( f8_local9, 1.5 ), "update_dust_mote", nil, true ) )
		f8_arg0.dustMotesMask:addElement( f8_arg0.dustMotes[f8_local9] )
	end
end

local f0_local7 = function ( f9_arg0 )
	local f9_local0 = RegisterMaterial( "depot_glow_white" )
	local f9_local1, f9_local2 = GetMaterialDimensions( f9_local0 )
	local f9_local3 = CoD.CreateState( 0, f9_arg0.props.yOffset, 0, f9_arg0.props.yOffset, CoD.AnchorTypes.None )
	f9_local3.material = f9_local0
	local self = LUI.UIImage.new( f9_local3 )
	local f9_local5, f9_local6, f9_local7, f9_local8 = f9_arg0.leftLaurel:getLocalRect()
	f9_local5 = f9_local5 - f9_arg0.props.startLeafHeight
	f9_local3.left = f9_local5
	f9_local3.right = -f9_local5
	local f9_local9 = (f9_local3.right - f9_local3.left) * f9_local2 / f9_local1
	f9_local3.top = f9_arg0.props.yOffset - f9_local9 / 2
	f9_local3.bottom = f9_arg0.props.yOffset + f9_local9 / 2
	self:registerAnimationState( "expanded", f9_local3 )
	self:setPriority( 20 )
	f9_arg0:addElement( self )
	self:animateInSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f9_arg0.props.growTime * 0.5
		},
		{
			"expanded",
			f9_arg0.props.growTime * 0.4
		},
		{
			"default",
			f9_arg0.props.growTime * 0.25
		}
	}, nil, true, true, true )
end

local f0_local8 = function ( f10_arg0 )
	local f10_local0 = RegisterMaterial( "flare_epic" )
	local f10_local1, f10_local2 = GetMaterialDimensions( f10_local0 )
	local f10_local3, f10_local4, f10_local5, f10_local6 = f10_arg0.leftLaurel:getLocalRect()
	local f10_local7 = -f10_local3 * 2 * f10_local2 / f10_local1
	local f10_local8 = CoD.CreateState( f10_local3, f10_arg0.props.yOffset - f10_local7 / 2, -f10_local3, f10_arg0.props.yOffset + f10_local7 / 2, CoD.AnchorTypes.None )
	f10_local8.material = f10_local0
	local self = LUI.UIImage.new( f10_local8 )
	f10_local8.left = f10_local8.left * 0.33
	f10_local8.right = f10_local8.left
	f10_local8.top = f10_arg0.props.yOffset
	f10_local8.bottom = f10_arg0.props.yOffset
	self:registerAnimationState( "shrunk_left", f10_local8 )
	f10_local8.left = -f10_local8.left
	f10_local8.right = -f10_local8.right
	self:registerAnimationState( "shrunk_right", f10_local8 )
	self:setPriority( 20 )
	f10_arg0:addElement( self )
	self:animateInSequence( {
		{
			"shrunk_left",
			0
		},
		{
			"shrunk_left",
			f10_arg0.props.growTime * 0.75
		},
		{
			"default",
			f10_arg0.props.growTime * 0.25
		},
		{
			"shrunk_right",
			f10_arg0.props.growTime * 0.25
		}
	}, nil, true, true, true )
end

local f0_local9 = function ( f11_arg0 )
	local f11_local0 = CoD.CreateState( -f11_arg0.props.startLeafHeight * 2, f11_arg0.props.startLeafHeight, f11_arg0.props.startLeafHeight * 2, nil, CoD.AnchorTypes.Bottom )
	f11_local0.alpha = 0
	f11_arg0.divider = LUI.Divider.new( f11_local0, nil, LUI.Divider.Grey, 4 )
	f11_local0.top = f11_arg0.props.startLeafHeight * 0.5
	f11_local0.alpha = 1
	f11_arg0.divider:registerAnimationState( "move_up", f11_local0 )
	f11_arg0.divider:registerAnimationState( "faded", {
		alpha = 0.5
	} )
	f11_arg0.backingImg:addElement( f11_arg0.divider )
	f11_arg0.divider:animateInSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f11_arg0.props.growTime * 0.75
		},
		{
			"faded",
			0
		},
		{
			"move_up",
			f11_arg0.props.growTime * 0.15
		}
	}, nil, true, true )
end

local f0_local10 = function ( f12_arg0 )
	local f12_local0 = RegisterMaterial( "collection_complete_star_icon" )
	local f12_local1, f12_local2 = GetMaterialDimensions( f12_local0 )
	local f12_local3 = 35
	local f12_local4 = f12_local3 * f12_local1 / f12_local2
	local f12_local5 = -f12_local3 * 0.1
	local f12_local6 = CoD.CreateState( -f12_local4 / 2, f12_local5 - f12_local3 / 2, f12_local4 / 2, f12_local5 + f12_local3 / 2, CoD.AnchorTypes.Top )
	f12_local6.material = f12_local0
	f12_local6.alpha = 1
	f12_arg0.star = LUI.UIImage.new( f12_local6 )
	f12_local6.left = f12_local6.left * 5
	f12_local6.right = f12_local6.right * 5
	f12_local6.top = f12_local6.top * 5
	f12_local6.bottom = f12_local6.bottom * 5
	f12_local6.alpha = 0.25
	f12_arg0.star:registerAnimationState( "expanded", f12_local6 )
	f12_arg0.star:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f12_arg0.divider:addElement( f12_arg0.star )
	f12_arg0.star:animateInSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			f12_arg0.props.growTime * 0.9
		},
		{
			"expanded",
			0
		},
		{
			"default",
			f12_arg0.props.growTime * 0.2
		}
	}, nil, true, true )
	local f12_local7 = RegisterMaterial( "flare_epic" )
	local f12_local8, f12_local9 = GetMaterialDimensions( f12_local7 )
	local f12_local10 = f12_local4 * 1.5
	local f12_local11 = f12_local10 * f12_local9 / f12_local8
	local f12_local12 = CoD.CreateState( 0, f12_local3 * 0.13, 0, f12_local3 * 0.13, CoD.AnchorTypes.Top )
	f12_local12.material = f12_local7
	f12_arg0.starFlare = LUI.UIImage.new( f12_local12 )
	f12_local12.left = -f12_local10 / 2
	f12_local12.top = f12_local3 * 0.43 - f12_local11 / 2
	f12_local12.right = -f12_local12.left
	f12_local12.bottom = f12_local12.top + f12_local11
	f12_arg0.starFlare:registerAnimationState( "expanded", f12_local12 )
	f12_local12.left = 0
	f12_local12.right = 0
	f12_local12.top = f12_local3 * 0.68
	f12_local12.bottom = f12_local12.top
	f12_arg0.starFlare:registerAnimationState( "bottom", f12_local12 )
	f12_arg0.star:addElement( f12_arg0.starFlare )
	f12_arg0.starFlare:animateInSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f12_arg0.props.growTime * 1.1
		},
		{
			"expanded",
			f12_arg0.props.growTime * 0.5
		},
		{
			"bottom",
			f12_arg0.props.growTime * 0.5
		}
	}, nil, true, true, true )
end

local f0_local11 = function ( f13_arg0 )
	local f13_local0, f13_local1, f13_local2, f13_local3 = f13_arg0.leftLaurel:getLocalRect()
	local f13_local4 = f13_local3 - f13_local1
	local f13_local5 = f13_local2 - f13_local0
	local f13_local6 = f13_arg0.props.collectionData.setReward.image
	Engine.CacheMaterial( f13_local6 )
	local f13_local7, f13_local8 = GetMaterialDimensions( f13_local6 )
	local f13_local9 = f13_local4 * 0.43
	local f13_local10 = f13_local9 * f13_local7 / f13_local8
	local f13_local11 = f13_local4 * 0.05
	local f13_local12 = nil
	if f13_arg0.props.collectionData.setReward.animatedTable then
		f13_arg0.rewardImage = LUI.Playercard.CreateAnimatedCallingCard( f13_arg0.props.collectionData.setReward.animatedTable, f13_local9, -LUI.Playercard.CallingCard.Width / 2, f13_arg0.props.yOffset + f13_local11 - LUI.Playercard.CallingCard.Height / 2 )
		f13_local12 = f13_arg0.rewardImage:getAnimationStateInC( "default" )
		f13_local12.scale = f13_local9 / LUI.Playercard.Height - 1
		f13_local12.alpha = 1
		f13_arg0.rewardImage:registerAnimationState( "default", f13_local12 )
		f13_local12.scale = f13_local9 * 4 / LUI.Playercard.Height - 1
		f13_local12.alpha = 0.5
	else
		f13_local12 = CoD.CreateState( -f13_local10 / 2, f13_arg0.props.yOffset + f13_local11 - f13_local9 / 2, f13_local10 / 2, f13_arg0.props.yOffset + f13_local11 + f13_local9 / 2, CoD.AnchorTypes.None )
		f13_local12.alpha = 1
		f13_local12.material = f13_local6
		f13_arg0.rewardImage = LUI.UIImage.new( f13_local12 )
		f13_local9 = f13_local9 * 4
		f13_local10 = f13_local10 * 4
		f13_local12.left = -f13_local10 / 2
		f13_local12.right = f13_local10 / 2
		f13_local12.top = f13_arg0.props.yOffset + f13_local11 - f13_local9 / 2
		f13_local12.bottom = f13_arg0.props.yOffset + f13_local11 + f13_local9 / 2
		f13_local12.alpha = 0.5
	end
	f13_arg0.rewardImage:registerAnimationState( "expanded", f13_local12 )
	f13_local12.alpha = 0
	f13_arg0.rewardImage:registerAnimationState( "hidden", f13_local12 )
	local f13_local13 = f13_arg0.rewardImage
	local f13_local14 = f13_local13
	f13_local13 = f13_local13.animateInSequence
	local f13_local15 = {}
	local f13_local16 = {
		"hidden",
		0
	}
	local f13_local17 = {
		"hidden",
		f13_arg0.props.growTime * 0.7
	}
	local f13_local18 = {
		"expanded",
		0
	}
	local f13_local19 = {}
	local f13_local20 = "default"
	local f13_local21 = f13_arg0.props.growTime
	local f13_local22, f13_local23, f13_local24 = nil
	local f13_local25 = LUI.Easing.OutElasticDrastic
	f13_local19[1] = f13_local20
	f13_local19[2] = f13_local21
	f13_local19[3] = f13_local22
	f13_local19[4] = f13_local23
	f13_local19[5] = f13_local24
	f13_local19[6] = f13_local25
	f13_local15[1] = f13_local16
	f13_local15[2] = f13_local17
	f13_local15[3] = f13_local18
	f13_local15[4] = f13_local19
	f13_local13( f13_local14, f13_local15, nil, true, true )
	f13_arg0:addElement( LUI.UITimer.new( f13_arg0.props.growTime * 0.7, {
		name = "play_sound",
		sound = "h1_mpui_loot_emblem_slam"
	}, nil, true ) )
	f13_arg0:addElement( f13_arg0.rewardImage )
end

local f0_local12 = function ( f14_arg0, f14_arg1 )
	local f14_local0, f14_local1, f14_local2, f14_local3 = f14_arg0.leftLaurel:getLocalRect()
	local f14_local4 = f14_local3 - f14_local1
	local f14_local5 = f14_local2 - f14_local0
	local f14_local6 = f14_local4 * 0.08
	local f14_local7 = f14_local5
	local f14_local8 = -f14_local4 * 0.25
	local f14_local9 = CoD.CreateState( -f14_local7 / 2, f14_local8 + f14_arg0.props.yOffset - f14_local6, f14_local7 / 2, f14_local8 + f14_arg0.props.yOffset, CoD.AnchorTypes.None )
	f14_local9.font = CoD.TextSettings.BodyFont.Font
	f14_local9.alignment = LUI.Alignment.Center
	f14_arg0.bountyText = LUI.UIText.new( f14_local9 )
	f14_arg0:addElement( f14_arg0.bountyText )
	f14_arg0.bountyText:setupAutoScaleText()
	f14_arg0.bountyText:setUsePulseFX( true, false )
	f14_arg0.bountyText:setText( Engine.Localize( "@DEPOT_BOUNTY" ) )
	local f14_local10 = f14_local6 * 0.75
	local f14_local11 = f14_local7 * 1.1
	local f14_local12 = 0
	local f14_local13 = CoD.CreateState( -f14_local11 / 2, f14_local12, f14_local11 / 2, f14_local12 + f14_local10, CoD.AnchorTypes.Bottom )
	f14_local13.font = CoD.TextSettings.BodyFont.Font
	f14_local13.alignment = LUI.Alignment.Center
	f14_arg0.rewardText = LUI.UIText.new( f14_local13 )
	f14_arg0.bountyText:addElement( f14_arg0.rewardText )
	f14_arg0.rewardText:setupAutoScaleText()
	f14_arg0.rewardText:setUsePulseFX( true, false )
	f14_arg0.rewardText:setText( f14_arg0.props.collectionData.setReward.name )
	local f14_local14 = f14_local6
	local f14_local15 = f14_local5 * 4
	local f14_local16 = 15
	local f14_local17 = CoD.CreateState( -f14_local15 / 2, f14_local16, f14_local15 / 2, f14_local16 + f14_local14, CoD.AnchorTypes.Bottom )
	f14_local17.font = CoD.TextSettings.BodyFont.Font
	f14_local17.alignment = LUI.Alignment.Center
	f14_local17.color = {
		r = 1,
		g = 1,
		b = 1
	}
	f14_arg0.collectionNameText = LUI.UIText.new( f14_local17 )
	f14_arg0.divider:addElement( f14_arg0.collectionNameText )
	f14_local17.top = f14_local17.top - f14_local14 / 2
	f14_local17.bottom = f14_local17.bottom + f14_local14 / 2
	f14_local17.color = {
		r = 0.1,
		g = 0.1,
		b = 0.1
	}
	f14_arg0.collectionNameText:registerAnimationState( "expanded", f14_local17 )
	local f14_local18 = nil
	for f14_local19 = 1, #LUI.MPDepot.Collections, 1 do
		if Cac.LootDropRewardImages[f14_arg0.props.collectionData.setReward.guid] ~= nil and LUI.MPDepot.Collections[f14_local19].Tag == Cac.LootDropRewardImages[f14_arg0.props.collectionData.setReward.guid].seasonTag then
			f14_local18 = LUI.MPDepot.Collections[f14_local19]
			break
		end
	end
	if f14_local18 == nil then
		f14_arg0.collectionNameText:setText( Engine.ToUpperCase( Engine.Localize( "@DEPOT_NAME_COLLECTION", f14_arg0.props.collectionData.name ) ) )
	else
		f14_arg0.collectionNameText:setText( Engine.ToUpperCase( Engine.Localize( "@DEPOT_NAME_COLLECTION", Engine.Localize( f14_local18.Name ) ) ) )
	end
	f14_arg0.collectionNameText:animateInSequence( {
		{
			"expanded",
			0
		},
		{
			"default",
			f14_arg0.props.growTime * 0.3
		}
	}, nil, true, true )
	local f14_local19 = f14_local14 * 0.6
	local f14_local20 = f14_local15
	local f14_local21 = f14_local16 + f14_local14 * 1.5
	local f14_local22 = CoD.CreateState( -f14_local20 / 2, f14_local21, f14_local20 / 2, f14_local21 + f14_local19, CoD.AnchorTypes.Bottom )
	f14_local22.font = CoD.TextSettings.BodyFont.Font
	f14_local22.alignment = LUI.Alignment.Center
	f14_local22.color = {
		r = 1,
		g = 1,
		b = 1
	}
	f14_arg0.completedText = LUI.UIText.new( f14_local22 )
	f14_arg0.divider:addElement( f14_arg0.completedText )
	f14_local22.color = {
		r = 0.1,
		g = 0.1,
		b = 0.1
	}
	f14_arg0.completedText:registerAnimationState( "gray", f14_local22 )
	f14_arg0.completedText:setText( Engine.Localize( "DEPOT_COMPLETED" ) )
	f14_arg0.completedText:animateInSequence( {
		{
			"gray",
			0
		},
		{
			"default",
			f14_arg0.props.growTime * 0.1
		},
		{
			"gray",
			f14_arg0.props.growTime * 0.1
		},
		{
			"default",
			f14_arg0.props.growTime * 0.1
		}
	}, nil, true, true )
	f14_arg0.textElems[#f14_arg0.textElems + 1] = f14_arg0.bountyText
	f14_arg0.textElems[#f14_arg0.textElems + 1] = f14_arg0.rewardText
	f14_arg0.textElems[#f14_arg0.textElems + 1] = f14_arg0.collectionNameText
	f14_arg0.textElems[#f14_arg0.textElems + 1] = f14_arg0.completedText
end

local f0_local13 = function ( f15_arg0 )
	if f15_arg0.exitStarted or not f15_arg0.rewardFinished or not f15_arg0.exitPending then
		return 
	else
		f15_arg0.exitStarted = true
		local f15_local0 = 250
		f15_arg0:registerAnimationState( "hide", {
			alpha = 0
		} )
		f15_arg0:animateToState( "hide", f15_local0 )
		f15_arg0:addElement( LUI.UITimer.new( f15_local0, "leave_menu", nil, true ) )
	end
end

local f0_local14 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0.props.collectionData
	f16_arg0:addEventHandler( "inventory", function ( f17_arg0, f17_arg1 )
		if f17_arg1.inventoryTaskType ~= LUI.InventoryUtils.TaskType.INV_TASK_PURCHASE_ITEM or f17_arg1.inventoryEventType ~= LUI.InventoryUtils.EventType.ELUIInventoryEvent_TaskCompleted then
			return 
		else
			InvalidateItemSets()
			LUI.ComScore.LogCollectionReward( f16_arg0.controller, f16_local0 )
			f16_arg0:dispatchEventToRoot( {
				name = "on_crafted_item",
				controller = f16_arg0.controller,
				success = f17_arg1.success,
				isSetReward = true
			} )
			f16_arg0.rewardFinished = true
			f0_local13( f16_arg0 )
		end
	end )
	if f16_local0.isSeasonReward ~= nil and Engine.Inventory_GetItemQuantity( f16_arg0.controller, f16_local0.setReward.guid, false ) == 0 then
		Engine.Inventory_PurchaseItem( f16_arg0.controller, f16_local0.setReward.guid, 1 )
	elseif Engine.Loot_CanClaimItemSetReward( f16_arg0.controller, f16_local0.setID ) then
		Engine.Loot_ClaimItemSetReward( f16_arg0.controller, f16_local0.setID )
	else
		DebugPrint( "Loot_CanClaimItemSetReward failed." )
		f16_arg0.rewardFinished = true
	end
	f0_local3( f16_arg0 )
	f0_local2( f16_arg0 )
	f0_local4( f16_arg0 )
	f0_local6( f16_arg0 )
	f0_local7( f16_arg0 )
	f0_local8( f16_arg0 )
	f0_local9( f16_arg0 )
	f0_local10( f16_arg0 )
	f0_local11( f16_arg0 )
	f16_arg0.textElems = {}
	f16_arg0:registerEventHandler( "play_text_animation", f0_local12 )
	f16_arg0:addElement( LUI.UITimer.new( f16_arg0.props.growTime * 0.9, "play_text_animation", nil, true ) )
end

local f0_local15 = function ( f18_arg0 )
	f18_arg0.leftLaurel:close()
	f18_arg0.rightLaurel:close()
	f18_arg0.backingImg:close()
	f18_arg0.lightRays:close()
	f18_arg0.divider:close()
	f18_arg0.star:close()
	f18_arg0.rewardImage:close()
	for f18_local0 = 1, #f18_arg0.textElems, 1 do
		f18_arg0.textElems[f18_local0]:close()
	end
	f18_arg0.textElems = {}
	for f18_local0 = 1, #f18_arg0.dustMotes, 1 do
		f18_arg0.dustMotes[f18_local0]:close()
	end
	f18_arg0.dustMotes = {}
end

LUI.MPDepotCollectionRewardSplash.AddRewardWidget = function ( menu, controller )
	menu.rewardContainer = LUI.UIElement.new( controller.rewardContainerState )
	menu:addElement( menu.rewardContainer )
	menu.rewardContainer.props = controller
	f0_local2( menu.rewardContainer )
	if controller.hideStaticAssets then
		menu.rewardContainer.leftLaurel:registerAnimationState( "faded", {
			alpha = 0
		} )
		menu.rewardContainer.rightLaurel:registerAnimationState( "faded", {
			alpha = 0
		} )
	end
	local f19_local0, f19_local1, f19_local2, f19_local3 = menu.rewardContainer.leftLaurel:getLocalRect()
	f19_local2 = f19_local2 + (controller.widthAdjustment or 0)
	f19_local3 = f19_local3 + (controller.heightAdjustment or 0)
	local f19_local4 = f19_local3 - f19_local1
	local f19_local5 = CoD.CreateState( f19_local0, f19_local1 - f19_local4 / 2, f19_local2, f19_local3 - f19_local4 / 2, CoD.AnchorTypes.Bottom )
	f19_local5.alpha = controller.hideStaticAssets and 0 or 1
	menu.rewardContainer.leftLaurel:registerAnimationState( "default", f19_local5 )
	menu.rewardContainer.leftLaurel:animateToState( "default" )
	f19_local0, f19_local1, f19_local2, f19_local3 = menu.rewardContainer.rightLaurel:getLocalRect()
	f19_local4 = f19_local3 - f19_local1
	f19_local5 = CoD.CreateState( f19_local0, f19_local1 - f19_local4 / 2, f19_local2, f19_local3 - f19_local4 / 2, CoD.AnchorTypes.Bottom )
	f19_local5.alpha = controller.hideStaticAssets and 0 or 1
	menu.rewardContainer.rightLaurel:registerAnimationState( "default", f19_local5 )
	menu.rewardContainer.rightLaurel:animateToState( "default" )
	f0_local4( menu.rewardContainer )
	f0_local6( menu.rewardContainer )
	local f19_local6 = RegisterMaterial( "collection_reward_completed_center" )
	local f19_local7, f19_local8 = GetMaterialDimensions( f19_local6 )
	local f19_local9 = (f19_local2 - f19_local0) * 2.5
	local f19_local10 = f19_local9 * f19_local8 / f19_local7
	local f19_local11 = CoD.CreateState( -f19_local9 / 2, -f19_local4 / 2 - f19_local10 / 2, f19_local9 / 2, -f19_local4 / 2 + f19_local10 / 2, CoD.AnchorTypes.Bottom )
	f19_local11.material = f19_local6
	f19_local11.alpha = controller.hideStaticAssets and 0 or 1
	menu.rewardContainer.centerImage = LUI.UIImage.new( f19_local11 )
	menu.rewardContainer:addElement( menu.rewardContainer.centerImage )
	if controller.animateCenter then
		f19_local11.left = -f19_local9 * 2
		f19_local11.right = f19_local9 * 2
		f19_local11.top = -f19_local4 / 2 - f19_local10 * 2
		f19_local11.bottom = -f19_local4 / 2 + f19_local10 * 2
		f19_local11.alpha = 0
		menu.rewardContainer.centerImage:registerAnimationState( "expanded", f19_local11 )
		local f19_local12 = menu.rewardContainer.centerImage
		local f19_local13 = f19_local12
		f19_local12 = f19_local12.animateInSequence
		local f19_local14 = {}
		local f19_local15 = {
			"expanded",
			0
		}
		local f19_local16 = {
			"expanded",
			controller.growTime
		}
		local f19_local17 = {}
		local f19_local18 = "default"
		local f19_local19 = controller.growTime * 0.25
		local f19_local20, f19_local21, f19_local22 = nil
		local f19_local23 = LUI.Easing.OutBack
		f19_local17[1] = f19_local18
		f19_local17[2] = f19_local19
		f19_local17[3] = f19_local20
		f19_local17[4] = f19_local21
		f19_local17[5] = f19_local22
		f19_local17[6] = f19_local23
		f19_local14[1] = f19_local15
		f19_local14[2] = f19_local16
		f19_local14[3] = f19_local17
		f19_local12( f19_local13, f19_local14, nil, true, true )
	end
end

local f0_local16 = function ( f20_arg0, f20_arg1 )
	f20_arg0:setBlur( false )
end

local f0_local17 = function ( f21_arg0, f21_arg1 )
	f0_local16( f21_arg0, f21_arg1 )
	f21_arg0:processEvent( {
		name = "popup_back",
		controller = f21_arg1.controller
	} )
	LUI.FlowManager.RequestLeaveMenu( f21_arg0 )
end

local f0_local18 = function ( f22_arg0, f22_arg1 )
	if f22_arg0.props and f22_arg0.props.debug then
		if f22_arg1 and f22_arg1.button and not f22_arg1.down and f22_arg0.buttonPressed then
			if not f22_arg0.props.debug or f22_arg0.props.debug and f22_arg1.button == "secondary" then
				if f22_arg1.button == "primary" or f22_arg1.button == "secondary" then
					f22_arg0.exitPending = true
					f0_local13( f22_arg0 )
				end
			elseif f22_arg1.button == "primary" then
				f0_local15( f22_arg0 )
				f0_local14( f22_arg0 )
			elseif f22_arg1.button == "left_trigger" then
				f22_arg0.props.startLeafHeight = f22_arg0.props.startLeafHeight - 1
				DebugPrint( "Start leaf height: " .. f22_arg0.props.startLeafHeight )
			elseif f22_arg1.button == "shoulderl" then
				f22_arg0.props.startLeafHeight = f22_arg0.props.startLeafHeight + 1
				DebugPrint( "Start leaf height: " .. f22_arg0.props.startLeafHeight )
			elseif f22_arg1.button == "right_trigger" then
				f22_arg0.props.endLeafHeight = f22_arg0.props.endLeafHeight - 1
				DebugPrint( "End leaf height: " .. f22_arg0.props.endLeafHeight )
			elseif f22_arg1.button == "shoulderr" then
				f22_arg0.props.endLeafHeight = f22_arg0.props.endLeafHeight + 1
				DebugPrint( "End leaf height: " .. f22_arg0.props.endLeafHeight )
			elseif f22_arg1.button == "left" then
				f22_arg0.props.startAngle = f22_arg0.props.startAngle + 5
				DebugPrint( "Start angle: " .. f22_arg0.props.startAngle )
			elseif f22_arg1.button == "right" then
				f22_arg0.props.startAngle = f22_arg0.props.startAngle - 5
				DebugPrint( "Start angle: " .. f22_arg0.props.startAngle )
			elseif f22_arg1.button == "up" then
				f22_arg0.props.endAngle = f22_arg0.props.endAngle + 5
				DebugPrint( "End angle: " .. f22_arg0.props.endAngle )
			elseif f22_arg1.button == "down" then
				f22_arg0.props.endAngle = f22_arg0.props.endAngle - 5
				DebugPrint( "End angle: " .. f22_arg0.props.endAngle )
			elseif f22_arg1.button == "alt1" then
				f22_arg0.props.numLeaves = f22_arg0.props.numLeaves - 1
				DebugPrint( "Num leaves: " .. f22_arg0.props.numLeaves )
			elseif f22_arg1.button == "alt2" then
				f22_arg0.props.numLeaves = f22_arg0.props.numLeaves + 1
				DebugPrint( "Num leaves: " .. f22_arg0.props.numLeaves )
			elseif f22_arg1.button == "left_stick_pressed" then
				f22_arg0.props.growTime = f22_arg0.props.growTime - 250
				DebugPrint( "Grow time: " .. f22_arg0.props.growTime )
			elseif f22_arg1.button == "right_stick_pressed" then
				f22_arg0.props.growTime = f22_arg0.props.growTime + 250
				DebugPrint( "Grow time: " .. f22_arg0.props.growTime )
			end
		elseif f22_arg1 and f22_arg1.button and f22_arg1.down then
			f22_arg0.buttonPressed = true
		end
	else
		f22_arg0.exitPending = true
		f0_local13( f22_arg0 )
	end
end

function MPDepotCollectionRewardSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	if not controller then
		controller = {}
	end
	controller.numLeaves = controller.numLeaves or 10
	controller.startLeafHeight = controller.startLeafHeight or 50
	controller.endLeafHeight = controller.endLeafHeight or 40
	controller.startAngle = controller.startAngle or 75
	controller.endAngle = controller.endAngle or -75
	local f23_local1 = controller.spacing
	if not f23_local1 then
		f23_local1 = controller.startLeafHeight * 0.1
	end
	controller.spacing = f23_local1
	controller.yOffset = controller.yOffset or -50
	controller.growTime = controller.growTime or 1250
	controller.numSimultaneouslyGrowingLeaves = controller.numSimultaneouslyGrowingLeaves or 2
	controller.backingHeight = controller.backingHeight or 300
	controller.backingYOffset = controller.backingYOffset or -25
	controller.backingAnimTime = controller.backingAnimTime or 375
	if not controller.collectionData and controller.debug then
		f23_local1 = GetItemSets()
		controller.collectionData = f23_local1.seasons[1].sets[1]
	end
	self.props = LUI.DeepCopy( controller )
	self.controller = controller.exclusiveController
	self.exclusiveController = controller.exclusiveController
	f23_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" )
	f23_local1:setPriority( -1000 )
	self:addElement( f23_local1 )
	local f23_local2 = RegisterMaterial( "reward_splash_bg_shadow" )
	local f23_local3, f23_local4 = GetMaterialDimensions( f23_local2 )
	local f23_local5 = controller.backingHeight * 1.75
	local f23_local6 = f23_local5 * f23_local3 / f23_local4
	local f23_local7 = CoD.CreateState( -f23_local6 / 2, -f23_local5 / 2, f23_local6 / 2, f23_local5 / 2, CoD.AnchorTypes.None )
	f23_local7.material = f23_local2
	self.bgShadow = LUI.UIImage.new( f23_local7 )
	self.bgShadow:setPriority( -100 )
	self:addElement( self.bgShadow )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( self )
	local f23_local9 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	f23_local9:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_secondary",
		helper_text = Engine.Localize( "@LUA_MENU_BACK" ),
		side = "left",
		clickable = true,
		priority = -2000
	} )
	self:registerEventHandler( "play_sound", LUI.MPDepotBase.PlaySound )
	self:registerEventHandler( "menu_create", f0_local14 )
	self:registerEventHandler( "leave_menu", f0_local17 )
	if self.props.debug then
		self:addEventHandler( "gamepad_button", f0_local18 )
	else
		local f23_local10 = function ( f24_arg0, f24_arg1 )
			f0_local18( self, f24_arg1 )
		end
		
		local self = LUI.UIBindButton.new()
		self.id = "depot_collection_reward_splash_bind_btn_id"
		self:registerEventHandler( "button_secondary", f23_local10 )
		self:registerEventHandler( "button_action", f23_local10 )
		self:registerEventHandler( "mousedown", f23_local10 )
		self.handlePrimary = true
		self:addElement( self )
	end
	Engine.PlaySound( "h1_mpui_loot_emblem" )
	Engine.SetUI3DWindows( 0, 0, 0, 1, 1, CoD.UI3DScaleMode.ScaleFullScreen )
	self:setBlur( true )
	self:registerEventHandler( "menu_close", f0_local16 )
	Engine.CacheMaterial( controller.collectionData.setReward.image )
	return self
end

LUI.MenuBuilder.registerPopupType( "MPDepotCollectionRewardSplash", MPDepotCollectionRewardSplash )
LockTable( _M )
