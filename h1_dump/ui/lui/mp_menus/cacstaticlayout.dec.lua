LUI.CacStaticLayout = InheritFrom( LUI.UIElement )
LUI.CacStaticLayout.weaponImageSize = 70
LUI.CacStaticLayout.grenadeImageSize = 60
LUI.CacStaticLayout.perkImageSize = 50
LUI.CacStaticLayout.defaultImageSize = 40
LUI.CacStaticLayout.greyTextColor = {
	r = 0.66,
	g = 0.66,
	b = 0.66
}
LUI.CacStaticLayout.imageGray = {
	r = 0.29,
	g = 0.29,
	b = 0.29
}
LUI.CacStaticLayout.mediumGray = {
	r = 0.21,
	g = 0.21,
	b = 0.21
}
LUI.CacStaticLayout.darkGray = {
	r = 0.11,
	g = 0.11,
	b = 0.11
}
LUI.CacStaticLayout.brightGreen = {
	r = 0.6,
	g = 0.98,
	b = 0.6
}
LUI.CacStaticLayout.camoTextOffset = 14
LUI.CacStaticLayout.perksOffsetText = 13
LUI.CacStaticLayout.grenadesOffsetText = 5
LUI.CacStaticLayout.defaultTextOffset = 14
LUI.CacStaticLayout.mainContainerWidth = nil
LUI.CacStaticLayout.mainBGWidth = nil
LUI.CacStaticLayout.conduitFont = CoD.TextSettings.BodyFont.Font
LUI.CacStaticLayout.Refresh = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	local f1_local1 = #f1_arg0.elements
	if f1_arg0.weaponClassText then
		local f1_local2 = LUI.CacDataProvider.Primary( f1_arg1 )
		f1_arg0.weaponClassText:setText( Engine.Localize( "@LUA_MENU_CAC_CLASS_TYPE", f1_local2.weaponType ) )
	end
	for f1_local2 = 1, f1_local1, 1 do
		f1_local0 = f1_arg0.elements[f1_local2]
		refreshElement( f1_local0, f1_arg1, f1_arg2 )
		if not f1_local0.isCamo and not f1_local0.isReticle then
			refreshLabel( f1_local0, f1_arg1 )
		end
	end
end

