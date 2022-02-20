local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	Engine.NotifyServer( "gambler_anim_complete", 1 )
end

f0_local1 = function ( f2_arg0 )
	if Game.GetOmnvar( f2_arg0 ) >= 0 then
		return true
	else
		return false
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.value
	if f3_local0 ~= nil then
		local f3_local1 = 1000
		local f3_local2 = f3_arg0:getChildById( "damageFeedbackImageId" )
		if f3_local0 == "hitblastshield" then
			f3_local2:animateToState( "blastshield", 0 )
		elseif f3_local0 == "thermobaric_debuff" then
			f3_local2:animateToState( "thermoDebuff", 0 )
			f3_local1 = 1000
		elseif f3_local0 == "hitlightarmor" then
			f3_local2:animateToState( "light_armor", 0 )
		elseif f3_local0 == "hitmorehealth" then
			f3_local2:animateToState( "more_health", 0 )
		elseif f3_local0 == "hitmotionsensor" then
			f3_local2:animateToState( "motion_sensor", 0 )
			f3_local1 = 2500
		elseif f3_local0 == "hitjuggernaut" then
			f3_local2:animateToState( "juggernaut", 0 )
		elseif f3_local0 == "scavenger" then
			f3_local2:animateToState( "scavenger", 0 )
			f3_local1 = 2500
		elseif f3_local0 == "boxofguns" then
			f3_local2:animateToState( "boxofguns", 0 )
			f3_local1 = 2500
		elseif f3_local0 == "throwingknife" then
			f3_local2:animateToState( "throwingknife", 0 )
			f3_local1 = 2500
		elseif f3_local0 == "headshot" then
			f3_local2:animateToState( "headshot", 0 )
		elseif f3_local0 == "killshot" then
			f3_local2:animateToState( "killshot", 0 )
		elseif f3_local0 == "killshot_headshot" then
			f3_local2:animateToState( "killshot_headshot", 0 )
		elseif f3_local0 == "standard" then
			f3_local2:animateToState( "standard", 0 )
		else
			f3_local2:animateToState( "default", 0 )
		end
		local f3_local3 = MBh.AnimateSequence( {
			{
				"active",
				0
			},
			{
				"default",
				f3_local1
			}
		} )
		f3_local3( f3_arg0 )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.value
	if f4_local0 ~= nil then
		local f4_local1 = f4_arg0:getChildById( "deadeyeBaseContainer" )
		local f4_local2 = f4_arg0:getChildById( "deadeyePulseContainer" )
		if f4_local0 == "hitcritical" then
			local f4_local3 = MBh.AnimateSequence( {
				{
					"default",
					100
				},
				{
					"active",
					20
				},
				{
					"close",
					50
				}
			} )
			f4_local3( f4_local1 )
			f4_local3 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"active",
					50
				},
				{
					"close",
					90
				}
			} )
			f4_local3( f4_local2 )
		end
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	if f5_arg1.value ~= -1 then
		local f5_local0 = f5_arg0:getChildById( "gamblerIconId" )
		local f5_local1 = f5_arg0:getChildById( "gamblerTextId" )
		local f5_local2 = Engine.TableLookupByRow( PerkTable.File, f5_arg1.value, PerkTable.Cols.Image )
		local f5_local3 = Engine.TableLookupByRow( PerkTable.File, f5_arg1.value, PerkTable.Cols.Name )
		local f5_local4 = RegisterMaterial( f5_local2 )
		f5_local1:setText( Engine.Localize( f5_local3 ) )
		CoD.SetMaterial( f5_local0, f5_local4 )
		local f5_local5 = MBh.AnimateSequence( {
			{
				"active",
				0
			},
			{
				"inactive",
				2500
			}
		} )
		f5_local5( f5_arg0 )
	end
end

