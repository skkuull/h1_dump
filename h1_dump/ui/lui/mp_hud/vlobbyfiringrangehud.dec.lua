local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		if f1_arg0 == 3 then
			Engine.SetUI3DWindows( f1_arg0, 0, 0.5, 0.3, 1, CoD.UI3DScaleMode.ScaleVirtualScreen )
		else
			Engine.SetUI3DWindows( f1_arg0, 0, 0, 1, 1 )
		end
		f2_arg0:setUI3DWindow( f1_arg0 )
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = "not set"
	local f3_local1 = Game.GetOmnvar( "ui_vlobby_round_state" )
	local f3_local2 = Engine.Localize( "@LUA_MENU_SECONDS_FIRINGRANGE", string.format( "%.1f", Game.GetOmnvar( "ui_vlobby_round_timer" ) ) )
	if f3_local1 == 0 then
		f3_arg0:animateToState( "default", 0 )
	elseif f3_local1 == 1 then
		f3_arg0:animateToState( "active", 0 )
	elseif f3_local1 == 2 then
		f3_arg0:animateToState( "finished", 0 )
	elseif f3_local1 == 3 then
		f3_arg0:animateToState( "target_move", 0 )
		f3_local2 = Engine.Localize( "@LUA_MENU_FIRINGRANGE_MOVE_TARGET_CONSOLE" )
	end
	f3_arg0:setText( f3_local2 )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = ""
	local f4_local1 = Game.GetOmnvar( "ui_vlobby_round_state" )
	local f4_local2 = Game.GetOmnvar( "ui_vlobby_round_hits" )
	if f4_arg1.omnvar == "ui_vlobby_round_hits" or f4_arg1.omnvar == "ui_vlobby_round_state" then
		if f4_local1 ~= 0 then
			local f4_local3 = Engine.Localize( "@LUA_MENU_FIRINGRANGE_HITS", string.format( "%.0f", f4_local2 ) )
			f4_arg0:animateToState( "active", 0 )
			f4_arg0:setText( f4_local3 )
		else
			f4_arg0:setText( "" )
			f4_arg0:animateToState( "default", 0 )
		end
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = ""
	local f5_local1 = Game.GetOmnvar( "ui_vlobby_round_state" )
	local f5_local2 = Game.GetOmnvar( "ui_vlobby_round_fired" )
	if f5_arg1.omnvar == "ui_vlobby_round_fired" or f5_arg1.omnvar == "ui_vlobby_round_state" then
		if f5_local1 ~= 0 then
			local f5_local3 = Engine.Localize( "@LUA_MENU_FIRINGRANGE_FIRED", string.format( "%.0f", f5_local2 ) )
			f5_arg0:animateToState( "active", 0 )
			f5_arg0:setText( f5_local3 )
		else
			f5_arg0:setText( "" )
			f5_arg0:animateToState( "default", 0 )
		end
	end
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = ""
	local f6_local1 = Game.GetOmnvar( "ui_vlobby_round_state" )
	local f6_local2 = Game.GetOmnvar( "ui_vlobby_round_accuracy" )
	if f6_arg1.omnvar == "ui_vlobby_round_accuracy" or f6_arg1.omnvar == "ui_vlobby_round_state" then
		if f6_local1 ~= 0 then
			local f6_local3 = Engine.Localize( "@LUA_MENU_FIRINGRANGE_ACCURACY", string.format( "%.0f", f6_local2 ) )
			f6_arg0:animateToState( "active", 0 )
			f6_arg0:setText( f6_local3 )
		else
			f6_arg0:setText( "" )
			f6_arg0:animateToState( "default", 0 )
		end
	end
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = ""
	local f7_local1 = Game.GetOmnvar( "ui_vlobby_round_state" )
	local f7_local2 = Game.GetOmnvar( "ui_vlobby_round_distance" )
	if f7_arg1.omnvar == "ui_vlobby_round_distance" or f7_arg1.omnvar == "ui_vlobby_round_state" then
		if f7_local1 == 3 then
			local f7_local3 = Engine.Localize( "@LUA_MENU_FIRINGRANGE_DISTANCE", string.format( "%.0f", f7_local2 ) )
			f7_arg0:animateToState( "active", 0 )
			f7_arg0:setText( f7_local3 )
		else
			f7_arg0:setText( "" )
			f7_arg0:animateToState( "default", 0 )
		end
	end
