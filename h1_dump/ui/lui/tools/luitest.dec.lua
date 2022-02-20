local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function luitest( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.MenuTemplate.new( f1_arg0, {
		menu_title = "@LUA_MENU_CREATE_AN_OPERATOR_CAPS"
	} )
	for f1_local1 = 1, 5, 1 do
		local f1_local4 = f1_local1
		LUI.MenuBuilder.BuildAddChild( f1_local0.list, {
			type = "UIGenericButton",
			id = "test_button" .. f1_local4,
			properties = {
				style = GenericButtonSettings.Styles.FlatButton,
				button_text = "Test Button " .. f1_local4,
				button_action_func = function ( f2_arg0 )
					DebugPrint( "Clicked! " .. f1_local4 )
				end,
				text_align_without_content = LUI.Alignment.Left
			}
		} )
	end
	LUI.ButtonHelperText.AddHelperTextObject( f1_local0.help, LUI.ButtonHelperText.CommonEvents.addBackButton, MBh.LeaveMenu() )
	return f1_local0
end

LUI.MenuBuilder.registerType( "luitest", luitest )
LockTable( _M )
