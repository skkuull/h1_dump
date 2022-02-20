local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
if GameX.IsSplitscreen() then
	maxVisibleEvents = 2
else
	maxVisibleEvents = 5
end
eventTTL = 6000
font = {
	Font = CoD.TextSettings.TitleFontTinyBold.Font,
	Height = 14
}
eventHeight = 22
eventPadding = 5
if Engine.IsPS3() then
	font = CoD.TextSettings.TitleFontTinyBold
	font.Height = 22
end
if Engine.GetSplitScreen() then
	font.FakeHeight = font.Height + 0.4
else
	font.FakeHeight = font.Height
end
iconHeight = 22
obituaryWidth = 300
function getColorForClientNum( f1_arg0, f1_arg1 )
	local f1_local0 = MLG.IsMLGSpectator()
	local f1_local1 = Game.GetPlayerClientnum()
	local f1_local2 = Game.GetPlayerTeam()
	local f1_local3 = f1_arg1 or Game.GetPlayerTeam( f1_arg0 )
	if f1_local0 then
		if f1_local3 == Teams.axis then
			return CoD.GetAtlasColor()
		else
			return CoD.GetSentinelColor()
		end
	elseif f1_arg0 == f1_local1 then
		return Swatches.HUD.Me
	elseif GameX.gameModeIsFFA() then
		if f1_arg0 == f1_local1 then
			return Swatches.HUD.Me
		else
			return Swatches.HUD.Enemies
		end
	elseif f1_local2 == Teams.spectator then
		if f1_local3 == Teams.axis then
			return CoD.GetAtlasColor()
		else
			return CoD.GetSentinelColor()
		end
	else
		local f1_local4 = f1_local3 == f1_local2
		if not f1_local4 then
			return Swatches.HUD.Enemies
		elseif Game.IsInMyParty( f1_arg0 ) then
			return Swatches.HUD.Party
		else
			assert( f1_local4 )
			return Swatches.HUD.Allies
		end
	end
end

function makePlayerText( f2_arg0, f2_arg1 )
	local f2_local0 = Game.GetPlayerName( f2_arg0 )
	local f2_local1, f2_local2, f2_local3, f2_local4 = GetTextDimensions2( f2_local0, font.Font, font.FakeHeight )
	local f2_local5 = f2_local3 - f2_local1
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		width = f2_local5,
		height = font.Height,
		color = getColorForClientNum( f2_arg0, f2_arg1 ),
		font = font.Font
	} )
	self:setText( f2_local0 )
	return self, f2_local5
end

function obituaryEvent( f3_arg0 )
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		height = 1,
		left = 0,
		width = f3_arg0,
		alpha = 0
	} )
	self:registerAnimationState( "opening", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		height = eventHeight,
		left = 0,
		width = f3_arg0,
		scale = 0.05,
		alpha = 1
	} )
	self:registerAnimationState( "visible", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		height = eventHeight,
		left = 0,
		width = f3_arg0,
		scale = 0,
		alpha = 1
	} )
	self:registerAnimationState( "closed", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		height = eventHeight,
		left = 0,
		width = f3_arg0,
		scale = 0,
		alpha = 0
	} )
	local self = MBh.AnimateSequence( {
		{
			"opening",
			100,
			true,
			true
		},
		{
			"visible",
			150,
			true,
			true
		}
	} )
	self( self, {} )
	self:registerEventHandler( "close_log_event", function ( element, event )
		if element.closing then
			return 
		else
			element.closing = true
			element:animateToState( "closed", 300 )
		end
	end )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( "closed" ), self.close )
	self:registerEventHandler( "new_log_event", function ( element, event )
		if element.closing then
			return 
		else
			element.timesPushed = element.timesPushed and element.timesPushed + 1 or 1
			element:registerAnimationState( "target", {
				topAnchor = false,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				height = eventHeight,
				left = 0,
				width = f3_arg0,
				scale = 0,
				alpha = LUI.clamp( 1 - element.timesPushed / math.max( 1, maxVisibleEvents ), 0, 1 )
			} )
			element:animateToState( "target", 300 )
		end
	end )
	self = LUI.UITimer.new( eventTTL, "close_log_event", nil, true )
	self.id = "expirationTimer"
	self:addElement( self )
	return self
