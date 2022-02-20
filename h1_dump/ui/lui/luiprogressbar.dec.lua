LUI.UIProgressBar = InheritFrom( LUI.UIElement )
LUI.UIProgressBar.Orientation = {
	LeftToRight = 1,
	RightToLeft = 2,
	TopToBottom = 3,
	BottomToTop = 4
}
UIProgressBarGlobals = {
	DefaultProperties = {
		orientation = LUI.UIProgressBar.Orientation.LeftToRight,
		progress_min = 0,
		progress_max = 1,
		progress_segments = 1,
		progress_values = {
			0
		},
		background_material = RegisterMaterial( "white" ),
		background_color = nil,
		background_alpha = nil,
		segment_material = RegisterMaterial( "white" ),
		segment_colors = {},
		segment_alphas = {},
		segment_padding = 0,
		border_thickness = 1,
		border_padding = 0,
		border_color = nil,
		border_alpha = nil,
		depth = CoD.Depths.Default,
		animation_duration = 0,
		ease_in = false,
		ease_out = false,
		refresh_interval = nil,
		refresh_func = nil
	}
}
LUI.UIProgressBar.build = function ( f1_arg0, f1_arg1 )
	return LUI.UIProgressBar.new( nil, f1_arg1 )
end

LUI.UIProgressBar.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self:setClass( LUI.UIProgressBar )
	self:PopulateMissingProps( controller )
	self:ValidateProps( controller )
	local f2_local1 = self.properties
	local f2_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local2.material = f2_local1.background_material
	f2_local2.color = f2_local1.background_color
	f2_local2.alpha = f2_local1.background_alpha
	local self = LUI.UIImage.new( f2_local2 )
	local f2_local4 = f2_local1.border_padding
	local self = LUI.UIElement.new( CoD.CreateState( f2_local4, f2_local4, -f2_local4, -f2_local4, CoD.AnchorTypes.All ) )
	local f2_local6 = {}
	for f2_local7 = 1, f2_local1.progress_segments, 1 do
		local f2_local10 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.None )
		f2_local10.material = f2_local1.segment_material
		f2_local10.color = f2_local1.segment_colors[f2_local7]
		f2_local10.alpha = f2_local1.segment_alphas[f2_local7]
		local self = LUI.UIImage.new( f2_local10 )
		self:registerEventHandler( "transition_complete_progress", MBh.EmitEventToRoot( {
			name = "progress_complete_" .. f2_local7,
			target = self
		} ) )
		self:registerEventHandler( "transition_complete_initialize", MBh.EmitEventToRoot( {
			name = "initialize_complete_" .. f2_local7,
			target = self
		} ) )
		f2_local6[#f2_local6 + 1] = self
	end
	local f2_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local7.borderThickness = f2_local1.border_thickness
	f2_local7.color = f2_local1.border_color
	f2_local7.depth = f2_local1.depth
	f2_local7.alpha = f2_local1.border_alpha
	local self = LUI.UIBorder.new( f2_local7 )
	self.background = self
	self.segmentContainer = self
	self.segmentElements = f2_local6
	self.border = self
	self:addElement( self.background )
	self:addElement( self.segmentContainer )
	for f2_local9 = 1, #self.segmentElements, 1 do
		self:addElement( self.segmentElements[f2_local9] )
	end
	self:addElement( self.border )
	if f2_local1.refresh_interval then
		self.timer = LUI.UITimer.new( f2_local1.refresh_interval, "progress_refresh", nil, false, self, false )
		self:addElement( self.timer )
	end
	self:registerEventHandler( "progress_refresh", LUI.UIProgressBar.Refresh )
	self:dispatchEventToRoot( {
		name = "progress_refresh",
		target = self,
		initializing = true
	} )
	return self
end

LUI.UIProgressBar.PopulateMissingProps = function ( f3_arg0, f3_arg1 )
	if not f3_arg1 then
		f3_arg1 = {}
	end
	if not f3_arg0.properties then
		f3_arg0.properties = f3_arg1
	end
	for f3_local3, f3_local4 in pairs( UIProgressBarGlobals.DefaultProperties ) do
		if f3_arg1[f3_local3] == nil then
			f3_arg1[f3_local3] = f3_local4
		end
	end
end

LUI.UIProgressBar.ValidateProps = function ( f4_arg0, f4_arg1 )
	if f4_arg1 then
		if f4_arg1.progress_min or f4_arg1.progress_max then
			assert( f4_arg1.progress_min and f4_arg1.progress_max, "Must assign both progress_min and progress_max" )
			assert( f4_arg1.progress_min < f4_arg1.progress_max, "Min must be smaller than Max" )
		end
		if f4_arg1.refresh_func then
			assert( type( f4_arg1.refresh_func ) == "function", "refresh_func must be a function" )
		end
		if f4_arg1.progress_segments then
			assert( f4_arg1.progress_segments > 0, "progress_segments must be greater than 0" )
		end
	end
end

LUI.UIProgressBar.Refresh = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0.properties
	if not f5_arg1 then
		f5_arg1 = {}
	end
	if f5_local0.refresh_func then
		local f5_local1 = f5_local0.refresh_func( f5_arg0 )
		f5_arg1.ignoreAnimationDuration = f5_local1.ignoreAnimationDuration
		LUI.UIProgressBar.setValues( f5_arg0, f5_local1.values, true )
	elseif f5_arg1.newValues then
		LUI.UIProgressBar.setValues( f5_arg0, f5_arg1.newValues, true )
	end
	f5_local0.progress_min = f5_arg1.min or f5_local0.progress_min
	f5_local0.progress_max = f5_arg1.max or f5_local0.progress_max
	f5_local0.ease_in = f5_arg1.ease_in or f5_local0.ease_in
	f5_local0.ease_out = f5_arg1.ease_out or f5_local0.ease_out
	if f5_arg1.ignoreAnimation then
		return 
	end
	local f5_local1 = f5_local0.progress_segments
	local f5_local2 = f5_local0.segment_padding
	local f5_local3 = f5_local0.progress_min
	local f5_local4 = f5_local0.progress_max
	local f5_local5 = f5_arg0.segmentContainer:getWidth()
	local f5_local6 = f5_arg0.segmentContainer:getHeight()
	local f5_local7 = f5_local0.orientation
	if not f5_local7 then
		f5_local7 = LUI.UIProgressBar.Orientation.LeftToRight
	end
	local f5_local8 = f5_local0.animation_duration
	local f5_local9 = f5_local0.ease_in
	local f5_local10 = f5_local0.ease_out
	if f5_arg1.ignoreAnimationDuration then
		f5_local8 = 0
	end
	local f5_local11 = f5_arg1.newValues
	if not f5_local11 then
		f5_local11 = f5_local0.progress_values
	end
	local f5_local12 = f5_arg1.oldValues
	if not f5_local12 then
		f5_local12 = f5_local0.progress_oldValues
		if not f5_local12 then
			f5_local12 = f5_local11
		end
	end
	if f5_local12 and f5_local11 then
		local f5_local13 = assert
		local f5_local14
		if #f5_local12 ~= f5_local1 or #f5_local11 ~= f5_local1 then
			f5_local14 = false
		else
			f5_local14 = true
		end
		f5_local13( f5_local14, "The length of progress_values must be equal to progress_segments" )
		for f5_local13 = 1, f5_local1, 1 do
			local f5_local16 = f5_arg0.segmentElements[f5_local13]
			local f5_local17
			if f5_local13 ~= 1 then
				f5_local17 = f5_local12[f5_local13 - 1]
				if not f5_local17 then
				
				else
					local f5_local18
					if f5_local13 ~= 1 then
						f5_local18 = f5_local11[f5_local13 - 1]
						if not f5_local18 then
						
						else
							local f5_local19
							if f5_local13 ~= 1 then
								f5_local19 = f5_local2 / 2
								if not f5_local19 then
								
								else
									local f5_local20
									if f5_local13 ~= f5_local1 then
										f5_local20 = f5_local2 / 2
										if not f5_local20 then
										
										else
											local f5_local21 = 0
											if f5_local4 ~= f5_local3 then
												f5_local21 = LUI.clamp( math.abs( LUI.clamp( f5_local11[f5_local13], f5_local3, f5_local4 ) - LUI.clamp( f5_local12[f5_local13], f5_local3, f5_local4 ) ) / (f5_local4 - f5_local3), 0, 1 )
											end
											local f5_local22 = f5_arg1.initializing and "initialize" or "progress"
											f5_local16:registerAnimationState( "pre_progress", LUI.UIProgressBar.getValueAnimationState( f5_local5, f5_local6, f5_local19, f5_local20, f5_local3, f5_local4, f5_local17, f5_local12[f5_local13], f5_local7 ) )
											f5_local16:registerAnimationState( f5_local22, LUI.UIProgressBar.getValueAnimationState( f5_local5, f5_local6, f5_local19, f5_local20, f5_local3, f5_local4, f5_local18, f5_local11[f5_local13], f5_local7 ) )
											f5_local16:animateToState( "pre_progress", 0 )
											f5_local16:animateToState( f5_local22, f5_local8 * f5_local21, f5_local9, f5_local10 )
										end
									end
									f5_local20 = 0
								end
							end
							f5_local19 = 0
						end
					end
					f5_local18 = f5_local3
				end
			end
			f5_local17 = f5_local3
		end
	end
end

LUI.UIProgressBar.setValues = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = f6_arg0.properties.progress_segments
	if type( f6_arg1 ) == "number" then
		assert( f6_local0 == 1, "LUI.UIProgressBar cannot use a 'number' for progress_values unless progress_segments == 1" )
		f6_arg1 = {
			f6_arg1
		}
	end
	f6_arg0.properties.progress_oldValues = f6_arg0.properties.progress_values
	f6_arg0.properties.progress_values = f6_arg1
	if not f6_arg2 then
		LUI.UIProgressBar.Refresh( f6_arg0, {
			ignoreAnimationDuration = f6_arg3
		} )
	end
end

LUI.UIProgressBar.getValueAnimationState = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7, f7_arg8 )
	local f7_local0 = nil
	local f7_local1 = 0
	local f7_local2 = 0
	if f7_arg4 ~= f7_arg5 then
		f7_local1 = LUI.clamp( (math.min( f7_arg6, f7_arg7 ) - f7_arg4) / (f7_arg5 - f7_arg4), 0, 1 )
		f7_local2 = LUI.clamp( (math.max( f7_arg6, f7_arg7 ) - f7_arg4) / (f7_arg5 - f7_arg4), 0, 1 )
	end
	if f7_arg8 == LUI.UIProgressBar.Orientation.LeftToRight then
		f7_local0 = CoD.CreateState( f7_arg2 + f7_local1 * f7_arg0, 0, f7_local2 * f7_arg0 - f7_arg3, 0, CoD.AnchorTypes.TopBottomLeft )
	elseif f7_arg8 == LUI.UIProgressBar.Orientation.RightToLeft then
		f7_local0 = CoD.CreateState( f7_arg3 - f7_local2 * f7_arg0, 0, -f7_arg2 - f7_local1 * f7_arg0, 0, CoD.AnchorTypes.TopBottomRight )
	elseif f7_arg8 == LUI.UIProgressBar.Orientation.TopToBottom then
		f7_local0 = CoD.CreateState( 0, f7_arg2 + f7_local1 * f7_arg1, 0, f7_local2 * f7_arg1 - f7_arg3, CoD.AnchorTypes.TopLeftRight )
	elseif f7_arg8 == LUI.UIProgressBar.Orientation.BottomToTop then
		f7_local0 = CoD.CreateState( 0, f7_arg3 - f7_local2 * f7_arg1, 0, -f7_arg2 - f7_local1 * f7_arg1, CoD.AnchorTypes.BottomLeftRight )
	else
		assert( "Unknown LUI.UIProgressBar.Orientation" )
	end
	return f7_local0
end

LUI.UIProgressBar.GetSegmentAnimationTimeLeft = function ( f8_arg0, f8_arg1 )
	return f8_arg0.segmentElements[f8_arg1]:animationTimeLeft()
end

LUI.UIProgressBar.id = "LUIProgressBar"
