local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
GameDataColumn = {
	Host = 0,
	Map = 1,
	Clients = 2,
	Game = 3
}
serverBrowserOffsets = {
	10,
	240,
	360,
	450
}
function OnJoinGame( f1_arg0, f1_arg1 )
	local f1_local0 = Lobby.JoinServer
	local f1_local1 = f1_arg1.controller
	if not f1_local1 then
		f1_local1 = Engine.GetFirstActiveController()
	end
	f1_local0( f1_local1, f1_arg0.index )
end

function UpdateCounterText( f2_arg0, f2_arg1 )
	if not f2_arg1 then
		f2_arg1 = {}
	end
	local f2_local0 = ""
	f2_arg0.textCounter:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f2_arg1.currentFocusIndex or 0, f2_arg1.totalItemCount or 0 ) )
end

function UpdateGameList( f3_arg0, f3_arg1 )
	local f3_local0
	if f3_arg1 ~= nil then
		f3_local0 = f3_arg1.controller
		if not f3_local0 then
		
		else
			Lobby.UpdateServerDisplayList( f3_local0 )
			local f3_local1 = Lobby.GetServerCount( f3_local0 )
			if f3_local1 ~= f3_arg0.serverCount then
				f3_arg0.serverCount = f3_local1
				BuildList( f3_arg0, f3_local0 )
				f3_arg0.list:processEvent( {
					name = "gain_focus",
					immediate = true
				} )
			end
		end
	end
	f3_local0 = Engine.GetFirstActiveController()
end

function RefreshServers( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0
	if f4_arg1 ~= nil then
		f4_local0 = f4_arg1.controller
		if not f4_local0 then
		
		else
			f4_arg2.serverCount = 0
			if f4_arg2.list then
				Lobby.RefreshServerList( f4_local0 )
				f4_arg2.list:processEvent( {
					name = "lose_focus",
					immediate = true
				} )
				f4_arg2.list:clearSavedState()
				BuildList( f4_arg2, f4_local0 )
			end
		end
	end
	f4_local0 = Engine.GetFirstActiveController()
end

function MakeText( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = CoD.TextSettings.TitleFontSmall
	local f5_local1 = 6
	local f5_local2 = CoD.CreateState( f5_arg1, nil, f5_arg1 + 200, nil, CoD.AnchorTypes.Left )
	f5_local2.font = f5_local0.Font
	f5_local2.height = 14
	f5_local2.alignment = LUI.Alignment.Left
	f5_local2.glow = LUI.GlowState.None
	f5_local2.color = f5_arg3
	local self = LUI.UIText.new( f5_local2 )
	self:registerAnimationState( "focused", {
		glow = LUI.GlowState.LightGreen,
		color = Colors.white
	} )
	self:registerEventHandler( "focused", function ( element, event )
		element:animateToState( "focused", 0 )
	end )
	self:registerEventHandler( "unfocused", function ( element, event )
		element:animateToState( "default", 0 )
	end )
	self:setText( f5_arg2 )
	f5_arg0:addElement( self )
end

function CreateButton( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg1 - 2
	local self = LUI.UIButton.new( CoD.CreateState( 4, 0, -4, f8_arg1, CoD.AnchorTypes.TopLeftRight ) )
	self.id = "listbutton_" .. f8_arg0
	local f8_local2 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		bottom = f8_arg1,
		material = RegisterMaterial( "black" ),
		alpha = 0.5
	}
	local f8_local3 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "btn_focused_rect_innerglow" ),
		alpha = 0
	}
	
	local bg = LUI.UIImage.new( f8_local2 )
	bg.id = "ListButton_Bg"
	self:addElement( bg )
	self.bg = bg
	
	local textHolder = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( textHolder )
	self.textHolder = textHolder
	
	local focusBackground = LUI.UIImage.new( f8_local3 )
	focusBackground.id = "ListButton_focusBg"
	f8_local3.alpha = 1
	focusBackground:registerAnimationState( "focused", f8_local3 )
	focusBackground:setup9SliceImage( 10, 5, 0.25, 0.12 )
	self:addElement( focusBackground )
	self.focusBackground = focusBackground
	
	self:registerEventHandler( "button_over", function ( element, event )
		element:animateToState( "focused", 0 )
		element.focusBackground:animateToState( "focused" )
		element.textHolder:processEvent( {
			name = "focused",
			dispatchChildren = true
		} )
	end )
	self:registerEventHandler( "button_up", function ( element, event )
		element:animateToState( "unfocused", 0 )
		element.focusBackground:animateToState( "default" )
		element.textHolder:processEvent( {
			name = "unfocused",
			dispatchChildren = true
		} )
	end )
	return self
end

function gettestinfo( f11_arg0 )
	local f11_local0 = {
		"WWWWWWWWWWWWWWWWWWWW",
		"OverGROWN SoME",
		"18",
		"DOMINATION"
	}
	return f11_local0[f11_arg0]
end

