local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function initMapLocationSelectorHud( f1_arg0, f1_arg1 )
	assert( f1_arg1.value )
	if f1_arg1.value then
		f1_arg0:animateToState( "active", 0 )
	else
		f1_arg0:animateToState( "default", 0 )
	end
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	assert( f2_arg0 )
	if Game.GetOmnvar( "ui_map_location_blocked" ) == 1 then
		f2_arg0:show()
	else
		f2_arg0:hide()
	end
end

f0_local1 = function ()
	local f3_local0 = {
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapMap,
			id = "MapLocationSelectorMap_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapPointers,
			id = "MapLocationSelectorPointers_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapSentries,
			id = "MapLocationSelectorSentries_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapFriends,
			id = "MapLocationSelectorFriends_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapEnemies,
			id = "MapLocationSelectorEnemies_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapPortableRadars,
			id = "MapLocationSelectorPortableRadars_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapTrophySystems,
			id = "MapLocationSelectorTrophySystems_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapScramblers,
			id = "MapLocationSelectorScramblers_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapVehicles,
			id = "MapLocationSelectorVehicles_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapPlanes,
			id = "MapLocationSelectorPlanes_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapPlayer,
			id = "MapLocationSelectorPlayer_id"
		},
		{
			ownerDraw = CoD.Ownerdraw.CGPlayerFullmapLocationSelector,
			id = "MapLocationSelectorLocationSelector_id"
		}
	}
	local f3_local1 = Engine.UsingSplitscreenUpscaling()
	local f3_local2, f3_local3, f3_local4, f3_local5 = nil
	f3_local2 = 53
	f3_local3 = 50
	f3_local4 = -157
	f3_local5 = -120
	if f3_local1 then
		f3_local2 = f3_local2 / 2
		f3_local3 = f3_local3 / 2
		f3_local4 = f3_local4 / 2
		f3_local5 = f3_local5 / 2
	end
	local self = LUI.UIElement.new( CoD.CreateState( f3_local2, f3_local3, f3_local4, f3_local5, CoD.AnchorTypes.All ) )
	self.id = "MapLocationSelectorOwnerDrawContainer_id"
	for f3_local7 = 1, #f3_local0, 1 do
		local f3_local10 = {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = true
		}
		local f3_local11 = f3_local0[f3_local7]
		local f3_local12 = LUI.MenuBuilder.buildItems( {
			type = "UIOwnerdraw"
		}, {
			ownerDraw = f3_local11.ownerDraw
		}, self )
		f3_local12.id = f3_local11.id
		if f3_local11.ownerDraw == CoD.Ownerdraw.CGPlayerFullmapMap then
			f3_local10.alpha = 0.5
		end
		f3_local12:registerAnimationState( "default", f3_local10 )
		f3_local12:animateToState( "default", 0 )
		self:addElement( f3_local12 )
	end
	return self
end

