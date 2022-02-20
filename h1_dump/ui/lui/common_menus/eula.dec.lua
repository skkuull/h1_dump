local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.EULA = InheritFrom( LUI.EULABase )
LUI.EULA.new = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.EULABase.CreateTextStrings( "@PLATFORM_EULA_", 8 )
	if Engine.IsPS4() then
		if Engine.IsPS4SCEA() then
			f1_local0[#f1_local0 + 1] = "@PLATFORM_EULA_STORE_AMERICA"
		elseif Engine.IsPS4SCEE() then
			f1_local0[#f1_local0 + 1] = "@PLATFORM_EULA_STORE_EUROPE"
		end
	end
	return LUI.EULABase.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ), {
		textStrings = f1_local0,
		declineCallback = f1_arg1.declineCallback,
		acceptCallback = function ( f2_arg0 )
			Engine.AcceptEULA( f2_arg0 )
			if f1_arg1.acceptCallback then
				f1_arg1.acceptCallback( f2_arg0 )
			end
		end
		
	} )
end

LUI.MenuBuilder.registerPopupType( "EULA", LUI.EULA.new )
