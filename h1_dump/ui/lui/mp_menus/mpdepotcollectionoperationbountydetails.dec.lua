local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPDepotCollectionOperationBountyDetails = InheritFrom( LUI.UIElement )
local f0_local3 = {
	LootDrop1|LootDrop2 = {
		incompleteIcon = "collection_season1_incomplete",
		completeIcon = "collection_season1_complete",
		name = "@DEPOT_SEASON_1",
		shortName = "LOOT_JAN_WCAMO_AW_REWARD"
	},
	LootDrop3|LootDrop4 = {
		incompleteIcon = "collection_season2_incomplete",
		completeIcon = "collection_season2_complete",
		name = "@DEPOT_SEASON_2",
		shortName = "DEPOT_SEASON2_SHORT_NAME"
	},
	LootDrop3:1 = {
		incompleteIcon = "collection_promo1_incomplete",
		completeIcon = "collection_promo1_complete",
		name = "@DEPOT_PROMO_1",
		shortName = "DEPOT_PROMO1_SHORT_NAME"
	},
	LootDrop5|LootDrop6 = {
		incompleteIcon = "collection_season3_incomplete",
		completeIcon = "collection_season3_complete",
		name = "@DEPOT_SEASON_3",
		shortName = "DEPOT_SEASON_LC_3"
	},
	LootDrop5:2 = {
		incompleteIcon = "collection_promo2_incomplete",
		completeIcon = "collection_promo2_complete",
		name = "@DEPOT_PROMO_2",
		shortName = "DEPOT_PROMO2_SHORT_NAME"
	}
}
LUI.MPDepotCollectionOperationBountyDetails.Update = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f0_local3[f1_arg1.seasonTag]
	local f1_local1 = f1_local0.incompleteIcon
	local f1_local2 = f1_local0.completeIcon
	if f1_local1 ~= "" and f1_local2 ~= "" then
		if f1_arg1.isComplete then
			local f1_local3 = f1_local2
		end
		CoD.SetMaterial( f1_arg0.seasonIcon, RegisterMaterial( f1_local3 or f1_local1 ) )
	end
	f1_arg0.star:setAlpha( f1_arg1.isComplete and 1 or 0 )
	f1_arg0.completionText:setText( Engine.ToUpperCase( Engine.Localize( f1_arg1.isComplete and "@DEPOT_COMPLETE" or "@DEPOT_INCOMPLETE" ) ) )
	f1_arg0.collectionsCompleted:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f1_arg1.numSetsCompleted, f1_arg1.totalNumSets ) )
	f1_arg0.operationName:setText( Engine.Localize( f1_local0.name ) )
	f1_arg0.desc:setText( Engine.Localize( "DEPOT_INCOMPLETE_DETAILS_X", f1_local0.shortName ) )
	if f1_arg1.isComplete == true then
		f1_arg0.collectionsCompleted:animateToState( "complete" )
		f1_arg0.completionText:animateToState( "complete" )
		f1_arg0.bigLaurel:animateToState( "complete" )
		f1_arg0.operationName:animateToState( "complete" )
		f1_arg0.collectionsText:animateToState( "complete" )
	else
		f1_arg0.collectionsCompleted:animateToState( "default" )
		f1_arg0.completionText:animateToState( "default" )
		f1_arg0.bigLaurel:animateToState( "default" )
		f1_arg0.operationName:animateToState( "default" )
		f1_arg0.collectionsText:animateToState( "default" )
	end
end

