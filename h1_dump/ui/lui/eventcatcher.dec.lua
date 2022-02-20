local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
require( "LUI.CoD" )
f0_local0 = hashset( {
	"action_slot_pressed",
	"game_message",
	"hide_host_migration",
	"obituary",
	"show_host_migration_triggered",
	"toggle_pause",
	"toggle_pause_off",
	"toggle_scoreboard",
	"weapon_change",
	"show_hud_menu",
	"hide_hud_menu",
	"playerstate_client_changed",
	"camera_client_changed",
	"refresh_options_button",
	"update_crosshair_entity"
} )
function isDirectDispatchEventType( f1_arg0 )
	return f0_local0[f1_arg0]
end

function new()
	local f2_local0 = {}
	setmetatable( f2_local0, {
		__index = _M
	} )
	f2_local0.direct_dispatch = {}
	f2_local0.direct_dispatch_count = {}
	f2_local0.omnvar_update = {}
	f2_local0.omnvar_update_count = {}
	f2_local0.dvar_update = {}
	f2_local0.dvar_update_count = {}
	return f2_local0
end

function setupRoot( f3_arg0, f3_arg1 )
	f3_arg1:registerEventHandler( "omnvar_update", omnvarUpdateDispatcher )
	f3_arg1:registerEventHandler( "dvar_update", dvarUpdateDispatcher )
	for f3_local3, f3_local4 in pairs( f0_local0 ) do
		f3_arg1:registerEventHandler( f3_local3, directDispatcher )
	end
end

function getOmnvarEventName( f4_arg0 )
	return "catcher_omnvar_" .. f4_arg0
end

function getDvarEventName( f5_arg0 )
	return "catcher_dvar_" .. f5_arg0
end

function getDirectEventName( f6_arg0 )
	return "catcher_direct_" .. f6_arg0
end

function registerOmnvarHandler( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	registerHandlerInternal( f7_arg1, f7_arg2, f7_arg3, f7_arg0.omnvar_update, f7_arg0.omnvar_update_count, getOmnvarEventName( f7_arg2 ) )
end

function omnvarUpdateDispatcher( f8_arg0, f8_arg1 )
	dispatcherInternal( f8_arg1, f8_arg0.eventCatcher.omnvar_update, f8_arg0.eventCatcher.omnvar_update_count, f8_arg1.omnvar, getOmnvarEventName( f8_arg1.omnvar ) )
end

function registerDvarHandler( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	if not f9_arg0.dvar_update[f9_arg2] then
		assert( Engine.WatchDvar( f9_arg2 ), "failed to watch dvar " .. f9_arg2 )
	end
	local f9_local0 = Engine.GetDvarHash( f9_arg2 )
	registerHandlerInternal( f9_arg1, f9_local0, f9_arg3, f9_arg0.dvar_update, f9_arg0.dvar_update_count, getDvarEventName( f9_local0 ) )
end

function dvarUpdateDispatcher( f10_arg0, f10_arg1 )
	dispatcherInternal( f10_arg1, f10_arg0.eventCatcher.dvar_update, f10_arg0.eventCatcher.dvar_update_count, f10_arg1.dvar, getDvarEventName( f10_arg1.dvar ) )
end

function registerDirectDispatchHandler( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	registerHandlerInternal( f11_arg1, f11_arg2, f11_arg3, f11_arg0.direct_dispatch, f11_arg0.direct_dispatch_count, getDirectEventName( f11_arg2 ) )
end

function directDispatcher( f12_arg0, f12_arg1 )
	dispatcherInternal( f12_arg1, f12_arg0.eventCatcher.direct_dispatch, f12_arg0.eventCatcher.direct_dispatch_count, f12_arg1.name, getDirectEventName( f12_arg1.name ) )
end

function registerHandlerInternal( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5 )
	assert( type( f13_arg0 ) == "userdata" )
	assert( type( f13_arg1 ) == "string" )
	assert( type( f13_arg2 ) == "function" )
	local f13_local0 = true
	if not f13_arg3[f13_arg1] then
		f13_arg3[f13_arg1] = setmetatable( {}, {
			__mode = "v"
		} )
		f13_arg4[f13_arg1] = 0
	else
		local f13_local1 = 1
		while f13_local1 <= f13_arg4[f13_arg1] do
			if f13_arg3[f13_arg1][f13_local1] == f13_arg0 then
				f13_local0 = false
				break
			end
			f13_local1 = f13_local1 + 1
		end
	end
	if f13_local0 then
		f13_arg4[f13_arg1] = f13_arg4[f13_arg1] + 1
		f13_arg3[f13_arg1][f13_arg4[f13_arg1]] = f13_arg0
	end
	f13_arg0:registerEventHandler( f13_arg5, function ( element, event )
		f13_arg2( element, event.innerEvent )
	end )
end

function dispatcherInternal( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	if f15_arg1[f15_arg3] then
		local f15_local0 = 1
		local f15_local1 = f15_arg2[f15_arg3]
		while f15_local0 <= f15_local1 do
			local f15_local2 = f15_arg1[f15_arg3][f15_local0]
			if f15_local2 ~= nil then
				if not f15_local2:isClosed() then
					f15_local2:processEvent( {
						name = f15_arg4,
						innerEvent = f15_arg0
					} )
				end
				f15_local0 = f15_local0 + 1
			end
			f15_arg1[f15_arg3][f15_local0] = f15_arg1[f15_arg3][f15_local1]
			f15_arg1[f15_arg3][f15_local1] = f15_arg1[f15_arg3][f15_arg2[f15_arg3]]
			f15_arg1[f15_arg3][f15_arg2[f15_arg3]] = nil
			f15_arg2[f15_arg3] = f15_arg2[f15_arg3] - 1
			f15_local1 = f15_local1 - 1
		end
	end
end

LockTable( _M )
