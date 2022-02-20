local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.RoundEnd = InheritFrom( LUI.UIElement )
f0_local0 = 0.5
f0_local1 = 0.7
f0_local2 = -11
local f0_local3 = Engine.Localize( "@LUA_MENU_VERSUS" )
local f0_local4 = CoD.TextSettings.Font24
local f0_local5 = 10
local f0_local6 = 4
local f0_local7 = 250
local f0_local8 = CoD.TextSettings.Font76
local f0_local9 = 6
local f0_local10 = 1
local f0_local11 = 2
local f0_local12 = 2
local f0_local13 = 60
local f0_local14 = {
	"MP_DRAW",
	"LUA_MENU_REPORT_DRAW",
	"MP_ROUND_WIN",
	"MP_ROUND_LOSS",
	"LUA_MENU_REPORT_VICTORY",
	"LUA_MENU_REPORT_DEFEAT",
	"MP_HALFTIME",
	"MP_OVERTIME",
	"MP_ROUNDEND",
	"MP_INTERMISSION",
	"MP_SWITCHING_SIDES",
	"MP_MATCH_BONUS_IS",
	"MP_MATCH_TIE",
	"MP_GAME_END",
	"SPLASHES_BLANK"
}
local f0_local15 = 20
local f0_local16 = CoD.TextSettings.Font24
local f0_local17 = 14
local f0_local18 = 6
local f0_local19 = 235
local f0_local20 = Engine.Localize( "@LUA_MENU_XP" )
local f0_local21 = Colors.h1.light_grey
local f0_local22 = Colors.black
local f0_local23 = CoD.TextSettings.FontBold46
local f0_local24 = 7
local f0_local25 = 0
local f0_local26 = Engine.ToUpperCase( Engine.Localize( "@MPUI_MATCHBONUS" ) )
local f0_local27 = 15
local f0_local28 = CoD.TextSettings.Font24
local f0_local29 = 22
local f0_local30 = 4
local f0_local31 = 8
local f0_local32 = CoD.TextSettings.FontBold36
local f0_local33 = Colors.h1.light_grey
local f0_local34 = 50
local f0_local35 = CoD.TextSettings.FontBold95
local f0_local36 = 30
local f0_local37 = 160
local f0_local38 = 60
local f0_local39 = 50
local f0_local40 = 4
local f0_local41 = CoD.TextSettings.Font30
local f0_local42 = Colors.h1.light_grey
local f0_local43 = 16
local f0_local44 = 4
local f0_local45 = Colors.white
local f0_local46 = Colors.h1.light_grey
local f0_local47, f0_local48 = nil
local f0_local49 = 10
local f0_local50 = 1
local f0_local51 = 2
function AddTextElement( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg1.textStr, f1_arg1.textFont.Font, f1_arg1.textFont.Height )
	local f1_local4 = f1_local2 - f1_local0
	local f1_local5 = CoD.CreateState
	local self = nil
	local f1_local7 = f1_arg1.top
	local self = nil
	local f1_local9 = f1_arg1.bot
	local f1_local10 = f1_arg1.rootAnchorType
	if not f1_local10 then
		f1_local10 = CoD.AnchorTypes.Bottom
	end
	f1_local5 = f1_local5( self, f1_local7, self, f1_local9, f1_local10 )
	f1_local5.width = f1_local4 + f1_arg1.leftEdgePadding * 2
	f1_local5.height = f1_arg1.textFont.Height + f1_arg1.topEdgePadding * 2
	self = LUI.UIElement.new( f1_local5 )
	f1_arg0:addElement( self )
	if not f1_arg1.disableBg then
		f1_local7 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
		f1_local7.material = RegisterMaterial( "white" )
		self = f1_arg1.bgColor
		if not self then
			self = Colors.black
		end
		f1_local7.color = self
		f1_local7.alpha = f1_arg1.bgAlpha or f0_local1
		self:addElement( LUI.UIImage.new( f1_local7 ) )
	end
	if f1_arg1.decoMatName then
		f1_local7 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
		f1_local7.material = RegisterMaterial( f1_arg1.decoMatName )
		f1_local7.width = f1_local5.width
		f1_local7.height = f1_local5.height * 1.25
		self:addElement( LUI.UIImage.new( f1_local7 ) )
	end
	f1_local7 = CoD.CreateState
	self = -f1_local4 / 2 + (f1_arg1.textLeftOffset or 0)
	f1_local9 = -f1_arg1.textFont.Height / 2
	f1_local10 = f1_arg1.textTopOffset
	if not f1_local10 then
		f1_local10 = f1_arg1.topEdgePadding - 1
	end
	f1_local7 = f1_local7( self, f1_local9 + f1_local10, nil, nil, CoD.AnchorTypes.None )
	f1_local7.font = f1_arg1.textFont.Font
	self = f1_arg1.textColor
	if not self then
		self = Colors.h1.light_grey
	end
	f1_local7.color = self
	f1_local7.height = f1_arg1.textFont.Height
	f1_local7.width = f1_local4
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f1_local7.top = f1_local7.top - f1_arg1.textFont.Height * 0.15
	end
	self = LUI.UIText.new( f1_local7 )
	self:setText( f1_arg1.textStr )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( self )
	if not f1_arg1.disableBg then
		f1_local9 = CoD.CreateState( nil, -(f1_local5.height / 2) - 1, nil, nil, CoD.AnchorTypes.None )
		f1_local9.width = f1_local5.width
		f1_local9.height = f1_local5.height + 1
		f1_local10 = LUI.DecoFrame.new
		local f1_local11 = f1_local9
		local f1_local12 = f1_arg1.frameTypeId
		if not f1_local12 then
			f1_local12 = LUI.DecoFrame.Grey
		end
		f1_local10 = f1_local10( f1_local11, f1_local12 )
		f1_local10:setPriority( f0_local49 )
		self:addElement( f1_local10 )
	end
	return self
