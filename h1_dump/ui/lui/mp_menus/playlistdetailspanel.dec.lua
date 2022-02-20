local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.PlaylistDetailsPanel = InheritFrom( LUI.UIBackgroundPanel )
LUI.PlaylistDetailsPanel.DescriptionText = {}
LUI.PlaylistDetailsPanel.DescriptionText.left = 27
LUI.PlaylistDetailsPanel.DescriptionText.top = 362
LUI.PlaylistDetailsPanel.DescriptionText.height = CoD.TextSettings.BodyFontTiny.Height
LUI.PlaylistDetailsPanel.DescriptionText.width = CoD.DesignGridHelper( 11.8 )
LUI.PlaylistDetailsPanel.DescriptionText.font = CoD.TextSettings.BodyFontTiny.Font
LUI.PlaylistDetailsPanel.DescriptionText.lineSpacingRatio = 0.2
LUI.PlaylistDetailsPanel.DescriptionText.textboxHeight = LUI.PlaylistDetailsPanel.DescriptionText.height * 3
function GetPlaylistData( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	f1_local0.isMissingPack, f1_local0.missingPackName, f1_local0.playerNameWithoutPack = Playlist.GetPartyMissingMapPacks( f1_arg0, f1_arg1 )
	f1_local0.image = Playlist.GetItemImage( f1_arg0, f1_arg1 )
	f1_local0.desc = Playlist.GetItemDesc( f1_arg0, f1_arg1 )
	f1_local0.nameStr = Playlist.GetItemName( f1_arg0, f1_arg1 )
	if f1_arg0 == 0 then
		f1_local0.playersCount = Playlist.GetActivePlayersCountForCategory( f1_arg1 + 1 )
	else
		f1_local0.playersCount = Playlist.GetActivePlayersCount( f1_arg0, f1_arg1 )
	end
	f1_local0.minPlayers, f1_local0.maxPlayers = Playlist.GetPlayerLimits( f1_arg0, f1_arg1 )
	f1_local0.minPartySize, f1_local0.maxPartySize = Playlist.GetPartyLimits( f1_arg0, f1_arg1 )
	f1_local0.xpScalarObj = LUI.MenuTemplate.GetXpScalarObj( f1_arg0, f1_arg1 )
	return f1_local0
end

LUI.PlaylistDetailsPanel.new = function ( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.DesignGridHelper( 7.2, 1 )
	local f2_local1 = LUI.MenuTemplate.ListTop - 2
	local self = LUI.UIElement.new( CoD.CreateState( f2_local0, f2_local1, f2_local0 + CoD.DesignGridHelper( 13 ), f2_local1 + 432, CoD.AnchorTypes.TopLeft ) )
	self:setClass( LUI.PlaylistDetailsPanel )
	self:registerEventHandler( "update_playlist_panel", function ( element, event )
		if event.category and event.index then
			LUI.PlaylistDetailsPanel.Update( element, GetPlaylistData( event.category, event.index ), event.category == 0 )
		elseif event.panelData then
			LUI.PlaylistDetailsPanel.Update( element, event.panelData, event.category == 0, event.isGamemodes )
		end
	end )
	local f2_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f2_local3.color = {
		r = 0.08,
		g = 0.08,
		b = 0.08
	}
	f2_local3.material = RegisterMaterial( "white" )
	f2_local3.alpha = 0.8
	self:addElement( LUI.UIImage.new( f2_local3 ) )
	self:addElement( LUI.DecoFrame.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ), LUI.DecoFrame.Grey ) )
	local f2_local4 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local4.height = 11
	f2_local4.width = 11
	f2_local4.left = -33
	f2_local4.top = 12
	f2_local4.material = RegisterMaterial( "h1_ui_deco_green_triangle" )
	self:addElement( LUI.UIImage.new( f2_local4 ) )
	local f2_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f2_local5.left = 4
	f2_local5.right = -3
	f2_local5.bottom = -4
	f2_local5.top = 4
	local self = LUI.UIElement.new( f2_local5 )
	self:setUseStencil( true )
	self:addElement( self )
	local f2_local7 = {
		r = 0.07,
		g = 0.07,
		b = 0.07
	}
	local f2_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeftRight )
	f2_local8.alpha = 0.8
	f2_local8.height = CoD.DesignGridHelper( 2.1 )
	f2_local8.color = f2_local7
	self:addElement( LUI.UIImage.new( f2_local8 ) )
	f2_local4 = CoD.CreateState( -455, 30, 145, 270, CoD.AnchorTypes.TopRight )
	f2_local4.material = RegisterMaterial( "h1_deco_scanlines_overlay" )
	f2_local4.alpha = 0.3
	
	local scanLines1 = LUI.UIImage.new( f2_local4 )
	self:addElement( scanLines1 )
	self.scanLines1 = scanLines1
	
	scanLines1:hide()
	f2_local4 = CoD.CreateState( -511, -175, nil, nil, CoD.AnchorTypes.TopRight )
	f2_local4.width = 682
	f2_local4.height = 682
	
	local image = LUI.UIImage.new( f2_local4 )
	self:addElement( image )
	self.image = image
	
	image:hide()
	local f2_local11 = CoD.CreateState( 27, 75, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f2_local11.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local11.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local11.alignment = LUI.Alignment.Left
	f2_local11.alpha = 0.6
	
	local field1TitleText = LUI.UIText.new( f2_local11 )
	self:addElement( field1TitleText )
	self.field1TitleText = field1TitleText
	
	local f2_local13 = CoD.CreateState( 27, 45, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f2_local13.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local13.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local13.alignment = LUI.Alignment.Left
	f2_local13.alpha = 0.6
	field1TitleText:registerAnimationState( "gameMode", f2_local13 )
	f2_local11.font = CoD.TextSettings.TitleFontMedium.Font
	f2_local11.height = CoD.TextSettings.TitleFontMedium.Height
	f2_local11.top = 96
	
	local field1ValueText = LUI.UIText.new( f2_local11 )
	self:addElement( field1ValueText )
	self.field1ValueText = field1ValueText
	
	f2_local13.font = CoD.TextSettings.TitleFontMedium.Font
	f2_local13.height = CoD.TextSettings.TitleFontMedium.Height
	f2_local13.top = 66
	field1ValueText:registerAnimationState( "gameMode", f2_local13 )
	f2_local11.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local11.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local11.top = 136
	
	local field2TitleText = LUI.UIText.new( f2_local11 )
	self:addElement( field2TitleText )
	self.field2TitleText = field2TitleText
	
	f2_local13.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local13.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local13.top = 106
	field2TitleText:registerAnimationState( "gameMode", f2_local13 )
	f2_local11.font = CoD.TextSettings.TitleFontMedium.Font
	f2_local11.height = CoD.TextSettings.TitleFontMedium.Height
	f2_local11.top = 157
	
	local field2ValueText = LUI.UIText.new( f2_local11 )
	self:addElement( field2ValueText )
	self.field2ValueText = field2ValueText
	
	f2_local13.font = CoD.TextSettings.TitleFontMedium.Font
	f2_local13.height = CoD.TextSettings.TitleFontMedium.Height
	f2_local13.top = 127
	field2ValueText:registerAnimationState( "gameMode", f2_local13 )
	f2_local11.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local11.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local11.alpha = 0
	
	local field3TitleText = LUI.UIText.new( f2_local11 )
	self:addElement( field3TitleText )
	self.field3TitleText = field3TitleText
	
	f2_local13.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local13.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local13.top = 167
	f2_local13.alpha = 0.6
	field3TitleText:registerAnimationState( "gameMode", f2_local13 )
	f2_local11.font = CoD.TextSettings.TitleFontMedium.Font
	f2_local11.height = CoD.TextSettings.TitleFontMedium.Height
	
	local field3ValueText = LUI.UIText.new( f2_local11 )
	self:addElement( field3ValueText )
	self.field3ValueText = field3ValueText
	
	f2_local13.font = CoD.TextSettings.TitleFontMedium.Font
	f2_local13.height = CoD.TextSettings.TitleFontMedium.Height
	f2_local13.top = 188
	field3ValueText:registerAnimationState( "gameMode", f2_local13 )
	f2_local3 = CoD.CreateState( 27, 252, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local3.height = CoD.TextSettings.BodyFontTiny.Height * 2
	f2_local3.material = RegisterMaterial( "white" )
	f2_local3.color = f2_local7
	f2_local3.alpha = 0.8
	
	local categoryBackground = LUI.UIImage.new( f2_local3 )
	self:addElement( categoryBackground )
	self.categoryBackground = categoryBackground
	
	f2_local11.font = CoD.TextSettings.BodyFontTiny.Font
	f2_local11.height = CoD.TextSettings.BodyFontTiny.Height
	f2_local11.top = 260.5
	f2_local11.left = 42
	f2_local11.alpha = 1
	
	local categoryText = LUI.UIText.new( f2_local11 )
	self:addElement( categoryText )
	self.categoryText = categoryText
	
	f2_local11.font = CoD.TextSettings.Font46.Font
	f2_local11.height = CoD.TextSettings.Font46.Height
	f2_local11.top = 295
	f2_local11.left = 27
	f2_local11.alpha = 1
	
	local modeListTitleText = LUI.UIText.new( f2_local11 )
	self:addElement( modeListTitleText )
	self.modeListTitleText = modeListTitleText
	
	f2_local11 = CoD.CreateState( LUI.PlaylistDetailsPanel.DescriptionText.left, LUI.PlaylistDetailsPanel.DescriptionText.top, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local11.font = LUI.PlaylistDetailsPanel.DescriptionText.font
	f2_local11.height = LUI.PlaylistDetailsPanel.DescriptionText.height
	f2_local11.width = LUI.PlaylistDetailsPanel.DescriptionText.width
	f2_local11.lineSpacingRatio = LUI.PlaylistDetailsPanel.DescriptionText.lineSpacingRatio
	f2_local11.alpha = 1
	f2_local11.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	
	local descriptionText = LUI.UIText.new( f2_local11 )
	self:addElement( descriptionText )
	self.descriptionText = descriptionText
	
	local f2_local23 = CoD.CreateState( 265, -10, 355, 80, CoD.AnchorTypes.Top )
	f2_local23.material = RegisterMaterial( "ui_reward_double_xp" )
	
	local scalarXpElement = LUI.UIImage.new( f2_local23 )
	scalarXpElement:hide()
	self:addElement( scalarXpElement )
	self.scalarXpElement = scalarXpElement
	
	local f2_local25 = CoD.CreateState( 5, 70, 95, 160, CoD.AnchorTypes.TopRight )
	f2_local25.material = RegisterMaterial( "depot_currency_credit_2x" )
	
	local scalarXpElement2 = LUI.UIImage.new( f2_local25 )
	scalarXpElement2:hide()
	self:addElement( scalarXpElement2 )
	self.scalarXpElement2 = scalarXpElement2
	
	return self
end

LUI.PlaylistDetailsPanel.Update = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	f4_arg0.scalarXpElement:hide()
	if f4_arg1.hideAllStats ~= true then
		if f4_arg1.xpScalarObj and f4_arg1.xpScalarObj.xpScale and f4_arg1.xpScalarObj.xpScaleWithParty and f4_arg1.xpScalarObj.depotScale then
			if f4_arg1.xpScalarObj.xpScale == 4 then
				f4_arg0.scalarXpElement:registerAnimationState( "miscXp", {
					material = RegisterMaterial( "ui_reward_quad_xp" ),
					width = 90,
					left = 265,
					top = -10,
					height = 90,
					topAnchor = true
				} )
				f4_arg0.scalarXpElement:animateToState( "miscXp" )
				f4_arg0.scalarXpElement:show()
			elseif f4_arg1.xpScalarObj.xpScale == 2 then
				f4_arg0.scalarXpElement:animateToState( "default" )
				f4_arg0.scalarXpElement:show()
			elseif f4_arg1.xpScalarObj.xpScaleWithParty == 2 then
				f4_arg0.scalarXpElement:registerAnimationState( "partyXp", {
					material = RegisterMaterial( "ui_reward_double_party_xp" ),
					width = 90,
					left = 265,
					top = -10,
					height = 90,
					topAnchor = true
				} )
				f4_arg0.scalarXpElement:animateToState( "partyXp" )
				f4_arg0.scalarXpElement:show()
			elseif f4_arg1.xpScalarObj.depotScale == 2 then
				f4_arg0.scalarXpElement:registerAnimationState( "depotScale", {
					material = RegisterMaterial( "depot_currency_credit_2x" ),
					width = 90,
					left = 265,
					top = -10,
					height = 90,
					topAnchor = true
				} )
				f4_arg0.scalarXpElement:animateToState( "depotScale" )
				f4_arg0.scalarXpElement:show()
			else
				f4_arg0.scalarXpElement:hide()
			end
			if (f4_arg1.xpScalarObj.xpScale > 1 or f4_arg1.xpScalarObj.xpScaleWithParty > 1) and f4_arg1.xpScalarObj.depotScale > 1 then
				f4_arg0.scalarXpElement2:show()
			else
				f4_arg0.scalarXpElement2:hide()
			end
		end
		local f4_local0 = ""
		local f4_local1 = ""
		if Engine.GetDvarInt( "showPlaylistTotalPlayers" ) > 0 and f4_arg1.playersCount then
			local f4_local2 = Playlist.GetTotalActivePlayersCount()
			if f4_local2 > 0 then
				if f4_local2 < f4_arg1.playersCount then
					f4_arg1.playersCount = f4_local2
				end
				local f4_local3 = math.floor( f4_arg1.playersCount / f4_local2 * 100 )
				if f4_local3 < 5 then
					f4_local3 = "<5"
				end
				f4_local1 = f4_local3 .. "%"
				f4_local0 = Engine.Localize( "@LUA_MENU_PLAYERS_IN_PLAYLIST_TITLE" )
			end
		end
		if f4_arg2 then
			f4_arg0.field1TitleText:animateToState( "default" )
			f4_arg0.field1ValueText:animateToState( "default" )
			f4_arg0.field2TitleText:animateToState( "default" )
			f4_arg0.field2ValueText:animateToState( "default" )
			f4_arg0.field3TitleText:animateToState( "default" )
			f4_arg0.field3ValueText:animateToState( "default" )
			f4_arg0.field1TitleText:setText( f4_local0 )
			f4_arg0.field1ValueText:setText( f4_local1 )
		else
			f4_arg0.field1TitleText:animateToState( "gameMode" )
			f4_arg0.field1ValueText:animateToState( "gameMode" )
			f4_arg0.field2TitleText:animateToState( "gameMode" )
			f4_arg0.field2ValueText:animateToState( "gameMode" )
			f4_arg0.field3TitleText:animateToState( "gameMode" )
			f4_arg0.field3ValueText:animateToState( "gameMode" )
			local f4_local2, f4_local3 = nil
			if f4_arg1.minPlayers and f4_arg1.minPlayers > 0 and f4_arg1.maxPlayers and f4_arg1.maxPlayers > 0 then
				f4_local2 = Engine.Localize( "@LUA_MENU_PLAYERS" )
				f4_local3 = Engine.Localize( "@LUA_MENU_SIMPLE_RANGE", f4_arg1.minPlayers, f4_arg1.maxPlayers )
			else
				f4_local2 = ""
				f4_local3 = ""
			end
			f4_arg0.field1TitleText:setText( f4_local2 )
			f4_arg0.field1ValueText:setText( f4_local3 )
			if f4_arg1.minPartySize and f4_arg1.minPartySize > 0 and f4_arg1.maxPartySize and f4_arg1.maxPartySize > 0 then
				f4_local2 = Engine.Localize( "@LUA_MENU_PARTY_SIZE" )
				f4_local3 = Engine.Localize( "@LUA_MENU_SIMPLE_RANGE", f4_arg1.minPartySize, f4_arg1.maxPartySize )
			else
				f4_local2 = ""
				f4_local3 = ""
			end
			f4_arg0.field2TitleText:setText( f4_local2 )
			f4_arg0.field2ValueText:setText( f4_local3 )
			f4_arg0.field3TitleText:setText( f4_local0 )
			f4_arg0.field3ValueText:setText( f4_local1 )
		end
	end
	if f4_arg1.image then
		f4_arg0.image:setImage( RegisterMaterial( f4_arg1.image ) )
		f4_arg0.image:show()
		f4_arg0.scanLines1:animateToState( "default" )
	else
		f4_arg0.image:hide()
		f4_arg0.scanLines1:animateToState( "hidden" )
	end
	local f4_local0 = nil
	if f4_arg2 then
		f4_local0 = Engine.Localize( "@LUA_MENU_PLAYLIST_CAPS" )
	elseif f4_arg3 == true then
		f4_local0 = Engine.ToUpperCase( Engine.Localize( "@MPUI_COMBATRECORD_GAMEMODES_CAPS" ) )
	else
		f4_local0 = Engine.ToUpperCase( Engine.Localize( "@MENU_GAME_TYPE1" ) )
	end
	f4_arg0.categoryText:setText( f4_local0 )
	local f4_local1 = CoD.CreateState( 27, 252, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local1.height = CoD.TextSettings.BodyFontTiny.Height * 2
	f4_local1.material = RegisterMaterial( "white" )
	f4_local1.color = darkGrey
	f4_local1.alpha = 0.8
	local f4_local2, f4_local3, f4_local4, f4_local5 = GetTextDimensions( f4_local0, CoD.TextSettings.BodyFontTiny.Font, CoD.TextSettings.BodyFontTiny.Height )
	f4_local1.width = f4_local4 + 30
	f4_arg0.categoryBackground:registerAnimationState( "default", f4_local1 )
	f4_arg0.categoryBackground:animateToState( "default" )
	f4_arg0.modeListTitleText:setText( Engine.ToUpperCase( f4_arg1.nameStr ) )
	if f4_arg1.desc then
		local f4_local6, f4_local7 = GetTextDimensions( f4_arg1.desc, LUI.PlaylistDetailsPanel.DescriptionText.font, LUI.PlaylistDetailsPanel.DescriptionText.height, LUI.PlaylistDetailsPanel.DescriptionText.width )
		local f4_local8 = CoD.CreateState( LUI.PlaylistDetailsPanel.DescriptionText.left, nil, nil, nil, CoD.AnchorTypes.TopLeft )
		f4_local8.font = LUI.PlaylistDetailsPanel.DescriptionText.font
		f4_local8.height = LUI.PlaylistDetailsPanel.DescriptionText.height
		f4_local8.width = LUI.PlaylistDetailsPanel.DescriptionText.width
		f4_local8.lineSpacingRatio = LUI.PlaylistDetailsPanel.DescriptionText.lineSpacingRatio
		f4_local8.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
		f4_local8.top = LUI.PlaylistDetailsPanel.DescriptionText.top + (LUI.PlaylistDetailsPanel.DescriptionText.textboxHeight - f4_local7) / 2
		f4_arg0.descriptionText:registerAnimationState( "default", f4_local8 )
		f4_arg0.descriptionText:animateToState( "default" )
		f4_arg0.descriptionText:setText( f4_arg1.desc )
	else
		f4_arg0.descriptionText:setText( "" )
	end
	local f4_local6 = f4_arg0:getChildById( "chosenIcon" )
	if f4_arg1.isChosen == true and f4_local6 == nil then
		local f4_local7 = RegisterMaterial( "h1_ui_menu_icon_equipped" )
		local f4_local8 = 7
		local f4_local9 = 16
		local self = LUI.UIImage.new( {
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			width = f4_local9,
			height = f4_local9,
			top = f4_local8,
			right = -(f4_local8 - 1),
			material = f4_local7
		} )
		self.id = "chosenIcon"
		f4_arg0:addElement( self )
	elseif f4_arg1.isChosen == false and f4_local6 ~= nil then
		f4_arg0:removeElement( f4_local6 )
		f4_local6 = nil
	end
end

LUI.MenuBuilder.registerType( "PlaylistDetailsPanel", LUI.PlaylistDetailsPanel.new )
LockTable( _M )
