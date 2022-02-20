local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.Playercard.Bootcamp = {}
LUI.Playercard.Bootcamp.new = function ()
	local f1_local0 = 256
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterAndCacheMaterial( "em_bg_bootcamp_layer_01" )
	local self = LUI.UIImage.new( f1_local1 )
	local f1_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f1_local3.width = f1_local0
	f1_local3.height = f1_local0
	f1_local3.zRot = 30
	f1_local3.material = RegisterAndCacheMaterial( "em_bg_bootcamp_layer_02" )
	self:addElement( LUI.UIImage.new( f1_local3 ) )
	local f1_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local4.material = RegisterAndCacheMaterial( "em_bg_bootcamp_layer_03" )
	self:addElement( LUI.UIImage.new( f1_local4 ) )
	local f1_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f1_local5.width = f1_local0
	f1_local5.height = f1_local0
	f1_local5.zRot = 330
	f1_local5.material = RegisterAndCacheMaterial( "em_bg_bootcamp_layer_04" )
	self:addElement( LUI.UIImage.new( f1_local5 ) )
	local f1_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local6.material = RegisterAndCacheMaterial( "em_bg_bootcamp_layer_05" )
	self:addElement( LUI.UIImage.new( f1_local6 ) )
	return self
end

LockTable( _M )