end

function obituaryTextEvent( f6_arg0 )
	local f6_local0, f6_local1, f6_local2, f6_local3 = GetTextDimensions( f6_arg0, font.Font, font.Height )
	local f6_local4 = obituaryEvent( f6_local2 - f6_local0 + 3 * eventPadding )
	local self = LUI.UIText.new( {
		font = font.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = eventPadding,
		right = 0,
		height = font.Height
	} )
	self.id = "game_message_text"
	self:setText( f6_arg0 )
	f6_local4:addElement( self )
	return f6_local4
end

function obituaryKillEvent( f7_arg0 )
	local f7_local0 = 2
	local f7_local1 = f7_arg0.attacker
	if f7_local1 then
		f7_local1 = f7_arg0.attacker ~= f7_arg0.victim
	end
	local f7_local2 = Game.GetPlayerTeam()
	if MLG.IsMLGSpectator() then
		f7_local2 = Teams.allies
	end
	local f7_local3, f7_local4, self, f7_local6 = nil
	local f7_local7 = 0
	local self = LUI.UIHorizontalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = eventPadding,
		right = 0,
		spacing = f7_local0
	} )
	self.id = "content"
	if f7_local1 then
		f7_local3, f7_local6 = makePlayerText( f7_arg0.attacker )
		f7_local3.id = "attackerText"
		f7_local7 = f7_local7 + f7_local6
	end
	assert( f7_arg0.victim )
	f7_local4, f7_local6 = makePlayerText( f7_arg0.victim, nil )
	f7_local4.id = "victimText"
	f7_local7 = f7_local7 + f7_local6
	assert( f7_arg0.icon )
	local f7_local9 = iconHeight * Engine.GetMaterialAspectRatio( f7_arg0.icon )
	if f7_arg0.flip then
		self = LUI.UIImage.new( {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			height = iconHeight,
			left = f7_local9,
			right = 0,
			material = f7_arg0.icon
		} )
	else
		self = LUI.UIImage.new( {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			height = iconHeight,
			left = 0,
			width = f7_local9,
			material = f7_arg0.icon
		} )
	end
	self.id = "weaponImage"
	f7_local7 = f7_local7 + f7_local9
	if f7_local1 then
		self:addElement( f7_local3 )
		self:addElement( self )
		self:addElement( f7_local4 )
		f7_local7 = f7_local7 + 2 * f7_local0
	else
		self:addElement( f7_local4 )
		self:addElement( self )
		f7_local7 = f7_local7 + f7_local0
	end
	local f7_local10 = obituaryEvent( f7_local7 + 3 * eventPadding )
	f7_local10:addElement( self )
	return f7_local10
end

function obituary()
	local f8_local0 = 0
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		height = 0,
		bottom = -120 - maxVisibleEvents * eventHeight,
		width = obituaryWidth,
		left = 0
	} )
	self.id = "obituary"
	local self = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "vlist"
	self:addElement( self )
	local f8_local3 = function ()
		local f9_local0 = 0
		local f9_local1 = self:getFirstChild()
		while f9_local1 do
			if not f9_local1.closing then
				f9_local0 = f9_local0 + 1
			end
			f9_local1 = f9_local1:getNextSibling()
		end
		return f9_local0
	end
	
	local f8_local4 = function ( f10_arg0 )
		self:processEvent( {
			name = "new_log_event"
		} )
		f10_arg0:setPriority( -f8_local0 )
		f10_arg0.id = "event_" .. f8_local0
		self:addElement( f10_arg0 )
		if f8_local3() > maxVisibleEvents then
			local f10_local0 = self:getLastChild()
			f10_local0:processEvent( {
				name = "close_log_event"
			} )
		end
		f8_local0 = f8_local0 + 1
	end
	
	self:registerEventHandler( "obituary", function ( element, event )
		f8_local4( obituaryKillEvent( event ) )
	end )
	self:registerEventHandler( "game_message", function ( element, event )
		if event.message and event.bold == false then
			f8_local4( obituaryTextEvent( event.message ) )
		end
	end )
	return self
end

LUI.MenuBuilder.registerType( "obituary", obituary )
LockTable( _M )
