local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AARProgress = InheritFrom( LUI.UIElement )
f0_local0 = CoD.TextSettings.Font37
f0_local1 = CoD.TextSettings.Font21
f0_local2 = CoD.TextSettings.Font73
local f0_local3 = CoD.TextSettings.Font16
local f0_local4 = CoD.TextSettings.Font18
local f0_local5 = CoD.TextSettings.Font28
local f0_local6 = CoD.TextSettings.Font162
local f0_local7 = CoD.TextSettings.Font60
local f0_local8 = CoD.TextSettings.Font24
local f0_local9 = Colors.h1.light_grey
local f0_local10 = Colors.h1.light_grey
local f0_local11 = Colors.mp.aar_score_gold
local f0_local12 = Colors.h1.medium_grey
local f0_local13 = Colors.h1.light_green
local f0_local14 = Colors.mp.aar_border_outline_green
local f0_local15 = Colors.h1.light_grey
local f0_local16 = Colors.white
local f0_local17 = Colors.h1.light_grey
local f0_local18 = "ui_summary_screen"
local f0_local19 = "ui_cac_reinforce_reveal_item"
local f0_local20 = "ui_mp_upgrage_xp_bar_fill"
local f0_local21 = "mp_level_up"
local f0_local22, f0_local23, f0_local24, f0_local25 = nil
local f0_local26 = 28
local f0_local27 = 55
local f0_local28 = 30
local f0_local29 = 3
local f0_local30 = 18
local f0_local31 = 0.2
local f0_local32 = 60
local f0_local33 = 1
local f0_local34 = 1.5
local f0_local35 = 500
local f0_local36 = 6
local f0_local37 = 0.05
local f0_local38 = 1
local f0_local39 = 0
local f0_local40 = 1000
local f0_local41 = f0_local40 / 2
local f0_local42 = 2
local f0_local43 = 0.25 * f0_local40
local f0_local44 = 100
local f0_local45 = f0_local40 / 3
local f0_local46 = f0_local40
local f0_local47 = rankUpFadeOutDur
local f0_local48 = 23
local f0_local49 = f0_local0.Height + f0_local28
local f0_local50 = 169
local f0_local51 = 417
local f0_local52 = CoD.DesignGridHelper( 1, 0.22 )
local f0_local53 = 2
local f0_local54 = 23
local f0_local55 = 9
local f0_local56 = 6
local f0_local57 = f0_local40 * 0.04
local f0_local58, f0_local59, f0_local60 = nil
local f0_local61 = 1
local f0_local62 = {}
local f0_local63 = nil
local f0_local64 = {}
local f0_local65 = 0
local f0_local66 = 0
local f0_local67 = 0
local f0_local68 = 0
local f0_local69 = 0
local f0_local70 = false
local f0_local71 = LUI.InventoryUtils.UnlockTypes.PERK
local f0_local72 = LUI.InventoryUtils.UnlockTypes.WEAPON
function AddAARStat( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions2( f1_arg1.value, f0_local2.Font, f0_local2.Height )
	local f1_local4 = f1_arg4 or f1_local2 - f1_local0
	local f1_local5, f1_local6, f1_local7, f1_local8 = GetTextDimensions2( Engine.ToUpperCase( Engine.Localize( f1_arg1.name ) ), f0_local1.Font, f0_local1.Height )
	local f1_local9 = f1_local7 - f1_local5
	local f1_local10 = f1_arg1.disabledAlpha or 1
	local f1_local11 = f1_arg1.enabledAlpha or 1
	local f1_local12 = -2
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self.id = f1_arg1.id .. "_statContainer"
	f1_arg0:addElement( self )
	local f1_local14 = f1_arg3 + f1_local12
	local f1_local15 = 0
	local f1_local16 = 3
	if f1_arg1.imageKey then
		local f1_local17 = RegisterMaterial( f1_arg1.imageKey )
		local f1_local18 = Engine.GetMaterialAspectRatio( f1_local17 )
		local f1_local19 = f0_local2.Height - 9 + f1_local16
		f1_local15 = f1_local18 * f1_local19 + f1_local16
		local self = CoD.CreateState( f1_local14, f1_arg2 - f1_local16, nil, nil, CoD.AnchorTypes.TopLeft )
		self.material = f1_local17
		self.width = f1_local15
		self.height = f1_local19
		local self = LUI.UIImage.new( self )
		f1_arg0[f1_arg1.id .. "_statImage"] = self
		f1_arg0:addElement( self )
	end
	local f1_local17 = tostring( f1_arg1.value )
	local f1_local19 = CoD.CreateState( f1_local14 + f1_local15 + 0, f1_arg2, nil, nil, CoD.AnchorTypes.TopLeft )
	f1_local19.font = f0_local2.Font
	f1_local19.color = f1_arg1.disabledColor or f0_local11
	if f1_arg1.overrideStatColor then
		f1_local19.color = f1_arg1.overrideStatColor
	end
	f1_local19.width = f1_local4
	f1_local19.height = f0_local2.Height
	f1_local19.alpha = f1_local10
	local self = LUI.UIText.new( f1_local19 )
	self.id = f1_arg1.id .. "_statVal"
	self.xpBreakdownContainer = f1_arg0
	self:setText( f1_local17 )
	self:registerAnimationState( "enabled", {
		alpha = f1_local11,
		color = f1_arg1.overrideStatColor or f0_local11
	} )
	self:registerAnimationState( "disabled", {
		alpha = f1_local10,
		color = f1_arg1.disabledColor
	} )
	self:registerEventHandler( "stopAnimateStatVal", OnStopAnimateStatVal )
	self:registerEventHandler( "animateStatVal", OnAnimateStatVal )
	self:addElement( self )
	local f1_local22 = CoD.CreateState( f1_arg3, f1_arg2 + f0_local2.Height + -6, nil, nil, CoD.AnchorTypes.TopLeft )
	f1_local22.font = f0_local1.Font
	f1_local22.color = f1_arg1.disabledColor or f0_local10
	f1_local22.width = f1_local9
	f1_local22.height = f0_local1.Height
	f1_local22.alpha = f1_local10
	local self = LUI.UIText.new( f1_local22 )
	self.id = f1_arg1.id .. "_statName"
	self:registerAnimationState( "enabled", {
		alpha = 1,
		color = f0_local10
	} )
	self:registerAnimationState( "disabled", {
		alpha = f1_local10,
		color = f1_arg1.disabledColor
	} )
	self:setText( Engine.ToUpperCase( Engine.Localize( f1_arg1.name ) ) )
	self:addElement( self )
	if f1_local9 < f1_local4 then
		local f1_local24 = f1_local4
	end
	return f1_local24 or f1_local9
end

function AddDivider( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7, f2_arg8 )
	local f2_local0 = CoD.CreateState( f2_arg1, f2_arg2, nil, nil, f2_arg7 or CoD.AnchorTypes.TopLeft )
	f2_local0.material = RegisterMaterial( "white" )
	f2_local0.color = f2_arg5 or Colors.h1.light_grey
	f2_local0.alpha = f2_arg6 or 1
	f2_local0.width = f2_arg3
	f2_local0.height = f2_arg4
	local self = LUI.UIImage.new( f2_local0 )
	self.id = f2_arg8
	self.defState = f2_local0
	f2_arg0:addElement( self )
	return f2_arg3, self
end

function AddContainerHeader( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0, f3_local1, f3_local2, f3_local3 = GetTextDimensions( Engine.ToUpperCase( f3_arg1 ), f0_local0.Font, f0_local0.Height )
	local f3_local4 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f3_local4.font = f0_local0.Font
	f3_local4.color = f0_local9
	f3_local4.width = f3_local2 - f3_local0
	f3_local4.height = f0_local0.Height
	local self = LUI.UIText.new( f3_local4 )
	self:setText( f3_arg1 )
	f3_arg0:addElement( self )
	local f3_local6 = Engine.GetDvarInt( "scr_xpscale" )
	local f3_local7 = Engine.GetDvarInt( "scr_xpscalewithparty" )
	local f3_local8 = Engine.GetDvarInt( "scr_depotcreditscale" )
	if f3_arg3 == true then
		local f3_local9 = CoD.CreateState( f3_local2 + 10, -15, nil, nil, CoD.AnchorTypes.TopLeft )
		local f3_local10 = CoD.CreateState( f3_local2 + 60, -17, nil, nil, CoD.AnchorTypes.TopLeft )
		if f3_local6 == 2 then
			f3_local9.material = RegisterMaterial( "ui_reward_small_double_xp" )
		elseif f3_local6 == 4 then
			f3_local9.material = RegisterMaterial( "ui_reward_small_quad_xp" )
		elseif f3_local7 == 2 and Lobby.IsInPrivateParty() and not Lobby.IsAloneInPrivateParty() then
			f3_local9.material = RegisterMaterial( "ui_reward_small_double_party_xp" )
		elseif f3_local8 == 2 then
			f3_local9.material = RegisterMaterial( "depot_currency_credit_2x" )
		else
			f3_local9.alpha = 0
		end
		f3_local9.width = 50
		f3_local9.height = 50
		f3_arg0:addElement( LUI.UIImage.new( f3_local9 ) )
		if f3_local8 == 2 and (f3_local6 > 1 or f3_local7 > 1 and Lobby.IsInPrivateParty() and not Lobby.IsAloneInPrivateParty()) then
			f3_local10.material = RegisterMaterial( "depot_currency_credit_2x" )
			f3_local10.width = 50
			f3_local10.height = 50
			f3_arg0:addElement( LUI.UIImage.new( f3_local10 ) )
		end
	end
	AddDivider( self, f0_local53 + (f3_arg2 or 0), f3_local1 - f3_local0 + f0_local29, f0_local54, f0_local33, f0_local13 )
end

function AddUnlockedItems( f4_arg0, f4_arg1 )
	local f4_local0 = f0_local49 + -40
	local f4_local1 = 105
	local f4_local2 = 366
	local f4_local3 = CoD.CreateState( f4_arg1, f4_local0, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local3.width = f4_local2
	f4_local3.height = f4_local1
	f4_local3.alpha = 0
	local self = LUI.UIElement.new( f4_local3 )
	self.id = "rootUnlockedItemsContainer"
	f4_arg0:addElement( self )
	local f4_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local5.alpha = 0
	local self = LUI.UIElement.new( f4_local5 )
	self.id = "unlockedItemsContainer"
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:addElement( self )
	local f4_local7 = f4_local2
	local f4_local8 = CoD.CreateState( nil, nil, f4_local7, nil, CoD.AnchorTypes.TopBottomLeft )
	f4_local8.material = RegisterMaterial( "h1_ui_xp_gradient" )
	local self = LUI.UIImage.new( f4_local8 )
	self.id = "imageBg"
	self:addElement( self )
	local f4_local10 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local10.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f4_local10 )
	self:setupTiles( f0_local36 )
	self:addElement( self )
	local f4_local12 = CoD.CreateState( nil, -(f4_local1 / 2) - 1, nil, nil, CoD.AnchorTypes.None )
	f4_local12.width = f4_local2
	f4_local12.height = f4_local1 + 1
	local f4_local13 = LUI.DecoFrame.new( f4_local12, LUI.DecoFrame.Green )
	f4_local13:setPriority( f0_local35 )
	self:addElement( f4_local13 )
	local f4_local14 = 50
	local f4_local15 = 50
	local f4_local16 = CoD.CreateState( f4_local7 / 2 - f4_local14 / 2, f4_local1 / 2 - f4_local15 / 2, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local16.width = f4_local14
	f4_local16.height = f4_local15
	f4_local16.material = RegisterMaterial( "h1_deco_cross" )
	local self = LUI.UIImage.new( f4_local16 )
	self.id = "itemImage"
	self:addElement( self )
	local f4_local18 = "Uak-45"
	local f4_local19 = CoD.TextSettings.BodyFontTiny
	local f4_local20, f4_local21, f4_local22, f4_local23 = GetTextDimensions( f4_local18, f4_local19.Font, f4_local19.Height )
	local f4_local24 = f4_local22 - f4_local20
	local f4_local25 = CoD.CreateState( 7, nil, nil, -6, CoD.AnchorTypes.BottomLeft )
	f4_local25.width = 130
	f4_local25.height = f4_local19.Height + 8
	f4_local25.material = RegisterMaterial( "white" )
	f4_local25.color = Colors.black
	local self = LUI.UIImage.new( f4_local25 )
	self.id = "itemTextBg"
	self:addElement( self )
	local f4_local27 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f4_local27.material = RegisterMaterial( "h1_deco_container_bg_loading" )
	f4_local27.width = f4_local25.width
	f4_local27.height = f4_local25.height
	self:addElement( LUI.UIImage.new( f4_local27 ) )
	local f4_local28 = CoD.CreateState( -(f4_local25.width / 2) - 1, nil, nil, nil, CoD.AnchorTypes.None )
	f4_local28.width = f4_local25.width + 1
	f4_local28.height = f4_local25.height
	local f4_local29 = LUI.DecoFrame.new( f4_local28, LUI.DecoFrame.Green )
	f4_local29:setPriority( f0_local35 )
	self:addElement( f4_local29 )
	local f4_local30 = CoD.CreateState( nil, f0_local56, nil, nil, CoD.AnchorTypes.Top )
	f4_local30.font = f4_local19.Font
	f4_local30.color = f0_local15
	f4_local30.width = f4_local24
	f4_local30.height = f4_local19.Height
	local self = LUI.UIText.new( f4_local30 )
	self.id = "itemText"
	self:setText( f4_local18 )
	self:addElement( self )
	local f4_local32 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local32.alpha = 1
	local self = LUI.UIElement.new( f4_local32 )
	self.id = "noUnlockedItemsContainer"
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "enabled", {
		alpha = 0.3
	} )
	self:addElement( self )
	local f4_local34 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_UNLOCKED_ITEMS" ) )
	local f4_local35, f4_local36, f4_local37, f4_local38 = GetTextDimensions( f4_local34, f0_local5.Font, f0_local5.Height )
	local f4_local39 = CoD.CreateState( nil, nil, f4_local2, nil, CoD.AnchorTypes.TopBottomLeft )
	f4_local39.material = RegisterMaterial( "white" )
	f4_local39.color = Colors.black
	f4_local39.alpha = 0.15
	self:addElement( LUI.UIImage.new( f4_local39 ) )
	local f4_local40 = CoD.CreateState( nil, -f0_local5.Height * 4.5 / 2 + f0_local56 / 2, nil, nil, CoD.AnchorTypes.None )
	f4_local40.width = (f4_local37 - f4_local35) * 2
	f4_local40.height = f0_local5.Height * 4.5
	f4_local40.material = RegisterMaterial( "h1_ui_unlocked_item_text_bg" )
	f4_local40.alpha = 0.15
	self:addElement( LUI.UIImage.new( f4_local40 ) )
	local f4_local41 = CoD.CreateState( nil, -f0_local5.Height / 2 + f0_local56 / 2, nil, nil, CoD.AnchorTypes.None )
	f4_local41.font = f0_local5.Font
	f4_local41.color = f0_local16
	f4_local41.width = f4_local37 - f4_local35
	f4_local41.height = f0_local5.Height
	f4_local41.alpha = 0.25
	local self = LUI.UIText.new( f4_local41 )
	self:setText( f4_local34 )
	self:addElement( self )
	return f4_local2 + f4_arg1
end

function AddRankContainer( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	local f5_local0 = 90
	local f5_local1 = CoD.CreateState( f5_arg1, f5_arg2, nil, nil, CoD.AnchorTypes.TopLeft )
	f5_local1.material = RegisterMaterial( "h1_ui_xp_gradient" )
	f5_local1.width = f5_local0
	f5_local1.height = f0_local32
	local self = LUI.UIImage.new( f5_local1 )
	self.id = "rankContainer" .. f5_arg4
	f5_arg0:addElement( self )
	local f5_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f5_local3.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f5_local3 )
	self:setupTiles( f0_local36 )
	self:addElement( self )
	local f5_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f5_local5.width = f5_local0
	f5_local5.height = f0_local32
	local f5_local6 = LUI.DecoFrame.new( f5_local5, LUI.DecoFrame.Green )
	f5_local6:setPriority( f0_local35 )
	self:addElement( f5_local6 )
	local f5_local7 = 32
	local f5_local8 = 7
	local f5_local9 = CoD.CreateState( nil, -f5_local7 / 2 - f5_local8, nil, nil, CoD.AnchorTypes.None )
	local f5_local10 = AAR.GetPrestigeLevel( f0_local59 )
	f5_local9.width = 34
	f5_local9.height = f5_local7
	f5_local9.material = RegisterMaterial( "white" )
	local self = LUI.UIImage.new( f5_local9 )
	self.id = "rankIcon" .. f5_arg4
	self.defState = f5_local9
	local f5_local12 = Rank.GetMaxRank( f5_local10 )
	local f5_local13
	if f5_arg3 == f5_local12 and Rank.GetRankMinXP( f5_local12 ) <= AAR.GetCareerExperience( f0_local59 ) - AAR.GetRoundTotalXP( f0_local59 ) and f5_local10 == Rank.GetMaxPrestigeLevel() then
		f5_local13 = 1
		if not f5_local13 then
		
		else
			self:setImage( RegisterMaterial( Rank.GetRankIcon( f5_arg3, f5_local10, f5_local13 ) ) )
			self:registerAnimationState( "init", f5_local9 )
			self:addElement( self )
			local f5_local14 = 15
			local f5_local15 = CoD.CreateState( nil, -f5_local14 / 2 - f5_local8, nil, nil, CoD.AnchorTypes.None )
			local f5_local16 = AAR.GetPrestigeLevel( f0_local59 )
			f5_local15.width = f5_local14
			f5_local15.height = f5_local14
			f5_local15.material = RegisterMaterial( "icon_lock_mini" )
			f5_local15.alpha = 0
			local self = LUI.UIImage.new( f5_local15 )
			self.defState = f5_local15
			self:registerAnimationState( "init", f5_local15 )
			self:registerAnimationState( "enabled", {
				alpha = 1
			} )
			self:registerAnimationState( "disabled", {
				alpha = 0
			} )
			self.lockedIcon = self
			self:addElement( self )
			local f5_local18 = Engine.Localize( "@LUA_MENU_LEVEL_CAPS" )
			local f5_local19, f5_local20, f5_local21, f5_local22 = GetTextDimensions( f5_local18, f0_local3.Font, f0_local3.Height )
			local f5_local23 = f5_local21 - f5_local19
			local f5_local24 = Rank.GetRankDisplay( f5_arg3 )
			local f5_local25, f5_local26, f5_local27, f5_local28 = GetTextDimensions( f5_local24, f0_local3.Font, f0_local3.Height )
			f5_local22 = f5_local28
			f5_local21 = f5_local27
			f5_local20 = f5_local26
			f5_local25 = f5_local21 - f5_local25
			f5_local26 = 2
			f5_local27 = 17.5
			local f5_local29 = -f5_local23 / 2 - 1
			local f5_local30 = CoD.CreateState( f5_local29 - f5_local25 / 2, -f0_local3.Height / 2 + f5_local26 + f5_local27, nil, nil, CoD.AnchorTypes.None )
			f5_local30.font = f0_local3.Font
			f5_local30.color = f0_local10
			f5_local30.width = f5_local23
			f5_local30.height = f0_local3.Height
			local self = LUI.UIText.new( f5_local30 )
			self.id = "rankText" .. f5_arg4
			self.defState = f5_local30
			self.leftOffset = f5_local29
			self.width = f5_local23
			self.parentWidth = f5_local0
			self:setText( f5_local18 )
			self:registerAnimationState( "init", f5_local30 )
			self:addElement( self )
			f5_local29 = f5_local23 / 2 + 2
			local f5_local32 = CoD.CreateState( f5_local29 - f5_local25 / 2, -f0_local3.Height / 2 + f5_local26 + f5_local27, nil, nil, CoD.AnchorTypes.None )
			f5_local32.font = f0_local3.Font
			f5_local32.color = Colors.mp.aar_score_gold
			f5_local32.width = f5_local25
			f5_local32.height = f0_local3.Height
			local self = LUI.UIText.new( f5_local32 )
			self.id = "rankNum" .. f5_arg4
			self.leftOffset = f5_local29
			self:setText( f5_local24 )
			self:registerAnimationState( "init", f5_local32 )
			self:addElement( self )
			local f5_local34 = AAR.GetPrestigeLevel( f0_local59 )
			local f5_local35 = Lobby.GetRankForXP( f0_local63, f5_local34 )
			local f5_local36 = Rank.GetMaxRank( f5_local34 )
			local f5_local37 = Rank.GetRankMaxXP( f5_local36 )
			local f5_local38 = AAR.GetCareerExperience( f0_local59 ) - AAR.GetRoundTotalXP( f0_local59 )
			if f5_arg4 == "Right" and f5_local35 == f5_local36 and f5_local34 ~= Rank.GetMaxPrestigeLevel() then
				self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PRESTIGE" ) ) .. " " .. f5_local34 + 1 )
				self:setAlpha( 0.25 )
				self.defState.left = nil
				self.defState.width = self.parentWidth
				self.defState.alignment = LUI.Alignment.Center
				self:registerAnimationState( "centered", self.defState )
				self:animateToState( "centered" )
				self:setAlpha( 0 )
				local f5_local39 = nil
				if f5_local35 == f5_local36 and f5_local34 == Rank.GetMaxPrestigeLevel() then
					f5_local39 = true
				end
				local f5_local40 = RegisterMaterial( Rank.GetRankIcon( f5_local35, f5_local34 + 1, f0_local38 ) )
				self:setAlpha( 0.25 )
				self.lockedIcon:animateToState( "enabled" )
				self:setImage( f5_local40 )
				if f5_local37 <= f5_local38 or f0_local70 then
					self:setAlpha( 1 )
					self:setAlpha( 1 )
					self.lockedIcon:animateToState( "disabled" )
				end
			end
			if f0_local63 == Rank.GetRankMaxXP( f5_local36 ) then
				rankTextRight:setAlpha( 1 )
				self:setAlpha( 1 )
				self.lockedIcon:animateToState( "disabled" )
				rankUpIcon:setImage( nextPrestigeIcon )
				medRankUpIcon:setImage( nextPrestigeIcon )
				rankUpIconBg:setImage( nextPrestigeIcon )
			end
			return f5_local0
		end
	end
	f5_local13 = 0
end

function AddXpBar( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = CoD.CreateState( f6_arg1, f6_arg2, nil, nil, CoD.AnchorTypes.TopLeft )
	f6_local0.material = RegisterMaterial( "h1_ui_xp_gradient" )
	f6_local0.width = f6_arg3
	f6_local0.height = f0_local32
	local self = LUI.UIImage.new( f6_local0 )
	self.id = "xpBar"
	f6_arg0:addElement( self )
	local f6_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f6_local2.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f6_local2 )
	self:setupTiles( f0_local36 )
	self:addElement( self )
	local f6_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f6_local4.width = f6_arg3
	f6_local4.height = f0_local32
	local f6_local5 = LUI.DecoFrame.new( f6_local4, LUI.DecoFrame.Green )
	f6_local5:setPriority( f0_local35 )
	self:addElement( f6_local5 )
	local f6_local6 = 45
	local f6_local7 = f6_arg3 - 10
	local f6_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f6_local8.material = RegisterMaterial( "h1_ui_progressbar_inactivebar" )
	f6_local8.width = f6_local7
	f6_local8.height = f6_local6
	local self = LUI.UIImage.new( f6_local8 )
	self:setup9SliceImage( 20, 20, 0.5, 0.5 )
	self.id = "xpBarEmpty"
	self.defState = f6_local8
	self:addElement( self )
	f6_local6 = 62
	local f6_local10 = 15
	local f6_local11 = Lobby.GetRankForXP( f0_local63, AAR.GetPrestigeLevel( f0_local59 ) )
	local f6_local12 = Rank.GetRankMinXP( f6_local11 )
	local f6_local13 = Rank.GetRankXPToNext( f6_local11 )
	local f6_local14 = CoD.CreateState( -f6_local10 / 2, nil, nil, nil, CoD.AnchorTypes.Left )
	local f6_local15 = f0_local63 - f6_local12
	f6_local14.material = RegisterMaterial( "h1_ui_progressbar_activebar" )
	local f6_local16 = f6_local15 / f6_local13
	local self = f6_local7 + f6_local10
	local f6_local18
	if f6_local16 <= f0_local37 and f6_local16 > 0 then
		f6_local18 = f0_local37
		if not f6_local18 then
		
		else
			f6_local14.width = self * f6_local18
			f6_local14.fullWidth = f6_local7 + f6_local10
			f6_local14.height = f6_local6 - 2
			self = LUI.UIImage.new( f6_local14 )
			self:setup9SliceImage()
			self.id = "xpBarFill"
			self.defState = f6_local14
			self:addElement( self )
			f6_local18 = 3
			local f6_local19 = CoD.TextSettings.Font14
			local f6_local20 = 12
			local f6_local21 = CoD.CreateState( nil, nil, -f6_local20, f6_local18, CoD.AnchorTypes.BottomRight )
			f6_local21.width = f6_local7 - f6_local20 * 2
			f6_local21.height = f6_local19.Height
			local self = LUI.UIElement.new( f6_local21 )
			self:addElement( self )
			local f6_local23, f6_local24, f6_local25, f6_local26 = GetTextDimensions2( f6_local13 .. " / " .. f6_local13, f6_local19.Font, f6_local19.Height )
			local f6_local27 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
			f6_local27.font = f6_local19.Font
			f6_local27.color = Colors.h1.light_grey
			f6_local27.width = f6_local25 - f6_local23
			f6_local27.height = f6_local19.Height
			local pTrackingText = LUI.UIText.new( f6_local27 )
			local self = pTrackingText
			local f6_local30 = pTrackingText.setText
			local f6_local31 = Engine.Localize
			local f6_local32 = "@MPUI_X_SLASH_Y_WIDE"
			if f0_local70 then
				local f6_local33 = f6_local13
			end
			f6_local30( self, f6_local31( f6_local32, f6_local33 or f6_local15, f6_local13 ) )
			self:addElement( pTrackingText )
			f6_arg0.pTrackingText = pTrackingText
			
			f6_local30 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
			f6_local30.material = RegisterMaterial( "h1_ui_progressbar_activebar_endflare" )
			self = LUI.UIImage.new( f6_local30 )
			self.id = "xpBarFlare"
			return f6_arg3
		end
	end
	f6_local18 = f6_local16
end

function AddXpBarAssets( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = f7_arg1 + f0_local48
	local f7_local1 = 4
	local f7_local2 = 0
	local f7_local3 = AAR.GetPrestigeLevel( f0_local59 )
	local f7_local4 = AAR.GetRankForXP( f0_local63, f7_local3 )
	local f7_local5 = AAR.GetRankForXP( Rank.GetRankMinXP( f7_local4 ) + Rank.GetRankXPToNext( f7_local4 ), f7_local3 )
	if f7_local5 == Rank.GetMaxRank( f7_local3 ) and f7_local3 == Rank.GetMaxPrestigeLevel() then
		f7_local4 = f7_local5 - 1
	end
	local f7_local6 = AddRankContainer( f7_arg0, f7_local2, f7_local0, f7_local4, "Left" ) + f7_local1
	f7_local2 = f7_local2 + f7_local6
	AddRankContainer( f7_arg0, f7_local2 + AddXpBar( f7_arg0, f7_local2, f7_local0, f7_arg2 - f7_local6 * 2 ) + f7_local1, f7_local0, f7_local5, "Right" )
end

function AddSupplyDropContainer( f8_arg0, f8_arg1 )
	local f8_local0 = RegisterMaterial( "h1_dlc_supplydropearned_banner" )
	local f8_local1 = Engine.GetMaterialAspectRatio( f8_local0 )
	local f8_local2 = 500
	local f8_local3 = f8_local2 / f8_local1
	local f8_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopRight )
	f8_local4.width = f8_local2
	f8_local4.alpha = 0
	f8_local4.height = f8_local3
	local self = LUI.UIElement.new( f8_local4 )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f8_arg0.supplyDropContainer = self
	f8_arg0:addElement( self )
	local f8_local6 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f8_local6.material = f8_local0
	self:addElement( LUI.UIImage.new( f8_local6 ) )
	local f8_local7 = 89
	local f8_local8 = CoD.CreateState( left, top, nil, nil, CoD.AnchorTypes.Right )
	f8_local8.width = f8_local7
	f8_local8.height = f8_local3
	local self = LUI.UIElement.new( f8_local8 )
	self:addElement( self )
	local f8_local10 = CoD.TextSettings.Font86
	local f8_local11, f8_local12, f8_local13, f8_local14 = GetTextDimensions( 1, f8_local10.Font, f8_local10.Height )
	local f8_local15 = CoD.CreateState( nil, -f8_local10.Height / 2 + 8, nil, nil, CoD.AnchorTypes.None )
	f8_local15.font = f8_local10.Font
	f8_local15.width = f8_local13 - f8_local11
	f8_local15.height = f8_local10.Height
	f8_local15.scale = 0.15
	f8_local15.color = Colors.h1.light_grey
	local self = LUI.UIText.new( f8_local15 )
	self:setText( f8_arg1.numReceivedSupplyDrops )
	self:addElement( self )
	local f8_local17 = CoD.TextSettings.Font37
	local f8_local18 = Engine.ToUpperCase( Engine.Localize( "LUA_MENU_SUPPLY_DROP" ) )
	local f8_local19 = 140
	local f8_local20 = 57
	local f8_local21, f8_local22, f8_local23, f8_local24 = GetTextDimensions( f8_local18, f8_local17.Font, f8_local17.Height )
	local f8_local25 = 7
	local f8_local26 = CoD.CreateState( f8_local19, f8_local20, nil, nil, CoD.AnchorTypes.TopLeft )
	f8_local26.font = f8_local17.Font
	f8_local26.width = f8_local23 - f8_local21
	f8_local26.height = f8_local17.Height
	f8_local26.color = Colors.h1.light_grey
	local self = LUI.UIText.new( f8_local26 )
	self:setText( f8_local18 )
	self:addElement( self )
	local f8_local28 = CoD.TextSettings.Font21
	local f8_local29 = Engine.ToUpperCase( Engine.Localize( "LUA_MENU_RECEIVED" ) )
	f8_local20 = f8_local20 + f8_local17.Height - 2
	local f8_local30, f8_local31, f8_local32, f8_local33 = GetTextDimensions( f8_local29, f8_local28.Font, f8_local28.Height )
	local f8_local34 = 7
	local f8_local35 = CoD.CreateState( f8_local19, f8_local20, nil, nil, CoD.AnchorTypes.TopLeft )
	f8_local35.font = f8_local28.Font
	f8_local35.alpha = 0.5
	f8_local35.width = f8_local32 - f8_local30
	f8_local35.height = f8_local28.Height
	f8_local35.color = Colors.h1.light_grey
	local self = LUI.UIText.new( f8_local35 )
	self:setText( f8_local29 )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ), LUI.DecoFrame.Grey ) )
