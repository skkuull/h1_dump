local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 ~= nil and f1_arg1.bold ~= nil and f1_arg1.bold == true and f1_arg1.message ~= nil then
		f1_arg0:setText( f1_arg1.message )
		local f1_local0 = MBh.AnimateSequence( {
			{
				"opening",
				0
			},
			{
				"active",
				100
			},
			{
				"active",
				2500
			},
			{
				"default",
				100
			}
		} )
		f1_local0( f1_arg0 )
	end
end

LUI.MenuBuilder.registerDef( "gameMessageHudDef", function ()
	local f2_local0 = CoD.TextSettings.BodyFont
	return {
		type = "UIElement",
		id = "gameMessageHudId",
		states = {
			default = {
				topAnchor = true,
				leftAnchor = false,
				bottomAnchor = false,
				rightAnchor = false,
				top = GameX.IsSplitscreen() and 115 or 194,
				left = -32,
				bottom = 32,
				right = 32
			}
		},
		children = {
			{
				type = "UIText",
				id = "gameMessageTextId",
				properties = {
					text = "",
					textStyle = CoD.TextStyle.Shadowed
				},
				states = {
					default = {
						topAnchor = true,
						leftAnchor = false,
						bottomAnchor = false,
						rightAnchor = false,
						top = 0,
						left = 0,
						bottom = 0,
						right = 0,
						font = f2_local0.Font,
						alpha = 0
					},
					opening = {
						topAnchor = true,
						leftAnchor = false,
						bottomAnchor = false,
						rightAnchor = false,
						top = 0,
						left = -256,
						bottom = f2_local0.Height + 80,
						right = 256,
						alpha = 1
					},
					active = {
						topAnchor = true,
						leftAnchor = false,
						bottomAnchor = false,
						rightAnchor = false,
						top = 0,
						left = -256,
						bottom = f2_local0.Height * 0.65,
						right = 256,
						alpha = 1
					}
				},
				handlers = {
					game_message = f0_local0
				}
			}
		}
	}
end )
LockTable( _M )
