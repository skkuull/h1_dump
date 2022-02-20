NewsType = {
	News = 0,
	Item = 1
}
FeedCategory = {
	MOTD = 0,
	News = 1,
	Clans = 2,
	Squads = 3,
	Social = 4
}
FeedSubCategory = {
	{
		News = 0,
		Event = 1,
		NewItems = 2,
		Sale = 3
	},
	{
		GettingStarted = 0,
		Invite = 1,
		ClanWarUpdate = 2
	},
	{
		Default = 0
	},
	{
		AverageScore = 0,
		GamesPlayed = 1,
		TimePlayed = 2,
		Wins = 3,
		WinStreak = 4,
		KDRatio = 5,
		Kills = 6,
		KillStreak = 7
	}
}
StoreCategory = {
	SeasonPass = 1,
	MapPacks = 2,
	PremiumPersonalizationPacks = 3,
	PersonalizationPacks = 4,
	PremiumExoPacks = 5,
	ExoPacks = 6
}
local f0_local0 = function ()
	if Engine.IsCurrentGen() then
		return 4
	else
		return 10
	end
end

Sns = {
	Dims = {
		Thumbnail = {
			width = 205,
			height = 155,
			TabHeight = 25,
			TabWidth = 125
		},
		DefaultArticleImage = {
			width = 320,
			height = 320,
			maxWidth = 370,
			maxHeight = 340
		}
	},
	MaxVisibleArticles = 4,
	MaxPrefetchArticles = f0_local0(),
	HListOffset = 15,
	HListSpacing = 0,
	TickerCategory = FeedCategory.News,
	TickerIndex = 0,
	TickerScrollSpeed = 1000,
	TickerUpdateInterval = 12000,
	UpdateScopedArticleInfo = function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1 or LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
		local f2_local1 = Store.GetCompleteItemInfoByIndex( f2_local0.category, f2_local0.itemIndex )
		if f2_local1 == nil then
			return 
		end
		local f2_local2 = Store.IsItemPurchasedByIndex( f2_local0.category, f2_local0.itemIndex )
		local f2_local3 = {
			itemId = f2_local0.articleId
		}
		local f2_local4 = f2_local1.title
		if not f2_local4 then
			f2_local4 = "Content " .. itemId .. " has no title"
		end
		f2_local3.title = f2_local4
		f2_local4 = f2_local1.details
		if not f2_local4 then
			f2_local4 = "Content " .. itemId .. " has no text"
		end
		f2_local3.details = f2_local4
		f2_local3.image = f2_local1.image
		f2_local3.thumbName = f2_local1.thumbName
		f2_local3.cost = f2_local1.cost
		f2_local3.sale = f2_local1.sale
		f2_local3.endTime = 0
		f2_local3.purchased = f2_local2
		f2_local3.seen_index = f2_local1.seenIndex
		f2_local0.articleInfo = f2_local3
		f2_local0.articleInfo.details = f2_local0.articleInfo.details .. "\n"
	end,
	GetScopedArticleInfo = function ( f3_arg0, f3_arg1 )
		local f3_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f3_arg0 )
		if f3_arg1 and f3_local0.articleInfo then
			return f3_local0.articleInfo[f3_arg1]
		else
			return f3_local0.articleInfo
		end
	end,
	IsRedeemCodeDisabled = function ()
		return Engine.GetDvarInt( "ui_disableTokenRedemption" ) == 1
	end,
	IsStoreDisabled = function ()
		return Engine.GetDvarInt( "ui_disableInGameStore" ) == 1
	end,
	SetContextualMenuLocation = function ( f6_arg0, f6_arg1 )
		Engine.SetStoreEnterTimestamp()
		LUI.ComScore.SetStoreParams( f6_arg0, f6_arg1 )
	end,
	OpenStoreLinkConfirmPopup = function ( f7_arg0, f7_arg1 )
		local f7_local0 = {
			callback_params = {
				dlcName = f7_arg1
			}
		}
		if Store.IsOneClickPurchaseEnabled() then
			Sns.SetContextualMenuLocation( LUI.ComScore.ScreenID.CaC, LUI.ComScore.StoreSource.DlcLoot )
			Store.OneClickPurchase_ShowPurchaseDialog( f7_arg0, f7_arg1 )
		else
			local f7_local1 = Engine.GetLuiRoot()
			if LUI.FlowManager.IsInStack( f7_local1.flowManager, "menu_xboxlive_privatelobby" ) or LUI.FlowManager.IsInStack( f7_local1.flowManager, "menu_xboxlive_lobby" ) then
				LUI.FlowManager.RequestAddMenu( self, "goto_store_leave_lobby", true, f7_arg0, false, f7_local0 )
			else
				LUI.FlowManager.RequestAddMenu( self, "goto_store", true, f7_arg0, false, f7_local0 )
			end
		end
	end,
	OpenStoreMenu = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
		local f8_local0 = Engine.GetOnlineGame()
		if not f8_local0 then
			f8_local0 = Engine.GetDvarBool( "ui_onlineRequired" )
		end
		assert( f8_local0 )
		DebugPrint( "Sns.OpenStoreMenu called." )
		if not f8_local0 then
			LUI.FlowManager.RequestAddMenu( self, "store_live_error", false, f8_arg0, false )
			return false
		elseif not Store.IsReady() then
			LUI.FlowManager.RequestAddMenu( self, "store_isupdating_error", false, f8_arg0, false )
		elseif Sns.IsStoreDisabled() then
			if Engine.IsPS4() then
				Store.ShowEmptyStoreDialog( f8_arg0 )
			else
				LUI.FlowManager.RequestAddMenu( self, "store_disabled_error", false, f8_arg0, false )
			end
		elseif Engine.UserIsGuest( f8_arg0 ) then
			LUI.FlowManager.RequestAddMenu( self, "store_noguests_error", false, f8_arg0, false )
		elseif Engine.IsPS3() and f8_arg0 ~= 0 then
			LUI.FlowManager.RequestAddMenu( self, "mp_wrong_controller_popup", false, f8_arg0, false )
		else
			Engine.SetDvarBool( "ui_inGameStoreOpen", true )
			Store.ClearContentCache( f8_arg0 )
			Sns.SetContextualMenuLocation( f8_arg1, f8_arg2 )
			LUI.ComScore.LogStoreEntry( f8_arg0 )
			Engine.ExecNow( "incnosplitscreencontrol menu_STORE" )
			local f8_local1 = {
				initialDlcName = f8_arg4
			}
			if Engine.GetDvarInt( "igs_sosp" ) == 1 or Engine.IsXbox360() == false then
				LUI.FlowManager.RequestAddMenu( self, "store_main", true, f8_arg0, f8_arg3, f8_local1 )
			else
				LUI.FlowManager.RequestAddMenu( self, "finding_player_purchases", true, f8_arg0, false, {
					storeData = f8_local1
				} )
			end
			return true
		end
		return false
	end,
	OpenDepotMenu = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		LUI.FlowManager.RequestAddMenu( self, "MPDepotMenu", true, f9_arg0, f9_arg2, data )
	end,
	OpenCoDAnywherePopup = function ( f10_arg0 )
		DebugPrint( "Sns.OpenCoDAnywherePopup called." )
		local f10_local0 = Engine.GetLuiRoot()
		if f10_local0:IsMenuInStack( "menu_xboxlive_lobby" ) then
			PromptToLeaveLobby( nil, {
				controller = f10_arg0
			}, OpenCoDAnywhere, Engine.Localize( "@LUA_MENU_LEAVE_LOBBY_FOR_REGISTRATION" ) )
		else
			OpenCoDAnywhere( nil, {
				controller = f10_arg0
			} )
		end
	end,
	GetTickerHeader = function ( f11_arg0, f11_arg1 )
		return SocialFeed.GetArticleHeader( f11_arg0, f11_arg1 )
	end
}
function RefreshThumbnails( f12_arg0, f12_arg1 )
	f12_arg0:closeChildren()
	f12_arg0:clearSavedState()
	f12_arg0:processEvent( {
		name = "menu_refresh"
	} )
	if LUI.FlowManager.IsMenuTopmost( Engine.GetLuiRoot(), "store_main" ) then
		f12_arg0:processEvent( {
			name = "gain_focus"
		} )
	end
	f12_arg0:processEvent( {
		name = "update_sale_banners"
	} )
	f12_arg0:processEvent( {
		name = "update_new_banners"
	} )
	f12_arg0:processEvent( {
		name = "update_purchase_checkboxes"
	} )
