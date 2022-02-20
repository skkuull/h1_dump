local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.ItemDescriptionWidget = InheritFrom( LUI.UIElement )
f0_local0 = 370
f0_local1 = 125
f0_local2 = 35
local f0_local3 = 23
LUI.ItemDescriptionWidget.Update = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg1, CoD.TextSettings.H1TitleFont.Font, f0_local3 )
	local f1_local4 = f0_local2 + f1_local2 - f1_local0 + f0_local2
	local f1_local5 = nil
	if f1_arg0.centered then
		f1_local5 = -f1_local4 / 2
	end
	f1_arg0.weaponNameBackgroundBox:registerAnimationState( "updateBoxWidth", {
		leftAnchor = true,
		topAnchor = true,
		height = 35,
		left = f1_local5,
		width = f1_local4
	} )
	f1_arg0.weaponNameBackgroundBox:animateToState( "updateBoxWidth" )
	f1_arg0.nameText:setText( f1_arg1 )
	f1_arg0.subText:animateToState( "show" )
	if f1_arg4 and f1_arg4.Progress and f1_arg4.Target and f1_arg4.Desc then
		f1_arg0.collectionWidget:hide()
		local f1_local6 = ""
		if f1_arg4.RewardType == "weaponCamo" and f1_arg4.lowerUnlockedTierRewardName ~= nil then
			f1_local6 = Engine.Localize( "@MENU_UNLOCK_TO_START", f1_arg4.lowerUnlockedTierRewardName ) .. "\n"
		end
		f1_arg0.challengeDesc:setText( f1_local6 .. f1_arg4.Desc )
		local f1_local7 = CoD.CreateState( 0, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
		if f1_arg4.Target <= f1_arg4.Progress then
			f1_local7.width = 150
		else
			f1_local7.width = 150 * f1_arg4.Progress / f1_arg4.Target
		end
		f1_arg0.challengeBarFill:registerAnimationState( "update", f1_local7 )
		f1_arg0.challengeBarFill:animateToState( "update" )
		f1_arg0.challengeProgress:setText( Engine.Localize( "@MPUI_X_SLASH_Y", math.min( f1_arg4.Progress, f1_arg4.Target ), f1_arg4.Target ) )
		f1_arg0.challengeContainer:animateToState( "default" )
	else
		if f1_arg5 then
			f1_arg0.collectionWidget:show()
			f1_arg0:RefreshCollectionWidget( f1_arg5 )
		else
			f1_arg0.collectionWidget:hide()
		end
		f1_arg0.challengeContainer:animateToState( "hidden" )
	end
	if f1_arg2 then
		f1_arg0.subText:setText( f1_arg2 )
	end
	if f1_arg3 then
		f1_arg0.descText:setText( f1_arg3 )
		f1_arg0.descText:animateToState( "show" )
		f1_arg0.challengeContainer:registerAnimationState( "topWithDesc", {
			leftAnchor = true,
			topAnchor = true,
			top = f1_arg0.challengeTopWithDesc
		} )
		f1_arg0.challengeContainer:animateToState( "topWithDesc" )
	else
		f1_arg0.descText:animateToState( "hide" )
		f1_arg0.challengeContainer:registerAnimationState( "topWithoutDesc", {
			leftAnchor = true,
			topAnchor = true,
			top = f1_arg0.challengeTopWithoutDesc
		} )
		f1_arg0.challengeContainer:animateToState( "topWithoutDesc" )
	end
end

LUI.ItemDescriptionWidget.ColorForPerks = function ( f2_arg0, f2_arg1 )
	f2_arg0.lightGreyBox:registerAnimationState( "changeColor", {
		color = f2_arg1
	} )
	f2_arg0.lightGreyBox:animateToState( "changeColor" )
	if Engine.IsDepotEnabled() then
		f2_arg0.rarityGlow:registerAnimationState( "changeColor", {
			color = f2_arg1
		} )
		f2_arg0.rarityGlow:animateToState( "changeColor" )
		f2_arg0.rarityGlow:show()
	end
end

LUI.ItemDescriptionWidget.ClearColor = function ( f3_arg0 )
	if f3_arg0 then
		if f3_arg0.rarityGlow then
			f3_arg0.rarityGlow:hide()
		end
		if f3_arg0.lightGreyBox then
			f3_arg0.lightGreyBox:animateToState( "default" )
		end
	end
end

function titleBox( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 200,
		height = 35
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.dark_grey,
		width = f0_local2
	} )
	menu.lightGreyBox = self
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 18,
		height = 18,
		left = 9,
		top = 8,
		material = RegisterMaterial( "h1_deco_double_triangle" )
	} )
	self:registerAnimationState( "rotated", {
		zRot = 90
	} )
	self:animateToState( "rotated" )
	local self = nil
	if not controller then
		self = LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = true,
			width = 150,
			height = 150,
			left = -45,
			top = -45,
			alpha = 0.3,
			material = RegisterMaterial( "h1_deco_scanlines_overlay" )
		} )
	end
	local f4_local4 = LUI.DecoFrame.new( nil )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.black,
		alpha = 0.6
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		alignment = LUI.Alignment.Left,
		font = LUI.WeaponInfoFont,
		height = f0_local3,
		top = 8.5,
		left = 50
	} )
	self:setText( Engine.Localize( "@MENU_EMBLEM_CAPS" ) )
	if Engine.IsDepotEnabled() then
		local self = LUI.UIImage.new( {
			leftAnchor = true,
			topAnchor = true,
			material = RegisterMaterial( "depot_glow_vertical_alpha" ),
			width = 110,
			height = 200,
			zRot = 90,
			top = -82,
			left = 5
		} )
		self:hide()
		self:addElement( self )
		menu.rarityGlow = self
	end
	self:addElement( self )
	self:addElement( self )
	self:addElement( f4_local4 )
	if self ~= nil then
		self:addElement( self )
	end
	self:addElement( self )
	self:addElement( self )
	menu.weaponNameBackgroundBox = self
	menu.nameText = self
	return self