end

function AddHeader( f2_arg0, f2_arg1 )
	local f2_local0 = Game.GetOmnvar( "ui_round_end_title" )
	local f2_local1 = Game.GetOmnvar( "ui_round_end_reason" )
	local f2_local2 = nil
	local f2_local3 = CoD.CreateState( nil, -f0_local7, nil, nil, CoD.AnchorTypes.Top )
	f2_local3.width = f0_local7
	f2_local3.height = f0_local7
	local self = LUI.UIElement.new( f2_local3 )
	f2_arg0:addElement( self )
	if f2_local0 > 0 then
		local f2_local5
		if f2_arg1 then
			f2_local5 = Engine.ToUpperCase( Engine.Localize( f0_local14[f2_local0] ) )
			if not f2_local5 then
			
			else
				local f2_local6, f2_local7, f2_local8, f2_local9 = GetTextDimensions( f2_local5, f0_local8.Font, f0_local8.Height )
				local f2_local10 = f2_local8 - f2_local6
				local f2_local11 = {
					top = 0,
					leftEdgePadding = f0_local13,
					topEdgePadding = f0_local12,
					textStr = f2_local5,
					textFont = f0_local8,
					textColor = Colors.white,
					rootAnchorType = CoD.AnchorTypes.Top,
					frameTypeId = LUI.DecoFrame.Grey,
					textTopOffset = 6,
					textLeftOffset = 0
				}
				local f2_local12
				if f2_arg1 then
					f2_local12 = "h1_ui_deco_endmatch_title_bg"
					if not f2_local12 then
					
					else
						f2_local11.decoMatName = f2_local12
						f2_local11.disableBg = not f2_arg1
						f2_local2 = AddTextElement( self, f2_local11 )
						if f2_arg1 == true then
							f2_local12 = 6
							local f2_local13 = 0
							local f2_local14 = 50
							local f2_local15 = f2_local10 + f0_local13 * 2 + f2_local13
							local f2_local16 = CoD.CreateState( nil, nil, nil, f2_local12, CoD.AnchorTypes.Bottom )
							f2_local16.width = f2_local15
							f2_local16.height = f0_local50
							f2_local2:addElement( LUI.Divider.new( f2_local16, f2_local14, LUI.Divider.Grey ) )
							local f2_local17 = CoD.CreateState( nil, -f2_local12, nil, nil, CoD.AnchorTypes.Top )
							f2_local17.width = f2_local15
							f2_local17.height = f0_local50
							f2_local2:addElement( LUI.Divider.new( f2_local17, f2_local14, LUI.Divider.Grey ) )
						end
					end
				end
				f2_local12 = nil
			end
		end
		f2_local5 = ""
	end
	if f2_local1 > 0 and f2_local2 then
		AddTextElement( f2_local2, {
			bot = f0_local16.Height + f0_local18 * 2 + f0_local15,
			leftEdgePadding = f0_local17,
			topEdgePadding = f0_local18,
			textStr = Engine.Localize( CoD.ReasonStrings[f2_local1] ),
			textFont = f0_local16,
			textTopOffset = f0_local51
		} )
	end