end

Sns.OpenSocialFeed = function ( f13_arg0, f13_arg1, f13_arg2 )
	if Engine.IsUserAGuest( f13_arg1 ) then
		LUI.FlowManager.RequestAddMenu( f13_arg0, "mp_no_guest_popup", false, f13_arg1, false )
	else
		Squad.UpdateReportPlayerCardCache( f13_arg1 )
		LUI.FlowManager.RequestAddMenu( f13_arg0, "social_feed_main", true, f13_arg1, false, {
			fromLobby = f13_arg2 or false
		} )
	end
end

Sns.SocialFeedEnabled = function ()
	local f14_local0 = false
	if Engine.GetDvarInt( "social_feed_motd_active" ) == 1 then
		f14_local0 = true
	elseif Engine.GetDvarInt( "social_feed_news_active" ) == 1 then
		f14_local0 = true
	elseif Engine.GetDvarInt( "social_feed_clans_active" ) == 1 then
		f14_local0 = true
	elseif Engine.GetDvarInt( "social_feed_squads_active" ) == 1 then
		f14_local0 = true
	elseif Engine.GetDvarInt( "social_feed_social_active" ) == 1 then
		f14_local0 = true
	end
	return f14_local0
end

Sns.ChangeTickerStory = function ( f15_arg0, f15_arg1 )
	local f15_local0 = Engine.GetControllerForLocalClient( 0 )
	local f15_local1 = SocialFeed.GetArticleCount( f15_local0, Sns.TickerCategory )
	Sns.TickerIndex = Sns.TickerIndex + 1
	if f15_local1 <= Sns.TickerIndex then
		local f15_local2 = Sns.TickerCategory
		repeat
			f15_local2 = f15_local2 + 1
			if f15_local2 > FeedCategory.Social then
				f15_local2 = FeedCategory.News
			end
			if SocialFeed.GetArticleCount( f15_local0, f15_local2 ) > 0 then
				Sns.TickerCategory = f15_local2
				break
			else
				
			end
		until f15_local2 == Sns.TickerCategory
		Sns.TickerIndex = 0
	end
	if f15_arg0.tickerText and f15_local1 > Sns.TickerIndex then
		f15_arg0.nextText:setText( Sns.GetTickerHeader( Sns.TickerCategory, Sns.TickerIndex ) )
		f15_arg0.tickerText:animateToState( "transition_to_next", Sns.TickerScrollSpeed )
		f15_arg0.nextText:animateToState( "transition_to_next", Sns.TickerScrollSpeed )
	end
end

Sns.TickerScrollEnded = function ( f16_arg0, f16_arg1 )
	f16_arg0.tickerText:setText( Sns.GetTickerHeader( Sns.TickerCategory, Sns.TickerIndex ) )
	f16_arg0.tickerText:animateToState( "default", 0 )
	f16_arg0.nextText:animateToState( "default", 0 )
end

Sns.GetArticleImageDims = function ( f17_arg0, f17_arg1 )
	local f17_local0 = Sns.Dims.DefaultArticleImage.width
	local f17_local1 = Sns.Dims.DefaultArticleImage.height
	if f17_arg0 then
		f17_local0 = math.min( f17_arg0, Sns.Dims.DefaultArticleImage.maxWidth )
	end
	if f17_arg1 then
		f17_local1 = math.min( f17_arg1, Sns.Dims.DefaultArticleImage.maxHeight )
	end
	return f17_local0, f17_local1
end

Sns.IsSeasonPassAccessible = function ()
	return not Engine.IsCurrentLanguageJapanese()
end

