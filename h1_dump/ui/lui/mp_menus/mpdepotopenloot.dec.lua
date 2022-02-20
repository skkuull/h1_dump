local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotOpenLoot = InheritFrom( LUI.MPDepotBase )
f0_local0 = 300
f0_local1 = LUI.MenuTemplate.ButtonStyle.text_padding_without_content * 2
f0_local2 = -f0_local1
local f0_local3 = 10
function OpenLootOnBack( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:getParent()
	f1_local0 = f1_local0.menu
	if not f1_local0.supplyDropPopupShown and f1_local0.onBoarding then
		return 
	elseif f1_local0.onBoarding then
		SetDepotState( f1_arg0, {
			state = "greetingfirst"
		} )
	else
		SetDepotState( f1_arg0, {
			state = "idle"
		} )
	end
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

local f0_local4 = function ()
	if math.random() >= 0.5 then
		return 1
	else
		return -1
	end
end

local f0_local5 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = {
		rewardContainerState = CoD.CreateState( 0, -f0_local0 * 0.05, 0, -f0_local0 * 0.05, CoD.AnchorTypes.Top ),
		numLeaves = 10,
		startLeafHeight = 10,
		endLeafHeight = 8,
		startAngle = 75,
		endAngle = -75,
		spacing = 1.5,
		yOffset = 0
	}
	local f3_local1
	if f3_arg1 then
		f3_local1 = 750
		if not f3_local1 then
		
		else
			f3_local0.growTime = f3_local1
			f3_local0.numSimultaneouslyGrowingLeaves = 3
			f3_local0.animateCenter = f3_arg1
			LUI.MPDepotCollectionRewardSplash.AddRewardWidget( f3_arg0, f3_local0 )
		end
	end
	f3_local1 = 10
end

local f0_local6 = function ( f4_arg0 )
	if f4_arg0.revealBurstContainer and LUI.MPDepotLootCard.rarityMaterials[LUI.MPDepotLootCard.GetLootRarity( f4_arg0.data )].revealburst then
		local f4_local0 = 500
		local f4_local1 = 0
		local f4_local2 = 1
		local f4_local3 = {
			r = 1,
			g = 1,
			b = 1
		}
		if f4_arg0.data.loot_type == ItemTypes.Reticle then
			f4_local1 = -0.25
			f4_local2 = 0.25
			f4_local3 = {
				r = f4_local2,
				g = f4_local2,
				b = f4_local2
			}
		end
		local f4_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f4_local4.material = LUI.MPDepotLootCard.rarityMaterials[LUI.MPDepotLootCard.GetLootRarity( f4_arg0.data )].revealburst.mat
		f4_local4.zRot = 0
		f4_local4.scale = f4_local1
		f4_local4.alpha = f4_local2
		f4_arg0.revealBurstContainer.revealBurst = LUI.UIImage.new( f4_local4 )
		f4_arg0.revealBurstContainer.revealBurst:registerAnimationState( "spin", {
			zRot = -30
		} )
		f4_arg0.revealBurstContainer:addElement( f4_arg0.revealBurstContainer.revealBurst )
		f4_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f4_local4.material = RegisterMaterial( "card_reveal_burst_rays" )
		f4_local4.scale = f4_local1
		f4_local4.color = f4_local3
		f4_arg0.revealBurstContainer.revealBurstRays = LUI.UIImage.new( f4_local4 )
		f4_arg0.revealBurstContainer:addElement( f4_arg0.revealBurstContainer.revealBurstRays )
		local f4_local5 = f4_arg0.revealBurstContainer
		local f4_local6 = f4_local5
		f4_local5 = f4_local5.animateInSequence
		local f4_local7 = {}
		local f4_local8 = {
			"shrunk",
			0
		}
		local f4_local9 = {}
		local f4_local10 = "default"
		local f4_local11 = f4_local0 / 3
		local f4_local12, f4_local13, f4_local14 = nil
		local f4_local15 = LUI.Easing.OutBack
		f4_local9[1] = f4_local10
		f4_local9[2] = f4_local11
		f4_local9[3] = f4_local12
		f4_local9[4] = f4_local13
		f4_local9[5] = f4_local14
		f4_local9[6] = f4_local15
		f4_local10 = {
			"default",
			f4_local0 / 3
		}
		f4_local11 = {}
		f4_local12 = "shrunk"
		f4_local13 = f4_local0 / 3
		local f4_local14, f4_local15, f4_local16 = nil
		local f4_local17 = LUI.Easing.InQuartic
		f4_local11[1] = f4_local12
		f4_local11[2] = f4_local13
		f4_local11[3] = f4_local14
		f4_local11[4] = f4_local15
		f4_local11[5] = f4_local16
		f4_local11[6] = f4_local17
		f4_local7[1] = f4_local8
		f4_local7[2] = f4_local9
		f4_local7[3] = f4_local10
		f4_local7[4] = f4_local11
		f4_local5( f4_local6, f4_local7, nil, true, true )
		f4_arg0.revealBurstContainer.revealBurst:animateInSequence( {
			{
				"default",
				0
			},
			{
				"default",
				f4_local0 * 0.2
			},
			{
				"spin",
				f4_local0 * 0.8
			}
		}, nil, true, true )
	end
end

local f0_local7 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0, f5_local1 = GetMaterialDimensions( LUI.MPDepotLootCard.cardBackMaterial )
	local f5_local2 = f0_local0 * f5_local0 / f5_local1
	local f5_local3 = f5_arg0.supplyDropData.lootData
	local f5_local4 = #f5_local3
	f5_arg0.numCardsNotReadyForReveal = f5_local4
	f5_arg0.numCardsNotFinishedRevealing = f5_local4
	f5_arg0.numCardsNotFinishedAnimating = f5_local4
	f5_arg0.numCurrencyUpdates = #f5_arg0.supplyDropData.replacements + #f5_arg0.supplyDropData.currencies
	local f5_local5 = nil
	local f5_local6 = -1
	local f5_local7 = nil
	local f5_local8 = {}
	for f5_local9 = 1, f5_local4, 1 do
		f5_local5 = -f5_local2 * (f5_local4 - 1) / 2 - f0_local1 * (f5_local4 - 1) / 2 + #f5_arg0.cards * f5_local2 + #f5_arg0.cards * f0_local1
		local f5_local12 = LUI.MPDepotLootCard.new( {
			left = f5_local5,
			top = f0_local2,
			right = f5_local5,
			bottom = f0_local2,
			anchorType = CoD.AnchorTypes.None,
			lootData = f5_local3[f5_local9],
			showCardBack = not f5_arg1,
			cardHeight = f0_local0,
			noScaleText = not f5_arg1,
			addGlitch = not f5_arg1,
			addRevealBurstContainer = true,
			noVerticalGlowPulse = not f5_arg1,
			id = "loot_card" .. f5_local9
		} )
		local f5_local13 = f5_local12.card
		local f5_local14 = LUI.MPDepotLootCard.GetLootRarity( f5_local13.data )
		if f5_local6 < f5_local14 then
			f5_local6 = f5_local14
			f5_local7 = f5_local13
		end
		f5_local12.rootElem.id = "loot_card_translation_container" .. f5_local9
		f5_arg0:addElement( f5_local12.rootElem )
		local f5_local15 = 0
		if f5_local14 == Cac.InventoryItemRarity.Rare then
			f5_local15 = 0.05
		elseif f5_local14 == Cac.InventoryItemRarity.Legendary then
			f5_local15 = 0.1
		elseif f5_local14 == Cac.InventoryItemRarity.Epic then
			f5_local15 = 0.2
		end
		f5_local13.scale:registerAnimationState( "pop_up", {
			scale = f5_local15
		} )
		f5_local13.scale:registerAnimationState( "shrink", {
			scale = -f5_local15
		} )
		if not f5_arg1 then
			f5_local13.translation:registerAnimationState( "offscreen", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = f5_local5 * 4,
				top = -f0_local0 - 720,
				width = 0,
				height = 0
			} )
			f5_local13.rotation:registerAnimationState( "offscreen", {
				xRot = RandomFloatRange( 180, 360 ) * f0_local4(),
				yRot = RandomFloatRange( 180, 360 ) * f0_local4(),
				zRot = RandomFloatRange( 180, 360 ) * f0_local4()
			} )
			f5_local13.rotation:registerAnimationState( "flip90", {
				yRot = 90
			} )
			f5_local13.scale:registerAnimationState( "bigger", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f5_local2 * 0.6,
				top = -f0_local0 * 0.6,
				right = f5_local2 * 0.6,
				bottom = f0_local0 * 0.6
			} )
			f5_local13.scale:registerAnimationState( "small", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f5_local2 * 0.4,
				top = -f0_local0 * 0.4,
				right = f5_local2 * 0.4,
				bottom = f0_local0 * 0.4
			} )
			f5_local13.scale:registerAnimationState( "smaller", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f5_local2 * 0.3,
				top = -f0_local0 * 0.3,
				right = f5_local2 * 0.3,
				bottom = f0_local0 * 0.3
			} )
			f5_local13.scale:registerAnimationState( "smallest", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				left = -f5_local2 * 0.2,
				top = -f0_local0 * 0.2,
				right = f5_local2 * 0.2,
				bottom = f0_local0 * 0.2
			} )
		else
			if not f5_arg2 then
				f0_local6( f5_local13 )
				local f5_local16 = f5_local13.lootItem
				local f5_local17 = f5_local16
				f5_local16 = f5_local16.animateInSequence
				local f5_local18 = {}
				local f5_local19 = {
					"shrunk",
					0
				}
				local f5_local20 = {}
				local f5_local21 = "default"
				local f5_local22 = 500
				local f5_local23, f5_local24, f5_local25 = nil
				local f5_local26 = LUI.Easing.OutBack
				f5_local20[1] = f5_local21
				f5_local20[2] = f5_local22
				f5_local20[3] = f5_local23
				f5_local20[4] = f5_local24
				f5_local20[5] = f5_local25
				f5_local20[6] = f5_local26
				f5_local18[1] = f5_local19
				f5_local18[2] = f5_local20
				f5_local16( f5_local17, f5_local18, nil, true, true )
				f5_local16 = f5_local13.scale
				f5_local17 = f5_local16
				f5_local16 = f5_local16.animateInSequence
				f5_local18 = {}
				f5_local19 = {
					"default",
					0
				}
				f5_local20 = {}
				f5_local21 = "shrink"
				f5_local22 = 100
				f5_local23, f5_local24, f5_local25 = nil
				f5_local26 = LUI.Easing.OutQuartic
				f5_local20[1] = f5_local21
				f5_local20[2] = f5_local22
				f5_local20[3] = f5_local23
				f5_local20[4] = f5_local24
				f5_local20[5] = f5_local25
				f5_local20[6] = f5_local26
				f5_local21 = {}
				f5_local22 = "pop_up"
				f5_local23 = 100
				f5_local24, f5_local25, f5_local26 = nil
				local f5_local27 = LUI.Easing.OutQuartic
				f5_local21[1] = f5_local22
				f5_local21[2] = f5_local23
				f5_local21[3] = f5_local24
				f5_local21[4] = f5_local25
				f5_local21[5] = f5_local26
				f5_local21[6] = f5_local27
				f5_local22 = {}
				f5_local23 = "default"
				f5_local24 = 500
				f5_local25, f5_local26, f5_local27 = nil
				local f5_local28 = LUI.MPDepotLootCard.rarityRevealEasings[f5_local14]
				f5_local22[1] = f5_local23
				f5_local22[2] = f5_local24
				f5_local22[3] = f5_local25
				f5_local22[4] = f5_local26
				f5_local22[5] = f5_local27
				f5_local22[6] = f5_local28
				f5_local18[1] = f5_local19
				f5_local18[2] = f5_local20
				f5_local18[3] = f5_local21
				f5_local18[4] = f5_local22
				f5_local16( f5_local17, f5_local18, nil, true, true )
			else
				f5_local13.lootItem:animateToState( "default" )
			end
			f5_local13.lootName:animateToState( "show", 0 )
			f5_local13.lootCategory:animateToState( "show", 0 )
			f5_local13.lootRarity:animateToState( "show", 0 )
			f5_local13.lootCollection:animateToState( "show", 0 )
		end
		f5_local13.menu = f5_arg0
		if f5_local13.cardFlare then
			f5_local13.cardFlare:animateInSequence( {
				{
					"collapse",
					0
				},
				{
					"hide",
					0
				}
			}, nil, true, true )
		end
		for f5_local16 = 1, #f5_arg0.supplyDropData.replacements, 1 do
			if f5_arg0.supplyDropData.replacements[f5_local16].item_index == f5_local9 then
				f5_local13.duplicateCurrency = f5_arg0.supplyDropData.replacements[f5_local16].currency
				if f5_local13.duplicateCurrency ~= nil and not f5_arg2 then
					LUI.ComScore.LogDismantleItem( f5_arg0.exclusiveController, f5_local3[f5_local9], f5_local13.duplicateCurrency.amount )
				end
			end
		end
		if not f5_local13.duplicateCurrency and CollectionRewardsEnabled() then
			local f5_local16 = GetCollectionForItem( f5_local13.data.guid )
			if f5_local16 ~= nil and (f5_local16.completed or f5_arg0.debugShowCollectionReward) then
				f5_local13.collectionCompleted = true
				if not f5_arg2 then
					CollectionRewardQueueAdd( f5_arg0, f5_local16 )
				end
			end
			local f5_local17 = GetSeasonForItem( f5_local13.data.guid )
			if f5_local17 ~= nil and f5_local17.rewardData ~= nil and (f5_local17.rewardData.completed or f5_arg0.debugShowCollectionReward) and not f5_arg2 then
				f5_local8[f5_local17.tag] = f5_local17.rewardData
			end
		end
		f5_local13.index = f5_local9
		f5_arg0.cards[f5_local9] = f5_local13
	end
	for f5_local29, f5_local30 in pairs( f5_local8 ) do
		CollectionRewardQueueAdd( f5_arg0, f5_local30 )
	end
	if f5_local7 then
		if not f5_local7.duplicateCurrency then
			f5_local7.rarityVO = LUI.MPDepotLootCard.rarityVO[f5_local6].new
		else
			f5_local7.rarityVO = LUI.MPDepotLootCard.rarityVO[f5_local6].dupe
		end
	end
	if #f5_arg0.supplyDropData.currencies > 0 then
		f5_local9 = RegisterMaterial( "depot_parts_icon" )
		f5_local10, f5_local11 = GetMaterialDimensions( f5_local9 )
		f5_local29 = f5_local11 / f5_local10
		f5_local30 = f5_local2 * 0.65
		local f5_local12 = f5_local30 * f5_local29
		f5_local5 = -f5_local30 / 2 - f5_local2 * (f5_local4 - 1) / 2 - f0_local1 * f5_local4 / 2 + #f5_arg0.cards * f5_local2 + #f5_arg0.cards * f0_local1
		local f5_local13 = CoD.CreateState( f5_local5, f0_local2 - f5_local12 / 2, f5_local5 + f5_local30, f0_local2 + f5_local12 / 2, CoD.AnchorTypes.None )
		f5_arg0.currencyContainer = LUI.UIElement.new( f5_local13 )
		f5_arg0.currencyContainer.defaultState = f5_local13
		f5_arg0.currencyContainer.amount = f5_arg0.supplyDropData.currencies[1].amount
		f5_arg0.currencyContainer.currencyMat = f5_local9
		f5_arg0.currencyContainer.width = f5_local30
		f5_arg0.currencyContainer.height = f5_local12
		f5_arg0:addElement( f5_arg0.currencyContainer )
	end
end

local f0_local8 = function ( f6_arg0 )
	f6_arg0.menu.numCardsNotReadyForReveal = f6_arg0.menu.numCardsNotReadyForReveal - 1
	if f6_arg0.menu.numCardsNotReadyForReveal <= 0 then
		f6_arg0.menu:processEvent( {
			name = "reveal_cards"
		} )
	end
end

local f0_local9 = function ( f7_arg0 )
	f7_arg0.menu.numCardsNotFinishedRevealing = f7_arg0.menu.numCardsNotFinishedRevealing - 1
	if f7_arg0.collectionCompleted then
		f0_local5( f7_arg0, true )
	end
	if f7_arg0.menu.numCardsNotFinishedRevealing <= 0 then
		f7_arg0.menu:processEvent( {
			name = "show_currency_and_title"
		} )
		f7_arg0.menu:processEvent( {
			name = "show_bonus_currency"
		} )
		Engine.Loot_MarkSupplyDropOpened( f7_arg0.menu.exclusiveController, f7_arg0.menu.supplyDropType )
	end
end

local f0_local10 = function ( f8_arg0 )
	f8_arg0.menu.numCardsNotFinishedAnimating = f8_arg0.menu.numCardsNotFinishedAnimating - 1
	if f8_arg0.menu.numCardsNotFinishedAnimating <= 0 then
		f8_arg0.menu.allowSkip = false
		f8_arg0.menu:processEvent( {
			name = "initCardNavigation"
		} )
		f8_arg0.menu:processEvent( {
			name = "show"
		} )
	end
