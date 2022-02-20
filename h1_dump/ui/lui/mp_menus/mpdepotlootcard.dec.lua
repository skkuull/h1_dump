LUI.MPDepotLootCard = {}
LUI.MPDepotLootCard.cardBackMaterial = RegisterMaterial( "depot_card_back" )
LUI.MPDepotLootCard.defaultCardHeight = 250
LUI.MPDepotLootCard.rarityMaterials = {
	[Cac.InventoryItemRarity.Common] = {
		textcolor = {
			r = 0.58,
			g = 0.58,
			b = 0.58
		},
		glowcolor = {
			r = 0.36,
			g = 0.36,
			b = 0.36
		},
		border = {
			mat = RegisterMaterial( "depot_card_bg_common" )
		}
	},
	[Cac.InventoryItemRarity.Rare] = {
		textcolor = {
			r = 0,
			g = 0.73,
			b = 1
		},
		glowcolor = {
			r = 0,
			g = 0.54,
			b = 0.74
		},
		border = {
			mat = RegisterMaterial( "depot_card_bg_rare" )
		},
		skullfill = {
			mat = RegisterMaterial( "card_back_gfx_fill_rare" ),
			topOffsetPct = 0.11,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.36
		},
		skullglow = {
			mat = RegisterMaterial( "card_back_gfx_glow_rare" ),
			topOffsetPct = 0.18,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.28
		},
		revealburst = {
			mat = RegisterMaterial( "card_reveal_burst_rare" )
		}
	},
	[Cac.InventoryItemRarity.Legendary] = {
		textcolor = {
			r = 0.76,
			g = 0.35,
			b = 0.99
		},
		glowcolor = {
			r = 0.54,
			g = 0.06,
			b = 0.74
		},
		border = {
			mat = RegisterMaterial( "depot_card_bg_legendary" )
		},
		skullfill = {
			mat = RegisterMaterial( "card_back_gfx_fill_legendary" ),
			topOffsetPct = 0.11,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.36
		},
		skullglow = {
			mat = RegisterMaterial( "card_back_gfx_glow_legendary" ),
			topOffsetPct = 0.18,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.28
		},
		skullstroke = {
			mat = RegisterMaterial( "card_back_gfx_stroke_legendary" ),
			topOffsetPct = 0.11,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.36
		},
		frontstroke = {
			mat = RegisterMaterial( "depot_card_stroke_legendary" )
		},
		flare = {
			mat = RegisterMaterial( "flare_legendary" )
		},
		revealburst = {
			mat = RegisterMaterial( "card_reveal_burst_legendary" )
		}
	},
	[Cac.InventoryItemRarity.Epic] = {
		textcolor = {
			r = 1,
			g = 0.84,
			b = 0.35
		},
		glowcolor = {
			r = 1,
			g = 0.8,
			b = 0.18
		},
		border = {
			mat = RegisterMaterial( "depot_card_bg_epic" )
		},
		skullfill = {
			mat = RegisterMaterial( "card_back_gfx_fill_epic" ),
			topOffsetPct = 0.11,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.36
		},
		skullglow = {
			mat = RegisterMaterial( "card_back_gfx_glow_epic" ),
			topOffsetPct = 0.18,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.28
		},
		skullstroke = {
			mat = RegisterMaterial( "card_back_gfx_stroke_epic" ),
			topOffsetPct = 0.11,
			sideOffsetPct = 0.12,
			bottomOffsetPct = 0.36
		},
		frontstroke = {
			mat = RegisterMaterial( "depot_card_stroke_epic" )
		},
		flare = {
			mat = RegisterMaterial( "flare_epic" )
		},
		revealburst = {
			mat = RegisterMaterial( "card_reveal_burst_epic" )
		}
	},
	[Cac.InventoryItemRarity.Reward] = {
		textcolor = {
			r = 0.58,
			g = 0.58,
			b = 0.58
		},
		glowcolor = {
			r = 1,
			g = 1,
			b = 1
		},
		border = {
			mat = RegisterMaterial( "depot_card_bg_reward" )
		}
	}
}
LUI.MPDepotLootCard.rarityRevealEasings = {
	[Cac.InventoryItemRarity.Common] = LUI.Easing.OutElasticLight,
	[Cac.InventoryItemRarity.Rare] = LUI.Easing.OutElasticMedium,
	[Cac.InventoryItemRarity.Legendary] = LUI.Easing.OutElasticHeavy,
	[Cac.InventoryItemRarity.Epic] = LUI.Easing.OutElasticDrastic
}
LUI.MPDepotLootCard.rarityMaterials[Cac.InventoryItemRarity.None] = LUI.MPDepotLootCard.rarityMaterials[Cac.InventoryItemRarity.Common]
LUI.MPDepotLootCard.rarityMaterials[Cac.InventoryItemRarity.Entitlement] = LUI.MPDepotLootCard.rarityMaterials[Cac.InventoryItemRarity.Common]
LUI.MPDepotLootCard.rarityVO = {
	[Cac.InventoryItemRarity.Common] = {
		new = "grvs_compl_common",
		dupe = "grvs_compl_dupe"
	},
	[Cac.InventoryItemRarity.Rare] = {
		new = "grvs_compl_rare",
		dupe = "grvs_compl_dupe_rare"
	},
	[Cac.InventoryItemRarity.Legendary] = {
		new = "grvs_compl_lgnd",
		dupe = "grvs_compl_dupe_lgnd"
	},
	[Cac.InventoryItemRarity.Epic] = {
		new = "grvs_compl_epic",
		dupe = "grvs_compl_dupe_epic"
	}
}
LUI.MPDepotLootCard.raritySFX = {
	[Cac.InventoryItemRarity.Common] = {
		flip = {
			"h1_ui_cardflip_cmn_02",
			"h1_ui_cardflip_cmn_02",
			"h1_ui_cardflip_cmn_03"
		},
		reveal = "h1_ui_tileflip_cmn"
	},
	[Cac.InventoryItemRarity.Rare] = {
		flip = {
			"h1_ui_cardflip_rare_02",
			"h1_ui_cardflip_rare_02",
			"h1_ui_cardflip_rare_03"
		},
		reveal = "h1_ui_tileflip_rare"
	},
	[Cac.InventoryItemRarity.Legendary] = {
		flip = {
			"h1_ui_cardflip_lgnd_02",
			"h1_ui_cardflip_lgnd_02",
			"h1_ui_cardflip_lgnd_03"
		},
		reveal = "h1_ui_tileflip_lgnd"
	},
	[Cac.InventoryItemRarity.Epic] = {
		flip = {
			"h1_ui_cardflip_epic_02",
			"h1_ui_cardflip_epic_02",
			"h1_ui_cardflip_epic_03"
		},
		reveal = "h1_ui_tileflip_epic"
	}
}
LUI.MPDepotLootCard.GetLootRarity = function ( f1_arg0 )
	if f1_arg0 and f1_arg0.lootRarity and not LUI.MPDepotLootCard.randomRarities then
		return f1_arg0.lootRarity.rarity
	end
	local f1_local0 = f1_arg0.rarity
	if not f1_local0 then
		f1_local0 = math.random( Cac.InventoryItemRarity.Common, Cac.InventoryItemRarity.Epic )
	end
	return f1_local0
