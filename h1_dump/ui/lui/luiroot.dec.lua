require( "LUI.CodeDependence" )

if not Engine.InFrontend() then
	require( "LUI.GameX" )
end
require( "LUI.FlowManager" )
require( "LUI.HudManager" )
require( "LUI.EventCatcher" )
LUI.UIRoot = {}
LUI.UIRoot.childPriorities = {
	debugInfo = 999,
	liveDebugInfo = 998,
	timer = 10000,
	modal = 500,
	menuRoot = 10,
	default = 0,
	MLGHud = -3,
	objectivesHud = -4,
	hudElems = -5,
	deadQuoteHud = -6,
	hudElemsDotMenu = -7,
	roundEndScreen = -8,
	finalScoresScreen = -9,
	hudContainer = -10
}
LUI.UIRoot.debugConst = {
	textElemId = "debug_lui_info",
	subTreeRootId = "debug_lui_subtree_root",
	updateEvent = "debug_lui_info_update",
	toggleEvent = "debug_lui_toggle_show_list",
	subTreeEvent = "debug_lui_set_show_list_subtree",
	toggleDesignGridEvent = "debug_lui_toggle_design_grid"
}
LUI.UIRoot.liveDebugConst = {
	textElemId = "live_debug_lui_info",
	updateEvent = "live_debug_lui_info_update",
	toggleEvent = "live_debug_lui_toggle_show_list"
}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerAnimationState( "default", {
		left = -f1_arg1.width / 2,
		top = -f1_arg1.height / 2,
		right = f1_arg1.width / 2,
		bottom = f1_arg1.height / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	f1_arg0:animateToState( "default" )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg1.root = f2_arg0
	f2_arg0:dispatchEventToChildren( f2_arg1 )
	if not f2_arg1.handled and f2_arg1.name == "mouseup" then
		local f2_local0 = LUI.FlowManager.GetTopOpenAndVisibleMenu( f2_arg0 )
		if f2_local0 then
			if f2_arg1.button == "left" then
				f2_local0:processEvent( {
					name = "unhandled_leftmouseup",
					menu = f2_arg1.menu,
					controller = f2_arg1.controller,
					mouse = f2_arg1.mouse
				} )
			elseif f2_arg1.button == "right" then
				f2_local0:processEvent( {
					name = "unhandled_rightmouseup",
					menu = f2_arg1.menu,
					controller = f2_arg1.controller,
					mouse = f2_arg1.mouse
				} )
			end
		end
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.createMenu[f3_arg1.menu]
	if f3_local0 then
		f3_arg0:addElement( f3_local0() )
	else
		error( "LUI Error: Tried to add nonexistent menu " .. f3_arg1.menu )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0.m_currentAnimationState
	local f4_local1 = f4_local0.unitsToPixels
	return f4_local0.left + f4_arg1.left * f4_local1, f4_local0.top + f4_arg1.top * f4_local1, f4_local0.left + f4_arg1.right * f4_local1, f4_local0.top + f4_arg1.bottom * f4_local1
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = f5_arg0.m_currentAnimationState
	local f5_local1 = f5_local0.unitsToPixels
	local f5_local2 = f5_local0.left
	local f5_local3 = f5_local0.top
	f5_arg2:setRectInC( f5_local2 + f5_arg1.left * f5_local1, f5_local3 + f5_arg1.top * f5_local1, f5_local2 + f5_arg1.right * f5_local1, f5_local3 + f5_arg1.bottom * f5_local1 )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	return f6_arg1 * f6_arg0.m_currentAnimationState.unitsToPixels
end

local f0_local6 = function ( f7_arg0, f7_arg1, f7_arg2 )
	return f7_arg0:RootPixelsToUnits( f7_arg1, f7_arg2 )
end

LUI.UIRoot.DebugPrint_IgnoreEventsSetup = function ( f8_arg0 )
	f8_arg0.debugPrintIgnoreEvents = {
		process_events = true,
		gamepad_sticks = true,
		mousemove = true,
		pitbull_update_speed = true,
		pitbull_charge = true,
		pitbull_target_locked = true,
		railgun_hud_update = true
	}
end

local f0_local7 = function ( f9_arg0, f9_arg1 )
	InitPlayerDataExtended( f9_arg0, f9_arg1 )
end

local f0_local8 = function ( f10_arg0, f10_arg1 )
	ResetEmptyLoadouts( f10_arg0, f10_arg1 )
end

function LUI_UIRoot_TryOpenMOTD( f11_arg0, f11_arg1 )
	if f11_arg1.isLobbyOnlineFocused then
		LUI.MOTD.TryForceOpenMOTD()
	end
end

local f0_local9 = function ( f12_arg0, f12_arg1, f12_arg2 )
	if not f12_arg0 or f12_arg1 < 1 or #f12_arg0 < f12_arg1 then
		return f12_arg1
	else
		f12_arg0[f12_arg1]:setText( f12_arg2 )
		return f12_arg1 + 1
	end
end

local f0_local10 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	if f13_arg0 == nil then
		return f13_arg3
	elseif f13_arg1 < f13_arg2 then
		return f13_arg3
	elseif #f13_arg4 <= f13_arg3 then
		return f0_local9( f13_arg4, #f13_arg4, "[Tree too big to display, truncated]" )
	end
	local f13_local0 = "|"
	for f13_local1 = 0, f13_arg2, 1 do
		local f13_local4 = f13_local1
		f13_local0 = f13_local0 .. "----"
	end
	f13_arg3 = f0_local9( f13_arg4, f13_arg3, f13_local0 .. f13_arg0.id )
	local f13_local1 = f13_arg0:getFirstChild()
	while f13_local1 do
		f13_arg3 = f0_local10( f13_local1, f13_arg1, f13_arg2 + 1, f13_arg3, f13_arg4 )
		f13_local1 = f13_local1:getNextSibling()
	end
	return f13_arg3
end

local f0_local11 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg0
	local f14_local1 = ""
	local f14_local2 = Engine.GetLuiRoot()
	f14_local1 = "Menu Stack: \n"
	if #f14_local2.flowManager.menuInfoStack > 0 then
		for f14_local3 = #f14_local2.flowManager.menuInfoStack, 1, -1 do
			local f14_local6 = f14_local2.flowManager.menuInfoStack[f14_local3]
			local f14_local7 = "Not Visible"
			if f14_local6.menu then
				f14_local7 = "Visible"
			end
			f14_local1 = f14_local1 .. "  " .. f14_local3 .. ") " .. f14_local6.name .. " | " .. f14_local7 .. "\n"
		end
	else
		f14_local1 = f14_local1 .. "[empty]\n"
	end
	f14_local0:setText( f14_local1 )
	local f14_local3, f14_local4 = f14_local0:getElementTextDims()
	local f14_local5 = f14_local0:getChildById( LUI.UIRoot.debugConst.subTreeRootId )
	f14_local5:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		top = 0,
		left = f14_local3
	} )
	f14_local5:animateToState( "default" )
	local f14_local8 = nil
	local f14_local6 = f14_local0.traversalDepth
	local f14_local7 = 1
	if f14_local0.traversalRootName == f14_local2.id then
		f14_local8 = f14_local2
	else
		f14_local8 = f14_local2:getFirstDescendentById( f14_local0.traversalRootName )
	end
	f14_local7 = f0_local9( f14_local0.subTreeLines, f14_local7, "LUI subtree from root [" .. f14_local0.traversalRootName .. "] with depth [" .. f14_local6 .. "]:" )
	if f14_local8 then
		f14_local7 = f0_local10( f14_local8, f14_local6, 0, f14_local7, f14_local0.subTreeLines )
	else
		f14_local7 = f0_local9( f14_local0.subTreeLines, f14_local7, "[root '" .. f14_local0.traversalRootName .. "' not found, use 'LuiShowListSetSubtree' to set traversal root]" )
	end
	for f14_local9 = f14_local7, #f14_local0.subTreeLines, 1 do
		f14_local0.subTreeLines[f14_local9]:setText( "" )
	end
end

local f0_local12 = function ( f15_arg0 )
	local f15_local0 = CoD.TextSettings.BodyFontSmall.font
	local f15_local1 = 20
	local f15_local2 = 60
	local f15_local3 = 30
	if not Engine.InFrontend() then
		f15_local2 = 300
	end
	local self = LUI.UIText.new()
	self.id = LUI.UIRoot.debugConst.textElemId
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		top = f15_local3,
		left = f15_local2,
		height = f15_local1,
		font = f15_local0,
		alignment = LUI.Alignment.Left,
		red = 1,
		green = 1,
		blue = 0,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:setPriority( LUI.UIRoot.childPriorities.debugInfo )
	self:registerEventHandler( LUI.UIRoot.debugConst.updateEvent, f0_local11 )
	f15_arg0:addElement( self )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 0,
		left = 0
	} )
	self.id = LUI.UIRoot.debugConst.subTreeRootId
	self:addElement( self )
	self.subTreeLines = {}
	if Engine.InFrontend() then
		self.traversalRootName = "mp_main_menu"
	else
		self.traversalRootName = "hudContainer"
	end
	self.traversalDepth = 1
	for f15_local6 = 0, 35, 1 do
		local self = LUI.UIText.new()
		self.id = "subTreeLine" .. f15_local6
		self:registerAnimationState( "default", {
			leftAnchor = true,
			topAnchor = true,
			top = (f15_local1 - 1) * f15_local6,
			left = 15,
			height = f15_local1,
			font = f15_local0,
			alignment = LUI.Alignment.Left,
			red = 1,
			green = 1,
			blue = 0
		} )
		self:animateToState( "default", 0 )
		self:setPriority( LUI.UIRoot.childPriorities.debugInfo )
		self:addElement( self )
		self.subTreeLines[#self.subTreeLines + 1] = self
	end
	self:addElement( LUI.UITimer.new( 100, LUI.UIRoot.debugConst.updateEvent ) )
	self:animateToState( "active", 0 )
	return self
end

local f0_local13 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0
	local f16_local1 = f16_local0:getChildById( LUI.UIRoot.debugConst.textElemId )
	if f16_local1 == nil then
		f0_local12( f16_local0 )
	else
		local f16_local2 = f16_local1:getChildById( "LUITimer" )
		if f16_local2.disabled then
			f16_local2:processEvent( {
				name = "enable",
				immediate = true
			} )
			LUI.UITimer.Reset( f16_local2 )
			f16_local1:animateToState( "active", 0 )
		else
			LUI.UITimer.Stop( f16_local2 )
			f16_local2:processEvent( {
				name = "disable",
				immediate = true
			} )
			f16_local1:animateToState( "default", 0 )
		end
	end
end

local f0_local14 = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg0
	local f17_local1 = f17_local0:getChildById( LUI.UIRoot.debugConst.textElemId )
	if f17_local1 == nil then
		f17_local1 = f0_local12( f17_local0 )
	else
		local f17_local2 = f17_local1:getChildById( "LUITimer" )
		if f17_local2.disabled then
			f0_local13( f17_local0, {} )
		end
	end
	if f17_arg1.traversalRoot and f17_arg1.traversalRoot ~= "." then
		if f17_arg1.traversalRoot == ".." then
			local f17_local2 = f17_local0:getFirstDescendentById( f17_local1.traversalRootName )
			f17_local1.traversalRootName = f17_local0.id
			if f17_local2 then
				local f17_local3 = f17_local2:getParent()
				if f17_local3 then
					f17_local1.traversalRootName = f17_local3.id
				end
			end
		else
			f17_local1.traversalRootName = f17_arg1.traversalRoot
		end
	end
	if f17_arg1.traversalDepth and type( f17_arg1.traversalDepth ) == "number" then
		f17_local1.traversalDepth = f17_arg1.traversalDepth
	end
end

local f0_local15 = function ( f18_arg0, f18_arg1 )
	local f18_local0 = Engine.GetDvarBool( "lui_drawdesigngrid" )
	if f18_local0 and f18_arg0.designGrid == nil then
		local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
		if not Engine.UsingSplitscreenUpscaling() then
			self:setupLetterboxElement()
		end
		f18_arg0:addElement( self )
		local self, f18_local3, f18_local4, self = nil
		local f18_local6 = CoD.TextSettings.BodyFontSmall
		local f18_local7 = CoD.CreateState( 0, -f18_local6.Height, 0, 0, CoD.AnchorTypes.TopLeftRight )
		f18_local7.font = f18_local6.Font
		f18_local7.alignment = LUI.Alignment.Center
		f18_local7.alpha = 4
		local f18_local8 = CoD.CreateState( 0, 0, 0, f18_local6.Height, CoD.AnchorTypes.BottomLeftRight )
		f18_local8.font = f18_local6.Font
		f18_local8.alignment = LUI.Alignment.Center
		f18_local8.alpha = 4
		for f18_local9 = 0, DesignGridDims.num_grids, 1 do
			f18_local4 = DesignGridDims.grid_spacing * f18_local9 + DesignGridDims.horz_gutter
			f18_local3 = CoD.CreateState( f18_local4, DesignGridDims.vert_gutter, f18_local4 + DesignGridDims.grid_width, -DesignGridDims.vert_gutter, CoD.AnchorTypes.TopBottomLeft )
			f18_local3.material = RegisterMaterial( "white" )
			f18_local3.red = 1
			f18_local3.green = 0
			f18_local3.blue = 0
			f18_local3.alpha = 0.2
			self = LUI.UIImage.new( f18_local3 )
			self:addElement( self )
			self = LUI.UIText.new( f18_local7 )
			self:setText( f18_local9 )
			self:addElement( self )
			self = LUI.UIText.new( f18_local8 )
			self:setText( f18_local9 )
			self:addElement( self )
		end
		f18_arg0.designGrid = self
	elseif not f18_local0 and f18_arg0.designGrid ~= nil then
		f18_arg0.designGrid:close()
		f18_arg0.designGrid = nil
	end
end

local f0_local16 = {}
function LUI_UIRoot_AddExtraDebugInformation( f19_arg0, f19_arg1 )
	if f19_arg0 == nil or f19_arg1 == nil then
		return 
	else
		f0_local16[f19_arg0] = f19_arg1
	end
end

function LUI_UIRoot_RemoveExtraDebugInformation( f20_arg0 )
	if f20_arg0 == nil then
		return 
	else
		f0_local16[f20_arg0] = nil
	end
end

local f0_local17 = function ( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = nil
	if f21_arg2 ~= nil then
		f21_local0 = f21_arg0 .. f21_arg1 .. ": " .. f21_arg2 .. "\n"
	else
		f21_local0 = f21_arg0
	end
	return f21_local0
end

local f0_local18 = function ( f22_arg0, f22_arg1 )
	local f22_local0 = f22_arg0
	local f22_local1 = ""
	local f22_local2 = Engine.GetLuiRoot()
	f22_local1 = "Live Debugging: \n"
	local f22_local3 = Matchmaking.GetLiveDebuggingInfo()
	f22_local1 = f0_local17( f0_local17( f0_local17( f0_local17( f0_local17( f0_local17( f0_local17( f0_local17( f0_local17( f22_local1, "Host", f22_local3.host ), "Server Name", f22_local3.serverName ), "Joinable", f22_local3.joinable ), "Skill", f22_local3.skill ), "Skill Bucket", f22_local3.skillBucket ), "Advertised Bucket", f22_local3.advertBucket ), "Data Center", f22_local3.dataCenter ), "Skill Range", f22_local3.skillRange ), "Matchmaking Status", f22_local3.matchmakingStatus )
	if f22_local3.dataCenterCount ~= nil and f22_local3.dataCenterCount > 0 then
		f22_local1 = f0_local17( f22_local1, "Current Data Centers", f22_local3.dataCenters )
	end
	for f22_local7, f22_local8 in pairs( f0_local16 ) do
		f22_local1 = f0_local17( f22_local1, f22_local7, f22_local8() )
	end
	f22_local0:setText( f22_local1 )
end

local f0_local19 = function ( f23_arg0 )
	local f23_local0 = CoD.TextSettings.BodyFontSmall.font
	local f23_local1 = 12
	local f23_local2 = 350
	local f23_local3 = 30
	local self = LUI.UIText.new()
	self.id = LUI.UIRoot.liveDebugConst.textElemId
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		top = f23_local3,
		left = f23_local2,
		height = f23_local1,
		font = f23_local0,
		alignment = LUI.Alignment.Left,
		red = 1,
		green = 1,
		blue = 0,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:setPriority( LUI.UIRoot.childPriorities.debugInfo )
	self:registerEventHandler( LUI.UIRoot.liveDebugConst.updateEvent, f0_local18 )
	f23_arg0:addElement( self )
	local self = LUI.UITimer.new( 100, LUI.UIRoot.liveDebugConst.updateEvent )
	self.id = "LUITimer"
	self:addElement( self )
	self:animateToState( "active", 0 )
	return self
end

local f0_local20 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg0
	local f24_local1 = f24_local0:getChildById( LUI.UIRoot.liveDebugConst.textElemId )
	if f24_local1 == nil then
		f0_local19( f24_local0 )
	else
		local f24_local2 = f24_local1:getChildById( "LUITimer" )
		if f24_local2.disabled then
			f24_local2:processEvent( {
				name = "enable",
				immediate = true
			} )
			LUI.UITimer.Reset( f24_local2 )
			f24_local1:animateToState( "active", 0 )
		else
			LUI.UITimer.Stop( f24_local2 )
			f24_local2:processEvent( {
				name = "disable",
				immediate = true
			} )
			f24_local1:animateToState( "default", 0 )
		end
	end
end

local f0_local21 = function ( f25_arg0, f25_arg1 )
	LUI.FlowManager.RequestAddMenu( nil, "EULA", true, f25_arg1.controller, false, {
		declineCallback = function ()
			Engine.DeclineInvitation()
		end
	} )
end

local f0_local22 = function ( f27_arg0, f27_arg1 )
	LUI.FlowManager.RequestAddMenu( nil, "EULA", true, f27_arg1.controller, false, {
		acceptCallback = function ()
			Engine.JoinSplitScreenParty( f27_arg1.controller )
		end,
		declineCallback = function ()
			Engine.LeaveSplitScreenParty( f27_arg1.controller )
		end
	} )
end

local f0_local23 = 0
function tick_crm_ban_message( f30_arg0 )
	local f30_local0 = Engine.GetLuiRoot()
	local f30_local1 = f30_local0:getFirstDescendentById( "exit_button_id" )
	if f30_local1 then
		if f0_local23 > 1 then
			f0_local23 = f0_local23 - 1
			f30_local1:setText( "" .. f0_local23 )
		else
			f30_local1:setText( Engine.ToUpperCase( Engine.Localize( "@MENU_CONTINUE" ) ) )
			f30_local1.disabled = false
		end
	end
end

function CheckCRMBanMessage( f31_arg0, f31_arg1 )
	local f31_local0 = Engine.MarketingGetMessage( f31_arg1, LUI.MarketingLocation.Ban, 0 )
	if f31_local0 ~= nil then
		f0_local23 = 10
		LUI.FlowManager.RequestAddMenu( f31_arg0, "generic_confirmation_popup", true, f31_arg1, false, {
			confirm_will_close = true,
			cancel_will_close = false,
			popup_title = f31_local0.title,
			message_text = f31_local0.content_long,
			button_text = "" .. f0_local23,
			confirmation_action = function ( f32_arg0, f32_arg1 )
				Engine.MarketingReportMessageViewed( f31_arg1, LUI.MarketingLocation.Ban, 0 )
				Engine.MarketingClearLocation( f31_arg1, LUI.MarketingLocation.Ban )
				Engine.MarketingRefreshMessages( f31_arg1 )
				LUI.FlowManager.RequestLeaveMenu( f32_arg0 )
			end
		} )
		local f31_local1 = Engine.GetLuiRoot()
		local f31_local2 = f31_local1:getFirstDescendentById( "exit_button_id" )
		f31_local2:registerEventHandler( "tick_crm_ban_message", tick_crm_ban_message )
		f31_local2:addElement( LUI.UITimer.new( 1000, "tick_crm_ban_message", nil, false ) )
		f31_local2.disabled = true
		return true
	else
		return false
	end
end

local f0_local24 = function ( f33_arg0, f33_arg1 )
	CheckCRMBanMessage( f33_arg0, f33_arg1.controller )
end

local f0_local25 = function ( f34_arg0, f34_arg1 )
	if Engine.IsConsoleGame() then
		return 
	elseif Engine.GetCurrentLanguage() ~= 1 then
		return 
	elseif not f34_arg1.resetControl and Engine.GetDvarBool( "cg_IsWarnedAZERTY" ) then
		return 
	elseif Engine.IsGamepadEnabled() then
		return 
	elseif f34_arg1.resetControl then
		LUI.FlowManager.RequestAddMenu( f34_arg0, "switch_to_azerty_reset_popup", f34_arg1.exclusiveController, f34_arg1.controller )
	else
		LUI.FlowManager.RequestAddMenu( f34_arg0, "switch_to_azerty_popup", f34_arg1.exclusiveController, f34_arg1.controller )
	end
end

LUI.UIRoot.new = function ( f35_arg0 )
	local self = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	self.id = "LUIRoot"
	self.isaroot = true
	self.unitsToPixelsRect = f0_local3
	self.pixelsToUnits = f0_local6
	self.unitsToPixels = f0_local5
	self.setDimensionsForElement = f0_local4
	self:registerEventHandler( "resize", f0_local0 )
	self:registerEventHandler( "mousemove", f0_local1 )
	self:registerEventHandler( "mousedown", f0_local1 )
	self:registerEventHandler( "mouseup", f0_local1 )
	self:registerEventHandler( "process_events", LUI.UIRoot.ProcessEvents )
	self:registerEventHandler( "show_invite_eula", f0_local21 )
	self:registerEventHandler( "show_splitscreen_eula", f0_local22 )
	self:registerEventHandler( "check_switch_to_azerty", f0_local25 )
	self:registerEventHandler( "show_crm_messages", f0_local24 )
	if Engine.IsMultiplayer() then
		self:registerEventHandler( "init_player_data_extended", f0_local7 )
		self:registerEventHandler( "reset_empty_loadouts", f0_local8 )
	end
	self:registerEventHandler( "open_motd", LUI_UIRoot_TryOpenMOTD )
	LUI.roots[f35_arg0] = self
	if LUI.primaryRoot == nil then
		LUI.primaryRoot = self
	end
	self.inputHungryElements = setmetatable( {}, {
		__mode = "v"
	} )
	self.eventCatcher = LUI.EventCatcher.new()
	self.eventCatcher:setupRoot( self )
	self.flowManager = LUI.FlowManager.new()
	self.flowManager:setupRoot( self )
	if Engine.IsMultiplayer() or not Engine.InFrontend() then
		self.hudManager = LUI.HudManager.new()
		self.hudManager:setupRoot( self )
	end
	self.timerGroupQueues = {}
	self.name = f35_arg0
	self.eventQueue = {}
	self.debugEvents = true
	LUI.UIRoot.DebugPrint_IgnoreEventsSetup( self )
	self.processEvent = LUI.UIRoot.ProcessEvent
	self.SaveMenuStack = self.flowManager.SaveMenuStack
	self.RestoreMenuStack = self.flowManager.RestoreMenuStack
	self.AnyActiveMenusInStack = self.flowManager.AnyActiveMenusInStack
	self.IsMenuOpenAndVisible = self.flowManager.IsMenuOpenAndVisible
	self.IsMenuInStack = self.flowManager.IsMenuInStack
	self.IsMenuTopmost = self.flowManager.IsMenuTopmost
	self.WantsInputDuringGameplay = LUI.UIRoot.WantsInputDuringGameplay
	self.IsScoreboardOpen = LUI.UIRoot.IsScoreboardOpen
	self.IsTopSignInMenu = self.flowManager.IsTopSignInMenu
	self.IsExclusiveMenu = self.flowManager.IsExclusiveMenu
	self.GetFirstButtonActionInFocusId = LUI.UIRoot.GetFirstButtonActionInFocusId
	if Engine.IsDevelopmentBuild() then
		self:registerEventHandler( LUI.UIRoot.debugConst.toggleEvent, f0_local13 )
		self:registerEventHandler( LUI.UIRoot.debugConst.subTreeEvent, f0_local14 )
		self:registerEventHandler( LUI.UIRoot.debugConst.toggleDesignGridEvent, f0_local15 )
		f0_local15( self, nil )
	end
	self:registerEventHandler( LUI.UIRoot.liveDebugConst.toggleEvent, f0_local20 )
	return self
end

LUI.UIRoot.GetFirstButtonActionInFocus = function ( f36_arg0 )
	if f36_arg0:isInFocus() and f36_arg0.m_eventHandlers.button_action then
		return f36_arg0
	end
	local f36_local0 = f36_arg0:getFirstChild()
	while f36_local0 do
		local f36_local1 = LUI.UIRoot.GetFirstButtonActionInFocus( f36_local0 )
		if f36_local1 then
			return f36_local1
		end
		f36_local0 = f36_local0:getNextSibling()
	end
end

LUI.UIRoot.GetFirstButtonActionInFocusId = function ( f37_arg0 )
	local f37_local0 = LUI.UIRoot.GetFirstButtonActionInFocus( f37_arg0 )
	return f37_local0.id
end

LUI.UIRoot.IsScoreboardOpen = function ( f38_arg0 )
	if f38_arg0.hudManager then
		local f38_local0 = f38_arg0.hudManager:getHud()
		if f38_local0 then
			return f38_local0:isScoreboardOpen()
		end
	end
	return false
end

LUI.UIRoot.WantsInputDuringGameplay = function ( f39_arg0 )
	assert( f39_arg0.inputHungryElements )
	return #f39_arg0.inputHungryElements > 0
end

LUI.UIRoot.BlockButtonInput = function ( f40_arg0, f40_arg1, f40_arg2 )
	if f40_arg1 then
		f40_arg0.m_blockButtonInput = true
	else
		f40_arg0.m_blockButtonInput = false
	end
end

LUI.UIRoot.BlockMouseMove = function ( f41_arg0, f41_arg1, f41_arg2 )
	if f41_arg1 then
		f41_arg0.m_blockMouseMove = true
	else
		f41_arg0.m_blockMouseMove = false
	end
end

LUI.UIRoot.ProcessEvent = function ( f42_arg0, f42_arg1 )
	if f42_arg1.immediate == true then
		local f42_local0 = profile.beginuserevent( "IE_" .. f42_arg1.name )
		LUI.UIRoot.ProcessEventNow( f42_arg0, f42_arg1 )
		profile.enduserevent( f42_local0 )
	else
		local f42_local0 = f42_arg0.eventQueue
		if f42_arg1.noDuplicates then
			for f42_local4, f42_local5 in pairs( f42_local0 ) do
				if f42_local5.name == f42_arg1.name and f42_local5.target == f42_arg1.target then
					return 
				end
			end
		end
		table.insert( f42_local0, f42_arg1 )
		if #f42_local0 > 20 then
			DebugPrint( "LUI WARNING: Event queue exceeded 20 events! " .. f42_arg1.name )
			if f42_arg1.name == "omnvar_update" then
				DebugPrint( "LUI WARNING: omnvar = " .. f42_arg1.omnvar )
			end
		end
	end
end

LUI.UIRoot.ProcessEvents = function ( f43_arg0, f43_arg1 )
	LUI.UITimer.DispatchEventsFromQueue( f43_arg0 )
	local f43_local0 = f43_arg0.eventQueue
	local f43_local1 = f43_local0[1]
	if f43_local1 ~= nil then
		table.remove( f43_local0, 1 )
		local f43_local2 = profile.beginuserevent( "RE_" .. f43_local1.name )
		LUI.UIRoot.ProcessEventNow( f43_arg0, f43_local1 )
		profile.enduserevent( f43_local2 )
	end
end

LUI.UIRoot.IsNavigationEvent = function ( f44_arg0 )
	if not handled and f44_arg0.name == "gamepad_button" and f44_arg0.down and (f44_arg0.button == "up" or f44_arg0.button == "down" or f44_arg0.button == "left" or f44_arg0.button == "right") then
		return true
	else
		return false
	end
end

LUI.UIRoot.IsUserInputEvent = function ( f45_arg0 )
	if f45_arg0.name == "gamepad_button" or f45_arg0.name == "mousedown" or f45_arg0.name == "mouseup" then
		return true
	else
		return false
	end
end

LUI.UIRoot.ProcessEventNow = function ( f46_arg0, f46_arg1 )
	if Engine.GetDvarBool( "lui_print_events" ) and f46_arg1.name ~= "process_events" and f46_arg1.name ~= "mousemove" then
		DebugPrint( "Processed Event '" .. f46_arg1.name .. "'" )
		if f46_arg1.name == "gamepad_button" then
			if f46_arg1.down then
				DebugPrint( "button " .. f46_arg1.button .. " is down" )
			else
				DebugPrint( "button " .. f46_arg1.button .. " is up" )
			end
		end
	end
	if f46_arg0.m_blockButtonInput and (f46_arg1.name == "gamepad_button" or f46_arg1.name == "mouseup") then
		DebugPrint( "Blocking Button input for " .. f46_arg1.button .. "  because m_blockButtonInput is true" )
		return false
	end
	local f46_local0 = f46_arg0
	if f46_arg1.target then
		f46_local0 = f46_arg1.target
	end
	if LUI.UIRoot.IsUserInputEvent( f46_arg1 ) then
		CoD.StartEventSound()
	end
	if LUI.UIElement.processEvent( f46_local0, f46_arg1 ) then
		if LUI.UIRoot.IsUserInputEvent( f46_arg1 ) then
			CoD.EndEventSound()
		end
		return true
	elseif LUI.UIRoot.IsNavigationEvent( f46_arg1 ) then
		f46_arg0.flowManager:CheckRestoreFocus()
	end
	if LUI.UIRoot.IsUserInputEvent( f46_arg1 ) then
		CoD.EndEventSound()
	end
	return false
end

