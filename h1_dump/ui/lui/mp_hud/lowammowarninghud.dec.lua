local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function shouldWeaponShowAmmo( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = Game.GetPlayerWeaponName()
	end
	if f1_arg0.current_weaponName ~= f1_arg1 then
		f1_arg0.current_weaponName = f1_arg1
		f1_arg0.current_showAmmo = false
		if f1_arg1 == "none" then
			f1_arg0.current_showAmmo = false
			return false
		elseif string.find( f1_arg1, "riotshield" ) then
			f1_arg0.current_showAmmo = false
			return false
		elseif CoD.WeaponListKillstreak[f1_arg1] ~= nil or CoD.WeaponListSpecial[f1_arg1] ~= nil then
			f1_arg0.current_showAmmo = false
			return false
		else
			f1_arg0.current_showAmmo = true
			return true
		end
	else
		return f1_arg0.current_showAmmo
	end
end

function updateAmmoEmptyText( f2_arg0, f2_arg1 )
	assert( f2_arg1 )
	local f2_local0 = f2_arg1.isPrimary or false
	local f2_local1 = f2_arg1.isSecondary or false
	local f2_local2 = f2_arg1.isStock or false
	local f2_local3 = Game.GetPlayerWeaponDisplayName()
	local f2_local4 = Game.GetPlayerWeaponName()
	local f2_local5 = string.find( f2_local4, "akimbo" ) ~= nil
	local f2_local6 = Game.GetPlayerWeaponClass( 1 )
	local f2_local7 = f2_local6 == WeaponClasses.Sniper
	local f2_local8 = f2_local6 == WeaponClasses.RocketLauncher
	local f2_local9 = string.find( f2_local4, "rw1" ) ~= nil
	local f2_local10 = Game.GetPlayerStockAmmo()
	local f2_local11 = Game.GetPlayerClipAmmo( 1 )
	local f2_local12 = Game.GetPlayerClipAmmo( 2 )
	local f2_local13 = Game.GetPlayerMaxClipAmmo( 1 )
	local f2_local14
	if f2_local7 then
		f2_local14 = f2_local13 * 0.33
		if not f2_local14 then
		
		else
			if f2_local14 == 0 then
				if f2_local8 or f2_local9 then
					local f2_local15 = 0
				end
				f2_local14 = f2_local15 or math.max( 3, math.ceil( f2_local13 * 0.33 ) )
			end
			local f2_local16 = Game.IsStockAmmoHidden()
			if f2_local3 ~= "" and f2_local3 ~= "none" then
				local f2_local17 = "default"
				if f2_local2 and f2_local16 then
					f2_local17 = "hidden"
				elseif f2_local2 and f2_local10 == 0 then
					f2_local17 = "depleted"
				elseif f2_local0 and f2_local11 <= f2_local14 then
					f2_local17 = "depleted"
				elseif f2_local1 and f2_local12 <= f2_local14 then
					f2_local17 = "depleted"
				end
				if f2_arg0.currentState ~= f2_local17 then
					f2_arg0:animateToState( f2_local17 )
					f2_arg0.currentState = f2_local17
				end
			end
		end
	end
	f2_local14 = 0
end

function updateAmmoWarningText( f3_arg0, f3_arg1 )
	assert( f3_arg1 )
	local f3_local0 = Game.GetPlayerWeaponName()
	if shouldWeaponShowAmmo( f3_arg0, f3_local0 ) and Game.PlayerCanReloadWeapon() and Game.GetPlayerMaxClipAmmo( 1 ) > 0 then
		local f3_local1 = Game.GetPlayerStockAmmo()
		local f3_local2 = Game.GetPlayerMaxClipAmmo()
		local f3_local3 = Game.GetPlayerClipAmmo( 1 )
		local f3_local4 = Game.GetPlayerClipAmmo( 2 )
		local f3_local5 = 0.33
		local f3_local6 = ""
		local f3_local7 = "default"
		local f3_local8 = "reset"
		local f3_local9 = string.find( f3_local0, "akimbo" ) ~= nil
		if not (f3_local9 ~= false or f3_local3 ~= 0 or f3_local1 ~= 0) or f3_local9 == true and f3_local3 == 0 and f3_local4 == 0 and f3_local1 == 0 then
			f3_local6 = Engine.Localize( "@WEAPON_NO_AMMO_CAPS" )
			f3_local7 = "no_ammo"
			f3_local8 = "warning"
		elseif f3_local3 <= f3_local2 * f3_local5 or f3_local9 and f3_local4 <= f3_local2 * f3_local5 then
			if f3_local1 == 0 then
				f3_local6 = Engine.Localize( "@PLATFORM_LOW_AMMO_NO_RELOAD_CAPS" )
				f3_local7 = "low_ammo"
				f3_local8 = "caution"
			elseif f3_local3 ~= 0 or f3_local9 and f3_local4 ~= 0 then
				f3_local6 = Engine.Localize( "@PLATFORM_RELOAD_CAPS" )
				f3_local7 = "reloading"
				f3_local8 = "warning"
			end
		end
		f3_arg0:show()
		if f3_arg0.current_state ~= f3_local7 then
			f3_arg0.current_state = f3_local7
			f3_arg0:processEvent( {
				name = "update_message_text",
				dispatchChildren = true,
				text = f3_local6
			} )
			f3_arg0:processEvent( {
				name = f3_local8,
				dispatchChildren = true
			} )
		end
	else
		f3_arg0:hide()
	end
end

function lowAmmoWarningHudDef()
	local f4_local0 = Engine.UsingSplitscreenUpscaling()
	local f4_local1
	if f4_local0 then
		f4_local1 = 105
		if not f4_local1 then
		
		else
			local f4_local2
			if f4_local0 then
				f4_local2 = true
			else
				f4_local2 = false
			end
			local self = LUI.UIElement.new( {
				topAnchor = f4_local2,
				bottomAnchor = not f4_local2,
				leftAnchor = false,
				rightAnchor = false,
				bottom = f4_local1,
				width = 400,
				height = 32
			} )
			self.id = "lowAmmoWarningHud"
			local self = LUI.UIImage.new( {
				width = 140,
				height = 74,
				material = RegisterMaterial( "h1_ui_reload_bg" ),
				alpha = 0
			} )
			self.id = "lowAmmoWarningBackground_id"
			self:registerAnimationState( "warning", {
				color = Swatches.HUD.Warning,
				alpha = 1
			} )
			self:registerAnimationState( "caution", {
				color = Swatches.HUD.Caution,
				alpha = 1
			} )
			self:registerEventHandler( "warning", MBh.AnimateToState( "warning", 100 ) )
			self:registerEventHandler( "caution", MBh.AnimateToState( "caution", 100 ) )
			self:registerEventHandler( "reset", MBh.AnimateToState( "default", 100 ) )
			local self = LUI.UIText.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				top = 9,
				left = 0,
				right = 0,
				height = 16,
				font = CoD.TextSettings.TitleFontBold.Font,
				alignment = LUI.Alignment.Center,
				color = Swatches.HUD.Normal,
				alpha = 0
			} )
			self.id = "lowAmmoWarningMessageText_id"
			self:setText( "" )
			self:registerAnimationState( "warning", {
				color = Swatches.HUD.Warning,
				alpha = 1
			} )
			self:registerAnimationState( "caution", {
				color = Swatches.HUD.Caution,
				alpha = 1
			} )
			self:registerAnimationState( "caution_off", {
				color = Swatches.HUD.Caution,
				alpha = 0
			} )
			self:registerEventHandler( "warning", MBh.AnimateToState( "warning", 100 ) )
			self:registerEventHandler( "caution", MBh.AnimateToState( "caution", 100 ) )
			self:registerEventHandler( "reset", MBh.AnimateToState( "default", 100 ) )
			self:registerEventHandler( "flash_low_ammo", MBh.AnimateLoop( {
				{
					"caution",
					500
				},
				{
					"caution_off",
					0
				}
			} ) )
			self:registerEventHandler( "update_message_text", function ( element, event )
				assert( event )
				element:setText( event.text )
			end )
			local f4_local6 = function ( f6_arg0, f6_arg1 )
				updateAmmoWarningText( self, {} )
			end
			
			f4_local6()
			self:addElement( self )
			self:addElement( self )
			local self = LUI.UIElement.new()
			self:setupUIIntWatch( "ClipAmmoLeft" )
			self.id = "clip_ammo_left_watch"
			self:registerEventHandler( "int_watch_alert", f4_local6 )
			self:registerEventHandler( "weapon_change", f4_local6 )
			self:addElement( self )
			local self = LUI.UIElement.new()
			self:setupUIIntWatch( "ClipAmmoRight" )
			self.id = "clip_ammo_right_watch"
			self:registerEventHandler( "int_watch_alert", f4_local6 )
			self:registerEventHandler( "weapon_change", f4_local6 )
			self:addElement( self )
			return self
		end
	end
	f4_local1 = -210
end

LUI.MenuBuilder.registerType( "lowAmmoWarningHudDef", lowAmmoWarningHudDef )
LockTable( _M )
