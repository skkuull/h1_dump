local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.OptionsLayout = InheritFrom( LUI.UIElement )
ControllerFont = CoD.TextSettings.BodyFontTiny
debugPlaystation = false
function IsPS4Controller()
	return Engine.IsPS4Controller and Engine.IsPS4Controller() or Engine.IsPS4()
end

function GetSticksConfig()
	return Engine.GetProfileData( "gpadSticksConfig" )
end

function SetSticksConfig( f3_arg0, f3_arg1 )
	Engine.ExecNow( "profile_setSticksConfig " .. f3_arg0.properties.layout_name, f3_arg1.controller )
end

function GetButtonsConfig()
	return Engine.GetProfileData( "gpadButtonsConfig" )
end

function SetButtonsConfig( f5_arg0, f5_arg1 )
	Engine.ExecNow( "profile_setButtonsConfig " .. f5_arg0.properties.layout_name, f5_arg1.controller )
end

function isSplitScreenPS3()
	if Engine.IsMultiplayer() and not Engine.InFrontend() and GameX.IsSplitscreen() and Engine.IsPS3() then
		return true
	else
		return false
	end
end

stickBoxW = 150
stickBoxH = 78
stickBoxWSplitScreen = 250
stickBoxSplitBuffer = 20
function stick_box_line( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0, f7_local1 = nil
	if isSplitScreenPS3() then
		f7_local0 = ControllerFont.Font
		f7_local1 = ControllerFont.Height
	else
		f7_local0 = ControllerFont.Font
		f7_local1 = ControllerFont.Height
	end
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = -8,
		right = 25,
		top = 0,
		bottom = 17
	} )
	self.id = "stick_text_box_line" .. f7_arg1
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 14,
		left = 10,
		right = 24,
		material = RegisterMaterial( f7_arg0 ),
		zRot = f7_arg2
	} ) )
	local f7_local3 = 4
	if Engine.IsRightToLeftLanguage() or Engine.IsAsianLanguage() then
		f7_local3 = 0
	end
	local f7_local4 = {
		font = f7_local0,
		horizontalAlignment = LUI.HorizontalAlignment.RTL_ForcedLeft,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 37,
		right = 0,
		top = f7_local3,
		bottom = f7_local3 + f7_local1,
		color = Colors.white
	}
	local self = LUI.UIText.new( f7_local4 )
	f7_local4.color = Colors.h1.light_green
	self:registerAnimationState( "highlighted", f7_local4 )
	self:registerEventHandler( "highlight", MBh.AnimateToState( "highlighted", 0 ) )
	if f7_arg1 == "@MENU_LOOK_UP" or f7_arg1 == "@MENU_LOOK_DOWN" then
		self:registerEventHandler( "look_inversion_highlight", MBh.AnimateToState( "highlighted", 0 ) )
	end
	self:registerEventHandler( "restore", MBh.AnimateToState( "default", 0 ) )
	self:setText( Engine.Localize( f7_arg1 ) )
	self:addElement( self )
	return self
end

function stick_box_content( menu, controller )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
		alpha = 0,
		spacing = 0
	} )
	self:registerAnimationState( "visible", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
		alpha = 1,
		spacing = 0
	} )
	self.id = "vlist_" .. menu
	self:registerEventHandler( "hide_texts", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "show_" .. menu, MBh.AnimateToState( "visible", 0 ) )
	local f8_local1 = "h1_deco_option_arrow_controller"
	local f8_local2 = {
		-90,
		90,
		180,
		0
	}
	for f8_local6, f8_local7 in ipairs( controller ) do
		self:addElement( stick_box_line( f8_local1, f8_local7, f8_local2[f8_local6] ) )
	end
	return self
end

function stick_box( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	self:addElement( LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.5
	} ) )
	self.id = menu
	for f9_local4, f9_local5 in ipairs( controller ) do
		self:addElement( stick_box_content( f9_local5.name, f9_local5.controls ) )
		DebugPrint( f9_local5.name )
	end
	return self
end

function left_stick_box( f10_arg0, f10_arg1 )
	local f10_local0 = stick_box( "left_stick_box", f10_arg0 )
	local f10_local1 = {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false
	}
	if Engine.IsVita( f10_arg1 ) then
		f10_local1.top = 40
		f10_local1.left = -199
	elseif IsPS4Controller() then
		f10_local1.top = 154
		f10_local1.left = 0
	elseif Engine.IsXB3() or Engine.IsPC() then
		f10_local1.top = 20
		f10_local1.left = -125
	else
		f10_local1.top = -70
		f10_local1.left = -115
	end
	if isSplitScreenPS3() then
		f10_local1.top = 30
		f10_local1.left = -175 + stickBoxSplitBuffer
		f10_local1.bottom = f10_local1.top + stickBoxH
		f10_local1.right = f10_local1.left + stickBoxWSplitScreen
	else
		f10_local1.bottom = f10_local1.top + stickBoxH
		f10_local1.right = f10_local1.left + stickBoxW
	end
	f10_local0:registerAnimationState( "default", f10_local1 )
	f10_local0:animateToState( "default" )
	return f10_local0
end

