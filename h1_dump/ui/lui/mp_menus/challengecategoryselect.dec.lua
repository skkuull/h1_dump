local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
ShowPreview = true
PreviewItemLimit = 8
Classic = "classic"
Career = "career"
Weapon = "weapon"
DLC = "dlc"
ClassicIdx = 0
CareerIdx = 1
WeaponIdx = 2
ChallengeCardScale = 1.15
function buildSubCategoryCard( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Filter, f1_arg2, ChallengeCategoryNavTable.Cols.Name )
	local f1_local1 = Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Name, f1_arg2, ChallengeCategoryNavTable.Cols.Image1 )
	local self = LUI.UIVerticalList.new( {
		width = 100,
		height = 300,
		spacing = 5
	} )
	self.id = "vList" .. f1_arg2
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		color = Colors.h1.light_grey,
		height = 12,
		alpha = 0.5
	} )
	self:setText( Engine.ToUpperCase( Engine.Localize( f1_local0 ) ) )
	local self = LUI.UIImage.new( {
		width = 50,
		height = 50,
		material = RegisterMaterial( f1_local1 )
	} )
	local f1_local5 = 1
	local f1_local6 = 0
	if f1_arg1 ~= nil then
		local self = f1_arg1.progress / f1_arg1.count
		if self > 1 then
			self = 1
		end
		f1_local6 = math.floor( self * 100 )
	end
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		color = Colors.white,
		height = 25
	} )
	self:setText( f1_local6 .. "%" )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		color = Colors.white,
		height = 12
	} )
	self:setText( Engine.Localize( "@LUA_MENU_COMPLETE" ) )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

