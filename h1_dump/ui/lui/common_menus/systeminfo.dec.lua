local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.SystemInfo = InheritFrom( LUI.MenuTemplate )
SystemInfoGlobals = {
	DefaultProperties = {}
}
f0_local0 = 10
f0_local1 = 15
local f0_local2, f0_local3 = nil
local f0_local4 = true
LUI.SystemInfo.GetRegionInfo = function ()
	if f0_local4 then
		return Engine.Localize( "@MENU_HIDDEN_INFO" )
	else
		return Lobby.GetGeographicRegion()
	end
end

LUI.SystemInfo.GetIPInfo = function ()
	if f0_local4 then
		return Engine.Localize( "@MENU_HIDDEN_INFO" )
	else
		return Lobby.GetIPAddress()
	end
end

LUI.SystemInfo.UpdateHelperText = function ( f3_arg0 )
	LUI.ButtonHelperText.AddHelperTextObject( f3_arg0.help, {
		name = "show_hide_info",
		button_ref = "button_alt1",
		helper_text = f0_local4 and Engine.Localize( "@MENU_SHOW_HIDDEN_INFO" ) or Engine.Localize( "@MENU_HIDE_HIDDEN_INFO" ),
		side = "right",
		clickable = true,
		priority = -2000
	}, LUI.SystemInfo.ToggleHidePrivateInfo )
end

LUI.SystemInfo.LeaveMenu = function ()
	f0_local2 = nil
	f0_local3 = nil
	f0_local4 = true
end

LUI.SystemInfo.ToggleHidePrivateInfo = function ( f5_arg0 )
	f0_local4 = not f0_local4
	if f0_local2 then
		LUI.SystemInfo.RefreshItem( f0_local2, {} )
	end
	if f0_local3 then
		LUI.SystemInfo.RefreshItem( f0_local3, {} )
	end
	f5_arg0:dispatchEventToRoot( {
		name = "onPrivateInfoChange",
		immediate = true
	} )
end

