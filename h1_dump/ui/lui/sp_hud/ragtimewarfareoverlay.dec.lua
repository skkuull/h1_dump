local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MenuBuilder.registerType( "ragtime_warefare_overlay_def", function ()
	local self = LUI.UIElement.new( Engine.IsConsoleGame() and {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		left = -360 * Engine.GetAspectRatio(),
		right = 360 * Engine.GetAspectRatio(),
		top = -360,
		bottom = 360,
		alpha = 0
	} or {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	if Engine.GetDvarBool( "sf_use_chaplin" ) then
		self:animateToState( "show" )
	end
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 114.67,
		right = -114.67,
		height = 96,
		material = RegisterMaterial( "h1_hud_ragtimewarfare_overlay" )
	} ) )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 114.67,
		right = -114.67,
		top = -96,
		height = 96,
		material = RegisterMaterial( "h1_hud_ragtimewarfare_overlay" ),
		zRot = 180
	} ) )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		width = 114.67,
		material = RegisterMaterial( "h1_hud_ragtimewarfare_overlay_sides" )
	} ) )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = -114.67,
		width = 114.67,
		material = RegisterMaterial( "h1_hud_ragtimewarfare_overlay_sides" ),
		zRot = 180
	} ) )
	self.id = "ragtimeWarefareOverlayId"
	return self
end )
LockTable( _M )
