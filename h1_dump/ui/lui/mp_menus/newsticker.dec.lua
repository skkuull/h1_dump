local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.NewSticker = InheritFrom( LUI.UIImage )
LUI.NewSticker.Default = 1
LUI.NewSticker.WithText = 2
LUI.NewSticker.Update = function ( f1_arg0 )
	f1_arg0:processEvent( {
		name = "updateNew",
		show = false,
		dispatchChildren = true
	} )
end

LUI.NewSticker.new = function ( menu, controller )
	local self = LUI.UIImage.new()
	local f2_local1 = menu
	f2_local1.material = RegisterMaterial( CoD.Material.NewSticker )
	f2_local1.width = 12.85
	f2_local1.height = 10
	if f2_local1.alpha == nil then
		f2_local1.alpha = 1
	end
	if controller == LUI.NewSticker.WithText then
		local f2_local2 = 2
		if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
			f2_local2 = 0
		end
		local f2_local3 = Engine.Localize( "@LUA_MENU_NEW_CAPS" )
		local f2_local4 = CoD.CreateState( 0, f2_local2, 0, nil, CoD.AnchorTypes.TopLeftRight )
		f2_local4.font = Font13.Font
		f2_local4.height = Font13.Height
		f2_local4.alignment = LUI.Alignment.Center
		f2_local4.color = Colors.black
		self.text = LUI.UIText.new( f2_local4 )
		self.text.defaultState = f2_local4
		self.text.newString = f2_local3
		self.text:setText( f2_local3 )
		self:addElement( self.text )
		local f2_local5, f2_local6, f2_local7, f2_local8 = GetTextDimensions( f2_local3, Font13.Font, Font13.Height )
		f2_local1.default_width = f2_local1.width
		f2_local1.width = f2_local1.width + f2_local7 - f2_local5
		self.defaultState = f2_local1
		self:setup3SliceRatio( 4, 0.38 )
	end
	self:registerAnimationState( "default", f2_local1 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:registerEventHandler( "updateNew", function ( element, event )
		if event.show then
			element:animateToState( "default" )
		else
			element:animateToState( "hidden" )
		end
	end )
	self:animateToState( "default" )
	return self
end

LockTable( _M )
