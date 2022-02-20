LUI.CacWeaponAttributes = InheritFrom( LUI.UIElement )
LUI.CacWeaponAttributes.AnimationSpeed = 250
LUI.CacWeaponAttributes.WhiteAlpha = 0.7
LUI.CacWeaponAttributes.ColorAlpha = 0.2
LUI.CacWeaponAttributes.WhiteBarColor = {
	r = 0.86,
	g = 0.86,
	b = 0.86
}
LUI.CacWeaponAttributes.GreenColor = Colors.mw1_green
LUI.CacWeaponAttributes.RedColor = {
	r = 0.95,
	g = 0.17,
	b = 0.17
}
LUI.CacWeaponAttributes.BarWidth = 145
LUI.CacWeaponAttributes.BarHeight = 10
LUI.CacWeaponAttributes.Refresh = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = {
		accuracy = Cac.GetWeaponAccuracy( f1_arg1 ),
		damage = Cac.GetWeaponDamage( f1_arg1 ),
		range = Cac.GetWeaponRange( f1_arg1 ),
		fireRate = Cac.GetWeaponFireRate( f1_arg1 ),
		mobility = Cac.GetWeaponMobility( f1_arg1 )
	}
	local f1_local1 = 1
	local f1_local2 = 1
	if f1_arg1 == "ak_acog" and f1_arg3 ~= nil and Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f1_arg3, StatsTable.Cols.Group ) == "weapon_sniper" then
		f1_local1 = 0
		f1_local2 = -1
	end
	local f1_local3 = f1_arg0.equippedData or f1_local0
	if f1_arg2 then
		f1_local0.accuracy = f1_local1 * f1_local0.accuracy + f1_local3.accuracy
		f1_local0.damage = f1_local0.damage + f1_local3.damage
		f1_local0.range = f1_local2 * f1_local0.range + f1_arg0.equippedData.range
		f1_local0.fireRate = f1_local0.fireRate + f1_local3.fireRate
		f1_local0.mobility = f1_local0.mobility + f1_local3.mobility
	end
	updateFillbar( f1_arg0.accuracy, f1_local0.accuracy, f1_local3.accuracy )
	updateFillbar( f1_arg0.damage, f1_local0.damage, f1_local3.damage )
	updateFillbar( f1_arg0.range, f1_local0.range, f1_local3.range )
	updateFillbar( f1_arg0.fireRate, f1_local0.fireRate, f1_local3.fireRate )
	updateFillbar( f1_arg0.mobility, f1_local0.mobility, f1_local3.mobility )
end

LUI.CacWeaponAttributes.Show = function ( f2_arg0 )
	f2_arg0:animateToState( "default" )
end

LUI.CacWeaponAttributes.Hide = function ( f3_arg0 )
	f3_arg0:animateToState( "hidden" )
end

LUI.CacWeaponAttributes.new = function ( f4_arg0, f4_arg1 )
	local f4_local0 = 150
	local f4_local1 = LUI.CacWeaponAttributes.BarWidth
	if not f4_arg1 then
		f4_arg1 = 0
	end
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		left = LUI.CacDetails.WeaponBoxLeft + f4_arg1,
		top = 475,
		height = f4_local0,
		width = f4_local1,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		spacing = 7
	} )
	self.equippedData = f4_arg0
	local f4_local4 = createHeader()
	local f4_local5 = createFillBar( 0, Engine.Localize( "@LUA_MENU_WEAPON_STAT_ACCURACY" ) )
	local f4_local6 = createFillBar( 0, Engine.Localize( "@LUA_MENU_WEAPON_STAT_DAMAGE" ) )
	local f4_local7 = createFillBar( 0, Engine.Localize( "@LUA_MENU_WEAPON_STAT_RANGE" ) )
	local f4_local8 = createFillBar( 0, Engine.Localize( "@LUA_MENU_WEAPON_STAT_FIRERATE" ) )
	local f4_local9 = createFillBar( 0, Engine.Localize( "@LUA_MENU_WEAPON_STAT_MOBILITY" ) )
	self.accuracy = f4_local5
	self.damage = f4_local6
	self.range = f4_local7
	self.fireRate = f4_local8
	self.mobility = f4_local9
	local f4_local10 = LUI.Divider.new( {
		leftAnchor = true,
		width = 275
	}, 3 )
	local f4_local11 = LUI.Divider.new( {
		leftAnchor = true,
		width = 75
	}, 3 )
	self:addElement( f4_local4 )
	self:addElement( f4_local10 )
	self:addElement( f4_local5 )
	self:addElement( f4_local6 )
	self:addElement( f4_local7 )
	self:addElement( f4_local8 )
	self:addElement( f4_local9 )
	self:addElement( f4_local11 )
	self:addElement( self )
	self:setClass( LUI.CacWeaponAttributes )
	return self
