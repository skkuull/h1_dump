local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 250
f0_local1 = 250
f0_local2 = 250
local f0_local3 = 1000
local f0_local4 = 750
local f0_local5 = 250
local f0_local6 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.current_state ~= "active" then
		f1_arg0:animateToState( "active", f0_local0 )
		f1_arg0.current_state = "active"
	end
end

local f0_local7 = function ( f2_arg0, f2_arg1 )
	if f2_arg0.current_state ~= "default" then
		f2_arg0:animateToState( "default", 0 )
		f2_arg0.current_state = "default"
	end
end

local f0_local8 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Game.PlayerHasPerk( "specialty_moreminimap" )
	local f3_local1 = Engine.GetDvarString( "ui_gametype" )
	if f3_local0 then
		f3_arg0:processEvent( {
			name = "extend"
		} )
	else
		f3_arg0:processEvent( {
			name = "contract"
		} )
	end
end

local f0_local9 = function ( f4_arg0, f4_arg1 )
	assert( f4_arg0 )
	if Game.GetOmnvar( "ui_uav_scrambler_on" ) then
		f4_arg0:dispatchEventToChildren( {
			name = "hud_scrambled_on",
			dispatchChildren = true
		} )
	else
		f4_arg0:dispatchEventToChildren( {
			name = "hud_scrambled_off",
			dispatchChildren = true
		} )
	end
end

local f0_local10 = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0 )
	f0_local8( f5_arg0 )
	f0_local9( f5_arg0 )
end

local f0_local11 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.name
	local f6_local1 = "default"
	if f6_local0 == "hud_nosignal_on" then
		f6_local1 = "nosignal"
	elseif f6_local0 == "hud_scrambled_on" then
		f6_local1 = "scrambled"
	elseif f6_local0 == "hud_nosignal_off" or f6_local0 == "hud_scrambled_off" then
		f6_local1 = "active"
	end
	f6_arg0:animateToState( f6_local1, 0 )
end

