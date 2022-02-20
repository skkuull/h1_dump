local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.ConsoleOptions = {}
LUI.ConsoleOptions.Categories = {}
LUI.ConsoleOptions.Categories[#LUI.ConsoleOptions.Categories + 1] = {
	title = "@LUA_MENU_CONTROLS",
	menuType = "console_controls"
}
LUI.ConsoleOptions.Categories[#LUI.ConsoleOptions.Categories + 1] = {
	title = "@LUA_MENU_SOUND_OPTIONS",
	menuType = "console_audio"
}
LUI.ConsoleOptions.Categories[#LUI.ConsoleOptions.Categories + 1] = {
	title = "@LUA_MENU_GRAPHIC_OPTIONS",
	menuType = "console_graphics"
}
f0_local0 = nil
if Engine.IsXB3() then
	f0_local0 = "@LUA_MENU_CONSOLE_INFO"
else
	f0_local0 = "@LUA_MENU_SYSTEM_INFO"
end
LUI.ConsoleOptions.Categories[#LUI.ConsoleOptions.Categories + 1] = {
	title = f0_local0,
	menuType = "SystemInfo"
}
if Engine.InFrontend() and Engine.IsMultiplayer() and CoD.IsCoDAccountRegistrationAvailableInMyRegion() then
	LUI.ConsoleOptions.Categories[#LUI.ConsoleOptions.Categories + 1] = {
		title = "@LUA_MENU_COD_ACCOUNT",
		menuType = "cod_anywhere_options"
	}
end
LUI.ConsoleOptions.FindTypeIndex = function ( f1_arg0 )
	for f1_local3, f1_local4 in ipairs( LUI.ConsoleOptions.Categories ) do
		if f1_local4.menuType == f1_arg0 then
			return f1_local3
		end
	end
	return 0
end

LUI.ConsoleOptions.IsOptionLocked = function ( f2_arg0 )
	return LUI.ConsoleOptions.Categories[f2_arg0].locked
end

LUI.ConsoleOptions.LoadMenu = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = true
	local f3_local1 = true
	Engine.ExecNow( "profile_menuDvarsFinish", f3_arg1.controller )
	Engine.Exec( "updategamerprofile" )
	LUI.FlowManager.RequestAddMenu( f3_arg0, LUI.ConsoleOptions.Categories[f3_arg2].menuType, f3_local1, f3_arg1.controller, f3_local0 )
	CoD.PlayEventSound( CoD.SFX.H1TabChange, 10 )
end

LockTable( _M )
