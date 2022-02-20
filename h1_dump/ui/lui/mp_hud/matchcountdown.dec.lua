local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
c = 0.67
ringSize = 128 * c
countdownTextYOffset = 4
iconImageWidth = 125.33
titleFont = CoD.TextSettings.TitleFontTiny
countdownStrings = {
	"MP_MATCH_STARTING_IN",
	"MP_MATCHSTARTING",
	"MP_OPPONENT_FORFEITING_IN",
	"MP_CHOOSE_SLASHER",
	[6] = "MP_WAITING_FOR_PLAYERS",
	[7] = "LUA_MP_COMMON_INFECTED_COUNTDOWN"
}
function getCountdownString()
	local f1_local0 = Game.GetOmnvar( "ui_match_countdown_title" )
	if f1_local0 == 0 then
		return ""
	else
		assert( countdownStrings[f1_local0] )
		return Engine.Localize( countdownStrings[f1_local0] )
	end
end

function countdownRing()
	local f2_local0 = {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -ringSize / 2,
		height = ringSize,
		left = -ringSize / 2,
		width = ringSize,
		alpha = 1
	}
	local self = LUI.UIElement.new( f2_local0 )
	self.id = "countdownContainer"
	self:registerAnimationState( "default", f2_local0 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "hidden" )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = 150,
		height = 150,
		material = RegisterMaterial( "h1_ui_countdown_ring_background" )
	} )
	self.id = "countdownDarken"
	self:addElement( self )
	local self = LUI.UIImage.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		width = 128,
		height = 80,
		material = RegisterMaterial( "h1_ui_countdown_scanlines" )
	} )
	self.id = "countdownScanlines"
	self:addElement( self )
	local f2_local4 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local4.material = RegisterMaterial( "h1_ui_countdown_ring" )
	f2_local4.zRot = 360
	f2_local4.alpha = 1
	local self = LUI.UIImage.new( f2_local4 )
	self.id = "countdownRing"
	self:registerAnimationState( "default", f2_local4 )
	self:registerAnimationState( "rotate", {
		zRot = 0
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:animateToState( "hidden" )
	self.ring = self
	self:addElement( self )
	local f2_local6 = CoD.TextSettings.TitleFontTinyBold
	local f2_local7 = {
		font = f2_local6.Font,
		alignment = LUI.Alignment.Center,
		color = Colors.white,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		height = f2_local6.Height,
		left = 0,
		right = 0,
		alpha = 1,
		scale = 1
	}
	local self = LUI.UIText.new( f2_local7 )
	self:registerAnimationState( "default", f2_local7 )
	self:registerAnimationState( "large", {
		scale = 2,
		alpha = 0
	} )
	self.id = "countdownText"
	self:addElement( self )
	self.setValue = function ( f3_arg0, f3_arg1 )
		if 0 <= f3_arg1 then
			self:animateInSequence( {
				{
					"large",
					0
				},
				{
					"default",
					250
				}
			} )
			self:setText( f3_arg1 )
		end
	end
	
	return self
end

function adjustBoundsGeneral( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0, f4_local1, f4_local2, f4_local3 = GetTextDimensions( f4_arg1, CoD.TextSettings.TitleFontTiny.Font, CoD.TextSettings.TitleFontTiny.Height )
	f4_arg0.height = CoD.TextSettings.TitleFontTiny.Height * 1.75
	if f4_local2 > 0 then
		f4_arg0.width = f4_local2 + f4_arg2 * 2
	else
		f4_arg0.width = 0
	end
	f4_arg0.left = -f4_arg0.width / 2
end

function adjustTitleTextBackgroundBounds( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.CreateState( 0, nil, nil, 0, CoD.AnchorTypes.Bottom )
	f5_local0.color = Colors.black
	f5_local0.alpha = 0.7
	adjustBoundsGeneral( f5_local0, f5_arg1, 30 )
	f5_local0.bottom = -ringSize / 2 - 16
	f5_arg0:registerAnimationState( "default", f5_local0 )
	f5_arg0:animateToState( "default" )
end

f0_local0 = function ()
	local f6_local0 = false
	local f6_local1 = false
	local f6_local2 = Engine.GetDvarString( "ui_gametype" )
	if f6_local2 ~= nil then
		f6_local0 = IsGameTypeRoundBased( f6_local2 )
	end
	if f6_local0 then
		local f6_local3 = Game.GetOmnvar( "ui_current_round" )
		local f6_local4 = Engine.GetDvarInt( "scr_" .. f6_local2 .. "_halftime" ) == 1
		local f6_local5 = nil
		if f6_local4 or f6_local2 == "dd" then
			f6_local1 = f6_local3 > 2
		end
	end
	return f6_local1
end

function fillData( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0, f7_local1 = nil
	local f7_local2 = Game.GetOmnvar( "ui_team_selected" )
	if f0_local0() == false then
		if f7_local2 == 1 then
			f7_local0 = Engine.GetDvarString( "g_TeamIcon_Axis" )
			f7_local1 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Axis" ) )
		elseif f7_local2 == 2 then
			f7_local0 = Engine.GetDvarString( "g_TeamIcon_Allies" )
			f7_local1 = Engine.Localize( Engine.GetDvarString( "g_TeamName_Allies" ) )
		end
	end
	if f7_local0 and f7_local1 then
		if not GameX.IsSplitscreen() then
			f7_arg0:Update( f7_local0 )
		end
		local f7_local3 = CoD.CreateState( 0, nil, nil, nil, CoD.AnchorTypes.None )
		adjustBoundsGeneral( f7_local3, f7_local1, 16 )
		f7_local3.color = Colors.black
		f7_local3.alpha = 0.7
		f7_local3.top = -158
		f7_arg2:registerAnimationState( "default", f7_local3 )
		f7_arg2:animateToState( "default" )
		f7_arg1:setText( f7_local1 )
	end
end

function matchCountdown()
	local f8_local0 = GameX.IsSplitscreen()
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "matchCountdown"
	local f8_local2 = {
		font = titleFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = -3,
		right = 0,
		height = titleFont.Height
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f8_local2.bottom = -9
	end
	local self = LUI.UIText.new( f8_local2 )
	self.id = "titleText"
	self:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:animateToState( "default" )
	local f8_local4 = CoD.CreateState( 0, nil, nil, 0, CoD.AnchorTypes.Bottom )
	f8_local4.color = Colors.black
	f8_local4.alpha = 0.7
	local self = LUI.UIImage.new( f8_local4 )
	self:registerAnimationState( "no_countdown", {
		bottom = titleFont.Height / 2 + 3,
		height = titleFont.Height * 1.65
	} )
	local f8_local6 = LUI.DecoFrame.new( CoD.CreateState( 0, nil, nil, 0, CoD.AnchorTypes.All ) )
	self:addElement( self )
	self:addElement( f8_local6 )
	self:addElement( self )
	local f8_local7 = countdownRing()
	self:addElement( f8_local7 )
	self:registerOmnvarHandler( "ui_match_countdown", function ( f9_arg0, f9_arg1 )
		f8_local7:setValue( f9_arg1.value )
	end )
	self:registerOmnvarHandler( "ui_match_countdown_title", function ( f10_arg0, f10_arg1 )
		local f10_local0 = getCountdownString()
		self:setText( f10_local0 )
		adjustTitleTextBackgroundBounds( self, f10_local0 )
	end )
	local f8_local8 = getCountdownString()
	adjustTitleTextBackgroundBounds( self, f8_local8 )
	self:setText( f8_local8 )
	local f8_local9 = CoD.CreateState( -iconImageWidth / 2, -300, nil, nil, CoD.AnchorTypes.None )
	f8_local9.width = iconImageWidth
	f8_local9.height = iconImageWidth
	f8_local9.alpha = 1
	local f8_local10 = LUI.FactionIcon.new( f8_local9 )
	f8_local10:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:addElement( f8_local10 )
	local f8_local11 = {
		font = titleFont.Font,
		alignment = LUI.Alignment.Center,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = -6,
		right = 0,
		height = titleFont.Height,
		color = Colors.white,
		alpha = 1
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f8_local11.top = -9
	end
	local self = LUI.UIText.new( f8_local11 )
	local self = LUI.UIImage.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None ) )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local f8_local14 = LUI.DecoFrame.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	self:addElement( self )
	self:addElement( f8_local14 )
	self:addElement( self )
	if not GameX.gameModeIsFFA() then
		f8_local10:registerOmnvarHandler( "ui_match_countdown", function ( f11_arg0, f11_arg1 )
			fillData( f8_local10, self, self )
		end )
		fillData( f8_local10, self, self )
	end
	local f8_local15 = function ( f12_arg0, f12_arg1 )
		if f12_arg1.value then
			f8_local7:animateToState( "default" )
			f8_local7.ring:animateInLoop( {
				{
					"default",
					0
				},
				{
					"rotate",
					1000
				}
			} )
			self:animateToState( "default" )
			if GameX.gameModeIsFFA() then
				self:animateToState( "hidden" )
				f8_local10:animateToState( "hidden" )
			else
				local f12_local0 = f0_local0()
				if f8_local0 or f12_local0 then
					f8_local10:animateToState( "hidden" )
				else
					f8_local10:animateToState( "default" )
				end
				if f12_local0 then
					self:animateToState( "hidden" )
				else
					self:animateToState( "default" )
				end
			end
		else
			f8_local7:animateToState( "hidden" )
			f8_local7.ring:animateToState( "hidden" )
			self:animateToState( "no_countdown" )
			self:animateToState( "hidden" )
			f8_local10:animateToState( "hidden" )
		end
	end
	
	self:registerOmnvarHandler( "ui_match_countdown_toggle", f8_local15 )
	f8_local15( self, {
		value = Game.GetOmnvar( "ui_match_countdown_toggle" )
	} )
	return self
end

LUI.MenuBuilder.registerType( "matchCountdown", matchCountdown )
LockTable( _M )
