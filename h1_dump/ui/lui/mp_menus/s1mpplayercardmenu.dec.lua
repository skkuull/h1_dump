local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function InputTagComplete( f1_arg0, f1_arg1 )
	if f1_arg1.text then
		Engine.SetAndEnableCustomClanTag( f1_arg1.controller, f1_arg1.text )
		RefreshTag( f1_arg0, f1_arg1 )
	end
end

function RefreshTag( f2_arg0, f2_arg1 )
	f2_arg0:dispatchEventToRoot( {
		name = "update_playercard",
		gamertag = CoD.FormatClanAndGamerTags( Engine.GetCustomClanTag( f2_arg1.controller ), Engine.GetUsernameByController( f2_arg1.controller ) ),
		immediate = true
	} )
end

function OnCustomTag( f3_arg0, f3_arg1 )
	Engine.ExecNow( "banCheck " .. CoD.AntiCheat.Ban.FEATURE_BAN_CLAN_TAGS, f3_arg1.controller )
	Engine.OpenScreenKeyboard( f3_arg1.controller, Engine.Localize( "@LUA_MENU_CUSTOM_CLAN_TAG_SYSTEM_DIALOG" ), Engine.GetCustomClanTag( f3_arg1.controller ) or "", 4, true, true )
	LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
end

function OnClearTag( f4_arg0, f4_arg1 )
	Engine.ClearCustomClanTag( f4_arg1.controller )
	Engine.SetProfileDataUseEliteClanTag( f4_arg1.controller, false )
	RefreshTag( f4_arg0, f4_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
end

function AddPlayerCard( f5_arg0, f5_arg1 )
	local f5_local0 = {
		gamertag = CoD.FormatClanAndGamerTags( Engine.GetCustomClanTag( f5_arg1 ), Engine.GetUsernameByController( f5_arg1 ) ),
		background = Cao.GetCallingCard( f5_arg1 ),
		emblem = Cao.GetEmblemPatch( f5_arg1 ),
		xuid = Engine.GetXUIDByController( f5_arg1 ),
		controller = f5_arg1
	}
	if Engine.DoWeHaveStats( f5_arg1 ) then
		local f5_local1 = Engine.GetPlayerDataMPXP( f5_arg1 )
		f5_local0.prestige = Lobby.GetPlayerPrestigeLevel( f5_arg1 )
		f5_local0.rank = Lobby.GetRankForXP( f5_local1, f5_local0.prestige )
	else
		f5_local0.rank = 0
		f5_local0.prestige = 0
	end
	local f5_local1 = CoD.DesignGridHelper( 7 )
	local f5_local2 = LUI.MenuTemplate.ListTop
	f5_arg0:addElement( LUI.Playercard.new( CoD.CreateState( f5_local1, f5_local2, nil, nil, CoD.AnchorTypes.TopLeft ), f5_local0 ) )
	local f5_local3 = CoD.CreateState( f5_local1, f5_local2 - H1MenuDims.spacing, nil, nil, CoD.AnchorTypes.TopLeft )
	f5_local3.width = LUI.Playercard.Width
	f5_local3.height = 2
	f5_arg0:addElement( LUI.Divider.new( f5_local3 ) )
	f5_arg0:registerEventHandler( "text_input_complete", InputTagComplete )
end

function AddMiscCard( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = {
		primaryTextLeft = 15,
		secondaryTextLeft = 15,
		primaryFontHeight = 15,
		primaryTextBold = true
	}
	local f6_local1, f6_local2, f6_local3 = nil
	if f6_arg2 == "character" then
		local f6_local4 = Cao.GetActiveCostume()
		f6_local1 = Engine.TableLookupByRow( GearTable.File, f6_local4.head + 2, GearTable.Cols.GUID )
	elseif f6_arg2 == "char_camo" then
		f6_local1 = Engine.TableLookupByRow( CharacterCamoTable.File, Engine.GetPlayerData( f6_arg1, CoD.StatsGroup.Common, "characterCamoIndex" ), CharacterCamoTable.Cols.Guid )
		f6_local0.subtleImagePadding = true
	end
	if costume and costume.head ~= 1 then
		f6_local2 = LUI.InventoryUtils.GetLootData( f6_local1 )
		if f6_local2 then
			f6_local0.iconName = f6_local2.image
			f6_local0.primaryText = f6_local2.name
			f6_local0.rarity = f6_local2.lootRarity
			f6_local3 = GetCollectionForItem( f6_local1 )
			if f6_local3 then
				f6_local0.secondaryText = f6_local3.name .. " " .. f6_local3.numOwned .. "/" .. #f6_local3.setItems
			else
				f6_local0.secondaryText = ""
			end
			local f6_local4 = LUI.CacBase.AddCacButton( f6_arg0, f6_local0 )
			f6_local4:makeNotFocusable()
		end
	end
end

function OnEquipCallingcard( f7_arg0, f7_arg1 )
	Cao.SetCallingCard( f7_arg0, f7_arg1 or 0 )
end

f0_local0 = function ()
	local f8_local0 = {
		[#f8_local0 + 1] = {
			type = "UIGenericButton",
			id = "editTag",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@LUA_MENU_CUSTOM_CLAN_TAG" ),
				index = #f8_local0,
				button_action_func = OnCustomTag
			}
		},
		[#f8_local0 + 1] = {
			type = "UIGenericButton",
			id = "clearTag",
			properties = {
				style = GenericButtonSettings.Styles.GlassButton,
				substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
				button_text = Engine.Localize( "@LUA_MENU_CLEAR_YOUR_CLAN_TAG" ),
				index = #f8_local0,
				button_action_func = OnClearTag
			}
		}
	}
	return f8_local0
end

function TagEditPopup( f9_arg0, f9_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_selectionList_popup", {
		popup_childfeeder = f0_local0,
		popup_title = ""
	} )