end

function AddTeam( f3_arg0, f3_arg1 )
	local f3_local0 = Game.GetOmnvar( "ui_game_victor" )
	local f3_local1 = f3_local0 == f3_arg1
	local f3_local2 = f0_local47 == f3_arg1
	local f3_local3 = -30
	local f3_local4
	if f3_local2 then
		f3_local4 = CoD.CreateState( -f0_local37, f3_local3, nil, nil, CoD.AnchorTypes.Left )
		if not f3_local4 then
		
		else
			f3_local4.width = f0_local38
			f3_local4.height = f0_local39
			local self = LUI.UIElement.new( f3_local4 )
			f3_arg0:addElement( self )
			local f3_local6 = tostring( Game.GetTeamScore( f3_arg1 ) or 0 )
			local f3_local7, f3_local8, f3_local9, f3_local10 = GetTextDimensions( f3_local6, f0_local35.Font, f0_local35.Height )
			local f3_local11 = f3_local9 - f3_local7
			if f3_arg1 == Teams.allies or f3_arg1 == Teams.axis then
				local f3_local12 = f0_local48[f3_arg1].icon
				local f3_local13 = 128
				local f3_local14 = f3_local13
				local f3_local15 = -7
				local f3_local16 = 50
				local f3_local17
				if f3_local2 then
					f3_local17 = CoD.CreateState( nil, -f0_local39 / 2 - 1, f0_local38 / 2 + f3_local16, nil, CoD.AnchorTypes.Right )
					if not f3_local17 then
					
					else
						local self = RegisterMaterial
						local f3_local19
						if f3_local2 then
							f3_local19 = "h1_ui_endgame_scorebar_team"
							if not f3_local19 then
							
							else
								f3_local17.material = self( f3_local19 )
								f3_local17.width = 450
								f3_local17.height = 65
								self = LUI.UIImage.new( f3_local17 )
								f3_local19 = "teamColorbar"
								local f3_local20
								if f3_local2 then
									f3_local20 = "Left"
									if not f3_local20 then
									
									else
										self.id = f3_local19 .. f3_local20 .. "Icon"
										self:addElement( self )
										f3_local19 = 137
										f3_local20
										if f3_local2 then
											f3_local20 = CoD.CreateState( nil, nil, -f3_local19, nil, CoD.AnchorTypes.Right )
											if not f3_local20 then
											
											else
												f3_local20.top = -f3_local14 / 2 + f3_local15
												f3_local20.width = f3_local13
												f3_local20.height = f3_local14
												local f3_local21 = LUI.FactionIcon.new( f3_local20, {
													botDivOffset = 1
												} )
												self:addElement( f3_local21 )
												f3_local21:Update( f3_local12 )
												f3_local21:setPriority( 5000 )
												local f3_local22 = f0_local48[f3_arg1].name
												local f3_local23, f3_local24, f3_local25, f3_local26 = GetTextDimensions( f3_local22, f0_local41.Font, f0_local41.Height )
												f3_local10 = f3_local26
												f3_local9 = f3_local25
												f3_local8 = f3_local24
												f3_local23 = f3_local9 - f3_local23
												f3_local26 = {
													bot = f0_local41.Height + f0_local44 * 2 + f0_local40,
													leftEdgePadding = f0_local43,
													topEdgePadding = f0_local44,
													textStr = f3_local22,
													textFont = f0_local41,
													textColor = f0_local42
												}
												local f3_local27
												if f3_arg1 == Teams.allies then
													f3_local27 = -2
													if not f3_local27 then
													
													else
														f3_local26.textLeftOffset = f3_local27
														f3_local26.textTopOffset = f0_local51
														f3_local26.disableBg = true
														AddTextElement( f3_local21, f3_local26 )
													end
												end
												f3_local27 = 0
											end
										end
										f3_local20 = CoD.CreateState( f3_local19, nil, nil, nil, CoD.AnchorTypes.Left )
									end
								end
								f3_local20 = "Right"
							end
						end
						f3_local19 = "h1_ui_endgame_scorebar_enemy"
					end
				end
				f3_local17 = CoD.CreateState( -f0_local38 / 2 - f3_local16, -f0_local39 / 2 - 1, nil, nil, CoD.AnchorTypes.Left )
			end
			local f3_local14
			if Game.GetOmnvar( "ui_current_round" ) < 3 or GameX.GetGameMode() ~= "ctf" then
				f3_local14 = false
			else
				f3_local14 = true
			end
			local f3_local15 = 7
			local f3_local16
			if f3_local14 then
				f3_local16 = 7
				if not f3_local16 then
				
				else
					local f3_local17
					if f3_local2 then
						f3_local17 = CoD.CreateState( nil, -f0_local35.Height / 2 - f0_local51 + f3_local15, f3_local16, nil, CoD.AnchorTypes.Right )
						if not f3_local17 then
						
						else
							f3_local17.font = f0_local35.Font
							local self
							if f3_local1 then
								self = f0_local45
								if not self then
								
								else
									f3_local17.color = self
									if f3_local0 == 0 then
										f3_local17.color = Colors.white
									end
									f3_local17.height = f0_local35.Height
									f3_local17.width = f3_local11
									self
									if f3_local1 or f3_local0 == 0 then
										self = 1
										if not self then
										
										else
											f3_local17.alpha = self
											self = LUI.UIText.new( f3_local17 )
											if f3_local14 then
												local f3_local19, f3_local20 = nil
												local f3_local21 = 1000
												local f3_local22 = Game.GetOmnvar( "ui_friendly_time_to_beat" ) / f3_local21
												local f3_local23 = Game.GetOmnvar( "ui_enemy_time_to_beat" ) / f3_local21
												if f3_local2 then
													f3_local19 = f3_local22
													f3_local20 = DetermineOvertimeColor( f3_local19, f3_local23 )
												else
													f3_local19 = f3_local23
													f3_local20 = DetermineOvertimeColor( f3_local19, f3_local22 )
												end
												if f3_local19 <= 0 then
													local f3_local28 = "-:--"
												end
												f3_local6 = f3_local28 or FormatTimeMinutesSeconds( f3_local19, "%01d:%02d" )
												local f3_local25 = self
												local f3_local24 = self.registerAnimationState
												local f3_local26 = "updateColor"
												local f3_local27 = {
													color = f3_local20
												}
												local f3_local29
												if f3_local20 == f0_local46 then
													f3_local29 = 0.5
													if not f3_local29 then
													
													else
														f3_local27.alpha = f3_local29
														f3_local24( f3_local25, f3_local26, f3_local27 )
														self:animateToState( "updateColor" )
														f3_local24 = 41
														f3_local25 = 60
														if f3_local2 and f3_local22 > 0 and (f3_local22 < f3_local23 or f3_local23 <= 0) then
															self:addElement( BuildTimeToBeatHeader( {
																right = f3_local24,
																anchor = CoD.AnchorTypes.TopRight,
																textRight = -f3_local25,
																textAnchor = CoD.AnchorTypes.Right,
																material = "h1_mp_endgame_timetobeat_team"
															} ) )
														elseif not f3_local2 and f3_local23 > 0 and (f3_local23 < f3_local22 or f3_local22 <= 0) then
															self:addElement( BuildTimeToBeatHeader( {
																left = -f3_local24,
																anchor = CoD.AnchorTypes.TopLeft,
																textLeft = f3_local25,
																textAnchor = CoD.AnchorTypes.Left,
																material = "h1_mp_endgame_timetobeat_enemy"
															} ) )
														end
													end
												end
												f3_local29 = 1
											end
											self:setText( f3_local6 )
											self:addElement( self )
										end
									end
									self = 0.5
								end
							end
							self = f0_local46
						end
					end
					f3_local17 = CoD.CreateState( -f3_local16, -f0_local35.Height / 2 - f0_local51 + f3_local15, nil, nil, CoD.AnchorTypes.Left )
				end
			end
			f3_local16 = 0
		end
	end
	f3_local4 = CoD.CreateState( nil, f3_local3, f0_local37, nil, CoD.AnchorTypes.Right )
