local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
DebugPrint( "Registering " .. _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
end

LUI.MenuBuilder.registerDef( "CreditsAlpha", function ()
	return {
		type = "UIElement",
		id = "CreditsAlpha",
		focusable = true,
		properties = {
			exclusiveController = 0
		},
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true
			}
		},
		handlers = {
			menu_create = f0_local1
		},
		children = {
			{
				type = "UIImage",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						material = RegisterMaterial( "s1_credits_background" ),
						alpha = 0
					},
					visible = {
						alpha = 1
					}
				},
				handlers = {
					menu_create = MBh.AnimateToState( "visible", 500 )
				}
			},
			{
				type = "button_helper_text_main",
				id = "sp_main_button_helper_text_id"
			},
			{
				type = "generic_back_button",
				handlers = {
					button_secondary = f0_local0
				}
			}
		}
	}
end )
LockTable( _M )
