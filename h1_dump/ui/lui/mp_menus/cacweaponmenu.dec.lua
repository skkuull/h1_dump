local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Cac.Weapons[f1_arg0.properties.weaponCategory].Indices[f1_arg0.properties.weaponType]
	for f1_local1 = 1, #f1_arg2, 1 do
		local f1_local4 = f1_local1
		local f1_local5 = f1_arg2[f1_local4]
		f1_arg0:addTab( nil, f1_local5.text, function ()
			if f1_local0 ~= f1_local4 then
				f1_arg0.shutdown = true
				f1_arg0:dispatchEventToRoot( {
					name = "tab_selected",
					weaponCategory = f1_arg0.properties.weaponCategory,
					storageCategory = f1_arg0.properties.storageCategory,
					weaponType = f1_local5.weaponType
				} )
			end
		end, nil, nil, nil, AAR.Layout.NavTabHeight )
		if f1_local4 == f1_local0 then
			f1_arg0.tabSelected = f1_local4
		end
	end
	if #f1_arg2 == 1 then
		f1_arg0:hideLRBumpers()
	end
	f1_arg0:refreshTab( nil )
end

function cac_shared_elems_def( f3_arg0, f3_arg1 )
	local f3_local0 = {}
	for f3_local4, f3_local5 in pairs( f3_arg1 ) do
		f3_local0[#f3_local0 + 1] = {
			text = f3_local5.label,
			weaponType = f3_local5.key
		}
	end
	return {
		type = "UIElement",
		id = "cac_navigation_bar_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0
			}
		},
		children = {
			{
				type = "MFTabManager",
				id = "cac_navigation_tabs_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = false,
						rightAnchor = false,
						top = AAR.Layout.NavTabTop
					}
				},
				handlers = {
					menu_create = function ( f4_arg0, f4_arg1 )
						f0_local0( f4_arg0, f4_arg1, f3_local0 )
					end
					
				}
			}
		}
	}
end

function cac_shared_elems( menu, controller )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	} )
	self.properties = controller
	local f5_local1 = {}
	for f5_local5, f5_local6 in ipairs( Cac.Weapons[controller.weaponCategory].Keys ) do
		local f5_local7 = f5_local6 == controller.weaponType
		local f5_local8 = Engine.Localize( Cac.Weapons[controller.weaponCategory].DisplayNames[f5_local6] )
		f5_local1[#f5_local1 + 1] = {}
		f5_local1[#f5_local1].label = f5_local8
		f5_local1[#f5_local1].key = f5_local6
	end
	LUI.MenuBuilder.BuildAddChild( self, cac_shared_elems_def( controller, f5_local1 ), true )
	return self
end

LUI.MenuBuilder.registerType( "cac_shared_elems", cac_shared_elems )
LockTable( _M )
