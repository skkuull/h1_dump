LUI.ChallengeCard = InheritFrom( LUI.UIElement )
LUI.ChallengeCard.GridRowHeight = 220
LUI.ChallengeCard.GridItemWidth = 135
LUI.ChallengeCard.XPYellow = {
	r = 0.92,
	g = 0.67,
	b = 0.2
}
LUI.ChallengeCard.handleButtonSelect = function ( f1_arg0 )
	f1_arg0.wasLastClicked = true
	doCardTransition( f1_arg0, true )
end

function doCardTransition( f2_arg0, f2_arg1 )
	f2_arg0.vList:animateToState( "hide" )
	f2_arg0.rewardVList:animateToState( "hide" )
	if f2_arg1 then
		if f2_arg0.currentTierIdx == f2_arg0.challengeData.NumTiers then
			f2_arg0.currentTierIdx = 1
		else
			f2_arg0.currentTierIdx = f2_arg0.currentTierIdx + 1
		end
	else
		f2_arg0.currentTierIdx = f2_arg0.realTier
	end
	updateCardDataWithTier( f2_arg0, f2_arg1, f2_arg0.currentTierIdx )
	f2_arg0.vList:animateToState( "show", 200 )
	f2_arg0.rewardVList:animateToState( "show", 200 )
	if f2_arg1 then
		f2_arg0.border:animateToState( "focus" )
	end
end

LUI.ChallengeCard.handleButtonUp = function ( f3_arg0 )
	if not f3_arg0.wasLastClicked then
		return 
	elseif f3_arg0.currentTierIdx == f3_arg0.realTier then
		return 
	else
		doCardTransition( f3_arg0, false )
		f3_arg0.wasLastClicked = false
	end
end

function completedState( f4_arg0 )
	f4_arg0.padlock:animateToState( "hide", 0 )
	f4_arg0.lockHolder:animateToState( "hide" )
end

function activeState( f5_arg0, f5_arg1 )
	if f5_arg0.locked then
		f5_arg0.lockHolder:animateToState( "show" )
		f5_arg0.padlock:animateToState( "hide", 0 )
		if f5_arg1 then
			f5_arg0.padlock:animateToState( "show", 200 )
		else
			f5_arg0.padlock:animateToState( "show", 0 )
		end
	else
		f5_arg0.lockHolder:animateToState( "hide", 0 )
	end
end

function futureState( f6_arg0 )
	f6_arg0.padlock:animateToState( "hide", 0 )
	f6_arg0.lockHolder:animateToState( "show" )
	f6_arg0.padlock:animateToState( "show", 200 )
end

