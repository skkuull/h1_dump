local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotArmory = InheritFrom( LUI.MPDepotBase )
LUI.MPDepotArmory.ContextTitles = {
	weapons = "@DEPOT_RECENT_WEAPONS",
	attachment_kits = "@DEPOT_RECENT_ATTACHMENTS",
	weapon_kits = "@DEPOT_RECENT_WEAPON_KITS",
	weapon_camos = "@DEPOT_RECENT_WEAPON_CAMOS",
	reticles = "@DEPOT_RECENT_RETICLES",
	characters = "@DEPOT_RECENT_CHARACTERS",
	character_camos = "@DEPOT_RECENT_CHARACTER_CAMOS",
	calling_cards = "@DEPOT_RECENT_CALLING_CARDS",
	emblems = "@DEPOT_RECENT_EMBLEMS"
}
LUI.MPDepotArmory.RecentItemsMap = {
	collected = 0,
	weapons = 1,
	attachment_kits = 3,
	weapon_kits = 2,
	weapon_camos = 4,
	reticles = 5,
	characters = 6,
	character_camos = 7,
	calling_cards = 8,
	emblems = 9
}
LUI.MPDepotArmory.EmptyTitles = {
	collected = "@DEPOT_RECENTLY_COLLECTED_EMPTY",
	weapons = "@DEPOT_RECENT_WEAPONS_EMPTY",
	attachment_kits = "@DEPOT_RECENT_ATTACHMENTS_EMPTY",
	weapon_kits = "@DEPOT_RECENT_WEAPON_KITS_EMPTY",
	weapon_camos = "@DEPOT_RECENT_WEAPON_CAMOS_EMPTY",
	reticles = "@DEPOT_RECENT_RETICLES_EMPTY",
	characters = "@DEPOT_RECENT_CHARACTERS_EMPTY",
	character_camos = "@DEPOT_RECENT_CHARACTER_CAMOS_EMPTY",
	calling_cards = "@DEPOT_RECENT_CALLING_CARDS_EMPTY",
	emblems = "@DEPOT_RECENT_EMBLEMS_EMPTY"
}
f0_local0 = 190
f0_local1 = function ( f1_arg0 )
	local f1_local0 = {
		left = 0,
		top = 0,
		right = 134.58,
		bottom = f0_local0,
		anchorType = CoD.AnchorTypes.TopLeft,
		showCardBack = false,
		cardHeight = f0_local0,
		addGlitch = false,
		noVerticalGlowPulse = true,
		noFlare = true,
		lootNameTextHeight = 12,
		lootCategoryTextHeight = 8,
		lootRarityTextHeight = 16,
		lootCollectionTextHeight = 8
	}
	for f1_local1 = 1, 5, 1 do
		local f1_local4 = f1_local1
		local f1_local5 = LUI.MPDepotLootCard.new( f1_local0 )
		f1_local5.rootElem.card = f1_local5.card
		f1_arg0:addElement( f1_local5.rootElem )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = false
	f2_arg0.list:closeChildren()
	f0_local1( f2_arg0.list )
	local f2_local1 = f2_arg0.list:getFirstChild()
	if not f2_local1 then
		return 
	end
	local f2_local2 = 1
	local f2_local3 = LUI.MPDepotArmory.RecentItemsMap[f2_arg1]
	while f2_local1 do
		local f2_local4 = Engine.GetPlayerDataRecentUnlocks( f2_arg2, CoD.StatsGroup.Ranked, "recentInventoryTypes", f2_local3, "recentItems", f2_local2 - 1 )
		if not f2_local0 then
			if f2_local4 == nil or f2_local4 == "" then
				f2_local0 = false
			else
				f2_local0 = true
			end
		end
		LUI.MPDepotLootCard.SetItem( f2_local1.card, f2_local4 )
		f2_local1 = f2_local1:getNextSibling()
		f2_local2 = f2_local2 + 1
	end
	if f2_local0 then
		f2_arg0.emptyText:animateToState( "default", 0 )
	else
		f2_arg0.emptyText:setText( Engine.Localize( LUI.MPDepotArmory.EmptyTitles[f2_arg1] ) )
		f2_arg0.emptyText:animateToState( "visible", 0 )
	end
	f2_arg0.list:setLayoutCached( false )
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.contextTitle:setText( Engine.Localize( LUI.MPDepotArmory.ContextTitles[f3_arg1] ) )
	f0_local2( f3_arg0.contextContainer, f3_arg1, f3_arg2 )
end

local f0_local4 = function ()
	return LUI.UIHorizontalList.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 200,
		spacing = 30,
		top = 0
	} )
end

