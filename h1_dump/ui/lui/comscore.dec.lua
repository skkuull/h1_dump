local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
GameVariant = {
	SP = "sp",
	PublicMP = "mp_public",
	PrivateMP = "mp_private",
	LocalMP = "mp_local",
	Coop = "coop"
}
MatchResult = {
	Win = "win",
	Loss = "loss",
	Draw = "draw"
}
MarketingScreen = {
	MOTD = "motd",
	Featured = "featured"
}
ScreenID = {
	Unknown = "unknown",
	PlayOnline = "play_online",
	CaC = "create_a_class",
	PublicLobby = "public_lobby",
	MOTD = "motd",
	CommsPopup = "comms_popup",
	Depot = "depot",
	SupplyDrop = "supply_drop",
	MapSelect = "map_select"
}
StoreSource = {
	Unknown = "unknown",
	MenuButton = "menu_button",
	Marketing = "marketing",
	DlcLoot = "dlc_loot"
}
SpDifficulty = {
	"recruit",
	"regular",
	"hardened",
	"veteran"
}
SpLevel = {
	"induction",
	"atlas",
	"traffic",
	"fission",
	"aftermath",
	"manhunt",
	"utopia",
	"sentinel",
	"crash",
	"bio_lab",
	"collapse",
	"armada",
	"throttle",
	"df_baghdad",
	"captured",
	"terminus"
}
CampaignStartType = {
	New = "new",
	Resume = "resume"
}
EventType = {
	StorePurchase = "store_purchase",
	StoreEntry = "store_entry",
	StoreItemView = "store_item_browse",
	MarketingView = "crm_message_view",
	MarketingClick = "crm_message_click",
	SupplyDrop = "redeem_loot_drop",
	Prestige = "prestige",
	CreateClan = "create_clan",
	JoinClan = "join_clan",
	StartCampaign = "start_campaign",
	CreateAccount = "create_account",
	CollectionReward = "collection_reward",
	CraftItem = "craft_item",
	ExchangeLoot = "exchange_loot"
}
EventImmediate = {
	[EventType.StorePurchase] = true,
	[EventType.StoreEntry] = true,
	[EventType.StoreItemView] = false,
	[EventType.MarketingView] = false,
	[EventType.MarketingClick] = false,
	[EventType.SupplyDrop] = true,
	[EventType.Prestige] = true,
	[EventType.CreateClan] = true,
	[EventType.JoinClan] = true,
	[EventType.StartCampaign] = true,
	[EventType.CreateAccount] = true,
	[EventType.CollectionReward] = true,
	[EventType.CraftItem] = true,
	[EventType.ExchangeLoot] = true
}
IncludeGameInfo = {
	[EventType.StartCampaign] = true
}
CSData = {
	Enabled = false,
	Timer = nil,
	PendingEvent = nil,
	DoDebugPrint = false,
	StoreScreen = nil,
	StoreActionSource = nil
}
function DebugPrintComScore( f1_arg0 )
	if not CSData.DoDebugPrint then
		return 
	end
	local f1_local0 = "(LUI.ComScore) event"
	for f1_local4, f1_local5 in pairs( f1_arg0 ) do
		f1_local0 = f1_local0 .. " " .. f1_local4 .. "=" .. f1_local5
	end
	DebugPrint( f1_local0 )
end

function OnComscoreTimer( f2_arg0, f2_arg1 )
	if CSData.DoDebugPrint then
		DebugPrint( "(LUI.ComScore) timer event" )
	end
	PopPendingEvent()
end

function PopPendingEvent()
	LUI.UITimer.Stop( CSData.Timer )
	LUI.UITimer.Disable( CSData.Timer )
	local f3_local0 = CSData.PendingEvent
	CSData.PendingEvent = nil
	if f3_local0 then
		RecordEvent( f3_local0.controller, f3_local0.obj, false )
	end
end

