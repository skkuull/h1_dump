local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = "0"
	if f1_arg1.newValue < 1 then
		f1_arg0.ammoIcon:animateToState( "no_ammo", 0 )
		f1_arg0.ammoText:animateToState( "no_ammo", 0 )
	else
		f1_local0 = tostring( f1_arg1.newValue )
		f1_arg0.ammoIcon:animateToState( "default", 0 )
		f1_arg0.ammoText:animateToState( "default", 0 )
	end
	f1_arg0.ammoText:setText( f1_local0 )
	if f1_arg0.cachedEvent then
		f1_arg0.cachedEvent = false
		f1_arg0:registerEventHandler( "playerstate_client_changed", function ( element, event )
			
		end )
	end
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	return function ( f4_arg0, f4_arg1 )
		if Game.GetPlayerHealth() > 0 or (Game.GetOmnvar( "ui_session_state" ) == "spectator") or Game.InKillCam() then
			f3_arg0( f4_arg0, f4_arg1 )
		elseif f3_arg1 then
			f4_arg0.cachedEvent = true
			local f4_local0 = f0_local1( f3_arg0, f3_arg1 )
			f4_arg0:registerEventHandler( "playerstate_client_changed", function ( element, event )
				f4_local0( f4_arg0, f4_arg1 )
			end )
		end
	end
	
end

f0_local2 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = CoD.CreateState( nil, nil, -f6_arg0, nil, CoD.AnchorTypes.BottomRight )
	f6_local0.width = 85
	f6_local0.height = 85
	local self = LUI.UIElement.new( f6_local0 )
	local f6_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f6_local2.material = RegisterMaterial( "h1_hud_box_blur" )
	self:addElement( LUI.UIImage.new( f6_local2 ) )
	local f6_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f6_local3.material = RegisterMaterial( "h1_hud_box_border" )
	f6_local3.color = CoD.HudStandards.overlayTint
	self:addElement( LUI.UIImage.new( f6_local3 ) )
	local f6_local4 = CoD.CreateState( nil, nil, -3, -3, CoD.AnchorTypes.BottomRight )
	f6_local4.width = 42
	f6_local4.height = 42
	f6_local4.alpha = 1
	local self = LUI.UIImage.new( f6_local4 )
	self:setupUIBindImage( f6_arg1 )
	self:addElement( self )
	self:registerAnimationState( "no_ammo", {
		alpha = 0.5
	} )
	local f6_local6 = CoD.CreateState( 3, nil, -3, -5, CoD.AnchorTypes.BottomLeftRight )
	f6_local6.alignment = LUI.Alignment.Right
	f6_local6.font = CoD.TextSettings.SP_HudItemAmmoFont.Font
	f6_local6.height = CoD.TextSettings.SP_HudItemAmmoFont.Height * 0.75
	f6_local6.textStyle = CoD.TextStyle.Shadowed
	f6_local6.color = Colors.white
	local self = LUI.UIText.new( f6_local6 )
	self:addElement( self )
	self:registerAnimationState( "no_ammo", {
		color = Colors.red
	} )
	local self = LUI.UIElement.new()
	self.id = f6_arg2 .. "_id"
	self:setupUIIntWatch( f6_arg2 )
	self.ammoText = self
	self.ammoIcon = self
	self:registerEventHandler( "int_watch_alert", f0_local1( f0_local0, true ) )
	self:addElement( self )
	return self
end

local f0_local3 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Game.GetPlayerWeaponDisplayName() or ""
	f7_arg0:setText( f7_local0 )
	if f7_local0 == "Rangers" and f7_arg0.dualAmmoRef ~= nil then
		f7_arg0.dualAmmoRef:show()
	else
		f7_arg0.dualAmmoRef:hide()
	end
end

