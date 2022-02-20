local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
require( "LUI.common_menus.FriendsWidget" )
LUI.UIButtonText = {}
LUI.UIButtonText.horizontalSpacing = 6
LUI.UIButtonText.verticalSpacing = 2.4
LUI.UIButtonText.height = 20
LUI.UIButtonText.IsOffsetedLanguage = function ()
	if Engine.IsRightToLeftLanguage() then
		return true
	elseif Engine.IsAsianLanguage() then
		return true
	elseif Engine.GetCurrentLanguage() == 5 then
		return true
	elseif Engine.GetCurrentLanguage() == 6 then
		return true
	else
		return false
	end
end

LUI.UIButtonText.new = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7 )
	local f2_local0 = LUI.DeepCopy( f2_arg0 )
	f2_arg0.material = RegisterMaterial( "btn_focused_rect_innerglow" )
	f2_arg0.right = nil
	f2_arg0.leftAnchor = not f2_arg2
	f2_arg0.rightAnchor = f2_arg2
	local f2_local1
	if f2_arg3 then
		f2_local1 = 0.75
		if not f2_local1 then
		
		else
			local f2_local2
			if f2_arg5 then
				f2_local2 = 1
				if not f2_local2 then
				
				else
					f2_arg0.alpha = f2_local2
					f2_arg0.scale = 0
					if not f2_arg7 then
						f2_arg7 = function ()
							return false
						end
						
					end
					f2_local2, f2_local3, f2_local4 = nil
					f2_local2, f2_local3, f2_local4 = GetTextDimensions2( f2_arg1, f2_arg0.font, f2_arg0.height - 2 * LUI.UIButtonText.verticalSpacing )
					f2_arg0.width = f2_local4 + 2 * LUI.UIButtonText.horizontalSpacing
					local f2_local5 = 6
					if f2_arg0.height - f2_arg0.width > 0 then
						f2_arg0.width = f2_arg0.height
						f2_local5 = (f2_arg0.width - f2_local4) / 2
					end
					if f2_arg2 then
						f2_arg0.width = -f2_arg0.width
					end
					local self = LUI.UIImage.new( f2_arg0, f2_arg1 )
					self:setup9SliceImage()
					if not f2_arg4 then
						self:registerAnimationState( "buttonOver", {
							alpha = 1,
							scale = 0
						} )
						self:registerAnimationState( "pulse", {
							scale = -0.1
						} )
						self:registerEventHandler( "button_over", MBh.AnimateToState( "buttonOver" ) )
						self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
						self:registerEventHandler( "pulse", function ( element, event )
							local f4_local0 = event.mouse and "buttonOver" or "default"
							element:animateInSequence( {
								{
									"buttonOver",
									0
								},
								{
									"pulse",
									100
								},
								{
									"buttonOver",
									200
								}
							} )
						end )
					end
					if f2_arg6 then
						self:setHandleMouseButton( true )
						self:setHandleMouseMove( true )
						self.m_requireFocusType = FocusType.MouseOver
						self:registerEventHandler( "leftmousedown", function ( element, event )
							if f2_arg7() then
								return 
							else
								element.hightlighted = true
								element:animateInSequence( {
									{
										"hightlight",
										0
									},
									{
										"pulse",
										100
									}
								} )
							end
						end )
						self:registerEventHandler( "leftmouseup", function ( element, event )
							if element.hightlighted then
								if f2_arg7() then
									return 
								end
								element:animateInSequence( {
									{
										"hightlight",
										100
									}
								} )
								Engine.PlaySound( CoD.SFX.MenuAccept )
								f2_arg6( element, event )
								if f2_arg7() then
									element:animateToState( "default" )
									element.hightlighted = false
								end
							end
						end )
						self:registerAnimationState( "hightlight", {
							alpha = 1,
							scale = 0
						} )
						self:registerAnimationState( "pulse", {
							scale = -0.1
						} )
						self:registerEventHandler( "mouseenter", function ( element, event )
							if f2_arg7() then
								return 
							else
								element:animateToState( "hightlight" )
								element.hightlighted = true
							end
						end )
						self:registerEventHandler( "mouseleave", function ( element, event )
							element:animateToState( "default" )
							element.hightlighted = false
						end )
					end
					f2_local0.left = f2_local5
					f2_local0.top = LUI.UIButtonText.verticalSpacing + 2
					f2_local0.right = 10
					f2_local0.bottom = -LUI.UIButtonText.verticalSpacing + 2
					if LUI.UIButtonText.IsOffsetedLanguage() then
						f2_local0.top = f2_local0.top - 2
						f2_local0.bottom = f2_local0.bottom - 2
					end
					f2_local0.width = nil
					f2_local0.height = nil
					f2_local0.leftAnchor = true
					f2_local0.topAnchor = true
					f2_local0.rightAnchor = true
					f2_local0.bottomAnchor = true
					f2_local0.horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft
					f2_local0.color = Colors.h1.light_green
					if f2_arg2 then
						f2_local0.left = f2_local0.left + f2_arg0.width
						f2_local0.right = f2_local0.right + f2_arg0.width
					end
					local self = LUI.UIText.new( f2_local0 )
					self:addElement( self )
					self:setText( f2_arg1 )
					self.buttonText = self
					self.setText = function ( f9_arg0, f9_arg1 )
						f9_arg0.buttonText:setText( f9_arg1 )
					end
					
					return self
				end
			end
			f2_local2 = f2_local1
		end
	end
	f2_local1 = 0.5
