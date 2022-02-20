local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnFriendlyStatusChanged( f1_arg0, f1_arg1 )
	local f1_local0 = Game.GetOmnvar( "ui_ctf_friendly_status" )
	local f1_local1 = -1
	local f1_local2 = ""
	if f1_local0 == 0 then
		f1_arg0:setText( Engine.Localize( "@OBJECTIVES_FLAG_HOME" ) )
		f1_arg0:setGlow( nil, 0 )
		f1_arg0.arrow:animateToState( "hidden" )
	elseif f1_local0 == 1 then
		f1_arg0:setText( Engine.Localize( "@OBJECTIVES_FLAG_AWAY" ) )
		f1_arg0:setGlow( nil, 0 )
		f1_arg0.arrow:animateToState( "visible" )
	else
		f1_local2 = Game.GetPlayerName( Game.GetOmnvar( "ui_ctf_friendly_carrier_clientnum" ) )
		if string.len( f1_local2 ) > 18 then
			f1_local2 = string.sub( f1_local2, 1, 22 )
			if Engine.IsRightToLeftLanguage() then
				f1_local2 = "..." .. f1_local2
			else
				f1_local2 = f1_local2 .. "..."
			end
		end
		f1_arg0:setText( f1_local2 )
		f1_arg0:setGlow( Swatches.HUD.Party, 0.1, 0.1 )
		f1_arg0.arrow:animateToState( "visible" )
	end
end

function OnEnemyStatusChanged( f2_arg0, f2_arg1 )
	local f2_local0 = Game.GetOmnvar( "ui_ctf_enemy_status" )
	local f2_local1 = -1
	local f2_local2 = ""
	if f2_local0 == 0 then
		f2_arg0:setText( Engine.Localize( "@OBJECTIVES_FLAG_HOME" ) )
		f2_arg0:setGlow( nil, 0 )
		f2_arg0.arrow:animateToState( "hidden" )
	elseif f2_local0 == 1 then
		f2_arg0:setText( Engine.Localize( "@OBJECTIVES_FLAG_AWAY" ) )
		f2_arg0:setGlow( nil, 0 )
		f2_arg0.arrow:animateToState( "visible" )
	else
		f2_local2 = Game.GetPlayerName( Game.GetOmnvar( "ui_ctf_enemy_carrier_clientnum" ) )
		if string.len( f2_local2 ) > 18 then
			f2_local2 = string.sub( f2_local2, 1, 22 )
			if Engine.IsRightToLeftLanguage() then
				f2_local2 = "..." .. f2_local2
			else
				f2_local2 = f2_local2 .. "..."
			end
		end
		f2_arg0:setText( f2_local2 )
		f2_arg0:setGlow( Swatches.HUD.Enemies, 0.1, 0.1 )
		f2_arg0.arrow:animateToState( "visible" )
	end
end

function UpdateWidgetPos( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getChildById( "friendly_text" )
	local f3_local1 = f3_arg0:getChildById( "enemy_text" )
	OnFriendlyStatusChanged( f3_local0, 1 )
	OnEnemyStatusChanged( f3_local1, 1 )
end

function ctfHudSummary()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:registerEventHandler( "playerstate_client_changed", UpdateWidgetPos )
	local f4_local1 = 193
	local f4_local2 = 12
	local f4_local3 = 26
	local f4_local4 = 210
	local f4_local5 = 12
	local f4_local6 = 26
	local f4_local7 = CoD.TextSettings.TitleFontSmallBold
	local f4_local8 = 10
	local f4_local9 = f4_local1 + f4_local3 * 0.5 - f4_local8 * 0.5
	local f4_local10 = f4_local2 + f4_local3 + 2
	local f4_local11 = f4_local4 + f4_local6 * 0.5 - f4_local8 * 0.5
	local f4_local12 = f4_local5 + f4_local6 + 2
	local f4_local13 = CoD.CreateState( 0, f4_local9 - 2, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local13.material = RegisterMaterial( "black" )
	f4_local13.width = 200
	f4_local13.height = f4_local8 + 4
	f4_local13.alpha = 0.65
	local self = LUI.UIImage.new( f4_local13 )
	self.id = "friendly_text_background"
	self:addElement( self )
	f4_local13.top = f4_local11 - 2
	local self = LUI.UIImage.new( f4_local13 )
	self.id = "enemy_text_background"
	self:addElement( self )
	local f4_local16 = CoD.CreateState( f4_local2, f4_local1, f4_local2 + f4_local3, f4_local1 + f4_local3, CoD.AnchorTypes.TopLeft )
	f4_local16.material = RegisterMaterial( "waypoint_flag_friendly" )
	self:addElement( LUI.UIImage.new( f4_local16 ) )
	local f4_local17 = CoD.CreateState( f4_local5, f4_local4, f4_local5 + f4_local6, f4_local4 + f4_local6, CoD.AnchorTypes.TopLeft )
	f4_local17.material = RegisterMaterial( "waypoint_flag_enemy" )
	self:addElement( LUI.UIImage.new( f4_local17 ) )
	local f4_local18 = CoD.CreateState( f4_local10, f4_local9, 0, f4_local9 + f4_local8, CoD.AnchorTypes.TopLeftRight )
	f4_local18.font = f4_local7.Font
	f4_local18.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f4_local18 )
	self.id = "friendly_text"
	self:setText( Engine.Localize( "@OBJECTIVES_FLAG_HOME" ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:setAlpha( 0.85 )
	self:addElement( self )
	local f4_local20 = (f4_local8 - 6) / 2
	local f4_local21 = CoD.CreateState( 6, f4_local9 + f4_local20, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local21.width = 6
	f4_local21.height = 6
	f4_local21.zRot = 90
	f4_local21.material = RegisterMaterial( "h1_deco_indicator_arrow" )
	f4_local21.alpha = 0
	
	local arrow = LUI.UIImage.new( f4_local21 )
	arrow.id = "friendly_arrow"
	arrow:registerAnimationState( "hidden", {
		alpha = 0
	} )
	arrow:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:addElement( arrow )
	self.arrow = arrow
	
	local f4_local23 = CoD.CreateState( f4_local12, f4_local11, 0, f4_local11 + f4_local8, CoD.AnchorTypes.TopLeftRight )
	f4_local23.font = f4_local7.Font
	f4_local23.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f4_local23 )
	self.id = "enemy_text"
	self:setText( Engine.Localize( "@OBJECTIVES_FLAG_HOME" ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:setAlpha( 0.85 )
	self:addElement( self )
	f4_local21.top = f4_local11 + f4_local20
	
	local arrow = LUI.UIImage.new( f4_local21 )
	arrow.id = "enemy_arrow"
	arrow:registerAnimationState( "hidden", {
		alpha = 0
	} )
	arrow:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:addElement( arrow )
	self.arrow = arrow
	
	self:registerOmnvarHandler( "ui_ctf_status_changed", OnFriendlyStatusChanged )
	self:registerOmnvarHandler( "ui_ctf_status_changed", OnEnemyStatusChanged )
	UpdateWidgetPos( self )
	return self
end

function ctfHudDef()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self.id = "ctf_hud"
	self:addElement( ctfHudSummary() )
	return self
end

LUI.MenuBuilder.registerType( "ctfHudDef", ctfHudDef )
LockTable( _M )
