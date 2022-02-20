local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.TOS = InheritFrom( LUI.EULABase )
LUI.TOS.new = function ( f1_arg0, f1_arg1 )
	return LUI.EULABase.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), {
		textStrings = LUI.EULABase.CreateTextStrings( "@LUA_MP_FRONTEND_TOS_", 9 ),
		acceptString = "@LUA_MENU_CLOSE",
		declineString = "@LUA_MENU_BACK"
	} )
end

LUI.MenuBuilder.registerPopupType( "TOS", LUI.TOS.new )