function refreshLabel( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.IsDepotEnabled() == true
	f2_arg0.textfield:registerAnimationState( "default", {
		alpha = 1
	} )
	f2_arg0.textfield:registerAnimationState( "alpha", {
		alpha = 0.5
	} )
	local f2_local1 = nil
	if f2_arg0.isWeapon then
		f2_local1 = f2_arg0.dataProvider( f2_arg1 )
		setElementLabel( f2_arg0, f2_local1 )
		f2_arg0.camoElement.textfield:registerAnimationState( "default", {
			alpha = 1
		} )
		f2_arg0.camoElement.textfield:registerAnimationState( "alpha", {
			alpha = 0.5
		} )
		if f2_local0 == true then
			f2_arg0.reticleElement.textfield:registerAnimationState( "default", {
				alpha = 1
			} )
			f2_arg0.reticleElement.textfield:registerAnimationState( "alpha", {
				alpha = 0.5
			} )
		end
		if f2_local1.camoLabel ~= nil then
			f2_arg0.camoElement.textfield:setText( f2_local1.camoLabel )
			f2_arg0.camoElement.textfield:animateToState( "default" )
		else
			f2_arg0.camoElement.textfield:setText( f2_arg0.camoElement.displayName )
			f2_arg0.camoElement.textfield:animateToState( "alpha" )
		end
		if f2_local0 == true then
			if f2_local1.reticleLabel ~= nil then
				f2_arg0.reticleElement.textfield:setText( f2_local1.reticleLabel )
				f2_arg0.reticleElement.textfield:animateToState( "default" )
			else
				f2_arg0.reticleElement.textfield:setText( f2_arg0.reticleElement.displayName )
				f2_arg0.reticleElement.textfield:animateToState( "alpha" )
			end
		end
	elseif f2_arg0.isPerk then
		setElementLabel( f2_arg0, f2_arg0.dataProvider( f2_arg1, f2_arg0.index + 1, math.floor( f2_arg0.index / 3 ) ) )
	elseif f2_arg0.isGrenadeLethal then
		setElementLabel( f2_arg0, f2_arg0.dataProvider( f2_arg1, 0 ) )
	else
		setElementLabel( f2_arg0, f2_arg0.dataProvider( f2_arg1 ) )
	end
end

function setElementLabel( f3_arg0, f3_arg1 )
	if f3_arg1.id ~= nil and f3_arg1.id ~= "" and f3_arg1.id ~= "none" and f3_arg1.id ~= "base" and f3_arg1.id ~= Cac.NullWeaponNames[f3_arg1.weaponCategory] then
		f3_arg0.textfield:setText( f3_arg1.label )
		f3_arg0.textfield:animateToState( "default" )
	else
		f3_arg0.textfield:setText( f3_arg0.displayName )
		f3_arg0.textfield:animateToState( "alpha" )
	end
end

LUI.CacStaticLayout.new = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = Engine.IsDepotEnabled() == true
	if f4_local0 == true then
		LUI.CacStaticLayout.mainContainerWidth = 299
		LUI.CacStaticLayout.mainBGWidth = 309
	else
		LUI.CacStaticLayout.mainContainerWidth = 240
		LUI.CacStaticLayout.mainBGWidth = 250
	end
	if not f4_arg3 then
		f4_arg3 = false
	end
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self.containers = {}
	local f4_local2 = {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		width = LUI.CacStaticLayout.mainContainerWidth,
		top = 32
	}
	local self
	if f4_local0 then
		self = 16
		if not self then
		
		else
			f4_local2.left = self
			self = LUI.UIElement.new( f4_local2 )
			self:setClass( LUI.CacStaticLayout )
			self.id = "CacStaticLayout"
			self.elements = {}
			self:addElement( self )
			self.containers[#self.containers + 1] = self
			local f4_local4 = LUI.UIImage.new
			local f4_local5 = {
				leftAnchor = true,
				topAnchor = true,
				width = 10,
				height = 10,
				left = -25
			}
			local self
			if f4_local0 then
				self = 14
				if not self then
				
				else
					f4_local5.top = self
					f4_local5.material = RegisterMaterial( "h1_ui_deco_green_triangle" )
					self:addElement( f4_local4( f4_local5 ) )
					f4_local5 = LUI.CacStaticLayout.mainBGWidth + 5
					if f4_arg3 == true then
						f4_local5 = f4_local5 + LUI.CacStaticLayout.mainContainerWidth + 38
					end
					self = LUI.UIText.new( {
						leftAnchor = true,
						topAnchor = true,
						height = 8,
						alpha = 0.5,
						width = 180,
						alignment = LUI.Alignment.Left,
						font = LUI.CacStaticLayout.conduitFont,
						left = f4_local5,
						top = 2
					} )
					self:setTextStyle( CoD.TextStyle.ForceUpperCase )
					self:setText( "WEAPON CLASS" )
					self.weaponClassText = self
					self:addElement( self )
					if f4_arg3 == false then
						local self = LUI.UIVerticalList.new( {
							leftAnchor = true,
							topAnchor = true,
							width = LUI.CacStaticLayout.mainContainerWidth,
							spacing = 7
						} )
						local self = createWeaponBox( "Primary", self )
						local self = createWeaponBox( "Secondary", self )
						local self = createGrenadesBox( self )
						local f4_local11 = createPerksBox( self )
						self:addElement( self )
						self:addElement( self )
						self:addElement( self )
						self:addElement( f4_local11 )
						self:addElement( self )
					else
						local self = LUI.UIElement.new( {
							leftAnchor = true,
							topAnchor = true,
							bottomAnchor = true,
							rightAnchor = false,
							width = LUI.CacStaticLayout.mainContainerWidth,
							top = 32,
							left = 30 + LUI.CacStaticLayout.mainContainerWidth + 30
						} )
						self:setClass( LUI.CacStaticLayout )
						self.id = "CacStaticLayout2"
						self.elements = {}
						self:addElement( self )
						self.containers[#self.containers + 1] = self
						local self = LUI.UIVerticalList.new( {
							leftAnchor = true,
							topAnchor = true,
							width = LUI.CacStaticLayout.mainContainerWidth,
							spacing = 7
						} )
						local self = LUI.UIVerticalList.new( {
							leftAnchor = true,
							topAnchor = true,
							width = LUI.CacStaticLayout.mainContainerWidth,
							spacing = 7
						} )
						local f4_local11 = createWeaponBox( "Primary", self )
						local f4_local12 = createWeaponBox( "Secondary", self )
						local f4_local13 = createGrenadesBox( self )
						local f4_local14 = createPerksBox( self )
						self:addElement( f4_local11 )
						self:addElement( f4_local13 )
						self:addElement( f4_local12 )
						self:addElement( f4_local14 )
						self:addElement( self )
						self:addElement( self )
					end
					return self
				end
			end
			self = 2
		end
	end
	self = 30
end

function createWeaponBox( f5_arg0, f5_arg1 )
	local f5_local0 = Engine.IsDepotEnabled() == true
	local f5_local1 = 147
	local f5_local2 = 40
	local f5_local3 = f5_arg0 == "Primary"
	local f5_local4 = LUI.DecoFrame.new( nil )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		height = f5_local1
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = LUI.CacStaticLayout.mainBGWidth,
		height = f5_local1,
		alpha = 0.7,
		top = -5,
		left = -5,
		material = RegisterMaterial( "white" ),
		color = LUI.CacStaticLayout.darkGray
	} )
	self:addElement( self )
	self:addElement( f5_local4 )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 15,
		alpha = 0.2,
		material = RegisterMaterial( "white" ),
		color = LUI.CacStaticLayout.mediumGray
	} )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 15,
		left = 5
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		color = LUI.CacStaticLayout.greyTextColor,
		font = LUI.CacStaticLayout.conduitFont,
		height = 12,
		top = 2.5
	} )
	local self = LUI.UIImage.new( {
		rightAnchor = true,
		width = 10,
		height = 10,
		right = -5,
		material = RegisterMaterial( "h1_deco_double_triangle" ),
		color = LUI.CacStaticLayout.imageGray
	} )
	self:registerAnimationState( "restricted", {
		material = RegisterMaterial( CoD.Material.RestrictedIcon ),
		color = Colors.white,
		rightAnchor = true,
		width = 15,
		height = 15,
		right = -2
	} )
	self:addElement( LUI.Divider.new( {
		leftAnchor = true,
		topAnchor = true,
		width = LUI.CacStaticLayout.mainContainerWidth - 9,
		left = 5,
		top = 68
	}, 5, LUI.Divider.Grey ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = f5_local2,
		top = 19
	} )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = f5_local2,
		top = 96
	} )
	local f5_local13, f5_local14, f5_local15 = nil
	if f5_local3 then
		f5_local13 = LUI.CacDataProvider.Primary
		f5_local14 = LUI.CacDataProvider.PrimaryAttachKit
		if f5_local0 == true then
			f5_local15 = LUI.CacDataProvider.PrimaryFurnitureKit
		end
	else
		f5_local13 = LUI.CacDataProvider.Secondary
		f5_local14 = LUI.CacDataProvider.SecondaryAttachKit
		if f5_local0 == true then
			f5_local15 = LUI.CacDataProvider.SecondaryFurnitureKit
		end
	end
	local self = LUI.UIElement.new( {
		width = LUI.CacStaticLayout.weaponImageSize,
		height = LUI.CacStaticLayout.weaponImageSize
	} )
	self.dataProvider = f5_local13
	self:hide()
	self.isWeapon = true
	addElement( self, f5_arg1 )
	if f5_local3 then
		self.displayName = Engine.Localize( "@LUA_MENU_CAC_PRIMARY_BLANK" )
		self.textfield = self
	else
		self.displayName = Engine.Localize( "@LUA_MENU_CAC_SECONDARY_BLANK" )
		self.textfield = self
	end
	self.doubleTriangle = self
	self.rarityDecal = self
	local f5_local17 = LUI.UIHorizontalList.new
	local self = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true
	}
	local f5_local19
	if f5_local0 then
		f5_local19 = 35
		if not f5_local19 then
		
		else
			self.spacing = f5_local19
			f5_local19
			if f5_local0 then
				f5_local19 = 17
				if not f5_local19 then
				
				else
					self.left = f5_local19
					f5_local17 = f5_local17( self )
					f5_local17:registerAnimationState( "three", {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						spacing = 35,
						left = 57
					} )
					self = LUI.UIElement.new( {
						width = LUI.CacStaticLayout.defaultImageSize,
						height = LUI.CacStaticLayout.defaultImageSize
					} )
					self.isAttachment = true
					self.dataProvider = function ( f6_arg0 )
						return f5_local14( f6_arg0 )
					end
					
					self.displayName = Engine.Localize( "@LUA_MENU_CAC_ATTACHMENT_BLANK" )
					self.textfield = addElementSubtext( self, "", LUI.CacStaticLayout.defaultTextOffset )
					addElement( self, f5_arg1 )
					
					local restrictedIcon = LUI.UIImage.new( {
						material = RegisterMaterial( CoD.Material.RestrictedIcon ),
						color = Colors.white,
						rightAnchor = true,
						topAnchor = true,
						width = 15,
						height = 15,
						right = 8,
						top = -4
					} )
					restrictedIcon:hide()
					self:addElement( restrictedIcon )
					self.restrictedIcon = restrictedIcon
					
					local self, f5_local22 = nil
					if f5_local0 == true then
						self = LUI.UIElement.new( {
							width = LUI.CacStaticLayout.defaultImageSize,
							height = LUI.CacStaticLayout.defaultImageSize
						} )
						self.isFurnitureKit = true
						self.dataProvider = function ( f7_arg0 )
							return f5_local15( f7_arg0 )
						end
						
						self.displayName = Engine.Localize( "@LUA_MENU_WEAPON_KIT" )
						self.textfield = addElementSubtext( self, "", LUI.CacStaticLayout.defaultTextOffset )
						addElement( self, f5_arg1 )
					end
					local self = LUI.UIElement.new( {
						width = LUI.CacStaticLayout.defaultImageSize,
						height = LUI.CacStaticLayout.defaultImageSize
					} )
					self.isCamo = true
					self.displayName = Engine.Localize( "@LUA_MENU_CAC_CAMO_BLANK" )
					local self = LUI.UIImage.new( {
						width = 40,
						height = 40
					} )
					self.camoIcon = self
					self:addElement( self )
					local f5_local25 = addElementSubtext( self, "", LUI.CacStaticLayout.camoTextOffset )
					addElement( self, f5_arg1 )
					self.textfield = f5_local25
					self.camoElement = self
					local self, f5_local27, self = nil
					if f5_local0 == true then
						self = LUI.UIElement.new( {
							width = LUI.CacStaticLayout.defaultImageSize,
							height = LUI.CacStaticLayout.defaultImageSize,
							alpha = 1
						} )
						self:registerAnimationState( "hidden", {
							alpha = 0
						} )
						self.isReticle = true
						self.isPrimary = f5_local3
						f5_local27 = addElementSubtext( self, "", LUI.CacStaticLayout.defaultTextOffset )
						self = LUI.UIImage.new( {
							width = 45,
							height = 45
						} )
						self:registerAnimationState( "hidden", {
							alpha = 0
						} )
						self.reticleIcon = self
						self:addElement( self )
						addElement( self, f5_arg1 )
						self.displayName = Engine.Localize( "@LUA_MENU_CAC_RETICLE_BLANK" )
						self.textfield = f5_local27
						self.reticleElement = self
					end
					f5_local17:addElement( self )
					if f5_local0 == true then
						f5_local17:addElement( self )
					end
					f5_local17:addElement( self )
					if f5_local0 == true then
						f5_local17:addElement( self )
						self.hList = f5_local17
					end
					self:addElement( f5_local17 )
					self:addElement( self )
					self:addElement( self )
					self:addElement( self )
					return self
				end
			end
			f5_local19 = 62
		end
	end
	f5_local19 = 34
