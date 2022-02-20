local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 1000
f0_local1 = 1000
f0_local2 = 50
local f0_local3 = 0
local f0_local4 = 1
local f0_local5 = 2
local f0_local6 = 3
local f0_local7 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.stanceImage == nil then
		f1_arg0.stanceImage = f1_arg0:getChildById( "stanceImage" )
	end
	local f1_local0 = Game.GetPlayerStance()
	local f1_local1 = Engine.GetDvarBool( "hud_showStanceCarry" )
	if f1_local1 then
		f1_local0 = f0_local6
	end
	if f1_arg0.stanceImage.current_stance == f1_local0 then
		if f1_arg0.stanceImage.timeToFade > 0 then
			f1_arg0.stanceImage.timeToFade = f1_arg0.stanceImage.timeToFade - f1_arg1.timeElapsed
			if f1_arg0.stanceImage.timeToFade <= 0 then
				f1_arg0.stanceImage:animateToState( "off", f0_local1 )
			end
		end
	else
		if f1_local0 == f0_local3 then
			f1_arg0.stanceImage:animateToState( "standing", 0 )
			f1_arg0.stanceImage.timeToFade = f0_local0
		elseif f1_local0 == f0_local4 then
			f1_arg0.stanceImage:animateToState( "crouched", 0 )
			f1_arg0.stanceImage.timeToFade = 0
		elseif f1_local0 == f0_local5 then
			f1_arg0.stanceImage:animateToState( "prone", 0 )
			f1_arg0.stanceImage.timeToFade = 0
		elseif f1_local0 == f0_local6 then
			f1_arg0.stanceImage:animateToState( "carry", 0 )
			f1_arg0.stanceImage.timeToFade = 0
		end
		f1_arg0.stanceImage.isCarryOverride = f1_local1
		f1_arg0.stanceImage.current_stance = f1_local0
	end
end

local f0_local8 = function ()
	return {
		type = "UIImage",
		id = "stanceImage",
		states = {
			default = {
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				topAnchor = true,
				material = RegisterMaterial( "stance_stand" ),
				alpha = 0
			},
			off = {
				alpha = 0
			},
			standing = {
				material = RegisterMaterial( "stance_stand" ),
				alpha = 0.75
			},
			crouched = {
				material = RegisterMaterial( "stance_crouch" ),
				alpha = 0.75
			},
			prone = {
				material = RegisterMaterial( "stance_prone" ),
				alpha = 0.75
			},
			carry = {
				material = RegisterMaterial( "stance_carry" ),
				alpha = 0.75
			}
		}
	}
end

LUI.MenuBuilder.registerDef( "hudStanceIndicatorDef", function ()
	local f3_local0 = {
		type = "UIElement",
		id = "hudStanceIndicator",
		states = {
			default = {
				bottomAnchor = true,
				leftAnchor = true,
				bottom = -CoD.HudStandards.borderY + 2.67,
				left = 220,
				width = 85.32,
				height = 42.66,
				alpha = CoD.iconAlpha
			}
		},
		handlers = {
			weapon_info_refresh = f0_local7
		}
	}
	local f3_local1 = {}
	f3_local0.children = f0_local8()
	return f3_local0
end )
LockTable( _M )
