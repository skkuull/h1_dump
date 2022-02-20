local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function SendEventIfChanged( f1_arg0, f1_arg1 )
	if f1_arg0.current_state ~= f1_arg1 then
		f1_arg0:processEvent( {
			name = f1_arg1
		} )
		f1_arg0.current_state = f1_arg1
	end
end

function AnimateToStateIfChanged( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0.current_state ~= f2_arg1 then
		local f2_local0 = MBh.AnimateToState( f2_arg1, f2_arg2 )
		f2_local0( f2_arg0 )
		f2_arg0.current_state = f2_arg1
		if f2_arg1 == "default" then
			f2_local0 = f2_arg0:getParent()
			if f2_local0 ~= nil then
				f2_local0:processEvent( {
					name = "timer_active"
				} )
			end
		end
	end
end

f0_local0 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Game.GetOmnvar( "ui_bomb_timer" )
	local f3_local1 = Game.GetOmnvar( "ui_carrying_bomb" )
	local f3_local2 = nil
	if f3_local0 == 0 and f3_local1 then
		f3_local2 = "matchTimerBomber"
	elseif f3_local0 == 0 and not f3_local1 then
		f3_local2 = "matchTimer"
	elseif f3_local0 == 4 then
		f3_local2 = "nukeTimer"
	else
		f3_local2 = "bombTimer"
	end
	local f3_local3 = f3_arg0:getChildById( "bomb_timer_id" )
	local f3_local4 = f3_arg0:getChildById( "match_timer_id" )
	if f3_local0 == 0 then
		local f3_local5 = Game.GetTimeLeft()
		if f3_local5 <= 0 then
			AnimateToStateIfChanged( f3_local4, "inactive", 0 )
		elseif f3_local5 <= 30000 then
			SendEventIfChanged( f3_local4, "flash" )
		else
			AnimateToStateIfChanged( f3_local4, "default", 0 )
		end
		AnimateToStateIfChanged( f3_local3, "inactive", 0 )
	else
		AnimateToStateIfChanged( f3_local4, "inactive", 0 )
		local f3_local5 = Game.GetTime()
		local f3_local6 = 0
		if f3_local0 == 4 then
			f3_local6 = Game.GetOmnvar( "ui_nuke_end_milliseconds" )
		else
			f3_local6 = Game.GetOmnvar( "ui_bomb_timer_endtime" )
			local f3_local7 = Game.GetOmnvar( "ui_bomb_timer_endtime_2" )
			if f3_local5 < f3_local7 and (f3_local6 == 0 or f3_local7 < f3_local6) then
				f3_local6 = f3_local7
			end
		end
		if f3_local6 - f3_local5 > 0 then
			f3_local3:setEndTime( f3_local6 )
		end
		SendEventIfChanged( f3_local3, "flash" )
	end
end

f0_local1 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0:getChildById( "match_timer_id" )
	local f4_local1 = f4_arg0:getChildById( "bomb_timer_id" )
	f4_local0.current_state = nil
	f4_local1.current_state = nil
	f0_local0( f4_arg0, f4_arg1 )
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	if Game.GetOmnvar( "ui_bomb_timer" ) == 0 then
		f0_local1( f5_arg0, f5_arg1 )
	end
end

local f0_local3 = function ( f6_arg0, f6_arg1 )
	if Game.GetOmnvar( "ui_bomb_timer" ) == 0 then
		SendEventIfChanged( f6_arg0, "flash" )
	end
end

local f0_local4 = function ( f7_arg0, f7_arg1 )
	f7_arg0:animateToState( "inactive" )
	local f7_local0 = f7_arg0:getParent()
	if f7_local0 ~= nil then
		f7_local0:processEvent( {
			name = "timer_timeout"
		} )
	end
end

LUI.MenuBuilder.registerType( "timersHudDef", function ()
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = -20,
		width = 60,
		height = CoD.TextSettings.TitleFontBold22.Height,
		alpha = 1
	} )
	self.id = "timersHud_id"
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerEventHandler( "timeBeingReset", f0_local2 )
	self:registerOmnvarHandler( "ui_bomb_timer", f0_local0 )
	local self = LUI.UICountdown.new( {
		endTime = "round_end"
	} )
	self.id = "match_timer_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		color = Swatches.HUD.Normal,
		alpha = 1,
		alignment = LUI.Alignment.Center
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerEventHandler( "flash", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "time30sec", f0_local3 )
	self:registerEventHandler( "timeout", f0_local4 )
	self:registerEventHandler( "timeReset", MBh.EmitEventToParent( "timeBeingReset" ) )
	local self = LUI.UICountdown.new( {} )
	self.id = "bomb_timer_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		alignment = LUI.Alignment.Center,
		color = Swatches.HUD.Normal,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "white", {
		color = Swatches.HUD.Normal,
		alpha = 1
	} )
	self:registerAnimationState( "red", {
		color = Swatches.HUD.Warning,
		alpha = 1
	} )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerEventHandler( "flash", MBh.AnimateLoop( {
		{
			"red",
			1000
		},
		{
			"white",
			0
		}
	} ) )
	self:addElement( self )
	self:addElement( self )
	f0_local0( self )
	return self
end )
LockTable( _M )
