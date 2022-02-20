LUI.CacWeaponAccessoryButton = InheritFrom( LUI.UIElement )
LUI.CacWeaponAccessoryButton.Height = 60
LUI.CacWeaponAccessoryButton.ImagePadding = 10
LUI.CacWeaponAccessoryButton.AnimSpeed = 100
LUI.CacWeaponAccessoryButton.SetVisible = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg1 then
		local f1_local0 = f1_arg0.animContainer
		local f1_local1 = f1_local0
		f1_local0 = f1_local0.animateToState
		local f1_local2 = "default"
		local f1_local3
		if f1_arg2 then
			f1_local3 = 0
			if not f1_local3 then
			
			else
				f1_local0( f1_local1, f1_local2, f1_local3 )
			end
		end
		f1_local3 = LUI.CacWeaponAccessoryButton.AnimSpeed
	else
		local f1_local0 = f1_arg0.animContainer
		local f1_local1 = f1_local0
		f1_local0 = f1_local0.animateToState
		local f1_local2 = "hidden"
		local f1_local3
		if f1_arg2 then
			f1_local3 = 0
			if not f1_local3 then
			
			else
				f1_local0( f1_local1, f1_local2, f1_local3 )
			end
		end
		f1_local3 = LUI.CacWeaponAccessoryButton.AnimSpeed
	end
end

LUI.CacWeaponAccessoryButton.Refresh = function ( f2_arg0, f2_arg1 )
	f2_arg0.icon:setImage( RegisterMaterial( f2_arg1 ) )
	if (f2_arg1 == nil or f2_arg1 == "weapon_missing_image") and f2_arg0.backgroundImage then
		f2_arg0.backgroundImage:ClearRarityElements()
	end
end

LUI.CacWeaponAccessoryButton.new = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4, f3_arg5, f3_arg6 )
	local f3_local0 = CoD.CreateState( 0, 0, LUI.CacWeaponAccessoryButton.Height, LUI.CacWeaponAccessoryButton.Height, CoD.AnchorTypes.TopLeft )
	f3_local0.alpha = 1
	local self = LUI.UIButton.new( f3_local0 )
	self:setClass( LUI.CacWeaponAccessoryButton )
	if f3_arg0 ~= nil then
		self:registerEventHandler( "button_action", f3_arg0 )
	end
	local f3_local2 = CoD.CreateState( 0, 0, LUI.CacWeaponAccessoryButton.Height, LUI.CacWeaponAccessoryButton.Height, CoD.AnchorTypes.TopLeft )
	f3_local2.alpha = 1
	local self = LUI.UIElement.new( f3_local2 )
	self:addElement( self )
	
	local backgroundImage = LUI.H1ButtonBackground.new( f3_arg6 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	if f3_arg1 ~= nil then
		local f3_local5 = RegisterMaterial( f3_arg1 )
		local self, f3_local7 = GetMaterialDimensions( f3_local5 )
		local f3_local8 = self / f3_local7
		local self = LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true,
			top = LUI.CacWeaponAccessoryButton.ImagePadding,
			left = LUI.CacWeaponAccessoryButton.ImagePadding,
			right = -LUI.CacWeaponAccessoryButton.ImagePadding,
			bottom = -LUI.CacWeaponAccessoryButton.ImagePadding,
			material = f3_local5,
			alpha = 1
		} )
		self:addElement( self )
		self.icon = self
	end
	local f3_local5 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f3_local5.height = CoD.TextSettings.Font14.Height * 1.5
	f3_local5.top = 64
	f3_local5.width = 60
	f3_local5.material = RegisterMaterial( "white" )
	f3_local5.color = Colors.grey_125
	f3_local5.alpha = 0.8
	local self = LUI.UIImage.new( f3_local5 )
	self:addElement( self )
	local f3_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local7.borderThickness = 1
	f3_local7.color = Colors.white
	f3_local7.alpha = 0.1
	self:addElement( LUI.UIBorder.new( f3_local7 ) )
	local f3_local10 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f3_local10.font = CoD.TextSettings.Font13.Font
	f3_local10.height = CoD.TextSettings.Font13.Height
	f3_local10.alignment = LUI.Alignment.Center
	f3_local10.width = 60
	f3_local10.top = 3.75
	f3_local10.color = Colors.white
	f3_local10.alpha = 0.5
	local self = LUI.UIText.new( f3_local10 )
	self:registerAnimationState( "focus", {
		alpha = 1
	} )
	self:registerEventHandler( "gain_focus", function ( element, event )
		element:animateToState( "focus" )
	end )
	self:registerEventHandler( "lose_focus", function ( element, event )
		element:animateToState( "default" )
	end )
	self:setText( Engine.Localize( f3_arg3 ) )
	self:addElement( self )
	if f3_arg4 then
		self:addElement( LUI.NewSticker.new( CoD.CreateState( nil, 0, 0, nil, CoD.AnchorTypes.TopRight ) ) )
	elseif not f3_arg5 then
		self:addElement( LUI.UIImage.new( {
			material = RegisterMaterial( CoD.Material.RestrictedIcon ),
			color = Colors.white,
			rightAnchor = true,
			topAnchor = true,
			width = 15,
			height = 15,
			right = 8,
			top = -4
		} ) )
	end
	self:registerAnimationState( "default", f3_local2 )
	self:registerAnimationState( "hidden", {
		alpha = 0,
		left = -LUI.CacWeaponAccessoryButton.Height,
		right = 0
	} )
	self:animateToState( "hidden" )
	self.animContainer = self
	return self
end