end

local f0_local11 = function ( f9_arg0 )
	local f9_local0 = LUI.MPDepotLootCard.GetLootRarity( f9_arg0.data )
	if f9_local0 > Cac.InventoryItemRarity.Common then
		local f9_local1 = 500
		if LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke then
			f9_local1 = f9_local1 * 2
		end
		local f9_local2, f9_local3, f9_local4, f9_local5 = f9_arg0.scale:getLocalRect()
		local f9_local6 = f9_local4 - f9_local2
		local f9_local7 = f9_local5 - f9_local3
		if LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullglow then
			f9_arg0.skullGlow = LUI.MenuBuilder.BuildAddChild( f9_arg0, {
				type = "UIImage",
				id = "loot_card_skullglow",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullglow.sideOffsetPct * f9_local6,
						top = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullglow.topOffsetPct * f9_local7,
						right = -LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullglow.sideOffsetPct * f9_local6,
						bottom = -LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullglow.bottomOffsetPct * f9_local7,
						material = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullglow.mat,
						alpha = 0
					},
					show = {
						alpha = 1
					},
					hide = {
						alpha = 0
					}
				}
			} )
			f9_arg0.skullGlow:animateInSequence( {
				{
					"default",
					0
				},
				{
					"show",
					f9_local1 * 0.4
				},
				{
					"hide",
					f9_local1 * 0.6
				}
			}, nil, true, true )
		end
		if LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullfill then
			f9_arg0.skullFill = LUI.MenuBuilder.BuildAddChild( f9_arg0, {
				type = "UIImage",
				id = "loot_card_skullfill",
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullfill.sideOffsetPct * f9_local6,
						top = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullfill.topOffsetPct * f9_local7,
						right = -LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullfill.sideOffsetPct * f9_local6,
						bottom = -LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullfill.bottomOffsetPct * f9_local7,
						material = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullfill.mat,
						alpha = 0
					},
					show = {
						alpha = 1
					},
					hide = {
						alpha = 0
					}
				}
			} )
			f9_arg0.skullFill:animateInSequence( {
				{
					"default",
					0
				},
				{
					"show",
					f9_local1 * 0.4
				},
				{
					"hide",
					f9_local1 * 0.6
				}
			}, nil, true, true )
		end
		if LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke then
			local f9_local8 = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke.topOffsetPct * f9_local7 - f9_local7 / 2
			local f9_local9 = f9_local7 / 2 - LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke.bottomOffsetPct * f9_local7
			local f9_local10 = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke.sideOffsetPct * f9_local6 - f9_local6 / 2
			local f9_local11 = f9_local6 / 2 - LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke.sideOffsetPct * f9_local6
			local f9_local12 = f9_local11 - f9_local10
			local f9_local13 = f9_local9 - f9_local8
			f9_arg0.skullStencil = LUI.MenuBuilder.BuildAddChild( f9_arg0, {
				type = "UIElement",
				id = "loot_card_skullStencil",
				states = {
					default = {
						leftAnchor = false,
						rightAnchor = false,
						topAnchor = false,
						bottomAnchor = false,
						left = f9_local10,
						top = f9_local9,
						right = f9_local11,
						bottom = f9_local9 + f0_local3
					},
					moveToTop = {
						leftAnchor = false,
						rightAnchor = false,
						topAnchor = false,
						bottomAnchor = false,
						left = f9_local10,
						top = f9_local8 - f0_local3,
						right = f9_local11,
						bottom = f9_local8
					}
				}
			} )
			f9_arg0.skullStencil:setUseStencil( true )
			f9_arg0.skullStroke = LUI.MenuBuilder.BuildAddChild( f9_arg0.skullStencil, {
				type = "UIImage",
				id = "loot_card_skullStroke",
				states = {
					default = {
						leftAnchor = false,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = f9_local10,
						top = -f9_local13,
						right = f9_local11,
						bottom = 0,
						material = LUI.MPDepotLootCard.rarityMaterials[f9_local0].skullstroke.mat,
						alpha = 1
					},
					moveWithStencil = {
						leftAnchor = false,
						rightAnchor = false,
						topAnchor = true,
						bottomAnchor = false,
						left = f9_local10,
						top = f0_local3,
						right = f9_local11,
						bottom = f0_local3 + f9_local13
					}
				}
			} )
			f9_arg0.skullStencil:animateInSequence( {
				{
					"default",
					0
				},
				{
					"default",
					f9_local1 * 0.2
				},
				{
					"moveToTop",
					f9_local1 * 0.5
				}
			}, nil, true, true )
			f9_arg0.skullStroke:animateInSequence( {
				{
					"default",
					0
				},
				{
					"default",
					f9_local1 * 0.2
				},
				{
					"moveWithStencil",
					f9_local1 * 0.5
				}
			}, nil, true, true )
		end
		f9_arg0:registerEventHandler( "card_back_fx_finished", f0_local8 )
		f9_arg0:addElement( LUI.UITimer.new( f9_local1, "card_back_fx_finished", nil, true ) )
	else
		f0_local8( f9_arg0 )
	end
end

local f0_local12 = function ( f10_arg0 )
	if f10_arg0.numCurrencyUpdates == 1 then
		Engine.PlaySound( "h1_ui_grind_bank" )
		f10_arg0:UpdateCurrency( InventoryCurrencyType.Parts )
		f10_arg0:HighlightCurrency( InventoryCurrencyType.Parts )
	end
	f10_arg0.numCurrencyUpdates = f10_arg0.numCurrencyUpdates - 1
end

local f0_local13 = function ( f11_arg0, f11_arg1 )
	if f11_arg0.currencyContainer then
		local f11_local0 = 300
		local f11_local1 = 500
		local f11_local2 = 250
		local f11_local3 = 250
		local f11_local4 = 500
		if not f11_arg1.skipAnimation then
			LUI.MPDepotBase.PlaySound( f11_arg0, {
				sound = "h1_ui_bonus_parts"
			} )
		end
		local f11_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
		f11_local5.alpha = 1
		f11_local5.material = f11_arg0.currencyContainer.currencyMat
		f11_arg0.currencyContainer.currencyImage = LUI.UIImage.new( f11_local5 )
		f11_arg0.currencyContainer.currencyImage:setPriority( 100 )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.currencyImage )
		local f11_local6, f11_local7, f11_local8, f11_local9 = f11_arg0.currencyContainer:getLocalRect()
		local f11_local10 = f11_local8 - f11_local6
		local f11_local11 = f11_local9 - f11_local7
		local f11_local12 = CoD.CreateState( -f11_local10 * 0.3, -f11_local11 * 0.3, f11_local10 * 0.3, f11_local11 * 0.3, CoD.AnchorTypes.All )
		f11_local12.material = RegisterMaterial( "depot_gear_icon_soft" )
		f11_local12.alpha = 0
		f11_arg0.currencyContainer.clockworkGear = LUI.UIImage.new( f11_local12 )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.clockworkGear )
		f11_local5.material = RegisterMaterial( "depot_parts_icon_hollow" )
		f11_local5.alpha = 0
		f11_arg0.currencyContainer.currencyHollowImage = LUI.UIImage.new( f11_local5 )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.currencyHollowImage )
		local f11_local13 = 0
		local f11_local14 = f11_arg0.currencyContainer.height * 0.33
		local f11_local15 = CoD.CreateState( f11_arg0.currencyContainer.width * 0.35, (f11_arg0.currencyContainer.height - f11_local14) / 2 + f11_local13, -f11_arg0.currencyContainer.width * 0.35, (f11_local14 - f11_arg0.currencyContainer.height) / 2 + f11_local13, CoD.AnchorTypes.All )
		f11_local15.horizontalAlignment = LUI.HorizontalAlignment.Center
		f11_local15.verticalAlignment = LUI.VerticalAlignment.Middle
		f11_local15.font = CoD.TextSettings.TitleFontTinyBold.Font
		f11_local15.alpha = 1
		f11_arg0.currencyContainer.amountText = LUI.UIText.new( f11_local15 )
		f11_arg0.currencyContainer.amountText:setupAutoScaleText()
		f11_arg0.currencyContainer.amountText:setText( tostring( f11_arg0.currencyContainer.amount ) )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.amountText )
		local f11_local16 = 15
		f11_local15 = CoD.CreateState( 0, 0, 0, f11_local16, CoD.AnchorTypes.LeftRight )
		f11_local15.horizontalAlignment = LUI.HorizontalAlignment.Center
		f11_local15.verticalAlignment = LUI.VerticalAlignment.Middle
		f11_local15.font = CoD.TextSettings.BodyFont.Font
		f11_local15.alpha = 0
		f11_arg0.currencyContainer.bonusPartsText = LUI.UIText.new( f11_local15 )
		f11_arg0.currencyContainer.bonusPartsText:setupAutoScaleText()
		f11_arg0.currencyContainer.bonusPartsText:setText( Engine.Localize( "@DEPOT_BONUS_PARTS" ) )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.bonusPartsText )
		local f11_local17 = CoD.CreateState( 0, -f11_arg0.currencyContainer.height * 0.25, 0, -f11_arg0.currencyContainer.height * 0.25, CoD.AnchorTypes.None )
		local f11_local18 = RegisterMaterial( "depot_glow_white" )
		local f11_local19, f11_local20 = GetMaterialDimensions( f11_local18 )
		local f11_local21 = f11_local20 / f11_local19
		local f11_local22 = f11_arg0.currencyContainer.width
		local f11_local23 = f11_local22 * f11_local21
		f11_local17.material = f11_local18
		f11_local17.color = {
			r = 1,
			g = 1,
			b = 1
		}
		f11_arg0.currencyContainer.glow = LUI.UIImage.new( f11_local17 )
		f11_arg0.currencyContainer.glow:setPriority( 200 )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.glow )
		local f11_local24 = RegisterMaterial( "depot_glow_vertical" )
		local f11_local25, f11_local26 = GetMaterialDimensions( f11_local24 )
		local f11_local27 = f11_local26 / f11_local25
		local f11_local28 = f11_arg0.currencyContainer.width
		local f11_local29 = f11_local28 * f11_local27
		local f11_local30 = CoD.CreateState( -f11_local28 / 2, -f11_local29 * 0.25, f11_local28 / 2, f11_local29 * 0.75, CoD.AnchorTypes.None )
		f11_local30.material = f11_local24
		f11_local30.color = {
			r = 0,
			g = 0,
			b = 0
		}
		f11_arg0.currencyContainer.vertGlow = LUI.UIImage.new( f11_local30 )
		f11_arg0.currencyContainer.vertGlow:setPriority( -100 )
		f11_arg0.currencyContainer:addElement( f11_arg0.currencyContainer.vertGlow )
		f11_arg0.currencyContainer.vertGlow:registerAnimationState( "show", {
			color = {
				r = 1,
				g = 1,
				b = 1
			}
		} )
		f11_arg0.currencyContainer.vertGlow:animateInSequence( {
			{
				"default",
				f11_local0 + f11_local2 + f11_local3 + f11_local4 + f11_local1
			},
			{
				"show",
				f11_local4
			}
		}, nil, true, true )
		f11_arg0.currencyContainer.glow:registerAnimationState( "highlight_skull", CoD.CreateState( -f11_local22 / 2, f11_arg0.currencyContainer.height * 0.15 - f11_local23 / 2, f11_local22 / 2, f11_arg0.currencyContainer.height * 0.15 + f11_local23 / 2, CoD.AnchorTypes.None ) )
		f11_arg0.currencyContainer.glow:registerAnimationState( "shrink", CoD.CreateState( 0, f11_arg0.currencyContainer.height * 0.25, 0, f11_arg0.currencyContainer.height * 0.25, CoD.AnchorTypes.None ) )
		f11_arg0.currencyContainer.glow:registerAnimationState( "center", CoD.CreateState( -f11_local22 / 4, -f11_local23 / 4, f11_local22 / 4, f11_local23 / 4, CoD.AnchorTypes.None ) )
		f11_arg0.currencyContainer.glow:registerAnimationState( "highlight_number", CoD.CreateState( -f11_local22 / 2, -f11_local23 / 2, f11_local22 / 2, f11_local23 / 2, CoD.AnchorTypes.None ) )
		f11_arg0.currencyContainer.glow:registerAnimationState( "shrink_center", CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.None ) )
		f11_arg0.currencyContainer.glow:animateInSequence( {
			{
				"default",
				0
			},
			{
				"highlight_skull",
				f11_local0 + f11_local2 * 0.5
			},
			{
				"shrink",
				f11_local2 * 0.5
			},
			{
				"shrink",
				f11_local3 + f11_local4
			},
			{
				"center",
				0
			},
			{
				"highlight_number",
				f11_local1
			},
			{
				"shrink_center",
				f11_local4
			}
		}, nil, true, true, true )
		local f11_local31 = LUI.DeepCopy( f11_arg0.currencyContainer.defaultState )
		f11_local31.top = f11_local31.top + f11_arg0.currencyContainer.height * 0.3
		f11_local31.bottom = f11_local31.bottom - f11_arg0.currencyContainer.height * 0.3
		f11_local31.left = f11_local31.left + f11_arg0.currencyContainer.width * 0.3
		f11_local31.right = f11_local31.right - f11_arg0.currencyContainer.width * 0.3
		f11_arg0.currencyContainer:registerAnimationState( "shrunk", f11_local31 )
		local f11_local32 = LUI.DeepCopy( f11_arg0.currencyContainer.defaultState )
		f11_local32.top = f11_local32.top - f11_arg0.currencyContainer.height * 0.1
		f11_local32.bottom = f11_local32.bottom + f11_arg0.currencyContainer.height * 0.1
		f11_local32.left = f11_local32.left - f11_arg0.currencyContainer.width * 0.1
		f11_local32.right = f11_local32.right + f11_arg0.currencyContainer.width * 0.1
		f11_arg0.currencyContainer:registerAnimationState( "expanded", f11_local32 )
		f11_arg0.currencyContainer:animateInSequence( {
			{
				"shrunk",
				0
			},
			{
				"expanded",
				f11_local0
			},
			{
				"default",
				f11_local2
			}
		}, nil, true, true )
		f11_local32 = CoD.CreateState( -f11_arg0.currencyContainer.width / 2, -f11_arg0.currencyContainer.height / 2 + f11_local13, f11_arg0.currencyContainer.width / 2, f11_arg0.currencyContainer.height / 2 + f11_local13, CoD.AnchorTypes.All )
		f11_local32.alpha = 0
		f11_arg0.currencyContainer.currencyImage:registerAnimationState( "expand_fade", f11_local32 )
		f11_arg0.currencyContainer.currencyImage:registerAnimationState( "become_hollow", f11_local5 )
		f11_arg0.currencyContainer.currencyImage:registerAnimationState( "show", {
			alpha = 1
		} )
		f11_local32 = CoD.CreateState( -f11_arg0.currencyContainer.width * 0.1, -f11_arg0.currencyContainer.height * 0.1 + f11_local13, f11_arg0.currencyContainer.width * 0.1, f11_arg0.currencyContainer.height * 0.1 + f11_local13, CoD.AnchorTypes.All )
		f11_local32.alpha = 0
		f11_arg0.currencyContainer.currencyImage:registerAnimationState( "expand_fade_small", f11_local32 )
		f11_arg0.currencyContainer.currencyImage:animateInSequence( {
			{
				"default",
				f11_local0 + f11_local2 + f11_local3
			},
			{
				"expand_fade",
				f11_local4
			},
			{
				"become_hollow",
				f11_local1
			},
			{
				"show",
				0
			},
			{
				"expand_fade_small",
				f11_local4
			}
		}, nil, true, true, true )
		f11_arg0.currencyContainer.currencyHollowImage:registerAnimationState( "show", {
			alpha = 1
		} )
		f11_arg0.currencyContainer.currencyHollowImage:animateInSequence( {
			{
				"default",
				f11_local0 + f11_local2 + f11_local3
			},
			{
				"show",
				0
			}
		}, nil, true, true )
		f11_arg0.currencyContainer.clockworkGear:registerAnimationState( "show", {
			alpha = 1,
			zRot = 0
		} )
		local f11_local33 = 45
		while f11_local33 <= 405 do
			f11_arg0.currencyContainer.clockworkGear:registerAnimationState( "" .. f11_local33, {
				zRot = f11_local33
			} )
			f11_local33 = f11_local33 + 45
		end
		f11_arg0.currencyContainer.clockworkGear:animateInSequence( {
			{
				"default",
				f11_local0 + f11_local2 + f11_local3
			},
			{
				"show",
				0
			}
		}, nil, true, true )
		f11_arg0.currencyContainer.clockworkGear:registerEventHandler( "clockwork", function ( element, event )
			local f12_local0 = 3000
			local f12_local1 = 300
			local f12_local2 = element
			local f12_local3 = element.animateInLoop
			local f12_local4 = {}
			local f12_local5 = {
				"show",
				0
			}
			local f12_local6 = {
				"90",
				f12_local0
			}
			local f12_local7 = {}
			local f12_local8 = "45"
			local f12_local9 = f12_local1
			local f12_local10, f12_local11, f12_local12 = nil
			local f12_local13 = LUI.Easing.OutBack
			f12_local7[1] = f12_local8
			f12_local7[2] = f12_local9
			f12_local7[3] = f12_local10
			f12_local7[4] = f12_local11
			f12_local7[5] = f12_local12
			f12_local7[6] = f12_local13
			f12_local8 = {
				"135",
				f12_local0
			}
			f12_local9 = {}
			f12_local10 = "90"
			f12_local11 = f12_local1
			local f12_local12, f12_local13, f12_local14 = nil
			local f12_local15 = LUI.Easing.OutBack
			f12_local9[1] = f12_local10
			f12_local9[2] = f12_local11
			f12_local9[3] = f12_local12
			f12_local9[4] = f12_local13
			f12_local9[5] = f12_local14
			f12_local9[6] = f12_local15
			f12_local10 = {
				"180",
				f12_local0
			}
			f12_local11 = {}
			f12_local12 = "135"
			f12_local13 = f12_local1
			local f12_local14, f12_local15, f12_local16 = nil
			local f12_local17 = LUI.Easing.OutBack
			f12_local11[1] = f12_local12
			f12_local11[2] = f12_local13
			f12_local11[3] = f12_local14
			f12_local11[4] = f12_local15
			f12_local11[5] = f12_local16
			f12_local11[6] = f12_local17
			f12_local12 = {
				"225",
				f12_local0
			}
			f12_local13 = {}
			f12_local14 = "180"
			f12_local15 = f12_local1
			local f12_local16, f12_local17, f12_local18 = nil
			local f12_local19 = LUI.Easing.OutBack
			f12_local13[1] = f12_local14
			f12_local13[2] = f12_local15
			f12_local13[3] = f12_local16
			f12_local13[4] = f12_local17
			f12_local13[5] = f12_local18
			f12_local13[6] = f12_local19
			f12_local14 = {
				"270",
				f12_local0
			}
			f12_local15 = {}
			f12_local16 = "225"
			f12_local17 = f12_local1
			local f12_local18, f12_local19, f12_local20 = nil
			local f12_local21 = LUI.Easing.OutBack
			f12_local15[1] = f12_local16
			f12_local15[2] = f12_local17
			f12_local15[3] = f12_local18
			f12_local15[4] = f12_local19
			f12_local15[5] = f12_local20
			f12_local15[6] = f12_local21
			f12_local16 = {
				"315",
				f12_local0
			}
			f12_local17 = {}
			f12_local18 = "270"
			f12_local19 = f12_local1
			local f12_local20, f12_local21, f12_local22 = nil
			local f12_local23 = LUI.Easing.OutBack
			f12_local17[1] = f12_local18
			f12_local17[2] = f12_local19
			f12_local17[3] = f12_local20
			f12_local17[4] = f12_local21
			f12_local17[5] = f12_local22
			f12_local17[6] = f12_local23
			f12_local18 = {
				"360",
				f12_local0
			}
			f12_local19 = {}
			f12_local20 = "315"
			f12_local21 = f12_local1
			local f12_local22, f12_local23, f12_local24 = nil
			local f12_local25 = LUI.Easing.OutBack
			f12_local19[1] = f12_local20
			f12_local19[2] = f12_local21
			f12_local19[3] = f12_local22
			f12_local19[4] = f12_local23
			f12_local19[5] = f12_local24
			f12_local19[6] = f12_local25
			f12_local20 = {
				"405",
				f12_local0
			}
			f12_local21 = {}
			f12_local22 = "360"
			f12_local23 = f12_local1
			local f12_local24, f12_local25, f12_local26 = nil
			local f12_local27 = LUI.Easing.OutBack
			f12_local21[1] = f12_local22
			f12_local21[2] = f12_local23
			f12_local21[3] = f12_local24
			f12_local21[4] = f12_local25
			f12_local21[5] = f12_local26
			f12_local21[6] = f12_local27
			f12_local4[1] = f12_local5
			f12_local4[2] = f12_local6
			f12_local4[3] = f12_local7
			f12_local4[4] = f12_local8
			f12_local4[5] = f12_local9
			f12_local4[6] = f12_local10
			f12_local4[7] = f12_local11
			f12_local4[8] = f12_local12
			f12_local4[9] = f12_local13
			f12_local4[10] = f12_local14
			f12_local4[11] = f12_local15
			f12_local4[12] = f12_local16
			f12_local4[13] = f12_local17
			f12_local4[14] = f12_local18
			f12_local4[15] = f12_local19
			f12_local4[16] = f12_local20
			f12_local4[17] = f12_local21
			f12_local3( f12_local2, f12_local4, nil, nil, true, true )
		end )
		if not f11_arg1.skipAnimation then
			f11_arg0.currencyContainer.clockworkGear:addElement( LUI.UITimer.new( f11_local0 + f11_local2 * 2 + f11_local3 + f11_local4 * 2 + f11_local1, "clockwork", nil, true ) )
		end
		f11_local32 = CoD.CreateState( -f11_arg0.currencyContainer.width * 2, -f11_arg0.currencyContainer.height, f11_arg0.currencyContainer.width * 2, f11_arg0.currencyContainer.height, CoD.AnchorTypes.All )
		f11_local32.alpha = 0
		f11_arg0.currencyContainer.amountText:registerAnimationState( "expanded", f11_local32 )
		f11_local31 = CoD.CreateState( f11_arg0.currencyContainer.width * 0.4, (f11_arg0.currencyContainer.height - f11_local14 * 0.75) / 2 + f11_local13, -f11_arg0.currencyContainer.width * 0.4, (f11_local14 * 0.75 - f11_arg0.currencyContainer.height) / 2 + f11_local13, CoD.AnchorTypes.All )
		f11_local31.alpha = 1
		f11_arg0.currencyContainer.amountText:registerAnimationState( "shrunk", f11_local31 )
		f11_arg0.currencyContainer.amountText:animateInSequence( {
			{
				"expanded",
				0
			},
			{
				"expanded",
				f11_local0 + f11_local2 + f11_local3 + f11_local4
			},
			{
				"shrunk",
				f11_local1
			},
			{
				"default",
				f11_local2
			}
		}, nil, true, true )
		f11_local15 = CoD.CreateState( 0, f11_arg0.currencyContainer.height * 0.6, 0, f11_arg0.currencyContainer.height * 0.6 + f11_local16, CoD.AnchorTypes.LeftRight )
		f11_local15.alpha = 1
		f11_arg0.currencyContainer.bonusPartsText:registerAnimationState( "moveToBottom", f11_local15 )
		f11_arg0.currencyContainer.bonusPartsText:animateInSequence( {
			{
				"default",
				0
			},
			{
				"default",
				f11_local0 + f11_local2 + f11_local3 + f11_local4
			},
			{
				"moveToBottom",
				f11_local1
			}
		}, nil, true, true )
		if f11_arg1.skipAnimation then
			f11_arg0.currencyContainer.vertGlow:animateToState( "show" )
			f11_arg0.currencyContainer.glow:close()
			f11_arg0.currencyContainer:animateToState( "default" )
			f11_arg0.currencyContainer.currencyImage:close()
			f11_arg0.currencyContainer.currencyHollowImage:animateToState( "default" )
			f11_arg0.currencyContainer.clockworkGear:processEvent( {
				name = "clockwork"
			} )
			f11_arg0.currencyContainer.amountText:animateToState( "default" )
			f11_arg0.currencyContainer.bonusPartsText:animateToState( "moveToBottom" )
		end
		f11_arg0:addElement( LUI.UITimer.new( f11_local0 + f11_local2 + f11_local3 + f11_local4 + f11_local1 * 0.75, "update_and_highlight_currency", nil, true ) )
	end
