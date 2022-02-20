if not MPMatchmakingResults then
	MPMatchmakingResults = {}
end
local f0_local0 = {
	AGGREGATE = 0,
	MEDIAN = 1,
	AVERAGE = 2,
	HOST = 3
}
local f0_local1 = {
	UNKNOWN = {
		0,
		"UNKNOWN"
	},
	OK = {
		1,
		"OK"
	},
	PING_HIGH = {
		2,
		"PING_HIGH"
	},
	PING_DISPARATE = {
		3,
		"PING_DISPARATE"
	},
	QOS_UNRESPONSIVE = {
		4,
		"QOS_UNRESPONSIVE"
	}
}
local f0_local2 = 0
local f0_local3 = f0_local1.UNKNOWN
local f0_local4 = 0
function GetLobbyPingType()
	return f0_local0.MEDIAN
end

function GetMatchmakingCompareResult()
	return f0_local2
end

function GetMatchmakingRateResult()
	return f0_local3[1]
end

function GetMatchmakingRateValue()
	return f0_local4
end

local f0_local5 = function ()
	return Matchmaking.GetSearchResultCount() <= Engine.GetDvarInt( "mm_results_use_any_ping_max_results" )
end

local f0_local6 = function ( f6_arg0 )
	return f6_arg0.unresponsiveCount > 0
end

local f0_local7 = function ( f7_arg0 )
	local f7_local0 = f7_arg0.unresponsiveCount
	local f7_local1 = f7_arg0.totalCount - f7_arg0.pendingCount
	assert( f7_local1 > 0 )
	local f7_local2
	if f7_local1 < Engine.GetDvarInt( "mm_results_allow_unacceptable_qos_min_received" ) or math.floor( 100 * f7_local0 / f7_local1 ) > Engine.GetDvarInt( "mm_results_allow_unacceptable_qos_max_unresponsive" ) then
		f7_local2 = false
	else
		f7_local2 = true
	end
	return f7_local2
end

local f0_local8 = function ( f8_arg0 )
	local f8_local0 = f0_local5()
	local f8_local1
	if GetPingThreshold() < f8_arg0.ping then
		f8_local1 = not f8_local0
	else
		f8_local1 = false
	end
	return f8_local1
end

local f0_local9 = function ( f9_arg0 )
	local f9_local0 = GetLobbyPingType()
	local f9_local1 = f0_local5()
	local f9_local2 = nil
	if f9_local0 == f0_local0.AGGREGATE then
		f9_local2 = f9_arg0.aggregatePing
	elseif f9_local0 == f0_local0.MEDIAN then
		f9_local2 = f9_arg0.medianPing
	elseif f9_local0 == f0_local0.AVERAGE then
		f9_local2 = f9_arg0.averagePing
	else
		assert( f9_local0 == f0_local0.HOST )
		f9_local2 = f9_arg0.hostPing
	end
	local f9_local3
	if math.abs( f9_local2 - f9_arg0.lobbyPing ) > GetPingDisparityThreshold() then
		f9_local3 = not useAnyGame
	else
		f9_local3 = false
	end
	return f9_local3
end

local f0_local10 = function ( f10_arg0, f10_arg1, f10_arg2 )
	if f10_arg0 == true then
		f0_local3 = f0_local1.QOS_UNRESPONSIVE
	elseif f10_arg1 == true then
		f0_local3 = f0_local1.PING_HIGH
	elseif f10_arg2 == true then
		f0_local3 = f0_local1.PING_DISPARATE
	end
end

MPMatchmakingResults.Rate = function ( f11_arg0, f11_arg1 )
	local f11_local0 = false
	f0_local4 = -1
	f0_local3 = f0_local1.OK
	f11_arg1.ping = f11_arg1.aggregatePing
	local f11_local1 = f0_local6( f11_arg1 )
	local f11_local2 = f0_local7( f11_arg1 )
	local f11_local3 = f0_local8( f11_arg1 )
	local f11_local4 = f0_local9( f11_arg1 )
	local f11_local5
	if not f11_local1 or f11_local2 then
		local f11_local6 = f11_local3
		f11_local5 = f11_local4
	else
		f11_local5 = f11_local6 or true
	end
	if f11_local5 then
		f0_local10( f11_local1, f11_local3, f11_local4 )
		Matchmaking.ClearActiveResult( f11_arg1.index )
	else
		local f11_local7 = Matchmaking.IsSteamSessionBad( f11_arg1.index )
		if f11_local1 or badSteamSession or f11_arg1.pendingCount > 0 then
			f11_arg1.ping = math.max( f11_arg1.ping, GetPingThreshold() )
		end
		f0_local4 = math.floor( f11_arg1.ping / Engine.GetDvarInt( "mm_results_ping_band" ) )
	end
	DebugMessage( "Rated session " .. f11_arg1.index .. ": " .. f0_local3[2] .. ", rating=" .. f0_local4 .. ", server-ping=[ active=" .. f11_arg1.ping .. ", average=" .. f11_arg1.averagePing .. ", aggregate=" .. f11_arg1.aggregatePing .. ", median=" .. f11_arg1.medianPing .. ", host=" .. f11_arg1.hostPing .. "], lobby-ping=" .. f11_arg1.lobbyPing .. ", qos=" .. f11_arg1.totalCount - f11_arg1.pendingCount .. "/" .. f11_arg1.totalCount .. ", unresponsive=" .. f11_arg1.unresponsiveCount )
end

MPMatchmakingResults.Compare = function ( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg1.ping_rating_1
	local f12_local1 = f12_arg1.skill_rating_1
	local f12_local2 = f12_arg1.ping_rating_2
	local f12_local3 = f12_arg1.skill_rating_2
	f0_local2 = math.floor( f12_local0 - f12_local2 )
	if f0_local2 == 0 then
		f0_local2 = math.floor( f12_local1 - f12_local3 )
	end
end

MPMatchmakingResults.Setup = function ()
	local f13_local0 = Engine.GetLuiRoot()
	f13_local0:registerEventHandler( "matchmaking_results_compare", MPMatchmakingResults.Compare )
	f13_local0:registerEventHandler( "matchmaking_results_rate", MPMatchmakingResults.Rate )
end

