local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function OnBack( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestRestoreMenu( f1_arg0, "OperatorMenu", true, f1_arg1.controller, true )
end

function PrestigeFanfare( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.MenuTemplate.new( f2_arg0, {
		menu_title = ""
	} )
	local f2_local1 = LUI.AARExperienceWidget.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), {
		controller = f2_arg1.exclusiveController or f2_arg1.controller,
		prestige_fanfare = true,
		ignore_last_game_unlocks = true,
		skip_animation = false
	} )
	f2_local0:addElement( f2_local1 )
	f2_local1:processEvent( {
		name = "widget_play"
	} )
	f2_local0:AddBackButton( OnBack )
	return f2_local0
end

LUI.MenuBuilder.registerType( "PrestigeFanfare", PrestigeFanfare )
LockTable( _M )
