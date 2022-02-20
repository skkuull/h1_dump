local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
LUI.MapBlipPulse = InheritFrom( LUI.UIElement )
f0_local0 = "_blip_"
f0_local1 = "_container"
f0_local2 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg2.posX - f1_arg2.initialSize / 2
	local f1_local1 = f1_arg2.posY - f1_arg2.initialSize / 2
	local f1_local2 = f1_arg2.posX - f1_arg2.finalSize / 2
	local f1_local3 = f1_arg2.posY - f1_arg2.finalSize / 2
	local f1_local4 = CoD.CreateState( f1_local0, f1_local1, f1_local0 + f1_arg2.initialSize, f1_local1 + f1_arg2.initialSize, f1_arg2.anchor )
	f1_local4.material = RegisterMaterial( f1_arg2.material )
	f1_local4.alpha = 1
	local f1_local5 = CoD.CreateState( f1_local2, f1_local3, f1_local2 + f1_arg2.finalSize, f1_local3 + f1_arg2.finalSize, f1_arg2.anchor )
	f1_local5.alpha = 0
	local self = LUI.UIImage.new( f1_local4 )
	self.name = f1_arg2.name .. f0_local0 .. "icon_" .. f1_arg1
	self.id = nil
	self:registerAnimationState( "fade", f1_local5 )
	self:animateInSequence( {
		{
			"default",
			0
		},
		{
			"fade",
			f1_arg2.pulseDuration
		}
	}, nil, nil, false, true )
	f1_arg0:addElement( self )
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	f0_local2( f2_arg0, f2_arg1.tag, f2_arg1.props )
	if f2_arg1.tag < f2_arg1.props.pulseCount then
		local self = LUI.UITimer.new( LevelSelectMinimapBlipSettings.pulseDelay, {
			name = "blip_timer",
			tag = f2_arg1.tag + 1,
			props = f2_arg1.props
		}, nil, true )
		self.name = f2_arg1.props.name .. f0_local0 .. "timer_pulse_" .. f2_arg1.tag
		self.id = nil
		f2_arg0:addElement( self )
	end
end

LUI.MapBlipPulse.addPulse = function ( f3_arg0, f3_arg1 )
	assert( f3_arg1 )
	assert( f3_arg1.posX )
	assert( f3_arg1.posY )
	assert( f3_arg1.name, "Blip need a name!" )
	local self = f3_arg1.delay
	if not self then
		self = LevelSelectMinimapBlipSettings.delay
	end
	f3_arg1.delay = self
	self = f3_arg1.pulseDuration
	if not self then
		self = LevelSelectMinimapBlipSettings.pulseDuration
	end
	f3_arg1.pulseDuration = self
	self = f3_arg1.pulseCount
	if not self then
		self = LevelSelectMinimapBlipSettings.pulseCount
	end
	f3_arg1.pulseCount = self
	f3_arg1.material = f3_arg1.material or "h1_ico_map_objective"
	self = f3_arg1.initialSize
	if not self then
		self = LevelSelectMinimapBlipSettings.initialSize
	end
	f3_arg1.initialSize = self
	self = f3_arg1.finalSize
	if not self then
		self = LevelSelectMinimapBlipSettings.finalSize
	end
	f3_arg1.finalSize = self
	self = f3_arg1.anchor
	if not self then
		self = CoD.AnchorTypes.TopLeft
	end
	f3_arg1.anchor = self
	self = f3_arg0
	if f3_arg1.useContainer then
		self = LUI.UIElement.new( CoD.CreateState( f3_arg1.posX, f3_arg1.posY, 1, 1, f3_arg1.anchor ) )
		self.id = f3_arg1.name .. f0_local1
		self:registerEventHandler( "blip_timer", f0_local3 )
		f3_arg0:addElement( self )
		f3_arg1.posX = 0
		f3_arg1.posY = 0
	end
	local self = LUI.UITimer.new( f3_arg1.delay + f3_arg1.pulseDuration, {
		name = "blip_timer",
		tag = 1,
		props = f3_arg1
	} )
	self.name = f3_arg1.name .. f0_local0 .. "timer"
	self.id = nil
	self:addElement( self )
	local self = LUI.UITimer.new( 200, {
		name = "blip_timer",
		tag = 1,
		props = f3_arg1
	}, nil, true )
	self.name = f3_arg1.name .. f0_local0 .. "timer_initial"
	self.id = nil
	self:addElement( self )
end

LUI.MapBlipPulse.delete = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0:getFirstChild()
	while f4_local0 ~= nil do
		local f4_local1 = f4_local0
		f4_local0 = f4_local0:getNextSibling()
		if f4_local1.name and string.find( f4_local1.name, f4_arg1 .. f0_local0 ) ~= nil then
			f4_local1:close()
		end
	end
end

LUI.MapBlipPulse.clearAll = function ( f5_arg0 )
	local f5_local0 = f5_arg0:getFirstChild()
	while f5_local0 ~= nil do
		local f5_local1 = f5_local0
		f5_local0 = f5_local0:getNextSibling()
		f5_local1:close()
	end
end

LUI.MapBlipPulse.new = function ( f6_arg0 )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	} )
	self:setClass( LUI.MapBlipPulse )
	f6_arg0:addElement( self )
	self:registerEventHandler( "blip_timer", f0_local3 )
	return self
end

LockTable( _M )
