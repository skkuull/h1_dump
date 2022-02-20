local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	MatchRules.OpenSelectionMenu( f1_arg1.controller, {
		savedMode = "history",
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_RECENT_MODES" ) )
	} )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	MatchRules.OpenSelectionMenu( f2_arg1.controller, {
		savedMode = "save",
		menuAction = "load",
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_MY_MODES" ) )
	} )
end

LUI.MenuBuilder.registerType( "popup_recipesetup_modes", function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.MenuTemplate.new( f3_arg0, {
		menu_title = Engine.Localize( "@LUA_MENU_MODE_CAPS" )
	} )
	f3_local0:AddBackButton()
	f3_local0:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_GAME_SETUP_CAPS" ) ) )
	local f3_local1 = LUI.PlaylistDetailsPanel.new( nil, {
		localMenu = true
	} )
	f3_local0:addElement( f3_local1 )
	local f3_local2 = nil
	for f3_local10, f3_local11 in pairs( {
		Cac.GameModes.Group.Standard,
		Cac.GameModes.Group.Party
	} ) do
		local f3_local12 = Cac.GetGameModeList( f3_local11 )
		if f3_local12 ~= nil and #f3_local12 >= 1 then
			local f3_local6 = Cac.GameModes.Data[f3_local11].Label
			local f3_local7 = f3_local6
			if f3_local11 ~= Cac.GameModes.Group.Esports then
				f3_local7 = Engine.ToUpperCase( f3_local7 )
			end
			local f3_local8 = {
				requestedGameMode = f3_local11,
				menu_title = f3_local7
			}
			f3_local2 = f3_local0:AddButton( f3_local6, function ( f4_arg0, f4_arg1 )
				LUI.FlowManager.RequestAddMenu( f4_arg0, "settings_recipe_choosetype", true, f4_arg1.controller, false, f3_local8 )
			end )
			local f3_local9 = {
				image = Cac.GameModes.Data[f3_local11].Image,
				nameStr = f3_local6,
				hideAllStats = true
			}
			f3_local2:addEventHandler( "button_over", function ( f5_arg0, f5_arg1 )
				f3_local1:processEvent( {
					name = "update_playlist_panel",
					panelData = f3_local9,
					isGamemodes = true
				} )
			end )
			f3_local2:addEventHandler( "button_over_disable", function ( f6_arg0, f6_arg1 )
				f3_local1:processEvent( {
					name = "update_playlist_panel",
					panelData = f3_local9,
					isGamemodes = true
				} )
			end )
		end
	end
	f3_local3 = {
		image = "h1_ui_icon_playlist_my_modes",
		nameStr = Engine.ToUpperCase( Engine.Localize( "@MPUI_MY_MODES" ) ),
		hideAllStats = true
	}
	f3_local2 = f3_local0:AddButton( "@LUA_MENU_MY_MODES", f0_local1 )
	f3_local2:addEventHandler( "button_over", function ( f7_arg0, f7_arg1 )
		f3_local1:processEvent( {
			name = "update_playlist_panel",
			panelData = f3_local3,
			isGamemodes = true
		} )
	end )
	f3_local2:addEventHandler( "button_over_disable", function ( f8_arg0, f8_arg1 )
		f3_local1:processEvent( {
			name = "update_playlist_panel",
			panelData = f3_local3,
			isGamemodes = true
		} )
	end )
	f3_local4 = {
		image = "h1_ui_icon_playlist_recent",
		nameStr = Engine.ToUpperCase( Engine.Localize( "@MPUI_RECENT_MODES" ) ),
		hideAllStats = true
	}
	f3_local2 = f3_local0:AddButton( "@LUA_MENU_RECENT_MODES", f0_local0 )
	f3_local2:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		f3_local1:processEvent( {
			name = "update_playlist_panel",
			panelData = f3_local4,
			isGamemodes = true
		} )
	end )
	f3_local2:addEventHandler( "button_over_disable", function ( f10_arg0, f10_arg1 )
		f3_local1:processEvent( {
			name = "update_playlist_panel",
			panelData = f3_local4,
			isGamemodes = true
		} )
	end )
	return f3_local0
end )
LockTable( _M )
