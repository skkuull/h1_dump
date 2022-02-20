LUI.CacButton = InheritFrom( LUI.UIElement )
LUI.CacButton.Height = 60
LUI.CacButton.IconPadding = 2
LUI.CacButton.PrimaryFont = CoD.TextSettings.BodyFontSmall
LUI.CacButton.PrimaryFontHeight = CoD.TextSettings.BodyFontSmall.Height - 3
LUI.CacButton.SecondaryFont = CoD.TextSettings.BodyFontTiny
LUI.CacButton.SecondaryFontHeight = CoD.TextSettings.BodyFontTiny.Height - 3
LUI.CacButton.UnlockRefresh = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if f1_arg1 ~= nil then
		f1_arg0.primaryText:setText( Engine.ToUpperCase( Engine.Localize( f1_arg1 ) ) )
	end
	if f1_arg2 ~= nil then
		f1_arg0.secondaryText:setText( Engine.ToUpperCase( Engine.Localize( f1_arg2 ) ) )
	end
	if f1_arg3 ~= nil then
		if f1_arg0.icon then
			f1_arg0.icon:close()
		end
		f1_arg0:addElement( LUI.CacButton.CreateIcon( {
			iconName = f1_arg3
		} ) )
	end
	f1_arg0:processEvent( {
		name = "enable"
	} )
end

LUI.CacButton.CreateIcon = function ( f2_arg0 )
	if f2_arg0.iconName ~= nil then
		local f2_local0 = nil
		if type( f2_arg0.iconName ) == "string" then
			f2_local0 = RegisterMaterial( f2_arg0.iconName )
		else
			f2_local0 = f2_arg0.iconName
		end
		Engine.CacheMaterial( f2_local0 )
		local f2_local1, f2_local2 = GetMaterialDimensions( f2_local0 )
		local f2_local3 = f2_local1 / f2_local2
		local f2_local4 = LUI.CacButton.IconPadding
		local f2_local5 = f2_arg0.iconHeight
		if not f2_local5 then
			f2_local5 = LUI.CacButton.Height
		end
		if f2_arg0.extraImagePadding then
			f2_local4 = f2_local4 * 4
		end
		if f2_arg0.subtleImagePadding then
			f2_local4 = f2_local4 * 2.5
		end
		local f2_local6 = {}
		if f2_arg0.iconCentered then
			f2_local6 = {
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = false,
				width = f2_local5 * f2_local3,
				height = f2_local5,
				top = f2_arg0.iconTopOffset,
				left = f2_arg0.iconLeftOffset
			}
		else
			f2_local6 = {
				leftAnchor = false,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = false,
				width = f2_local5 * f2_local3 - f2_local4 * 2,
				height = f2_local5 - f2_local4 * 2,
				top = f2_arg0.iconTopOffset and f2_arg0.iconTopOffset + f2_local4 or f2_local4,
				right = f2_arg0.iconLeftOffset and f2_arg0.iconLeftOffset or -30
			}
		end
		local self = LUI.UIElement.new( f2_local6 )
		if f2_arg0.locked then
			local f2_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
			f2_local8.width = 20
			f2_local8.height = 20
			f2_local8.material = RegisterMaterial( "s1_icon_locked_full" )
			self:addElement( LUI.UIImage.new( f2_local8 ) )
		else
			local f2_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
			f2_local8.material = f2_local0
			self:addElement( LUI.UIImage.new( f2_local8 ) )
		end
		return self
	else
		return nil
	end
end

