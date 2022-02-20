local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.DepotCredits = {}
f0_local0 = 100
f0_local1 = 0.6
LUI.DepotCredits.CreateProgressBar = function ( f1_arg0 )
	local f1_local0 = CoD.CreateState( f1_arg0.left, f1_arg0.top, nil, nil, f1_arg0.anchorType )
	f1_local0.height = f1_arg0.height
	f1_local0.width = f1_arg0.width
	f1_local0.alpha = f1_arg0.alpha or 0
	local self = LUI.UIElement.new( f1_local0 )
	self.id = f1_arg0.id
	self.numEarnedCredits = 0
	self.currBarPercent = f1_arg0.currBarPercent
	self.width = f1_local0.width
	self.height = f1_arg0.height
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerEventHandler( "OnResetProgressBar", OnResetProgressBar )
	local f1_local2 = AAR.AddImage( self, {
		id = "pBarBg",
		alpha = 0.9,
		color = Colors.grey_125,
		matKey = "white",
		anchorType = CoD.AnchorTypes.All
	} )
	local f1_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f1_local3.borderThickness = 1
	f1_local3.color = Colors.white
	self:addElement( LUI.UIBorder.new( f1_local3 ) )
	local f1_local4 = AAR.AddImage( self, {
		id = "pBarFill",
		alpha = 1,
		width = f1_arg0.width * (f1_arg0.currBarPercent or 0) / f0_local0,
		height = f1_arg0.height,
		matKey = "white",
		anchorType = CoD.AnchorTypes.Left
	} )
	local f1_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
	f1_local5.width = 0
	f1_local5.height = f1_arg0.height
	f1_local4:registerAnimationState( "empty", f1_local5 )
	return self
end

function OnResetProgressBar( f2_arg0, f2_arg1 )
	f2_arg0.pBarFill:animateToState( "empty" )
	f2_arg0.currBarPercent = 0
	LUI.DepotCredits.AnimateProgressBar( f2_arg0 )
end

LUI.DepotCredits.AnimateProgressBar = function ( f3_arg0, f3_arg1 )
	local f3_local0
	if f3_arg1 then
		f3_local0 = f3_arg1.gainedBarPercent
		if not f3_local0 then
		
		else
			local f3_local1 = f0_local0 - (f3_arg0.currBarPercent or 0)
			local f3_local2 = f3_local0
			if f3_local1 < f3_local0 then
				f3_local2 = f3_local1
			end
			f3_local0 = f3_local0 - f3_local2
			local f3_local3 = f3_arg0.width * f3_arg0.currBarPercent / f0_local0
			local f3_local4 = f3_arg0.width * f3_local2 / f0_local0
			local f3_local5 = f3_local4 / f0_local1
			local f3_local6 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
			f3_local6.width = f3_local3 + f3_local4
			f3_local6.height = f3_arg0.height
			f3_arg0.pBarFill:registerAnimationState( "addGainedAmount", f3_local6 )
			f3_arg0.pBarFill:animateToState( "addGainedAmount", f3_local5, true, true )
			f3_arg0.xpRemaining = f3_local0
			local f3_local7
			if f3_arg1 then
				f3_local7 = f3_arg1.creditEarnedCallback
				if not f3_local7 then
				
				else
					f3_arg0.creditEarnedCallback = f3_local7
					f3_local7
					if f3_arg1 then
						f3_local7 = f3_arg1.finishedCallback
						if not f3_local7 then
						
						else
							f3_arg0.finishedCallback = f3_local7
							f3_local7
							if f3_arg1 then
								f3_local7 = f3_arg1.animDelay
								if not f3_local7 then
								
								else
									f3_arg0.animDelay = f3_local7
									f3_arg0:delayCallFunc( f3_local5, function ()
										if 0 < f3_local0 or f3_local2 == f3_local1 then
											f3_arg0.numEarnedCredits = f3_arg0.numEarnedCredits + 1
											local f4_local0 = 0
											if f3_arg0.creditEarnedCallback then
												f4_local0 = f3_arg0.animDelay or 0
												f3_arg0.creditEarnedCallback( {
													container = f3_arg0.parent,
													numEarnedCredits = f3_arg0.numEarnedCredits
												} )
											end
											f3_arg0:delayCallFunc( f4_local0, function ()
												f3_arg0:processEvent( {
													name = "OnResetProgressBar"
												} )
											end )
										else
											f3_arg0:delayCallFunc( f3_arg0.animDelay or 0, function ()
												f3_arg0.finishedCallback( {
													container = f3_arg0.parent
												} )
											end )
										end
									end )
								end
							end
							f3_local7 = f3_arg0.animDelay
						end
					end
					f3_local7 = f3_arg0.finishedCallback
				end
			end
			f3_local7 = f3_arg0.creditEarnedCallback
		end
	end
	f3_local0 = f3_arg0.xpRemaining
end

LockTable( _M )