end

f0_local0 = nil
f0_local0 = CoD.TextSettings.BodyFontTiny
f0_local1 = false
f0_local2 = 0
function OnHelp( f10_arg0, f10_arg1 )
	Engine.Help()
end

function UpdateSignInText( f11_arg0 )
	local f11_local0 = nil
	local f11_local1 = Engine.GetSignedInAsController()
	if f11_local1 >= 0 then
		f11_local0 = Engine.Localize( "@XBOXLIVE_SIGNEDINAS", Engine.MarkLocalized( Engine.GetUsernameByController( f11_local1 ) ) )
	else
		f11_local0 = Engine.Localize( "@XBOXLIVE_NOTSIGNEDIN" )
	end
	f11_arg0:setText( f11_local0 )
end

function AddSignInText( f12_arg0 )
	if f12_arg0.signInText == nil then
		local f12_local0 = f0_local0
		local f12_local1 = 265
		local f12_local2 = 20
		local f12_local3 = CoD.CreateState( f12_local1, f12_local2, f12_local1 + 425, f12_local2 + f12_local0.Height, CoD.AnchorTypes.TopLeft )
		f12_local3.font = f12_local0.Font
		f12_local3.alignment = LUI.Alignment.Left
		f12_local3.red = Colors.s1.text_unfocused.r
		f12_local3.green = Colors.s1.text_unfocused.g
		f12_local3.blue = Colors.s1.text_unfocused.b
		local self = LUI.UIText.new( f12_local3 )
		if f0_local1 then
			self:setTextStyle( CoD.TextStyle.ForceUpperCase )
		end
		self:registerEventHandler( "live_connection", UpdateSignInText )
		f12_arg0:addElement( self )
		f12_arg0.signInText = self
	end
	UpdateSignInText( f12_arg0.signInText )
end

local f0_local3 = function ( f13_arg0, f13_arg1 )
	if Engine.IsMultiplayer() then
		SetWaitingForNetworkType( WaitingForNetworkType.None )
	end
	Engine.Exec( "xswitchuser", f13_arg1.controller )
end

function AddSignInAndSwitchUserHelp( f14_arg0 )
	f14_arg0:processEvent( LUI.ButtonHelperText.CommonEvents.addSwitchUserButton )
	f14_arg0:processEvent( {
		name = "add_sign_in_text"
	} )
end