end

function BuildTimeToBeatHeader( f4_arg0 )
	local f4_local0 = Engine.GetMaterialAspectRatio( RegisterMaterial( f4_arg0.material ) )
	local f4_local1 = 40
	local f4_local2 = 9
	local f4_local3 = f4_local0 * f4_local1
	local f4_local4 = CoD.CreateState( f4_arg0.left, -f4_local1 + f4_local2, f4_arg0.right, f4_arg0.bottom, f4_arg0.anchor )
	f4_local4.width = f4_local3
	f4_local4.height = f4_local1
	local self = LUI.UIElement.new( f4_local4 )
	local f4_local6 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local6.material = RegisterMaterial( f4_arg0.material )
	self:addElement( LUI.UIImage.new( f4_local6 ) )
	local f4_local7 = CoD.TextSettings.Font23
	local f4_local8 = CoD.CreateState( f4_arg0.textLeft, -f4_local7.Height / 2 + -1.5, f4_arg0.textRight, nil, f4_arg0.textAnchor )
	f4_local8.font = f4_local7.Font
	f4_local8.color = Colors.white
	f4_local8.height = f4_local7.Height
	local self = LUI.UIText.new( f4_local8 )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MP_COMMON_TIME_TO_BEAT_CAPS" ) ) )
	self:addElement( self )
	return self