function updateCardDataWithTier( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = GetChallengeData( f7_arg0.controller, f7_arg0.challengeData.Ref, nil, nil, f7_arg2 )
	f7_arg0.nameText:setText( f7_local0.Name )
	local f7_local1 = nil
	local f7_local2 = f7_local0.Target
	f7_local1 = f7_local0.Progress
	local f7_local3 = 0
	if f7_local2 and f7_local2 > 0 then
		if f7_local2 < f7_local1 then
			f7_local1 = f7_local2
		end
		f7_local3 = f7_local1 / f7_local2
	end
	if f7_arg2 < f7_arg0.realTier then
		f7_arg0.rewardHeaderText:setText( Engine.Localize( "@LUA_MENU_AWARDED" ) )
		completedState( f7_arg0 )
		f7_arg0.rewardHeaderText:animateToState( "green" )
	elseif f7_arg2 == f7_arg0.realTier then
		activeState( f7_arg0, f7_arg1 )
		if f7_local0.Target <= f7_local0.Progress then
			f7_arg0.rewardHeaderText:setText( Engine.Localize( "@LUA_MENU_AWARDED" ) )
			f7_arg0.rewardHeaderText:animateToState( "green" )
		else
			f7_arg0.rewardHeaderText:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_REWARD" ) ) )
			f7_arg0.rewardHeaderText:animateToState( "white" )
		end
	elseif f7_arg0.realTier < f7_arg2 then
		f7_arg0.rewardHeaderText:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_REWARD" ) ) )
		futureState( f7_arg0 )
		if f7_arg1 and not f7_arg0.locked then
			f7_arg0.lockTextElement:setText( Engine.Localize( "@LUA_MENU_UNLOCKED_BY_COMPLETING_TIER", f7_arg2 - 1 ) )
		end
		f7_arg0.rewardHeaderText:animateToState( "white" )
	end
	f7_arg0.progressText:setText( Engine.Localize( "@MPUI_X_SLASH_Y", f7_local1, f7_local2 ) )
	f7_arg0.progressFill:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f7_local3 * f7_arg0.progressBarWidth,
		color = Colors.h1.light_grey
	} )
	f7_arg0.progressFill:animateToState( "default", 200 )
	local f7_local4 = f7_local0.RewardImage
	if f7_arg0.rewardNameText and f7_local0.RewardName ~= nil and f7_local0.RewardName ~= "" then
		f7_arg0.rewardNameText:setText( Engine.ToUpperCase( f7_local0.RewardName ) )
	end
	local f7_local5 = f7_local0.RewardXP
	local f7_local6 = Engine.Localize( "@LUA_MENU_PLUS_CHALLENGE_XP", f7_local0.RewardXP )
	if not f7_local4 then
		f7_local4 = RegisterMaterial( "ui_reward_xp" )
		f7_local6 = Engine.Localize( "@LUA_MENU_CHALLENGE_XP", f7_local0.RewardXP )
	end
	local f7_local7 = nil
	if f7_local0.RewardType == "title" then
		f7_local7 = 30
	else
		f7_local7 = 45
	end
	local f7_local8 = nil
	if f7_local0.animatedTable ~= nil then
		f7_local8 = LUI.Playercard.CreateAnimatedCallingCard( f7_local0.animatedTable, f7_local7 )
		if f7_local8 then
			f7_local4 = RegisterMaterial( "black" )
		end
	end
	local f7_local9, f7_local10 = GetMaterialDimensions( f7_local4 )
	f7_arg0.rewardUIImage:registerAnimationState( "updateImage", {
		height = f7_local7,
		width = f7_local7 * f7_local9 / f7_local10,
		material = f7_local4,
		topAnchor = true
	} )
	f7_arg0.rewardUIImage:animateToState( "updateImage" )
	if f7_arg0.rewardUIImage.animImg ~= nil then
		f7_arg0.rewardUIImage:removeElement( f7_arg0.rewardUIImage.animImg )
		f7_arg0.rewardUIImage.animImg = nil
	end
	if f7_local8 ~= nil then
		f7_arg0.rewardUIImage:addElement( f7_local8 )
		f7_arg0.rewardUIImage.animImg = f7_local8
	end
	if f7_local0.RewardXP == 0 then
		f7_arg0.xpText:animateToState( "hide" )
	else
		f7_arg0.xpText:animateToState( "show" )
	end
	f7_arg0.xpText:setText( f7_local6 )
	f7_arg0.tierHList:closeChildren()
	for f7_local11 = 1, f7_local0.NumTiers, 1 do
		local self = nil
		local f7_local15 = {
			width = 5,
			height = 5,
			color = Colors.mw1_green,
			material = RegisterMaterial( "white" )
		}
		if f7_local11 <= f7_local0.ActiveTier then
			self = LUI.UIImage.new( f7_local15 )
		else
			f7_local15.borderThickness = 1
			self = LUI.UIBorder.new( f7_local15 )
		end
		f7_arg0.tierHList:addElement( self )
	end
end

