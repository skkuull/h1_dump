local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 5
f0_local1 = 2
f0_local2 = 18
local f0_local3 = {
	r = 0.92,
	g = 0.67,
	b = 0.2
}
function challengeGridItem( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = LUI.ChallengeCard.new( f1_arg0, f1_arg1, true )
	f1_local0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		if f2_arg0.alreadyOver then
			return 
		else
			f2_arg0.alreadyOver = true
			f1_arg2.detailsPanel.tierIdx = f2_arg0.realTier
			updateDetailsPanel( f1_arg2, f2_arg0 )
			f2_arg0.border:animateToState( "focus" )
		end
	end )
	f1_local0:addEventHandler( "button_up", function ( f3_arg0, f3_arg1 )
		f3_arg0.alreadyOver = false
		f3_arg0.border:animateToState( "default" )
		f3_arg0:handleButtonUp()
		f1_arg2.detailsPanel.tierIdx = f3_arg0.realTier
		updateDetailsPanel( f1_arg2, f3_arg0 )
	end )
	f1_local0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		f4_arg0:handleButtonSelect()
		if f1_arg2.detailsPanel.tierIdx == f4_arg0.challengeData.NumTiers then
			f1_arg2.detailsPanel.tierIdx = 1
		else
			f1_arg2.detailsPanel.tierIdx = f1_arg2.detailsPanel.tierIdx + 1
		end
		updateDetailsPanel( f1_arg2, f4_arg0 )
	end )
	return f1_local0
end

function getChallengesGrid( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	if #f5_arg1 == 0 then
		return {}
	end
	local f5_local0 = 28
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		left = -f5_local0 / 2,
		top = -f5_local0 / 2,
		width = LUI.ChallengeCard.GridItemWidth * f0_local0 + f0_local2 * (f0_local0 - 1) + f5_local0,
		height = LUI.ChallengeCard.GridRowHeight * f0_local1 + f0_local2 * (f0_local1 - 1) + f5_local0
	} )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( self )
	self:setUseStencil( true )
	local self = LUI.UIGrid.new( {
		leftAnchor = true,
		topAnchor = true,
		left = f5_local0 / 2,
		top = f5_local0 / 2,
		width = LUI.ChallengeCard.GridItemWidth * f0_local0 + f0_local2 * (f0_local0 - 1),
		height = LUI.ChallengeCard.GridRowHeight * f0_local1 + f0_local2 * (f0_local1 - 1)
	}, {
		elementsPerRow = f0_local0,
		hSpacing = f0_local2,
		vSpacing = f0_local2,
		rowHeight = LUI.ChallengeCard.GridRowHeight,
		hAlign = LUI.Alignment.Left,
		vAlign = LUI.Alignment.Center
	} )
	self.id = "ChallengesGrid_" .. f5_arg2
	local f5_local4 = nil
	for self, f5_local9 in ipairs( f5_arg1 ) do
		local f5_local10 = challengeGridItem( f5_arg0, f5_local9, f5_arg3 )
		if self == 1 then
			f5_local4 = f5_local10
		end
		self:addElement( f5_local10 )
	end
	self:registerEventHandler( "tab_changed", function ( element, event )
		local f6_local0 = LUI.FlowManager.GetMenuScopedDataFromElement( element )
		if not f6_local0.subMenu then
			element:processEvent( {
				name = "gain_focus"
			} )
		else
			f6_local0.subMenu = false
		end
	end )
	self:addElement( self )
	f5_local5 = f0_local0 * LUI.ChallengeCard.GridItemWidth
	f5_local6 = {
		containerWidth = f5_local5,
		containerHeight = 32
	}
	self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		left = f5_local5 / 2 - 20,
		top = 0,
		height = f5_local6.containerHeight
	} )
	self:addElement( self )
	ListPaging.InitGrid( self, f0_local1, nil, false, self, f5_local6 )
	if 0 < #f5_arg1 then
		f5_local9 = GetChallengeData( f5_arg0, f5_arg1[1].Ref )
		f5_arg3.detailsPanel.tierIdx = f5_local4.realTier
		updateDetailsPanel( f5_arg3, f5_local4, true )
	end
	return self
end