LUI.MenuBuilder.registerType( "minimapHudDef", function ()
	local f7_local0 = 208
	local f7_local1 = 180
	local f7_local2 = 255
	local f7_local3 = 16
	local f7_local4 = -5
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f7_local3,
		left = f7_local4,
		width = f7_local0,
		height = f7_local1
	} )
	self.id = "minimapHud"
	self:registerAnimationState( "extended", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = f7_local3,
		left = f7_local4,
		width = f7_local2,
		height = f7_local1
	} )
	self:registerEventHandler( "extend", MBh.AnimateToState( "extended", 0 ) )
	self:registerEventHandler( "contract", MBh.AnimateToState( "default", 0 ) )
	self:registerEventHandler( "playerstate_client_changed", f0_local10 )
	self:registerOmnvarHandler( "ui_minimap_extend_grace_period", f0_local10 )
	self:registerOmnvarHandler( "ui_uav_scrambler_on", f0_local9 )
	local self = LUI.UIElement.new( {} )
	self:setupUIIntWatch( "PlayerPerkChanged", Game.GetPerkIndexForName( "specialty_moreminimap" ) )
	self:registerEventHandler( "int_watch_alert", function ( element, event )
		f0_local8( element:getParent(), event )
	end )
	self:addElement( self )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "minimapWrapper_id"
	self:addElement( self )
	local f7_local8 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local8.material = RegisterMaterial( "h1_hud_minimap_backing" )
	self:addElement( LUI.UIImage.new( f7_local8 ) )
	local f7_local9 = CoD.CreateState( nil, nil, nil, 5, CoD.AnchorTypes.BottomLeftRight )
	f7_local9.color = Colors.black
	local f7_local10 = LUI.Divider.new( f7_local9, 5, 2 )
	f7_local10.id = "lower_divider"
	self:addElement( f7_local10 )
	local f7_local11 = LUI.MenuBuilder.BuildAddChild
	local f7_local12 = self
	local self = {
		type = "UIMinimap",
		id = "minimap",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0,
				alpha = 0
			},
			active = {
				alpha = 0.5
			},
			nosignal = {
				alpha = 0.05
			},
			scrambled = {
				alpha = 0.15
			}
		}
	}
	local f7_local14 = {}
	local f7_local15 = MBh.AnimateSequence
	local f7_local16 = {}
	local f7_local17 = {
		"active",
		0
	}
	local f7_local18 = {}
	local f7_local19 = "default"
	local f7_local20 = math.random( 10, 50 )
	f7_local18 = f7_local19
	f7_local19 = {}
	f7_local20 = "active"
	local f7_local21 = math.random( 10, 50 )
	f7_local19 = f7_local20
	f7_local20 = {}
	f7_local21 = "default"
	local f7_local22 = math.random( 10, 50 )
	f7_local20 = f7_local21
	f7_local21 = {}
	f7_local22 = "active"
	local f7_local23 = math.random( 10, 50 )
	f7_local21 = f7_local22
	f7_local22 = {}
	f7_local23 = "default"
	local f7_local24 = math.random( 10, 50 )
	f7_local22 = f7_local23
	f7_local23 = {}
	f7_local24 = "active"
	local f7_local25 = math.random( 10, 50 )
	f7_local23 = f7_local24
	f7_local24 = {}
	f7_local25 = "default"
	local f7_local26 = math.random( 50, 100 )
	f7_local24 = f7_local25
	f7_local25 = {
		"active",
		250
	}
	f7_local16[1] = f7_local17
	f7_local16[2] = f7_local18
	f7_local16[3] = f7_local19
	f7_local16[4] = f7_local20
	f7_local16[5] = f7_local21
	f7_local16[6] = f7_local22
	f7_local16[7] = f7_local23
	f7_local16[8] = f7_local24
	f7_local16[9] = f7_local25
	f7_local14.hud_shake = f7_local15( f7_local16 )
	f7_local14.hud_nosignal_on = f0_local11
	f7_local14.hud_nosignal_off = f0_local11
	f7_local14.hud_scrambled_on = f0_local11
	f7_local14.hud_scrambled_off = f0_local11
	self.handlers = f7_local14
	f7_local11( f7_local12, self )
	LUI.MenuBuilder.BuildAddChild( self, {
		type = "UIMinimapIcons",
		id = "minimapIcons",
		properties = {
			drawPlayer = true
		},
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0,
				alpha = 0
			},
			active = {
				alpha = 1
			},
			nosignal = {
				alpha = 0.05
			},
			scrambled = {
				alpha = 0
			}
		},
		handlers = {
			hud_nosignal_on = f0_local11,
			hud_nosignal_off = f0_local11,
			hud_scrambled_on = f0_local11,
			hud_scrambled_off = f0_local11
		}
	} )
	f7_local11 = CoD.CreateState( 0, -22, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f7_local11.height = 20
	f7_local11.material = RegisterMaterial( "black" )
	f7_local11.alpha = 0.6
	self:addElement( LUI.UIImage.new( f7_local11 ) )
	LUI.MenuBuilder.BuildAddChild( self, {
		type = "UICompass",
		id = "minimapCompass",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				bottom = -4,
				left = 0,
				right = 0,
				height = 16,
				material = RegisterMaterial( "minimap_tickertape_mp" ),
				alpha = 0
			},
			active = {
				alpha = 1
			},
			nosignal = {
				alpha = 0.05
			},
			scrambled = {
				alpha = 0
			}
		},
		handlers = {
			hud_nosignal_on = f0_local11,
			hud_nosignal_off = f0_local11,
			hud_scrambled_on = f0_local11,
			hud_scrambled_off = f0_local11
		}
	} )
	f7_local12 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f7_local12.alpha = 0
	self = LUI.UIImage.new( f7_local12 )
	self.id = "minimapScramblerGlitch_id"
	self:registerAnimationState( "scrambled_on", {
		alpha = 1
	} )
	self:registerAnimationState( "scrambled_off", {
		alpha = 0
	} )
	self:registerEventHandler( "hud_scrambled_on", MBh.AnimateToState( "scrambled_on", 0 ) )
	self:registerEventHandler( "hud_scrambled_off", MBh.AnimateToState( "scrambled_off", 0 ) )
	self:addElement( self )
	f0_local10( self, {
		name = "INIT"
	} )
	return self
end )
LockTable( _M )
