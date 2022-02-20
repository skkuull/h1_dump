function ModuleInaccessible( f1_arg0 )
	assert( not _G[f1_arg0] )
	_G[f1_arg0] = setmetatable( {}, {
		__index = function ( f2_arg0, f2_arg1 )
			return function ()
				assert( false, "Functions from the " .. f1_arg0 .. " module are not allowed to be called from this scope." )
			end
			
		end
	} )
end

if Engine then
	Engine.UsingSplitscreenUpscaling = Engine.UsingSplitscreenUpscaling or function ()
		return false
	end
	
end