end

function challengeInfo( menu, controller )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		top = controller,
		spacing = 10,
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "hidden" )
	local f5_local1 = CoD.TextSettings.Font18
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		height = f5_local1.Height,
		width = 275,
		font = f5_local1.Font,
		alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
		color = Colors.grey_75,
		lineSpacingRatio = 0.2
	} )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 16, 150, 24, CoD.AnchorTypes.TopLeft ) )
	self:addElement( self )
	local f5_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local4.material = RegisterMaterial( "white" )
	f5_local4.color = Colors.h1.black
	f5_local4.alpha = 0.6
	self:addElement( LUI.UIImage.new( f5_local4 ) )
	local f5_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local5.material = RegisterMaterial( "white" )
	local self = LUI.UIImage.new( f5_local5 )
	self:addElement( self )
	f5_local5.width = 150
	local f5_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f5_local7.borderThickness = 1
	f5_local7.color = Colors.grey_75
	self:addElement( LUI.UIBorder.new( f5_local7 ) )
	local f5_local8 = CoD.TextSettings.Font21
	local f5_local9 = CoD.CreateState( 0, 30, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f5_local9.height = f5_local8.Height
	f5_local9.font = f5_local8.Font
	f5_local9.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f5_local9 )
	self:addElement( self )
	menu.challengeDesc = self
	menu.challengeBarFill = self
	menu.challengeProgress = self
	menu.challengeContainer = self
	return self
end

