local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OnClassButtonOver( f1_arg0, f1_arg1 )
	local f1_local0 = nil
	local f1_local1 = f1_arg0.classLoc
	LUI.CacStaticLayout.ClassLoc = f1_local1
	if f1_arg0.classSlot ~= nil then
		Cac.SetSelectedClassIndex( f1_arg0.classSlot, f1_local1 )
		f1_arg0.menu.selectedClassIndex = f1_arg0.classSelectIndex
	end
	f1_arg0:dispatchEventToParent( {
		name = "refresh_loadout",
		loadout = Cac.GetLoadout( f1_arg0.classLoc, f1_arg0.classSlot ),
		isCustom = f1_arg0.classLoc == "customClasses"
	} )
end

function OnClassButtonAction( f2_arg0, f2_arg1 )
	Engine.NotifyServer( "class_select", f2_arg0.classSelectIndex )
	local f2_local0 = MBh.EmitEventToRoot( "toggle_pause_off" )
	f2_local0( f2_arg0 )
	LUI.FlowManager.RequestCloseAllMenus( f2_arg0 )
end

function IsClassButtonDisabled( f3_arg0, f3_arg1 )
	return f3_arg0.isLocked or f3_arg0.restricted
end

function OnCacRestoreFocus( f4_arg0, f4_arg1 )
	OnCacGainFocus( f4_arg0, f4_arg1 )
	return true
end