function updateAmmoEmptyText( f8_arg0, f8_arg1 )
	local f8_local0 = Game.GetPlayerWeaponName()
	local f8_local1 = Game.GetPlayerStockAmmo()
	local f8_local2 = Game.GetPlayerMaxStockAmmo()
	local f8_local3 = Game.IsStockAmmoHidden()
	f8_arg0.ammoText:setText( f8_local1 )
	if currentWeaponName ~= "" and currentWeaponName ~= "none" then
		local f8_local4 = "default"
		if f8_local3 then
			f8_local4 = "hidden"
		elseif f8_local2 > 0 and f8_local1 <= f8_local2 * 0.2 then
			f8_local4 = "depleted"
		end
		if f8_arg0.currentState ~= f8_local4 then
			f8_arg0.ammoText:animateToState( f8_local4 )
			f8_arg0.ammoText.currentState = f8_local4
		end
		if f8_local1 > 99 then
			f8_arg0.ammoBelt:animateToState( "three_digits" )
			f8_arg0.weaponName:animateToState( "three_digits" )
			if f8_arg0.ammoBeltLeft ~= nil then
				f8_arg0.ammoBeltLeft:animateToState( "three_digits" )
			end
		elseif f8_local1 > 9 then
			f8_arg0.ammoBelt:animateToState( "two_digits" )
			f8_arg0.weaponName:animateToState( "two_digits" )
			if f8_arg0.ammoBeltLeft ~= nil then
				f8_arg0.ammoBeltLeft:animateToState( "two_digits" )
			end
		elseif f8_local3 ~= true then
			f8_arg0.ammoBelt:animateToState( "one_digits" )
			f8_arg0.weaponName:animateToState( "one_digits" )
			if f8_arg0.ammoBeltLeft ~= nil then
				f8_arg0.ammoBeltLeft:animateToState( "one_digits" )
			end
		else
			f8_arg0.ammoBelt:animateToState( "no_digits" )
			f8_arg0.weaponName:animateToState( "no_digits" )
			if f8_arg0.ammoBeltLeft ~= nil then
				f8_arg0.ammoBeltLeft:animateToState( "no_digits" )
			end
		end
	end
end

