Dlc = {
	CanPurchase = function ( f1_arg0, f1_arg1, f1_arg2 )
		local f1_local0 = false
		for f1_local4 in string.gmatch( f1_arg1, "([^;]+)" ) do
			if Engine.DLC_CanPurchase( f1_local4, f1_arg2 ) then
				f1_local0 = true
				break
			end
		end
		return f1_local0
	end,
	TryOpenStore = function ( f2_arg0, f2_arg1, f2_arg2 )
		if Engine.IsPC() then
			LUI.ComScore.LogStoreEntry( f2_arg0 )
			Engine.Exec( "xshowmarketplace" )
			return true
		elseif not Dlc.CanPurchase( f2_arg0, f2_arg1, f2_arg2 ) then
			return false
		end
		local f2_local0 = {}
		if f2_arg2 and Engine.DLC_CanPurchasePackName( "seasonpass" ) then
			f2_local0[#f2_local0 + 1] = "seasonpass"
		end
		local f2_local1 = {}
		for f2_local5 in string.gmatch( f2_arg1, "([^;]+)" ) do
			f2_local1[#f2_local1 + 1] = Engine.DLC_GetPackName( f2_local5 )
		end
		for f2_local2 = #f2_local1, 1, -1 do
			if f2_local1[f2_local2] and f2_local1[f2_local2] ~= "" and Engine.DLC_CanPurchasePackName( f2_local1[f2_local2] ) then
				f2_local0[#f2_local0 + 1] = f2_local1[f2_local2]
			end
		end
		if #f2_local0 == 1 or not Store.IsOneClickPurchaseEnabled() then
			Sns.OpenStoreLinkConfirmPopup( f2_arg0, f2_local0[1], true )
		elseif #f2_local0 > 1 then
			f2_local2 = Engine.GetLuiRoot()
			f2_local2:registerEventHandler( "igs_showProductPicker", function ( element, event )
				LUI.FlowManager.RequestAddMenu( nil, "store_multiple_options_popup", false, f2_arg0, false, {
					productData = event.productData,
					callback = function ( f4_arg0 )
						Sns.OpenStoreLinkConfirmPopup( f2_arg0, f4_arg0, true )
					end
				} )
				local f3_local0 = Engine.GetLuiRoot()
				f3_local0:registerEventHandler( "igs_showProductPicker", function ( element, event )
					
				end )
			end )
			Store.OneClickPurchase_ShowProductPicker( f2_arg0, f2_local0 )
		end
	end
}
function ChoseDlcOptions( f6_arg0 )
	local f6_local0 = {}
	if f6_arg0.productData and f6_arg0.callback then
		for f6_local1 = 1, #f6_arg0.productData, 1 do
			local f6_local4 = f6_local1
			f6_local0[#f6_local0 + 1] = {
				type = "UIGenericButton",
				id = "dlc_button_" .. #f6_local0,
				properties = {
					style = GenericButtonSettings.Styles.GlassButton,
					substyle = GenericButtonSettings.Styles.GlassButton.SubStyles.Popup,
					button_text = f6_arg0.productData[f6_local4].productName,
					dlcName = f6_arg0.productData[f6_local4].dlcName,
					button_action_func = function ( f7_arg0, f7_arg1 )
						f6_arg0.callback( f6_arg0.productData[f6_local4].dlcName )
						LUI.FlowManager.RequestLeaveMenu( f7_arg0 )
					end
				}
			}
		end
	end
	return f6_local0
end

function store_multiple_options_popup()
	return {
		type = "generic_selectionList_popup",
		id = "store_multiple_options_popup_id",
		properties = {
			popup_title = Engine.Localize( "@LUA_MENU_CHOOSE_DLC" ),
			popup_width = 600,
			popup_childfeeder = ChoseDlcOptions
		}
	}
end

LUI.MenuBuilder.registerPopupDef( "store_multiple_options_popup", store_multiple_options_popup )
