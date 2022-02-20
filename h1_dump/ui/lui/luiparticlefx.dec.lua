LUI.ParticleFx = {}
LUI.ParticleFx.MaterialCycleType = {
	Linear = 0,
	Random = 1
}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	return math.random() * (f1_arg1 - f1_arg0) + f1_arg0
end

LUI.ParticleFx.UpdateParticle = function ( f2_arg0 )
	if f2_arg0.system.active and (f2_arg0.repeatCount < 0 or f2_arg0.count <= f2_arg0.repeatCount) then
		f2_arg0.lifetime = f0_local0( f2_arg0.minLifetime, f2_arg0.maxLifetime )
		for f2_local0 = 1, #f2_arg0.elements, 1 do
			f2_arg0.elements[f2_local0]:processEvent( {
				name = "update",
				dispatchToChildren = false,
				immediate = true
			} )
		end
		f2_arg0.count = f2_arg0.count + 1
		f2_arg0:addElement( LUI.UITimer.new( f2_arg0.lifetime + f0_local0( f2_arg0.minRepeatDelay, f2_arg0.maxRepeatDelay ), "update_particle", nil, true ) )
	end
end

LUI.ParticleFx.UpdateTranslation = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 0
	local f3_local1 = {}
	for f3_local2 = 1, #f3_arg0.states, 1 do
		local f3_local5 = f0_local0( f3_arg0.states[f3_local2].minX, f3_arg0.states[f3_local2].maxX )
		local f3_local6 = f0_local0( f3_arg0.states[f3_local2].minY, f3_arg0.states[f3_local2].maxY )
		f3_local1[f3_local2] = CoD.CreateState( f3_local5, f3_local6, f3_local5, f3_local6, CoD.AnchorTypes.All )
		f3_local1[f3_local2].timeWeight = f0_local0( f3_arg0.states[f3_local2].minTimeWeight, f3_arg0.states[f3_local2].maxTimeWeight )
		f3_local0 = f3_local0 + f3_local1[f3_local2].timeWeight
	end
	local f3_local2 = {}
	for f3_local3 = 1, #f3_local1, 1 do
		local f3_local6 = 0
		if 0 < f3_local1[f3_local3].timeWeight then
			f3_local6 = f3_arg0.particle.lifetime * f3_local1[f3_local3].timeWeight / f3_local0
		end
		f3_arg0:registerAnimationState( "" .. f3_local3, f3_local1[f3_local3] )
		local f3_local8 = {}
		local f3_local9 = "" .. f3_local3
		local f3_local10 = f3_local6
		local f3_local11, f3_local12, f3_local13 = nil
		local f3_local14 = f3_arg0.states[f3_local3].easing
		f3_local8[1] = f3_local9
		f3_local8[2] = f3_local10
		f3_local8[3] = f3_local11
		f3_local8[4] = f3_local12
		f3_local8[5] = f3_local13
		f3_local8[6] = f3_local14
		f3_local2[f3_local3] = f3_local8
	end
	f3_arg0:animateInSequence( f3_local2, nil, true, true )
end

