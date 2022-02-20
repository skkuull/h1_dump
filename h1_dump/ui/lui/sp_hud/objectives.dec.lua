local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.Objectives = InheritFrom( LUI.UIElement )
f0_local0 = "disabled"
f0_local1 = nil
f0_local2 = false
local f0_local3 = 0.6
local f0_local4 = {
	Styles = {
		Minimap = {
			Top = 220,
			Left = -220,
			Width = 158,
			Height = 158,
			BGOffset = 15
		},
		MapInfos = {
			Top = 65,
			Right = -60,
			Spacing = 26
		},
		ObjectiveBox = {
			Top = 128.66 - DesignGridDims.vert_gutter,
			Left = GenericMenuDims.menu_width_standard - 518
		},
		ObjectiveTitle = {
			Top = 67,
			Left = 23,
			Width = 500
		},
		ObjectiveList = {
			Top = 120,
			Left = 38,
			Spacing = 22
		}
	}
}
function canShowMinimap()
	local f1_local0 = Engine.GetDvarString( "mapname" )
	local f1_local1
	if f1_local0 == "coup" or f1_local0 == "ac130" or f1_local0 == "aftermath" or f1_local0 == "jeepride" or f1_local0 == "airplane" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	return f1_local1
end

function updateMinimapVisibility()
	local f2_local0 = Engine.GetDvarBool( "compass" )
	if f2_local0 then
		f2_local0 = canShowMinimap()
	end
	local f2_local1
	if f2_local0 then
		f2_local1 = 1
		if not f2_local1 then
		
		else
			if f0_local1.miniMapElements then
				for f2_local5, f2_local6 in ipairs( f0_local1.miniMapElements ) do
					f2_local6:setAlpha( f2_local1 )
				end
			end
			return f2_local0
		end
	end
	f2_local1 = 0
end

function OnObjectivesCreate( f3_arg0, f3_arg1 )
	if Engine.GetDvarBool( "hud_showObjectives" ) == false or Engine.GetDvarBool( "credits_active" ) then
		f3_arg0:animateToState( "hidden", 0 )
	end
end

function UpdateDifficultyText( f4_arg0, f4_arg1 )
	local f4_local0 = Engine.GetDvarInt( "g_gameskill" )
	f4_arg0:setText( CoD.DifficultyList[Engine.GetDvarInt( "g_gameskill" ) + 1].tipText )
	local f4_local1 = MBh.AnimateSequence( {
		{
			"hidden",
			0
		},
		{
			"hidden",
			PauseMenuAnimationSettings.Intel.DelayIn + 1
		},
		{
			"default",
			PauseMenuAnimationSettings.Intel.DurationIn,
			false,
			true
		}
	} )
	f4_local1( f4_arg0 )
end

function OnIntelTextCreate( f5_arg0, f5_arg1 )
	if Engine.GetDvarBool( "hud_showIntel" ) == false or Engine.GetDvarBool( "credits_active" ) then
		f5_arg0:animateToState( "hidden", 0 )
	else
		f5_arg0:addElement( LUI.UITimer.new( 500, "updateIntelCount", nil, false, false, false, false, true ) )
		f5_arg0:registerEventHandler( "updateIntelCount", UpdateIntelText )
		UpdateIntelText( f5_arg0, nil )
		local f5_local0 = MBh.AnimateSequence( {
			{
				"hidden",
				0
			},
			{
				"hidden",
				PauseMenuAnimationSettings.Intel.DelayIn + 1
			},
			{
				"default",
				PauseMenuAnimationSettings.Intel.DurationIn,
				false,
				true
			}
		} )
		f5_local0( f5_arg0 )
	end
end

function UpdateIntelText( f6_arg0, f6_arg1 )
	local f6_local0, f6_local1 = GetIntelCount( Engine.GetDvarString( "mapname" ) )
	if f6_local0 > 0 then
		f6_arg0:setText( Engine.Localize( "@LUA_MENU_INTEL_FOUND", f6_local1, f6_local0 ) )
	end
end