function buildSubcategoryUI( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = nil
	if f2_arg1 == Classic then
		f2_local0 = f2_arg0.challengesDataBlob.classicSubsProgress
	elseif f2_arg1 == Career then
		f2_local0 = f2_arg0.challengesDataBlob.careerSubsProgress
	elseif f2_arg1 == Weapon then
		f2_local0 = f2_arg0.challengesDataBlob.weaponSubsProgress
	elseif f2_arg1 == DLC then
		f2_local0 = f2_arg0.challengesDataBlob.dlcSubsProgress
	end
	local self = LUI.UIHorizontalList.new( {
		bottomAnchor = true,
		leftAnchor = true,
		bottom = -150,
		left = OperatorMenuUtil.LowerPreviewLeft
	} )
	self.id = "hList" .. f2_arg1
	for f2_local2 = 1, #f2_arg2, 1 do
		self:addElement( buildSubCategoryCard( f2_arg0.exclusiveController, f2_local0[f2_arg2[f2_local2]], Engine.TableLookup( ChallengeCategoryNavTable.File, ChallengeCategoryNavTable.Cols.Filter, f2_arg2[f2_local2], ChallengeCategoryNavTable.Cols.Name ) ) )
		if f2_local2 < #f2_arg2 then
			self:addElement( LUI.UIImage.new( {
				material = RegisterMaterial( "white" ),
				width = 0.5,
				height = 55,
				color = Colors.h1.light_grey,
				bottomAnchor = true,
				alpha = 0.5
			} ) )
		end
	end
	return self
end

function buildTotalProgress( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = 235
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f3_local0
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		height = 15,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_PROGRESS" ) ) )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 20,
		height = 2,
		width = 20,
		leftAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.mw1_green
	} ) )
	local f3_local3 = LUI.ChallengeCard.GridRowHeight * ChallengeCardScale
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f3_local0,
		height = f3_local3,
		top = 40
	} )
	local f3_local5 = 60
	local f3_local6 = f3_local3 - f3_local5
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = f3_local6,
		material = RegisterMaterial( "h1_challenge_card_background_top" )
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		height = f3_local5,
		material = RegisterMaterial( "h1_challenge_card_background_bot" ),
		top = f3_local6
	} )
	local f3_local9 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local9.material = RegisterMaterial( "h1_ui_dot_pattern" )
	local self = LUI.UIImage.new( f3_local9 )
	self:setupTiles( 6 )
	local self = LUI.UIBorder.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		color = Colors.mw1_green,
		borderThickness = 1,
		material = RegisterMaterial( "white" ),
		alpha = 0.5
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		color = Colors.mw1_green,
		material = RegisterMaterial( "white" ),
		height = 1,
		top = f3_local6,
		alpha = 0.5
	} )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		top = -10,
		width = 220,
		height = 220,
		color = Colors.dark_grey,
		alpha = 0.5,
		material = RegisterMaterial( f3_arg2 )
	} )
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		top = 55,
		alignment = LUI.Alignment.Center,
		spacing = 10
	} )
	local self = LUI.UIText.new( {
		color = Colors.white,
		height = 35,
		font = CoD.TextSettings.BodyFont.Font
	} )
	if f3_arg0 > 1 then
		f3_arg0 = 1
	end
	self:setText( math.floor( f3_arg0 * 100 ) .. "%" )
	local self = LUI.UIText.new( {
		color = Colors.white,
		height = 12,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( Engine.Localize( "@LUA_MENU_COMPLETE" ) )
	local f3_local17 = 125
	local self = LUI.UIElement.new( {
		width = f3_local17,
		height = 10
	} )
	local f3_local19 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local19.color = Colors.black
	f3_local19.alpha = 0.3
	f3_local19.material = RegisterMaterial( "white" )
	local self = LUI.UIImage.new( f3_local19 )
	f3_local19 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local19.borderThickness = 1
	f3_local19.color = Colors.mw1_green
	local self = LUI.UIBorder.new( f3_local19 )
	f3_local19 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local19.material = RegisterMaterial( "white" )
	f3_local19.color = Colors.mw1_green
	f3_local19.alpha = 0.75
	local self = LUI.UIImage.new( f3_local19 )
	self:registerAnimationState( "default", {
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		width = f3_arg0 * f3_local17,
		color = Colors.mw1_green
	} )
	self:animateToState( "default", 0 )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local self = LUI.UIHorizontalList.new( {
		width = 185,
		spacing = 5,
		topAnchor = true,
		top = f3_local6 + 5,
		height = 85
	} )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 50,
		height = 50,
		color = Colors.white,
		material = RegisterMaterial( f3_arg2 )
	} )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 15,
		top = 5
	} )
	self:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 1,
		color = Colors.mw1_green,
		material = RegisterMaterial( "white" ),
		height = 45
	} ) )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		spacing = 5,
		top = 10,
		width = 150
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		width = 125,
		height = 18,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Left
	} )
	self:setText( f3_arg3 )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		width = 125,
		height = 10,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Left
	} )
	self:setText( Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_CHALLENGES" ) ) )
	if Engine.IsRightToLeftLanguage() then
		self:addElement( self )
		self:addElement( self )
	else
		self:addElement( self )
		self:addElement( self )
	end
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

function buildNearestCompletion( f4_arg0, f4_arg1, f4_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = (LUI.ChallengeCard.GridItemWidth + 15) * 3,
		height = LUI.ChallengeCard.GridRowHeight
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		left = -10,
		topAnchor = true,
		height = 15,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( Engine.Localize( "@CHALLENGE_NEAREST_COMPLETION" ) )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		left = -10,
		top = 20,
		height = 2,
		width = 25,
		leftAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.mw1_green
	} ) )
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 200,
		spacing = 35,
		top = 56
	} )
	local f4_local3 = 0
	for self = 1, #f4_arg2, 1 do
		local f4_local7 = GetChallengeData( f4_arg1, f4_arg2[self].name )
		local f4_local8 = LUI.ChallengeCard.new( f4_arg1, f4_local7, false, f4_local7.Progress == 0 )
		if f4_local7.Progress > 0 then
			f4_local3 = f4_local3 + 1
		end
		f4_local8:registerAnimationState( "enlarge", {
			scale = 0.15
		} )
		f4_local8:animateToState( "enlarge" )
		f4_local8.id = "nearest_" .. self
		self:addElement( f4_local8 )
	end
	if f4_local3 == 0 then
		local self = LUI.UIText.new( {
			font = CoD.TextSettings.BodyFont.Font,
			height = 14,
			color = Colors.h1.light_grey,
			topAnchor = true,
			top = LUI.ChallengeCard.GridRowHeight - 55,
			alpha = 0.5
		} )
		self:setText( Engine.Localize( "@LUA_MENU_NO_CHALLENGES_STARTED", f4_arg0 ) )
		self:addElement( self )
		self.noneStartedText = self
	end
	self:addElement( self )
	return self
end

