local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function perspectiveBlur( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {}
	end
	if not f1_arg0 then
		f1_arg0 = {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0
		}
	end
	f1_arg0.red = 0.8
	f1_arg0.green = 0.8
	f1_arg0.blue = 0.8
	if Engine.IsCurrentGen() then
		f1_arg0.material = RegisterMaterial( "white_multiply" )
	else
		f1_arg0.material = RegisterMaterial( "distort_hud_bkgnd_ui_blur" )
	end
	local self = LUI.UIImage.new( f1_arg0 )
	if not Engine.IsCurrentGen() then
		self:setupTiles( 256 )
	end
	self.id = "blur"
	if f1_arg1.darker then
		self:addElement( LUI.UIImage.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			red = 0.15,
			green = 0.15,
			blue = 0.15,
			alpha = 0.15
		} ) )
	end
	return self
end

LUI.MenuBuilder.registerType( "perspectiveBlur", perspectiveBlur )
LockTable( _M )
