local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AARNewUnlocks = InheritFrom( LUI.UIElement )
f0_local0 = nil
f0_local1 = {
	[LUI.InventoryUtils.UnlockTypes.WEAPON] = StatsTable,
	[LUI.InventoryUtils.UnlockTypes.PERK] = PerkTable,
	[LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO] = CamoTable,
	[LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHMENT] = AttachKitTable
}
f0_local2 = {
	darkmatter = true,
	diamond = true,
	camo085 = true,
	camo086 = true,
	wc_stpatty_01 = true,
	wc_stpatty_02 = true
}
local f0_local3 = {
	[LUI.InventoryUtils.UnlockTypes.FEATURE] = {
		numOfElements = 6,
		feature_demolitions = "@LUA_MENU_DEMOLITIONS_UNLOCKED",
		feature_sniper = "@LUA_MENU_SNIPER_UNLOCKED",
		feature_cac = "@LUA_MENU_CAC_UNLOCKED",
		feature_challenges = "@LUA_MENU_CHALLENGES_UNLOCKED",
		feature_weapon_emblem = "@LUA_MENU_WEAPON_EMBLEMS_UNLOCKED",
		feature_character_emblem = "@LUA_MENU_CHARACTER_EMBLEMS_UNLOCKED"
	},
	[LUI.InventoryUtils.UnlockTypes.PROFILE_FEATURE] = {
		numOfElements = 1,
		clantag = "@LUA_MENU_CLANTAG_UNLOCKED"
	},
	[LUI.InventoryUtils.UnlockTypes.TITLE] = "@LUA_MENU_CALLING_CARD_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.ICON] = "@LUA_MENU_EMBLEM_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.KILLSTREAK] = "@LUA_MENU_KILLSTREAK_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.PRESTIGE] = "@LUA_MENU_PRESTIGE_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT] = "@LUA_MENU_WEAPON_ATTACH_KIT_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.WEAPON_FURNITUREKIT] = "@LUA_MENU_WEAPON_FURNITURE_KIT_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.WEAPON_BUFF] = "@LUA_MENU_WEAPON_BUFF_UNLOCKED",
	[LUI.InventoryUtils.UnlockTypes.WEAPON_RETICLE] = "@LUA_MENU_WEAPON_RETICLE_UNLOCKED"
}
function ParseImageLookups( f1_arg0 )
	return Engine.TableLookup( f1_arg0.lookupTable.File, f1_arg0.lookupTable.Cols.Ref, string.sub( f1_arg0.itemId, string.find( f1_arg0.itemId, " " ) + 1, string.len( f1_arg0.itemId ) ), f1_arg0.lookupTable.Cols.Image )
end

function ParseAndTranslateItemIdLookups( f2_arg0 )
	local f2_local0 = string.find( f2_arg0.itemId, " " )
	local f2_local1 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, string.sub( f2_arg0.itemId, 1, f2_local0 - 1 ), StatsTable.Cols.Name )
	local f2_local2 = string.sub( f2_arg0.itemId, f2_local0 + 1, string.len( f2_arg0.itemId ) )
	local f2_local3 = Engine.TableLookup( f2_arg0.lookupTable.File, f2_arg0.lookupTable.Cols.Ref, f2_local2, f2_arg0.lookupTable.Cols.Name )
	local f2_local4 = nil
	if f0_local2[f2_local2] then
		f2_local4 = Engine.Localize( f2_local3 )
	else
		f2_local4 = Engine.ToUpperCase( Engine.Localize( f2_local1 ) .. " " .. Engine.Localize( f2_local3 ) )
	end
	return f2_local4
end