end

function AddXPBreakdownContainer( f9_arg0 )
	local f9_local0 = 10
	local f9_local1 = 100
	local f9_local2 = CoD.CreateState( f0_local52, f0_local50, nil, nil, CoD.AnchorTypes.TopLeft )
	local self = LUI.UIElement.new( f9_local2 )
	self.defState = f9_local2
	self.id = "xpBreakdownContainer"
	self.statXpTotal = 0
	local self = LUI.UIElement.new()
	self.id = "nonLoopingTimer"
	self:addElement( self )
	self:registerEventHandler( "RankUp", OnRankUp )
	self:registerEventHandler( "ContinueAddingXpToXpBar", AnimateXpBar )
	self:registerEventHandler( "ResetXpBar", OnResetXpBar )
	self:registerEventHandler( "MoveToNextXpStat", OnMoveToNextXpStat )
	self:registerEventHandler( "DisableAnimatingXpBarAsset", OnDisableAnimatingXpBarAsset )
	self:registerEventHandler( "CloseRankUp", OnCloseRankUp )
	local f9_local5 = {
		{
			name = "@LUA_MENU_AAR_MATCH_XP",
			value = f0_local65,
			id = "matchXp",
			disabledAlpha = 1,
			disabledColor = Colors.white
		},
		{
			name = "@MPUI_MATCHBONUS",
			value = f0_local66,
			id = "matchBonus",
			disabledAlpha = f0_local31,
			disabledColor = Colors.h1.light_grey
		},
		{
			name = "@LUA_MENU_CHALLENGE_BONUS",
			value = f0_local67,
			id = "challengeBonus",
			disabledAlpha = f0_local31,
			disabledColor = Colors.h1.light_grey
		},
		{
			name = "@LUA_MENU_CLAN_WARS_BONUS",
			value = 0,
			id = "clanWarsBonus",
			disabledAlpha = 0,
			disabledColor = Colors.h1.light_grey,
			enabledAlpha = 0
		}
	}
	AddContainerHeader( self, Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_XP_BREAKDOWN" ) ), -1, true )
	local f9_local6 = 0
	local f9_local7 = {}
	local f9_local8 = 0
	local f9_local9, f9_local10, f9_local11 = nil
	local f9_local12 = AAR.GetRoundMiscXP( f0_local59 )
	local f9_local13 = AAR.GetRoundScoreXP( f0_local59 )
	if f9_local13 and f9_local12 then
		f0_local65 = f9_local13 + f9_local12
		local f9_local14, f9_local15, f9_local16, f9_local17 = GetTextDimensions( f0_local65, f0_local2.Font, f0_local2.Height )
		f9_local11 = f9_local17
		f9_local10 = f9_local16
		f9_local9 = f9_local15
		f9_local7[1] = f9_local10 - f9_local14
	end
	f0_local66 = AAR.GetRoundMatchXP( f0_local59 )
	local f9_local14, f9_local15, f9_local16, f9_local17 = GetTextDimensions( f0_local66, f0_local2.Font, f0_local2.Height )
	f9_local11 = f9_local17
	f9_local10 = f9_local16
	f9_local9 = f9_local15
	f9_local7[2] = f9_local10 - f9_local14
	f0_local67 = AAR.GetRoundChallengeXP( f0_local59 )
	f9_local14, f9_local15, f9_local16, f9_local17 = GetTextDimensions( f0_local67, f0_local2.Font, f0_local2.Height )
	f9_local11 = f9_local17
	f9_local10 = f9_local16
	f9_local9 = f9_local15
	f9_local7[3] = f9_local10 - f9_local14
	for f9_local14 = 1, #f9_local5, 1 do
		f9_local6 = f9_local6 + AddAARStat( self, f9_local5[f9_local14], f0_local49, f9_local6, f9_local7[f9_local14] ) + f0_local27
	end
	f9_local14 = 0
	if f9_local14 > 0 then
		AddSupplyDropContainer( self, {
			numReceivedSupplyDrops = f9_local14
		} )
	end
	f9_local15 = AddUnlockedItems( self, CoD.DesignGridHelper( 17, 0.4 ) )
	f0_local68 = f9_local15
	AddXpBarAssets( self, f9_local1 + f9_local0, f9_local15 )
	f9_local16 = f9_local1 + f9_local0 + f0_local48 + f0_local32 + f0_local30
	AddDivider( self, nil, f9_local16, f0_local55, f0_local33, f0_local13 )
	self.defState.width = f9_local15
	self.defState.height = f9_local16 + f0_local33
	self:registerAnimationState( "default", self.defState )
	self:animateToState( "default" )
	f9_arg0.xpBreakdownContainer = self
	f9_arg0:addElement( self )
	AddRankUp( self, f9_local15 )
	AddBonusLootAnimationAssets( self )
	return self
end

function AddMatchBreakdownContainer( f10_arg0 )
	local f10_local0 = -7
	local f10_local1 = -40
	local f10_local2 = f0_local1.Height + f0_local2.Height + 4
	local f10_local3 = f0_local52
	local f10_local4 = f0_local51
	local f10_local5 = CoD.CreateState( f10_local3, f10_local4 + f10_local1, nil, nil, CoD.AnchorTypes.All )
	f10_local5.alpha = 0
	local self = LUI.UIElement.new( f10_local5 )
	self.id = "matchBreakdownContainer"
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "slideDown", {
		alpha = 1,
		top = f10_local4
	} )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	local f10_local7 = 3
	local f10_local8 = AAR.GetPlayerStat( f0_local60, "score" )
	local f10_local9 = AAR.GetRoundStat( f0_local59, "killStreak" )
	local f10_local10 = AAR.GetPlayerStat( f0_local60, "assists" )
	local f10_local11 = AAR.GetPlayerStat( f0_local60, "headshots" )
	local f10_local12 = AAR.GetPlayerStat( f0_local60, "kills" )
	local f10_local13 = AAR.GetPlayerStat( f0_local60, "deaths" )
	local f10_local14 = AAR.GetPlayerStat( f0_local60, "extrascore0" )
	local f10_local15 = Lobby.GetCurrencyEarnedLastGame( f0_local59, InventoryCurrencyType.Credits ) * CoD.currencyCreditConversionRate
	local f10_local16 = GetCurrencyBalance( InventoryCurrencyType.Credits, f0_local59 ) - f10_local15
	local f10_local17 = math.floor( f10_local15 + f10_local16 - math.floor( f10_local16 ) )
	local f10_local18 = f10_local12
	if f10_local12 and f10_local13 and f10_local13 ~= 0 then
		f10_local18 = string.format( "%.2f", tostring( f10_local12 / f10_local13 ) )
	end
	local f10_local19 = LUI.ScoreboardStats.CustomStats[AAR.GetGameMode( f0_local59 )]
	if f10_local19 and f10_local19.statValsIdx[LUI.ScoreboardStats.SCORE] ~= LUI.ScoreboardStats.SCORE then
		f10_local8 = f10_local14
	end
	local f10_local20 = {
		{
			name = "@LUA_MENU_SCORE",
			value = f10_local8,
			id = "score"
		},
		{
			name = "@LUA_MENU_SCORESTREAK_CAPS",
			value = f10_local9,
			id = "scoreStreak"
		},
		{
			name = "@LUA_MENU_ASSISTS_CAPS",
			value = f10_local10,
			id = "assists"
		},
		{
			name = "@LUA_MENU_WEAPPERF_HEADSHOTS",
			value = f10_local11,
			id = "headshots"
		},
		{
			name = "@LUA_MENU_KILLS",
			value = f10_local12,
			id = "kills"
		},
		{
			name = "@LUA_MENU_DEATHS",
			value = f10_local13,
			id = "deaths"
		},
		{
			name = "@LUA_MENU_KD_RATIO",
			value = f10_local18,
			id = "kdRatio"
		},
		{
			name = "@LUA_MENU_DEPOT_CREDITS_EARNED",
			value = f10_local17 or 0,
			overrideStatColor = Colors.white,
			id = "depotCreditsEarned",
			imageKey = "h1_depot_currency_icon_credit"
		}
	}
	AddContainerHeader( self, Engine.Localize( "@LUA_MENU_MATCH_BREAKDOWN" ) )
	local f10_local21 = 0
	for f10_local22 = 1, f10_local7, 1 do
		local f10_local25 = f10_local21 + AddAARStat( self, f10_local20[f10_local22], f0_local49, f10_local21 )
		local f10_local26
		if f10_local22 ~= f10_local7 then
			f10_local26 = f0_local27
			if not f10_local26 then
			
			else
				f10_local21 = f10_local25 + f10_local26
			end
		end
		f10_local26 = f0_local26
	end
	f10_local21 = f10_local21 + AddDivider( self, f10_local21, f0_local49 + f10_local0, f0_local33, f10_local2, f0_local12 ) + f0_local26
	local f10_local22 = #f10_local20 - 1
	for f10_local23 = f10_local7 + 1, f10_local22, 1 do
		local f10_local26 = f10_local21 + AddAARStat( self, f10_local20[f10_local23], f0_local49, f10_local21 )
		local f10_local28
		if f10_local23 ~= f10_local22 then
			f10_local28 = f0_local27
			if not f10_local28 then
			
			else
				f10_local21 = f10_local26 + f10_local28
			end
		end
		f10_local28 = f0_local26
	end
	AddAARStat( self, f10_local20[#f10_local20], f0_local49, f10_local21 + AddDivider( self, f10_local21 - 1, f0_local49 + f10_local0, f0_local33, f10_local2, f0_local12 ) + f0_local26 )
	f10_arg0:addElement( self )
	return self
end

function AddXAsset( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	local f11_local0 = CoD.CreateState( f11_arg1, f11_arg2, nil, nil, CoD.AnchorTypes.None )
	f11_local0.width = f11_arg3
	f11_local0.height = f11_arg4
	f11_local0.alpha = 0.45
	f11_local0.material = RegisterMaterial( "h1_ui_rankup_x" )
	f11_arg0:addElement( LUI.UIImage.new( f11_local0 ) )
end

AAR.AddImage = function ( f12_arg0, f12_arg1 )
	local f12_local0 = RegisterMaterial( f12_arg1.matKey )
	local f12_local1 = Engine.GetMaterialAspectRatio( f12_local0 )
	local f12_local2 = f12_arg1.height
	local f12_local3
	if f12_local2 and not f12_arg1.width then
		f12_local3 = f12_local2 * f12_local1
		if not f12_local3 then
		
		else
			local f12_local4 = CoD.CreateState( f12_arg1.left, f12_arg1.top, nil, nil, f12_arg1.anchorType )
			f12_local4.alpha = f12_arg1.alpha
			f12_local4.width = f12_local3
			f12_local4.height = f12_local2
			f12_local4.color = f12_arg1.color
			f12_local4.scale = f12_arg1.scale or 0
			f12_local4.material = f12_local0
			local self = LUI.UIImage.new( f12_local4 )
			self.id = f12_arg1.id
			self.width = f12_local3
			f12_arg0:addElement( self )
			if f12_arg1.id then
				f12_arg0[f12_arg1.id] = self
			end
			return self
		end
	end
	f12_local3 = f12_arg1.width
end

AAR.AddText = function ( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg1.textKey and Engine.Localize( f13_arg1.textKey ) or f13_arg1.text
	if f13_arg1.shouldUppercase then
		f13_local0 = Engine.ToUpperCase( f13_local0 )
	end
	local f13_local1, f13_local2, f13_local3, f13_local4 = GetTextDimensions2( f13_local0, f13_arg1.font.Font, f13_arg1.font.Height )
	local f13_local5 = CoD.CreateState( f13_arg1.left, f13_arg1.top, nil, nil, f13_arg1.anchorType )
	f13_local5.font = f13_arg1.font.Font
	f13_local5.width = f13_arg1.width or f13_local3 - f13_local1
	f13_local5.alignment = f13_arg1.alignment
	f13_local5.alpha = f13_arg1.alpha
	f13_local5.scale = f13_arg1.scale
	f13_local5.height = f13_arg1.font.Height
	f13_local5.color = f13_arg1.color
	local self = LUI.UIText.new( f13_local5 )
	self.id = f13_arg1.id
	self:setText( f13_local0 )
	f13_arg0:addElement( self )
	if f13_arg1.id then
		f13_arg0[f13_arg1.id] = self
	end
	return self
end

AAR.AddGlitchAssets = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg1.containerHeight / 2
	local f14_local1 = CoD.CreateState( nil, f14_local0 - 45, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local1.height = 88
	f14_local1.width = 120
	f14_local1.alpha = 0
	f14_local1.material = RegisterMaterial( "h1_rankup_motion_textglitch1" )
	local self = LUI.UIImage.new( f14_local1 )
	self.defState = f14_local1
	self.id = "textGlitch1"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f14_arg0.glitch1 = self
	f14_arg0:addElement( self )
	local f14_local3 = CoD.CreateState( nil, f14_local0 + 40, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local3.height = 21
	f14_local3.width = 247
	f14_local3.alpha = 0
	f14_local3.material = RegisterMaterial( "h1_rankup_motion_textglitch2" )
	local self = LUI.UIImage.new( f14_local3 )
	self.defState = f14_local3
	self.id = "textGlitch2"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f14_arg0.glitch2 = self
	f14_arg0:addElement( self )
	local f14_local5 = CoD.CreateState( nil, f14_local0 - 46, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local5.height = 108
	f14_local5.width = 295
	f14_local5.alpha = 0
	f14_local5.material = RegisterMaterial( "h1_rankup_motion_textglitch3" )
	local self = LUI.UIImage.new( f14_local5 )
	self.defState = f14_local5
	self.id = "textGlitch3"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f14_arg0.glitch3 = self
	f14_arg0:addElement( self )
	local f14_local7 = CoD.CreateState( nil, f14_local0 - 45, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local7.height = 66
	f14_local7.width = 195
	f14_local7.alpha = 0
	f14_local7.material = RegisterMaterial( "h1_rankup_motion_textglitch4" )
	local self = LUI.UIImage.new( f14_local7 )
	self.defState = f14_local7
	self.id = "textGlitch4"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f14_arg0.glitch4 = self
	f14_arg0:addElement( self )
	local f14_local9 = CoD.CreateState( nil, f14_local0 - 46, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local9.height = 82
	f14_local9.width = 158
	f14_local9.alpha = 0
	f14_local9.material = RegisterMaterial( "h1_rankup_motion_textglitch5" )
	local self = LUI.UIImage.new( f14_local9 )
	self.defState = f14_local9
	self.id = "textGlitch5"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f14_arg0.glitch5 = self
	f14_arg0:addElement( self )
	local f14_local11 = CoD.CreateState( nil, f14_local0 + 34, nil, nil, CoD.AnchorTypes.TopLeft )
	f14_local11.height = 27
	f14_local11.width = 179
	f14_local11.alpha = 0
	f14_local11.material = RegisterMaterial( "h1_rankup_motion_textglitch6" )
	local self = LUI.UIImage.new( f14_local11 )
	self.defState = f14_local11
	self.id = "textGlitch6"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f14_arg0.glitch6 = self
	f14_arg0:addElement( self )
end

function AddAnimatedSupplyDropAssets( f15_arg0 )
	local f15_local0 = -228
	local f15_local1 = 240
	local f15_local2 = CoD.CreateState( nil, f15_local0, nil, nil, CoD.AnchorTypes.LeftRight )
	f15_local2.alignment = LUI.Alignment.Center
	f15_local2.height = f15_local1
	f15_local2.alpha = 0
	local self = LUI.UIElement.new( f15_local2 )
	self.id = "bonusLootContainer"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerEventHandler( "bonusLootAnimationsFinished", OnBonusLootAnimationsFinished )
	f15_arg0.bonusLootContainer = self
	self.parent = parent
	f15_arg0:addElement( self )
	local f15_local4 = RegisterMaterial( "h1_ui_rankup_shadow" )
	local f15_local5, f15_local6 = GetMaterialDimensions( f15_local4 )
	local f15_local7 = 38
	local f15_local8 = 31
	local f15_local9 = CoD.CreateState( -f15_local7, -f15_local8, f15_local7, f15_local8, CoD.AnchorTypes.All )
	f15_local9.color = Colors.black
	f15_local9.material = f15_local4
	self:addElement( LUI.UIImage.new( f15_local9 ) )
	local f15_local10 = f15_local1 + 170
	local f15_local11 = AAR.AddImage( self, {
		id = "supplyDropBg",
		alpha = 0,
		matKey = "h1_dlc_iw-supplydrop_bg",
		top = -f15_local10 / 2 + 10,
		height = f15_local10,
		anchorType = CoD.AnchorTypes.None
	} )
	f15_local11:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f15_local11:registerAnimationState( "disabled", {
		alpha = 0
	} )
	local f15_local12 = 180
	local f15_local13 = AAR.AddImage( self, {
		id = "hexImage",
		alpha = 0,
		matKey = "h1_dlc_iw-supplydrop_hexshape",
		top = -f15_local12 / 2 - 25,
		height = f15_local12,
		width = 170,
		anchorType = CoD.AnchorTypes.None
	} )
	f15_local13:registerAnimationState( "enabled", {
		alpha = 1,
		scale = 0
	} )
	f15_local13:registerAnimationState( "disabled", {
		alpha = 0,
		scale = -0.5
	} )
	f15_local13:animateToState( "disabled" )
	local f15_local14 = 120
	local f15_local15 = AAR.AddImage( self, {
		id = "supplyDropImage",
		alpha = 0,
		matKey = "h1_dlc_iw-supplydrop_crate",
		top = -f15_local14 / 2 - 30,
		height = f15_local14,
		anchorType = CoD.AnchorTypes.None
	} )
	f15_local15:registerAnimationState( "enabled", {
		alpha = 1,
		scale = 0
	} )
	f15_local15:registerAnimationState( "disabled", {
		alpha = 0,
		scale = 0.5
	} )
	f15_local15:registerAnimationState( "largeDisabled", {
		alpha = 0,
		scale = 0.75
	} )
	f15_local15:animateToState( "largeDisabled" )
	local f15_local16 = 18
	local f15_local17 = -f15_local16 / 2 + 42
	local f15_local18 = AAR.AddImage( self, {
		id = "logo",
		alpha = 0,
		matKey = "h1_dlc_iw-supplydrop_iwlogo",
		top = -f15_local16 / 2 + 42,
		height = f15_local16,
		anchorType = CoD.AnchorTypes.None
	} )
	f15_local18:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f15_local18:registerAnimationState( "disabled", {
		alpha = 0
	} )
	local f15_local19 = f15_local16 + 26
	local f15_local20 = AAR.AddImage( self, {
		id = "logoGlow",
		alpha = 0,
		matKey = "h1_dlc_iw-supplydrop_iwlogo-glow",
		top = -f15_local19 / 2 + f15_local17 + f15_local16 / 2,
		height = f15_local19,
		width = f15_local18.width + 260,
		anchorType = CoD.AnchorTypes.None
	} )
	f15_local20:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f15_local20:registerAnimationState( "disabled", {
		alpha = 0
	} )
	f15_local20:registerAnimationState( "faded", {
		alpha = 0.6
	} )
	local f15_local21 = f15_local17 + f15_local16 + 8
	local f15_local22 = CoD.TextSettings.Font40
	local f15_local23 = AAR.AddText( self, {
		id = "supplyDropText",
		textKey = "LUA_MENU_SUPPLY_DROP",
		shouldUppercase = true,
		font = f15_local22,
		top = f15_local21,
		width = f0_local68,
		alpha = 0,
		alignment = LUI.Alignment.Center,
		anchorType = CoD.AnchorTypes.None,
		color = Colors.h1.light_grey
	} )
	f15_local23:registerAnimationState( "enabled", {
		alpha = 0.7
	} )
	f15_local23:registerAnimationState( "disabled", {
		alpha = 0
	} )
	local f15_local24 = AAR.AddText( self, {
		id = "receivedText",
		textKey = "LUA_MENU_RECEIVED",
		shouldUppercase = true,
		font = CoD.TextSettings.Font21,
		top = f15_local21 + f15_local22.Height - 1,
		width = f0_local68,
		alpha = 0,
		alignment = LUI.Alignment.Center,
		anchorType = CoD.AnchorTypes.None,
		color = Colors.h1.light_grey
	} )
	f15_local24:registerAnimationState( "enabled", {
		alpha = 0.3
	} )
	f15_local24:registerAnimationState( "disabled", {
		alpha = 0
	} )
end

function AddAnimatedDepotCreditAssets( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg0.bonusLootContainer
	local f16_local1 = 200
	local f16_local2 = AAR.AddImage( f16_local0, {
		id = "depotCreditImage",
		alpha = 0,
		matKey = "h1_dlc_depotcredits_icon",
		scale = -0.1,
		top = -f16_local1 / 2 - 45,
		height = f16_local1,
		anchorType = CoD.AnchorTypes.None
	} )
	f16_local2:registerAnimationState( "enabled", {
		alpha = 1,
		scale = 0
	} )
	f16_local2:registerAnimationState( "disabled", {
		alpha = 0,
		scale = 2
	} )
	AAR.AddGlitchAssets( f16_local2, {
		containerHeight = f16_local1
	} )
	SetGlitchUnlockPos( f16_local2, "textGlitch1", -125, -40 )
	SetGlitchUnlockPos( f16_local2, "textGlitch2", -150, 55 )
	SetGlitchUnlockPos( f16_local2, "textGlitch3", -125, -70 )
	SetGlitchUnlockPos( f16_local2, "textGlitch4", -165, 0 )
	SetGlitchUnlockPos( f16_local2, "textGlitch5", 0, -80 )
	SetGlitchUnlockPos( f16_local2, "textGlitch6", -100, 45 )
	local f16_local3 = CoD.TextSettings.Font73
	local f16_local4 = 18
	local f16_local5 = 2.2
	local f16_local6 = AAR.AddImage( f16_local0, {
		id = "depotCreditNumBg",
		alpha = 0,
		matKey = "h1_dlc_depotcredits_shadow",
		top = -f16_local3.Height * f16_local5 / 2 + f16_local4,
		height = f16_local3.Height * f16_local5,
		anchorType = CoD.AnchorTypes.None
	} )
	f16_local6:registerAnimationState( "enabled", {
		alpha = 0.6
	} )
	f16_local6:registerAnimationState( "disabled", {
		alpha = 0
	} )
	local f16_local7 = AAR.AddText( f16_local0, {
		id = "currDepotCreditNum",
		text = 1,
		font = f16_local3,
		width = f16_arg0.mainBgWidth,
		alpha = 0,
		scale = -0.25,
		top = -f16_local3.Height / 2 + f16_local4,
		alignment = LUI.Alignment.Center,
		anchorType = CoD.AnchorTypes.None,
		color = Colors.white
	} )
	f16_local7:registerAnimationState( "enabled", {
		alpha = 1,
		scale = 0
	} )
	f16_local7:registerAnimationState( "large", {
		alpha = 1,
		scale = 0.25
	} )
	f16_local7:registerAnimationState( "disabled", {
		alpha = 0,
		scale = -0.25
	} )
	f16_local7:registerAnimationState( "fade", {
		alpha = 0
	} )
	local f16_local8 = AAR.AddText( f16_local0, {
		id = "nextDepotCreditNum",
		text = 1,
		font = f16_local3,
		width = f16_arg0.mainBgWidth,
		alpha = 0,
		scale = -0.25,
		top = -f16_local3.Height / 2 + f16_local4,
		alignment = LUI.Alignment.Center,
		anchorType = CoD.AnchorTypes.None,
		color = Colors.white
	} )
	f16_local8:registerAnimationState( "enabled", {
		alpha = 1,
		scale = 0
	} )
	f16_local8:registerAnimationState( "large", {
		alpha = 1,
		scale = 0.25
	} )
	f16_local8:registerAnimationState( "disabled", {
		alpha = 0,
		scale = -0.25
	} )
	f16_local8:registerAnimationState( "fade", {
		alpha = 0
	} )
	local f16_local9 = GetCurrencyBalance( InventoryCurrencyType.Credits, f0_local59 ) - Lobby.GetCurrencyEarnedLastGame( f0_local59, InventoryCurrencyType.Credits ) * CoD.currencyCreditConversionRate
	local f16_local10 = (f16_local9 - math.floor( f16_local9 )) * f0_local44
	local f16_local11 = 260
	local f16_local12 = 16
	local f16_local13 = {
		currBarPercent = f16_local10,
		id = "depotCreditProgressBar",
		alpha = 0,
		top = -f16_local12 / 2 + 53,
		width = f16_local11,
		height = f16_local12,
		anchorType = CoD.AnchorTypes.None
	}
	local f16_local14 = LUI.DepotCredits.CreateProgressBar( f16_local13 )
	f16_local14:registerAnimationState( "down", {
		alpha = 0,
		top = f16_local13.top + 5,
		height = f16_local13.height
	} )
	f16_local14.parent = f16_local0
	f16_local0.depotCreditProgressBar = f16_local14
	f16_local0:addElement( f16_local14 )
	local f16_local15 = 75
	local f16_local16 = CoD.TextSettings.Font40
	local f16_local17 = {
		id = "depotCreditsText",
		textKey = "LUA_MENU_DEPOT_CREDITS",
		shouldUppercase = true,
		font = f16_local16,
		top = f16_local15,
		width = f16_arg0.mainBgWidth,
		alpha = 0,
		alignment = LUI.Alignment.Center,
		anchorType = CoD.AnchorTypes.None,
		color = Colors.h1.light_grey
	}
	local f16_local18 = AAR.AddText( f16_local0, f16_local17 )
	f16_local18:registerAnimationState( "down", {
		alpha = 0,
		top = f16_local17.top + 5,
		height = f16_local17.font.Height
	} )
	f16_local18:registerAnimationState( "enabled", {
		alpha = 0.7
	} )
	f16_local18:registerAnimationState( "disabled", {
		alpha = 0
	} )
	local f16_local19 = {
		id = "earnedText",
		textKey = "LUA_MENU_XP_EARNED",
		shouldUppercase = true,
		font = CoD.TextSettings.Font21,
		top = f16_local15 + f16_local16.Height - 1,
		width = f16_arg0.mainBgWidth,
		alpha = 0,
		alignment = LUI.Alignment.Center,
		anchorType = CoD.AnchorTypes.None,
		color = Colors.h1.light_grey
	}
	local f16_local20 = AAR.AddText( f16_local0, f16_local19 )
	f16_local20:registerAnimationState( "down", {
		alpha = 0,
		top = f16_local19.top + 5,
		height = f16_local19.font.Height
	} )
	f16_local20:registerAnimationState( "enabled", {
		alpha = 0.3
	} )
	f16_local20:registerAnimationState( "disabled", {
		alpha = 0
	} )
end

function AddBonusLootAnimationAssets( f17_arg0 )
	f17_arg0.mainBgWidth = f0_local68
	AddAnimatedSupplyDropAssets( f17_arg0 )
	AddAnimatedDepotCreditAssets( f17_arg0 )
end

function AddRankUp( f18_arg0, f18_arg1 )
	local f18_local0 = -228
	local f18_local1 = 20
	local f18_local2 = 240
	local f18_local3 = CoD.CreateState( nil, f18_local0, nil, nil, CoD.AnchorTypes.LeftRight )
	f18_local3.alignment = LUI.Alignment.Center
	f18_local3.height = f18_local2
	f18_local3.alpha = 0
	local self = LUI.UIElement.new( f18_local3 )
	self.id = "rankUpContainer"
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f18_arg0.rankUpContainer = self
	self.parent = f18_arg0
	f18_arg0:addElement( self )
	local f18_local5 = "cinematic"
	local f18_local6 = f0_local68 + 210
	local f18_local7 = CoD.CreateState( -f18_local6 / 2, -f18_local1, nil, nil, CoD.AnchorTypes.Top )
	f18_local7.width = f18_local6
	f18_local7.height = 320
	f18_local7.alpha = 1
	f18_local7.material = RegisterMaterial( f18_local5 )
	self:addElement( LUI.UIImage.new( f18_local7 ) )
	local f18_local8 = f0_local6.Height - 12
	local f18_local9 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f18_local9.height = f18_local8
	f18_local9.width = 2
	f18_local9.alpha = 0
	f18_local9.material = RegisterMaterial( "white" )
	f18_local9.color = Colors.h1.light_green
	local self = LUI.UIImage.new( f18_local9 )
	self.id = "greenFlashRect"
	self.width = f18_local9.width
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "transparent", {
		alpha = 0.15
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local11 = 5
	local f18_local12 = 32
	local f18_local13 = 25
	local f18_local14 = 700
	local f18_local15 = 650
	local f18_local16 = -f18_local15 / 2 + f18_local13 + f18_local12
	local f18_local17 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f18_local17.width = f18_local14
	f18_local17.height = f18_local2 + 36
	local self = LUI.UIStencilText.new( f18_local17 )
	self.id = "rankUpIconBgStencil"
	local f18_local19 = CoD.CreateState( nil, f18_local16, nil, nil, CoD.AnchorTypes.None )
	f18_local19.height = f18_local15
	f18_local19.width = f18_local14
	f18_local19.alpha = 0
	f18_local19.material = RegisterMaterial( "rank_classic_prestige6" )
	local self = LUI.UIImage.new( f18_local19 )
	self.id = "rankUpIconBg"
	self:registerAnimationState( "enabled", {
		alpha = 0.15,
		top = f18_local16 - f18_local11,
		height = f18_local15
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "moveToCenter", {
		top = f18_local16 - f18_local12 - f18_local11,
		height = f18_local15
	} )
	self:addElement( self )
	self:addElement( self )
	local f18_local21 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f18_local21.height = f18_local8
	local self = LUI.UIElement.new( f18_local21 )
	self.id = "bgRectContainer"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local23 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
	f18_local23.height = f18_local8
	f18_local23.width = 0
	f18_local23.alpha = 0.15
	f18_local23.material = RegisterMaterial( "white" )
	f18_local23.color = Colors.h1.light_green
	local self = LUI.UIImage.new( f18_local23 )
	self.defState = f18_local23
	self.id = "greenBgRect"
	self:registerAnimationState( "init", f18_local23 )
	self:addElement( self )
	local f18_local25 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
	f18_local25.height = f18_local8
	f18_local25.width = 0
	f18_local25.alpha = 0.65
	f18_local25.material = RegisterMaterial( "white" )
	f18_local25.color = Colors.black
	local self = LUI.UIImage.new( f18_local25 )
	self.defState = f18_local25
	self.id = "blackBgRect"
	self:registerAnimationState( "init", f18_local25 )
	self:addElement( self )
	AAR.AddGlitchAssets( self, {
		containerHeight = f18_local2
	} )
	local f18_local27 = "4"
	local f18_local28, f18_local29, f18_local30, f18_local31 = GetTextDimensions( f18_local27, f0_local6.Font, f0_local6.Height )
	local f18_local32 = f18_local30 - f18_local28
	local f18_local33 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_LEVEL_CAPS" ) ) .. " "
	local f18_local34, f18_local35, f18_local36, f18_local37 = GetTextDimensions( f18_local33, f0_local6.Font, f0_local6.Height )
	local f18_local38 = f18_local36 - f18_local34
	local f18_local39 = 14
	local f18_local40 = CoD.CreateState( nil, -f0_local6.Height / 2 + f18_local39, nil, nil, CoD.AnchorTypes.Left )
	f18_local40.font = f0_local6.Font
	f18_local40.color = Colors.h1.medium_grey
	f18_local40.width = f18_local38
	f18_local40.height = f0_local6.Height
	f18_local40.alpha = 0
	local self = LUI.UIText.new( f18_local40 )
	self.id = "rankUpText"
	self:setText( f18_local33 )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local42 = CoD.CreateState( nil, -f0_local6.Height / 2 + f18_local39, nil, nil, CoD.AnchorTypes.Right )
	f18_local42.font = f0_local6.Font
	f18_local42.color = f0_local11
	f18_local42.width = f18_local32
	f18_local42.height = f0_local6.Height
	f18_local42.alpha = 0
	local self = LUI.UIText.new( f18_local42 )
	self.id = "rankUpNum"
	self:setText( f18_local27 )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local44 = Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_PRESTIGE" ) ) .. " "
	local f18_local45, f18_local46, f18_local47, f18_local48 = GetTextDimensions( f18_local44, f0_local6.Font, f0_local6.Height )
	local f18_local49 = f18_local47 - f18_local45
	local f18_local50 = 14
	local f18_local51 = CoD.CreateState( nil, -f0_local6.Height / 2 + f18_local50, nil, nil, CoD.AnchorTypes.Left )
	f18_local51.font = f0_local6.Font
	f18_local51.color = Colors.h1.medium_grey
	f18_local51.width = f18_local49
	f18_local51.height = f0_local6.Height
	f18_local51.alpha = 0
	local self = LUI.UIText.new( f18_local51 )
	self.id = "prestigeUnlockedText"
	self:setText( f18_local44 )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local53 = CoD.CreateState( nil, -f0_local6.Height / 2 + f18_local50, nil, nil, CoD.AnchorTypes.Right )
	f18_local53.font = f0_local6.Font
	f18_local53.color = f0_local11
	f18_local53.width = f18_local32
	f18_local53.height = f0_local6.Height
	f18_local53.alpha = 0
	local self = LUI.UIText.new( f18_local53 )
	self.id = "prestigeUnlockedNum"
	self:setText( f18_local27 )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	f18_local12 = 16
	f18_local11 = 5
	f18_local13 = 10
	local f18_local55 = 128
	f18_local16 = -f18_local55 / 2 + f18_local13 + f18_local12
	local f18_local56 = CoD.CreateState( nil, -f18_local55 / 2 + f18_local13 + f18_local12, nil, nil, CoD.AnchorTypes.None )
	f18_local56.height = f18_local55
	f18_local56.width = f18_local55
	f18_local56.alpha = 0
	f18_local56.material = RegisterMaterial( "rank_classic_prestige6" )
	f18_local56.scale = 0
	local self = LUI.UIImage.new( f18_local56 )
	self.id = "rankUpIcon"
	self.size = f18_local55
	self:registerAnimationState( "initMoveFade", {
		alpha = 0.15,
		top = f18_local16 - f18_local11 - 1,
		height = f18_local55
	} )
	self:registerAnimationState( "enabled", {
		alpha = 1,
		top = f18_local16 - f18_local11,
		height = f18_local55
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "moveToCenter", {
		top = f18_local16 - f18_local12 - f18_local11,
		height = f18_local55
	} )
	self:addElement( self )
	local f18_local58 = 350
	local f18_local59 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f18_local59.height = f18_local58
	f18_local59.width = f18_local58
	f18_local59.alpha = 0
	f18_local59.material = RegisterMaterial( "rank_classic_prestige6" )
	f18_local59.scale = 0
	local self = LUI.UIImage.new( f18_local59 )
	local f18_local61 = f18_local55 / 4
	local f18_local62 = 20
	local f18_local63 = -f18_local58 / 2
	self.id = "medRankUpIcon"
	self:registerAnimationState( "left", {
		alpha = 0.5,
		left = f18_local63 - f18_local61,
		top = f18_local63 + 10,
		width = f18_local58,
		height = f18_local58
	} )
	self:registerAnimationState( "right", {
		alpha = 0.5,
		left = f18_local63 + f18_local61,
		width = f18_local58,
		height = f18_local58
	} )
	self:registerAnimationState( "enabled", {
		alpha = 0.5,
		left = f18_local63,
		top = nil,
		width = f18_local58,
		height = f18_local58
	} )
	self:registerAnimationState( "slightlyFaded", {
		alpha = 0.35,
		left = f18_local63,
		top = nil,
		width = f18_local58,
		height = f18_local58
	} )
	self:registerAnimationState( "faded", {
		alpha = 0.15,
		left = f18_local63,
		top = nil,
		width = f18_local58,
		height = medRankUpIconSquareSizel
	} )
	self:registerAnimationState( "veryFaded", {
		alpha = 0.07,
		left = f18_local63,
		top = nil,
		width = f18_local58,
		height = medRankUpIconSquareSizel
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local64 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
	f18_local64.height = f18_local8
	f18_local64.width = 0
	f18_local64.material = RegisterMaterial( "white" )
	f18_local64.color = Colors.h1.light_green
	local self = LUI.UIImage.new( f18_local64 )
	self.defState = f18_local64
	self.id = "greenTextHideRect"
	self:registerAnimationState( "init", f18_local64 )
	self:addElement( self )
	local f18_local66 = CoD.TextSettings.Font350
	f18_local44 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_RANKED_UP" ) )
	local f18_local67, self, f18_local69, f18_local70 = GetTextDimensions( f18_local44, f18_local66.Font, f18_local66.Height )
	f18_local48 = f18_local70
	f18_local47 = f18_local69
	f18_local46 = self
	f18_local49 = f18_local47 - f18_local67
	f18_local50 = 29
	f18_local67 = CoD.CreateState( f0_local68 / 2 + -f18_local49 / 2, -f18_local66.Height / 2 + f18_local50, nil, nil, CoD.AnchorTypes.Left )
	f18_local67.font = f18_local66.Font
	f18_local67.color = Colors.h1.medium_grey
	f18_local67.width = f18_local49
	f18_local67.height = f18_local66.Height
	f18_local67.alpha = 0
	self = LUI.UIText.new( f18_local67 )
	self.id = "largeRankedUpText"
	self:setText( f18_local44 )
	self:registerAnimationState( "enabled", {
		alpha = 0.07
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	f18_local69 = CoD.TextSettings.Font128
	f18_local44 = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_RANKED_UP" ) )
	local f18_local70, f18_local71, f18_local72, self = GetTextDimensions( f18_local44, f18_local69.Font, f18_local69.Height )
	f18_local48 = self
	f18_local47 = f18_local72
	f18_local46 = f18_local71
	f18_local49 = f18_local47 - f18_local70
	f18_local72 = CoD.CreateState( -f18_local49 + -8, -f18_local69.Height / 2 + f18_local50 + 56, nil, nil, CoD.AnchorTypes.Right )
	f18_local72.font = f18_local69.Font
	f18_local72.color = Colors.h1.medium_grey
	f18_local72.width = f18_local49
	f18_local72.height = f18_local69.Height
	f18_local72.alpha = 0
	self = LUI.UIText.new( f18_local72 )
	self.id = "smallRankedUpText"
	self:setText( f18_local44 )
	self:registerAnimationState( "enabled", {
		alpha = 0.07
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local74 = 159
	local f18_local75 = CoD.CreateState( nil, -f18_local74 / 2 - 42, nil, nil, CoD.AnchorTypes.None )
	f18_local75.height = f18_local74
	f18_local75.width = 0
	f18_local75.alpha = 0
	f18_local75.scale = 0
	f18_local75.material = nil
	local self = LUI.UIImage.new( f18_local75 )
	self.id = "itemUnlock"
	self.height = f18_local74
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "faded", {
		alpha = 0.5
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local77 = f18_local74 * 1.25
	local f18_local78 = -f18_local77 / 2 - 34
	local f18_local79 = CoD.CreateState( nil, f18_local78, nil, nil, CoD.AnchorTypes.None )
	f18_local79.height = f18_local77
	f18_local79.width = 0
	f18_local79.alpha = 0
	f18_local79.material = nil
	local self = LUI.UIImage.new( f18_local79 )
	self.id = "largeItemUnlock"
	self.height = f18_local77
	self.initTop = f18_local78
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:addElement( self )
	local f18_local81 = CoD.CreateState( nil, -f0_local7.Height / 2 + 60, nil, nil, CoD.AnchorTypes.None )
	f18_local81.alpha = 0
	f18_local81.font = f0_local7.Font
	f18_local81.height = f0_local7.Height
	f18_local81.color = f0_local16
	f18_local81.scale = 0
	local self = LUI.UIText.new( f18_local81 )
	self.id = "itemUnlockName"
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "faded", {
		alpha = 0.5
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "flyin", {
		alpha = 0,
		scale = -1
	} )
	self:addElement( self )
	local f18_local83 = CoD.CreateState( nil, -f0_local8.Height / 2 + 92, nil, nil, CoD.AnchorTypes.None )
	f18_local83.alpha = 0
	f18_local83.font = f0_local8.Font
	f18_local83.height = f0_local8.Height
	f18_local83.color = f0_local17
	f18_local83.scale = 0
	local self = LUI.UIText.new( f18_local83 )
	self.id = "unlockedText"
	self:registerAnimationState( "enabled", {
		alpha = 0.5
	} )
	self:registerAnimationState( "faded", {
		alpha = 0.25
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "flyin", {
		alpha = 0,
		scale = -1
	} )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_UNLOCKED" ) ) )
	self:addElement( self )
end

function Lerp( f19_arg0, f19_arg1, f19_arg2 )
	return math.floor( f19_arg0 + (f19_arg1 - f19_arg0) * f19_arg2 + 0.5 )
end

function OnAnimateStatVal( f20_arg0, f20_arg1 )
	local f20_local0 = (Engine.GetTimeMsecs() - f20_arg0.startTime) / (f20_arg0.endTime - f20_arg0.startTime)
	local f20_local1 = Lerp( f20_arg0.startingVal, f20_arg0.targetVal, f20_local0 )
	if 1 - f20_local0 < 0 then
		f20_local1 = f20_arg0.targetVal
	end
	f20_arg0:setText( f20_local1 )
	local f20_local2 = f0_local63
	local f20_local3 = f0_local63 - f20_arg0.targetVal - f20_arg0.startingVal
	local f20_local4 = Lobby.GetRankForXP( f20_local3, AAR.GetPrestigeLevel( f0_local59 ) )
	local f20_local5 = Rank.GetRankMinXP( f20_local4 )
	f20_local2 = f20_local2 - f20_local5
	local f20_local6 = Rank.GetRankXPToNext( f20_local4 )
	local f20_local7 = Lerp( f20_local3 - f20_local5, f20_local2, f20_local0 )
	if 1 - f20_local0 < 0 then
		f20_local7 = f20_local2
	end
	f20_arg0.xpBreakdownContainer.pTrackingText:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f20_local7, f20_local6 ) )
end

function OnStopAnimateStatVal( f21_arg0, f21_arg1 )
	LUI.UITimer.Disable( f21_arg0.timer )
	LUI.UITimer.Stop( f21_arg0.timer )
end

function AnimateStat( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	local f22_local0 = f22_arg0.childRecord[f22_arg1 .. "_statContainer"]
	local f22_local1 = f22_local0.childRecord[f22_arg1 .. "_statVal"]
	f22_local1.startTime = Engine.GetTimeMsecs()
	f22_local1.endTime = f22_local1.startTime + f22_arg4
	f22_local1.startingVal = f22_arg2 or 0
	f22_local1.targetVal = f22_arg3
	local f22_local2 = f22_local0.childRecord[f22_arg1 .. "_statName"]
	f22_local1:animateToState( "enabled", f22_arg4 )
	f22_local2:animateToState( "enabled", f22_arg4 / 3 )
	f22_local1.timer = AddTimer( f22_local1, 0, "animateStatVal", nil, true )
	AddTimer( f22_local1, f22_arg4, "stopAnimateStatVal", nil )
	f22_arg0:delayCallFunc( f22_arg4, function ()
		f22_local1:setText( f22_arg3 )
	end )
end

function AddTimer( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	local self = nil
	if f24_arg4 then
		self = LUI.UITimer.new( f24_arg1, f24_arg2, nil, false, false, false )
	else
		self = LUI.UITimer.new( f24_arg1, f24_arg2, nil, true, nil, false, false, false )
	end
	self.id = f24_arg3
	f24_arg0:addElement( self )
	return self
end

function AnimateXpBar( f25_arg0, f25_arg1 )
	if not f0_local25 then
		f25_arg0.experienceSoundIdx = Engine.PlaySound( f0_local20 )
		f0_local22 = f25_arg0.experienceSoundIdx
	end
	local f25_local0 = f25_arg0.childRecord.xpBar
	local f25_local1 = f25_local0.childRecord.xpBarEmpty.childRecord.xpBarFill.defState.fullWidth
	local f25_local2 = f25_local0.childRecord.xpBarEmpty.childRecord.xpBarFill
	if f25_local2.remainingXp then
		f25_arg1 = f25_local2.remainingXp
		f25_local2.remainingXp = nil
	end
	local f25_local3 = f25_local2.defState
	local f25_local4 = AAR.GetPrestigeLevel( f0_local59 )
	local f25_local5 = Lobby.GetRankForXP( f0_local63, f25_local4 )
	local f25_local6 = Rank.GetRankMinXP( f25_local5 )
	local f25_local7 = Rank.GetRankXPToNext( f25_local5 )
	local f25_local8 = nil
	local f25_local9 = f0_local63 - Rank.GetRankMinXP( f25_local5 )
	if f25_local5 < Rank.GetMaxRank( f25_local4 ) then
		f0_local70 = false
	end
	if f0_local70 or f25_arg1 == 0 then
		local f25_local10
		if f25_arg1 == 0 then
			f25_local10 = 0
			if not f25_local10 then
			
			else
				f25_local3.width = f25_local10
				f25_local2:registerAnimationState( "init", f25_local3 )
				f25_local2:animateToState( "init", 0 )
				f25_arg0:processEvent( {
					name = "MoveToNextXpStat"
				} )
				if f0_local22 then
					Engine.StopSound( f0_local22 )
				end
				return 
			end
		end
		f25_local10 = f25_local1
	else
		local f25_local10 = nil
		if f25_local7 <= f25_local9 + f25_arg1 then
			f25_local3.width = f25_local1
			f25_local10 = f25_local3.width / f0_local34
			local f25_local11 = AAR.GetPrestigeLevel( f0_local59 )
			local f25_local12 = f25_local7 - f25_local9
			f25_local2.remainingXp = f25_arg1 - f25_local12
			AddTimer( f25_arg0, f25_local10, "RankUp", "rankUpTimer" )
			f25_local8 = f25_local12
		else
			f25_local3.width = f25_local1 * (f25_local9 + f25_arg1) / f25_local7
			f25_local10 = f25_local3.width / f0_local34
			f25_local8 = f25_arg1
			f25_arg0:delayCallFunc( f25_local10, function ()
				if f0_local22 then
					Engine.StopSound( f0_local22 )
				end
			end )
			AddTimer( f25_arg0, f25_local10 + f0_local41, "MoveToNextXpStat" )
		end
		AnimateStat( f25_arg0, f0_local62[f0_local61].id, f25_arg0.statXpTotal, f25_arg0.statXpTotal + f25_local8, f25_local10 )
		f25_arg0.statXpTotal = f25_arg0.statXpTotal + f25_local8
		f25_local2:registerAnimationState( "default", f25_local3 )
		local f25_local11 = (Rank.GetRankMaxXP( f25_local5 ) - Rank.GetRankMinXP( f25_local5 )) * f0_local37
		if f25_local9 <= f25_local11 then
			f25_local3.width = f25_local1 * f25_local11 / f25_local7
			f25_local2:registerAnimationState( "init", f25_local3 )
			f25_local2:animateToState( "init", 0 )
			if f25_local11 < f25_local9 + f25_local8 then
				f25_local2:animateToState( "default", f25_local10, true, true )
			end
		else
			f25_local2:animateToState( "default", f25_local10, true, true )
		end
		f0_local63 = f0_local63 + f25_local8
		if f25_local8 == f25_arg1 then
			f25_arg0.statXpTotal = 0
			f0_local61 = f0_local61 + 1
		end
	end
end

function AnimateAARProgress( f27_arg0 )
	AddTimer( f27_arg0.childRecord.xpBreakdownContainer, f0_local41, "MoveToNextXpStat", "statAnimTimer" )
	if f0_local65 > 0 then
		table.insert( f0_local62, {
			id = "matchXp",
			value = f0_local65
		} )
	end
	if f0_local66 > 0 then
		table.insert( f0_local62, {
			id = "matchBonus",
			value = f0_local66
		} )
	end
	if f0_local67 > 0 then
		table.insert( f0_local62, {
			id = "challengeBonus",
			value = f0_local67
		} )
	end
end

function AnimateSupplyDrop( f28_arg0, f28_arg1 )
	f28_arg0.supplyDropBg:animateInSequence( {
		{
			"enabled",
			f0_local57 * 12
		},
		{
			"enabled",
			f0_local57 * 69
		},
		{
			"disabled",
			f0_local57 * 7
		}
	} )
	f28_arg0:delayCallFunc( f0_local57 * 6, function ()
		f28_arg0.hexImage:animateInSequence( {
			{
				"enabled",
				f0_local57 * 6
			},
			{
				"enabled",
				f0_local57 * 69
			},
			{
				"disabled",
				f0_local57 * 4
			}
		} )
	end )
	f28_arg0:delayCallFunc( f0_local57 * 7, function ()
		f28_arg0.supplyDropImage:animateInSequence( {
			{
				"enabled",
				f0_local57 * 5
			},
			{
				"enabled",
				f0_local57 * 69
			},
			{
				"disabled",
				f0_local57 * 3
			}
		} )
	end )
	f28_arg0:delayCallFunc( f0_local57 * 14, function ()
		f28_arg0.logo:animateInSequence( {
			{
				"enabled",
				f0_local57 * 6
			},
			{
				"enabled",
				f0_local57 * 54
			},
			{
				"disabled",
				f0_local57 * 5
			}
		} )
	end )
	f28_arg0:delayCallFunc( f0_local57 * 14, function ()
		f28_arg0.logoGlow:animateInSequence( {
			{
				"enabled",
				f0_local57 * 6
			},
			{
				"disabled",
				f0_local57 * 8
			},
			{
				"faded",
				f0_local57 * 4
			},
			{
				"disabled",
				f0_local57 * 4
			},
			{
				"faded",
				f0_local57 * 4
			},
			{
				"disabled",
				f0_local57 * 3
			},
			{
				"disabled",
				f0_local57 * 2
			},
			{
				"faded"
			},
			{
				"faded",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"faded"
			},
			{
				"faded",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			}
		} )
	end )
	f28_arg0:delayCallFunc( f0_local57 * 1, function ()
		f28_arg0.supplyDropText:animateInSequence( {
			{
				"enabled",
				f0_local57 * 20
			},
			{
				"enabled",
				f0_local57 * 4
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 32
			},
			{
				"disabled",
				f0_local57 * 3
			}
		} )
	end )
	f28_arg0:delayCallFunc( f0_local57 * 18, function ()
		f28_arg0.supplyDropText:animateInSequence( {
			{
				"enabled",
				f0_local57 * 19
			},
			{
				"enabled",
				f0_local57 * 4
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 31
			},
			{
				"disabled",
				f0_local57 * 4
			}
		} )
	end )
	f28_arg0:delayCallFunc( f0_local57 * 19, function ()
		f28_arg0.receivedText:animateInSequence( {
			{
				"enabled",
				f0_local57 * 18
			},
			{
				"enabled",
				f0_local57 * 4
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 31
			},
			{
				"disabled",
				f0_local57 * 4
			}
		} )
	end )
	local f28_local0 = f0_local57 * 88
	if not f28_arg1 then
		f28_arg0:delayCallFunc( f28_local0, function ()
			f28_arg0:processEvent( {
				name = "bonusLootAnimationsFinished"
			} )
		end )
		
	else
		return f28_local0 + f0_local57 * 6
	end
end

function AnimateDepotCredits( f37_arg0 )
	f37_arg0.depotCreditProgressBar:animateToState( "enabled", f0_local57 * 8 )
	f37_arg0:delayCallFunc( f0_local57 * 8, function ()
		LUI.DepotCredits.AnimateProgressBar( f37_arg0.depotCreditProgressBar, {
			gainedBarPercent = Lobby.GetCurrencyEarnedLastGame( f0_local59, InventoryCurrencyType.Credits ) * CoD.currencyCreditConversionRate * f0_local44,
			creditEarnedCallback = OnAnimateEarnedCredits,
			finishedCallback = OnAnimateFinishedDepotCredits,
			animDelay = f0_local57 * 23
		} )
	end )
	f37_arg0:delayCallFunc( f0_local57 * 3, function ()
		f37_arg0.depotCreditImage:animateToState( "enabled", f0_local57 * 3 )
		f37_arg0.depotCreditsText:animateToState( "enabled", f0_local57 * 7 )
		f37_arg0.earnedText:animateToState( "enabled", f0_local57 * 7 )
	end )
	local f37_local0 = 3
	f0_local57 = f0_local57 / f37_local0
	local f37_local1 = f37_arg0.depotCreditImage.glitch1
	local f37_local2 = f37_arg0.depotCreditImage.glitch2
	local f37_local3 = f37_arg0.depotCreditImage.glitch3
	local f37_local4 = f37_arg0.depotCreditImage.glitch4
	local f37_local5 = f37_arg0.depotCreditImage.glitch5
	local f37_local6 = f37_arg0.depotCreditImage.glitch6
	f37_arg0:delayCallFunc( f0_local57 * 2, function ()
		f37_local4:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 2
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57 * 2
			},
			{
				"unlockEnabled"
			},
			{
				"disabled",
				f0_local57 * 4
			}
		} )
	end )
	f37_arg0:delayCallFunc( f0_local57 * 3, function ()
		f37_local3:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 4
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57 * 2
			},
			{
				"unlockEnabled"
			},
			{
				"disabled",
				f0_local57 * 5
			}
		} )
		f37_local5:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 2
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			}
		} )
		f37_local1:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 3
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"disabled",
				f0_local57 * 6
			}
		} )
	end )
	f37_local2:animateInSequence( {
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57 * 4
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57
		},
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57 * 2
		},
		{
			"unlockEnabled"
		},
		{
			"disabled",
			f0_local57 * 5
		}
	} )
	f37_local6:animateInSequence( {
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57 * 4
		},
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57
		},
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57 * 2
		},
		{
			"disabled"
		}
	} )
	f0_local57 = f0_local57 * f37_local0
end

function AnimateBonusLootAnimations( f42_arg0 )
	local f42_local0 = 0
	local f42_local1 = f42_arg0.bonusLootContainer
	local f42_local2 = false
	local f42_local3
	if 0 < Lobby.GetCurrencyEarnedLastGame( f0_local59, InventoryCurrencyType.Credits ) * CoD.currencyCreditConversionRate then
		f42_local3 = true
	else
		f42_local3 = false
	end
	if f42_local3 or f42_local2 then
		f42_local1:animateToState( "enabled", f0_local43 )
		f42_local1:delayCallFunc( f0_local43 * 1.25, function ()
			if f42_local2 then
				f42_local0 = AnimateSupplyDrop( f42_local1, f42_local3 )
			end
			if f42_local3 then
				f42_local1:delayCallFunc( f42_local0, function ()
					AnimateDepotCredits( f42_local1 )
				end )
			end
		end )
	else
		f0_local58:processEvent( {
			name = "CloseRoot"
		} )
	end
end

function UpdateBgRectWidth( f45_arg0, f45_arg1 )
	f45_arg0.defState.width = f45_arg1
	f45_arg0:registerAnimationState( "newWidth", f45_arg0.defState )
	f45_arg0:animateToState( "newWidth", 0 )
end

function AnimateRevealRect( f46_arg0, f46_arg1 )
	local f46_local0 = f46_arg0.childRecord.bgRectContainer
	local f46_local1 = f46_local0.childRecord[f46_arg1]
	f46_local1.defState.width = 7
	f46_local1:registerAnimationState( "initDisplay", f46_local1.defState )
	f46_local1:animateToState( "initDisplay", 0 )
	f46_local1.defState.width = 14
	f46_local1:registerAnimationState( "grow", f46_local1.defState )
	f46_local1:animateToState( "grow", f0_local57 * 2 )
	f46_arg0:delayCallFunc( f0_local57 * 3, function ()
		UpdateBgRectWidth( f46_local1, f46_local0.width / 2 )
	end )
	f46_arg0:delayCallFunc( f0_local57 * 4, function ()
		UpdateBgRectWidth( f46_local1, f46_local0.width )
	end )
	return f0_local57 * 4
end

function ResetAllAnimationAssets( f49_arg0 )
	local f49_local0 = f49_arg0.childRecord.bgRectContainer
	local f49_local1 = f49_arg0.childRecord.greenFlashRect
	local f49_local2 = f49_arg0.childRecord.rankUpIconBgStencil.childRecord.rankUpIconBg
	local f49_local3 = f49_local0.childRecord.greenBgRect
	local f49_local4 = f49_local0.childRecord.blackBgRect
	local f49_local5 = f49_local0.childRecord.greenTextHideRect
	local f49_local6 = f49_local0.childRecord.rankUpText
	local f49_local7 = f49_local0.childRecord.rankUpNum
	local f49_local8 = f49_local0.childRecord.prestigeUnlockedText
	local f49_local9 = f49_local0.childRecord.prestigeUnlockedNum
	local f49_local10 = f49_arg0.childRecord.rankUpIcon
	local f49_local11 = f49_local10.childRecord.medRankUpIcon
	f49_local0:animateToState( "default" )
	f49_local1:animateToState( "default" )
	f49_local2:animateToState( "default" )
	f49_local3:animateToState( "init" )
	f49_local4:animateToState( "init" )
	f49_local5:animateToState( "init" )
	f49_local6:animateToState( "default" )
	f49_local7:animateToState( "default" )
	f49_local8:animateToState( "default" )
	f49_local9:animateToState( "default" )
	f49_local10:animateToState( "default" )
	f49_local11:animateToState( "default" )
	f49_local0:animateToState( "enabled" )
end

function DetermineItemToAnimate( f50_arg0 )
	if f0_local64[f50_arg0] and f0_local64[f50_arg0].typeCount > 0 then
		if f0_local64[f50_arg0][f0_local71] and #f0_local64[f50_arg0][f0_local71] > 0 then
			return f0_local64[f50_arg0][f0_local71][1]
		elseif f0_local64[f50_arg0][f0_local72] and #f0_local64[f50_arg0][f0_local72] > 0 then
			return f0_local64[f50_arg0][f0_local72][1]
		end
	end
end

function InitRankUpAnimationAssets( f51_arg0, f51_arg1 )
	local f51_local0 = Engine.Localize( "@LUA_MENU_LEVEL_CAPS" )
	local f51_local1 = Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_PRESTIGE" ) )
	local f51_local2 = AAR.GetPrestigeLevel( f0_local59 )
	local f51_local3 = AAR.GetRankForXP( f0_local63, f51_local2 )
	local f51_local4 = AAR.GetRankForXP( f0_local63 + Rank.GetRankXPToNext( f51_local3 ) - f0_local63 - Rank.GetRankMinXP( f51_local3 ), f51_local2 )
	local f51_local5 = RegisterMaterial( Rank.GetRankIcon( f51_local3, f51_local2, Rank.GetCustomRankIcons( f51_local2, f0_local63 ) ) )
	local f51_local6 = Rank.GetRankDisplay( f51_local3 )
	local f51_local7 = f51_arg1.childRecord.bgRectContainer.childRecord.rankUpNum
	local f51_local8 = f51_arg1.childRecord.bgRectContainer.childRecord.prestigeUnlockedNum
	local f51_local9 = f51_arg1.childRecord.rankUpIcon
	local f51_local10 = f51_local9.childRecord.medRankUpIcon
	local f51_local11 = f51_arg1.childRecord.rankUpIconBgStencil.childRecord.rankUpIconBg
	f51_local8:setText( f51_local2 + 1 )
	f51_local7:setText( f51_local6 )
	f51_local9:setImage( f51_local5 )
	f51_local10:setImage( f51_local5 )
	f51_local11:setImage( f51_local5 )
	local f51_local12 = DetermineItemToAnimate( f51_local3 )
	if f51_local12 then
		local f51_local13 = f51_local12.Type
		local f51_local14 = f0_local72
		f51_local13 = REG42 and StatsTable or PerkTable
		local f51_local15 = RegisterMaterial( Engine.TableLookup( f51_local13.File, f51_local13.Cols.Ref, f51_local12.ItemId, f51_local13.Cols.Image ) )
		local f51_local16, f51_local17 = GetMaterialDimensions( f51_local15 )
		local f51_local18 = f51_local16 / f51_local17
		local f51_local19 = f51_arg1.childRecord.itemUnlock
		local f51_local20 = f0_local68 / 3
		local f51_local21 = f51_local18 * f51_local19.height
		f51_local19:setImage( f51_local15 )
		f51_local19:registerAnimationState( "default", {
			width = f51_local21,
			scale = 0
		} )
		f51_local19:registerAnimationState( "flyout", {
			alpha = 0,
			scale = 1
		} )
		f51_local19:animateToState( "default" )
		local f51_local22 = f51_arg1.childRecord.largeItemUnlock
		f51_local21 = f51_local18 * f51_local22.height * 1.25
		f51_local22.width = f51_local21
		f51_local22:setImage( f51_local15 )
		local f51_local23 = -f51_local21 / 2
		f51_local22:registerAnimationState( "topLeft", {
			alpha = 1,
			left = f51_local23 - 60,
			top = f51_local22.initTop - 20,
			width = f51_local21,
			height = f51_local22.height
		} )
		f51_local22:registerAnimationState( "bot", {
			alpha = 1,
			left = f51_local23,
			top = f51_local22.initTop + 35,
			width = f51_local21,
			height = f51_local22.height
		} )
		f51_local22:registerAnimationState( "top", {
			alpha = 1,
			left = f51_local23,
			top = f51_local22.initTop - 25,
			width = f51_local21,
			height = f51_local22.height
		} )
		f51_local22:registerAnimationState( "mid", {
			alpha = 1,
			left = f51_local23,
			top = f51_local22.initTop,
			width = f51_local21,
			height = f51_local22.height
		} )
		f51_local22:registerAnimationState( "right", {
			alpha = 1,
			left = f51_local23 + 60,
			top = f51_local22.initTop,
			width = f51_local21,
			height = f51_local22.height
		} )
		f51_local22:registerAnimationState( "default", {
			width = f51_local21,
			left = f51_local23
		} )
		f51_local22:animateToState( "default" )
		local f51_local24 = Engine.Localize( Engine.TableLookup( f51_local13.File, f51_local13.Cols.Ref, f51_local12.ItemId, f51_local13.Cols.Name ) )
		local f51_local25, f51_local26, f51_local27, f51_local28 = GetTextDimensions( f51_local24, f0_local7.Font, f0_local7.Height )
		local f51_local29 = f51_arg1.childRecord.itemUnlockName
		f51_local29:registerAnimationState( "default", {
			width = f51_local27 - f51_local25,
			scale = 0
		} )
		f51_local29:animateToState( "default" )
		f51_local29:setText( f51_local24 )
		local f51_local30 = f51_arg1.childRecord.unlockedText
		f51_local30:registerAnimationState( "default", {
			scale = 0
		} )
		f51_local30:animateToState( "default" )
	end
	local f51_local13 = f51_arg0.childRecord.rankContainerLeft
	local f51_local14 = f51_local13.childRecord.rankTextLeft
	local f51_local15 = f51_local13.childRecord.rankNumLeft
	local f51_local16 = f51_local13.childRecord.rankIconLeft
	local f51_local17 = f51_arg0.childRecord.rankContainerRight
	local f51_local18 = f51_local17.childRecord.rankTextRight
	local f51_local19 = f51_local17.childRecord.rankNumRight
	local f51_local20 = f51_local17.childRecord.rankIconRight
	local f51_local21, f51_local22, f51_local23, f51_local31 = GetTextDimensions( f51_local0 .. " " .. f51_local6, f0_local6.Font, f0_local6.Height )
	f0_local69 = f51_local23 - f51_local21
	if f51_local3 == f51_local4 then
		f51_local21, f51_local22, f51_local23, f51_local31 = GetTextDimensions( f51_local1 .. " " .. f51_local2 + 1, f0_local6.Font, f0_local6.Height )
	end
	f0_local69 = f51_local23 - f51_local21
	local f51_local24, f51_local25, f51_local26, f51_local27 = GetTextDimensions( f51_local6, f0_local3.Font, f0_local3.Height )
	f51_local31 = f51_local27
	f51_local23 = f51_local26
	f51_local22 = f51_local25
	f51_local24 = f51_local23 - f51_local24
	local f51_local25, f51_local26, f51_local27, f51_local28 = GetTextDimensions( Rank.GetRankDisplay( f51_local4 ), f0_local3.Font, f0_local3.Height )
	f51_local31 = f51_local28
	f51_local23 = f51_local27
	f51_local22 = f51_local26
	f51_local25 = f51_local23 - f51_local25
	if f51_local3 <= Rank.GetMaxRank( f51_local2 ) then
		if f51_local3 ~= Rank.GetMaxRank( f51_local2 ) or f51_local2 ~= Rank.GetMaxPrestigeLevel() then
			f51_local14:registerAnimationState( "default", {
				width = f51_local14.width,
				left = f51_local14.leftOffset - f51_local24 / 2
			} )
			f51_local14:animateToState( "default" )
			f51_local15:registerAnimationState( "default", {
				width = f51_local24,
				left = f51_local15.leftOffset - f51_local24 / 2
			} )
			f51_local15:animateToState( "default" )
		end
		f51_local26 = AAR.GetPrestigeLevel( f0_local59 )
		f51_local27 = Lobby.GetRankForXP( f0_local63, f51_local26 )
		f51_local28 = Rank.GetMaxRank( f51_local26 )
		if f51_local27 == f51_local28 and f51_local26 ~= Rank.GetMaxPrestigeLevel() then
			if f0_local63 == Rank.GetRankMaxXP( f51_local28 ) then
				local f51_local30 = RegisterMaterial( Rank.GetRankIcon( f51_local4, f51_local26 + 1, f0_local38 ) )
				f51_local20:setAlpha( 1 )
				f51_local18:setAlpha( 1 )
				f51_local20.lockedIcon:animateToState( "disabled" )
				f51_local9:setImage( f51_local30 )
				f51_local10:setImage( f51_local30 )
				f51_local11:setImage( f51_local30 )
			end
		else
			if f51_local27 == f51_local28 and f51_local26 == Rank.GetMaxPrestigeLevel() then
				f51_local20:setImage( RegisterMaterial( Rank.GetRankIcon( f51_local4, f51_local26, f0_local38 ) ) )
			end
			f51_local18:registerAnimationState( "default", {
				width = f51_local18.width,
				left = f51_local18.leftOffset - f51_local25 / 2
			} )
			f51_local18:animateToState( "default" )
			f51_local19:registerAnimationState( "default", {
				width = f51_local25,
				left = f51_local19.leftOffset - f51_local25 / 2
			} )
			f51_local19:animateToState( "default" )
		end
	else
		f0_local70 = true
	end
	SetGlitchRankPos( f51_arg1, "textGlitch1", -50 )
	SetGlitchRankPos( f51_arg1, "textGlitch2", -50 )
	SetGlitchRankPos( f51_arg1, "textGlitch3", 68 )
	SetGlitchRankPos( f51_arg1, "textGlitch4", 168 )
	SetGlitchRankPos( f51_arg1, "textGlitch5", 360 )
	SetGlitchRankPos( f51_arg1, "textGlitch6", 340 )
	SetGlitchUnlockPos( f51_arg1, "textGlitch1", -125, -40 )
	SetGlitchUnlockPos( f51_arg1, "textGlitch2", -25, -10 )
	SetGlitchUnlockPos( f51_arg1, "textGlitch3", -145, -115 )
	SetGlitchUnlockPos( f51_arg1, "textGlitch4", -35, -115 )
	SetGlitchUnlockPos( f51_arg1, "textGlitch5", 50, -100 )
	SetGlitchUnlockPos( f51_arg1, "textGlitch6", -30, 15 )
	f51_local26 = f51_arg1.childRecord.bgRectContainer
	f51_local26.width = f0_local69
	f51_local26:registerAnimationState( "newWidth", {
		width = f0_local69
	} )
	f51_local26:animateToState( "newWidth", 0 )
end

function AnimateUnlocks( f52_arg0 )
	f0_local57 = f0_local57 / f0_local42
	if not f0_local25 then
		f52_arg0.unlockSoundIdx = Engine.PlaySound( f0_local19 )
		f0_local24 = f52_arg0.unlockSoundIdx
	end
	local f52_local0 = f52_arg0.childRecord.itemUnlock
	local f52_local1 = f52_arg0.childRecord.largeItemUnlock
	local f52_local2 = f52_arg0.childRecord.itemUnlockName
	local f52_local3 = f52_arg0.childRecord.unlockedText
	f52_local1:animateInSequence( {
		{
			"topLeft"
		},
		{
			"topLeft",
			f0_local57
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57 * 5
		},
		{
			"bot"
		},
		{
			"bot",
			f0_local57
		},
		{
			"disabled"
		}
	} )
	f52_arg0:delayCallFunc( f0_local57 * 3, function ()
		f52_local0:animateInSequence( {
			{
				"faded"
			},
			{
				"faded",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57
			},
			{
				"faded"
			},
			{
				"faded",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 7
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 9
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 64
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57
			}
		} )
	end )
	f52_arg0:delayCallFunc( f0_local57 * 112, function ()
		local f54_local0 = 3
		f52_local0:animateToState( "flyout", f0_local57 * f54_local0 )
		f52_local2:animateToState( "flyin", f0_local57 * f54_local0 )
		f52_local3:animateToState( "flyin", f0_local57 * f54_local0 )
	end )
	f52_arg0:delayCallFunc( f0_local57 * 14, function ()
		f52_local2:animateInSequence( {
			{
				"enabled",
				f0_local57 * 21
			},
			{
				"enabled",
				f0_local57 * 6
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"faded"
			},
			{
				"faded",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 60
			},
			{
				"disabled",
				f0_local57 * 19
			}
		} )
		f52_local3:animateInSequence( {
			{
				"enabled",
				f0_local57 * 21
			},
			{
				"enabled",
				f0_local57 * 6
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"faded"
			},
			{
				"faded",
				f0_local57
			},
			{
				"enabled"
			},
			{
				"enabled",
				f0_local57 * 60
			},
			{
				"disabled",
				f0_local57 * 19
			}
		} )
	end )
	local f52_local4 = f52_arg0.childRecord.textGlitch1
	local f52_local5 = f52_arg0.childRecord.textGlitch2
	local f52_local6 = f52_arg0.childRecord.textGlitch3
	local f52_local7 = f52_arg0.childRecord.textGlitch4
	local f52_local8 = f52_arg0.childRecord.textGlitch5
	local f52_local9 = f52_arg0.childRecord.textGlitch6
	f52_arg0:delayCallFunc( f0_local57 * 2, function ()
		f52_local7:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 2
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57 * 2
			},
			{
				"unlockEnabled"
			},
			{
				"disabled",
				f0_local57 * 4
			}
		} )
	end )
	f52_arg0:delayCallFunc( f0_local57 * 3, function ()
		f52_local6:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 4
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57 * 2
			},
			{
				"unlockEnabled"
			},
			{
				"disabled",
				f0_local57 * 5
			}
		} )
		f52_local8:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 2
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			}
		} )
		f52_local4:animateInSequence( {
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57 * 3
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"unlockEnabled",
				f0_local57
			},
			{
				"disabled"
			},
			{
				"disabled",
				f0_local57
			},
			{
				"unlockEnabled"
			},
			{
				"disabled",
				f0_local57 * 6
			}
		} )
	end )
	f52_local5:animateInSequence( {
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57 * 4
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57
		},
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57 * 2
		},
		{
			"unlockEnabled"
		},
		{
			"disabled",
			f0_local57 * 5
		}
	} )
	f52_local9:animateInSequence( {
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57 * 4
		},
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57
		},
		{
			"disabled"
		},
		{
			"disabled",
			f0_local57
		},
		{
			"unlockEnabled"
		},
		{
			"unlockEnabled",
			f0_local57 * 2
		},
		{
			"disabled"
		}
	} )
	f0_local57 = f0_local57 * f0_local42
