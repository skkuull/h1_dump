if not MPMatchmaking then
	MPMatchmaking = {}
end
function DebugMessage( f1_arg0 )
	Matchmaking.Printf( GetMatchmakingStateString(), GetMatchmakingSpaceString(), f1_arg0 .. "\n" )
end

MPMatchmaking.Setup = function ()
	MPMatchmakingStateMachine.Setup()
	MPMatchmakingResults.Setup()
end

