local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function hardpointStatus()
	local f1_local0 = CoD.TextSettings.TitleFont.Font
	local f1_local1 = 18
	local f1_local2 = GameX.IsSplitscreen()
	local f1_local3
	if f1_local2 then
		f1_local3 = 0
		if not f1_local3 then
		
		else
			local f1_local4
			if f1_local2 then
				f1_local4 = 210
				if not f1_local4 then
				
				else
					local self = LUI.UIElement.new( {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = f1_local3,
						bottom = 0,
						left = f1_local4,
						right = 0,
						alpha = 0
					} )
					self:registerAnimationState( "visible", {
						alpha = 0.8
					} )
					self.id = "hardpointStatus"
					local f1_local6 = Engine.Localize( "LUA_MP_COMMON_HARDPOINT_STATUS" )
					local self = LUI.UIText.new( {
						font = f1_local0,
						alignment = LUI.Alignment.Left,
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						left = 0,
						top = 0,
						right = 0,
						height = f1_local1
					} )
					self.id = "statusText"
					self:setText( f1_local6 )
					self:addElement( self )
					local f1_local8, f1_local9, f1_local10, f1_local11 = GetTextDimensions( f1_local6, f1_local0, f1_local1 )
					local self = LUI.UICountdown.new( {} )
					self:registerAnimationState( "default", {
						font = f1_local0,
						alignment = LUI.Alignment.Left,
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = f1_local10 + 10,
						top = 0,
						right = 0,
						height = f1_local1
					} )
					self:animateToState( "default", 0 )
					self.id = "countdown"
					self:addElement( self )
					local f1_local13 = function ( f2_arg0, f2_arg1 )
						local f2_local0 = Game.GetOmnvar( "ui_hardpoint_timer" )
						if f2_local0 <= 0 then
							self:animateToState( "default" )
						else
							self:animateToState( "visible", 0 )
							f2_arg0:setEndTime( f2_local0 )
						end
					end
					
					self:registerOmnvarHandler( "ui_hardpoint_timer", f1_local13 )
					f1_local13( self )
					return self
				end
			end
			f1_local4 = 20
		end
	end
	f1_local3 = 205
end

LUI.MenuBuilder.registerType( "hardpointStatus", hardpointStatus )
LockTable( _M )
