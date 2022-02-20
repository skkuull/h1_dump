MLG = MLG or {}
MLG.GetRulesVersionNumber = function ()
	local f1_local0 = MatchRules.GetData( "mlgVersion" )
	if not f1_local0 or #f1_local0 == 0 then
		f1_local0 = "0.0.0"
	elseif Engine.GetDvarBool( "lui_mlg_rules_unlocked" ) then
		f1_local0 = f1_local0 + 0.1
	end
	return Engine.MarkLocalized( f1_local0 )
end

MLG.IsFeatureAvailable = function ()
	local f2_local0 = Engine.GetSystemLink()
	if not f2_local0 then
		f2_local0 = Engine.GetSplitScreen()
		if not f2_local0 then
			f2_local0 = IsPrivateMatch()
		end
	end
	if f2_local0 then
		f2_local0 = Engine.GetDvarBool( "using_mlg" )
	end
	return f2_local0
end

MLG.CanIAdjustMLGSettings = function ()
	if not MLG.IsFeatureAvailable() then
		return false
	end
	local f3_local0 = Engine.GetSystemLink()
	if not f3_local0 then
		f3_local0 = Engine.GetSplitScreen()
		if not f3_local0 then
			f3_local0 = Lobby.IsGameHost()
		end
	end
	return f3_local0
end

MLG.AreMLGRulesEnabled = function ()
	if not MLG.IsFeatureAvailable() then
		return false
	elseif Engine.GetSplitScreen() then
		return Engine.GetDvarBool( "xblive_competitionmatch" ) == true
	else
		return Lobby.IsUsingMLGRules()
	end
end

MLG.SetMLGRulesEnabled = function ( f5_arg0, f5_arg1 )
	if MLG.CanIAdjustMLGSettings() then
		Lobby.SetUsingMLGRules( f5_arg0 )
		Engine.SetDvarBool( "xblive_competitionmatch", f5_arg0 )
		if not f5_arg1 then
			LoadMatchRules()
		end
	end
end