end

local f0_local6 = function ( f8_arg0, f8_arg1 )
	if not Engine.GetDvarBool( "xblive_privatematch" ) then
		f8_arg0:setText( Lobby.GetPartyStatus() )
	end
end

local f0_local7 = function ()
	return {
		type = "UIElement",
		id = "VlobbyFiringRangeHudMainId",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = true,
				rightAnchor = true,
				top = 0,
				left = 0,
				bottom = 0,
				right = 0,
				alpha = 1
			}
		},
		children = {
			{
				type = "FiringRange2DText",
				id = "VlobbyFiringRangeHudChildId",
				handlers = {
					menu_create = f0_local1,
					omnvar_update = {
						ui_vlobby_round_timer = f0_local1,
						ui_vlobby_round_state = f0_local1
					}
				}
			},
			{
				type = "FiringRange2DTextPartyStatus",
				id = "FiringRange2DTextPartyStatusId",
				handlers = {
					menu_create = f0_local6,
					refreshPartyStatus = f0_local6
				}
			},
			{
				type = "UITimer",
				id = "partyStatusTimerId",
				properties = {
					interval = 200,
					event = {
						name = "refreshPartyStatus",
						dispatchChildren = true
					}
				}
			},
			{
				type = "UIElement",
				id = "VlobbyFiringRange3dHUDID",
				states = {
					default = {
						topAnchor = true,
						leftAnchor = true,
						bottomAnchor = true,
						rightAnchor = true,
						top = 0,
						left = 0,
						bottom = 0,
						right = 0,
						alpha = 1
					}
				},
				children = {
					{
						type = "FiringRange3DTextHits",
						id = "Vlobby3dFiringRangeHitsHudChildId",
						handlers = {
							menu_create = f0_local2,
							omnvar_update = {
								ui_vlobby_round_state = f0_local2,
								ui_vlobby_round_hits = f0_local2
							}
						}
					},
					{
						type = "FiringRange3DTextFired",
						id = "Vlobby3dFiringRangeFiredHudChildId",
						handlers = {
							menu_create = f0_local3,
							omnvar_update = {
								ui_vlobby_round_state = f0_local3,
								ui_vlobby_round_fired = f0_local3
							}
						}
					},
					{
						type = "FiringRange3DTextDistance",
						id = "Vlobby3dFiringRangeDistanceHudChildId",
						handlers = {
							menu_create = f0_local5,
							omnvar_update = {
								ui_vlobby_round_state = f0_local5,
								ui_vlobby_round_distance = f0_local5
							}
						}
					}
				}
			}
		}
	}
end

local f0_local8 = function ( f10_arg0, f10_arg1 )
	return {
		type = "UIText",
		id = "FiringRange2DTextId",
		properties = {
			text = Engine.Localize( "@LUA_MENU_SECONDS_FIRINGRANGE", tostring( string.format( "%.1f", Game.GetOmnvar( "ui_vlobby_round_timer" ) ) ) ),
			textStyle = CoD.TextStyle.Shadowed
		},
		states = {
			default = {
				topAnchor = true,
				leftAnchor = false,
				bottomAnchor = false,
				rightAnchor = false,
				top = 64,
				left = 0,
				height = 30,
				width = 700,
				font = CoD.TextSettings.BodyFontBold24.Font,
				alignment = LUI.Alignment.Center,
				red = 1,
				green = 1,
				blue = 1,
				alpha = 0
			},
			active = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1,
				width = 700
			},
			finished = {
				alpha = 1,
				red = Colors.h1.enemy_red.r,
				green = Colors.h1.enemy_red.g,
				blue = Colors.h1.enemy_red.b,
				width = 700
			},
			target_move = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1,
				width = 700
			}
		}
	}
