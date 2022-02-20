RES_CONVERT = 0.67
SCORESTREAK_HUD_LINE_HEIGHT = 16
Scorestreaks = {
	GlowColor = {
		ButtonPrompt = LUI.GlowState.LightGreen,
		InfoText = LUI.GlowState.LightGreen
	}
}
local f0_local0 = 0.75
local f0_local1 = 1 - f0_local0
function toZoomADS( f1_arg0, f1_arg1 )
	return f1_arg0 * (f0_local0 + f0_local1 * f1_arg1)
end

function GetPercentageNoZoom()
	return f0_local0
end

function AddStencilReveal( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	if not f3_arg2 then
		f3_arg2 = 100
	end
	if not f3_arg3 then
		f3_arg3 = 0
	end
	local self = LUI.UIElement.new( f3_arg0 )
	local self = LUI.UIElement.new( f3_arg1 )
	self:registerAnimationState( "opened", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "stencil"
	self:setUseStencil( true )
	self:addElement( self )
	local f3_local2 = MBh.AnimateSequence( {
		{
			"default",
			f3_arg3
		},
		{
			"opened",
			f3_arg2,
			true,
			true
		}
	} )
	f3_local2( self, {} )
	f3_local2 = {
		bottomAnchor = f3_arg1.bottomAnchor,
		topAnchor = f3_arg1.topAnchor,
		leftAnchor = f3_arg1.leftAnchor,
		rightAnchor = f3_arg1.rightAnchor
	}
	local f3_local3 = f3_arg0.height
	if not f3_local3 then
		f3_local3 = f3_arg0.bottom - f3_arg0.top
	end
	local f3_local4 = f3_arg0.width
	if not f3_local4 then
		f3_local4 = f3_arg0.right - f3_arg0.left
	end
	if f3_local2.topAnchor or f3_local2.bottomAnchor then
		f3_local2.top = f3_local2.topAnchor and 0 or nil
		f3_local2.bottom = f3_local2.bottomAnchor and 0 or nil
		if not f3_local2.top or not f3_local2.bottom then
			f3_local2.height = f3_local3
		end
	else
		f3_local2.top = -f3_local3 / 2
		f3_local2.bottom = f3_local3 / 2
	end
	if f3_local2.leftAnchor or f3_local2.rightAnchor then
		f3_local2.left = f3_local2.leftAnchor and 0 or nil
		f3_local2.right = f3_local2.rightAnchor and 0 or nil
		if not f3_local2.left or not f3_local2.right then
			f3_local2.width = f3_local4
		end
	else
		f3_local2.left = -f3_local4 / 2
		f3_local2.right = f3_local4 / 2
	end
	local self = LUI.UIElement.new( f3_local2 )
	self.id = "content"
	self:addElement( self )
	return self, self
end

function CreateScorestreakLine( f4_arg0 )
	assert( f4_arg0 )
	f4_arg0.height = SCORESTREAK_HUD_LINE_HEIGHT
	local f4_local0 = RegisterMaterial( "scorestreak_hud_horizontal_line" )
	local f4_local1 = RegisterMaterial( "scorestreak_hud_horizontal_line_cap" )
	local self = LUI.UIElement.new( f4_arg0 )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 12,
		material = f4_local1
	} )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 12,
		right = -12,
		material = f4_local0
	} )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = -12,
		material = f4_local1
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

function CheckPlayerADS( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0.PlayerADS or 0
	local f5_local1 = f5_arg0.playerIsZoomingIn or false
	local f5_local2 = f5_arg0.playerIsZoomingOut or false
	local f5_local3 = Game.PlayerADS( 1 )
	local f5_local4 = f5_local0 < f5_local3
	local f5_local5 = f5_local3 < f5_local0
	f5_arg0.PlayerADS = f5_local3
	f5_arg0.playerIsZoomingIn = f5_local4
	f5_arg0.playerIsZoomingOut = f5_local5
	if f5_local0 == f5_local3 or f5_local1 == f5_local4 and f5_local2 == f5_local5 then
		return 
	end
	local f5_local6 = f5_local3
	if f5_local4 then
		f5_local6 = 1 - f5_local3
	end
	f5_arg0:dispatchEventToChildren( {
		name = "update_player_ads",
		zoomTime = 125 * f5_local6,
		playerIsZoomingIn = f5_local4,
		dispatchChildren = true
	} )
end

function CreateScorestreakDottedLine( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5 )
	assert( f6_arg0, "Not all parameters are set for AddDottedLineChildren" )
	local f6_local0 = RegisterMaterial( "scorestreak_hud_horizontal_line_dotted" )
	local f6_local1 = 56 * RES_CONVERT
	local f6_local2 = 24 * RES_CONVERT
	local f6_local3 = f6_arg3
	local f6_local4 = f6_arg4
	local f6_local5 = f6_arg5
	local f6_local6 = 5
	local f6_local7 = f6_arg2 or 0
	if f6_local3 == nil then
		f6_local3 = true
	end
	if f6_local4 == nil then
		f6_local4 = true
	end
	if f6_local5 == nil or f6_local4 and f6_local5 then
		f6_local5 = false
	end
	local self = LUI.UIElement.new( f6_arg0 )
	if f6_arg1 then
		self:setUseStencil( true )
	end
	for f6_local9 = 1, f6_local7, 1 do
		local f6_local12 = (f6_local9 - 1) * (f6_local1 - f6_local6)
		local f6_local13 = {
			topAnchor = f6_local3,
			bottomAnchor = false,
			leftAnchor = f6_local4,
			rightAnchor = f6_local5,
			width = f6_local1,
			height = f6_local2,
			material = f6_local0
		}
		if f6_local3 then
			f6_local13.top = 0
		end
		if f6_local4 then
			f6_local13.left = f6_local12
		elseif f6_local5 then
			f6_local13.right = -f6_local12
		end
		self:addElement( LUI.UIImage.new( f6_local13 ) )
	end
	return self
end