function MPDepotArmoryMenu( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1 or {}
	f5_local0.menu_title = "@DEPOT_ARMORY"
	local f5_local1 = LUI.MPDepotBase.new( f5_arg0, f5_local0, 2 )
	f5_local1:setClass( LUI.MPDepotArmory )
	f5_local1:AddHelp( LUI.ButtonHelperText.CommonEvents.addOnboardingButton, function ( f6_arg0, f6_arg1 )
		LUI.OnboardingPopups.All( {
			controller = f5_arg1.exclusiveController
		} )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	f5_local1:AddListDivider()
	for f5_local2 = 1, #LUI.MPLootDropsBase.LootType, 1 do
		local f5_local5 = f5_local2
		local f5_local6 = f5_local1:AddButtonWithInfo( LUI.MPLootDropsBase.LootType[f5_local5] .. "Button", LUI.MPLootDropsBase.MenuInfo[LUI.MPLootDropsBase.LootType[f5_local5]].title, {
			menu_name = "MPLootDropsBase",
			loot_type = LUI.MPLootDropsBase.LootType[f5_local5],
			fromDepot = true
		} )
		f5_local6:registerEventHandler( "button_over", function ( element, event )
			f0_local3( f5_local1, LUI.MPLootDropsBase.LootType[f5_local5], f5_arg1.exclusiveController )
		end )
	end
	local f5_local2 = f5_local1:AddButton( "@DEPOT_CALLING_CARDS", "CallingCardMenuFromDepot" )
	f5_local2:registerEventHandler( "button_over", function ( element, event )
		f0_local3( f5_local1, "calling_cards", f5_arg1.exclusiveController )
	end )
	f5_local2 = f5_local1:AddButton( "@DEPOT_EMBLEMS", "EmblemMenuFromDepot" )
	f5_local2:registerEventHandler( "button_over", function ( element, event )
		f0_local3( f5_local1, "emblems", f5_arg1.exclusiveController )
	end )
	f5_local1:CreateBottomDivider()
	f5_local1:AddBottomDividerToList()
	local f5_local3, f5_local4, f5_local5, f5_local6 = f5_local1.list:getLocalRect()
	local f5_local7 = LUI.H1ButtonBackground.ButtonHeight
	local f5_local8 = f0_local0
	local f5_local9 = f5_local4 + f5_local8 + f5_local7
	local self = LUI.UIElement.new( CoD.CreateState( f5_local5 + f5_local7, f5_local4, -f5_local7, f5_local9, CoD.AnchorTypes.TopLeftRight ) )
	f5_local1:addElement( self )
	local f5_local11 = CoD.CreateState( 0, 0, 0, 12, CoD.AnchorTypes.TopLeftRight )
	f5_local11.font = CoD.TextSettings.BodyFontVeryTiny.Font
	f5_local11.horizontalAlignment = LUI.HorizontalAlignment.Left
	f5_local11.verticalAlignment = LUI.VerticalAlignment.Middle
	f5_local11.color = Colors.primary_text_color
	local self = LUI.UIText.new( f5_local11 )
	self:setText( Engine.Localize( "@DEPOT_RECENTLY_COLLECTED" ) )
	self:addElement( self )
	local f5_local13 = CoD.CreateState( 0, 15, nil, nil, CoD.AnchorTypes.TopLeft )
	f5_local13.width = 30
	f5_local13.height = 1
	f5_local13.material = RegisterMaterial( "white" )
	f5_local13.color = Colors.mw1_green
	self:addElement( LUI.UIImage.new( f5_local13 ) )
	local f5_local14 = 30
	local f5_local15 = CoD.CreateState( 0, f5_local14, 0, f5_local14 + f5_local8, CoD.AnchorTypes.TopLeftRight )
	local self = LUI.UIElement.new( f5_local15 )
	self:addElement( self )
	local f5_local17 = CoD.CreateState( 100, -7, 1000, 7, CoD.AnchorTypes.Left )
	f5_local17.font = CoD.TextSettings.BodyFontVeryTiny.Font
	f5_local17.horizontalAlignment = LUI.HorizontalAlignment.Left
	f5_local17.verticalAlignment = LUI.VerticalAlignment.Middle
	f5_local17.color = Colors.h1.light_grey
	f5_local17.alpha = 0
	local self = LUI.UIText.new( f5_local17 )
	self:registerAnimationState( "visible", {
		alpha = 0.5
	} )
	self:addElement( self )
	
	local list = f0_local4()
	self:addElement( list )
	self.list = list
	
	self.emptyText = self
	f0_local2( self, "collected", f5_arg1.exclusiveController )
	local f5_local20 = f5_local9 + 30
	local self = LUI.UIElement.new( CoD.CreateState( f5_local5 + f5_local7, f5_local20, -f5_local7, f5_local20 + f5_local8 + f5_local7, CoD.AnchorTypes.TopLeftRight ) )
	f5_local1:addElement( self )
	local self = LUI.UIText.new( f5_local11 )
	self:setText( "" )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( f5_local13 ) )
	local self = LUI.UIElement.new( f5_local15 )
	self:addElement( self )
	local self = LUI.UIText.new( f5_local17 )
	self:registerAnimationState( "visible", {
		alpha = 0.5
	} )
	self:addElement( self )
	
	local list = f0_local4()
	self:addElement( list )
	self.list = list
	
	self.emptyText = self
	f5_local1.contextTitle = self
	f5_local1.contextContainer = self
	local f5_local26 = CoD.CreateState( 0, nil, 250, -195, CoD.AnchorTypes.BottomLeft )
	f5_local26.height = 12
	f5_local26.alpha = 1
	f5_local26.color = Colors.mw1_green
	f5_local26.font = CoD.TextSettings.TitleFontMediumLarge.Font
	f5_local26.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	local self = LUI.UIText.new( f5_local26 )
	self:setText( Engine.Localize( "@DEPOT_BROWSE_ARMORY_INVENTORY" ) )
	f5_local1:addElement( self )
	SetDepotState( self, {
		state = "pause"
	} )
	return f5_local1
end

LUI.MenuBuilder.registerType( "MPDepotArmoryMenu", MPDepotArmoryMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "MPDepotArmoryMenu", PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
