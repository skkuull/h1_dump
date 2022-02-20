if not MPMatchmakingStateMachine then
	MPMatchmakingStateMachine = {}
end
local f0_local0 = {
	INITIAL = {
		0,
		"INITIAL"
	},
	DEDICATED = {
		1,
		"DEDICATED"
	},
	LISTEN = {
		2,
		"LISTEN"
	}
}
local f0_local1 = {
	IDLE = {
		0,
		"IDLE"
	},
	SEARCH_FOR_SERVER = {
		1,
		"SEARCHING"
	},
	ACQUIRE_SERVER = {
		2,
		"ACQUIRING"
	},
	QOS_SERVER = {
		3,
		"QOSING"
	},
	JOIN_SERVER = {
		4,
		"JOINING"
	},
	GAME_STARTING = {
		5,
		"STARTING"
	}
}
local f0_local2 = {
	NONE = {
		0,
		"NONE"
	},
	NO_SERVERS_FOUND = {
		1,
		"NO_SERVERS_FOUND"
	},
	NO_AVAILABLE_SERVERS = {
		2,
		"NO_AVAILABLE_SERVERS"
	},
	TIMED_OUT = {
		3,
		"TIMED_OUT"
	},
	QUERY_FAILED = {
		4,
		"QUERY_FAILED"
	},
	CANCELED = {
		5,
		"CANCELED"
	},
	NO_CONNECTIVITY = {
		6,
		"NO_CONNECTIVITY"
	},
	DISCONNECTED = {
		7,
		"DISCONNECTED"
	}
}
local f0_local3 = {
	UNKNOWN = 0,
	OPEN = 1,
	MODERATE = 2,
	STRICT = 3
}
local f0_local4 = 1
local f0_local5 = 2
local f0_local6 = 0
local f0_local7 = f0_local0.INITIAL
local f0_local8 = f0_local1.IDLE
local f0_local9 = 0
local f0_local10 = 0
local f0_local11 = function ()
	return Engine.GetTimeMsecs() / 1000
end

function GetElapsedTimeInCurrentSpace()
	return f0_local11() - f0_local9
end

function IsInDedicatedServerSpace()
	return f0_local7 == f0_local0.DEDICATED
end

function IsInListenServerSpace()
	return f0_local7 == f0_local0.LISTEN
end

function GetMatchmakingSpace()
	return f0_local7[f0_local4]
end

function GetMatchmakingState()
	return f0_local8[f0_local4]
end

function GetMatchmakingSpaceString()
	return f0_local7[f0_local5]
end

function GetMatchmakingStateString()
	return f0_local8[f0_local5]
end

local f0_local12 = function ( f9_arg0, f9_arg1 )
	if f9_arg0 == f0_local1.IDLE then
		return 
	else
		Matchmaking.LogStateMachineTransition( f9_arg0[f0_local4], f9_arg1[f0_local4] )
	end
end

local f0_local13 = function ( f10_arg0 )
	if f0_local7 ~= f10_arg0 then
		DebugMessage( "Space transition to " .. f10_arg0[f0_local5] )
		f0_local7 = f10_arg0
		f0_local9 = f0_local11()
	end
end

local f0_local14 = function ( f11_arg0 )
	if f0_local8 ~= f11_arg0 then
		DebugMessage( "State transition to " .. f11_arg0[f0_local5] )
		f0_local8 = f11_arg0
	end
end

local f0_local15 = function ()
	f0_local9 = f0_local11()
	f0_local7 = f0_local0.INITIAL
	f0_local8 = f0_local1.IDLE
	ResetSearch()
end

local f0_local16 = function ( f13_arg0 )
	local f13_local0 = Matchmaking.IsCoopReady() and Matchmaking.IsMinPlayersReady() and Matchmaking.IsTeamBalancingReady() and Matchmaking.IsServerAssigned()
	local f13_local1
	if Matchmaking.IsPlaylistAlwaysSearch( f13_arg0 ) == false then
		f13_local1 = f13_local0
	else
		f13_local1 = false
	end
	return f13_local1
end

local f0_local17 = function ( f14_arg0 )
	if f0_local16( f14_arg0 ) and Matchmaking.IsServerListen() then
		DebugMessage( "Cannot use dedicated servers - game ready to start in listen space" )
		return false
	elseif Matchmaking.AnyAvailableDataCenters() == false and Matchmaking.IsServerDedicated() == false then
		if Matchmaking.IsDataCenterForced() == false then
			DebugMessage( "Cannot use dedicated servers - no available data centers" )
		end
		return false
	else
		return true
	end