function DelayedRecordEvent( f4_arg0, f4_arg1 )
	if CSData.DoDebugPrint and CSData.PendingEvent then
		DebugPrint( "(LUI.ComScore) dropped pending event " .. CSData.PendingEvent.obj.action_type )
	end
	CSData.PendingEvent = {
		controller = f4_arg0,
		obj = f4_arg1
	}
	LUI.UITimer.Enable( CSData.Timer )
	LUI.UITimer.Reset( CSData.Timer )
end

function RecordEvent( f5_arg0, f5_arg1, f5_arg2 )
	if CSData.PendingEvent then
		if CSData.DoDebugPrint then
			DebugPrint( "(LUI.ComScore) force pending event" )
		end
		PopPendingEvent()
	end
	DebugPrintComScore( f5_arg1 )
	local f5_local0 = f5_arg1.action_type
	f5_arg1.action_type = nil
	Engine.ComScoreRecordEvent( f5_arg0, f5_local0, f5_arg1 )
end

function AddSpGameInfo( f6_arg0, f6_arg1 )
	local f6_local0 = Engine.GetProfileData( "highestMission" ) or 0
	if f6_local0 == 0 then
		f6_arg1.game_level = "none"
	else
		f6_arg1.game_level = SpLevel[f6_local0] or "unknown"
	end
	f6_arg1.game_difficulty = SpDifficulty[(Engine.GetDvarInt( "g_gameskill" ) or 0) + 1] or "unknown"
end

function GetPlaylist()
	return Playlist.GetPreselectedCategory()
end

function AddMpGameInfo( f8_arg0, f8_arg1 )
	f8_arg1.game_mode = AAR.GetGameMode( f8_arg0 )
	f8_arg1.game_map = AAR.GetMapRefName( f8_arg0 )
	if IsPublicMatch() then
		f8_arg1.game_playlist = GetPlaylist()
	end
	local f8_local0 = 0
	local f8_local1 = 0
	local f8_local2 = MatchResult.Draw
	local f8_local3 = AAR.GetLocalPlayer( f8_arg0 )
	if f8_local3 ~= nil then
		f8_local0 = AAR.GetPlayerStat( f8_local3, "kills" )
		f8_local1 = AAR.GetPlayerStat( f8_local3, "deaths" )
		local f8_local4 = AAR.GetPlayerTeam( f8_local3 )
		local f8_local5 = Game.GetOmnvar( "ui_game_victor" )
		if f8_local5 == Teams.allies then
			if f8_local4 == "allies" then
				f8_local2 = MatchResult.Win
			elseif f8_local4 == "axis" then
				f8_local2 = MatchResult.Loss
			end
		elseif f8_local5 == Teams.axis then
			if f8_local4 == "axis" then
				f8_local2 = MatchResult.Win
			elseif f8_local4 == "allies" then
				f8_local2 = MatchResult.Loss
			end
		end
	end
	f8_arg1.match_kills = f8_local0
	f8_arg1.match_deaths = f8_local1
	f8_arg1.match_xp = AAR.GetRoundTotalXP( f8_arg0 )
	f8_arg1.match_result = f8_local2
	f8_arg1.match_duration = math.ceil( AAR.LastMatchDuration / 1000 )
end

function AddGameInfo( f9_arg0, f9_arg1 )
	local f9_local0 = nil
	if Engine.IsMultiplayer() then
		if IsPublicMatch() then
			f9_local0 = GameVariant.PublicMP
		elseif IsPrivateMatch() then
			f9_local0 = GameVariant.PrivateMP
		else
			f9_local0 = GameVariant.LocalMP
		end
		AddMpGameInfo( f9_arg0, f9_arg1 )
	else
		f9_local0 = GameVariant.SP
		AddSpGameInfo( f9_arg0, f9_arg1 )
	end
	f9_arg1.game_variant = f9_local0
end

