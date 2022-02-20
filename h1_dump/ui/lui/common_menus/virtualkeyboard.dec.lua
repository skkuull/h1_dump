local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function ExitVirtualKeyboard( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f1_arg0 )
	if f1_local0.exiting then
		return 
	end
	f1_local0.exiting = true
	f1_arg0:dispatchEventToRoot( {
		name = "exit_virtual_keyboard",
		immediate = true
	} )
	if Engine.TriggerVirtualKeyboardCallback then
		local f1_local1 = Engine.TriggerVirtualKeyboardCallback
		local f1_local2 = f1_arg1.controller
		local f1_local3 = f1_arg2
		local f1_local4
		if not f1_arg2 then
			f1_local4 = f1_local0.input
			if not f1_local4 then
			
			else
				f1_local1( f1_local2, f1_local3, f1_local4, f1_local0.verifyString or false )
			end
		end
		f1_local4 = ""
	end
end

function input_popup( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "virtual_keyboard" )
	local f2_local1 = f2_arg1.keyboardType
	if not f2_local1 then
		f2_local1 = CoD.KeyboardInputTypes.Normal
	end
	local f2_local2
	if f2_local1 == CoD.KeyboardInputTypes.Email then
		f2_local2 = 1000
		if not f2_local2 then
		
		else
			local f2_local3 = f2_local1 == CoD.KeyboardInputTypes.Password
			local f2_local4 = LUI.MenuGenerics.generic_selectionList_popup( {}, {
				popup_title = f2_arg1.title,
				popup_width = f2_local2,
				padding_top = 10,
				padding_bottom = 10,
				padding_left = 10,
				padding_right = 10,
				popup_childfeeder = function ()
					return {
						{
							type = "generic_input_field",
							id = "not_so_virtual_input",
							requireFocusType = FocusType.MouseOver,
							properties = {
								keyboard_type = f2_local1,
								password_field = f2_local3,
								max_length = f2_local0.maxLength,
								help_value = f2_local0.input,
								field_edited_func = function ( f4_arg0, f4_arg1 )
									local f4_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg0 )
									f4_local0.input = f4_arg1.text or ""
									if f4_local0.exiting then
										return 
									else
										f4_arg1.controller = f4_local0.exclusiveController
										ExitVirtualKeyboard( f4_arg0, f4_arg1, f4_arg1.cancelled )
										LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
									end
								end
								,
								additional_handlers = {
									menu_create = MBh.EmitEvent( {
										name = "button_action",
										mouse = true
									} ),
									exit_virtual_keyboard = function ( f5_arg0, f5_arg1 )
										f5_arg0:processEvent( {
											name = "finish_editing"
										} )
									end
									
								}
							}
						},
						{
							type = "UIElement",
							id = "input_spacer",
							states = {
								default = {
									leftAnchor = true,
									rightAnchor = true,
									topAnchor = true,
									bottomAnchor = false,
									left = 0,
									right = 0,
									top = 0,
									bottom = 12
								}
							}
						},
						{
							type = "UIGenericButton",
							id = "input_ok",
							audio = {
								button_over = CoD.SFX.SubMenuMouseOver
							},
							properties = {
								style = GenericButtonSettings.Styles.GlassButton,
								substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
								button_text = Engine.Localize( "MENU_OK" ),
								button_action_func = function ( f6_arg0, f6_arg1 )
									ExitVirtualKeyboard( f6_arg0, f6_arg1, false )
									LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
								end
								
							}
						}
					}
				end
			} )
			f2_local4:registerEventHandler( "popup_back", function ( element, event )
				ExitVirtualKeyboard( element, event, true )
			end )
			f2_local4:dispatchEventToRoot( {
				name = "virtual_keyboard_popup_active",
				immediate = true
			} )
			return f2_local4
		end
	end
	f2_local2 = nil
end

function virtual_keyboard( f8_arg0, f8_arg1 )
	local f8_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "virtual_keyboard" )
	f8_local0.input = f8_arg1.defaultText or ""
	f8_local0.maxLength = f8_arg1.maxLength or 12
	f8_local0.verifyString = f8_arg1.verifyString or false
	return input_popup( f8_arg0, f8_arg1 )
end

LUI.MenuBuilder.registerType( "virtual_keyboard", virtual_keyboard )
LockTable( _M )