function CacMenuTabPageFlip( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = f5_arg0.totalClasses
	local f5_local1 = math.ceil( f5_local0 / f5_arg0.classesPerPage )
	local f5_local2 = f5_arg0.currentPage
	f5_arg0.currentPage = f5_arg2
	if f5_local1 < f5_arg0.currentPage then
		f5_arg0.currentPage = f5_local1
	elseif f5_arg0.currentPage < 1 then
		f5_arg0.currentPage = 1
	end
	if f5_local2 ~= f5_arg0.currentPage or f5_arg3 then
		if f5_arg0.headerText then
			f5_arg0.headerText:setText( Engine.Localize( "@MPUI_X_SLASH_Y", f5_arg0.currentPage, f5_local1 ) )
		end
		if f5_arg0.pipList then
			f5_arg0:processEvent( {
				name = "update_pips"
			} )
		end
		local f5_local3 = nil
		if f5_arg0.selectedClassIndex >= 200 then
			f5_local3 = (f5_arg0.numCustomClasses + (f5_arg0.selectedClassIndex - 200) % 6) % f5_arg0.classesPerPage
		elseif f5_arg0.selectedClassIndex >= 100 then
			f5_local3 = (f5_arg0.numCustomClasses + f5_arg0.selectedClassIndex - 100) % f5_arg0.classesPerPage
		else
			f5_local3 = f5_arg0.selectedClassIndex % f5_arg0.classesPerPage
		end
		local f5_local4 = f5_arg0.list:getChildById( "cac_class_button_" .. f5_local3 )
		if f5_local4 then
			f5_local4:processEvent( {
				name = "lose_focus",
				controller = f5_arg1
			} )
		end
		local f5_local5, f5_local6 = nil
		for f5_local7 = 0, f5_arg0.classesPerPage - 1, 1 do
			local f5_local10 = f5_arg0.list:getChildById( "cac_class_button_" .. f5_local7 )
			local f5_local11 = (f5_arg0.currentPage - 1) * f5_arg0.classesPerPage + f5_local7
			if f5_local11 < f5_local0 then
				f5_local6 = f5_arg0.classTable[f5_local11 + 1]
				f5_local10:makeFocusable()
				f5_local10:show()
				if f5_local7 <= f5_local3 then
					f5_local5 = f5_local10
				end
				f5_local10.title = f5_local6.title
				f5_local10.classLoc = f5_local6.classLoc
				f5_local10.classSlot = f5_local6.classSlot
				f5_local10.classSelectIndex = f5_local6.classSelectIndex
				f5_local10.isDefaultClass = f5_local6.isDefaultClass
				f5_local10.restricted = f5_local6.restricted
				f5_local10.isLocked = f5_local6.isLocked
				if f5_local10.isLocked or f5_local10.restricted then
					f5_local10:processEvent( {
						name = "disable"
					} )
					f5_local10:makeFocusable()
				else
					f5_local10:processEvent( {
						name = "enable"
					} )
				end
				RefreshClassButton( f5_local10, nil, f5_arg0 )
			end
			f5_local10:makeNotFocusable()
			f5_local10:hide()
		end
		if f5_local5 then
			f5_local5:processEvent( {
				name = "gain_focus",
				controller = f5_arg1
			} )
		end
	end
end

function CacOnTabLeft( f6_arg0, f6_arg1, f6_arg2 )
	CacMenuTabPageFlip( f6_arg2, f6_arg1.controller, f6_arg2.currentPage - 1 )
end

function CacOnTabRight( f7_arg0, f7_arg1, f7_arg2 )
	CacMenuTabPageFlip( f7_arg2, f7_arg1.controller, f7_arg2.currentPage + 1 )
end

function CacOnTabClick( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	CacMenuTabPageFlip( f8_arg2, f8_arg1.controller, f8_arg3 )
end

function OnCacGainFocus( f9_arg0, f9_arg1 )
	CacMenuTabPageFlip( f9_arg0, Cac.GetSelectedControllerIndex(), f9_arg0.currentPage, true )
end

function RefreshClassButton( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = "Error"
	if f10_arg0.classSlot then
		local f10_local1 = f10_arg0.classLoc
		local f10_local2 = f10_arg0.classSlot
		local f10_local3 = f10_arg0.restricted
		local f10_local4 = f10_arg0.isLocked
		f10_arg0:processEvent( {
			name = "update_restricted",
			isRestricted = f10_local3
		} )
		f10_arg0.menu.haveRestrictedClasses = f10_arg0.menu.haveRestrictedClasses or f10_local3
	end
	f10_arg0:setText( f10_arg0.title )
end

function AddClassButtons( f11_arg0, f11_arg1 )
	local f11_local0 = Cac.GetSelectedControllerIndex()
	local f11_local1 = nil
	for f11_local2 = 0, f11_arg1 - 1, 1 do
		f11_local1 = f11_arg0:AddButton( Engine.MarkLocalized( f11_local2 ), OnClassButtonAction, nil, nil, nil, {
			canShowRestricted = true,
			showLockOnDisable = true
		} )
		f11_local1:rename( "cac_class_button_" .. f11_local2 )
		f11_local1.disabledFunc = IsClassButtonDisabled
		f11_local1.controllerIndex = f11_local0
		f11_local1:registerEventHandler( "button_over", OnClassButtonOver )
		f11_local1:registerEventHandler( "button_over_disable", OnClassButtonOver )
		f11_local1:registerEventHandler( "refresh_class_name", RefreshClassButton )
		f11_local1.menu = f11_arg0
	end
end

function createClassTable()
	local f12_local0, f12_local1, f12_local2 = nil
	local f12_local3 = Cac.GetSelectedControllerIndex()
	local f12_local4 = {}
	local f12_local5, f12_local6 = nil
	f12_local0 = Cac.GetCustomClassLoc()
	f12_local1 = Cac.GetCustomClassCount( f12_local0 )
	for f12_local7 = 0, f12_local1 - 1, 1 do
		if Cac.IsCustomClassLocked( f12_local3, f12_local0, f12_local7 ) then
			break
		end
		f12_local4[#f12_local4 + 1] = {
			title = Cac.GetCustomClassName( f12_local0, f12_local7 ),
			classLoc = f12_local0,
			classSlot = f12_local7,
			classSelectIndex = Cac.GenerateCustomClassIndex( f12_local7, f12_local0, f12_local1 ),
			isDefaultClass = false,
			restricted = Cac.IsCustomClassRestricted( f12_local0, f12_local7 ),
			isLocked = false
		}
	end
	f12_local5 = #f12_local4
	f12_local1 = Cac.GetDefaultClassCount()
	f12_local0 = "defaultClassesTeam" .. Game.GetPlayerTeam()
	if f12_local0 == "defaultClassesTeam0" then
		f12_local0 = "defaultClassesTeam2"
	end
	for f12_local7 = 0, f12_local1 - 1, 1 do
		f12_local4[#f12_local4 + 1] = {
			title = Cac.GetCustomClassName( f12_local0, f12_local7 ),
			classLoc = f12_local0,
			classSlot = f12_local7,
			classSelectIndex = Cac.GenerateDefaultClassIndex( f12_local7, f12_local0, f12_local1 ),
			isDefaultClass = true,
			isLocked = Cac.IsDefaultClassLocked( f12_local3, f12_local7 )
		}
	end
	return f12_local4, f12_local5, #f12_local4
end

function class_select_main( f13_arg0, f13_arg1 )
	local f13_local0, f13_local1, f13_local2 = nil
	local f13_local3 = false
	local f13_local4 = 11
	if Engine.UsingSplitscreenUpscaling() then
		f13_local4 = 5
	end
	Cac.EnableMenuCache()
	Cac.SetSelectedControllerIndex( f13_arg1.exclusiveController )
	f13_local0, f13_local1, f13_local2 = createClassTable()
	local f13_local5 = nil
	if f13_local4 < f13_local2 then
		f13_local5 = 35
		f13_local3 = true
	end
	local f13_local6 = LUI.MenuTemplate.new
	local f13_local7 = f13_arg0
	local f13_local8 = {
		menu_title = "@LUA_MENU_CHOOSE_CLASS_CAPS",
		menu_height = 548,
		menu_top_indent = f13_local5,
		exclusiveController = f13_arg1.exclusiveController,
		scrollInSplitscreen = true
	}
	local f13_local9 = Engine.IsConsoleGame()
	if not f13_local9 then
		f13_local9 = Engine.IsGamepadEnabled()
	end
	f13_local8.allowPagedScrolling = f13_local9
	f13_local6 = f13_local6( f13_local7, f13_local8 )
	f13_local6.numCustomClasses = f13_local1
	f13_local6.totalClasses = f13_local2
	f13_local6.classTable = f13_local0
	f13_local6.classesPerPage = f13_local4
	f13_local6.selectedClassIndex = Game.GetOmnvar( "ui_loadout_selected" )
	if f13_local6.selectedClassIndex < 0 then
		f13_local6.selectedClassIndex = 0
	end
	f13_local7 = nil
	if f13_local6.selectedClassIndex >= 200 then
		f13_local7 = math.ceil( (f13_local6.numCustomClasses + (f13_local6.selectedClassIndex - 200) % 6 + 1) / f13_local4 )
	elseif f13_local6.selectedClassIndex >= 100 then
		f13_local7 = math.ceil( (f13_local6.numCustomClasses + f13_local6.selectedClassIndex - 100 + 1) / f13_local4 )
	else
		f13_local7 = math.ceil( (f13_local6.selectedClassIndex + 1) / f13_local4 )
	end
	f13_local6.currentPage = f13_local7
	AddClassButtons( f13_local6, f13_local4 )
	if f13_local3 then
		f13_local8 = ""
		f13_local9 = ""
		if CoD.UsingController() then
			if Engine.IsVita( f13_arg1.exclusiveController ) then
				f13_local8 = Engine.Localize( "LUA_MENU_PAD_LEFT_TRIGGER_BUTTON" )
				f13_local9 = Engine.Localize( "LUA_MENU_PAD_RIGHT_TRIGGER_BUTTON" )
			else
				f13_local8 = Engine.Localize( "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" )
				f13_local9 = Engine.Localize( "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" )
			end
		else
			f13_local8 = Engine.Localize( "PLATFORM_KB_LEFT_SHOULDER_BUTTON" )
			f13_local9 = Engine.Localize( "PLATFORM_KB_RIGHT_SHOULDER_BUTTON" )
		end
		local self = function ( f14_arg0, f14_arg1 )
			CacOnTabLeft( f14_arg0, f14_arg1, f13_local6 )
		end
		
		local layout = function ( f15_arg0, f15_arg1 )
			CacOnTabRight( f15_arg0, f15_arg1, f13_local6 )
		end
		
		local self = LUI.UIElement.new( CoD.CreateState( 0, GenericMenuDims.MenuStartY - 7, GenericMenuDims.menu_width_standard, GenericMenuDims.MenuStartY + f13_local5, CoD.AnchorTypes.TopLeft ) )
		f13_local6:addElement( self )
		local self = nil
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
			self = LUI.UIText.new( CoD.CreateState( -70, 0, -50, 20, CoD.AnchorTypes.Top ) )
			self:setText( f13_local8 )
		else
			local self = CoD.CreateState( 25, 0, -50, nil, CoD.AnchorTypes.TopLeft )
			self.font = CoD.TextSettings.TitleFontMediumLarge.Font
			self.height = 20
			self = LUI.UIButtonText.new( self, Engine.ToUpperCase( Engine.Localize( f13_local8 ) ), false, false, false, false, self, function ()
				return f13_local6.currentPage == 1
			end )
		end
		local self = nil
		if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
			self = LUI.UIText.new( CoD.CreateState( 70, 0, 90, 20, CoD.AnchorTypes.Top ) )
			self:setText( f13_local9 )
		else
			local self = CoD.CreateState( GenericMenuDims.menu_width_standard - 45, 0, 0, nil, CoD.AnchorTypes.TopLeft )
			self.font = CoD.TextSettings.TitleFontMediumLarge.Font
			self.height = 20
			self = LUI.UIButtonText.new( self, Engine.ToUpperCase( Engine.Localize( f13_local9 ) ), false, false, false, false, layout, function ()
				return f13_local6.currentPage == math.ceil( f13_local6.totalClasses / f13_local6.classesPerPage )
			end )
		end
		local self = LUI.UIText.new( CoD.CreateState( 0, 2, 0, 18, CoD.AnchorTypes.TopLeftRight ) )
		local f13_local16 = 5
		local f13_local17 = math.ceil( f13_local6.totalClasses / f13_local6.classesPerPage )
		local f13_local18 = GenericMenuDims.menu_width_standard
		local f13_local19 = f13_local18 / f13_local17
		local self = LUI.UIHorizontalList.new( {
			top = -4,
			spacing = 0,
			alignment = LUI.Alignment.Center,
			height = f13_local16 + 10,
			width = f13_local18
		} )
		local f13_local21 = function ( f18_arg0, f18_arg1 )
			f18_arg0.pipList:closeChildren()
			for f18_local0 = 1, f13_local17, 1 do
				local f18_local3 = f18_local0
				local self = nil
				self = LUI.UIBorder.new( {
					width = f13_local19,
					height = f13_local16,
					color = Colors.mw1_green,
					material = RegisterMaterial( "white" ),
					borderThickness = 1
				} )
				if f18_local3 == f18_arg0.currentPage then
					local f18_local5 = 4
					local f18_local6 = 6
					local f18_local7 = CoD.CreateState( -f18_local5, -f18_local6, f18_local5, f18_local6, CoD.AnchorTypes.All )
					f18_local7.material = RegisterMaterial( "h1_tabs_states_selected" )
					f18_local7.alpha = 0.35
					local self = LUI.UIImage.new( f18_local7 )
					self:setup3SliceRatio( 8, 0.25 )
					self:addElement( self )
				elseif Engine.IsPC() then
					local f18_local5 = 4
					local f18_local6 = 6
					local f18_local7 = CoD.CreateState( -f18_local5, -f18_local6, f18_local5, f18_local6, CoD.AnchorTypes.All )
					f18_local7.material = RegisterMaterial( "h1_tabs_states_selected" )
					f18_local7.alpha = 0
					local self = LUI.UIImage.new( f18_local7 )
					self:registerAnimationState( "mouseOver", {
						alpha = 0.25
					} )
					self:setup3SliceRatio( 8, 0.25 )
					self:addElement( self )
					local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, 10, CoD.AnchorTypes.All ) )
					self:setHandleMouseButton( true )
					self:setHandleMouseMove( true )
					self.m_requireFocusType = FocusType.MouseOver
					self:registerEventHandler( "leftmousedown", function ( element, event )
						Engine.PlaySound( CoD.SFX.MenuAccept )
						CacOnTabClick( element, event, f13_local6, f18_local3 )
					end )
					self:registerEventHandler( "mouseenter", function ( element, event )
						self:animateToState( "mouseOver" )
					end )
					self:registerEventHandler( "mouseleave", function ( element, event )
						self:animateToState( "default" )
					end )
					self:addElement( self )
				end
				f18_arg0.pipList:addElement( self )
			end
		end
		
		f13_local6:registerEventHandler( "update_pips", f13_local21 )
		self:addElement( self )
		self:addElement( self )
		self:addElement( self )
		self:addElement( self )
		f13_local6.headerText = self
		f13_local6.pipList = self
		f13_local21( f13_local6, nil )
		local self = LUI.UIBindButton.new()
		f13_local6:addElement( self )
		self:registerEventHandler( "button_shoulderl", self )
		self:registerEventHandler( "button_shoulderr", layout )
	end
	f13_local6.list:registerEventHandler( "refresh_loadout", function ( element, event )
		local f22_local0 = element:getParent()
		if f22_local0 and f22_local0.layout then
			local f22_local1 = nil
			local f22_local2 = #f22_local0.layout.containers
			for f22_local3 = 1, f22_local2, 1 do
				f22_local1 = f22_local0.layout.containers[f22_local3]
				f22_local1:Refresh( event.loadout, event.isCustom )
				f22_local1:show()
			end
		end
	end )
	f13_local8 = Engine.UsingSplitscreenUpscaling()
	f13_local9 = CoD.CreateState( CoD.DesignGridHelper( 8.25 ), 60, 0, 0, CoD.AnchorTypes.All )
	if f13_local8 then
		f13_local9 = CoD.CreateState( -CoD.DesignGridHelper( 27 ), 60, 0, 0, CoD.AnchorTypes.TopRight )
	end
	local self = LUI.UIElement.new( f13_local9 )
	self.id = "cac_container"
	f13_local6:addElement( self )
	
	local layout = LUI.CacStaticLayout.new( nil, true, true, f13_local8 )
	layout:disableTreeFocus()
	self:addElement( layout )
	f13_local6.layout = layout
	
	local self = Game.GetOmnvar( "ui_loadout_selected" )
	LUI.ButtonHelperText.AddHelperTextObject( f13_local6.help, LUI.ButtonHelperText.CommonEvents.addBackButton, MBh.LeaveMenu() )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		LUI.ButtonHelperText.AddHelperTextObject( f13_local6.help, LUI.ButtonHelperText.CommonEvents.addSelectButton )
	end
	Cac.DisableMenuCache()
	f13_local6:AddCountdownTimer()
	f13_local6:registerEventHandler( "gain_focus", OnCacGainFocus )
	f13_local6:registerEventHandler( "restore_focus", OnCacRestoreFocus )
	if LUI.FlowManager.IsTopMenuModal() then
		OnCacGainFocus( f13_local6, nil )
	end
	return f13_local6
end

LUI.MenuBuilder.registerType( "class_select_main", class_select_main )
LockTable( _M )