end

function createHeader()
	local f5_local0 = RegisterMaterial( "h1_deco_container_bg_loading" )
	local f5_local1, f5_local2 = GetMaterialDimensions( f5_local0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		height = 20,
		width = 20 * f5_local1 / f5_local2
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = f5_local0
	} )
	local self = LUI.UIText.new( {
		color = LUI.CacWeaponAttributes.WhiteBarColor,
		font = CoD.TextSettings.BodyFont.Font,
		height = 10
	} )
	self:setText( Engine.Localize( "@LUA_MENU_WEAPON_ATTRIBUTE_HEADER" ) )
	self:addElement( self )
	self:addElement( self )
	return self
end

function createFillBar( f6_arg0, f6_arg1 )
	local f6_local0 = LUI.CacWeaponAttributes.BarWidth
	local f6_local1 = LUI.CacWeaponAttributes.BarHeight
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		height = f6_local1
	} )
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		width = f6_local0,
		height = f6_local1,
		spacing = 7
	} )
	local f6_local4 = normalizeLinearRange( f6_arg0, 0, 100, 0, f6_local0 )
	local self = LUI.UIElement.new( {
		width = 60,
		height = f6_local1 + 4
	} )
	local self = LUI.UIBorder.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		color = LUI.CacWeaponAttributes.WhiteBarColor,
		borderThickness = 1
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		left = 6,
		topAnchor = true,
		top = 3.5,
		color = LUI.CacWeaponAttributes.WhiteBarColor,
		font = CoD.TextSettings.BodyFontSmall.Font,
		height = CoD.TextSettings.BodyFontSmall.Height - 7
	} )
	self:setText( f6_arg1 )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		topAnchor = true,
		width = f6_local4
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		topAnchor = true,
		material = RegisterMaterial( "white" ),
		color = LUI.CacWeaponAttributes.WhiteBarColor,
		alpha = 0.8
	} )
	local self = LUI.UIBorder.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		topAnchor = true,
		material = RegisterMaterial( "white" ),
		color = LUI.CacWeaponAttributes.WhiteBarColor,
		borderThickness = 1
	} )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		topAnchor = true,
		width = f6_local4
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		topAnchor = true,
		material = RegisterMaterial( "white" )
	} )
	local self = LUI.UIBorder.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		topAnchor = true,
		material = RegisterMaterial( "white" ),
		borderThickness = 1
	} )
	self:addElement( self )
	self:addElement( self )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		topAnchor = true,
		top = 0,
		width = 60
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		color = Colors.white,
		width = 10,
		right = -45,
		rightAnchor = true,
		font = CoD.TextSettings.BodyFontSmall.Font,
		height = 10
	} )
	
	local triangle = LUI.UIImage.new( {
		rightAnchor = true,
		topAnchor = true,
		width = 10,
		height = 10,
		right = -30,
		material = RegisterMaterial( "h1_deco_indicator_arrow" )
	} )
	self:addElement( self )
	self:addElement( triangle )
	self.triangle = triangle
	
	self.text = self
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	triangle:registerAnimationState( "positive", {
		color = LUI.CacWeaponAttributes.GreenColor,
		zRot = 180
	} )
	triangle:registerAnimationState( "negative", {
		color = LUI.CacWeaponAttributes.RedColor,
		zRot = 0
	} )
	self:registerAnimationState( "positive", {
		color = LUI.CacWeaponAttributes.GreenColor
	} )
	self:registerAnimationState( "negative", {
		color = LUI.CacWeaponAttributes.RedColor
	} )
	self.bar = self
	self.border = self
	self.bar = self
	self.border = self
	self.whiteElement = self
	self.colorElement = self
	self.numberElement = self
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

