local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	[Engine.LocalizeLong( "@KEY_MOUSE1" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE1" ),
	[Engine.LocalizeLong( "@KEY_MOUSE2" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE2" ),
	[Engine.LocalizeLong( "@KEY_MOUSE3" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE3" ),
	[Engine.LocalizeLong( "@KEY_MOUSE4" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE4" ),
	[Engine.LocalizeLong( "@KEY_MOUSE5" )] = Engine.LocalizeLong( "@LUA_HUD_MOUSE5" ),
	[Engine.LocalizeLong( "@KEY_MWHEELUP" )] = Engine.LocalizeLong( "@LUA_HUD_MWHEELUP" ),
	[Engine.LocalizeLong( "@KEY_MWHEELDOWN" )] = Engine.LocalizeLong( "@LUA_HUD_MWHEELDOWN" ),
	[Engine.LocalizeLong( "@KEY_PGUP" )] = Engine.LocalizeLong( "@LUA_HUD_PGUP" ),
	[Engine.LocalizeLong( "@KEY_PGDN" )] = Engine.LocalizeLong( "@LUA_HUD_PGDN" ),
	[Engine.LocalizeLong( "@KEY_TAB" )] = Engine.LocalizeLong( "@LUA_HUD_TAB" ),
	[Engine.LocalizeLong( "@KEY_SHIFT" )] = Engine.LocalizeLong( "@LUA_HUD_SHIFT" ),
	[Engine.LocalizeLong( "@KEY_CTRL" )] = Engine.LocalizeLong( "@LUA_HUD_CTRL" ),
	[Engine.LocalizeLong( "@KEY_DEL" )] = Engine.LocalizeLong( "@LUA_HUD_DEL" ),
	[Engine.LocalizeLong( "@KEY_ENTER" )] = Engine.LocalizeLong( "@LUA_HUD_ENTER" ),
	[Engine.LocalizeLong( "@KEY_CAPSLOCK" )] = Engine.LocalizeLong( "@LUA_HUD_CAPSLOCK" ),
	[Engine.LocalizeLong( "@KEY_KP_NUMLOCK" )] = Engine.LocalizeLong( "@LUA_HUD_KP_NUMLOCK" ),
	[Engine.LocalizeLong( "@KEY_SPACE" )] = Engine.LocalizeLong( "@LUA_HUD_SPACE" ),
	[Engine.LocalizeLong( "@KEY_HOME" )] = Engine.LocalizeLong( "@LUA_HUD_HOME" ),
	[Engine.LocalizeLong( "@KEY_END" )] = Engine.LocalizeLong( "@LUA_HUD_END" ),
	[Engine.LocalizeLong( "@KEY_INS" )] = Engine.LocalizeLong( "@LUA_HUD_INS" ),
	[Engine.LocalizeLong( "@KEY_UPARROW" )] = Engine.LocalizeLong( "@LUA_HUD_UPARROW" ),
	[Engine.LocalizeLong( "@KEY_DOWNARROW" )] = Engine.LocalizeLong( "@LUA_HUD_DOWNARROW" ),
	[Engine.LocalizeLong( "@KEY_LEFTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_LEFTARROW" ),
	[Engine.LocalizeLong( "@KEY_RIGHTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_RIGHTARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_HOME" )] = Engine.LocalizeLong( "@LUA_HUD_KP_HOME" ),
	[Engine.LocalizeLong( "@KEY_KP_UPARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_UPARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_PGUP" )] = Engine.LocalizeLong( "@LUA_HUD_KP_PGUP" ),
	[Engine.LocalizeLong( "@KEY_KP_LEFTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_LEFTARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_5" )] = Engine.LocalizeLong( "@LUA_HUD_KP_5" ),
	[Engine.LocalizeLong( "@KEY_KP_RIGHTARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_RIGHTARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_END" )] = Engine.LocalizeLong( "@LUA_HUD_KP_END" ),
	[Engine.LocalizeLong( "@KEY_KP_DOWNARROW" )] = Engine.LocalizeLong( "@LUA_HUD_KP_DOWNARROW" ),
	[Engine.LocalizeLong( "@KEY_KP_PGDN" )] = Engine.LocalizeLong( "@LUA_HUD_KP_PGDN" ),
	[Engine.LocalizeLong( "@KEY_KP_INS" )] = Engine.LocalizeLong( "@LUA_HUD_KP_INS" ),
	[Engine.LocalizeLong( "@KEY_KP_DEL" )] = Engine.LocalizeLong( "@LUA_HUD_KP_DEL" ),
	[Engine.LocalizeLong( "@KEY_KP_ENTER" )] = Engine.LocalizeLong( "@LUA_HUD_KP_ENTER" ),
	[Engine.LocalizeLong( "@KEY_KP_SLASH" )] = Engine.LocalizeLong( "@LUA_HUD_KP_SLASH" ),
	[Engine.LocalizeLong( "@KEY_KP_STAR" )] = Engine.LocalizeLong( "@LUA_HUD_KP_STAR" ),
	[Engine.LocalizeLong( "@KEY_KP_MINUS" )] = Engine.LocalizeLong( "@LUA_HUD_KP_MINUS" ),
	[Engine.LocalizeLong( "@KEY_KP_PLUS" )] = Engine.LocalizeLong( "@LUA_HUD_KP_PLUS" ),
	[Engine.LocalizeLong( "@KEY_UNBOUND" )] = Engine.LocalizeLong( "@LUA_HUD_UNBOUND" )
}
f0_local1 = function ( f1_arg0 )
	local f1_local0 = f0_local0[f1_arg0]
	if f1_local0 ~= nil then
		return f1_local0
	else
		return f1_arg0
	end
end

f0_local2 = {
	1,
	3,
	4
}
local f0_local3 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetBinding( "+actionslot " .. f2_arg1, true )
	if f2_arg0.keyBinding ~= f2_local0 then
		f2_arg0.keyBinding = f2_local0
		if f2_arg0.keyBindingText then
			f2_arg0.keyBindingText:setText( f0_local1( f2_local0 ) )
		end
	end
	if f2_arg0.keyBindingText then
		if Game.GetPlayerActionSlotActive( f2_arg1 - 1 ) then
			f2_arg0.keyBindingText:animateToState( "selected", 0 )
		else
			f2_arg0.keyBindingText:animateToState( "unselected", 0 )
		end
	end
end

function UpdateActionSlots( f3_arg0, f3_arg1 )
	local f3_local0, f3_local1 = nil
	for f3_local2 = 1, 3, 1 do
		f3_local1 = f3_arg0["slot" .. f3_local2]
		if f3_local1 ~= nil and f3_local1.image ~= nil then
			f3_local0 = Game.GetPlayerActionSlotMaterial( f3_local1.image.slotNum )
			if f3_local0 ~= f3_local1.image.material then
				f3_local1.image.material = f3_local0
				if f3_local0 == nil then
					f3_local1.container:animateToState( "default" )
				else
					f3_local1.image:registerAnimationState( "update", {
						alpha = 1,
						material = f3_local0
					} )
					f3_local1.image:animateToState( "update" )
				end
			end
			if f3_local0 ~= nil then
				if Game.GetPlayerActionSlotShowAmmo( f3_local1.image.slotNum ) then
					local f3_local5 = Game.GetPlayerActionSlotAmmo( f3_local1.image.slotNum )
					if f3_local5 ~= nil then
						if f3_local5 > 0 then
							f3_local1.container:animateToState( "visible", 0 )
							f3_local1.text:animateToState( "default", 0 )
						else
							f3_local1.container:animateToState( "depleted", 0 )
							f3_local1.text:animateToState( "depleted", 0 )
						end
						f3_local1.text:setText( f3_local5 )
					else
						f3_local1.container:animateToState( "visible", 0 )
						f3_local1.text:setText( "" )
					end
				else
					f3_local1.container:animateToState( "visible", 0 )
					f3_local1.text:setText( "" )
				end
			end
			if not Engine.IsGamepadEnabled() and not Engine.InFrontend() then
				f0_local3( f3_local1, f0_local2[f3_local2] )
			end
		end
	end
end

function BuildActionSlot( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = CoD.CreateState( -32 + f4_arg0, nil, nil, f4_arg1, CoD.AnchorTypes.Bottom )
	f4_local0.width = 64
	f4_local0.height = 64
	f4_local0.zRot = f4_arg2
	local self = LUI.UIElement.new( f4_local0 )
	local f4_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local2.material = RegisterMaterial( "h1_hud_dpad_blur" )
	self:addElement( LUI.UIImage.new( f4_local2 ) )
	local f4_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local3.material = RegisterMaterial( "h1_hud_dpad_border" )
	f4_local3.color = CoD.HudStandards.overlayTint
	self:addElement( LUI.UIImage.new( f4_local3 ) )
	local f4_local4 = CoD.CreateState( nil, nil, nil, -10, CoD.AnchorTypes.Bottom )
	f4_local4.width = 30
	f4_local4.height = 30
	f4_local4.alpha = 0
	f4_local4.zRot = -f4_arg2
	local self = LUI.UIElement.new( f4_local4 )
	self:registerAnimationState( "depleted", {
		alpha = 0.5
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:addElement( self )
	local f4_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local6.material = RegisterMaterial( "black" )
	local self = LUI.UIImage.new( f4_local6 )
	self:addElement( self )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		alignment = LUI.Alignment.Right,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = 3,
		left = 0,
		right = -9,
		height = 10,
		color = Colors.white
	} )
	self.id = "ammoText_id"
	self:registerAnimationState( "depleted", {
		color = Colors.red
	} )
	self:addElement( self )
	self.container = self
	self.text = self
	self.image = self
	self.image.slotNum = f4_arg3
	return self
end

function BuildActionSlotPc( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = CoD.CreateState( -32 + f5_arg0, nil, nil, f5_arg1, CoD.AnchorTypes.Bottom )
	f5_local0.width = 64
	f5_local0.height = 64
	local self = LUI.UIElement.new( f5_local0 )
	local f5_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local2.material = RegisterMaterial( "h1_hud_box_blur" )
	self:addElement( LUI.UIImage.new( f5_local2 ) )
	local f5_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local3.material = RegisterMaterial( "h1_hud_box_border" )
	f5_local3.color = CoD.HudStandards.overlayTint
	self:addElement( LUI.UIImage.new( f5_local3 ) )
	local f5_local4 = CoD.CreateState( 0, nil, nil, -5, CoD.AnchorTypes.Bottom )
	f5_local4.width = 30
	f5_local4.height = 30
	f5_local4.alpha = 0
	local self = LUI.UIElement.new( f5_local4 )
	self:registerAnimationState( "depleted", {
		alpha = 0.5
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:addElement( self )
	local f5_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local6.material = RegisterMaterial( "black" )
	local self = LUI.UIImage.new( f5_local6 )
	self:addElement( self )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.TitleFontSmallBold.Font,
		alignment = LUI.Alignment.Right,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = 2,
		left = 0,
		right = -1,
		height = 14,
		color = Colors.white
	} )
	self.id = "ammoText_id"
	self:registerAnimationState( "depleted", {
		color = Colors.red
	} )
	self:addElement( self )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.SP_HudItemKeybindFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 5,
		left = -2,
		right = 0,
		height = CoD.TextSettings.SP_HudItemKeybindFont.Height
	} )
	self.id = "keyBindingText_id"
	self:registerAnimationState( "unselected", {
		alpha = 0.5,
		color = {
			r = 0.96,
			g = 0.81,
			b = 0
		}
	} )
	self:registerAnimationState( "selected", {
		alpha = 1,
		color = {
			r = 1,
			g = 1,
			b = 0.2
		}
	} )
	self:addElement( self )
	self.container = self
	self.text = self
	self.keyBindingText = self
	self.image = self
	self.image.slotNum = f5_arg2
	return self
end

function actionSlotHudDef()
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self.id = "actionslothud_id"
	if Engine.IsGamepadEnabled() then
		self:addElement( actionSlotGamePad() )
		self.gamePad = true
	else
		self:addElement( actionSlotKeyboard() )
		self.gamePad = false
	end
	self:registerEventHandler( "button_config_updated", function ( element, event )
		if self.gamePad == false and Engine.IsGamepadEnabled() then
			self:closeChildren()
			self:addElement( actionSlotGamePad() )
			self.gamePad = true
		elseif self.gamePad == true and not Engine.IsGamepadEnabled() then
			self:closeChildren()
			self:addElement( actionSlotKeyboard() )
			self.gamePad = false
		end
		self:dispatchEventToChildren( event )
	end )
	return self
end

function createKillstreakCounter( f8_arg0 )
	local self = LUI.UIElement.new( f8_arg0 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local f8_local1 = CoD.CreateState( 4, nil, nil, nil, CoD.AnchorTypes.BottomLeft )
	f8_local1.height = 14
	f8_local1.width = 30
	f8_local1.scale = 0
	f8_local1.alpha = 1
	f8_local1.font = CoD.TextSettings.TitleFontSmallBold.Font
	f8_local1.textStyle = CoD.TextStyle.Shadowed
	f8_local1.alignment = LUI.Alignment.Center
	
	local killStreakProgress = LUI.UIText.new( f8_local1 )
	f8_local1.scale = 0.5
	f8_local1.alpha = 0.25
	killStreakProgress:registerAnimationState( "zoom", f8_local1 )
	self:addElement( killStreakProgress )
	self.killStreakProgress = killStreakProgress
	
	local f8_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f8_local3.height = Engine.IsPC() and 10 or 12
	f8_local3.width = 40
	f8_local3.alpha = 1
	f8_local3.font = CoD.TextSettings.TitleFontSmallBold.Font
	f8_local3.textStyle = CoD.TextStyle.Shadowed
	local self = LUI.UIText.new( f8_local3 )
	self:setText( Engine.Localize( "MENU_KILLSTREAK_CAPS" ) )
	self:addElement( self )
	local f8_local5 = CoD.CreateState( nil, nil, nil, -5, CoD.AnchorTypes.BottomLeft )
	f8_local5.width = 4
	f8_local5.height = 4
	f8_local5.zRot = 90
	f8_local5.alpha = 0.3
	f8_local5.material = RegisterMaterial( "h1_deco_indicator_arrow" )
	f8_local5.color = Colors.black
	self:addElement( LUI.UIImage.new( f8_local5 ) )
	local f8_local6 = CoD.CreateState( 34, nil, nil, -5, CoD.AnchorTypes.BottomLeft )
	f8_local6.width = 4
	f8_local6.height = 4
	f8_local6.zRot = -90
	f8_local6.alpha = 0.3
	f8_local6.material = RegisterMaterial( "h1_deco_indicator_arrow" )
	f8_local6.color = Colors.black
	self:addElement( LUI.UIImage.new( f8_local6 ) )
	return self
end

function updateKillStreakProgress( f9_arg0, f9_arg1 )
	local f9_local0 = Game.GetOmnvar( "ks_count1" )
	if f9_arg1 == nil or f9_local0 == 0 then
		local f9_local1
		if f9_local0 == 0 then
			f9_local1 = "--"
			if not f9_local1 then
			
			else
				f9_arg0:setText( f9_local1 )
				f9_arg0:animateToState( "default", 0 )
			end
		end
		f9_local1 = tostring( f9_local0 )
	elseif not Game.InKillCam() then
		f9_arg0:registerEventHandler( "transition_complete_zoom", nil )
		f9_arg0:cancelAnimateToState()
		f9_arg0:registerEventHandler( "transition_complete_zoom", function ( element, event )
			element:setText( f9_local0 )
			element:animateToState( "default", 125 )
		end )
		f9_arg0:animateInSequence( {
			{
				"default",
				0
			},
			{
				"zoom",
				100
			}
		} )
	end
end

function actionSlotGamePad()
	local f11_local0
	if GameX.IsRankedMatch() and not GameX.IsSplitscreen() then
		f11_local0 = -30
		if not f11_local0 then
		
		else
			local f11_local1 = CoD.CreateState( nil, nil, nil, f11_local0, CoD.AnchorTypes.Bottom )
			f11_local1.height = 60
			local self = LUI.UIElement.new( f11_local1 )
			self.id = "actionSlotHudDef"
			local f11_local3 = CoD.CreateState( nil, 4, nil, nil, CoD.AnchorTypes.Top )
			f11_local3.width = 66
			f11_local3.height = 40
			local self = LUI.UIElement.new( f11_local3 )
			self.id = "mask_id"
			self:setUseStencil( true )
			self:addElement( self )
			local f11_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Top )
			f11_local5.width = 66
			f11_local5.height = 66
			f11_local5.material = RegisterMaterial( "h1_hud_dpad_extra" )
			self:addElement( LUI.UIImage.new( f11_local5 ) )
			local f11_local6 = CoD.CreateState( -10, nil, nil, -2, CoD.AnchorTypes.Bottom )
			f11_local6.material = RegisterMaterial( "h1_ui_hud_deco_angledbar_anchor" )
			f11_local6.height = 8
			f11_local6.width = -8
			self:addElement( LUI.UIImage.new( f11_local6 ) )
			local f11_local7 = CoD.CreateState( 10, nil, nil, -2, CoD.AnchorTypes.Bottom )
			f11_local7.material = RegisterMaterial( "h1_ui_hud_deco_angledbar_anchor" )
			f11_local7.height = 8
			f11_local7.width = 8
			self:addElement( LUI.UIImage.new( f11_local7 ) )
			local f11_local8 = CoD.CreateState( nil, -14, -70, nil, CoD.AnchorTypes.None )
			f11_local8.material = RegisterMaterial( "black" )
			f11_local8.height = 1
			f11_local8.width = 6
			local self = LUI.UIImage.new( f11_local8 )
			f11_local8.width = 26
			self:registerAnimationState( "hasCounter", f11_local8 )
			self:addElement( self )
			local f11_local10 = CoD.CreateState( 70, -14, nil, nil, CoD.AnchorTypes.None )
			f11_local10.material = RegisterMaterial( "black" )
			f11_local10.height = 1
			f11_local10.width = 6
			local self = LUI.UIImage.new( f11_local10 )
			f11_local10.width = 26
			self:registerAnimationState( "hasCounter", f11_local10 )
			self:addElement( self )
			local f11_local12 = CoD.CreateState( nil, 26, -70, nil, CoD.AnchorTypes.None )
			f11_local12.material = RegisterMaterial( "black" )
			f11_local12.height = 1
			f11_local12.width = 6
			f11_local12.alpha = 0
			local self = LUI.UIImage.new( f11_local12 )
			self:registerAnimationState( "hasCounter", {
				alpha = 1
			} )
			self:addElement( self )
			local f11_local14 = CoD.CreateState( 70, 26, nil, nil, CoD.AnchorTypes.None )
			f11_local14.material = RegisterMaterial( "black" )
			f11_local14.height = 1
			f11_local14.width = 6
			f11_local12.alpha = 0
			local self = LUI.UIImage.new( f11_local14 )
			self:registerAnimationState( "hasCounter", {
				alpha = 1
			} )
			self:addElement( self )
			local f11_local16 = BuildActionSlot( 0, -28, 0, 0 )
			self.slot1 = f11_local16
			self:addElement( f11_local16 )
			f11_local16 = BuildActionSlot( -38, 10, 90, 2 )
			self.slot2 = f11_local16
			self:addElement( f11_local16 )
			f11_local16 = BuildActionSlot( 38, 10, 270, 3 )
			self.slot3 = f11_local16
			self:addElement( f11_local16 )
			self:addElement( LUI.UITimer.new( 50, "UpdateActionSlots" ) )
			self:registerEventHandler( "UpdateActionSlots", UpdateActionSlots )
			if not Engine.InFrontend() and Engine.GetDvarBool( "g_oldschool" ) == false then
				local f11_local17 = Engine.GetLuiRoot()
				local f11_local18 = f11_local17.m_controllerIndex
				local f11_local19 = Engine.WantsDisplayKillstreakCounter( f11_local18 )
				local f11_local20 = CoD.CreateState( 70, -37, nil, nil, CoD.AnchorTypes.Bottom )
				f11_local20.height = 28
				f11_local20.width = 100
				f11_local20.alpha = 1
				local f11_local21 = createKillstreakCounter( f11_local20 )
				f11_local21:registerEventHandler( "button_config_updated", function ( element, event )
					local f12_local0 = Engine.WantsDisplayKillstreakCounter( f11_local18 )
					if f11_local21.wantsCounter ~= f12_local0 then
						f11_local21.wantsCounter = f12_local0
						if element.wantsCounter == true then
							f11_local21:animateToState( "default", 0 )
							updateKillStreakProgress( f11_local21.killStreakProgress, nil )
							self:animateToState( "hasCounter", 0 )
							self:animateToState( "hasCounter", 0 )
							self:animateToState( "hasCounter", 0 )
							self:animateToState( "hasCounter", 0 )
						else
							f11_local21:animateToState( "hidden", 0 )
							self:animateToState( "default", 0 )
							self:animateToState( "default", 0 )
							self:animateToState( "default", 0 )
							self:animateToState( "default", 0 )
						end
					end
				end )
				f11_local21.wantsCounter = f11_local19
				if f11_local21.wantsCounter == true then
					f11_local21:animateToState( "default", 0 )
					updateKillStreakProgress( f11_local21.killStreakProgress, nil )
					self:animateToState( "hasCounter", 0 )
					self:animateToState( "hasCounter", 0 )
					self:animateToState( "hasCounter", 0 )
					self:animateToState( "hasCounter", 0 )
				else
					f11_local21:animateToState( "hidden", 0 )
					self:animateToState( "default", 0 )
					self:animateToState( "default", 0 )
					self:animateToState( "default", 0 )
					self:animateToState( "default", 0 )
				end
				f11_local21:registerOmnvarHandler( "ks_count1", function ( f13_arg0, f13_arg1 )
					if f11_local21.wantsCounter == true then
						updateKillStreakProgress( f11_local21.killStreakProgress, f13_arg1 )
					end
				end )
				f11_local21:registerEventHandler( "playerstate_client_changed", function ( element, event )
					if f11_local21.wantsCounter == true then
						updateKillStreakProgress( f11_local21.killStreakProgress, nil )
					end
				end )
				self:addElement( f11_local21 )
			end
			return self
		end
	end
	f11_local0 = 0
end

function actionSlotKeyboard()
	local f15_local0
	if GameX.IsRankedMatch() and not GameX.IsSplitscreen() then
		f15_local0 = -30
		if not f15_local0 then
		
		else
			local f15_local1 = CoD.CreateState( nil, nil, nil, f15_local0, CoD.AnchorTypes.Bottom )
			f15_local1.height = 60
			local self = LUI.UIElement.new( f15_local1 )
			self.id = "actionSlotHudDef"
			local f15_local3 = CoD.CreateState( nil, -14, -60, nil, CoD.AnchorTypes.None )
			f15_local3.material = RegisterMaterial( "black" )
			f15_local3.height = 1
			f15_local3.width = 26
			f15_local3.alpha = 0
			local self = LUI.UIImage.new( f15_local3 )
			self:registerAnimationState( "hasCounter", {
				alpha = 1
			} )
			self:addElement( self )
			local f15_local5 = CoD.CreateState( 90, -14, nil, nil, CoD.AnchorTypes.None )
			f15_local5.material = RegisterMaterial( "black" )
			f15_local5.height = 1
			f15_local5.width = 26
			f15_local5.alpha = 0
			local self = LUI.UIImage.new( f15_local5 )
			self:registerAnimationState( "hasCounter", {
				alpha = 1
			} )
			self:addElement( self )
			local f15_local7 = CoD.CreateState( nil, 26, -60, nil, CoD.AnchorTypes.None )
			f15_local7.material = RegisterMaterial( "black" )
			f15_local7.height = 1
			f15_local7.width = 6
			f15_local7.alpha = 0
			local self = LUI.UIImage.new( f15_local7 )
			self:registerAnimationState( "hasCounter", {
				alpha = 1
			} )
			self:addElement( self )
			local f15_local9 = CoD.CreateState( 90, 26, nil, nil, CoD.AnchorTypes.None )
			f15_local9.material = RegisterMaterial( "black" )
			f15_local9.height = 1
			f15_local9.width = 6
			f15_local9.alpha = 0
			local self = LUI.UIImage.new( f15_local9 )
			self:registerAnimationState( "hasCounter", {
				alpha = 1
			} )
			self:addElement( self )
			local f15_local11 = BuildActionSlotPc( 0, 0, 0 )
			self.slot1 = f15_local11
			self:addElement( f15_local11 )
			f15_local11 = BuildActionSlotPc( -45, 0, 2 )
			self.slot2 = f15_local11
			self:addElement( f15_local11 )
			f15_local11 = BuildActionSlotPc( 45, 0, 3 )
			self.slot3 = f15_local11
			self:addElement( f15_local11 )
			self:addElement( LUI.UITimer.new( 50, "UpdateActionSlots" ) )
			self:registerEventHandler( "UpdateActionSlots", UpdateActionSlots )
			if not Engine.InFrontend() and Engine.GetDvarBool( "g_oldschool" ) == false then
				local f15_local12 = CoD.CreateState( 90, -37, nil, nil, CoD.AnchorTypes.Bottom )
				f15_local12.height = 28
				f15_local12.width = 100
				f15_local12.alpha = 1
				local f15_local13 = createKillstreakCounter( f15_local12 )
				f15_local13:registerEventHandler( "button_config_updated", function ( element, event )
					local f16_local0 = Engine.WantsDisplayKillstreakCounter( Engine.GetFirstActiveController() )
					if f15_local13.wantsCounter ~= f16_local0 then
						f15_local13.wantsCounter = f16_local0
						if element.wantsCounter == true then
							f15_local13:animateToState( "default", 0 )
							updateKillStreakProgress( f15_local13.killStreakProgress, nil )
							self:animateToState( "hasCounter", 0 )
							self:animateToState( "hasCounter", 0 )
							self:animateToState( "hasCounter", 0 )
							self:animateToState( "hasCounter", 0 )
						else
							f15_local13:animateToState( "hidden", 0 )
							self:animateToState( "default", 0 )
							self:animateToState( "default", 0 )
							self:animateToState( "default", 0 )
							self:animateToState( "default", 0 )
						end
					end
				end )
				f15_local13.wantsCounter = Engine.WantsDisplayKillstreakCounter( Engine.GetFirstActiveController() )
				if f15_local13.wantsCounter == true then
					updateKillStreakProgress( f15_local13.killStreakProgress, nil )
					f15_local13:animateToState( "default" )
					self:animateToState( "hasCounter", 0 )
					self:animateToState( "hasCounter", 0 )
					self:animateToState( "hasCounter", 0 )
					self:animateToState( "hasCounter", 0 )
				else
					f15_local13:animateToState( "hidden" )
					self:animateToState( "default", 0 )
					self:animateToState( "default", 0 )
					self:animateToState( "default", 0 )
					self:animateToState( "default", 0 )
				end
				f15_local13:registerOmnvarHandler( "ks_count1", function ( f17_arg0, f17_arg1 )
					if f15_local13.wantsCounter == true then
						updateKillStreakProgress( f15_local13.killStreakProgress, f17_arg1 )
					end
				end )
				f15_local13:registerEventHandler( "playerstate_client_changed", function ( element, event )
					if f15_local13.wantsCounter == true then
						updateKillStreakProgress( f15_local13.killStreakProgress, nil )
					end
				end )
				self:addElement( f15_local13 )
			end
			return self
		end
	end
	f15_local0 = 0
end

LUI.MenuBuilder.registerType( "actionSlotHudDef", actionSlotHudDef )
LockTable( _M )