function LogEvent( f10_arg0, f10_arg1, f10_arg2 )
	if not IsEnabled() then
		return 
	elseif f10_arg0 == nil then
		f10_arg0 = Engine.GetFirstActiveController()
	end
	local f10_local0 = nil
	if f10_arg2 ~= nil then
		f10_local0 = f10_arg2
	else
		f10_local0 = {}
	end
	f10_local0.action_type = f10_arg1
	if IncludeGameInfo[f10_arg1] then
		AddGameInfo( f10_arg0, f10_local0 )
	end
	if EventImmediate[f10_arg1] then
		RecordEvent( f10_arg0, f10_local0, true )
	else
		DelayedRecordEvent( f10_arg0, f10_local0 )
	end
end

f0_local0 = function ( f11_arg0 )
	return f11_arg0.lootType or "unknown"
end

f0_local1 = function ( f12_arg0 )
	return f12_arg0.lootName or "unknown"
end

f0_local2 = function ( f13_arg0 )
	return f13_arg0.lootRarity and f13_arg0.lootRarity.comScoreKey or "unknown"
end

function EnableComScore()
	CSData.Enabled = true
	local f14_local0 = "comscore_delay"
	CSData.Timer = LUI.UITimer.new( 500, {
		name = f14_local0
	}, nil, false, false, false, true )
	CSData.Timer.id = "comscore_timer"
	local f14_local1 = Engine.GetLuiRoot()
	f14_local1:registerEventHandler( f14_local0, OnComscoreTimer )
	f14_local1:addElement( CSData.Timer )
end

function IsEnabled()
	return CSData.Enabled
end

function SetStoreParams( f16_arg0, f16_arg1 )
	CSData.StoreScreen = f16_arg0
	CSData.StoreActionSource = f16_arg1
end

function GetStoreScreen()
	local f17_local0 = CSData.StoreScreen
	if not f17_local0 then
		f17_local0 = ScreenID.Unknown
	end
	return f17_local0
end

function GetStoreActionSource()
	local f18_local0 = CSData.StoreActionSource
	if not f18_local0 then
		f18_local0 = StoreSource.Unknown
	end
	return f18_local0
end

function LogStartCampaign( f19_arg0 )
	LogEvent( f19_arg0, EventType.StartCampaign, {
		campaign_start_type = CampaignStartType.New
	} )
end

function LogResumeCampaign( f20_arg0 )
	LogEvent( f20_arg0, EventType.StartCampaign, {
		campaign_start_type = CampaignStartType.Resume
	} )
end

