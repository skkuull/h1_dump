local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ExperienceProgressBar = InheritFrom( LUI.UIElement )
LUI.ExperienceProgressBar.Padding = 46
LUI.ExperienceProgressBar.Height = 10
LUI.ExperienceProgressBar.ContainerHeight = 30
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = Game.GetOmnvar( "ui_player_xp_rank" )
	if f1_local0 ~= nil then
		LUI.ExperienceProgressBar.UpdatePlayerRank( f1_arg2, {
			value = f1_local0
		} )
	end
	local f1_local1 = Game.GetOmnvar( "ui_player_xp_pct" )
	if f1_local1 ~= nil then
		LUI.ExperienceProgressBar.UpdatePlayerXP( f1_arg3, {
			value = f1_local1,
			initialUpdate = true
		} )
	end
end

LUI.ExperienceProgressBar.UpdatePlayerXP = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.value < f2_arg0.lastEventValue
	local f2_local1 = f2_arg0:getParent()
	f2_local1 = f2_local1:getWidth()
	local f2_local2 = f2_arg1.value * f2_local1
	local f2_local3 = CoD.CreateState( 1, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
	f2_local3.width = f2_local2 - 1
	if f2_arg1.initialUpdate then
		f2_arg0:registerAnimationState( "update2", f2_local3 )
		f2_arg0:animateToState( "update2", 0 )
	else
		local f2_local4 = nil
		if f2_local0 == true or f2_arg0.loop == true then
			local f2_local5 = f2_arg0:getAnimationStateInC( "update2" )
			local f2_local6 = f2_local1 - f2_local5.right - f2_local5.left
			f2_local4 = 1200 / (f2_local6 + f2_local2 - 1) * f2_local6
			f2_arg0.loop = true
		end
		local f2_local5 = function ( f3_arg0 )
			if f2_arg0.loop == true then
				f2_arg0:animateToState( "reset", 0 )
			end
			f2_arg0.loop = false
			f2_arg0:registerAnimationState( "update2", f2_local3 )
			if f3_arg0 < 0 then
				f3_arg0 = 0
			end
			f2_arg0:animateToState( "update2", f3_arg0 )
			f2_arg0:registerEventHandler( "transition_complete_update2", function ( element, event )
				element.bar:animateToState( "half", 1000 )
				element.flareLeft:animateToState( "default", 50 )
				element.flareRight:animateToState( "default", 50 )
			end )
		end
		
		f2_arg0:registerEventHandler( "transition_complete_update2", nil )
		f2_arg0:cancelAnimateToState()
		if f2_local4 ~= nil then
			local f2_local6 = CoD.CreateState( 1, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
			f2_local6.width = f2_local1 - 1
			f2_arg0:registerAnimationState( "update2", f2_local6 )
			f2_arg0:registerEventHandler( "transition_complete_update2", function ( element, event )
				f2_local5( 1200 - f2_local4 )
			end )
			f2_arg0:animateToState( "update2", f2_local4 )
		else
			f2_local5( 1200 )
		end
		f2_arg0.bar:cancelAnimateToState()
		f2_arg0.bar:animateInSequence( {
			{
				"position",
				1
			},
			{
				"full",
				600
			},
			{
				"full",
				599
			}
		} )
		f2_arg0.flareLeft:cancelAnimateToState()
		f2_arg0.flareLeft:animateInSequence( {
			{
				"big",
				200
			},
			{
				"big",
				1000
			}
		} )
		f2_arg0.flareRight:cancelAnimateToState()
		f2_arg0.flareRight:animateInSequence( {
			{
				"big",
				200
			},
			{
				"big",
				1000
			}
		} )
	end
	f2_arg0.lastEventValue = f2_arg1.value
	f2_arg0.lastWidthValue = f2_local3.width
end

LUI.ExperienceProgressBar.UpdatePlayerRank = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.value
	local f6_local1 = f6_arg1.value
	local f6_local2 = nil
	local f6_local3 = Game.GetOmnvar( "ui_player_xp_prestige" )
	local f6_local4 = Rank.GetMaxRank( f6_local3 )
	local f6_local5 = Rank.GetMaxPrestigeLevel()
	if f6_local0 == f6_local4 then
		if f6_local3 < f6_local5 then
			f6_arg0.rightRank:registerAnimationState( "update", {
				alpha = 1,
				material = RegisterMaterial( Rank.GetRankIcon( 0, f6_local3 + 1 ) )
			} )
			f6_arg0.rightRank:animateToState( "update" )
		else
			f6_local0 = f6_local0 - 1
			f6_arg0.rightRank:registerAnimationState( "update", {
				alpha = 1,
				material = RegisterMaterial( Rank.GetRankIcon( f6_local1, f6_local3 ) )
			} )
			f6_arg0.rightRank:animateToState( "update" )
		end
	else
		if f6_local1 + 1 < f6_local4 or f6_local3 < f6_local5 then
			f6_local1 = f6_local1 + 1
		end
		f6_arg0.rightRank:registerAnimationState( "update", {
			alpha = 1,
			material = RegisterMaterial( Rank.GetRankIcon( f6_local1, f6_local3 ) )
		} )
		f6_arg0.rightRank:animateToState( "update" )
	end
	f6_arg0.leftRank:setImage( RegisterMaterial( Rank.GetRankIcon( f6_local0, f6_local3 ) ) )
	f6_arg0.leftRankText:setText( Rank.GetRankDisplay( f6_local0 ) )
end

LUI.ExperienceProgressBar.new = function ()
	local f7_local0 = CoD.CreateState( 19, nil, 0, 0, CoD.AnchorTypes.BottomLeftRight )
	f7_local0.height = LUI.ExperienceProgressBar.ContainerHeight
	local self = LUI.UIElement.new( f7_local0 )
	self:setClass( LUI.ExperienceProgressBar )
	self.id = "experienceBar_root"
	local f7_local2 = CoD.CreateState( LUI.ExperienceProgressBar.Padding, nil, -LUI.ExperienceProgressBar.Padding, nil, CoD.AnchorTypes.LeftRight )
	f7_local2.height = LUI.ExperienceProgressBar.Height
	local self = LUI.UIElement.new( f7_local2 )
	self:addElement( self )
	local f7_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local4.material = RegisterMaterial( "black" )
	f7_local4.alpha = 0.5
	self:addElement( LUI.UIImage.new( f7_local4 ) )
	local f7_local5 = CoD.CreateState( LUI.ExperienceProgressBar.Padding, nil, -LUI.ExperienceProgressBar.Padding, nil, CoD.AnchorTypes.LeftRight )
	f7_local5.height = LUI.ExperienceProgressBar.Height
	local self = LUI.UIElement.new( f7_local5 )
	self:addElement( self )
	local f7_local7 = CoD.CreateState( 1, 0, nil, nil, CoD.AnchorTypes.TopBottomLeft )
	f7_local7.width = 0
	self:registerAnimationState( "reset", f7_local7 )
	local f7_local8 = CoD.CreateState( -3.5, -14, nil, nil, CoD.AnchorTypes.Right )
	f7_local8.width = 6
	f7_local8.height = 6
	f7_local8.material = RegisterMaterial( "h1_deco_indicator_arrow" )
	self:addElement( LUI.UIImage.new( f7_local8 ) )
	local f7_local9 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
	f7_local9.width = 0
	f7_local9.height = 0
	f7_local9.material = RegisterMaterial( "h1_ui_xp_progress_flare_l" )
	local self = LUI.UIImage.new( f7_local9 )
	self:registerAnimationState( "big", {
		rightAnchor = true,
		left = -34,
		right = -5,
		height = 43
	} )
	local f7_local11 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
	f7_local11.width = 0
	f7_local11.height = 0
	f7_local11.material = RegisterMaterial( "h1_ui_xp_progress_flare_r" )
	local self = LUI.UIImage.new( f7_local11 )
	self:registerAnimationState( "big", {
		rightAnchor = true,
		right = 7,
		left = -5,
		height = 43
	} )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.flareLeft = self
	self.flareRight = self
	self:setUseStencil( true )
	self:registerOmnvarHandler( "ui_player_xp_pct", LUI.ExperienceProgressBar.UpdatePlayerXP )
	self.lastEventValue = 0
	self.lastWidthValue = 0
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	local f7_local14 = CoD.CreateState( -20, -6, 20, 6, CoD.AnchorTypes.All )
	f7_local14.material = RegisterMaterial( "h1_ui_experiencebar_fill" )
	local self = LUI.UIImage.new( f7_local14 )
	self:setup3SliceRatio( 0.01, 1 )
	self.bar = self
	self:addElement( self )
	local f7_local16 = CoD.CreateState( -20, -6, 20, 6, CoD.AnchorTypes.All )
	self:registerAnimationState( "position", f7_local16 )
	f7_local16.alpha = 1
	self:registerAnimationState( "full", f7_local16 )
	f7_local16.alpha = 0.4
	self:registerAnimationState( "half", f7_local16 )
	local f7_local17 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local17.borderThickness = 1
	f7_local17.color = Colors.black
	self:addElement( LUI.UIBorder.new( f7_local17 ) )
	local f7_local18 = CoD.CreateState( 0, 3, nil, -3, CoD.AnchorTypes.TopBottomLeft )
	f7_local18.width = LUI.ExperienceProgressBar.ContainerHeight - 6
	f7_local18.material = RegisterMaterial( "black" )
	
	local leftRank = LUI.UIImage.new( f7_local18 )
	self:addElement( leftRank )
	self.leftRank = leftRank
	
	local f7_local20 = CoD.TextSettings.TitleFontVeryTiny
	local f7_local21 = CoD.CreateState( 27, -4.5, nil, nil, CoD.AnchorTypes.Left )
	f7_local21.width = 40
	f7_local21.height = f7_local20.Height
	f7_local21.font = f7_local20.Font
	
	local leftRankText = LUI.UIText.new( f7_local21 )
	self:addElement( leftRankText )
	self.leftRankText = leftRankText
	
	local f7_local23 = CoD.CreateState( nil, 3, -10, -3, CoD.AnchorTypes.TopBottomRight )
	f7_local23.width = LUI.ExperienceProgressBar.ContainerHeight - 6
	f7_local23.material = RegisterMaterial( "black" )
	
	local rightRank = LUI.UIImage.new( f7_local23 )
	rightRank:registerAnimationState( "default", f7_local23 )
	rightRank:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:addElement( rightRank )
	self.rightRank = rightRank
	
	self:registerOmnvarHandler( "ui_player_xp_rank", LUI.ExperienceProgressBar.UpdatePlayerRank )
	self:addElement( LUI.UITimer.new( 0, "firstFrameUpdate", nil, true ) )
	self:registerEventHandler( "firstFrameUpdate", function ( element, event )
		f0_local0( element, event, self, self )
	end )
	return self
end

LUI.MenuBuilder.registerType( "experienceBar", LUI.ExperienceProgressBar.new )
LockTable( _M )