LUI.MPDepotCollectionOperationBountyDetails.new = function ( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.CreateState( f2_arg1.left, f2_arg1.top, f2_arg1.right, f2_arg1.bottom, f2_arg1.anchor )
	f2_local0.width = f2_arg1.width
	f2_local0.height = f2_arg1.height
	local self = LUI.UIElement.new( f2_local0 )
	self:setClass( LUI.MPDepotCollectionOperationBountyDetails )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Top ) )
	self:addElement( self )
	local f2_local3 = CoD.TextSettings.Font21
	local f2_local4 = 50
	local f2_local5 = CoD.CreateState( nil, f2_local4, nil, nil, CoD.AnchorTypes.Top )
	f2_local5.font = f2_local3.Font
	f2_local5.color = Colors.h1.medium_grey
	f2_local5.height = f2_local3.Height
	local self = LUI.UIText.new( f2_local5 )
	self:registerAnimationState( "complete", {
		color = Colors.white
	} )
	self.collectionsCompleted = self
	self:addElement( self )
	local f2_local7 = CoD.TextSettings.Font28
	local f2_local8 = CoD.CreateState( nil, -f2_local7.Height / 2 + f2_local4 + f2_local7.Height + 10, nil, nil, CoD.AnchorTypes.Top )
	f2_local8.font = f2_local7.Font
	f2_local8.color = Colors.h1.medium_grey
	f2_local8.height = f2_local7.Height
	local self = LUI.UIText.new( f2_local8 )
	self:setText( Engine.Localize( "@DEPOT_COLLECTIONS" ) )
	self:registerAnimationState( "complete", {
		color = Colors.white
	} )
	self.collectionsText = self
	self:addElement( self )
	local f2_local10 = RegisterMaterial( "h1_laurel_reward" )
	local f2_local11 = Engine.GetMaterialAspectRatio( f2_local10 )
	local f2_local12 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f2_local12.material = f2_local10
	f2_local12.alpha = 0.5
	f2_local12.width = f2_arg1.height * 1.1
	f2_local12.height = f2_local12.width / f2_local11
	
	local bigLaurel = LUI.UIImage.new( f2_local12 )
	self:addElement( bigLaurel )
	self.bigLaurel = bigLaurel
	
	bigLaurel:registerAnimationState( "complete", {
		alpha = 1
	} )
	local self = LUI.UIElement.new( CoD.CreateState( nil, 100, nil, nil, CoD.AnchorTypes.None ) )
	self:addElement( self )
	local f2_local15 = 50
	local f2_local16 = false
	local f2_local17 = {
		rewardContainerState = CoD.CreateState( 0, -f2_local15 * 0.05, 0, -f2_local15 * 0.05, CoD.AnchorTypes.None ),
		numLeaves = 10,
		startLeafHeight = 10,
		endLeafHeight = 8,
		startAngle = 75,
		endAngle = -75,
		spacing = 1.5,
		yOffset = 0
	}
	local f2_local18
	if f2_local16 then
		f2_local18 = 750
		if not f2_local18 then
		
		else
			f2_local17.growTime = f2_local18
			f2_local17.numSimultaneouslyGrowingLeaves = 3
			f2_local17.animateCenter = f2_local16
			f2_local17.hideStaticAssets = true
			f2_local17.widthAdjustment = 100
			f2_local17.heightAdjustment = 175
			LUI.MPDepotCollectionRewardSplash.AddRewardWidget( self, f2_local17 )
			f2_local18 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
			f2_local18.material = RegisterMaterial( "collection_season1_incomplete" )
			local f2_local19 = Engine.GetMaterialAspectRatio( f2_local18.material )
			f2_local18.width = f2_arg1.height * 0.4
			f2_local18.height = f2_local18.width / f2_local19
			local self = LUI.UIImage.new( f2_local18 )
			self.seasonIcon = self
			self:addElement( self )
			local self = LUI.UIElement.new( CoD.CreateState( nil, 30, nil, nil, CoD.AnchorTypes.Bottom ) )
			self:addElement( self )
			local f2_local22 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Top )
			f2_local22.width = 175
			f2_local22.height = 2
			local f2_local23 = LUI.Divider.new( f2_local22, nil, LUI.Divider.Grey, 4 )
			self:addElement( f2_local23 )
			local f2_local24 = RegisterMaterial( "collection_complete_star_icon" )
			local f2_local25 = Engine.GetMaterialAspectRatio( f2_local24 )
			local f2_local26 = 25
			local f2_local27 = f2_local26 / f2_local25
			local f2_local28 = CoD.CreateState( nil, -f2_local27 / 2 - 3, nil, nil, CoD.AnchorTypes.None )
			f2_local28.material = f2_local24
			f2_local28.width = f2_local26
			f2_local28.height = f2_local27
			local self = LUI.UIImage.new( f2_local28 )
			self.star = self
			f2_local23:addElement( self )
			local f2_local30 = CoD.TextSettings.Font34
			local f2_local31 = 35
			local f2_local32 = CoD.CreateState( nil, -f2_local30.Height / 2 + f2_local31, nil, nil, CoD.AnchorTypes.Top )
			f2_local32.font = f2_local30.Font
			f2_local32.color = Colors.h1.medium_grey
			f2_local32.height = f2_local30.Height
			local self = LUI.UIText.new( f2_local32 )
			self:registerAnimationState( "complete", {
				color = Colors.white
			} )
			self.operationName = self
			self:addElement( self )
			local f2_local34 = CoD.TextSettings.Font24
			local f2_local35 = CoD.CreateState( nil, -f2_local34.Height / 2 + f2_local31 + f2_local34.Height + 5, nil, nil, CoD.AnchorTypes.Top )
			f2_local35.font = f2_local34.Font
			f2_local35.color = Colors.h1.medium_grey
			f2_local35.height = f2_local34.Height
			local self = LUI.UIText.new( f2_local35 )
			self:registerAnimationState( "complete", {
				color = Colors.white
			} )
			self.completionText = self
			self:addElement( self )
			local f2_local37 = 220
			local f2_local38 = CoD.TextSettings.Font21
			local f2_local39 = CoD.CreateState( -200, 140, nil, nil, CoD.AnchorTypes.Left )
			f2_local39.width = f2_local37
			f2_local39.height = f2_local38.Height
			f2_local39.font = f2_local38.Font
			f2_local39.color = Colors.h1.light_green
			f2_local39.alignment = LUI.Alignment.Left
			local self = LUI.UIText.new( f2_local39 )
			self.desc = self
			self:addElement( self )
			return self
		end
	end
	f2_local18 = 10
end

LUI.MenuBuilder.registerType( "MPDepotCollectionOperationBountyDetails", LUI.MPDepotCollectionOperationBountyDetails.new )
LockTable( _M )