end

function AnimateRankUp( f58_arg0 )
	local f58_local0 = f58_arg0.childRecord.greenFlashRect
	local f58_local1 = f0_local57 * 0.33
	local f58_local2 = 6
	local f58_local3 = {}
	local f58_local4 = -(f0_local69 / 2) - f58_local0.width - 3
	for f58_local5 = 1, f58_local2, 1 do
		local f58_local8 = f58_local5
		table.insert( f58_local3, {
			"enabled",
			0
		} )
		table.insert( f58_local3, {
			"enabled",
			f0_local57
		} )
		table.insert( f58_local3, {
			"transparent",
			0
		} )
		table.insert( f58_local3, {
			"transparent",
			f0_local57
		} )
	end
	table.insert( f58_local3, {
		"disabled",
		f58_local1
	} )
	f58_local0:registerAnimationState( "flashInit", {
		left = f58_local4,
		right = f58_local4 + f58_local0.width
	} )
	f58_local0:animateToState( "flashInit", 0 )
	f58_local0:animateInSequence( f58_local3 )
	local f58_local6 = f0_local57 * 2 * (f58_local2 - 2)
	f58_arg0:delayCallFunc( f58_local6, function ()
		AnimateRevealRect( f58_arg0, "greenBgRect" )
	end )
	f58_arg0:delayCallFunc( f58_local6 + f0_local57 * 3, function ()
		f58_arg0.childRecord.textGlitch1:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57 * 5
			},
			{
				"disabled",
				0
			}
		} )
	end )
	local f58_local8 = f58_local6 + f0_local57 * 7
	f58_arg0:delayCallFunc( f58_local8, function ()
		f58_arg0:delayCallFunc( AnimateRevealRect( f58_arg0, "greenTextHideRect" ), function ()
			local f62_local0 = f58_arg0.childRecord.bgRectContainer
			local f62_local1 = f62_local0.childRecord.greenTextHideRect
			local f62_local2 = f62_local0.childRecord.rankUpNum
			local f62_local3 = f62_local0.childRecord.rankUpText
			local f62_local4 = f62_local0.childRecord.prestigeUnlockedNum
			local f62_local5 = f62_local0.childRecord.prestigeUnlockedText
			local f62_local6 = AAR.GetPrestigeLevel( f0_local59 )
			local f62_local7 = Lobby.GetRankForXP( f0_local63, f62_local6 )
			if f0_local63 ~= Rank.GetRankMaxXP( Rank.GetMaxRank( f62_local6 ) ) then
				f62_local2:animateToState( "enabled" )
				f62_local3:animateToState( "enabled" )
				f62_local4:animateToState( "disabled" )
				f62_local5:animateToState( "disabled" )
			else
				f62_local2:animateToState( "disabled" )
				f62_local3:animateToState( "disabled" )
				f62_local4:animateToState( "enabled" )
				f62_local5:animateToState( "enabled" )
			end
			local f62_local8 = f62_local1.defState.width
			f62_local1:registerAnimationState( "animate", {
				width = f62_local8 - 7,
				leftAnchor = false,
				rightAnchor = true
			} )
			f62_local1:animateToState( "animate", f0_local57 * 2 )
			f58_arg0:delayCallFunc( f0_local57 * 2, function ()
				f62_local1:registerAnimationState( "animate", {
					width = f62_local8 / 2,
					leftAnchor = false,
					rightAnchor = true
				} )
				f62_local1:animateToState( "animate" )
			end )
			f58_arg0:delayCallFunc( f0_local57 * 3, function ()
				f62_local1:registerAnimationState( "animate", {
					width = 1,
					leftAnchor = false,
					rightAnchor = true
				} )
				f62_local1:animateToState( "animate" )
			end )
			f58_arg0:delayCallFunc( f0_local57 * 4, function ()
				f62_local1:registerAnimationState( "animate", {
					width = 0,
					leftAnchor = false,
					rightAnchor = true
				} )
				f62_local1:animateToState( "animate" )
			end )
			f58_arg0:delayCallFunc( f0_local57 * 7, function ()
				AnimateRevealRect( f58_arg0, "blackBgRect" )
			end )
		end )
	end )
	f58_arg0:delayCallFunc( f58_local8 + f0_local57, function ()
		f58_arg0.childRecord.largeRankedUpText:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"disabled",
				f0_local57 * 7
			}
		} )
		f58_arg0.childRecord.smallRankedUpText:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57 * 2
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			}
		} )
	end )
	local f58_local9 = f58_local8 + f0_local57 * 15
	f58_arg0:delayCallFunc( f58_local9, function ()
		local f68_local0 = f58_arg0.childRecord.rankUpIcon
		local f68_local1 = f68_local0.childRecord.medRankUpIcon
		f68_local0:animateToState( "initMoveFade", f0_local57 * 4 )
		f58_arg0:delayCallFunc( f0_local57 * 4, function ()
			f68_local0:animateInSequence( {
				{
					"enabled",
					0
				},
				{
					"enabled",
					f0_local57
				},
				{
					"disabled",
					0
				},
				{
					"disabled",
					f0_local57
				},
				{
					"enabled",
					0
				},
				{
					"enabled",
					f0_local57
				},
				{
					"moveToCenter",
					f0_local57 * 15
				}
			} )
			f68_local1:animateInSequence( {
				{
					"enabled",
					0
				},
				{
					"enabled",
					f0_local57
				},
				{
					"disabled",
					0
				},
				{
					"disabled",
					f0_local57 * 3
				},
				{
					"left",
					0
				},
				{
					"left",
					f0_local57
				},
				{
					"disabled",
					0
				},
				{
					"disabled",
					f0_local57
				},
				{
					"right",
					0
				},
				{
					"right",
					f0_local57
				},
				{
					"disabled",
					0
				},
				{
					"disabled",
					f0_local57 * 15
				},
				{
					"enabled",
					0
				},
				{
					"slightlyFaded",
					f0_local57 * 3
				},
				{
					"veryFaded",
					0
				},
				{
					"veryFaded",
					f0_local57
				},
				{
					"faded",
					f0_local57 * 3
				},
				{
					"veryFaded",
					0
				},
				{
					"veryFaded",
					f0_local57
				},
				{
					"disabled",
					0
				}
			} )
		end )
		f58_arg0:delayCallFunc( f0_local57 * 29, function ()
			f68_local0:registerAnimationState( "flyout", {
				alpha = 0,
				scale = 2
			} )
			f68_local0:animateToState( "flyout", f0_local57 * 3 )
			f58_arg0.childRecord.rankUpIconBgStencil.childRecord.rankUpIconBg:animateToState( "disabled", f0_local57 * 8 )
			f58_arg0:delayCallFunc( f0_local57 * 2, function ()
				local f71_local0 = f58_arg0.childRecord.bgRectContainer
				local f71_local1 = f71_local0.childRecord.blackBgRect
				f71_local1:registerAnimationState( "shrinkWidth", {
					width = f71_local0.width - 50
				} )
				f71_local1:animateToState( "shrinkWidth", f0_local57 * 3 )
				f58_arg0:delayCallFunc( f0_local57 * 3, function ()
					f71_local0:animateToState( "disabled", 0 )
					f58_arg0:delayCallFunc( f0_local57 * 5, function ()
						local f73_local0 = AAR.GetPrestigeLevel( f0_local59 )
						local f73_local1 = Lobby.GetRankForXP( f0_local63, f73_local0 )
						local f73_local2 = Rank.GetMaxRank( f73_local0 )
						if Rank.GetRankMaxXP( f73_local2 ) <= f0_local63 and f73_local1 == f73_local2 and f73_local0 ~= Rank.GetMaxPrestigeLevel() then
							
						elseif f0_local64[f73_local1] and f0_local64[f73_local1].typeCount > 0 then
							AnimateUnlocks( f58_arg0 )
						end
					end )
				end )
			end )
		end )
	end )
	f58_arg0:registerEventHandler( "resetRankUp", function ( element, event )
		ResetAllAnimationAssets( element )
	end )
	AddTimer( f58_arg0, f58_local9 + f0_local57 * 39, "resetRankUp", nil, false )
	local f58_local10 = f58_local8 + f0_local57 * 5
	f58_arg0:delayCallFunc( f58_local10, function ()
		f58_arg0.childRecord.textGlitch2:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"disabled",
				f0_local57 * 3
			}
		} )
		f58_arg0.childRecord.textGlitch3:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"disabled",
				f0_local57 * 8
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"disabled",
				f0_local57 * 7
			}
		} )
		f58_arg0.childRecord.textGlitch4:animateInSequence( {
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57 * 3
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"disabled",
				f0_local57 * 4
			}
		} )
		f58_arg0.childRecord.textGlitch5:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"disabled",
				f0_local57 * 13
			}
		} )
		f58_arg0.childRecord.textGlitch6:animateInSequence( {
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			},
			{
				"enabled",
				0
			},
			{
				"enabled",
				f0_local57
			},
			{
				"disabled",
				0
			},
			{
				"disabled",
				f0_local57
			}
		} )
	end )
	f58_arg0:delayCallFunc( f58_local10 + f0_local57 * 6, function ()
		local f76_local0 = f58_arg0.childRecord.rankUpIconBgStencil.childRecord.rankUpIconBg
		local f76_local1 = f0_local57 * 5
		f76_local0:animateToState( "enabled", f76_local1 )
		f58_arg0:delayCallFunc( f76_local1, function ()
			f76_local0:animateToState( "moveToCenter", f0_local57 * 27 )
		end )
	end )
