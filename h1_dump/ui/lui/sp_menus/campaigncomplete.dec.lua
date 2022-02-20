local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CampaignCompleteMenu( f1_arg0, f1_arg1 )
	if not Engine.GetDvarBool( "arcademode_full" ) then
		Engine.ExecNow( "profile_menuDvarsSetup" )
		Engine.SetDvarBool( "profileMenuOption_resumeIsGameCompleted", true )
		Engine.ExecNow( "profile_menuDvarsFinish" )
		Engine.Exec( "updategamerprofile" )
	end
	local self = LUI.UIImage.new( {
		material = Engine.GetDvarBool( "arcademode_full" ) and RegisterMaterial( "victory_sas" ) or RegisterMaterial( "victory" ),
		top = -300,
		width = 1000,
		height = 563,
		alpha = 0
	} )
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:animateInSequence( {
		{
			"default",
			0
		},
		{
			"show",
			1000
		}
	} )
	local f1_local1 = 590
	local text = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		top = f1_local1,
		bottom = f1_local1 + CoD.TextSettings.BodyFont18.Height,
		font = CoD.TextSettings.BodyFont18.Font,
		alignment = LUI.Alignment.Center,
		alpha = 0
	} )
	text:registerAnimationState( "show", {
		alpha = 1
	} )
	if Engine.IsConsoleGame() or Engine.IsGamepadEnabled() then
		text:setText( Engine.Localize( "@AIRPLANE_MAIN_MENU" ) )
	else
		text:setText( Engine.Localize( "@AIRPLANE_MAIN_MENU_PC" ) )
	end
	self:addElement( text )
	self.text = text
	
	self.skipLocked = true
	self:addElement( LUI.UITimer.new( 3000, "enable_quit", nil, true ) )
	self:registerEventHandler( "enable_quit", function ( element, event )
		element.text:animateToState( "show", 300 )
		element.skipLocked = false
	end )
	local f1_local3 = function ( f3_arg0, f3_arg1 )
		if f3_arg0.skipLocked then
			return 
		else
			Engine.PlaySound( CoD.SFX.MenuAccept )
			Engine.PopupClosed( f3_arg1.controller, "accept_normal" )
			LUI.FlowManager.RequestCloseAllMenus( f3_arg0 )
		end
	end
	
	local self = LUI.UIBindButton.new()
	self:registerEventHandler( "button_start", f1_local3 )
	self:registerEventHandler( "button_action", f1_local3 )
	self:registerEventHandler( "button_secondary", f1_local3 )
	self.handlePrimary = true
	self:addElement( self )
	return self
end

LUI.MenuBuilder.registerType( "AIRPLANE_CAMPAIGN_COMPLETED", CampaignCompleteMenu )
LockTable( _M )
