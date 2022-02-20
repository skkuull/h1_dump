LUI.CacFactionWidget = InheritFrom( LUI.UIElement )
LUI.CacFactionWidget.Size = 90
LUI.CacFactionWidget.FactionPrevious = function ( f1_arg0, f1_arg1 )
	local f1_local0 = -1
	f1_arg0.controller = f1_arg1.controller
	f1_arg0:ChangeFaction( f1_arg1, f1_local0 )
end

LUI.CacFactionWidget.FactionNext = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 1
	f2_arg0.controller = f2_arg1.controller
	f2_arg0:ChangeFaction( f2_arg1, f2_local0 )
end

LUI.CacFactionWidget.ChangeFaction = function ( f3_arg0, f3_arg1, f3_arg2 )
	Engine.PlaySound( CoD.SFX.MenuScroll )
	f3_arg0.currentFaction = f3_arg0.currentFaction + f3_arg2
	if f3_arg0.currentFaction < 0 then
		f3_arg0.currentFaction = f3_arg0.numFactions - 1
	elseif f3_arg0.currentFaction == f3_arg0.numFactions then
		f3_arg0.currentFaction = 0
	end
	f3_arg0:dispatchEventToRoot( {
		name = "on_faction_changed",
		faction = f3_arg0.currentFaction
	} )
	Cac.NotifyVirtualLobby( "faction_changed", f3_arg0.currentFaction .. ":" .. f3_arg0.controller )
	Cac.SetPlayerFaction( f3_arg0.controller, f3_arg0.currentFaction )
	f3_arg0:RefreshVisuals()
end

LUI.CacFactionWidget.HideHelpButtons = function ( f4_arg0 )
	local f4_local0, f4_local1 = nil
	if Engine.IsVita( f4_arg0.controller ) then
		f4_local0 = "button_left_trigger_vita"
		f4_local1 = "button_right_trigger_vita"
	end
	LUI.ButtonHelperText.AddHelperTextObject( f4_arg0.menu.help, {
		name = "add_button_helper_text",
		button_ref = "button_left_trigger",
		button_ref2 = "button_right_trigger",
		button_ref_vita = f4_local0,
		button_ref_vita_2 = f4_local1,
		helper_text = "",
		side = "right"
	} )
end

LUI.CacFactionWidget.ShowHelpButtons = function ( f5_arg0 )
	local f5_local0, f5_local1 = nil
	if Engine.IsVita( f5_arg0.controller ) then
		f5_local0 = "button_left_trigger_vita"
		f5_local1 = "button_right_trigger_vita"
	end
	LUI.ButtonHelperText.AddHelperTextObject( f5_arg0.menu.help, {
		name = "add_button_helper_text",
		button_ref = "button_left_trigger",
		button_ref2 = "button_right_trigger",
		button_ref_vita = f5_local0,
		button_ref_vita_2 = f5_local1,
		helper_text = Engine.Localize( "@LUA_MENU_CHANGE_FACTION" ),
		side = "right",
		clickable = false,
		priority = 2000,
		groupLRButtons = true,
		leftIconClickFunc = function ( f6_arg0, f6_arg1 )
			LUI.CacFactionWidget.FactionPrevious( f5_arg0, f6_arg1 )
		end,
		rightIconClickFunc = function ( f7_arg0, f7_arg1 )
			LUI.CacFactionWidget.FactionNext( f5_arg0, f7_arg1 )
		end
	}, function ( f8_arg0, f8_arg1 )
		LUI.CacFactionWidget.FactionPrevious( f5_arg0, f8_arg1 )
	end, nil, function ( f9_arg0, f9_arg1 )
		LUI.CacFactionWidget.FactionNext( f5_arg0, f9_arg1 )
	end )
end

LUI.CacFactionWidget.ShowFactionImage = function ( f10_arg0 )
	if f10_arg0.factionIcon then
		f10_arg0.factionIcon:animateToState( "default" )
	end
end

LUI.CacFactionWidget.HideFactionImage = function ( f11_arg0 )
	if f11_arg0.factionIcon then
		f11_arg0.factionIcon:animateToState( "hidden" )
	end
end

LUI.CacFactionWidget.RefreshVisuals = function ( f12_arg0 )
	if f12_arg0.factionText then
		f12_arg0.factionText:setText( Engine.ToUpperCase( Engine.Localize( "@" .. Engine.TableLookupByRow( Cac.FactionsCSV.File, f12_arg0.currentFaction, Cac.FactionsCSV.Cols.Name ) ) ) )
	end
	if f12_arg0.factionIcon then
		f12_arg0.factionIcon:Update( Engine.TableLookupByRow( Cac.FactionsCSV.File, f12_arg0.currentFaction, Cac.FactionsCSV.Cols.Asset ) )
	end
end

LUI.CacFactionWidget.new = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local0 = CoD.CreateState( nil, 105, 25, nil, CoD.AnchorTypes.TopRight )
	if f13_arg3 then
		f13_local0 = CoD.CreateState( nil, nil, -43, -145, CoD.AnchorTypes.BottomRight )
	end
	f13_local0.width = 175
	f13_local0.height = 100
	local self = LUI.UIElement.new( f13_local0 )
	self:setClass( LUI.CacFactionWidget )
	local f13_local2 = 0
	while Engine.TableLookupByRow( Cac.FactionsCSV.File, f13_local2, Cac.FactionsCSV.Cols.Index ) ~= "" do
		f13_local2 = f13_local2 + 1
	end
	self.menu = f13_arg0
	if f13_arg1 ~= nil and f13_arg1 ~= -1 then
		local f13_local3 = f13_arg1
	end
	self.controller = f13_local3 or Engine.GetFirstActiveController()
	self.numFactions = f13_local2
	self.currentFaction = Cac.GetPlayerFaction( f13_arg1 )
	if f13_arg2 then
		local f13_local4 = LUI.FactionIcon.new( {
			width = LUI.CacFactionWidget.Size,
			height = LUI.CacFactionWidget.Size,
			alpha = 1
		} )
		f13_local4:registerAnimationState( "hidden", {
			alpha = 0
		} )
		self.factionIcon = f13_local4
		self:addElement( f13_local4 )
		local f13_local5 = CoD.CreateState( nil, nil, nil, 45, CoD.AnchorTypes.Bottom )
		f13_local5.height = 12
		f13_local5.width = 50
		f13_local5.alpha = 0.6
		f13_local5.alignment = LUI.Alignment.Center
		f13_local5.font = CoD.TextSettings.H1TitleFont.Font
		local self = LUI.UIText.new( f13_local5 )
		self.factionText = self
		f13_local4:addElement( self )
	end
	self:RefreshVisuals()
	self:ShowHelpButtons()
	return self
end

