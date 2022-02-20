local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MarketingLocation = {
	MOTD = 1,
	Featured = 2,
	Ban = 3
}
LUI.MOTD = {}
LUI.MOTD.COLORS = {
	Colors.white,
	{
		r = 0.75,
		g = 0.75,
		b = 0.75
	},
	{
		r = 0.27,
		g = 0.71,
		b = 0.33
	},
	{
		r = 1,
		g = 0.79,
		b = 0.41
	},
	{
		r = 0.96,
		g = 0.31,
		b = 0.31
	}
}
LUI.MOTD.ActionType = {
	POPUP = "popup",
	STORE = "store",
	DEPOT = "depot",
	REGISTRATION = "registration"
}
LUI.MOTD.PopupActionType = {
	STORE = "store",
	DEPOT = "depot",
	REGISTRATION = "registration"
}
LUI.MOTD.ViewedChannels = {}
LUI.MOTD.haveCheckedMarketingQueue = false
function GetDefaultPanelData()
	local f1_local0 = {}
	LUI.MOTD.SingleTestTemplate = {
		messageID = "overcharged",
		image = "h1_motd_featured_temp",
		h1_header = "<h1><span class="green">DAT DOUBLE XP</span></h1>",
		h2_header = "<h2><span class="red">GET WIT IT</span></h2>",
		h3_header = "<h3><span class="yellow">THIS CAN'T BE REAL</span></h3>",
		call_to_action = "DOUBLE XP WEEKEND!",
		action = LUI.MOTD.ActionType.POPUP,
		body = "<body>Get ready for a full weekend of fun times with double XP for Call of Duty: Modern Warfare. With this double XP weekend you'll get double the normal experience for any and all content that gives experience.<br/><br/><i>*The more xp you earn the more progress you make towards prestige</i></body>",
		popup_call_to_action = "DOUBLE XP FOR THIS WEEKEND ONLY",
		popup_image = "h1_motd_template_1_2",
		popup_action = LUI.MOTD.PopupActionType.BUY,
		templateNum = 1
	}
	LUI.MOTD.AllTestTemplates = {
		{
			messageID = "overcharged",
			image = "h1_motd_featured_temp",
			h1_header = "<h1><span class="green">DAT DOUBLE XP</span></h1>",
			h2_header = "<h2><span class="red">GET WIT IT</span></h2>",
			h3_header = "<h3><span class="yellow">THIS CAN'T BE REAL</span></h3>",
			call_to_action = "DOUBLE XP WEEKEND!",
			action = LUI.MOTD.ActionType.POPUP,
			body = "<body>Get ready for a full weekend of fun times with double XP for Call of Duty: Modern Warfare. With this double XP weekend you'll get double the normal experience for any and all content that gives experience.<br/><br/><i>*The more xp you earn the more progress you make towards prestige</i></body>",
			popup_call_to_action = "DOUBLE XP FOR THIS WEEKEND ONLY",
			popup_image = "h1_motd_template_1_2",
			popup_action = LUI.MOTD.PopupActionType.BUY,
			templateNum = 1
		},
		{
			messageID = "overcharged",
			image = "h1_motd_featured_temp",
			h1_header = "<h1><span class="green">DAT DOUBLE XP</span></h1>",
			h2_header = "<h2><span class="grey">GET WIT IT</span></h2>",
			h3_header = "<h3><span class="white">THIS CAN'T BE REAL</span></h3>",
			call_to_action = "DOUBLE XP WEEKEND!",
			action = LUI.MOTD.ActionType.POPUP,
			body = "<body>Get ready for a full weekend of fun times with double XP for Call of Duty: Modern Warfare. With this double XP weekend you'll get double the normal experience for any and all content that gives experience.<br/><br/><i>*The more xp you earn the more progress you make towards prestige</i></body>",
			popup_call_to_action = "DOUBLE XP FOR THIS WEEKEND ONLY",
			popup_image = "h1_motd_template_1_2",
			popup_action = LUI.MOTD.PopupActionType.BUY,
			templateNum = 2
		},
		{
			messageID = "overcharged",
			image = "h1_motd_featured_temp",
			h1_header = "<h1><span class="green">DAT DOUBLE XP</span></h1>",
			h2_header = "<h2><span class="red">GET WIT IT</span></h2>",
			h3_header = "<h3><span class="yellow">THIS CAN'T BE REAL</span></h3>",
			call_to_action = "DOUBLE XP WEEKEND!",
			action = LUI.MOTD.ActionType.POPUP,
			body = "<body>Get ready for a full weekend of fun times with double XP for Call of Duty: Modern Warfare. With this double XP weekend you'll get double the normal experience for any and all content that gives experience.<br/><br/><i>*The more xp you earn the more progress you make towards prestige</i></body>",
			popup_call_to_action = "DOUBLE XP FOR THIS WEEKEND ONLY",
			popup_image = "h1_motd_template_3",
			popup_action = LUI.MOTD.PopupActionType.BUY,
			templateNum = 3
		},
		{
			messageID = "overcharged",
			image = "h1_motd_featured_temp",
			h1_header = "<h1><span class="green">DAT DOUBLE XP</span></h1>",
			h2_header = "<h2><span class="red">GET WIT IT</span></h2>",
			h3_header = "<h3><span class="yellow">THIS CAN'T BE REAL</span></h3>",
			call_to_action = "DOUBLE XP WEEKEND!",
			action = LUI.MOTD.ActionType.POPUP,
			body = "<body>Get ready for a full weekend of fun times with double XP for Call of Duty: Modern Warfare. With this double XP weekend you'll get double the normal experience for any and all content that gives experience.</body>",
			popup_call_to_action = "DOUBLE XP FOR THIS WEEKEND ONLY",
			popup_image = "h1_motd_template_4",
			popup_action = LUI.MOTD.PopupActionType.BUY,
			templateNum = 4
		},
		{
			messageID = "overcharged",
			image = "h1_motd_featured_temp",
			h1_header = "<h1><span class="green">DAT DOUBLE XP</span></h1>",
			h2_header = "<h2><span class="red">GET WIT IT</span></h2>",
			h3_header = "<h3><span class="yellow">THIS CAN'T BE REAL</span></h3>",
			call_to_action = "DOUBLE XP WEEKEND!",
			action = LUI.MOTD.ActionType.POPUP,
			body = "<body>Get ready for a full weekend of fun times with double XP for Call of Duty: Modern Warfare. With this double XP weekend you'll get double the normal experience for any and all content that gives experience.<br/><br/><i>*The more xp you earn the more progress you make towards prestige</i></body>",
			popup_call_to_action = "DOUBLE XP FOR THIS WEEKEND ONLY",
			popup_image = "h1_motd_template_5",
			popup_action = LUI.MOTD.PopupActionType.BUY,
			templateNum = 5
		}
	}
	local f1_local1 = Engine.GetDvarInt( "ui_marketing" )
	if f1_local1 ~= nil and f1_local1 ~= 0 then
		if f1_local1 == 5 then
			f1_local0 = LUI.MOTD.AllTestTemplates
		elseif f1_local1 == 6 then
			f1_local0 = LUI.MOTD.SingleTestTemplate
		else
			f1_local0 = LUI.MOTD.AllTestTemplates
		end
	end
	return f1_local0