end

local f0_local18 = function ( f15_arg0 )
	local f15_local0 = GetElapsedTimeInCurrentSpace()
	local f15_local1 = Engine.GetDvarInt( "mm_server_advertise_time" )
	if f15_local0 < f15_local1 then
		DebugMessage( f15_arg0 .. " - advertise delay, " .. math.floor( f15_local1 - f15_local0 ) .. " secs remaining" )
		return false
	else
		return true
	end
end

local f0_local19 = function ( f16_arg0 )
	if Matchmaking.AreWeHost() == false then
		DebugMessage( f16_arg0 .. " - we are not the party host" )
		return false
	elseif Matchmaking.IsHostingBanned() == true then
		DebugMessage( f16_arg0 .. " - hosting banned" )
		return false
	elseif Matchmaking.IsHostingEnabled() == false then
		DebugMessage( f16_arg0 .. " - hosting disabled" )
		return false
	elseif true == Engine.GetDvarBool( "requireOpenNat" ) and Matchmaking.GetNatType() == f0_local3.STRICT then
		DebugMessage( f16_arg0 .. " - NAT type strict" )
		return false
	elseif Matchmaking.CanCreateAuthTickets() == false then
		DebugMessage( f16_arg0 .. " - cannot create auth tickets" )
		return false
	else
		return true
	end
end

local f0_local20 = function ()
	if f0_local19( "Cannot host server" ) == false then
		return false
	elseif false == Matchmaking.IsCpuSpeedSufficient() then
		DebugMessage( "Cannot host server - insufficient CPU speed" )
		return false
	elseif false == Matchmaking.IsBandwidthSufficient() then
		DebugMessage( "Cannot host server - insufficient bandwidth" )
		return false
	elseif f0_local18( "Cannot host server" ) == false then
		return false
	else
		return true
	end
end

local f0_local21 = function ()
	local f18_local0 = f0_local11()
	local f18_local1 = Engine.GetDvarInt( "mm_server_acquire_interval" )
	if f0_local19( "Cannot acquire server" ) == false then
		return false
	elseif f0_local18( "Cannot acquire server" ) == false then
		return false
	elseif f18_local0 - f0_local10 < f18_local1 then
		DebugMessage( "Cannot acquire server - not enough time has passed since last search, " .. math.floor( f18_local1 - f18_local0 - f0_local10 ) .. " secs remaining" )
		return false
	elseif false == Matchmaking.IsServerAcquireIdle() then
		DebugMessage( "Cannot acquire server - server aquire busy" )
		return false
	else
		return true
	end
end

local f0_local22 = function ()
	local f19_local0 = Engine.GetTimeMsecs()
	local f19_local1 = Matchmaking.GetSearchEndTime()
	local f19_local2 = Matchmaking.GetSearchRandomDelay()
	local f19_local3 = f19_local1 + f19_local2 + Engine.GetDvarInt( "pt_searchPauseTime" )
	if f19_local1 > 0 and f19_local3 - f19_local0 > 0 then
		DebugMessage( "Cannot search for sessions - too soon since searchEndTime, " .. math.floor( f19_local3 - f19_local0 / 1000 ) .. " secs remaining" )
		return false
	else
		local f19_local4 = Matchmaking.GetSearchStartTime()
		local f19_local5 = f19_local4 + f19_local2 + Engine.GetDvarInt( "pt_searchResultsMin" )
		if f19_local4 > 0 and f19_local5 - f19_local0 > 0 then
			DebugMessage( "Cannot search for sessions - too soon since searchStartTime, " .. math.floor( f19_local5 - f19_local0 / 1000 ) .. " secs remaining" )
			return false
		else
			return true
		end
	end
end

local f0_local23 = function ( f20_arg0 )
	if not Matchmaking.CanAddSearch() then
		return false
	elseif not TryRelaxDLC( f20_arg0 ) then
		return false
	else
		Matchmaking.AddSearch( f20_arg0 )
		return true
	end
end

local f0_local24 = function ( f21_arg0 )
	Matchmaking.StartSearch( f21_arg0 )
	while f0_local23( f21_arg0 ) do
		
	end
end