end

function DetermineOvertimeColor( f5_arg0, f5_arg1 )
	local f5_local0
	if 0 < f5_arg0 and (f5_arg0 <= f5_arg1 or f5_arg1 <= 0) then
		f5_local0 = f0_local45
		if not f5_local0 then
		
		else
			return f5_local0
		end
	end
	f5_local0 = f0_local46
end

function AddFooter( f6_arg0 )
	local f6_local0 = Engine.GetFirstActiveController()
	local f6_local1 = Game.GetOmnvar( "ui_round_end_match_bonus" )
	if f6_local1 > 0 then
		local f6_local2 = CoD.CreateState( nil, f0_local19, nil, nil, CoD.AnchorTypes.Top )
		f6_local2.width = f0_local19
		f6_local2.height = f0_local19
		local self = LUI.UIElement.new( f6_local2 )
		f6_arg0:addElement( self )
		local f6_local4 = AddTextElement( AddTextElement( self, {
			top = 0,
			leftEdgePadding = f0_local24,
			topEdgePadding = f0_local25,
			textStr = f0_local20,
			textFont = f0_local23,
			textColor = f0_local22,
			bgColor = f0_local21,
			bgAlpha = 1,
			rootAnchorType = CoD.AnchorTypes.Top
		} ), {
			bot = f0_local28.Height + f0_local30 * 2 + f0_local27,
			leftEdgePadding = f0_local29,
			topEdgePadding = f0_local30,
			textStr = f0_local26,
			textFont = f0_local28,
			textTopOffset = f0_local51
		} )
		local f6_local5 = tostring( f6_local1 )
		local f6_local6, f6_local7, f6_local8, f6_local9 = GetTextDimensions( f6_local5, f0_local32.Font, f0_local32.Height )
		local f6_local10 = f6_local8 - f6_local6
		local f6_local11 = CoD.CreateState( nil, nil, nil, f0_local32.Height + f0_local31, CoD.AnchorTypes.Bottom )
		f6_local11.font = f0_local32.Font
		f6_local11.color = f0_local33
		f6_local11.height = f0_local32.Height
		f6_local11.width = f6_local10
		local self = LUI.UIText.new( f6_local11 )
		self:setText( f6_local5 )
		f6_local4:addElement( self )
	end
