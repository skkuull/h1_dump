local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ()
	local f1_local0 = nil
	local f1_local1 = Languages[Engine.GetCurrentLanguage and Engine.GetCurrentLanguage() or 0]
	assert( f1_local1 )
	local f1_local2 = "bkgd_manual_"
	if Engine.IsSpecialRegion() then
		if f1_local1 == "LANGUAGE_FRENCH" then
			f1_local2 = "bkgd_manual_alt_language_"
			f1_local1 = "LANGUAGE_FRENCHCA"
		elseif f1_local1 == "LANGUAGE_ENGLISH" then
			f1_local2 = "bkgd_manual_alt_language_"
			f1_local1 = "LANGUAGE_ENGLISHUK"
		end
	elseif f1_local1 == "LANGUAGE_JAPANESE_PARTIAL" then
		f1_local1 = "LANGUAGE_JAPANESE_FULL"
	end
	local f1_local3 = {
		X360 = {
			LANGUAGE_ENGLISH = 5,
			LANGUAGE_FRENCH = 5,
			LANGUAGE_GERMAN = 5,
			LANGUAGE_ITALIAN = 5,
			LANGUAGE_SPANISH = 5,
			LANGUAGE_RUSSIAN = 5,
			LANGUAGE_POLISH = 5,
			LANGUAGE_KOREAN = 5,
			LANGUAGE_JAPANESE_FULL = 4,
			LANGUAGE_CZECH = 5,
			LANGUAGE_SPANISHNA = 5,
			LANGUAGE_PORTUGUESE = 5,
			LANGUAGE_FRENCHCA = 1,
			LANGUAGE_ENGLISHUK = 5,
			LANGUAGE_SIMPLIFIED_CHINESE = 5,
			LANGUAGE_TRADITIONAL_CHINESE = 5,
			LANGUAGE_ARABIC = 1
		},
		XB3 = {
			LANGUAGE_ENGLISH = 4,
			LANGUAGE_FRENCH = 4,
			LANGUAGE_GERMAN = 4,
			LANGUAGE_ITALIAN = 4,
			LANGUAGE_SPANISH = 4,
			LANGUAGE_RUSSIAN = 4,
			LANGUAGE_POLISH = 4,
			LANGUAGE_KOREAN = 4,
			LANGUAGE_JAPANESE_FULL = 4,
			LANGUAGE_CZECH = 4,
			LANGUAGE_SPANISHNA = 4,
			LANGUAGE_PORTUGUESE = 4,
			LANGUAGE_FRENCHCA = 4,
			LANGUAGE_ENGLISHUK = 4,
			LANGUAGE_SIMPLIFIED_CHINESE = 4,
			LANGUAGE_TRADITIONAL_CHINESE = 4,
			LANGUAGE_ARABIC = 1
		},
		PS3 = {
			LANGUAGE_ENGLISH = 6,
			LANGUAGE_FRENCH = 7,
			LANGUAGE_GERMAN = 7,
			LANGUAGE_ITALIAN = 7,
			LANGUAGE_SPANISH = 7,
			LANGUAGE_RUSSIAN = 7,
			LANGUAGE_POLISH = 7,
			LANGUAGE_KOREAN = 6,
			LANGUAGE_JAPANESE_FULL = 4,
			LANGUAGE_CZECH = 6,
			LANGUAGE_SPANISHNA = 6,
			LANGUAGE_PORTUGUESE = 6,
			LANGUAGE_FRENCHCA = 6,
			LANGUAGE_ENGLISHUK = 7,
			LANGUAGE_SIMPLIFIED_CHINESE = 6,
			LANGUAGE_TRADITIONAL_CHINESE = 6,
			LANGUAGE_ARABIC = 1
		},
		PS4 = {
			LANGUAGE_ENGLISH = 5,
			LANGUAGE_FRENCH = 7,
			LANGUAGE_GERMAN = 7,
			LANGUAGE_ITALIAN = 7,
			LANGUAGE_SPANISH = 7,
			LANGUAGE_RUSSIAN = 7,
			LANGUAGE_POLISH = 7,
			LANGUAGE_KOREAN = 6,
			LANGUAGE_JAPANESE_FULL = 4,
			LANGUAGE_CZECH = 6,
			LANGUAGE_SPANISHNA = 5,
			LANGUAGE_PORTUGUESE = 5,
			LANGUAGE_FRENCHCA = 5,
			LANGUAGE_ENGLISHUK = 7,
			LANGUAGE_SIMPLIFIED_CHINESE = 6,
			LANGUAGE_TRADITIONAL_CHINESE = 6,
			LANGUAGE_ARABIC = 1
		},
		PC = {
			LANGUAGE_ENGLISH = 5,
			LANGUAGE_FRENCH = 5,
			LANGUAGE_GERMAN = 5,
			LANGUAGE_ITALIAN = 5,
			LANGUAGE_SPANISH = 5,
			LANGUAGE_RUSSIAN = 5,
			LANGUAGE_POLISH = 5,
			LANGUAGE_KOREAN = 5,
			LANGUAGE_JAPANESE_FULL = 3,
			LANGUAGE_CZECH = 5,
			LANGUAGE_SPANISHNA = 5,
			LANGUAGE_PORTUGUESE = 5,
			LANGUAGE_FRENCHCA = 5,
			LANGUAGE_ENGLISHUK = 5,
			LANGUAGE_SIMPLIFIED_CHINESE = 5,
			LANGUAGE_TRADITIONAL_CHINESE = 5,
			LANGUAGE_ARABIC = 1
		}
	}
	if Engine.IsXbox360() then
		f1_local0 = f1_local3.X360[f1_local1]
	elseif Engine.IsXB3() then
		f1_local0 = f1_local3.XB3[f1_local1]
	elseif Engine.IsPS3() then
		f1_local0 = f1_local3.PS3[f1_local1]
	elseif Engine.IsPS4() then
		f1_local0 = f1_local3.PS4[f1_local1]
	else
		f1_local0 = f1_local3.PC[f1_local1]
	end
	assert( f1_local0 )
	local f1_local4 = {}
	for f1_local5 = 1, f1_local0, 1 do
		table.insert( f1_local4, f1_local2 .. f1_local5 )
	end
	return f1_local4
