local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	if f1_arg0 ~= nil and f1_arg0 ~= -1 then
		return "[{+actionslot " .. 4 + f1_arg0 .. "}]"
	else
		return nil
	end
end

function killstreakEarned()
	local f2_local0 = Engine.UsingSplitscreenUpscaling()
	local f2_local1 = 130
	if f2_local0 then
		f2_local1 = 80
	end
	local f2_local2 = f2_local1
	local f2_local3 = CoD.TextSettings.TitleFontSmallBold
	local f2_local4 = CoD.TextSettings.TitleFontTiny
	local f2_local5 = 3
	local f2_local6 = 24
	local f2_local7 = 0
	local f2_local8 = 10
	if f2_local0 then
		f2_local8 = 5
	end
	if Engine.IsCurrentGen() then
		f2_local7 = 15
	end
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "killstreakEarned"
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = f2_local8,
		height = 0,
		left = -f2_local1 / 2,
		width = f2_local1,
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self.id = "container"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		height = f2_local2,
		left = 0,
		right = 0
	} )
	self:setPriority( 1 )
	self.id = "icon"
	self:addElement( self )
	local self = LUI.UIText.new( {
		font = f2_local3.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = -100,
		top = 0,
		right = 100,
		height = f2_local3.Height,
		color = Colors.white,
		glow = LUI.GlowState.LightGreen
	} )
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:setPriority( 3 )
	self.id = "killstreakReady"
	self:addElement( self )
	local self = LUI.UIText.new( {
		font = f2_local4.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = -100,
		top = 0 + f2_local7,
		right = 100,
		height = f2_local4.Height
	} )
	self:setPriority( 3 )
	self.id = "instructions"
	self:addElement( self )
	self:registerOmnvarHandler( "ui_splash_killstreak_idx", function ( f3_arg0, f3_arg1 )
		local f3_local0 = Game.GetOmnvar( "ui_splash_killstreak_idx" )
		if f3_local0 < 0 then
			self:animateToState( "default", 0 )
			return 
		elseif self.mods then
			self.mods:close()
			self.mods = nil
		end
		local f3_local1 = Engine.TableLookupByRow( SplashTable.File, f3_local0, SplashTable.Cols.Ref )
		local f3_local2 = Engine.TableLookupByRow( SplashTable.File, f3_local0, SplashTable.Cols.SplashType )
		local f3_local3 = tonumber( Engine.TableLookupByRow( SplashTable.File, f3_local0, SplashTable.Cols.Duration ) ) * 1000
		local f3_local4 = nil
		local f3_local5 = Engine.Localize( Engine.TableLookupByRow( SplashTable.File, f3_local0, SplashTable.Cols.Desc ) )
		local f3_local6 = ""
		if f3_local2 == "killstreak_splash" then
			if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
				f3_local6 = Engine.Localize( "LUA_MP_COMMON_KILLSTREAK_HOWTO" )
			else
				local f3_local7 = f0_local0( Game.GetOmnvar( "ui_splash_killstreak_slot_idx" ) )
				if f3_local7 then
					f3_local6 = Engine.Localize( "LUA_MP_COMMON_KILLSTREAK_HOWTO_PC", f3_local7 )
				end
			end
		end
		if f3_local2 == "killstreak_splash" then
			f3_local4 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f3_local1, KillstreakTable.Cols.DPadIcon )
			self:setText( Engine.Localize( "LUA_MP_COMMON_KILLSTREAK_READY", f3_local5 ) )
		else
			assert( f3_local2 == "killstreak_coop_splash" )
			f3_local4 = Engine.TableLookupByRow( SplashTable.File, f3_local0, SplashTable.Cols.Image )
			self:setText( f3_local5 )
		end
		self:setText( f3_local6 )
		self:setImage( RegisterMaterial( f3_local4 ) )
		local f3_local8 = {}
		for f3_local7 = 1, f2_local5, 1 do
			local f3_local11 = Game.GetOmnvar( "ui_splash_killstreak_mod_" .. f3_local7 )
			if f3_local11 >= 0 then
				table.insert( f3_local8, Engine.TableLookupByRow( KillstreakModulesTable.File, f3_local11, KillstreakModulesTable.Cols.Icon ) )
			end
		end
		if #f3_local8 > 0 then
			self.mods = LUI.UIHorizontalList.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				height = f2_local6,
				left = 0,
				right = 0,
				alignment = LUI.HorizontalAlignment.Center
			} )
			self.mods:setPriority( 2 )
			self.mods.id = "modules"
			self:addElement( self.mods )
			for f3_local12, f3_local11 in ipairs( f3_local8 ) do
				local self = LUI.UIImage.new( {
					material = RegisterMaterial( f3_local11 ),
					topAnchor = true,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					top = 0,
					height = f2_local6,
					left = 0,
					width = f2_local6
				} )
				self.id = "moduleIcon_" .. f3_local12
				self.mods:addElement( self )
			end
		end
		f3_local7 = MBh.AnimateSequence( {
			{
				"visible",
				100
			},
			{
				"visible",
				f3_local3
			},
			{
				"default",
				100
			}
		} )
		f3_local7( self )
	end )
	return self
end

LUI.MenuBuilder.registerType( "killstreakEarned", killstreakEarned )
LockTable( _M )
