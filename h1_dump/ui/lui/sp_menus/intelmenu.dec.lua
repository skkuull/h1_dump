local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.IntelMenu = InheritFrom( LUI.MenuTemplate )
LUI.IntelMenu.MaxIntel = 64
LUI.IntelMenu.CurrentIntelCount = 0
LUI.IntelMenu.RecalculateIntelCount = function ()
	local f1_local0 = 0
	for f1_local1 = 1, LUI.IntelMenu.MaxIntel, 1 do
		if Engine.GetPlayerIntelIsFound( f1_local1 ) then
			f1_local0 = f1_local0 + 1
		end
	end
	LUI.IntelMenu.CurrentIntelCount = f1_local0
end

f0_local0 = {
	{
		dvar = "sf_use_bw",
		name = "@MENU_CHEATS_NAME1",
		desc = "@MENU_CHEATS_DESC1",
		lockedDesc = "@MENU_CHEATS_UNLOCK1",
		intelCount = 2
	},
	{
		dvar = "sf_use_invert",
		name = "@MENU_CHEATS_NAME2",
		desc = "@MENU_CHEATS_DESC2",
		lockedDesc = "@MENU_CHEATS_UNLOCK2",
		intelCount = 4
	},
	{
		dvar = "sf_use_contrast",
		name = "@MENU_CHEATS_NAME3",
		desc = "@MENU_CHEATS_DESC3",
		lockedDesc = "@MENU_CHEATS_UNLOCK3",
		intelCount = 6
	},
	{
		dvar = "sf_use_chaplin",
		name = "@MENU_CHEATS_NAME4",
		desc = "@MENU_CHEATS_DESC4",
		lockedDesc = "@MENU_CHEATS_UNLOCK4",
		intelCount = 8
	},
	{
		dvar = "sf_use_clustergrenade",
		name = "@MENU_CHEATS_NAME5",
		desc = "@MENU_CHEATS_DESC5",
		lockedDesc = "@MENU_CHEATS_UNLOCK5",
		intelCount = 10
	},
	{
		dvar = "sf_use_melon_mode",
		name = "@MENU_CHEATS_NAME9",
		desc = "@MENU_CHEATS_DESC9",
		lockedDesc = "@MENU_CHEATS_UNLOCK9",
		intelCount = 12
	},
	{
		dvar = "sf_use_tire_explosion",
		name = "@MENU_CHEATS_NAME6",
		desc = "@MENU_CHEATS_DESC6",
		lockedDesc = "@MENU_CHEATS_UNLOCK6",
		intelCount = 15
	},
	{
		dvar = "sf_use_lemonade_mode",
		name = "@MENU_CHEATS_NAME12",
		desc = "@MENU_CHEATS_DESC12",
		lockedDesc = "@MENU_CHEATS_UNLOCK12",
		intelCount = 18
	},
	{
		dvar = "sf_use_slowmo",
		name = "@MENU_CHEATS_NAME7",
		desc = "@MENU_CHEATS_DESC7",
		lockedDesc = "@MENU_CHEATS_UNLOCK7",
		intelCount = 20
	},
	{
		dvar = "sf_use_ragdoll_mode",
		name = "@MENU_CHEATS_NAME10",
		desc = "@MENU_CHEATS_DESC10",
		lockedDesc = "@MENU_CHEATS_UNLOCK10",
		intelCount = 22
	},
	{
		dvar = "sf_use_tracksuit_mode",
		name = "@MENU_CHEATS_NAME13",
		desc = "@MENU_CHEATS_DESC13",
		lockedDesc = "@MENU_CHEATS_UNLOCK13",
		intelCount = 27
	},
	{
		dvar = "sf_use_ignoreammo",
		name = "@MENU_CHEATS_NAME8",
		desc = "@MENU_CHEATS_DESC8",
		lockedDesc = "@MENU_CHEATS_UNLOCK8",
		intelCount = 30
	}
}
f0_local1 = function ( f2_arg0, f2_arg1 )
	if not f2_arg1 then
		f2_arg1 = 0
	end
	local f2_local0 = Engine.GetHighestDifficultyForLevel( f2_arg0 - 1, f2_arg1 )
	if f2_local0 and f2_local0 ~= "" then
		return Engine.Localize( f2_local0 )
	else
		return ""
	end
end

f0_local2 = function ()
	local f3_local0
	if not Engine.IsDevelopmentBuild() and not Engine.GetDvarBool( "mis_cheat" ) then
		f3_local0 = not Engine.GetDvarBool( "ui_cheat_unlock_all_mission" )
	else
		f3_local0 = false
	end
	return f3_local0
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if Engine.GetDvarBool( "limited_mode" ) then
		if f4_arg0 == 10 then
			return true
		else
			return false
		end
	elseif f4_arg1 and Engine.GetDvarBool( "profileMenuOption_hasUnlockedAll_SP" ) then
		return true
	elseif f4_arg0 >= 22 then
		return true
	elseif f0_local1( f4_arg0, Engine.GetControllerForLocalClient( 0 ) ) == "" and f0_local2() then
		return false
	else
		return true
	end