end

function CanReadReserveData( f2_arg0 )
	return true
end

function HasSeenMOTDToday( f3_arg0 )
	local f3_local0, f3_local1, f3_local2 = Engine.GetCurrentDayMonthYear()
	local f3_local3, f3_local4 = nil
	f3_local3 = Engine.GetPlayerData( f3_arg0, CoD.StatsGroup.Common, "motd_today_day" )
	f3_local4 = Engine.GetPlayerData( f3_arg0, CoD.StatsGroup.Common, "motd_today_month" )
	if f3_local0 ~= f3_local3 then
		return false
	elseif f3_local1 ~= Engine.GetPlayerData( f3_arg0, CoD.StatsGroup.Common, "motd_today_month" ) then
		return false
	else
		return true
	end
end

function SetHasSeenMOTDToday( f4_arg0 )
	local f4_local0, f4_local1, f4_local2 = Engine.GetCurrentDayMonthYear()
	Engine.SetPlayerData( f4_arg0, CoD.StatsGroup.Common, "motd_today_day", f4_local0 )
	Engine.SetPlayerData( f4_arg0, CoD.StatsGroup.Common, "motd_today_month", f4_local1 )
end

function GetMarketingData( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0 )
	if not f5_arg2 then
		f5_arg2 = 0
	end
	local f5_local0 = Engine.MarketingGetMessage( f5_arg0, f5_arg1, f5_arg2 )
	if f5_local0 ~= nil then
		Engine.MarketingReportMessageViewed( f5_arg0, f5_arg1, f5_arg2 )
		if LUI.MOTD.ViewedChannels[f5_arg1] == nil then
			LUI.MOTD.ViewedChannels[f5_arg1] = {}
		end
		LUI.MOTD.ViewedChannels[f5_arg1][f5_arg0] = true
		LUI.ComScore.LogMarketingView( f5_arg0, f5_local0.messageID, LUI.MOTD.GetComScoreScreenForChannel( f5_arg1 ) )
	end
	local f5_local1 = nil
	if f5_local0 ~= nil then
		f5_local1 = f5_local0
		f5_local1.isMOTD = f5_arg1 == LUI.MarketingLocation.MOTD
		return f5_local1
	else
		return nil
	end
end

LUI.MOTD.GetComScoreScreenForChannel = function ( f6_arg0 )
	local f6_local0 = LUI.ComScore.MarketingScreen.Menu
	if f6_arg0 == LUI.MarketingLocation.MOTD then
		f6_local0 = LUI.ComScore.MarketingScreen.MOTD
	elseif f6_arg0 == LUI.MarketingLocation.Featured then
		f6_local0 = LUI.ComScore.MarketingScreen.Featured
	end
	return f6_local0
end