function getChallengeItemsByType( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = f7_arg2[f7_arg1]
	local f7_local1 = {}
	if f7_local0 == nil then
		return {}
	end
	for f7_local2 = 1, #f7_local0, 1 do
		table.insert( f7_local1, GetChallengeData( f7_arg0, f7_local0[f7_local2] ) )
	end
	return f7_local1
end

function addChallengeTabManager( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	local f8_local0 = nil
	if f8_arg3 == "classic" then
		f8_local0 = f8_arg4.classicSubCategories
	elseif f8_arg3 == "career" then
		f8_local0 = f8_arg4.careerSubCategories
	elseif f8_arg3 == "weapon" then
		f8_local0 = f8_arg4.weaponSubCategories
	elseif f8_arg3 == "dlc" then
		f8_local0 = f8_arg4.dlcSubCategories
	end
	local f8_local1 = 0
	local f8_local2 = {}
	if f8_local0 == nil then
		return 
	end
	for f8_local3 = 1, #f8_local0, 1 do
		local f8_local6 = f8_local0[f8_local3]
		local f8_local7 = Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Filter, f8_local6, ChallengeCategoryNavTable.Cols.Ref )
		local detailsPanel = Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Ref, f8_local7, ChallengeCategoryNavTable.Cols.Name )
		local f8_local9 = getChallengeItemsByType( f8_arg0, f8_local6, f8_arg4 )
		if #f8_local9 > 0 then
			f8_local2[f8_local1 + 1] = {
				name = detailsPanel,
				filter = f8_local6,
				ref = f8_local7,
				chTable = f8_local9
			}
		end
	end
	local f8_local4 = LUI.MenuBuilder.BuildRegisteredType( "MFTabManager", {
		defState = {
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			top = 10
		},
		numOfTabs = f8_local1,
		vPadding = 20
	} )
	f8_local4:keepRightBumperAlignedToHeader( true )
	f8_arg2.tabManager = f8_local4
	f8_local4.tabContentPane = f8_arg1
	for f8_local5 = 1, #f8_local2, 1 do
		local f8_local7 = f8_local5
		f8_local4:addTab( f8_arg0, f8_local2[f8_local7].name, function ( f9_arg0, f9_arg1 )
			return getChallengesGrid( f9_arg1, f8_local2[f8_local7].chTable, f8_local7, f8_arg2 )
		end )
	end
	local f8_local5 = LUI.FlowManager.GetMenuScopedDataFromElement( f8_arg1 )
	f8_local4.tabSelected = f8_local5.paneIndex or 1
	f8_local4.parentContainer = f8_arg2
	f8_arg2:addElement( f8_local4 )
	if f8_local1 > 0 then
		local f8_local6 = getChallengeItemsByType( f8_arg0, f8_local2[f8_local4.tabSelected].filter, f8_arg4 )
		
		local detailsPanel = createDetailsPanel( GetChallengeData( f8_arg0, f8_local6[1].Ref ) )
		f8_arg2:addElement( detailsPanel )
		f8_arg2.detailsPanel = detailsPanel
		
		f8_local4:refreshTab( f8_arg0 )
	end
end