function right_stick_box( f11_arg0, f11_arg1 )
	local f11_local0 = stick_box( "right_stick_box", f11_arg0 )
	local f11_local1 = {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true
	}
	if Engine.IsVita( f11_arg1 ) then
		f11_local1.top = -115
		f11_local1.left = -276
	elseif IsPS4Controller() then
		f11_local1.top = 29
		f11_local1.left = -130
	elseif Engine.IsXB3() or Engine.IsPC() then
		f11_local1.top = 18
		f11_local1.left = -110
	else
		f11_local1.top = 0
		f11_local1.left = 5
	end
	if isSplitScreenPS3() then
		f11_local1.bottom = f11_local1.top + stickBoxH
		f11_local1.right = f11_local1.left + stickBoxWSplitScreen
	else
		f11_local1.bottom = f11_local1.top + stickBoxH
		f11_local1.right = f11_local1.left + stickBoxW
	end
	f11_local0:registerAnimationState( "default", f11_local1 )
	f11_local0:animateToState( "default" )
	return f11_local0
end

function createBoxes( f12_arg0, f12_arg1 )
	f12_arg0:closeChildren()
	local f12_local0 = "@MENU_LOOK_UP"
	local f12_local1 = "@MENU_LOOK_DOWN"
	if Engine.IsPitchInverted and Engine.IsPitchInverted( f12_arg1 ) then
		local f12_local2 = f12_local0
		f12_local0 = f12_local1
		f12_local1 = f12_local2
	end
	f12_arg0:addElement( left_stick_box( {
		{
			name = "thumbstick_default",
			controls = {
				"@MENU_MOVE_FORWARD",
				"@MENU_MOVE_BACK",
				"@LUA_MENU_STRAFE_RIGHT",
				"@LUA_MENU_STRAFE_LEFT"
			}
		},
		{
			name = "thumbstick_southpaw",
			controls = {
				f12_local0,
				f12_local1,
				"@LUA_MENU_ROTATE_RIGHT",
				"@LUA_MENU_ROTATE_LEFT"
			}
		},
		{
			name = "thumbstick_legacy",
			controls = {
				"@MENU_MOVE_FORWARD",
				"@MENU_MOVE_BACK",
				"@LUA_MENU_ROTATE_RIGHT",
				"@LUA_MENU_ROTATE_LEFT"
			}
		},
		{
			name = "thumbstick_legacysouthpaw",
			controls = {
				f12_local0,
				f12_local1,
				"@LUA_MENU_STRAFE_RIGHT",
				"@LUA_MENU_STRAFE_LEFT"
			}
		}
	}, f12_arg1 ) )
	f12_arg0:addElement( right_stick_box( {
		{
			name = "thumbstick_default",
			controls = {
				f12_local0,
				f12_local1,
				"@LUA_MENU_ROTATE_RIGHT",
				"@LUA_MENU_ROTATE_LEFT"
			}
		},
		{
			name = "thumbstick_southpaw",
			controls = {
				"@MENU_MOVE_FORWARD",
				"@MENU_MOVE_BACK",
				"@LUA_MENU_STRAFE_RIGHT",
				"@LUA_MENU_STRAFE_LEFT"
			}
		},
		{
			name = "thumbstick_legacy",
			controls = {
				f12_local0,
				f12_local1,
				"@LUA_MENU_STRAFE_RIGHT",
				"@LUA_MENU_STRAFE_LEFT"
			}
		},
		{
			name = "thumbstick_legacysouthpaw",
			controls = {
				"@MENU_MOVE_FORWARD",
				"@MENU_MOVE_BACK",
				"@LUA_MENU_ROTATE_RIGHT",
				"@LUA_MENU_ROTATE_LEFT"
			}
		}
	}, f12_arg1 ) )
end