CommonEvents = {
	addSelectButton = {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@LUA_MENU_SELECT" ),
		side = "left",
		clickable = false,
		priority = -1000
	},
	removeSelectButton = {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = "",
		side = "left"
	},
	addContinueButton = {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@LUA_MENU_CONTINUE" ),
		side = "left",
		clickable = true,
		priority = -1000
	},
	addOnboardingButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_HELP" ),
		side = "right",
		clickable = true
	},
	addBackButton = {
		name = "add_button_helper_text",
		button_ref = "button_secondary",
		helper_text = Engine.Localize( "@LUA_MENU_BACK" ),
		side = "left",
		clickable = true,
		priority = -2000
	},
	addFriendsButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt2",
		helper_text = Engine.Localize( "@LUA_MENU_SOCIAL_TITLE" ),
		side = "right",
		clickable = true,
		priority = -1000,
		func = LUI.FriendsWidget.OpenFriends,
		actionSFX = CoD.SFX.MenuAccept
	},
	removeFriendsButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt2",
		helper_text = ""
	},
	addGameSummaryButton = {
		name = "add_button_helper_text",
		button_ref = "button_select",
		helper_text = Engine.Localize( "@LUA_MENU_MATCH_SUMMARY" ),
		side = "right",
		clickable = true
	},
	addRightStickButton = {
		name = "add_button_helper_text",
		button_ref = "button_right_stick",
		helper_text = Engine.Localize( "@LUA_MENU_ROTATE" ),
		side = "right",
		clickable = false
	},
	addMouseDrag = {
		name = "add_button_helper_text",
		button_ref = "button_mousedrag",
		helper_text = Engine.Localize( "@LUA_MENU_ROTATE" ),
		side = "right",
		clickable = false
	},
	removeMouseDrag = {
		name = "add_button_helper_text",
		button_ref = "button_mousedrag",
		helper_text = ""
	},
	removeRightStickButton = {
		name = "add_button_helper_text",
		button_ref = "button_right_stick",
		helper_text = ""
	},
	addHelpButton = {
		name = "add_button_helper_text",
		button_ref = "button_alt1",
		helper_text = Engine.Localize( "@LUA_MENU_HELP" ),
		side = "right",
		clickable = true,
		priority = -500,
		func = OnHelp
	},
	addSwitchUserButton = {
		name = "add_button_helper_text",
		button_ref = "button_select",
		helper_text = Engine.Localize( "@LUA_MENU_SWITCH_USER" ),
		side = "right",
		clickable = true,
		priority = -500,
		func = f0_local3
	},
	addRestrictedHelp = {
		name = "add_button_helper_text",
		id = "restricted",
		image_name = CoD.Material.RestrictedIcon,
		helper_text = Engine.Localize( "@LUA_MENU_RESTRICTED" ),
		side = "top_right",
		clickable = false,
		priority = -1000
	},
	removeRestrictedHelp = {
		name = "add_button_helper_text",
		id = "restricted",
		image_name = CoD.Material.RestrictedIcon,
		helper_text = "",
		side = "top_right",
		clickable = false,
		priority = -1000
	},
	addUnboundButton = {
		name = "add_button_helper_text",
		button_ref = "button_backspace",
		helper_text = Engine.Localize( "@LUA_MENU_UNBIND" ),
		side = "right",
		clickable = false,
		priority = 1000
	}
}
function AddHelperTextObject( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	if f15_arg1.button_ref_func then
		f15_arg1.button_ref = f15_arg1.button_ref_func()
	end
	local f15_local0 = assert
	local f15_local1 = f15_arg1.button_ref
	if not f15_local1 then
		f15_local1 = f15_arg1.image_name and f15_arg1.id
	end
	f15_local0( f15_local1 )
	assert( f15_arg1.helper_text or f15_arg1.helper_text_func, "Need helper text or helper_text_func that return text." )
	f15_local0 = assert
	if f15_arg1.helper_text then
		f15_local1 = not f15_arg1.helper_text_func
	else
		f15_local1 = true
	end
	f15_local0( f15_local1, "Should not have both helper_text and helper_text_func." )
	f15_local0 = nil
	f15_local1 = f15_arg1.func or f15_arg2
	local f15_local2 = f15_arg1.func2 or f15_arg4
	if f15_arg1.side and f15_arg1.side == "left" then
		f15_local0 = f15_arg0:getChildById( "left_button_helper_list_id" )
	elseif f15_arg1.side and f15_arg1.side == "top_right" then
		local f15_local3 = f15_arg0:getParent()
		local f15_local4 = f15_local3:getParent()
		local f15_local5 = f15_local4:getChildById( "top_button_helper_text_main_id" )
		local f15_local6 = f15_local5:getChildById( "top_container" )
		f15_local0 = f15_local6:getChildById( "top_right_button_helper_list_id" )
	else
		f15_local0 = f15_arg0:getChildById( "right_button_helper_list_id" )
	end
	if f15_local0 == nil then
		return 
	end
	local f15_local3 = (f15_arg1.button_ref or f15_arg1.id) .. "_id"
	local f15_local4 = f15_local0:getChildById( f15_local3 )
	if f15_local4 and f15_arg1.helper_text ~= f15_local4.currentText then
		if f15_arg1.button_ref == "partyStatus" then
			f15_local4:processEvent( {
				name = "update_message",
				dispatchChildren = true,
				message = f15_arg1.helper_text
			} )
			return 
		end
		f15_local4:close()
		f15_local4 = nil
	end
	if not f15_local4 and f15_arg1.helper_text ~= "" then
		local f15_local5 = f15_arg1.ignorePopups or false
		local f15_local6 = f15_arg1.button_ref and ButtonMap[f15_arg1.button_ref] or nil
		local f15_local7 = f15_arg1.button_ref2 and ButtonMap[f15_arg1.button_ref2] or nil
		if (f15_arg1.button_ref_vita or f15_arg1.button_ref_vita_2) and Engine.IsVita( f15_arg1.controller and f15_arg1.controller or Engine.GetFirstActiveController() ) then
			if f15_arg1.button_ref_vita then
				f15_local6 = ButtonMap[f15_arg1.button_ref_vita]
			end
			if f15_arg1.button_ref_vita_2 then
				f15_local7 = ButtonMap[f15_arg1.button_ref_vita_2]
			end
		end
		f15_local4 = helper_text_item( f15_local6, f15_arg1.helper_text, f15_local7, f15_arg1.width, f15_arg1.priority, f15_local5, f15_arg1.image_name, f15_arg1.glow, f15_arg3, f15_arg1.clickable, false, f15_arg1.showMouseHelp, f15_arg1.helper_text_func, f15_arg1.color, f15_arg1.groupLRButtons, f15_arg1.bindTextID, f15_arg1.muteAction, f15_arg1.leftIconClickFunc, f15_arg1.rightIconClickFunc )
		f15_local4.id = f15_local3
		if f15_arg1.clickable == true and ButtonMap[f15_arg1.button_ref] then
			f15_local4.triggers_event = f15_arg1.button_ref
		end
		if Engine.IsConsoleGame() then
			f15_local4:makeNotFocusable()
		end
		f15_local0:addElement( f15_local4 )
	end
	if f15_local4 then
		if f15_local4.bindButton and f15_local1 ~= f15_local4.bindButton.func then
			f15_local4.bindButton:close()
			f15_local4.bindButton = nil
		end
		if f15_local4.bindButton2 and f15_local2 ~= f15_local4.bindButton2.func then
			f15_local4.bindButton2:close()
			f15_local4.bindButton2 = nil
		end
		if not f15_local4.bindButton and f15_local1 then
			f15_local4.bindButton = LUI.UIBindButton.new()
			f15_local4.bindButton.id = "BindButton1"
			f15_local4.bindButton:registerEventHandler( f15_arg1.button_ref, f15_local1 )
			f15_local4.bindButton.func = f15_local1
			f15_local4:addElement( f15_local4.bindButton )
		end
		if not f15_local4.bindButton2 and f15_arg1.button_ref2 and f15_local2 then
			f15_local4.bindButton2 = LUI.UIBindButton.new()
			f15_local4.bindButton2.id = "BindButton2"
			f15_local4.bindButton2:registerEventHandler( f15_arg1.button_ref2, f15_local2 )
			f15_local4.bindButton2.func = f15_local2
			f15_local4:addElement( f15_local4.bindButton2 )
		end
		if f15_arg1.actionSFX and f15_local4.bindButton then
			f15_local4.bindButton:setActionSFX( f15_arg1.actionSFX )
		end
	end
	return f15_local4
end

function ClearHelperTextObjects( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg1.side == "all"
	if f16_arg1.side == "left" or f16_local0 then
		local f16_local1 = f16_arg0:getChildById( "left_button_helper_list_id" )
		f16_local1:closeChildren()
	end
	if f16_arg1.side == "top_right" or f16_local0 then
		local f16_local1 = f16_arg0:getParent()
		local f16_local2 = f16_local1:getParent()
		local f16_local3 = f16_local2:getChildById( "top_button_helper_text_main_id" )
		local f16_local4 = f16_local3:getChildById( "top_container" )
		local f16_local5 = f16_local4:getChildById( "top_right_button_helper_list_id" )
		f16_local5:closeChildren()
	end
	if f16_arg1.side == "right" or f16_local0 then
		local f16_local1 = f16_arg0:getChildById( "right_button_helper_list_id" )
		f16_local1:closeChildren()
	end
	return true
end

function ClearHelperTextObject( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg0:getFirstDescendentById( (f17_arg1.button_ref or f17_arg1.id) .. "_id" )
	if f17_local0 ~= nil then
		f17_local0:close()
	end
end

function sendButtonEvent( f18_arg0, f18_arg1 )
	if f18_arg0.triggers_event and f18_arg1.mouse == true then
		local f18_local0 = {
			name = "gamepad_button",
			immediate = true,
			down = true
		}
		assert( ButtonMap[f18_arg0.triggers_event].raw_button )
		f18_local0.button = ButtonMap[f18_arg0.triggers_event].raw_button
		f18_local0.controller = f18_arg1.controller
		f18_arg0:dispatchEventToRoot( f18_local0 )
	end
end

function helper_text_item( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4, f19_arg5, f19_arg6, f19_arg7, f19_arg8, f19_arg9, f19_arg10, f19_arg11, f19_arg12, f19_arg13, f19_arg14, f19_arg15, f19_arg16, f19_arg17, f19_arg18 )
	local f19_local0 = Engine.IsConsoleGame()
	if not f19_local0 then
		f19_local0 = Engine.IsGamepadEnabled()
	end
	local f19_local1 = f0_local0
	local f19_local2 = f19_local1.Height
	local f19_local3
	if f19_local0 then
		f19_local3 = 24
		if not f19_local3 then
		
		else
			local f19_local4, f19_local5 = nil
			local f19_local6 = 14
			local f19_local7 = 20
			local f19_local8 = f19_local7
			local f19_local9 = f19_local7
			local f19_local10 = false
			local f19_local11 = false
			local f19_local12 = f19_local3
			local f19_local13 = f19_local3
			local f19_local14 = 10
			if f19_arg12 then
				f19_arg1 = f19_arg12()
				assert( f19_arg1, "helper_text_func should return a string." )
			end
			if f0_local1 then
				f19_arg1 = Engine.ToUpperCase( f19_arg1 )
			end
			local f19_local15 = 0
			if f19_arg0 then
				if f19_local0 and f19_arg0.string then
					f19_local4 = Engine.Localize( f19_arg0.string )
					f19_local8 = f19_local6
				elseif f19_arg11 and f19_arg0.keyboard_mouse_string then
					f19_local4 = Engine.Localize( f19_arg0.keyboard_mouse_string )
				elseif f19_arg0.keyboard_string then
					f19_local4 = Engine.Localize( f19_arg0.keyboard_string )
					f19_local10 = true
				end
				if not f19_local0 then
					local f19_local16, f19_local17, f19_local18, f19_local19 = GetTextDimensions2( f19_local4, f19_local1.Font, f19_local1.Height )
					f19_local15 = f19_local18 - f19_local16
					if f19_local10 then
						f19_local15 = f19_local15 + 2 * LUI.UIButtonText.horizontalSpacing
						f19_local8 = f19_local8 - 2 * LUI.UIButtonText.verticalSpacing
						f19_local12 = f19_local12 + 2 * LUI.UIButtonText.verticalSpacing
					end
				end
			end
			local f19_local16 = 0
			if f19_arg2 then
				if f19_local0 and f19_arg2.string then
					f19_local5 = Engine.Localize( f19_arg2.string )
					f19_local9 = f19_local6
				elseif f19_arg11 and f19_arg2.keyboard_mouse_string then
					f19_local5 = Engine.Localize( f19_arg2.keyboard_mouse_string )
				elseif f19_arg2.keyboard_string then
					f19_local5 = Engine.Localize( f19_arg2.keyboard_string )
					f19_local11 = true
				end
				if not f19_local0 then
					local f19_local17, f19_local18, f19_local19, f19_local20 = GetTextDimensions2( f19_local5, f19_local1.Font, f19_local1.Height )
					f19_local16 = f19_local19 - f19_local17
					if f19_local11 then
						f19_local16 = f19_local16 + 2 * LUI.UIButtonText.horizontalSpacing
						f19_local9 = f19_local9 - 2 * LUI.UIButtonText.verticalSpacing
						f19_local13 = f19_local13 + 2 * LUI.UIButtonText.verticalSpacing
					end
				end
			end
			if f19_local0 then
				local f19_local17 = ""
				if f19_local4 then
					f19_local17 = f19_local4
				end
				if f19_local5 and f19_arg14 then
					f19_local17 = f19_local17 .. f19_local5
				end
				if f19_local17 ~= "" then
					f19_local17 = f19_local17 .. " " .. f19_arg1
				else
					f19_local17 = f19_arg1
				end
				if f19_local5 and not f19_arg14 then
					f19_local17 = f19_local17 .. " " .. f19_local5
				end
				f19_arg1 = f19_local17
			end
			local f19_local17 = f19_arg3
			local f19_local18, f19_local19, f19_local20, f19_local21 = GetTextDimensions2( f19_arg1, f19_local1.Font, f19_local1.Height )
			local f19_local22 = f19_local20 - f19_local18
			if not f19_arg3 then
				f19_local17 = f19_local15 + f19_local22 + f19_local16 + 25
				if f19_local10 then
					f19_local17 = f19_local17 + f19_local14
				end
				if f19_local11 then
					f19_local17 = f19_local17 + f19_local14
				end
			end
			f0_local2 = f0_local2 + f19_local17
			local self = LUI.UIButton.new()
			self.id = "helper_text_item"
			self:registerAnimationState( "default", {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = f19_local17,
				top = 0,
				bottom = 0,
				alpha = 1
			} )
			self.helpButtonWidth = f19_local17
			self.messageFunc = f19_arg12
			self:registerAnimationState( "hide", {
				alpha = 0
			} )
			self:animateToState( "default" )
			self.m_disableNavigation = true
			self.m_requireFocusType = FocusType.MouseOver
			self.m_focusable = f19_arg9
			self:registerEventHandler( "button_action", sendButtonEvent )
			self:registerEventHandler( "rebind", function ( element, event )
				if event.buttonLeft and event.buttonLeft == f19_arg0 then
					element.m_ignoreMouseFocus = nil
				end
			end )
			if f19_arg8 then
				self:registerEventHandler( f19_arg8, function ( element, event )
					if event.hide then
						element:animateToState( "hide" )
					else
						element:animateToState( "default" )
					end
				end )
			end
			if f19_arg5 then
				self:registerEventHandler( "popup_active", nil )
				self:registerEventHandler( "popup_inactive", nil )
			end
			local f19_local24 = 0
			if Engine.IsRightToLeftLanguage() then
				f19_local24 = -f19_local22
			end
			local self = nil
			if f19_local4 and not f19_local0 then
				local self = nil
				self = {
					font = f19_local1.Font,
					alignment = LUI.Alignment.Left,
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true,
					left = 0,
					right = f19_local24,
					top = f19_local8,
					height = f19_local12
				}
				if f19_local10 then
					self = LUI.UIButtonText.new( self, f19_local4, nil, nil, not f19_arg9, false, f19_arg17 )
				else
					self = LUI.UIText.new()
					self.id = "left"
					self:setText( f19_local4 )
					self:registerAnimationState( "default", CoD.ColorizeState( Colors.frontend_hilite, self ) )
					self:animateToState( "default" )
				end
				self:addElement( self )
			end
			local self = LUI.UIText.new()
			self.id = "helper_text_text"
			self:setText( f19_arg1 )
			self:registerEventHandler( "update_message", function ( element, event )
				element:setText( event.message )
				self.currentText = event.message
			end )
			local f19_local27 = f19_arg13 or Colors.h1.second_medium_grey
			if f19_arg15 ~= nil and f19_arg15 ~= "" then
				self:setupUIBindText( f19_arg15 )
			end
			local f19_local28
			if f19_local0 then
				f19_local28 = 0
				if not f19_local28 then
				
				else
					f19_local28
					if f19_local10 then
						f19_local28 = f19_local28 + f19_local14
					end
					if f19_arg14 and f19_local11 then
						f19_local28 = f19_local28 + f19_local14
					end
					local f19_local29 = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						left = f19_local28,
						right = 0,
						top = f19_local7,
						height = f19_local2,
						font = f19_local1.Font,
						alignment = LUI.Alignment.Left,
						glow = f19_arg7
					}
					if f19_arg14 and not f19_local0 then
						f19_local29.left = f19_local29.left + f19_local16
					end
					self:registerAnimationState( "default", CoD.ColorizeState( f19_local27, f19_local29 ) )
					self:animateToState( "default" )
					local self = self.properties
					if not self then
						self = {}
					end
					self.properties = self
					if f19_arg9 then
						self = Colors.h1.light_green
						if f19_local10 or f19_local11 then
							self = Colors.white
						end
						self.listenMouseEnterLeave = true
						self:registerAnimationState( "over", CoD.ColorizeState( self ) )
						self:registerEventHandler( "lose_focus", MBh.AnimateToState( "default" ) )
						self:registerEventHandler( "gain_focus", MBh.AnimateToState( "over" ) )
					else
						self.properties.muteAction = true
					end
					self = self.properties
					local self
					if f19_arg16 == nil then
						self = self.properties.muteAction
						if not self then
						
						else
							self.muteAction = self
							self.currentText = f19_arg1
							self:addElement( self )
							self = nil
							if f19_local5 and not f19_local0 then
								self = f19_local15
								if f19_local10 and not f19_arg14 then
									self = self + f19_local14
								end
								local f19_local32 = {
									font = f19_local1.Font,
									alignment = LUI.Alignment.Left,
									topAnchor = true,
									bottomAnchor = false,
									leftAnchor = true,
									rightAnchor = true,
									left = self,
									right = 0,
									top = f19_local9,
									height = f19_local13
								}
								if not f19_arg14 and not f19_local0 then
									f19_local32.left = f19_local32.left + f19_local22
								end
								if f19_local11 then
									f19_local32.left = f19_local32.left + f19_local14
									self = LUI.UIButtonText.new( f19_local32, f19_local5, nil, nil, not f19_arg9, false, f19_arg18 )
								else
									self = LUI.UIText.new()
									self.id = "right"
									self:setText( f19_local5 )
									self:registerAnimationState( "default", CoD.ColorizeState( Colors.frontend_hilite, f19_local32 ) )
									self:animateToState( "default" )
								end
								self:addElement( self )
							end
							if f19_arg6 then
								self = LUI.UIImage.new()
								self:registerAnimationState( "default", {
									topAnchor = true,
									bottomAnchor = false,
									leftAnchor = true,
									rightAnchor = false,
									left = f19_local22,
									width = f19_local3,
									top = f19_local8 - f19_local1.Height / 2,
									height = f19_local3,
									material = RegisterMaterial( f19_arg6 )
								} )
								self:animateToState( "default" )
								self:addElement( self )
							end
							if f19_arg4 then
								self:setPriority( f19_arg4 )
							end
							return self
						end
					end
					self = f19_arg16
				end
			end
			f19_local28 = f19_local15
		end
	end
	f19_local3 = f19_local2
end

function button_helper_text_main()
	f0_local2 = 0
	return {
		type = "UIElement",
		id = "button_helper_text_main_root_id",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true
			}
		},
		children = {
			{
				type = "UIElement",
				id = "button_helper_text_main_id",
				properties = {
					left_inset = DesignGridDims.horz_gutter,
					right_inset = -42,
					top_margin = GenericFooterDims.TopMargin_WithBackground,
					bottom_margin = -35,
					height = GenericFooterDims.Height,
					spacing = -3,
					background_alpha = 1,
					background_panel_alpha = 0.35
				},
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = false,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = MBh.Property( "top_margin" ),
						bottom = 0,
						alpha = 1
					},
					hidden = {
						alpha = 0
					}
				},
				handlers = {
					show_button_helper_text = MBh.AnimateToState( "default" ),
					hide_button_helper_text = MBh.AnimateToState( "hidden" ),
					menu_create = function ( f24_arg0, f24_arg1 )
						local f24_local0 = f24_arg0:getParent()
						if f24_local0.skipAnim then
							f24_arg0:animateToState( "default" )
						else
							f24_local0 = MBh.AnimateSequence( {
								{
									"hidden",
									0
								},
								{
									"hidden",
									GenericMenuAnimationSettings.ButtonHelper.Delay
								},
								{
									"default",
									GenericMenuAnimationSettings.ButtonHelper.Duration,
									false,
									true
								}
							} )
							f24_local0( f24_arg0 )
						end
					end
					
				},
				children = {
					{
						type = "UIText",
						id = "ds_text",
						properties = {
							text = "",
							background_alpha = MBh.Property( "background_alpha" )
						},
						states = {
							default = CoD.ColorizeState( Colors.build_number, {
								leftAnchor = false,
								rightAnchor = true,
								topAnchor = false,
								bottomAnchor = true,
								left = 0,
								right = -70,
								bottom = -10,
								height = f0_local0.Height,
								font = f0_local0.Font,
								alignment = LUI.Alignment.Right,
								alpha = 0
							} ),
							visible = {
								alpha = MBh.Property( "background_alpha" )
							}
						},
						handlers = {
							menu_create = MBh.EmitEvent( "update_ds_text" ),
							update_ds_text = function ( f25_arg0, f25_arg1 )
								if Engine.GetDvarBool( "ds_info_enable" ) then
									f25_arg0:animateToState( "visible" )
									f25_arg0:setText( Engine.GetDvarString( "ds_info" ) or "" )
								else
									f25_arg0:animateToState( "default" )
								end
							end
							
						},
						children = {
							{
								type = "UITimer",
								id = "ds_text_refresh_timer",
								properties = {
									event = {
										name = "update_ds_text"
									},
									interval = 1000
								}
							}
						}
					},
					{
						type = "UIElement",
						id = "container",
						properties = {
							height = MBh.Property( "height" ),
							spacing = MBh.Property( "spacing" ),
							left_inset = MBh.Property( "left_inset" ),
							right_inset = MBh.Property( "right_inset" )
						},
						states = {
							default = {
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = false,
								left = 0,
								right = 0,
								top = 0,
								height = MBh.Property( "height" )
							}
						},
						children = {
							{
								type = "UIHorizontalList",
								id = "left_button_helper_list_id",
								properties = {
									spacing = MBh.Property( "spacing" ),
									left_inset = MBh.Property( "left_inset" )
								},
								states = {
									default = {
										leftAnchor = true,
										rightAnchor = true,
										topAnchor = true,
										bottomAnchor = true,
										left = MBh.Property( "left_inset" ),
										right = 0,
										top = 0,
										bottom = 0,
										alignment = LUI.Alignment.Left,
										spacing = MBh.Property( "spacing" )
									}
								}
							},
							{
								type = "UIHorizontalList",
								id = "right_button_helper_list_id",
								properties = {
									spacing = MBh.Property( "spacing" ),
									right_inset = MBh.Property( "right_inset" )
								},
								states = {
									default = {
										leftAnchor = true,
										rightAnchor = true,
										topAnchor = true,
										bottomAnchor = true,
										left = 0,
										right = MBh.Property( "right_inset" ),
										top = 0,
										bottom = 0,
										alignment = LUI.Alignment.Right,
										spacing = MBh.Property( "spacing" )
									}
								}
							}
						},
						handlers = {
							add_button_helper_text = AddHelperTextObject,
							clear_button_helper_text = ClearHelperTextObjects,
							add_sign_in_text = AddSignInText
						}
					}
				}
			},
			{
				type = "UIElement",
				id = "top_button_helper_text_main_id",
				properties = {
					left_inset = 75,
					right_inset = -75,
					height = GenericFooterDims.Height,
					spacing = 9
				},
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = false,
						left = 0,
						right = 0,
						top = 0,
						bottom = 0,
						alpha = 1
					},
					hidden = {
						alpha = 0
					}
				},
				children = {
					{
						type = "UIElement",
						id = "top_container",
						properties = {
							height = MBh.Property( "height" ),
							spacing = MBh.Property( "spacing" ),
							left_inset = S1MenuDims.safe_area_horz - 20,
							right_inset = -S1MenuDims.safe_area_horz - 20
						},
						states = {
							default = {
								leftAnchor = true,
								rightAnchor = true,
								topAnchor = true,
								bottomAnchor = false,
								left = 0,
								right = 0,
								top = S1MenuDims.safe_area_vert,
								height = MBh.Property( "height" )
							}
						},
						children = {
							{
								type = "UIHorizontalList",
								id = "top_right_button_helper_list_id",
								properties = {
									spacing = MBh.Property( "spacing" ),
									right_inset = -S1MenuDims.safe_area_horz - 20
								},
								states = {
									default = {
										leftAnchor = true,
										rightAnchor = true,
										topAnchor = true,
										bottomAnchor = true,
										left = 0,
										right = -S1MenuDims.safe_area_horz - 17,
										top = 0,
										bottom = 0,
										alignment = LUI.Alignment.Right,
										spacing = MBh.Property( "spacing" )
									}
								}
							}
						}
					}
				}
			}
		}
	}
end

LUI.MenuBuilder.registerDef( "button_helper_text_main", button_helper_text_main )
LockTable( _M )