end

function ToggleOption( f10_arg0 )
	if f10_arg0 == false then
		return true
	else
		return false
	end
end

function GetCharacterPatchOption( f11_arg0 )
	return Engine.GetPlayerData( f11_arg0, CoD.StatsGroup.Common, "applyEmblemToCharacter" )
end

function GetWeaponStickerOption( f12_arg0 )
	return Engine.GetPlayerData( f12_arg0, CoD.StatsGroup.Common, "applyEmblemToWeapon" )
end

function NotifyVirtualLobbyEmblemOptionsChanged( f13_arg0, f13_arg1 )
	Cac.NotifyVirtualLobby( "reset_loadout", f13_arg1.controller )
end

function OnToggleCharacterPatch( f14_arg0, f14_arg1 )
	Engine.SetPlayerData( f14_arg1.controller, CoD.StatsGroup.Common, "applyEmblemToCharacter", ToggleOption( GetCharacterPatchOption( f14_arg1.controller ) ) )
	NotifyVirtualLobbyEmblemOptionsChanged( f14_arg0, f14_arg1 )
end

function OnToggleWeaponSticker( f15_arg0, f15_arg1 )
	Engine.SetPlayerData( f15_arg1.controller, CoD.StatsGroup.Common, "applyEmblemToWeapon", ToggleOption( GetWeaponStickerOption( f15_arg1.controller ) ) )
	NotifyVirtualLobbyEmblemOptionsChanged( f15_arg0, f15_arg1 )
end

function UpdateCheckbox( f16_arg0, f16_arg1 )
	f16_arg0:processEvent( {
		name = "set_checked",
		checkBox = f16_arg1
	} )
end