local f0_local4 = function ()
	local f9_local0 = Engine.GetDvarString( "ui_gametype" )
	local f9_local1 = 0
	if f9_local0 == "gun" then
		f9_local1 = CoD.HudStandards.boxSpacing * 2
	end
	local f9_local2 = CoD.CreateState( nil, nil, -(2 * CoD.HudStandards.boxSpacing) + f9_local1, nil, CoD.AnchorTypes.BottomRight )
	f9_local2.width = 342
	f9_local2.height = 85
	local self = LUI.UIElement.new( f9_local2 )
	local f9_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local4.material = RegisterMaterial( "h1_hud_weapwidget_blur" )
	self:addElement( LUI.UIImage.new( f9_local4 ) )
	local f9_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local5.material = RegisterMaterial( "h1_hud_weapwidget_border" )
	f9_local5.color = CoD.HudStandards.overlayTint
	self:addElement( LUI.UIImage.new( f9_local5 ) )
	local f9_local6 = CoD.CreateState( 273, 56, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIElement.new( f9_local6 )
	self:setupOwnerdraw( CoD.Ownerdraw.CGAmmoMagazine, 1, CoD.TextStyle.Shadowed )
	self:addElement( self )
	local f9_local8 = CoD.CreateState( 273, 62, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIElement.new( f9_local8 )
	self:setupOwnerdraw( CoD.Ownerdraw.CGAmmoMagazineLeftHand, 1, CoD.TextStyle.Shadowed )
	self:addElement( self )
	self:registerAnimationState( "three_digits", f9_local6 )
	self:registerAnimationState( "two_digits", CoD.CreateState( 293, 56, 0, 0, CoD.AnchorTypes.All ) )
	self:registerAnimationState( "one_digits", CoD.CreateState( 313, 56, 0, 0, CoD.AnchorTypes.All ) )
	self:registerAnimationState( "no_digits", CoD.CreateState( 333, 56, 0, 0, CoD.AnchorTypes.All ) )
	self:registerAnimationState( "three_digits", f9_local8 )
	self:registerAnimationState( "two_digits", CoD.CreateState( 293, 62, 0, 0, CoD.AnchorTypes.All ) )
	self:registerAnimationState( "one_digits", CoD.CreateState( 313, 62, 0, 0, CoD.AnchorTypes.All ) )
	self:registerAnimationState( "no_digits", CoD.CreateState( 333, 62, 0, 0, CoD.AnchorTypes.All ) )
	self:hide()
	local f9_local10 = CoD.CreateState( 0, nil, -8, -4, CoD.AnchorTypes.BottomLeftRight )
	f9_local10.alignment = LUI.Alignment.Right
	f9_local10.font = CoD.TextSettings.SP_HudAmmoCounterFont.Font
	f9_local10.height = CoD.TextSettings.SP_HudAmmoCounterFont.Height
	f9_local10.textStyle = CoD.TextStyle.Shadowed
	f9_local10.color = Colors.white
	f9_local10.alpha = 1
	local self = LUI.UIText.new( f9_local10 )
	self:addElement( self )
	self:registerAnimationState( "depleted", {
		color = Swatches.HUD.Warning,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local f9_local12 = CoD.CreateState( 0, nil, -71, -20, CoD.AnchorTypes.BottomLeftRight )
	f9_local12.alignment = LUI.Alignment.Right
	f9_local12.font = CoD.TextSettings.SP_HudWeaponNameFont.Font
	f9_local12.height = CoD.TextSettings.SP_HudWeaponNameFont.Height
	f9_local12.textStyle = CoD.TextStyle.Shadowed
	local self = LUI.UIText.new( f9_local12 )
	self.dualAmmoRef = self
	self:setupAutoScaleText()
	local f9_local14 = f0_local1( f0_local3 )
	self:registerEventHandler( "weapon_change", f9_local14 )
	self:registerEventHandler( "playerstate_client_changed", f9_local14 )
	self:addElement( self )
	self:registerAnimationState( "three_digits", f9_local12 )
	local f9_local15 = CoD.CreateState( 0, nil, -51, -20, CoD.AnchorTypes.BottomLeftRight )
	f9_local15.alignment = LUI.Alignment.Right
	f9_local15.font = CoD.TextSettings.SP_HudWeaponNameFont.Font
	f9_local15.height = CoD.TextSettings.SP_HudWeaponNameFont.Height
	f9_local15.textStyle = CoD.TextStyle.Shadowed
	self:registerAnimationState( "two_digits", f9_local15 )
	local f9_local16 = CoD.CreateState( 0, nil, -31, -20, CoD.AnchorTypes.BottomLeftRight )
	f9_local16.alignment = LUI.Alignment.Right
	f9_local16.font = CoD.TextSettings.SP_HudWeaponNameFont.Font
	f9_local16.height = CoD.TextSettings.SP_HudWeaponNameFont.Height
	f9_local16.textStyle = CoD.TextStyle.Shadowed
	self:registerAnimationState( "one_digits", f9_local16 )
	local f9_local17 = CoD.CreateState( 0, nil, -11, -20, CoD.AnchorTypes.BottomLeftRight )
	f9_local17.alignment = LUI.Alignment.Right
	f9_local17.font = CoD.TextSettings.SP_HudWeaponNameFont.Font
	f9_local17.height = CoD.TextSettings.SP_HudWeaponNameFont.Height
	f9_local17.textStyle = CoD.TextStyle.Shadowed
	self:registerAnimationState( "no_digits", f9_local17 )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "StockAmmo" )
	self.ammoText = self
	self.ammoBelt = self
	self.ammoBeltLeft = self
	self.weaponName = self
	local f9_local19 = f0_local1( updateAmmoEmptyText )
	self:registerEventHandler( "int_watch_alert", f9_local19 )
	self:registerEventHandler( "weapon_change", f9_local19 )
	self:addElement( self )
	updateAmmoEmptyText( self, nil )
	return self
end

function weaponInfoHudDef()
	local f10_local0
	if GameX.IsRankedMatch() and not GameX.IsSplitscreen() then
		f10_local0 = -30
		if not f10_local0 then
		
		else
			local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, f10_local0, CoD.AnchorTypes.All ) )
			if Engine.GetDvarString( "ui_gametype" ) ~= "gun" then
				self:addElement( f0_local2( 0, "FragMaterial", "LethalCount" ) )
				self:addElement( f0_local2( CoD.HudStandards.boxSpacing, "FlashMaterial", "TacticalCount" ) )
			end
			self:addElement( f0_local4() )
			return self
		end
	end
	f10_local0 = 0
end

LUI.MenuBuilder.registerType( "weaponInfoHudDef", weaponInfoHudDef )
LockTable( _M )