end

function createGrenadesBox( f8_arg0 )
	local f8_local0 = Engine.IsDepotEnabled() == true
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 89
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 79,
		alpha = 0.2,
		material = RegisterMaterial( "white" ),
		color = LUI.CacStaticLayout.darkGray
	} )
	local f8_local3 = LUI.DecoFrame.new( nil )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = LUI.CacStaticLayout.mainBGWidth,
		height = 89,
		alpha = 0.7,
		top = -5,
		left = -5,
		material = RegisterMaterial( "white" ),
		color = LUI.CacStaticLayout.darkGray
	} )
	self:addElement( self )
	self:addElement( f8_local3 )
	self:addElement( self )
	local self = LUI.UIElement.new( {
		width = LUI.CacStaticLayout.defaultImageSize,
		height = LUI.CacStaticLayout.grenadeImageSize
	} )
	self.dataProvider = function ( f9_arg0 )
		return LUI.CacDataProvider.Tactical( f9_arg0 )
	end
	
	self.isGrenadeTactical = true
	self.displayName = Engine.Localize( "@LUA_MENU_CAC_GRENADE_BLANK", "1" )
	
	local restrictedIcon = LUI.UIImage.new( {
		material = RegisterMaterial( CoD.Material.RestrictedIcon ),
		color = Colors.white,
		rightAnchor = true,
		topAnchor = true,
		width = 15,
		height = 15,
		right = 8,
		top = 3
	} )
	restrictedIcon:hide()
	self:addElement( restrictedIcon )
	self.restrictedIcon = restrictedIcon
	
	local f8_local7 = addElementSubtext( self, "", LUI.CacStaticLayout.grenadesOffsetText )
	addElement( self, f8_arg0 )
	self.textfield = f8_local7
	local self = LUI.UIElement.new( {
		width = LUI.CacStaticLayout.defaultImageSize,
		height = LUI.CacStaticLayout.grenadeImageSize
	} )
	self.dataProvider = function ( f10_arg0 )
		return LUI.CacDataProvider.Lethal( f10_arg0, 0 )
	end
	
	self.isGrenadeLethal = true
	self.displayName = Engine.Localize( "@LUA_MENU_CAC_GRENADE_BLANK", "2" )
	
	local restrictedIcon = LUI.UIImage.new( {
		material = RegisterMaterial( CoD.Material.RestrictedIcon ),
		color = Colors.white,
		rightAnchor = true,
		topAnchor = true,
		width = 15,
		height = 15,
		right = 8,
		top = 3
	} )
	restrictedIcon:hide()
	self:addElement( restrictedIcon )
	self.restrictedIcon = restrictedIcon
	
	local f8_local10 = addElementSubtext( self, "", LUI.CacStaticLayout.grenadesOffsetText )
	addElement( self, f8_arg0 )
	self.textfield = f8_local10
	local meleeElement, f8_local12, restrictedIcon, f8_local14 = nil
	if f8_local0 == true then
		meleeElement = LUI.UIElement.new( {
			width = LUI.CacStaticLayout.defaultImageSize,
			height = LUI.CacStaticLayout.grenadeImageSize
		} )
		meleeElement.dataProvider = function ( f11_arg0 )
			return LUI.CacDataProvider.Melee( f11_arg0 )
		end
		
		meleeElement.isMelee = true
		meleeElement.displayName = Engine.Localize( "@MENU_MELEE_CAPS" )
		
		restrictedIcon = LUI.UIImage.new( {
			material = RegisterMaterial( CoD.Material.RestrictedIcon ),
			color = Colors.white,
			rightAnchor = true,
			topAnchor = true,
			width = 15,
			height = 15,
			right = 8,
			top = 3
		} )
		restrictedIcon:hide()
		meleeElement:addElement( restrictedIcon )
		meleeElement.restrictedIcon = restrictedIcon
		
		f8_local14 = addElementSubtext( meleeElement, "", LUI.CacStaticLayout.grenadesOffsetText )
		addElement( meleeElement, f8_arg0 )
		meleeElement.textfield = f8_local14
		f8_arg0.meleeText = f8_local14
	end
	f8_arg0.tacticalText = tacticalText
	f8_arg0.lethalText = lethalText
	local f8_local15 = LUI.UIHorizontalList.new
	local f8_local16 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	}
	local f8_local17
	if f8_local0 then
		f8_local17 = 35
		if not f8_local17 then
		
		else
			f8_local16.spacing = f8_local17
			f8_local17
			if f8_local0 then
				f8_local17 = 54.5
				if not f8_local17 then
				
				else
					f8_local16.left = f8_local17
					f8_local16.top = -19
					f8_local15 = f8_local15( f8_local16 )
					if f8_local0 == true then
						f8_local15:addElement( meleeElement )
						f8_local15.meleeElement = meleeElement
						
						meleeElement.grenadesHList = f8_local15
						f8_local15:addSpacer( 2.5 )
					end
					f8_local15:addElement( self )
					f8_local15:addElement( self )
					f8_local15.tacticalElement = self
					f8_local15.lethalElement = self
					self:addElement( f8_local15 )
					return self
				end
			end
			f8_local17 = 62
		end
	end
	f8_local17 = 34
