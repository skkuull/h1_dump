local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	if Game.GetTime() < f1_arg0.endTime then
		f1_arg0:animateToState( "default", 0 )
	else
		f1_arg0:animateToState( "inactive", 0 )
	end
end

f0_local1 = function ( f2_arg0 )
	if f2_arg0.bomb1.active == true then
		f2_arg0.bomb1:animateToState( "poisition" .. f2_arg0.numActiveBombs, 0 )
	end
	if f2_arg0.bomb2.active == true then
		f2_arg0.bomb2:animateToState( "poisition" .. f2_arg0.numActiveBombs, 0 )
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getParent()
	f3_arg0.endTime = f3_arg1.value
	if f3_arg0.endTime - Game.GetTime() > 0 then
		f3_arg0.bombTimer:setEndTime( f3_arg0.endTime )
		f3_arg0.bombIcon:animateToState( "default", 0 )
		if f3_arg0.active == false then
			f3_local0.numActiveBombs = f3_local0.numActiveBombs + 1
			f3_arg0.active = true
			f3_arg0:animateToState( "poisition" .. f3_local0.numActiveBombs, 0 )
		end
	else
		f3_arg0.bombIcon:animateToState( "inactive", 0 )
		if f3_arg0.active == true then
			f3_arg0.active = false
			f3_local0.numActiveBombs = f3_local0.numActiveBombs - 1
			f0_local1( f3_local0 )
		end
	end
end

LUI.MenuBuilder.registerType( "bombHudDef", function ()
	local f4_local0 = GameX.IsSplitscreen()
	local f4_local1 = 100
	local f4_local2 = 70
	local f4_local3 = 32
	local f4_local4
	if f4_local0 then
		f4_local4 = 0
		if not f4_local4 then
		
		else
			local f4_local5
			if f4_local0 then
				f4_local5 = 210
				if not f4_local5 then
				
				else
					if Engine.GetDvarString( "ui_gametype" ) == "sd" then
						f4_local4 = f4_local4 + 32
					end
					local self = LUI.UIElement.new( {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = f4_local4,
						left = f4_local5,
						width = f4_local1,
						height = f4_local2,
						alpha = 1
					} )
					self.id = "bombHud_id"
					self:registerAnimationState( "inactive", {
						alpha = 0
					} )
					self.numActiveBombs = 0
					local f4_local7 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
					f4_local7.height = f4_local3
					f4_local7.width = f4_local3
					local self = LUI.UIElement.new( f4_local7 )
					self.id = "bomb_1_container"
					self:addElement( self )
					self:registerAnimationState( "poisition1", f4_local7 )
					self.active = false
					local self = LUI.UIElement.new( f4_local7 )
					self.id = "bomb_2_container"
					self:addElement( self )
					self:registerAnimationState( "poisition1", f4_local7 )
					self.active = false
					self.bomb1 = self
					self.bomb2 = self
					local f4_local10 = nil
					if GameX.GetGameMode() == "sab" then
						f4_local10 = RegisterMaterial( "h1_hud_suitcase_bomb_planted" )
					else
						f4_local10 = RegisterMaterial( "h1_hud_suitcase_bomb_planted_a" )
					end
					local f4_local11 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.Left )
					f4_local11.height = f4_local3
					f4_local11.width = f4_local3
					f4_local11.material = f4_local10
					f4_local11.alpha = 1
					
					local bombIcon = LUI.UIImage.new( f4_local11 )
					bombIcon:registerAnimationState( "inactive", {
						alpha = 0
					} )
					self:addElement( bombIcon )
					self.bombIcon = bombIcon
					
					local f4_local13 = CoD.CreateState( 6, -6, nil, nil, CoD.AnchorTypes.Right )
					f4_local13.font = CoD.TextSettings.TitleFontSmallBold.Font
					f4_local13.height = 20
					f4_local13.width = f4_local1 - f4_local3 + 4
					f4_local13.color = Swatches.HUD.Warning
					f4_local13.alignment = LUI.Alignment.Left
					f4_local13.alpha = 1
					local self = LUI.UICountdown.new( {} )
					self.id = "bomb_timer_one_id"
					self:registerAnimationState( "default", f4_local13 )
					self:registerOmnvarHandler( "ui_bomb_timer_endtime", function ( f5_arg0, f5_arg1 )
						f0_local2( self, f5_arg1 )
					end )
					self:animateToState( "default", 0 )
					self.bombTimer = self
					bombIcon:addElement( self )
					f0_local2( self, {
						value = 0
					} )
					f4_local7.topAnchor = false
					f4_local7.top = nil
					f4_local7.bottomAnchor = true
					f4_local7.bottom = 0
					self:registerAnimationState( "poisition2", f4_local7 )
					self:registerAnimationState( "poisition2", f4_local7 )
					f4_local11.material = RegisterMaterial( "h1_hud_suitcase_bomb_planted_b" )
					
					local bombIcon = LUI.UIImage.new( f4_local11 )
					bombIcon:registerAnimationState( "inactive", {
						alpha = 0
					} )
					self:addElement( bombIcon )
					self.bombIcon = bombIcon
					
					local bombTimer = LUI.UICountdown.new( {} )
					bombTimer.id = "bomb_timer_two_id"
					bombTimer:registerAnimationState( "default", f4_local13 )
					bombTimer:registerOmnvarHandler( "ui_bomb_timer_endtime_2", function ( f6_arg0, f6_arg1 )
						f0_local2( self, f6_arg1 )
					end )
					bombTimer:animateToState( "default", 0 )
					bombIcon:addElement( bombTimer )
					self.bombTimer = bombTimer
					
					f0_local2( self, {
						value = 0
					} )
					return self
				end
			end
			f4_local5 = 20
		end
	end
	f4_local4 = 205
end )
LockTable( _M )
