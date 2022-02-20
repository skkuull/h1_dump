function sns_category_window( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.CreateState( GenericMenuDims.menu_left, GenericMenuDims.menu_top, GenericMenuDims.menu_right_standard, nil, CoD.AnchorTypes.TopLeft )
	f1_local0.height = 500
	local self = LUI.UIElement.new( f1_local0 )
	self.id = "sns_category_window_id"
	local self = LUI.UIElement.new( CoD.CreateState( 1, 1, -1, 0, CoD.AnchorTypes.All ) )
	local f1_local3 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local3.spacing = 0
	local self = LUI.UIVerticalList.new( f1_local3 )
	self.id = "category_list_id"
	self.feeder = f1_arg1.feeder( self, f1_arg1 )
	self:addElement( self )
	self:addElement( self )
	return self
end

function OnSnsThumbnailUpdatePurchaseCheckboxes( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
	local f2_local1 = Store.IsItemPurchasedByIndex( f2_local0.category, f2_arg0.properties.item_index )
	local f2_local2 = f2_local0.articleInfoList[f2_arg0.properties.article_index]
	local f2_local3
	if f2_local2.productGroup == nil or f2_local2.productGroup == "" then
		f2_local3 = false
	else
		f2_local3 = true
	end
	local f2_local4 = f2_arg0:getChildById( "purchased_text_id" )
	if f2_local3 then
		local f2_local5 = Store.GetProductGroupInfo( f2_local0.category, f2_local2.productGroup )
		f2_local4:setText( Engine.Localize( "@LUA_MENU_PURCHASED_COUNT_CAPS", f2_local5.num_of_items_purchased, f2_local5.total_items ) )
	else
		f2_local4:setText( Engine.Localize( "@LUA_MENU_PURCHASED_CAPS" ) )
	end
	local f2_local6 = f2_arg0
	local f2_local5 = f2_arg0.animateToState
	local f2_local7
	if f2_local1 or f2_local3 then
		f2_local7 = "purchased"
		if not f2_local7 then
		
		else
			f2_local5( f2_local6, f2_local7, 0 )
		end
	end
	f2_local7 = "default"
end

function OnSnsThumbnailUpdateSaleBanners( f3_arg0, f3_arg1 )
	local f3_local0 = Sns.GetScopedArticleInfo( f3_arg0, "sale" )
	local f3_local1 = f3_arg0
	local f3_local2 = f3_arg0.animateToState
	local f3_local3
	if f3_local0 and f3_local0 > 0 then
		f3_local3 = "default"
		if not f3_local3 then
		
		else
			f3_local2( f3_local1, f3_local3, 0 )
		end
	end
	f3_local3 = "hidden"
end

function OnSnsThumbnailUpdateNewBanners( f4_arg0, f4_arg1 )
	local f4_local0 = Sns.GetScopedArticleInfo( f4_arg0 )
	local f4_local1 = LUI.FlowManager.GetMenuScopedDataFromElement( f4_arg0 )
	local f4_local2 = f4_arg0.properties.seen_index
	local f4_local3 = true
	if f4_local1.viewedNewItemIndex ~= nil and f4_local1.viewedNewItemIndex == f4_arg0.properties.item_index then
		f4_local3 = false
	elseif f4_local2 ~= nil and f4_local2 ~= -1 then
		f4_local3 = Store.GetNewStoreItemBreadcrumbState( f4_local2 )
	end
	local f4_local4 = f4_arg0
	local f4_local5 = f4_arg0.animateToState
	local f4_local6
	if not f4_local3 then
		f4_local6 = "default"
		if not f4_local6 then
		
		else
			f4_local5( f4_local4, f4_local6, 0 )
		end
	end
	f4_local6 = "hidden"
end

function sns_thumbnail( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.TextSettings.TitleFontTinyBold
	local self = LUI.UIButton.new( CoD.CreateState( 0, 0, Sns.Dims.Thumbnail.width, Sns.Dims.Thumbnail.height, CoD.AnchorTypes.TopLeft ) )
	self.id = "sns_thumbnail_id"
	local f5_local2 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f5_local2.height = Sns.Dims.Thumbnail.TabHeight
	f5_local2.width = Sns.Dims.Thumbnail.TabWidth
	f5_local2.alpha = 0
	local self = LUI.UIBackgroundPanel.new( f5_local2, {
		item_index = f5_arg1.item_index,
		article_index = f5_arg1.article_index,
		borderAlpha = 0.45
	} )
	self.id = "tab_bkg"
	self:registerAnimationState( "purchased", {
		alpha = 1
	} )
	self:registerEventHandler( "update_purchase_checkboxes", OnSnsThumbnailUpdatePurchaseCheckboxes )
	local f5_local4 = CoD.CreateState( 10, 5, nil, 0, CoD.AnchorTypes.TopLeftRight )
	f5_local4.height = f5_local0.Height
	f5_local4.font = f5_local0.Font
	f5_local4.color = Colors.s1.text_focused
	f5_local4.alignment = LUI.Alignment.Left
	local self = LUI.UIText.new( f5_local4 )
	self.id = "purchased_text_id"
	self.properties = {
		glowColor = Colors.generic_highlight_glow
	}
	self:setText( Engine.Localize( "@LUA_MENU_PURCHASED_CAPS" ) )
	self:addElement( self )
	self:addElement( self )
	local f5_local6 = CoD.CreateState( 0, Sns.Dims.Thumbnail.TabHeight, 0, 0, CoD.AnchorTypes.All )
	local self = LUI.UIBackgroundPanel.new( f5_local2, {
		file_id = f5_arg1.file_id,
		thumbName = f5_arg1.thumbName,
		item_id = f5_arg1.item_id,
		seen_index = f5_arg1.seen_index,
		item_index = f5_arg1.item_index,
		borderAlpha = 0.45
	} )
	self.id = "img_bkg"
	local f5_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f5_local8.width = 186
	f5_local8.height = 93
	f5_local8.alpha = 0
	local f5_local9 = LUI.MenuBuilder.BuildRegisteredType( "ContentServerImage", {
		file_id = f5_arg1.file_id,
		thumbName = f5_arg1.thumbName,
		defAnimState = f5_local8
	} )
	f5_local9.id = "sns_thumbnail_image"
	f5_local9:registerAnimationState( "visible", {
		alpha = 1
	} )
	f5_local9:registerEventHandler( "download_complete", function ( element, event )
		local f6_local0 = element:getParent()
		f6_local0:processEvent( {
			name = "done_loading"
		} )
	end )
	f5_local9:registerEventHandler( "material_lost", function ( element, event )
		local f7_local0 = element:getParent()
		f7_local0:processEvent( {
			name = "start_loading"
		} )
	end )
	f5_local9:registerEventHandler( "start_loading", MBh.AnimateToState( "default", 0 ) )
	f5_local9:registerEventHandler( "done_loading", MBh.AnimateToState( "visible", 150 ) )
	self:addElement( f5_local9 )
	local f5_local10 = CoD.CreateState( 1, 1, -1, -1, CoD.AnchorTypes.All )
	f5_local10.alpha = 1
	local self = LUI.UIElement.new( f5_local10 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "start_loading", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "done_loading", MBh.AnimateToState( "hidden", 50 ) )
	local f5_local12 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f5_local12.material = RegisterMaterial( "white" )
	f5_local12.red = 0
	f5_local12.green = 0
	f5_local12.blue = 0
	f5_local12.alpha = 0.25
	self:addElement( LUI.UIImage.new( f5_local12 ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_processing_widget" ) )
	self:addElement( self )
	local f5_local13 = CoD.CreateState( nil, nil, -2, -1, CoD.AnchorTypes.BottomRight )
	f5_local13.width = 48
	f5_local13.height = 32
	f5_local13.material = RegisterMaterial( "icon_sale" )
	f5_local13.alpha = 1
	local self = LUI.UIImage.new( f5_local13 )
	self.id = "sns_thumbnail_sale_banner"
	self.properties = {
		item_id = f5_arg1.item_id
	}
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "update_sale_banners", OnSnsThumbnailUpdateSaleBanners )
	self:addElement( self )
	local f5_local15 = CoD.CreateState( nil, nil, -2, -1, CoD.AnchorTypes.BottomRight )
	f5_local15.width = 32
	f5_local15.height = 32
	f5_local15.material = RegisterMaterial( CoD.Material.NewSticker )
	f5_local15.alpha = 1
	local self = LUI.UIImage.new( f5_local15 )
	self.id = "sns_thumbnail_new_banner"
	self.properties = {
		item_id = f5_arg1.item_id,
		seen_index = f5_arg1.seen_index,
		item_index = f5_arg1.item_index
	}
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "update_new_banners", OnSnsThumbnailUpdateNewBanners )
	self:addElement( self )
	local f5_local17 = LUI.MenuBuilder.BuildRegisteredType( "generic_border", {
		defAnimState = {
			alpha = 0
		},
		border_red = Colors.s1.text_focused.r,
		border_green = Colors.s1.text_focused.g,
		border_blue = Colors.s1.text_focused.b,
		thickness = 3,
		inner = true
	} )
	f5_local17.id = "sns_thumbnail_border_id"
	f5_local17:registerAnimationState( "focused", {
		alpha = 1
	} )
	f5_local17:registerEventHandler( "gain_focus", MBh.AnimateToState( "focused" ) )
	f5_local17:registerEventHandler( "lose_focus", MBh.AnimateToState( "default", 250 ) )
	self:addElement( f5_local17 )
	self:addElement( self )
	return self
end

ArticleLeft = 360
function OnThumbnailUpdateLeftArrow( f8_arg0, f8_arg1 )
	if f8_arg1.left_visible then
		if not f8_arg0.properties.visible then
			local f8_local0 = MBh.AnimateLoop( {
				{
					"shifted",
					500,
					true,
					true
				},
				{
					"default",
					500,
					true,
					true
				}
			} )
			f8_local0( f8_arg0, f8_arg1 )
			f8_arg0.properties.visible = true
		end
	else
		f8_arg0:animateToState( "hidden", 0 )
		f8_arg0.properties.visible = false
	end
end

function OnThumbnailUpdateRightArrow( f9_arg0, f9_arg1 )
	if f9_arg1.right_visible then
		if not f9_arg0.properties.visible then
			local f9_local0 = MBh.AnimateLoop( {
				{
					"shifted",
					500,
					true,
					true
				},
				{
					"default",
					500,
					true,
					true
				}
			} )
			f9_local0( f9_arg0, f9_arg1 )
			f9_arg0.properties.visible = true
		end
	else
		f9_arg0:animateToState( "hidden", 0 )
		f9_arg0.properties.visible = false
	end
end

function sns_thumbnail_window( f10_arg0, f10_arg1 )
	local f10_local0 = Sns.Dims.Thumbnail.width * Sns.MaxVisibleArticles + Sns.HListOffset * 2
	local f10_local1 = 5
	local f10_local2 = 10
	local f10_local3 = 70
	local f10_local4 = CoD.CreateState( ArticleLeft, 480, nil, nil, CoD.AnchorTypes.TopLeft )
	f10_local4.height = Sns.Dims.Thumbnail.height
	f10_local4.width = f10_local0
	local self = LUI.UIElement.new( f10_local4 )
	self.id = "store_thumbnail_window_id"
	local self = LUI.UIElement.new( CoD.CreateState( Sns.HListOffset, 0, -Sns.HListOffset, 0, CoD.AnchorTypes.All ) )
	self:setUseStencil( true )
	self.id = "thumbnail_window_stencil_id"
	local f10_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local7.spacing = Sns.HListSpacing
	local self = LUI.UIHorizontalList.new( f10_local7 )
	self.id = "thumbnail_list_id"
	self:registerEventHandler( "refresh_thumbnails", RefreshThumbnails )
	f10_arg1.feeder( self, f10_arg1 )
	self:addElement( self )
	self:addElement( self )
	local f10_local9 = CoD.CreateState( -f10_local1, f10_local3, nil, nil, CoD.AnchorTypes.TopLeft )
	f10_local9.width = 20
	f10_local9.height = 40
	f10_local9.alpha = 1
	local self = LUI.UIButton.new( f10_local9 )
	self.id = "thumbnail_list_left_arrow_id"
	self.properties = {
		visible = false
	}
	f10_local9.left = -f10_local2
	self:registerAnimationState( "shifted", f10_local9 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "update_thumbnail_arrows", OnThumbnailUpdateLeftArrow )
	local f10_local11 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local11.material = RegisterMaterial( "widg_btn_arrow_lt" )
	local self = LUI.UIImage.new( f10_local11 )
	self.id = "thumbnail_list_left_arrow_image_id"
	self:addElement( self )
	self:addElement( self )
	local f10_local13 = CoD.CreateState( nil, f10_local3, f10_local1, nil, CoD.AnchorTypes.TopRight )
	f10_local13.width = 20
	f10_local13.height = 40
	f10_local13.alpha = 1
	local self = LUI.UIButton.new( f10_local13 )
	self.id = "thumbnail_list_right_arrow_id"
	self.properties = {
		visible = false
	}
	f10_local13.right = f10_local2
	self:registerAnimationState( "shifted", f10_local13 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "update_thumbnail_arrows", OnThumbnailUpdateRightArrow )
	local f10_local15 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local15.material = RegisterMaterial( "widg_btn_arrow_rt" )
	local self = LUI.UIImage.new( f10_local15 )
	self.id = "thumbnail_list_right_arrow_image_id"
	self:addElement( self )
	self:addElement( self )
	return self
end

function OnCountdownTimeUpdateArticleDetails( f11_arg0, f11_arg1 )
	if f11_arg1.end_time then
		f11_arg0:setEndTime( Sns.GetScopedArticleInfo( f11_arg0, "endTime" ) )
	end
end

function sns_article_countdown_widget( f12_arg0, f12_arg1 )
	local f12_local0 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f12_local0.alpha = 0
	local self = LUI.UIElement.new( f12_local0 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerEventHandler( "show_article_countdown", MBh.AnimateToState( "visible", 0 ) )
	self:registerEventHandler( "show_article_purchaseinfo", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "hide_article_overlays", MBh.AnimateToState( "default", 0 ) )
	local self = LUI.UIText.new( {
		left = -80,
		top = 45,
		width = 160,
		height = CoD.TextSettings.BodyFontBold.Height,
		font = CoD.TextSettings.BodyFontBold.Font,
		alignment = LUI.Alignment.Center,
		red = 0.7,
		green = 0.7,
		blue = 0.7
	} )
	self.id = "sns_countdown_widget_label_id"
	self:setText( "Time Left: " )
	self:addElement( self )
	local self = LUI.UILongCountdown.new( 0, {
		left = -80,
		top = 65,
		width = 160,
		height = CoD.TextSettings.BodyFontBold.Height,
		font = CoD.TextSettings.BodyFontBold.Font,
		alignment = LUI.Alignment.Center
	} )
	self.id = "sns_countdown_widget_time_id"
	self:registerEventHandler( "update_article_details", OnCountdownTimeUpdateArticleDetails )
	self:addElement( self )
	return self
end

PurchaseInfoHeight = 54
function sns_article_purchaseinfo_widget( f13_arg0, f13_arg1 )
	local f13_local0 = CoD.CreateState( 0, 0, 0, PurchaseInfoHeight, CoD.AnchorTypes.BottomLeftRight )
	f13_local0.alpha = 0
	local self = LUI.UIBackgroundPanel.new( f13_local0, {
		borderAlpha = 0.45
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerEventHandler( "show_article_countdown", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "show_article_purchaseinfo", MBh.AnimateToState( "visible", 0 ) )
	self:registerEventHandler( "hide_article_overlays", MBh.AnimateToState( "default", 0 ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "sns_value_bar", {
		title_text = Engine.Localize( "@LUA_MENU_COST" ),
		top = 0
	} ) )
	return self
end

function OnUpdateArticleDetailsWindowImage( f14_arg0, f14_arg1 )
	local f14_local0 = Sns.GetScopedArticleInfo( f14_arg0, "image" )
	local f14_local1 = f14_arg0:getParent()
	f14_local1:processEvent( {
		name = "start_loading"
	} )
	f14_arg0:setFileId( f14_local0 )
end

function OnUpdateArticleDetailsWindowDesc( f15_arg0, f15_arg1 )
	f15_arg0:setText( Sns.GetScopedArticleInfo( f15_arg0, "details" ) )
	f15_arg0.text:setForceLineBreaks( true )
end

function sns_article()
	local f16_local0 = CoD.TextSettings.BodyFont24
	local f16_local1 = 369
	local f16_local2 = 850
	local f16_local3 = 450
	local f16_local4 = f16_local2 - f16_local3
	local f16_local5 = 23
	local f16_local6 = 10
	local f16_local7 = (f16_local3 - 2 * f16_local6) / 2
	local f16_local8 = CoD.CreateState( ArticleLeft, GenericMenuDims.menu_top, nil, nil, CoD.AnchorTypes.TopLeft )
	f16_local8.width = f16_local2
	f16_local8.height = f16_local1
	f16_local8.alpha = 0
	local self = LUI.UIElement.new( f16_local8 )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerEventHandler( "show_fetching_metadata", MBh.AnimateToState( "default" ) )
	self:registerEventHandler( "hide_fetching_metadata", MBh.AnimateToState( "visible" ) )
	local f16_local10 = LUI.MenuBuilder.BuildRegisteredType( "generic_menu_titlebar", {
		title_bar_alignment = LUI.Alignment.Center
	} )
	f16_local10.id = "article_details_window_title_id"
	f16_local10:registerEventHandler( "update_article_details", function ( element, event )
		element:processEvent( {
			name = "update_title",
			title_text = Sns.GetScopedArticleInfo( element, "title" )
		} )
	end )
	self:addElement( f16_local10 )
	local f16_local11 = CoD.CreateState( 0, GenericTitleBarDims.TitleBarHeight, nil, nil, CoD.AnchorTypes.TopLeft )
	f16_local11.width = f16_local3
	f16_local11.height = f16_local1 - GenericTitleBarDims.TitleBarHeight - PurchaseInfoHeight
	local self = LUI.UIBackgroundPanel.new( f16_local11, {
		borderAlpha = 0.45
	} )
	self.id = "article_details_window_backdrpo_id"
	local f16_local13 = CoD.CreateState( f16_local6, f16_local5, -f16_local6, nil, CoD.AnchorTypes.TopLeftRight )
	f16_local13.height = f16_local7
	local self = LUI.UIElement.new( f16_local13 )
	local f16_local15 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f16_local15.alpha = 0
	local f16_local16 = LUI.MenuBuilder.BuildRegisteredType( "ContentServerImage", {
		defAnimState = f16_local15
	} )
	f16_local16.id = "article_details_window_image_id"
	f16_local16:registerAnimationState( "visible", {
		alpha = 1
	} )
	f16_local16:registerEventHandler( "update_article_details", OnUpdateArticleDetailsWindowImage )
	f16_local16:registerEventHandler( "download_complete", function ( element, event )
		local f18_local0 = element:getParent()
		f18_local0:processEvent( {
			name = "done_loading"
		} )
	end )
	f16_local16:registerEventHandler( "material_lost", function ( element, event )
		local f19_local0 = element:getParent()
		f19_local0:processEvent( {
			name = "start_loading"
		} )
	end )
	f16_local16:registerEventHandler( "start_loading", MBh.AnimateToState( "default", 0 ) )
	f16_local16:registerEventHandler( "done_loading", MBh.AnimateToState( "visible", 150 ) )
	self:addElement( f16_local16 )
	local self = LUI.UIElement.new( {
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "start_loading", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "done_loading", MBh.AnimateToState( "hidden", 50 ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_processing_widget" ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "sns_article_purchaseinfo_widget" ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "sns_article_countdown_widget" ) )
	self:addElement( self )
	local f16_local18 = CoD.CreateState( f16_local3, GenericTitleBarDims.TitleBarHeight, nil, nil, CoD.AnchorTypes.TopLeft )
	f16_local18.width = f16_local4
	f16_local18.height = f16_local1 - GenericTitleBarDims.TitleBarHeight
	local self = LUI.UIBackgroundPanel.new( f16_local18, {
		borderAlpha = 0.45
	} )
	self.id = "article_details_desc_bkg_id"
	local f16_local20 = LUI.MenuBuilder.BuildRegisteredType( "UIMarqueeText", {
		textHeight = f16_local0.Height,
		scrollSpeed = 50,
		useTextWrapping = true,
		defAnimState = CoD.ColorizeState( Colors.md_grey, {
			topAnchor = true,
			leftAnchor = true,
			left = f16_local5,
			top = f16_local5,
			width = f16_local4 - f16_local5 * 2,
			height = 11 * f16_local0.Height,
			font = f16_local0.Font,
			alignment = LUI.Alignment.Left,
			alpha = 1
		} )
	} )
	f16_local20.id = "article_details_window_desc_id"
	f16_local20:registerEventHandler( "update_article_details", OnUpdateArticleDetailsWindowDesc )
	self:addElement( f16_local20 )
	self:addElement( self )
	return self
end

function sns_fetching_category_spinner()
	local self = LUI.UIElement.new( {
		alpha = 0
	} )
	self:setupFullWindowElement()
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerEventHandler( "hide_fetching_metadata", MBh.AnimateToState( "default" ) )
	self:registerEventHandler( "show_fetching_metadata", MBh.AnimateToState( "visible" ) )
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "live_dialog_text_box", {
		message = Engine.Localize( "LUA_MENU_RETRIEVING_INFO" ),
		overlay_alpha = 0,
		top = -DialogPopupDims.Height / 2,
		left = -15
	} ) )
	return self
end

function OnValueBarTextShowArticlePurchaseInfo( f21_arg0, f21_arg1 )
	if Sns.GetScopedArticleInfo( f21_arg0, "purchased" ) then
		f21_arg0:setText( Engine.Localize( "@LUA_MENU_PURCHASED_CAPS" ) )
		f21_arg0:animateToState( "purchased" )
	else
		local f21_local0 = Sns.GetScopedArticleInfo( f21_arg0, "sale" )
		if f21_local0 == 0 then
			f21_arg0:setText( Sns.GetScopedArticleInfo( f21_arg0, "cost" ) )
		else
			f21_arg0:setText( f21_local0 )
		end
		f21_arg0:animateToState( "default" )
	end
end

function OnValueBarOldCostTextShowArticlePurchaseInfo( f22_arg0, f22_arg1 )
	if Sns.GetScopedArticleInfo( f22_arg0, "purchased" ) then
		f22_arg0:animateToState( "hidden", 0 )
		return false
	end
	local f22_local0 = Sns.GetScopedArticleInfo( f22_arg0, "sale" )
	if f22_local0 == 0 then
		f22_arg0:animateToState( "hidden", 0 )
	else
		local f22_local1 = Sns.GetScopedArticleInfo( f22_arg0, "cost" )
		local f22_local2, f22_local3, f22_local4, f22_local5 = GetTextDimensions( f22_local0, font.Font, font.Height )
		local f22_local6 = f22_local4 - f22_local2
		local f22_local7, f22_local8, f22_local9, f22_local10 = GetTextDimensions( f22_local1, font.Font, font.Height )
		f22_arg0:registerAnimationState( "default", {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = true,
			top = textTop,
			height = font.Height,
			left = -(f22_local9 - f22_local7) - f22_local6 - 25,
			right = -f22_local6 - 25,
			font = font.Font,
			alignment = LUI.Alignment.Right,
			color = Colors.s1.text_disabled,
			alpha = 1
		} )
		f22_arg0:animateToState( "default", 0 )
		f22_arg0:setText( f22_local1 )
	end
	return false
end

function sns_value_bar_children_feeder( f23_arg0, f23_arg1 )
	local f23_local0 = CoD.TextSettings.TitleFontMedium
	local f23_local1 = 10
	local f23_local2 = 14
	local self = LUI.UIText.new( CoD.ColorizeState( Colors.white, {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = f23_local2,
		height = f23_local0.Height,
		left = f23_local1,
		right = 0,
		font = f23_local0.Font,
		alignment = LUI.Alignment.Left
	} ) )
	self.id = "sns_value_bar_title_text"
	self:setText( f23_arg1.title_text )
	f23_arg0:addElement( self )
	local self = LUI.UIText.new( CoD.ColorizeState( Colors.s1.text_focused, {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = f23_local2,
		height = f23_local0.Height,
		left = -180,
		right = -f23_local1,
		font = f23_local0.Font,
		alignment = LUI.Alignment.Right
	} ) )
	self.id = "sns_value_bar_value_text"
	self.properties = {
		glowColor = Colors.generic_highlight_glow
	}
	self:registerAnimationState( "purchased", CoD.ColorizeState( Colors.s1.text_focused, {} ) )
	self:registerEventHandler( "show_article_purchaseinfo", OnValueBarTextShowArticlePurchaseInfo )
	f23_arg0:addElement( self )
	local self = LUI.UIText.new( CoD.ColorizeState( Colors.secondary_text_color, {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = f23_local2,
		height = f23_local0.Height,
		left = -180,
		right = -f23_local1,
		font = f23_local0.Font,
		alignment = LUI.Alignment.Right,
		alpha = 1
	} ) )
	self.id = "sns_value_bar_old_cost_text"
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "show_article_purchaseinfo", OnValueBarOldCostTextShowArticlePurchaseInfo )
	local self = LUI.UIImage.new( CoD.ColorizeState( Colors.white, {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 15,
		height = 2,
		left = -4,
		right = 4
	} ) )
	self.id = "sns_value_bar_old_cost_strikethrough_id"
	self:addElement( self )
	f23_arg0:addElement( self )
end

function sns_value_bar( f24_arg0, f24_arg1 )
	local f24_local0 = CoD.CreateState( 0, f24_arg1.top, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f24_local0.height = PurchaseInfoHeight
	local self = LUI.UIElement.new( f24_local0 )
	sns_value_bar_children_feeder( self, f24_arg1 )
	return self
end

LUI.SocialFeedTicker = {}
LUI.SocialFeedTicker = InheritFrom( LUI.UIElement )
LUI.SocialFeedTicker.new = function ( f25_arg0, f25_arg1, f25_arg2 )
	if not Sns.SocialFeedEnabled() then
		return LUI.UIElement.new()
	end
	local f25_local0 = 0.75
	local f25_local1 = 95
	local self = LUI.UIElement.new( CoD.CreateState( 0, -124, 0, -54, CoD.AnchorTypes.BottomLeftRight ) )
	self.id = "social_feed_ticker_id"
	self:registerEventHandler( "change_ticker_story", Sns.ChangeTickerStory )
	local f25_local3 = CoD.CreateState( 0, 0, 20, 0, CoD.AnchorTypes.TopBottomLeft )
	f25_local3.material = RegisterMaterial( "box_feed_content_lt" )
	f25_local3.alpha = f25_local0
	local self = LUI.UIImage.new( f25_local3 )
	self.id = "ticker_left_cap_id"
	self:addElement( self )
	f25_local3 = CoD.CreateState( 20, 0, -20, 0, CoD.AnchorTypes.All )
	f25_local3.material = RegisterMaterial( "box_feed_content_mid" )
	f25_local3.alpha = f25_local0
	local self = LUI.UIImage.new( f25_local3 )
	self.id = "ticker_mid_bg_id"
	self:addElement( self )
	f25_local3 = CoD.CreateState( -20, 0, 0, 0, CoD.AnchorTypes.TopBottomRight )
	f25_local3.material = RegisterMaterial( "box_feed_content_rt" )
	f25_local3.alpha = f25_local0
	local self = LUI.UIImage.new( f25_local3 )
	self.id = "ticker_right_cap_id"
	self:addElement( self )
	local self = LUI.UIButton.new( CoD.CreateState( 5, 26, -5, -21, CoD.AnchorTypes.All ) )
	self.id = "ticker_stencil_id"
	self:setUseStencil( true )
	self.requireFocusType = FocusType.MouseOver
	self:registerEventHandler( "button_action", function ( element, event )
		Sns.OpenSocialFeed( element, event.controller, f25_arg1 and f25_arg1.isLobbyTicker or false )
	end )
	self:addElement( self )
	local f25_local8 = 30
	local f25_local9 = 20
	local f25_local10 = f25_local1
	if SocialFeed.HasUnreadArticles( Engine.GetControllerForLocalClient( 0 ) ) then
		f25_local3 = CoD.CreateState( f25_local1 - 30, -12, f25_local1 - 6, 12, CoD.AnchorTypes.Left )
		f25_local3.material = RegisterMaterial( "icon_new" )
		local self = LUI.UIImage.new( f25_local3 )
		self.id = "ticker_new_icon_id"
		self:addElement( self )
	end
	if CoD.UsingController() then
		f25_local10 = f25_local10 + f25_local8 + 7
		f25_local3 = CoD.CreateState( f25_local1, -f25_local8 / 2, f25_local1 + f25_local8, f25_local8 / 2, CoD.AnchorTypes.Left )
		f25_local3.font = CoD.TextSettings.NormalFont.Font
		f25_local3.alignment = LUI.Alignment.Left
		CoD.ColorizeState( Colors.white, f25_local3 )
		local self = LUI.UIText.new( f25_local3 )
		self.id = "ticker_button_icon_id"
		self:setText( Engine.Localize( "@LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ) )
		self:addElement( self )
	end
	local self = CoD.TextSettings.NormalFont.Height / 2
	f25_local3 = CoD.CreateState( f25_local10, -self, f25_local10, self, CoD.AnchorTypes.LeftRight )
	f25_local3.font = CoD.TextSettings.NormalFont.Font
	f25_local3.alignment = LUI.Alignment.Left
	CoD.ColorizeState( Colors.white, f25_local3 )
	self.tickerText = LUI.UIText.new( f25_local3 )
	self.tickerText.id = "ticker_text_id"
	self:addElement( self.tickerText )
	local f25_local12 = Sns.GetTickerHeader( Sns.TickerCategory, Sns.TickerIndex )
	if f25_local12 == "" then
		f25_local12 = Engine.Localize( "@SOCIALFEED_TICKER_DEFAULT_TEXT" )
	end
	self.tickerText:setText( f25_local12 )
	f25_local3 = CoD.CreateState( f25_local10, -self + f25_local9, f25_local10, self + f25_local9, CoD.AnchorTypes.LeftRight )
	f25_local3.font = CoD.TextSettings.NormalFont.Font
	f25_local3.alignment = LUI.Alignment.Left
	CoD.ColorizeState( Colors.white, f25_local3 )
	self.nextText = LUI.UIText.new( f25_local3 )
	self.nextText.id = "ticker_next_text_id"
	self:addElement( self.nextText )
	f25_local3 = CoD.CreateState( f25_local10, -self - f25_local9, f25_local10, self - f25_local9, CoD.AnchorTypes.LeftRight )
	f25_local3.font = CoD.TextSettings.NormalFont.Font
	f25_local3.alignment = LUI.Alignment.Left
	CoD.ColorizeState( Colors.white, f25_local3 )
	self.tickerText:registerAnimationState( "transition_to_next", f25_local3 )
	f25_local3 = CoD.CreateState( f25_local10, -self, f25_local10, self, CoD.AnchorTypes.LeftRight )
	f25_local3.font = CoD.TextSettings.NormalFont.Font
	f25_local3.alignment = LUI.Alignment.Left
	CoD.ColorizeState( Colors.white, f25_local3 )
	self.nextText:registerAnimationState( "transition_to_next", f25_local3 )
	self.nextText:registerEventHandler( "transition_complete_transition_to_next", function ( element, event )
		local f27_local0 = element:getParent()
		Sns.TickerScrollEnded( f27_local0:getParent(), event )
	end )
	local self = LUI.UITimer.new( Sns.TickerUpdateInterval, "change_ticker_story", "social_feed_ticker", false, self )
	self.id = "ticker_timer_id"
	self:addElement( self )
	if CoD.UsingController() then
		local self = LUI.UIBindButton.new()
		self.id = "ticker_bind_button_id"
		self:registerEventHandler( "button_shoulderl", function ( element, event )
			Sns.OpenSocialFeed( element, event.controller, f25_arg1 and f25_arg1.isLobbyTicker or false )
		end )
		self:addElement( self )
	end
	return self
end

function popup_social_to_store_lobby_confirm( f29_arg0, f29_arg1 )
	return LUI.MenuBuilder.BuildRegisteredType( "generic_yesno_popup", {
		popup_title = Engine.Localize( "@MENU_NOTICE" ),
		message_text = Engine.Localize( "@SOCIALFEED_TO_STORE_WARNING" ),
		yes_text = Engine.Localize( "@LUA_MENU_YES" ),
		no_text = Engine.Localize( "@LUA_MENU_CANCEL" ),
		yes_action = function ( f30_arg0, f30_arg1 )
			LUI.mp_menus.mpLobbyWidgets.leaveLobbyAndPartyYesActionWithExitLobby( f30_arg0, f30_arg1 )
			LUI.FlowManager.RequestRestoreMenu( f30_arg0, "menu_xboxlive" )
			Sns.OpenStoreMenu( f30_arg1.controller, nil, nil, false, f30_arg0.properties.callback_params.itemID )
		end
		
	} )
end

LUI.MenuBuilder.registerType( "SocialFeedTicker", LUI.SocialFeedTicker.new )
LUI.MenuBuilder.registerType( "sns_category_window", sns_category_window )
LUI.MenuBuilder.registerType( "sns_thumbnail", sns_thumbnail )
LUI.MenuBuilder.registerType( "sns_thumbnail_window", sns_thumbnail_window )
LUI.MenuBuilder.registerType( "sns_article", sns_article )
LUI.MenuBuilder.registerType( "sns_article_purchaseinfo_widget", sns_article_purchaseinfo_widget )
LUI.MenuBuilder.registerType( "sns_article_countdown_widget", sns_article_countdown_widget )
LUI.MenuBuilder.registerType( "sns_fetching_category_spinner", sns_fetching_category_spinner )
LUI.MenuBuilder.registerType( "sns_value_bar", sns_value_bar )
LUI.MenuBuilder.registerPopupType( "popup_social_to_store_lobby_confirm", popup_social_to_store_lobby_confirm )
