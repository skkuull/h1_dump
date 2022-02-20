local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.AARGrid = InheritFrom( LUI.UIElement )
f0_local0 = 6
f0_local1 = 15
f0_local2 = (CoD.DesignGridHelper( 28, 0.95 ) - f0_local1 * (f0_local0 - 1)) / f0_local0
local f0_local3 = 2
local f0_local4 = -4 + f0_local2
local f0_local5 = 150
LUI.AARGrid.UnlockedCardWidth = f0_local2 - 8
LUI.AARGrid.UnlockedCardHeight = LUI.AARGrid.UnlockedCardWidth
function OnAnimatePage( f1_arg0, f1_arg1 )
	f1_arg0:registerAnimationState( "page_move", {
		topAnchor = true,
		bottomAnchor = false,
		top = f1_arg0.pagingData.OrigListTop + -f1_arg0.pagingData.Stride * (f1_arg0.currPage - 1)
	} )
	f1_arg0:animateToState( "page_move", f0_local5, false, false )
end

function OnRowButtonGamepadButtonHandler( f2_arg0, f2_arg1 )
	if f2_arg0.inputEnabled then
		if f2_arg1.button == "up" and f2_arg1.down == true then
			if f2_arg0.currPage > 1 then
				f2_arg0.currPage = f2_arg0.currPage - 1
			else
				f2_arg0.currPage = f2_arg0.gridRows - 1
			end
			OnAnimatePage( f2_arg0, f2_arg1 )
		elseif f2_arg1.button == "down" and f2_arg1.down == true then
			if f2_arg0.currPage < f2_arg0.gridRows - 1 then
				f2_arg0.currPage = f2_arg0.currPage + 1
			else
				f2_arg0.currPage = 1
			end
			OnAnimatePage( f2_arg0, f2_arg1 )
		end
	end
end

function OnUpdateFooterText( f3_arg0, f3_arg1 )
	f3_arg0:setText( f3_arg0.parent.gridListContainer.gridList.currPage .. " / " .. f3_arg0.parent.gridRows - 1 )
end

function AddItemCard( f4_arg0, f4_arg1 )
	local f4_local0 = 0.2
	local f4_local1 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local1.width = f0_local2
	f4_local1.height = f0_local2
	local self = LUI.UIElement.new( f4_local1 )
	local f4_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f4_local3.material = RegisterMaterial( "white" )
	local self
	if f4_arg1 then
		self = Colors.grey_125
		if not self then
		
		else
			f4_local3.color = self
			self
			if f4_arg1 then
				self = 0.35
				if not self then
				
				else
					f4_local3.alpha = self
					self = LUI.UIImage.new( f4_local3 )
					self:addElement( self )
					local f4_local5 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
					f4_local5.borderThickness = 1
					f4_local5.material = RegisterMaterial( "white" )
					local f4_local6
					if f4_arg1 then
						f4_local6 = Colors.h1.medium_grey
						if not f4_local6 then
						
						else
							f4_local5.color = f4_local6
							self:addElement( LUI.UIBorder.new( f4_local5 ) )
							if f4_arg1 then
								self:addElement( f4_arg1 )
							else
								local f4_local7 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
								f4_local7.width = LUI.AARGrid.UnlockedCardWidth
								f4_local7.height = LUI.AARGrid.UnlockedCardWidth
								f4_local7.alpha = f4_local0
								f4_local7.material = RegisterMaterial( "h1_aar_item_empty" )
								self:addElement( LUI.UIImage.new( f4_local7 ) )
							end
							f4_arg0:addElement( self )
						end
					end
					f4_local6 = Colors.h1.dark_grey
				end
			end
			self = f4_local0
		end
	end
	self = Colors.black
end

function AddFooter( f5_arg0 )
	local f5_local0 = CoD.TextSettings.Font23
	local f5_local1 = 32
	local f5_local2 = 32
	local f5_local3 = f5_local1
	local f5_local4, f5_local5, f5_local6, f5_local7 = GetTextDimensions( f5_arg0.gridRows - 1 .. " / " .. f5_arg0.gridRows - 1, f5_local0.Font, f5_local0.Height )
	local f5_local8 = f5_local6 - f5_local4
	local f5_local9 = CoD.CreateState( nil, f5_local0.Height, nil, nil, CoD.AnchorTypes.Bottom )
	f5_local9.height = f5_local0.Height
	f5_local9.width = f5_local8 + (f5_local1 + f5_local3) * 2.1
	local self = LUI.UIElement.new( f5_local9 )
	local f5_local11 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Left )
	f5_local11.height = f5_local2
	f5_local11.width = f5_local1
	f5_local11.material = RegisterMaterial( "s1_icon_up" )
	self:addElement( LUI.UIImage.new( f5_local11 ) )
	local f5_local12 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f5_local12.font = CoD.TextSettings.TitleFontSmall.Font
	f5_local12.height = 14
	f5_local12.width = f5_local8
	local self = LUI.UIText.new( f5_local12 )
	self:setText( Engine.Localize( "@MPUI_X_SLASH_Y_WIDE", f5_arg0.gridListContainer.gridList.currPage, f5_arg0.gridRows - 1 ) )
	self.parent = f5_arg0
	self:registerEventHandler( "gamepad_button", OnUpdateFooterText )
	self:addElement( self )
	local f5_local14 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.Right )
	f5_local14.height = f5_local2
	f5_local14.width = f5_local1
	f5_local14.material = RegisterMaterial( "s1_icon_down" )
	self:addElement( LUI.UIImage.new( f5_local14 ) )
	f5_arg0:addElement( self )