end

local f0_local14 = function ( f13_arg0, f13_arg1 )
	local f13_local0
	if f13_arg1 then
		f13_local0 = 0
		if not f13_local0 then
		
		else
			local f13_local1 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
			f13_local1.material = RegisterMaterial( "depot_card_dismantle_cover" )
			f13_local1.alpha = 0
			f13_arg0.darken = LUI.UIImage.new( f13_local1 )
			f13_arg0.darken:registerAnimationState( "darken", {
				alpha = 0.85
			} )
			f13_arg0:addElement( f13_arg0.darken )
			f13_arg0.darken:animateToState( "darken", f13_local0 )
			return f13_local0
		end
	end
	f13_local0 = 500
end

local f0_local15 = function ( f14_arg0, f14_arg1 )
	if not f14_arg0.duplicateCurrency then
		return 
	elseif not f14_arg1.skipAnimation then
		f14_arg0.menu:processEvent( {
			name = "update_and_highlight_currency"
		} )
	else
		f0_local14( f14_arg0, true )
	end
	local f14_local0 = 1000
	local f14_local1 = 0
	local f14_local2 = -f0_local0 * 0.2
	local f14_local3 = 2
	local f14_local4, f14_local5, f14_local6, f14_local7 = f14_arg0.scale:getLocalRect()
	local f14_local8 = f14_local6 - f14_local4
	local f14_local9 = f14_local7 - f14_local5
	local f14_local10, f14_local11 = GetMaterialDimensions( RegisterMaterial( "depot_card_back" ) )
	local f14_local12 = f14_local8 / f14_local10
	local f14_local13 = f14_local9 / f14_local11
	local f14_local14 = RegisterMaterial( "depot_parts_icon_hollow" )
	local f14_local15, f14_local16 = GetMaterialDimensions( f14_local14 )
	local f14_local17 = 0.75
	local f14_local18 = f14_local15 * f14_local12 * f14_local17
	local f14_local19 = f14_local16 * f14_local13 * f14_local17
	local f14_local20 = CoD.CreateState( f14_local1 - f14_local18 / 2 * f14_local3, f14_local2 - f14_local19 / 2 * f14_local3, f14_local1 + f14_local18 / 2 * f14_local3, f14_local2 + f14_local19 / 2 * f14_local3, CoD.AnchorTypes.None )
	f14_local20.material = f14_local14
	f14_local20.alpha = 0
	f14_arg0.depotPartsIcon = LUI.UIImage.new( f14_local20 )
	f14_local3 = 0.9
	f14_local20 = CoD.CreateState( f14_local1 - f14_local18 / 2 * f14_local3, f14_local2 - f14_local19 / 2 * f14_local3, f14_local1 + f14_local18 / 2 * f14_local3, f14_local2 + f14_local19 / 2 * f14_local3, CoD.AnchorTypes.None )
	f14_local20.alpha = 1
	f14_arg0.depotPartsIcon:registerAnimationState( "drop", f14_local20 )
	f14_local3 = 1
	f14_arg0.depotPartsIcon:registerAnimationState( "bounce", CoD.CreateState( f14_local1 - f14_local18 / 2 * f14_local3, f14_local2 - f14_local19 / 2 * f14_local3, f14_local1 + f14_local18 / 2 * f14_local3, f14_local2 + f14_local19 / 2 * f14_local3, CoD.AnchorTypes.None ) )
	f14_arg0:addElement( f14_arg0.depotPartsIcon )
	f14_arg0.depotPartsIcon:animateInSequence( {
		{
			"default",
			0
		},
		{
			"drop",
			f14_local0 * 0.5
		},
		{
			"bounce",
			f14_local0 * 0.25
		}
	}, nil, true, true )
	local f14_local21 = f14_local19 * 0.33
	f14_local20 = CoD.CreateState( -f14_local18 * 0.17, f14_local2 - f14_local21 / 10, f14_local18 * 0.17, f14_local2 + f14_local21 / 10, CoD.AnchorTypes.None )
	f14_local20.horizontalAlignment = LUI.HorizontalAlignment.Center
	f14_local20.verticalAlignment = LUI.VerticalAlignment.Middle
	f14_local20.font = CoD.TextSettings.TitleFontTinyBold.Font
	f14_local20.alpha = 0
	f14_arg0.amountText = LUI.UIText.new( f14_local20 )
	f14_arg0.amountText:setText( tostring( f14_arg0.duplicateCurrency.amount ) )
	f14_arg0.amountText:setupAutoScaleText()
	f14_arg0.amountText:registerAnimationState( "show", {
		alpha = 0.25
	} )
	f14_local20 = CoD.CreateState( -f14_local18 * 0.17, f14_local2 - f14_local21 / 2, f14_local18 * 0.17, f14_local2 + f14_local21 / 2, CoD.AnchorTypes.None )
	f14_local20.alpha = 1
	f14_arg0.amountText:registerAnimationState( "raise", f14_local20 )
	f14_arg0:addElement( f14_arg0.amountText )
	local f14_local22 = f14_arg0.amountText
	local f14_local23 = f14_local22
	f14_local22 = f14_local22.animateInSequence
	local f14_local24 = {}
	local f14_local25 = {
		"default",
		0
	}
	local f14_local26 = {
		"default",
		f14_local0 * 0.5
	}
	local f14_local27 = {
		"show",
		0
	}
	local f14_local28 = {}
	local f14_local29 = "raise"
	local f14_local30 = f14_local0 * 0.5
	local f14_local31, f14_local32, f14_local33 = nil
	local f14_local34 = LUI.Easing.OutBack
	f14_local28[1] = f14_local29
	f14_local28[2] = f14_local30
	f14_local28[3] = f14_local31
	f14_local28[4] = f14_local32
	f14_local28[5] = f14_local33
	f14_local28[6] = f14_local34
	f14_local24[1] = f14_local25
	f14_local24[2] = f14_local26
	f14_local24[3] = f14_local27
	f14_local24[4] = f14_local28
	f14_local22( f14_local23, f14_local24, nil, true, true )
	f14_local2 = f14_local2 + f14_local19 * 0.5
	f14_local20 = CoD.CreateState( -f14_local18 / 2, f14_local2 - f14_local21 / 2, f14_local18 / 2, f14_local2 + f14_local21 / 2, CoD.AnchorTypes.None )
	f14_local20.horizontalAlignment = LUI.HorizontalAlignment.Center
	f14_local20.verticalAlignment = LUI.VerticalAlignment.Middle
	f14_local20.font = CoD.TextSettings.BodyFont.Font
	f14_local20.alpha = 0
	f14_arg0.dismantleText = LUI.UIText.new( f14_local20 )
	f14_arg0.dismantleText:setText( Engine.Localize( "@DEPOT_DISMANTLED_PARTS" ) )
	f14_arg0.dismantleText:setupAutoScaleText()
	f14_arg0.dismantleText:registerAnimationState( "show", {
		alpha = 1
	} )
	f14_arg0:addElement( f14_arg0.dismantleText )
	f14_arg0.dismantleText:animateInSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f14_local0 * 0.5
		},
		{
			"show",
			f14_local0 * 0.5
		}
	}, nil, true, true )
	if f14_arg1.skipAnimation then
		f14_arg0.lootItem:animateToState( "hide" )
		f14_arg0.depotPartsIcon:animateToState( "bounce" )
		f14_arg0.amountText:animateToState( "raise" )
		f14_arg0.dismantleText:animateToState( "show" )
	else
		f14_arg0:addElement( LUI.UITimer.new( f14_local0, "card_animation_finished", nil, true ) )
	end
end

local f0_local16 = function ( f15_arg0 )
	if f15_arg0.gears then
		for f15_local0 = 1, #f15_arg0.gears, 1 do
			f15_arg0.gears[f15_local0]:close()
		end
		f15_arg0.gears = nil
	end
	if f15_arg0.sparkSfxId then
		Engine.StopSound( f15_arg0.sparkSfxId )
	end
end

