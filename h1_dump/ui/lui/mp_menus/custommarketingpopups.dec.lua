local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.CustomMarketingPopups = {}
LUI.CustomMarketingPopups.ShowCustomMarketingPopupsIfPossible = function ( f1_arg0, f1_arg1 )
	local f1_local0
	if f1_arg1 then
		f1_local0 = f1_arg1.controller
		if not f1_local0 then
		
		else
			if LUI.FlowManager.IsInStackRoot( "MarketingPopup" ) then
				return 
			end
			local f1_local1 = Engine.GetPlayerData( f1_local0, CoD.StatsGroup.Common, "depotData" )
			local f1_local2 = true
			if f1_local1 then
				f1_local2 = hasbit( f1_local1, 2 )
			end
			local f1_local3 = Engine.Loot_GetWeeklyReward( f1_local0 )
			if not f1_local3.viewed and #f1_local3.items > 0 then
				Engine.Loot_SetWeeklyRewardViewed( f1_local0 )
				local f1_local4 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.GUID, f1_local3.items[1].guid, StatsTable.Cols.ProdLevel )
				if f1_local4 == "LootDrop3" then
					LUI.CustomMarketingPopups.ShamrockPromo( {
						controller = f1_local0,
						rewardData = f1_local3
					} )
				elseif f1_local4 == "LootDrop5" then
					LUI.CustomMarketingPopups.DaysOfSummerPromo( {
						controller = f1_local0,
						rewardData = f1_local3
					} )
				end
			elseif not f1_local2 then
				LUI.CustomMarketingPopups.DepotOnboarding( {
					controller = f1_local0
				} )
				f1_local1 = setbit( f1_local1, 2 )
			end
			Engine.SetPlayerData( f1_local0, CoD.StatsGroup.Common, "depotData", f1_local1 )
		end
	end
	f1_local0 = Engine.GetFirstActiveController()
end

LUI.CustomMarketingPopups.DepotOnboarding = function ( f2_arg0 )
	local f2_local0 = 50
	local f2_local1 = 200
	local f2_local2
	if f2_arg0 then
		f2_local2 = f2_arg0.controller
		if not f2_local2 then
		
		else
			local f2_local3 = f2_local0
			local f2_local4 = Engine.Localize( "@DEPOT_MARKETING_SUBHEADER" )
			local f2_local5 = Engine.Localize( "@DEPOT_MARKETING_BODY_1" ) .. "<br/><br/>"
			local f2_local6 = Engine.Localize( "@DEPOT_MARKETING_BODY_2", f2_local3 or 0 )
			local f2_local7 = "<span class="green">" .. Engine.Localize( "@DEPOT_MARKETING_BODY_3" ) .. "</span>"
			local f2_local8 = "<h3>" .. f2_local4 .. "<br/>" .. f2_local5
			if f2_local3 and f2_local3 >= 1 then
				f2_local8 = f2_local8 .. f2_local6
			else
				f2_local8 = "<br/><br/>" .. f2_local8
			end
			LUI.FlowManager.RequestPopupMenu( self, "MarketingPopup", true, f2_local2, false, {
				title = "<span class="green"><h2>" .. Engine.ToUpperCase( Engine.Localize( "@DEPOT_MARKETING_HEADER" ) ) .. "</h2></span>",
				content_long = f2_local8 .. "</h3>",
				popup_action_title = f2_local7,
				call_to_action_length_offset = f2_local1,
				popup_image = "h1_motd_graves_depot",
				popup_action = LUI.MOTD.PopupActionType.DEPOT,
				template = LUI.MarketingPopup.DEPOT_ONBOARDING_TEMPLATE
			} )
		end
	end
	f2_local2 = Engine.GetFirstActiveController()
end

LUI.CustomMarketingPopups.ShamrockPromo = function ( f3_arg0 )
	local f3_local0
	if f3_arg0 then
		f3_local0 = f3_arg0.controller
		if not f3_local0 then
		
		else
			local f3_local1 = 86400
			local f3_local2 = 7
			local f3_local3 = ""
			local f3_local4 = math.floor( Engine.TimeUntilPromoExpires() / f3_local1 )
			local f3_local5 = 1
			if f3_local4 < 2 * f3_local2 then
				f3_local5 = 2
			elseif f3_local4 < f3_local2 then
				f3_local5 = 3
			end
			LUI.FlowManager.RequestPopupMenu( self, "MarketingPopup", true, f3_local0, false, {
				title = "<h2>" .. Engine.Localize( "@DEPOT_SHAMROCK_MOTD_TITLE" ) .. "</h2>",
				content_short = "<h3>" .. Engine.Localize( "@DEPOT_SHAMROCK_MOTD_SUBTITLE" ) .. "</h3>",
				content_long = "<h3>" .. Engine.Localize( "@DEPOT_SHAMROCK_MOTD_DESC_1" ) .. "<br/>" .. Engine.Localize( "@DEPOT_SHAMROCK_MOTD_DESC_2_WEEK" .. f3_local5 ) .. "</h3>",
				extraText1 = Engine.Localize( "@DEPOT_WEEK_X", f3_local5 ),
				popup_image = "h1_motd_shamrock",
				popup_imagestate = CoD.CreateState( -56, -86, 9, 7, CoD.AnchorTypes.All ),
				popup_action = LUI.MOTD.PopupActionType.DEPOT,
				template = LUI.MarketingPopup.SHAMROCK_PROMO_TEMPLATE
			} )
		end
	end
	f3_local0 = Engine.GetFirstActiveController()
end

LUI.CustomMarketingPopups.DaysOfSummerPromo = function ( f4_arg0 )
	local f4_local0
	if f4_arg0 then
		f4_local0 = f4_arg0.controller
		if not f4_local0 then
		
		else
			local f4_local1 = 86400
			local f4_local2 = 7
			local f4_local3 = ""
			local f4_local4 = math.floor( Engine.TimeUntilPromoExpires() / f4_local1 )
			local f4_local5 = math.floor( (5 * f4_local2 - f4_local4) / f4_local2 + 1 )
			local f4_local6 = "1"
			if f4_local4 < f4_local2 then
				f4_local6 = "2"
			end
			LUI.FlowManager.RequestPopupMenu( self, "MarketingPopup", true, f4_local0, false, {
				title = "<h2>" .. Engine.Localize( "@DEPOT_DOS_MOTD_TITLE" ) .. "</h2>",
				content_short = "<h3>" .. Engine.Localize( "@DEPOT_DOS_MOTD_SUBTITLE" ) .. "</h3>",
				content_long = "<h3>" .. Engine.Localize( "@DEPOT_DOS_MOTD_DESC_1" ) .. "<br/>" .. Engine.Localize( "@DEPOT_DOS_MOTD_DESC_2_WEEK" .. f4_local6 ) .. "</h3>",
				extraText1 = Engine.Localize( "@DEPOT_WEEK_X", f4_local5 ),
				popup_image = "h1_motd_dlc_1132x576_days_of_summer_debut",
				imageLeft = 0,
				imageTop = 0,
				imageRight = 50,
				imageBottom = 0,
				extraTextLeft = 30,
				extraTextTop = 10,
				content_longTop = -15,
				popup_action = LUI.MOTD.PopupActionType.DEPOT,
				template = LUI.MarketingPopup.SHAMROCK_PROMO_TEMPLATE
			} )
		end
	end
	f4_local0 = Engine.GetFirstActiveController()
end

LockTable( _M )