end

LUI.MPDepotLootCard.GetLootName = function ( f2_arg0 )
	if not f2_arg0 then
		return "LOOT NAME"
	elseif f2_arg0.name and f2_arg0.name ~= "" then
		return f2_arg0.name
	elseif f2_arg0.lootName and f2_arg0.lootName ~= "" then
		return f2_arg0.lootName
	elseif f2_arg0.weaponName and f2_arg0.weaponName ~= "" then
		return f2_arg0.weaponName
	else
		return "LOOT NAME"
	end
end

LUI.MPDepotLootCard.GetLootCategory = function ( f3_arg0 )
	if not f3_arg0 then
		return "LOOT CATEGORY"
	elseif f3_arg0.category and f3_arg0.category ~= "" then
		if f3_arg0.loot_type ~= nil then
			if f3_arg0.loot_type == "furniturekit" then
				return Engine.Localize( "@MENU_STR_COLON_NL_STR", Engine.Localize( "@DEPOT_WEAPON_KIT" ), f3_arg0.category )
			elseif f3_arg0.loot_type == "reticle" then
				return Engine.Localize( "@MENU_STR_COLON_NL_STR", Engine.Localize( "@MENU_RETICLE_CAPS" ), f3_arg0.category )
			elseif f3_arg0.loot_type == "weaponcamo" then
				return Engine.Localize( "@MENU_STR_COLON_NL_STR", Engine.Localize( "@MENU_CAMO_SHORT_CAPS" ), f3_arg0.category )
			end
		end
		return f3_arg0.category
	elseif f3_arg0.loot_type and f3_arg0.loot_type ~= "" then
		return f3_arg0.loot_type
	elseif f3_arg0.weaponType and f3_arg0.weaponType ~= "" then
		return f3_arg0.weaponType
	else
		return "LOOT CATEGORY"
	end
end

LUI.MPDepotLootCard.GetLootImage = function ( f4_arg0 )
	if f4_arg0 and f4_arg0.image then
		return f4_arg0.image
	else
		return RegisterMaterial( "ui_invisible" )
	end
end

LUI.MPDepotLootCard.GetRarityText = function ( f5_arg0 )
	return RarityInfo[f5_arg0].name
end

LUI.MPDepotLootCard.GetCardFrontMaterialForRarity = function ( f6_arg0 )
	return RarityInfo[f6_arg0].img
end

local f0_local0 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0:getParent()
	if f7_local0.arrowIcon then
		f7_local0.arrowIcon:animateToState( "default" )
		f7_local0.card.cardSelection:animateToState( "default", 50, nil, nil, nil, LUI.Easing.InBack )
	end
	if f7_local0.card and f7_local0.card.menu.lastFocusList then
		f7_local0.card.menu.lastFocusList = nil
	else
		local f7_local1 = f7_local0:getParent()
		if f7_local1.lastFocusList then
			f7_local1 = f7_local0:getParent()
			f7_local1.lastFocusList = nil
		end
	end
end

local f0_local1 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg0:getParent()
	if f8_local0.arrowIcon then
		f8_local0.arrowIcon:animateToState( "show", 200 )
		f8_local0.card.cardSelection:animateToState( "show", 200, nil, nil, nil, LUI.Easing.OutBack )
	end
	if f8_local0.card.menu.lastFocusList then
		f0_local0( f8_local0.card.menu.lastFocusList:getFirstChild() )
	end
end

local f0_local2 = function ( f9_arg0, f9_arg1 )
	if f9_arg0.arrowIcon then
		f9_arg0.arrowIcon:animateToState( "show", 200 )
		f9_arg0.card.cardSelection:animateToState( "show", 200, nil, nil, nil, LUI.Easing.OutBack )
	end
	local f9_local0 = nil
	if f9_arg1.button then
		if f9_arg1.button == "right" then
			if f9_arg0.navigation.left.arrowIcon then
				f9_arg0.navigation.left.arrowIcon:animateToState( "default" )
				f9_arg0.navigation.left.card.cardSelection:animateToState( "default", 50, nil, nil, nil, LUI.Easing.InBack )
				f9_local0 = LUI.UIElement.getSavedStateFocusId( f9_arg0.navigation.left.id )
			end
			f9_arg0.navigation.left:processEvent( {
				name = "lose_focus",
				dispatchChildren = false,
				immediate = true
			} )
		elseif f9_arg1.button == "left" then
			if f9_arg0.navigation.right.arrowIcon then
				f9_arg0.navigation.right.arrowIcon:animateToState( "default" )
				f9_arg0.navigation.right.card.cardSelection:animateToState( "default", 50, nil, nil, nil, LUI.Easing.InBack )
				f9_local0 = LUI.UIElement.getSavedStateFocusId( f9_arg0.navigation.right.id )
			end
			f9_arg0.navigation.right:processEvent( {
				name = "lose_focus",
				dispatchChildren = false,
				immediate = true
			} )
		end
	end
	if f9_local0 then
		local f9_local1 = f9_arg0:getFirstChild()
		while f9_local1 ~= nil do
			if f9_local1:canFocus( FocusType.ListSelection ) then
				break
			end
			f9_local1 = f9_local1:getNextSibling()
		end
		if f9_local1 then
			LUI.UIElement.setSavedStateFocusChild( f9_arg0, string.sub( f9_local1.id, 1, -2 ) .. string.sub( f9_local0, string.len( f9_local0 ) ) )
		end
	end
	if f9_arg0.card then
		f9_arg0.card.menu.lastFocusList = f9_arg0
	else
		local f9_local1 = f9_arg0:getParent()
		f9_local1.lastFocusList = nil
	end
	LUI.UIVerticalList.gainFocus( f9_arg0, f9_arg1 )