end

local f0_local9 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = Lobby.GetPartyStatus()
	local self = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = DesignGridDims.horz_gutter,
		bottom = -S1MenuDims.safe_area_vert,
		height = CoD.TextSettings.TitleFontMedium.Height,
		font = CoD.TextSettings.TitleFontMedium.Font,
		alignment = LUI.Alignment.Left,
		color = Colors.s1.text_focused
	} )
	self.id = "PartyStatusUITextId"
	self.type = "UIText"
	return self
end

local f0_local10 = function ( f12_arg0, f12_arg1 )
	return {
		type = "UIText",
		id = "FiringRange3DTextHits",
		properties = {
			text = "",
			textStyle = CoD.TextStyle.Shadowed
		},
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = false,
				top = 64,
				left = 100,
				height = CoD.TextSettings.BodyFontBold24.Height,
				width = 250,
				font = CoD.TextSettings.BodyFontBold24.Font,
				alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
				red = 1,
				green = 1,
				blue = 1,
				alpha = 1
			},
			active = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1
			}
		}
	}
end

local f0_local11 = function ( f13_arg0, f13_arg1 )
	return {
		type = "UIText",
		id = "FiringRange3DTextFired",
		properties = {
			text = "",
			textStyle = CoD.TextStyle.Shadowed
		},
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = false,
				top = 90,
				left = 100,
				height = CoD.TextSettings.BodyFontBold24.Height,
				width = 250,
				font = CoD.TextSettings.BodyFontBold24.Font,
				alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
				red = 1,
				green = 1,
				blue = 1,
				alpha = 1
			},
			active = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1
			}
		}
	}
end

local f0_local12 = function ( f14_arg0, f14_arg1 )
	return {
		type = "UIText",
		id = "FiringRange3DTextAccuracy",
		properties = {
			text = "",
			textStyle = CoD.TextStyle.Shadowed
		},
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = false,
				top = 116,
				left = 100,
				height = CoD.TextSettings.BodyFontBold24.Height,
				width = 250,
				font = CoD.TextSettings.BodyFontBold24.Font,
				alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
				red = 1,
				green = 1,
				blue = 1,
				alpha = 1
			},
			active = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1
			}
		}
	}
end

local f0_local13 = function ( f15_arg0, f15_arg1 )
	return {
		type = "UIText",
		id = "FiringRange3DTextDistance",
		properties = {
			text = "",
			textStyle = CoD.TextStyle.Shadowed
		},
		states = {
			default = {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = false,
				rightAnchor = false,
				top = 142,
				left = 100,
				height = CoD.TextSettings.BodyFontBold24.Height,
				width = 250,
				font = CoD.TextSettings.BodyFontBold24.Font,
				alignment = LUI.AdjustAlignmentForLanguage( LUI.Alignment.Left ),
				red = 1,
				green = 1,
				blue = 1,
				alpha = 1
			},
			active = {
				alpha = 1,
				red = 1,
				green = 1,
				blue = 1
			}
		}
	}
end

LUI.MenuBuilder.registerType( "FiringRange2DTextPartyStatus", f0_local9 )
LUI.MenuBuilder.registerDef( "VlobbyFiringRangeHudMain", f0_local7 )
LUI.MenuBuilder.registerDef( "FiringRange2DText", f0_local8 )
LUI.MenuBuilder.registerDef( "FiringRange3DTextHits", f0_local10 )
LUI.MenuBuilder.registerDef( "FiringRange3DTextFired", f0_local11 )
LUI.MenuBuilder.registerDef( "FiringRange3DTextAccuracy", f0_local12 )
LUI.MenuBuilder.registerDef( "FiringRange3DTextDistance", f0_local13 )
LockTable( _M )