function sticks_texts_overlay( f13_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	self.id = "sticks_texts_overlay"
	createBoxes( self, f13_arg0 )
	return self
end

function sticks_overlay( f14_arg0 )
	local f14_local0 = {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		alpha = 1
	}
	if Engine.IsVita( f14_arg0 ) then
		f14_local0.top = 73.33
		f14_local0.left = 83.33
	elseif IsPS4Controller() then
		f14_local0.top = 101.33
		f14_local0.left = 16.67
	elseif Engine.IsXB3() or Engine.IsPC() then
		f14_local0.top = 136.67
		f14_local0.left = 0
	else
		f14_local0.top = 146.67
		f14_local0.left = 3.33
	end
	if Engine.IsVita( f14_arg0 ) then
		f14_local0.bottom = f14_local0.top + 140
		f14_local0.right = f14_local0.left + 558
	else
		f14_local0.bottom = f14_local0.top + 125.33
		f14_local0.right = f14_local0.left + 341.33
	end
	local self = LUI.UIElement.new( f14_local0 )
	self.textOverlay = sticks_texts_overlay( f14_arg0 )
	self:addElement( self.textOverlay )
	return self
end

function updateContainerSizeToText( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0, f15_local1, f15_local2, f15_local3 = GetTextDimensions( f15_arg1, ControllerFont.Font, ControllerFont.Height )
	local f15_local4 = 12
	local f15_local5 = 5
	local f15_local6, f15_local7, f15_local8, f15_local9 = nil
	if f15_arg2.alignmentX == LUI.Alignment.Left then
		f15_local6 = f15_arg2.x
		f15_local8 = f15_arg2.x + f15_local2 + f15_local4
	elseif f15_arg2.alignmentX == LUI.Alignment.Center then
		f15_local6 = f15_arg2.x - f15_local2 / 2 - f15_local4 / 2
		f15_local8 = f15_arg2.x + f15_local2 / 2 + f15_local4 / 2
	elseif f15_arg2.alignmentX == LUI.Alignment.Right then
		f15_local6 = f15_arg2.x - f15_local2 - f15_local4
		f15_local8 = f15_arg2.x
	end
	if f15_arg2.alignmentY == LUI.Alignment.Top then
		f15_local7 = f15_arg2.y
		f15_local9 = f15_arg2.y + f15_local1 + f15_local5
	elseif f15_arg2.alignmentY == LUI.Alignment.Middle then
		f15_local7 = f15_arg2.y - f15_local1 / 2 - f15_local5 / 2
		f15_local9 = f15_arg2.y + f15_local1 / 2 + f15_local5 / 2
	elseif f15_arg2.alignmentY == LUI.Alignment.Bottom then
		f15_local7 = f15_arg2.y - f15_local1 - f15_local5
		f15_local9 = f15_arg2.y
	end
	f15_arg0:registerAnimationState( "default", CoD.CreateState( f15_local6, f15_local7, f15_local8, f15_local9, CoD.AnchorTypes.TopLeft ) )
	f15_arg0:animateToState( "default" )
end

function button_text_overlay( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	local f16_local0 = LUI.FlowManager.GetTopMenuScopedData()
	local f16_local1 = f16_local0.exclusiveController
	if not f16_local1 then
		f16_local1 = Engine.GetSignedInAsController()
	end
	local f16_local2 = nil
	if Engine.UsingSplitscreenUpscaling() and f16_arg3 then
		if Engine.IsVita( f16_local1 ) and f16_arg3.vita then
			f16_local2 = f16_arg3.vita
		elseif IsPS4Controller() and f16_arg3.ps4 then
			f16_local2 = f16_arg3.ps4
		else
			f16_local2 = f16_arg3.xb3ANDpc
		end
	end
	if f16_local2 == nil then
		if Engine.IsVita( f16_local1 ) then
			f16_local2 = f16_arg2.vita
		elseif IsPS4Controller() then
			f16_local2 = f16_arg2.ps4
		else
			f16_local2 = f16_arg2.xb3ANDpc
		end
	end
	local self = LUI.UIElement.new()
	local f16_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f16_local4.material = RegisterMaterial( "black" )
	f16_local4.alpha = 0.5
	local self = LUI.UIImage.new( f16_local4 )
	if f16_arg0 ~= "A" and f16_arg0 ~= "B" and f16_arg0 ~= "X" and f16_arg0 ~= "Y" then
		self:addElement( self )
	end
	local f16_local6 = 1
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f16_local6 = 0
	end
	local f16_local7 = {
		font = ControllerFont.Font,
		alignment = LUI.Alignment.Center,
		left = 0,
		top = -ControllerFont.Height / 2 + f16_local6,
		right = 0,
		bottom = ControllerFont.Height / 2 + f16_local6,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = false,
		color = Colors.white
	}
	if f16_arg0 == "A" or f16_arg0 == "B" or f16_arg0 == "X" or f16_arg0 == "Y" then
		f16_local7.alignment = LUI.Alignment.Middle
	end
	local self = LUI.UIText.new( f16_local7 )
	self:setupAutoScaleText()
	f16_local7.color = Colors.h1.light_green
	self:registerAnimationState( "highlighted", f16_local7 )
	if f16_arg0 ~= "DPAD" and f16_arg0 ~= "back" and f16_arg0 ~= "start" and f16_arg0 ~= "Y" and f16_arg0 ~= "X" then
		self:registerEventHandler( "highlight", MBh.AnimateToState( "highlighted", 0 ) )
	end
	if f16_arg0 == "LB" or f16_arg0 == "LT" or f16_arg0 == "RB" or f16_arg0 == "RT" then
		self:registerEventHandler( "flipped_button_highlight", MBh.AnimateToState( "highlighted", 0 ) )
	end
	if f16_arg0 == "LS" or f16_arg0 == "RS" then
		self:registerEventHandler( "highlight_for_sticks", MBh.AnimateToState( "highlighted", 0 ) )
	end
	self:registerEventHandler( "restore", MBh.AnimateToState( "default", 0 ) )
	self:addElement( self )
	local f16_local9 = Engine.IsPS4()
	if f16_local9 then
		f16_local9 = Engine.IsAsianLanguage()
	end
	for f16_local13, f16_local14 in ipairs( f16_arg1 ) do
		self:registerEventHandler( "show_" .. f16_local14.name, function ( element, event )
			local f17_local0 = ""
			if f16_arg0 == "A" then
				if f16_local9 then
					local f17_local1 = Engine.Localize( "@LUA_MENU_PAD_SECONDARY_BUTTON" ) .. " "
				end
				f17_local0 = f17_local1 or Engine.Localize( "@LUA_MENU_PAD_PRIMARY_BUTTON" ) .. " "
			elseif f16_arg0 == "B" then
				if f16_local9 then
					local f17_local2 = Engine.Localize( "@LUA_MENU_PAD_PRIMARY_BUTTON" ) .. " "
				end
				f17_local0 = f17_local2 or Engine.Localize( "@LUA_MENU_PAD_SECONDARY_BUTTON" ) .. " "
			elseif f16_arg0 == "X" then
				f17_local0 = Engine.Localize( "@LUA_MENU_PAD_ALT1_BUTTON" ) .. " "
			elseif f16_arg0 == "Y" then
				f17_local0 = Engine.Localize( "@LUA_MENU_PAD_ALT2_BUTTON" ) .. " "
			end
			local f17_local3 = f16_arg4
			if not f17_local3 then
				f17_local3 = f17_local0 .. Engine.Localize( f16_local14.text )
			end
			element:setText( f17_local3 )
			updateContainerSizeToText( self, f17_local3, f16_local2 )
		end )
	end
	return self
end

function buttons_texts_overlay( f18_arg0 )
	local f18_local0 = not Engine.IsMultiplayer()
	local f18_local1 = "@WEAPON_VARIABLE_GRENADE_LETHAL"
	local f18_local2 = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
	if not f18_local0 or not "@MENU_THROW_SPECIAL_GRENADE" then
		local f18_local3 = "@MENU_INVENTORY"
	end
	local f18_local4
	if f18_local0 then
		f18_local4 = "@LUA_MENU_NOT_USED"
		if not f18_local4 then
		
		else
			local f18_local5 = "@MENU_OBJECTIVES_MENU"
			local self = LUI.UIElement.new( {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				left = 0,
				right = 0,
				top = 0,
				bottom = 0
			} )
			local f18_local7 = {
				{
					name = "buttons_default",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_tactical",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_lefty",
					text = "@MENU_MELEE_HOLD_BREATH"
				},
				{
					name = "buttons_lefty_regular",
					text = "@MENU_MELEE_CHANGE_ZOOM"
				},
				{
					name = "buttons_nomad",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@MENU_SPRINT_CHANGE_ZOOM"
				},
				{
					name = "buttons_charlie",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_stick_and_move",
					text = "@MENU_SPRINT_HOLD_BREATH"
				}
			}
			local f18_local8 = {
				{
					name = "buttons_default",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_tactical",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_lefty",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_lefty_regular",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_nomad",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_charlie",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_JUMP"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_JUMP"
				},
				{
					name = "buttons_stick_and_move",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				}
			}
			local f18_local9 = {
				{
					name = "buttons_default",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_tactical",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_lefty",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_lefty_regular",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_nomad",
					text = "@MENU_TOGGLE_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_charlie",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_stick_and_move",
					text = "@MENU_AIM_DOWN_SIGHT"
				}
			}
			local f18_local10 = {
				{
					name = "buttons_default",
					text = "@MENU_MELEE_CHANGE_ZOOM"
				},
				{
					name = "buttons_tactical",
					text = "@MENU_CROUCH_PRONE"
				},
				{
					name = "buttons_lefty",
					text = "@MENU_SPRINT_CHANGE_ZOOM"
				},
				{
					name = "buttons_lefty_regular",
					text = "@MENU_SPRINT_HOLD_BREATH"
				},
				{
					name = "buttons_nomad",
					text = "@MENU_CROUCH_PRONE"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@MENU_CROUCH_PRONE"
				},
				{
					name = "buttons_charlie",
					text = "@MENU_MELEE_CHANGE_ZOOM"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@MENU_MELEE_CHANGE_ZOOM"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_MELEE_CHANGE_ZOOM"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_CROUCH_PRONE"
				},
				{
					name = "buttons_stick_and_move",
					text = "@MENU_JUMP"
				}
			}
			local f18_local11 = {
				{
					name = "buttons_default",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_tactical",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_lefty",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_lefty_regular",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_nomad",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@MENU_TOGGLE_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_charlie",
					text = "@MENU_TOGGLE_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_stick_and_move",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				}
			}
			local f18_local12 = {
				{
					name = "buttons_default",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_tactical",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_lefty",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_lefty_regular",
					text = "@MENU_AIM_DOWN_SIGHT"
				},
				{
					name = "buttons_nomad",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_charlie",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@WEAPON_VARIABLE_GRENADE_LETHAL"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_FIRE_WEAPON"
				},
				{
					name = "buttons_stick_and_move",
					text = "@MENU_FIRE_WEAPON"
				}
			}
			local f18_local13 = {
				{
					name = "buttons_default",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_tactical",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_lefty",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_lefty_regular",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_nomad",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_charlie",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_ACTION_INVENTORY"
				},
				{
					name = "buttons_stick_and_move",
					text = "@MENU_ACTION_INVENTORY"
				}
			}
			local f18_local14 = {
				{
					name = "buttons_default",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_tactical",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_lefty",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_lefty_regular",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_nomad",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_nomad_tactical",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_charlie",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_bumper_jumper",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = "@MENU_UNDERBARREL"
				},
				{
					name = "buttons_stick_and_move",
					text = "@MENU_UNDERBARREL"
				}
			}
			local f18_local15 = {
				{
					name = "buttons_default",
					text = f18_local4
				},
				{
					name = "buttons_tactical",
					text = f18_local4
				},
				{
					name = "buttons_lefty",
					text = f18_local4
				},
				{
					name = "buttons_lefty_regular",
					text = f18_local4
				},
				{
					name = "buttons_nomad",
					text = f18_local4
				},
				{
					name = "buttons_nomad_tactical",
					text = f18_local4
				},
				{
					name = "buttons_charlie",
					text = f18_local4
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = f18_local4
				},
				{
					name = "buttons_bumper_jumper",
					text = f18_local4
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = f18_local4
				},
				{
					name = "buttons_stick_and_move",
					text = f18_local4
				}
			}
			local f18_local16 = {
				{
					name = "buttons_default",
					text = f18_local5
				},
				{
					name = "buttons_tactical",
					text = f18_local5
				},
				{
					name = "buttons_lefty",
					text = f18_local5
				},
				{
					name = "buttons_lefty_regular",
					text = f18_local5
				},
				{
					name = "buttons_nomad",
					text = f18_local5
				},
				{
					name = "buttons_nomad_tactical",
					text = f18_local5
				},
				{
					name = "buttons_charlie",
					text = f18_local5
				},
				{
					name = "buttons_one-hand_gunslinger",
					text = f18_local5
				},
				{
					name = "buttons_bumper_jumper",
					text = f18_local5
				},
				{
					name = "buttons_bumper_jumper_tact",
					text = f18_local5
				},
				{
					name = "buttons_stick_and_move",
					text = f18_local5
				}
			}
			for f18_local28, f18_local27 in ipairs( {
				f18_local7,
				f18_local8,
				f18_local9,
				f18_local10,
				f18_local11,
				f18_local12,
				f18_local13,
				f18_local15,
				f18_local16
			} ) do
				local f18_local20 = f18_local27
				if f18_local27 == f18_local9 then
					f18_local20 = f18_local8
				elseif f18_local27 == f18_local12 then
					f18_local20 = f18_local11
				elseif f18_local27 == f18_local8 then
					f18_local20 = f18_local9
				elseif f18_local27 == f18_local11 then
					f18_local20 = f18_local12
				end
				local f18_local21 = {}
				for f18_local25, f18_local26 in ipairs( f18_local20 ) do
					table.insert( f18_local21, {
						name = f18_local26.name .. "_alt",
						text = f18_local26.text
					} )
				end
				f18_local27 = LUI.ConcatenateToTable( f18_local27, f18_local21 )
			end
			if Engine.IsPS3() or debugPlaystation then
				f18_local17 = f18_local12
				f18_local12 = f18_local11
				f18_local11 = f18_local17
				f18_local18 = f18_local9
				f18_local9 = f18_local8
				f18_local8 = f18_local18
			end
			f18_local17 = function ()
				local f19_local0 = f18_local10
				f18_local10 = f18_local7
				f18_local7 = f19_local0
			end
			
			if IsCurrentSticksLayoutSouthpaw() or IsCurrentSticksLayoutLegacySouthpaw() then
				f18_local17()
			end
			f18_local18 = function ()
				local overlayLS = button_text_overlay( "LS", f18_local7, {
					xb3ANDpc = {
						x = 13,
						y = 151,
						alignmentX = LUI.Alignment.Right,
						alignmentY = LUI.Alignment.Middle
					},
					ps4 = {
						x = 63,
						y = 230,
						alignmentX = LUI.Alignment.Right,
						alignmentY = LUI.Alignment.Middle
					},
					vita = {
						x = 180,
						y = 375,
						alignmentX = LUI.Alignment.Right,
						alignmentY = LUI.Alignment.Middle
					}
				} )
				self:addElement( overlayLS )
				self.overlayLS = overlayLS
				
				local overlayRS = button_text_overlay( "RS", f18_local10, {
					xb3ANDpc = {
						x = 333,
						y = 258,
						alignmentX = LUI.Alignment.Left,
						alignmentY = LUI.Alignment.Middle
					},
					ps4 = {
						x = 322,
						y = 230,
						alignmentX = LUI.Alignment.Left,
						alignmentY = LUI.Alignment.Middle
					},
					vita = {
						x = 270,
						y = 375,
						alignmentX = LUI.Alignment.Left,
						alignmentY = LUI.Alignment.Middle
					}
				} )
				self:addElement( overlayRS )
				self.overlayRS = overlayRS
				
			end
			
			f18_local18()
			self:addElement( button_text_overlay( "LB", f18_local8, {
				xb3ANDpc = {
					x = 50,
					y = 53,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Top
				},
				ps4 = {
					x = 53,
					y = 44,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Top
				},
				vita = {
					x = 150,
					y = 220,
					alignmentX = LUI.Alignment.Center,
					alignmentY = LUI.Alignment.Top
				}
			} ) )
			self:addElement( button_text_overlay( "LT", f18_local9, {
				xb3ANDpc = {
					x = 50,
					y = 45,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Bottom
				},
				ps4 = {
					x = 53,
					y = 37,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Bottom
				},
				vita = {
					x = 120,
					y = 40,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Bottom
				}
			} ) )
			self:addElement( button_text_overlay( "RT", f18_local12, {
				xb3ANDpc = {
					x = 330,
					y = 45,
					alignmentX = LUI.Alignment.Left,
					alignmentY = LUI.Alignment.Bottom
				},
				ps4 = {
					x = 333,
					y = 37,
					alignmentX = LUI.Alignment.Left,
					alignmentY = LUI.Alignment.Bottom
				},
				vita = {
					x = 346,
					y = 40,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Bottom
				}
			} ) )
			self:addElement( button_text_overlay( "RB", f18_local11, {
				xb3ANDpc = {
					x = 330,
					y = 53,
					alignmentX = LUI.Alignment.Left,
					alignmentY = LUI.Alignment.Top
				},
				ps4 = {
					x = 333,
					y = 44,
					alignmentX = LUI.Alignment.Left,
					alignmentY = LUI.Alignment.Top
				},
				vita = {
					x = 303,
					y = 220,
					alignmentX = LUI.Alignment.Center,
					alignmentY = LUI.Alignment.Top
				}
			} ) )
			self:addElement( button_text_overlay( "DPAD", f18_local13, {
				xb3ANDpc = {
					x = 135,
					y = 310,
					alignmentX = LUI.Alignment.Center,
					alignmentY = LUI.Alignment.Top
				},
				ps4 = {
					x = 18,
					y = 118,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Middle
				},
				vita = {
					x = 60,
					y = 85,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Middle
				}
			} ) )
			if not Engine.IsVita( f18_arg0 ) then
				self:addElement( button_text_overlay( "back", f18_local15, {
					xb3ANDpc = {
						x = 163,
						y = 67,
						alignmentX = LUI.Alignment.Center,
						alignmentY = LUI.Alignment.Bottom
					},
					ps4 = {
						x = 193,
						y = 52,
						alignmentX = LUI.Alignment.Center,
						alignmentY = LUI.Alignment.Middle
					},
					vita = {
						x = 225,
						y = 114,
						alignmentX = LUI.Alignment.Center,
						alignmentY = LUI.Alignment.Middle
					}
				} ) )
			end
			self:addElement( button_text_overlay( "start", f18_local16, {
				xb3ANDpc = {
					x = 222,
					y = 43,
					alignmentX = LUI.Alignment.Center,
					alignmentY = LUI.Alignment.Bottom
				},
				ps4 = {
					x = 241,
					y = 37,
					alignmentX = LUI.Alignment.Right,
					alignmentY = LUI.Alignment.Bottom
				},
				vita = {
					x = 390,
					y = 185,
					alignmentX = LUI.Alignment.Left,
					alignmentY = LUI.Alignment.Top
				}
			} ) )
			self:registerEventHandler( "swap_sticks_buttons", function ()
				self:removeElement( self.overlayRS )
				self.overlayRS = nil
				self:removeElement( self.overlayLS )
				self.overlayLS = nil
				f18_local17()
				f18_local18()
			end )
			return self
		end
	end
	f18_local4 = "@MENU_SCOREBOARD"
end

function buttons_texts_overlay_face( f22_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	local f22_local1 = {
		{
			name = "buttons_default",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_tactical",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_lefty",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_lefty_regular",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_nomad",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_nomad_tactical",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_charlie",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_one-hand_gunslinger",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_bumper_jumper",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_bumper_jumper_tact",
			text = "@MENU_SWITCH_WEAPON"
		},
		{
			name = "buttons_stick_and_move",
			text = "@MENU_SWITCH_WEAPON"
		}
	}
	local f22_local2 = {
		{
			name = "buttons_default",
			text = "@MENU_CROUCH_PRONE"
		},
		{
			name = "buttons_tactical",
			text = "@MENU_MELEE_CHANGE_ZOOM"
		},
		{
			name = "buttons_lefty",
			text = "@MENU_CROUCH_PRONE"
		},
		{
			name = "buttons_lefty_regular",
			text = "@MENU_CROUCH_PRONE"
		},
		{
			name = "buttons_nomad",
			text = "@MENU_MELEE_CHANGE_ZOOM"
		},
		{
			name = "buttons_nomad_tactical",
			text = "@MENU_MELEE_HOLD_BREATH"
		},
		{
			name = "buttons_charlie",
			text = "@MENU_CROUCH_PRONE"
		},
		{
			name = "buttons_one-hand_gunslinger",
			text = "@MENU_CROUCH_PRONE"
		},
		{
			name = "buttons_bumper_jumper",
			text = "@MENU_CROUCH_PRONE"
		},
		{
			name = "buttons_bumper_jumper_tact",
			text = "@MENU_MELEE_CHANGE_ZOOM"
		},
		{
			name = "buttons_stick_and_move",
			text = "@MENU_CROUCH_PRONE"
		}
	}
	local f22_local3 = {
		{
			name = "buttons_default",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_tactical",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_lefty",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_lefty_regular",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_nomad",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_nomad_tactical",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_charlie",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_one-hand_gunslinger",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_bumper_jumper",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_bumper_jumper_tact",
			text = "@MENU_USE_RELOAD"
		},
		{
			name = "buttons_stick_and_move",
			text = "@MENU_USE_RELOAD"
		}
	}
	local f22_local4 = {
		{
			name = "buttons_default",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_tactical",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_lefty",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_lefty_regular",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_nomad",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_nomad_tactical",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_charlie",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_one-hand_gunslinger",
			text = "@MENU_JUMP"
		},
		{
			name = "buttons_bumper_jumper",
			text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
		},
		{
			name = "buttons_bumper_jumper_tact",
			text = "@WEAPON_VARIABLE_GRENADE_TACTICAL"
		},
		{
			name = "buttons_stick_and_move",
			text = "@MENU_MELEE_CHANGE_ZOOM"
		}
	}
	for f22_local12, f22_local11 in ipairs( {
		f22_local1,
		f22_local2,
		f22_local3,
		f22_local4
	} ) do
		local f22_local13 = f22_local11
		local f22_local14 = {}
		for f22_local8, f22_local9 in ipairs( f22_local13 ) do
			table.insert( f22_local14, {
				name = f22_local9.name .. "_alt",
				text = f22_local9.text
			} )
		end
		f22_local11 = LUI.ConcatenateToTable( f22_local11, f22_local14 )
	end
	f22_local5 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	if not Engine.UsingSplitscreenUpscaling() then
		if Engine.IsVita( f22_arg0 ) then
			f22_local5.left = 390.5
			f22_local5.top = -5
			f22_local5.width = 150
			f22_local5.height = 110
		elseif IsPS4Controller() then
			f22_local5.left = 365
			f22_local5.top = 98
			f22_local5.width = 150
			f22_local5.height = 110
		elseif Engine.IsXB3() or Engine.IsPC() then
			f22_local5.left = 365
			f22_local5.top = 118
			f22_local5.width = 155
			f22_local5.height = 115
		end
	elseif Engine.IsVita( f22_arg0 ) then
		f22_local5.left = 350.5
		f22_local5.top = 20
		f22_local5.width = 150
		f22_local5.height = 110
	elseif IsPS4Controller() then
		f22_local5.left = 342
		f22_local5.top = 101
		f22_local5.width = 150
		f22_local5.height = 110
	elseif Engine.IsXB3() or Engine.IsPC() then
		f22_local5.left = 345
		f22_local5.top = 118
		f22_local5.width = 155
		f22_local5.height = 115
	end
	f22_local5.material = RegisterMaterial( "black" )
	f22_local5.alpha = 0.5
	self:addElement( LUI.UIImage.new( f22_local5 ) )
	self:addElement( button_text_overlay( "Y", f22_local1, {
		xb3ANDpc = {
			x = 365,
			y = 133,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 363,
			y = 110,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 390,
			y = 10,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	}, {
		xb3ANDpc = {
			x = 345,
			y = 133,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 340,
			y = 115,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 350,
			y = 35,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	} ) )
	self:addElement( button_text_overlay( "Y", f22_local1, {
		xb3ANDpc = {
			x = 386,
			y = 149,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 385,
			y = 126,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 411,
			y = 26,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	}, {
		xb3ANDpc = {
			x = 366,
			y = 149,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 361,
			y = 131,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 371,
			y = 51,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	}, Engine.Localize( "@MENU_EQUIP_MELEE" ) ) )
	self:addElement( button_text_overlay( "X", f22_local3, {
		xb3ANDpc = {
			x = 365,
			y = 170,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 363,
			y = 148,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 390,
			y = 46,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	}, {
		xb3ANDpc = {
			x = 345,
			y = 170,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 340,
			y = 153,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 350,
			y = 71,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	} ) )
	self:addElement( button_text_overlay( "B", f22_local2, {
		xb3ANDpc = {
			x = 365,
			y = 194,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 363,
			y = 173,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 390,
			y = 70,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	}, {
		xb3ANDpc = {
			x = 345,
			y = 194,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 340,
			y = 178,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 350,
			y = 96,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	} ) )
	self:addElement( button_text_overlay( "A", f22_local4, {
		xb3ANDpc = {
			x = 365,
			y = 218,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 363,
			y = 198,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 390,
			y = 93,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	}, {
		xb3ANDpc = {
			x = 345,
			y = 218,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		ps4 = {
			x = 340,
			y = 203,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		},
		vita = {
			x = 350,
			y = 118,
			alignmentX = LUI.Alignment.Left,
			alignmentY = LUI.Alignment.Middle
		}
	} ) )
	return self
end

function buttons_overlay( f23_arg0, f23_arg1 )
	local f23_local0 = {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false
	}
	if Engine.IsVita( f23_arg0 ) then
		f23_local0.top = 0
		f23_local0.left = -25
	elseif debugPlaystation then
		f23_local0.top = -38
		f23_local0.left = 13
	elseif IsPS4Controller() then
		f23_local0.top = -28
		f23_local0.left = 8
	elseif Engine.IsPS3() then
		f23_local0.top = -38
		f23_local0.left = 13
	elseif Engine.IsXB3() or Engine.IsPC() then
		f23_local0.top = -30
		f23_local0.left = 9
	else
		f23_local0.top = -26.67
		f23_local0.left = 8
	end
	f23_local0.bottom = f23_local0.top + 341.33
	f23_local0.right = f23_local0.left + 381.33
	local self = LUI.UIElement.new( f23_local0 )
	self:addElement( f23_arg1( f23_arg0 ) )
	return self
end

function menu_base( f24_arg0 )
	local self = LUI.UIElement.new()
	local f24_local1 = nil
	if Engine.IsVita( f24_arg0 ) then
		f24_local1 = RegisterMaterial( "h1_deco_option_controller_psvita" )
	elseif IsPS4Controller() then
		f24_local1 = RegisterMaterial( "h1_deco_option_controller_ps4" )
	elseif Engine.IsXB3() or Engine.IsPC() then
		f24_local1 = RegisterMaterial( "h1_deco_option_controller_x1" )
	else
		f24_local1 = RegisterMaterial( "h1_deco_option_controller_x1" )
	end
	local f24_local2 = nil
	if Engine.IsVita( f24_arg0 ) then
		f24_local2 = RegisterMaterial( "h1_deco_option_controller_psvita_lines" )
	elseif IsPS4Controller() then
		f24_local2 = RegisterMaterial( "h1_deco_option_controller_ps4_lines" )
	elseif Engine.IsXB3() or Engine.IsPC() then
		f24_local2 = RegisterMaterial( "h1_deco_option_controller_x1_lines" )
	else
		f24_local2 = RegisterMaterial( "h1_deco_option_controller_x1_lines" )
	end
	local f24_local3, f24_local4 = nil
	if Engine.IsVita( f24_arg0 ) then
		f24_local3 = 660
		f24_local4 = 688
	elseif IsPS4Controller() then
		f24_local3 = 660
		f24_local4 = 420
	elseif Engine.IsXB3() or Engine.IsPC() then
		f24_local3 = 644
		f24_local4 = 480
	end
	local f24_local5 = 400
	local f24_local6 = f24_local5 * f24_local4 / f24_local3
	local f24_local7 = nil
	local f24_local8 = 1
	if Engine.UsingSplitscreenUpscaling() then
		f24_local8 = 0.65
		local self = f24_local5 * f24_local8
		local f24_local10 = {}
		f24_local10 = GameX.GetSafeZoneSize()
		if isSplitScreenPS3() then
			f24_local7 = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				top = (f24_local10[4] + f24_local10[2]) / 2,
				right = f24_local10[3] - self / 2 - 220,
				height = 0,
				width = 0
			}
		else
			f24_local7 = {
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				top = (f24_local10[4] + f24_local10[2]) / 2,
				right = f24_local10[3] - self / 2 - 130,
				height = 0,
				width = 0
			}
		end
	elseif Engine.IsPS3() then
		f24_local7 = {
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = 653,
			top = 356,
			height = 0,
			width = 0
		}
	elseif Engine.IsVita( f24_arg0 ) then
		f24_local7 = {
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = -20,
			top = 50,
			height = 0,
			width = 0
		}
	else
		f24_local7 = {
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			top = 0,
			height = 0,
			width = 0
		}
	end
	local self = LUI.UIElement.new( f24_local7 )
	self:addElement( self )
	local f24_local10 = CoD.CreateState( -f24_local5 / 2, -f24_local6 / 2, f24_local5 / 2, f24_local6 / 2, CoD.AnchorTypes.All )
	f24_local10.scale = f24_local8 - 1
	local self = LUI.UIElement.new( f24_local10 )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( -f24_local5 / 2, -f24_local6 / 2, f24_local5 / 2, f24_local6 / 2, CoD.AnchorTypes.All ) )
	self:addElement( self )
	local f24_local13 = CoD.CreateState( 0, 0, f24_local5, f24_local6, CoD.AnchorTypes.TopLeft )
	if Engine.IsVita( f24_arg0 ) then
		f24_local13.scale = -0.2
	end
	f24_local13.material = f24_local1
	self:addElement( LUI.UIImage.new( f24_local13 ) )
	local f24_local14 = CoD.CreateState( 0, 0, f24_local5, f24_local6, CoD.AnchorTypes.TopLeft )
	if Engine.IsVita( f24_arg0 ) then
		f24_local14.scale = -0.2
	end
	f24_local14.material = f24_local2
	self:addElement( LUI.UIImage.new( f24_local14 ) )
	self.container = self
	self.unscaledContainer = self
	return self
end

function AddButtons( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
	local f25_local0 = f25_arg1()
	for f25_local4, f25_local5 in ipairs( f25_arg3 ) do
		local f25_local6 = LUI.MenuBuilder.BuildAddChild
		local f25_local7 = f25_arg0.list
		local f25_local8 = {
			type = "UIGenericButton",
			id = f25_local5.name .. "_layout_button_id",
			listDefaultFocus = f25_local5.name == f25_local0
		}
		local f25_local9 = {
			style = LUI.MenuTemplate.ButtonStyle,
			text_align_without_content = LUI.Alignment.Left,
			layout_name = f25_local5.name,
			button_text = Engine.Localize( f25_local5.display_name )
		}
		local f25_local10 = MBh.DoMultiple
		local f25_local11 = {}
		local f25_local12 = f25_arg2
		local f25_local13 = MBh.LeaveMenu()
		f25_local9.button_action_func = f25_local10( f25_local12 )
		f25_local10 = MBh.DoMultiple
		f25_local11 = {}
		f25_local12 = MBh.EmitEventToRoot( "hide_texts" )
		f25_local13 = MBh.EmitEventToRoot( "show_" .. f25_local5.name )
		f25_local9.button_over_func = f25_local10( f25_local12 )
		f25_local8.properties = f25_local9
		f25_local6( f25_local7, f25_local8 )
	end
end

LUI.OptionsLayout.ResetSticksLayout = function ( f26_arg0, f26_arg1 )
	createBoxes( f26_arg0.textOverlay, f26_arg1 )
	f26_arg0:dispatchEventToRoot( {
		name = "show_" .. Engine.GetProfileData( "gpadSticksConfig" )
	} )
end

LUI.OptionsLayout.BuildSticksLayout = function ( f27_arg0 )
	return sticks_overlay( f27_arg0 )
end

LUI.OptionsLayout.BuildButtonsLayout = function ( f28_arg0 )
	return buttons_overlay( f28_arg0, buttons_texts_overlay )
end

LUI.OptionsLayout.BuildUnscaledButtonsLayout = function ( f29_arg0 )
	return buttons_overlay( f29_arg0, buttons_texts_overlay_face )
end

LUI.OptionsLayout.BuildBaseMenu = function ( f30_arg0 )
	return menu_base( f30_arg0 )
end

LUI.OptionsLayout.BuildMenu = function ( f31_arg0, f31_arg1 )
	f31_arg0.controller = LUI.OptionsLayout.BuildBaseMenu( f31_arg1 )
	f31_arg0:addElement( f31_arg0.controller )
	f31_arg0.controller.sticksOverlay = LUI.OptionsLayout.BuildSticksLayout( f31_arg1 )
	f31_arg0.controller.container:addElement( f31_arg0.controller.sticksOverlay )
	f31_arg0.controller.buttonsOverlay = LUI.OptionsLayout.BuildButtonsLayout( f31_arg1 )
	f31_arg0.controller.container:addElement( f31_arg0.controller.buttonsOverlay )
	f31_arg0.controller.unscaledButtonsOverlay = LUI.OptionsLayout.BuildUnscaledButtonsLayout( f31_arg1 )
	f31_arg0.controller.unscaledContainer:addElement( f31_arg0.controller.unscaledButtonsOverlay )
end

LockTable( _M )
