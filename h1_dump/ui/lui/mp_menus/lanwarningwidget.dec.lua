local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.LANWarningWidget = InheritFrom( LUI.UIElement )
LUI.LANWarningWidget.new = function ()
	local f1_local0 = CoD.CreateState( nil, LUI.MarketingPanel.buttonTop, nil, nil, CoD.AnchorTypes.TopLeft )
	f1_local0.width = LUI.MarketingPanel.buttonWidth
	f1_local0.height = LUI.MarketingPanel.buttonHeight
	local self = LUI.UIElement.new( f1_local0 )
	local f1_local2 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f1_local2.alpha = 0.3
	f1_local2.color = {
		r = 0.2,
		b = 0.2,
		g = 0.2
	}
	self:addElement( LUI.UIImage.new( f1_local2 ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f1_local3 = LUI.MarketingPanel.buttonWidth - 71
	local f1_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f1_local4.width = f1_local3
	f1_local4.height = f1_local0.height - 50
	local self = LUI.UIElement.new( f1_local4 )
	self:addElement( self )
	local f1_local6 = CoD.TextSettings.TitleFont18
	local f1_local7 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f1_local7.width = f1_local3
	f1_local7.height = f1_local6.Height
	f1_local7.font = f1_local6.Font
	f1_local7.color = Colors.h1.light_grey
	f1_local7.alignment = LUI.Alignment.Left
	f1_local7.lineSpacingRatio = 0.7
	local self = LUI.UIText.new( f1_local7 )
	self:setText( Engine.Localize( "@LUA_MENU_LAN_WARNING" ) )
	self:addElement( self )
	local f1_local9 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.BottomLeft )
	f1_local9.width = 10
	f1_local9.height = 1
	f1_local9.color = Colors.mw1_green
	self:addElement( LUI.UIImage.new( f1_local9 ) )
	return self
end

LockTable( _M )