local f0_local17 = function ( f16_arg0 )
	local f16_local0 = 500
	local f16_local1 = 250
	local f16_local2, f16_local3, f16_local4, f16_local5 = f16_arg0.menu.currencyInfoPanel.currencyBalanceContainers[InventoryCurrencyType.Parts].currencyImg:getCurrentGlobalRect()
	local f16_local6 = f16_local2 + (f16_local4 - f16_local2) / 2
	local f16_local7 = f16_local3 + (f16_local5 - f16_local3) / 2
	f16_arg0.nut.noDelay = true
	f16_arg0.gears = {
		f16_arg0.smallestGear,
		f16_arg0.smallGear,
		f16_arg0.bigGear,
		f16_arg0.nut
	}
	for f16_local8 = 1, #f16_arg0.gears, 1 do
		local f16_local11 = f16_local1 * (f16_local8 - 1)
		if f16_arg0.gears[f16_local8].noDelay then
			f16_local11 = f16_local11 - f16_local1
		end
		local f16_local12 = 1
		if f16_arg0.gears[f16_local8].finalZRot < 0 then
			f16_local12 = -1
		end
		local f16_local13 = f16_arg0.gears[f16_local8].finalZRot + 360 * f16_local11 / 1000 * f16_local12
		local f16_local14, f16_local15, f16_local16, f16_local17 = f16_arg0.gears[f16_local8]:getCurrentGlobalRect()
		local f16_local18 = f16_local14 + (f16_local16 - f16_local14) / 2
		local f16_local19 = f16_local15 + (f16_local17 - f16_local15) / 2
		local f16_local20 = f16_local6 - f16_local18
		local f16_local21 = f16_local7 - f16_local19
		f16_local14, f16_local15, f16_local16, f16_local17 = f16_arg0.gears[f16_local8]:getLocalRect()
		local f16_local22 = CoD.CreateState( f16_local14, f16_local15, f16_local16, f16_local17, CoD.AnchorTypes.None )
		f16_local22.scale = 0
		f16_arg0.gears[f16_local8]:registerAnimationState( "default", f16_local22 )
		f16_local22.zRot = f16_local13
		f16_arg0.gears[f16_local8]:registerAnimationState( "rotateInPlace", f16_local22 )
		f16_local22 = CoD.CreateState( f16_local14 + f16_local20 * 0.9, f16_local15 + f16_local21 * 0.9, f16_local16 + f16_local20 * 0.9, f16_local17 + f16_local21 * 0.9, CoD.AnchorTypes.None )
		f16_local22.scale = -0.5
		f16_local13 = f16_local13 + 10000 * f16_local0 * 0.9 / 1000 * f16_local12
		f16_local22.zRot = f16_local13
		f16_arg0.gears[f16_local8]:registerAnimationState( "moveTowardCurrency", f16_local22 )
		f16_local22 = CoD.CreateState( f16_local14 + f16_local20, f16_local15 + f16_local21, f16_local16 + f16_local20, f16_local17 + f16_local21, CoD.AnchorTypes.None )
		f16_local22.scale = -1
		f16_local22.zRot = f16_local13 + 10000 * f16_local0 * 0.1 / 1000 * f16_local12
		f16_arg0.gears[f16_local8]:registerAnimationState( "shrinkIntoCurrency", f16_local22 )
		f16_arg0.gears[f16_local8]:animateToState( "default", 0 )
		f16_arg0.gears[f16_local8]:setPriority( 1000 )
		local f16_local23 = f16_arg0.gears[f16_local8]
		local f16_local24 = f16_local23
		f16_local23 = f16_local23.animateInSequence
		local f16_local25 = {}
		local f16_local26 = {
			"rotateInPlace",
			f16_local11
		}
		local f16_local27 = {}
		local f16_local28 = "moveTowardCurrency"
		local f16_local29 = f16_local0 * 0.9
		local f16_local30, f16_local31, f16_local32 = nil
		local f16_local33 = LUI.Easing.InQuartic
		f16_local27[1] = f16_local28
		f16_local27[2] = f16_local29
		f16_local27[3] = f16_local30
		f16_local27[4] = f16_local31
		f16_local27[5] = f16_local32
		f16_local27[6] = f16_local33
		f16_local28 = {
			"shrinkIntoCurrency",
			f16_local0 * 0.1
		}
		f16_local25[1] = f16_local26
		f16_local25[2] = f16_local27
		f16_local25[3] = f16_local28
		f16_local23( f16_local24, f16_local25, nil, true, true )
	end
	f16_arg0.hotGlow:animateInSequence( {
		{
			"bright",
			0
		},
		{
			"default",
			f16_local1
		}
	}, nil, true, true )
	f16_arg0:registerEventHandler( "show_parts_currency", f0_local15 )
	f16_arg0:addElement( LUI.UITimer.new( f16_local0, "show_parts_currency", nil, true ) )
	f16_arg0:registerEventHandler( "remove_gears", f0_local16 )
	f16_arg0:addElement( LUI.UITimer.new( f16_local0 + f16_local1 * (#f16_arg0.gears - 1), "remove_gears", nil, true ) )
	f16_arg0.menu:addElement( LUI.UITimer.new( f16_local0, {
		name = "play_sound",
		sound = "h1_ui_grind_discard"
	}, nil, true ) )
end

local f0_local18 = function ( f17_arg0, f17_arg1 )
	f17_arg0.lootItem:animateToState( "hide" )
	local f17_local0 = LUI.MPDepotLootCard.GetLootImage( f17_arg0.data )
	local f17_local1, f17_local2, f17_local3, f17_local4 = f17_arg0.lootItem:getLocalRect()
	local f17_local5 = f17_local3 - f17_local1
	local f17_local6 = f17_local4 - f17_local2
	local self = LUI.UIElement.new( CoD.CreateState( f17_local1, f17_local2, f17_local3, f17_local4, CoD.AnchorTypes.Top ) )
	f17_arg0:addElement( self )
	local f17_local8 = CoD.CreateState( -f17_local5 / 2, 0, f17_local5 / 2, 0, CoD.AnchorTypes.TopBottomRight )
	f17_local8.material = f17_local0
	f17_local8.alpha = 1
	local self = LUI.UIImage.new( f17_local8 )
	f17_local8.rightAnchor = false
	f17_local8.leftAnchor = true
	local self = LUI.UIImage.new( f17_local8 )
	local self = LUI.UIElement.new( CoD.CreateState( f17_local1 - f17_local5 / 2, 0, f17_local3 - f17_local5 / 2, 0, CoD.AnchorTypes.TopBottom ) )
	self:setUseStencil( true )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( f17_local1 + f17_local5 / 2, 0, f17_local3 + f17_local5 / 2, 0, CoD.AnchorTypes.TopBottom ) )
	self:setUseStencil( true )
	self:addElement( self )
	self:addElement( self )
	f17_local8.right = -f17_local5 * 0.6
	f17_local8.left = -f17_local5 - f17_local8.right
	self:registerAnimationState( "moveIntoMask", f17_local8 )
	f17_local8.rightAnchor = true
	f17_local8.leftAnchor = false
	f17_local8.left = f17_local5 * 0.6
	f17_local8.right = f17_local5 + f17_local8.left
	self:registerAnimationState( "moveIntoMask", f17_local8 )
	self:animateInSequence( {
		{
			"default",
			0
		},
		{
			"moveIntoMask",
			f17_arg1.time
		}
	}, nil, true, true )
	self:animateInSequence( {
		{
			"default",
			0
		},
		{
			"moveIntoMask",
			f17_arg1.time
		}
	}, nil, true, true )
	local f17_local13 = 50
	local f17_local14 = 2
	local f17_local15 = 15
	local f17_local16 = 15
	local f17_local17 = 30
	local f17_local18 = 0
	self.randRotAnimTable = {
		{
			"default",
			0
		}
	}
	while f17_local18 < f17_arg1.time do
		local f17_local19 = f17_local13 * RandomFloatRange( 1, f17_local14 )
		f17_local18 = math.ceil( f17_local18 + f17_local19 )
		self:registerAnimationState( "" .. f17_local18, {
			xRot = RandomFloatRange( -f17_local15, f17_local15 ),
			yRot = RandomFloatRange( -f17_local16, f17_local16 ),
			zRot = RandomFloatRange( -f17_local17, f17_local17 )
		} )
		self.randRotAnimTable[#self.randRotAnimTable + 1] = {
			"" .. f17_local18,
			f17_local19
		}
	end
	self:animateInSequence( self.randRotAnimTable, nil, false, false, true )
end

local f0_local19 = function ( f18_arg0, f18_arg1 )
	f18_arg0.sparkParticleSystem = LUI.ParticleFx.CreateParticleSystem( f18_arg0, f18_arg1.xOffset, f18_arg1.yOffset, CoD.AnchorTypes.None, 15 )
	local f18_local0 = {
		minLifetime = 50,
		maxLifetime = 250,
		minStartDelay = 0,
		maxStartDelay = 100,
		repeatCount = -1,
		minRepeatDelay = 0,
		maxRepeatDelay = 33,
		translationRelativeToRotation = true
	}
	local f18_local1 = 5
	local f18_local2 = {}
	for f18_local3 = 1, f18_local1, 1 do
		f18_local2[f18_local3] = RegisterMaterial( "dismantle_spark_" .. f18_local3 )
	end
	local f18_local3, f18_local4 = GetMaterialDimensions( f18_local2[1] )
	local f18_local5 = 2
	local f18_local6 = 0.75
	local f18_local7 = 1.25
	local f18_local8 = f18_local3 * f18_arg1.widthScale * f18_local5
	local f18_local9 = f18_local4 * f18_arg1.heightScale * f18_local5
	local f18_local10 = 80
	local f18_local11 = 125
	local f18_local12 = 8
	for f18_local13 = 1, f18_local12, 1 do
		local f18_local16 = LUI.ParticleFx.AddParticle( f18_arg0.sparkParticleSystem, f18_local0 )
		LUI.ParticleFx.SetMaterials( f18_local16, {
			material = f18_local2[f18_local13 % f18_local1 + 1],
			width = f18_local8,
			height = f18_local9
		} )
		LUI.ParticleFx.AddColorState( f18_local16, {
			r = 1,
			g = 1,
			b = 1,
			timeWeight = 0
		} )
		LUI.ParticleFx.AddColorState( f18_local16, {
			r = 0,
			g = 0,
			b = 0,
			easing = LUI.Easing.InQuadratic
		} )
		LUI.ParticleFx.AddScaleState( f18_local16, {
			width = 0,
			height = 0,
			timeWeight = 0
		} )
		LUI.ParticleFx.AddScaleState( f18_local16, {
			minWidth = f18_local6,
			maxWidth = 1,
			minHeight = f18_local6,
			maxHeight = 1,
			timeWeight = 0.1,
			easing = LUI.Easing.OutQuintic
		} )
		LUI.ParticleFx.AddScaleState( f18_local16, {
			minWidth = 1,
			maxWidth = f18_local7,
			minHeight = 1,
			maxHeight = f18_local7,
			easing = LUI.Easing.OutCubic
		} )
		LUI.ParticleFx.AddRotationState( f18_local16, {
			minRotZ = f18_local10,
			maxRotZ = f18_local11,
			timeWeight = 0
		} )
		LUI.ParticleFx.AddTranslationState( f18_local16, {
			timeWeight = 0
		} )
		LUI.ParticleFx.AddTranslationState( f18_local16, {
			minY = -f18_local9 * 1.5,
			maxY = -f18_local9 * 1,
			easing = LUI.Easing.OutCubic
		} )
	end
	LUI.ParticleFx.InitializeParticleSystem( f18_arg0.sparkParticleSystem )
	LUI.ParticleFx.StartParticleSystem( f18_arg0.sparkParticleSystem )
	f18_arg0.sparkParticleSystem:addElement( LUI.UITimer.new( f18_arg1.time, "stop_particle_system", nil, true ) )
	f18_arg0.sparkParticleSystem:addElement( LUI.UITimer.new( f18_arg1.time + f18_local0.maxLifetime, "kill_particle_system", nil, true ) )
	if f18_arg0.index == 1 then
		f18_arg0.sparkSfxId = Engine.PlaySound( "h1_ui_grind_card_left" )
	elseif f18_arg0.index == 2 then
		f18_arg0.sparkSfxId = Engine.PlaySound( "h1_ui_grind_card_center" )
	elseif f18_arg0.index == 3 then
		f18_arg0.sparkSfxId = Engine.PlaySound( "h1_ui_grind_card_right" )
	end
end

local f0_local20 = function ( f19_arg0 )
	local f19_local0 = f0_local14( f19_arg0 )
	local f19_local1 = 15
	local f19_local2 = CoD.CreateState( 0, f0_local0 * 0.25, 0, f0_local0 * 0.25 + f19_local1, CoD.AnchorTypes.LeftRight )
	f19_local2.alpha = 0.5
	f19_local2.font = CoD.TextSettings.BodyFont.Font
	f19_arg0.duplicateText = LUI.UIText.new( f19_local2 )
	f19_local2.top = f0_local0 * 0.6
	f19_local2.bottom = f19_local2.top + f19_local1
	f19_local2.alpha = 1
	f19_arg0.duplicateText:registerAnimationState( "moveBelowCard", f19_local2 )
	f19_local2.top = f0_local0 * 0.25
	f19_local2.bottom = f19_local2.top + f19_local1
	f19_local2.alpha = 0
	f19_arg0.duplicateText:registerAnimationState( "bounceUpFromBottom", f19_local2 )
	f19_arg0.duplicateText:setText( Engine.Localize( "@DEPOT_DISMANTLING_DUPLICATE" ) )
	f19_arg0:addElement( f19_arg0.duplicateText )
	f19_arg0.duplicateText:animateInSequence( {
		{
			"moveBelowCard",
			500
		},
		{
			"moveBelowCard",
			1000
		},
		{
			"bounceUpFromBottom",
			500
		}
	}, nil, true, true, true )
	local f19_local3 = 2000
	local f19_local4 = 250
	local f19_local5 = 0.5
	local f19_local6 = 0
	local f19_local7 = -f0_local0 * 0.1
	local f19_local8 = 0.75
	local f19_local9, f19_local10, f19_local11, f19_local12 = f19_arg0.scale:getLocalRect()
	local f19_local13 = f19_local11 - f19_local9
	local f19_local14 = f19_local12 - f19_local10
	local f19_local15, f19_local16 = GetMaterialDimensions( RegisterMaterial( "depot_card_back" ) )
	local f19_local17 = f19_local13 / f19_local15
	local f19_local18 = f19_local14 / f19_local16
	f19_arg0:registerEventHandler( "play_dismantle_fx", f0_local18 )
	f19_arg0:addElement( LUI.UITimer.new( f19_local0 + f19_local4, {
		name = "play_dismantle_fx",
		time = f19_local3
	}, nil, true ) )
	local f19_local19 = RegisterMaterial( "depot_gear_hollow" )
	local f19_local20, f19_local21 = GetMaterialDimensions( f19_local19 )
	local f19_local22 = 0.7
	local f19_local23 = f19_local20 * f19_local17 * f19_local22
	local f19_local24 = f19_local21 * f19_local18 * f19_local22
	local f19_local25 = CoD.CreateState( f19_local6 - f19_local23 / 2 * f19_local8, f19_local7 - f19_local24 / 2 * f19_local8, f19_local6 + f19_local23 / 2 * f19_local8, f19_local7 + f19_local24 / 2 * f19_local8, CoD.AnchorTypes.None )
	f19_local25.material = f19_local19
	f19_local25.alpha = 0
	f19_local25.zRot = 0
	f19_arg0.bigGear = LUI.UIImage.new( f19_local25 )
	f19_local25 = CoD.CreateState( f19_local6 - f19_local23 / 2, f19_local7 - f19_local24 / 2, f19_local6 + f19_local23 / 2, f19_local7 + f19_local24 / 2, CoD.AnchorTypes.None )
	f19_local25.zRot = 360 * f19_local5 * f19_local4 / 1000
	f19_arg0.bigGear:registerAnimationState( "grow", f19_local25 )
	f19_arg0.bigGear:registerAnimationState( "show", {
		alpha = 1
	} )
	f19_arg0.bigGear.finalZRot = f19_local25.zRot + 360 * f19_local5 * f19_local3 / 1000
	f19_arg0.bigGear:registerAnimationState( "rotate", {
		zRot = f19_arg0.bigGear.finalZRot
	} )
	f19_arg0.bigGear:setPriority( 10 )
	f19_arg0:addElement( f19_arg0.bigGear )
	f19_arg0.bigGear:animateInSequence( {
		{
			"default",
			f19_local0
		},
		{
			"show",
			0
		},
		{
			"grow",
			f19_local4
		},
		{
			"rotate",
			f19_local3
		}
	}, nil, true, true )
	local f19_local26 = RegisterMaterial( "depot_gear_nut" )
	local f19_local27, f19_local28 = GetMaterialDimensions( f19_local26 )
	local f19_local29 = f19_local27 * f19_local17 * f19_local22
	local f19_local30 = f19_local28 * f19_local18 * f19_local22
	f19_local25 = CoD.CreateState( f19_local6 - f19_local29 / 2 * f19_local8, f19_local7 - f19_local30 / 2 * f19_local8, f19_local6 + f19_local29 / 2 * f19_local8, f19_local7 + f19_local30 / 2 * f19_local8, CoD.AnchorTypes.None )
	f19_local25.material = f19_local26
	f19_local25.alpha = 0
	f19_local25.zRot = 0
	f19_arg0.nut = LUI.UIImage.new( f19_local25 )
	f19_local25 = CoD.CreateState( f19_local6 - f19_local29 / 2, f19_local7 - f19_local30 / 2, f19_local6 + f19_local29 / 2, f19_local7 + f19_local30 / 2, CoD.AnchorTypes.None )
	f19_local25.zRot = -90
	f19_arg0.nut.finalZRot = 0
	f19_arg0.nut:registerAnimationState( "grow", f19_local25 )
	f19_arg0.nut:registerAnimationState( "show", {
		alpha = 1
	} )
	f19_arg0.nut:registerAnimationState( "no_rot", {
		zRot = 0
	} )
	f19_arg0.nut:registerAnimationState( "rotate", {
		zRot = -90
	} )
	f19_arg0.nut:setPriority( 10 )
	f19_arg0:addElement( f19_arg0.nut )
	f19_arg0.nut:animateInSequence( {
		{
			"default",
			f19_local0
		},
		{
			"show",
			0
		},
		{
			"grow",
			f19_local4
		},
		{
			"no_rot",
			f19_local3 / 5
		},
		{
			"no_rot",
			f19_local3 / 5
		},
		{
			"rotate",
			f19_local3 / 5
		},
		{
			"rotate",
			f19_local3 / 5
		},
		{
			"no_rot",
			f19_local3 / 5
		}
	}, nil, true, true )
	local f19_local31 = f19_local22 * 0.8
	local f19_local32 = f19_local20 * f19_local17 * f19_local31
	local f19_local33 = f19_local21 * f19_local18 * f19_local31
	local f19_local34 = -f19_local32 * 0.33
	local f19_local35 = -f19_local33 * 0.67
	f19_local25 = CoD.CreateState( f19_local6 + f19_local34 * f19_local8 - f19_local32 / 2 * f19_local8, f19_local7 + f19_local35 * f19_local8 - f19_local33 / 2 * f19_local8, f19_local6 + f19_local34 * f19_local8 + f19_local32 / 2 * f19_local8, f19_local7 + f19_local35 * f19_local8 + f19_local33 / 2 * f19_local8, CoD.AnchorTypes.None )
	f19_local25.material = f19_local19
	f19_local25.alpha = 0
	f19_local25.zRot = 0
	f19_arg0.smallGear = LUI.UIImage.new( f19_local25 )
	f19_local25 = CoD.CreateState( f19_local6 + f19_local34 - f19_local32 / 2, f19_local7 + f19_local35 - f19_local33 / 2, f19_local6 + f19_local34 + f19_local32 / 2, f19_local7 + f19_local35 + f19_local33 / 2, CoD.AnchorTypes.None )
	f19_local25.zRot = -360 * f19_local5 * f19_local4 / 1000
	f19_arg0.smallGear:registerAnimationState( "grow", f19_local25 )
	f19_arg0.smallGear:registerAnimationState( "show", {
		alpha = 1
	} )
	f19_arg0.smallGear.finalZRot = f19_local25.zRot - 360 * f19_local5 * f19_local3 / 1000
	f19_arg0.smallGear:registerAnimationState( "rotate", {
		zRot = f19_arg0.smallGear.finalZRot
	} )
	f19_arg0.smallGear:setPriority( 10 )
	f19_arg0:addElement( f19_arg0.smallGear )
	f19_arg0.smallGear:animateInSequence( {
		{
			"default",
			f19_local0
		},
		{
			"show",
			0
		},
		{
			"grow",
			f19_local4
		},
		{
			"rotate",
			f19_local3
		}
	}, nil, true, true )
	local f19_local36 = f19_local31 * 0.8
	local f19_local37 = f19_local20 * f19_local17 * f19_local36
	local f19_local38 = f19_local21 * f19_local18 * f19_local36
	local f19_local39 = f19_local37 * 0.33
	local f19_local40 = -f19_local38 * 0.67
	f19_local25 = CoD.CreateState( f19_local6 + f19_local39 * f19_local8 - f19_local37 / 2 * f19_local8, f19_local7 + f19_local40 * f19_local8 - f19_local38 / 2 * f19_local8, f19_local6 + f19_local39 * f19_local8 + f19_local37 / 2 * f19_local8, f19_local7 + f19_local40 * f19_local8 + f19_local38 / 2 * f19_local8, CoD.AnchorTypes.None )
	f19_local25.material = f19_local19
	f19_local25.alpha = 0
	f19_local25.zRot = 10
	f19_arg0.smallestGear = LUI.UIImage.new( f19_local25 )
	f19_local25 = CoD.CreateState( f19_local6 + f19_local39 - f19_local37 / 2, f19_local7 + f19_local40 - f19_local38 / 2, f19_local6 + f19_local39 + f19_local37 / 2, f19_local7 + f19_local40 + f19_local38 / 2, CoD.AnchorTypes.None )
	f19_local25.zRot = 360 * f19_local5 * f19_local4 / 1000 + 10
	f19_arg0.smallestGear:registerAnimationState( "grow", f19_local25 )
	f19_arg0.smallestGear:registerAnimationState( "show", {
		alpha = 1
	} )
	f19_arg0.smallestGear.finalZRot = f19_local25.zRot + 360 * f19_local5 * f19_local3 / 1000
	f19_arg0.smallestGear:registerAnimationState( "rotate", {
		zRot = f19_arg0.smallestGear.finalZRot
	} )
	f19_arg0.smallestGear:setPriority( 10 )
	f19_arg0:addElement( f19_arg0.smallestGear )
	f19_arg0.smallestGear:animateInSequence( {
		{
			"default",
			f19_local0
		},
		{
			"show",
			0
		},
		{
			"grow",
			f19_local4
		},
		{
			"rotate",
			f19_local3
		}
	}, nil, true, true )
	local f19_local41 = RegisterMaterial( "depot_glow_hot" )
	local f19_local42, f19_local43 = GetMaterialDimensions( f19_local41 )
	local f19_local44 = f19_local22 * 0.8
	local f19_local45 = f19_local42 * f19_local17 * f19_local44
	local f19_local46 = f19_local43 * f19_local18 * f19_local44
	local f19_local47 = f19_local34 / 2
	local f19_local48 = f19_local35 / 2
	f19_local25 = CoD.CreateState( f19_local6 + f19_local47 * f19_local8 - f19_local45 / 2 * f19_local8, f19_local7 + f19_local48 * f19_local8 - f19_local46 / 2 * f19_local8, f19_local6 + f19_local47 * f19_local8 + f19_local45 / 2 * f19_local8, f19_local7 + f19_local48 * f19_local8 + f19_local46 / 2 * f19_local8, CoD.AnchorTypes.None )
	f19_local25.material = f19_local41
	f19_local25.color = {
		r = 0,
		g = 0,
		b = 0
	}
	f19_arg0.hotGlow = LUI.UIImage.new( f19_local25 )
	f19_local25 = CoD.CreateState( f19_local6 + f19_local47 - f19_local45 / 2, f19_local7 + f19_local48 - f19_local46 / 2, f19_local6 + f19_local47 + f19_local45 / 2, f19_local7 + f19_local48 + f19_local46 / 2, CoD.AnchorTypes.None )
	f19_local25.color = {
		r = 1,
		g = 1,
		b = 1
	}
	f19_arg0.hotGlow:registerAnimationState( "grow", f19_local25 )
	f19_arg0.hotGlow:registerAnimationState( "dim", {
		color = {
			r = 0.75,
			g = 0.75,
			b = 0.75
		}
	} )
	f19_arg0.hotGlow:registerAnimationState( "bright", {
		color = {
			r = 1,
			g = 1,
			b = 1
		}
	} )
	f19_arg0.hotGlow:setPriority( 10 )
	f19_arg0:addElement( f19_arg0.hotGlow )
	f19_arg0.hotGlow:animateInSequence( {
		{
			"default",
			f19_local0
		},
		{
			"dim",
			0
		},
		{
			"grow",
			f19_local4
		},
		{
			"bright",
			f19_local3 / 10
		},
		{
			"dim",
			f19_local3 / 5
		},
		{
			"bright",
			f19_local3 / 10
		},
		{
			"dim",
			f19_local3 / 5
		},
		{
			"bright",
			f19_local3 / 10
		},
		{
			"dim",
			f19_local3 / 5
		},
		{
			"bright",
			f19_local3 / 10
		}
	}, nil, true, true )
	f19_arg0:registerEventHandler( "play_gear_spark_fx", f0_local19 )
	f19_arg0:addElement( LUI.UITimer.new( f19_local0 + f19_local4, {
		name = "play_gear_spark_fx",
		time = f19_local3,
		xOffset = f19_local6,
		yOffset = f19_local7 + f19_local48,
		widthScale = f19_local17 * f19_local22,
		heightScale = f19_local18 * f19_local22
	}, nil, true ) )
	f19_arg0:registerEventHandler( "move_gears_to_currency", f0_local17 )
	f19_arg0:addElement( LUI.UITimer.new( f19_local0 + f19_local3 + f19_local4, "move_gears_to_currency", nil, true ) )
end

local f0_local21 = function ( f20_arg0, f20_arg1 )
	local f20_local0 = 250
	for f20_local1 = 1, #f20_arg0.cards, 1 do
		f20_arg0.cards[f20_local1].translation:animateInSequence( {
			{
				"offscreen",
				0
			},
			{
				"offscreen",
				f20_local1 * f20_local0
			},
			{
				"default",
				f20_arg1 * 0.4
			}
		}, nil, true, true )
		f20_arg0.cards[f20_local1].rotation:animateInSequence( {
			{
				"offscreen",
				0
			},
			{
				"offscreen",
				f20_local1 * f20_local0
			},
			{
				"default",
				f20_arg1 * 0.4
			}
		}, nil, true, true )
		f20_arg0.cards[f20_local1].scale:animateInSequence( {
			{
				"smallest",
				0
			},
			{
				"smallest",
				f20_local1 * f20_local0
			},
			{
				"bigger",
				f20_arg1 * 0.2
			},
			{
				"default",
				f20_arg1 * 0.1
			},
			{
				"smaller",
				f20_arg1 * 0.3
			},
			{
				"small",
				f20_arg1 * 0.15
			}
		}, nil, true, true )
		f20_arg0.cards[f20_local1].verticalGlow:animateInSequence( {
			{
				"default",
				0
			},
			{
				"default",
				f20_local1 * f20_local0 + f20_arg1 * 0.35
			},
			{
				"glow_strong",
				f20_arg1 * 0.1
			}
		}, nil, true, true )
		f20_arg0.cards[f20_local1]:registerEventHandler( "play_card_back_fx", f0_local11 )
		f20_arg0.cards[f20_local1]:addElement( LUI.UITimer.new( f20_local1 * f20_local0 + f20_arg1, "play_card_back_fx", nil, true ) )
		f20_arg0:addElement( LUI.UITimer.new( f20_local1 * f20_local0 + f20_arg1 * 0.4, {
			name = "play_sound",
			sound = "h1_ui_card_land_0" .. f20_local1
		}, nil, true ) )
	end
	f20_arg0.background:animateInSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f20_arg1 * 0.7
		},
		{
			"show",
			f20_arg1 * 0.3
		}
	}, nil, true, true )
	f20_arg0:addElement( LUI.UITimer.new( f20_arg1, {
		name = "play_sound",
		sound = "h1_ui_loot_card_stop"
	}, nil, true ) )
