local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Property( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	assert( f1_arg0, "No property name given" )
	f1_local0.propName = f1_arg0
	f1_local0.propAlias = f1_arg1
	f1_local0.isProperty = true
	f1_local0.func = function ( f2_arg0 )
		local f2_local0 = assert
		local f2_local1
		if f2_arg0[f1_local0.propName] == nil and (f1_local0.propAlias == nil or f2_arg0[f1_local0.propAlias] == nil) then
			f2_local1 = false
		else
			f2_local1 = true
		end
		f2_local0( f2_local1, "Could not find property named " .. f1_local0.propName )
		if f2_arg0[f1_local0.propName] ~= nil then
			return f2_arg0[f1_local0.propName]
		else
			return f2_arg0[f1_local0.propAlias]
		end
	end
	
	return f1_local0
end

function PropertyOrDefault( f3_arg0, f3_arg1 )
	local f3_local0 = {}
	assert( f3_arg0, "No property name given" )
	f3_local0.propName = f3_arg0
	f3_local0.propAlias = propAlias
	f3_local0.isProperty = true
	f3_local0.func = function ( f4_arg0 )
		local f4_local0 = assert
		local f4_local1
		if f4_arg0[f3_local0.propName] == nil and f3_arg1 == nil then
			f4_local1 = false
		else
			f4_local1 = true
		end
		f4_local0( f4_local1, "Could not find property named " .. f3_local0.propName .. " and no default value is given." )
		if f4_arg0[f3_local0.propName] ~= nil then
			return f4_arg0[f3_local0.propName]
		else
			return f3_arg1
		end
	end
	
	return f3_local0
end

function HalfProperty( f5_arg0 )
	local f5_local0 = {}
	assert( f5_arg0, "No property name given" )
	f5_local0.propName = f5_arg0
	f5_local0.isProperty = true
	f5_local0.func = function ( f6_arg0 )
		assert( f6_arg0[f5_local0.propName] ~= nil, "Could not find property named " .. f5_local0.propName )
		if type( f6_arg0[f5_local0.propName] ) == "number" then
			return 0.5 * f6_arg0[f5_local0.propName]
		else
			assert( false, "Property " .. f5_local0.propName .. " should be a number for use with the HalfProperty helper" )
		end
	end
	
	return f5_local0
end

function HalfOppositeProperty( f7_arg0 )
	local f7_local0 = {}
	assert( f7_arg0, "No property name given" )
	f7_local0.propName = f7_arg0
	f7_local0.isProperty = true
	f7_local0.func = function ( f8_arg0 )
		assert( f8_arg0[f7_local0.propName] ~= nil, "Could not find property named " .. f7_local0.propName )
		if type( f8_arg0[f7_local0.propName] ) == "number" then
			return -0.5 * f8_arg0[f7_local0.propName]
		else
			assert( false, "Property " .. f7_local0.propName .. " should be a number for use with the HalfOppositeProperty helper" )
		end
	end
	
	return f7_local0
end

function BaseState( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0
	local f9_local1 = f9_arg1
	if not f9_local1 then
		f9_local1 = {}
	end
	return function ( f10_arg0 )
		assert( f10_arg0 )
		assert( f10_arg0.states )
		assert( f10_arg0.states[f9_local0], "Could not find base state " .. f9_local0 )
		assert( type( f10_arg0.states[f9_local0] ) == "table", "Must only use BaseState on non-derived states! state = " .. f9_local0 )
		local f10_local0 = {}
		for f10_local4, f10_local5 in pairs( f10_arg0.states[f9_local0] ) do
			f10_local0[f10_local4] = f10_local5
		end
		for f10_local4, f10_local5 in pairs( f9_local1 ) do
			f10_local0[f10_local4] = f10_local5
		end
		return f10_local0
	end
	
end

function OpenMenu( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = f11_arg0
	local f11_local1 = f11_arg1
	local f11_local2 = f11_arg2
	local f11_local3 = f11_arg3
	return function ( f12_arg0, f12_arg1 )
		LUI.FlowManager.RequestAddMenu( f12_arg0, f11_local0, f11_local1, f12_arg1.controller, f11_local2, f11_local3 )
	end
	
end

function PopupMenu( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local0 = f13_arg0
	local f13_local1 = f13_arg1
	local f13_local2 = f13_arg2
	local f13_local3 = f13_arg3
	return function ( f14_arg0, f14_arg1 )
		LUI.FlowManager.RequestPopupMenu( f14_arg0, f13_local0, f13_local1, f14_arg1.controller, f13_local2, f13_local3 )
	end
	
end

function LeaveMenu()
	return function ( f16_arg0, f16_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f16_arg0 )
	end
	
end

function EmitEvent( f17_arg0 )
	local f17_local0 = f17_arg0
	if type( f17_local0 ) == "string" then
		f17_local0 = {
			name = f17_local0
		}
	end
	return function ( f18_arg0, f18_arg1 )
		f18_arg0:processEvent( f17_local0 )
	end
	
end

function EmitEventToParent( f19_arg0, f19_arg1 )
	local f19_local0
	if f19_arg1 then
		f19_local0 = f19_arg1.saveOriginal
		if not f19_local0 then
		
		else
			local f19_local1 = f19_arg0
			if not f19_local0 and type( f19_local1 ) == "string" then
				f19_local1 = {
					name = f19_local1
				}
			end
			return function ( f20_arg0, f20_arg1 )
				if f19_local0 then
					local f20_local0 = {}
					if type( f19_local1 ) == "string" then
						f20_local0.name = f19_local1
					else
						for f20_local4, f20_local5 in pairs( f19_local1 ) do
							f20_local0[f20_local4] = f20_local5
						end
					end
					f20_local0.original = f20_arg1
					return f20_arg0:dispatchEventToParent( f20_local0 )
				else
					return f20_arg0:dispatchEventToParent( f19_local1 )
				end
			end
			
		end
	end
	f19_local0 = false
end

function EmitEventToRoot( f21_arg0 )
	local f21_local0 = f21_arg0
	if type( f21_local0 ) == "string" then
		f21_local0 = {
			name = f21_local0
		}
	end
	return function ( f22_arg0, f22_arg1 )
		f22_arg0:dispatchEventToRoot( f21_local0 )
	end
	
end

function EmitOmnvarUpdateEventToRoot( f23_arg0 )
	return function ( f24_arg0 )
		f24_arg0:dispatchEventToRoot( {
			name = "omnvar_update",
			omnvar = f23_arg0,
			value = Game.GetOmnvar( f23_arg0 )
		} )
	end
	
end

f0_local0 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = type( f25_arg0 )
	if f25_local0 == "function" then
		assert( f25_arg1.properties, "Item built that didn't get it's properties set!" )
		DebugPrint( "defaultDuration is " .. f25_arg0( f25_arg1.properties ) )
		return f25_arg0( f25_arg1.properties )
	elseif f25_local0 == "table" and f25_arg0.isProperty then
		assert( f25_arg1.properties, "Item built that didn't get it's properties set!" )
		DebugPrint( "defaultDuration is " .. f25_arg0.func( f25_arg1.properties ) )
		return f25_arg0.func( f25_arg1.properties )
	else
		return f25_arg0
	end
end

function AnimateToState( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	local f26_local0 = f26_arg0
	local f26_local1 = f26_arg1
	local f26_local2 = f26_arg2
	local f26_local3 = f26_arg3
	return function ( f27_arg0, f27_arg1 )
		local f27_local0 = LUI.FormatAnimStateFinishEvent( f26_local0 )
		if f27_arg0.m_eventHandlers[f27_local0] then
			DebugPrint( "LUI Warning: AnimateLoop is overwriting an event handler " .. f26_local0 )
		end
		f27_arg0:registerEventHandler( f27_local0, nil )
		local f27_local1
		if f27_arg1 then
			f27_local1 = f27_arg1.duration
			if not f27_local1 then
			
			else
				local f27_local2 = f0_local0( f26_local2, f27_arg0 )
				local f27_local3 = f0_local0( f26_local3, f27_arg0 )
				if f27_arg0:hasAnimationState( f26_local0 ) then
					if Engine.GetDvarBool( "lui_print_anim_states" ) then
						local f27_local4 = "None"
						if f27_arg0.id ~= nil then
							f27_local4 = f27_arg0.id
						end
						DebugPrint( "LUI: AnimateToState: id: " .. f27_local4 .. " state: " .. f26_local0 )
					end
					f27_arg0:animateToState( f26_local0, f27_local1, f27_local2, f27_local3 )
				end
			end
		end
		f27_local1 = f0_local0( f26_local1, f27_arg0 )
	end
	
end

function AnimateLoop( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = f28_arg0
	local f28_local1 = f28_arg1
	local f28_local2 = f28_arg2
	return function ( f29_arg0, f29_arg1 )
		f29_arg0:animateInLoop( f28_local0, f28_local1, f28_local2 )
	end
	
end

function AnimateSequence( f30_arg0 )
	local f30_local0 = f30_arg0
	local f30_local1 = requireFocus
	return function ( f31_arg0, f31_arg1 )
		f31_arg0:animateInSequence( f30_local0, f30_local1 )
	end
	
end

function DoMultiple( f32_arg0 )
	local f32_local0 = f32_arg0
	return function ( f33_arg0, f33_arg1 )
		for f33_local3, f33_local4 in ipairs( f32_local0 ) do
			assert( type( f33_local4 ) == "function" )
			f33_local4( f33_arg0, f33_arg1 )
		end
	end
	
end

function NewButtonPrompt( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4, f34_arg5, f34_arg6 )
	local self = LUI.UIText.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		bottom = 15,
		right = 200,
		alpha = 1
	} )
	if f34_arg1 ~= nil and f34_arg1 ~= "" then
		self:setText( f34_arg1 )
	end
	if f34_arg4 then
		f34_arg2.qualifier = f34_arg4
	end
	if f34_arg2 ~= nil and f34_arg3 ~= nil then
		self:registerEventHandler( "gamepad_button", function ( element, event )
			if not element.disabled and event.down == true then
				if event.button == f34_arg0 and (f34_arg4 == nil or event.qualifier == f34_arg4) then
					f34_arg2:processEvent( {
						name = f34_arg3,
						controller = event.controller
					} )
					if f34_arg6 and LUI.FlowManager.IsTopMenuModal() then
						return 
					else
						return true
					end
				elseif CoD.isPC and event.button == "key_shortcut" and (event.key == f34_arg5 or event.bind1 == bindPlayer) then
					f34_arg2:processEvent( {
						name = f34_arg3,
						controller = event.controller
					} )
					return true
				end
			end
		end )
	end
	return self
end

helpers = {
	Property = Property,
	PropertyOrDefault = PropertyOrDefault,
	HalfProperty = HalfProperty,
	HalfOppositeProperty = HalfOppositeProperty,
	BaseState = BaseState,
	AnimateToState = AnimateToState,
	DoMultiple = DoMultiple,
	AnimateLoop = AnimateLoop,
	AnimateSequence = AnimateSequence,
	OpenMenu = OpenMenu,
	PopupMenu = PopupMenu,
	LeaveMenu = LeaveMenu,
	EmitEvent = EmitEvent,
	EmitEventToParent = EmitEventToParent,
	EmitEventToRoot = EmitEventToRoot,
	EmitOmnvarUpdateEventToRoot = EmitOmnvarUpdateEventToRoot,
	NewButtonPrompt = NewButtonPrompt
}
LockTable( _M )