LUI.ParticleFx.UpdateRotation = function ( f4_arg0, f4_arg1 )
	local f4_local0 = 0
	local f4_local1 = {}
	for f4_local2 = 1, #f4_arg0.states, 1 do
		f4_local1[f4_local2] = {
			xRot = f0_local0( f4_arg0.states[f4_local2].minRotX, f4_arg0.states[f4_local2].maxRotX ),
			yRot = f0_local0( f4_arg0.states[f4_local2].minRotY, f4_arg0.states[f4_local2].maxRotY ),
			zRot = f0_local0( f4_arg0.states[f4_local2].minRotZ, f4_arg0.states[f4_local2].maxRotZ )
		}
		f4_local1[f4_local2].timeWeight = f0_local0( f4_arg0.states[f4_local2].minTimeWeight, f4_arg0.states[f4_local2].maxTimeWeight )
		f4_local0 = f4_local0 + f4_local1[f4_local2].timeWeight
	end
	local f4_local2 = {}
	local f4_local3 = 1
	local f4_local4 = #f4_local1
	local f4_local5 = 1
	while true do
		f4_local3 = f4_local3 + f4_local5
		if f4_local3 >?= f4_local4 then
			f4_arg0:animateInSequence( f4_local2, nil, true, true )
		end
		local f4_local6 = 0
		if 0 < f4_local1[f4_local3].timeWeight then
			f4_local6 = f4_arg0.particle.lifetime * f4_local1[f4_local3].timeWeight / f4_local0
		end
		f4_arg0:registerAnimationState( "" .. f4_local3, f4_local1[f4_local3] )
		local f4_local7 = {}
		local f4_local8 = "" .. f4_local3
		local f4_local9 = f4_local6
		local f4_local10, f4_local11, f4_local12 = nil
		local f4_local13 = f4_arg0.states[f4_local3].easing
		f4_local7[1] = f4_local8
		f4_local7[2] = f4_local9
		f4_local7[3] = f4_local10
		f4_local7[4] = f4_local11
		f4_local7[5] = f4_local12
		f4_local7[6] = f4_local13
		f4_local2[f4_local3] = f4_local7
	end
end

LUI.ParticleFx.UpdateScale = function ( f5_arg0, f5_arg1 )
	local f5_local0 = 0
	local f5_local1 = {}
	for f5_local2 = 1, #f5_arg0.states, 1 do
		local f5_local5 = f0_local0( f5_arg0.states[f5_local2].minWidth, f5_arg0.states[f5_local2].maxWidth )
		local f5_local6 = f0_local0( f5_arg0.states[f5_local2].minHeight, f5_arg0.states[f5_local2].maxHeight )
		if f5_arg0.states[f5_local2].relativeScale and f5_arg0.particle.material then
			f5_local5 = f5_arg0.particle.material.curWidth * (f5_local5 - 1)
			f5_local6 = f5_arg0.particle.material.curHeight * (f5_local6 - 1)
		end
		f5_local1[f5_local2] = CoD.CreateState( -f5_local5 / 2, -f5_local6 / 2, f5_local5 / 2, f5_local6 / 2, CoD.AnchorTypes.All )
		f5_local1[f5_local2].timeWeight = f0_local0( f5_arg0.states[f5_local2].minTimeWeight, f5_arg0.states[f5_local2].maxTimeWeight )
		f5_local0 = f5_local0 + f5_local1[f5_local2].timeWeight
	end
	local f5_local2 = {}
	for f5_local3 = 1, #f5_local1, 1 do
		local f5_local6 = 0
		if 0 < f5_local1[f5_local3].timeWeight then
			f5_local6 = f5_arg0.particle.lifetime * f5_local1[f5_local3].timeWeight / f5_local0
		end
		f5_arg0:registerAnimationState( "" .. f5_local3, f5_local1[f5_local3] )
		local f5_local8 = {}
		local f5_local9 = "" .. f5_local3
		local f5_local10 = f5_local6
		local f5_local11, f5_local12, f5_local13 = nil
		local f5_local14 = f5_arg0.states[f5_local3].easing
		f5_local8[1] = f5_local9
		f5_local8[2] = f5_local10
		f5_local8[3] = f5_local11
		f5_local8[4] = f5_local12
		f5_local8[5] = f5_local13
		f5_local8[6] = f5_local14
		f5_local2[f5_local3] = f5_local8
	end
	f5_arg0:animateInSequence( f5_local2, nil, true, true )
end