function PlayercardMenu( f17_arg0, f17_arg1 )
	if not f17_arg1 then
		f17_arg1 = {}
	end
	local f17_local0 = f17_arg1.exclusiveController
	local f17_local1 = LUI.MenuTemplate.new( f17_arg0, {
		menu_title = "@LUA_MENU_PERSONALIZATION_CAPS",
		persistentBackground = PersistentBackground.Variants.VirtualLobby
	} )
	Cac.SetSelectedControllerIndex( f17_local0 )
	local f17_local2 = {}
	if IsPublicMatch() and LUI.InventoryUtils.GetCategoryNewStickerState( f17_local0, "CallingCard" ) then
		f17_local2.showNewSticker = true
	end
	local f17_local3 = {}
	if IsPublicMatch() and LUI.InventoryUtils.GetCategoryNewStickerState( f17_local0, "Emblem" ) then
		f17_local3.showNewSticker = true
	end
	if Engine.IsDepotEnabled() then
		f17_local1:AddButton( "@LUA_MENU_GEARTYPE_SINGLE_HEAD", "PersonalizeCharacter" )
		f17_local1:AddButton( "@MENU_CAMO_CAPS", "PersonalizeCamo" )
		f17_local1:AddButton( "@MENU_CALLING_CARD", "CallingCardSelectMenu", nil, nil, nil, f17_local2 )
		f17_local1:AddButton( "@MENU_PLAYERCARD_ICONS", "EmblemSelectMenu", nil, nil, nil, f17_local3 )
	else
		f17_local1:AddButton( "@MENU_CALLING_CARD", "CallingCardMenu", nil, nil, nil, f17_local2 )
		f17_local1:AddButton( "@MENU_PLAYERCARD_ICONS", "EmblemMenu", nil, nil, nil, f17_local3 )
	end
	local f17_local4 = false
	local f17_local5 = Engine.IsXbox360()
	if not f17_local5 then
		f17_local5 = Engine.IsXB3()
	end
	if f17_local5 and not Engine.IsUserSignedInToLive( f17_local0 ) then
		f17_local4 = true
	end
	local f17_local6, f17_local7, f17_local8 = nil
	if Engine.GetOnlineGame() and not Engine.IsChatRestricted() then
		f17_local6, f17_local7, f17_local8 = Cac.GetItemLockState( f17_local0, nil, "clantag" )
		if not f17_local4 then
			f17_local4 = f17_local6 ~= "Unlocked"
		end
		local f17_local9 = {}
		if f17_local4 then
			f17_local9.desc_text = f17_local8
			f17_local9.showLockOnDisable = true
		end
		local f17_local10 = f17_local1:AddButton( "LUA_MP_FRONTEND_TAG", "TagEditPopup", f17_local4, nil, nil, f17_local9 )
		f17_local10:clearActionSFX()
	end
	f17_local1:AddSpacing( 20 )
	f17_local1:AddHeader( "@MENU_EMBLEM_OPTIONS" )
	local f17_local9 = nil
	local f17_local10 = {
		variant = GenericButtonSettings.Variants.Checkbox,
		content_margin = 0,
		content_width = 30,
		canShowLocked = true,
		showLockOnDisable = true
	}
	local f17_local11 = {}
	LUI.InheritCopy( f17_local11, f17_local10 )
	local f17_local12, f17_local13, f17_local14 = Cac.GetItemLockState( f17_local0, nil, "feature_character_emblem" )
	f17_local8 = f17_local14
	f17_local7 = f17_local13
	f17_local12 = f17_local12 == "Unlocked"
	if not f17_local12 then
		f17_local11.desc_text = f17_local8
	end
	UpdateCheckbox( f17_local1:AddButton( "MENU_OPTION_CHARACTER_PATCH", OnToggleCharacterPatch, not f17_local12, nil, nil, f17_local11 ), GetCharacterPatchOption( f17_local0 ) )
	f17_local13 = {}
	LUI.InheritCopy( f17_local13, f17_local10 )
	local f17_local14, self, f17_local16 = Cac.GetItemLockState( f17_local0, nil, "feature_weapon_emblem" )
	f17_local8 = f17_local16
	f17_local7 = self
	f17_local14 = f17_local14 == "Unlocked"
	if not f17_local14 then
		f17_local13.desc_text = f17_local8
	end
	UpdateCheckbox( f17_local1:AddButton( "MENU_OPTION_WEAPON_STICKER", OnToggleWeaponSticker, not f17_local14, nil, nil, f17_local13 ), GetWeaponStickerOption( f17_local0 ) )
	f17_local1:AddMenuDescription( 3 )
	self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 162,
		left = LUI.Playercard.Width + 7,
		width = LUI.Playercard.Width,
		spacing = 7
	} )
	f17_local16 = f17_local1.list
	f17_local1.list = self
	self.buttonCount = 0
	f17_local1:addElement( self )
	AddPlayerCard( f17_local1, f17_local0 )
	if true == Engine.IsDepotEnabled() then
		AddMiscCard( f17_local1, f17_local0, "character" )
		AddMiscCard( f17_local1, f17_local0, "char_camo" )
	end
	f17_local1.list = f17_local16
	f17_local1:AddBackButton( function ( f18_arg0, f18_arg1 )
		Engine.ExecNow( "upload_playercard", f18_arg1.controller )
		LUI.FlowManager.RequestLeaveMenu( f18_arg0 )
	end )
	f17_local1:addElement( LUI.CacFactionWidget.new( f17_local1, f17_local1.exclusiveController, true ) )
	Cac.NotifyVirtualLobby( "cao", f17_local0 )
	f17_local1:AddRotateHelp()
	f17_local1:AddCurrencyInfoPanel()
	return f17_local1
end

LUI.MenuBuilder.registerType( "PlayercardMenu", PlayercardMenu )
LUI.MenuBuilder.registerPopupType( "TagEditPopup", TagEditPopup )
VLobby.InitMenuMode( "PlayercardMenu", VirtualLobbyModes.LUI_MODE_CAO, PersistentBackground.FadeFromBlackSlow, PersistentBackground.FadeFromBlackSlow )
LockTable( _M )
