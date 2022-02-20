local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ModeSelect = InheritFrom( LUI.MenuTemplate )
function LoadGameTypeRecipe( f1_arg0, f1_arg1 )
	MatchRules.SetData( "gametype", f1_arg0 )
	local f1_local0 = f1_arg1 == Cac.GameModes.Group.Esports
	if f1_local0 then
		assert( MatchRules.HasMLGRecipeInFastFile() )
	end
	MLG.SetMLGRulesEnabled( f1_local0 )
end

function GameModeChooseAction( f2_arg0, f2_arg1 )
	local f2_local0 = MatchRules.GetData( "gametype" )
	if f2_local0 then
		FixTeamLimitsAndDifficultiesIfNecessary( f2_local0, f2_arg0.properties.gameType )
	end
	LoadGameTypeRecipe( f2_arg0.properties.gameType, f2_arg0.properties.modeGroup )
	if Engine.GetSplitScreen() then
		Engine.ExecNow( MPConfig.default_splitscreen, f2_arg1.controller )
	elseif Engine.GetSystemLink() then
		Engine.ExecNow( MPConfig.default_systemlink, f2_arg1.controller )
	elseif Engine.GetDvarBool( "xblive_privatematch" ) then
		Engine.ExecNow( MPConfig.default_xboxlive, f2_arg1.controller )
	end
	GameModeSelectMenuClose( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestRestoreMenu( f2_arg0, "gamesetup_menu_main", true, f2_arg1.controller, true )
end

function EmitGameModeSelectionUpdate( f3_arg0, f3_arg1 )
	f3_arg0:dispatchEventToRoot( {
		name = "gamemode_selection_update",
		gameType = f3_arg0.properties.gameType,
		dispatchChildren = true,
		immediate = true,
		disabled = f3_arg0.disabled
	} )
end

LUI.ModeSelect.AddModeButtons = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Cac.GetGameModeList( f4_arg1 )
	local f4_local1 = LUI.FlowManager.GetMenuScopedDataByMenuName( "settings_recipe_choosetype" )
	for f4_local10, f4_local11 in ipairs( f4_local0 ) do
		local f4_local5 = false
		local f4_local12 = true
		if f4_local11 == Engine.GetDvarString( "ui_gametype" ) then
			f4_local5 = true
		end
		if f4_local12 then
			local f4_local6 = {
				gameType = f4_local11,
				modeGroup = f4_arg1,
				button_over_func = EmitGameModeSelectionUpdate,
				button_over_disable_func = EmitGameModeSelectionUpdate,
				additional_handlers = {
					button_action = GameModeChooseAction
				}
			}
			local f4_local7 = f4_local11 == MatchRules.GetData( "gametype" )
			f4_local6.listDefaultFocus = f4_local7
			if f4_local7 then
				f4_local6.text_default_color = Colors.mw1_green
			end
			local f4_local8 = {
				nameStr = Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f4_local11, GameTypesTable.Cols.Name ) ),
				desc = Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f4_local11, GameTypesTable.Cols.Desc ) ),
				image = Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f4_local11, GameTypesTable.Cols.Image ),
				isChosen = f4_local7,
				hideAllStats = true
			}
			local f4_local9 = f4_arg0:AddButton( f4_local8.nameStr, nil, nil, nil, nil, f4_local6 )
			f4_local9:addEventHandler( "button_over", function ( f5_arg0, f5_arg1 )
				f4_arg2:processEvent( {
					name = "update_playlist_panel",
					panelData = f4_local8
				} )
			end )
			f4_local9:addEventHandler( "button_over_disable", function ( f6_arg0, f6_arg1 )
				f4_arg2:processEvent( {
					name = "update_playlist_panel",
					panelData = f4_local8
				} )
			end )
		end
	end
end

function GameModeSelectMenuClose( f7_arg0, f7_arg1 )
	Engine.ExecNow( "xupdatepartystate" )
end

function UpdateGamemodeIcon( f8_arg0, f8_arg1 )
	f8_arg0:setImage( RegisterMaterial( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f8_arg1.gameType, GameTypesTable.Cols.Image ) or "" ) )
end

function UpdateGamemodeTitle( f9_arg0, f9_arg1 )
	f9_arg0:setText( Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f9_arg1.gameType, GameTypesTable.Cols.Name ) or "" ) )
end

function UpdateGamemodeDesc( f10_arg0, f10_arg1 )
	f10_arg0:setText( Engine.Localize( Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f10_arg1.gameType, GameTypesTable.Cols.Desc ) or "" ) )
end

function UpdateDisabledDesc( f11_arg0, f11_arg1 )
	if f11_arg1.disabled then
		f11_arg0:animateToState( "default" )
	else
		f11_arg0:animateToState( "hidden" )
	end
