local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function RefreshCaptureHudIconHandler()
	return function ( f2_arg0, f2_arg1 )
		local f2_local0 = Game.GetOmnvar( "ui_capture_icon" )
		local f2_local1 = false
		if MLG.IsMLGSpectator() and MLG.GetCurrentView() == MLG.Views.Free then
			f2_local1 = true
		end
		if f2_local0 == 0 or f2_local1 then
			f2_arg0:animateToState( "default", 50 )
			if f2_arg0.timer then
				f2_arg0.timer:close()
				f2_arg0.timer = nil
			end
		else
			if f2_local0 == 1 then
				f2_arg0.captureBar:animateToState( "uncontested" )
				f2_arg0.captureBarGlow:animateToState( "uncontested" )
				f2_arg0.captureText:setText( Engine.Localize( "@MP_DOM_CAPTURING_FLAG" ) )
			elseif f2_local0 == 2 then
				f2_arg0.captureBar:animateToState( "uncontested" )
				f2_arg0.captureBarGlow:animateToState( "uncontested" )
				f2_arg0.captureText:setText( Engine.Localize( "@MP_CAPTURING_HQ" ) )
			elseif f2_local0 == 3 then
				f2_arg0.captureBar:animateToState( "uncontested" )
				f2_arg0.captureBarGlow:animateToState( "uncontested" )
				f2_arg0.captureText:setText( Engine.Localize( "@MP_DESTROYING_HQ" ) )
			elseif f2_local0 == 4 then
				f2_arg0.captureBar:animateToState( "contested" )
				f2_arg0.captureBarGlow:animateToState( "contested" )
				f2_arg0.captureText:setText( Engine.Localize( "@LUA_MENU_CONTESTED" ) )
			elseif f2_local0 == 5 then
				f2_arg0.captureBar:animateToState( "uncontested" )
				f2_arg0.captureBarGlow:animateToState( "uncontested" )
				f2_arg0.captureText:setText( Engine.Localize( "@MP_PLANTING_EXPLOSIVE" ) )
			elseif f2_local0 == 6 then
				f2_arg0.captureBar:animateToState( "uncontested" )
				f2_arg0.captureBarGlow:animateToState( "uncontested" )
				f2_arg0.captureText:setText( Engine.Localize( "@MP_DEFUSING_EXPLOSIVE" ) )
			end
			f2_arg0:animateToState( "visible", 150 )
			if not f2_arg0.timer then
				f2_arg0.timer = LUI.UITimer.new( 100, "refresh_capture" )
				f2_arg0:addElement( f2_arg0.timer )
				f2_arg0:processEvent( {
					name = "refresh_capture"
				} )
			end
		end
	end
	
end

function captureHud()
	local f3_local0 = GameX.IsSplitscreen() and -56 or -100
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f3_local0,
		bottom = f3_local0 - 1,
		left = -1,
		right = 1,
		alpha = 0,
		scale = -1
	} )
	self:registerAnimationState( "visible", {
		alpha = 1,
		scale = 0
	} )
	self.id = "captureDomHudDef"
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.SP_HudAmmoCounterFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 14,
		width = 500,
		height = 18,
		textstyle = CoD.TextStyle.Shadowed
	} )
	self.id = "captureText_id"
	self:setText( "" )
	self:addElement( self )
	local f3_local3 = 100
	local f3_local4 = CoD.CreateState( nil, 14, nil, 24, CoD.AnchorTypes.Top )
	f3_local4.color = Colors.black
	f3_local4.width = f3_local3
	local f3_local5 = LUI.DecoFrame.new( f3_local4, LUI.DecoFrame.Grey )
	self:addElement( f3_local5 )
	local f3_local6 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f3_local6.material = RegisterMaterial( "white" )
	f3_local6.color = Colors.grey_2
	f3_local6.alpha = 0.35
	local self = LUI.UIImage.new( f3_local6 )
	self.id = "captureBarBg_id"
	f3_local5:addElement( self )
	local f3_local8 = CoD.CreateState( 0, 0, 1, 0, CoD.AnchorTypes.TopBottomLeft )
	f3_local8.material = RegisterMaterial( "white" )
	local self = LUI.UIImage.new( f3_local8 )
	self.id = "captureBar_id"
	self:registerAnimationState( "uncontested", {
		color = Colors.white,
		alpha = 1
	} )
	self:registerAnimationState( "contested", {
		color = Colors.white,
		alpha = 0.45
	} )
	f3_local5:addElement( self )
	local f3_local10 = CoD.CreateState( -10, -7, 7, 7, CoD.AnchorTypes.All )
	f3_local10.material = RegisterMaterial( "h1_hud_team_score_glow" )
	f3_local10.color = Colors.white
	local self = LUI.UIImage.new( f3_local10 )
	self.id = "captureBarGlow_id"
	self:registerAnimationState( "uncontested", {
		color = Colors.white,
		alpha = 1
	} )
	self:registerAnimationState( "contested", {
		color = Colors.white,
		alpha = 0.45
	} )
	self:addElement( self )
	local f3_local12 = CoD.CreateState( -2, nil, nil, 2, CoD.AnchorTypes.BottomLeft )
	f3_local12.width = 2
	f3_local12.height = 2
	f3_local12.material = RegisterMaterial( "h1_deco_corner" )
	
	local triangle = LUI.UIImage.new( f3_local12 )
	f3_local5:addElement( triangle )
	self.triangle = triangle
	
	local f3_local14 = RefreshCaptureHudIconHandler()
	self:registerOmnvarHandler( "ui_capture_icon", f3_local14 )
	self:registerEventHandler( "view_change", f3_local14 )
	self:registerEventHandler( "playerstate_client_changed", f3_local14 )
	self.captureBar = self
	self.captureBarGlow = self
	self.captureText = self
	self:registerEventHandler( "refresh_capture", function ( element, event )
		local f4_local0 = 2 + LUI.clamp( Game.GetOmnvar( "ui_capture_progress" ), 0, 1 ) * (f3_local3 - 4)
		element.captureBar:registerAnimationState( "default", CoD.CreateState( 1, 1, f4_local0, -1, CoD.AnchorTypes.TopBottomLeft ) )
		element.captureBar:animateToState( "default", 0 )
		local f4_local1 = CoD.CreateState( -2 + f4_local0, nil, nil, 2, CoD.AnchorTypes.BottomLeft )
		f4_local1.width = 2
		f4_local1.height = 2
		element.captureBar.triangle:registerAnimationState( "move", f4_local1 )
		element.captureBar.triangle:animateToState( "move", 0 )
	end )
	return self
end

LUI.MenuBuilder.registerType( "captureHud", captureHud )
LockTable( _M )
