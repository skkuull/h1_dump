local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
FilterMenuDimensions = {
	Padding = 0,
	Spacing = 0,
	Panel = {
		Rect = {
			Top = 180,
			Left = 460,
			Width = 380,
			Height = GenericTitleBarDims.TitleBarHeight + 104
		}
	},
	VerticalList = {
		Bottom = 600
	},
	HelperBarSpacer = {
		Margin = 1
	}
}
function AddOption( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = 1
	local f1_local1 = 0
	if f1_arg2 == "int" then
		f1_local1 = Engine.GetDvarInt( f1_arg1 )
	elseif f1_arg2 == "bool" then
		f1_local1 = Engine.GetDvarBool( f1_arg1 )
	elseif f1_arg2 == "string" then
		f1_local1 = Engine.GetDvarString( f1_arg1 )
	end
	for self, f1_local6 in pairs( f1_arg4 ) do
		if f1_local6.value == f1_local1 then
			f1_local0 = self
			break
		end
	end
	f1_local2 = function ( f2_arg0, f2_arg1 )
		if f1_arg2 == "int" then
			Engine.SetDvarInt( f1_arg1, f1_arg4[f1_local0].value )
		elseif f1_arg2 == "bool" then
			Engine.SetDvarBool( f1_arg1, f1_arg4[f1_local0].value )
		elseif f1_arg2 == "string" then
			Engine.SetDvarString( f1_arg1, f1_arg4[f1_local0].value )
		end
	end
	
	self = LUI.UIGenericButton.new( {}, {
		style = GenericButtonSettings.Styles.GlassButton,
		substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu,
		variant = GenericButtonSettings.Variants.Select,
		button_text = Engine.Localize( f1_arg3 ),
		text_align_with_content = LUI.Alignment.Left,
		button_display_func = function ( f3_arg0, f3_arg1 )
			return Engine.Localize( f1_arg4[f1_local0].text )
		end,
		button_left_func = function ( f4_arg0, f4_arg1 )
			f1_local0 = 1 + (#f1_arg4 + f1_local0 - 1 - 1) % #f1_arg4
			f1_local2( f4_arg0, f4_arg1 )
		end,
		button_right_func = function ( f5_arg0, f5_arg1 )
			f1_local0 = 1 + (f1_local0 - 1 + 1) % #f1_arg4
			f1_local2( f5_arg0, f5_arg1 )
		end
	} )
	self.id = "lbfilteroption_" .. tostring( f1_arg1 )
	self:registerEventHandler( "element_refresh", function ( element, event )
		element:processEvent( {
			name = "content_refresh"
		} )
	end )
	self:animateToState( "default" )
	self:makeFocusable()
	f1_arg0:addElement( self )
	return self
end

f0_local0 = function ( f7_arg0, f7_arg1 )
	OpLeaderboardDataController.ChangeFilterAndDuration( Engine.GetDvarString( FilterDvarName ), Engine.GetDvarString( DurationDvarName ), Engine.GetDvarInt( HardcoreDvarName ) )
	LUI.FlowManager.RequestLeaveMenu( f7_arg0 )
end

function opLeaderboardFilter( f8_arg0, f8_arg1 )
	local f8_local0 = OpLeaderboardDataController.GetScoped()
	local f8_local1 = {
		{
			text = OpLeaderboard.Filters.None.OptionText,
			value = OpLeaderboard.Filters.None.Key
		},
		{
			text = OpLeaderboard.Filters.Friends.OptionText,
			value = OpLeaderboard.Filters.Friends.Key
		}
	}
	if Clan.IsEnabled() and Clan.AlreadyMember( f8_arg1.exclusiveController ) then
		table.insert( f8_local1, {
			text = OpLeaderboard.Filters.Clan.OptionText,
			value = OpLeaderboard.Filters.Clan.Key
		} )
	end
	local f8_local2 = {
		{
			text = OpLeaderboard.DurationDefs.Alltime.OptionText,
			value = OpLeaderboard.DurationDefs.Alltime.Key
		},
		{
			text = OpLeaderboard.DurationDefs.Weekly.OptionText,
			value = OpLeaderboard.DurationDefs.Weekly.Key
		},
		{
			text = OpLeaderboard.DurationDefs.Monthly.OptionText,
			value = OpLeaderboard.DurationDefs.Monthly.Key
		}
	}
	local f8_local3 = {
		{
			text = OpLeaderboard.CoreModeDefs.Standard.OptionText,
			value = OpLeaderboard.CoreModeDefs.Standard.Key
		},
		{
			text = OpLeaderboard.CoreModeDefs.Hardcore.OptionText,
			value = OpLeaderboard.CoreModeDefs.Hardcore.Key
		},
		{
			text = OpLeaderboard.CoreModeDefs.OldSchool.OptionText,
			value = OpLeaderboard.CoreModeDefs.OldSchool.Key
		}
	}
	Engine.Exec( "set " .. tostring( FilterDvarName ) .. " " .. tostring( f8_local0.filterType ) )
	Engine.Exec( "set " .. tostring( DurationDvarName ) .. " " .. tostring( f8_local0.durationKey ) )
	Engine.Exec( "set " .. tostring( HardcoreDvarName ) .. " " .. tostring( f8_local0.coreMode ) )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self.id = "opLeaderboardFilterBackground_id"
	self:animateToState( "default", 0 )
	local self = LUI.UIBindButton.new()
	self.id = "opLeaderboardFilterBindButton_id"
	self:registerEventHandler( "button_secondary", f0_local0 )
	self:addElement( self )
	local f8_local6 = LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay", {} )
	f8_local6.id = "opLeaderboardFilterBackground_id"
	self:addElement( f8_local6 )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = FilterMenuDimensions.Panel.Rect.Top,
		left = FilterMenuDimensions.Panel.Rect.Left,
		width = FilterMenuDimensions.Panel.Rect.Width,
		height = GenericTitleBarDims.TitleBarHeight + FilterMenuDimensions.Padding + GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu.height * 3,
		alpha = 1
	} )
	self.id = "opLeaderboardFilterPanel_id"
	self:addElement( self )
	local self = LUI.UIImage.new()
	self.id = "opLeaderboardFilterBackgroundColor_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.85
	} )
	self:animateToState( "default" )
	self:addElement( self )
	local f8_local9 = LUI.MenuBuilder.BuildRegisteredType( "generic_border", {
		border_alpha = 0.35
	} )
	f8_local9.id = "opLeaderboardFilterBorder_id"
	self:addElement( f8_local9 )
	local f8_local10 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_titlebar", {
		title_bar_text = Engine.Localize( "@LUA_MENU_CHANGE_FILTER" ),
		font = CoD.TextSettings.TitleFontMediumLarge,
		fill_alpha = 1,
		border_alpha = 1,
		use_background_tint = true
	} )
	f8_local10.id = "opLeaderboardFilterTitle_id"
	self:addElement( f8_local10 )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = GenericTitleBarDims.TitleBarHeight + FilterMenuDimensions.Padding,
		bottom = FilterMenuDimensions.VerticalList.Bottom,
		left = FilterMenuDimensions.Padding,
		right = -FilterMenuDimensions.Padding,
		spacing = FilterMenuDimensions.Spacing
	} )
	self.id = "opLeaderboardFilterOptionList"
	self:addElement( self )
	AddOption( self, FilterDvarName, "string", "@MENU_PLAYERS", f8_local1 )
	AddOption( self, DurationDvarName, "string", "@LUA_MENU_DURATION", f8_local2 )
	if OpLeaderboard.IsCoreModeFilterEnabled( f8_local0.categoryId ) then
		AddOption( self, HardcoreDvarName, "int", "@LUA_MENU_COREMODE", f8_local3 )
	else
		self:setTopBottom( true, false, FilterMenuDimensions.Panel.Rect.Top, FilterMenuDimensions.Panel.Rect.Top + GenericTitleBarDims.TitleBarHeight + FilterMenuDimensions.Padding + GenericButtonSettings.Styles.GlassButton.SubStyles.SubMenu.height * 2 )
	end
	return self
end

LUI.MenuBuilder.registerPopupType( "opLeaderboardFilter", opLeaderboardFilter )
LockTable( _M )