end

function SetGlitchRankPos( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = f78_arg0.childRecord[f78_arg1]
	f78_local0.defState.left = -203 + f78_arg2 + f0_local68 / 2
	f78_local0:registerAnimationState( "rankPos", f78_local0.defState )
	f78_local0:animateToState( "rankPos" )
end

function SetGlitchUnlockPos( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 )
	local f79_local0 = f79_arg0.childRecord[f79_arg1]
	f79_local0:registerAnimationState( "unlockEnabled", {
		alpha = 1,
		left = f79_arg2,
		top = f79_arg3,
		width = f79_local0.defState.width * (f79_arg4 or 1),
		height = f79_local0.defState.height
	} )
end

function OnAnimateFinishedDepotCredits( f80_arg0 )
	f80_arg0.container.depotCreditImage:animateToState( "disabled", f0_local57 * 4 )
	f80_arg0.container.depotCreditProgressBar:animateToState( "down", f0_local57 * 4 )
	f80_arg0.container.depotCreditsText:animateToState( "down", f0_local57 * 4 )
	f80_arg0.container.earnedText:animateToState( "down", f0_local57 * 4 )
	f80_arg0.container.currDepotCreditNum:animateToState( "fade", f0_local57 * 4 )
	f80_arg0.container.nextDepotCreditNum:animateToState( "fade", f0_local57 * 4 )
	f80_arg0.container.depotCreditNumBg:animateToState( "disabled", f0_local57 * 4 )
	f80_arg0.container:delayCallFunc( f0_local57 * 8, function ()
		f80_arg0.container:processEvent( {
			name = "bonusLootAnimationsFinished"
		} )
	end )
end

function OnAnimateEarnedCredits( f82_arg0 )
	if f82_arg0.numEarnedCredits <= 1 then
		f82_arg0.container.currDepotCreditNum:setText( f82_arg0.numEarnedCredits )
		f82_arg0.container.currDepotCreditNum:animateInSequence( {
			{
				"large",
				f0_local57 * 4
			},
			{
				"enabled",
				f0_local57 * 2
			}
		} )
	else
		f82_arg0.container.currDepotCreditNum:animateToState( "disabled", f0_local57 * 6 )
		f82_arg0.container.nextDepotCreditNum:setText( f82_arg0.numEarnedCredits )
		f82_arg0.container.nextDepotCreditNum:animateInSequence( {
			{
				"large",
				f0_local57 * 4
			},
			{
				"enabled",
				f0_local57 * 2
			}
		} )
		f82_arg0.container:delayCallFunc( f0_local57 * 6, function ()
			f82_arg0.container.currDepotCreditNum:setText( f82_arg0.numEarnedCredits )
			f82_arg0.container.currDepotCreditNum:animateToState( "enabled" )
			f82_arg0.container.nextDepotCreditNum:animateToState( "disabled" )
		end )
	end
	f82_arg0.container.depotCreditNumBg:animateToState( "enabled", f0_local57 * 2 )
end

function OnBonusLootAnimationsFinished( f84_arg0, f84_arg1 )
	f84_arg0:animateToState( "disabled", f0_local43 )
	f84_arg0:delayCallFunc( f0_local43, function ()
		f0_local58:processEvent( {
			name = "CloseRoot"
		} )
	end )
end

function OnRankUp( f86_arg0, f86_arg1 )
	if f0_local22 then
		Engine.StopSound( f0_local22 )
	end
	if not f0_local25 then
		f86_arg0.rankUpSoundIdx = Engine.PlaySound( f0_local21 )
		f0_local23 = f86_arg0.rankUpSoundIdx
	end
	local f86_local0 = f86_arg0.childRecord.rankUpContainer
	InitRankUpAnimationAssets( f86_arg0, f86_local0 )
	f86_local0:animateToState( "enabled", f0_local45 )
	Engine.PlayMenuVideo( "AAR_RankUp", 0, true )
	f86_arg0:registerEventHandler( "animateRankUp", function ( element, event )
		AnimateRankUp( f86_local0 )
	end )
	AddTimer( f86_arg0, 0.5 * f0_local40, "animateRankUp", nil, false )
	local f86_local1 = AAR.GetPrestigeLevel( f0_local59 )
	local f86_local2 = Lobby.GetRankForXP( f0_local63, f86_local1 )
	local f86_local3 = Rank.GetMaxRank( f86_local1 )
	if f0_local63 == Rank.GetRankMaxXP( f86_local3 ) or f86_local1 == Rank.GetMaxPrestigeLevel() and f86_local2 == f86_local3 then
		f0_local70 = true
	end
	local f86_local4 = 3.5
	local f86_local5 = f86_local4 + 4.5 / f0_local42
	local f86_local6 = AAR.GetPrestigeLevel( f0_local59 )
	local f86_local7 = Lobby.GetRankForXP( f0_local63, f86_local6 )
	local f86_local8 = Rank.GetMaxRank( f86_local6 )
	if not f0_local64[f86_local7] or f0_local64[f86_local7].typeCount <= 0 or Rank.GetRankMaxXP( f86_local8 ) <= f0_local63 and f86_local7 == f86_local8 and f86_local6 ~= Rank.GetMaxPrestigeLevel() then
		f86_local5 = f86_local4
	end
	local f86_local9 = Rank.GetRankMaxXP( f86_local7 - 1 ) - Rank.GetRankMinXP( f86_local7 - 1 )
	f86_arg0.pTrackingText:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f86_local9, f86_local9 ) )
	AddTimer( f86_arg0, f86_local5 * f0_local40, "CloseRankUp", "closeRankUpTimer" )
