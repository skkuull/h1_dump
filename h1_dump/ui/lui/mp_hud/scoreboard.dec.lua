local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.Scoreboard = InheritFrom( LUI.UIElement )
LUI.Scoreboard.RowGrayColor = Colors.mp.ally_row_bg_color
LUI.Scoreboard.DataGrayColor = Colors.h1.light_grey
LUI.Scoreboard.RankNumColor = Colors.mp.aar_score_gold
LUI.Scoreboard.PlayerNameHighlightColor = {
	r = 0.5,
	g = 1,
	b = 0.56
}
f0_local0 = CoD.TextSettings.FontBold110
f0_local1 = CoD.TextSettings.Font60
f0_local2 = CoD.TextSettings.Font30
local f0_local3 = CoD.TextSettings.Font40
local f0_local4 = CoD.TextSettings.Font32
local f0_local5 = CoD.TextSettings.Font15
local f0_local6 = CoD.TextSettings.Font18
local f0_local7 = CoD.TextSettings.Font18
local f0_local8 = CoD.TextSettings.Font16
local f0_local9 = Colors.h1.light_green
local f0_local10 = LUI.Scoreboard.RankNumColor
local f0_local11 = Colors.mp.ally_color
local f0_local12 = Colors.mp.ally_color
local f0_local13 = Colors.mp.ally_outline_color
local f0_local14 = LUI.Scoreboard.RowGrayColor
local f0_local15 = Colors.mp.ally_highlight_color
local f0_local16 = Colors.mp.axis_color
local f0_local17 = Colors.mp.axis_outline_color
local f0_local18 = Colors.mp.axis_row_bg_color
local f0_local19 = Colors.mp.axis_highlight_color
local f0_local20 = Colors.mp.free_highlight_color
local f0_local21 = LUI.Scoreboard.PlayerNameHighlightColor
local f0_local22 = nil
local f0_local23 = 10
local f0_local24 = 7
local f0_local25 = 3
local f0_local26 = 21
local f0_local27 = 40
local f0_local28, f0_local29 = nil
local f0_local30 = 80
local f0_local31, f0_local32 = nil
local f0_local33 = f0_local23 - 2
local f0_local34, f0_local35, f0_local36 = nil
local f0_local37 = 13
local f0_local38 = 0.2 / 5
local f0_local39 = -0.1
local f0_local40 = 8
local f0_local41 = 3
local f0_local42 = {
	"war",
	"dom",
	"conf",
	"sab",
	"hp",
	"koth",
	"sd",
	"dd",
	"ctf"
}
local f0_local43 = 501
local f0_local44 = 500
local f0_local45 = 1
local f0_local46 = 2
local f0_local47 = 1
local f0_local48 = nil
local f0_local49 = 18
local f0_local50 = 0.35
local f0_local51 = 2
local f0_local52 = 30
local f0_local53, f0_local54 = nil
local f0_local55 = 0
local f0_local56 = true
local f0_local57 = 0
local f0_local58 = true
local f0_local59 = "disabled"
local f0_local60 = {}
local f0_local61, f0_local62, f0_local63 = nil
local f0_local64 = false
local f0_local65, f0_local66, f0_local67 = false
local f0_local68 = "@LUA_MENU_REPORT_VICTORY"
local f0_local69 = "@LUA_MENU_REPORT_DEFEAT"
local f0_local70 = "@LUA_MENU_REPORT_DRAW"
local f0_local71 = 1
local f0_local72 = 2
local f0_local73 = 3
local f0_local74 = 4
local f0_local75 = 5
local f0_local76 = 6
local f0_local77 = 7
local f0_local78 = 8
LUI.ScoreboardStats = {}
LUI.ScoreboardStats.NAME = f0_local71
LUI.ScoreboardStats.SCORE = f0_local72
LUI.ScoreboardStats.KILLS = f0_local73
LUI.ScoreboardStats.DEATHS = f0_local74
LUI.ScoreboardStats.KDR = f0_local75
LUI.ScoreboardStats.ASSISTS = f0_local76
LUI.ScoreboardStats.EXTRASCORE0 = f0_local77
LUI.ScoreboardStats.EXTRASCORE1 = f0_local78
LUI.ScoreboardStats.CurrStats = {
	statNames = {
		"@MENU_PLAYER",
		"@LUA_MENU_SCORE",
		"@LUA_MENU_KILLS",
		"@LUA_MENU_DEATHS",
		"@MENU_RATIO",
		"@LUA_MENU_ASSISTS_CAPS"
	},
	statValsIdx = {
		f0_local71,
		f0_local72,
		f0_local73,
		f0_local74,
		f0_local75,
		f0_local76
	}
}
LUI.ScoreboardStats.CustomStats = {
	dm = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@MENU_RATIO",
			"@LUA_MENU_ASSISTS_CAPS"
		},
		statValsIdx = {
			f0_local71,
			f0_local77,
			f0_local73,
			f0_local74,
			f0_local75,
			f0_local76
		}
	},
	gun = {
		statNames = {
			"@MENU_PLAYER",
			"@MPUI_RANK",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_STABS",
			"@LUA_MENU_SETBACKS"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local77,
			f0_local73,
			f0_local74,
			f0_local76,
			f0_local78
		}
	},
	conf = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_CONFIRMS",
			"@LUA_MENU_DENIES"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	dom = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_CAPTURES",
			"@LUA_MENU_DEFENDS"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	ctf = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_CAPTURES",
			"@LUA_MENU_DEFENDS",
			"@LUA_MENU_RETURNS"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78,
			f0_local76
		}
	},
	sd = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_PLANTS_CAPS",
			"@LUA_MENU_DEFUSES"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	sab = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_PLANTS_CAPS",
			"@LUA_MENU_DEFUSES"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	koth = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_CAPTURES",
			"@LUA_MENU_DESTROYS"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	dd = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_PLANTS_CAPS",
			"@LUA_MENU_DEFUSES"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	hp = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS",
			"@LUA_MENU_TIME",
			"@LUA_MENU_DEFENDS"
		},
		statValsIdx = {
			f0_local71,
			f0_local72,
			f0_local73,
			f0_local74,
			f0_local77,
			f0_local78
		}
	},
	mugger = {
		statNames = {
			"@MENU_PLAYER",
			"@LUA_MENU_SCORE",
			"@LUA_MENU_BANKED",
			"@LUA_MENU_CARRYING",
			"@LUA_MENU_KILLS",
			"@LUA_MENU_DEATHS"
		},
		statValsIdx = {
			f0_local71,
			f0_local77,
			f0_local72,
			f0_local78,
			f0_local73,
			f0_local74
		}
	}
}
function AddDivider( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.CreateState
	local self = f1_arg1.left
	local f1_local2 = f1_arg1.top
	local f1_local3, f1_local4 = nil
	local f1_local5 = f1_arg1.anchorType
	if not f1_local5 then
		f1_local5 = CoD.AnchorTypes.TopLeft
	end
	f1_local0 = f1_local0( self, f1_local2, f1_local3, f1_local4, f1_local5 )
	f1_local0.material = RegisterMaterial( "white" )
	self = f1_arg1.color
	if not self then
		self = Colors.h1.light_grey
	end
	f1_local0.color = self
	f1_local0.width = f1_arg1.width
	f1_local0.height = f1_arg1.height
	self = LUI.UIImage.new( f1_local0 )
	self.id = f1_arg1.id
	self.defState = f1_local0
	f1_arg0:addElement( self )
	if f1_arg1.priority then
		self:setPriority( f1_arg1.priority )
	end
end

function AddFrontEndHeader( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0, f2_local1, f2_local2, f2_local3 = GetTextDimensions( f2_arg1, f0_local3.Font, f0_local3.Height )
	local f2_local4 = CoD.CreateState( f0_local55, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local4.left = f2_local4.left + (f2_arg2 or 0)
	f2_local4.font = f0_local3.Font
	f2_local4.color = Colors.white
	f2_local4.height = f0_local3.Height
	f2_local4.width = f2_local2 - f2_local0
	local self = LUI.UIText.new( f2_local4 )
	self:setText( f2_arg1 )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	AddDivider( self, {
		left = f0_local51,
		top = f0_local3.Height + f0_local25,
		width = f0_local52,
		height = f0_local45,
		color = f0_local9
	} )
	f2_arg0:addElement( self )
end

function AddInGameHeader( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0, f3_local1, f3_local2, f3_local3, f3_local4 = nil
	local f3_local5 = GameX.IsSplitscreen()
	local f3_local6 = nil
	local f3_local7 = 17
	local f3_local8 = 3
	if f3_local5 then
		f3_local6 = 75
		local self = f0_local56 and f0_local29 / 2 or (f0_local29 * 2 + f0_local23) / 2
		local f3_local10 = self + f3_local7
		local f3_local11 = 270
		f3_local0 = CoD.CreateState( self, -f3_local6 / 2 + f3_local8 - 5, nil, nil, CoD.AnchorTypes.None )
		f3_local0.width = f3_local11
		f3_local0.height = f3_local6
		f3_local1 = CoD.CreateState( nil, 17, nil, nil, CoD.AnchorTypes.TopLeftRight )
		f3_local2 = CoD.CreateState( nil, 43, nil, nil, CoD.AnchorTypes.TopLeftRight )
		f3_local3 = CoD.CreateState( nil, 63, nil, nil, CoD.AnchorTypes.TopLeftRight )
	else
		if f0_local56 then
			f3_local4 = f0_local29 + 1
			f3_local0 = CoD.CreateState( (f3_local4 + 9) / 2, nil, nil, nil, CoD.AnchorTypes.TopLeft )
			f3_local0.width = f3_local4 - 1
			f3_local2 = CoD.CreateState( 49, 11, nil, nil, CoD.AnchorTypes.TopLeft )
			f3_local3 = CoD.CreateState( nil, 6, -16, nil, CoD.AnchorTypes.TopRight )
		else
			f3_local4 = f0_local29 * 2 + f0_local23 + 1
			f3_local0 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.TopLeft )
			f3_local0.width = f3_local4 - 2
			f3_local2 = CoD.CreateState( 94, 11, nil, nil, CoD.AnchorTypes.TopLeft )
			f3_local3 = CoD.CreateState( nil, 6, -68, nil, CoD.AnchorTypes.TopRight )
		end
		f3_local6 = 35
		f3_local1 = CoD.CreateState( nil, 9.5, nil, nil, CoD.AnchorTypes.TopLeftRight )
		f3_local0.height = f3_local6
		f3_local2.width = f3_local4
		f3_local3.width = 100
	end
	f3_local0.material = RegisterMaterial( "white" )
	f3_local0.color = Colors.black
	f3_local0.alpha = 0.74
	local self = LUI.UIImage.new( f3_local0 )
	if f3_local5 then
		f3_local6 = 100
		self:registerAnimationState( "tall", {
			top = -f3_local6 / 2 + f3_local8 + 7,
			height = f3_local6
		} )
	end
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	f3_arg0:addElement( self )
	f3_local2.font = f0_local4.Font
	f3_local2.color = Colors.white
	f3_local2.height = f0_local4.Height * 0.85
	f3_local1.font = f0_local4.Font
	f3_local1.color = Colors.white
	f3_local1.height = f0_local4.Height
	f3_local1.alignment = LUI.Alignment.Center
	local self = LUI.UIText.new( f3_local2 )
	self:setText( Engine.ToUpperCase( f3_arg2 ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( self )
	local self = LUI.UIText.new( f3_local1 )
	self:setText( Engine.ToUpperCase( f3_arg1 ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( self )
	local f3_local14 = LUI.MenuBuilder.BuildRegisteredType( "timersHudDef" )
	f3_local3.height = f0_local4.Height
	f3_local3.font = f0_local4.Font
	f3_local3.color = Colors.white
	f3_local14:registerAnimationState( "default", f3_local3 )
	f3_local14:animateToState( "default" )
	if f3_local5 then
		f3_local14:registerEventHandler( "timer_active", function ( element, event )
			self:animateToState( "tall" )
		end )
		f3_local14:registerEventHandler( "timer_timeout", function ( element, event )
			self:animateToState( "default" )
		end )
	end
	self:addElement( f3_local14 )
end

function AllocateRow( f6_arg0 )
	local f6_local0 = 0
	local f6_local1 = Colors.black
	if isLeftTeam then
		if f6_arg0 % 2 == 0 then
			f6_local1 = f0_local14
		end
	elseif f6_arg0 % 2 ~= 0 then
		f6_local1 = f0_local18
	end
	local f6_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f6_local2.material = RegisterMaterial( "white" )
	f6_local2.color = f6_local1
	f6_local2.width = f0_local29
	f6_local2.height = f0_local26 - 1
	f6_local2.alpha = 0
	local self = LUI.UIImage.new( f6_local2 )
	self.defState = f6_local2
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	local f6_local4 = CoD.CreateState( 0, -1, 0, 0, CoD.AnchorTypes.All )
	f6_local4.borderThickness = 1
	f6_local4.color = isLeftTeam and f0_local13 or f0_local17
	f6_local4.alpha = 1
	local self = LUI.UIBorder.new( f6_local4 )
	self.border = self
	self:addElement( self )
	for f6_local6 = 1, #LUI.ScoreboardStats.CurrStats.statNames, 1 do
		local f6_local9 = "N/A"
		local f6_local10, f6_local11 = nil
		local f6_local12, f6_local13, f6_local14, f6_local15 = GetTextDimensions( f6_local9, f0_local6.Font, f0_local6.Height )
		local f6_local16 = f6_local0
		local f6_local17 = CoD.CreateState( f6_local0, nil, nil, nil, CoD.AnchorTypes.Left )
		f6_local17.alignment = LUI.Alignment.Center
		if f6_local6 == f0_local47 then
			local f6_local18 = 10
			local self = CoD.CreateState( f0_local24, nil, nil, nil, CoD.AnchorTypes.Left )
			local f6_local20 = f0_local6.Height + 5
			local f6_local21 = f6_local20
			self.width = f6_local20
			self.height = f6_local21
			self.alpha = Engine.GetOnlineGame() and 1 or 0
			local self = LUI.UIImage.new( self )
			self.rankIcon = self
			self:addElement( self )
			local f6_local23 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
			f6_local23.width = f0_local28
			f6_local23.height = f0_local26
			local self = LUI.UIStencilText.new( f6_local23 )
			local f6_local25 = f0_local26 * 2
			local f6_local26 = f0_local26 * 2
			local f6_local27 = CoD.CreateState( f0_local24 + f6_local20 / 2 - f6_local25 / 2, nil, nil, nil, CoD.AnchorTypes.Left )
			f6_local27.width = f6_local25
			f6_local27.height = f6_local26
			f6_local27.alpha = 0
			self:addElement( LUI.UIImage.new( f6_local27 ) )
			self.stencil = self
			self:addElement( self )
			local f6_local28 = CoD.CreateState( f0_local24 * 2 + f6_local18 + 5, -f0_local7.Height / 2 + 1, nil, nil, CoD.AnchorTypes.Left )
			f6_local28.font = f0_local7.Font
			f6_local28.color = f0_local10
			f6_local28.height = f0_local7.Height
			f6_local28.alpha = GameX.IsRankedMatch() and 1 or 0
			local self = LUI.UIText.new( f6_local28 )
			self:setText( "N/A" )
			self.defState = f6_local28
			self.rankNum = self
			self:addElement( self )
			local f6_local30 = 2
			local f6_local31 = f6_local20 - 3
			f6_local11 = f6_local30 + f6_local31
			local f6_local32 = f6_local11 - 3
			local f6_local33 = -8
			local f6_local34 = 56
			if GameX.IsRankedMatch() then
				local f6_local35 = f6_local34
			end
			local f6_local36 = f6_local35 or f6_local33 + f6_local11
			local f6_local37 = GameX.IsRankedMatch() and f6_local34 - f6_local11 or f6_local33
			local f6_local38 = f6_local37
			local f6_local39 = CoD.CreateState( f6_local38, nil, nil, nil, CoD.AnchorTypes.Left )
			f6_local39.material = RegisterMaterial( "h1_hud_dogtags" )
			f6_local39.width = f6_local31
			f6_local39.height = f6_local31
			f6_local39.alpha = 0
			local self = LUI.UIImage.new( f6_local39 )
			self.dogtag = self
			self:addElement( self )
			f6_local39.left = f6_local37
			self:registerAnimationState( "disabled", f6_local39 )
			f6_local39.left = f6_local36
			f6_local39.alpha = 1
			self:registerAnimationState( "enabled", f6_local39 )
			f6_local10 = f6_local38 + f6_local39.width + 2
			local f6_local41, f6_local42, f6_local43, f6_local44 = GetTextDimensions( f0_local48, f0_local7.Font, f0_local7.Height )
			f6_local17 = CoD.CreateState( f6_local10, nil, nil, nil, CoD.AnchorTypes.Left )
			f6_local17.alignment = nil
			f6_local16 = 0
		end
		local f6_local18
		if f6_local6 == f0_local47 then
			f6_local18 = f0_local8
			if not f6_local18 then
			
			else
				f6_local17.top = -f6_local18.Height / 2 + 1
				f6_local17.font = f6_local18.Font
				f6_local17.color = Colors.h1.light_grey
				f6_local17.width = f0_local60[f6_local6]
				if Engine.IsPC() and f6_local6 == f0_local47 then
					f6_local17.width = f6_local17.width * 0.75
				end
				f6_local17.height = f6_local18.Height
				local self = LUI.UIText.new( f6_local17 )
				if f6_local6 == f0_local47 then
					self.dogtagDisabledOffset = f6_local17.left
					self.dogtagEnabledOffset = f6_local10 + f6_local11
				end
				self.defState = f6_local17
				self.storedLeft = f6_local16
				if Engine.IsPC() and f6_local6 == f0_local47 and self.setupAutoScaleText then
					self:setupAutoScaleText()
				end
				self:setText( f6_local9 )
				self["stat" .. f6_local6] = self
				self:addElement( self )
				f6_local0 = f6_local0 + f0_local60[f6_local6]
			end
		end
		f6_local18 = f0_local6
	end
	return self
end

function AllocateRows( f7_arg0 )
	local f7_local0 = {}
	for f7_local1 = 1, f0_local49, 1 do
		local f7_local4 = AllocateRow( f7_local1 )
		f7_arg0:addElement( f7_local4 )
		table.insert( f7_local0, f7_local4 )
	end
	return f7_local0
end

function AddScoreboardHeader( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg1.header
	local f8_local1 = f8_local0.gameModeKey
	local f8_local2 = f8_local0.mapName
	local f8_local3 = Engine.ToUpperCase( f8_local1 .. " - " .. f8_local2 )
	if Engine.InFrontend() then
		AddFrontEndHeader( f8_arg0, f8_local3 )
	else
		AddInGameHeader( f8_arg0, f8_local1, f8_local2 )
	end
end

function AddTeamHeader( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	local f9_local0 = f9_arg4 == true
	if f9_arg3 ~= Teams.allies and f9_arg3 ~= Teams.axis then
		f9_arg3 = Teams.allies
	end
	local f9_local1 = CoD.CreateState( f9_arg2, f0_local34, nil, nil, CoD.AnchorTypes.TopLeft )
	f9_local1.material = RegisterMaterial( "h1_ui_scoreboard_teamheader_bg" )
	f9_local1.alignment = LUI.Alignment.Center
	f9_local1.width = f0_local29
	f9_local1.height = f0_local30
	local self = LUI.UIImage.new( f9_local1 )
	self:setup9SliceImage( 1, 1, 0.1, 0.1 )
	local f9_local3 = "team"
	local self
	if f9_local0 then
		self = "Left"
		if not self then
		
		else
			self.id = f9_local3 .. self .. "Header"
			self:setPriority( f0_local43 )
			f9_arg0:addElement( self )
			f9_local3 = CoD.CreateState
			self, f9_local5, self, f9_local7 = nil
			local f9_local8
			if f9_local0 then
				f9_local8 = CoD.AnchorTypes.Right
				if not f9_local8 then
				
				else
					f9_local3 = f9_local3( self, f9_local5, self, f9_local7, f9_local8 )
					self = RegisterMaterial
					if f9_local0 then
						f9_local5 = "h1_ui_scoreboard_colorbar_team"
						if not f9_local5 then
						
						else
							f9_local3.material = self( f9_local5 )
							f9_local3.width = f0_local29 / 1.75
							f9_local3.height = f0_local30
							self = LUI.UIImage.new( f9_local3 )
							f9_local5 = "colorBar"
							if f9_local0 then
								self = "Left"
								if not self then
								
								else
									self.id = f9_local5 .. self
									self:addElement( self )
									f9_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
									f9_local5.material = RegisterMaterial( "h1_ui_dot_pattern" )
									f9_local5.width = f0_local29
									f9_local5.height = f0_local30
									self = LUI.UIImage.new( f9_local5 )
									f9_local7 = "dotPattern"
									f9_local8
									if f9_local0 then
										f9_local8 = "Left"
										if not f9_local8 then
										
										else
											self.id = f9_local7 .. f9_local8
											self:setupTiles( 6 )
											self:addElement( self )
											f9_local7 = LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey )
											f9_local7:setPriority( f0_local43 )
											self:addElement( f9_local7 )
											f9_local8 = f0_local63[f9_arg3].icon
											local f9_local9 = 175
											local f9_local10 = 45
											local f9_local11
											if f9_local0 then
												f9_local11 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
												if not f9_local11 then
												
												else
													f9_local11.width = f9_local9
													f9_local11.height = f0_local30
													local self = LUI.UIStencilText.new( f9_local11 )
													local f9_local13 = "team"
													local f9_local14
													if f9_local0 then
														f9_local14 = "Left"
														if not f9_local14 then
														
														else
															self.id = f9_local13 .. f9_local14 .. "Stencil"
															if f9_local0 then
																f9_local13 = CoD.CreateState( nil, nil, f9_local10, nil, CoD.AnchorTypes.None )
																if not f9_local13 then
																
																else
																	f9_local13.width = f9_local9
																	f9_local13.height = f9_local9
																	f9_local13.alpha = 0.3
																	f9_local14 = 5
																	local f9_local15 = f0_local30 - 1
																	local f9_local16 = f9_local15
																	local f9_local17
																	if f9_local0 then
																		f9_local17 = CoD.CreateState( f9_local14, nil, nil, nil, CoD.AnchorTypes.Left )
																		if not f9_local17 then
																		
																		else
																			f9_local17.width = f9_local15
																			f9_local17.height = f9_local16
																			local f9_local18 = LUI.FactionIcon.new( f9_local17, {
																				botDivOffset = -1
																			} )
																			local f9_local19 = "team"
																			local f9_local20
																			if f9_local0 then
																				f9_local20 = "Left"
																				if not f9_local20 then
																				
																				else
																					f9_local18.id = f9_local19 .. f9_local20 .. "Icon"
																					f9_local18:Update( f0_local63[f9_arg3].icon )
																					self:addElement( f9_local18 )
																					self:addElement( self )
																					f9_local19 = f9_local14 + f9_local15 + 10
																					f9_local20, f9_local21, f9_local22, f9_local23 = GetTextDimensions( Engine.ToUpperCase( Engine.Localize( f9_arg1.resultText ) ), f0_local1.Font, f0_local1.Height )
																					local f9_local24 = 13
																					local f9_local25
																					if f9_local0 then
																						f9_local25 = CoD.CreateState
																						local self = f9_arg1.resultText
																						local f9_local27 = f0_local68
																						f9_local25 = f9_local25( REG46 and f9_local19 - f0_local41 or f9_local19, f9_local24, nil, nil, CoD.AnchorTypes.TopLeft )
																						if not f9_local25 then
																						
																						else
																							f9_local25.font = f0_local1.Font
																							f9_local25.color = Colors.white
																							f9_local25.height = f0_local1.Height
																							f9_local25.width = f9_local22 - f9_local20
																							f9_local25.alpha = f0_local61 and 1 or 0
																							local self = LUI.UIText.new( f9_local25 )
																							self:setText( Engine.ToUpperCase( Engine.Localize( f9_arg1.resultText ) ) )
																							self:addElement( self )
																							local f9_local27 = CoD.AnchorTypes.BottomLeft
																							local f9_local28 = CoD.AnchorTypes.BottomRight
																							local f9_local29 = -7
																							local f9_local30 = nil
																							if not f0_local61 then
																								f9_local27 = CoD.AnchorTypes.Left
																								f9_local28 = CoD.AnchorTypes.Right
																								f9_local29 = nil
																								f9_local30 = -7
																							end
																							f9_local20, f9_local21, f9_local22, f9_local23 = GetTextDimensions( f0_local63[f9_arg3].name, f0_local2.Font, f0_local2.Height )
																							local f9_local31
																							if f9_local0 then
																								f9_local31 = CoD.CreateState( f9_local19, f9_local30, nil, f9_local29, f9_local27 )
																								if not f9_local31 then
																								
																								else
																									f9_local31.font = f0_local2.Font
																									f9_local31.color = Colors.h1.light_grey
																									f9_local31.height = f0_local2.Height
																									f9_local31.width = f9_local22 - f9_local20
																									local self = LUI.UIText.new( f9_local31 )
																									self:setText( f0_local63[f9_arg3].name )
																									local f9_local33 = "team"
																									local f9_local34
																									if f9_local0 then
																										f9_local34 = "Left"
																										if not f9_local34 then
																										
																										else
																											self.id = f9_local33 .. f9_local34 .. "Name"
																											self:addElement( self )
																											f9_local20, f9_local21, f9_local22, f9_local23 = GetTextDimensions( tostring( f9_arg1.teamScore ), f0_local0.Font, f0_local0.Height )
																											f9_local33 = (f0_local30 - f0_local0.Height) / 2
																											f9_local34 = f9_local33 + 10
																											local f9_local35
																											if f9_local0 then
																												f9_local35 = CoD.CreateState( nil, f9_local33, -f9_local34, nil, CoD.AnchorTypes.TopRight )
																												if not f9_local35 then
																												
																												else
																													f9_local35.font = f0_local0.Font
																													local self = f9_arg1.resultText
																													local f9_local37 = f0_local69
																													f9_local35.color = REG55 and Colors.h1.light_grey or Colors.white
																													self = f9_arg1.resultText
																													f9_local37 = f0_local69
																													f9_local35.alpha = REG58 and f0_local50 or 1
																													if f9_arg1.resultText == f0_local70 then
																														f9_local35.color = Colors.white
																													end
																													f9_local35.height = f0_local0.Height
																													f9_local35.width = f9_local22 - f9_local20
																													self = LUI.UIText.new( f9_local35 )
																													f9_local37 = "team"
																													local f9_local38
																													if f9_local0 then
																														f9_local38 = "Left"
																														if not f9_local38 then
																														
																														else
																															self.id = f9_local37 .. f9_local38 .. "Score"
																															self.defState = f9_local35
																															self:setText( tostring( f9_arg1.teamScore ) )
																															self:addElement( self )
																														end
																													end
																													f9_local38 = "Right"
																												end
																											end
																											f9_local35 = CoD.CreateState( f9_local34, f9_local33, nil, nil, CoD.AnchorTypes.TopLeft )
																										end
																									end
																									f9_local34 = "Right"
																								end
																							end
																							f9_local31 = CoD.CreateState
																							local self = nil
																							local f9_local33 = f9_local30
																							local f9_local34
																							if f9_arg3 == Teams.axis then
																								f9_local34 = -f9_local19 - f0_local41
																								if not f9_local34 then
																								
																								else
																									f9_local31 = f9_local31( self, f9_local33, f9_local34, f9_local29, f9_local28 )
																								end
																							end
																							f9_local34 = -f9_local19
																						end
																					end
																					f9_local25 = CoD.CreateState
																					local self = nil
																					local f9_local27 = f9_local24
																					local f9_local28 = f9_arg1.resultText
																					local f9_local29 = f0_local69
																					f9_local25 = f9_local25( self, f9_local27, REG49 and -f9_local19 + f0_local41 or -f9_local19, nil, CoD.AnchorTypes.TopRight )
																				end
																			end
																			f9_local20 = "Right"
																		end
																	end
																	f9_local17 = CoD.CreateState( nil, nil, -f9_local14, nil, CoD.AnchorTypes.Right )
																end
															end
															f9_local13 = CoD.CreateState( -f9_local10, nil, nil, nil, CoD.AnchorTypes.None )
														end
													end
													f9_local14 = "Right"
												end
											end
											f9_local11 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
										end
									end
									f9_local8 = "Right"
								end
							end
							self = "Right"
						end
					end
					f9_local5 = "h1_ui_scoreboard_colorbar_enemy"
				end
			end
			f9_local8 = CoD.AnchorTypes.Left
		end
	end
	self = "Right"
end

function AddDataHeader( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = f10_arg1
	local f10_local1 = f10_arg0.leftTeam == f10_arg2
	local f10_local2 = 0
	local f10_local3
	if f10_local1 then
		f10_local3 = 1
		if not f10_local3 then
		
		else
			local f10_local4 = CoD.CreateState( f10_arg1, f0_local35, nil, nil, CoD.AnchorTypes.TopLeft )
			f10_local4.material = RegisterMaterial( "h1_ui_scoreboard_dataheader_bg" )
			f10_local4.width = f0_local29
			f10_local4.height = f0_local26
			local self = LUI.UIImage.new( f10_local4 )
			self:setPriority( f0_local44 )
			self.id = "dataHeader" .. f10_local3
			self:setup9SliceImage( 1, 1, 0.1, 0.1 )
			f10_arg0:addElement( self )
			local f10_local6 = CoD.CreateState( 0, -1, 0, 0, CoD.AnchorTypes.All )
			f10_local6.borderThickness = 1
			local f10_local7
			if f10_local1 then
				f10_local7 = f0_local13
				if not f10_local7 then
				
				else
					f10_local6.color = f10_local7
					f10_local6.alpha = 1
					self:addElement( LUI.UIBorder.new( f10_local6 ) )
					local f10_local8 = f0_local26 + f0_local46
					if f10_arg3 and f10_arg3.teamStatVals and #f10_arg3.teamStatVals > 0 then
						f10_local8 = f10_local8 + (f0_local26 - 1) * #f10_arg3.teamStatVals
					end
					local f10_local9 = 0
					for f10_local10 = 1, #LUI.ScoreboardStats.CurrStats.statNames, 1 do
						local f10_local13, f10_local14, f10_local15, f10_local16 = GetTextDimensions( GameX and GameX.maxScoreStat or "99999", f0_local6.Font, f0_local6.Height )
						local f10_local17 = f10_local15 - f10_local13
						local f10_local18, f10_local19, f10_local20, f10_local21 = GetTextDimensions( Engine.ToUpperCase( Engine.Localize( LUI.ScoreboardStats.CurrStats.statNames[f10_local10] ) ), f0_local5.Font, f0_local5.Height )
						f10_local16 = f10_local21
						f10_local15 = f10_local20
						f10_local14 = f10_local19
						f10_local18 = f10_local15 - f10_local18
						if f10_local18 < f10_local17 then
							local f10_local22 = f10_local17
						end
						f10_local9 = f10_local9 + (f10_local22 or f10_local18) + f0_local24 * 2
					end
					f10_local9 = f0_local29 - f10_local9
					for f10_local10 = 1, #LUI.ScoreboardStats.CurrStats.statNames, 1 do
						local f10_local23 = Engine.ToUpperCase( Engine.Localize( LUI.ScoreboardStats.CurrStats.statNames[f10_local10] ) )
						local f10_local14, f10_local15, f10_local16, f10_local24 = GetTextDimensions( GameX and GameX.maxScoreStat or "99999", f0_local6.Font, f0_local6.Height )
						local f10_local25 = f10_local16 - f10_local14 + f0_local24 * 2
						local f10_local18, f10_local19, f10_local20, f10_local21 = GetTextDimensions( f10_local23, f0_local5.Font, f0_local5.Height )
						f10_local24 = f10_local21
						f10_local16 = f10_local20
						f10_local15 = f10_local19
						local f10_local17 = f10_local16 - f10_local18
						if f10_local1 and f10_local10 == 1 then
							f10_local17 = f10_local17 - 1
						end
						f10_local18 = f10_local17 + f0_local24 * 2
						f10_local19 = 1
						f10_local20 = 1
						if f10_local10 == f0_local47 then
							f10_local21 = CoD.CreateState( f0_local24 + f10_local20, nil, nil, nil, CoD.AnchorTypes.Left )
							if not f10_local21 then
							
							else
								f10_local21.top = -f0_local5.Height / 2 + f10_local19
								f10_local21.font = f0_local5.Font
								f10_local21.color = Colors.white
								f10_local21.height = f0_local5.Height
								local self
								if f10_local10 ~= f0_local47 then
									self = LUI.Alignment.Center
									if not self then
									
									else
										f10_local21.alignment = self
										if f10_local18 < f10_local25 then
											local f10_local27 = f10_local25
										end
										f10_local21.width = f10_local27 or f10_local18
										if f10_local10 == f0_local47 then
											f10_local21.width = f10_local21.width + f10_local9
										end
										self = LUI.UIText.new( f10_local21 )
										self:setText( f10_local23 )
										self:addElement( self )
										f10_local2 = f10_local2 + f10_local21.width
										if f10_local10 ~= #LUI.ScoreboardStats.CurrStats.statNames then
											AddDivider( self, {
												left = f10_local2,
												width = f0_local45,
												height = f10_local8,
												color = Colors.window_border_color,
												id = "statColDivider" .. f10_local3 .. f10_local10
											} )
										end
										f0_local60[f10_local10] = f10_local21.width
									end
								end
								self = nil
							end
						end
						f10_local21 = CoD.CreateState( f10_local2, nil, nil, nil, CoD.AnchorTypes.Left )
					end
					local f10_local10 = AddDivider
					local f10_local11 = f10_arg0
					local f10_local12 = {
						left = f10_local0,
						top = f0_local35 + f0_local26,
						width = f0_local29,
						height = f0_local46
					}
					local f10_local28
					if f10_local1 then
						f10_local28 = f0_local15
						if not f10_local28 then
						
						else
							f10_local12.color = f10_local28
							f10_local12.priority = f0_local44
							f10_local10( f10_local11, f10_local12 )
						end
					end
					f10_local28 = f0_local19
				end
			end
			f10_local7 = f0_local17
		end
	end
	f10_local3 = 2
end

function CreateLocalPlayerHighlight()
	local f11_local0 = CoD.CreateState( f0_local56 and f0_local55 or nil, f0_local36, nil, nil, CoD.AnchorTypes.TopLeft )
	f11_local0.width = f0_local29
	f11_local0.height = f0_local26
	f11_local0.alpha = 1
	local self = LUI.UIElement.new( f11_local0 )
	self.id = "localPlayerHighlight"
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "enabled", {
		alpha = 0
	} )
	self.defState = f11_local0
	self:setPriority( f0_local43 )
	local f11_local2 = CoD.CreateState( -1, -2, 1, -1, CoD.AnchorTypes.All )
	f11_local2.material = RegisterMaterial( "h1_ui_scoreboard_highlight_frame" )
	local self = LUI.UIImage.new( f11_local2 )
	self:setup9SliceImage( 8, 8, 0.2, 0.2 )
	self:addElement( self )
	return self
end

function AddInitData( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	local f12_local0 = f0_local36
	local f12_local1 = f12_arg0.leftTeam == f12_arg3
	local f12_local2, f12_local3, f12_local4 = nil
	if f12_local1 then
		f12_local2 = CreateLocalPlayerHighlight()
		f12_arg0:addElement( f12_local2 )
	end
	if not f12_arg0.unusedRowIndex then
		f12_arg0.unusedRowIndex = 1
	end
	local f12_local5 = 1
	for f12_local6 = f12_arg0.unusedRowIndex, #f12_arg0.rowBank, 1 do
		local f12_local9 = f12_arg0.rowBank[f12_local6]
		local f12_local10 = nil
		if not f12_arg1.teamStatVals or #f12_arg1.teamStatVals < f12_local5 then
			return 
		elseif Engine.InFrontend() then
			if f12_arg1.teamStatVals and f12_arg1.teamStatVals[f12_local5] then
				local f12_local11 = f12_arg1.teamStatVals[f12_local5][LUI.AARScoreboard.IsLocalPlayerIndex]
			end
			f12_local10 = f12_local11 or false
			if f12_local2 and f12_local10 then
				local f12_local12 = f12_local2.defState
				f12_local12.top = f0_local36 + f0_local26 * (f12_local5 - 1) - f12_local5 - 1
				f12_local2:registerAnimationState( "default", f12_local12 )
				f12_local2:animateToState( "default" )
			end
		end
		for f12_local12 = 1, #LUI.ScoreboardStats.CurrStats.statNames, 1 do
			local f12_local15 = "N/A"
			if f12_arg1.teamStatVals and f12_arg1.teamStatVals[f12_local5] then
				f12_local15 = f12_arg1.teamStatVals[f12_local5][f12_local12 + 2]
				f12_local9:animateToState( "enabled" )
			end
			if f12_local12 == f0_local47 and f12_arg1.teamStatVals and f12_arg1.teamStatVals[f12_local5] then
				local f12_local16 = RegisterMaterial( f12_arg1.teamStatVals[f12_local5][f12_local12] )
				f12_local9.rankIcon:setImage( f12_local16 )
				f12_local9.stencil:setImage( f12_local16 )
				f12_local9.rankNum:setText( Rank.GetRankDisplay( f12_arg1.teamStatVals[f12_local5][f12_local12 + 1] ) )
				f12_local9.rankIcon:setAlpha( GameX.IsRankedMatch() and 1 or 0 )
			end
			local f12_local16 = f12_local9["stat" .. f12_local12]
			local f12_local17 = f12_local16.defState
			local f12_local18
			if f12_local12 == f0_local47 and f12_local10 then
				f12_local18 = f0_local21
				if not f12_local18 then
				
				else
					f12_local17.color = f12_local18
					f12_local16:registerAnimationState( "default", f12_local16.defState )
					f12_local16:animateToState( "default" )
					f12_local16:setText( f12_local15 )
				end
			end
			f12_local18 = Colors.h1.light_grey
		end
		f12_local9.defState.left = f12_arg2
		f12_local9.defState.top = f12_local0 - 1
		f12_local9.defState.alpha = 1
		f12_local9:registerAnimationState( "default", f12_local9.defState )
		f12_local9:animateToState( "default" )
		f12_arg0.unusedRowIndex = f12_arg0.unusedRowIndex + 1
		f12_local0 = f12_local0 + f0_local26 - 1
		f12_local5 = f12_local5 + 1
	end
end

function AddTeam( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	if not f0_local56 then
		AddTeamHeader( f13_arg0, f13_arg1.header, f13_arg2, f13_arg3, f13_arg4 )
	end
	AddDataHeader( f13_arg0, f13_arg2, f13_arg3, f13_arg1 )
	if not f13_arg0.rowBank then
		f13_arg0.rowBank = AllocateRows( f13_arg0 )
	end
	AddInitData( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
end

function UpdatePlayerStatRow( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	local f14_local0 = f14_arg2.name
	local f14_local1 = f14_arg2.score
	local f14_local2 = f14_arg2.kills
	local f14_local3 = f14_arg2.deaths
	local f14_local4 = f14_arg2.extrascore0
	local f14_local5 = f14_arg2.extrascore1
	local f14_local6 = f14_local2
	local f14_local7 = f14_arg0.rowBank[f14_arg0.unusedRowIndex]
	f14_arg0.unusedRowIndex = f14_arg0.unusedRowIndex + 1
	f14_local7.defState.top = f0_local36 - 1 + (f0_local26 - 1) * (f14_arg1 - 1)
	local f14_local8 = f14_local7.defState
	local f14_local9
	if f14_arg3 then
		f14_local9 = f14_arg0.leftTeamLeftOffset
		if not f14_local9 then
		
		else
			f14_local8.left = f14_local9
			f14_local7.defState.alpha = 1
			f14_local7:registerAnimationState( "default", f14_local7.defState )
			f14_local7:animateToState( "default" )
			if f14_local2 and f14_local3 and f14_local3 ~= 0 then
				f14_local6 = tostring( f14_local2 / f14_local3 )
			end
			f14_local9 = {
				f14_local0,
				f14_local1,
				f14_local2,
				f14_local3,
				string.format( "%.2f", f14_local6 ),
				f14_arg2.assists,
				f14_local4,
				f14_local5
			}
			local f14_local10 = {}
			for f14_local11 = 1, #LUI.ScoreboardStats.CurrStats.statValsIdx, 1 do
				f14_local10[f14_local11] = f14_local9[LUI.ScoreboardStats.CurrStats.statValsIdx[f14_local11]]
			end
			local f14_local12 = f14_arg0.childRecord.localPlayerHighlight
			if f14_arg2.client == Game.GetPlayerClientnum() then
				local f14_local13 = f14_local12.defState
				f14_local13.top = f0_local36 + f0_local26 * (f14_arg1 - 1) - f14_arg1 - 1
				f14_local12:registerAnimationState( "default", f14_local13 )
				f14_local12:animateToState( "default" )
			end
			for f14_local13 = 1, #f14_local10, 1 do
				local f14_local16 = 0
				local f14_local17 = 0
				if f14_local13 == f0_local47 then
					local f14_local18 = f14_local7.rankNum
					local f14_local19 = Rank.GetRankDisplay( f14_arg2.rank )
					local f14_local20, f14_local21, f14_local22, f14_local23 = GetTextDimensions( f0_local48, f0_local7.Font, f0_local7.Height )
					f14_local16 = f14_local22 - f14_local20
					local f14_local24 = 10
					f14_local18:setText( f14_local19 )
					f14_local18.defState.left = f0_local24 * 2 + f14_local24 + 5
					f14_local17 = f14_local18.defState.left
					f14_local18:registerAnimationState( "default", f14_local18.defState )
					f14_local18:animateToState( "default" )
					local f14_local25 = f14_local7.rankIcon
					f14_local25:setAlpha( GameX.IsRankedMatch() and 1 or 0 )
					f14_local25:setImage( f14_arg2.rankIcon )
					f14_local7.stencil:setImage( f14_arg2.rankIcon )
					f14_local7.dogtag:animateToState( f14_arg2.isDead and "enabled" or "disabled" )
				end
				local f14_local18 = f14_local7["stat" .. f14_local13]
				local f14_local19 = f14_local10[f14_local13]
				local f14_local20, f14_local21, f14_local22, f14_local23 = GetTextDimensions( f14_local19, f0_local5.Font, f0_local5.Height )
				if f14_arg2.client == Game.GetPlayerClientnum() and f14_local13 == f0_local47 then
					f14_local18.defState.color = f0_local21
				else
					f14_local18.defState.color = Colors.white
				end
				if f14_local13 == f0_local47 then
					f14_local18.defState.alpha = f14_arg2.isDead and 0.5 or 1
					f14_local18.defState.left = f14_arg2.isDead and f14_local18.dogtagEnabledOffset or f14_local18.dogtagDisabledOffset
				end
				f14_local18:registerAnimationState( "default", f14_local18.defState )
				f14_local18:animateToState( "default" )
				if f0_local66 == "hp" and f14_local13 == 5 then
					f14_local19 = FormatTimeMinutesSeconds( f14_local19 )
				end
				f14_local18:setText( f14_local19 )
			end
		end
	end
	f14_local9 = f14_arg0.rightTeamLeftOffset
end

function UpdateTeamHeaderData( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	local f15_local0
	if f15_arg1 == f15_arg0.leftTeam then
		f15_local0 = "Left"
		if not f15_local0 then
		
		else
			local f15_local1 = f15_arg0.childRecord["team" .. f15_local0 .. "Header"]
			local f15_local2 = f15_local1.childRecord["team" .. f15_local0 .. "Score"]
			local f15_local3 = f15_local1.childRecord["team" .. f15_local0 .. "Name"]
			local f15_local4 = f15_local1.childRecord
			local f15_local5 = "team"
			local f15_local6 = f15_local0
			f15_local5 = f15_local4[f15_local5 .. f15_local0 .. "Stencil"].childRecord["team" .. f15_local0 .. "Icon"]
			if f0_local58 then
				f15_local2.defState.color = f15_arg3
			end
			f15_local6 = f15_local2.defState
			local f15_local7
			if f15_arg3 == Colors.white then
				f15_local7 = 1
				if not f15_local7 then
				
				else
					f15_local6.alpha = f15_local7
					f15_local2:setText( f15_arg2 )
					f15_local2:registerAnimationState( "default", f15_local2.defState )
					f15_local2:animateToState( "default" )
					f15_local3:setText( f0_local63[f15_arg1].name )
					f15_local5:Update( f0_local63[f15_arg1].icon )
				end
			end
			f15_local7 = f0_local50
		end
	end
	f15_local0 = "Right"
end

function UpdateTeam( f16_arg0, f16_arg1 )
	local f16_local0 = Game.GetNumPlayersOnTeam( f16_arg1 )
	if not f0_local56 and GameX.IsSplitscreen() and f0_local37 < f16_local0 then
		f16_arg0:registerAnimationState( "scaleDown", {
			scale = f0_local39 - f0_local38 * (f16_local0 - f0_local37)
		} )
		f16_arg0:animateToState( "scaleDown" )
	end
	if f16_arg1 ~= Teams.spectator then
		local f16_local1
		if f16_arg1 == f16_arg0.leftTeam or f16_arg1 == Teams.free then
			f16_local1 = 1
			if not f16_local1 then
			
			else
				local f16_local2 = f16_arg0.childRecord["dataHeader" .. f16_local1]
				local f16_local3 = f0_local26 + (f0_local26 - 1) * f16_local0 + f0_local46
				for f16_local4 = 1, #LUI.ScoreboardStats.CurrStats.statNames - 1, 1 do
					local f16_local7 = f16_local2.childRecord["statColDivider" .. f16_local1 .. f16_local4]
					f16_local7.defState.height = f16_local3
					f16_local7:registerAnimationState( "default", f16_local7.defState )
					f16_local7:animateToState( "default" )
				end
				if not f0_local56 then
					local f16_local4 = Game.GetTeamScore( f16_arg0.leftTeam )
					local f16_local5 = Game.GetTeamScore( f16_arg0.rightTeam )
					local f16_local6 = nil
					if f16_arg0.leftTeam == Teams.allies or f16_arg0.leftTeam == Teams.axis then
						if f16_local5 <= f16_local4 then
							local f16_local8 = Colors.white
						end
						UpdateTeamHeaderData( f16_arg0, f16_arg0.leftTeam, f16_local4, f16_local8 or Colors.h1.light_grey )
					end
					if f16_arg0.rightTeam == Teams.allies or f16_arg0.rightTeam == Teams.axis then
						if f16_local4 <= f16_local5 then
							local f16_local9 = Colors.white
						end
						UpdateTeamHeaderData( f16_arg0, f16_arg0.rightTeam, f16_local5, f16_local9 or Colors.h1.light_grey )
					end
				end
				if f16_arg0.maxNumActivePlayers < f16_local0 then
					local f16_local10 = f16_local0
				end
				f16_arg0.maxNumActivePlayers = f16_local10 or f16_arg0.maxNumActivePlayers
				f16_arg0.totalActivePlayers = f16_arg0.totalActivePlayers + f16_local0
				f16_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
				f16_local4.height = f0_local31 + (f0_local26 - 1) * f16_arg0.maxNumActivePlayers + 1
				f16_local4.top = f16_arg0.ignoreTitleTopOffsets and -f16_local4.height / 2 or -f16_local4.height / 2 - f0_local32 + f0_local33
				f16_local4.left = -f0_local53 / 2
				f16_local4.width = f0_local53
				f16_arg0:registerAnimationState( "default", f16_local4 )
				f16_arg0:animateToState( "default" )
				for f16_local5 = 1, f16_local0, 1 do
					local f16_local12
					if f16_arg1 ~= f16_arg0.leftTeam then
						f16_local12 = f0_local56
					else
						f16_local12 = true
					end
					local f16_local13 = GameX.GetPlayerScoreInfoAtRankForGameMode( f16_arg1, f16_local5, GameX.GetGameMode() )
					if f16_local13 ~= nil then
						if f16_local12 or f16_arg1 == Teams.free then
							UpdatePlayerStatRow( f16_arg0, f16_local5, f16_local13, f16_local12 )
						else
							UpdatePlayerStatRow( f16_arg0, f16_local5, f16_local13, f16_local12 )
						end
					end
				end
			end
		end
		f16_local1 = 2
	end
end

function DetermineIfSingleTeamGameType()
	for f17_local0 = 1, #f0_local42, 1 do
		if f0_local66 == f0_local42[f17_local0] then
			return false
		end
	end
	return true
end

function AddWinningTeamBgIcon( f18_arg0, f18_arg1 )
	if f18_arg0 and f18_arg0 ~= 0 and f0_local64 and not f0_local56 then
		local f18_local0 = f0_local30 - 1
		local f18_local1 = f18_local0
		local f18_local2 = f18_local0 * 6.4
		local f18_local3 = f18_local1 * 6.4
		local f18_local4 = CoD.CreateState( nil, -30, nil, nil, CoD.AnchorTypes.Top )
		f18_local4.width = f18_local2
		f18_local4.height = f18_local3
		f18_local4.alpha = 0.4
		local f18_local5 = LUI.FactionIcon.new( f18_local4, {
			disableDividers = true,
			disableScanlines = true
		} )
		f18_local5:Update( f0_local63[f18_arg0].icon, true )
		f18_local5:setPriority( -500 )
		f18_arg1:addElement( f18_local5 )
	end
end

function AddTopPlayers( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = f0_local29 + f0_local23 + 1
	local f19_local1 = LUI.TopPlayers.PlayerCardVertSpacing
	local f19_local2 = f19_local0 + f0_local55 + 15
	local f19_local3 = {
		-f19_local1,
		0,
		f19_local1
	}
	local f19_local4 = {
		playerData = {},
		controller = f0_local67,
		defState = CoD.CreateState( f19_local2, f0_local35 - 11, nil, nil, CoD.AnchorTypes.TopLeft ),
		leftOffset = 0
	}
	AddFrontEndHeader( f19_arg0, Engine.ToUpperCase( Engine.Localize( "@MENU_TOP_PLAYERS" ) ), f19_local2 - f0_local55 )
	local f19_local5 = 1
	local f19_local6
	if f19_arg1 > 3 then
		f19_local6 = 3
		if not f19_local6 then
		
		else
			for f19_local7 = 1, f19_local6, f19_local7 do
				local f19_local8 = {
					isLocalPlayer = f19_arg2.teamStatVals[f19_local5][LUI.AARScoreboard.IsLocalPlayerIndex],
					rank = f19_arg2.teamStatVals[f19_local5][LUI.AARScoreboard.RANK_NUM],
					name = f19_arg2.teamStatVals[f19_local5][LUI.AARScoreboard.NAME],
					stats = {}
				}
				for f19_local9 = LUI.AARScoreboard.SCORE, #f19_arg2.teamStatVals[f19_local5], 1 do
					table.insert( f19_local8.stats, f19_arg2.teamStatVals[f19_local5][f19_local9] )
				end
				f19_local4.playerData[f19_local5] = {
					left = nil,
					top = f19_local3[f19_local5],
					data = f19_local8
				}
			end
			f19_arg0:addElement( LUI.MenuBuilder.BuildRegisteredType( "topPlayers", f19_local4 ) )
		end
	end
	f19_local6 = f19_arg1
end

function OnToggleScoreboard( f20_arg0, f20_arg1 )
	if not f20_arg1.keyUp and f0_local58 then
		if f0_local59 == "disabled" then
			OnOpenScoreboard( f20_arg0 )
		else
			OnCloseScoreboard( f20_arg0 )
		end
	end
end

function OnOpenScoreboard( f21_arg0, f21_arg1 )
	f0_local59 = "enabled"
	f21_arg0:animateToState( f0_local59 )
	LUI.UITimer.Enable( f21_arg0.childRecord.refreshTimer )
	f21_arg0.isOpen = true
end

function OnRoundEnd( f22_arg0, f22_arg1 )
	if f22_arg1.value == 1 then
		f0_local58 = false
		OnCloseScoreboard( f22_arg0, f22_arg1 )
	else
		f0_local58 = true
	end
end

function OnStartHostMigration( f23_arg0, f23_arg1 )
	f0_local58 = false
	OnCloseScoreboard( f23_arg0, f23_arg1 )
end

function OnEndHostMigration( f24_arg0, f24_arg1 )
	f0_local58 = true
	OnCloseScoreboard( f24_arg0, f24_arg1 )
end

function OnCloseScoreboard( f25_arg0, f25_arg1 )
	f0_local59 = "disabled"
	f25_arg0:animateToState( f0_local59 )
	LUI.UITimer.Disable( f25_arg0.childRecord.refreshTimer )
	f25_arg0.isOpen = false
end

function OnRefreshScoreboard( f26_arg0, f26_arg1 )
	f26_arg0.maxNumActivePlayers = 0
	f26_arg0.totalActivePlayers = 0
	f26_arg0.unusedRowIndex = 1
	local f26_local0 = f26_arg0.childRecord.matchTimerRoot
	if f26_local0 then
		local f26_local1 = f26_local0
		local f26_local2 = f26_local0.setAlpha
		local f26_local3
		if 0 < Game.GetTimeLeft() then
			f26_local3 = 1
			if not f26_local3 then
			
			else
				f26_local2( f26_local1, f26_local3 )
			end
		end
		f26_local3 = 0
	end
	f26_arg0.localPlayerTeam = Game.GetPlayerTeam()
	local f26_local2 = f26_arg0.localPlayerTeam
	local f26_local1 = Teams.spectator
	f26_arg0.leftTeam = REG11 and Teams.allies or f26_arg0.localPlayerTeam
	if f0_local56 then
		UpdateTeam( f26_arg0, Teams.free )
	else
		f26_arg0.rightTeam = GameX.GetPlayerOpposingTeam( f26_arg0.leftTeam )
		UpdateTeam( f26_arg0, f26_arg0.rightTeam )
		UpdateTeam( f26_arg0, f26_arg0.leftTeam )
	end
	for f26_local2 = f26_arg0.totalActivePlayers + 1, #f26_arg0.rowBank, 1 do
		f26_arg0.rowBank[f26_local2]:animateToState( "disabled" )
	end
	if Game.GetPlayerTeam() == Teams.spectator then
		f26_arg0.childRecord.localPlayerHighlight:animateToState( "disabled" )
	end
end

function OnInitRefreshScoreboard( f27_arg0, f27_arg1 )
	f27_arg0.localPlayerTeam = Game.GetPlayerTeam()
	if f27_arg0.localPlayerTeam ~= Teams.spectator then
		f27_arg0.childRecord.localPlayerHighlight:animateToState( "enabled" )
		f27_arg0:processEvent( {
			name = "refresh_scoreboard"
		} )
		LUI.UITimer.Disable( f27_arg0.childRecord.initRefreshTimer )
	else
		f27_arg0:processEvent( {
			name = "refresh_scoreboard"
		} )
	end
end

LUI.Scoreboard.IsSingleTeam = function ()
	return f0_local56
end

LUI.Scoreboard.isScoreboardOpen = function ( f29_arg0 )
	return f29_arg0.isOpen
end

LUI.Scoreboard.GetTabLabel = function ()
	return "@MENU_SCOREBOARD"
end

LUI.Scoreboard.new = function ( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg1.controller
	if not f31_local0 then
		f31_local0 = Engine.GetFirstActiveController()
	end
	f0_local67 = f31_local0
	f31_local0 = Lobby.GetPlayerPrestigeLevel( f0_local67 )
	if not f31_local0 then
		f31_local0 = AAR.GetPrestigeLevel( f0_local67 )
	end
	f0_local48 = Rank.GetMaxRank( f31_local0 )
	local f31_local1, f31_local2, f31_local3, f31_local4 = nil
	if Engine.InFrontend() then
		local f31_local5 = Engine.GetClientMatchData( "axisFaction" )
		f31_local1 = AAR.GetFactionNameByRef( f31_local5 )
		f31_local2 = AAR.GetFactionIcon( f31_local5 )
		local f31_local6 = Engine.GetClientMatchData( "alliesFaction" )
		f31_local3 = AAR.GetFactionNameByRef( f31_local6 )
		f31_local4 = AAR.GetFactionIcon( f31_local6 )
	else
		f31_local1 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) )
		f31_local2 = Engine.GetDvarString( "g_TeamIcon_Axis" )
		f31_local3 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) )
		f31_local4 = Engine.GetDvarString( "g_TeamIcon_Allies" )
	end
	f0_local63 = {
		{
			name = f31_local1,
			icon = f31_local2
		},
		{
			name = f31_local3,
			icon = f31_local4
		}
	}
	local f31_local5 = f31_arg1.gameModeName
	if not f31_local5 then
		f31_local5 = GetGameModeName()
	end
	local f31_local6 = GetMapName()
	local f31_local7 = f31_arg1.gameMode
	if not f31_local7 then
		f31_local7 = Engine.GetDvarString( "ui_gametype" )
	end
	f0_local66 = f31_local7
	f31_local7 = LUI.ScoreboardStats.CustomStats[f0_local66]
	if f31_local7 then
		LUI.ScoreboardStats.CurrStats = f31_local7
	end
	local f31_local8 = nil
	f0_local56 = DetermineIfSingleTeamGameType()
	local f31_local9
	if GameX then
		f31_local9 = GameX.IsRankedMatch()
		if not f31_local9 then
			f31_local9 = RankedPlay
			if f31_local9 then
				f31_local9 = RankedPlay.IsRankedPlay( f0_local67 )
			end
		end
	else
		f31_local9 = RankedPlay
		if f31_local9 then
			f31_local9 = RankedPlay.IsRankedPlay( f0_local67 )
		end
	end
	local f31_local10
	if f31_local9 and not f0_local56 then
		f31_local10 = 9
		if not f31_local10 then
		
		else
			f0_local54 = f31_local10
			f31_local10 = 1100
			if GameX.IsSplitscreen() then
				local f31_local11 = f0_local56
				local f31_local12 = 0
			end
			f0_local32 = f31_local11 and f31_local12 or 35
			f0_local22 = f0_local56 and 1200 or f31_local10
			f0_local28 = (f0_local22 - f0_local23) / 2
			f0_local53 = f0_local28 * 2 + f0_local23
			f0_local29 = f0_local28 + 1
			f0_local34 = f0_local32 + f0_local33
			f0_local31 = f0_local26 - 1 + f0_local46
			local f31_local13
			if not f0_local56 then
				f31_local13 = f0_local32 + f0_local33 + f0_local30 + f0_local31
				if not f31_local13 then
				
				else
					f0_local31 = f31_local13
					f31_local13, f31_local14 = nil
					if not Engine.InFrontend() then
						f31_local8 = Game.GetPlayerTeam()
						if f31_local8 == Teams.spectator then
							local f31_local15 = Teams.allies
						end
						f31_local13 = f31_local15 or f31_local8
						f31_local14 = GameX.GetPlayerOpposingTeam( f31_local13 )
					else
						local f31_local16 = AAR.GetLocalPlayer( f0_local67 )
						f31_local8 = f31_local16 and AAR.GetPlayerTeam( f31_local16 )
						if f31_local8 == "allies" or not f31_local8 or f0_local56 then
							local f31_local17 = Teams.allies
						end
						f31_local13 = f31_local17 or Teams.axis
						if f31_local13 == Teams.allies then
							local f31_local18 = Teams.axis
						end
						f31_local14 = f31_local18 or Teams.allies
					end
					f0_local35 = f0_local34 + f0_local30
					f0_local36 = f0_local35 + f0_local26 + 3
					f0_local64 = f31_arg1.showWinningIconBg
					if f0_local56 or not f31_local14 then
						f31_local14 = nil
					end
					f0_local65 = f31_arg1.overrideScoreColoring or false
					local f31_local16 = f31_arg1.header
					if not f31_local16 then
						f31_local16 = {
							extended = false,
							gameModeKey = f31_local5,
							mapName = f31_local6
						}
					end
					f31_arg1.header = f31_local16
					f31_local16 = f31_arg1.teamLeft
					if not f31_local16 then
						f31_local16 = {
							header = {
								teamScore = Game.GetTeamScore( Teams.allies ) or 0
							}
						}
					end
					local f31_local19 = f31_arg1.teamRight
					if not f31_local19 then
						f31_local19 = {
							header = {
								teamScore = Game.GetTeamScore( Teams.axis ) or 0
							}
						}
					end
					f31_arg1.enabledAlpha = f31_arg1.enabledAlpha or 1
					f31_arg1.defAlpha = f31_arg1.defAlpha or 0
					f31_local16.header.resultText = f0_local70
					f31_local19.header.resultText = f0_local70
					local f31_local20
					if f31_arg1.winningTeam then
						f31_local20 = true
					else
						f31_local20 = false
					end
					f0_local61 = f31_local20
					if f31_arg1.winningTeam and f31_arg1.winningTeam ~= 0 then
						f31_local20 = f31_local16.header
						local self = f31_arg1.winningTeam
						local self = Teams.allies
						f31_local20.resultText = REG48 and f0_local68 or f0_local69
						f31_local20 = f31_local19.header
						self = f31_arg1.winningTeam
						self = Teams.axis
						f31_local20.resultText = REG51 and f0_local68 or f0_local69
					end
					if f0_local56 then
						f31_local20 = 74 + (f0_local22 - f31_local10) / 4
						local self
						if not Engine.InFrontend() then
							self = (f0_local29 + f0_local23) / 2
							if not self then
							
							else
								f0_local55 = self
								self = f0_local35 - f0_local34
								f0_local35 = f0_local35 - self
								f0_local36 = f0_local36 - self
							end
						end
						self = f31_local20
					end
					f31_local20 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
					if Engine.InFrontend() then
						f31_local20 = CoD.CreateState( nil, GenericMenuDims.MenuStartY + 30, nil, nil, CoD.AnchorTypes.Top )
					end
					f31_local20.alpha = f31_arg1.defAlpha
					f31_local20.width = f0_local53
					f31_local20.height = 0
					f31_local20.scale = f0_local39
					local self = LUI.UIElement.new( f31_local20 )
					f0_local57 = f0_local57 + 1
					self.id = "scoreboard_" .. f0_local57
					self.ignoreTitleTopOffsets = f31_arg1.ignoreTitleTopOffsets
					self:setClass( LUI.Scoreboard )
					self:registerAnimationState( "disabled", {
						alpha = 0
					} )
					self:registerAnimationState( "enabled", {
						alpha = f31_arg1.enabledAlpha
					} )
					self.maxNumActivePlayers = 0
					if f31_local16 and f31_local16.teamStatVals then
						self.maxNumActivePlayers = #f31_local16.teamStatVals
					end
					if f31_local19 and f31_local19.teamStatVals then
						local self
						if self.maxNumActivePlayers < #f31_local19.teamStatVals then
							self = #f31_local19.teamStatVals
							if not self then
							
							else
								self.maxNumActivePlayers = self
							end
						end
						self = self.maxNumActivePlayers
					end
					f31_local20.height = f0_local31 + (f0_local26 - 1) * self.maxNumActivePlayers + 1
					self:registerAnimationState( "default", f31_local20 )
					self:animateToState( "default" )
					self.leftTeam = f31_local13
					self.rightTeam = f31_local14
					self.localPlayerTeam = f31_local8
					if not Engine.InFrontend() then
						self:registerEventHandler( "open_scoreboard", OnOpenScoreboard )
						self:registerEventHandler( "close_scoreboard", OnCloseScoreboard )
						self:registerEventHandler( "show_host_migration_triggered", OnStartHostMigration )
						self:registerEventHandler( "hide_host_migration", OnEndHostMigration )
						self:registerEventHandler( "toggle_scoreboard", OnToggleScoreboard )
						self:registerEventHandler( "refresh_scoreboard", OnRefreshScoreboard )
						self:registerEventHandler( "init_refresh", OnInitRefreshScoreboard )
						self:registerOmnvarHandler( "ui_round_end", OnRoundEnd )
					end
					AddScoreboardHeader( self, f31_arg1 )
					self.leftTeamLeftOffset = f0_local55
					local self = AddTeam
					local self = self
					if f31_local13 == Teams.allies then
						local f31_local24 = f31_local16
					end
					self( self, f31_local24 or f31_local19, self.leftTeamLeftOffset, f31_local13, true )
					if not f0_local56 then
						self.rightTeamLeftOffset = (f0_local22 - f0_local23) / 2 + f0_local23
						self = AddTeam
						self = self
						if f31_local13 == Teams.allies then
							local f31_local25 = f31_local19
						end
						self( self, f31_local25 or f31_local16, self.rightTeamLeftOffset, f31_local14, false )
					end
					AddWinningTeamBgIcon( f31_arg1.winningTeam, self )
					if f0_local56 and Engine.InFrontend() and f31_local16 and f31_local16.teamStatVals then
						self = #f31_local16.teamStatVals
						if (self or -1) > 0 then
							AddTopPlayers( self, self, f31_local16 )
						end
					end
					self = LUI.UITimer.new( 250, {
						name = "refresh_scoreboard"
					}, nil, false, self, false )
					self.id = "refreshTimer"
					LUI.UITimer.Disable( self )
					self:addElement( self )
					self = LUI.UITimer.new( 2000, {
						name = "refresh_scoreboard"
					}, nil, false, self, false )
					self.id = "periodicRefreshTimer"
					self:addElement( self )
					local self = LUI.UITimer.new( 250, {
						name = "init_refresh"
					}, nil, false, self, false )
					self.id = "initRefreshTimer"
					self:addElement( self )
					if not f31_local8 or f31_local8 == Teams.spectator then
						self.childRecord.localPlayerHighlight:animateToState( "disabled" )
					end
					if not Engine.InFrontend() then
						local self = LUI.UIElement.new( {
							leftAnchor = true,
							topAnchor = true,
							rightAnchor = true,
							bottomAnchor = true,
							left = 0,
							top = 0,
							right = 0,
							bottom = 0
						} )
						self:setupLetterboxElement()
						self:addElement( self )
						self.id = self.id .. "_letterbox"
						self = self
					end
					self.isOpen = false
					return self
				end
			end
			f31_local13 = f0_local32 + f0_local33 + f0_local31
		end
	end
	f31_local10 = 18
end

LUI.MenuBuilder.registerType( "scoreboard", LUI.Scoreboard.new )
LockTable( _M )