end

function changePage( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( f2_arg0 )
	local f2_local1 = f2_local0.currentPage
	f2_local0.currentPage = LUI.clamp( f2_local0.currentPage + f2_arg1, 1, #f2_local0.manualPages )
	f2_arg0:dispatchEventToRoot( {
		name = "change_page"
	} )
	if f2_local1 ~= f2_local0.currentPage then
		if f2_arg1 > 0 then
			f2_arg0:dispatchEventToRoot( {
				name = "next_page"
			} )
		elseif f2_arg1 < 0 then
			f2_arg0:dispatchEventToRoot( {
				name = "previous_page"
			} )
		end
	end
end

function game_manual()
	local f3_local0 = LUI.FlowManager.GetMenuScopedDataByMenuName( "game_manual" )
	f3_local0.manualPages = f0_local0()
	assert( #f3_local0.manualPages > 0 )
	local self = LUI.UIElement.new()
	self.id = "game_manual"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIImage.new()
	self.id = "centerPage"
	self:registerAnimationState( "default", {
		material = RegisterMaterial( f3_local0.manualPages[1] ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "change_page", function ( element, event )
		local f4_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		element:setImage( RegisterMaterial( f4_local0.manualPages[f4_local0.currentPage] ) )
	end )
	self:addElement( self )
	local self = LUI.UIButton.new()
	self.id = "leftArrow"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -330,
		left = 100,
		width = 40,
		height = 80,
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	self:registerAnimationState( "bump", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -330,
		left = 90,
		width = 40,
		height = 80
	} )
	self:registerEventHandler( "next_page", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "previous_page", function ( element, event )
		local f5_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		local f5_local1 = {
			{
				"default",
				0
			},
			{
				"bump",
				40,
				true,
				true
			},
			{
				"default",
				100,
				true,
				true
			}
		}
		if f5_local0.currentPage <= 1 then
			table.insert( f5_local1, {
				"disabled",
				80
			} )
		end
		local f5_local2 = MBh.AnimateSequence( f5_local1 )
		f5_local2( element, event )
	end )
	self:registerEventHandler( "button_action", function ( element, event )
		changePage( element, -1 )
	end )
	self:registerEventHandler( "button_over", function ( element, event )
		if event.focusType == FocusType.MouseOver then
			element:processEvent( {
				name = "arrow_image_over",
				immediate = true
			} )
		end
	end )
	self:registerEventHandler( "button_up", function ( element, event )
		local f8_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		if f8_local0.currentPage > 1 then
			element:animateToState( "default" )
		else
			element:animateToState( "disabled" )
		end
		element:processEvent( {
			name = "arrow_image_up",
			immediate = true
		} )
	end )
	self:animateToState( "default" )
	self:animateToState( "disabled" )
	local self = LUI.UIImage.new()
	self.id = "leftArrowImage"
	self:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		material = RegisterMaterial( "widg_margin_arrow_lt" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} ) )
	self:registerAnimationState( "over", CoD.ColorizeState( Colors.frontend_hilite, {} ) )
	self:animateToState( "default" )
	self:registerEventHandler( "arrow_image_over", MBh.AnimateToState( "over" ) )
	self:registerEventHandler( "arrow_image_up", MBh.AnimateToState( "default" ) )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIButton.new()
	self.id = "rightArrow"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -330,
		right = -100,
		width = 40,
		height = 80,
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	self:registerAnimationState( "bump", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = -330,
		right = -90,
		width = 40,
		height = 80
	} )
	self:registerEventHandler( "previous_page", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "next_page", function ( element, event )
		local f9_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		local f9_local1 = {
			{
				"default",
				0
			},
			{
				"bump",
				40,
				true,
				true
			},
			{
				"default",
				100,
				true,
				true
			}
		}
		if #f9_local0.manualPages <= f9_local0.currentPage then
			table.insert( f9_local1, {
				"disabled",
				80
			} )
		end
		local f9_local2 = MBh.AnimateSequence( f9_local1 )
		f9_local2( element, event )
	end )
	self:animateToState( "default" )
	self:registerEventHandler( "button_action", function ( element, event )
		changePage( element, 1 )
	end )
	self:registerEventHandler( "button_over", function ( element, event )
		if event.focusType == FocusType.MouseOver then
			element:processEvent( {
				name = "arrow_image_over",
				immediate = true
			} )
		end
	end )
	self:registerEventHandler( "button_up", function ( element, event )
		local f12_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		if f12_local0.currentPage < #f12_local0.manualPages then
			element:animateToState( "default" )
		else
			element:animateToState( "disabled" )
		end
		element:processEvent( {
			name = "arrow_image_up",
			immediate = true
		} )
	end )
	local self = LUI.UIImage.new()
	self.id = "leftArrowImage"
	self:registerAnimationState( "default", CoD.ColorizeState( Colors.white, {
		material = RegisterMaterial( "widg_margin_arrow_rt" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} ) )
	self:registerAnimationState( "over", CoD.ColorizeState( Colors.frontend_hilite, {} ) )
	self:animateToState( "default" )
	self:registerEventHandler( "arrow_image_over", MBh.AnimateToState( "over" ) )
	self:registerEventHandler( "arrow_image_up", MBh.AnimateToState( "default" ) )
	self:addElement( self )
	self:addElement( self )
	local f3_local7 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main",
		properties = {
			background_alpha = 1
		}
	} )
	f3_local7:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	local self = LUI.UIBindButton.new()
	self.id = "bind"
	self:registerEventHandler( "button_secondary", function ( element, event )
		LUI.FlowManager.RequestLeaveMenu( element )
	end )
	self:registerEventHandler( "button_left", function ( element, event )
		changePage( element, -1 )
	end )
	self:registerEventHandler( "button_right", function ( element, event )
		changePage( element, 1 )
	end )
	self:addElement( self )
	self:registerEventHandler( "menu_create", function ( element, event )
		local f16_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		f16_local0.currentPage = 1
		changePage( element, 0 )
	end )
	return self
end

LUI.MenuBuilder.registerType( "game_manual", game_manual )
LockTable( _M )