LUI.SystemInfo.build = function ( f6_arg0, f6_arg1 )
	f0_local4 = true
	local f6_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f6_local1 = nil
	if Engine.IsConsoleGame() then
		f6_local1 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_OPTIONS_UPPER_CASE" ) )
	else
		f6_local1 = "LUA_MENU_SYSTEM_INFO_CAPS"
	end
	local f6_local2 = false
	if Engine.IsConsoleGame() then
		f6_local2 = 0 ~= LUI.ConsoleOptions.FindTypeIndex( LUI.PreviousMenuName )
	end
	local f6_local3 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f6_local3 = -15
	end
	local f6_local4 = LUI.MenuTemplate.new( f6_arg0, {
		menu_title = f6_local1,
		menu_top_indent = f6_local0 + f6_local3,
		showSelectButton = false,
		skipAnim = f6_local2
	} )
	f6_local4:setClass( LUI.SystemInfo )
	f6_local4:PopulateMissingProps( f6_arg1 )
	f6_local4:ValidateProps( f6_arg1 )
	f6_local4.id = "systemInfo_id"
	local f6_local5 = 200
	if Engine.IsConsoleGame() then
		if Engine.IsMultiplayer() then
			f6_local5 = 80
		else
			f6_local5 = 295
		end
	end
	local f6_local6 = LUI.MenuTemplate.ListTop + f6_local0
	local f6_local7 = f6_arg1.menu_height
	if not f6_local7 then
		f6_local7 = f6_local5
	end
	f6_local7 = f6_local7 + f6_local6
	local f6_local8 = 0
	local f6_local9 = GenericMenuDims.OptionMenuWidth + f6_local8
	if Engine.InFrontend() or not Engine.GetSplitScreen() then
		LUI.MenuTemplate.AddListDivider( f6_local4, f6_arg1.menu_list_divider_top_offset, f6_local8, f6_local6, f6_local9, f6_local7 )
	end
	if Engine.IsConsoleGame() then
		f6_local4:addElement( LUI.H1MenuTab.new( {
			title = function ( f7_arg0 )
				return LUI.ConsoleOptions.Categories[f7_arg0].title
			end,
			tabCount = #LUI.ConsoleOptions.Categories,
			underTabTextFunc = function ( f8_arg0 )
				return LUI.ConsoleOptions.Categories[f8_arg0].title
			end,
			top = f6_local0 + LUI.MenuTemplate.ListTop + f6_local3,
			width = GenericMenuDims.OptionMenuWidth,
			clickTabBtnAction = LUI.ConsoleOptions.LoadMenu,
			activeIndex = LUI.ConsoleOptions.FindTypeIndex( "SystemInfo" ),
			isTabLockedfunc = LUI.ConsoleOptions.IsOptionLocked,
			skipChangeTab = true,
			exclusiveController = f6_local4.exclusiveController
		} ) )
	end
	local f6_local10 = f6_local4.properties
	local f6_local11 = nil
	if Engine.IsConsoleGame() then
		f6_local11 = LUI.MenuTemplate.ListTop + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing
	else
		f6_local11 = LUI.MenuTemplate.ListTop + (Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset)
	end
	local f6_local12 = nil
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f6_local12 = LUI.MenuBuilder.BuildRegisteredType( "h1_box_deco", {
			decoTopOffset = f6_local11 - f0_local1,
			decoBottomOffset = -40,
			decoRightOffset = GenericMenuDims.OptionMenuWidth,
			rightAnchor = false
		} )
	else
		f6_local12 = LUI.MenuBuilder.BuildRegisteredType( "h1_box_deco", {
			decoTopOffset = f6_local11 - f0_local1 + 15,
			decoBottomOffset = -f6_local7,
			decoRightOffset = -665
		} )
	end
	f6_local4:addElement( f6_local12 )
	local f6_local13 = CoD.CreateState( 0, 0.5, 8, 0.5, CoD.AnchorTypes.TopLeft )
	f6_local13.color = Colors.h1.light_grey
	f6_local12:addElement( LUI.UILine.new( f6_local13 ) )
	local f6_local14 = CoD.CreateState( 0, 0.5, -8, 0.5, CoD.AnchorTypes.TopRight )
	f6_local14.color = Colors.h1.light_grey
	f6_local12:addElement( LUI.UILine.new( f6_local14 ) )
	local f6_local15 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f6_local15 = -25
	end
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = f0_local0,
		right = 100,
		top = f6_local11 + 15 + f6_local15,
		bottom = 0,
		spacing = f0_local0 * 0.8
	} )
	self.id = "systemInfoList_id"
	f6_local4.vlist = self
	f6_local4:addElement( self )
	if Engine.IsMultiplayer() then
		local f6_local17 = Lobby.GetNATType()
		if f6_local17 ~= nil then
			f6_local4:AddInfo( Engine.Localize( "MENU_SYSINFO_NATTYPE" ), function ()
				return Engine.Localize( f6_local17 )
			end )
		end
	end
	local f6_local17 = f6_local4:AddInfo( Engine.Localize( "MENU_SYSINFO_VERSION" ), function ()
		return Engine.GetBuildNumber()
	end )
	f6_local17:addElement( LUI.UITimer.new( 500, "refresh_buildnumber" ) )
	f6_local17:registerEventHandler( "refresh_buildnumber", function ( element, event )
		LUI.SystemInfo.RefreshItem( f6_local17, {} )
	end )
	if Engine.IsMultiplayer() then
		if Lobby.GetIPAddress() ~= nil then
			f0_local3 = f6_local4:AddInfo( Engine.Localize( "MENU_IP_ADDRESS" ), LUI.SystemInfo.GetIPInfo )
			if not Engine.InFrontend() and Engine.GetSplitScreen() then
				f6_local4:AddInfo( "", function ()
					return ""
				end )
			end
		end
		f0_local2 = f6_local4:AddInfo( Engine.Localize( "MENU_SYSINFO_REGION" ), LUI.SystemInfo.GetRegionInfo )
		f6_local4:AddInfo( Engine.Localize( "MENU_SYSINFO_BANDWIDTH" ), function ()
			return Lobby.GetBandwidth()
		end )
		f6_local4:AddInfo( Engine.Localize( "MENU_SYSINFO_CONNECTIONTYPE" ), function ()
			return Lobby.IsOnWifi() and Engine.Localize( "MENU_SYSINFO_WIRELESS" ) or Engine.Localize( "MENU_SYSINFO_WIRED" )
		end )
	end
	f6_local4:AddInfo( Engine.Localize( "MENU_SYSINFO_CUSTOMER_SUPPORT_LINK" ), function ()
		return Engine.Localize( "MENU_SYSINFO_CUSTOMER_SUPPORT_URL" )
	end )
	if Engine.IsConsoleGame() then
		f6_local4:AddBackButton( function ( f16_arg0, f16_arg1 )
			Engine.ExecNow( "profile_menuDvarsFinish", f16_arg1.controller )
			Engine.Exec( "updategamerprofile" )
			LUI.FlowManager.RequestLeaveMenu( f16_arg0 )
			if GameX.IsSplitscreen() then
				GameX.SetOptionState( false )
			end
		end )
	else
		f6_local4:AddBackButton()
	end
	if Engine.IsMultiplayer() then
		f6_local4:registerEventHandler( "onPrivateInfoChange", LUI.SystemInfo.UpdateHelperText )
		LUI.ButtonHelperText.AddHelperTextObject( f6_local4.help, {
			name = "show_hide_info",
			button_ref = "button_alt1",
			helper_text = Engine.Localize( "@MENU_SHOW_HIDDEN_INFO" ),
			side = "right",
			clickable = true,
			priority = -2000
		}, LUI.SystemInfo.ToggleHidePrivateInfo )
	end
	f6_local4:registerEventHandler( "menu_close", LUI.SystemInfo.LeaveMenu )
	if Engine.IsMultiplayer() and Engine.InFrontend() then
		local f6_local18 = LUI.MenuBuilder.BuildRegisteredType( "h1_box_deco", {
			decoTopOffset = f6_local11,
			decoBottomOffset = -f6_local7,
			decoLeftOffset = f6_local9 + 20,
			decoRightOffset = -150
		} )
		f6_local18:animateToState( "default" )
		f6_local18:registerAnimationState( "hidden", {
			alpha = 0
		} )
		local f6_local19 = CoD.CreateState( 10, 10, -10, nil, CoD.AnchorTypes.TopLeftRight )
		f6_local19.height = 18
		f6_local19.font = CoD.TextSettings.TitleFontSmall.Font
		f6_local19.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
		local self = LUI.UIText.new( f6_local19 )
		self:setText( Engine.Localize( "@PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_TITLE" ) )
		f6_local18:addElement( self )
		local f6_local21 = CoD.CreateState( 10, 35, -10, nil, CoD.AnchorTypes.TopLeftRight )
		f6_local21.height = 14
		f6_local21.font = CoD.TextSettings.TitleFontSmall.Font
		f6_local21.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
		local self = LUI.UIText.new( f6_local21 )
		local f6_local23 = Matchmaking.GetNatType()
		local f6_local24 = nil
		local f6_local25 = {
			UNKNOWN = 0,
			OPEN = 1,
			MODERATE = 2,
			STRICT = 3
		}
		if f6_local23 == f6_local25.STRICT then
			f6_local24 = "@PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_STRICT" .. (Engine.IsPCApp() and "_UWP" or "")
		elseif f6_local23 == f6_local25.OPEN then
			f6_local24 = "@PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_OPEN"
		elseif f6_local23 == f6_local25.MODERATE then
			f6_local24 = "@PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_MODERATE" .. (Engine.IsPCApp() and "_UWP" or "")
		else
			f6_local18:animateToState( "hidden", 0 )
		end
		if f6_local24 then
			self:setText( Engine.LocalizeLong( f6_local24 ) )
		end
		f6_local18:addElement( self )
		f6_local4:addElement( f6_local18 )
	end
	return f6_local4