function AddHeaderButton( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = {
		"@MENU_HOST_NAME",
		"@MENU_MAP",
		"@MENU_NUMPLAYERS",
		"@MENU_TYPE1"
	}
	local f12_local1 = nil
	local f12_local2 = CoD.CreateState( 0, f12_arg1, nil, nil, CoD.AnchorTypes.TopLeft )
	f12_local2.width = f12_arg2
	local self = LUI.UIElement.new( f12_local2 )
	local f12_local4 = CreateButton( "header", 24 )
	f12_local4:addElement( LUI.Divider.new( CoD.CreateState( nil, 0, nil, nil, CoD.AnchorTypes.TopLeftRight ), 40, LUI.Divider.Grey ) )
	f12_local4:makeNotFocusable()
	f12_local4:addElement( LUI.Divider.new( CoD.CreateState( nil, 0, nil, nil, CoD.AnchorTypes.BottomLeftRight ), 40, LUI.Divider.Grey ) )
	f12_local1 = function ( f13_arg0 )
		return Engine.Localize( f12_local0[f13_arg0] )
	end
	
	for f12_local5 = 1, 4, 1 do
		MakeText( f12_local4.textHolder, serverBrowserOffsets[f12_local5], f12_local1( f12_local5 ), nil )
	end
	self:addElement( f12_local4 )
	f12_arg0:addElement( self )
end

function AddServerButton( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = nil
	local f14_local1 = CreateButton( f14_arg2 or "header", 24 )
	f14_local1:makeFocusable()
	f14_local1.index = f14_arg2
	f14_local1:addEventHandler( "button_action", OnJoinGame )
	f14_local0 = function ( f15_arg0 )
		return Lobby.GetServerData( f14_arg1, f14_arg2, f15_arg0 - 1 )
	end
	
	for f14_local2 = 1, 4, 1 do
		MakeText( f14_local1.textHolder, serverBrowserOffsets[f14_local2], f14_local0( f14_local2 ), Colors.h1.medium_grey )
	end
	f14_arg0.list:addElement( f14_local1 )
	return f14_local1
end

function BuildList( f16_arg0, f16_arg1 )
	f16_arg0.list:closeChildren()
	for f16_local0 = 0, f16_arg0.serverCount - 1, 1 do
		AddServerButton( f16_arg0, f16_arg1, f16_local0 )
	end
	if f16_arg0.serverCount > 0 then
		f16_arg0.list:registerEventHandler( LUI.FormatAnimStateFinishEvent( "default" ), function ( element, event )
			ListPaging.InitList( f16_arg0.list, 18, nil, nil, nil, {
				enabled = false
			} )
		end )
		f16_arg0.list:animateToState( "default" )
	end
end

function AddLowerCounter( f18_arg0, f18_arg1 )
	local f18_local0 = 32
	local f18_local1 = 37
	local f18_local2 = CoD.CreateState( nil, nil, nil, -63, CoD.AnchorTypes.BottomLeft )
	f18_local2.width = f18_arg1
	f18_local2.height = 32
	local self = LUI.UIElement.new( f18_local2 )
	local f18_local4 = CoD.CreateState( -(f18_local1 + f18_local0), nil, nil, nil, CoD.AnchorTypes.None )
	f18_local4.width = f18_local0
	f18_local4.height = f18_local0
	f18_local4.material = RegisterMaterial( "s1_icon_up" )
	self:addElement( LUI.UIImage.new( f18_local4 ) )
	f18_local4.material = RegisterMaterial( "s1_icon_down" )
	f18_local4.left = f18_local1
	f18_local4.top = -17
	self:addElement( LUI.UIImage.new( f18_local4 ) )
	local f18_local5 = CoD.CreateState( -50, nil, nil, nil, CoD.AnchorTypes.None )
	f18_local5.font = CoD.TextSettings.TitleFontSmall.Font
	f18_local5.height = 14
	f18_local5.width = 100
	f18_local5.alignment = LUI.Alignment.Center
	
	local textCounter = LUI.UIText.new( f18_local5 )
	self:addElement( textCounter )
	f18_arg0.textCounter = textCounter
	
	f18_arg0:addElement( self )
end

function menu_systemlink_join( f19_arg0, f19_arg1 )
	local f19_local0 = CoD.DesignGridHelper( 15 )
	local f19_local1 = LUI.MenuTemplate.new( f19_arg0, {
		menu_title = "@PLATFORM_SYSTEM_LINK_TITLE",
		menu_width = f19_local0,
		menu_top_indent = 20,
		disableDeco = true,
		spacing = 1
	} )
	AddHeaderButton( f19_local1, 80, f19_local0 )
	AddLowerCounter( f19_local1, f19_local0 )
	UpdateCounterText( f19_local1, nil )
	Lobby.BuildServerList( Engine.GetFirstActiveController() )
	f19_local1.list:registerEventHandler( LUI.UIScrollIndicator.UpdateEvent, function ( element, event )
		UpdateCounterText( f19_local1, event )
	end )
	UpdateGameList( f19_local1 )
	f19_local1:registerEventHandler( "updateGameList", UpdateGameList )
	f19_local1:addElement( LUI.UITimer.new( 250, "updateGameList" ) )
	LUI.ButtonHelperText.ClearHelperTextObjects( f19_local1.help, {
		side = "all"
	} )
	f19_local1:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@MENU_SB_TOOLTIP_BTN_REFRESH" ),
		side = "right",
		clickable = true,
		priority = -1000
	}, function ( f21_arg0, f21_arg1 )
		RefreshServers( f21_arg0, f21_arg1, f19_local1 )
	end )
	f19_local1:AddHelp( {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@MENU_JOIN_GAME1" ),
		side = "left",
		clickable = false,
		priority = -1000
	}, nil, nil, true )
	f19_local1:AddBackButton()
	return f19_local1
end

LUI.MenuBuilder.registerType( "menu_systemlink_join", menu_systemlink_join )
LockTable( _M )