local f0_local5 = function ()
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		bottom = 16,
		left = -16,
		right = 16,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerOmnvarHandler( "damage_feedback", f0_local3 )
	local self = LUI.UIElement.new()
	self.id = "deadeyeBaseContainer"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		left = -16,
		right = 16,
		height = 64,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		left = -20,
		right = 20,
		height = 70,
		alpha = 0.5
	} )
	self:registerAnimationState( "close", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -22,
		left = -22,
		right = 22,
		height = 72,
		alpha = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIImage.new()
	self.id = "deadeyeBaseImage"
	self:registerAnimationState( "default", {
		material = RegisterMaterial( "damage_feedback_deadeye" ),
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:addElement( self )
	local self = LUI.UIElement.new()
	self.id = "deadeyePulseContainer"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		left = -16,
		right = 16,
		height = 64,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -32,
		left = -32,
		right = 32,
		height = 128,
		alpha = 1
	} )
	self:registerAnimationState( "close", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -64,
		left = -64,
		right = 64,
		height = 256,
		alpha = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIImage.new()
	self.id = "deadeyePulseImage"
	self:registerAnimationState( "default", {
		material = RegisterMaterial( "damage_feedback_deadeye" ),
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:addElement( self )
	self:addElement( self )
	self:addElement( self )
	return self
end

local f0_local6 = function ()
	local self = LUI.UIElement.new()
	self.id = "gamblerHudId"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		bottom = 16,
		left = -16,
		right = 16,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:animateToState( "default" )
	self:registerEventHandler( "transition_complete_inactive", f0_local0 )
	local self = LUI.UIImage.new()
	self.id = "gamblerIconId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 95,
		left = -20,
		right = 20,
		height = 40
	} )
	self:animateToState( "default" )
	local self = LUI.UIText.new()
	self.id = "gamblerTextId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		bottom = 160,
		left = -100,
		right = 100,
		height = CoD.TextSettings.BodyFont.Height,
		font = CoD.TextSettings.BodyFont.Font,
		alignment = LUI.Alignment.Center,
		red = Colors.white.r,
		green = Colors.white.g,
		blue = Colors.white.b,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:setText( "Enter Ability Name Here" )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:addElement( self )
	self:addElement( self )
	return self
end

function damageFeedbackHudDef()
	local f8_local0 = RegisterMaterial( "damage_feedback" )
	local self = LUI.UIElement.new()
	self.id = "damageFeedbackHud"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -32,
		bottom = 32,
		left = -32,
		right = 32,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerOmnvarHandler( "damage_feedback", f0_local2 )
	local f8_local3 = {
		{
			name = "default",
			material = f8_local0
		}
	}
	local f8_local4 = Engine.UsingSplitscreenUpscaling() and 137 or 100
	LUI.ConcatenateToTable( f8_local3, {
		{
			name = "light_armor",
			material = RegisterMaterial( "damage_feedback_lightarmor" )
		},
		{
			name = "more_health",
			material = RegisterMaterial( "damage_feedback_morehealth" )
		},
		{
			name = "standard",
			material = RegisterMaterial( "damage_feedback" )
		},
		{
			name = "headshot",
			material = RegisterMaterial( "damage_feedback_headshot" )
		},
		{
			name = "killshot",
			material = RegisterMaterial( "damage_feedback_killshot" )
		},
		{
			name = "killshot_headshot",
			material = RegisterMaterial( "damage_feedback_killshot_headshot" )
		}
	} )
	local self = LUI.UIImage.new()
	self.id = "damageFeedbackImageId"
	for f8_local10, f8_local11 in ipairs( f8_local3 ) do
		local f8_local12 = self
		local f8_local13 = self.registerAnimationState
		local f8_local14 = f8_local11.name
		local f8_local15 = {
			material = f8_local11.material,
			topAnchor = true,
			bottomAnchor = false
		}
		local f8_local9
		if f8_local11.leftAnchor ~= nil then
			f8_local9 = f8_local11.leftAnchor
		else
			f8_local9 = true
		end
		f8_local15.leftAnchor = f8_local9
		f8_local9
		if f8_local11.rightAnchor ~= nil then
			f8_local9 = f8_local11.rightAnchor
		else
			f8_local9 = true
		end
		f8_local15.rightAnchor = f8_local9
		f8_local15.top = f8_local11.top or 0
		f8_local15.height = f8_local11.height or 128
		f8_local15.left = f8_local11.left
		f8_local15.right = f8_local11.right
		f8_local13( f8_local12, f8_local14, f8_local15 )
	end
	self:animateToState( "default" )
	self:addElement( self )
	self:addElement( self )
	if not Engine.InFrontend() then
		self:addElement( f0_local5() )
	end
	self:addElement( f0_local6() )
	return self
end

LUI.MenuBuilder.registerType( "damageFeedbackHudDef", damageFeedbackHudDef )
LockTable( _M )
