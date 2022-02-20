local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.Challenges = InheritFrom( LUI.UIElement )
f0_local0 = nil
function GenerateUnlockedCards()
	local f1_local0 = AAR.GetChallengesData( f0_local0 )
	local f1_local1 = {}
	for f1_local2 = 1, #f1_local0, 1 do
		local f1_local5 = LUI.AARGrid.GenericUnlockCard()
		local f1_local6 = f1_local0[f1_local2]
		local f1_local7 = Engine.GetMaterialAspectRatio( f1_local6.icon )
		local f1_local8 = LUI.AARGrid.UnlockedCardWidth / 1.55
		local f1_local9 = f1_local8 / f1_local7
		local f1_local10 = (f1_local8 - f1_local9) / 2
		local f1_local11 = -18 + f1_local10
		local f1_local12 = CoD.CreateState( nil, f1_local11, nil, nil, CoD.AnchorTypes.Top )
		f1_local12.width = f1_local8
		f1_local12.height = f1_local9
		f1_local12.material = f1_local6.icon
		f1_local5:addElement( LUI.UIImage.new( f1_local12 ) )
		local f1_local13 = CoD.TextSettings.Font21
		local f1_local14 = f1_local9 + f1_local10 + 1 + f1_local11
		local f1_local15 = CoD.CreateState( nil, f1_local14, nil, nil, CoD.AnchorTypes.Top )
		f1_local15.width = LUI.AARGrid.UnlockedCardWidth - 15
		f1_local15.height = f1_local13.Height
		f1_local15.font = f1_local13.Font
		f1_local15.color = Colors.h1.light_green
		f1_local15.alignment = LUI.Alignment.Center
		local self = LUI.UIText.new( f1_local15 )
		self:setText( f1_local6.name )
		f1_local5:addElement( self )
		local f1_local17 = LUI.AARGrid.UnlockedCardWidth - 20
		local f1_local18 = CoD.TextSettings.Font15
		local f1_local19 = CoD.CreateState( nil, f1_local14 + f1_local13.Height * 2 + 5, nil, nil, CoD.AnchorTypes.Top )
		f1_local19.width = f1_local17
		f1_local19.height = f1_local18.Height
		f1_local19.font = f1_local18.Font
		f1_local19.color = Colors.h1.light_grey
		f1_local19.alignment = LUI.Alignment.Center
		local self = LUI.UIText.new( f1_local19 )
		self:setText( f1_local6.desc )
		f1_local5:addElement( self )
		table.insert( f1_local1, f1_local5 )
	end
	return f1_local1
end

function OnGainedFocus( f2_arg0, f2_arg1 )
	f2_arg0:setAlpha( 1 )
	f2_arg0.grid:SetInputEnabled( true )
end

function OnLostFocus( f3_arg0, f3_arg1 )
	f3_arg0:setAlpha( 0 )
	f3_arg0.grid:SetInputEnabled( false )
end

LUI.Challenges.GetTabLabel = function ()
	return "@LUA_MENU_CHALLENGES_CAPS"
end

LUI.Challenges.new = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.controller
	if not f5_local0 then
		f5_local0 = Engine.GetFirstActiveController()
	end
	f0_local0 = f5_local0
	f5_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f5_local0.alpha = 0
	local self = LUI.UIElement.new( f5_local0 )
	self:registerEventHandler( "gainedFocus", OnGainedFocus )
	self:registerEventHandler( "lostFocus", OnLostFocus )
	self:setClass( LUI.Challenges )
	local f5_local2 = LUI.MenuBuilder.BuildRegisteredType( "AARGrid", {
		unlockedCards = GenerateUnlockedCards()
	} )
	self.grid = f5_local2
	self:addElement( f5_local2 )
	return self
end

LUI.MenuBuilder.registerType( "aar_challenges_main", LUI.Challenges.new )
LockTable( _M )
