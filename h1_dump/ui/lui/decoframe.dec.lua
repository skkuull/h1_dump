local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.DecoFrame = {}
LUI.DecoFrame.Green = 1
LUI.DecoFrame.Grey = 2
LUI.DecoFrame.Highlight = 3
LUI.DecoFrame.Materials = {}
LUI.DecoFrame.Materials[LUI.DecoFrame.Green] = "h1_ui_frame_green"
LUI.DecoFrame.Materials[LUI.DecoFrame.Grey] = "h1_ui_frame"
LUI.DecoFrame.Materials[LUI.DecoFrame.Highlight] = "h1_ui_scoreboard_highlight_frame"
LUI.DecoFrame.new = function ( f1_arg0, f1_arg1 )
	assert( #LUI.DecoFrame.Materials == LUI.DecoFrame.Highlight )
	local f1_local0 = assert
	local self
	if f1_arg1 ~= nil and (f1_arg1 < LUI.DecoFrame.Green or f1_arg1 > LUI.DecoFrame.Highlight) then
		self = false
	else
		self = true
	end
	f1_local0( self, "Frame type is not within range." )
	f1_local0 = f1_arg0 or CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterMaterial( LUI.DecoFrame.Materials[f1_arg1 or LUI.DecoFrame.Green] )
	self = LUI.UIImage.new( f1_local0 )
	self:setup9SliceImage()
	return self
end

LockTable( _M )
