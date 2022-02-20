local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	
end

LUI.MenuBuilder.registerType( "sdPlayerCountDef", function ()
	local f2_local0 = GameX.IsSplitscreen()
	local f2_local1 = 208
	local f2_local2 = 20
	local f2_local3 = 32
	local f2_local4
	if f2_local0 then
		f2_local4 = 3
		if not f2_local4 then
		
		else
			local f2_local5
			if f2_local0 then
				f2_local5 = 210
				if not f2_local5 then
				
				else
					local f2_local6 = 4
					local f2_local7 = (f2_local1 - 2 * f2_local6) / 3
					local f2_local8 = 0
					local self = LUI.UIElement.new( {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						top = f2_local4,
						left = f2_local5,
						width = f2_local1,
						height = f2_local2,
						alpha = 1
					} )
					self.id = "playerCount_id"
					local f2_local10 = CoD.CreateState( f2_local8, nil, nil, nil, CoD.AnchorTypes.TopBottomLeft )
					f2_local10.material = RegisterMaterial( "white" )
					f2_local10.width = f2_local7
					f2_local10.alpha = 0.75
					f2_local10.color = {
						r = 0.08,
						g = 0.08,
						b = 0.08
					}
					self:addElement( LUI.UIImage.new( f2_local10 ) )
					local f2_local11 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.Left )
					f2_local11.height = Engine.IsPC() and 10 or 12
					f2_local11.width = f2_local7
					f2_local11.alpha = 1
					f2_local11.alignment = LUI.Alignment.Center
					f2_local11.font = CoD.TextSettings.TitleFontSmallBold.Font
					f2_local11.textStyle = CoD.TextStyle.Shadowed
					local self = LUI.UIText.new( f2_local11 )
					self:setText( Engine.Localize( "@MP_ALIVE_CAPS" ) )
					self:addElement( self )
					f2_local8 = f2_local8 + f2_local6 + f2_local7
					f2_local10.left = f2_local8
					self:addElement( LUI.UIImage.new( f2_local10 ) )
					local f2_local13 = CoD.CreateState( f2_local8 + f2_local6, nil, nil, nil, CoD.AnchorTypes.Left )
					f2_local13.material = RegisterMaterial( "h1_hud_sd_teamicon_blue" )
					f2_local13.height = f2_local3
					f2_local13.width = f2_local3
					self:addElement( LUI.UIImage.new( f2_local13 ) )
					local f2_local14 = CoD.CreateState( f2_local8 + f2_local3 - f2_local6, nil, nil, nil, CoD.AnchorTypes.Left )
					f2_local14.width = f2_local7 - f2_local3 - f2_local6
					f2_local14.alignment = LUI.Alignment.Center
					f2_local14.font = CoD.TextSettings.SP_HudItemAmmoFont.Font
					f2_local14.height = CoD.TextSettings.SP_HudItemAmmoFont.Height * 0.75
					f2_local14.textStyle = CoD.TextStyle.Shadowed
					local redTeam = LUI.UIText.new( f2_local14 )
					redTeam:setText( "" )
					self:addElement( redTeam )
					self.blueTeam = redTeam
					self.blueTeam.team = Teams.allies
					
					f2_local8 = f2_local8 + f2_local6 + f2_local7
					f2_local10.left = f2_local8
					self:addElement( LUI.UIImage.new( f2_local10 ) )
					f2_local13.material = RegisterMaterial( "h1_hud_sd_teamicon_red" )
					f2_local13.left = f2_local8 + f2_local6
					self:addElement( LUI.UIImage.new( f2_local13 ) )
					f2_local14.left = f2_local8 + f2_local3 - f2_local6
					
					redTeam = LUI.UIText.new( f2_local14 )
					redTeam:setText( "" )
					self:addElement( redTeam )
					self.redTeam = redTeam
					
					self.redTeam.team = Teams.axis
					local f2_local16 = Engine.GetDvarString( "ui_gametype" )
					local f2_local17 = function ( f3_arg0, f3_arg1 )
						local f3_local0 = 0
						local f3_local1 = Game.GetNumPlayersOnTeam( f3_arg0.team )
						for f3_local2 = 1, f3_local1, 1 do
							local f3_local5 = GameX.GetPlayerScoreInfoAtRankForGameMode( f3_arg0.team, f3_local2, f2_local16 )
							if not f3_local5.isDead then
								f3_local0 = f3_local0 + 1
							end
						end
						f3_arg0:setText( f3_local0 )
					end
					
					self.blueTeam:registerEventHandler( "update_alive_count", f2_local17 )
					self.redTeam:registerEventHandler( "update_alive_count", f2_local17 )
					self:registerEventHandler( "playerstate_client_changed", function ( element, event )
						if Game.InKillCam() == false then
							local f4_local0 = Game.GetPlayerTeam()
							if f4_local0 == Teams.spectator then
								f4_local0 = Teams.allies or f4_local0
							end
							local f4_local1 = GameX.GetPlayerOpposingTeam( f4_local0 )
							self.blueTeam.team = f4_local0
							self.redTeam.team = f4_local1
						end
					end )
					local self = LUI.UITimer.new( 200, "update_alive_count" )
					self.id = "update_alive_count_timer"
					self:addElement( self )
					return self
				end
			end
			f2_local5 = -5
		end
	end
	f2_local4 = 208
end )
LockTable( _M )