end

local f0_local4 = function ()
	for f5_local0 = 1, 20, 1 do
		if not f0_local3( f5_local0, false ) then
			return false
		end
	end
	return true
end

function intel_menu_create( f6_arg0, f6_arg1 )
	LUI.IntelMenu.RecalculateIntelCount()
	local f6_local0 = LUI.MenuTemplate.new( f6_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@MENU_INTEL" ) ),
		menu_top_indent = LUI.MenuTemplate.spMenuOffset,
		menu_width = GenericMenuDims.OptionMenuWidth
	} )
	local f6_local1 = nil
	if Engine.InFrontend() then
		f6_local1 = LUI.LevelSelect.IsAllLevelCompleted()
	else
		f6_local1 = f0_local4()
	end
	for f6_local12, f6_local13 in pairs( f0_local0 ) do
		if Engine.GetDvarString( f6_local13.dvar ) == nil then
			Engine.SetDvarString( f6_local13.dvar, "0", true )
		end
		local f6_local5 = false
		if Engine.InFrontend() then
			f6_local5 = LUI.LevelSelect.ProgressionEnabled()
		else
			f6_local5 = f0_local2()
		end
		if f6_local5 then
			f6_local13.locked = LUI.IntelMenu.CurrentIntelCount < f6_local13.intelCount
		else
			f6_local13.locked = false
		end
		local f6_local6 = nil
		if f6_local1 and not f6_local13.locked then
			f6_local6 = f6_local13.name
		else
			if f6_local13.locked then
				local f6_local7 = "@MENU_BIND_KEY_PENDING"
			end
			f6_local6 = f6_local7 or f6_local13.name
		end
		local f6_local8 = nil
		if not f6_local1 then
			f6_local8 = ""
		else
			if f6_local13.locked then
				local f6_local9 = ""
			end
			f6_local8 = f6_local9 or "@MENU_OFF"
		end
		local f6_local10 = f6_local13.locked and f6_local13.lockedDesc or f6_local13.desc
		local f6_local11 = {
			{
				text = "@MENU_ON",
				value = "1"
			},
			{
				text = f6_local8,
				value = "0"
			}
		}
		if not Engine.InFrontend() and Engine.GetDvarString( "mapname" ) == "ac130" and (not (f6_local12 < 1 or f6_local12 >= 5) or f6_local12 == 12) then
			f6_local13.locked = true
			f6_local6 = f6_local13.name
			f6_local10 = "@LUA_MENU_INTEL_CHEAT_UNAVAILABLE"
			f6_local8 = "@MENU_OFF"
			f6_local11 = {
				{
					text = f6_local8,
					value = "1"
				},
				{
					text = f6_local8,
					value = "0"
				}
			}
		end
		if not Engine.GetDvarBool( "ragdoll_enable" ) and f6_local12 == 10 and f6_local13.locked == false then
			f6_local13.locked = true
			f6_local6 = f6_local13.name
			f6_local10 = Engine.Localize( "@MENU_CHEATS_DESC10_PC" )
			f6_local8 = "@MENU_OFF"
			f6_local11 = {
				{
					text = f6_local8,
					value = "1"
				},
				{
					text = f6_local8,
					value = "0"
				}
			}
		end
		LUI.Options.CreateOptionButton( f6_local0, f6_local13.dvar, f6_local6, f6_local10, f6_local11, nil, function ()
			if f6_local1 then
				return f6_local13.locked
			else
				return true
			end
		end, function ()
			f6_local0.list:processEvent( {
				name = "content_refresh"
			} )
		end )
	end
	buildInfoBox( f6_local0 )
	f6_local2 = f6_local0:AddBackButton()
	LUI.Options.InitScrollingList( f6_local0.list, nil )
	LUI.Options.AddOptionTextInfo( f6_local0 )
	if Engine.InFrontend() then
		LUI.LevelSelect.InitializeCheat( f6_local0, function ( f9_arg0, f9_arg1 )
			LUI.FlowManager.RequestAddMenu( nil, "intel_menu", true, f9_arg1.controller, true, nil, {
				reload = true
			} )
		end )
	end
	return f6_local0
end