end

LUI.SystemInfo.PopulateMissingProps = function ( f17_arg0, f17_arg1 )
	if not f17_arg1 then
		f17_arg1 = {}
	end
	if not f17_arg0.properties then
		f17_arg0.properties = f17_arg1
	end
	for f17_local3, f17_local4 in pairs( SystemInfoGlobals.DefaultProperties ) do
		if f17_arg1[f17_local3] == nil then
			f17_arg1[f17_local3] = f17_local4
		end
	end
	if not f17_arg1.exclusiveController then
		f17_arg1.exclusiveController = Engine.GetFirstActiveController()
	end
end

LUI.SystemInfo.ValidateProps = function ( f18_arg0, f18_arg1 )
	
end

LUI.SystemInfo.AddInfo = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = GenericMenuDims.OptionMenuWidth - 20
	local f19_local1 = 0
	if not Engine.InFrontend() and Engine.GetSplitScreen() then
		f19_local1 = -22
		if f19_arg1 == "" then
			f19_local1 = f19_local1 - 10
		end
	end
	local f19_local2 = f19_arg0.vlist
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		left = 0,
		top = 0,
		width = f19_local0,
		height = LUI.MenuGenericButtons.ButtonLabelFont.Height * 2 + f19_local1
	} )
	self.labelValue = f19_arg1
	self.dataFunc = f19_arg2
	self.id = f19_arg1 .. "_id"
	local self = LUI.UIText.new()
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		left = f0_local0,
		top = f0_local0,
		width = f19_local0 / 2,
		height = LUI.MenuGenericButtons.ButtonLabelFont.Height * 0.8,
		font = LUI.MenuGenericButtons.ButtonLabelFont.Font,
		color = Colors.h1.medium_grey,
		alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	} )
	self:animateToState( "default" )
	local self = LUI.UIText.new()
	self:registerAnimationState( "default", {
		rightAnchor = true,
		topAnchor = true,
		right = -f0_local0,
		top = f0_local0,
		width = f19_local0 / 2,
		height = LUI.MenuGenericButtons.ButtonLabelFont.Height * 0.8,
		font = LUI.MenuGenericButtons.ButtonLabelFont.Font,
		color = Colors.h1.light_grey,
		alignment = Engine.IsRightToLeftLanguage() and LUI.Alignment.None or LUI.Alignment.Right
	} )
	self:animateToState( "default" )
	self.labelText = self
	self.valueText = self
	if Engine.IsRightToLeftLanguage() then
		self:addElement( self )
		self:addElement( self )
	else
		self:addElement( self )
		self:addElement( self )
	end
	LUI.SystemInfo.RefreshItem( self, {} )
	f19_local2:addElement( self )
	return self
