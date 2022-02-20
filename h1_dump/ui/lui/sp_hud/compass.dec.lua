local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MenuBuilder.registerDef( "CompassHudDef", function ()
	local f1_local0 = 1
	if Engine.IsPC() then
		f1_local0 = (math.max( 1.33, math.min( 1.78, Engine.GetAspectRatio() ) ) - 1.33) / 0.44 * 0.12 + 0.88
	end
	return {
		type = "UIElement",
		id = "compassHud",
		states = {
			default = {
				bottomAnchor = true,
				bottom = -CoD.HudStandards.borderY
			},
			hud_on = {
				alpha = 1
			},
			hud_off = {
				alpha = 0
			}
		},
		children = {
			{
				type = "UIImage",
				id = "tickerTapeBlur",
				states = {
					default = {
						bottomAnchor = true,
						material = RegisterMaterial( "h1_hud_compass_blur" ),
						width = 409.56 * f1_local0,
						height = 85.32,
						alpha = CoD.HudStandards.blurAlpha
					}
				}
			},
			{
				type = "UIElement",
				id = "tickerTapeOverlay",
				states = {
					default = {
						bottomAnchor = true,
						alpha = 1
					},
					on = {
						alpha = 1
					}
				},
				children = {
					{
						type = "UIImage",
						id = "tickerTapeOverlayImage",
						states = {
							default = {
								bottomAnchor = true,
								width = 409.56 * f1_local0,
								height = 85.32,
								alpha = CoD.HudStandards.overlayAlpha
							},
							on = {
								material = RegisterMaterial( "h1_hud_compass_border" ),
								color = CoD.HudStandards.overlayTint,
								alpha = CoD.HudStandards.overlayAlpha
							},
							nvg_on = {
								material = RegisterMaterial( "h1_hud_compass_border_nightvision" ),
								color = CoD.HudStandards.nvgOverlayTint,
								alpha = CoD.HudStandards.overlayAlphaNVG
							}
						}
					}
				}
			},
			{
				type = "UIImage",
				id = "tickerTapeBottomMarker",
				states = {
					default = {
						bottomAnchor = true,
						material = RegisterMaterial( "h1_hud_compass_refmarker" ),
						width = 5.33,
						height = 5.33,
						alpha = 0.8,
						bottom = 0.67
					}
				}
			},
			{
				type = "UICompass",
				id = "compassTickerTape",
				states = {
					default = {
						bottomAnchor = true,
						width = 341.3 * f1_local0,
						left = -170.65,
						height = 21.33,
						bottom = -6.67,
						material = RegisterMaterial( "h1_minimap_tickertape" ),
						alpha = 1
					}
				}
			}
		}
	}
end )
LockTable( _M )