end

function OnDisableAnimatingXpBarAsset( f88_arg0, f88_arg1 )
	
end

function OnMoveToNextXpStat( f89_arg0, f89_arg1 )
	if #f0_local62 < f0_local61 or f0_local70 then
		AnimateBonusLootAnimations( f89_arg0 )
		return 
	end
	local f89_local0 = f0_local62[f0_local61].value
	if f89_local0 ~= 0 then
		AnimateXpBar( f89_arg0, f89_local0 )
	end
end

function OnCloseRoot( f90_arg0, f90_arg1 )
	local f90_local0 = f0_local40 / 4
	f90_arg0:registerAnimationState( "closing", CoD.CreateState( nil, 10, nil, nil, CoD.AnchorTypes.TopLeft ) )
	f90_arg0:animateToState( "closing", f90_local0, true, false )
	local f90_local1 = f90_arg0.childRecord.xpBreakdownContainer
	if f90_local1.supplyDropContainer then
		f90_local1.supplyDropContainer:animateToState( "enabled", f90_local0 )
	end
	f90_arg0.childRecord.matchBreakdownContainer:delayCallFunc( f90_local0, function ()
		REG4:animateToState( "slideDown", f90_local0, true, false )
	end )
end

function OnResetXpBar( f92_arg0, f92_arg1 )
	local f92_local0 = f92_arg0.childRecord.xpBar.childRecord.xpBarEmpty.childRecord.xpBarFill
	local f92_local1 = f92_local0.defState
	local f92_local2 = Engine.Localize( "@LUA_MENU_LEVEL_CAPS" )
	local f92_local3 = AAR.GetPrestigeLevel( f0_local59 )
	local f92_local4 = AAR.GetRankForXP( f0_local63, f92_local3 )
	local f92_local5 = AAR.GetRankForXP( f0_local63 + Rank.GetRankXPToNext( f92_local4 ) - f0_local63 - Rank.GetRankMinXP( f92_local4 ), f92_local3 )
	local f92_local6 = RegisterMaterial( Rank.GetRankIcon( f92_local4, f92_local3, f0_local39 ) )
	local f92_local7 = Rank.GetRankDisplay( f92_local4 )
	f92_arg0.pTrackingText:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", 0, Rank.GetRankMaxXP( f92_local4 ) - Rank.GetRankMinXP( f92_local4 ) ) )
	local f92_local8 = f92_arg0.childRecord.rankContainerLeft
	local f92_local9 = f92_local8.childRecord.rankTextLeft
	local f92_local10 = f92_local8.childRecord.rankNumLeft
	local f92_local11 = f92_local8.childRecord.rankIconLeft
	local f92_local12 = f92_arg0.childRecord.rankContainerRight
	local f92_local13 = f92_local12.childRecord.rankTextRight
	local f92_local14 = f92_local12.childRecord.rankNumRight
	local f92_local15 = f92_local12.childRecord.rankIconRight
	local f92_local16, f92_local17, f92_local18, f92_local19 = GetTextDimensions( f92_local2 .. " " .. f92_local7, f0_local6.Font, f0_local6.Height )
	f0_local69 = f92_local18 - f92_local16
	local f92_local20, f92_local21, f92_local22, f92_local23 = GetTextDimensions( f92_local7, f0_local3.Font, f0_local3.Height )
	f92_local19 = f92_local23
	f92_local18 = f92_local22
	f92_local17 = f92_local21
	f92_local20 = f92_local18 - f92_local20
	local f92_local21, f92_local22, f92_local23, f92_local24 = GetTextDimensions( Rank.GetRankDisplay( f92_local5 ), f0_local3.Font, f0_local3.Height )
	f92_local19 = f92_local24
	f92_local18 = f92_local23
	f92_local17 = f92_local22
	f92_local21 = f92_local18 - f92_local21
	if f92_local4 <= Rank.GetMaxRank( f92_local3 ) then
		f92_local10:setText( f92_local7 )
		f92_local11:setImage( f92_local6 )
		f92_local22 = AAR.GetPrestigeLevel( f0_local59 )
		if Lobby.GetRankForXP( f0_local63, f92_local22 ) == Rank.GetMaxRank( f92_local22 ) and f92_local22 ~= Rank.GetMaxPrestigeLevel() then
			f92_local13:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PRESTIGE" ) ) .. " " .. f92_local22 + 1 )
			f92_local13:setAlpha( 0.25 )
			f92_local13.defState.left = nil
			f92_local13.defState.width = f92_local13.parentWidth
			f92_local13.defState.alignment = LUI.Alignment.Center
			f92_local13:registerAnimationState( "centered", f92_local13.defState )
			f92_local13:animateToState( "centered" )
			f92_local14:setAlpha( 0 )
			local f92_local25 = RegisterMaterial( Rank.GetRankIcon( f92_local5, f92_local22 + 1, f0_local39 ) )
			f92_local15:setAlpha( 0.25 )
			f92_local15.lockedIcon:animateToState( "enabled" )
			f92_local15:setImage( f92_local25 )
		else
			f92_local14:setText( Rank.GetRankDisplay( f92_local5 ) )
			f92_local15:setImage( RegisterMaterial( Rank.GetRankIcon( f92_local5, f92_local22, f0_local39 ) ) )
		end
	end
	f92_local1.width = 0
	f92_local0:registerAnimationState( "default", f92_local1 )
	f92_local0:animateToState( "default" )
