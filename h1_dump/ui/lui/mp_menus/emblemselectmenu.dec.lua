local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function EmblemSelectMenu( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.MenuTemplate.new( f1_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@MENU_PLAYERCARD_ICONS" ) ),
		persistentBackground = PersistentBackground.Variants.VirtualLobby
	} )
	local f1_local1 = f1_local0.exclusiveController
	local f1_local2 = {}
	if IsPublicMatch() then
		local f1_local3 = "mp/emblemNav.csv"
		local f1_local4 = 0
		while Engine.TableLookupByRow( f1_local3, f1_local4, 0 ) ~= "" do
			f1_local2.showNewSticker = LUI.InventoryUtils.GetSubCategoryNewStickerState( f1_local1, "em_" .. Engine.TableLookupByRow( f1_local3, f1_local4, 3 ) )
			if f1_local2.showNewSticker == true then
				break
			end
			f1_local4 = f1_local4 + 1
		end
	end
	f1_local0:AddButton( Engine.ToUpperCase( Engine.Localize( "@MENU_CLASSIC" ) ), "EmblemMenu", nil, nil, nil, f1_local2 )
	if IsPublicMatch() then
		f1_local2.showNewSticker = LUI.InventoryUtils.GetSubCategoryNewStickerState( f1_local1, "em_dlc" )
	end
	f1_local0:AddButton( Engine.Localize( "@MENU_DLC_CAPS" ), "EmblemMenuDLC", nil, nil, nil, f1_local2 )
	f1_local0:AddSpacing( 20 )
	f1_local0:AddMenuDescription( 3 )
	f1_local0:AddBackButton()
	f1_local0:addElement( LUI.CacFactionWidget.new( f1_local0, f1_local1, true ) )
	f1_local0:AddRotateHelp()
	f1_local0:AddCurrencyInfoPanel()
	Cac.NotifyVirtualLobby( "cao", f1_local1 )
	return f1_local0
end

LUI.MenuBuilder.registerType( "EmblemSelectMenu", EmblemSelectMenu )
LockTable( _M )
