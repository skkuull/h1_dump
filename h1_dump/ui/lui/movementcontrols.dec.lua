local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MovementControls = {}
function CreateOptions( f1_arg0 )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_FORWARD", "@MENU_FORWARD_DESC", "+forward" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_MOVE_BACK", "@MENU_MOVE_BACK_DESC", "+back" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_MOVE_LEFT", "@MENU_MOVE_LEFT_DESC", "+moveleft" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_MOVE_RIGHT", "@MENU_MOVE_RIGHT_DESC", "+moveright" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_STANDJUMP", "@MENU_STANDJUMP_DESC", "+gostand" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_CROUCH", "@MENU_CROUCH_DESC", "+togglecrouch" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_PRONE", "@MENU_PRONE_DESC", "toggleprone" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_SPRINT_HOLD_BREATH", "@MENU_SPRINT_HOLD_BREATH_DESC", "+breath_sprint" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_HOLD_DOWN_CROUCH", "@MENU_HOLD_DOWN_CROUCH_DESC", "+movedown" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_HOLD_DOWN_PRONE", "@MENU_HOLD_DOWN_PRONE_DESC", "+prone" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_CHANGE_STANCE", "@MENU_CHANGE_STANCE_DESC", "+stance" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_SPRINT", "@MENU_SPRINT_DESC", "+sprint" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_HOLD_BREATH", "@MENU_HOLD_BREATH_DESC", "+holdbreath" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_TURN_LEFT", "@MENU_TURN_LEFT_DESC", "+left" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_TURN_RIGHT", "@MENU_TURN_RIGHT_DESC", "+right" )
	LUI.Options.CreateControlBindButton( f1_arg0, "@MENU_STRAFE", "@MENU_STRAFE_DESC", "+strafe" )
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

LUI.MovementControls.new = function ( f4_arg0, f4_arg1 )
	Engine.ExecNow( "profile_menuDvarsSetup" )
	local f4_local0 = Engine.IsMultiplayer() and 0 or LUI.MenuTemplate.spMenuOffset
	local f4_local1 = LUI.MenuTemplate.new( f4_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CONTROL_OPTIONS" ) ),
		menu_top_indent = f4_local0 + LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing,
		menu_width = GenericMenuDims.OptionMenuWidth,
		menu_list_divider_top_offset = -(LUI.H1MenuTab.tabChangeHoldingElementHeight + H1MenuDims.spacing),
		noWrap = true,
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
		activeIndex = LUI.PCControlOptions.FindTypeIndex( "movement_controls" ),
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

LUI.MenuBuilder.registerType( "movement_controls", LUI.MovementControls.new )
LockTable( _M )