function buildCongratsPanel( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 15,
		width = (LUI.ChallengeCard.GridItemWidth + 15) * 3,
		height = LUI.ChallengeCard.GridRowHeight + 25
	} )
	local f5_local1 = LUI.Divider.new( {
		width = 380
	}, 5, LUI.Divider.Grey )
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( controller ),
		width = 250,
		height = 250
	} )
	local self = LUI.UIText.new( {
		font = CoD.TextSettings.BodyFont.Font,
		height = 14,
		color = Colors.h1.light_grey,
		bottomAnchor = true,
		bottom = 10,
		alpha = 0.5
	} )
	self:setText( Engine.Localize( "@LUA_MENU_CHALLENGES_CONGRATS", menu ) )
	self:addElement( f5_local1 )
	self:addElement( self )
	self:addElement( self )
	return self
end

function CategoryDetailPane( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		topAnchor = true,
		top = 100,
		left = 300
	} )
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		topAnchor = true,
		spacing = 30,
		height = 350
	} )
	self:addElement( buildTotalProgress( f6_arg0, f6_arg1, f6_arg2, f6_arg3 ) )
	if f6_arg0 >= 1 then
		self:addElement( buildCongratsPanel( f6_arg3, f6_arg2 ) )
	else
		self:addElement( buildNearestCompletion( f6_arg3, f6_arg1, f6_arg4 ) )
	end
	self:addElement( self )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 1
	} )
	self:animateToState( "hide" )
	return self
end