end

LUI.SystemInfo.RefreshItem = function ( f20_arg0, f20_arg1 )
	local f20_local0 = f20_arg1.labelValue or f20_arg0.labelValue
	local f20_local1 = f20_arg1.dataFunc or f20_arg0.dataFunc
	local f20_local2 = f20_arg0.labelText
	local f20_local3 = f20_local2
	f20_local2 = f20_local2.setText
	local f20_local4
	if f20_local0 then
		f20_local4 = Engine.Localize( f20_local0 )
		if not f20_local4 then
		
		else
			f20_local2( f20_local3, f20_local4 )
			if f20_local1 then
				f20_arg0.valueText:setText( f20_local1() or "" )
			else
				f20_arg0.valueText:setText( "" )
			end
		end
	end
	f20_local4 = ""
end

LUI.MenuBuilder.registerType( "SystemInfo", LUI.SystemInfo.build )
if Engine.InFrontend() and Engine.IsMultiplayer() then
	VLobby.InitMenuMode( "SystemInfo", VirtualLobbyModes.LUI_MODE_OBSCURED, CoD.GameDVRDisable, CoD.GameDVREnable )
else
	LUI.FlowManager.RegisterStackPushBehaviour( "SystemInfo", CoD.GameDVRDisable )
	LUI.FlowManager.RegisterStackPopBehaviour( "SystemInfo", CoD.GameDVREnable )
end
LockTable( _M )
