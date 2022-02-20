local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function flareAnimation()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -75,
		height = 0,
		left = -25,
		width = 0
	} )
	self.id = "flareAnimation"
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = -50,
		top = -48,
		width = 100,
		height = 100,
		alpha = 1
	} )
	self:registerAnimationState( "transparent", {
		alpha = 0.5
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self.id = "flare1Wrapper"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "h1_hud_score_feed_glow" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		scale = 0
	} )
	self:registerAnimationState( "expanded", {
		scale = 0.3
	} )
	self:registerAnimationState( "shrunk", {
		scale = -0.2
	} )
	self:registerAnimationState( "hidden", {
		scale = -1
	} )
	self.id = "flare1"
	self:addElement( self )
	local f1_local3 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"transparent",
			300,
			true,
			true
		},
		{
			"transparent",
			600,
			true,
			true
		},
		{
			"hidden",
			250,
			true,
			true
		}
	} )
	local f1_local4 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"expanded",
			150,
			true,
			true
		},
		{
			"shrunk",
			1000,
			true,
			true
		}
	} )
	local f1_local5 = MBh.AnimateSequence( {
		{
			"hidden",
			350,
			true,
			true
		}
	} )
	local f1_local6 = MBh.AnimateSequence( {
		{
			"shrunk",
			250
		},
		{
			"hidden",
			100,
			true,
			true
		}
	} )
	self:animateToState( "hidden" )
	self:registerEventHandler( "open_flare", f1_local3 )
	self:registerEventHandler( "close_flare", f1_local5 )
	self:registerEventHandler( "open_flare", f1_local4 )
	self:registerEventHandler( "close_flare", f1_local6 )
	return self
end

function pointsPopupEvent( f2_arg0 )
	local f2_local0 = 200
	local f2_local1 = CoD.TextSettings.TitleFontBold
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:registerAnimationState( "expanded", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		height = 20,
		left = 0,
		right = 0
	} )
	local self = MBh.AnimateSequence( {
		{
			"default",
			f2_local0
		},
		{
			"expanded",
			100
		}
	} )
	self( self, {} )
	self = LUI.UIText.new( {
		alignment = LUI.Alignment.Left,
		font = f2_local1.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = -75,
		right = 0,
		height = 20,
		color = Colors.s1Hud_gold,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:setText( Engine.Localize( f2_arg0 ) )
	local f2_local4 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f2_local0
		},
		{
			"visible",
			0
		}
	} )
	f2_local4( self, {} )
	self:addElement( self )
	return self
end

function pointsPopup()
	local f3_local0 = CoD.TextSettings.TitleFontBold
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 10,
		height = 0,
		left = 20,
		width = 0
	} )
	self.id = "pointsPopup"
	self.processOmnvarEvent = true
	local f3_local2 = function ()
		self.ttl = Game.GetTime() + 1000
		if not self.visible then
			self:processEvent( {
				name = "reset"
			} )
			self:processEvent( {
				name = "open_flare",
				dispatchChildren = true
			} )
		end
		self.visible = true
		if not self.timer then
			self.timer = LUI.UITimer.new( 100, "monitor_ttl" )
			self.timer.id = "timer"
			self:addElement( self.timer )
			self:registerEventHandler( "monitor_ttl", function ( element, event )
				if element.ttl < Game.GetTime() then
					self.timer:close()
					self.timer = nil
					self:processEvent( {
						name = "close_flare",
						dispatchChildren = true
					} )
					self:processEvent( {
						name = "fade"
					} )
					self.visible = false
				end
			end )
		end
	end
	
	self:addElement( flareAnimation() )
	local self = LUI.UIText.new( {
		font = f3_local0.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = -50,
		top = -85,
		right = 0,
		height = 30,
		alpha = 1,
		scale = 0,
		color = Colors.s1Hud_gold
	} )
	self:registerAnimationState( "start", {
		scale = -0.25,
		alpha = 1
	} )
	self:registerAnimationState( "pop", {
		scale = 0.5,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		scale = 0.5,
		alpha = 0
	} )
	self.id = "points"
	self:registerEventHandler( "fade", function ( element, event )
		element.active = false
		element:animateToState( "hidden", 100 )
	end )
	self:registerEventHandler( "reset", function ( element, event )
		element:setText( "" )
		element:animateToState( "default" )
	end )
	self:registerOmnvarHandler( "ui_points_popup", function ( f8_arg0, f8_arg1 )
		if not Game.InKillCam() and self.processOmnvarEvent then
			local f8_local0 = Game.GetPlayerClientnum()
			local f8_local1 = Game.GetPlayerstateClientnum()
			local f8_local2 = Game.GetOmnvar( "ui_session_state" ) == "spectator"
			if f8_arg1.value > 0 then
				f3_local2()
				f8_arg0:setText( "+" .. f8_arg1.value )
				if f8_arg0.active ~= true then
					f8_arg0.active = true
					local f8_local3 = MBh.AnimateSequence( {
						{
							"start",
							0
						},
						{
							"pop",
							50
						},
						{
							"default",
							150
						}
					} )
					f8_local3( f8_arg0, {} )
				end
			end
		end
	end )
	self:addElement( self )
	local f3_local4 = 0
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 24,
		height = 0,
		left = 20,
		width = 400,
		alpha = 1,
		spacing = 2
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "fade", MBh.AnimateToState( "hidden", 100 ) )
	self:registerEventHandler( "reset", function ( element, event )
		element:closeChildren()
		element:animateToState( "default" )
	end )
	self:registerOmnvarHandler( "ui_points_popup_event", function ( f10_arg0, f10_arg1 )
		if not Game.InKillCam() and self.processOmnvarEvent then
			local f10_local0 = Game.GetPlayerClientnum()
			local f10_local1 = Game.GetPlayerstateClientnum()
			local f10_local2 = Game.GetOmnvar( "ui_session_state" ) == "spectator"
			local f10_local3 = Engine.TableLookupByRow( XPEventTable.File, f10_arg1.value, XPEventTable.Cols.ScoreCallout )
			if f10_local3 and #f10_local3 > 0 then
				f3_local4 = f3_local4 + 1
				local f10_local4 = pointsPopupEvent( f10_local3 )
				f10_local4:setPriority( -f3_local4 )
				f10_local4.id = "event_" .. f3_local4
				f10_arg0:addElement( f10_local4 )
			end
		end
	end )
	self.id = "eventsList"
	self:addElement( self )
	self.curClientNum = Game.GetPlayerstateClientnum()
	self:registerEventHandler( "playerstate_client_changed", function ( element, event )
		local f11_local0 = Game.GetPlayerstateClientnum()
		if self.curClientNum ~= f11_local0 then
			self.curClientNum = f11_local0
			if not Game.InKillCam() then
				self.processOmnvarEvent = true
			else
				self.processOmnvarEvent = false
			end
		end
	end )
	return self
end

LUI.MenuBuilder.registerType( "pointsPopup", pointsPopup )
LockTable( _M )
