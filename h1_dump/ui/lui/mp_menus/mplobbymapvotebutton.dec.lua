local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyMapVoteButton = InheritFrom( LUI.UIElement )
LUI.MPLobbyMapVoteButton.Font = BodyFont18
LUI.MPLobbyMapVoteButton.RightTextOffset = 15
LUI.MPLobbyMapVoteButton.Refresh = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	f1_arg0.leftText:setText( f1_arg1 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = nil
	if f1_arg2 ~= "" and f1_arg2 ~= nil then
		f1_arg0.gameModeText:setText( f1_arg2 )
		f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg2, f1_arg0.leftTextState.font, LUI.MPLobbyMap.SubLabelTextHeight )
		f1_arg0.gameModeBg:registerAnimationState( "adjustedAndVisible", {
			leftAnchor = true,
			width = f1_local2 + 9,
			left = 5,
			alpha = 1
		} )
		f1_arg0.gameModeBg:animateToState( "adjustedAndVisible" )
	end
	if f1_arg5 ~= true then
		local f1_local4, f1_local5, f1_local6, f1_local7 = GetTextDimensions( f1_arg3, f1_arg0.rightTextState.font, f1_arg0.rightTextState.height )
		f1_local3 = f1_local7
		f1_local2 = f1_local6
		f1_local1 = f1_local5
		f1_arg0.rightTextState.left = LUI.MPLobbyMapVote.Width - f1_local2 - f1_local4 + LUI.MPLobbyMapVoteButton.RightTextOffset
		f1_arg0.rightText:registerAnimationState( "default", f1_arg0.rightTextState )
		f1_arg0.rightText:animateToState( "default" )
		f1_arg0.rightText:setText( f1_arg3 )
	else
		f1_arg0.rightText:hide()
	end
	local f1_local4 = RegisterMaterial( f1_arg4 )
	local f1_local5, f1_local6 = GetMaterialDimensions( f1_local4 )
	f1_arg0:registerAnimationState( "updateDimensions", {
		height = LUI.MPLobbyMapVote.Height,
		width = LUI.MPLobbyMapVote.Height * f1_local5 / f1_local6
	} )
	f1_arg0:animateToState( "updateDimensions" )
	f1_arg0.image:registerAnimationState( "updateImage", {
		material = f1_local4
	} )
	f1_arg0.image:animateToState( "updateImage" )
end

LUI.MPLobbyMapVoteButton.SetColor = function ( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.MPLobbyMapVoteButton.Font.Height / 2
	local f2_local1 = f2_arg0.leftTextState
	f2_local1.color = f2_arg1
	f2_arg0.leftText:registerAnimationState( "default", f2_local1 )
	f2_arg0.leftText:animateToState( "default" )
	local f2_local2 = f2_arg0.rightTextState
	f2_local2.color = f2_arg1
	f2_arg0.rightText:registerAnimationState( "default", f2_local2 )
	f2_arg0.rightText:animateToState( "default" )
end

LUI.MPLobbyMapVoteButton.Disable = function ( f3_arg0 )
	f3_arg0.border:registerAnimationState( "up", {
		alpha = 0
	} )
	f3_arg0.border:registerAnimationState( "over", {
		alpha = 0
	} )
	f3_arg0.border:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f3_arg0.border:animateToState( "hidden" )
	f3_arg0:makeNotFocusable()
	if not f3_arg0.winning then
		f3_arg0:registerAnimationState( "lighten", {
			alpha = 0.2
		} )
		f3_arg0:animateToState( "lighten" )
	end
end

LUI.MPLobbyMapVoteButton.new = function ()
	local self = LUI.UIButton.new( {
		leftAnchor = true,
		topAnchor = true
	} )
	self:setClass( LUI.MPLobbyMapVoteButton )
	self.winning = false
	self.image = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( self.image )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		bottomAnchor = true,
		height = LUI.MPLobbyMap.SubLabelTextHeight + 6,
		left = 4,
		bottom = -LUI.MPLobbyMap.SubTextBgVerticalOffset,
		alpha = 0,
		material = RegisterMaterial( "white" ),
		color = {
			r = 0.14,
			g = 0.14,
			b = 0.14
		}
	} )
	self:addElement( self )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		height = LUI.MPLobbyMap.SubLabelTextHeight,
		textAlignment = LUI.Alignment.Center,
		left = -1,
		top = -4.5,
		font = LUI.MPLobbyMapVoteButton.Font.Font,
		color = {
			r = 0.82,
			g = 0.82,
			b = 0.82
		}
	} )
	self:addElement( self )
	self:registerEventHandler( "update_header_text", updateHeaderText )
	self.gameModeBg = self
	self.gameModeText = self
	local f4_local3 = {
		leftAnchor = true,
		bottomAnchor = true,
		height = LUI.MPLobbyMap.LabelTextHeight,
		left = LUI.MPLobbyMap.TextHorizontalOffset,
		bottom = -LUI.MPLobbyMap.TextVerticalOffset,
		font = LUI.MPLobbyMapVoteButton.Font.Font,
		color = Colors.white,
		alignment = LUI.HorizontalAlignment.Left
	}
	local self = LUI.UIText.new( f4_local3 )
	self.id = "leftText"
	self.leftText = self
	self.leftTextState = f4_local3
	self.leftText:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:addElement( self )
	local f4_local5 = {
		leftAnchor = true,
		bottomAnchor = true,
		height = LUI.MPLobbyMap.NumberTextHeight,
		bottom = -(LUI.MPLobbyMap.TextVerticalOffset - 4),
		font = LUI.MPLobbyMapVoteButton.Font.Font,
		color = Colors.white,
		alignment = LUI.HorizontalAlignment.Left
	}
	local self = LUI.UIText.new( f4_local5 )
	self.id = "rightText"
	self.rightText = self
	self.rightTextState = f4_local5
	self.rightText:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:addElement( self )
	local f4_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local7.borderThickness = 2
	f4_local7.alpha = 0
	f4_local7.color = LUI.MPLobbyMap.BorderGrey
	self.greyBorder = LUI.UIBorder.new( f4_local7 )
	self:addElement( self.greyBorder )
	f4_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local7.alpha = 0
	f4_local7.material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	local self = LUI.UIImage.new( f4_local7 )
	self:setup9SliceImage()
	self:addElement( self )
	self:registerAnimationState( "up", f4_local7 )
	self:registerAnimationState( "over", {
		alpha = 1
	} )
	self:registerEventHandler( "button_over", MBh.AnimateToState( "over" ) )
	self:registerEventHandler( "button_up", MBh.AnimateToState( "up", 250 ) )
	self:animateToState( "up" )
	self.border = self
	return self
end

LockTable( _M )
