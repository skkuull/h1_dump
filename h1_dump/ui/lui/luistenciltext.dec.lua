LUI.UIStencilText = InheritFrom( LUI.UIElement )
LUI.UIStencilText.build = function ( menu, controller )
	local self = LUI.UIStencilText.new( nil, controller )
	if controller.text then
		LUI.UIStencilText.setText( self, controller.text )
	end
	return self
end

LUI.UIStencilText.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self:setClass( LUI.UIStencilText )
	self:setUseStencil( true )
	local f2_local1 = true
	local f2_local2 = 0
	if controller and controller.fakeNoWrap then
		f2_local1 = false
		f2_local2 = 1200
	end
	local f2_local3 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = f2_local1,
		top = 0,
		bottom = 0,
		left = 0,
		right = f2_local2
	}
	local self
	if menu then
		self = menu.font
		if not self then
		
		else
			f2_local3.font = self
			self
			if menu then
				self = menu.alignment
				if not self then
				
				else
					f2_local3.alignment = self
					self
					if menu then
						self = menu.color
						if not self then
						
						else
							f2_local3.color = self
							self = LUI.UIText.new( f2_local3 )
							self.text = self
							self:addElement( self )
							return self
						end
					end
					self = nil
				end
			end
			self = nil
		end
	end
	self = CoD.TextSettings.BodyFont.Font
end

LUI.UIStencilText.setText = function ( f3_arg0, f3_arg1 )
	f3_arg0.text:setText( f3_arg1 )
end

LUI.UIStencilText.setTextStyle = function ( f4_arg0, f4_arg1 )
	f4_arg0.text:setTextStyle( f4_arg1 )
end

LUI.UIStencilText.id = "LUIStencilText"
LUI.MenuBuilder.registerType( "UIStencilText", LUI.UIStencilText.build )