function buildInfoBox( f10_arg0 )
	local f10_local0 = 145 * CoD.FullHDToHD
	local f10_local1 = 242 * CoD.FullHDToHD
	local f10_local2 = 550 * CoD.FullHDToHD
	local f10_local3 = 40 * CoD.FullHDToHD
	local f10_local4 = 44 * CoD.FullHDToHD
	local f10_local5 = 16
	local f10_local6 = 12
	local f10_local7 = CoD.TextSettings.BodyFont18.Font
	local f10_local8 = f10_local3
	local f10_local9 = f10_local3 + f10_local4 + f10_local5
	local f10_local10 = -(f10_local3 + f10_local6)
	local f10_local11 = f10_local9 - f10_local4 / 2
	local f10_local12 = f10_local10 - f10_local4 / 2 - f10_local6
	local self = LUI.UIElement.new( CoD.CreateState( -f10_local2, f10_local0, 0, f10_local0 + f10_local1, CoD.AnchorTypes.TopRight ) )
	self.id = "mainwindow_id"
	local f10_local14 = CoD.CreateState( f10_local2, 0, 0, f10_local1, CoD.AnchorTypes.TopLeft )
	f10_local14.material = RegisterMaterial( "h1_popup_bg" )
	local self = LUI.UIImage.new( f10_local14 )
	self.id = "background_id"
	self:addElement( self )
	local f10_local16 = CoD.CreateState( 0, 0.5, 8, 0.5, CoD.AnchorTypes.TopRight )
	f10_local16.color = Colors.h1.light_grey
	self:addElement( LUI.UILine.new( f10_local16 ) )
	local f10_local17 = CoD.CreateState( 0, 0.5, -8, 0.5, CoD.AnchorTypes.TopLeft )
	f10_local17.color = Colors.h1.light_grey
	self:addElement( LUI.UILine.new( f10_local17 ) )
	local f10_local18 = CoD.CreateState( -f10_local2, f10_local8, -f10_local3, nil, CoD.AnchorTypes.TopRight )
	f10_local18.height = f10_local5
	f10_local18.alignment = LUI.Alignment.Right
	f10_local18.font = f10_local7
	local self = LUI.UIText.new( f10_local18 )
	local f10_local20 = nil
	if Engine.IsRightToLeftLanguage() then
		f10_local20 = "30/" .. LUI.IntelMenu.CurrentIntelCount .. " " .. Engine.Localize( "@LUA_MENU_INTELS_FOUND" )
	else
		f10_local20 = Engine.Localize( "@LUA_MENU_INTELS_FOUND" ) .. " " .. LUI.IntelMenu.CurrentIntelCount .. "/30"
	end
	self.id = "title_id"
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:setText( f10_local20 )
	self:addElement( self )
	local f10_local21 = CoD.CreateState( -f10_local3 - 8, f10_local11, -f10_local3, f10_local11, CoD.AnchorTypes.TopRight )
	f10_local21.color = Colors.h1.light_grey
	self:addElement( LUI.UILine.new( f10_local21 ) )
	local f10_local22, f10_local23 = GetTextDimensions( Engine.Localize( "@LUA_MENU_INTELS_COLLECT" ), f10_local7, f10_local6, f10_local2 - f10_local3 )
	local f10_local24
	if f10_local6 < f10_local23 then
		f10_local24 = -6
		if not f10_local24 then
		
		else
			local f10_local25 = CoD.CreateState( -f10_local2, f10_local9 + f10_local24, -f10_local3, nil, CoD.AnchorTypes.TopRight )
			f10_local25.height = f10_local6
			f10_local25.alignment = LUI.Alignment.Right
			f10_local25.font = f10_local7
			f10_local25.alpha = 0.5
			local self = LUI.UIText.new( f10_local25 )
			self.id = "instructions_id"
			self:setText( Engine.Localize( "@LUA_MENU_INTELS_COLLECT" ) )
			self:addElement( self )
			local f10_local27 = CoD.CreateState( -f10_local3 - 8, f10_local12, -f10_local3, f10_local12, CoD.AnchorTypes.BottomRight )
			f10_local27.color = Colors.h1.light_grey
			self:addElement( LUI.UILine.new( f10_local27 ) )
			local f10_local28 = CoD.CreateState( -f10_local2, nil, -f10_local3, f10_local10, CoD.AnchorTypes.BottomRight )
			f10_local28.height = f10_local6
			f10_local28.alignment = LUI.Alignment.Right
			f10_local28.font = f10_local7
			f10_local28.lineSpacingRatio = 0.2
			f10_local28.alpha = 0.5
			local self = LUI.UIText.new( f10_local28 )
			self.id = "enabling_id"
			if f0_local4() then
				if Engine.IsPS4() then
					self:setText( Engine.Localize( "@LUA_MENU_INTELS_AVAILABLE_PS4" ) )
				else
					self:setText( Engine.Localize( "@LUA_MENU_INTELS_AVAILABLE" ) )
				end
			else
				self:setText( Engine.Localize( "@LUA_MENU_INTELS_CAMPAIGN" ) )
			end
			self:addElement( self )
			f10_arg0:addElement( self )
		end
	end
	f10_local24 = 0
end

LUI.MenuBuilder.registerType( "intel_menu", intel_menu_create )
LockTable( _M )