f0_local2 = function ()
	local f4_local0 = {
		material = RegisterMaterial( "scorestreak_hud_dotted_background" ),
		width = 224 * RES_CONVERT,
		height = 64 * RES_CONVERT
	}
	local f4_local1 = {
		material = RegisterMaterial( "scorestreak_hud_warning" ),
		width = 48 * RES_CONVERT,
		height = 48 * RES_CONVERT
	}
	local f4_local2 = CoD.TextSettings.BodyFontBold18
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 100,
		height = 50,
		left = 0,
		right = 0,
		alpha = 0
	} )
	self.id = "MapLocationSelectorMessageContainer_id"
	self:registerOmnvarHandler( "ui_map_location_blocked", f0_local0 )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = f4_local0.width,
		height = f4_local0.height,
		material = f4_local0.material,
		color = Colors.red
	} )
	self.id = "MapLocationSelectorMessageBackground_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -22,
		width = f4_local1.width,
		height = f4_local1.height,
		material = f4_local1.material,
		color = Colors.red
	} )
	self.id = "MapLocationSelectorMessageWarningIcon_id"
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -8,
		height = f4_local2.Height,
		left = 0,
		right = 0,
		font = f4_local2.Font,
		alignment = LUI.Alignment.Center,
		glow = LUI.GlowState.LightGreen,
		color = Colors.white
	} )
	self.id = "MapLocationSelectorMessageText_id"
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:setText( Engine.Localize( "@KILLSTREAKS_AIRSTRIKE_BLOCKED" ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	f0_local0( self )
	return self
end

local f0_local3 = function ()
	local f5_local0 = {
		material = RegisterMaterial( "scorestreak_hud_vertical_line_ticked" ),
		width = 24 * RES_CONVERT,
		height = 360 * RES_CONVERT
	}
	local f5_local1 = {
		material = RegisterMaterial( "scorestreak_hud_doublearrow" ),
		width = 28 * RES_CONVERT,
		height = 28 * RES_CONVERT
	}
	local f5_local2 = {
		material = RegisterMaterial( "scorestreak_hud_angle_bracket" ),
		width = 100 * RES_CONVERT,
		height = 100 * RES_CONVERT
	}
	local f5_local3 = CoD.TextSettings.SP_HudCarbon27
	local f5_local4 = 12
	local f5_local5 = 60
	local f5_local6 = 40
	local f5_local7 = 8 * RES_CONVERT
	f5_local3.Width = 16
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = 700,
		height = 560
	} )
	self.id = "MapLocationSelectorCompassContainer_id"
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = 5,
		right = -(f5_local6 + 4),
		width = f5_local3.Width,
		height = f5_local3.Height * 0.55,
		font = f5_local3.Font,
		alignment = LUI.Alignment.Right
	} )
	self.id = "MapLocationSelectorCompassTextMapNum_id"
	self:setText( "01" )
	local f5_local10 = RegisterMaterial( "h1_deco_corner_bracket" )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = f5_local6,
		width = f5_local7,
		height = f5_local7,
		material = f5_local10
	} )
	self.id = "MapLocationSelectorUpperLeftBracket_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		left = -f5_local6,
		width = -f5_local7,
		height = f5_local7,
		material = f5_local10
	} )
	self.id = "MapLocationSelectorUpperRightBracket_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		left = -f5_local6,
		width = -f5_local7,
		top = f5_local6,
		height = -f5_local7,
		material = f5_local10
	} )
	self.id = "MapLocationSelectorLowerRightBracket_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		left = f5_local6,
		width = f5_local7,
		top = f5_local6,
		height = -f5_local7,
		material = f5_local10
	} )
	self.id = "MapLocationSelectorLowerLeftBracket_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		left = 75,
		width = 92 * RES_CONVERT,
		height = 100 * RES_CONVERT,
		material = RegisterMaterial( "scorestreak_hud_airstrike_icon" )
	} )
	self.id = "MapLocationSelectorairstrikeIcon_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = f5_local6,
		width = f5_local0.width,
		height = f5_local0.height,
		material = f5_local0.material
	} )
	self.id = "MapLocationSelectorCompassVertLineLeft_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		right = -f5_local6,
		width = f5_local0.width,
		height = f5_local0.height,
		material = f5_local0.material
	} )
	self.id = "MapLocationSelectorCompassVertLineRight_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = 10,
		right = -44,
		width = f5_local2.width,
		height = f5_local2.height,
		material = f5_local2.material
	} )
	self.id = "MapLocationSelectorCompassAngleBracket_id"
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		width = f5_local1.width,
		height = f5_local1.height,
		material = f5_local1.material
	} )
	self.id = "MapLocationSelectorCompassDoubleArrow_id"
	local f5_local20 = CoD.CreateState( 0, 1, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 0,
		width = f5_local3.Width,
		height = f5_local3.Height * 0.8,
		font = f5_local3.Font,
		alignment = LUI.Alignment.Center
	} )
	self.id = "MapLocationSelectorCompassTextNorth_id"
	self:setText( Engine.Localize( "@KILLSTREAKS_STRAFING_RUN_COMPASS_N" ) )
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		width = f5_local3.Width,
		height = f5_local3.Height * 0.6,
		font = f5_local3.Font,
		alignment = LUI.Alignment.Center
	} )
	self.id = "MapLocationSelectorCompassTextSouth_id"
	self:setText( Engine.Localize( "@KILLSTREAKS_STRAFING_RUN_COMPASS_S" ) )
	self:addElement( LUI.DecoFrame.new( f5_local20, LUI.DecoFrame.Grey ) )
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = f5_local0.width + 4,
		width = f5_local3.Width,
		height = f5_local3.Height * 0.6,
		font = f5_local3.Font,
		alignment = LUI.Alignment.Center
	} )
	self.id = "MapLocationSelectorCompassTextWest_id"
	self:setText( Engine.Localize( "@KILLSTREAKS_STRAFING_RUN_COMPASS_W" ) )
	self:addElement( LUI.DecoFrame.new( f5_local20, LUI.DecoFrame.Grey ) )
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		right = -(f5_local0.width + 4),
		width = f5_local3.Width,
		height = f5_local3.Height * 0.6,
		font = f5_local3.Font,
		alignment = LUI.Alignment.Center
	} )
	self.id = "MapLocationSelectorCompassTextEast_id"
	self:setText( Engine.Localize( "@KILLSTREAKS_STRAFING_RUN_COMPASS_E" ) )
	self:addElement( LUI.DecoFrame.new( f5_local20, LUI.DecoFrame.Grey ) )
	local f5_local25 = Engine.Localize( "@KILLSTREAKS_STRAFING_RUN" )
	local f5_local26, f5_local27, f5_local28, f5_local29 = GetTextDimensions( f5_local25, CoD.TextSettings.TitleFontTiny.Font, CoD.TextSettings.TitleFontTiny.Height )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = -(f5_local28 + 30),
		width = f5_local28 + 30,
		height = CoD.TextSettings.TitleFontTiny.Height + 6
	} )
	self:addElement( LUI.DecoFrame.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), LUI.DecoFrame.Grey ) )
	local f5_local31 = CoD.CreateState( 5, nil, nil, nil, CoD.AnchorTypes.Left )
	f5_local31.width = 12
	f5_local31.height = 12
	f5_local31.zRot = 90
	f5_local31.material = RegisterMaterial( "h1_deco_indicator_arrow" )
	self:addElement( LUI.UIImage.new( f5_local31 ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 22,
		top = 6,
		right = -8,
		height = CoD.TextSettings.TitleFontTiny.Height,
		font = CoD.TextSettings.TitleFontTiny.Font,
		alignment = LUI.Alignment.Center
	} )
	self.id = "MapLocationSelectorCompassTextStreakName_id"
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:setText( f5_local25 )
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = f5_local5,
		width = f5_local4,
		height = 1,
		alpha = 0.8,
		material = RegisterMaterial( "white" )
	} )
	self.id = "MapLocationSelectorCompassLineTopLeft_id"
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		right = -f5_local5,
		width = f5_local4,
		height = 1,
		alpha = 0.8,
		material = RegisterMaterial( "white" )
	} )
	self.id = "MapLocationSelectorCompassLineTopRight_id"
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "MapLocationSelectorMain", function ()
	local f6_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	local f6_local1 = f6_local0
	f6_local1.alpha = 0
	local f6_local2 = f6_local0
	f6_local2.material = RegisterMaterial( "white" )
	f6_local2.color = Colors.black
	f6_local2.alpha = 0.75
	local self = LUI.UIElement.new( f6_local1 )
	self.id = "MapLocationSelectorMain_id"
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerEventHandler( "init_overlay", initMapLocationSelectorHud )
	local self = LUI.UIImage.new( f6_local2 )
	self.id = "MapLocationSelectorBackground_id"
	local f6_local5 = LUI.MenuBuilder.buildItems( {
		type = "ScorestreakHUDVignette"
	}, {}, self )
	f6_local5.id = "MapLocationSelectorVignette_id"
	local f6_local6 = f0_local1()
	local f6_local7 = f0_local2()
	local f6_local8 = f0_local3()
	self:addElement( self )
	self:addElement( f6_local5 )
	self:addElement( f6_local6 )
	self:addElement( f6_local8 )
	return self
end )
LockTable( _M )