LUI.ParticleFx.UpdateColor = function ( f6_arg0, f6_arg1 )
	if f6_arg0.particle.colorStates then
		local f6_local0 = 0
		local f6_local1 = {}
		for f6_local2 = 1, #f6_arg0.particle.colorStates, 1 do
			f6_local1[f6_local2] = {
				color = {
					r = f0_local0( f6_arg0.particle.colorStates[f6_local2].minR, f6_arg0.particle.colorStates[f6_local2].maxR ),
					g = f0_local0( f6_arg0.particle.colorStates[f6_local2].minG, f6_arg0.particle.colorStates[f6_local2].maxG ),
					b = f0_local0( f6_arg0.particle.colorStates[f6_local2].minB, f6_arg0.particle.colorStates[f6_local2].maxB )
				}
			}
			f6_local1[f6_local2].timeWeight = f0_local0( f6_arg0.particle.colorStates[f6_local2].minTimeWeight, f6_arg0.particle.colorStates[f6_local2].maxTimeWeight )
			f6_local0 = f6_local0 + f6_local1[f6_local2].timeWeight
		end
		local f6_local2 = {}
		for f6_local3 = 1, #f6_local1, 1 do
			local f6_local6 = 0
			if f6_local1[f6_local3].timeWeight > 0 then
				f6_local6 = f6_arg0.particle.lifetime * f6_local1[f6_local3].timeWeight / f6_local0
			end
			f6_arg0:registerAnimationState( "" .. f6_local3, f6_local1[f6_local3] )
			local f6_local7 = {}
			local f6_local8 = "" .. f6_local3
			local f6_local9 = f6_local6
			local f6_local10, f6_local11, f6_local12 = nil
			local f6_local13 = f6_arg0.particle.colorStates[f6_local3].easing
			f6_local7[1] = f6_local8
			f6_local7[2] = f6_local9
			f6_local7[3] = f6_local10
			f6_local7[4] = f6_local11
			f6_local7[5] = f6_local12
			f6_local7[6] = f6_local13
			f6_local2[f6_local3] = f6_local7
		end
		f6_arg0:animateInSequence( f6_local2, nil, true, true )
	end
end

LUI.ParticleFx.UpdateAlpha = function ( f7_arg0, f7_arg1 )
	local f7_local0 = 0
	local f7_local1 = {}
	for f7_local2 = 1, #f7_arg0.states, 1 do
		f7_local1[f7_local2] = {
			alpha = f0_local0( f7_arg0.states[f7_local2].minAlpha, f7_arg0.states[f7_local2].maxAlpha )
		}
		f7_local1[f7_local2].timeWeight = f0_local0( f7_arg0.states[f7_local2].minTimeWeight, f7_arg0.states[f7_local2].maxTimeWeight )
		f7_local0 = f7_local0 + f7_local1[f7_local2].timeWeight
	end
	local f7_local2 = {}
	for f7_local3 = 1, #f7_local1, 1 do
		local f7_local6 = 0
		if 0 < f7_local1[f7_local3].timeWeight then
			f7_local6 = f7_arg0.particle.lifetime * f7_local1[f7_local3].timeWeight / f7_local0
		end
		f7_arg0:registerAnimationState( "" .. f7_local3, f7_local1[f7_local3] )
		local f7_local7 = {}
		local f7_local8 = "" .. f7_local3
		local f7_local9 = f7_local6
		local f7_local10, f7_local11, f7_local12 = nil
		local f7_local13 = f7_arg0.states[f7_local3].easing
		f7_local7[1] = f7_local8
		f7_local7[2] = f7_local9
		f7_local7[3] = f7_local10
		f7_local7[4] = f7_local11
		f7_local7[5] = f7_local12
		f7_local7[6] = f7_local13
		f7_local2[f7_local3] = f7_local7
	end
	f7_arg0:animateInSequence( f7_local2, nil, true, true )
end