end

LUI.ModeSelect.AddGameModeDescPane = function ( f12_arg0 )
	local f12_local0 = CoD.TextSettings.BodyFontBold18
	local f12_local1 = CoD.TextSettings.BodyFont18
	local f12_local2 = 10
	local f12_local3 = CoD.CreateState( GenericMenuDims.menu_right_standard + 120, GenericMenuDims.MenuStartY, nil, nil, CoD.AnchorTypes.TopLeft )
	f12_local3.width = 356
	f12_local3.height = GenericTitleBarDims.TitleBarHeight + 360
	local self = LUI.UIElement.new( f12_local3 )
	self.id = "gamemode_desc_pane_id"
	local f12_local5 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_titlebar", {
		title_bar_text = Engine.Localize( "@LUA_MENU_MODE_DETAILS_CAPS" )
	} )
	f12_local5.id = "gamemode_header_id"
	self:addElement( f12_local5 )
	local f12_local6 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_background" )
	self.id = "gamemode_bg_fade_id"
	local f12_local7 = CoD.CreateState( -128, 0, 128, 256, CoD.AnchorTypes.Top )
	f12_local7.material = RegisterMaterial( "icon_playlist_generic" )
	local self = LUI.UIImage.new( f12_local7 )
	self.id = "gamemode_image_id"
	self:registerEventHandler( "gamemode_selection_update", UpdateGamemodeIcon )
	f12_local6:addElement( self )
	local f12_local9 = CoD.CreateState( f12_local2, 256, -f12_local2, nil, CoD.AnchorTypes.TopLeftRight )
	f12_local9.height = f12_local0.Height
	f12_local9.font = f12_local0.Font
	f12_local9.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	local self = LUI.UIText.new( f12_local9 )
	self.id = "gamemode_name_id"
	self:registerEventHandler( "gamemode_selection_update", UpdateGamemodeTitle )
	f12_local6:addElement( self )
	local f12_local11 = CoD.CreateState( f12_local2, 276, -f12_local2, nil, CoD.AnchorTypes.TopLeftRight )
	f12_local11.height = f12_local1.Height
	f12_local11.font = f12_local1.Font
	f12_local11.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f12_local11.red = Colors.primary_text_color.r
	f12_local11.green = Colors.primary_text_color.g
	f12_local11.blue = Colors.primary_text_color.b
	local self = LUI.UIText.new( f12_local11 )
	self.id = "gamemode_desc_id"
	self:registerEventHandler( "gamemode_selection_update", UpdateGamemodeDesc )
	f12_local6:addElement( self )
	local f12_local13 = CoD.CreateState( 10, -82, 42, -50, CoD.AnchorTypes.BottomLeft )
	f12_local13.material = RegisterMaterial( "icon_new" )
	f12_local13.alpha = 1
	local self = LUI.UIImage.new( f12_local13 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self.id = "gamemode_disabled_icon_id"
	self:registerEventHandler( "gamemode_selection_update", UpdateDisabledDesc )
	f12_local6:addElement( self )
	local f12_local15 = CoD.CreateState( 48, -65 - CoD.TextSettings.BodyFont.Height, -10, -65, CoD.AnchorTypes.BottomLeftRight )
	f12_local15.font = CoD.TextSettings.BodyFont.Font
	f12_local15.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f12_local15.red = Colors.primary_text_color.r
	f12_local15.green = Colors.primary_text_color.g
	f12_local15.blue = Colors.primary_text_color.b
	f12_local15.alpha = 1
	self:addElement( f12_local6 )
	f12_arg0:addElement( self )
end

LUI.ModeSelect.new = function ( menu, controller )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "settings_recipe_choosetype_root"
	self:registerEventHandler( "menu_close", GameModeSelectMenuClose )
	local f13_local1 = LUI.MenuTemplate.new( menu, {
		menu_title = controller.menu_title,
		uppercase_title = true
	} )
	f13_local1.id = "settings_recipe_choosetype_menu"
	f13_local1:setClass( LUI.ModeSelect )
	f13_local1:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@MPUI_MODE" ) ) )
	local f13_local2 = LUI.PlaylistDetailsPanel.new( nil, {
		localMenu = true
	} )
	f13_local1:addElement( f13_local2 )
	f13_local1:AddModeButtons( controller.requestedGameMode, f13_local2 )
	f13_local1:AddBackButton()
	self:addElement( f13_local1 )
	return self
end

LUI.MenuBuilder.registerType( "settings_recipe_choosetype", LUI.ModeSelect.new )
LockTable( _M )
