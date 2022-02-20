local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MarketingPopup = {}
LUI.MarketingPopup.DEPOT_ONBOARDING_TEMPLATE = 6
LUI.MarketingPopup.SHAMROCK_PROMO_TEMPLATE = 7
f0_local0 = CoD.TextSettings.BodyFontTiny
f0_local1 = 13
f0_local2 = 17
local f0_local3 = 2
local f0_local4 = 25
local f0_local5 = CoD.TextSettings.TitleFontMediumLarge
local f0_local6 = CoD.TextSettings.TitleFontMedium
local f0_local7 = CoD.TextSettings.Font32
local f0_local8 = CoD.TextSettings.Font27
local f0_local9 = {
	[LUI.MOTD.PopupActionType.REGISTRATION] = "@DEPOT_GO_TO_COD_ACCOUNT",
	[LUI.MOTD.PopupActionType.DEPOT] = "@DEPOT_GO_TO_THE_DEPOT",
	[LUI.MOTD.PopupActionType.STORE] = "@DEPOT_GO_TO_THE_STORE"
}
LUI.MarketingPopup.navigatedAwayFromPopup = false
function LeavePopup( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "button_action", nil )
	f1_arg0:registerEventHandler( "button_alt1", nil )
	f1_arg0:registerEventHandler( "button_secondary", nil )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0, nil, f1_arg1.immediate )
	local f1_local0 = Engine.GetLuiRoot()
	if not LUI.MarketingPopup.navigatedAwayFromPopup then
		f1_local0:dispatchEventToRoot( {
			name = "processMarketingPopups"
		} )
	else
		LUI.MarketingPopup.navigatedAwayFromPopup = false
	end
end

