local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = {
	{
		menuBaseName = "career",
		label = "CHALLENGE_CAREER",
		menuTemplateName = "CombatRecordCareerPanel",
		action = function ( f1_arg0, f1_arg1 )
			LUI.FlowManager.RequestAddMenu( f1_arg0, "CombatRecordCareerDetails", true, f1_arg1.controller )
		end
	},
	{
		menuBaseName = "gamemodes",
		label = "MENU_GAME_TYPES",
		menuTemplateName = "CombatRecordItemPanel",
		templateProps = CombatRecord.TemplateProps.GameModes,
		action = function ( f2_arg0, f2_arg1 )
			LUI.FlowManager.RequestAddMenu( f2_arg0, "CombatRecordItemListDetails", true, f2_arg1.controller, false, {
				inputTable = CombatRecord.InputTable.GameModeDetails
			} )
		end
	},
	{
		menuBaseName = "weapons",
		label = "LUA_MP_FRONTEND_CALLINGCARD_WEAPONS",
		menuTemplateName = "CombatRecordItemPanel",
		templateProps = CombatRecord.TemplateProps.Weapons,
		action = function ( f3_arg0, f3_arg1 )
			LUI.FlowManager.RequestAddMenu( f3_arg0, "CombatRecordItemListDetails", true, f3_arg1.controller, false, {
				inputTable = CombatRecord.InputTable.WeaponDetails
			} )
		end
	}
}
function OnButtonFocused( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0.menuIndex
	local f4_local1 = f4_arg0.menu
	if f4_local1.selectedIndex ~= f4_local0 then
		if f4_local1.selectedIndex > 0 then
			local f4_local2 = f4_local1.statDisplay[f4_local1.selectedIndex]
			if f4_local2 then
				f4_local2:animateToState( "hidden", 0 )
			end
		end
		f4_local1.selectedIndex = f4_local0
		local f4_local2 = f4_local1.statDisplay[f4_local1.selectedIndex]
		if f4_local2 == nil then
			if f4_local2 then
				f4_local2:close()
			end
			f4_local1.statDisplay[f4_local1.selectedIndex] = nil
			local f4_local3 = f0_local0[f4_local1.selectedIndex]
			OperatorMenuUtil.InitPanels( f4_local3.menuBaseName, 0 )
			f4_local2 = LUI.MenuBuilder.BuildRegisteredType( f4_local3.menuTemplateName, {
				controller = f4_arg1.controller,
				menu = f4_local1,
				inputTable = f4_local3.templateProps
			} )
			f4_local1:addElement( f4_local2 )
			f4_local2:registerAnimationState( "default", {
				alpha = 1
			} )
			f4_local2:registerAnimationState( "hidden", {
				alpha = 0
			} )
			f4_local1.statDisplay[f4_local1.selectedIndex] = f4_local2
		end
		f4_local2:animateToState( "default", 0 )
	end
end

function GameModesButtonAction( f5_arg0, f5_arg1 )
	
end

function OnBackButton( f6_arg0, f6_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
end

function CombatRecordMain( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = LUI.MenuTemplate.new( f7_arg0, {
		menu_title = "@MPUI_COMBATRECORD_HEADING_CAPS"
	} )
	f7_local0.selectedIndex = 0
	f7_local0.statDisplay = {}
	local f7_local1 = nil
	for f7_local2 = 1, #f0_local0, 1 do
		f7_local1 = f7_local0:AddButton( f0_local0[f7_local2].label, f0_local0[f7_local2].action )
		f7_local1:registerEventHandler( "button_over", OnButtonFocused )
		f7_local1.menuIndex = f7_local2
	end
	f7_local0:AddBackButton( OnBackButton )
	f7_local0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "MENU_SELECT_CAPS" ),
		side = "right",
		priority = -9001,
		clickable = false,
		showMouseHelp = true
	} )
	return f7_local0
end

LUI.MenuBuilder.registerType( "CombatRecordMain", CombatRecordMain )
LockTable( _M )