end

local f0_local3 = function ( f10_arg0, f10_arg1, f10_arg2 )
	f10_arg0.menu:processEvent( {
		name = "card_button_action",
		dispatchChildren = false,
		immediate = true
	} )
	if f10_arg0.data then
		local f10_local0 = f10_arg2 == "collection"
		if not f10_local0 then
			f10_arg0.menu.equipCard = f10_arg0
		end
		LUI.MPDepotHelp.OnAction( f10_arg0, f10_arg1, f10_arg0.menu, f10_arg0.data, f10_local0 )
	end
end

local f0_local4 = function ( f11_arg0 )
	local f11_local0 = {
		{
			button_text = Engine.Localize( "@DEPOT_EQUIP_CAPS" ),
			button_action_func = function ( f12_arg0, f12_arg1 )
				f0_local3( f11_arg0, f12_arg1, "equip" )
			end
		},
		{
			button_text = Engine.Localize( "@DEPOT_VIEW_COLLECTION_CAPS" ),
			button_action_func = function ( f13_arg0, f13_arg1 )
				f0_local3( f11_arg0, f13_arg1, "collection" )
			end
		}
	}
	for f11_local1 = 1, #f11_local0, 1 do
		local f11_local4 = LUI.ShallowCopy( f11_local0[f11_local1] )
		f11_local4.id = f11_arg0.id .. "_button_" .. f11_local1
		f11_local4.style = LUI.MenuTemplate.ButtonStyle
		f11_local4.text_align_without_content = LUI.Alignment.Center
		f11_local4.exclusiveController = f11_arg0.menu.exclusiveController
		local self = LUI.UIGenericButton.new( nil, f11_local4 )
		self.properties.button_action_func = f11_local4.button_action_func
		self:registerAnimationState( "faded", {
			alpha = 0.5
		} )
		self:animateToState( "faded" )
		f11_arg0.list:addElement( self )
		self:addEventHandler( "mouseenter", f0_local1 )
		self:addEventHandler( "mouseleave", f0_local0 )
	end
end

local f0_local5 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = LUI.UIElement.restoreFocus( f14_arg0, f14_arg1 )
	if f14_local0 then
		f14_arg0.arrowIcon:animateToState( "show" )
		f14_arg0.card.cardSelection:animateToState( "show" )
	end
	return f14_local0
end

LUI.MPDepotLootCard.InitCardNavigation = function ( f15_arg0, f15_arg1 )
	for f15_local0 = 1, #f15_arg0.cards, 1 do
		if not f15_arg0.cards[f15_local0].list then
			local f15_local3, f15_local4, f15_local5, f15_local6 = f15_arg0.cards[f15_local0].scale:getLocalRect()
			local f15_local7 = f15_local5 - f15_local3
			local f15_local8 = f15_local6 - f15_local4
			local f15_local9 = f15_local8 * 0.72
			local f15_local10 = f15_local7 * 0.8
			local f15_local11 = CoD.CreateState( -f15_local10 / 2, f15_local9, f15_local10 / 2, f15_local9 + 400, CoD.AnchorTypes.Bottom )
			f15_local11.font = CoD.TextSettings.BodyFontSmall.Font
			f15_local11.spacing = H1MenuDims.spacing
			f15_arg0.cards[f15_local0].list = LUI.UIVerticalList.new( f15_local11, nil, {
				use_arrows = true
			} )
			f15_arg0.cards[f15_local0].list.id = f15_arg0.cards[f15_local0].id .. "_list"
			f15_arg0.cards[f15_local0].list:makeFocusable()
			f15_arg0.cards[f15_local0].list:registerEventHandler( "gain_focus", f0_local2 )
			f15_arg0.cards[f15_local0].list:addEventHandler( "restore_focus", f0_local5 )
			f15_arg0.cards[f15_local0].list.card = f15_arg0.cards[f15_local0]
			f15_arg0.cards[f15_local0].translation:addElement( f15_arg0.cards[f15_local0].list )
			local f15_local12 = -f15_local8 * 0.3
			local f15_local13 = f15_local8 * 0.08
			local f15_local14 = f15_local8 * 0.16
			f15_arg0.cards[f15_local0].list.arrowIcon = LUI.UIImage.new( {
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = true,
				left = -f15_local14 / 2,
				top = f15_local12,
				right = f15_local14 / 2,
				bottom = f15_local12 + f15_local14,
				material = RegisterMaterial( "depot_card_focus_arrow" ),
				alpha = 0
			} )
			f15_arg0.cards[f15_local0].list.arrowIcon:registerAnimationState( "show", {
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = true,
				left = -f15_local14 / 2,
				top = f15_local13,
				right = f15_local14 / 2,
				bottom = f15_local13 + f15_local14,
				alpha = 1
			} )
			f15_arg0.cards[f15_local0]:addElement( f15_arg0.cards[f15_local0].list.arrowIcon )
			f0_local4( f15_arg0.cards[f15_local0] )
			if f15_local0 == 1 then
				f15_arg0.cards[f15_local0].list.navigation.left = f15_arg0.list
			else
				f15_arg0.cards[f15_local0].list.navigation.left = f15_arg0.cards[f15_local0 - 1].list
			end
		end
	end
	for f15_local0 = 1, #f15_arg0.cards, 1 do
		if f15_local0 < #f15_arg0.cards then
			f15_arg0.cards[f15_local0].list.navigation.right = f15_arg0.cards[f15_local0 + 1].list
		end
		f15_arg0.cards[f15_local0].list:processEvent( {
			name = "update_navigation"
		} )
	end
	if not f15_arg0.onBoarding then
		f15_arg0.list:makeFocusable()
		f15_arg0.list.navigation.right = f15_arg0.cards[1].list
		f15_arg0.list:addEventHandler( "gain_focus", f0_local2 )
		f15_arg0.list:processEvent( {
			name = "update_navigation"
		} )
	elseif not f15_arg1.restoring then
		f15_arg0.cards[1].list:processEvent( {
			name = "gain_focus",
			controller = f15_arg0.exclusiveController
		} )
	end