local f0_local25 = function ( f22_arg0 )
	Matchmaking.ResetServerAcquire()
	f0_local10 = f0_local11()
	Matchmaking.StartServerAcquire( f22_arg0 )
end

local f0_local26 = function ()
	local f23_local0 = f0_local7 == f0_local0.IDLE
	local f23_local1 = Matchmaking.IsServerAssigned()
	local f23_local2 = IsInDedicatedServerSpace()
	local f23_local3 = Matchmaking.IsServerDedicated()
	local f23_local4 = assert
	local f23_local5
	if f23_local0 ~= true and f23_local1 ~= false and f23_local2 ~= f23_local3 then
		f23_local5 = false
	else
		f23_local5 = true
	end
	f23_local4( f23_local5 )
end

local f0_local27 = function ( f24_arg0 )
	
end

local f0_local28 = function ( f25_arg0 )
	ResetMatchFilters()
	if Matchmaking.IsServerListen() then
		Matchmaking.ClearServer( f25_arg0 )
	end
end

local f0_local29 = function ( f26_arg0 )
	ResetMatchFilters()
end

local f0_local30 = function ( f27_arg0 )
	if Matchmaking.IsSessionInitialized() == false then
		DebugMessage( "Waiting - session not yet initialized" )
		return 
	end
	Matchmaking.SetInitialLobbySkill()
	if f0_local17( f27_arg0 ) then
		if Matchmaking.IsDataCenterForced() then
			DebugMessage( "Using dedicated servers - data center forced" )
		else
			DebugMessage( "Using dedicated servers - data centers available" )
		end
		f0_local13( f0_local0.DEDICATED )
	else
		f0_local13( f0_local0.LISTEN )
	end
end

local f0_local31 = function ( f28_arg0 )
	if f0_local8 ~= f0_local1.IDLE then
		return 
	elseif Matchmaking.IsServerDedicated() == false then
		if Matchmaking.IsServerAcquireComplete() then
			if f0_local2.NO_SERVERS_FOUND[f0_local4] == Matchmaking.GetServerAcquireError() and Matchmaking.IsDataCenterForced() == true then
				DebugMessage( "Leaving dedicated space - no servers found in forced data center" )
				f0_local13( f0_local0.LISTEN )
				return 
			end
		end
		if true == EndOfPingTimeline() then
			DebugMessage( "Leaving dedicated space - end of ping timeline" )
			f0_local13( f0_local0.LISTEN )
			return 
		elseif Matchmaking.AnyAvailableDataCenters() == false then
			DebugMessage( "Leaving dedicated space - no available data centers" )
			f0_local13( f0_local0.LISTEN )
			return 
		end
	end
end

local f0_local32 = function ( f29_arg0 )
	if f0_local8 ~= f0_local1.IDLE then
		return 
	elseif f0_local17( f29_arg0 ) and EndOfPingTimeline() then
		DebugMessage( "Leaving listen space - end of ping timeline" )
		UpdateSearchTier()
		f0_local13( f0_local0.DEDICATED )
		return 
	else
		
	end
end

local f0_local33 = function ( f30_arg0 )
	if f0_local22() then
		f0_local14( f0_local1.SEARCH_FOR_SERVER )
		return true
	else
		return false
	end
end

local f0_local34 = function ( f31_arg0 )
	if Matchmaking.GetSearchResultCount() > 0 then
		f0_local14( f0_local1.QOS_SERVER )
		return true
	else
		return false
	end
end

local f0_local35 = function ( f32_arg0 )
	if Matchmaking.IsQosComplete() then
		if Matchmaking.GetActiveResultCount() > 0 and Matchmaking.GetSearchTime() <= Engine.GetDvarInt( "pt_searchResultsLifetime" ) then
			f0_local14( f0_local1.JOIN_SERVER )
			return true
		end
	end
	return false
end

local f0_local36 = function ( f33_arg0 )
	if Matchmaking.IsServerAssigned() == false then
		if IsInDedicatedServerSpace() then
			if f0_local21() then
				f0_local14( f0_local1.ACQUIRE_SERVER )
				return true
			end
		elseif f0_local20() then
			Matchmaking.AssignServer( f33_arg0, DS_DCID_LISTEN )
		end
	end
	return false
end

local f0_local37 = function ( f34_arg0 )
	if f0_local16( f34_arg0 ) or Matchmaking.IsGameStarting() then
		f0_local14( f0_local1.GAME_STARTING )
		return true
	else
		return false
	end
