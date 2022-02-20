local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 1500
f0_local1 = 5000
if Engine.IsDevelopmentBuild() then
	f0_local0 = 0
	f0_local1 = 5000
end
function BriefingMenu( f1_arg0, f1_arg1 )
	local f1_local0
	if Engine.GetDvarInt( "ui_currentLevelIndex" ) >= Engine.GetProfileData( "highestCinematic" ) then
		f1_local0 = Engine.GetDvarBool( "ui_allowSkip" )
	else
		f1_local0 = true
	end
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 720,
		left = 0,
		right = 1280,
		alpha = 1
	} )
	local self = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		top = -80,
		bottom = -80 + CoD.TextSettings.BodyFont18.Height,
		left = -260,
		right = -60,
		font = CoD.TextSettings.BodyFont18.Font,
		alignment = LUI.Alignment.Right,
		alpha = 0
	} )
	if f1_local0 then
		self:registerAnimationState( "show", {
			alpha = 1
		} )
		self:registerAnimationState( "hide", {
			alpha = 0
		} )
		if CoD.UsingController() then
			self:setText( Engine.Localize( "@PLATFORM_HOLD_TO_SKIP" ) )
		else
			self:setText( Engine.Localize( "@PLATFORM_HOLD_TO_SKIP_KEYBOARD" ) )
		end
		local f1_local3 = function ( f2_arg0 )
			if f2_arg0.activeCount <= 0 and f2_arg0.showCount <= 0 then
				if f2_arg0.disableTimer == nil then
					f2_arg0.disableTimer = LUI.UITimer.new( f0_local1, "disable_skip", nil, false )
					f2_arg0.disableTimer.id = "disableTimer"
					f2_arg0:addElement( f2_arg0.disableTimer )
				end
				LUI.UITimer.Reset( f2_arg0.disableTimer )
			end
		end
		
		local f1_local4 = function ( f3_arg0, f3_arg1 )
			if f3_arg0.activeCount <= 0 then
				if f3_arg0.showCount <= 0 then
					local f3_local0 = f3_arg0:getParent()
					f3_local0:animateToState( "show", 300 )
				end
				f3_arg0.activeCount = f3_arg0.activeCount + 1
				if f3_arg0.disableTimer ~= nil then
					LUI.UITimer.Stop( f3_arg0.disableTimer )
				end
				if f3_arg0.skipTimer == nil then
					f3_arg0.skipTimer = LUI.UITimer.new( f0_local0, "do_skip", nil, false )
					f3_arg0:addElement( f3_arg0.skipTimer )
				end
				LUI.UITimer.Reset( f3_arg0.skipTimer )
			end
		end
		
		local f1_local5 = function ( f4_arg0, f4_arg1 )
			if f4_arg0.activeCount <= 0 then
				return 
			end
			f4_arg0.activeCount = f4_arg0.activeCount - 1
			f1_local3( f4_arg0 )
			if f4_arg0.skipTimer ~= nil then
				LUI.UITimer.Stop( f4_arg0.skipTimer )
			end
		end
		
		local f1_local6 = function ( f5_arg0, f5_arg1 )
			if f5_arg0.showCount <= 0 then
				local f5_local0 = f5_arg0:getParent()
				f5_local0:animateToState( "show", 300 )
			elseif f5_arg0.disableTimer ~= nil then
				LUI.UITimer.Reset( f5_arg0.disableTimer )
			end
			f5_arg0.showCount = f5_arg0.showCount + 1
		end
		
		local f1_local7 = function ( f6_arg0, f6_arg1 )
			if f6_arg0.showCount <= 0 then
				return 
			else
				f6_arg0.showCount = f6_arg0.showCount - 1
				f1_local3( f6_arg0 )
			end
		end
		
		local f1_local8 = function ( f7_arg0, f7_arg1 )
			Engine.PlayerStart( f7_arg1.controller )
			if f7_arg0.disableTimer ~= nil then
				LUI.UITimer.Stop( f7_arg0.disableTimer )
			end
			if f7_arg0.skipTimer ~= nil then
				LUI.UITimer.Stop( f7_arg0.skipTimer )
			end
		end
		
		local f1_local9 = function ( f8_arg0, f8_arg1 )
			local f8_local0 = f8_arg0:getParent()
			f8_local0:animateToState( "hide", 300 )
			if f8_arg0.disableTimer ~= nil then
				LUI.UITimer.Stop( f8_arg0.disableTimer )
			end
		end
		
		local f1_local10 = function ( f9_arg0, f9_arg1 )
			f1_local4( f9_arg0.text.bindButton, f9_arg1 )
		end
		
		local f1_local11 = function ( f10_arg0, f10_arg1 )
			f1_local5( f10_arg0.text.bindButton, f10_arg1 )
		end
		
		local f1_local12 = function ( f11_arg0, f11_arg1 )
			f1_local6( f11_arg0.text.bindButton, f11_arg1 )
		end
		
		local f1_local13 = function ( f12_arg0, f12_arg1 )
			f1_local7( f12_arg0.text.bindButton, f12_arg1 )
		end
		
		local self = LUI.UIBindButton.new()
		self:registerEventHandler( "do_skip", f1_local8 )
		self:registerEventHandler( "button_action", f1_local4 )
		self:registerEventHandler( "button_action_released", f1_local5 )
		self:registerEventHandler( "button_secondary", f1_local6 )
		self:registerEventHandler( "button_secondary_released", f1_local7 )
		if CoD.UsingController() then
			self:registerEventHandler( "button_alt1", f1_local6 )
			self:registerEventHandler( "button_alt1_released", f1_local7 )
			self:registerEventHandler( "button_alt2", f1_local6 )
			self:registerEventHandler( "button_alt2_released", f1_local7 )
			if Engine.IsDevelopmentBuild() then
				self:setHandleMouseButton( true )
				self:registerEventHandler( "leftmousedown", f1_local10 )
				self:registerEventHandler( "leftmouseup", f1_local11 )
			end
		else
			self:registerEventHandler( "button_start", f1_local6 )
			self:registerEventHandler( "button_start_released", f1_local7 )
			if Engine.IsDevelopmentBuild() then
				self:setHandleMouseButton( true )
				self:registerEventHandler( "leftmousedown", f1_local10 )
				self:registerEventHandler( "leftmouseup", f1_local11 )
			else
				self:setHandleMouseButton( true )
				self:registerEventHandler( "leftmousedown", f1_local12 )
				self:registerEventHandler( "leftmouseup", f1_local13 )
			end
		end
		self:registerEventHandler( "disable_skip", f1_local9 )
		self.handlePrimary = true
		self.handleRelease = true
		self.activeCount = 0
		self.showCount = 0
		self.bindButton = self
		self:addElement( self )
	end
	self.text = self
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "LuiBriefingMenu", BriefingMenu )
LockTable( _M )