end

LUI.RoundEnd.new = function ( f7_arg0, f7_arg1 )
	f0_local48 = {
		{
			name = Engine.ToUpperCase( Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) ) ),
			icon = Engine.GetDvarString( "g_TeamIcon_Axis" )
		},
		{
			name = Engine.ToUpperCase( Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) ) ),
			icon = Engine.GetDvarString( "g_TeamIcon_Allies" )
		}
	}
	if string.find( tostring( f0_local48[Teams.allies].name ), "MARINES" ) then
		CoD.SwapFactionReasonStrings()
	else
		CoD.RestoreFactionReasonStrings()
	end
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self.id = "roundEnd"
	self:setupLetterboxElement()
	local f7_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f7_local1.material = RegisterMaterial( "white" )
	f7_local1.color = Colors.black
	f7_local1.alpha = f0_local0
	local self = LUI.UIImage.new( f7_local1 )
	self:addElement( self )
	self:setupFullWindowElement()
	local f7_local3 = Game.GetNumPlayersOnTeam( Teams.free )
	if LUI.Scoreboard.IsSingleTeam() and f7_local3 > 0 then
		local f7_local4 = LUI.TopPlayers.PlayerCardVertSpacing
		local f7_local5 = {
			-f7_local4,
			0,
			f7_local4
		}
		local f7_local6 = {
			playerData = {},
			defState = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ),
			leftOffset = 0
		}
		local f7_local7 = 1
		local f7_local8
		if f7_local3 > 3 then
			f7_local8 = 3
			if not f7_local8 then
			
			else
				for f7_local9 = 1, f7_local8, f7_local9 do
					f7_local6.playerData[f7_local7] = {
						left = nil,
						top = f7_local5[f7_local7],
						data = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, f7_local7, GameX.GetGameMode() )
					}
				end
				self:addElement( LUI.MenuBuilder.BuildRegisteredType( "topPlayers", f7_local6 ) )
			end
		end
		f7_local8 = f7_local3
	else
		if GameX.IsSplitscreen() then
			f0_local7 = 150
			f0_local19 = 100
		end
		local f7_local5 = AddTextElement( self, {
			top = f0_local2 - (f0_local4.Height + f0_local6 * 2) / 2,
			leftEdgePadding = f0_local5,
			topEdgePadding = f0_local6,
			textStr = f0_local3,
			textFont = f0_local4,
			rootAnchorType = CoD.AnchorTypes.None,
			textTopOffset = f0_local51
		} )
		local f7_local6 = Game.GetPlayerTeam()
		AddHeader( f7_local5, f7_local6 ~= Teams.spectator )
		local f7_local7
		if f7_local6 == Teams.spectator then
			f7_local7 = Teams.allies
			if not f7_local7 then
			
			else
				f0_local47 = f7_local7
				f7_local7 = f0_local47
				local f7_local8 = Teams.allies
				f7_local7 = REG21 and Teams.axis or Teams.allies
				AddTeam( f7_local5, f0_local47 )
				AddTeam( f7_local5, f7_local7 )
				AddFooter( f7_local5 )
			end
		end
		f7_local7 = f7_local6
	end
	return self
end

LUI.MenuBuilder.registerType( "roundEnd", LUI.RoundEnd.new )
LockTable( _M )
