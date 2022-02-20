local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AARMedals = InheritFrom( LUI.UIElement )
f0_local0 = nil
function GenerateUnlockedCards()
	local f1_local0 = AAR.GetMedalsData( f0_local0 )
	local f1_local1 = {}
	for f1_local2 = 1, #f1_local0, 1 do
		local f1_local5 = LUI.AARGrid.GenericUnlockCard()
		local f1_local6 = f1_local0[f1_local2]
		local f1_local7 = LUI.AARGrid.UnlockedCardWidth / 1.5
		local f1_local8 = f1_local7
		local f1_local9 = -20
		local f1_local10 = CoD.CreateState( nil, f1_local9, nil, nil, CoD.AnchorTypes.Top )
		f1_local10.height = f1_local7
		f1_local10.width = f1_local8
		f1_local10.material = f1_local6.icon
		f1_local5:addElement( LUI.UIImage.new( f1_local10 ) )
		local f1_local11 = CoD.TextSettings.Font40
		local f1_local12 = f1_local8 + f1_local9 + 3
		local f1_local13 = CoD.CreateState( nil, f1_local12, nil, nil, CoD.AnchorTypes.Top )
		local f1_local14, f1_local15, f1_local16, f1_local17 = GetTextDimensions( f1_local6.count, f1_local11.Font, f1_local11.Height )
		f1_local13.width = f1_local16 - f1_local14
		f1_local13.height = f1_local11.Height
		f1_local13.font = f1_local11.Font
		local self = LUI.UIText.new( f1_local13 )
		self:setText( f1_local6.count )
		f1_local5:addElement( self )
		local f1_local19 = f1_local12 + f1_local11.Height
		local f1_local20 = 1
		local f1_local21 = CoD.CreateState( nil, f1_local19, nil, nil, CoD.AnchorTypes.Top )
		f1_local21.height = f1_local20
		f1_local21.width = 19
		f1_local21.color = Colors.h1.medium_grey
		f1_local21.material = RegisterMaterial( "white" )
		f1_local5:addElement( LUI.UIImage.new( f1_local21 ) )
		local f1_local22 = CoD.TextSettings.Font21
		local f1_local23 = f1_local19 + f1_local20 + 7
		local f1_local24 = CoD.CreateState( nil, f1_local23, nil, nil, CoD.AnchorTypes.Top )
		local f1_local25, f1_local26, f1_local27, f1_local28 = GetTextDimensions( f1_local6.name, f1_local22.Font, f1_local22.Height )
		f1_local24.width = f1_local27 - f1_local25
		f1_local24.height = f1_local22.Height
		f1_local24.font = f1_local22.Font
		f1_local24.color = Colors.h1.light_green
		local self = LUI.UIText.new( f1_local24 )
		self:setText( f1_local6.name )
		f1_local5:addElement( self )
		local f1_local30 = CoD.TextSettings.Font15
		local f1_local31 = CoD.CreateState( nil, f1_local23 + f1_local22.Height + 2, nil, nil, CoD.AnchorTypes.Top )
		f1_local31.width = LUI.AARGrid.UnlockedCardWidth - 7
		f1_local31.height = f1_local30.Height
		f1_local31.font = f1_local30.Font
		f1_local31.color = Colors.h1.light_grey
		f1_local31.alignment = LUI.Alignment.Center
		local self = LUI.UIText.new( f1_local31 )
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

LUI.AARMedals.GetTabLabel = function ()
	return "@LUA_MENU_MEDALS_CAPS"
end

LUI.AARMedals.new = function ( f5_arg0, f5_arg1 )
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
	self:setClass( LUI.AARMedals )
	local f5_local2 = LUI.MenuBuilder.BuildRegisteredType( "AARGrid", {
		unlockedCards = GenerateUnlockedCards()
	} )
	self.grid = f5_local2
	self:addElement( f5_local2 )
	return self
end

LUI.MenuBuilder.registerType( "aar_medals_main", LUI.AARMedals.new )
LockTable( _M )