function LogSupplyDrop( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	local f21_local0 = "unknown"
	if f21_arg4 > 0 then
		if string.sub( f21_arg3, -string.len( "_cp" ) ) == "_cp" then
			f21_local0 = "cod_points"
		else
			f21_local0 = "depot_credits"
		end
	else
		f21_local0 = "free"
	end
	local f21_local1 = ""
	local f21_local2 = ""
	local f21_local3 = ""
	local f21_local4 = ""
	for f21_local5 = 1, #f21_arg1, 1 do
		if f21_local5 ~= 1 then
			f21_local1 = f21_local1 .. ","
			f21_local2 = f21_local2 .. ","
			f21_local3 = f21_local3 .. ","
			f21_local4 = f21_local4 .. ","
		end
		local f21_local8 = f21_arg1[f21_local5]
		local f21_local9 = GetCollectionForItem( f21_local8.guid )
		f21_local1 = f21_local1 .. f0_local0( f21_local8 )
		f21_local2 = f21_local2 .. f0_local2( f21_local8 )
		f21_local3 = f21_local3 .. f0_local1( f21_local8 )
		if f21_local9 ~= nil then
			f21_local4 = f21_local4 .. f21_local9.setID
		end
	end
	local f21_local5 = {}
	if #f21_arg2 > 0 then
		local f21_local6 = f21_arg2[1].amount
		if not f21_local6 then
		
		else
			f21_local5.bonus_value = f21_local6
			f21_local5.codpoints_balance = GetCurrencyBalance( InventoryCurrencyType.CoDPoints, f21_arg0 )
			f21_local5.loot_category = f21_local1
			f21_local5.loot_cost = f21_arg4
			f21_local5.loot_currency = f21_local0
			f21_local5.depot_credit_balance = GetCurrencyBalance( InventoryCurrencyType.Credits, f21_arg0 )
			f21_local5.item_rarity = f21_local2
			f21_local5.item_id = f21_local3
			f21_local5.loot_collection = f21_local4
			f21_local5.loot_type = f21_arg3
			LogEvent( f21_arg0, EventType.SupplyDrop, f21_local5 )
		end
	end
	f21_local6 = 0
end

function LogPrestige( f22_arg0 )
	local f22_local0 = CombatRecord.GetRankInfo( f22_arg0 )
	LogEvent( f22_arg0, EventType.Prestige, {
		prestige_max = f22_local0.prestige
	} )
end

function LogCreateAccount( f23_arg0, f23_arg1 )
	LogEvent( f23_arg0, EventType.CreateAccount, {
		opt_in_flag = f23_arg1
	} )
end

function LogCreateClan( f24_arg0 )
	LogEvent( f24_arg0, EventType.CreateClan )
end

function LogJoinClan( f25_arg0 )
	LogEvent( f25_arg0, EventType.JoinClan )
end

function LogStoreEntry( f26_arg0 )
	local f26_local0 = {
		store_source = GetStoreScreen(),
		store_action_source = GetStoreActionSource()
	}
	local f26_local1 = Store.GetStoreRegion()
	if f26_local1 ~= nil then
		f26_local0.store_region = f26_local1
	end
	LogEvent( f26_arg0, EventType.StoreEntry, f26_local0 )
end

function LogStoreItemView( f27_arg0, f27_arg1 )
	LogEvent( f27_arg0, EventType.StoreItemView, {
		item_id = f27_arg1
	} )
end

function LogStorePurchase( f28_arg0, f28_arg1 )
	LogEvent( f28_arg0, EventType.StorePurchase, {
		item_id = f28_arg1
	} )
end

function LogMarketingView( f29_arg0, f29_arg1, f29_arg2 )
	LogEvent( f29_arg0, EventType.MarketingView, {
		crm_message_id = f29_arg1,
		crm_screen_id = f29_arg2
	} )
end

function LogMarketingClick( f30_arg0, f30_arg1, f30_arg2 )
	LogEvent( f30_arg0, EventType.MarketingClick, {
		crm_click_message_id = f30_arg1,
		crm_click_screen_id = f30_arg2
	} )
end

function LogCollectionReward( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg1.setReward
	LogEvent( f31_arg0, EventType.CollectionReward, {
		loot_category = f0_local0( f31_local0 ),
		loot_redeemed = f0_local1( f31_local0 )
	} )
end

function LogCraftItem( f32_arg0, f32_arg1, f32_arg2 )
	for f32_local0 = 1, #f32_arg1.setItems, 1 do
		local f32_local3 = f32_arg1.setItems[f32_local0]
		if f32_local3.guid == f32_arg2 then
			LogEvent( f32_arg0, EventType.CraftItem, {
				loot_category = f0_local0( f32_local3 ),
				item_id = f0_local1( f32_local3 ),
				loot_collection = f32_arg1.setID,
				item_rarity = f0_local2( f32_local3 ),
				loot_amount = f32_local3.price
			} )
			return 
		end
	end
end

function LogDismantleItem( f33_arg0, f33_arg1, f33_arg2 )
	LogEvent( f33_arg0, EventType.ExchangeLoot, {
		loot_amount = f33_arg2,
		loot_category = f0_local0( f33_arg1 ),
		loot_rarity = f0_local2( f33_arg1 ),
		loot_redeemed = f0_local1( f33_arg1 )
	} )
end

LockTable( _M )