function ChallengeCategoryMenu( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = f7_arg1.title or "LUA_MENU_CHALLENGES"
	if f7_arg1.overrideContext and f7_arg1.overrideContext.menuTitle then
		f7_local0 = f7_arg1.overrideContext.menuTitle
	end
	local f7_local1 = LUI.MenuTemplate.new( f7_arg0, {
		menu_title = f7_local0,
		uppercase_title = true
	} )
	LUI.MenuTemplate.SetBreadCrumb( f7_local1, Engine.Localize( "@LUA_MENU_BARRACKS_CAPS" ) )
	f7_local1.challengesDataBlob = f7_arg1.dataBlob
	local currSubCatPreview = buildSubcategoryUI( f7_local1, Classic, f7_local1.challengesDataBlob.classicSubCategories )
	local currSubCatPreview = buildSubcategoryUI( f7_local1, Career, f7_local1.challengesDataBlob.careerSubCategories )
	local currSubCatPreview = buildSubcategoryUI( f7_local1, Weapon, f7_local1.challengesDataBlob.weaponSubCategories )
	local currSubCatPreview = buildSubcategoryUI( f7_local1, DLC, f7_local1.challengesDataBlob.dlcSubCategories )
	local f7_local6 = f7_local1:AddButton( Engine.Localize( "@CHALLENGE_CATEGORY_CLASSIC" ), function ( f8_arg0, f8_arg1 )
		LUI.FlowManager.RequestAddMenu( f8_arg0, "ChallengeMenu", true, f8_arg1.controller, false, {
			challengeType = Classic,
			menuTitle = Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_CLASSIC_MENU" ) ),
			dataBlob = f7_local1.challengesDataBlob
		} )
	end )
	local currDetailPane = CategoryDetailPane( f7_local1.challengesDataBlob.classicTotalProgress, f7_local1.exclusiveController, "h1_challenge_category_classic", Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_CLASSIC_MENU" ) ), f7_local1.challengesDataBlob.nearestCompletionClassic )
	f7_local6:registerEventHandler( "button_over", function ()
		if f7_local1.currDetailPane ~= nil then
			f7_local1:removeElement( f7_local1.currDetailPane )
			f7_local1.currDetailPane = nil
		end
		f7_local1:addElement( currDetailPane )
		f7_local1.currDetailPane = currDetailPane
		
		currDetailPane:animateToState( "show" )
		if f7_local1.currSubCatPreview ~= nil then
			f7_local1:removeElement( f7_local1.currSubCatPreview )
			f7_local1.currSubCatPreview = nil
		end
		f7_local1:addElement( currSubCatPreview )
		f7_local1.currSubCatPreview = currSubCatPreview
		
	end )
	local f7_local8 = f7_local1:AddButton( Engine.Localize( "@CHALLENGE_CATEGORY_CAREER_DESC" ), function ( f10_arg0, f10_arg1 )
		LUI.FlowManager.RequestAddMenu( f10_arg0, "ChallengeMenu", true, f10_arg1.controller, false, {
			challengeType = Career,
			menuTitle = Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_CAREER" ) ),
			dataBlob = f7_local1.challengesDataBlob
		} )
	end )
	local currDetailPane = CategoryDetailPane( f7_local1.challengesDataBlob.careerTotalProgress, f7_local1.exclusiveController, "h1_challenge_category_career", Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_CAREER" ) ), f7_local1.challengesDataBlob.nearestCompletionCareer )
	f7_local8:registerEventHandler( "button_over", function ()
		if f7_local1.currDetailPane ~= nil then
			f7_local1:removeElement( f7_local1.currDetailPane )
			f7_local1.currDetailPane = nil
		end
		f7_local1:addElement( currDetailPane )
		f7_local1.currDetailPane = currDetailPane
		
		currDetailPane:animateToState( "show" )
		if f7_local1.currSubCatPreview ~= nil then
			f7_local1:removeElement( f7_local1.currSubCatPreview )
			f7_local1.currSubCatPreview = nil
		end
		f7_local1:addElement( currSubCatPreview )
		f7_local1.currSubCatPreview = currSubCatPreview
		
	end )
	local f7_local10 = f7_local1:AddButton( Engine.Localize( "@CHALLENGE_WEAPON_CHALLENGES" ), function ( f12_arg0, f12_arg1 )
		LUI.FlowManager.RequestAddMenu( f12_arg0, "ChallengeMenu", true, f12_arg1.controller, false, {
			challengeType = Weapon,
			menuTitle = Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_WEAPON" ) ),
			dataBlob = f7_local1.challengesDataBlob
		} )
	end )
	local currDetailPane = CategoryDetailPane( f7_local1.challengesDataBlob.weaponsTotalProgress, f7_local1.exclusiveController, "h1_challenge_category_weapon", Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_WEAPON" ) ), f7_local1.challengesDataBlob.nearestCompletionWeapon )
	f7_local10:registerEventHandler( "button_over", function ()
		if f7_local1.currDetailPane ~= nil then
			f7_local1:removeElement( f7_local1.currDetailPane )
			f7_local1.currDetailPane = nil
		end
		f7_local1:addElement( currDetailPane )
		f7_local1.currDetailPane = currDetailPane
		
		currDetailPane:animateToState( "show" )
		if f7_local1.currSubCatPreview ~= nil then
			f7_local1:removeElement( f7_local1.currSubCatPreview )
			f7_local1.currSubCatPreview = nil
		end
		f7_local1:addElement( currSubCatPreview )
		f7_local1.currSubCatPreview = currSubCatPreview
		
	end )
	local f7_local12 = f7_local1:AddButton( Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_DLC_DESC" ) ), function ( f14_arg0, f14_arg1 )
		LUI.FlowManager.RequestAddMenu( f14_arg0, "ChallengeMenu", true, f14_arg1.controller, false, {
			challengeType = DLC,
			menuTitle = Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_DLC" ) ),
			dataBlob = f7_local1.challengesDataBlob
		} )
	end )
	local currDetailPane = CategoryDetailPane( f7_local1.challengesDataBlob.dlcTotalProgress, f7_local1.exclusiveController, "h1_challenge_category_dlc", Engine.ToUpperCase( Engine.Localize( "@CHALLENGE_CATEGORY_DLC" ) ), f7_local1.challengesDataBlob.nearestCompletionDLC )
	f7_local12:registerEventHandler( "button_over", function ()
		if f7_local1.currDetailPane ~= nil then
			f7_local1:removeElement( f7_local1.currDetailPane )
			f7_local1.currDetailPane = nil
		end
		f7_local1:addElement( currDetailPane )
		f7_local1.currDetailPane = currDetailPane
		
		currDetailPane:animateToState( "show" )
		if f7_local1.currSubCatPreview ~= nil then
			f7_local1:removeElement( f7_local1.currSubCatPreview )
			f7_local1.currSubCatPreview = nil
		end
		f7_local1:addElement( currSubCatPreview )
		f7_local1.currSubCatPreview = currSubCatPreview
		
	end )
	f7_local1:AddBackButton()
	return f7_local1
end

LUI.MenuBuilder.registerType( "ChallengeCategoryMenu", ChallengeCategoryMenu )
LUI.MenuBuilder.registerType( "ChallengeSubCategoryMenu1", ChallengeCategoryMenu )
LUI.MenuBuilder.registerType( "ChallengeSubCategoryMenu2", ChallengeCategoryMenu )
LUI.MenuBuilder.registerType( "ChallengeSubCategoryMenu3", ChallengeCategoryMenu )
LockTable( _M )