end

function OnCloseRankUp( f93_arg0, f93_arg1 )
	local f93_local0 = f93_arg0.childRecord.rankUpContainer
	local f93_local1 = f0_local40 / 2
	f93_local0:animateToState( "disabled", f93_local1 )
	AddTimer( f93_arg0, f93_local1 * 2, "ContinueAddingXpToXpBar", "xpBarContinueTimer" )
	if not f0_local70 then
		AddTimer( f93_arg0, f93_local1, "ResetXpBar", "resetXpBarTimer" )
	end
end

LUI.AARProgress.SetSoundsDisabled = function ( f94_arg0 )
	f0_local25 = f94_arg0
end

LUI.AARProgress.GetTabLabel = function ()
	return "@MPUI_PROGRESS"
end

LUI.AARProgress.new = function ( f96_arg0, f96_arg1 )
	LUI.AARProgress.SetSoundsDisabled( false )
	Engine.PlaySound( f0_local18 )
	f0_local61 = 1
	f0_local65 = 0
	f0_local66 = 0
	f0_local67 = 0
	for f96_local3, f96_local4 in pairs( f0_local62 ) do
		f0_local62[f96_local3] = nil
	end
	f96_local0 = f96_arg1.controller
	if not f96_local0 then
		f96_local0 = Engine.GetFirstActiveController()
	end
	f0_local59 = f96_local0
	f0_local60 = AAR.GetLocalPlayer( f0_local59 )
	f96_local0 = AAR.GetCareerExperience( f0_local59 )
	f96_local1 = AAR.GetPrestigeLevel( f0_local59 )
	f96_local2 = Rank.GetMaxRank( f96_local1 )
	f96_local3 = Rank.GetRankMaxXP( f96_local2 )
	f0_local63 = f96_local0 - AAR.GetRoundTotalXP( f0_local59 )
	if f96_local3 <= f0_local63 or f96_local1 == Rank.GetMaxPrestigeLevel() and AAR.GetRankForXP( f0_local63, f96_local1 ) == f96_local2 then
		f0_local63 = f96_local3 - 2
		f0_local70 = true
	else
		f0_local70 = false
	end
	local f96_local5 = AAR.GetItemsUnlockedLastGame( f0_local59 )
	f0_local64 = {}
	for f96_local9, f96_local10 in ipairs( f96_local5 ) do
		if f96_local10.Rank ~= nil and f96_local10.Rank ~= 0 and (f96_local10.Type == LUI.InventoryUtils.UnlockTypes.PERK or f96_local10.Type == LUI.InventoryUtils.UnlockTypes.WEAPON) then
			if not f0_local64[f96_local10.Rank] then
				f0_local64[f96_local10.Rank] = {}
				f0_local64[f96_local10.Rank].typeCount = 0
			end
			if f0_local64[f96_local10.Rank] and not f0_local64[f96_local10.Rank][f96_local10.Type] then
				f0_local64[f96_local10.Rank][f96_local10.Type] = {}
				f0_local64[f96_local10.Rank].typeCount = f0_local64[f96_local10.Rank].typeCount + 1
			end
			table.insert( f0_local64[f96_local10.Rank][f96_local10.Type], f96_local10 )
		end
	end
	f96_local7 = CoD.CreateState( nil, 80, nil, nil, CoD.AnchorTypes.TopLeft )
	f96_local7.alpha = 0
	self = LUI.UIElement.new( f96_local7 )
	self.id = "AARProgressRoot"
	self:setClass( LUI.AARProgress )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerEventHandler( "CloseRoot", OnCloseRoot )
	self:animateToState( "enabled", f0_local40 )
	f0_local58 = self
	AddXPBreakdownContainer( self )
	AddMatchBreakdownContainer( self )
	AnimateAARProgress( self )
	return self
end

LUI.MenuBuilder.registerType( "aarProgress", LUI.AARProgress.new )
LockTable( _M )
