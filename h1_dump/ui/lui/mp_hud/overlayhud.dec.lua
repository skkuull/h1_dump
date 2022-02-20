local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ()
	if Game.InKillCam() then
		if Game.IsKillCamEntityActive() then
			return false
		end
	elseif Game.IsSpectatorCameraActive() then
		return false
	end
	return true
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:dispatchEventToRoot( {
		name = "close_scoreboard"
	} )
	local f2_local0 = f2_arg1.killstreak
	if f2_arg0.openOverlays[f2_local0] then
		return 
	elseif not f0_local0() then
		return 
	else
		local f2_local1 = LUI.MenuBuilder.buildItems( {
			type = f2_local0
		}, f2_arg0.properties, f2_arg0 )
		f2_local1:registerEventHandler( f2_local0 .. "_ended", function ( element, event )
			element:close()
			f2_arg0.openOverlays[f2_local0] = false
		end )
		f2_arg0.openOverlays[f2_local0] = true
		f2_arg0:addElement( f2_local1 )
		f2_local1:processEvent( {
			name = "init_overlay",
			omnvar = f2_arg1.omnvar,
			value = f2_arg1.value,
			dispatchChildren = true
		} )
	end
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	if f4_arg1.value == 1 then
		f4_arg0:dispatchEventToRoot( {
			name = "add_overlay",
			target = f4_arg0,
			killstreak = "MapLocationSelectorMain",
			omnvar = f4_arg1.omnvar,
			value = f4_arg1.value
		} )
	elseif f4_arg1.value == 0 then
		f4_arg0:dispatchEventToChildren( {
			name = "MapLocationSelectorMain_ended"
		} )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0:getFirstChild()
	while f5_local0 do
		f5_local0:processEvent( f5_arg1 )
		f5_local0 = f5_local0:getNextSibling()
	end
end

LUI.MenuBuilder.registerType( "overlayHudDef", function ()
	local f6_local0 = Engine.GetDvarString( "mapname" )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self.id = "overlayId"
	self.openOverlays = {}
	local f6_local2 = LUI.MenuBuilder.buildItems( {
		type = "AccuracyGreeble1HudMain"
	}, self.properties, self )
	f6_local2:processEvent( {
		name = "init_overlay"
	} )
	self:addElement( f6_local2 )
	local f6_local3 = LUI.MenuBuilder.buildItems( {
		type = "AccuracyGreeble2HudMain"
	}, self.properties, self )
	f6_local3:processEvent( {
		name = "init_overlay"
	} )
	self:addElement( f6_local3 )
	self:registerOmnvarHandler( "ui_map_location_selector", f0_local2 )
	self:registerEventHandler( "add_overlay", f0_local1 )
	self:registerEventHandler( "refresh_controls", f0_local3 )
	return self
end )
LockTable( _M )
