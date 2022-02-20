local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg1 )
	local f1_local0 = Game.GetOmnvar( "ks_selectedIndex" )
	local f1_local1 = f1_arg0.properties.index
	local f1_local2 = false
	if f1_local0 == f1_local1 then
		f1_local2 = true
	end
	local f1_local3
	if Engine.IsConsoleGame() ~= false or Engine.IsGamepadEnabled() ~= false then
		f1_local3 = false
	else
		f1_local3 = true
	end
	if f1_local3 then
		f1_local2 = false
	end
	if hasbit( Game.GetOmnvar( "ks_hasStreak" ), bit( f1_local1 + 1 ) ) and f1_local2 then
		f1_arg0:processEvent( {
			name = "show"
		} )
	else
		f1_arg0:processEvent( {
			name = "hide"
		} )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 2
	local f2_local1 = Game.GetOmnvar( "ks_selectedIndex" )
	if f2_local1 >= 0 then
		local f2_local2 = Engine.Localize( "@" .. Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Index, Game.GetOmnvar( "ks_icon" .. tostring( f2_local1 ) ), f2_local0 ) )
		if f2_local2 ~= nil and f2_local2 ~= f2_arg0.previous_killstreak_name then
			f2_arg0:setText( f2_local2 )
			local f2_local3 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"show",
					0
				},
				{
					"show",
					30
				},
				{
					"hide",
					0
				},
				{
					"hide",
					30
				},
				{
					"show",
					0
				},
				{
					"show",
					30
				},
				{
					"hide",
					0
				},
				{
					"hide",
					30
				},
				{
					"show",
					0
				},
				{
					"show",
					1500
				},
				{
					"hide",
					150
				}
			} )
			f2_local3( f2_arg0 )
			f2_arg0.previous_killstreak_name = f2_local2
			f2_arg0.current_state = "slide_in"
		end
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = assert
	local f3_local1 = f3_arg0.properties.index
	if f3_local1 then
		f3_local1 = f3_arg0.properties.omnvar
	end
	f3_local0( f3_local1 )
	f3_local0 = Game.GetOmnvar( f3_arg0.properties.omnvar )
	f3_local1 = f3_local0 - math.floor( f3_local0 )
	local f3_local2 = f3_arg0.properties.maxWidth
	local f3_local3 = f3_arg0.properties.maxHeight
	local f3_local4 = math.ceil( f3_local1 * f3_local2 )
	local f3_local5 = 0.25
	local f3_local6
	if hasbit( Game.GetOmnvar( "ks_hasStreak" ), bit( f3_arg0.properties.index + 1 ) ) then
		f3_local6 = Swatches.HUD.Highlight
		if not f3_local6 then
		
		else
			f3_arg0:registerAnimationState( "updated", {
				leftAnchor = true,
				left = 3,
				width = f3_local4,
				height = f3_local3,
				color = f3_local6,
				alpha = f3_local5
			} )
			f3_arg0:animateToState( "updated", 100 )
		end
	end
	f3_local6 = Swatches.HUD.Normal
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = assert
	local f4_local1 = f4_arg0.properties.index
	if f4_local1 then
		f4_local1 = f4_arg0.properties.omnvar
	end
	f4_local0( f4_local1 )
	f4_local0 = KillstreakTable.Cols.EarnedIcon
	f4_local1 = KillstreakTable.Cols.UnearnedIcon
	local f4_local2 = hasbit( Game.GetOmnvar( "ks_hasStreak" ), bit( f4_arg0.properties.index + 1 ) )
	local f4_local3
	if f4_local2 then
		f4_local3 = 1
		if not f4_local3 then
		
		else
			local f4_local4 = "specialty_ks_null"
			local f4_local5 = Game.GetOmnvar( f4_arg0.properties.omnvar )
			if f4_local2 then
				local f4_local6 = f4_local0
			end
			local f4_local7 = f4_local6 or f4_local1
			if f4_local5 ~= 0 then
				local f4_local8 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Index, f4_local5, f4_local7 )
				if f4_local8 ~= "" then
					f4_local4 = f4_local8
				else
					assert( "Target killstreak material is missing from Killstreak table!" )
				end
			end
			f4_arg0:registerAnimationState( "updated", {
				material = RegisterMaterial( f4_local4 ),
				alpha = f4_local3
			} )
			f4_arg0:animateToState( "updated", 0 )
		end
	end
	f4_local3 = 0.5
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0.properties.omnvar )
	local f5_local0 = Game.GetOmnvar( f5_arg0.properties.omnvar )
	local f5_local1 = false
	if f5_local0 ~= 0 then
		f5_local1 = true
	end
	if f5_local1 then
		f5_arg0:processEvent( {
			name = "show"
		} )
	else
		f5_arg0:processEvent( {
			name = "hide"
		} )
	end
	f5_arg0:dispatchEventToChildren( {
		name = "update_killstreak_status"
	} )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	assert( f6_arg0.properties.index )
	local f6_local0 = f6_arg0.properties.index
	local f6_local1 = Game.GetOmnvar( "ks_hasStreak" )
	local f6_local2 = hasbit( f6_local1, bit( f6_local0 + 1 + 5 ) )
	local f6_local3 = hasbit( f6_local1, bit( f6_local0 + 1 ) )
	if f6_local2 then
		if f6_local3 then
			f6_arg0:processEvent( {
				name = "highlight"
			} )
		else
			f6_arg0:processEvent( {
				name = "show"
			} )
		end
	else
		f6_arg0:processEvent( {
			name = "hide"
		} )
	end
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = assert
	local f7_local1 = f7_arg0.properties.index
	if f7_local1 then
		f7_local1 = f7_arg0.properties.omnvar
	end
	f7_local0( f7_local1 )
	local f7_local2 = hasbit( Game.GetOmnvar( "ks_hasStreak" ), bit( f7_arg0.properties.index + 1 ) )
	f7_arg0:setText( Game.GetOmnvar( f7_arg0.properties.omnvar ) or 0 )
	if f7_local2 then
		f7_arg0:processEvent( {
			name = "highlight"
		} )
	else
		f7_arg0:processEvent( {
			name = "show"
		} )
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	if hasbit( Game.GetOmnvar( "ks_hasStreak" ), bit( f8_arg0.properties.index + 1 ) ) then
		f8_arg0:animateToState( "default", 0 )
	else
		f8_arg0:animateToState( "inactive", 0 )
	end
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	f9_arg0:setText( Engine.GetKeyBindingLocalizedString( 0, f9_arg0.keybinding ) )
	if not Engine.IsGamepadEnabled() then
		if f9_arg0.keyID == "gimme_icon" then
			f9_arg0:animateToState( "default", 0 )
		else
			f0_local7( f9_arg0, f9_arg1 )
		end
	else
		f9_arg0:animateToState( "inactive", 0 )
	end
