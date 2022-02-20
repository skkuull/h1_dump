local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.inGameBase = InheritFrom( LUI.MenuTemplate )
function inGameModeDisplay()
	local f1_local0 = GameX.GetGameMode()
	local f1_local1 = Engine.Localize( "@" .. Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f1_local0, GameTypesTable.Cols.Name ) .. "_CAPS" )
	local f1_local2, f1_local3, f1_local4 = nil
	if f1_local0 == "gun" then
		f1_local4 = Engine.GetDvarInt( "ui_scorelimit" )
	elseif MatchRules.IsUsingMatchRulesData() then
		f1_local4 = MatchRules.GetData( "commonOption", "scoreLimit" )
	else
		f1_local3 = Engine.GetDvarInt( "scr_" .. f1_local0 .. "_winlimit" )
		if f1_local3 <= 1 then
			f1_local4 = Engine.GetDvarInt( "scr_" .. f1_local0 .. "_scorelimit" )
		else
			f1_local4 = f1_local3
		end
	end
	if f1_local4 == 0 then
		f1_local2 = Engine.Localize( "@OBJECTIVES_" .. f1_local0 .. "" )
	elseif f1_local0 ~= "sd" and f1_local0 ~= "dd" then
		f1_local2 = Engine.Localize( "@OBJECTIVES_" .. f1_local0 .. "_SCORE", f1_local4 )
	else
		local f1_local5 = Game.GetPlayerTeam()
		if f1_local5 == Teams.spectator then
			f1_local2 = Engine.Localize( "@OBJECTIVES_SD_PRE_TEAM" )
		else
			local f1_local6 = Game.GetOmnvar( "ui_attacking_team" )
			if f1_local6 > 0 then
				if f1_local5 == f1_local6 then
					f1_local2 = Engine.Localize( "@OBJECTIVES_" .. f1_local0 .. "_ATTACKER_SCORE", f1_local4 )
				else
					f1_local2 = Engine.Localize( "@OBJECTIVES_" .. f1_local0 .. "_DEFENDER_SCORE", f1_local4 )
				end
			else
				f1_local2 = ""
			end
		end
	end
	local f1_local5, f1_local6, f1_local7, f1_local8 = GetTextDimensions( f1_local1, CoD.TextSettings.BodyFontSmall.Font, CoD.TextSettings.BodyFontSmall.Height )
	local f1_local9 = 50
	local f1_local10 = nil
	if Engine.UsingSplitscreenUpscaling() then
		f1_local10 = {
			topAnchor = true,
			leftAnchor = true,
			top = LUI.MenuTemplate.ListTop,
			left = 260,
			height = 65,
			width = f1_local7 + f1_local9
		}
	else
		f1_local10 = {
			leftAnchor = true,
			left = 4,
			height = 65,
			width = f1_local7 + f1_local9
		}
	end
	local self = LUI.UIElement.new( f1_local10 )
	self.id = "gamemode_Id"
	local f1_local12 = {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 50,
		height = CoD.TextSettings.BodyFontSmall.Height,
		font = CoD.TextSettings.BodyFontSmall.Font,
		alignment = LUI.Alignment.Center
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f1_local12.top = 47
	end
	local self = LUI.UIText.new( f1_local12 )
	self.id = "gamemode_title_Id"
	self:setText( f1_local1 )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	local f1_local14 = LUI.DecoFrame.new( CoD.CreateState( nil, f1_local6 + 52, nil, f1_local8 + 43, CoD.AnchorTypes.TopLeftRight ) )
	local f1_local15 = CoD.CreateState( nil, f1_local8 + 43, nil, f1_local6 + 52, CoD.AnchorTypes.TopLeftRight )
	f1_local15.color = {
		r = 0,
		g = 0,
		b = 0
	}
	f1_local15.alpha = 1
	local self = LUI.UIImage.new( f1_local15 )
	local f1_local17 = {
		topAnchor = true,
		leftAnchor = true,
		top = 63 + CoD.TextSettings.BodyFontSmall.Height,
		left = 0,
		height = CoD.TextSettings.BodyFontSmall.Height * 0.85,
		width = 250,
		font = CoD.TextSettings.BodyFontSmall.Font,
		alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
		red = Colors.mw1_green.r,
		green = Colors.mw1_green.g,
		blue = Colors.mw1_green.b,
		lineSpacingRatio = 0.3
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f1_local17.top = f1_local17.top - 3
	end
	local self = LUI.UIText.new( f1_local17 )
	self.id = "gamemode_desc_Id"
	self:setText( f1_local2 )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( self )
	self:addElement( f1_local14 )
	self:addElement( self )
	self:addElement( self )
	return self
end

function inGameMinimap()
	local f2_local0 = Engine.UsingSplitscreenUpscaling()
	local f2_local1 = Engine.ToUpperCase( Lobby.GetMapName() )
	local f2_local2 = RegisterMaterial( "hud_minimap_border" )
	local f2_local3
	if f2_local0 then
		f2_local3 = 260
		if not f2_local3 then
		
		else
			local f2_local4 = f2_local3
			local self = LUI.UIElement.new( {
				topAnchor = true,
				rightAnchor = true,
				top = 94,
				right = -331,
				height = f2_local3,
				width = f2_local4
			} )
			self.id = "map_Id"
			local f2_local6 = {
				topAnchor = true,
				leftAnchor = true,
				top = 8,
				left = 0,
				height = CoD.TextSettings.TitleFontMedium.Height * 0.75,
				width = f2_local4,
				font = CoD.TextSettings.TitleFontMedium.Font,
				alignment = LUI.Alignment.Center
			}
			if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
				f2_local6.top = 5
			end
			local self = LUI.UIText.new( f2_local6 )
			self.id = "map_title_Id"
			self:setText( f2_local1 )
			self:setTextStyle( CoD.TextStyle.Shadowed )
			local f2_local8 = LUI.DecoFrame.new( CoD.CreateState( 0, 0, f2_local4, 32, CoD.AnchorTypes.TopLeft ) )
			local f2_local9 = CoD.CreateState( 0, 0, f2_local4, 32, CoD.AnchorTypes.TopLeft )
			f2_local9.material = RegisterMaterial( "black" )
			f2_local9.alpha = 0.75
			local self = LUI.UIImage.new( f2_local9 )
			local f2_local11 = CoD.CreateState( 0, -8, nil, nil, CoD.AnchorTypes.TopLeft )
			f2_local11.width = f2_local4
			local f2_local12 = LUI.Divider.new( f2_local11, 24, 1 )
			f2_local12.id = "top_divider"
			local f2_local13 = CoD.CreateState( 0, CoD.TextSettings.TitleFontMedium.Height + 5, f2_local4, f2_local3 + 40, CoD.AnchorTypes.TopLeft )
			f2_local13.material = RegisterMaterial( "h1_ui_dot_pattern_lg" )
			f2_local13.alpha = 0.75
			local self = LUI.UIImage.new( f2_local13 )
			self:setupTiles( 45 )
			self:addElement( self )
			LUI.MenuBuilder.BuildAddChild( self, {
				type = "UIMinimap",
				id = "map_mini_id",
				properties = {
					compassType = CoD.CompassType.Full
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						top = CoD.TextSettings.TitleFontMedium.Height + 5,
						left = 0,
						height = f2_local3,
						width = f2_local4,
						alpha = 0.5
					},
					inactive = {
						alpha = 0
					}
				}
			} )
			LUI.MenuBuilder.BuildAddChild( self, {
				type = "UIMinimapIcons",
				id = "map_mini_icons_id",
				properties = {
					compassType = CoD.CompassType.Full
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						top = CoD.TextSettings.TitleFontMedium.Height + 5,
						left = 0,
						height = f2_local3,
						width = f2_local4,
						alpha = 1
					},
					inactive = {
						alpha = 0
					}
				}
			} )
			local f2_local15 = LUI.MenuBuilder.BuildRegisteredType( "perspectiveBlur" )
			f2_local15:registerAnimationState( "default", {
				topAnchor = true,
				leftAnchor = true,
				top = CoD.TextSettings.TitleFontMedium.Height + 5,
				left = 0,
				height = f2_local3,
				width = f2_local4,
				alpha = 1
			} )
			f2_local15:registerAnimationState( "inactive", {
				alpha = 0
			} )
			f2_local15:animateToState( "default", 0 )
			self:addElement( f2_local15 )
			self:addElement( f2_local12 )
			self:addElement( self )
			self:addElement( f2_local8 )
			self:addElement( self )
			return self
		end
	end
	f2_local3 = 480
end

LUI.inGameBase.new = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.MenuTemplate.new( f3_arg0, f3_arg1 )
	f3_local0:setClass( LUI.inGameBase )
	f3_local0:addElement( inGameModeDisplay() )
	if not Game.IsEmpJammed() and Game.GetOmnvar( "ui_hud_static" ) == 0 and not Game.GetOmnvar( "ui_hud_emp_artifact" ) and not Game.InKillCam() then
		local map = inGameMinimap()
		f3_local0:addElement( map )
		f3_local0.map = map
		
	else
		f3_local0:registerEventHandler( "playerstate_client_changed", function ( element, event )
			if f3_local0.map == nil then
				if not Game.IsEmpJammed() and Game.GetOmnvar( "ui_hud_static" ) == 0 and not Game.GetOmnvar( "ui_hud_emp_artifact" ) and not Game.InKillCam() then
					local f4_local0 = inGameMinimap()
					f3_local0:addElement( f4_local0 )
					f3_local0.map = f4_local0
				end
			end
		end )
	end
	if not f3_arg1 or not f3_arg1.disableBack then
		f3_local0:AddBackButton()
	end
	f3_local0:AddCountdownTimer()
	return f3_local0
end

LockTable( _M )