function AddIntelAndDifficulty( f7_arg0 )
	local f7_local0 = Engine.GetDvarString( "mapname" )
	local f7_local1 = f0_local4.Styles.ObjectiveBox.Top + f0_local4.Styles.MapInfos.Top
	if f7_local0 ~= "killhouse" and f7_local0 ~= "coup" and f7_local0 ~= "aftermath" then
		local self = CoD.CreateState( nil, f7_local1, f0_local4.Styles.MapInfos.Right, nil, CoD.AnchorTypes.TopRight )
		self.height = CoD.TextSettings.BodyFontSmall.Height
		self.font = CoD.TextSettings.BodyFontSmall.Font
		self.color = Colors.h1.second_medium_grey
		self.alpha = 1
		local self = LUI.UIText.new( self )
		self.id = "difficultyText"
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		UpdateDifficultyText( self )
		f7_arg0:addElement( self )
		f7_local1 = f7_local1 + f0_local4.Styles.MapInfos.Spacing
	end
	local f7_local4 = CoD.CreateState( nil, f7_local1, f0_local4.Styles.MapInfos.Right, nil, CoD.AnchorTypes.TopRight )
	f7_local4.height = CoD.TextSettings.BodyFontSmall.Height
	f7_local4.font = CoD.TextSettings.BodyFontSmall.Font
	f7_local4.color = Colors.h1.second_medium_grey
	f7_local4.alpha = 1
	local self = LUI.UIText.new( f7_local4 )
	self.id = "intelText"
	self.properties = {
		text = "",
		textStyle = CoD.TextStyle.Shadowed
	}
	self:registerAnimationState( "not_found", {
		red = 1,
		blue = 0,
		green = 0
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	OnIntelTextCreate( self )
	f7_arg0:addElement( self )
end

function AddObjectives( f8_arg0 )
	local f8_local0 = CoD.CreateState( f0_local4.Styles.ObjectiveBox.Left, f0_local4.Styles.ObjectiveBox.Top, nil, nil, CoD.AnchorTypes.Top )
	f8_local0.width = 775
	f8_local0.height = 600
	f8_local0.alpha = 1
	local self = LUI.UIElement.new( f8_local0 )
	self.id = "missionObjectiveBoxId"
	local f8_local2 = CoD.CreateState( f0_local4.Styles.ObjectiveTitle.Left, f0_local4.Styles.ObjectiveTitle.Top, nil, nil, CoD.AnchorTypes.TopLeft )
	f8_local2.alignment = LUI.Alignment.Left
	f8_local2.font = CoD.TextSettings.TitleFontSmaller.Font
	f8_local2.color = Colors.h1.light_grey
	f8_local2.width = f0_local4.Styles.ObjectiveTitle.Width
	f8_local2.height = CoD.TextSettings.TitleFontSmaller.Height
	f8_local2.alpha = 1
	
	local objectiveHeader = LUI.UIText.new( f8_local2 )
	objectiveHeader:setText( Engine.Localize( "@CGAME_MISSIONOBJECTIVES" ) )
	objectiveHeader.id = "missionObjectiveHeaderId"
	self:addElement( objectiveHeader )
	self.objectiveHeader = objectiveHeader
	
	local f8_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f8_local4.color = Colors.h1.black
	f8_local4.alpha = 0.8
	local self = LUI.UIImage.new( f8_local4 )
	self.id = "background"
	self:setupFullWindowElement()
	f8_arg0:addElement( self )
	local f8_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f8_local6.alpha = 1
	local self = LUI.UIElement.new( f8_local6 )
	self.id = "objectivesContainer"
	self:addElement( self )
	f8_arg0:addElement( self )
	if f0_local2 then
		local f8_local8 = CoD.CreateState( -785, 148, -58, nil, CoD.AnchorTypes.TopRight )
		f8_local8.height = 1
		f8_local8.material = RegisterMaterial( "white" )
		f8_arg0:addElement( LUI.UIImage.new( f8_local8 ) )
	end
	local f8_local8 = Engine.GetDvarString( "mapname" )
	local f8_local9 = CoD.CreateState( -500, 94, -58, nil, CoD.AnchorTypes.TopRight )
	f8_local9.alignment = LUI.Alignment.Right
	f8_local9.font = CoD.TextSettings.TitleFontSmaller.Font
	f8_local9.height = CoD.TextSettings.TitleFontSmaller.Height
	f8_local9.color = Colors.h1.light_green
	local self = LUI.UIText.new( f8_local9 )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@MENU_SP_H1_" .. Engine.ToUpperCase( f8_local8 ) ) ) )
	f8_arg0:addElement( self )
	local f8_local11 = CoD.CreateState( nil, 115, -59, nil, CoD.AnchorTypes.TopRight )
	f8_local11.width = 20
	f8_local11.height = 1
	f8_local11.material = RegisterMaterial( "white" )
	f8_local11.color = Colors.mw1_green
	f8_arg0:addElement( LUI.UIImage.new( f8_local11 ) )
	RefreshObjectives( f8_arg0 )
	AddIntelAndDifficulty( f8_arg0 )
	if canShowMinimap() then
		AddMiniMap( f8_arg0 )
	end
end

function AddMiniMap( f9_arg0 )
	f9_arg0.miniMapElements = {}
	local f9_local0 = CoD.CreateState( f0_local4.Styles.Minimap.Left - f0_local4.Styles.Minimap.BGOffset, f0_local4.Styles.Minimap.Top - f0_local4.Styles.Minimap.BGOffset, nil, nil, CoD.AnchorTypes.TopRight )
	f9_local0.width = f0_local4.Styles.Minimap.Width + 2 * f0_local4.Styles.Minimap.BGOffset
	f9_local0.height = f0_local4.Styles.Minimap.Height + 2 * f0_local4.Styles.Minimap.BGOffset
	f9_local0.alpha = 1
	f9_local0.material = RegisterMaterial( "h1_bg_map" )
	local self = LUI.UIImage.new( f9_local0 )
	f9_arg0:addElement( self )
	f9_arg0.miniMapElements[#f9_arg0.miniMapElements + 1] = self
	local f9_local2 = LUI.MenuBuilder.BuildRegisteredType( "UIMinimap", {
		compassType = CoD.CompassType.Partial
	} )
	f9_local2.id = "map_mini_id"
	f9_local2.alpha = 1
	f9_local2:setLeftRight( false, true, f0_local4.Styles.Minimap.Left, f0_local4.Styles.Minimap.Left + f0_local4.Styles.Minimap.Width )
	f9_local2:setTopBottom( true, false, f0_local4.Styles.Minimap.Top, f0_local4.Styles.Minimap.Top + f0_local4.Styles.Minimap.Height )
	f9_arg0:addElement( f9_local2 )
	f9_arg0.miniMapElements[#f9_arg0.miniMapElements + 1] = f9_local2
	local f9_local3 = {
		width = f0_local4.Styles.Minimap.Width,
		height = f0_local4.Styles.Minimap.Height,
		material = RegisterMaterial( "h1_deco_map_glitch_01" ),
		alpha = 0.1,
		zRot = 0
	}
	local self = LUI.UIImage.new( f9_local3 )
	self.id = "map_overlay_id"
	f9_local3.zRot = -90
	self:registerAnimationState( "rot_90", f9_local3 )
	f9_local3.zRot = -180
	self:registerAnimationState( "rot_180", f9_local3 )
	f9_local3.zRot = -270
	self:registerAnimationState( "rot_270", f9_local3 )
	OnMiniMapOverlayCreate( self )
	f9_local2:addElement( self )
	local f9_local5 = LUI.MenuBuilder.BuildRegisteredType( "UIMinimapIcons", {
		compassType = CoD.CompassType.Partial,
		defAnimState = {
			topAnchor = true,
			rightAnchor = true,
			width = f0_local4.Styles.Minimap.Width,
			height = f0_local4.Styles.Minimap.Height,
			alpha = 1
		}
	} )
	f9_local5.id = "map_mini_icons_id"
	f9_local5:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f9_local5.properties = {
		drawPlayer = true,
		drawObjectives = false
	}
	f9_local5:setUseStencil( true )
	f9_local2:addElement( f9_local5 )
	f9_local5.mapBlipPulse = LUI.MapBlipPulse.new( f9_local5 )
	f9_local5.mapBlipPulse.id = "newMapBlipPulse"
	f9_local5.objectiveCount = 0
	f9_local5:registerEventHandler( "update_minimap", Update )
	updateMinimapVisibility()
end

function RefreshObjectives( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0:getChildById( "missionObjectiveBoxId" )
	if f10_local0 == nil then
		return 
	end
	local f10_local1 = f10_local0:getChildById( "objectivesContainer" )
	if f10_local1 == nil then
		return 
	end
	f10_local1:closeChildren()
	local f10_local2 = 9
	local f10_local3 = 17
	local f10_local4 = 10.66
	local f10_local5 = 27
	local f10_local6 = {
		[0] = Colors.white,
		[1] = Colors.h1.light_grey,
		[2] = Colors.white,
		[3] = Colors.grey_4,
		[4] = Colors.h1.yellow,
		[5] = Colors.white
	}
	local f10_local7 = CoD.CreateState( f0_local4.Styles.ObjectiveList.Left + f10_local4 + f10_local2, f0_local4.Styles.ObjectiveList.Top - CoD.TextSettings.BodyFontVeryTiny.Height / 2 - f10_local4 / 2, 500, nil, CoD.AnchorTypes.TopLeft )
	f10_local7.height = CoD.TextSettings.BodyFontTiny.Height
	f10_local7.spacing = f10_local3
	local self = LUI.UIVerticalList.new( f10_local7 )
	local f10_local9 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f10_local9.width = 500
	f10_local9.height = CoD.TextSettings.BodyFontTiny.Height
	f10_local9.alignment = LUI.Alignment.Left
	f10_local9.alpha = 1
	f10_local9.font = CoD.TextSettings.BodyFontTiny.Font
	local f10_local10 = CoD.CreateState( -(f10_local4 + f10_local2), 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f10_local10.width = f10_local4
	f10_local10.height = f10_local4
	local f10_local11 = Engine.GetPauseMenuObjectives()
	if f10_local11 then
		for f10_local12 = 1, #f10_local11, 1 do
			if f10_local11[f10_local12] ~= nil then
				f10_local9.color = f10_local6[f10_local11[f10_local12].state]
				f10_local9.left = f10_local11[f10_local12].indentLevel * f10_local5
				local self = LUI.UIText.new( f10_local9 )
				self.id = "objective" .. f10_local12
				self.properties = {
					text = "",
					textStyle = CoD.TextStyle.Shadowed
				}
				self:setText( Engine.Localize( f10_local11[f10_local12].name ) )
				if f10_local11[f10_local12].iconMaterial ~= nil then
					f10_local10.width = f10_local10.height * Engine.GetMaterialAspectRatio( f10_local11[f10_local12].iconMaterial )
					f10_local10.material = f10_local11[f10_local12].iconMaterial
					f10_local10.color = f10_local6[f10_local11[f10_local12].state]
					local self = LUI.UIImage.new( f10_local10 )
					self.id = "objectiveIcon" .. f10_local12
					self:addElement( self )
				end
				self:addElement( self )
			end
		end
	end
	if f10_local0.objectiveHeader then
		if #f10_local11 == 0 then
			f10_local0.objectiveHeader.alpha = 0
		else
			f10_local0.objectiveHeader.alpha = 1
		end
	end
	f10_local1:addElement( self )
	updateMinimapVisibility()
end

function Update( f11_arg0 )
	if not Engine.GetDvarBool( "hud_drawHud" ) then
		OnCloseObjectives( f0_local1 )
		return 
	else
		RefreshMinimapObjectives( f11_arg0 )
	end
end

function RefreshMinimapObjectives( f12_arg0 )
	if updateMinimapVisibility() then
		local f12_local0 = Engine.GetPlayerObjectivePositions( f0_local4.Styles.Minimap.Width / 1.5, f0_local4.Styles.Minimap.Height / 1.5 )
		if f12_local0 then
			for f12_local1 = 1, #f12_local0, 1 do
				local f12_local4 = f12_local0[f12_local1].x * 1.5
				local f12_local5 = f12_local0[f12_local1].y * 1.5
				if f12_arg0.objectiveCount < f12_local1 then
					f12_arg0.mapBlipPulse:addPulse( {
						name = "objective_" .. f12_local1,
						posX = f12_local4,
						posY = f12_local5,
						anchor = CoD.AnchorTypes.None,
						useContainer = true
					} )
				end
				local f12_local6 = false
				local f12_local7 = f12_arg0.mapBlipPulse:getFirstChild()
				while f12_local7 ~= nil and not f12_local6 do
					if string.find( f12_local7.id, f12_local1 .. "_container" ) then
						f12_local7:setLeftRight( false, false, f12_local4, f12_local4 + 1 )
						f12_local7:setTopBottom( false, false, f12_local5, f12_local5 + 1 )
						f12_local6 = true
					else
						f12_local7 = f12_local7:getNextSibling()
					end
				end
			end
			f12_arg0.objectiveCount = #f12_local0
		end
	end
end

function OnKeyChange( f13_arg0, f13_arg1 )
	if not f13_arg1.keyUp then
		if not f13_arg0.isVisible and Engine.GetDvarBool( "hud_drawHud" ) then
			OnOpenObjectives( f13_arg0 )
		end
	else
		OnCloseObjectives( f13_arg0 )
	end
end

function OnOpenObjectives( f14_arg0, f14_arg1 )
	if not f14_arg0.isVisible then
		f14_arg0.isVisible = true
		AddObjectives( f0_local1 )
		f0_local0 = "enabled"
		f14_arg0:animateToState( f0_local0 )
	end
end

function OnCloseObjectives( f15_arg0, f15_arg1 )
	if f15_arg0.isVisible then
		f15_arg0.isVisible = false
		f0_local0 = "disabled"
		f15_arg0:animateToState( f0_local0 )
		f0_local1.miniMapElements = {}
		f15_arg0:closeChildren()
	end
end

LUI.Objectives.new = function ( f16_arg0 )
	local f16_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f16_local0.alpha = 0
	f0_local1 = LUI.UIElement.new( f16_local0 )
	f0_local1.id = "sp_objectivesId"
	f0_local1:setClass( LUI.Objectives )
	f0_local1.isVisible = false
	f0_local1:setupLetterboxElement()
	f0_local1:registerAnimationState( "default", {
		alpha = 0
	} )
	f0_local1:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f0_local1:registerEventHandler( "toggle_objective", OnKeyChange )
	f0_local1:animateToState( "default", 0 )
	f0_local1:registerEventHandler( "game_message", RefreshObjectives )
	return f0_local1
end

function OnMiniMapOverlayCreate( f17_arg0, f17_arg1 )
	local f17_local0 = 33
	local f17_local1 = f17_arg0
	local f17_local2 = f17_arg0.animateInLoop
	local f17_local3 = {
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f17_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f17_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f17_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f17_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f17_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f17_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f17_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f17_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f17_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f17_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f17_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f17_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f17_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f17_local0,
			false,
			false
		},
		{
			"default",
			0,
			false,
			false
		},
		{
			"default",
			f17_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f17_local0,
			false,
			false
		},
		{
			"rot_270",
			0,
			false,
			false
		},
		{
			"rot_270",
			f17_local0,
			false,
			false
		},
		{
			"rot_90",
			0,
			false,
			false
		},
		{
			"rot_90",
			f17_local0,
			false,
			false
		},
		{
			"rot_180",
			0,
			false,
			false
		},
		{
			"rot_180",
			f17_local0,
			false,
			false
		}
	}
	local f17_local4 = {
		"rot_270",
		0,
		false,
		false
	}
	local f17_local5 = {
		"rot_270",
		f17_local0,
		false,
		false
	}
	local f17_local6 = {
		"rot_180",
		0,
		false,
		false
	}
	local f17_local7 = {
		"rot_180",
		f17_local0,
		false,
		false
	}
	local f17_local8 = {
		"rot_90",
		0,
		false,
		false
	}
	local f17_local9 = {
		"rot_90",
		f17_local0,
		false,
		false
	}
	local f17_local10 = {
		"rot_180",
		0,
		false,
		false
	}
	local f17_local11 = {
		"rot_180",
		f17_local0,
		false,
		false
	}
	local f17_local12 = {
		"default",
		0,
		false,
		false
	}
	local f17_local13 = {
		"default",
		f17_local0,
		false,
		false
	}
	local f17_local14 = {
		"rot_90",
		0,
		false,
		false
	}
	local f17_local15 = {
		"rot_90",
		f17_local0,
		false,
		false
	}
	local f17_local16 = {
		"rot_270",
		0,
		false,
		false
	}
	local f17_local17 = {
		"rot_270",
		f17_local0,
		false,
		false
	}
	f17_local3[33] = f17_local4
	f17_local3[34] = f17_local5
	f17_local3[35] = f17_local6
	f17_local3[36] = f17_local7
	f17_local3[37] = f17_local8
	f17_local3[38] = f17_local9
	f17_local3[39] = f17_local10
	f17_local3[40] = f17_local11
	f17_local3[41] = f17_local12
	f17_local3[42] = f17_local13
	f17_local3[43] = f17_local14
	f17_local3[44] = f17_local15
	f17_local3[45] = f17_local16
	f17_local3[46] = f17_local17
	f17_local2( f17_local1, f17_local3, nil, nil, true )
end

LockTable( _M )