end

local f0_local38 = function ( f35_arg0 )
	
end

local f0_local39 = function ( f36_arg0 )
	if Matchmaking.IsSessionInitialized() == false then
		DebugMessage( "Waiting - session not yet initialized" )
		return false
	elseif Matchmaking.IsSessionBusy() then
		DebugMessage( "Waiting - session tasks in progress" )
		return false
	elseif Matchmaking.IsHostMigrationActive() then
		DebugMessage( "Waiting - host migration active" )
		return false
	elseif Matchmaking.IsLobbyMigrationActive() then
		DebugMessage( "Waiting - lobby migration active" )
		return false
	elseif Matchmaking.IsLobbyJoinActive() then
		DebugMessage( "Waiting - lobby joining active" )
		return false
	elseif Matchmaking.IsDataCenterPingActive() then
		DebugMessage( "Waiting - data center ping active" )
		return false
	else
		return true
	end
end

local f0_local40 = function ( f37_arg0 )
	local f37_local0 = false
	if f37_local0 == false then
		f37_local0 = f0_local36( f37_arg0 )
	end
	if f37_local0 == false then
		f37_local0 = f0_local37( f37_arg0 )
	end
	if f37_local0 == false then
		f37_local0 = f0_local35( f37_arg0 )
	end
	if f37_local0 == false then
		f37_local0 = f0_local33( f37_arg0 )
	end
end

local f0_local41 = function ( f38_arg0 )
	f0_local24( f38_arg0 )
end

local f0_local42 = function ( f39_arg0 )
	if Matchmaking.IsLobbyJoinActive() then
		Matchmaking.CancelSearch( f39_arg0 )
	end
	if Matchmaking.IsSearchComplete() then
		if Matchmaking.GetSearchResultCount() > 0 then
			return true
		elseif not TryRelaxDLC( f39_arg0 ) then
			return true
		end
		f0_local24( f39_arg0 )
	end
	return false
end

local f0_local43 = function ( f40_arg0 )
	if not f0_local34( f40_arg0 ) then
		UpdateMatchFilters( f40_arg0 )
	end
end

local f0_local44 = function ( f41_arg0 )
	assert( IsInDedicatedServerSpace() == true )
	f0_local25( f41_arg0 )
end

local f0_local45 = function ( f42_arg0 )
	return Matchmaking.IsServerAcquireComplete()
end

local f0_local46 = function ( f43_arg0 )
	if Matchmaking.GetServerAcquireError() == f0_local2.NONE[f0_local4] then
		Matchmaking.AssignServer( f43_arg0, Matchmaking.GetDataCenterId() )
	end
end

local f0_local47 = function ( f44_arg0 )
	Matchmaking.StartQos( f44_arg0 )
end

local f0_local48 = function ( f45_arg0 )
	if Matchmaking.IsLobbyJoinActive() then
		Matchmaking.CancelQos( f45_arg0 )
	end
	return Matchmaking.IsQosComplete()
end

local f0_local49 = function ( f46_arg0 )
	if not f0_local35( f46_arg0 ) and TryRelaxDLC( f46_arg0 ) then
		f0_local14( f0_local1.SEARCH_FOR_SERVER )
		return 
	else
		UpdateMatchFilters( conrollerIndex )
	end
end

local f0_local50 = function ( f47_arg0 )
	Matchmaking.JoinNextSession( f47_arg0 )
end

local f0_local51 = function ( f48_arg0 )
	return Matchmaking.IsJoinComplete()
end

local f0_local52 = function ( f49_arg0 )
	f0_local14( f0_local1.IDLE )
end

local f0_local53 = function ( f50_arg0 )
	
end

local f0_local54 = function ( f51_arg0 )
	local f51_local0
	if f0_local16( f51_arg0 ) ~= false or false ~= Matchmaking.IsGameStarting() then
		f51_local0 = false
	else
		f51_local0 = true
	end
	return f51_local0
end

local f0_local55 = function ( f52_arg0 )
	
end