end

local f0_local6 = function ( f16_arg0, f16_arg1 )
	for f16_local0 = 1, #f16_arg1, 1 do
		if f16_arg1[f16_local0] then
			f16_arg1[f16_local0]:addElement( f16_arg0 )
			return 
		end
	end
end

LUI.MPDepotLootCard.MakeLockWithBkg = function ( f17_arg0 )
	local f17_local0 = 30
	f17_arg0.width = f17_local0
	f17_arg0.height = f17_local0
	f17_arg0.material = RegisterMaterial( "collection_lock_backing" )
	local self = LUI.UIImage.new( f17_arg0 )
	local f17_local2 = 18
	self:addElement( LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = f17_local2,
		height = f17_local2,
		material = RegisterMaterial( "s1_icon_locked_full" )
	} ) )
	return self
end

LUI.MPDepotLootCard.SetRewardEarned = function ( f18_arg0, f18_arg1 )
	local f18_local0 = "show"
	local f18_local1 = "default"
	if f18_arg1 then
		f18_local0 = "default"
		f18_local1 = "earned"
	end
	f18_arg0.lock:animateToState( f18_local0 )
	f18_arg0.earnedIcon:animateToState( f18_local1 )
end

LUI.MPDepotLootCard.SetItem = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = f19_arg1
	if type( f19_arg1 ) ~= "table" then
		f19_local0 = LUI.InventoryUtils.GetLootData( f19_arg1 )
	end
	if not f19_local0 then
		return 
	elseif not f19_arg2 then
		f19_arg2 = {}
	end
	local f19_local1 = LUI.MPDepotLootCard.GetLootRarity( f19_local0 )
	local f19_local2 = LUI.MPDepotLootCard.GetCardFrontMaterialForRarity( f19_local1 )
	local f19_local3 = CoD.SetMaterial
	local f19_local4 = f19_arg0
	local f19_local5 = f19_local2
	local f19_local6
	if not f19_arg2.hide then
		f19_local6 = 1
		if not f19_local6 then
		
		else
			f19_local3( f19_local4, f19_local5, f19_local6 )
			if f19_arg0.softGlow then
				f19_arg0.softGlow:registerAnimationState( "setColor", {
					color = LUI.MPDepotLootCard.rarityMaterials[f19_local1].glowcolor
				} )
				f19_arg0.softGlow:animateToState( "setColor", 0 )
				if not f19_arg2.hide and not f19_arg2.noSoftGlowPulse then
					f19_arg0.softGlow:animateInLoop( {
						{
							"glow_strong",
							500
						},
						{
							"glow_soft",
							1500
						}
					}, nil, nil, true, true )
				end
			end
			if f19_arg0.cardBorder then
				f19_local3 = CoD.SetMaterial
				f19_local4 = f19_arg0.cardBorder
				f19_local5 = LUI.MPDepotLootCard.rarityMaterials[f19_local1].border.mat
				f19_local6
				if not f19_arg2.hide then
					f19_local6 = 1
					if not f19_local6 then
					
					else
						f19_local3( f19_local4, f19_local5, f19_local6 )
					end
				end
				f19_local6 = 0
			end
			if f19_arg0.cardFlare then
				if LUI.MPDepotLootCard.rarityMaterials[f19_local1].flare then
					f19_local3 = CoD.SetMaterial
					f19_local4 = f19_arg0.cardFlare
					f19_local5 = LUI.MPDepotLootCard.rarityMaterials[f19_local1].flare.mat
					f19_local6
					if not f19_arg2.hide then
						f19_local6 = 1
						if not f19_local6 then
						
						else
							f19_local3( f19_local4, f19_local5, f19_local6 )
							f19_arg0.cardFlare:animateInLoop( {
								{
									"glow_strong",
									500
								},
								{
									"glow_soft",
									1500
								}
							}, nil, nil, true, true )
						end
					end
					f19_local6 = 0
				else
					f19_local3 = CoD.SetMaterial
					f19_local4 = f19_arg0.cardFlare
					f19_local5 = RegisterMaterial( "ui_invisible" )
					f19_local6
					if not f19_arg2.hide then
						f19_local6 = 1
						if not f19_local6 then
						
						else
							f19_local3( f19_local4, f19_local5, f19_local6 )
						end
					end
					f19_local6 = 0
				end
			end
			if not f19_arg2.showCardBack and f19_local1 ~= Cac.InventoryItemRarity.Reward and f19_local1 ~= Cac.InventoryItemRarity.Entitlement then
				f19_arg0.lootItemBG:animateToState( "show", 0 )
			else
				f19_arg0.lootItemBG:animateToState( "default", 0 )
			end
			f19_local3 = LUI.MPDepotLootCard.GetLootImage( f19_local0 )
			f19_local4, f19_local5 = GetMaterialDimensions( f19_local3 )
			f19_local6 = f19_local4 / f19_local5
			f19_local5 = f19_arg0.lootIconHeight
			f19_local4 = f19_local5 * f19_local6
			if f19_arg0.lootIconMaxWidth < f19_local4 then
				f19_local4 = f19_arg0.lootIconMaxWidth
				f19_local5 = f19_local4 / f19_local6
			end
			local f19_local7 = (f19_arg0.lootIconHeight - f19_local5) / 2
			local f19_local8 = {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				left = -f19_local4 / 2,
				top = f19_arg0.lootIconBorder + f19_local7,
				right = f19_local4 / 2,
				bottom = f19_arg0.lootIconBorder + f19_local7 + f19_local5,
				material = f19_local3
			}
			local f19_local9
			if not f19_arg2.hide then
				f19_local9 = 1
				if not f19_local9 then
				
				else
					f19_local8.alpha = f19_local9
					f19_arg0.lootItem:registerAnimationState( "default", f19_local8 )
					if f19_local0.animatedTable ~= nil then
						f19_arg0.lootItem:animateToState( "hide" )
						f19_local8.material = nil
						f19_local8.alpha = 1
						if f19_arg0.animatedLootItem then
							f19_arg0.animatedLootItem:removeElement( f19_arg0.animatedLootItem.animatedCard )
						else
							f19_arg0.animatedLootItem = LUI.UIElement.new( f19_local8 )
							f19_arg0:addElement( f19_arg0.animatedLootItem )
						end
						f19_arg0.animatedLootItem.animatedCard = LUI.Playercard.CreateAnimatedCallingCard( f19_local0.animatedTable, f19_local5 )
						f19_arg0.animatedLootItem:addElement( f19_arg0.animatedLootItem.animatedCard )
					else
						Engine.CacheMaterial( f19_local3 )
						f19_arg0.lootItem:animateToState( "default" )
						if f19_arg0.animatedLootItem then
							f19_arg0:removeElement( f19_arg0.animatedLootItem )
							f19_arg0.animatedLootItem = nil
						end
					end
					f19_arg0.lootName:setText( Engine.ToUpperCase( Engine.Localize( LUI.MPDepotLootCard.GetLootName( f19_local0 ) ) ) )
					f19_arg0.lootCategory:setText( Engine.Localize( LUI.MPDepotLootCard.GetLootCategory( f19_local0 ) ) )
					f19_arg0.lootRarity:setText( Engine.ToUpperCase( Engine.Localize( LUI.MPDepotLootCard.GetRarityText( f19_local1 ) ) ) )
					f19_arg0.lootRarity:registerAnimationState( "setColor", {
						color = LUI.MPDepotLootCard.rarityMaterials[f19_local1].textcolor
					} )
					f19_arg0.lootRarity:animateToState( "setColor", 0 )
					f19_local9 = GetCollectionForItem( f19_local0.guid )
					local f19_local10 = f19_arg0.lootCollection
					local f19_local11 = f19_local10
					f19_local10 = f19_local10.setText
					local f19_local12 = Engine.ToUpperCase
					local f19_local13
					if f19_local9 then
						f19_local13 = f19_local9.name
						if not f19_local13 then
						
						else
							f19_local10( f19_local11, f19_local12( f19_local13 ) )
							if not f19_arg2.hide then
								f19_arg0.lootName:animateToState( "show", 0 )
								f19_arg0.lootCategory:animateToState( "show", 0 )
								f19_arg0.lootRarity:animateToState( "show", 0 )
								f19_arg0.lootCollection:animateToState( "show", 0 )
								if f19_arg0.translation:hasAnimationState( "show" ) then
									f19_arg0.translation:animateToState( "show", 0 )
								end
							end
							f19_arg0.data = f19_local0
						end
					end
					f19_local13 = ""
				end
			end
			f19_local9 = 0
		end
	end
	f19_local6 = 0