function GenerateUnlockedCards()
	local f3_local0 = AAR.GetItemsUnlockedLastGame( f0_local0 )
	local f3_local1 = {}
	local f3_local2 = {}
	for f3_local3 = 1, #f3_local0, 1 do
		local f3_local6 = f3_local0[f3_local3]
		if f3_local6.Type == LUI.InventoryUtils.UnlockTypes.CHALLENGE then
			local f3_local7 = string.sub( f3_local6.ItemId, 1, 4 )
			local f3_local8 = {}
			if f3_local7 == "tier" then
				local f3_local9 = Engine.TableLookupGetRowNum( ChallengeTable.File, ChallengeTable.Cols.Tier, f3_local6.ItemId )
				local f3_local10 = Engine.TableGetRowCount( ChallengeTable.File )
				while f3_local9 and f3_local9 < f3_local10 and f3_local9 > 0 do
					if Engine.TableLookupByRow( ChallengeTable.File, f3_local9, ChallengeTable.Cols.Tier ) ~= f3_local6.ItemId then
						break
					end
					table.insert( f3_local8, Engine.TableLookupByRow( ChallengeTable.File, f3_local9, ChallengeTable.Cols.Name ) )
					f3_local9 = Engine.TableLookupGetRowNum( ChallengeTable.File, ChallengeTable.Cols.Tier, f3_local6.ItemId, f3_local9 - 1 )
				end
			else
				local f3_local9 = f3_local6.ItemId
				local f3_local11 = string.find( f3_local9, "_", string.find( f3_local9, "_" ) + 1 )
				local f3_local12 = string.find( f3_local9, "_", f3_local11 + 1 )
				if f3_local12 then
					f3_local9 = string.sub( f3_local9, 1, f3_local12 - 1 )
				end
				table.insert( f3_local8, Engine.TableLookup( ChallengeTable.File, ChallengeTable.Cols.RefName, string.sub( f3_local9, 1, f3_local11 ) .. "h1_" .. string.sub( f3_local9, f3_local11 + 1, -1 ), ChallengeTable.Cols.Name ) )
			end
			for f3_local9 = 1, #f3_local8, 1 do
				table.insert( f3_local2, {
					Rank = f3_local6.Rank,
					Type = f3_local6.Type,
					ItemId = f3_local8[f3_local9],
					translatedName = Engine.Localize( "@LUA_MENU_CHALLENGE_CONCAT", Engine.ToUpperCase( Engine.Localize( f3_local8[f3_local9] ) ), Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CHALLENGE_UNLOCKED" ) ) )
				} )
			end
		end
		table.insert( f3_local2, f3_local6 )
	end
	for f3_local3 = 1, #f3_local2, 1 do
		local f3_local6 = f3_local2[f3_local3]
		local f3_local7 = LUI.AARGrid.GenericUnlockCard()
		local f3_local8 = f0_local1[f3_local6.Type]
		local f3_local9 = LUI.AARGrid.UnlockedCardWidth / 2
		local f3_local10 = f3_local6.ItemId
		local f3_local11 = 0
		if f3_local8 then
			if f3_local6.Type == LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO or f3_local6.Type == LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHMENT then
				f3_local10 = ParseImageLookups( {
					itemId = f3_local6.ItemId,
					lookupTable = f3_local8
				} )
			else
				f3_local10 = Engine.TableLookup( f3_local8.File, f3_local8.Cols.Ref, f3_local6.ItemId, f3_local8.Cols.Image )
			end
		elseif f3_local6.Type == LUI.InventoryUtils.UnlockTypes.CHALLENGE or f3_local6.Type == LUI.InventoryUtils.UnlockTypes.FEATURE or f3_local6.Type == LUI.InventoryUtils.UnlockTypes.PROFILE_FEATURE then
			f3_local10 = "h1_ui_icon_unlocked"
			f3_local11 = -0.35
		end
		local f3_local12 = RegisterMaterial( f3_local10 )
		Engine.CacheMaterial( f3_local12 )
		local f3_local13, f3_local14 = GetMaterialDimensions( f3_local12 )
		local f3_local15 = f3_local13 / f3_local14
		local f3_local16 = 79
		local f3_local17
		if f3_local13 ~= f3_local14 then
			f3_local17 = f3_local9 * 1.8
			if not f3_local17 then
			
			else
				local f3_local18
				if f3_local13 ~= f3_local14 then
					f3_local18 = f3_local17 / f3_local15
					if not f3_local18 then
					
					else
						local f3_local19 = 22
						local f3_local20
						if f3_local18 < f3_local16 then
							f3_local20 = (f3_local16 - f3_local18) / 2 + f3_local19
							if not f3_local20 then
							
							else
								local f3_local21 = CoD.CreateState( nil, f3_local20, nil, nil, CoD.AnchorTypes.Top )
								f3_local21.height = f3_local18
								f3_local21.width = f3_local17
								f3_local21.scale = f3_local11
								local f3_local22 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Image, f3_local10, CallingCardTable.Cols.AnimatedTable )
								if f3_local22 ~= nil and f3_local22 ~= "" then
									local f3_local23 = LUI.Playercard.CreateAnimatedCallingCard( f3_local22 )
									f3_local23:registerAnimationState( "init", f3_local21 )
									f3_local23:animateToState( "init" )
									if f3_local23 then
										f3_local7:addElement( f3_local23 )
									end
								else
									f3_local21.material = f3_local12
									f3_local7:addElement( LUI.UIImage.new( f3_local21 ) )
								end
								local f3_local23 = ""
								local f3_local24 = nil
								local f3_local25 = f0_local3[f3_local6.Type]
								if f3_local25 then
									local f3_local26 = f3_local25.numOfElements
								end
								if f3_local6.Type == LUI.InventoryUtils.UnlockTypes.CHALLENGE then
									f3_local24 = f3_local6.translatedName
								elseif f3_local8 then
									if f3_local6.Type == LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO or f3_local6.Type == LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHMENT then
										f3_local24 = ParseAndTranslateItemIdLookups( {
											itemId = f3_local6.ItemId,
											lookupTable = f3_local8
										} )
									else
										f3_local23 = Engine.TableLookup( f3_local8.File, f3_local8.Cols.Ref, f3_local6.ItemId, f3_local8.Cols.Name )
									end
								elseif f3_local25 and f3_local25.numOfElements then
									f3_local23 = f3_local25[f3_local6.ItemId]
								else
									f3_local23 = f3_local25
								end
								if not f3_local24 then
									f3_local24 = Engine.ToUpperCase( Engine.Localize( f3_local23 ) )
								end
								local f3_local26 = CoD.TextSettings.Font19
								local f3_local27, f3_local28, f3_local29, f3_local30 = GetTextDimensions( f3_local24, f3_local26.Font, f3_local26.Height )
								local f3_local31 = CoD.CreateState( nil, nil, nil, -f3_local19 - f3_local26.Height, CoD.AnchorTypes.Bottom )
								f3_local31.width = LUI.AARGrid.UnlockedCardWidth - 7
								f3_local31.height = f3_local26.Height
								f3_local31.font = f3_local26.Font
								f3_local31.alpha = 0.55
								f3_local31.color = Colors.h1.light_grey
								f3_local31.alignment = LUI.Alignment.Center
								local self = LUI.UIText.new( f3_local31 )
								self:setText( f3_local24 )
								f3_local7:addElement( self )
								table.insert( f3_local1, f3_local7 )
							end
						end
						f3_local20 = f3_local19
					end
				end
				f3_local18 = f3_local16
			end
		end
		f3_local17 = f3_local16
	end
	return f3_local1
