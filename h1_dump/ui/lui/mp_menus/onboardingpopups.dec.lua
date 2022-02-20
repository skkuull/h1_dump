local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.OnboardingPopups = {}
f0_local0 = LUI.GenericPopupPanel.defWidth
f0_local1 = LUI.GenericPopupPanel.defHeight
f0_local2 = f0_local1 - 50
local f0_local3 = 135
local f0_local4 = 1
local f0_local5 = (f0_local1 - f0_local2) / 2
LUI.OnboardingPopups.DEPOT = 1
LUI.OnboardingPopups.SUPPLY_DROPS = 2
LUI.OnboardingPopups.COLLECTIONS = 3
local f0_local6 = {
	{
		titleKey = "@DEPOT_DEPOT",
		dataChunks = {
			{
				imageKey = "depot_currency_cp",
				titleKey = "@DEPOT_COD_POINTS",
				descKey = "@DEPOT_COD_POINTS_DESC",
				canShowFunc = CoD.IsCPEnabled
			},
			{
				imageKey = "depot_currency_credit",
				titleKey = "@LUA_MENU_DEPOT_CREDITS",
				descKey = "@DEPOT_DEPOT_CREDITS_DESC"
			},
			{
				imageKey = "depot_crate_common",
				titleKey = "@DEPOT_SUPPLY_DROPS",
				descKey = "@DEPOT_SUPPLY_DROPS_DESC"
			}
		}
	},
	{
		titleKey = "@DEPOT_SUPPLY_DROPS",
		dataChunks = {
			{
				imageKey = "depot_crate_rare",
				titleKey = "@DEPOT_RARE_SUPPLY_DROPS",
				descKey = "@DEPOT_RARE_SUPPLY_DROPS_DESC"
			},
			{
				imageKey = "h1_depot_parts",
				titleKey = "@DEPOT_DUPLICATE_ITEMS",
				descKey = "@DEPOT_DUPLICATE_ITEMS_DESC"
			},
			{
				imageKey = "depot_parts_icon",
				titleKey = "@DEPOT_PARTS",
				descKey = "@DEPOT_PARTS_DESC"
			}
		}
	},
	{
		titleKey = "@DEPOT_COLLECTIONS_TITLE",
		dataChunks = {
			{
				imageKey = "h1_depot_collection",
				titleKey = "@DEPOT_COLLECTIONS_TITLE",
				descKey = "@DEPOT_COLLECTIONS_DESC"
			},
			{
				imageKey = "collection_reward_locked",
				titleKey = "@DEPOT_BOUNTIES",
				descKey = "@DEPOT_BOUNTIES_DESC",
				canShowFunc = CollectionRewardsEnabled
			},
			{
				imageKey = "h1_depot_crafting_icon",
				titleKey = "@DEPOT_CRAFTING",
				descKey = "@DEPOT_CRAFTING_DESC"
			}
		}
	}
}
function AddOnboardingDataChunk( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.CreateState( -f0_local3 / 2 + (f1_arg1.left or 0), -f0_local2 / 2 + f1_arg1.top, nil, nil, CoD.AnchorTypes.Left )
	f1_local0.width = f0_local3
	f1_local0.height = f0_local2
	local self = LUI.UIElement.new( f1_local0 )
	self.defState = f1_local0
	f1_arg0:addElement( self )
	table.insert( f1_arg0.dataChunks, self )
	local f1_local2 = 21
	local f1_local3 = RegisterMaterial( f1_arg1.data.imageKey )
	local f1_local4 = Engine.GetMaterialAspectRatio( f1_local3 )
	local f1_local5 = -74 + f1_local2
	local f1_local6 = 100
	local f1_local7 = 140
	if f1_local4 == 1 then
		local f1_local8 = f1_local6
	end
	local f1_local9 = f1_local8 or f1_local7 / f1_local4
	local f1_local10
	if f1_local4 == 1 then
		f1_local10 = f1_local6 * f1_local4
		if not f1_local10 then
		
		else
			local f1_local11 = CoD.CreateState( nil, -f1_local9 / 2 + f1_local5, nil, nil, CoD.AnchorTypes.None )
			f1_local11.width = f1_local10
			f1_local11.height = f1_local9
			f1_local11.material = f1_local3
			self:addElement( LUI.UIImage.new( f1_local11 ) )
			local f1_local12 = CoD.TextSettings.Font23
			local f1_local13 = 35
			local f1_local14 = Engine.ToUpperCase
			local f1_local15 = Engine.Localize
			local f1_local16 = f1_arg1.data.titleKey
			if not f1_local16 then
				f1_local16 = ""
			end
			f1_local14 = f1_local14( f1_local15( f1_local16 ) )
			f1_local15 = -f1_local12.Height / 2 + f1_local2
			f1_local16 = CoD.CreateState( nil, f1_local15, nil, nil, CoD.AnchorTypes.None )
			f1_local16.font = f1_local12.Font
			f1_local16.color = Colors.h1.light_grey
			f1_local16.width = f0_local3 + f1_local13
			f1_local16.height = f1_local12.Height
			f1_local16.alignment = LUI.Alignment.Center
			local self = LUI.UIText.new( f1_local16 )
			self:setText( f1_local14 )
			self:addElement( self )
			local f1_local18 = CoD.TextSettings.Font21
			local f1_local19 = 3
			local f1_local20 = Engine.Localize
			local f1_local21 = f1_arg1.data.descKey
			if not f1_local21 then
				f1_local21 = ""
			end
			f1_local20 = f1_local20( f1_local21 )
			f1_local21 = CoD.CreateState( nil, f1_local15 + f1_local12.Height + f1_local19, nil, nil, CoD.AnchorTypes.None )
			f1_local21.font = f1_local18.Font
			f1_local21.color = Colors.h1.light_grey
			f1_local21.width = f0_local3
			f1_local21.height = f1_local18.Height
			f1_local21.alignment = LUI.Alignment.Center
			f1_local21.lineSpacingRatio = 0.3
			local self = LUI.UIText.new( f1_local21 )
			self:setText( f1_local20 )
			self:addElement( self )
		end
	end
	f1_local10 = f1_local7
end

function AddDivider( f2_arg0, f2_arg1 )
	local f2_local0 = CoD.CreateState
	local self = f2_arg1.left
	local f2_local2 = f2_arg1.top
	local f2_local3, f2_local4 = nil
	local f2_local5 = f2_arg1.anchorType
	if not f2_local5 then
		f2_local5 = CoD.AnchorTypes.TopLeft
	end
	f2_local0 = f2_local0( self, f2_local2, f2_local3, f2_local4, f2_local5 )
	f2_local0.material = RegisterMaterial( "white" )
	self = f2_arg1.color
	if not self then
		self = Colors.h1.light_grey
	end
	f2_local0.color = self
	f2_local0.alpha = f2_arg1.defAlpha or 1
	f2_local0.width = f2_arg1.width
	f2_local0.height = f2_arg1.height or 1
	self = LUI.UIImage.new( f2_local0 )
	self.id = f2_arg1.id
	self.defState = f2_local0
	f2_arg0:addElement( self )
	return width, self
end

function CreateOnboardingContentContainer( f3_arg0 )
	local f3_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f3_local0.width = f3_arg0.width or f0_local0
	f3_local0.height = f3_arg0.height or f0_local1
	local self = LUI.UIElement.new( f3_local0 )
	local f3_local2 = -(f3_local0.height - f0_local1) / 2
	local f3_local3 = (f0_local0 - f0_local3 * #f3_arg0.dataChunks + f0_local4 * (#f3_arg0.dataChunks - 1)) / #f3_arg0.dataChunks * 2 * 2
	self.horizGap = f3_local3 / 2
	local f3_local4 = f0_local2
	local f3_local5 = {
		defAlpha = 0.5,
		left = 0,
		top = -f3_local4 / 2 + f3_local2,
		anchorType = CoD.AnchorTypes.Left,
		width = f0_local4,
		height = f3_local4
	}
	self.dataChunks = {}
	for f3_local6 = 1, #f3_arg0.dataChunks, 1 do
		if f3_arg0.dataChunks[f3_local6].canShowFunc == nil or f3_arg0.dataChunks[f3_local6].canShowFunc() == true then
			AddOnboardingDataChunk( self, {
				top = f3_local2,
				data = f3_arg0.dataChunks[f3_local6]
			} )
		end
	end
	local f3_local6 = 3
	local f3_local7 = #self.dataChunks
	f3_local3 = f3_local3 + (f0_local3 + f3_local3) * (f3_local6 - f3_local7) / 2
	local f3_local8 = f0_local3 + f3_local3
	local f3_local9 = (f0_local0 - f0_local3 * f3_local7 + f3_local3 * (f3_local7 - 1)) / 2
	for f3_local10 = 1, f3_local7, 1 do
		local f3_local13 = self.dataChunks[f3_local10]
		f3_local13.defState.left = f3_local9 + f3_local8 * (f3_local10 - 1)
		f3_local13:registerAnimationState( "shiftRight", f3_local13.defState )
		f3_local13:animateToState( "shiftRight" )
		if f3_local10 ~= f3_local7 then
			f3_local5.left = f3_local9 + f0_local3 * f3_local10 + f3_local3 * (f3_local10 - 1) + f3_local3 / 2
			AddDivider( self, f3_local5 )
		end
	end
	return self
end

function OnDepotPopupButtonAction( f4_arg0, f4_arg1 )
	LUI.FlowManager.RequestAddMenu( f4_arg0, "MPDepotOpenLootMenu", true, f4_arg1.controller, false, {
		onBoarding = true
	} )
	LUI.FlowManager.RequestLeaveMenu( f4_arg0 )
end

LUI.OnboardingPopups.Depot = function ( f5_arg0 )
	local f5_local0 = GenericTitleBarDims.TitleBarHeight
	local f5_local1 = f0_local1 + f5_local0 + f0_local5
	local f5_local2 = CreateOnboardingContentContainer( {
		height = f5_local1,
		dataChunks = f0_local6[LUI.OnboardingPopups.DEPOT].dataChunks
	} )
	local f5_local3 = CoD.CreateState( nil, nil, nil, -f0_local5, CoD.AnchorTypes.Bottom )
	f5_local3.width = f0_local0 - f5_local2.horizGap * 2
	f5_local3.height = f5_local0
	local f5_local4 = {
		titleKeys = {
			"@DEPOT_WELCOME_TO_THE_DEPOT"
		},
		panels = {
			f5_local2
		},
		replaceWithSelect = true,
		hideBackButton = true,
		panelHeight = f5_local1,
		btnProps = {
			{
				text = Engine.ToUpperCase( Engine.Localize( "@DEPOT_OPEN_A_SUPPLY_DROP" ) ),
				defState = f5_local3,
				actionFunc = OnDepotPopupButtonAction
			}
		}
	}
	local f5_local5 = LUI.FlowManager.RequestAddMenu
	local f5_local6 = nil
	local f5_local7 = "GenericPopupPanel"
	local f5_local8 = true
	local f5_local9
	if not f5_arg0 or not f5_arg0.controller then
		f5_local9 = Engine.GetFirstActiveController()
		if not f5_local9 then
		
		else
			f5_local5( f5_local6, f5_local7, f5_local8, f5_local9, false, f5_local4 )
		end
	end
	f5_local9 = f5_arg0.controller
end

LUI.OnboardingPopups.SupplyDrop = function ( f6_arg0 )
	local f6_local0 = {
		titleKeys = {
			f0_local6[LUI.OnboardingPopups.SUPPLY_DROPS].titleKey
		}
	}
	local f6_local1 = {}
	f6_local0.panels = CreateOnboardingContentContainer( {
		dataChunks = f0_local6[LUI.OnboardingPopups.SUPPLY_DROPS].dataChunks
	} )
	f6_local1 = LUI.FlowManager.RequestAddMenu
	local f6_local2 = nil
	local f6_local3 = "GenericPopupPanel"
	local f6_local4 = true
	local f6_local5
	if not f6_arg0 or not f6_arg0.controller then
		f6_local5 = Engine.GetFirstActiveController()
		if not f6_local5 then
		
		else
			f6_local1( f6_local2, f6_local3, f6_local4, f6_local5, false, f6_local0 )
		end
	end
	f6_local5 = f6_arg0.controller
end

LUI.OnboardingPopups.Collections = function ( f7_arg0 )
	local f7_local0 = {
		titleKeys = {
			f0_local6[LUI.OnboardingPopups.COLLECTIONS].titleKey
		}
	}
	local f7_local1 = {}
	f7_local0.panels = CreateOnboardingContentContainer( {
		dataChunks = f0_local6[LUI.OnboardingPopups.COLLECTIONS].dataChunks
	} )
	f7_local1 = LUI.FlowManager.RequestAddMenu
	local f7_local2 = nil
	local f7_local3 = "GenericPopupPanel"
	local f7_local4 = true
	local f7_local5
	if not f7_arg0 or not f7_arg0.controller then
		f7_local5 = Engine.GetFirstActiveController()
		if not f7_local5 then
		
		else
			f7_local1( f7_local2, f7_local3, f7_local4, f7_local5, false, f7_local0 )
		end
	end
	f7_local5 = f7_arg0.controller
end

LUI.OnboardingPopups.All = function ( f8_arg0 )
	local f8_local0 = {
		titleKeys = {},
		panels = {}
	}
	local f8_local1
	if f8_arg0 then
		f8_local1 = f8_arg0.startingIndex
		if not f8_local1 then
		
		else
			f8_local0.startingIndex = f8_local1
			for f8_local1 = 1, #f0_local6, 1 do
				table.insert( f8_local0.titleKeys, f0_local6[f8_local1].titleKey )
				table.insert( f8_local0.panels, CreateOnboardingContentContainer( {
					dataChunks = f0_local6[f8_local1].dataChunks
				} ) )
			end
			f8_local1 = LUI.FlowManager.RequestAddMenu
			local f8_local2 = nil
			local f8_local3 = "GenericPopupPanel"
			local f8_local4 = true
			local f8_local5
			if not f8_arg0 or not f8_arg0.controller then
				f8_local5 = Engine.GetFirstActiveController()
				if not f8_local5 then
				
				else
					f8_local1( f8_local2, f8_local3, f8_local4, f8_local5, false, f8_local0 )
				end
			end
			f8_local5 = f8_arg0.controller
		end
	end
	f8_local1 = 1
end

LockTable( _M )