end

function createPerksBox( f12_arg0 )
	local f12_local0 = Engine.IsDepotEnabled() == true
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 80
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = 70,
		alpha = 0.2,
		material = RegisterMaterial( "white" ),
		color = LUI.CacStaticLayout.darkGray
	} )
	local f12_local3 = LUI.DecoFrame.new( nil )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = LUI.CacStaticLayout.mainBGWidth,
		height = 80,
		alpha = 0.7,
		top = -5,
		left = -5,
		material = RegisterMaterial( "white" ),
		color = LUI.CacStaticLayout.darkGray
	} )
	self:addElement( self )
	self:addElement( f12_local3 )
	self:addElement( self )
	local f12_local5 = LUI.UIHorizontalList.new
	local f12_local6 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		spacing = 35
	}
	local self
	if f12_local0 then
		self = 53
		if not self then
		
		else
			f12_local6.left = self
			f12_local6.top = -25
			f12_local5 = f12_local5( f12_local6 )
			f12_local6 = {}
			self = nil
			local f12_local8 = {
				material = RegisterMaterial( CoD.Material.RestrictedIcon ),
				color = Colors.white,
				rightAnchor = true,
				topAnchor = true,
				width = 15,
				height = 15,
				right = 8,
				top = -4
			}
			local restrictedIcon = nil
			for f12_local10 = 0, 2, 1 do
				local f12_local13 = f12_local10
				self = LUI.UIElement.new( {
					width = LUI.CacStaticLayout.defaultImageSize,
					height = LUI.CacStaticLayout.defaultImageSize
				} )
				self.dataProvider = function ( f13_arg0 )
					return LUI.CacDataProvider.Perk( f13_arg0, f12_local13 + 1 )
				end
				
				addElement( self, f12_arg0 )
				self.isPerk = true
				self.displayName = Engine.Localize( "@LUA_MENU_CAC_PERK_BLANK", tostring( f12_local13 + 1 ) )
				self.index = f12_local13
				
				restrictedIcon = LUI.UIImage.new( f12_local8 )
				restrictedIcon:hide()
				self:addElement( restrictedIcon )
				self.restrictedIcon = restrictedIcon
				
				local f12_local14 = addElementSubtext( self, "", LUI.CacStaticLayout.perksOffsetText )
				f12_local6[f12_local13 + 1] = f12_local14
				self.textfield = f12_local14
				f12_local5:addElement( self )
			end
			f12_arg0.perksText = f12_local6
			self:addElement( f12_local5 )
			return self
		end
	end
	self = 25