end

function AddItemGrid( f6_arg0, f6_arg1 )
	local f6_local0 = CoD.CreateState( nil, f0_local1, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f6_local0.height = f0_local2 * f6_arg0.gridRows + f0_local1 * (f6_arg0.gridRows - 1)
	local self = LUI.UIElement.new( f6_local0 )
	f6_arg0:addElement( self )
	local self = LUI.UIGrid.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ), {
		elementsPerRow = f0_local0,
		hSpacing = f0_local1,
		vSpacing = f0_local1,
		rowHeight = f0_local2,
		hAlign = LUI.Alignment.Left,
		vAlign = LUI.Alignment.Center
	} )
	self.id = "AARGrid"
	for f6_local3 = 1, f6_arg0.gridRows * f0_local0, 1 do
		AddItemCard( self, f6_arg1[f6_local3] )
	end
	self:registerEventHandler( "gamepad_button", OnRowButtonGamepadButtonHandler )
	self.inputEnabled = false
	self.currPage = 1
	self.gridRows = f6_arg0.gridRows
	f6_arg0.gridList = self
	self:addElement( self )
	local f6_local3 = f0_local0 * f0_local2
	local f6_local4 = {
		containerWidth = f6_local3,
		containerHeight = 32
	}
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		left = f6_local3 / 2 - 25,
		top = 13,
		height = f6_local4.containerHeight
	} )
	f6_arg0:addElement( self )
	ListPaging.InitGrid( self, f6_arg0.gridRows, nil, false, self, f6_local4 )
	self:processEvent( {
		name = "gain_focus"
	} )
end

LUI.AARGrid.SetInputEnabled = function ( f7_arg0, f7_arg1 )
	f7_arg0.gridListContainer.gridList.inputEnabled = f7_arg1
end

LUI.AARGrid.GenericUnlockCard = function ()
	local f8_local0 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f8_local0.width = LUI.AARGrid.UnlockedCardWidth
	f8_local0.height = LUI.AARGrid.UnlockedCardWidth
	local self = LUI.UIElement.new( f8_local0 )
	self.width = f8_local0.width
	self.height = f8_local0.height
	local f8_local2 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f8_local2.material = RegisterMaterial( "white" )
	f8_local2.color = {
		r = 0.12,
		g = 0.12,
		b = 0.12
	}
	self:addElement( LUI.UIImage.new( f8_local2 ) )
	local f8_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f8_local3.material = RegisterMaterial( "h1_aar_item_gradient" )
	self:addElement( LUI.UIImage.new( f8_local3 ) )
	local f8_local4 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All )
	f8_local4.material = RegisterMaterial( "h1_ui_dot_pattern" )
	f8_local4.alpha = 0.7
	local self = LUI.UIImage.new( f8_local4 )
	self:setupTiles( 6 )
	self:addElement( self )
	self:addElement( LUI.DecoFrame.new( nil, LUI.DecoFrame.Grey ) )
	return self
end

LUI.AARGrid.new = function ( f9_arg0, f9_arg1 )
	local f9_local0 = math.ceil( #f9_arg1.unlockedCards / f0_local0 )
	local f9_local1 = CoD.CreateState( nil, f0_local4 - f0_local1 + 3, nil, nil, CoD.AnchorTypes.TopLeftRight )
	f9_local1.height = f0_local2 * f0_local3 + f0_local1 * (f0_local3 - 1) + 1 + f0_local1
	local self = LUI.UIElement.new( f9_local1 )
	self:setClass( LUI.AARGrid )
	local self = LUI.UIElement.new( CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.All ) )
	local f9_local4
	if f9_local0 < f0_local3 then
		f9_local4 = f0_local3
		if not f9_local4 then
		
		else
			self.gridRows = f9_local4
			self.gridRows = self.gridRows
			self:setUseStencil( true )
			AddItemGrid( self, f9_arg1.unlockedCards )
			self.gridListContainer = self
			self:addElement( self )
			AddFooter( self )
			return self
		end
	end
	f9_local4 = f9_local0
end

LUI.MenuBuilder.registerType( "AARGrid", LUI.AARGrid.new )
LockTable( _M )
