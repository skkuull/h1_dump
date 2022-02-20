local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPNewItemsList = InheritFrom( LUI.MenuTemplate )
LUI.MPNewItemsList.NumCards = 3
LUI.MPNewItemsList.CardWidth = 300
LUI.MPNewItemsList.CardHeight = 500
LUI.MPNewItemsList.CardSpacing = 32
LUI.MPNewItemsList.MiddleCard = math.ceil( LUI.MPNewItemsList.NumCards / 2 )
LUI.MPNewItemsList.InverseAspect = 0.56
LUI.MPNewItemsList.RevealAlphaDuration = 500
LUI.MPNewItemsList.CSD_Packages = nil
LUI.MPNewItemsList.ItemsReceivedCache = nil
LUI.MPNewItemsList.CardOpenDelayState = {
	Default = 1,
	Wait = 2,
	Timeout = 3,
	Reveal = 4
}
f0_local0 = LUI.MPNewItemsList
f0_local1 = {
	Rotate = {
		name = "supply_drop_rotation",
		width = LUI.MPNewItemsList.CardWidth,
		height = LUI.MPNewItemsList.CardWidth * LUI.MPNewItemsList.InverseAspect
	},
	Glitch = {
		name = "supply_drop_glitch",
		width = LUI.MPNewItemsList.CardWidth,
		height = LUI.MPNewItemsList.CardWidth * LUI.MPNewItemsList.InverseAspect
	},
	MTX_Glitch = {
		name = "supply_drop_glitch2",
		width = LUI.MPNewItemsList.CardWidth,
		height = LUI.MPNewItemsList.CardWidth * LUI.MPNewItemsList.InverseAspect
	},
	RevealBlue = {
		name = "supply_drop_reveal_blue",
		sound = "ui_cac_reinforce_reveal_item_enlisted",
		width = 360,
		height = 540,
		isReveal = true
	},
	RevealGreen = {
		name = "supply_drop_reveal_green",
		sound = "ui_cac_reinforce_reveal_item_rare",
		width = 360,
		height = 540,
		isReveal = true
	}
}
f0_local2 = {
	name = "supply_drop_reveal_orange",
	sound = "ui_cac_reinforce_reveal_item_elite"
}
local f0_local3
if not Engine.IsCurrentLanguageJapanese() then
	f0_local3 = "dds_gdn_react_elite"
	if not f0_local3 then
	
	else
		f0_local2.voice_over = f0_local3
		f0_local2.width = 360
		f0_local2.height = 540
		f0_local2.isReveal = true
		f0_local1.RevealOrange = f0_local2
		f0_local0.Videos = f0_local1
		LUI.MPNewItemsList.RarityToVideo = {
			LUI.MPNewItemsList.Videos.RevealGreen,
			LUI.MPNewItemsList.Videos.RevealGreen,
			LUI.MPNewItemsList.Videos.RevealBlue,
			LUI.MPNewItemsList.Videos.RevealOrange
		}
		LUI.MPNewItemsList.PlayNextVideo = function ( f1_arg0 )
			assert( f1_arg0.RevealSequence ~= nil )
			if #f1_arg0.RevealSequence > 0 then
				local f1_local0 = f1_arg0.RevealSequence[1].info
				Engine.PlayMenuVideo( f1_local0.name, 0, true )
				local f1_local1 = f1_arg0.RevealSequence[1].card
				f1_local1:ShowBinkImage( (LUI.MPNewItemsList.CardWidth - f1_local0.width) / 2 - LUI.MPNewItemsList.CardWidth / 2, (LUI.MPNewItemsList.CardHeight - f1_local0.height) / 2 - LUI.MPNewItemsList.CardHeight / 2, f1_local0.width, f1_local0.height )
				if f1_local0.isReveal then
					if f1_arg0.listInvalid then
						HorizSlideListUpdateData( f1_arg0.cardSlider, f1_arg0.NewItems, true )
						f1_arg0.listInvalid = false
					end
					Engine.PlaySound( f1_local0.sound or "ui_cac_reinforce_reveal_item" )
					if f1_local0.voice_over then
						Engine.PlaySound( f1_local0.voice_over )
					end
					f1_local1:FadeInOut( true, true, LUI.MPNewItemsList.RevealAlphaDuration )
				end
				return true
			else
				return false
			end
		end
		
		LUI.MPNewItemsList.CheckRevealProgress = function ( f2_arg0 )
			if Engine.IsVideoFinished() then
				local f2_local0 = f2_arg0.RevealSequence[1].card
				f2_local0:HideBinkImage()
				table.remove( f2_arg0.RevealSequence, 1 )
				if not f2_arg0:PlayNextVideo() then
					f2_local0.list.currentOpenDelayState = LUI.MPNewItemsList.CardOpenDelayState.Default
					f2_arg0:FadeInOutCards( true, false )
					f2_arg0:registerEventHandler( "CheckRevealProgress", nil )
					LUI.UITimer.Stop( f2_arg0.revealTimer )
					f2_arg0:removeElement( f2_arg0.revealTimer )
					f2_arg0.revealTimer = nil
					f2_arg0.RevealSequence = nil
					if Engine.IsCurrentGen() then
						Engine.StopMenuVideo()
					end
					local f2_local1 = false
					for f2_local2 = 1, #f2_arg0.NewItems, 1 do
						local f2_local5 = f2_arg0.NewItems[f2_local2]
						if not f2_local1 then
							f2_local1 = f2_local5.isOverflow
						end
					end
					local f2_local2 = "default"
					if f2_local1 then
						f2_local2 = "visible"
					end
					f2_arg0.overflowInfoText:animateToState( f2_local2 )
				end
			end
		end
		
		function GoToArmory( f3_arg0, f3_arg1 )
			LUI.FlowManager.RequestAddMenu( f3_arg0, "ArmoryMenu", true, f3_arg1, false, {
				armoryType = Armory.Type.Redeemable
			} )
		end
		
		LUI.MPNewItemsList.OnSupplyPackagesFetched = function ( f4_arg0, f4_arg1 )
			if f4_arg1.inventoryEventType == 4 and f4_arg1.inventoryTaskType == 6 and f4_arg1.success and LUI.MPNewItemsList.CSD_Packages then
				local f4_local0 = {}
				if LUI.MPNewItemsList.CSD_Packages.spid ~= nil then
					f4_local0[LUI.MPNewItemsList.CSD_Packages.spid] = true
				end
				for f4_local1 = 1, #LUI.MPNewItemsList.CSD_Packages.additional_spids, 1 do
					f4_local0[LUI.MPNewItemsList.CSD_Packages.additional_spids[f4_local1]] = true
				end
				local f4_local1 = Engine.Loot_GetUnopenedSupplyPackages( f4_arg0.controller )
				for f4_local2 = 1, #f4_local1, 1 do
					if f4_local1[f4_local2].origin == LUI.LootOrigin.MTX and not f4_local0[f4_local1[f4_local2].spid] then
						LUI.MPNewItemsList.CSD_Packages.additional_spids[#LUI.MPNewItemsList.CSD_Packages.additional_spids + 1] = f4_local1[f4_local2].spid
						f4_local0[f4_local1[f4_local2].spid] = true
					end
				end
				if #LUI.MPNewItemsList.CSD_Packages.additional_spids > 0 and not LUI.MPNewItemsList.CSD_Packages.spid then
					LUI.MPNewItemsList.CSD_Packages.spid = LUI.MPNewItemsList.CSD_Packages.additional_spids[#LUI.MPNewItemsList.CSD_Packages.additional_spids]
					table.remove( LUI.MPNewItemsList.CSD_Packages.additional_spids, #LUI.MPNewItemsList.CSD_Packages.additional_spids )
					local f4_local2 = table.insert
					local f4_local3 = f4_arg0.NewItems
					if #f4_arg0.NewItems >= 3 then
						local f4_local4 = 4
						if not f4_local4 then
						
						else
							f4_local2( f4_local3, f4_local4, LUI.MPNewItemsList.CSD_Packages )
							HorizSlideListUpdateData( f4_arg0.cardSlider, f4_arg0.NewItems, true )
						end
					end
					f4_local4 = 1
				end
			end
		end
		
		LUI.MPNewItemsList.OpenSupplyDrop = function ( f5_arg0 )
			if not f5_arg0.lootData.loading and Engine.GetDvarBool( "virtualLobbyReady" ) then
				local f5_local0 = f5_arg0.list.controller
				assert( f5_local0 )
				if f5_arg0.lootData.isOverflow then
					GoToArmory( f5_arg0, f5_local0 )
					return 
				end
				HorizSlideListTrySelectItem( f5_arg0.list.cardSlider, f5_arg0 )
				local f5_local1 = f5_arg0.lootData.spid
				local f5_local2 = f5_arg0.lootData.origin
				LUI.MPNewItemsList.RemoveActionHelp( f5_arg0 )
				f5_arg0:registerEventHandler( "inventory", function ( element, event )
					if event.inventoryEventType == 3 and Engine.Loot_IsSupplyPackageReadyToBeOpen( f5_local0, f5_local1, f5_local2 ) then
						LUI.MPNewItemsList.ItemsReceivedCache = Engine.Loot_GetSupplyPackageContent( f5_local0, f5_local1, f5_local2 )
						LUI.MPNewItemsList.ConsumeSupplyDrop( f5_arg0, f5_local0, f5_local1, f5_local2 )
					end
				end )
				if Engine.Loot_IsSupplyPackageReadyToBeOpen( f5_local0, f5_local1, f5_local2 ) then
					LUI.MPNewItemsList.ItemsReceivedCache = Engine.Loot_GetSupplyPackageContent( f5_local0, f5_local1, f5_local2 )
					LUI.MPNewItemsList.ConsumeSupplyDrop( f5_arg0, f5_local0, f5_local1, f5_local2 )
				else
					f5_arg0.lootData.loading = true
					f5_arg0.list.loadingAnimation:animateToState( "default" )
				end
			end
		end
		
		f0_local0 = function ( f7_arg0 )
			if f7_arg0 and f7_arg0.list.openDelayTimer then
				local f7_local0 = Engine.GetLuiRoot()
				if LUI.FlowManager.IsMenuTopmost( f7_local0, "popup_supplydrop_startopen" ) then
					LUI.FlowManager.RequestLeaveMenuByName( "popup_supplydrop_confirmcancel", nil, true )
				elseif LUI.FlowManager.IsMenuTopmost( f7_local0, "popup_supplydrop_timeout" ) then
					LUI.FlowManager.RequestLeaveMenuByName( "popup_supplydrop_timeout", nil, true )
				elseif LUI.FlowManager.IsMenuTopmost( f7_local0, "popup_supplydrop_confirmcancel" ) then
					LUI.FlowManager.RequestLeaveMenuByName( "popup_supplydrop_confirmcancel", nil, true )
				end
				LUI.UITimer.Stop( f7_arg0.list.openDelayTimer )
				f7_arg0.list:removeElement( f7_arg0.list.openDelayTimer )
				f7_arg0.list.openDelayTimer = nil
				f7_arg0.list.currentOpenDelay = 0
				f7_arg0.list.loadingAnimation:animateToState( "hidden" )
				f7_arg0.list:registerEventHandler( "CheckItemsInInventory", nil )
			end
		end
		
		LUI.MPNewItemsList.CheckItemsInInventory = function ( f8_arg0, f8_arg1 )
			f8_arg0.list.currentOpenDelay = f8_arg0.list.currentOpenDelay + f8_arg0.list.inventoryQueryInterval
			local f8_local0 = LUI.MPNewItemsList.CardOpenDelayState.Default
			if f8_arg0.list.openDelayTimeout < f8_arg0.list.currentOpenDelay then
				f8_local0 = LUI.MPNewItemsList.CardOpenDelayState.Timeout
			elseif f8_arg0.list.openDelayWait < f8_arg0.list.currentOpenDelay then
				f8_local0 = LUI.MPNewItemsList.CardOpenDelayState.Wait
			end
			if f8_arg0.list.currentOpenDelayState ~= f8_local0 then
				f8_arg0.list.currentOpenDelayState = f8_local0
				if f8_arg0.list.currentOpenDelayState == LUI.MPNewItemsList.CardOpenDelayState.Wait then
					LUI.FlowManager.RequestAddMenu( f8_arg0, "popup_supplydrop_startopen", true, f8_arg1, false, {
						weak_card = setmetatable( {
							value = f8_arg0
						}, {
							__mode = "v"
						} )
					} )
				elseif f8_arg0.list.currentOpenDelayState == LUI.MPNewItemsList.CardOpenDelayState.Timeout then
					if LUI.FlowManager.IsMenuTopmost( Engine.GetLuiRoot(), "popup_supplydrop_startopen" ) then
						LUI.FlowManager.RequestLeaveMenuByName( "popup_supplydrop_startopen", nil, true )
					end
					LUI.FlowManager.RequestAddMenu( f8_arg0, "popup_supplydrop_timeout", true, f8_arg1, false, {
						weak_card = setmetatable( {
							value = f8_arg0
						}, {
							__mode = "v"
						} )
					} )
				end
			end
			local f8_local1 = LUI.MPNewItemsList.ItemsReceivedCache
			for f8_local2 = 1, #f8_local1, 1 do
				local f8_local5 = f8_local1[f8_local2].guid
				local f8_local6 = f8_local1[f8_local2].initialQuantity
				if f8_local1[f8_local2].finalQuantity < Engine.Inventory_GetItemQuantity( f8_arg1, f8_local5, false ) then
					return 
				end
			end
			f0_local0( f8_arg0 )
			f8_arg0.list.currentOpenDelayState = LUI.MPNewItemsList.CardOpenDelayState.Reveal
			local f8_local2 = true
			if f8_arg0.listItemData.origin == LUI.LootOrigin.MTX then
				if #LUI.MPNewItemsList.CSD_Packages.additional_spids > 0 then
					LUI.MPNewItemsList.CSD_Packages.spid = LUI.MPNewItemsList.CSD_Packages.additional_spids[#LUI.MPNewItemsList.CSD_Packages.additional_spids]
					table.remove( LUI.MPNewItemsList.CSD_Packages.additional_spids, #LUI.MPNewItemsList.CSD_Packages.additional_spids )
					table.remove( f8_arg0.list.NewItems, f8_arg0.listItemData.listDataIndex )
					table.insert( f8_arg0.list.NewItems, 1, LUI.MPNewItemsList.CSD_Packages )
					f8_local2 = false
				else
					LUI.MPNewItemsList.CSD_Packages.spid = nil
				end
			end
			if f8_local2 then
				table.remove( f8_arg0.list.NewItems, f8_arg0.listItemData.listDataIndex )
			end
			local f8_local3 = {}
			local f8_local4 = {}
			if f8_arg0.lootData.origin == LUI.LootOrigin.MTX then
				f8_local4.info = LUI.MPNewItemsList.Videos.MTX_Glitch
			else
				f8_local4.info = LUI.MPNewItemsList.Videos.Glitch
			end
			f8_local4.card = f8_arg0
			f8_local3[1] = f8_local4
			local f8_local7 = {
				1,
				2,
				0
			}
			local f8_local5 = 0
			if #f8_local1 > 2 then
				f8_local5 = 1
			end
			local f8_local6 = f8_arg0.list.cardSlider.listElems
			local f8_local8 = {}
			local f8_local9 = math.min( #f8_local1, 3 )
			for f8_local10 = 1, #f8_local1, 1 do
				local f8_local13 = f8_local1[f8_local10].guid
				local f8_local14 = {
					guid = f8_local13,
					controller = f8_arg1
				}
				f8_local8[f8_local10] = LUI.InventoryUtils.GetLootData( f8_local13 )
				if f8_local9 < f8_local10 then
					table.insert( f8_arg0.list.NewItems, 1, f8_local14 )
				end
			end
			for f8_local10 = 1, f8_local9, 1 do
				local f8_local13 = {
					lootData = f8_local8[f8_local10],
					card = f8_local6[f8_local7[f8_local10] + f8_local5],
					info = LUI.MPNewItemsList.RarityToVideo[f8_local13.lootData.lootRarity]
				}
				table.insert( f8_arg0.list.NewItems, math.max( 1, f8_local7[f8_local10] ), f8_local13.lootData )
				f8_local3[#f8_local3 + 1] = f8_local13
			end
			local f8_local10 = IsArmoryFull( f8_arg1 )
			for self = 1, #f8_arg0.list.NewItems, 1 do
				local f8_local14 = f8_arg0.list.NewItems[self]
				if f8_local14.loot_type == ItemTypes.SupplyDrop and f8_local14.origin ~= LUI.LootOrigin.MTX then
					f8_local14.isOverflow = f8_local10
				end
			end
			f8_arg0.list.RevealSequence = f8_local3
			f8_arg0.list.listInvalid = true
			f8_arg0.list:FadeInOutCards( false, true )
			f8_arg0.list:PlayNextVideo()
			Engine.PlaySound( "ui_cac_reinforce_open" )
			local self = LUI.UITimer.new( 1, "CheckRevealProgress" )
			self.id = "new_items_reveal_timer"
			f8_arg0.list:addElement( self )
			f8_arg0.list.revealTimer = self
			f8_arg0.list:registerEventHandler( "CheckRevealProgress", LUI.MPNewItemsList.CheckRevealProgress )
		end
		
		LUI.MPNewItemsList.ConsumeSupplyDrop = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
			f9_arg0.lootData.loading = nil
			f9_arg0:Refresh( f9_arg0.lootData, true )
			f9_arg0:registerEventHandler( "inventory", function ( element, event )
				
			end )
			local f9_local0 = Engine.Inventory_GetArmorySlotsUsed( f9_arg1 )
			local f9_local1 = LUI.InventoryUtils.GetNumArmorySlots( f9_arg1 )
			local f9_local2 = 0
			local f9_local3 = LUI.MPNewItemsList.ItemsReceivedCache
			local f9_local4 = {}
			for self = 1, #f9_local3, 1 do
				local f9_local8 = f9_local3[self].guid
				f9_local4[f9_local8] = (f9_local4[f9_local8] or 0) + f9_local3[self].quantity
			end
			for self = 1, #f9_local3, 1 do
				local f9_local8 = f9_local3[self].guid
				f9_local3[self].initialQuantity = Engine.Inventory_GetItemQuantity( f9_arg1, f9_local8, false )
				f9_local3[self].finalQuantity = f9_local3[self].initialQuantity + f9_local4[f9_local8]
				assert( f9_local3[self].initialQuantity < f9_local3[self].finalQuantity )
				if LUI.InventoryUtils.ItemRequiresArmorySlot( f9_local8 ) and f9_arg3 ~= LUI.LootOrigin.MTX and f9_local1 < f9_local0 + 1 then
					f9_local2 = f9_local2 + 1
					if f9_local2 > LUI.InventoryUtils.MaxOverflowLoot then
						DebugPrint( "Exceeded loot overflow limit, this is bad!" )
						f9_local2 = LUI.InventoryUtils.MaxOverflowLoot
					end
					Engine.SetOverflowLootGuid( f9_arg1, f9_local2 - 1, f9_local8 )
				end
			end
			Engine.Loot_OpenSupplyPackage( f9_arg1, f9_arg2, f9_arg3 )
			f9_arg0.list.loadingAnimation:animateToState( "default" )
			f9_arg0.list.currentOpenDelay = 0
			local self = LUI.UITimer.new( f9_arg0.list.inventoryQueryInterval, "CheckItemsInInventory" )
			self.id = "supply_drop_open_delay_timer"
			f9_arg0.list:addElement( self )
			f9_arg0.list.openDelayTimer = self
			f9_arg0.list:registerEventHandler( "CheckItemsInInventory", function ( element, event )
				LUI.MPNewItemsList.CheckItemsInInventory( f9_arg0, f9_arg1 )
			end )
		end
		
		LUI.MPNewItemsList.IsRevealingItem = function ( f12_arg0 )
			local f12_local0 = f12_arg0.RevealSequence
			if not f12_local0 then
				f12_local0 = f12_arg0.openDelayTimer
				if f12_local0 then
					f12_local0 = f12_arg0.currentOpenDelayState ~= LUI.MPNewItemsList.CardOpenDelayState.Timeout
				end
			end
			return f12_local0
		end
		
		LUI.MPNewItemsList.GamepadButton = function ( f13_arg0, f13_arg1 )
			if f13_arg0:IsRevealingItem() then
				return true
			else
				return LUI.UIElement.GamepadButton( f13_arg0, f13_arg1 )
			end
		end
		
		LUI.MPNewItemsList.FadeInOutCards = function ( f14_arg0, f14_arg1, f14_arg2 )
			local f14_local0 = LUI.MPNewItemsList.RevealAlphaDuration
			local f14_local1 = nil
			local f14_local2 = f14_arg0.cardSlider.listElems
			for f14_local3 = 1, #f14_local2, 1 do
				f14_local1 = f14_local2[f14_local3]
				f14_local1:SetDoingReveal( f14_arg2 )
				if f14_local1.listItemData ~= nil then
					f14_local1:FadeInOut( f14_arg1, true, f14_local0 )
				end
			end
			local f14_local3 = "visible"
			if not f14_arg1 then
				f14_local3 = "hidden"
			end
			f14_arg0.cardSlider.navArrows:animateToState( f14_local3, f14_local0 )
		end
		
		LUI.MPNewItemsList.AddActionHelp = function ( f15_arg0, f15_arg1 )
			f15_arg0:dispatchEventToRoot( {
				name = "add_button_helper_text",
				button_ref = "button_action",
				helper_text = Engine.Localize( f15_arg1 ),
				side = "right",
				clickable = false,
				priority = -1000,
				showMouseHelp = true
			} )
		end
		
		LUI.MPNewItemsList.AddOpenHelp = function ( f16_arg0 )
			LUI.MPNewItemsList.AddActionHelp( f16_arg0, "@LUA_MENU_OPEN_CAPS" )
		end
		
		LUI.MPNewItemsList.AddArmoryHelp = function ( f17_arg0 )
			LUI.MPNewItemsList.AddActionHelp( f17_arg0, "@LUA_MENU_MANAGE_ARMORY" )
		end
		
		LUI.MPNewItemsList.RemoveActionHelp = function ( f18_arg0 )
			f18_arg0:dispatchEventToRoot( {
				name = "add_button_helper_text",
				button_ref = "button_action",
				helper_text = ""
			} )
		end
		
		LUI.MPNewItemsList.EquipItem = function ( f19_arg0, f19_arg1, f19_arg2 )
			f19_arg2.lootData = f19_arg1.lootData
			if f19_arg2.lootData.isOverflow then
				GoToArmory( f19_arg1, f19_arg0 )
				return 
			elseif f19_arg2.lootData.lockStatus == Cac.ItemLockStatus.DlcRequired and f19_arg2.lootData.dlcRequirement and Dlc.TryOpenStore( f19_arg2.controller, f19_arg2.lootData.dlcRequirement, f19_arg2.lootData.dlcEarlyAccess ) then
				return 
			elseif f19_arg2.lootData.lockState == "Locked" then
				return 
			else
				LUI.InventoryUtils.OpenEquipMenu( f19_arg2.controller, f19_arg2.lootData )
			end
		end
		
		LUI.MPNewItemsList.AddOpenStoreHelp = function ( f20_arg0 )
			LUI.MPNewItemsList.AddActionHelp( f20_arg0, "@LUA_MENU_PURCHASE_CAPS" )
		end
		
		LUI.MPNewItemsList.AddEquipHelp = function ( f21_arg0 )
			LUI.MPNewItemsList.AddActionHelp( f21_arg0, "@LUA_MENU_EQUIP_CAPS" )
		end
		
		function IsArmoryFull( f22_arg0 )
			if LUI.InventoryUtils.GetNumArmorySlots( f22_arg0 ) <= Engine.Inventory_GetArmorySlotsUsed( f22_arg0 ) then
				return true
			else
				return false
			end
		end
		
		function CardListItemDoAction( f23_arg0, f23_arg1 )
			if f23_arg0.list:IsRevealingItem() then
				return 
			end
			local f23_local0 = f23_arg0.list.controller
			assert( f23_local0 )
			local f23_local1 = f23_arg0.lootData
			if not (f23_local1.loot_type == ItemTypes.Reinforcement) and not (f23_local1.loot_type == ItemTypes.Feature) then
				if f23_local0 == f23_arg1.controller then
					if f23_local1.loot_type == ItemTypes.SupplyDrop then
						LUI.MPNewItemsList.OpenSupplyDrop( f23_arg0 )
					else
						LUI.MPNewItemsList.EquipItem( f23_local0, f23_arg0, f23_arg1 )
					end
				else
					Engine.PlaySound( CoD.SFX.DenySelect )
				end
			end
		end
		
		function CardListUnselect( f24_arg0 )
			if f24_arg0.lootData.loading then
				f24_arg0.list.loadingAnimation:animateToState( "hidden" )
				f24_arg0.lootData.loading = nil
				f24_arg0:registerEventHandler( "inventory", function ( element, event )
					
				end )
			end
		end
		
		function CardListItemSetHelp( f26_arg0 )
			local f26_local0 = f26_arg0.lootData
			local f26_local1 = f26_local0.loot_type
			local f26_local2 = f26_local0.unlockType
			local f26_local3
			if not f26_local1 or f26_local1 ~= ItemTypes.SupplyDrop and f26_local1 ~= ItemTypes.Costume and f26_local1 ~= ItemTypes.Weapon and f26_local1 ~= ItemTypes.Playercard and f26_local1 ~= ItemTypes.Emblem and f26_local1 ~= ItemTypes.Reticle and f26_local1 ~= ItemTypes.Camo and f26_local1 ~= ItemTypes.Attachment and f26_local1 ~= ItemTypes.AttachKit and f26_local1 ~= ItemTypes.FurnitureKit then
				local f26_local4 = f26_local2
				if f26_local2 ~= LUI.InventoryUtils.UnlockTypes.PERK and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.TITLE and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.ICON and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.KILLSTREAK and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.WEAPON and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHMENT and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.WEAPON_ATTACHKIT and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.WEAPON_FURNITUREKIT and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.WEAPON_CAMO and f26_local2 ~= LUI.InventoryUtils.UnlockTypes.WEAPON_RETICLE then
					f26_local3 = false
				end
			end
			f26_local3 = f26_local4 and true
		end
		
		function CardListItem( f27_arg0 )
			local f27_local0 = LUI.MPNewItemsCard.new( 0, LUI.MPNewItemsList.CardWidth, LUI.MPNewItemsList.CardHeight )
			f27_local0.id = "new_item_card_" .. f27_arg0
			f27_local0.button = f27_local0.detailsPanel
			f27_local0:registerEventHandler( "list_unselect", CardListUnselect )
			f27_local0:registerEventHandler( "list_select", CardListItemSetHelp )
			f27_local0.button:registerEventHandler( "button_action", function ( element, event )
				CardListItemDoAction( f27_local0, event )
			end )
			return f27_local0
		end
		
		function CardListItemUpdate( f29_arg0, f29_arg1 )
			f29_arg0:Refresh( f29_arg1, true )
		end
		
		LUI.MPNewItemsList.new = function ( f30_arg0 )
			local f30_local0 = LUI.MPNewItemsList.CardWidth * LUI.MPNewItemsList.NumCards
			local f30_local1 = f30_local0 / 2
			local f30_local2 = LUI.MPNewItemsList.CardHeight / 2
			local f30_local3 = 20
			local self = LUI.UIElement.new( CoD.CreateState( -f30_local1, -f30_local2 + f30_local3, f30_local1, f30_local2 + f30_local3, CoD.AnchorTypes.None ) )
			self.id = "new_items_list_id"
			self:setClass( LUI.MPNewItemsList )
			self:registerEventHandler( "gamepad_button", LUI.MPNewItemsList.GamepadButton )
			self:registerEventHandler( "inventory", LUI.MPNewItemsList.OnSupplyPackagesFetched )
			local f30_local5 = f30_arg0 or Engine.GetFirstActiveController()
			self.controller = f30_local5
			local f30_local6 = CoD.TextSettings.TitleFontSmall
			local self = LUI.UIText.new()
			self:registerAnimationState( "default", {
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = false,
				bottom = 0,
				height = f30_local6.Height,
				alignment = LUI.HorizontalAlignment.Center,
				font = f30_local6.Font,
				color = Colors.s1.overload_red,
				alpha = 0
			} )
			self:registerAnimationState( "visible", {
				alpha = 1
			} )
			self:animateToState( "default" )
			self:setText( Engine.Localize( "@LUA_MENU_NEW_ITEMS_FULL_INFO_CAPS" ) )
			self.overflowInfoText = self
			self:addElement( self )
			local self = LUI.UIText.new()
			self:registerAnimationState( "default", {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				height = f30_local6.Height,
				alignment = LUI.HorizontalAlignment.Center,
				font = f30_local6.Font,
				color = Colors.white,
				alpha = 0
			} )
			self:registerAnimationState( "visible", {
				alpha = 1
			} )
			self:animateToState( "default" )
			self:setText( Engine.Localize( "@LUA_MENU_NEW_ITEMS_LIST_EMPTY", Engine.GetUsernameByController( f30_local5 ) ) )
			self.emptyListText = self
			self:addElement( self )
			local f30_local9 = f30_local0 - LUI.MPNewItemsList.CardWidth + 2 * LUI.MPNewItemsList.CardSpacing
			local self = LUI.UIHorizontalSlideList.new( CoD.CreateState( (f30_local0 - f30_local9) / 2, f30_local2, (f30_local0 - f30_local9) / 2 + f30_local9, f30_local2, CoD.AnchorTypes.TopLeft ), LUI.MPNewItemsList.NumCards, CardListItem )
			self.cardSlider = self
			self:addElement( self )
			for f30_local11 = 1, #self.listElems, 1 do
				self.listElems[f30_local11].list = self
			end
			local f30_local11 = Engine.Inventory_GetNewItems( f30_local5 )
			local f30_local12 = Engine.Loot_GetUnopenedSupplyPackages( f30_local5 )
			self.NewItems = {}
			local f30_local13 = false
			if f30_local12 ~= nil then
				local f30_local14 = IsArmoryFull( f30_local5 )
				f30_local13 = f30_local14
				LUI.MPNewItemsList.CSD_Packages = nil
				for self = 1, #f30_local12, 1 do
					if f30_local12[self].origin == LUI.LootOrigin.MTX then
						if not LUI.MPNewItemsList.CSD_Packages then
							LUI.MPNewItemsList.CSD_Packages = {
								loot_type = ItemTypes.SupplyDrop,
								origin = LUI.LootOrigin.MTX,
								spid = f30_local12[self].spid,
								additional_spids = {}
							}
							self.NewItems[#self.NewItems + 1] = LUI.MPNewItemsList.CSD_Packages
						else
							LUI.MPNewItemsList.CSD_Packages.additional_spids[#LUI.MPNewItemsList.CSD_Packages.additional_spids + 1] = f30_local12[self].spid
						end
					end
					self.NewItems[#self.NewItems + 1] = {
						loot_type = ItemTypes.SupplyDrop,
						spid = f30_local12[self].spid,
						origin = f30_local12[self].origin,
						isOverflow = f30_local14
					}
				end
			end
			if f30_local11 ~= nil then
				for f30_local14 = 1, #f30_local11, 1 do
					local f30_local18 = LUI.InventoryUtils.GetLootData( f30_local11[f30_local14] )
					if not f30_local13 then
						f30_local13 = f30_local18.isOverflow
					end
					if f30_local18.lockState ~= "Hidden" then
						self.NewItems[#self.NewItems + 1] = {
							guid = f30_local11[f30_local14]
						}
					end
				end
			end
			local f30_local14 = AAR.GetItemsUnlockedLastGame( f30_local5 )
			if not f30_local14 then
				f30_local14 = {}
			end
			for self = 1, #f30_local14, 1 do
				if f30_local14[self].Type and f30_local14[self].ItemId then
					local f30_local19 = LUI.InventoryUtils.GetLootData( nil, nil, f30_local14[self] )
					if f30_local19 and f30_local19.category ~= "" and (f30_local19.image ~= nil or f30_local19.emblem ~= nil) and f30_local19.lockState ~= "Hidden" then
						self.NewItems[#self.NewItems + 1] = f30_local14[self]
					end
				end
			end
			HorizSlideListSetData( self, self.NewItems, CardListItemUpdate, true )
			self:processEvent( {
				name = "gain_focus",
				duration = 0
			} )
			local self = LUI.UIElement.new()
			local f30_local16 = 180
			self:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = f30_local16,
				bottom = f30_local16,
				left = 0,
				right = 0
			} )
			self:animateToState( "default" )
			self:addElement( self )
			local f30_local17 = self:addElement( LUI.MenuBuilder.BuildRegisteredType( "loading_animation_widget" ) )
			self.loadingAnimation = f30_local17
			f30_local17:registerAnimationState( "hidden", {
				alpha = 0
			} )
			f30_local17:animateToState( "hidden" )
			self.inventoryQueryInterval = 100
			self.currentOpenDelayState = LUI.MPNewItemsList.CardOpenDelayState.Default
			self.openDelayWait = 2000
			self.openDelayTimeout = 6000
			if f30_local13 then
				self.overflowInfoText:animateToState( "visible" )
			end
			if #self.NewItems == 0 then
				self.emptyListText:animateToState( "visible" )
			end
			return self
		end
		
		function popup_supplydrop_startopen( menu, controller )
			local self = LUI.UIElement.new()
			local f31_local1 = controller.weak_card
			local f31_local2 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
				message = Engine.Localize( "@MENU_POPUP_SUPPLYDROP_STARTPROCESSING" ),
				cancel_func = function ( f32_arg0, f32_arg1 )
					
				end
			} )
			f31_local2.id = "popup_supplydrop_startopen_id"
			self:addElement( f31_local2 )
			return self
		end
		
		function popup_supplydrop_timeout( menu, controller )
			local self = LUI.UIElement.new()
			local f33_local1 = controller.weak_card
			local f33_local2 = LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box_with_cancel", {
				message = Engine.Localize( "@MENU_POPUP_SUPPLYDROP_TIMEOUT" ),
				cancel_func = function ( f34_arg0, f34_arg1 )
					LUI.FlowManager.RequestLeaveMenuByName( "popup_supplydrop_timeout", nil, true )
					LUI.FlowManager.RequestAddMenu( f34_arg0, "popup_supplydrop_confirmcancel", true, f34_arg1.controller, false, {
						weak_card = f33_local1
					} )
				end
			} )
			f33_local2.id = "popup_supplydrop_timeout_id"
			self:addElement( f33_local2 )
			return self
		end
		
		function popup_supplydrop_confirmcancel( f35_arg0, f35_arg1 )
			local f35_local0 = f35_arg1.weak_card
			local f35_local1 = LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
				popup_title = Engine.Localize( "@MENU_NOTICE" ),
				message_text = Engine.Localize( "@MENU_POPUP_CONFIRM_CANCEL" ),
				yes_action = function ( f36_arg0, f36_arg1 )
					if f35_local0.value then
						f0_local0( f35_local0.value )
						f35_local0.value.list:dispatchEventToRoot( {
							name = "supply_drop_open_canceled",
							controller = f36_arg1.controller
						} )
					end
				end,
				no_action = function ( f37_arg0, f37_arg1 )
					LUI.FlowManager.RequestLeaveMenuByName( "popup_supplydrop_confirmcancel", nil, true )
					LUI.FlowManager.RequestAddMenu( f37_arg0, "popup_supplydrop_timeout", true, f37_arg1.controller, false, {
						weak_card = f35_local0
					} )
				end
			} )
			f35_local1.id = "popup_supplydrop_confirmcancel_id"
			return f35_local1
		end
		
		LUI.MenuBuilder.registerType( "MPNewItemsList", LUI.MPNewItemsList.new )
		LUI.MenuBuilder.registerPopupType( "popup_supplydrop_startopen", popup_supplydrop_startopen )
		LUI.MenuBuilder.registerPopupType( "popup_supplydrop_timeout", popup_supplydrop_timeout )
		LUI.MenuBuilder.registerPopupType( "popup_supplydrop_confirmcancel", popup_supplydrop_confirmcancel )
		LockTable( _M )
	end
end
f0_local3 = nil
