local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = {
	{
		challenge = "LB_TIMETRIAL_FNG",
		challengeName = "@MENU_SP_H1_KILLHOUSE_TIMETRIAL"
	},
	{
		challenge = "LB_AM_CARGOSHIP",
		challengeName = "@MENU_SP_H1_CARGOSHIP"
	},
	{
		challenge = "LB_AM_BLACKOUT",
		challengeName = "@MENU_SP_H1_BLACKOUT"
	},
	{
		challenge = "LB_AM_ARMADA",
		challengeName = "@MENU_SP_H1_ARMADA"
	},
	{
		challenge = "LB_AM_BOG_A",
		challengeName = "@MENU_SP_H1_BOG_A"
	},
	{
		challenge = "LB_AM_HUNTED",
		challengeName = "@MENU_SP_H1_HUNTED"
	},
	{
		challenge = "LB_AM_AC130",
		challengeName = "@MENU_SP_H1_AC130"
	},
	{
		challenge = "LB_AM_BOG_B",
		challengeName = "@MENU_SP_H1_BOG_B"
	},
	{
		challenge = "LB_AM_AIRLIFT",
		challengeName = "@MENU_SP_H1_AIRLIFT"
	},
	{
		challenge = "LB_AM_VILLAGE_ASSAULT",
		challengeName = "@MENU_SP_H1_VILLAGE_ASSAULT"
	},
	{
		challenge = "LB_AM_SCOUTSNIPER",
		challengeName = "@MENU_SP_H1_SCOUTSNIPER"
	},
	{
		challenge = "LB_AM_SNIPERESCAPE",
		challengeName = "@MENU_SP_H1_SNIPERESCAPE"
	},
	{
		challenge = "LB_AM_VILLAGE_DEFEND",
		challengeName = "@MENU_SP_H1_VILLAGE_DEFEND"
	},
	{
		challenge = "LB_AM_AMBUSH",
		challengeName = "@MENU_SP_H1_AMBUSH"
	},
	{
		challenge = "LB_AM_ICBM",
		challengeName = "@MENU_SP_H1_ICBM"
	},
	{
		challenge = "LB_AM_LAUNCHFACILITY_A",
		challengeName = "@MENU_SP_H1_LAUNCHFACILITY_A"
	},
	{
		challenge = "LB_AM_LAUNCHFACILITY_B",
		challengeName = "@MENU_SP_H1_LAUNCHFACILITY_B"
	},
	{
		challenge = "LB_AM_JEEPRIDE",
		challengeName = "@MENU_SP_H1_JEEPRIDE"
	},
	{
		challenge = "LB_AM_AIRPLANE",
		challengeName = "@MENU_SP_H1_AIRPLANE"
	},
	{
		challenge = "LB_AM_FULLCHALLENGE",
		challengeName = "@MENU_ARCADE_FULL"
	}
}
function SPLeaderboardCreateMenu( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.MenuTemplate.new( f1_arg0, {
		menu_title = Engine.ToUpperCase( Engine.Localize( "@LUA_MENU_LEADERBOARDS_CAPS" ) ),
		menu_top_indent = LUI.MenuTemplate.spMenuOffset
	} )
	Leaderboards.Clear()
	for f1_local4, f1_local5 in pairs( f0_local0 ) do
		f1_local0:AddButton( f1_local5.challengeName, function ( f2_arg0, f2_arg1 )
			LUI.FlowManager.RequestAddMenu( f2_arg0, "sp_leaderboard_data", true, f2_arg1.controller, false, {
				leaderBoardData = f1_local5,
				startValue = 1,
				newFilter = true
			} )
		end, nil, true )
	end
	f1_local1 = f1_local0:AddBackButton()
	LUI.Options.InitScrollingList( f1_local0.list, nil )
	return f1_local0
end

LUI.MenuBuilder.registerType( "sp_leaderboard", SPLeaderboardCreateMenu )
LockTable( _M )