function createDetailsPanel( f10_arg0 )
	local f10_local0 = 380
	local f10_local1 = LUI.ChallengeCard.GridRowHeight * f0_local1 + f0_local2 * (f0_local1 - 1) + 3
	local f10_local2 = f10_local1 - 170
	local self = LUI.UIElement.new( {
		rightAnchor = true,
		topAnchor = true,
		width = f10_local0,
		right = 0,
		top = CombatRecord.MenuDimensions.top + 15,
		height = f10_local1
	} )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "h1_challenge_card_background_bot" )
	} ) )
	
	local giantBackgroundEmblem = LUI.UIImage.new( {
		topAnchor = true,
		top = 20,
		material = RegisterMaterial( Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Filter, f10_arg0.Filter, ChallengeCategoryNavTable.Cols.Image1 ) ),
		width = 230,
		height = 230,
		color = Colors.dark_grey,
		alpha = 0.5
	} )
	self:addElement( giantBackgroundEmblem )
	self.giantBackgroundEmblem = giantBackgroundEmblem
	
	local f10_local5 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local5.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f10_local5 )
	self:setupTiles( 10 )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local self = LUI.UIBorder.new( {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( self )
	local self = LUI.UIText.new( {
		topAnchor = true,
		top = 15,
		alignment = LUI.Alignment.Center,
		height = 25,
		color = Colors.mw1_green,
		font = CoD.TextSettings.BodyFont.Font,
		width = 280
	} )
	self:setText( f10_arg0.Name )
	self.nameText = self
	self:addElement( self )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		spacing = 5,
		top = 65
	} )
	self.id = "challengeDataVList"
	local self = LUI.UIHorizontalList.new( {
		spacing = 5,
		alignment = LUI.Alignment.Center,
		height = 25
	} )
	for self = 1, f10_arg0.NumTiers, 1 do
		local self = nil
		local self = {
			width = 20,
			height = 20,
			color = Colors.mw1_green,
			material = RegisterMaterial( "white" )
		}
		if self <= f10_arg0.ActiveTier then
			self = LUI.UIImage.new( self )
		else
			self.borderThickness = 1
			self = LUI.UIBorder.new( self )
		end
		self:addElement( self )
	end
	self.tierHList = self
	local self = LUI.UIImage.new( {
		topAnchor = true
	} )
	self.weaponImage = self
	local self = LUI.UIElement.new( {
		height = 65,
		topAnchor = true
	} )
	self:addElement( self )
	local self = LUI.UIText.new( {
		height = 29,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self.progressText = self
	local self = LUI.UIElement.new( {
		topAnchor = true,
		height = 34
	} )
	self:addElement( self )
	local self = 210
	local self = LUI.UIElement.new( {
		width = self,
		height = 15
	} )
	local f10_local17 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local17.color = Colors.black
	f10_local17.alpha = 0.3
	f10_local17.material = RegisterMaterial( "white" )
	local self = LUI.UIImage.new( f10_local17 )
	f10_local17 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local17.borderThickness = 1
	f10_local17.color = Colors.h1.medium_grey
	local self = LUI.UIBorder.new( f10_local17 )
	f10_local17 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f10_local17.material = RegisterMaterial( "white" )
	f10_local17.color = Colors.h1.light_grey
	local self = LUI.UIImage.new( f10_local17 )
	local f10_local21 = f10_arg0.Progress or 0
	local f10_local22 = f10_arg0.Target
	local f10_local23 = 0
	if f10_local22 and f10_local22 > 0 then
		if f10_local22 < f10_local21 then
			f10_local21 = f10_local22
		end
		f10_local23 = f10_local21 / f10_local22
	end
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f10_local23 * self,
		color = Colors.h1.light_grey
	} )
	self:animateToState( "default", 0 )
	self.progressFill = self
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		height = 15,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font,
		width = f10_local0 - 30
	} )
	self:setText( f10_arg0.Desc )
	self.requirementText = self
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		height = 30
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		top = f10_local2,
		alpha = 0.8,
		height = 1,
		material = RegisterMaterial( "white" ),
		color = Colors.h1.medium_grey
	} ) )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		spacing = vListSpacing,
		top = 295
	} )
	self.id = "rewardVList"
	local self = LUI.UIElement.new( {
		width = f10_local0 - 20,
		height = 25
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
		top = 4,
		height = 20,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_REWARD" ) ) )
	self.rewardHeaderText = self
	self:registerAnimationState( "white", {
		color = Colors.white
	} )
	self:registerAnimationState( "green", {
		color = Colors.mw1_green
	} )
	self:addElement( self )
	self:addElement( self )
	local f10_local30 = Engine.Localize( "@LUA_MENU_PLUS_CHALLENGE_XP", f10_arg0.RewardXP )
	if not f10_arg0.RewardImage then
		local f10_local31 = RegisterMaterial( "ui_reward_xp" )
		f10_local30 = Engine.Localize( "@LUA_MENU_CHALLENGE_XP", f10_arg0.RewardXP )
	end
	local self = LUI.UIImage.new()
	self.rewardUIImage = self
	local self = LUI.UIElement.new( {
		topAnchor = true,
		height = 65
	} )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	if f10_arg0.RewardName ~= nil and f10_arg0.RewardName ~= "" then
		local self = LUI.UIText.new( {
			height = 13,
			color = Colors.white,
			topAnchor = true,
			font = CoD.TextSettings.BodyFont.Font
		} )
		self:setText( Engine.ToUpperCase( Engine.ToUpperCase( f10_arg0.RewardName ) ) )
		self:addElement( self )
		self.rewardNameText = self
	end
	local self = LUI.UIText.new( {
		height = 13,
		color = f0_local3,
		topAnchor = true,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( f10_local30 )
	self.xpText = self
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:addElement( self )
	if f10_arg0.RewardXP == 0 then
		self:animateToState( "hide" )
	end
	self:addElement( self )
	self.border = self
	self:addElement( self )
	self.rewardVList = self
	return self
end

function updateDetailsPanel( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg0.detailsPanel
	local f11_local1 = f11_local0.tierIdx
	local f11_local2 = GetChallengeData( f11_arg0.exclusiveController, f11_arg1.challengeData.Ref, nil, nil, f11_local1 )
	f11_local0.nameText:setText( f11_local2.Name )
	if f11_arg2 then
		f11_local0.giantBackgroundEmblem:registerAnimationState( "updateImage", {
			material = RegisterMaterial( Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Filter, f11_local2.Filter, ChallengeCategoryNavTable.Cols.Image1 ) )
		} )
		f11_local0.giantBackgroundEmblem:animateToState( "updateImage" )
	end
	f11_local0.tierHList:closeChildren()
	local self = LUI.UIText.new( {
		color = Colors.mw1_green,
		width = 60,
		height = 13,
		font = CoD.TextSettings.BodyFont.Font,
		topAnchor = true,
		top = 7
	} )
	self:setText( Engine.Localize( "@LUA_MENU_TIER" ) .. " " .. f11_local2.ActiveTier .. "/" .. f11_local2.NumTiers )
	f11_local0.tierHList:addElement( self )
	for f11_local4 = 1, f11_local2.NumTiers, 1 do
		local self = nil
		local f11_local8 = {
			width = 12,
			height = 12,
			color = Colors.mw1_green,
			material = RegisterMaterial( "white" )
		}
		if f11_local4 <= f11_local2.ActiveTier then
			self = LUI.UIImage.new( f11_local8 )
		else
			f11_local8.borderThickness = 1
			self = LUI.UIBorder.new( f11_local8 )
		end
		f11_local0.tierHList:addElement( self )
	end
	local f11_local4 = 85
	local f11_local5, f11_local6 = GetMaterialDimensions( f11_local2.Image )
	f11_local0.weaponImage:registerAnimationState( "updateMaterial", {
		width = f11_local4 * f11_local5 / f11_local6,
		height = f11_local4,
		material = f11_local2.Image
	} )
	f11_local0.weaponImage:animateToState( "updateMaterial" )
	local self = nil
	local f11_local8 = f11_local2.Target
	self = f11_local2.Progress
	if f11_local1 < f11_arg1.realTier then
		f11_local0.rewardHeaderText:setText( Engine.Localize( "@LUA_MENU_AWARDED" ) )
		f11_local0.rewardHeaderText:animateToState( "green" )
	elseif f11_local1 == f11_arg1.realTier then
		if f11_local2.Target <= f11_local2.Progress then
			f11_local0.rewardHeaderText:setText( Engine.Localize( "@LUA_MENU_AWARDED" ) )
			f11_local0.rewardHeaderText:animateToState( "green" )
		else
			f11_local0.rewardHeaderText:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_REWARD" ) ) )
			f11_local0.rewardHeaderText:animateToState( "white" )
		end
	elseif f11_arg1.realTier < f11_local1 then
		f11_local0.rewardHeaderText:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_REWARD" ) ) )
		f11_local0.rewardHeaderText:animateToState( "white" )
	end
	local f11_local9 = 0
	if f11_local8 and f11_local8 > 0 then
		if f11_local8 < self then
			self = f11_local8
		end
		f11_local9 = self / f11_local8
	end
	f11_local0.progressText:setText( Engine.Localize( "@MPUI_X_SLASH_Y", self, f11_local8 ) )
	f11_local0.progressFill:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f11_local9 * 210
	} )
	f11_local0.progressFill:animateToState( "default", 200 )
	f11_local0.requirementText:setText( f11_local2.Desc )
	local f11_local10 = Engine.Localize( "@LUA_MENU_PLUS_CHALLENGE_XP", f11_local2.RewardXP )
	if not f11_local2.RewardImage then
		local f11_local11 = RegisterMaterial( "ui_reward_xp" )
		f11_local10 = Engine.Localize( "@LUA_MENU_CHALLENGE_XP", f11_local2.RewardXP )
	end
	local f11_local12 = 12
	local f11_local13 = 80
	if f11_local2.RewardType == "title" then
		f11_local13 = 70
	end
	local f11_local14 = nil
	if f11_local2.animatedTable ~= nil then
		f11_local14 = LUI.Playercard.CreateAnimatedCallingCard( f11_local2.animatedTable, f11_local13 )
		if f11_local14 then
			local f11_local11 = RegisterMaterial( "black" )
		end
	end
	f11_local0.rewardVList:registerAnimationState( "updateSpacing", {
		spacing = f11_local12
	} )
	f11_local0.rewardVList:animateToState( "updateSpacing" )
	local f11_local15 = 5
	local f11_local16, f11_local17 = GetMaterialDimensions( f11_local11 )
	local f11_local18 = f11_local13 * f11_local16 / f11_local17
	local f11_local19 = f11_local13
	Engine.CacheMaterial( f11_local11 )
	f11_local0.rewardUIImage:registerAnimationState( "updateImage", {
		material = f11_local11,
		width = f11_local18,
		height = f11_local19
	} )
	f11_local0.rewardUIImage:animateToState( "updateImage" )
	if f11_local0.rewardUIImage.animImg ~= nil then
		f11_local0.rewardUIImage:removeElement( f11_local0.rewardUIImage.animImg )
		f11_local0.rewardUIImage.animImg = nil
	end
	if f11_local14 ~= nil then
		f11_local0.rewardUIImage:addElement( f11_local14 )
		f11_local0.rewardUIImage.animImg = f11_local14
	end
	if f11_local2.RewardName ~= nil and f11_local2.RewardName ~= "" then
		if f11_local0.rewardNameText == nil then
			f11_local0.rewardNameText = LUI.UIText.new( {
				height = 13,
				color = Colors.white,
				topAnchor = true,
				font = CoD.TextSettings.BodyFont.Font
			} )
			f11_local0.rewardVList:addElement( f11_local0.rewardNameText )
		end
		f11_local0.rewardNameText:setText( Engine.ToUpperCase( Engine.ToUpperCase( f11_local2.RewardName ) ) )
	elseif f11_local0.rewardNameText then
		f11_local0.rewardVList:removeElement( f11_local0.rewardNameText )
		f11_local0.rewardNameText = nil
	end
	f11_local0.xpText:setText( f11_local10 )
	if f11_local2.RewardXP == 0 then
		f11_local0.xpText:animateToState( "hide" )
	else
		f11_local0.xpText:animateToState( "show" )
	end
end

function ChallengeMenu( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg1.dataBlob
	local f12_local1 = f12_arg1.exclusiveController
	local f12_local2 = LUI.MenuTemplate.new( f12_arg0, {
		menu_title = f12_arg1.menuTitle
	} )
	f12_local2:SetBreadCrumb( Engine.Localize( "@LUA_MENU_CHALLENGES_CAPS" ) )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = CombatRecord.MenuDimensions.left,
		width = CombatRecord.MenuDimensions.width,
		top = CombatRecord.MenuDimensions.top + 16,
		height = CombatRecord.MenuDimensions.height
	} )
	self.id = "detailsVL"
	addChallengeTabManager( f12_local1, self, f12_local2, f12_arg1.challengeType, f12_local0 )
	f12_local2:addElement( self )
	f12_local2:AddBackButton( function ( f13_arg0, f13_arg1 )
		LUI.FlowManager.RequestLeaveMenu( nil, nil, nil, f12_local1 )
	end )
	LUI.ButtonHelperText.AddHelperTextObject( f12_local2.help, {
		name = "add_button_helper_text",
		button_ref = "button_action",
		helper_text = Engine.Localize( "@LUA_MENU_CHALLENGE_CYCLE_TIERS" ),
		side = "left",
		clickable = false,
		priority = 0
	} )
	return f12_local2
end

LUI.MenuBuilder.registerType( "ChallengeMenu", ChallengeMenu )
LockTable( _M )
