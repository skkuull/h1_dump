local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	local f1_local0 = 0
	while Engine.TableLookupByRow( WeaponOverlaysTable.File, f1_local0, WeaponOverlaysTable.Cols.SimpleName ) ~= "" do
		if string.find( f1_arg0, Engine.TableLookupByRow( WeaponOverlaysTable.File, f1_local0, WeaponOverlaysTable.Cols.SimpleName ) ) ~= nil then
			return true
		end
		f1_local0 = f1_local0 + 1
	end
	return false
end

f0_local1 = function ()
	local f2_local0 = Game.GetPlayerWeaponName()
	local f2_local1 = ""
	local f2_local2 = 0
	while Engine.TableLookupByRow( WeaponOverlaysTable.File, f2_local2, WeaponOverlaysTable.Cols.SimpleName ) ~= "" do
		local f2_local3 = Engine.TableLookupByRow( WeaponOverlaysTable.File, f2_local2, WeaponOverlaysTable.Cols.SimpleName )
		if string.find( f2_local0, f2_local3 ) ~= nil then
			f2_local1 = f2_local3
			break
		end
		f2_local2 = f2_local2 + 1
	end
	return f2_local1
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.enemyTarget
	local f3_local1 = f3_arg1.friendlyTarget
	local f3_local2 = "normal"
	if f3_local0 then
		f3_local2 = "enemies"
	elseif f3_local1 then
		f3_local2 = "allies"
	end
	f3_arg0:animateToState( f3_local2, 0 )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = assert
	local f4_local1 = f4_arg0
	local f4_local2 = f4_arg0.material_column
	if f4_local2 then
		f4_local2 = f4_local1 and f4_arg1
	end
	f4_local0( f4_local2 )
	f4_local0 = math.min( f4_arg1, 4 )
	f4_local2 = 95
	local f4_local3 = {
		{
			left = -f4_local2
		},
		{
			right = f4_local2
		},
		{
			bottom = f4_local2
		},
		{
			top = -f4_local2
		}
	}
	local f4_local4 = Engine.TableLookup( WeaponOverlaysTable.File, WeaponOverlaysTable.Cols.SimpleName, f0_local1(), f4_arg0.material_column )
	for f4_local5 = 1, f4_local0, 1 do
		local f4_local8 = f4_local3[f4_local5]
		for f4_local12, f4_local13 in pairs( {
			width = 16,
			height = 16,
			material = RegisterMaterial( f4_local4 )
		} ) do
			f4_local8[f4_local12] = f4_local13
		end
		self = LUI.UIImage.new( f4_local8 )
		self:registerAnimationState( "normal", {
			color = Swatches.HUD.Normal
		} )
		self:registerAnimationState( "allies", {
			color = Swatches.HUD.Party
		} )
		self:registerAnimationState( "enemies", {
			color = Swatches.HUD.Caution
		} )
		self:registerEventHandler( "update_crosshair_entity", f0_local2 )
		f4_arg0:addElement( self )
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = "black"
	local f5_local1 = 1
	local f5_local2 = f5_arg1 * 0.5
	local f5_local3 = 360
	local f5_local4 = 640
	local f5_local5 = f5_local3 - f5_local2
	local f5_local6 = f5_local4 - f5_local2
	local self = LUI.UIImage.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = f5_local5,
		left = 0,
		right = 0,
		material = RegisterMaterial( f5_local0 ),
		depth = f5_local1
	} )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = -f5_local5,
		bottom = 0,
		left = 0,
		right = 0,
		material = RegisterMaterial( f5_local0 ),
		depth = f5_local1
	} )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		height = f5_arg1,
		left = -f5_arg1,
		width = f5_local2,
		material = RegisterMaterial( f5_local0 ),
		depth = f5_local1
	} )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		height = f5_arg1,
		right = f5_arg1,
		width = f5_local2,
		material = RegisterMaterial( f5_local0 ),
		depth = f5_local1
	} )
	f5_arg0:addElement( self )
	f5_arg0:addElement( self )
	f5_arg0:addElement( self )
	f5_arg0:addElement( self )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	assert( f6_arg0, "Main Element Not Able To Reference Within UpdateADSOverlayVisibility..." )
	local f6_local0 = Game.SpectatingThirdPerson()
	local f6_local1 = Game.PlayerOnTurret()
	local f6_local2 = Game.PlayerReticleZoom()
	local f6_local3 = Game.GetPlayerWeaponName()
	if not (f6_local0 or not f6_local2 or not f0_local0( f6_local3 )) or string.find( f6_local3, "scopevz" ) and not f6_local1 then
		if f6_arg0.weaponName ~= f6_local3 then
			f6_arg0.weaponName = f6_local3
			f6_arg0:processEvent( {
				name = "updateADSMaterials",
				dispatchChildren = true
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
	assert( f7_arg0.material_column, "Material Column Number Not Specified!" )
	local f7_local0 = f0_local1()
	local f7_local1 = f7_arg0.material_column
	local f7_local2 = Engine.TableLookup( WeaponOverlaysTable.File, WeaponOverlaysTable.Cols.SimpleName, f7_local0, WeaponOverlaysTable.Cols.BackgroundOverlay ) ~= "none"
	local f7_local3 = nil
	if f7_local1 == WeaponOverlaysTable.Cols.BackgroundOverlay then
		if f7_local2 then
			local f7_local4 = 1
		end
		f7_local3 = f7_local4 or 0
	else
		if f7_local2 then
			local f7_local5 = 0
		end
		f7_local3 = f7_local5 or 1
	end
	CoD.SetMaterial( f7_arg0, RegisterMaterial( Engine.TableLookup( WeaponOverlaysTable.File, WeaponOverlaysTable.Cols.SimpleName, f7_local0, f7_local1 ) ), f7_local3 )
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	assert( f8_arg0.material_column, "Material Column Number Not Specified!" )
	local f8_local0 = Engine.TableLookup( WeaponOverlaysTable.File, WeaponOverlaysTable.Cols.SimpleName, f0_local1(), WeaponOverlaysTable.Cols.BackgroundOverlay ) ~= "none"
	f8_arg0:closeChildren()
	if not f8_local0 then
		f0_local3( f8_arg0, 2 )
	end
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	local f9_local0
	if Engine.TableLookup( WeaponOverlaysTable.File, WeaponOverlaysTable.Cols.SimpleName, f0_local1(), WeaponOverlaysTable.Cols.BackgroundOverlay ) ~= "none" then
		f9_local0 = 0
		if not f9_local0 then
		
		else
			f9_arg0:registerAnimationState( "updated", {
				alpha = f9_local0
			} )
			f9_arg0:animateToState( "updated", 0 )
		end
	end
	f9_local0 = 1
end

LUI.MenuBuilder.registerType( "adsOverlayHud", function ()
	local f10_local0 = 720
	local f10_local1 = 720
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	self.id = "ADSOverlayId"
	self.weaponName = ""
	self:setupUIIntWatch( "IsReticleZoom" )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerEventHandler( "show", MBh.AnimateToState( "show", 100 ) )
	self:registerEventHandler( "hide", MBh.AnimateToState( "hide", 100 ) )
	self:registerEventHandler( "updateADSMaterials", MBh.AnimateToState( "show", 100 ) )
	self:registerEventHandler( "int_watch_alert", f0_local5 )
	self:registerEventHandler( "weapon_change", f0_local5 )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( "PlayerOnTurret" )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		f0_local5( element:getParent(), event )
	end )
	local self = LUI.UIImage.new( {
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
	self.id = "sniperScopeOverlayBackgroundOverlay_id"
	self.material_column = WeaponOverlaysTable.Cols.BackgroundOverlay
	self:registerEventHandler( "updateADSMaterials", f0_local6 )
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
	self.id = "sniperScopeOverlayBackgroundBlur_id"
	self:registerEventHandler( "updateADSMaterials", f0_local8 )
	f0_local4( self, f10_local0 )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = f10_local0,
		height = f10_local1,
		color = Colors.white,
		alpha = 1
	} )
	self.id = "sniperScopeOverlayReticuleBlur_id"
	self.material_column = WeaponOverlaysTable.Cols.BackgroundBlur
	self:registerEventHandler( "updateADSMaterials", f0_local6 )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = f10_local0,
		height = f10_local1,
		alpha = 1
	} )
	self.id = "sniperScopeOverlayReticule_id"
	self.material_column = WeaponOverlaysTable.Cols.Reticule
	self:registerEventHandler( "updateADSMaterials", f0_local6 )
	local self = LUI.UIImage.new( {
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
	self.id = "sniperScopeOverlayVignette_id"
	self.material_column = WeaponOverlaysTable.Cols.Vignette
	self:registerEventHandler( "updateADSMaterials", f0_local6 )
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = f10_local0,
		height = f10_local1,
		alpha = 1
	} )
	self.id = "sniperScopeOverlayTargetMarkers_id"
	self.material_column = WeaponOverlaysTable.Cols.TargetMarker
	self:registerEventHandler( "updateADSMaterials", f0_local7 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	f0_local5( self, {
		name = "init"
	} )
	return self
end )
LockTable( _M )
