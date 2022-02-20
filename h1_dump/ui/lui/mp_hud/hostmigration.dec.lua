local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:setText( Game.GetMigrationStatus() )
end

f0_local2 = function ()
	local self = LUI.UIElement.new()
	self.id = "percentage_display_id"
	self:registerAnimationState( "default", {
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 30,
		height = 65
	} )
	self:animateToState( "default", 0 )
	local self = LUI.UIText.new()
	self.id = "hm_description_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		height = CoD.TextSettings.BodyFontBold.Height,
		font = CoD.TextSettings.BodyFontBold.Font,
		alignment = LUI.Alignment.center
	} )
	self:animateToState( "default", 0 )
	self:setText( "" )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerEventHandler( "host_migration_update", f0_local1 )
	LUI.MenuBuilder.BuildAddChild( self, {
		type = "UITimer",
		id = "hm_description_refresh_id",
		properties = {
			event = "host_migration_update",
			interval = 250
		}
	} )
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "host_migration_main", function ()
	local self = LUI.UIText.new()
	self.id = "host_migration_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 100,
		left = 0,
		height = CoD.TextSettings.TitleFontLarge.Height,
		font = CoD.TextSettings.TitleFontLarge.Font,
		alignment = LUI.Alignment.center
	} )
	self:animateToState( "default", 0 )
	self:setText( Engine.Localize( "@LUA_MENU_HOST_MIGRATION_CAPS" ) )
	self:registerEventHandler( "hide_host_migration", f0_local0 )
	self:addElement( f0_local2() )
	return self
end )
LockTable( _M )