end

local f0_local9 = function ( f10_arg0, f10_arg1, f10_arg2 )
	assert( f10_arg1 )
	local f10_local0 = f10_arg1 == 0
	local f10_local1 = 70
	local f10_local2 = 44
	local f10_local3 = 64
	local f10_local4 = 41
	local f10_local5 = 86
	local f10_local6 = 81
	local f10_local7 = 76
	local f10_local8 = 38
	local f10_local9 = 30
	local f10_local10 = 15
	local f10_local11 = "ks_icon" .. tostring( f10_arg1 )
	local f10_local12 = "ks_count" .. tostring( f10_arg1 )
	local f10_local13 = "ks_points" .. tostring( f10_arg1 )
	local f10_local14 = CoD.TextSettings.TitleFontTiny
	local self = LUI.UIElement.new( {
		topAnchor = true,
		rightAnchor = true,
		top = 0,
		right = 0,
		width = f10_local1,
		height = f10_local2,
		alpha = 1
	} )
	self.id = f10_arg0 .. "_main_id"
	self.properties = {
		omnvar = f10_local11
	}
	self:registerAnimationState( "show", {
		topAnchor = true,
		rightAnchor = true,
		top = 0,
		right = 0,
		width = f10_local1,
		height = f10_local2,
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		topAnchor = true,
		rightAnchor = true,
		top = 0,
		right = 0,
		width = f10_local1,
		height = 0,
		alpha = 0
	} )
	self:registerEventHandler( "playerstate_client_changed", f0_local4 )
	self:registerOmnvarHandler( "ks_used", f0_local4 )
	self:registerOmnvarHandler( "ks_acquired", f0_local4 )
	self:registerOmnvarHandler( f10_local11, f0_local4 )
	self:registerEventHandler( "show", MBh.AnimateToState( "show", 0 ) )
	self:registerEventHandler( "hide", MBh.AnimateToState( "hide", 0 ) )
	local f10_local16 = LUI.MenuBuilder.BuildRegisteredType( "perspectiveBlur" )
	f10_local16:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f10_local16:animateToState( "default" )
	f10_local16.id = "backgroundBlur"
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		left = 3,
		width = 0,
		height = f10_local4,
		material = RegisterMaterial( "scorestreak_fill" ),
		alpha = 0
	} )
	self.id = f10_arg0 .. "_progress_bar_id"
	self.properties = {
		index = f10_arg1,
		omnvar = f10_local12,
		maxWidth = f10_local3,
		maxHeight = f10_local4
	}
	local self = LUI.UIImage.new( {
		bottom = 19,
		width = f10_local7,
		height = f10_local8,
		alpha = 0
	} )
	self.id = f10_arg0 .. "_icon_id"
	self.properties = {
		index = f10_arg1,
		omnvar = f10_local11
	}
	self:registerEventHandler( "update_killstreak_status", f0_local3 )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		rightAnchor = true,
		top = 1,
		right = 3,
		width = f10_local9,
		height = f10_local10,
		material = RegisterMaterial( "scorestreak_support_indicator" ),
		alpha = 0
	} )
	self.id = f10_arg0 .. "_support_icon_id"
	self.properties = {
		index = f10_arg1
	}
	self:registerAnimationState( "highlight", {
		color = Swatches.HUD.Highlight,
		alpha = 1
	} )
	self:registerAnimationState( "show", {
		color = Swatches.HUD.Normal,
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerEventHandler( "highlight", MBh.AnimateToState( "highlight", 0 ) )
	self:registerEventHandler( "show", MBh.AnimateToState( "show", 0 ) )
	self:registerEventHandler( "hide", MBh.AnimateToState( "hide", 0 ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		top = 1,
		left = 2,
		width = 60,
		height = f10_local14.Height * 0.75,
		font = f10_local14.Font,
		alignment = LUI.Alignment.Left,
		color = Swatches.HUD.Normal,
		alpha = 0
	} )
	self.id = f10_arg0 .. "_score_id"
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self.properties = {
		index = f10_arg1,
		omnvar = f10_local13
	}
	self:registerAnimationState( "highlight", {
		color = Swatches.HUD.Highlight,
		alpha = 1
	} )
	self:registerAnimationState( "show", {
		color = Swatches.HUD.Normal,
		alpha = 0.55
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerEventHandler( "highlight", MBh.AnimateToState( "highlight", 0 ) )
	self:registerEventHandler( "show", MBh.AnimateToState( "show", 0 ) )
	self:registerEventHandler( "hide", MBh.AnimateToState( "hide", 0 ) )
	local self = LUI.UIImage.new( {
		width = f10_local5,
		height = f10_local6,
		material = RegisterMaterial( "scorestreak_selected" ),
		alpha = 0
	} )
	self.id = f10_arg0 .. "_selection_frame_id"
	self.properties = {
		index = f10_arg1
	}
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerEventHandler( "show", MBh.AnimateToState( "show", 100 ) )
	self:registerEventHandler( "hide", MBh.AnimateToState( "hide", 200 ) )
	self:registerOmnvarHandler( "ks_selectedIndex", f0_local0 )
	self:registerEventHandler( "update_killstreak_status", f0_local0 )
	self:registerEventHandler( "button_config_updated", f0_local0 )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "icon_dpad_glow_right" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		right = -6,
		top = -16,
		width = 32,
		height = 32,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "dpadRight"
	self.properties = {
		index = f10_arg1
	}
	self:registerEventHandler( "show", MBh.AnimateToState( "visible", 100 ) )
	self:registerEventHandler( "hide", MBh.AnimateToState( "default", 200 ) )
	self:registerOmnvarHandler( "ks_selectedIndex", f0_local0 )
	self:registerEventHandler( "update_killstreak_status", f0_local0 )
	self:registerEventHandler( "button_config_updated", f0_local0 )
	local f10_local23 = HUDSpacer( false )
	f10_local23:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		height = 2,
		left = 0,
		right = 0
	} )
	f10_local23:animateToState( "default" )
	f10_local23.id = "spacer"
	if false == Engine.IsConsoleGame() then
		local self = LUI.UIText.new()
		self.id = "keybindTextId"
		self.keybinding = f10_arg2
		self.keyID = f10_arg0
		self.properties = {
			index = f10_arg1
		}
		self:registerAnimationState( "default", {
			topAnchor = false,
			leftAnchor = false,
			bottomAnchor = true,
			rightAnchor = true,
			bottom = -8,
			right = -75,
			height = CoD.TextSettings.TitleFontSmall.Height,
			width = 32,
			font = CoD.TextSettings.TitleFontSmall.Font,
			alpha = 1
		} )
		self:registerAnimationState( "inactive", {
			alpha = 0
		} )
		self:registerEventHandler( "button_config_updated", f0_local8 )
		self:registerOmnvarHandler( "ks_selectedIndex", f0_local8 )
		if not f10_local0 then
			self:registerEventHandler( "update_killstreak_status", f0_local8 )
		end
		f0_local8( self )
		self:addElement( self )
	end
	self:addElement( f10_local16 )
	self:addElement( self )
	if f10_arg1 > 1 then
		self:addElement( f10_local23 )
	end
	if not f10_local0 then
		self:registerOmnvarHandler( f10_local12, f0_local2 )
		self:registerEventHandler( "update_killstreak_status", f0_local2 )
		self:addElement( self )
	end
	self:addElement( self )
	if not f10_local0 then
		self:registerOmnvarHandler( f10_local13, f0_local6 )
		self:registerEventHandler( "update_killstreak_status", f0_local6 )
		self:addElement( self )
		self:registerEventHandler( "update_killstreak_status", f0_local5 )
		self:addElement( self )
	end
	self:addElement( self )
	f0_local4( self, {
		name = "INIT"
	} )
	return self
end

local f0_local10 = function ()
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		rightAnchor = true,
		bottom = 0,
		right = 0,
		width = 65,
		height = 256,
		spacing = 1.5,
		verticalAlignment = LUI.VerticalAlignment.Bottom
	} )
	self.id = "killstreakIconsHud_id"
	local f11_local1 = f0_local9( "gimme_icon", 0, "+actionslot 4" )
	local f11_local2 = f0_local9( "ks_icon_1", 1, "+actionslot 5" )
	local f11_local3 = f0_local9( "ks_icon_2", 2, "+actionslot 6" )
	local f11_local4 = f0_local9( "ks_icon_3", 3, "+actionslot 7" )
	local f11_local5 = f0_local9( "ks_icon_4", 4, "+actionslot 8" )
	self:addElement( f11_local2 )
	self:addElement( f11_local3 )
	self:addElement( f11_local4 )
	self:addElement( f11_local5 )
	self:addElement( f11_local1 )
	return self