end

local f0_local22 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = 500
	local f21_local1 = LUI.MPDepotLootCard.GetLootRarity( f21_arg0.data )
	local f21_local2 = 1
	if f21_arg0.lootItem.timer then
		f21_arg0:removeElement( f21_arg0.lootItem.timer )
		f21_arg0.lootItem.timer = nil
	end
	if not f21_arg1.skipping or not f21_arg0.duplicateCurrency then
		if f21_local1 == Cac.InventoryItemRarity.Legendary then
			f21_local2 = 2
		elseif f21_local1 == Cac.InventoryItemRarity.Epic then
			f21_local2 = 3
		end
		local f21_local3 = f21_arg0.lootItem
		local f21_local4 = f21_local3
		f21_local3 = f21_local3.animateInSequence
		local f21_local5 = {}
		local f21_local6 = {
			"shrunk",
			0
		}
		local f21_local7 = {}
		local f21_local8 = "default"
		local f21_local9 = f21_local0 * f21_local2
		local f21_local10, f21_local11, f21_local12 = nil
		local f21_local13 = LUI.MPDepotLootCard.rarityRevealEasings[f21_local1]
		f21_local7[1] = f21_local8
		f21_local7[2] = f21_local9
		f21_local7[3] = f21_local10
		f21_local7[4] = f21_local11
		f21_local7[5] = f21_local12
		f21_local7[6] = f21_local13
		f21_local5[1] = f21_local6
		f21_local5[2] = f21_local7
		f21_local3( f21_local4, f21_local5, nil, true, true )
		f21_local3 = f21_arg0.scale
		f21_local4 = f21_local3
		f21_local3 = f21_local3.animateInSequence
		f21_local5 = {}
		f21_local6 = {
			"default",
			0
		}
		f21_local7 = {}
		f21_local8 = "shrink"
		f21_local9 = 100
		f21_local10, f21_local11, f21_local12 = nil
		f21_local13 = LUI.Easing.OutQuartic
		f21_local7[1] = f21_local8
		f21_local7[2] = f21_local9
		f21_local7[3] = f21_local10
		f21_local7[4] = f21_local11
		f21_local7[5] = f21_local12
		f21_local7[6] = f21_local13
		f21_local8 = {}
		f21_local9 = "pop_up"
		f21_local10 = 100
		f21_local11, f21_local12, f21_local13 = nil
		local f21_local14 = LUI.Easing.OutQuartic
		f21_local8[1] = f21_local9
		f21_local8[2] = f21_local10
		f21_local8[3] = f21_local11
		f21_local8[4] = f21_local12
		f21_local8[5] = f21_local13
		f21_local8[6] = f21_local14
		f21_local9 = {}
		f21_local10 = "default"
		f21_local11 = f21_local0
		f21_local12, f21_local13, f21_local14 = nil
		local f21_local15 = LUI.MPDepotLootCard.rarityRevealEasings[f21_local1]
		f21_local9[1] = f21_local10
		f21_local9[2] = f21_local11
		f21_local9[3] = f21_local12
		f21_local9[4] = f21_local13
		f21_local9[5] = f21_local14
		f21_local9[6] = f21_local15
		f21_local5[1] = f21_local6
		f21_local5[2] = f21_local7
		f21_local5[3] = f21_local8
		f21_local5[4] = f21_local9
		f21_local3( f21_local4, f21_local5, nil, true, true )
	end
	f21_arg0.lootItemBG:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			f21_local0
		}
	}, nil, true, true )
	f21_arg0.lootName:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			f21_local0
		}
	}, nil, true, true )
	f21_arg0.lootCategory:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			f21_local0
		}
	}, nil, true, true )
	f21_arg0.lootRarity:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			f21_local0
		}
	}, nil, true, true )
	f21_arg0.lootCollection:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			f21_local0
		}
	}, nil, true, true )
	local f21_local3 = f21_arg0.verticalGlow
	local f21_local4 = f21_local3
	f21_local3 = f21_local3.animateInLoop
	local f21_local5 = {}
	local f21_local6 = {}
	local f21_local7 = "glow_strong"
	local f21_local8 = 500
	local f21_local9, f21_local10, f21_local11 = nil
	local f21_local12 = LUI.Easing.InOutSine
	f21_local6[1] = f21_local7
	f21_local6[2] = f21_local8
	f21_local6[3] = f21_local9
	f21_local6[4] = f21_local10
	f21_local6[5] = f21_local11
	f21_local6[6] = f21_local12
	f21_local7 = {}
	f21_local8 = "glow_soft"
	f21_local9 = 1500
	f21_local10, f21_local11, f21_local12 = nil
	local f21_local13 = LUI.Easing.InOutSine
	f21_local7[1] = f21_local8
	f21_local7[2] = f21_local9
	f21_local7[3] = f21_local10
	f21_local7[4] = f21_local11
	f21_local7[5] = f21_local12
	f21_local7[6] = f21_local13
	f21_local5[1] = f21_local6
	f21_local5[2] = f21_local7
	f21_local3( f21_local4, f21_local5, nil, nil, true, true )
	if f21_arg0.cardBorder then
		f21_local3 = f21_arg0.cardBorder
		f21_local4 = f21_local3
		f21_local3 = f21_local3.animateInLoop
		f21_local5 = {}
		f21_local6 = {}
		f21_local7 = "show"
		f21_local8 = 500
		f21_local9, f21_local10, f21_local11 = nil
		f21_local12 = LUI.Easing.InOutSine
		f21_local6[1] = f21_local7
		f21_local6[2] = f21_local8
		f21_local6[3] = f21_local9
		f21_local6[4] = f21_local10
		f21_local6[5] = f21_local11
		f21_local6[6] = f21_local12
		f21_local7 = {}
		f21_local8 = "dim"
		f21_local9 = 1500
		f21_local10, f21_local11, f21_local12 = nil
		f21_local13 = LUI.Easing.InOutSine
		f21_local7[1] = f21_local8
		f21_local7[2] = f21_local9
		f21_local7[3] = f21_local10
		f21_local7[4] = f21_local11
		f21_local7[5] = f21_local12
		f21_local7[6] = f21_local13
		f21_local5[1] = f21_local6
		f21_local5[2] = f21_local7
		f21_local3( f21_local4, f21_local5, nil, nil, true, true )
	end
	if f21_arg0.cardFlare then
		f21_local3 = 250
		f21_local4 = 500
		f21_arg0.cardFlare:registerEventHandler( "show_flare_image", function ( element, event )
			element:animateInSequence( {
				{
					"collapse",
					0
				},
				{
					"default",
					f21_local4
				}
			}, nil, true, true )
		end )
		f21_arg0.cardFlare:addElement( LUI.UITimer.new( f21_local3, "show_flare_image", nil, true ) )
		f21_arg0.cardFlare:registerEventHandler( "pulse_flare_image", function ( element, event )
			local f23_local0 = element
			local f23_local1 = element.animateInLoop
			local f23_local2 = {}
			local f23_local3 = {}
			local f23_local4 = "glow_strong"
			local f23_local5 = 500
			local f23_local6, f23_local7, f23_local8 = nil
			local f23_local9 = LUI.Easing.InOutSine
			f23_local3[1] = f23_local4
			f23_local3[2] = f23_local5
			f23_local3[3] = f23_local6
			f23_local3[4] = f23_local7
			f23_local3[5] = f23_local8
			f23_local3[6] = f23_local9
			f23_local4 = {}
			f23_local5 = "glow_soft"
			f23_local6 = 1500
			f23_local7, f23_local8, f23_local9 = nil
			local f23_local10 = LUI.Easing.InOutSine
			f23_local4[1] = f23_local5
			f23_local4[2] = f23_local6
			f23_local4[3] = f23_local7
			f23_local4[4] = f23_local8
			f23_local4[5] = f23_local9
			f23_local4[6] = f23_local10
			f23_local2[1] = f23_local3
			f23_local2[2] = f23_local4
			f23_local1( f23_local0, f23_local2, nil, nil, true, true )
		end )
		f21_arg0.cardFlare:addElement( LUI.UITimer.new( 2000, "pulse_flare_image", nil, true ) )
	end
	if LUI.MPDepotLootCard.rarityMaterials[f21_local1].frontstroke then
		f21_local3, f21_local4, f21_local5, f21_local6 = f21_arg0.scale:getLocalRect()
		f21_local7 = f21_local5 - f21_local3
		f21_local8 = f21_local6 - f21_local4
		f21_local9 = f0_local3 * 4
		f21_arg0.frontStrokeStencil = LUI.MenuBuilder.BuildAddChild( f21_arg0, {
			type = "UIElement",
			id = "loot_card_frontStrokeStencil",
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = 0,
					top = f21_local8 / 2 - f21_local9,
					right = 0,
					bottom = f21_local8 / 2
				},
				fullWidthBottom = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = -f21_local7 / 2,
					top = f21_local8 / 2 - f21_local9,
					right = f21_local7 / 2,
					bottom = f21_local8 / 2
				},
				fullWidthtop = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = -f21_local7 / 2,
					top = -f21_local8 / 2,
					right = f21_local7 / 2,
					bottom = -f21_local8 / 2 + f21_local9
				},
				zeroWidthtop = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = 0,
					top = -f21_local8 / 2,
					right = 0,
					bottom = -f21_local8 / 2 + f21_local9
				}
			}
		} )
		f21_arg0.frontStrokeStencil:setUseStencil( true )
		f21_arg0.frontStroke = LUI.MenuBuilder.BuildAddChild( f21_arg0.frontStrokeStencil, {
			type = "UIImage",
			id = "loot_card_frontStroke",
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = true,
					left = -f21_local7 / 2,
					top = -f21_local8,
					right = f21_local7 / 2,
					bottom = 0,
					material = LUI.MPDepotLootCard.rarityMaterials[f21_local1].frontstroke.mat,
					alpha = 1
				},
				moveWithStencil = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = true,
					left = -f21_local7 / 2,
					top = -f21_local9,
					right = f21_local7 / 2,
					bottom = f21_local8 - f21_local9
				}
			}
		} )
		f21_arg0.frontStrokeStencil:animateInSequence( {
			{
				"default",
				0
			},
			{
				"fullWidthBottom",
				300
			},
			{
				"fullWidthtop",
				500
			},
			{
				"zeroWidthtop",
				300
			}
		}, nil, true, true )
		f21_arg0.frontStroke:animateInSequence( {
			{
				"default",
				0
			},
			{
				"default",
				300
			},
			{
				"moveWithStencil",
				500
			}
		}, nil, true, true )
	end
	f21_arg0.lootName:setUsePulseFX( true, false )
	f21_arg0.lootCategory:setUsePulseFX( true, false )
	f21_arg0.lootRarity:setUsePulseFX( true, false )
	f21_arg0.lootCollection:setUsePulseFX( true, false )
	if f21_arg0.rarityVO and not f21_arg0.menu.onBoarding then
		f21_arg0.menu.rarityVO = Engine.PlaySound( f21_arg0.rarityVO )
	end
	Engine.PlaySound( LUI.MPDepotLootCard.raritySFX[f21_local1].reveal )
	if f21_arg0.glitch then
		f21_arg0:removeElement( f21_arg0.glitch )
		f21_arg0.glitch = nil
	end
	f21_arg0:registerEventHandler( "card_reveal_finished", f0_local9 )
	f21_arg0:addElement( LUI.UITimer.new( f21_local0, "card_reveal_finished", nil, true ) )
	f21_arg0:registerEventHandler( "card_animation_finished", f0_local10 )
	if f21_arg0.duplicateCurrency then
		f21_arg0:registerEventHandler( "play_duplicate_fx", f0_local20 )
		f21_arg0:addElement( LUI.UITimer.new( f21_local0 * f21_local2 + f21_local0 * 2, "play_duplicate_fx", nil, true ) )
	else
		f21_arg0:addElement( LUI.UITimer.new( f21_local0 * f21_local2, "card_animation_finished", nil, true ) )
	end