LUI.CacButton.new = function ( f3_arg0 )
	if not f3_arg0.buttonWidth then
		local f3_local0 = not f3_arg0.ignoreWidth
		local f3_local1 = f3_arg0.width
		local f3_local2 = 0
	end
	local f3_local3 = f3_local0 and f3_local1 or f3_local2
	local f3_local4 = LUI.UIButton.new
	local f3_local5 = CoD.CreateState
	local f3_local6 = 0
	local f3_local7 = 0
	local f3_local8 = f3_local3
	local f3_local9 = f3_arg0.height
	if not f3_local9 then
		f3_local9 = LUI.CacButton.Height
	end
	local self = f3_arg0.anchorType
	if not self then
		self = CoD.AnchorTypes.TopLeftRight
	end
	f3_local4 = f3_local4( f3_local5( f3_local6, f3_local7, f3_local8, f3_local9, self ) )
	f3_local4:setClass( LUI.CacButton )
	f3_local4.listDefaultFocus = f3_arg0.listDefaultFocus
	if f3_arg0.actionFunc ~= nil then
		f3_local4:registerEventHandler( "button_action", f3_arg0.actionFunc )
	end
	f3_local5 = 10
	if f3_arg0.rarity then
		f3_local5 = 14
	end
	f3_local4:addElement( LUI.H1ButtonBackground.new( f3_arg0.rarity ) )
	f3_local7 = Colors.white
	f3_local8 = 0.3
	if f3_arg0.equipped == true then
		f3_local7 = Colors.mw1_green
		f3_local8 = 1
	end
	if f3_arg0.externalElement then
		f3_local4:addElement( f3_arg0.externalElement )
	end
	f3_local9 = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	self = f3_arg0.primaryTextLeft
	if not self then
		self = f3_local5
	end
	f3_local9.left = self
	self = f3_arg0.primaryTextRight
	if not self then
		self = -70
	end
	f3_local9.right = self
	self = f3_arg0.primaryTextTop
	if not self then
		self = 16
	end
	f3_local9.top = self
	self = f3_arg0.primaryFontHeight
	if not self then
		self = LUI.CacButton.PrimaryFontHeight
	end
	f3_local9.height = self
	f3_local9.font = LUI.CacButton.PrimaryFont.Font
	f3_local9.alignment = LUI.Alignment.Left
	f3_local9.alpha = f3_arg0.primaryTextBold and 0.5 or f3_local8
	f3_local9.color = f3_local7
	self = LUI.UIText.new()
	self:registerAnimationState( "default", f3_local9 )
	self:registerAnimationState( "selected", {
		alpha = 1,
		color = Colors.white
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "selected" ) )
	self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "selected" ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	self:registerEventHandler( "button_disable", MBh.AnimateToState( "default" ) )
	local f3_local11 = Engine.ToUpperCase( Engine.Localize( f3_arg0.primaryText ) )
	self:setText( f3_local11 )
	f3_local4.primaryText = self
	f3_local4:addElement( self )
	local f3_local12 = 16
	local f3_local13 = {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	local self
	if f3_arg0.secondaryImage then
		self = f3_local12 + 14
		if not self then
			self = f3_arg0.secondaryTextLeft
			if not self then
				self = f3_local5
			end
		end
	else
		self = f3_arg0.secondaryTextLeft
		if not self then
			self = f3_local5
		end
	end
	f3_local13.left = self
	self = f3_arg0.secondaryTextRight
	if not self then
		self = -70
	end
	f3_local13.right = self
	self = f3_arg0.secondaryTextTop
	if not self then
		self = 36
	end
	f3_local13.top = self
	self = f3_arg0.secondaryFontHeight
	if not self then
		self = LUI.CacButton.SecondaryFontHeight
	end
	f3_local13.height = self
	f3_local13.font = LUI.CacButton.SecondaryFont.Font
	f3_local13.alignment = LUI.Alignment.Left
	f3_local13.alpha = 0.3
	self = LUI.UIText.new()
	self:registerAnimationState( "default", f3_local13 )
	self:registerAnimationState( "selected", {
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "selected" ) )
	self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "selected" ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
	self:registerEventHandler( "button_disable", MBh.AnimateToState( "default" ) )
	self:setText( Engine.ToUpperCase( Engine.Localize( f3_arg0.secondaryText ) ) )
	f3_local4.secondaryText = self
	f3_local4:addElement( self )
	if f3_arg0.secondaryImage ~= nil then
		local f3_local15 = CoD.CreateState( 10, 32, nil, nil, CoD.AnchorTypes.TopLeft )
		f3_local15.width = f3_local12
		f3_local15.height = f3_local12
		f3_local15.material = RegisterMaterial( f3_arg0.secondaryImage )
		f3_local4:addElement( LUI.UIImage.new( f3_local15 ) )
	end
	local f3_local15 = LUI.CacButton.CreateIcon( f3_arg0 )
	if f3_local15 then
		f3_local4:addElement( f3_local15 )
		f3_local4.icon = f3_local15
	end
	if f3_arg0.locked then
		f3_local4:processEvent( {
			name = "disable"
		} )
	end
	if f3_arg0.equipped then
		local f3_local16 = RegisterMaterial( "h1_ui_menu_icon_equipped" )
		local f3_local17 = 7
		local f3_local18 = 16
		f3_local4:addElement( LUI.UIImage.new( {
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			width = f3_local18,
			height = f3_local18,
			top = f3_local17,
			right = -(f3_local17 - 1),
			material = f3_local16
		} ) )
	end
	if f3_arg0.newMode then
		local f3_local16 = GetTextDimensions
		local f3_local17 = f3_local11
		local f3_local18 = LUI.CacButton.PrimaryFont.Font
		local f3_local19 = f3_arg0.primaryFontHeight
		if not f3_local19 then
			f3_local19 = LUI.CacButton.PrimaryFontHeight
		end
		f3_local16, f3_local17, f3_local18, f3_local19 = f3_local16( f3_local17, f3_local18, f3_local19 )
		f3_local4:addElement( LUI.NewSticker.new( CoD.CreateState( f3_local9.left + f3_local18 - f3_local16 + 10, f3_local9.top, nil, nil, CoD.AnchorTypes.TopLeft ), f3_arg0.newMode ) )
	end
	if f3_arg0.unrestricted == false then
		local f3_local16 = GetTextDimensions
		local f3_local17 = f3_local11
		local f3_local18 = LUI.CacButton.PrimaryFont.Font
		local f3_local19 = f3_arg0.primaryFontHeight
		if not f3_local19 then
			f3_local19 = LUI.CacButton.PrimaryFontHeight
		end
		f3_local16, f3_local17, f3_local18, f3_local19 = f3_local16( f3_local17, f3_local18, f3_local19 )
		local f3_local20 = CoD.CreateState( f3_local9.left + f3_local18 - f3_local16 + 10, f3_local9.top - 6, nil, nil, CoD.AnchorTypes.TopLeft )
		f3_local20.width = 20
		f3_local20.height = 20
		f3_local20.material = RegisterMaterial( CoD.Material.RestrictedIcon )
		f3_local4:addElement( LUI.UIImage.new( f3_local20 ) )
	end
	if f3_arg0.extraElems then
		for f3_local19, f3_local21 in pairs( f3_arg0.extraElems ) do
			f3_local21:registerAnimationState( "selected", {
				alpha = 1
			} )
			f3_local21:registerEventHandler( "button_over", MBh.AnimateToState( "selected" ) )
			f3_local21:registerEventHandler( "button_over_disable", MBh.AnimateToState( "selected" ) )
			f3_local21:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
			f3_local21:registerEventHandler( "button_disable", MBh.AnimateToState( "default" ) )
			f3_local4:addElement( f3_local21 )
		end
	end
	return f3_local4
end