end

local f0_local11 = function ()
	local f12_local0 = CoD.TextSettings.TitleFontMedium.Height
	local self = LUI.UIText.new( {
		topAnchor = true,
		rightAnchor = true,
		top = -f12_local0,
		right = 0,
		width = 400,
		height = f12_local0,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alignment = LUI.Alignment.Right,
		alpha = 0
	} )
	self.id = "killstreakInfoKillstreakName_id"
	self:setText( "" )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerOmnvarHandler( "ui_killstreak_scroll", f0_local1 )
	return self
end

local f0_local12 = function ()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 1
	} )
	self.id = "killstreakInfoHud"
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:registerEventHandler( "show_ks_info", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "hide_ks_info", MBh.AnimateToState( "inactive", 0 ) )
	if not GameX.IsHardcoreMode() then
		self:addElement( f0_local10() )
	end
	self:addElement( f0_local11() )
	return self
end

local f0_local13 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = Game.GetOmnvar( "ui_killstreak_blackout" )
	local f14_local1 = Game.GetOmnvar( "ui_killstreak_blackout_fade_end" ) - Game.GetTime()
	if f14_local0 then
		if f14_local1 > 0 then
			f14_arg0:animateToState( "visible", f14_local1 )
		else
			f14_arg0:animateToState( "visible", 0 )
		end
	elseif f14_local1 > 0 then
		f14_arg0:animateToState( "default", f14_local1 )
	else
		f14_arg0:animateToState( "default", 0 )
	end
end

local f0_local14 = function ()
	local f15_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f15_local0.alpha = 0
	f15_local0.color = Colors.black
	local self = LUI.UIImage.new( f15_local0 )
	self.id = "killstreakBlackoutHud"
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerOmnvarHandler( "ui_killstreak_blackout", f0_local13 )
	self:registerEventHandler( "playerstate_client_changed", f0_local13 )
	f0_local13( self )
	return self
end

LUI.MenuBuilder.registerType( "killstreakInfoHudDef", f0_local12 )
LUI.MenuBuilder.registerType( "killstreakBlackoutHudDef", f0_local14 )
LockTable( _M )