end

function addElementSubtext( f14_arg0, f14_arg1, f14_arg2 )
	local self = LUI.UIText.new( {
		leftAnchor = false,
		bottomAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		height = 8,
		width = 65,
		color = LUI.CacStaticLayout.greyTextColor,
		bottom = f14_arg2,
		alpha = 1,
		alignment = LUI.Alignment.Center,
		font = LUI.CacStaticLayout.conduitFont
	} )
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:setText( f14_arg1 )
	f14_arg0:addElement( self )
	return self
end

function addElement( f15_arg0, f15_arg1 )
	f15_arg0.id = "element_" .. #f15_arg1.elements
	f15_arg1.elements[#f15_arg1.elements + 1] = f15_arg0
	if not f15_arg0.isWeapon then
		f15_arg0:addElement( LUI.UIImage.new( {
			width = 50,
			height = 45,
			material = RegisterMaterial( "h1_deco_cac_slot" )
		} ) )
		local self = LUI.UIImage.new( {
			top = -23,
			width = 10,
			height = 10,
			material = RegisterMaterial( "h1_deco_double_triangle" ),
			color = LUI.CacStaticLayout.imageGray
		} )
		self:hide()
		f15_arg0:addElement( self )
		f15_arg0.rarityDecal = self
	end
	if not f15_arg0.isCamo and not f15_arg0.isReticle then
		local self = LUI.UIImage.new( {
			width = 40,
			height = 40
		} )
		f15_arg0:addElement( self )
		f15_arg0.img = self
	end
end

function refreshElement( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.IsDepotEnabled() == true
	if f16_arg0.rarityDecal then
		f16_arg0.rarityDecal:hide()
	end
	if f16_arg0.dataProvider ~= nil then
		local f16_local1, f16_local2 = nil
		local f16_local3 = f16_arg0.dataProvider( f16_arg1 )
		local f16_local4, f16_local5 = nil
		if Engine.InFrontend() and Engine.IsDepotEnabled() == true then
			local f16_local6 = LUI.InventoryUtils.GetLootDataForRef( f16_local3.storageCategory, f16_local3.id, LUI.CacStaticLayout.ClassLoc, Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc ) )
			if f16_local6 then
				f16_local4 = f16_local6.lootRarity
				if f16_local4 ~= nil and f16_arg0.rarityDecal and f16_local4.color and f16_local4.rarity > 0 then
					f16_arg0.rarityDecal:show()
					f16_arg0.rarityDecal:registerAnimationState( "rarity", {
						color = f16_local4.color
					} )
					f16_arg0.rarityDecal:animateToState( "rarity" )
				end
			end
		end
		if f16_arg2 == nil then
			f16_arg2 = true
		end
		if f16_arg0.isWeapon then
			local f16_local6 = 0
			if f16_local0 == true then
				if f16_local3.weaponCategory == "Primary" then
					f16_local6 = 43
				elseif f16_local3.weaponCategory == "Secondary" then
					f16_local6 = 16
				end
			elseif f16_local3.weaponCategory == "Primary" then
				f16_local6 = 40
			end
			f16_local1 = LUI.CacStaticLayout.weaponImageSize + f16_local6
			f16_local2 = LUI.CacStaticLayout.weaponImageSize + f16_local6
		elseif f16_arg0.isGrenadeLethal or f16_arg0.isGrenadeTactical or f16_arg0.isMelee then
			f16_local1 = LUI.CacStaticLayout.grenadeImageSize
			f16_local2 = LUI.CacStaticLayout.grenadeImageSize
		elseif f16_arg0.isPerk then
			f16_local1 = LUI.CacStaticLayout.perkImageSize
			f16_local2 = LUI.CacStaticLayout.perkImageSize
		else
			f16_local1 = LUI.CacStaticLayout.defaultImageSize
			f16_local2 = LUI.CacStaticLayout.defaultImageSize
		end
		local f16_local6, f16_local7 = nil
		if f16_local3.id ~= "none" and f16_local3.id ~= "base" and f16_local3.id ~= nil and f16_local3.id ~= "" and f16_local3.id ~= Cac.NullWeaponNames[f16_local3.weaponCategory] then
			f16_local6 = Cac.GetWeaponImageName( f16_local3.weaponCategory, f16_local3.id )
			f16_local7 = RegisterMaterial( f16_local6 )
			Engine.CacheMaterial( f16_local7 )
			local f16_local8, f16_local9 = GetMaterialDimensions( f16_local7 )
			f16_arg0.img:registerAnimationState( "newImage", {
				material = RegisterMaterial( f16_local6 ),
				width = f16_local1 * f16_local8 / f16_local9,
				height = f16_local2,
				alpha = 1
			} )
			f16_arg0.img:animateToState( "newImage" )
			if f16_arg0.isMelee and f16_local0 then
				f16_arg0.grenadesHList:closeChildren()
				f16_arg0.grenadesHList:addElement( f16_arg0 )
				f16_arg0.grenadesHList:addSpacer( 2.5 )
				f16_arg0.grenadesHList:addElement( f16_arg0.grenadesHList.tacticalElement )
				f16_arg0.grenadesHList:addElement( f16_arg0.grenadesHList.lethalElement )
			end
			if GameX.IsRankedMatch() == false then
				local f16_local10 = Cac.GetUnrestrictedState( f16_local3.storageCategory, f16_local3.id )
				if f16_arg0.doubleTriangle then
					if f16_local10 == false and f16_arg2 == true then
						f16_arg0.doubleTriangle:show()
						f16_arg0.doubleTriangle:animateToState( "restricted" )
					elseif f16_local4 == nil or f16_local4 and f16_local4.rarity <= 0 then
						f16_arg0.doubleTriangle:hide()
					end
				end
				if f16_arg0.restrictedIcon then
					if Cac.GetUnrestrictedState( f16_local3.storageCategory, f16_local3.id ) == false and f16_arg2 == true then
						f16_arg0.restrictedIcon:show()
					else
						f16_arg0.restrictedIcon:hide()
					end
				end
			end
		else
			f16_arg0.img:registerAnimationState( "hidden", {
				alpha = 0
			} )
			f16_arg0.img:animateToState( "hidden" )
			if f16_arg0.restrictedIcon then
				f16_arg0.restrictedIcon:hide()
			end
			if f16_arg0.isMelee and f16_local0 then
				f16_arg0.grenadesHList:closeChildren()
				f16_arg0.grenadesHList:addElement( f16_arg0 )
				f16_arg0.grenadesHList:addElement( f16_arg0.grenadesHList.tacticalElement )
				f16_arg0.grenadesHList:addElement( f16_arg0.grenadesHList.lethalElement )
			end
		end
		if f16_arg0.isWeapon then
			if f16_local3.camoImage ~= nil then
				local f16_local8 = nil
				if f16_local3.storageCategory == "Primary" then
					f16_local8 = Cac.GetWeaponImageName( "Primary_Camo", f16_arg1.primaryCamo )
				else
					f16_local8 = Cac.GetWeaponImageName( "Secondary_Camo", f16_arg1.secondaryCamo )
				end
				local f16_local9 = RegisterMaterial( f16_local8 )
				Engine.CacheMaterial( f16_local9 )
				f16_arg0.camoElement.camoIcon:registerAnimationState( "newImage", {
					material = f16_local9,
					width = 35,
					height = 35,
					alpha = 1
				} )
				f16_arg0.camoElement.camoIcon:animateToState( "newImage" )
			else
				f16_arg0.camoElement.camoIcon:registerAnimationState( "hidden", {
					alpha = 0
				} )
				f16_arg0.camoElement.camoIcon:animateToState( "hidden" )
			end
			if f16_local0 == true then
				if f16_local3.reticleImage ~= nil then
					local f16_local8 = nil
					if f16_local3.storageCategory == "Primary" then
						f16_local8 = Cac.GetWeaponImageName( "Primary_Reticle", f16_arg1.primaryReticle )
					else
						f16_local8 = Cac.GetWeaponImageName( "Secondary_Reticle", f16_arg1.secondaryReticle )
					end
					local f16_local9 = RegisterMaterial( f16_local8 )
					Engine.CacheMaterial( f16_local9 )
					f16_arg0.reticleElement.reticleIcon:registerAnimationState( "newImage", {
						material = f16_local9,
						width = 45,
						height = 45,
						alpha = 1
					} )
					f16_arg0.reticleElement.reticleIcon:animateToState( "newImage" )
					f16_arg0.reticleElement.hList:animateToState( "default" )
					f16_arg0.reticleElement:animateToState( "default" )
				else
					f16_arg0.reticleElement.reticleIcon:animateToState( "hidden" )
					if f16_arg0.reticleElement.hList and Engine.IsDepotEnabled() == true and f16_arg0.reticleElement.isPrimary == false and f16_local3.weaponCategory ~= "Primary" then
						f16_arg0.reticleElement:animateToState( "hidden" )
						f16_arg0.reticleElement.hList:animateToState( "three" )
					else
						f16_arg0.reticleElement.hList:animateToState( "default" )
						f16_arg0.reticleElement:animateToState( "default" )
					end
				end
			end
		end
	end
end

