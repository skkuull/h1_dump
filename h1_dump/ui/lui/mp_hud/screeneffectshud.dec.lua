local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.value == true then
		f1_arg0:processEvent( {
			name = "damage_flash"
		} )
	end
end

function lowHealthHudDef()
	local self = LUI.UILitImage.new()
	self.id = "lowHealthHudDefId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGLowHealthOverlay )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "h1_fullscreen_lit_bloodsplat_01" )
	} )
	self:animateToState( "default", 0 )
	return self
end

function damageFlashDef()
	local self = LUI.UIImage.new()
	self.id = "damageFlashDefId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "hudcolorbarsimple" ),
		red = 0.6,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 0.3
	} )
	self:registerOmnvarHandler( "ui_damage_flash", f0_local0 )
	self:registerEventHandler( "damage_flash", MBh.AnimateSequence( {
		{
			"active",
			50
		},
		{
			"default",
			600
		}
	} ) )
	self:animateToState( "default", 0 )
	return self
end

LUI.MenuBuilder.registerType( "lowHealthHudDef", lowHealthHudDef )
LUI.MenuBuilder.registerType( "damageFlashDef", damageFlashDef )
LockTable( _M )
