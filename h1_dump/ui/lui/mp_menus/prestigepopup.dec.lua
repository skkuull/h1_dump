local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.PrestigePopup = InheritFrom( LUI.UIElement )
f0_local0 = 300
f0_local1 = 20
f0_local2 = 180
local f0_local3 = 36
function AddDivider( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.CreateState
	local self = f1_arg1.left
	local f1_local2 = f1_arg1.top
	local f1_local3, f1_local4 = nil
	local f1_local5 = f1_arg1.anchorType
	if not f1_local5 then
		f1_local5 = CoD.AnchorTypes.TopLeft
	end
	f1_local0 = f1_local0( self, f1_local2, f1_local3, f1_local4, f1_local5 )
	f1_local0.material = RegisterMaterial( "white" )
	self = f1_arg1.color
	if not self then
		self = Colors.h1.light_grey
	end
	f1_local0.color = self
	f1_local0.width = f1_arg1.width
	f1_local0.height = f1_arg1.height
	self = LUI.UIImage.new( f1_local0 )
	self.defState = f1_local0
	f1_arg0:addElement( self )
end

function AddTitle( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.localizedText
	local f2_local1, f2_local2, f2_local3, f2_local4 = GetTextDimensions( f2_local0, f2_arg1.font.Font, f2_arg1.font.Height )
	local f2_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f2_local5.font = f2_arg1.font.Font
	f2_local5.color = f2_arg1.color
	f2_local5.width = f2_local3 - f2_local1
	f2_local5.height = f2_arg1.font.Height
	local self = LUI.UIText.new( f2_local5 )
	if f2_arg1.textKey == DEF_PRESTIGE_TITLE_KEY then
		local f2_local7 = self
	end
	f2_arg0.prestigeTitle = f2_local7 or nil
	self:setText( f2_local0 )
	f2_arg0:addElement( self )
	local f2_local8 = {
		left = 1,
		top = f2_arg1.dividerTopGap + f2_arg1.font.Height,
		width = 20,
		height = 1,
		color = Colors.h1.light_green
	}
	AddDivider( self, f2_local8 )
	return f2_local8.height + f2_local8.top
end

function AddDesc( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.Localize( f3_arg1.textKey )
	local f3_local1, f3_local2, f3_local3, f3_local4 = GetTextDimensions( f3_local0, f3_arg1.font.Font, f3_arg1.font.Height )
	local f3_local5 = CoD.CreateState( nil, f3_arg1.top, nil, nil, CoD.AnchorTypes.TopLeft )
	f3_local5.font = f3_arg1.font.Font
	f3_local5.color = f3_arg1.color
	f3_local5.alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left )
	f3_local5.width = 255
	f3_local5.lineSpacingRatio = 0.3
	f3_local5.height = f3_arg1.font.Height
	local self = LUI.UIText.new( f3_local5 )
	self:setText( f3_local0 )
	f3_arg0:addElement( self )
end

function AddContent( f4_arg0, f4_arg1 )
	local f4_local0 = 100
	local f4_local1 = 17
	local f4_local2 = f0_local0 - 6
	local f4_local3 = 10
	local f4_local4 = 255
	local f4_local5 = f4_local1 + f4_local2 + f4_local3 + f4_local4 + 10
	local f4_local6 = CoD.CreateState( -f4_local0, nil, f4_local0, nil, CoD.AnchorTypes.TopLeftRight )
	f4_local6.height = f0_local0
	local self = LUI.UIElement.new( f4_local6 )
	self.parent = f4_arg0
	f4_arg0:addElement( self )
	self:registerEventHandler( "gamepad_button", OnSpendTokensButtonInput )
	local f4_local8 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local8.material = RegisterMaterial( "h1_aar_item_gradient" )
	self:addElement( LUI.UIImage.new( f4_local8 ) )
	local f4_local9 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local9.material = RegisterMaterial( "h1_ui_dot_pattern" )
	f4_local9.alpha = 0.7
	local self = LUI.UIImage.new( f4_local9 )
	self:setupTiles( 5 )
	self:addElement( self )
	local f4_local11 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f4_local11.width = f4_local5
	f4_local11.height = f4_local6.height - 30
	local self = LUI.UIElement.new( f4_local11 )
	self:addElement( self )
	local f4_local13 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local13.material = RegisterMaterial( "black" )
	f4_local13.alpha = 0.1
	self:addElement( LUI.UIImage.new( f4_local13 ) )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	local f4_local14 = f4_local6.height - 8
	local f4_local15 = CoD.CreateState( f4_local1, nil, nil, nil, CoD.AnchorTypes.Left )
	f4_local15.width = f4_local14
	f4_local15.height = f4_local14
	f4_local15.material = RegisterMaterial( "rank_prestige" .. f4_arg1 )
	self:addElement( LUI.UIImage.new( f4_local15 ) )
	local f4_local16 = CoD.CreateState( f4_local14 + f4_local1 + f4_local3, nil, nil, nil, CoD.AnchorTypes.Left )
	f4_local16.width = f4_local4
	f4_local16.height = f4_local11.height - 25
	f4_local16.scale = -0.05
	local self = LUI.UIElement.new( f4_local16 )
	self:addElement( self )
	AddDesc( self, {
		top = AddTitle( self, {
			localizedText = Engine.Localize( "@LUA_MENU_PRESTIGE" ) .. " " .. f4_arg1,
			font = CoD.TextSettings.Font46,
			color = Colors.white,
			dividerTopGap = 3
		} ) + 18,
		textKey = "@LUA_MENU_PRESTIGE_PROGRESS_DESC",
		font = CoD.TextSettings.Font23,
		color = Colors.h1.light_grey
	} )
	local f4_local18 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local18.borderThickness = 1
	f4_local18.color = Colors.h1.medium_grey
	local self = LUI.UIBorder.new( f4_local18 )
	self.focusedBorder = self
	self:addElement( self )
	f4_arg0:addElement( self )
end

function AddButton( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.CreateState
	local self, f5_local2, f5_local3, f5_local4 = nil
	local f5_local5 = f5_arg1.anchorType
	if not f5_local5 then
		f5_local5 = CoD.AnchorTypes.Right
	end
	f5_local0 = f5_local0( self, f5_local2, f5_local3, f5_local4, f5_local5 )
	f5_local0.width = f0_local2
	f5_local0.height = f0_local3
	f5_local0.material = RegisterMaterial( "h1_prestige_unlock_button" )
	self = LUI.UIImage.new( f5_local0 )
	self:setup9SliceImage( 8, 8, 0.25, 0.25 )
	if Engine.IsPC() then
		self:setHandleMouseButton( true )
		self:setHandleMouseMove( true )
		self.m_requireFocusType = FocusType.MouseOver
		self:registerEventHandler( "mouseenter", function ( element, event )
			if not element:isInFocus() then
				SwitchButtonFocus( {
					from = f5_arg1.isCancel and f5_arg0.prestigeButton or f5_arg0.cancelButton,
					to = f5_arg1.isCancel and f5_arg0.cancelButton or f5_arg0.prestigeButton
				} )
			end
		end )
		self:registerEventHandler( "mouseleave", function ( element, event )
			RemoveButtonFocus( element )
		end )
		self:registerEventHandler( "leftmousedown", function ( element, event )
			if f5_arg1.isCancel then
				ExitMenu( f5_arg0, f5_arg0.parent.previousScreen )
			else
				PrestigeAction( f5_arg0, event )
			end
		end )
	end
	f5_arg0:addElement( self )
	f5_local2 = 2
	f5_local3 = CoD.TextSettings.Font19
	f5_local4 = Engine.ToUpperCase( Engine.Localize( f5_arg1.buttonTextKey ) )
	local f5_local5, f5_local6, f5_local7, f5_local8 = GetTextDimensions( f5_local4, f5_local3.Font, f5_local3.Height )
	local f5_local9 = CoD.CreateState( nil, -f5_local3.Height / 2 + f5_local2, nil, nil, CoD.AnchorTypes.None )
	f5_local9.font = f5_local3.Font
	f5_local9.color = Colors.white
	f5_local9.width = f5_local7 - f5_local5
	f5_local9.height = f5_local3.Height
	local self = LUI.UIText.new( f5_local9 )
	self:setText( f5_local4 )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "focused", {
		color = Colors.white
	} )
	self:registerAnimationState( "unfocused", {
		color = Colors.h1.light_grey
	} )
	self:addElement( self )
	if f5_arg1.isFocused then
		CoD.SetMaterial( self, RegisterMaterial( "h1_prestige_unlock_button_active" ) )
		self:animateToState( "focused" )
	end
	self.text = self
	return self
end

function ExitMenu( f9_arg0, f9_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f9_arg0 )
	f9_arg1:setFocus( true )
end

function AddButtons( f10_arg0 )
	local f10_local0 = 10
	local f10_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Bottom )
	f10_local1.width = f0_local2 * 2 + f10_local0
	f10_local1.height = f0_local3
	local self = LUI.UIElement.new( f10_local1 )
	self:registerEventHandler( "gamepad_button", OnButtonInput )
	self.parent = f10_arg0
	f10_arg0:addElement( self )
	local f10_local3 = 6
	local f10_local4 = CoD.CreateState( nil, -f10_local3, nil, f10_local3, CoD.AnchorTypes.All )
	f10_local4.material = RegisterMaterial( "black" )
	self:addElement( LUI.UIImage.new( f10_local4 ) )
	self.cancelButton = AddButton( self, {
		anchorType = CoD.AnchorTypes.Left,
		buttonTextKey = "@LUA_MENU_CANCEL_PRESTIGE",
		isFocused = true,
		isCancel = true
	} )
	self.cancelButton:setFocus( true )
	self.prestigeButton = AddButton( self, {
		anchorType = CoD.AnchorTypes.Right,
		buttonTextKey = "@LUA_MENU_ACTIVATE_PRESTIGE"
	} )
	self.prestigeButton:setFocus( false )
	local self = LUI.UIBindButton.new()
	self:registerEventHandler( "button_secondary", function ( element, event )
		ExitMenu( element, f10_arg0.previousScreen )
	end )
	f10_arg0:addElement( self )
end

function RemoveButtonFocus( f12_arg0 )
	CoD.SetMaterial( f12_arg0, RegisterMaterial( "h1_prestige_unlock_button" ) )
	f12_arg0.text:animateToState( "unfocused" )
	f12_arg0:setFocus( false )
end

function SwitchButtonFocus( f13_arg0 )
	RemoveButtonFocus( f13_arg0.from )
	CoD.SetMaterial( f13_arg0.to, RegisterMaterial( "h1_prestige_unlock_button_active" ) )
	f13_arg0.to.text:animateToState( "focused" )
	f13_arg0.to:setFocus( true )
	Engine.PlaySound( CoD.SFX.MenuScroll )
end

function PrestigeAction( f14_arg0, f14_arg1 )
	Engine.PlaySound( "h1_ui_prestige" )
	Lobby.ExecPrestigeReset( f14_arg1.controller )
	AAR.ClearAAR()
	LUI.ComScore.LogPrestige( f14_arg1.controller )
	ExitMenu( f14_arg0, f14_arg0.parent.previousScreen )
	LUI.FlowManager.RequestAddMenu( nil, "PrestigeMenu", true, f14_arg1.controller, true, {}, {
		reload = true
	} )
end

function OnButtonInput( f15_arg0, f15_arg1 )
	if f15_arg1.down == true then
		if f15_arg1.button == "right" then
			if not f15_arg0.prestigeButton:isInFocus() then
				SwitchButtonFocus( {
					from = f15_arg0.cancelButton,
					to = f15_arg0.prestigeButton
				} )
			end
		elseif f15_arg1.button == "left" then
			if not f15_arg0.cancelButton:isInFocus() then
				SwitchButtonFocus( {
					from = f15_arg0.prestigeButton,
					to = f15_arg0.cancelButton
				} )
			end
		elseif f15_arg1.button == "primary" then
			if f15_arg0.cancelButton:isInFocus() then
				ExitMenu( f15_arg0, f15_arg0.parent.previousScreen )
			elseif f15_arg0.prestigeButton:isInFocus() then
				PrestigeAction( f15_arg0, f15_arg1 )
			end
		end
	end
end

LUI.PrestigePopup.new = function ( f16_arg0, f16_arg1 )
	local f16_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.LeftRight )
	f16_local0.height = f0_local0 + f0_local1 + f0_local3
	local self = LUI.UIElement.new( f16_local0 )
	self.previousScreen = f16_arg1.parent
	self:addElement( LUI.MenuBuilder.BuildRegisteredType( "generic_popup_screen_overlay" ) )
	AddContent( self, f16_arg1.prestigeIdx )
	AddButtons( self )
	return self
end

LUI.MenuBuilder.registerPopupType( "PrestigePopup", LUI.PrestigePopup.new )
LockTable( _M )
