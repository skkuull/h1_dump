LUI.FactionIcon = InheritFrom( LUI.UIElement )
LUI.FactionIcon.BackgroundScale = 1.7
LUI.FactionIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self:setClass( LUI.FactionIcon )
	self.size = menu.width or 100
	local self = LUI.UIImage.new()
	self.bgImage = self
	local self = LUI.UIImage.new( {
		width = 150,
		height = 150,
		alpha = 0.3,
		color = Colors.white,
		material = RegisterMaterial( "h1_deco_scanlines_overlay" )
	} )
	local f1_local3 = self.size * LUI.FactionIcon.BackgroundScale / 4
	local f1_local4 = LUI.Divider.new
	local f1_local5 = {
		width = self.size,
		topAnchor = true
	}
	local self = f1_local3 - 10
	local f1_local7
	if controller then
		f1_local7 = controller.topDivOffset
		if not f1_local7 then
		
		else
			f1_local5.top = self + f1_local7
			f1_local4 = f1_local4( f1_local5, 5, LUI.Divider.Grey )
			f1_local5 = LUI.Divider.new
			self = {
				width = self.size,
				topAnchor = true
			}
			f1_local7 = f1_local3 * 2
			local f1_local8
			if controller then
				f1_local8 = controller.botDivOffset
				if not f1_local8 then
				
				else
					self.top = f1_local7 + f1_local8
					f1_local5 = f1_local5( self, 5, LUI.Divider.Grey )
					self = LUI.UIImage.new()
					self.factionImage = self
					self:addElement( self )
					if not controller or not controller.disableScanlines then
						self:addElement( self )
					end
					if not controller or not controller.disableDividers then
						self:addElement( f1_local4 )
						self:addElement( f1_local5 )
					end
					self:addElement( self )
					return self
				end
			end
			f1_local8 = 0
		end
	end
	f1_local7 = 0
end

LUI.FactionIcon.Update = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0, f2_local1, f2_local2, f2_local3, f2_local4 = nil
	local f2_local5 = f2_arg1 .. "_soft"
	local f2_local6 = RegisterMaterial( f2_local5 )
	local f2_local7, f2_local8 = GetMaterialDimensions( f2_local6 )
	f2_local3 = f2_arg0.size * LUI.FactionIcon.BackgroundScale * f2_local7 / f2_local8
	f2_local4 = f2_arg0.size * LUI.FactionIcon.BackgroundScale
	f2_local7 = f2_arg0.bgImage
	f2_local8 = f2_local7
	f2_local7 = f2_local7.registerAnimationState
	local f2_local9 = "updateIcon"
	local f2_local10 = {
		material = f2_local6,
		width = f2_local3,
		height = f2_local4
	}
	local f2_local11
	if f2_arg2 then
		f2_local11 = 0
		if not f2_local11 then
		
		else
			f2_local10.alpha = f2_local11
			f2_local7( f2_local8, f2_local9, f2_local10 )
			f2_arg0.bgImage:animateToState( "updateIcon" )
			f2_local7 = RegisterMaterial
			if f2_arg2 then
				local f2_local12 = f2_local5
			end
			f2_local7 = f2_local7( f2_local12 or f2_arg1 )
			f2_local8, f2_local9 = GetMaterialDimensions( f2_local7 )
			f2_arg0.factionImage:registerAnimationState( "updateIcon", {
				material = f2_local7,
				width = f2_arg0.size * f2_local8 / f2_local9,
				height = f2_arg0.size
			} )
			f2_arg0.factionImage:animateToState( "updateIcon" )
		end
	end
	f2_local11 = 0.2
end

LUI.MenuBuilder.registerType( "FactionIcon", LUI.FactionIcon.new )