LUI.ItemDescriptionWidget.RefreshCollectionWidget = function ( f6_arg0, f6_arg1 )
	local f6_local0 = GetCollectionForItem( f6_arg1 )
	if f6_local0 then
		f6_arg0.collectionWidget.titleText:setText( f6_local0.name )
		local f6_local1 = nil
		if #f6_local0.setItems <= f6_local0.numOwned then
			f6_local1 = RegisterMaterial( "collection_reward_complete" )
			f6_arg0.collectionWidget.countText:setText( Engine.Localize( "@DEPOT_COMPLETE" ) )
		else
			f6_local1 = RegisterMaterial( "collection_reward_locked" )
			f6_arg0.collectionWidget.countText:setText( Engine.Localize( "@DEPOT_SET_NUM_COLLECTED", f6_local0.numOwned, #f6_local0.setItems ) )
		end
		f6_arg0.collectionWidget:show()
		f6_arg0.collectionWidget.icon:show()
		f6_arg0.collectionWidget.icon:registerAnimationState( "lockState", {
			material = f6_local1
		} )
		f6_arg0.collectionWidget.icon:animateToState( "lockState" )
	elseif Cac.LootDropRewardImages[f6_arg1] then
		local f6_local1 = nil
		local f6_local2 = GetItemSets()
		local f6_local3, f6_local4 = nil
		for f6_local5 = 1, #LUI.MPDepot.Collections, 1 do
			if LUI.MPDepot.Collections[f6_local5].Tag == Cac.LootDropRewardImages[f6_arg1].seasonTag then
				f6_local4 = LUI.MPDepot.Collections[f6_local5]
				f6_local3 = f6_local2.seasons[f6_local5]
				break
			end
		end
		f6_arg0.collectionWidget.titleText:setText( Engine.Localize( f6_local4.Name ) )
		if #f6_local3.sets <= f6_local3.completedSets then
			f6_local1 = RegisterMaterial( Cac.LootDropRewardImages[f6_arg1].complete )
			f6_arg0.collectionWidget.countText:setText( Engine.Localize( "@DEPOT_COMPLETE" ) )
		else
			f6_local1 = RegisterMaterial( Cac.LootDropRewardImages[f6_arg1].incomplete )
			f6_arg0.collectionWidget.countText:setText( Engine.Localize( "@DEPOT_SET_NUM_COLLECTED", f6_local3.completedSets, #f6_local3.sets ) )
		end
		f6_arg0.collectionWidget:show()
		f6_arg0.collectionWidget.icon:show()
		f6_arg0.collectionWidget.icon:registerAnimationState( "lockState", {
			material = f6_local1
		} )
		f6_arg0.collectionWidget.icon:animateToState( "lockState" )
	else
		f6_arg0.collectionWidget:hide()
	end
end

function addCollectionWidget( f7_arg0, f7_arg1 )
	local f7_local0 = {
		left = -7,
		top = f7_arg1 or 40 + 20 * 3
	}
	local f7_local1 = CoD.CreateState( f7_local0.left, f7_local0.top, nil, nil, CoD.AnchorTypes.TopLeft )
	f7_local0.width = 200
	f7_local0.height = 70
	local self = LUI.UIElement.new( f7_local1 )
	f7_arg0:addElement( self )
	local f7_local3 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f7_local3.width = f7_local0.height
	f7_local3.height = f7_local0.height
	
	local icon = LUI.UIImage.new( f7_local3 )
	icon:hide()
	self:addElement( icon )
	self.icon = icon
	
	local f7_local5 = CoD.CreateState( 73, 20, nil, nil, CoD.AnchorTypes.TopLeft )
	f7_local5.color = Colors.white
	f7_local5.font = CoD.TextSettings.BodyFont18.Font
	f7_local5.height = CoD.TextSettings.BodyFont18.Height * 0.8
	f7_local5.width = f7_local0.width - 75
	
	local titleText = LUI.UIText.new( f7_local5 )
	titleText:setText( "" )
	self:addElement( titleText )
	self.titleText = titleText
	
	local f7_local7 = CoD.CreateState( 73, 21 + f7_local5.height, nil, nil, CoD.AnchorTypes.TopLeft )
	f7_local7.color = Colors.white
	f7_local7.alpha = 0.4
	f7_local7.font = f7_local5.font
	f7_local7.height = f7_local5.height * 0.95
	f7_local7.width = f7_local5.width
	
	local countText = LUI.UIText.new( f7_local7 )
	countText:setText( "" )
	self:addElement( countText )
	self.countText = countText
	
	f7_arg0.collectionWidget = self
	f7_arg0.collectionWidget:hide()
end

LUI.ItemDescriptionWidget.new = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0
	if f8_arg0 ~= nil and not f8_arg0.leftAnchor then
		f8_local0 = not f8_arg0.rightAnchor
	else
		f8_local0 = false
	end
	local self = LUI.UIElement.new( f8_arg0 or {
		topAnchor = true,
		leftAnchor = true,
		top = f0_local1,
		left = f0_local0
	} )
	self:setClass( LUI.ItemDescriptionWidget )
	self.centered = f8_local0
	local f8_local2 = 45
	local f8_local3 = 16
	local f8_local4 = f8_arg1 or 310
	local f8_local5 = nil
	local f8_local6 = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	if f8_local0 then
		f8_local5 = -f8_local4 / 2
		f8_local6 = LUI.Alignment.Center
	end
	local self = LUI.UIElement.new( {
		topAnchor = true,
		top = f8_local2,
		leftAnchor = true,
		height = f8_local3 * 3,
		width = f8_local4
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		height = f8_local3,
		width = f8_local4,
		left = f8_local5,
		alignment = f8_local6,
		font = LUI.WeaponInfoFont,
		lineSpacingRatio = 0.2
	} )
	self.subText = self
	self:addElement( self )
	local f8_local9 = f8_local2 + f8_local3 * 3 + 35
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		top = f8_local9,
		height = f8_local3,
		width = f8_local4,
		left = f8_local5,
		alignment = f8_local6,
		font = LUI.WeaponInfoFont
	} )
	self.descText = self
	self.challengeTopWithDesc = f8_local9 + f8_local3 + 15
	self.challengeTopWithoutDesc = f8_local9
	local f8_local11 = challengeInfo( self, self.challengeTopWithDesc )
	self:addElement( titleBox( self, f8_arg2 ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( f8_local11 )
	addCollectionWidget( self, f8_arg0.collectionWidgetTop )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	return self
end

LockTable( _M )