end

LUI.MPDepotLootCard.new = function ( f20_arg0 )
	local f20_local0 = f20_arg0.lootData and LUI.MPDepotLootCard.GetLootRarity( f20_arg0.lootData ) or Cac.InventoryItemRarity.Common
	if f20_arg0.lootData then
		local f20_local1 = Cac.GetItemRefName( f20_arg0.lootData.guid )
		local f20_local2 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f20_local1, StatsTable.Cols.ContentPromo )
		local f20_local3 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f20_local1, StatsTable.Cols.ProdLevel )
		if f20_local3 == "LootDrop1" or f20_local3 == "LootDrop2" then
			LUI.MPDepotLootCard.cardBackMaterial = RegisterMaterial( "depot_card_back" )
		elseif f20_local3 == "LootDrop3" or f20_local3 == "LootDrop4" then
			if f20_local2 == "1" then
				LUI.MPDepotLootCard.cardBackMaterial = RegisterMaterial( "depot_card_back_shamrock" )
			else
				LUI.MPDepotLootCard.cardBackMaterial = RegisterMaterial( "depot_card_back_lionstrike" )
			end
		elseif f20_local3 == "LootDrop5" or f20_local3 == "LootDrop6" then
			if f20_local2 == "2" then
				LUI.MPDepotLootCard.cardBackMaterial = RegisterMaterial( "depot_card_back_summer" )
			else
				LUI.MPDepotLootCard.cardBackMaterial = RegisterMaterial( "depot_card_back_copperhead" )
			end
		end
	end
	if not f20_arg0.cardMaterial then
		local f20_local4 = f20_arg0.showCardBack
		local f20_local5 = LUI.MPDepotLootCard.cardBackMaterial
		local f20_local6 = LUI.MPDepotLootCard.GetCardFrontMaterialForRarity( f20_local0 )
	end
	local f20_local1 = f20_local4 and f20_local5 or f20_local6
	local f20_local2, f20_local3 = GetMaterialDimensions( f20_local1 )
	local f20_local7 = f20_local2 / f20_local3
	local f20_local8 = f20_arg0.cardHeight
	if not f20_local8 then
		f20_local8 = LUI.MPDepotLootCard.defaultCardHeight
	end
	local f20_local9 = f20_local8 * f20_local7
	local f20_local10 = f20_arg0.lootIconBorder or f20_local8 * 0.14
	local f20_local11 = f20_arg0.lootIconHeight
	if not f20_local11 then
		f20_local11 = f20_local8 * 0.53 - f20_local10
	end
	local f20_local12 = f20_local9 * 1.1
	local self, self, self, self, self, self, self = nil
	self = LUI.UIElement.new( CoD.CreateState( f20_arg0.left, f20_arg0.top, f20_arg0.right, f20_arg0.bottom, f20_arg0.anchorType ) )
	local f20_local20 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f20_local20.xRot = 0
	f20_local20.yRot = 0
	f20_local20.zRot = 0
	self = LUI.UIElement.new( f20_local20 )
	self:addElement( self )
	local f20_local21 = CoD.CreateState( -f20_local9 * 0.5, -f20_local8 * 0.5, f20_local9 * 0.5, f20_local8 * 0.5, CoD.AnchorTypes.None )
	f20_local21.scale = 0
	self = LUI.UIElement.new( f20_local21 )
	self:addElement( self )
	if not f20_arg0.noVerticalGlow then
		local f20_local22 = RegisterMaterial( "depot_glow_vertical" )
		local f20_local23, f20_local24 = GetMaterialDimensions( f20_local22 )
		f20_local24 = f20_local24 / f20_local23 * f20_local9 * 2
		f20_local23 = f20_local9 * 2
		self = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = -f20_local23 / 2,
			top = -f20_local24 / 4,
			right = f20_local23 / 2,
			height = f20_local24,
			material = f20_local22,
			color = {
				r = 0,
				g = 0,
				b = 0
			}
		} )
		self:setPriority( -1000 )
		self:registerAnimationState( "glow_strong", {
			color = LUI.MPDepotLootCard.rarityMaterials[f20_local0].glowcolor
		} )
		self:registerAnimationState( "glow_soft", {
			color = {
				r = LUI.MPDepotLootCard.rarityMaterials[f20_local0].glowcolor.r * 0.75,
				g = LUI.MPDepotLootCard.rarityMaterials[f20_local0].glowcolor.g * 0.75,
				b = LUI.MPDepotLootCard.rarityMaterials[f20_local0].glowcolor.b * 0.75
			}
		} )
		if not f20_arg0.noVerticalGlowPulse then
			self:animateInLoop( {
				{
					"glow_strong",
					500
				},
				{
					"glow_soft",
					1500
				}
			}, nil, nil, true, true )
		end
		f0_local6( self, {
			self,
			self,
			self
		} )
	end
	if not f20_arg0.noSoftGlow then
		local f20_local22 = RegisterMaterial( "depot_card_back_soft_glow" )
		local f20_local23, f20_local24 = GetMaterialDimensions( f20_local22 )
		f20_local24 = f20_local24 / f20_local3 * f20_local8 * 1.1
		f20_local23 = f20_local23 / f20_local2 * f20_local9 * 1.1
		self = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = (f20_local9 - f20_local23) / 2,
			top = (f20_local8 - f20_local24) / 2,
			right = (f20_local23 - f20_local9) / 2,
			bottom = (f20_local24 - f20_local8) / 2,
			material = f20_local22,
			color = LUI.MPDepotLootCard.rarityMaterials[f20_local0].glowcolor,
			alpha = 0
		} )
		self:setPriority( -1000 )
		self:registerAnimationState( "glow_strong", {
			alpha = 0.6
		} )
		self:registerAnimationState( "glow_soft", {
			alpha = 0.3
		} )
		if not f20_arg0.noSoftGlowPulse and f20_arg0.lootData then
			self:animateInLoop( {
				{
					"glow_strong",
					500
				},
				{
					"glow_soft",
					1500
				}
			}, nil, nil, true, true )
		end
		f0_local6( self, {
			self,
			self,
			self,
			self
		} )
	end
	if (LUI.MPDepotLootCard.rarityMaterials[f20_local0].border or not f20_arg0.lootData) and not f20_arg0.noCardBorder then
		local f20_local22, f20_local23 = GetMaterialDimensions( LUI.MPDepotLootCard.rarityMaterials[f20_local0].border.mat )
		local f20_local24 = (f20_local2 - f20_local22) * f20_local9 / f20_local2
		local f20_local25 = (f20_local3 - f20_local23) * f20_local8 / f20_local3
		local f20_local26 = {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			left = f20_local24 / 2,
			top = f20_local25 / 2,
			right = -f20_local24 / 2,
			bottom = -f20_local25 / 2
		}
		local f20_local27
		if not f20_arg0.lootData then
			f20_local27 = RegisterMaterial( "ui_invisible" )
			if not f20_local27 then
			
			else
				f20_local26.material = f20_local27
				f20_local26.alpha = 0
				self = LUI.UIImage.new( f20_local26 )
				self:registerAnimationState( "show", {
					alpha = 1
				} )
				self:registerAnimationState( "dim", {
					alpha = 0.5
				} )
				f0_local6( self, {
					self,
					self,
					self,
					self,
					self
				} )
			end
		end
		f20_local27 = LUI.MPDepotLootCard.rarityMaterials[f20_local0].border.mat
	end
	local f20_local22 = nil
	if self then
		f20_local22 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	else
		f20_local22 = CoD.CreateState( f20_arg0.left, f20_arg0.top, f20_arg0.right, f20_arg0.bottom, f20_arg0.anchorType )
	end
	f20_local22.material = f20_local1
	self = LUI.UIImage.new( f20_local22 )
	self:setPriority( 1000 )
	self:registerAnimationState( "showFront", {
		material = LUI.MPDepotLootCard.GetCardFrontMaterialForRarity( f20_local0 )
	} )
	self:registerAnimationState( "showBack", {
		material = LUI.MPDepotLootCard.cardBackMaterial
	} )
	f0_local6( self, {
		self,
		self,
		self,
		self,
		self,
		self
	} )
	local f20_local23 = RegisterMaterial( "depot_card_selected" )
	local f20_local24, f20_local25 = GetMaterialDimensions( f20_local23 )
	local f20_local26 = (f20_local2 - f20_local24) * f20_local9 / f20_local2 * 1.8
	local f20_local27 = f20_local26 * f20_local25 / f20_local24 * 0.75
	local f20_local28 = 2
	local f20_local29 = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = f20_local26 / 2 * f20_local28,
		top = f20_local27 / 2 * f20_local28,
		right = -f20_local26 / 2 * f20_local28,
		bottom = -f20_local27 / 2 * f20_local28,
		material = f20_local23,
		alpha = 0
	}
	self.cardSelection = LUI.UIImage.new( f20_local29 )
	self.cardSelection:setPriority( 1001 )
	f20_local29.left = f20_local26 / 2
	f20_local29.top = f20_local27 / 2
	f20_local29.right = -f20_local26 / 2
	f20_local29.bottom = -f20_local27 / 2
	f20_local29.alpha = 1
	self.cardSelection:registerAnimationState( "show", f20_local29 )
	f0_local6( self.cardSelection, {
		self,
		self,
		self,
		self,
		self
	} )
	if (LUI.MPDepotLootCard.rarityMaterials[f20_local0].flare or not f20_arg0.lootData) and not f20_arg0.noFlare then
		local f20_local30 = GetMaterialDimensions
		local f20_local31 = LUI.MPDepotLootCard.rarityMaterials[f20_local0].flare and LUI.MPDepotLootCard.rarityMaterials[f20_local0].flare.mat or LUI.MPDepotLootCard.rarityMaterials[Cac.InventoryItemRarity.Epic].flare.mat
		local f20_local30, f20_local32 = f20_local30( f20_local31 )
		local f20_local33 = f20_local9 / 2
		local f20_local34 = f20_local33 * f20_local31 / f20_local31
		local f20_local35 = -f20_local34 * 0.5
		local f20_local36 = {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			left = (f20_local9 - f20_local33) / 2,
			top = f20_local35,
			right = (f20_local33 - f20_local9) / 2,
			bottom = f20_local35 + f20_local34
		}
		local f20_local37
		if not f20_arg0.lootData then
			f20_local37 = RegisterMaterial( "ui_invisible" )
			if not f20_local37 then
			
			else
				f20_local36.material = f20_local37
				f20_local36.color = {
					r = 1,
					g = 1,
					b = 1
				}
				self.cardFlare = LUI.UIImage.new( f20_local36 )
				self.cardFlare:registerAnimationState( "collapse", {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = false,
					bottomAnchor = true,
					left = f20_local9 / 2,
					top = 0,
					right = -f20_local9 / 2,
					bottom = 0,
					color = {
						r = 0.5,
						g = 0.5,
						b = 0.5
					}
				} )
				self.cardFlare:registerAnimationState( "glow_strong", {
					color = {
						r = 1,
						g = 1,
						b = 1
					}
				} )
				self.cardFlare:registerAnimationState( "glow_soft", {
					color = {
						r = 0.5,
						g = 0.5,
						b = 0.5
					}
				} )
				self.cardFlare:registerAnimationState( "hide", {
					color = {
						r = 0,
						g = 0,
						b = 0
					}
				} )
				self:addElement( self.cardFlare )
			end
		end
		f20_local37 = LUI.MPDepotLootCard.rarityMaterials[f20_local0].flare.mat
	end
	local f20_local30 = RegisterMaterial( "depot_card_item_backing" )
	local f20_local31, f20_local33 = GetMaterialDimensions( f20_local30 )
	f20_local31 = f20_local31 / f20_local33 * f20_local11
	f20_local33 = f20_local11
	self.lootItemBG = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = -f20_local31 / 2,
		top = f20_local10,
		right = f20_local31 / 2,
		bottom = f20_local10 + f20_local33,
		material = f20_local30,
		alpha = 0
	} )
	self.lootItemBG:registerAnimationState( "show", {
		alpha = 1
	} )
	self:addElement( self.lootItemBG )
	if not f20_arg0.showCardBack and f20_local0 ~= Cac.InventoryItemRarity.Reward then
		self.lootItemBG:animateToState( "show", 0 )
	end
	if f20_arg0.addRevealBurstContainer then
		local f20_local35, f20_local36 = GetMaterialDimensions( RegisterMaterial( "card_reveal_burst_rays" ) )
		f20_local35 = f20_local35 / f20_local36 * f20_local11 * 2.5
		f20_local36 = f20_local11 * 2.5
		local f20_local37 = f20_local10 + f20_local33 / 2 - f20_local8 / 2
		self.revealBurstContainer = LUI.UIElement.new( {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			left = -f20_local35 / 2,
			top = f20_local37 - f20_local36 / 2,
			right = f20_local35 / 2,
			bottom = f20_local37 + f20_local36 / 2,
			scale = 0,
			alpha = 1
		} )
		self.revealBurstContainer:registerAnimationState( "shrunk", {
			scale = -1
		} )
		self.revealBurstContainer:animateToState( "shrunk" )
		self.revealBurstContainer:setPriority( 75 )
		self:addElement( self.revealBurstContainer )
	end
	local f20_local34 = LUI.MPDepotLootCard.GetLootImage( f20_arg0.lootData )
	Engine.CacheMaterial( f20_local34 )
	local f20_local35, f20_local36 = GetMaterialDimensions( f20_local34 )
	local f20_local37 = f20_local35 / f20_local36
	f20_local36 = f20_local11
	f20_local35 = f20_local36 * f20_local37
	if f20_local12 < f20_local35 then
		f20_local35 = f20_local12
		f20_local36 = f20_local35 / f20_local37
	end
	local f20_local38 = (f20_local11 - f20_local36) / 2
	local f20_local39 = {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = -f20_local35 / 2,
		top = f20_local10 + f20_local38,
		right = f20_local35 / 2,
		bottom = f20_local10 + f20_local38 + f20_local36,
		material = f20_local34,
		alpha = 1
	}
	local f20_local40 = CoD.CreateState( 0, f20_local10 + f20_local38 + f20_local36 / 2, 0, f20_local10 + f20_local38 + f20_local36 / 2, CoD.AnchorTypes.Top )
	f20_local40.alpha = 1
	self.lootItem = LUI.UIImage.new( f20_local39 )
	self.lootItem.defaultState = f20_local39
	self.lootItem:registerAnimationState( "shrunk", f20_local40 )
	self.lootItem:registerAnimationState( "show", {
		alpha = 1
	} )
	self.lootItem:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.lootItem:setPriority( 100 )
	self:addElement( self.lootItem )
	if not f20_arg0.showCardBack then
		self.lootItem:animateToState( "show", 0 )
	else
		self.lootItem:animateToState( "hide", 0 )
	end
	if f20_arg0.isSetReward then
		local f20_local41 = LUI.MPDepotLootCard.MakeLockWithBkg( {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			alpha = 0
		} )
		f20_local41:registerAnimationState( "show", {
			alpha = 1
		} )
		local self = LUI.UIElement.new( f20_local39 )
		self:setPriority( 200 )
		self:addElement( f20_local41 )
		self:addElement( self )
		self.lock = f20_local41
		local f20_local43 = 64
		local f20_local44 = -f20_local43 / 2 + 6
		local self = LUI.UIImage.new( {
			topAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			top = f20_local44,
			left = f20_local44,
			width = f20_local43,
			height = f20_local43,
			material = RegisterMaterial( "collection_reward_locked" )
		} )
		self:registerAnimationState( "earned", {
			material = RegisterMaterial( "collection_reward_complete" )
		} )
		self:addElement( self )
		self.earnedIcon = self
	end
	if f20_arg0.lootData and f20_arg0.lootData.animatedTable then
		self.lootItem:animateToState( "hide" )
		f20_local39.material = nil
		f20_local39.alpha = 1
		self.animatedLootItem = LUI.UIElement.new( f20_local39 )
		self.animatedLootItem.animatedCard = LUI.Playercard.CreateAnimatedCallingCard( f20_arg0.lootData.animatedTable, f20_local36 )
		self.animatedLootItem:addElement( self.animatedLootItem.animatedCard )
		self:addElement( self.animatedLootItem )
	elseif self.animatedLootItem then
		self:removeElement( self.animatedLootItem )
	end
	local f20_local46 = f20_local9 * 0.2
	local f20_local41 = f20_local8 * 0.1
	local self = f20_arg0.lootNameTextHeight or 15
	self.lootName = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = f20_local46,
		top = f20_local8 / 2 + f20_local41,
		right = -f20_local46,
		bottom = f20_local8 / 2 + f20_local41 + self,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center,
		color = {
			r = 1,
			g = 1,
			b = 1
		},
		alpha = 0
	} )
	self.lootName:registerAnimationState( "show", {
		alpha = 1
	} )
	self.lootName:registerAnimationState( "noScale", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		top = f20_local8 / 2 + f20_local41,
		right = 0,
		height = self
	} )
	self:addElement( self.lootName )
	self.lootName:setText( Engine.ToUpperCase( LUI.MPDepotLootCard.GetLootName( f20_arg0.lootData ) ) )
	self.lootName:setupAutoScaleText()
	f20_local41 = f20_local41 * 0.5
	local f20_local43 = f20_arg0.lootCategoryTextHeight or 10
	self.lootCategory = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 0,
		top = f20_local41 / 2,
		right = 0,
		bottom = f20_local41 / 2 + f20_local43,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center,
		color = {
			r = 1,
			g = 1,
			b = 1
		},
		alpha = 0
	} )
	self.lootCategory:registerAnimationState( "show", {
		alpha = 1
	} )
	self.lootCategory:registerAnimationState( "noScale", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		top = f20_local41 / 2,
		right = 0,
		height = f20_local43
	} )
	self.lootName:addElement( self.lootCategory )
	self.lootCategory:setText( LUI.MPDepotLootCard.GetLootCategory( f20_arg0.lootData ) )
	self.lootCategory:setupAutoScaleText()
	local f20_local44 = f20_arg0.lootRarityTextHeight or 20
	self.lootRarity = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 0,
		top = -f20_local10 * 0.75 - f20_local44,
		right = 0,
		bottom = -f20_local10 * 0.75,
		font = CoD.TextSettings.TitleFontTinyBold.Font,
		alignment = LUI.Alignment.Center,
		color = LUI.MPDepotLootCard.rarityMaterials[f20_local0].textcolor,
		alpha = 0
	} )
	self.lootRarity:registerAnimationState( "show", {
		alpha = 1
	} )
	self.lootRarity:registerAnimationState( "noScale", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		left = 0,
		bottom = -f20_local10 / 2,
		right = 0,
		height = f20_local44
	} )
	self:addElement( self.lootRarity )
	self.lootRarity:setText( Engine.ToUpperCase( Engine.Localize( LUI.MPDepotLootCard.GetRarityText( f20_local0 ) ) ) )
	self.lootRarity:setupAutoScaleText()
	f20_local41 = f20_local8 * 0.08
	local self = f20_arg0.lootCollectionTextHeight or 10
	self.lootCollection = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = f20_local46,
		top = f20_local41,
		right = -f20_local46,
		bottom = f20_local41 + self,
		font = CoD.TextSettings.TitleFontTinyBold.Font,
		alignment = LUI.Alignment.Center,
		color = {
			r = 1,
			g = 1,
			b = 1
		},
		alpha = 0
	} )
	self.lootCollection:registerAnimationState( "show", {
		alpha = 1
	} )
	self.lootCollection:registerAnimationState( "noScale", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		top = f20_local41,
		right = 0,
		height = self
	} )
	self:addElement( self.lootCollection )
	self.lootCollection:setupAutoScaleText()
	if f20_arg0.lootData then
		local f20_local47 = GetCollectionForItem( f20_arg0.lootData.guid )
		local f20_local48 = self.lootCollection
		local f20_local49 = f20_local48
		f20_local48 = f20_local48.setText
		local f20_local50 = Engine.ToUpperCase
		local f20_local51
		if f20_local47 then
			f20_local51 = f20_local47.name
			if not f20_local51 then
			
			else
				f20_local48( f20_local49, f20_local50( f20_local51 ) )
			end
		end
		f20_local51 = ""
	end
	if f20_arg0.noScaleText then
		self.lootName:animateToState( "noScale", 0 )
		self.lootCategory:animateToState( "noScale", 0 )
		self.lootRarity:animateToState( "noScale", 0 )
		self.lootCollection:animateToState( "noScale", 0 )
	end
	if f20_arg0.addGlitch then
		self.glitch = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = f20_local10 * 0.6,
			top = f20_local10 * 0.3,
			right = -f20_local10 * 0.6,
			bottom = f20_local10 * 0.3 + f20_local8 * 0.6,
			alpha = 0
		} )
		self.glitch:setPriority( 50 )
		self:addElement( self.glitch )
	end
	self.translation = self
	self.rotation = self
	self.scale = self
	self.cardBorder = self
	self.verticalGlow = self
	self.softGlow = self
	self.lootIconBorder = f20_local10
	self.lootIconHeight = f20_local11
	self.lootIconMaxWidth = f20_local12
	self.data = f20_arg0.lootData
	if f20_arg0.id then
		self.id = f20_arg0.id
		self.translation.id = self.id .. "_translation"
		self.rotation.id = self.id .. "_rotation"
		self.scale.id = self.id .. "_scale"
	end
	if not f20_arg0.lootData then
		self:registerAnimationState( "hide", {
			alpha = 0
		} )
		self:registerAnimationState( "show", {
			alpha = 1
		} )
		self:animateToState( "hide" )
	end
	return {
		rootElem = self,
		card = self
	}
end

