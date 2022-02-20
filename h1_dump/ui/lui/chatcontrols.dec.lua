local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ChatControls = {}
function CreateOptions( f1_arg0 )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_TEXT_CHAT", "@MENU_TEXT_CHAT_DESC", "chatmodepublic" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_TEXT_TEAM_CHAT", "@MENU_TEXT_TEAM_CHAT_DESC", "chatmodeteam" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_VOICE_CHAT_BUTTON", "@MENU_VOICE_CHAT_BUTTON_DESC", "+talk" )
	LUI.Options.InitScrollingList( f1_arg0.list, nil )
end

function RefreshFunc( f2_arg0 )
	return function ( f3_arg0, f3_arg1 )
		f2_arg0.list:processEvent( {
			name = "content_refresh",
			dispatchChildren = true
		} )
	end
	
end

LUI.ChatControls.new = function ( f4_arg0, f4_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f4_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f4_local1 = LUI.MenuTemplate.new( f4_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CONTROL_OPTIONS" ) ),
		menu_top_indent = f4_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		skipAnim = 0 ~= LUI.PCControlOptions.FindTypeIndex( LUI.PreviousMenuName )
	} )
	f4_local1:registerEventHandler( "options_window_refresh", LUI.Options.OptionsWindowRefresh )
	f4_local1:registerEventHandler( "popup_inactive", RefreshFunc( f4_local1 ) )
	f4_local1:addElement( LUI.H1MenuTab.new( {
		title = function ( f5_arg0 )
			return LUI.PCControlOptions.Categories[f5_arg0].title
		end,
		tabCount = #LUI.PCControlOptions.Categories,
		underTabTextFunc = function ( f6_arg0 )
			return LUI.PCControlOptions.Categories[f6_arg0].title
		end,
		top = f4_local0 + LUI.MenuTemplate.ListTop,
		width = GenericMenuDims.OptionMenuWidth,
		clickTabBtnAction = LUI.PCControlOptions.LoadMenu,
		activeIndex = LUI.PCControlOptions.FindTypeIndex( "chat_controls" ),
		isTabLockedfunc = LUI.PCControlOptions.IsCategoryDisabled,
		skipChangeTab = true,
		exclusiveController = f4_local1.exclusiveController
	} ) )
	CreateOptions( f4_local1 )
	LUI.Options.AddOptionTextInfo( f4_local1 )
	LUI.PCControlOptions.AddResetToDefaultButton( f4_local1 )
	f4_local1:AddBackButton()
	return f4_local1
end

LUI.MenuBuilder.registerType( "chat_controls", LUI.ChatControls.new )
LockTable( _M )