end

function OnGainedFocus( f4_arg0, f4_arg1 )
	f4_arg0:setAlpha( 1 )
	f4_arg0.grid:SetInputEnabled( true )
end

function OnLostFocus( f5_arg0, f5_arg1 )
	f5_arg0:setAlpha( 0 )
	f5_arg0.grid:SetInputEnabled( false )
end

LUI.AARNewUnlocks.GetTabLabel = function ()
	return "@LUA_MENU_NEW_ITEMS_INVENTORY"
end

LUI.AARNewUnlocks.new = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg1.controller
	if not f7_local0 then
		f7_local0 = Engine.GetFirstActiveController()
	end
	f0_local0 = f7_local0
	f7_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f7_local0.alpha = 0
	local self = LUI.UIElement.new( f7_local0 )
	self:registerEventHandler( "gainedFocus", OnGainedFocus )
	self:registerEventHandler( "lostFocus", OnLostFocus )
	self:setClass( LUI.AARNewUnlocks )
	local f7_local2 = LUI.MenuBuilder.BuildRegisteredType( "AARGrid", {
		unlockedCards = GenerateUnlockedCards()
	} )
	self.grid = f7_local2
	self:addElement( f7_local2 )
	return self
end

LUI.MenuBuilder.registerType( "aar_new_unlocks_main", LUI.AARNewUnlocks.new )
LockTable( _M )
