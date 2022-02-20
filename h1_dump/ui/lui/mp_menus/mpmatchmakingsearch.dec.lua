local f0_local0 = 0
local f0_local1 = 0
local f0_local2 = false
local f0_local3 = false
local f0_local4 = 0
local f0_local5 = 0
local f0_local6 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f0_local1
	f0_local1 = Matchmaking.IndexPingTimeline( f1_arg1, f0_local4 )
	if f1_local0 ~= f0_local1 then
		DebugMessage( "Updated ping threshold " .. f1_local0 .. "ms -> " .. f0_local1 .. "ms " )
	end
end

local f0_local7 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f0_local0
	f0_local0 = Matchmaking.IndexPingDisparityTimeline( f2_arg1, f0_local4 )
	if f2_local0 ~= f0_local0 then
		DebugMessage( "Updated ping disparity " .. f2_local0 .. "ms -> " .. f0_local0 .. "ms" )
	end
end

local f0_local8 = function ( f3_arg0, f3_arg1 )
	Matchmaking.SetSkillBackoff( Matchmaking.GetSkillBackoff( f3_arg1, f0_local4 ) )
	if f3_arg1 >= Engine.GetDvarInt( "mm_skill_ignore_onboard_time" ) then
		Matchmaking.SetOnboardingTimeout()
	end
end

local f0_local9 = function ()
	if f0_local2 then
		f0_local5 = -1
	else
		f0_local5 = 0
	end
	Matchmaking.SetIgnoredDLCMapMask( f0_local5 )
end

local f0_local10 = function ( f5_arg0 )
	f0_local6( f5_arg0, 0 )
end

local f0_local11 = function ( f6_arg0 )
	f0_local7( f6_arg0, 0 )
end

local f0_local12 = function ( f7_arg0 )
	Matchmaking.ResetSkillBackoff()
	f0_local8( f7_arg0, 0 )
end

local f0_local13 = function ( f8_arg0 )
	f0_local2 = Engine.GetDvarFloat( "mm_dlc_map_ignore_chance" ) > math.random()
	f0_local3 = Matchmaking.IsExplicitDLCPlaylist( f8_arg0 )
	f0_local9()
end

function UpdateMatchFilters( f9_arg0 )
	local f9_local0 = GetElapsedTimeInCurrentSpace()
	f0_local6( f9_arg0, f9_local0 )
	f0_local8( f9_arg0, f9_local0 )
	f0_local7( f9_arg0, f9_local0 )
	f0_local9()
	Matchmaking.UpdateTimeline( f9_local0, f0_local4 )
end

function UpdateSearchTier()
	f0_local4 = math.min( f0_local4 + 1, Engine.GetDvarInt( "mm_search_max_tier" ) )
end

function ResetMatchFilters( f11_arg0 )
	f0_local10( f11_arg0 )
	f0_local12( f11_arg0 )
	f0_local11( f11_arg0 )
	f0_local13( f11_arg0 )
	Matchmaking.UpdateTimeline( 0, f0_local4 )
end

function ResetSearch( f12_arg0 )
	f0_local4 = 0
	ResetMatchFilters( f12_arg0 )
end

function TryRelaxDLC( f13_arg0 )
	if f0_local3 or f0_local2 then
		return false
	else
		local f13_local0 = Matchmaking.GetNextIgnoredDLCMapMask( f0_local5 )
		if f13_local0 == f0_local5 then
			return false
		else
			f0_local5 = f13_local0
			Matchmaking.SetIgnoredDLCMapMask( f0_local5 )
			return true
		end
	end
end

function GetPingThreshold()
	return f0_local1
end

function GetPingDisparityThreshold()
	return f0_local0
end

function GetIgnoredDLCMapMask()
	return f0_local5
end

function EndOfPingTimeline()
	return Matchmaking.EndOfPingTimeline( GetElapsedTimeInCurrentSpace(), f0_local4 )
end