end

local f0_local23 = function ( f24_arg0 )
	CoD.SetMaterial( f24_arg0, RegisterMaterial( "card_glitch_frame_0" .. math.random( 0, 9 ) ), 0.1 )
end

local f0_local24 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = 2000 + (f25_arg0.cardIndex - 1) * 500
	f25_arg0.glitch:registerEventHandler( "update_glitch_image", f0_local23 )
	f25_arg0.glitch:addElement( LUI.UITimer.new( 50, "update_glitch_image", nil, nil, nil, nil, nil, true ) )
	local f25_local1, f25_local2, f25_local3, f25_local4 = f25_arg0.lootItemBG:getLocalRect()
	local f25_local5 = f25_local3 - f25_local1
	f25_arg0.lootImagesParticleSystem = LUI.ParticleFx.CreateParticleSystem( f25_arg0, f25_local1 + f25_local5 / 2, f25_local2 + (f25_local4 - f25_local2) / 2, CoD.AnchorTypes.Top )
	local f25_local6 = {
		minLifetime = 250,
		maxLifetime = 400,
		minStartDelay = 0,
		maxStartDelay = 0,
		repeatCount = -1,
		minRepeatDelay = 50,
		maxRepeatDelay = 100
	}
	local f25_local7 = 0.5
	local f25_local8 = 0.75
	local f25_local9 = -f25_local5 / 2 * f25_local7
	local f25_local10 = f25_local5 / 2 * f25_local7
	local f25_local11 = -f25_local5 / 2 * f25_local7
	local f25_local12 = f25_local5 / 2 * f25_local7
	local f25_local13 = LUI.ParticleFx.AddParticle( f25_arg0.lootImagesParticleSystem, f25_local6 )
	LUI.ParticleFx.SetMaterials( f25_local13, {
		materials = f25_arg1,
		width = f25_local5,
		minCycleInterval = f25_local6.minLifetime * 0.5,
		maxCycleInterval = f25_local6.maxLifetime * 0.5,
		cycleType = LUI.ParticleFx.MaterialCycleType.Random
	} )
	LUI.ParticleFx.AddTranslationState( f25_local13, {
		minX = f25_local9,
		maxX = f25_local10,
		minY = f25_local11,
		maxY = f25_local12,
		minTimeWeight = 0.5,
		maxTimeWeight = 1.5,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddTranslationState( f25_local13, {
		minX = f25_local9,
		maxX = f25_local10,
		minY = f25_local11,
		maxY = f25_local12,
		minTimeWeight = 0.5,
		maxTimeWeight = 1.5,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddScaleState( f25_local13, {
		minWidth = f25_local7,
		maxWidth = f25_local8,
		minHeight = f25_local7,
		maxHeight = f25_local8,
		minTimeWeight = 0.5,
		maxTimeWeight = 1,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddScaleState( f25_local13, {
		minWidth = f25_local7,
		maxWidth = f25_local8,
		minHeight = f25_local7,
		maxHeight = f25_local8,
		minTimeWeight = 0.5,
		maxTimeWeight = 1,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddScaleState( f25_local13, {
		minWidth = f25_local7,
		maxWidth = f25_local8,
		minHeight = f25_local7,
		maxHeight = f25_local8,
		minTimeWeight = 0.5,
		maxTimeWeight = 1,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddScaleState( f25_local13, {
		minWidth = f25_local7,
		maxWidth = f25_local8,
		minHeight = f25_local7,
		maxHeight = f25_local8,
		minTimeWeight = 0.5,
		maxTimeWeight = 1,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddAlphaState( f25_local13, {
		alpha = 1,
		minTimeWeight = 5,
		maxTimeWeight = 10,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddAlphaState( f25_local13, {
		alpha = 0,
		minTimeWeight = 0.5,
		maxTimeWeight = 1,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddAlphaState( f25_local13, {
		alpha = 1,
		minTimeWeight = 5,
		maxTimeWeight = 10,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.AddAlphaState( f25_local13, {
		alpha = 0,
		minTimeWeight = 0.5,
		maxTimeWeight = 1,
		easing = LUI.Easing.Snap
	} )
	LUI.ParticleFx.InitializeParticleSystem( f25_arg0.lootImagesParticleSystem )
	LUI.ParticleFx.StartParticleSystem( f25_arg0.lootImagesParticleSystem )
	f25_arg0.lootImagesParticleSystem:addElement( LUI.UITimer.new( f25_local0, "kill_particle_system", nil, true ) )
	f25_arg0:registerEventHandler( "reveal_burst", f0_local6 )
	f25_arg0:addElement( LUI.UITimer.new( f25_local0 - 50, "reveal_burst", nil, true ) )
	f25_arg0:registerEventHandler( "show_loot", f0_local22 )
	f25_arg0:addElement( LUI.UITimer.new( f25_local0, "show_loot", nil, true ) )
end

local f0_local25 = function ( f26_arg0 )
	local f26_local0 = 500
	local f26_local1 = {}
	local f26_local2 = #f26_arg0.lootDropItemList
	local f26_local3 = StreamingCount
	if f26_local3 < f26_local2 then
		f26_local2 = f26_local3
	end
	for f26_local4 = 1, f26_local2, 1 do
		local f26_local7 = LUI.MPDepotLootCard.GetLootImage( f26_arg0.lootDropItemList[math.random( 1, #f26_arg0.lootDropItemList )] )
		f26_local1[f26_local4] = f26_local7
		Engine.CacheMaterial( f26_local7 )
	end
	for f26_local4 = 1, #f26_arg0.cards, 1 do
		f26_arg0.cards[f26_local4].rotation:animateInSequence( {
			{
				"default",
				(f26_local4 - 1) * f26_local0 * 0.5
			},
			{
				"flip90",
				f26_local0 * 0.4
			},
			{
				"default",
				f26_local0 * 0.4
			}
		}, nil, true, true )
		f26_arg0.cards[f26_local4].scale:animateInSequence( {
			{
				"smaller",
				(f26_local4 - 1) * f26_local0 * 0.5 + f26_local0 * 0.4
			},
			{
				"bigger",
				f26_local0 * 0.3
			},
			{
				"default",
				f26_local0 * 0.1
			}
		}, nil, true, true )
		f26_arg0.cards[f26_local4]:animateInSequence( {
			{
				"default",
				(f26_local4 - 1) * f26_local0 * 0.5 + f26_local0 * 0.4
			},
			{
				"showFront",
				0
			}
		}, nil, true, true )
		f26_arg0.cards[f26_local4].cardIndex = f26_local4
		f26_arg0.cards[f26_local4]:registerEventHandler( "cycle_loot_images", function ( element, event )
			f0_local24( element, f26_local1 )
		end )
		f26_arg0.cards[f26_local4]:addElement( LUI.UITimer.new( f26_local0 * 0.4 + (f26_local4 - 1) * f26_local0 * 0.5, "cycle_loot_images", nil, true ) )
		local f26_local8 = LUI.MPDepotLootCard.GetLootRarity( f26_arg0.cards[f26_local4].data )
		f26_arg0:addElement( LUI.UITimer.new( (f26_local4 - 1) * f26_local0 * 0.5, {
			name = "play_sound",
			sound = LUI.MPDepotLootCard.raritySFX[LUI.MPDepotLootCard.GetLootRarity( f26_arg0.cards[f26_local4].data )].flip[f26_local4]
		}, nil, true ) )
	end
	f26_arg0.dot_pattern:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			f26_local0
		}
	}, nil, true, true )
	LUI.MPDepotBase.PlaySound( f26_arg0, {
		sound = "h1_ui_loot_card_reveal"
	} )
end

local f0_local26 = function ( f28_arg0, f28_arg1 )
	local f28_local0 = 500
	f0_local7( f28_arg0 )
	f0_local21( f28_arg0, f28_local0 )
	if not Engine.GetDvarBool( "vlDepotEnabled" ) then
		f28_arg0:addElement( LUI.UITimer.new( f28_local0, "supply_drop_allow_skip", nil, true ) )
	end
end

local f0_local27 = function ( f29_arg0, f29_arg1 )
	if f29_arg1.button and f29_arg1.button == "alt2" then
		
	else
		
	end
	if f29_arg0.allowSkip and (not (not f29_arg1.button or f29_arg1.button ~= "primary" and f29_arg1.button ~= "secondary") or f29_arg1.name == "mousedown") then
		if f29_arg0.numCardsNotFinishedRevealing > 0 then
			for f29_local0 = 1, #f29_arg0.cards, 1 do
				f29_arg0:removeElement( f29_arg0.cards[f29_local0].translation )
			end
			f29_arg0.cards = {}
			f0_local7( f29_arg0, true )
			for f29_local0 = 1, #f29_arg0.cards, 1 do
				f0_local22( f29_arg0.cards[f29_local0], {
					skipping = true
				} )
			end
			if f29_arg0.purchaseSound then
				Engine.StopSound( f29_arg0.purchaseSound )
				f29_arg0.purchaseSound = nil
			end
			Engine.Loot_MarkSupplyDropOpened( f29_arg0.exclusiveController, f29_arg0.supplyDropType )
		end
		f29_arg0.allowSkip = false
		f29_arg0.dot_pattern:animateToState( "show", 0, false, false, false )
		f29_arg0.background:animateInSequence( {
			{
				"show",
				0
			},
			{
				"show",
				1
			}
		} )
		f29_arg0:processEvent( {
			name = "initCardNavigation"
		} )
		f29_arg0:processEvent( {
			name = "show"
		} )
	end
end

local f0_local28 = function ( f30_arg0, f30_arg1 )
	f30_arg0.allowSkip = true
end

local f0_local29 = function ( f31_arg0, f31_arg1 )
	f31_arg0:processEvent( {
		name = "supply_drop",
		success = false,
		dispatchChildren = false
	} )
end

local f0_local30 = function ( f32_arg0, f32_arg1 )
	if f32_arg0.textState == 1 then
		f32_arg0:setText( Engine.Localize( "@DEPOT_TRANSFER_IN_PROGRESS_DOT_DOT" ) )
		f32_arg0.textState = 2
	elseif f32_arg0.textState == 2 then
		f32_arg0:setText( Engine.Localize( "@DEPOT_TRANSFER_IN_PROGRESS_DOT_DOT_DOT" ) )
		f32_arg0.textState = 3
	elseif f32_arg0.textState == 3 then
		f32_arg0:setText( Engine.Localize( "@DEPOT_TRANSFER_IN_PROGRESS_DOT" ) )
		f32_arg0.textState = 1
	end
end

local f0_local31 = 5000
local f0_local32 = function ( f33_arg0, f33_arg1 )
	local f33_local0 = Engine.GetDvarFloat( "loot_taskSupplyDropTimeout" ) * 1000 - f0_local31
	if f33_arg0.slowPurchaseTimer then
		f33_arg0.slowPurchaseTimer:close()
		f33_arg0.slowPurchaseTimer = nil
	end
	local f33_local1 = CoD.CreateState( -500, 0, 500, 20, CoD.AnchorTypes.Top )
	f33_local1.font = CoD.TextSettings.BodyFont.Font
	f33_local1.verticalAlignment = LUI.VerticalAlignment.Top
	f33_local1.horizontalAlignment = LUI.HorizontalAlignment.Center
	f33_local1.color = Colors.mw1_green
	f33_local1.alpha = 1
	f33_arg0.slowPurchaseText = LUI.UIText.new( f33_local1 )
	f33_arg0:addElement( f33_arg0.slowPurchaseText )
	f33_arg0.slowPurchaseText:setText( Engine.Localize( "@DEPOT_TRANSFER_IN_PROGRESS_DOT" ) )
	f33_arg0.slowPurchaseText.textState = 1
	f33_arg0.slowPurchaseText:registerEventHandler( "update_slow_purchase_text", f0_local30 )
	f33_arg0.slowPurchaseText:addElement( LUI.UITimer.new( 1000, "update_slow_purchase_text" ) )
	local f33_local2 = LUI.MenuBuilder.BuildRegisteredType( "progressBar" )
	f33_local2:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		height = 40
	} )
	f33_local2:animateToState( "default" )
	f33_arg0.slowPurchaseText:addElement( f33_local2 )
	f33_local2:animateFill( f33_local0 )
	f33_arg0.purchaseTimeoutTimer = LUI.UITimer.new( f33_local0, "abort_purchase_transfer", nil, true )
	f33_arg0:addElement( f33_arg0.purchaseTimeoutTimer )
end

local f0_local33 = function ( f34_arg0, f34_arg1 )
	if f34_arg1.inventoryTaskType ~= LUI.InventoryUtils.TaskType.INV_TASK_PURCHASE_ITEM or f34_arg1.inventoryEventType ~= LUI.InventoryUtils.EventType.ELUIInventoryEvent_TaskCompleted then
		return 
	elseif f34_arg0.supplyDropPurchase == nil then
		return 
	end
	local f34_local0 = f34_arg0.properties.exclusiveController
	if f34_arg1.success then
		Engine.Loot_OpenSupplyDrop( f34_local0, f34_arg0.supplyDropType, f34_arg0.supplyDropTransaction )
	else
		f34_arg0:processEvent( {
			name = "supply_drop",
			success = false,
			dispatchChildren = false
		} )
	end
	f34_arg0.supplyDropPurchase = nil
end

local f0_local34 = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = LUI.MPDepot.GetSupplyDropCount( f35_arg1.controller, f35_arg3 ) > 0
	if f35_local0 or f35_arg2.amount <= GetCurrencyBalance( f35_arg2.type, f35_arg1.controller ) then
		if f35_arg0.cards then
			for f35_local1 = 1, #f35_arg0.cards, 1 do
				f0_local16( f35_arg0.cards[f35_local1] )
				f35_arg0:removeElement( f35_arg0.cards[f35_local1].translation )
			end
		end
		f35_arg0.cards = {}
		f35_arg0.supplyDropType = f35_arg3
		local f35_local1
		if f35_arg2 ~= nil then
			f35_local1 = f35_arg2.amount
			if not f35_local1 then
			
			else
				f35_arg0.purchaseCost = f35_local1
				if f35_local0 then
					f35_arg0.purchaseCost = 0
				end
				if f35_arg0.rarityVO then
					Engine.StopSound( f35_arg0.rarityVO )
					f35_arg0.rarityVO = nil
				end
				if f35_arg0.currencyContainer then
					f35_arg0:removeElement( f35_arg0.currencyContainer )
					f35_arg0.currencyContainer = nil
				end
				f35_arg0.makePurchaseActive = true
				SetDepotState( f35_arg0, {
					state = "purchase"
				} )
				Cac.NotifyVirtualLobby( "depot_supply_drop_type", f35_arg3 )
				f35_arg0.supplyDropTransaction = Engine.GetTimeUTC()
				f35_local1 = Engine.Loot_GetUnviewedSupplyDrop( f35_arg1.controller, f35_arg3, f35_arg0.supplyDropTransaction )
				if f35_local1 ~= nil then
					f35_local1.name = "supply_drop"
					f35_local1.success = true
					f35_local1.dispatchChildren = false
					f35_arg0:processEvent( f35_local1 )
				else
					local f35_local2 = false
					local f35_local3 = Engine.Loot_GetSupplyDropCount( f35_arg1.controller, f35_arg3 )
					local f35_local4 = LUI.MPDepot.crateData[f35_arg3]
					if f35_local3 == 0 and f35_local4 ~= nil and f35_local4.bundleID ~= nil then
						local f35_local5 = Engine.TableLookup( LUI.MPDepot.BundlesTable.File, LUI.MPDepot.BundlesTable.Cols.ID, "" .. f35_local4.bundleID, LUI.MPDepot.BundlesTable.Cols.PurchaseID )
						if f35_local5 ~= nil then
							f35_local2 = true
							local f35_local6 = Engine.TableLookup( LUI.MPDepot.BundlesTable.File, LUI.MPDepot.BundlesTable.Cols.ID, "" .. f35_local4.bundleID, LUI.MPDepot.BundlesTable.Cols.PurchaseLimitItem )
							if f35_local6 ~= nil then
								f35_arg0.purchaseLimitItem = f35_local6
							end
							f35_arg0.supplyDropPurchase = true
							f35_arg0:registerEventHandler( "inventory", f0_local33 )
							Engine.Inventory_PurchaseItem( f35_arg1.controller, f35_local5, 1 )
						end
					end
					if not f35_local2 then
						Engine.Loot_OpenSupplyDrop( f35_arg1.controller, f35_arg3, f35_arg0.supplyDropTransaction )
					end
					if f35_arg0.slowPurchaseTimer then
						f35_arg0.slowPurchaseTimer:close()
					end
					f35_arg0.slowPurchaseTimer = LUI.UITimer.new( f0_local31, "slow_purchase_transfer" )
					f35_arg0:addElement( f35_arg0.slowPurchaseTimer )
				end
				f35_arg0.background:animateToState( "default" )
				f35_arg0:processEvent( {
					name = "hide"
				} )
			end
		end
		f35_local1 = 0
	end
end

local f0_local35 = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4 )
	local f36_local0 = {
		message_text = Engine.Localize( "@DEPOT_TRADE_AGAIN_CONFIRMATION", f36_arg3.amount, CurrencyInfo[f36_arg3.type].name, LUI.MPDepot.crateData[f36_arg2].text ),
		popup_title = Engine.Localize( "@DEPOT_TRADE_AGAIN" ),
		yes_action = function ( f37_arg0, f37_arg1 )
			f0_local34( f36_arg0, f37_arg1, f36_arg3, f36_arg4 )
			f36_arg0.tradeAgainActive = nil
		end,
		no_action = function ( f38_arg0, f38_arg1 )
			f36_arg0.tradeAgainActive = nil
		end,
		yes_text = Engine.Localize( "@MENU_YES" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" ),
		default_focus_index = 1
	}
	f36_arg0.tradeAgainActive = true
	LUI.FlowManager.RequestAddMenu( f36_arg0, "generic_yesno_popup", true, f36_arg1.controller, false, f36_local0 )
end

local f0_local36 = function ( f39_arg0, f39_arg1 )
	if f39_arg0.list.buttons ~= nil then
		for f39_local0 = 1, #f39_arg0.list.buttons, 1 do
			f39_arg0.list.buttons[f39_local0]:close()
		end
	end
	f39_arg0.list.buttons = {}
	if f39_arg1 and f39_arg1 > 0 then
		f39_arg0.list.buttons[1] = LUI.MenuBuilder.BuildAddChild( f39_arg0.list, {
			type = "UIGenericButton",
			id = "open_button",
			properties = {
				style = LUI.MenuTemplate.ButtonStyle,
				button_text = Engine.Localize( "@DEPOT_OPEN" ),
				text_align_without_content = LUI.Alignment.Center,
				exclusiveController = f39_arg0.exclusiveController,
				button_action_func = function ( f40_arg0, f40_arg1 )
					f0_local34( f39_arg0, f40_arg1, nil, LUI.MPDepot.crateData[f39_arg0.crateType].items[1] )
				end
			}
		} )
	else
		for f39_local0 = 1, #LUI.MPDepot.crateData[f39_arg0.crateType].items, 1 do
			local f39_local3 = LUI.MPDepot.crateData[f39_arg0.crateType].items[f39_local0]
			local f39_local4 = LUI.MPDepot.GetSupplyDropPrice( f39_local3 )
			local f39_local5 = tostring( f39_local4.amount )
			if f39_local4.type == InventoryCurrencyType.Credits or CoD.IsCPEnabled() then
				f39_arg0.list.buttons[f39_local0] = LUI.MenuBuilder.BuildAddChild( f39_arg0.list, {
					type = "UIGenericButton",
					id = "buy_again_button_" .. f39_local0,
					disabledFunc = function ()
						if LUI.MPDepot.crateData[f39_arg0.crateType].bundleID ~= nil and not LUI.MPDepot.CanPurchaseBundle( f39_arg0.exclusiveController, LUI.MPDepot.crateData[f39_arg0.crateType].bundleID ) then
							return true
						else
							return GetCurrencyBalance( f39_local4.type, f39_arg0.exclusiveController ) < f39_local4.amount
						end
					end,
					properties = {
						style = LUI.MenuTemplate.ButtonStyle,
						button_text = f39_local5,
						text_align_without_content = LUI.Alignment.Center,
						exclusiveController = f39_arg0.exclusiveController,
						button_action_func = function ( f42_arg0, f42_arg1 )
							if f39_arg0.makePurchaseActive == nil then
								f0_local35( f39_arg0, f42_arg1, f39_arg0.crateType, f39_local4, f39_local3 )
							end
						end,
						allowDisabledAction = true,
						disableSound = "h1_mpui_purch_neg"
					}
				} )
				f39_arg0.list.buttons[f39_local0]:registerEventHandler( "button_action_disable", LUI.MPDepotBase.Broke )
				local f39_local6, f39_local7, f39_local8 = GetTextDimensions2( f39_local5, LUI.MenuGenericButtons.ButtonLabelFont.Font, LUI.MenuGenericButtons.ButtonLabelFont.Height * LUI.UIGenericButton.fontScale )
				LUI.MenuBuilder.BuildAddChild( f39_arg0.list.buttons[f39_local0], {
					type = "UIImage",
					states = {
						default = {
							leftAnchor = false,
							rightAnchor = false,
							topAnchor = false,
							bottomAnchor = false,
							right = -f39_local7 / 2 - LUI.MenuTemplate.ButtonStyle.border_padding * 2,
							height = LUI.MenuGenericButtons.ButtonLabelFont.Height,
							width = LUI.MenuGenericButtons.ButtonLabelFont.Height,
							material = RegisterMaterial( GetCurrencyImage( f39_local4.type ) )
						}
					}
				} )
			end
		end
	end
end

local f0_local37 = function ( f43_arg0 )
	if f43_arg0.list.crateImg then
		local f43_local0 = LUI.MPDepot.GetCrateCount( f43_arg0.exclusiveController, f43_arg0.crateType )
		if f43_local0 > 0 then
			if f43_arg0.list.crateImg.count then
				f43_arg0.list.crateImg.count.numText:setText( f43_local0 )
			end
		elseif f43_arg0.list.crateImg.count then
			f43_arg0.list.crateImg.count:close()
			f43_arg0.list.crateImg.count = nil
			f43_arg0.list.text:setText( Engine.Localize( "@DEPOT_TRADE_AGAIN" ) )
			f0_local36( f43_arg0, f43_local0 )
			if f43_arg0.tradeAgainActive == nil then
				f43_arg0.list:processEvent( {
					name = "gain_focus",
					controller = f43_arg0.exclusiveController
				} )
			end
		end
	end
end

local f0_local38 = function ( f44_arg0, f44_arg1 )
	f44_arg0.visible = false
	f44_arg0.dot_pattern:animateToState( "default" )
	f44_arg0:registerEventHandler( "gamepad_button", f0_local27 )
	f44_arg0:registerEventHandler( "mousedown", f0_local27 )
	for f44_local3, f44_local4 in ipairs( f44_arg0.hideAndShowList ) do
		f44_local4:animateToState( "hide" )
	end
end

local f0_local39 = function ( f45_arg0, f45_arg1 )
	local f45_local0 = 500
	f45_arg0.visible = true
	f0_local37( f45_arg0 )
	f45_arg0:dispatchEventToChildren( {
		name = "refresh_disabled"
	} )
	for f45_local4, f45_local5 in ipairs( f45_arg0.hideAndShowList ) do
		f45_local5:animateToState( "show", f45_local0 )
	end
	ProcessCollectionRewardQueue( f45_arg0, f45_arg1 )
	if f45_arg0.onBoarding and not f45_arg0.supplyDropPopupShown then
		f45_arg0:registerEventHandler( "supply_drop_popup", function ( element, event )
			event.controller = element.m_ownerController
			element.supplyDropPopupShown = true
			element:registerEventHandler( "gamepad_button", nil )
			element:registerEventHandler( "mousedown", nil )
			element.handleButtonPressesStartTime = nil
			LUI.OnboardingPopups.SupplyDrop( event )
		end )
		f45_arg0:addElement( LUI.UITimer.new( f45_local0 + 1500, "supply_drop_popup", nil, true ) )
	else
		f45_arg0:registerEventHandler( "gamepad_button", nil )
		f45_arg0:registerEventHandler( "mousedown", nil )
		f45_arg0.handleButtonPressesStartTime = nil
	end
end

local f0_local40 = function ( f47_arg0, f47_arg1 )
	local f47_local0 = 500
	f47_arg0.currencyInfoPanel:animateToState( "show", f47_local0 )
	f47_arg0.wholeTitle:animateToState( "show", f47_local0 )
	f47_arg0.headerContainer:animateToState( "show", f47_local0 )
end

local f0_local41 = function ( f48_arg0, f48_arg1 )
	if f48_arg0.slowPurchaseTimer then
		f48_arg0.slowPurchaseTimer:close()
		f48_arg0.slowPurchaseTimer = nil
	end
	if f48_arg0.slowPurchaseText then
		f48_arg0.slowPurchaseText:close()
		f48_arg0.slowPurchaseText = nil
	end
	if f48_arg0.purchaseTimeoutTimer then
		f48_arg0.purchaseTimeoutTimer:close()
		f48_arg0.purchaseTimeoutTimer = nil
	end
	f48_arg0.makePurchaseActive = nil
	if f48_arg1.success and f48_arg0.supplyDropTransaction and f48_arg0.supplyDropTransaction == f48_arg1.transaction and f48_arg1.duplicateRefund == false then
		f48_arg0.supplyDropData = LUI.DeepCopy( f48_arg1 )
		f48_arg0:UpdateCurrency( InventoryCurrencyType.Credits )
		f48_arg0:UpdateCurrency( InventoryCurrencyType.CoDPoints )
		InvalidateItemSets()
		f48_arg0.supplyDropData.lootData = {}
		local f48_local0 = ""
		for f48_local1 = 1, #f48_arg0.supplyDropData.items, 1 do
			f48_arg0.supplyDropData.lootData[f48_local1] = LUI.InventoryUtils.GetLootData( f48_arg0.supplyDropData.items[f48_local1] )
			if f48_local1 == 1 then
				f48_local0 = "" .. LUI.MPDepot.crateData[f48_arg0.crateType].rarity
			else
				f48_local0 = f48_local0 .. "," .. LUI.MPDepot.crateData[f48_arg0.crateType].rarity
			end
		end
		LUI.ComScore.LogSupplyDrop( f48_arg0.exclusiveController, f48_arg0.supplyDropData.lootData, f48_arg0.supplyDropData.currencies, f48_arg0.supplyDropType, f48_arg0.purchaseCost )
		SetDepotState( f48_arg0, {
			state = "purchaseconfirm"
		} )
		Cac.NotifyVirtualLobby( "depot_loot_rarities", f48_local0 )
		if not Engine.GetDvarBool( "vlDepotEnabled" ) then
			f0_local26( f48_arg0 )
		end
	elseif f48_arg0.supplyDropTransaction then
		f48_arg0:UpdateCurrency( InventoryCurrencyType.Credits )
		f48_arg0:UpdateCurrency( InventoryCurrencyType.CoDPoints )
		SetDepotState( f48_arg0, {
			state = "purchasefail"
		} )
		local f48_local0 = nil
		if f48_arg1.duplicateRefund == true then
			f48_local0 = Engine.Localize( "@DEPOT_PURCHASE_FAIL_INVENTORY_FULL" )
			if f48_arg0.purchaseLimitItem ~= nil and Engine.Inventory_GetItemQuantity( f48_arg0.exclusiveController, f48_arg0.purchaseLimitItem, true ) > 0 then
				Engine.Inventory_ConsumeItem( f48_arg0.exclusiveController, f48_arg0.purchaseLimitItem, 1 )
			end
		else
			f48_local0 = Engine.Localize( "@DEPOT_PURCHASE_FAIL_MESSAGE" )
		end
		LUI.FlowManager.RequestAddMenu( f48_arg0, "generic_confirmation_popup", true, f48_arg0.exclusiveController, false, {
			popup_title = Engine.Localize( "@MENU_ERROR" ),
			message_text = f48_local0
		} )
		f48_arg0:addElement( LUI.UITimer.new( 100, "show", nil, true ) )
	end
	f48_arg0.supplyDropTransaction = 0
end

local f0_local42 = function ( f49_arg0, f49_arg1 )
	if f49_arg0.crateType and LUI.MPDepot.crateData[f49_arg0.crateType].purchaseSound then
		f49_arg0.purchaseSound = Engine.PlaySound( LUI.MPDepot.crateData[f49_arg0.crateType].purchaseSound )
	end
end

local f0_local43 = function ( f50_arg0, f50_arg1 )
	SetDepotState( f50_arg0, {
		state = "purchase"
	} )
	f50_arg0.supplyDropType = LUI.MPDepot.SupplyCrateTypes.Onboarding
	f50_arg0.purchaseCost = 0
	f50_arg0.supplyDropTransaction = Engine.GetTimeUTC()
	Cac.NotifyVirtualLobby( "depot_supply_drop_type", f50_arg0.supplyDropType )
	Engine.Loot_OpenSupplyDrop( f50_arg1, f50_arg0.supplyDropType, f50_arg0.supplyDropTransaction )
	f50_arg0.slowPurchaseTimer = LUI.UITimer.new( f0_local31, "slow_purchase_transfer" )
	f50_arg0:addElement( f50_arg0.slowPurchaseTimer )
	f50_arg0.background:animateToState( "default" )
	f50_arg0:processEvent( {
		name = "hide"
	} )
end

LUI.MPDepotOpenLoot.OnClose = function ( f51_arg0, f51_arg1 )
	for f51_local0 = 1, #f51_arg0.cards, 1 do
		f0_local16( f51_arg0.cards[f51_local0] )
	end
	if f51_arg0.rarityVO then
		Engine.StopSound( f51_arg0.rarityVO )
		f51_arg0.rarityVO = nil
	end
end

LUI.MPDepotOpenLoot.SaveLootData = function ( f52_arg0, f52_arg1 )
	local f52_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f52_arg0 )
	f52_local0.supplyDropData = f52_arg0.supplyDropData
	f52_local0.onBoarding = f52_arg0.onBoarding
	f52_local0.supplyDropPopupShown = f52_arg0.supplyDropPopupShown
end

LUI.MPDepotOpenLoot.ClearLootData = function ( f53_arg0 )
	local f53_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f53_arg0 )
	f53_local0.supplyDropData = nil
	f53_local0.onBoarding = nil
	f53_local0.supplyDropPopupShown = nil
end

LUI.MPDepotOpenLoot.RestoreLootData = function ( f54_arg0 )
	local f54_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f54_arg0 )
	f54_arg0.onBoarding = f54_local0.onBoarding
	f54_arg0.supplyDropPopupShown = f54_local0.supplyDropPopupShown
	if f54_local0.supplyDropData then
		f54_arg0.supplyDropData = f54_local0.supplyDropData
		Cac.NotifyVirtualLobby( "lootscreen_weapon_highlighted", "none" )
		f54_arg0.dot_pattern:animateToState( "show", 0, false, false, false )
		f54_arg0.background:animateInSequence( {
			{
				"show",
				0
			},
			{
				"show",
				1
			}
		} )
		f54_arg0:processEvent( {
			name = "show"
		} )
		f0_local7( f54_arg0, true, true )
		f0_local13( f54_arg0, {
			skipAnimation = true
		} )
		for f54_local1 = 1, #f54_arg0.cards, 1 do
			LUI.MPDepotLootCard.SetItem( f54_arg0.cards[f54_local1], f54_arg0.cards[f54_local1].data )
			f0_local15( f54_arg0.cards[f54_local1], {
				skipAnimation = true
			} )
			if f54_arg0.cards[f54_local1].collectionCompleted then
				f0_local5( f54_arg0.cards[f54_local1], false )
			end
		end
		f54_arg0:processEvent( {
			name = "initCardNavigation",
			restoring = true
		} )
	end
	f54_local0.supplyDropData = nil
	f54_local0.onBoarding = nil
	f54_local0.supplyDropPopupShown = nil
end

function MPDepotOpenLootMenu( f55_arg0, f55_arg1 )
	local f55_local0 = f55_arg1 or {}
	f55_local0.persistentBackground = PersistentBackground.Variants.Depot
	f55_local0.menu_title = "@DEPOT_SUPPLY_DROP"
	f55_local0.onBackFunc = OpenLootOnBack
	f55_local0.menu_width = GenericMenuDims.menu_width_standard / 2
	f55_local0.menu_top_indent = 125
	f55_local0.noOptionsButton = true
	local f55_local1 = LUI.MPDepotBase.new( f55_arg0, f55_local0 )
	f55_local1:setClass( LUI.MPDepotOpenLoot )
	f55_local1:SetBreadCrumb( Engine.Localize( "@DEPOT_DEPOT" ) )
	f55_local1:registerEventHandler( "supply_drop", f0_local41 )
	f55_local1:registerEventHandler( "supply_drop_ui", f0_local26 )
	if not f55_arg1.onBoarding then
		f55_local1:registerEventHandler( "supply_drop_allow_skip", f0_local28 )
		f55_local1:registerEventHandler( "supply_drop_play_purchase_vo", f0_local42 )
	end
	f55_local1:registerEventHandler( "reveal_cards", f0_local25 )
	f55_local1:registerEventHandler( "show_bonus_currency", f0_local13 )
	f55_local1:registerEventHandler( "update_and_highlight_currency", f0_local12 )
	f55_local1:registerEventHandler( "initCardNavigation", LUI.MPDepotLootCard.InitCardNavigation )
	f55_local1:registerEventHandler( "show_currency_and_title", f0_local40 )
	f55_local1:registerEventHandler( "menu_close", LUI.MPDepotOpenLoot.OnClose )
	f55_local1:registerEventHandler( "card_button_action", LUI.MPDepotOpenLoot.SaveLootData )
	f55_local1:registerEventHandler( "slow_purchase_transfer", f0_local32 )
	f55_local1:registerEventHandler( "abort_purchase_transfer", f0_local29 )
	f55_local1:registerEventHandler( "play_sound", LUI.MPDepotBase.PlaySound )
	f55_local1:registerEventHandler( "stop_sound", LUI.MPDepotBase.StopSound )
	f55_local1:registerEventHandler( "hide", f0_local38 )
	f55_local1:registerEventHandler( "show", f0_local39 )
	if not f55_arg1.onBoarding then
		f55_local1.list:addEventHandler( "popup_inactive", function ( f56_arg0, f56_arg1 )
			f56_arg0.crateImg.mask:animateToState( "show" )
		end )
		f55_local1.list:addEventHandler( "gain_focus", function ( f57_arg0, f57_arg1 )
			f57_arg0.crateImg.mask:animateToState( "show" )
		end )
		if Engine.IsConsoleGame() then
			f55_local1.list:addEventHandler( "lose_focus", function ( f58_arg0, f58_arg1 )
				f58_arg0.crateImg.mask:animateToState( "hide" )
			end )
		end
	end
	f55_local1:addEventHandler( "on_item_equipped", function ( f59_arg0, f59_arg1 )
		if f59_arg0.equipCard then
			LUI.MPDepotHelp.StartConfirmationPopUpAnim( f59_arg0.equipCard.translation, "equip" )
			f59_arg0.equipCard = nil
		else
			LUI.MPDepotHelp.StartConfirmationPopUpAnim( f59_arg0, "equip" )
		end
	end )
	f55_local1.visible = false
	f55_local1.backButton.disabledFunc = function ()
		return not f55_local1.visible
	end
	
	f55_local1.cards = {}
	f55_local1.onBoarding = f55_arg1.onBoarding
	if f55_arg1.crateType == nil then
		f55_arg1.crateType = LUI.MPDepot.SupplyCrateTypes.AW_Rare
	end
	f55_local1.crateType = f55_arg1.crateType
	if f55_arg1.numAvailable == nil then
		f55_arg1.numAvailable = LUI.MPDepot.GetCrateCount( f55_local1.exclusiveController, f55_local1.crateType )
	end
	f55_local1.hideAndShowList = {
		f55_local1.list,
		f55_local1.currencyInfoPanel,
		f55_local1.backButton,
		f55_local1.help,
		f55_local1.wholeTitle,
		f55_local1.headerContainer
	}
	if not f55_local1.onBoarding then
		local f55_local2, f55_local3, f55_local4, f55_local5 = f55_local1.list:getLocalRect()
		local f55_local6 = f55_local4 - f55_local2
		local f55_local7 = RegisterMaterial( LUI.MPDepot.crateData[f55_local1.crateType].img )
		local f55_local8, f55_local9 = GetMaterialDimensions( f55_local7 )
		local f55_local10 = 75
		local f55_local11 = f55_local10 * f55_local8 / f55_local9
		if LUI.MPDepot.crateData[f55_local1.crateType] == nil or LUI.MPDepot.crateData[f55_local1.crateType].bundleID == nil then
			local f55_local12 = RegisterMaterial
			local f55_local13 = LUI.MPDepot.LootDropsData
			local f55_local14 = LUI.MPDepot.SuppyDropLootStream
			f55_local12 = f55_local12( f55_local13[LUI.MPDepot.SuppyDropLootStream[f55_local1.crateType]].icon or "ui_invisible" )
			f55_local13, f55_local14 = GetMaterialDimensions( f55_local12 )
			local f55_local15 = f55_local10
			local f55_local16 = f55_local15 * f55_local13 / f55_local14
			local f55_local17 = f55_local2 + f55_local6 * 0.5
			local f55_local18 = f55_local15 * 0.25
			local f55_local19 = CoD.CreateState( f55_local17 - f55_local16 * 0.5, f55_local3 - f55_local15 + f55_local18, f55_local17 + f55_local16 * 0.5, f55_local3 + f55_local18, CoD.AnchorTypes.TopLeft )
			f55_local19.material = f55_local12
			f55_local19.alpha = 0.75
			f55_local1.lootIcon = LUI.UIImage.new( f55_local19 )
			f55_local1.lootIcon:setPriority( -100 )
			f55_local1.lootIcon.defaultAlpha = f55_local19.alpha
			f55_local1:addElement( f55_local1.lootIcon )
		end
		f55_local1.list.crateImg = LUI.MenuBuilder.BuildAddChild( f55_local1.list, {
			type = "UIImage",
			id = "open_loot_crate_img",
			states = {
				default = {
					leftAnchor = false,
					topAnchor = true,
					rightAnchor = false,
					bottomAnchor = false,
					left = -f55_local11 * 0.5,
					top = 0,
					bottom = f55_local10,
					width = f55_local11,
					material = f55_local7
				}
			}
		} )
		if f55_arg1.numAvailable > 0 then
			f55_local1.list.crateImg.count = LUI.MPDepot.CreateAvailableCratesInfo( nil, f55_arg1.numAvailable )
			f55_local1.list.crateImg:addElement( f55_local1.list.crateImg.count )
		end
		LUI.MPDepotBase.PlaySparkleAnimation( f55_local1.list.crateImg, f55_local1.crateType )
		f55_local1.list:addElement( LUI.Divider.new( {
			leftAnchor = true,
			topAnchor = true,
			width = f55_local0.menu_width,
			height = 4,
			left = 0,
			top = f55_local0.menu_top_indent + f55_local10 + H1MenuDims.spacing * 2
		} ) )
		f55_local1:AddSpacing( 10 )
		local f55_local13 = f55_local1.list
		local f55_local14 = LUI.MenuBuilder.BuildAddChild
		local f55_local15 = f55_local1.list
		local f55_local16 = {
			type = "UIText",
			id = "tradeAgain",
			states = {
				default = {
					font = CoD.TextSettings.BodyFont.Font,
					alignment = LUI.Alignment.Center,
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = false,
					left = 0,
					right = 0,
					top = 0,
					bottom = 15
				}
			}
		}
		local f55_local17 = {}
		local f55_local18
		if f55_arg1.numAvailable > 1 then
			f55_local18 = Engine.Localize( "@DEPOT_OPEN_NEXT_CRATE" )
			if not f55_local18 then
			
			else
				f55_local17.text = f55_local18
				f55_local16.properties = f55_local17
				f55_local13.text = f55_local14( f55_local15, f55_local16 )
				f55_local1:AddSpacing( 10 )
				f0_local36( f55_local1, f55_arg1.numAvailable )
				table.insert( f55_local1.hideAndShowList, f55_local1.lootIcon )
			end
		end
		f55_local18 = Engine.Localize( "@DEPOT_TRADE_AGAIN" )
	end
	local f55_local2 = LUI.MPLootDropsBase.GetGenericItemList
	local f55_local3 = nil
	local f55_local4 = LUI.MPDepot.LootDropsData
	local f55_local5 = LUI.MPDepot.SuppyDropLootStream
	f55_local1.lootDropItemList = f55_local2( f55_local3, f55_local4[LUI.MPDepot.SuppyDropLootStream[f55_local1.crateType]].lootTableColName )
	f55_local2 = {}
	for f55_local3 = 1, #f55_local1.lootDropItemList, 1 do
		if f55_local1.lootDropItemList[f55_local3].name and f55_local1.lootDropItemList[f55_local3].name ~= "" and f55_local1.lootDropItemList[f55_local3].lootRarity and f55_local1.lootDropItemList[f55_local3].lootRarity.rarity >= Cac.InventoryItemRarity.Common and f55_local1.lootDropItemList[f55_local3].lootRarity and f55_local1.lootDropItemList[f55_local3].lootRarity.rarity <= Cac.InventoryItemRarity.Epic then
			f55_local2[#f55_local2 + 1] = f55_local1.lootDropItemList[f55_local3]
		end
	end
	f55_local1.lootDropItemList = LUI.ShallowCopy( f55_local2 )
	f55_local1.friendsWidget:close()
	f55_local3 = RegisterMaterial( "depot_reveal_dot_pattern" )
	f55_local4, f55_local5 = GetMaterialDimensions( f55_local3 )
	local f55_local6 = f0_local0 * 3
	local f55_local7 = f55_local6 * f55_local4 / f55_local5
	local f55_local8 = CoD.CreateState( -f55_local7 / 2, -f55_local6 / 2, f55_local7 / 2, f55_local6 / 2, CoD.AnchorTypes.None )
	f55_local8.material = f55_local3
	f55_local8.alpha = 0
	f55_local1.dot_pattern = LUI.UIImage.new( f55_local8 )
	f55_local1.dot_pattern:registerAnimationState( "show", {
		alpha = 1
	} )
	f55_local1:addElement( f55_local1.dot_pattern )
	f55_local1.background = LUI.UIImage.new()
	f55_local1.background:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = -100,
		right = 100,
		top = -100,
		bottom = 100,
		material = RegisterMaterial( "black" ),
		alpha = 0,
		worldBlur = 0
	} )
	f55_local1.background:registerAnimationState( "show", {
		alpha = 0.6,
		worldBlur = 3
	} )
	f55_local1.background:setPriority( -2000 )
	f55_local1.background:setupFullWindowElement()
	f55_local1.background:setupWorldBlur()
	f55_local1:addElement( f55_local1.background )
	local f55_local9 = {
		alpha = 1
	}
	local f55_local10 = {
		alpha = 0
	}
	for f55_local14, f55_local15 in ipairs( f55_local1.hideAndShowList ) do
		f55_local15:registerAnimationState( "hide", f55_local10 )
		f55_local15:registerAnimationState( "show", f55_local1.hideAndShowList.defaultAlpha and {
			alpha = f55_local1.hideAndShowList.defaultAlpha
		} or f55_local9 )
	end
	f55_local1:addElement( LUI.MPDepotHelp.new( f55_local1, {
		actionAndCollectionHelpOnly = true
	} ) )
	if not Engine.GetDvarBool( "vlDepotEnabled" ) then
		f55_local1:processEvent( {
			name = "show"
		} )
	else
		f55_local1:processEvent( {
			name = "hide"
		} )
	end
	f55_local11 = LUI.FlowManager.GetMenuScopedDataFromElement( f55_local1 )
	if f55_arg1.supplyDropType and not f55_local11.supplyDropData and not f55_local1.onBoarding then
		f0_local34( f55_local1, {
			controller = f55_local1.exclusiveController
		}, f55_arg1.currencyInfo, f55_arg1.supplyDropType )
	end
	if f55_local1.onBoarding and not f55_local11.supplyDropData then
		f0_local43( f55_local1, f55_local1.exclusiveController )
	else
		Cac.NotifyVirtualLobby( "depot_return", f55_local1.exclusiveController )
	end
	LUI.MPDepotOpenLoot.RestoreLootData( f55_local1 )
	return f55_local1
end

LUI.MenuBuilder.registerType( "MPDepotOpenLootMenu", MPDepotOpenLootMenu )
VLobby.InitMenuMode( "MPDepotOpenLootMenu", VirtualLobbyModes.LUI_MODE_LOBBY )
LockTable( _M )
