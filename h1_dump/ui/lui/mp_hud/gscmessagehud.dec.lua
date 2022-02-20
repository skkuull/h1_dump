local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
gscHudMessageStrings = {
	"MP_HQ_AVAILABLE_IN",
	"MP_HQ_DESPAWN_IN",
	"MP_HQ_REINFORCEMENTS_IN"
}
f0_local0 = function ( f1_arg0 )
	f1_arg0.endTime = Game.GetOmnvar( "ui_bomb_timer_endtime" )
	local f1_local0 = math.ceil( (f1_arg0.endTime - Game.GetTime()) / 1000 )
	if f1_local0 > 0 then
		local f1_local1 = Game.GetOmnvar( "ui_hud_message_index" )
		if f1_local1 > 0 then
			f1_arg0:setText( Engine.Localize( gscHudMessageStrings[f1_local1], f1_local0 ) )
			f1_arg0:animateToState( "default" )
		else
			f1_arg0:animateToState( "inactive" )
		end
	else
		LUI.UITimer.Disable( f1_arg0.timer )
		f1_arg0:animateToState( "inactive" )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	LUI.UITimer.Enable( f2_arg0.timer )
	LUI.UITimer.Reset( f2_arg0.timer )
	f0_local0( f2_arg0 )
end

f0_local2 = function ()
	local f3_local0 = 175
	local f3_local1 = 15
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 210,
		width = f3_local0,
		height = f3_local1,
		alpha = 1
	} )
	self.id = "kothmessagehud_root_id"
	local f3_local3 = CoD.CreateState( -2, nil, nil, nil, CoD.AnchorTypes.Left )
	f3_local3.height = f3_local1
	f3_local3.width = f3_local0
	f3_local3.font = CoD.TextSettings.TitleFontSmallBold.Font
	f3_local3.alignment = LUI.Alignment.Left
	f3_local3.alpha = 1
	local self = LUI.UIText.new( f3_local3 )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self.id = "message_id"
	self:registerOmnvarHandler( "ui_bomb_timer_endtime", f0_local1 )
	self:registerEventHandler( "koth_message_update", f0_local0 )
	
	local timer = LUI.UITimer.new( 200, "koth_message_update" )
	LUI.UITimer.Disable( timer )
	self:addElement( timer )
	self.timer = timer
	
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "gscMessageHud", function ()
	local self = nil
	local f4_local1 = {}
	if Engine.GetDvarString( "ui_gametype" ) == "koth" then
		f4_local1[#f4_local1 + 1] = f0_local2()
	end
	local f4_local2 = #f4_local1
	if f4_local2 > 0 then
		self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
		self.id = "gscmessagehudroot_id"
		for f4_local3 = 1, f4_local2, 1 do
			self:addElement( f4_local1[f4_local3] )
		end
	end
	return self
end )
LockTable( _M )