LUI.MOTD.AddMarketingData = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = 0
	local f7_local1 = GetMarketingData( f7_arg0, f7_arg1, f7_local0 )
	while f7_local1 do
		table.insert( f7_arg2, f7_local1 )
		f7_local0 = f7_local0 + 1
		f7_local1 = GetMarketingData( f7_arg0, f7_arg1, f7_local0 )
	end
	if f7_arg1 ~= LUI.MarketingLocation.Featured then
		Engine.MarketingClearLocation( f7_arg0, f7_arg1 )
	end
end

LUI.MOTD.TryForceOpenMOTD = function ()
	if Engine.IsMultiplayer() and Lobby.IsInPrivateParty() and not Lobby.IsPrivatePartyHost() then
		return 
	else
		local f8_local0 = Engine.GetFirstActiveController()
		if not Engine.IsProfileSignedIn( f8_local0 ) then
			return false
		elseif not CanReadReserveData( f8_local0 ) then
			return false
		elseif HasSeenMOTDToday( f8_local0 ) and Engine.GetDvarBool( "marketing_motd_once_per_day" ) then
			return false
		elseif LUI.FlowManager.IsInStackRoot( "motd_main" ) then
			return false
		else
			local f8_local1 = {}
			LUI.MOTD.AddMarketingData( f8_local0, LUI.MarketingLocation.MOTD, f8_local1 )
			LUI.MOTD.haveCheckedMarketingQueue = true
			if #f8_local1 > 0 then
				SetHasSeenMOTDToday( f8_local0 )
				LUI.FlowManager.RequestPopupMenu( self, "motd_main", true, f8_local0, false, {
					popupDataQueue = f8_local1
				} )
				return true
			else
				local f8_local2 = Engine.GetLuiRoot()
				f8_local2:dispatchEventToRoot( {
					name = "processMarketingPopups"
				} )
				Engine.Exec( "checkforPreOrder " )
				return false
			end
		end
	end
end

LUI.MOTD.GetMOTDPlayerData = function ( f9_arg0 )
	local f9_local0 = {
		"welcome_screen_count",
		"cod_anywhere_screen_count",
		"season_pass_upsell_count",
		"preorder_offer_count",
		"motd_today_day",
		"motd_today_month"
	}
	local f9_local1 = {}
	for f9_local5, f9_local6 in pairs( f9_local0 ) do
		f9_local1[f9_local6] = Engine.GetPlayerData( f9_arg0, CoD.StatsGroup.Common, f9_local6 )
	end
	return f9_local1
end

LUI.MOTD.RestoreMOTDPlayerData = function ( f10_arg0, f10_arg1 )
	for f10_local3, f10_local4 in pairs( f10_arg1 ) do
		Engine.SetPlayerData( f10_arg0, CoD.StatsGroup.Common, f10_local3, f10_local4 )
	end
end

LUI.MOTD.ResizeImageToFitSquare = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg1
	local f11_local1 = f11_arg1
	local f11_local2, f11_local3 = GetMaterialDimensions( f11_arg0 )
	if f11_local2 ~= f11_local3 then
		if f11_arg1 - f11_local2 < f11_arg1 - f11_local3 then
			f11_local0 = f11_arg1
			f11_local1 = f11_local0 * f11_local3 / f11_local2
		else
			f11_local0 = f11_local1 * f11_local2 / f11_local3
			f11_local1 = f11_arg1
		end
	end
	return f11_local0, f11_local1
end

LUI.MOTD.new = function ( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg1
	local f12_local1 = f12_arg1.popupDataQueue
	if f12_local1 and #f12_local1 > 0 then
		f12_local0 = table.remove( f12_local1, 1 )
	end
	local f12_local2 = {
		h1Header = f12_local0.title,
		h2Header = f12_local0.content_short,
		h3Header = f12_local0.h3_header,
		body = f12_local0.content_long,
		bodyTop = f12_local0.content_longTop,
		image = f12_local0.popup_image or f12_local0.image,
		imageLeft = f12_local0.imageLeft,
		imageTop = f12_local0.imageTop,
		imageRight = f12_local0.imageRight,
		imageBottom = f12_local0.imageBottom,
		popupAction = f12_local0.popup_action,
		extraTextLeft = f12_local0.extraTextLeft,
		extraTextTop = f12_local0.extraTextTop,
		action = f12_local0.action,
		callToAction = f12_local0.popup_action_title or f12_local0.action_title,
		item_name = f12_local0.item,
		noHtml = f12_local0.noHtml,
		debug_id = f12_local0.debug_id,
		templateNum = f12_local0.template or 1
	}
	DebugPrint( "\nOpening MOTD popup:" )
	for f12_local6, f12_local7 in pairs( f12_local2 ) do
		DebugPrint( "	[" .. f12_local6 .. "] = [" .. tostring( f12_local7 ) .. "]" )
	end
	DebugPrint( "\n" )
	return LUI.MarketingPopup.Base( f12_arg0, f12_local2, f12_local1 )
end

LUI.MenuBuilder.registerPopupType( "motd_main", LUI.MOTD.new )
LockTable( _M )
