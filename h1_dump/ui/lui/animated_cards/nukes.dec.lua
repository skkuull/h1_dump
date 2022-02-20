local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Nukes = {}
LUI.Playercard.Nukes.new = function ()
	local f1_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local0.material = RegisterAndCacheMaterial( "em_bg_nukes_layer_01" )
	local self = LUI.UIImage.new( f1_local0 )
	local f1_local2 = RegisterAndCacheMaterial( "em_bg_nukes_layer_02" )
	local f1_local3, f1_local4 = GetMaterialDimensions( f1_local2 )
	local f1_local5 = f1_local3 / f1_local4
	local f1_local6 = 220
	local self = LUI.UIImage.new( {
		material = f1_local2,
		rightAnchor = true,
		height = f1_local6,
		width = f1_local6 * f1_local5,
		right = 55
	} )
	f1_local2 = RegisterAndCacheMaterial( "em_bg_nukes_layer_03" )
	local f1_local8, self = GetMaterialDimensions( f1_local2 )
	f1_local5 = f1_local8 / self
	f1_local6 = 220
	self = LUI.UIImage.new( {
		material = f1_local2,
		rightAnchor = true,
		height = f1_local6,
		width = f1_local6 * f1_local5,
		right = 60
	} )
	self:addElement( self )
	self:addElement( self )
	return self
end

LockTable( _M )