function isChallengeUnlockedByPrerequisite( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.GetPlayerDataMPXP( f8_arg1, CoD.StatsGroup.Ranked, "experience" )
	local f8_local1 = Lobby.GetPlayerPrestigeLevel( f8_arg1 )
	local f8_local2 = Lobby.GetRankForXP( f8_local0, f8_local1 )
	local f8_local3 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f8_arg0.Ref, AllChallengesTable.Cols.UnlockLevel )
	if f8_local3 ~= nil and f8_local3 ~= "" and f8_local3 ~= 0 and tonumber( f8_local3 ) <= f8_local2 then
		return true
	end
	local f8_local4 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f8_arg0.Ref, AllChallengesTable.Cols.ChallengeUnlock )
	if f8_local4 ~= nil and f8_local4 ~= "" then
		local f8_local5 = GetChallengeData( f8_arg1, f8_local4, nil, nil, nil, true )
		local f8_local6 = {
			AllChallengesTable.Cols.Target1,
			AllChallengesTable.Cols.Target2,
			AllChallengesTable.Cols.Target3,
			AllChallengesTable.Cols.Target4,
			AllChallengesTable.Cols.Target5,
			AllChallengesTable.Cols.Target6,
			AllChallengesTable.Cols.Target7,
			AllChallengesTable.Cols.Target8,
			AllChallengesTable.Cols.Target9
		}
		local f8_local7 = nil
		for f8_local8 = 1, #f8_local6, 1 do
			local f8_local11 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f8_local4, f8_local6[f8_local8] )
			if f8_local11 ~= "" then
				if f8_local11 == nil then
					break
				end
				f8_local7 = f8_local11
			end
		end
		if tonumber( f8_local7 ) <= f8_local5.Progress then
			return true
		end
	end
	local f8_local5 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f8_arg0.Ref, AllChallengesTable.Cols.PrestigeUnlock )
	if f8_local5 ~= nil and f8_local5 ~= "" and tonumber( f8_local5 ) <= f8_local1 then
		return true
	end
	local f8_local6 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f8_arg0.Ref, AllChallengesTable.Cols.PrestigeShopUnlock )
	if f8_local6 ~= nil and f8_local6 ~= "" and Cac.IsItemPermanentlyUnlocked( f8_arg1, string.sub( f8_local6, string.len( "ch_prPurchase_" ) + 1 ) ) then
		return true
	end
	return false
end

