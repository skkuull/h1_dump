local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FocusablePlayercard = InheritFrom( LUI.Playercard )
LUI.FocusablePlayercard.new = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = LUI.Playercard.new( f1_arg0, f1_arg2 )
	f1_local0:makeFocusable()
	local self = LUI.UIButton.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:clearActionSFX()
	f1_local0:addElement( self )
	if f1_arg1 then
		self:registerEventHandler( "button_action", f1_arg1 )
	end
	local f1_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local2.material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	local self = LUI.UIImage.new( f1_local2 )
	self:setup9SliceImage()
	self:addElement( self )
	return f1_local0
end

LockTable( _M )