function OnPopupAction( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.popupData
	local f2_local1 = f2_local0.messageID
	if f2_local0.isMOTD and f2_local1 ~= nil then
		LUI.ComScore.LogMarketingClick( f2_arg1.controller, f2_local1, LUI.ComScore.MarketingScreen.MOTD )
	end
	DebugPrint( "\nMOTD Popup Action [" .. tostring( f2_arg0.id ) .. "]" )
	for f2_local5, f2_local6 in pairs( f2_local0 ) do
		DebugPrint( "	[" .. f2_local5 .. "]: [" .. tostring( f2_local6 ) .. "]" )
	end
	DebugPrint( "\n" )
	if f2_local0.popupAction == LUI.MOTD.ActionType.STORE or f2_local0.popupAction == LUI.MOTD.ActionType.DEPOT or f2_local0.popupAction == LUI.MOTD.PopupActionType.REGISTRATION then
		LUI.MarketingPopup.navigatedAwayFromPopup = true
	end
	LeavePopup( f2_arg0, {
		controller = f2_arg1.controller,
		immediate = true
	} )
	if f2_local0.popupAction == LUI.MOTD.ActionType.STORE then
		Sns.OpenStoreMenu( f2_arg1.controller, f2_local0.isMOTD and LUI.ComScore.ScreenID.MOTD or LUI.ComScore.ScreenID.CommsPopup, LUI.ComScore.StoreSource.Marketing )
	elseif f2_local0.popupAction == LUI.MOTD.ActionType.DEPOT then
		Sns.OpenDepotMenu( f2_arg1.controller )
	elseif f2_local0.popupAction == LUI.MOTD.PopupActionType.REGISTRATION then
		Sns.OpenCoDAnywherePopup( f2_arg1.controller )
	end
end

function OnPopupCancel( f3_arg0, f3_arg1, f3_arg2 )
	DebugPrint( "\nLeaving MOTD popup [" .. tostring( f3_arg0.id ) .. "]" )
	if f3_arg2 then
		LeavePopup( f3_arg0, {
			controller = f3_arg1.controller,
			immediate = true
		} )
		if #f3_arg2 > 0 then
			DebugPrint( "\nContinuing to next MOTD message." )
			LUI.FlowManager.RequestPopupMenu( f3_arg0, "motd_main", true, f3_arg1.controller, false, {
				popupDataQueue = f3_arg2
			} )
		else
			DebugPrint( "\nMOTD sequence complete." )
			f3_arg0:dispatchEventToRoot( {
				name = "menu_refresh"
			} )
			Engine.Exec( "checkforPreOrder " )
		end
	else
		LeavePopup( f3_arg0, {
			controller = f3_arg1.controller
		} )
	end
end

function AddTextBox( f4_arg0, f4_arg1 )
	local f4_local0 = CoD.CreateState( f4_arg1.left, f4_arg1.top, f4_arg1.right, f4_arg1.bottom, f4_arg1.anchorType )
	f4_local0.width = f4_arg1.width
	f4_local0.height = f4_arg1.height
	local self = LUI.UIElement.new( f4_local0 )
	f4_arg0:addElement( self )
	if f4_arg1.text then
		local f4_local2 = CoD.CreateState( nil, nil, nil, nil, f4_arg1.textAnchorType )
		f4_local2.width = f4_local0.width
		f4_local2.height = f4_arg1.font and f4_arg1.font.Height or f0_local8.Height
		f4_local2.font = f4_arg1.font and f4_arg1.font.Font or f0_local8.Font
		f4_local2.color = f4_arg1.color
		f4_local2.alignment = LUI.AdjustAlignmentForLanguage( f4_arg1.textAlignment )
		f4_local2.lineSpacingRatio = 0.3
		local self = LUI.UIText.new( f4_local2 )
		self:registerAnimationState( "default", f4_local2 )
		self:setTextStyle( f4_arg1.textStyle )
		self:setText( f4_arg1.text )
		self:addElement( self )
	end
	return self
end

function AddTemplateContent1( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0.width - f0_local2 - f0_local1 * 2
	local f5_local1 = f5_arg0.height - f0_local1 * 2
	local f5_local2 = f5_local0 * 0.56
	local f5_local3 = f5_local0 - f5_local2
	if f5_arg1.image then
		local f5_local4 = CoD.CreateState( f0_local1, nil, nil, nil, CoD.AnchorTypes.Left )
		f5_local4.width = f5_local2
		f5_local4.height = f5_local1
		f5_local4.material = RegisterMaterial( f5_arg1.image )
		f5_arg0:addElement( LUI.UIImage.new( f5_local4 ) )
	end
	local f5_local5 = AddTextBox( f5_arg0, {
		right = -f0_local1,
		anchorType = CoD.AnchorTypes.Right,
		width = f5_local3,
		height = f5_local1
	} )
	local f5_local6 = {
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f5_local3,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f5_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f5_arg1.h1Header,
		font = f0_local5
	}
	if f5_local6.text then
		AddTextBox( f5_local5, f5_local6 )
	end
	local f5_local7 = {
		top = f5_local6.height + f0_local3,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f5_local3,
		height = f0_local6.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f5_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f5_arg1.h2Header,
		font = f0_local6
	}
	if f5_local7.text then
		AddTextBox( f5_local5, f5_local7 )
	end
	local f5_local8 = {
		top = f5_local7.top + f5_local7.height + f0_local3,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f5_local3,
		height = f0_local7.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f5_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f5_arg1.h3Header,
		font = f0_local7
	}
	if f5_local8.text then
		AddTextBox( f5_local5, f5_local8 )
	end
	local f5_local9 = {
		top = f5_local8.top + f5_local8.height + f0_local4,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f5_local3,
		height = f0_local8.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f5_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f5_arg1.body,
		font = f0_local8
	}
	if f5_local9.text then
		AddTextBox( f5_local5, f5_local9 )
	end
end

function AddTemplateContent2( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0.width - f0_local2 - f0_local1 * 2
	local f6_local1 = f6_arg0.height - f0_local1 * 2
	local f6_local2 = f6_local0 * 0.56
	local f6_local3 = f6_local0 - f6_local2
	if f6_arg1.image then
		local f6_local4 = CoD.CreateState( nil, nil, -f0_local1, nil, CoD.AnchorTypes.Right )
		f6_local4.width = f6_local2
		f6_local4.height = f6_local1
		f6_local4.material = RegisterMaterial( f6_arg1.image )
		f6_arg0:addElement( LUI.UIImage.new( f6_local4 ) )
	end
	local f6_local5 = AddTextBox( f6_arg0, {
		left = f0_local1,
		anchorType = CoD.AnchorTypes.Left,
		width = f6_local3,
		height = f6_local1
	} )
	local f6_local6 = {
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f6_local3,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f6_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f6_arg1.h1Header,
		font = f0_local5
	}
	if f6_local6.text then
		AddTextBox( f6_local5, f6_local6 )
	end
	local f6_local7 = {
		top = f6_local6.height + f0_local3,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f6_local3,
		height = f0_local6.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f6_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f6_arg1.h2Header,
		font = f0_local6
	}
	if f6_local7.text then
		AddTextBox( f6_local5, f6_local7 )
	end
	local f6_local8 = {
		top = f6_local7.top + f6_local7.height + f0_local3,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f6_local3,
		height = f0_local7.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f6_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f6_arg1.h3Header,
		font = f0_local7
	}
	if f6_local8.text then
		AddTextBox( f6_local5, f6_local8 )
	end
	local f6_local9 = {
		top = f6_local8.top + f6_local8.height + f0_local4,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f6_local3,
		height = f0_local8.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f6_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f6_arg1.body,
		font = f0_local8
	}
	if f6_local9.text then
		AddTextBox( f6_local5, f6_local9 )
	end
end

function AddTemplateContent3( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0.height * 0.3 - f0_local1 * 2
	local f7_local1 = f7_arg0.width - f0_local1 * 2
	if f7_arg1.image then
		local f7_local2 = CoD.CreateState( f0_local1, f0_local1, -f0_local1, -f0_local1, CoD.AnchorTypes.All )
		f7_local2.material = RegisterMaterial( f7_arg1.image )
		f7_arg0:addElement( LUI.UIImage.new( f7_local2 ) )
	end
	local f7_local3 = AddTextBox( f7_arg0, {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f7_local1,
		height = f7_local0
	} )
	local f7_local4 = {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f7_local1,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f7_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f7_arg1.h1Header,
		font = f0_local5
	}
	if f7_local4.text then
		AddTextBox( f7_local3, f7_local4 )
	end
	local f7_local5 = {
		top = f7_local4.top + f7_local4.height + f0_local3,
		anchorType = CoD.AnchorTypes.Top,
		width = f7_local1,
		height = f0_local6.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f7_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f7_arg1.h2Header,
		font = f0_local6
	}
	if f7_local5.text then
		AddTextBox( f7_local3, f7_local5 )
	end
	local f7_local6 = AddTextBox( f7_arg0, {
		bottom = -f0_local1,
		anchorType = CoD.AnchorTypes.Bottom,
		width = f7_local1,
		height = f7_local0 - f0_local8.Height
	} )
	local f7_local7 = 64
	local f7_local8 = {
		left = f7_local7,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f7_local1 - f7_local7 * 2,
		height = f0_local8.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f7_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f7_arg1.body,
		font = f0_local8
	}
	if f7_local8.text then
		AddTextBox( f7_local6, f7_local8 )
	end
end

function AddTemplateContent4( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg0.width - f0_local2 - f0_local1 * 2
	local f8_local1 = f8_arg0.height - f0_local1 * 2
	local f8_local2 = f8_local0 * 0.56
	local f8_local3 = f8_local0 - f8_local2
	if f8_arg1.image then
		local f8_local4 = CoD.CreateState( f0_local1, nil, nil, nil, CoD.AnchorTypes.Left )
		f8_local4.width = f8_local2
		f8_local4.height = f8_local1
		f8_local4.material = RegisterMaterial( f8_arg1.image )
		f8_arg0:addElement( LUI.UIImage.new( f8_local4 ) )
	end
	local f8_local5 = AddTextBox( f8_arg0, {
		right = -f0_local1,
		anchorType = CoD.AnchorTypes.Right,
		width = f8_local3,
		height = f8_local1
	} )
	local f8_local6 = {
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f8_local3,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f8_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f8_arg1.h1Header,
		font = f0_local5
	}
	if f8_local6.text then
		AddTextBox( f8_local5, f8_local6 )
	end
	local f8_local7 = {
		top = f8_local6.height + f0_local3,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f8_local3,
		height = f0_local7.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f8_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f8_arg1.h3Header,
		font = f0_local7
	}
	if f8_local7.text then
		AddTextBox( f8_local5, f8_local7 )
	end
	local f8_local8 = {
		top = f8_local7.top + f8_local7.height + f0_local4 - 8,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f8_local3,
		height = f0_local8.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Left,
		textStyle = f8_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f8_arg1.body,
		font = f0_local8
	}
	if f8_local8.text then
		AddTextBox( f8_local5, f8_local8 )
	end
end

function AddTemplateContent5( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0.height * 0.3 - f0_local1 * 2
	local f9_local1 = f9_arg0.width - f0_local1 * 2
	if f9_arg1.image then
		local f9_local2 = CoD.CreateState( f0_local1, f0_local1, -f0_local1, -f0_local1, CoD.AnchorTypes.All )
		f9_local2.material = RegisterMaterial( f9_arg1.image )
		f9_arg0:addElement( LUI.UIImage.new( f9_local2 ) )
	end
	local f9_local3 = AddTextBox( f9_arg0, {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f9_local1,
		height = f9_local0
	} )
	local f9_local4 = {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f9_local1,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f9_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f9_arg1.h1Header,
		font = f0_local5
	}
	if f9_local4.text then
		AddTextBox( f9_local3, f9_local4 )
	end
	local f9_local5 = {
		top = f9_local4.top + f9_local4.height,
		anchorType = CoD.AnchorTypes.Top,
		width = f9_local1,
		height = f0_local7.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f9_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f9_arg1.h3Header,
		font = f0_local7
	}
	if f9_local5.text then
		AddTextBox( f9_local3, f9_local5 )
	end
end

function AddTemplateContent6( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg0.height * 0.3 - f0_local1 * 2
	local f10_local1 = f10_arg0.width - f0_local1 * 2
	local f10_local2 = 76
	if f10_arg1.image then
		local f10_local3 = CoD.CreateState( -f10_local2, f0_local1, -f0_local1, -f0_local1, CoD.AnchorTypes.All )
		f10_local3.material = RegisterMaterial( f10_arg1.image )
		f10_arg0:addElement( LUI.UIImage.new( f10_local3 ) )
	end
	local f10_local4 = AddTextBox( f10_arg0, {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f10_local1,
		height = f10_local0
	} )
	local f10_local5 = {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f10_local1,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f10_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f10_arg1.h1Header,
		font = f0_local5
	}
	if f10_local5.text then
		AddTextBox( f10_local4, f10_local5 )
	end
	local f10_local6 = {
		top = f10_local5.top + f10_local5.height + f0_local3,
		anchorType = CoD.AnchorTypes.Top,
		width = f10_local1,
		height = f0_local7.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f10_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f10_arg1.h2Header,
		font = f0_local7
	}
	if f10_local6.text then
		AddTextBox( f10_local4, f10_local6 )
	end
	local f10_local7 = AddTextBox( f10_arg0, {
		bottom = -f0_local1,
		anchorType = CoD.AnchorTypes.Bottom,
		width = f10_local1,
		height = f10_local0 - f0_local8.Height
	} )
	local f10_local8 = 100
	local f10_local9 = {
		left = f10_local8,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f10_local1 - f10_local8 * 2,
		height = f0_local8.Height,
		textAnchorType = CoD.AnchorTypes.Left,
		textAlignment = LUI.Alignment.Center,
		textStyle = f10_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f10_arg1.body,
		font = f0_local8
	}
	if f10_local9.text then
		AddTextBox( f10_local7, f10_local9 )
	end
end

function AddTemplateContent7( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg0.height * 0.3 - f0_local1 * 2
	local f11_local1 = f11_arg0.width - f0_local1 * 2
	if f11_arg1.image then
		local f11_local2 = CoD.CreateState( f11_arg1.imageLeft or -56, f11_arg1.imageTop or -86, f11_arg1.imageRight or 9, f11_arg1.imageBottom or 7, CoD.AnchorTypes.All )
		f11_local2.material = RegisterMaterial( f11_arg1.image )
		f11_arg0:addElement( LUI.UIImage.new( f11_local2 ) )
	end
	local f11_local2 = {
		top = f11_arg1.extraTextTop or -18,
		left = f11_arg1.extraTextLeft or 25,
		anchorType = CoD.AnchorTypes.TopLeft,
		textAnchorType = CoD.AnchorTypes.None,
		color = Colors.h1.light_green,
		text = f11_arg1.extraTextData.text1,
		font = CoD.TextSettings.Font18
	}
	if f11_local2.text then
		AddTextBox( f11_arg0, f11_local2 )
	end
	local f11_local3 = AddTextBox( f11_arg0, {
		top = f0_local1,
		anchorType = CoD.AnchorTypes.Top,
		width = f11_local1,
		height = f11_local0
	} )
	local f11_local4 = {
		top = 0,
		anchorType = CoD.AnchorTypes.Top,
		width = f11_local1,
		height = f0_local5.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f11_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f11_arg1.h1Header,
		font = f0_local8
	}
	if f11_local4.text then
		AddTextBox( f11_local3, f11_local4 )
	end
	local f11_local5 = {
		top = f11_local4.top + f11_local4.height + f0_local3,
		anchorType = CoD.AnchorTypes.Top,
		width = f11_local1,
		height = f0_local6.Height,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f11_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f11_arg1.h2Header,
		font = f0_local6
	}
	if f11_local5.text then
		AddTextBox( f11_local3, f11_local5 )
	end
	local f11_local6 = AddTextBox( f11_arg0, {
		bottom = 24,
		anchorType = CoD.AnchorTypes.Bottom,
		width = f11_local1,
		height = f11_local0 - f0_local8.Height
	} )
	local f11_local7 = 64
	local f11_local8 = {
		left = f11_local7,
		anchorType = CoD.AnchorTypes.TopLeft,
		width = f11_local1 - f11_local7 * 2,
		height = f0_local8.Height,
		top = f11_arg1.bodyTop,
		textAnchorType = CoD.AnchorTypes.None,
		textAlignment = LUI.Alignment.Center,
		textStyle = f11_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html,
		text = f11_arg1.body,
		font = f0_local8
	}
	if f11_local8.text then
		AddTextBox( f11_local6, f11_local8 )
	end
end

local f0_local10 = {}
table.insert( f0_local10, AddTemplateContent1 )
table.insert( f0_local10, AddTemplateContent2 )
table.insert( f0_local10, AddTemplateContent3 )
table.insert( f0_local10, AddTemplateContent4 )
table.insert( f0_local10, AddTemplateContent5 )
table.insert( f0_local10, AddTemplateContent6 )
table.insert( f0_local10, AddTemplateContent7 )
function AddButtonsFooter( f12_arg0, f12_arg1, f12_arg2 )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	f12_arg0:addElement( self )
	local f12_local1 = LUI.MenuBuilder.BuildAddChild( self, {
		type = "button_helper_text_main"
	} )
	f12_local1:processEvent( LUI.ButtonHelperText.CommonEvents.addBackButton )
	f12_local1:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@LUA_MENU_CONTINUE" ),
		side = "left",
		clickable = true,
		priority = -1000
	} )
	if Engine.IsPC() then
		local self = f12_local1:getFirstDescendentById( "button_secondary_id" )
		self:registerEventHandler( "leftmouseup", f12_arg1 )
		local f12_local3 = f12_local1:getFirstDescendentById( "button_action_id" )
		f12_local3:registerEventHandler( "leftmouseup", f12_arg2 )
	end
	local self = LUI.UIBindButton.new()
	self.id = "popup_motd_bind_button"
	self:registerEventHandler( "button_secondary", f12_arg1 )
	self.handlePrimary = true
	self:registerEventHandler( "button_action", f12_arg2 )
	f12_arg0.bind = self
	f12_arg0:addElement( self )
end

LUI.MarketingPopup.Base = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	local self = LUI.UIElement.new( f13_local0 )
	self.id = f13_arg1.h1Header or "popup_motd_root"
	self:registerAnimationState( "default", f13_local0 )
	self.alwaysSendMenuClose = true
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" ) )
	local f13_local2 = LUI.EULA.BGPaddingBottom
	local f13_local3 = true
	local f13_local4 = f13_arg1.callToAction
	if f13_local4 then
		f13_local4 = f13_arg1.callToAction ~= ""
	end
	if f0_local9[f13_arg1.popupAction] == nil and (not f13_arg1.callToAction or f13_arg1.callToAction == "") then
		f13_local2 = LUI.EULABase.BGPaddingTop
		f13_local3 = false
	end
	local f13_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f13_local5.width = LUI.EULA.Width
	local self
	if f13_arg1.templateNum == 4 or f13_arg1.templateNum == 5 then
		self = LUI.EULA.Height / 1.9
		if not self then
		
		else
			local f13_local7
			if f13_local2 == LUI.EULABase.BGPaddingTop then
				f13_local7 = LUI.EULA.BGPaddingBottom
				if not f13_local7 then
				
				else
					f13_local5.height = self - f13_local7
					self = LUI.UIElement.new( f13_local5 )
					self:addElement( self )
					f13_local7 = function ( f14_arg0, f14_arg1 )
						Engine.PlaySound( CoD.SFX.SelectBack )
						OnPopupCancel( f14_arg0, f14_arg1, f13_arg2 )
					end
					
					AddButtonsFooter( self, f13_local7, f13_local7 )
					local f13_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
					f13_local8.material = RegisterMaterial( "white" )
					f13_local8.alpha = 0.9
					f13_local8.color = Colors.black
					self:addElement( LUI.UIImage.new( f13_local8 ) )
					self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
					self:addElement( LUI.Divider.new( CoD.CreateState( 0, -8, 0, nil, CoD.AnchorTypes.TopLeftRight ) ) )
					local self = LUI.UIElement.new( CoD.CreateState( LUI.EULA.BGPaddingLR, LUI.EULA.BGPaddingLR, -LUI.EULA.BGPaddingTop, -f13_local2, CoD.AnchorTypes.All ) )
					self.width = f13_local5.width - LUI.EULA.BGPaddingLR * 2
					self.height = f13_local5.height - LUI.EULA.BGPaddingTop + f13_local2
					f0_local10[f13_arg1.templateNum]( self, f13_arg1 )
					self:addElement( self )
					local f13_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeftRight )
					f13_local10.height = f13_local2 - LUI.EULABase.BGPaddingTop
					local self = LUI.UIElement.new( f13_local10 )
					self:addElement( self )
					local f13_local12 = CoD.CreateState( nil, -f13_local10.height - 1, nil, nil, CoD.AnchorTypes.Bottom )
					local f13_local13
					if f13_local3 then
						f13_local13 = 1
						if not f13_local13 then
						
						else
							f13_local12.alpha = f13_local13
							f13_local12.width = self.width
							self:addElement( LUI.Divider.new( f13_local12, 10, LUI.Divider.Grey ) )
							local f13_local14 = -f0_local0.Height / 2 + 1
							local f13_local15 = 40
							local f13_local16 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
							f13_local16.width = 0
							f13_local16.height = f13_local10.height - 10
							local self = LUI.UIElement.new( f13_local16 )
							self:addElement( self )
							local f13_local18, self = nil
							local f13_local20 = f0_local9[f13_arg1.popupAction]
							if f13_local20 then
								local f13_local21 = 20
								local f13_local22 = Engine.Localize( f13_local20 )
								local f13_local23, f13_local24, f13_local25, self = GetTextDimensions2( " " .. f13_local22, f0_local0.Font, f0_local0.Height )
								local f13_local27 = f13_local21 + f13_local25 - f13_local23
								local f13_local28 = f13_local27
								local f13_local29 = f0_local0.Height
								if f13_local4 then
									local f13_local30 = CoD.CreateState( f13_local16.width - f13_local27, f13_local14, nil, nil, CoD.AnchorTypes.Left )
								end
								f13_local18 = f13_local30 or CoD.CreateState( -f13_local28 / 2, f13_local14, nil, nil, CoD.AnchorTypes.Left )
								f13_local18.width = f13_local28
								f13_local18.height = f13_local29
								self = LUI.UIElement.new( f13_local18 )
								self:addElement( self )
								local f13_local31 = LUI.MenuBuilder.BuildAddChild( self, {
									type = "button_helper_text_main"
								} )
								f13_local31:processEvent( {
									name = "add_button_helper_text",
									button_ref = "button_alt1",
									helper_text = f13_local22,
									side = "right",
									clickable = true,
									priority = -1000
								} )
								self.bind.popupData = f13_arg1
								self.bind:registerEventHandler( "button_alt1", OnPopupAction )
								local f13_local32 = 130
								local f13_local33 = 34
								local f13_local34 = f13_local31:getFirstDescendentById( "button_alt1_id" )
								f13_local18.left = f13_local32 - f13_local27 / 2
								f13_local18.top = f13_local33
								f13_local31:registerAnimationState( "shift", f13_local18 )
								f13_local31:animateToState( "shift" )
							end
							local f13_local21 = nil
							if f13_local4 then
								local f13_local22 = f13_arg1.callToAction
								local f13_local35, f13_local23, f13_local24, f13_local25 = GetTextDimensions2( f13_local22, f0_local0.Font, f0_local0.Height )
								if f13_local20 then
									local f13_local36 = CoD.CreateState( nil, f13_local14, nil, nil, CoD.AnchorTypes.Left )
								end
								f13_local21 = f13_local36 or CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
								f13_local21.font = f0_local0.Font
								f13_local21.color = Colors.h1.light_grey
								local self
								if f13_local20 then
									self = f13_local24 - f13_local35 - (f13_arg1.callToActionLengthOffset or 0)
									if not self then
									
									else
										f13_local21.width = self
										f13_local21.height = f0_local0.Height
										self
										if not f13_local20 then
											self = LUI.Alignment.Center
											if not self then
											
											else
												f13_local21.alignment = self
												self = LUI.UIText.new( f13_local21 )
												self:setTextStyle( f13_arg1.noHtml and CoD.TextStyle.Shadowed or CoD.TextStyle.Html )
												self:setText( f13_local22 )
												self:addElement( self )
											end
										end
										self = nil
									end
								end
								self = f13_local5.width
							end
							if f13_local20 and f13_local4 then
								f13_local16.width = f13_local21.width + f13_local15 + f13_local18.width
								self:registerAnimationState( "default", f13_local16 )
								self:animateToState( "default" )
								local f13_local22 = 15
								local f13_local23 = self
								local f13_local35 = self.registerAnimationState
								local f13_local24 = "default"
								local f13_local25 = {}
								local self = f13_local16.width - f13_local18.width
								if Engine.IsPC() then
									local f13_local37 = f13_local22
								end
								f13_local25.left = self + (f13_local37 or 0)
								f13_local25.width = f13_local18.width
								f13_local25.leftAnchor = true
								f13_local25.topAnchor = false
								f13_local25.rightAnchor = false
								f13_local25.bottomAnchor = false
								f13_local35( f13_local23, f13_local24, f13_local25 )
								self:animateToState( "default" )
							end
							return self
						end
					end
					f13_local13 = 0
				end
			end
			f13_local7 = 0
		end
	end
	self = LUI.EULA.Height
end

LUI.MarketingPopup.new = function ( f15_arg0, f15_arg1 )
	return LUI.MarketingPopup.Base( f15_arg0, {
		h1Header = f15_arg1.title,
		h2Header = f15_arg1.content_short,
		h3Header = f15_arg1.h3_header,
		body = f15_arg1.content_long,
		bodyTop = f15_arg1.content_longTop,
		image = f15_arg1.popup_image or f15_arg1.image,
		imageLeft = f15_arg1.imageLeft,
		imageTop = f15_arg1.imageTop,
		imageRight = f15_arg1.imageRight,
		imageBottom = f15_arg1.imageBottom,
		extraTextLeft = f15_arg1.extraTextLeft,
		extraTextTop = f15_arg1.extraTextTop,
		action = f15_arg1.action,
		popupAction = f15_arg1.popup_action,
		callToAction = f15_arg1.popup_action_title or f15_arg1.action_title,
		callToActionLengthOffset = f15_arg1.call_to_action_length_offset or 0,
		item_name = f15_arg1.item,
		noHtml = f15_arg1.noHtml,
		debug_id = f15_arg1.debug_id,
		extraTextData = {
			text1 = f15_arg1.extraText1
		},
		templateNum = f15_arg1.template or 1
	} )
end

LUI.MenuBuilder.registerPopupType( "MarketingPopup", LUI.MarketingPopup.new )
LockTable( _M )