LUI.ChallengeCard.new = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	if f9_arg1 and f9_arg1.ActiveTier == 0 then
		f9_arg1.ActiveTier = 1
	end
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	local self = LUI.UIButton.new( {
		leftAnchor = true,
		topAnchor = true,
		width = LUI.ChallengeCard.GridItemWidth,
		height = LUI.ChallengeCard.GridRowHeight
	} )
	self:setClass( LUI.ChallengeCard )
	local f9_local2 = 110
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		height = LUI.ChallengeCard.GridRowHeight - f9_local2,
		material = RegisterMaterial( "h1_challenge_card_background_top" )
	} ) )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		height = f9_local2,
		material = RegisterMaterial( "h1_challenge_card_background_bot" )
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		bottom = -f9_local2,
		alpha = 0.8,
		height = 1,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey
	} )
	self:addElement( self )
	self:addElement( self )
	local f9_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local5.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f9_local5 )
	self:setupTiles( 6 )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local self = LUI.UIBorder.new( {
		width = LUI.ChallengeCard.GridItemWidth + 4,
		height = LUI.ChallengeCard.GridRowHeight + 4,
		borderThickness = 1,
		material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" ),
		alpha = 0,
		color = Colors.mw1_green
	} )
	if f9_arg3 then
		self:addElement( self )
		self:addElement( self )
		self:registerAnimationState( "hideMe", {
			alpha = 0
		} )
		self:animateToState( "hideMe" )
		return self
	end
	self.controller = f9_arg0
	self.challengeData = f9_arg1
	self.realTier = f9_arg1.ActiveTier
	local f9_local8 = GetChallengeNameWithTier( f9_arg1.Ref, f9_arg1.ActiveTier )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		spacing = 1,
		top = 6
	} )
	self.id = "challengeDataVList"
	self.vList = self
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		height = 10,
		color = Colors.mw1_green,
		font = CoD.TextSettings.BodyFont.Font,
		width = 115,
		topAnchor = true
	} )
	self:setText( f9_local8 )
	self.nameText = self
	local self = LUI.UIElement.new( {
		height = 20,
		topAnchor = true
	} )
	self:addElement( self )
	local self = LUI.UIHorizontalList.new( {
		spacing = 5,
		alignment = LUI.Alignment.Center,
		height = 15
	} )
	for f9_local13 = 1, f9_arg1.NumTiers, 1 do
		local self = nil
		local self = {
			width = 5,
			height = 5,
			color = Colors.mw1_green,
			material = RegisterMaterial( "white" )
		}
		if f9_local13 <= f9_arg1.ActiveTier then
			self = LUI.UIImage.new( self )
		else
			self.borderThickness = 1
			self = LUI.UIBorder.new( self )
		end
		self:addElement( self )
	end
	self.tierHList = self
	local f9_local13 = 33
	local f9_local14, f9_local15 = GetMaterialDimensions( f9_arg1.Image )
	local self = LUI.UIImage.new( {
		height = f9_local13,
		width = f9_local13 * f9_local14 / f9_local15,
		material = f9_arg1.Image
	} )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		height = 25
	} )
	self:addElement( self )
	local f9_local18 = f9_arg1.Progress
	if not f9_local18 then
		f9_local18 = 0
	end
	local f9_local19 = 0
	local f9_local20 = f9_arg1.Target
	if f9_local20 < f9_local18 then
		f9_local18 = f9_local20
	end
	local self = LUI.UIText.new( {
		height = 15,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( Engine.Localize( "@MPUI_X_SLASH_Y", f9_local18, f9_local20 ) )
	self.progressText = self
	local self = LUI.UIElement.new( {
		topAnchor = true,
		height = 22
	} )
	self:addElement( self )
	local f9_local23 = 105
	local self = LUI.UIElement.new( {
		width = f9_local23,
		height = 9
	} )
	local f9_local25 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local25.color = Colors.black
	f9_local25.alpha = 0.3
	f9_local25.material = RegisterMaterial( "white" )
	local self = LUI.UIImage.new( f9_local25 )
	f9_local25 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local25.borderThickness = 1
	f9_local25.color = Colors.h1.medium_grey
	local self = LUI.UIBorder.new( f9_local25 )
	f9_local25 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f9_local25.material = RegisterMaterial( "white" )
	f9_local25.color = Colors.h1.light_grey
	local self = LUI.UIImage.new( f9_local25 )
	if f9_local20 and f9_local20 > 0 then
		f9_local19 = f9_local18 / f9_local20
	end
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f9_local19 * f9_local23,
		color = Colors.h1.light_grey
	} )
	self:animateToState( "default", 0 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self.progressFill = self
	self.progressBarWidth = f9_local23
	local f9_local29 = LUI.ChallengeCard.GridRowHeight - f9_local2 + 25
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self.id = "challengeGridItemButton_" .. f9_arg1.Ref
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		spacing = 6,
		top = LUI.ChallengeCard.GridRowHeight - f9_local2 + 8
	} )
	self.id = "rewardVList"
	self.rewardVList = self
	local self = LUI.UIElement.new( {
		width = LUI.ChallengeCard.GridItemWidth - 20,
		height = 15
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "white" ),
		color = {
			r = 0.11,
			g = 0.11,
			b = 0.11
		}
	} )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 3,
		height = 11,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:registerAnimationState( "white", {
		color = Colors.white
	} )
	self:registerAnimationState( "green", {
		color = Colors.mw1_green
	} )
	if f9_arg1.Target <= f9_arg1.Progress then
		self:setText( Engine.Localize( "@LUA_MENU_AWARDED" ) )
		self:animateToState( "green" )
	else
		self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_REWARD" ) ) )
	end
	self.rewardHeaderText = self
	self:addElement( self )
	self:addElement( self )
	local f9_local34 = f9_arg1.RewardImage
	local f9_local35 = Engine.Localize( "@LUA_MENU_PLUS_CHALLENGE_XP", f9_arg1.RewardXP )
	if not f9_local34 then
		f9_local34 = RegisterMaterial( "ui_reward_xp" )
		f9_local35 = Engine.Localize( "@LUA_MENU_CHALLENGE_XP", f9_arg1.RewardXP )
	end
	local f9_local36 = nil
	if f9_arg1.RewardType == "title" then
		f9_local36 = 30
	else
		f9_local36 = 45
	end
	local f9_local37 = nil
	if f9_arg1.animatedTable ~= nil then
		f9_local37 = LUI.Playercard.CreateAnimatedCallingCard( f9_arg1.animatedTable, f9_local36 )
		if f9_local37 then
			f9_local34 = RegisterMaterial( "black" )
		end
	end
	local f9_local38, f9_local39 = GetMaterialDimensions( f9_local34 )
	local f9_local40 = f9_local36 * f9_local38 / f9_local39
	local f9_local41 = f9_local36
	Engine.CacheMaterial( f9_local34 )
	local self = LUI.UIImage.new( {
		height = f9_local41,
		width = f9_local40,
		material = f9_local34,
		topAnchor = true
	} )
	self.rewardUIImage = self
	if f9_local37 ~= nil then
		self:addElement( f9_local37 )
	end
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIText.new( {
		height = 8,
		color = Colors.white,
		topAnchor = true,
		font = CoD.TextSettings.BodyFont.Font
	} )
	if f9_arg1.RewardName ~= nil and f9_arg1.RewardName ~= "" then
		self:setText( Engine.ToUpperCase( f9_arg1.RewardName ) )
		self:addElement( self )
		self.rewardNameText = self
	end
	local self = LUI.UIText.new( {
		height = 8,
		color = LUI.ChallengeCard.XPYellow,
		topAnchor = true,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( f9_local35 )
	self:addElement( self )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	if f9_arg1.RewardXP == 0 then
		self:animateToState( "hide" )
	end
	self.xpText = self
	self:addElement( self )
	if f9_arg2 then
		self:registerAnimationState( "focus", {
			borderThickness = 3,
			alpha = 1
		} )
	end
	self.border = self
	self:addElement( self )
	local f9_local45 = Engine.GetPlayerDataMPXP( f9_arg0, CoD.StatsGroup.Ranked, "experience" )
	local f9_local46 = Lobby.GetPlayerPrestigeLevel( f9_arg0 )
	local f9_local47 = Lobby.GetRankForXP( f9_local45, f9_local46 )
	local f9_local48 = true
	local f9_local49 = Engine.GetPlayerData( f9_arg0, CoD.StatsGroup.Ranked, "challengeState", f9_arg1.Ref ) > 0
	self.isChallengeUnlocked = f9_local49
	if f9_local46 > 0 and f9_arg1.Category ~= "category_attachment" and f9_local49 then
		f9_local48 = false
	end
	local lockHolder = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "h1_challenge_card_lockedoverlay" )
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "s1_icon_locked_full" ),
		width = 30,
		height = 30,
		topAnchor = true,
		top = 75
	} )
	self:registerAnimationState( "show", {
		width = 30,
		height = 30,
		topAnchor = true,
		top = 75
	} )
	self:registerAnimationState( "hide", {
		width = 0,
		height = 0,
		topAnchor = true,
		top = 75
	} )
	
	local lockTextElement = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		color = Colors.h1.medium_grey,
		height = 8,
		width = LUI.ChallengeCard.GridItemWidth - 20,
		topAnchor = true,
		top = 115,
		alignment = LUI.Alignment.Center
	} )
	lockHolder:addElement( self )
	lockHolder:addElement( self )
	lockHolder:addElement( lockTextElement )
	self.lockTextElement = lockTextElement
	
	self.lockBG = self
	self.padlock = self
	self:addElement( lockHolder )
	self.lockHolder = lockHolder
	
	lockHolder:registerAnimationState( "show", {
		alpha = 1
	} )
	lockHolder:registerAnimationState( "hide", {
		alpha = 0
	} )
	lockHolder:animateToState( "hide" )
	local f9_local54 = ""
	if f9_local48 then
		local f9_local55 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f9_arg1.Ref, AllChallengesTable.Cols.UnlockLevel )
		if f9_local55 ~= nil and f9_local55 ~= "" and f9_local55 ~= 0 then
			local f9_local56 = tonumber( f9_local55 )
			if f9_local56 > 4 and f9_local47 < f9_local56 then
				lockHolder:animateToState( "show" )
				self.locked = true
				lockTextElement:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_UNLOCKED_AT_RANK", Rank.GetRankDisplay( f9_local56 ) ) ) )
			end
		end
		local f9_local56 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f9_arg1.Ref, AllChallengesTable.Cols.ChallengeUnlock )
		if f9_local56 ~= nil and f9_local56 ~= "" then
			local f9_local57 = GetChallengeData( f9_arg0, f9_local56, nil, nil, nil, true )
			local f9_local58 = {
				AllChallengesTable.Cols.Target1,
				AllChallengesTable.Cols.Target2,
				AllChallengesTable.Cols.Target3,
				AllChallengesTable.Cols.Target4,
				AllChallengesTable.Cols.Target5,
				AllChallengesTable.Cols.Target6,
				AllChallengesTable.Cols.Target7,
				AllChallengesTable.Cols.Target8,
				AllChallengesTable.Cols.Target9
			}
			local f9_local59 = nil
			for f9_local60 = 1, #f9_local58, 1 do
				local f9_local63 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f9_local56, f9_local58[f9_local60] )
				if f9_local63 ~= "" then
					if f9_local63 == nil then
						break
					end
					f9_local59 = f9_local63
				end
			end
			if f9_local57.Progress < tonumber( f9_local59 ) then
				lockHolder:animateToState( "show" )
				self.locked = true
				lockTextElement:setText( Engine.Localize( "@LUA_MENU_UNLOCKED_BY_COMPLETING_CHALLENGE", Engine.ToUpperCase( f9_local57.Name ) ) )
			end
		end
	end
	local f9_local55 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f9_arg1.Ref, AllChallengesTable.Cols.PrestigeUnlock )
	if f9_local55 ~= nil and f9_local55 ~= "" and f9_local46 < tonumber( f9_local55 ) then
		lockHolder:animateToState( "show" )
		self.locked = true
		lockTextElement:setText( Engine.Localize( "@LUA_MENU_UNLOCKED_BY_REACHING_PRESTIGE", f9_local55 ) )
	end
	local f9_local56 = Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.Ref, f9_arg1.Ref, AllChallengesTable.Cols.PrestigeShopUnlock )
	if f9_local56 ~= nil and f9_local56 ~= "" and Cac.IsItemPermanentlyUnlocked( f9_arg0, string.sub( f9_local56, string.len( "ch_prPurchase_" ) + 1 ) ) then
		lockHolder:animateToState( "hide" )
		self.locked = false
	end
	self.currentTierIdx = f9_arg1.ActiveTier
	self:addElement( self )
	self:addElement( self )
	local f9_local57 = f9_arg1.ActiveTier
	if f9_arg1.ActiveTier > 1 then
		f9_local57 = f9_arg1.ActiveTier - 1
	end
	if f9_arg1.ActiveTier == f9_arg1.NumTiers and f9_arg1.Target <= f9_arg1.Progress then
		f9_local57 = f9_arg1.NumTiers
	end
	if f9_arg4 then
		updateCardDataWithTier( self, false, f9_local57 )
	end
	self.vList:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.vList:registerAnimationState( "show", {
		alpha = 1
	} )
	self.rewardVList:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.rewardVList:registerAnimationState( "show", {
		alpha = 1
	} )
	return self
end