LUI.ParticleFx.UpdateMaterial = function ( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg0.particle.lifetime
	local f8_local1 = {}
	if type( f8_arg0.materials ) == "table" and #f8_arg0.materials > 1 then
		local f8_local2 = 1
		while f8_local0 > 0 do
			local f8_local3 = nil
			if f8_arg0.cycleType == LUI.ParticleFx.MaterialCycleType.Linear then
				f8_local3 = f8_arg0.materials[f8_local2]
				f8_local2 = f8_local2 + 1
			elseif f8_arg0.cycleType == LUI.ParticleFx.MaterialCycleType.Random then
				f8_local2 = math.random( 1, #f8_arg0.materials )
				f8_local3 = f8_arg0.materials[f8_local2]
			end
			local f8_local4 = {}
			local f8_local5 = f8_arg0.width
			local f8_local6 = f8_arg0.height
			if f8_arg0.width and not f8_arg0.height then
				local f8_local7, f8_local8 = GetMaterialDimensions( f8_local3 )
				f8_local5 = f8_arg0.width
				f8_local6 = f8_arg0.width * f8_local8 / f8_local7
			elseif f8_arg0.height and not f8_arg0.width then
				local f8_local7, f8_local8 = GetMaterialDimensions( f8_local3 )
				f8_local6 = f8_arg0.height
				f8_local5 = f8_arg0.height * f8_local7 / f8_local8
			end
			f8_arg0.curWidth = f8_local5
			f8_arg0.curHeight = f8_local6
			f8_local4 = CoD.CreateState( -f8_local5 / 2, -f8_local6 / 2, f8_local5 / 2, f8_local6 / 2, CoD.AnchorTypes.All )
			f8_local4.material = f8_local3
			f8_arg0:registerAnimationState( "" .. #f8_local1 + 1, f8_local4 )
			local f8_local7 = f0_local0( f8_arg0.minCycleInterval, f8_arg0.maxCycleInterval )
			local f8_local8 = table.insert
			local f8_local9 = f8_local1
			local f8_local10 = {}
			local f8_local11 = "" .. #f8_local1 + 1
			local f8_local12 = f8_local7
			local f8_local13, f8_local14, f8_local15 = nil
			local f8_local16 = LUI.Easing.Snap
			f8_local10[1] = f8_local11
			f8_local10[2] = f8_local12
			f8_local10[3] = f8_local13
			f8_local10[4] = f8_local14
			f8_local10[5] = f8_local15
			f8_local10[6] = f8_local16
			f8_local8( f8_local9, f8_local10 )
			f8_local0 = f8_local0 - f8_local7
		end
		f8_arg0:animateInSequence( f8_local1, nil, true, true )
	else
		local f8_local2 = {}
		local f8_local3 = f8_arg0.width
		local f8_local4 = f8_arg0.height
		if f8_arg0.width and not f8_arg0.height then
			local f8_local5, f8_local6 = GetMaterialDimensions( material )
			f8_local3 = f8_arg0.width
			f8_local4 = f8_arg0.width * f8_local6 / f8_local5
		elseif f8_arg0.height and not f8_arg0.width then
			local f8_local5, f8_local6 = GetMaterialDimensions( material )
			f8_local4 = f8_arg0.height
			f8_local3 = f8_arg0.height * f8_local5 / f8_local6
		end
		f8_arg0.curWidth = f8_local3
		f8_arg0.curHeight = f8_local4
		f8_local2 = CoD.CreateState( -f8_local3 / 2, -f8_local4 / 2, f8_local3 / 2, f8_local4 / 2, CoD.AnchorTypes.All )
		f8_local2.material = f8_arg0.materials
		f8_arg0:registerAnimationState( "material", f8_local2 )
		f8_arg0:animateToState( "material", 0 )
		LUI.ParticleFx.UpdateColor( f8_arg0 )
	end
end

LUI.ParticleFx.AddTranslationState = function ( f9_arg0, f9_arg1 )
	if not f9_arg0.translation then
		f9_arg0.translation = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		f9_arg0.translation:registerEventHandler( "update", LUI.ParticleFx.UpdateTranslation )
		f9_arg0.translation.particle = f9_arg0
	end
	if not f9_arg0.translation.states then
		f9_arg0.translation.states = {}
	end
	local f9_local0 = {}
	local f9_local1 = f9_arg1.minX
	if not f9_local1 then
		f9_local1 = f9_arg1.x or 0
	end
	f9_local0.minX = f9_local1
	f9_local1 = f9_arg1.maxX
	if not f9_local1 then
		f9_local1 = f9_arg1.x or 0
	end
	f9_local0.maxX = f9_local1
	f9_local1 = f9_arg1.minY
	if not f9_local1 then
		f9_local1 = f9_arg1.y or 0
	end
	f9_local0.minY = f9_local1
	f9_local1 = f9_arg1.maxY
	if not f9_local1 then
		f9_local1 = f9_arg1.y or 0
	end
	f9_local0.maxY = f9_local1
	f9_local1 = f9_arg1.minTimeWeight
	if not f9_local1 then
		f9_local1 = f9_arg1.timeWeight or 1
	end
	f9_local0.minTimeWeight = f9_local1
	f9_local1 = f9_arg1.maxTimeWeight
	if not f9_local1 then
		f9_local1 = f9_arg1.timeWeight or 1
	end
	f9_local0.maxTimeWeight = f9_local1
	f9_local1 = f9_arg1.easing
	if not f9_local1 then
		f9_local1 = LUI.Easing.Linear
	end
	f9_local0.easing = f9_local1
	table.insert( f9_arg0.translation.states, f9_local0 )
end

LUI.ParticleFx.AddRotationState = function ( f10_arg0, f10_arg1 )
	if not f10_arg0.rotation then
		f10_arg0.rotation = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		f10_arg0.rotation:registerEventHandler( "update", LUI.ParticleFx.UpdateRotation )
		f10_arg0.rotation.particle = f10_arg0
	end
	if not f10_arg0.rotation.states then
		f10_arg0.rotation.states = {}
	end
	local f10_local0 = {}
	local f10_local1 = f10_arg1.minRotX
	if not f10_local1 then
		f10_local1 = f10_arg1.rotX or 0
	end
	f10_local0.minRotX = f10_local1
	f10_local1 = f10_arg1.maxRotX
	if not f10_local1 then
		f10_local1 = f10_arg1.rotX or 0
	end
	f10_local0.maxRotX = f10_local1
	f10_local1 = f10_arg1.minRotY
	if not f10_local1 then
		f10_local1 = f10_arg1.rotY or 0
	end
	f10_local0.minRotY = f10_local1
	f10_local1 = f10_arg1.maxRotY
	if not f10_local1 then
		f10_local1 = f10_arg1.rotY or 0
	end
	f10_local0.maxRotY = f10_local1
	f10_local1 = f10_arg1.minRotZ
	if not f10_local1 then
		f10_local1 = f10_arg1.rotZ or 0
	end
	f10_local0.minRotZ = f10_local1
	f10_local1 = f10_arg1.maxRotZ
	if not f10_local1 then
		f10_local1 = f10_arg1.rotZ or 0
	end
	f10_local0.maxRotZ = f10_local1
	f10_local1 = f10_arg1.minTimeWeight
	if not f10_local1 then
		f10_local1 = f10_arg1.timeWeight or 1
	end
	f10_local0.minTimeWeight = f10_local1
	f10_local1 = f10_arg1.maxTimeWeight
	if not f10_local1 then
		f10_local1 = f10_arg1.timeWeight or 1
	end
	f10_local0.maxTimeWeight = f10_local1
	f10_local1 = f10_arg1.easing
	if not f10_local1 then
		f10_local1 = LUI.Easing.Linear
	end
	f10_local0.easing = f10_local1
	table.insert( f10_arg0.rotation.states, f10_local0 )
end

LUI.ParticleFx.AddScaleState = function ( f11_arg0, f11_arg1 )
	if not f11_arg0.scale then
		f11_arg0.scale = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		f11_arg0.scale:registerEventHandler( "update", LUI.ParticleFx.UpdateScale )
		f11_arg0.scale.particle = f11_arg0
	end
	if not f11_arg0.scale.states then
		f11_arg0.scale.states = {}
	end
	local f11_local0 = {}
	local f11_local1 = f11_arg1.minWidth
	if not f11_local1 then
		f11_local1 = f11_arg1.width or 1
	end
	f11_local0.minWidth = f11_local1
	f11_local1 = f11_arg1.maxWidth
	if not f11_local1 then
		f11_local1 = f11_arg1.width or 1
	end
	f11_local0.maxWidth = f11_local1
	f11_local1 = f11_arg1.minHeight
	if not f11_local1 then
		f11_local1 = f11_arg1.height or 1
	end
	f11_local0.minHeight = f11_local1
	f11_local1 = f11_arg1.maxHeight
	if not f11_local1 then
		f11_local1 = f11_arg1.height or 1
	end
	f11_local0.maxHeight = f11_local1
	f11_local0.relativeScale = f11_arg1.relativeScale or true
	f11_local1 = f11_arg1.minTimeWeight
	if not f11_local1 then
		f11_local1 = f11_arg1.timeWeight or 1
	end
	f11_local0.minTimeWeight = f11_local1
	f11_local1 = f11_arg1.maxTimeWeight
	if not f11_local1 then
		f11_local1 = f11_arg1.timeWeight or 1
	end
	f11_local0.maxTimeWeight = f11_local1
	f11_local1 = f11_arg1.easing
	if not f11_local1 then
		f11_local1 = LUI.Easing.Linear
	end
	f11_local0.easing = f11_local1
	table.insert( f11_arg0.scale.states, f11_local0 )
end

LUI.ParticleFx.AddColorState = function ( f12_arg0, f12_arg1 )
	if not f12_arg0.colorStates then
		f12_arg0.colorStates = {}
	end
	local f12_local0 = {}
	if not f12_arg1.minR and (not f12_arg1.minColor or not f12_arg1.minColor.r) then
		local f12_local1 = f12_arg1.color
		local f12_local2 = f12_arg1.color.r
		local f12_local3 = f12_arg1.r or 1
	end
	f12_local0.minR = f12_local1 and f12_local2 or f12_local3
	if not f12_arg1.maxR and (not f12_arg1.minColor or not f12_arg1.minColor.r) then
		local f12_local4 = f12_arg1.color
		local f12_local5 = f12_arg1.color.r
		local f12_local6 = f12_arg1.r or 1
	end
	f12_local0.maxR = f12_local4 and f12_local5 or f12_local6
	if not f12_arg1.minG and (not f12_arg1.minColor or not f12_arg1.minColor.g) then
		local f12_local7 = f12_arg1.color
		local f12_local8 = f12_arg1.color.g
		local f12_local9 = f12_arg1.g or 1
	end
	f12_local0.minG = f12_local7 and f12_local8 or f12_local9
	if not f12_arg1.maxG and (not f12_arg1.minColor or not f12_arg1.minColor.g) then
		local f12_local10 = f12_arg1.color
		local f12_local11 = f12_arg1.color.g
		local f12_local12 = f12_arg1.g or 1
	end
	f12_local0.maxG = f12_local10 and f12_local11 or f12_local12
	if not f12_arg1.minB and (not f12_arg1.minColor or not f12_arg1.minColor.b) then
		local f12_local13 = f12_arg1.color
		local f12_local14 = f12_arg1.color.b
		local f12_local15 = f12_arg1.b or 1
	end
	f12_local0.minB = f12_local13 and f12_local14 or f12_local15
	if not f12_arg1.maxB and (not f12_arg1.minColor or not f12_arg1.minColor.b) then
		local f12_local16 = f12_arg1.color
		local f12_local17 = f12_arg1.color.b
		local f12_local18 = f12_arg1.b or 1
	end
	f12_local0.maxB = f12_local16 and f12_local17 or f12_local18
	local f12_local19 = f12_arg1.minTimeWeight
	if not f12_local19 then
		f12_local19 = f12_arg1.timeWeight or 1
	end
	f12_local0.minTimeWeight = f12_local19
	f12_local19 = f12_arg1.maxTimeWeight
	if not f12_local19 then
		f12_local19 = f12_arg1.timeWeight or 1
	end
	f12_local0.maxTimeWeight = f12_local19
	f12_local19 = f12_arg1.easing
	if not f12_local19 then
		f12_local19 = LUI.Easing.Linear
	end
	f12_local0.easing = f12_local19
	table.insert( f12_arg0.colorStates, f12_local0 )
end

LUI.ParticleFx.AddAlphaState = function ( f13_arg0, f13_arg1 )
	if not f13_arg0.alpha then
		f13_arg0.alpha = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		f13_arg0.alpha:registerEventHandler( "update", LUI.ParticleFx.UpdateAlpha )
		f13_arg0.alpha.particle = f13_arg0
	end
	if not f13_arg0.alpha.states then
		f13_arg0.alpha.states = {}
	end
	local f13_local0 = {}
	local f13_local1 = f13_arg1.minAlpha
	if not f13_local1 then
		f13_local1 = f13_arg1.alpha or 1
	end
	f13_local0.minAlpha = f13_local1
	f13_local1 = f13_arg1.maxAlpha
	if not f13_local1 then
		f13_local1 = f13_arg1.alpha or 1
	end
	f13_local0.maxAlpha = f13_local1
	f13_local1 = f13_arg1.minTimeWeight
	if not f13_local1 then
		f13_local1 = f13_arg1.timeWeight or 1
	end
	f13_local0.minTimeWeight = f13_local1
	f13_local1 = f13_arg1.maxTimeWeight
	if not f13_local1 then
		f13_local1 = f13_arg1.timeWeight or 1
	end
	f13_local0.maxTimeWeight = f13_local1
	f13_local1 = f13_arg1.easing
	if not f13_local1 then
		f13_local1 = LUI.Easing.Linear
	end
	f13_local0.easing = f13_local1
	table.insert( f13_arg0.alpha.states, f13_local0 )
end

LUI.ParticleFx.SetMaterials = function ( f14_arg0, f14_arg1 )
	if not f14_arg0.material then
		f14_arg0.material = LUI.UIImage.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		f14_arg0.material:registerEventHandler( "update", LUI.ParticleFx.UpdateMaterial )
		f14_arg0.material.particle = f14_arg0
	end
	local f14_local0 = f14_arg0.material
	local f14_local1 = f14_arg1.materials
	if not f14_local1 then
		f14_local1 = f14_arg1.material
		if not f14_local1 then
			f14_local1 = RegisterMaterial( "white" )
		end
	end
	f14_local0.materials = f14_local1
	f14_local0 = f14_arg0.material
	f14_local1 = f14_arg1.minCycleInterval
	if not f14_local1 then
		f14_local1 = f14_arg1.cycleInterval or 0
	end
	f14_local0.minCycleInterval = f14_local1
	f14_local0 = f14_arg0.material
	f14_local1 = f14_arg1.maxCycleInterval
	if not f14_local1 then
		f14_local1 = f14_arg1.cycleInterval or 0
	end
	f14_local0.maxCycleInterval = f14_local1
	f14_local0 = f14_arg0.material
	f14_local1 = f14_arg1.cycleType
	if not f14_local1 then
		f14_local1 = LUI.ParticleFx.MaterialCycleType.Linear
	end
	f14_local0.cycleType = f14_local1
	f14_arg0.material.width = f14_arg1.width
	f14_arg0.material.height = f14_arg1.height
end

LUI.ParticleFx.AddParticle = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	local f15_local1 = controller.minLifetime
	if not f15_local1 then
		f15_local1 = controller.lifetime or 1000
	end
	self.minLifetime = f15_local1
	f15_local1 = controller.maxLifetime
	if not f15_local1 then
		f15_local1 = controller.lifetime or 1000
	end
	self.maxLifetime = f15_local1
	f15_local1 = controller.minStartDelay
	if not f15_local1 then
		f15_local1 = controller.startDelay or 0
	end
	self.minStartDelay = f15_local1
	f15_local1 = controller.maxStartDelay
	if not f15_local1 then
		f15_local1 = controller.startDelay or 0
	end
	self.maxStartDelay = f15_local1
	self.repeatCount = controller.repeatCount or 0
	f15_local1 = controller.minRepeatDelay
	if not f15_local1 then
		f15_local1 = controller.repeatDelay or 0
	end
	self.minRepeatDelay = f15_local1
	f15_local1 = controller.maxRepeatDelay
	if not f15_local1 then
		f15_local1 = controller.repeatDelay or 0
	end
	self.maxRepeatDelay = f15_local1
	self.translationRelativeToRotation = controller.translationRelativeToRotation or false
	table.insert( menu.particles, self )
	menu:addElement( self )
	return self
end

LUI.ParticleFx.InitializeParticleSystem = function ( f16_arg0 )
	for f16_local0 = 1, #f16_arg0.particles, 1 do
		local f16_local3 = {}
		if f16_arg0.particles[f16_local0].translation then
			table.insert( f16_local3, f16_arg0.particles[f16_local0].translation )
		end
		if f16_arg0.particles[f16_local0].rotation then
			if f16_arg0.particles[f16_local0].translationRelativeToRotation then
				table.insert( f16_local3, 1, f16_arg0.particles[f16_local0].rotation )
			else
				table.insert( f16_local3, f16_arg0.particles[f16_local0].rotation )
			end
		end
		if f16_arg0.particles[f16_local0].scale then
			table.insert( f16_local3, f16_arg0.particles[f16_local0].scale )
		end
		if f16_arg0.particles[f16_local0].alpha then
			table.insert( f16_local3, f16_arg0.particles[f16_local0].alpha )
		end
		if f16_arg0.particles[f16_local0].material then
			table.insert( f16_local3, f16_arg0.particles[f16_local0].material )
		end
		local f16_local4 = f16_arg0.particles[f16_local0]
		for f16_local5 = 1, #f16_local3, 1 do
			f16_local4:addElement( f16_local3[f16_local5] )
			f16_local4 = f16_local3[f16_local5]
		end
		if f16_arg0.particles[f16_local0].material and f16_local3[#f16_local3] == f16_arg0.particles[f16_local0].material then
			table.remove( f16_local3 )
			table.insert( f16_local3, 1, f16_arg0.particles[f16_local0].material )
		end
		f16_arg0.particles[f16_local0].elements = f16_local3
		f16_arg0.particles[f16_local0].system = f16_arg0
		f16_arg0.particles[f16_local0]:registerEventHandler( "update_particle", LUI.ParticleFx.UpdateParticle )
	end
end

LUI.ParticleFx.StartParticleSystem = function ( f17_arg0 )
	f17_arg0:animateToState( "show" )
	f17_arg0.active = true
	for f17_local0 = 1, #f17_arg0.particles, 1 do
		f17_arg0.particles[f17_local0].count = 0
		local f17_local3 = 0
		if f17_arg0.particles[f17_local0].minStartDelay > 0 or f17_arg0.particles[f17_local0].maxStartDelay > 0 then
			f17_local3 = f0_local0( f17_arg0.particles[f17_local0].minStartDelay, f17_arg0.particles[f17_local0].maxStartDelay )
		end
		if f17_local3 > 0 then
			f17_arg0.particles[f17_local0]:addElement( LUI.UITimer.new( f17_local3, "update_particle", nil, true ) )
		else
			LUI.ParticleFx.UpdateParticle( f17_arg0.particles[f17_local0] )
		end
	end
end

LUI.ParticleFx.StopParticleSystem = function ( f18_arg0 )
	f18_arg0.active = false
end

LUI.ParticleFx.FadeOutParticleSystem = function ( f19_arg0, f19_arg1, f19_arg2 )
	f19_arg0:animateToState( "hide", f19_arg1, nil, nil, nil, f19_arg2 )
end

LUI.ParticleFx.KillParticleSystem = function ( f20_arg0 )
	f20_arg0:close()
end

LUI.ParticleFx.CreateParticleSystem = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	local self = LUI.UIElement.new( CoD.CreateState( f21_arg1, f21_arg2, f21_arg1, f21_arg2, f21_arg3 ) )
	self:registerAnimationState( "show", {
		color = {
			r = 1,
			g = 1,
			b = 1
		},
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		color = {
			r = 0,
			g = 0,
			b = 0
		},
		alpha = 0
	} )
	self.particles = {}
	self:registerEventHandler( "stop_particle_system", LUI.ParticleFx.StopParticleSystem )
	self:registerEventHandler( "fade_out_particle_system", LUI.ParticleFx.FadeOutParticleSystem )
	self:registerEventHandler( "kill_particle_system", LUI.ParticleFx.KillParticleSystem )
	if f21_arg4 then
		self:setPriority( f21_arg4 )
	end
	f21_arg0:addElement( self )
	return self
end