local f0_local56 = {
	[f0_local0.INITIAL] = {
		initFunction = f0_local27,
		advanceFunction = f0_local30
	},
	[f0_local0.DEDICATED] = {
		initFunction = f0_local28,
		advanceFunction = f0_local31
	},
	[f0_local0.LISTEN] = {
		initFunction = f0_local29,
		advanceFunction = f0_local32
	}
}
local f0_local57 = {
	[f0_local1.IDLE] = {
		initFunction = f0_local38,
		completionFunction = f0_local39,
		advanceFunction = f0_local40
	},
	[f0_local1.SEARCH_FOR_SERVER] = {
		initFunction = f0_local41,
		completionFunction = f0_local42,
		advanceFunction = f0_local43
	},
	[f0_local1.QOS_SERVER] = {
		initFunction = f0_local47,
		completionFunction = f0_local48,
		advanceFunction = f0_local49
	},
	[f0_local1.JOIN_SERVER] = {
		initFunction = f0_local50,
		completionFunction = f0_local51,
		advanceFunction = f0_local52
	},
	[f0_local1.ACQUIRE_SERVER] = {
		initFunction = f0_local44,
		completionFunction = f0_local45,
		advanceFunction = f0_local46
	},
	[f0_local1.GAME_STARTING] = {
		initFunction = f0_local53,
		completionFunction = f0_local54,
		advanceFunction = f0_local55
	}
}
MPMatchmakingStateMachine.Start = function ( f53_arg0, f53_arg1 )
	f0_local15()
end

MPMatchmakingStateMachine.Stop = function ( f54_arg0, f54_arg1 )
	f0_local12( f0_local8, f0_local7 )
	f0_local15()
end

MPMatchmakingStateMachine.Update = function ( f55_arg0, f55_arg1 )
	local f55_local0 = false
	local f55_local1 = f0_local7
	local f55_local2 = f0_local8
	f0_local56[f55_local1].advanceFunction( f55_arg1.controller )
	if f55_local1 ~= f0_local7 then
		f0_local56[f0_local7].initFunction( f55_arg1.controller )
		f55_local0 = true
	end
	if f0_local57[f0_local8].completionFunction( f55_arg1.controller ) then
		f55_local0 = true
		f0_local57[f0_local8].advanceFunction( f55_arg1.controller )
		if f55_local2 == f0_local8 then
			f0_local14( f0_local1.IDLE )
		end
		f0_local57[f0_local8].initFunction( f55_arg1.controller )
	end
	f0_local26()
	if f55_local0 then
		f0_local12( f55_local2, f55_local1 )
	end
end

MPMatchmakingStateMachine.LobbyMigrated = function ( f56_arg0, f56_arg1 )
	Matchmaking.ResetServerAcquire()
	f0_local15()
end

MPMatchmakingStateMachine.HostMigrated = function ( f57_arg0, f57_arg1 )
	f0_local15()
end

MPMatchmakingStateMachine.ServerDisconnected = function ( f58_arg0, f58_arg1 )
	DebugMessage( "Restarting dedicated space - disconnected from acquired server" )
	f0_local15()
end

MPMatchmakingStateMachine.MatchStarted = function ( f59_arg0, f59_arg1 )
	f0_local12( f0_local8, f0_local7 )
end

MPMatchmakingStateMachine.Setup = function ()
	local f60_local0 = Engine.GetLuiRoot()
	if not f60_local0.matchmaking then
		DebugMessage( "Initializing matchmaking state machine " )
		local self = LUI.UIElement.new()
		self.id = "matchmaking_state_machine"
		f60_local0:addElement( self )
		f60_local0:registerEventHandler( "matchmaking_start", MPMatchmakingStateMachine.Start )
		f60_local0:registerEventHandler( "matchmaking_stop", MPMatchmakingStateMachine.Stop )
		f60_local0:registerEventHandler( "matchmaking_update", MPMatchmakingStateMachine.Update )
		f60_local0:registerEventHandler( "matchmaking_advance", MPMatchmakingStateMachine.Advance )
		f60_local0:registerEventHandler( "matchmaking_hostmigrated", MPMatchmakingStateMachine.HostMigrated )
		f60_local0:registerEventHandler( "matchmaking_lobbymigrated", MPMatchmakingStateMachine.LobbyMigrated )
		f60_local0:registerEventHandler( "matchmaking_matchstarted", MPMatchmakingStateMachine.MatchStarted )
		f60_local0:registerEventHandler( "matchmaking_serverdisconnected", MPMatchmakingStateMachine.ServerDisconnected )
		f60_local0.matchmaking = self
		f0_local15()
	end
end