function updateFillbar( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = LUI.CacWeaponAttributes.BarWidth
	local f7_local1 = f7_arg2 - f7_arg1
	local f7_local2, f7_local3, f7_local4, f7_local5, f7_local6, f7_local7, f7_local8, f7_local9, f7_local10 = nil
	if f7_local1 < 0 then
		local f7_local11 = f7_local1 * -1
		f7_local2 = f7_arg0.colorElement
		f7_local3 = f7_arg0.whiteElement
		f7_local4 = LUI.CacWeaponAttributes.GreenColor
		f7_local5 = LUI.CacWeaponAttributes.WhiteBarColor
		f7_local8 = LUI.CacWeaponAttributes.ColorAlpha
		f7_local9 = LUI.CacWeaponAttributes.WhiteAlpha
		f7_local6 = f7_local11
		f7_local7 = f7_arg2
		f7_arg0.colorElement:animateToState( "visible" )
		f7_arg0.numberElement:animateToState( "visible" )
		f7_arg0.numberElement.text:setText( f7_local11 )
		f7_arg0.numberElement.text:animateToState( "positive", LUI.CacWeaponAttributes.AnimationSpeed )
		f7_arg0.numberElement.triangle:animateToState( "positive", LUI.CacWeaponAttributes.AnimationSpeed )
	elseif f7_local1 > 0 then
		f7_local2 = f7_arg0.whiteElement
		f7_local3 = f7_arg0.colorElement
		f7_local4 = LUI.CacWeaponAttributes.WhiteBarColor
		f7_local5 = LUI.CacWeaponAttributes.RedColor
		f7_local8 = LUI.CacWeaponAttributes.WhiteAlpha
		f7_local9 = LUI.CacWeaponAttributes.ColorAlpha
		f7_local6 = f7_arg1
		f7_local7 = f7_local1
		f7_arg0.colorElement:animateToState( "visible" )
		f7_arg0.numberElement:animateToState( "visible" )
		f7_arg0.numberElement.text:setText( f7_local1 )
		f7_arg0.numberElement.text:animateToState( "negative", LUI.CacWeaponAttributes.AnimationSpeed )
		f7_arg0.numberElement.triangle:animateToState( "negative", LUI.CacWeaponAttributes.AnimationSpeed )
	else
		f7_local2 = f7_arg0.whiteElement
		f7_local6 = f7_arg1
		f7_local4 = LUI.CacWeaponAttributes.WhiteBarColor
		f7_local8 = LUI.CacWeaponAttributes.WhiteAlpha
		f7_arg0.colorElement:animateToState( "hidden" )
		f7_arg0.numberElement:animateToState( "hidden" )
	end
	f7_local2:registerAnimationState( "updatedValue", {
		leftAnchor = true,
		width = normalizeLinearRange( f7_local6, 0, 100, 0, f7_local0 )
	} )
	f7_local2:animateToState( "updatedValue", LUI.CacWeaponAttributes.AnimationSpeed )
	f7_local2.bar:registerAnimationState( "updatedValue", {
		leftAnchor = true,
		rightAnchor = true,
		color = f7_local4,
		alpha = f7_local8
	} )
	f7_local2.bar:animateToState( "updatedValue", LUI.CacWeaponAttributes.AnimationSpeed, true, true )
	f7_local2.border:registerAnimationState( "updatedValue", {
		leftAnchor = true,
		rightAnchor = true,
		color = f7_local4
	} )
	f7_local2.border:animateToState( "updatedValue", LUI.CacWeaponAttributes.AnimationSpeed, true, true )
	if f7_local3 ~= nil then
		f7_local3:registerAnimationState( "updatedValue", {
			leftAnchor = true,
			width = normalizeLinearRange( f7_local7, 0, 100, 0, f7_local0 ),
			alpha = 1
		} )
		f7_local3:animateToState( "updatedValue", LUI.CacWeaponAttributes.AnimationSpeed )
		f7_local3.bar:registerAnimationState( "updatedValue", {
			leftAnchor = true,
			rightAnchor = true,
			color = f7_local5,
			alpha = f7_local9
		} )
		f7_local3.bar:animateToState( "updatedValue", LUI.CacWeaponAttributes.AnimationSpeed, true, true )
		f7_local3.border:registerAnimationState( "updatedValue", {
			leftAnchor = true,
			rightAnchor = true,
			color = f7_local5
		} )
		f7_local3.border:animateToState( "updatedValue", LUI.CacWeaponAttributes.AnimationSpeed, true, true )
	end
end

function normalizeLinearRange( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	return (f8_arg4 - f8_arg3) / (f8_arg2 - f8_arg1) * (f8_arg0 - f8_arg2) + f8_arg4
end

LUI.MenuBuilder.registerType( "CacWeaponAttributes", LUI.CacWeaponAttributes.new )
