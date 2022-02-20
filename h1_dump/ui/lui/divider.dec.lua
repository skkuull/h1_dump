local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Divider = {}
LUI.Divider.Green = 1
LUI.Divider.Grey = 2
LUI.Divider.Materials = {}
LUI.Divider.Materials[LUI.Divider.Green] = "h1_ui_divider_green"
LUI.Divider.Materials[LUI.Divider.Grey] = "h1_ui_divider"
LUI.Divider.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	assert( #LUI.Divider.Materials == LUI.Divider.Grey )
	local f1_local0 = assert
	local self
	if f1_arg2 ~= nil and (f1_arg2 < LUI.Divider.Green or f1_arg2 > LUI.Divider.Grey) then
		self = false
	else
		self = true
	end
	f1_local0( self, "Divider type is not within range." )
	f1_local0 = f1_arg0 or CoD.CreateState( 0, 0, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f1_local0.height = f1_arg3 or 2
	f1_local0.material = RegisterMaterial( LUI.Divider.Materials[f1_arg2 or LUI.Divider.Green] )
	self = LUI.UIImage.new( f1_local0 )
	self:setup3SliceRatio( f1_arg1 or 12, 0.3 )
	return self
end

LockTable( _M )
