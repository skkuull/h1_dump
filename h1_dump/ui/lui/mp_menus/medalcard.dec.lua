LUI.MedalCard = InheritFrom( LUI.UIElement )
LUI.MedalCard.GridRowHeight = 148
LUI.MedalCard.GridItemWidth = 112
LUI.MedalCard.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local self = LUI.UIButton.new( CoD.CreateState( 0, 0, LUI.MedalCard.GridItemWidth, LUI.MedalCard.GridRowHeight, CoD.AnchorTypes.TopLeft ) )
	self:setClass( LUI.MedalCard )
	local f1_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local1.material = RegisterMaterial( "h1_ui_deco_medal_shadow" )
	self:addElement( LUI.UIImage.new( f1_local1 ) )
	self:addElement( LUI.UIBackgroundPanel.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local self = LUI.UIBorder.new( {
		width = LUI.MedalCard.GridItemWidth + 4,
		height = LUI.MedalCard.GridRowHeight + 4,
		borderThickness = 1,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey,
		alpha = 0.7
	} )
	self:addElement( self )
	if f1_arg3 then
		self:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self:animateToState( "hidden" )
		return self
	end
	self.id = "medalsGridItemButton" .. f1_arg1.medalName
	local f1_local3 = 50
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		height = f1_local3,
		material = RegisterMaterial( "white" ),
		color = Colors.black,
		alpha = 0.3
	} ) )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -f1_local3,
		alpha = 0.8,
		height = 1,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey
	} ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 88,
		width = 90,
		height = 28,
		font = CoD.TextSettings.BodyFontSmall.Font,
		color = Colors.white,
		alignment = LUI.Alignment.Center
	} )
	self:setupAutoScaleText()
	self:setText( Engine.GetPlayerData( f1_arg0, CoD.StatsGroup.Common, "awards", f1_arg1.medalName ) )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		width = 20,
		topAnchor = true,
		top = 116,
		height = 1,
		alpha = 0.8,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey
	} ) )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 126,
		width = 100,
		height = 10,
		font = CoD.TextSettings.BodyFontSmall.Font,
		color = Colors.mw1_green,
		alignment = LUI.Alignment.Center
	} )
	self:setText( Engine.Localize( f1_arg1.medalTitle ) )
	self:addElement( self )
	if f1_arg2 then
		local f1_local6 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f1_local6.material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
		f1_local6.alpha = 0
		local self = LUI.UIBorder.new( f1_local6 )
		self:setup9SliceImage()
		self:registerAnimationState( "unfocused", {
			alpha = 0
		} )
		self:registerAnimationState( "focused", {
			alpha = 1
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "focused" ) )
		self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "focused" ) )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "unfocused" ) )
		self:registerEventHandler( "button_disable", MBh.AnimateToState( "unfocused" ) )
		self:addElement( self )
	end
	self.border = self
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		width = 90,
		top = -13,
		height = 90,
		material = RegisterMaterial( f1_arg1.medalMaterial )
	} ) )
	return self
end

