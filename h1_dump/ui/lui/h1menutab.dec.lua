local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( "Registering " .. _NAME )
LUI.H1MenuTab = InheritFrom( LUI.UIElement )
LUI.H1MenuTab.Colors = {
	ButtonHighlight = Colors.h1.light_grey,
	ButtonSelected = Colors.h1.light_grey,
	ButtonAvailable = Colors.h1.medium_grey,
	ButtonDisabled = Colors.h1.dark_grey,
	ButtonDisabledHighlight = Colors.h1.medium_grey
}
LUI.H1MenuTab.Materials = {
	ButtonAvailable = RegisterMaterial( "h1_tabs_states_normal" ),
	ButtonDisabled = RegisterMaterial( "h1_tabs_states_disable" ),
	ButtonDisabledHighlight = RegisterMaterial( "h1_tabs_states_disable_hover" ),
	ButtonGlow = RegisterMaterial( "h1_tabs_states_selected" ),
	Background = RegisterMaterial( "h1_tabs_bg" )
}
LUI.H1MenuTab.Alphas = {
	Normal = 0.8,
	Hover = 1,
	Selected = 1,
	Disabled = 1,
	GlowMin = 0.6,
	GlowMax = 1
}
LUI.H1MenuTab.Time = {
	Expansion = 1500,
	Contraction = 1500
}
LUI.H1MenuTab.left = GenericMenuDims.menu_left
LUI.H1MenuTab.right = GenericMenuDims.menu_right_standard
LUI.H1MenuTab.width = LUI.H1MenuTab.right - LUI.H1MenuTab.left
LUI.H1MenuTab.shoulderButtonWidth = 100
LUI.H1MenuTab.shoulderButtonTextWidth = 50
LUI.H1MenuTab.arrowHOffset = 60
LUI.H1MenuTab.arrowHOffsetTextButton = 36
LUI.H1MenuTab.arrowBoxSize = 12
LUI.H1MenuTab.tabTextHeight = 12
LUI.H1MenuTab.tabBackgroundTopOffset = 7.5
LUI.H1MenuTab.tabBackgroundHeight = LUI.H1MenuTab.tabTextHeight * 2.4
LUI.H1MenuTab.tabTextTopOffset = -LUI.H1MenuTab.tabTextHeight - (LUI.H1MenuTab.tabBackgroundHeight - LUI.H1MenuTab.tabTextHeight) / 2
LUI.H1MenuTab.tabTextFont = CoD.TextSettings.BodyFont.Font
LUI.H1MenuTab.tabChangeBarsTop = 30
LUI.H1MenuTab.tabChangeHeight = 12
LUI.H1MenuTab.tabChangeTopOffsetClickable = 5
LUI.H1MenuTab.tabChangeHeightClickable = LUI.H1MenuTab.tabBackgroundHeight + 3
LUI.H1MenuTab.tabChangeHoldingElementHeight = LUI.H1MenuTab.tabChangeBarsTop + LUI.H1MenuTab.tabChangeHeightClickable
LUI.H1MenuTab.tabChangeSpacing = 0
LUI.H1MenuTab.tabChangeButtonHScale = 1.14
LUI.H1MenuTab.glowXScale = 1.02
LUI.H1MenuTab.glowYScale = 1.4
function WrapTabIndex( f1_arg0, f1_arg1, f1_arg2 )
	assert( math.abs( f1_arg1 ) < f1_arg2.tabCount )
	local f1_local0 = f1_arg0 + f1_arg1
	while f1_local0 ~= f1_arg0 do
		if f1_arg2.tabCount < f1_local0 then
			f1_local0 = f1_local0 - f1_arg2.tabCount
		end
		if f1_local0 < 1 then
			f1_local0 = f1_local0 + f1_arg2.tabCount
		end
		if f1_arg2.isTabLockedfunc and f1_arg2.isTabLockedfunc( f1_local0 ) then
			f1_local0 = f1_local0 + f1_arg1
		end
		return f1_local0
	end
	return f1_local0
end

f0_local0 = "false"
f0_local1 = false
function AddTabSelectButton( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0, f2_local1, f2_local2, f2_local3, f2_local4, f2_local5, f2_local6, f2_local7 = nil
	local f2_local8 = Engine.IsConsoleGame()
	if not f2_local8 then
		f2_local8 = Engine.IsGamepadEnabled()
	end
	local f2_local9
	if f2_local8 then
		f2_local9 = f2_arg3.arrowHOffset
		if not f2_local9 then
		
		else
			if f2_arg1 == "left" then
				f2_local4 = f2_arg3.shoulderButtonWidth
				f2_local7 = f2_local9 - f2_arg3.arrowBoxSize / 2
				if Engine.IsVita( f2_arg3.exclusiveController ) then
					f2_local1 = ButtonMap.button_left_trigger
				else
					f2_local1 = ButtonMap.button_shoulderl
				end
				f2_local3 = 0
				f2_local7 = f2_local7 + f2_arg3.arrowBoxSize
				f2_local5 = CoD.CreateState( f2_local7, f2_arg3.arrowBoxSize / 2, nil, nil, CoD.AnchorTypes.TopLeft )
				f2_local6 = -1
			elseif f2_arg1 == "right" then
				f2_local0 = f2_arg3.width - f2_arg3.shoulderButtonWidth
				f2_local4 = f2_arg3.shoulderButtonWidth
				f2_local7 = -f2_local9 - f2_arg3.arrowBoxSize / 2
				if Engine.IsVita( f2_arg3.exclusiveController ) then
					f2_local1 = ButtonMap.button_right_trigger
				else
					f2_local1 = ButtonMap.button_shoulderr
				end
				if f2_local8 then
					f2_local3 = f2_arg3.shoulderButtonWidth - f2_arg3.shoulderButtonTextWidth
				else
					f2_local3 = 0
				end
				f2_local5 = CoD.CreateState( f2_local7, f2_arg3.arrowBoxSize / 2, nil, nil, CoD.AnchorTypes.TopRight )
				f2_local6 = 1
			else
				assert( false, "AddTabSelectButton(side) : side should be "right" or "left"." )
				return {}
			end
			f2_local5.material = RegisterMaterial( "h1_deco_option_scrollbar_arrows" )
			local f2_local10 = f2_arg3.arrowBoxSize
			local self
			if f2_arg1 == "left" then
				self = -1
				if not self then
				
				else
					f2_local5.width = f2_local10 * self
					f2_local5.height = f2_arg3.arrowBoxSize
					f2_local5.alpha = 0.5
					f2_local5.red = 1
					f2_local5.green = 1
					f2_local5.blue = 1
					if not f2_arg2 then
						f2_local5.alpha = 0.25
					end
					if f2_local8 then
						f2_local2 = f2_local1.string
					else
						f2_local2 = f2_local1.keyboard_string
					end
					f2_local10 = CoD.CreateState( f2_local0, nil, nil, nil, CoD.AnchorTypes.TopLeft )
					f2_local10.width = f2_local4
					f2_local10.height = CoD.TextSettings.TitleFontSmall.Height
					self = LUI.UIButton.new( f2_local10 )
					self.id = "button_change_tab_id_" .. f2_arg1
					self.requireFocusType = FocusType.MouseOver
					self:registerEventHandler( "button_action", function ( element, event )
						local f3_local0 = TryChangeIndex( f2_arg0, f2_arg3, f2_local6, true )
						f3_local0( element, event )
						f0_local0 = f2_arg1
					end )
					local f2_local12 = 0.9
					local self = LUI.UIImage.new( f2_local5 )
					self.id = "tab_select_arrow_id_" .. f2_arg1
					local self = self
					local f2_local15 = self.registerAnimationState
					local f2_local16 = "buttonOver"
					local f2_local17 = {
						topAnchor = true
					}
					local f2_local18
					if f2_arg1 == "left" then
						f2_local18 = true
					else
						f2_local18 = false
					end
					f2_local17.leftAnchor = f2_local18
					f2_local18
					if f2_arg1 == "right" then
						f2_local18 = true
					else
						f2_local18 = false
					end
					f2_local17.rightAnchor = f2_local18
					f2_local17.red = 1
					f2_local17.green = 1
					f2_local17.blue = 1
					f2_local17.alpha = 1
					f2_local17.left = f2_local7
					f2_local17.top = f2_arg3.arrowBoxSize / 2
					f2_local17.width = f2_local5.width
					f2_local17.height = f2_local5.height
					f2_local15( self, f2_local16, f2_local17 )
					self = self
					f2_local15 = self.registerAnimationState
					f2_local16 = "pulse"
					f2_local17 = {
						topAnchor = true
					}
					f2_local18
					if f2_arg1 == "left" then
						f2_local18 = true
					else
						f2_local18 = false
					end
					f2_local17.leftAnchor = f2_local18
					f2_local18
					if f2_arg1 == "right" then
						f2_local18 = true
					else
						f2_local18 = false
					end
					f2_local17.rightAnchor = f2_local18
					f2_local17.red = 0.27
					f2_local17.green = 0.65
					f2_local17.blue = 0.33
					f2_local17.alpha = 1
					f2_local17.left = f2_local7
					f2_local17.top = f2_arg3.arrowBoxSize / 2
					f2_local17.width = f2_local5.width * f2_local12
					f2_local17.height = f2_local5.height * f2_local12
					f2_local15( self, f2_local16, f2_local17 )
					self:registerEventHandler( "button_over", MBh.AnimateToState( "buttonOver" ) )
					self:registerEventHandler( "button_up", MBh.AnimateToState( "default" ) )
					self:addElement( self )
					if f0_local0 == f2_arg1 then
						self:animateInSequence( {
							{
								"buttonOver",
								0
							},
							{
								"pulse",
								100
							},
							{
								f0_local1 and "buttonOver" or "default",
								200
							}
						} )
					end
					f2_local15 = CoD.CreateState( f2_local3, nil, nil, nil, CoD.AnchorTypes.TopLeft )
					if f2_local8 then
						self = -7
						if not self then
						
						else
							f2_local15.top = self
							f2_local15.width = f2_arg3.shoulderButtonTextWidth
							if f2_local8 then
								self = CoD.TextSettings.TitleFontMediumLarge.Height
								if not self then
								
								else
									f2_local15.height = self
									f2_local15.alignment = LUI.Alignment.Center
									if f2_local8 then
										self = CoD.TextSettings.TitleFontMediumLarge.Font
										if not self then
										
										else
											f2_local15.font = self
											if not f2_arg2 then
												f2_local15.alpha = 0.5
											end
											self = nil
											if f2_local8 then
												self = LUI.UIText.new( f2_local15 )
												self:setText( Engine.ToUpperCase( Engine.Localize( f2_local2 ) ) )
											else
												self = LUI.UIButtonText.new( f2_local15, Engine.ToUpperCase( Engine.Localize( f2_local2 ) ), f2_arg1 == "right", f2_arg2 )
											end
											self.id = "button_change_act_text_id_" .. f2_arg1
											self.requireFocusType = FocusType.MouseOver
											if f0_local0 == f2_arg1 and not f2_local8 then
												self:processEvent( {
													name = "pulse",
													mouse = f0_local1
												} )
											end
											self:addElement( self )
											return self
										end
									end
									self = CoD.TextSettings.TitleFontMediumLarge.Font
								end
							end
							self = LUI.UIButtonText.height
						end
					end
					self = 2
				end
			end
			self = 1
		end
	end
	f2_local9 = f2_arg3.arrowHOffsetTextButton
end

function CreateBarElement( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = LUI.H1MenuTab.Colors.ButtonAvailable
	local f4_local1 = LUI.H1MenuTab.Alphas.Normal
	local f4_local2 = LUI.H1MenuTab.Materials.ButtonAvailable
	local f4_local3 = f4_arg4.activeIndex == f4_arg1
	local f4_local4 = false
	if f4_arg4.isTabLockedfunc then
		f4_local4 = f4_arg4.isTabLockedfunc( f4_arg1 )
	end
	if f4_local3 then
		f4_local0 = LUI.H1MenuTab.Colors.ButtonSelected
		f4_local1 = LUI.H1MenuTab.Alphas.Selected
	elseif f4_local4 then
		f4_local0 = LUI.H1MenuTab.Colors.ButtonDisabled
		f4_local1 = LUI.H1MenuTab.Alphas.Disabled
		f4_local2 = LUI.H1MenuTab.Materials.ButtonDisabled
	end
	local f4_local5 = f4_arg4.tabChangeTopOffsetClickable
	local f4_local6 = nill
	f4_local5 = REG23 and f4_arg4.tabChangeTopOffsetClickable or LUI.H1MenuTab.tabChangeTopOffsetClickable
	f4_local6 = CoD.CreateState( f4_arg2, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local6.width = f4_arg3
	f4_local6.top = f4_local5
	local self = f4_arg4.tabChangeHeightClickable
	if not self then
		self = LUI.H1MenuTab.tabChangeHeightClickable
	end
	f4_local6.height = self
	self = LUI.UIButton.new( f4_local6 )
	if f4_local4 then
		self.disabled = true
	end
	self:registerEventHandler( "button_action", TryChangeIndex( f4_arg0, f4_arg4, f4_arg1 - f4_arg4.activeIndex ) )
	self.id = "tab_change_tab_button_id_" .. f4_arg1
	self.requireFocusType = FocusType.MouseOver
	local f4_local8 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	f4_local8.top = -f4_local5
	f4_local8.width = f4_local6.width * LUI.H1MenuTab.tabChangeButtonHScale
	f4_local8.left = (f4_local6.width - f4_local8.width) / 2
	f4_local8.height = f4_arg4.tabChangeHeight
	f4_local8.color = f4_local0
	f4_local8.material = f4_local2
	f4_local8.alpha = f4_local1
	local self = LUI.UIImage.new( f4_local8 )
	if f4_local4 then
		self.disabled = true
		self:registerAnimationState( "buttonOverDisable", {
			material = LUI.H1MenuTab.Materials.ButtonDisabledHighlight,
			alpha = LUI.H1MenuTab.Alphas.Hover
		} )
		self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "buttonOverDisable", 200 ) )
		self:registerEventHandler( "button_disable", MBh.AnimateToState( "default", 200 ) )
	else
		self:registerAnimationState( "buttonOver", {
			material = LUI.H1MenuTab.Materials.ButtonAvailable,
			alpha = LUI.H1MenuTab.Alphas.Hover
		} )
		self:registerEventHandler( "button_over", MBh.AnimateToState( "buttonOver", 200 ) )
		self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 200 ) )
	end
	self.id = "tab_change_tab_button_image_id_" .. f4_arg1
	self.requireFocusType = FocusType.MouseOver
	self:makeNotFocusable()
	if f4_local3 then
		f4_local8.material = LUI.H1MenuTab.Materials.ButtonGlow
		f4_local8.alpha = LUI.H1MenuTab.Alphas.GlowMax
		local self = LUI.UIImage.new( f4_local8 )
		f4_local8.top = f4_local8.top + (f4_local8.height - f4_local8.height * LUI.H1MenuTab.glowYScale) / 2
		f4_local8.left = f4_local8.left + (f4_local8.width - f4_local8.width * LUI.H1MenuTab.glowXScale) / 2
		f4_local8.width = f4_local8.width * LUI.H1MenuTab.glowXScale
		f4_local8.height = f4_local8.height * LUI.H1MenuTab.glowYScale
		f4_local8.alpha = LUI.H1MenuTab.Alphas.GlowMin
		self:registerAnimationState( "expanded", f4_local8 )
		self:registerEventHandler( "menu_create", function ( element )
			element:animateInLoop( {
				{
					"expanded",
					LUI.H1MenuTab.Time.Expansion,
					true,
					true
				},
				{
					"default",
					LUI.H1MenuTab.Time.Contraction,
					true,
					true
				}
			} )
		end )
		self:addElement( self )
	end
	self:addElement( self )
	if f4_arg4.underTabTextFunc then
		local self = CoD.CreateState( nil, LUI.H1MenuTab.tabTextTopOffset, nil, nil, CoD.AnchorTypes.BottomLeft )
		self.height = LUI.H1MenuTab.tabTextHeight
		self.width = f4_arg3 + 3
		self.font = LUI.H1MenuTab.tabTextFont
		self.color = f4_local0
		self.alignment = LUI.Alignment.Center
		local self = LUI.UIText.new( self )
		self:setText( Engine.ToUpperCase( Engine.Localize( f4_arg4.underTabTextFunc( f4_arg1 ) ) ) )
		if f4_local4 then
			self:registerAnimationState( "buttonOver", {
				color = LUI.H1MenuTab.Colors.ButtonDisabledHighlight
			} )
			self:registerEventHandler( "button_over_disable", MBh.AnimateToState( "buttonOver", 200 ) )
			self:registerEventHandler( "button_disable", MBh.AnimateToState( "default", 200 ) )
		else
			self:registerAnimationState( "buttonOver", {
				color = LUI.H1MenuTab.Colors.ButtonHighlight
			} )
			self:registerEventHandler( "button_over", MBh.AnimateToState( "buttonOver", 200 ) )
			self:registerEventHandler( "button_up", MBh.AnimateToState( "default", 200 ) )
		end
		self:addElement( self )
	end
	return self
end

function CreateTabSelectBarElements( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.tabCount
	local f6_local1 = f6_arg1.tabChangeSpacing and f6_arg1.tabChangeSpacing or LUI.H1MenuTab.tabChangeSpacing
	local f6_local2 = (f6_arg1.width - (f6_local0 - 1) * f6_local1) / f6_local0
	local f6_local3 = CoD.CreateState( nil, f6_arg1.tabChangeBarsTop and f6_arg1.tabChangeBarsTop or LUI.H1MenuTab.tabChangeBarsTop, f6_arg1.width, nil, CoD.AnchorTypes.TopLeft )
	f6_local3.height = f6_arg1.tabChangeHeight
	local self = LUI.UIElement.new( f6_local3 )
	self.id = "tab_change_tab_id"
	self:makeNotFocusable()
	local f6_local5 = CoD.CreateState( 0, LUI.H1MenuTab.tabBackgroundTopOffset, 0, nil, CoD.AnchorTypes.TopLeftRight )
	f6_local5.material = LUI.H1MenuTab.Materials.Background
	f6_local5.height = LUI.H1MenuTab.tabBackgroundHeight
	self:addElement( LUI.UIImage.new( f6_local5 ) )
	for f6_local6 = 1, f6_local0, 1 do
		self:addElement( CreateBarElement( f6_arg0, f6_local6, (f6_local6 - 1) * (f6_local1 + f6_local2), f6_local2, f6_arg1 ) )
	end
	return self
end

function ConstructMenuTab( f7_arg0, f7_arg1 )
	local f7_local0 = AddTabSelectButton( f7_arg0, "left", not f7_arg1.previousDisabled, f7_arg1 )
	f7_arg0:addElement( f7_local0 )
	if f7_arg1.previousDisabled then
		f7_local0.disabled = true
	end
	local f7_local1 = AddTabSelectButton( f7_arg0, "right", not f7_arg1.nextDisabled, f7_arg1 )
	f0_local0 = "false"
	f0_local1 = false
	f7_arg0:addElement( f7_local1 )
	if f7_arg1.nextDisabled then
		f7_local1.disabled = true
	end
	f7_arg0:addElement( CreateTabSelectBarElements( f7_arg0, f7_arg1 ) )
	if f7_arg1.title then
		local f7_local2 = nil
		if type( f7_arg1.title ) == "function" then
			f7_local2 = Engine.ToUpperCase( Engine.Localize( f7_arg1.title( f7_arg1.activeIndex ) ) )
		else
			f7_local2 = Engine.ToUpperCase( Engine.Localize( f7_arg1.title ) )
		end
		local self = CoD.CreateState( nil, 2, nil, nil, CoD.AnchorTypes.TopLeft )
		self.width = f7_arg1.width
		self.height = CoD.TextSettings.BodyFont24.Height
		self.alignment = LUI.Alignment.Center
		self.font = CoD.TextSettings.BodyFont24.Font
		self.color = Colors.h1.second_medium_grey
		local self = LUI.UIText.new( self )
		self:setText( f7_local2 )
		self.id = "tab_select_title_text_id"
		f7_arg0:addElement( self )
	end
	local f7_local2 = Engine.IsConsoleGame()
	if not f7_local2 then
		f7_local2 = Engine.IsGamepadEnabled()
	end
	if not f7_arg1.previousDisabled then
		local self = LUI.UIBindButton.new()
		self.id = "tab_select_previous_act"
		self:registerEventHandler( "button_shoulderl", TryChangeIndex( f7_arg0, f7_arg1, -1, true ) )
		if not f7_local2 and f7_arg1.enableRightLeftNavigation then
			self:registerEventHandler( "button_left", TryChangeIndex( f7_arg0, f7_arg1, -1, true ) )
		end
		f7_arg0:addElement( self )
	end
	if not f7_arg1.nextDisabled then
		local self = LUI.UIBindButton.new()
		self.id = "tab_select_next_act"
		self:registerEventHandler( "button_shoulderr", TryChangeIndex( f7_arg0, f7_arg1, 1, true ) )
		if not f7_local2 and f7_arg1.enableRightLeftNavigation then
			self:registerEventHandler( "button_right", TryChangeIndex( f7_arg0, f7_arg1, 1, true ) )
		end
		f7_arg0:addElement( self )
	end
end

function TryChangeIndex( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	return function ( f9_arg0, f9_arg1 )
		if f8_arg1.tabChangeLockedFunc and not f8_arg1.tabChangeLockedFunc( f9_arg0 ) then
			return 
		end
		local f9_local0 = WrapTabIndex( f8_arg1.activeIndex, f8_arg2, f8_arg1 )
		if f8_arg3 then
			f0_local0 = f8_arg2 and "left" or "right"
		else
			f0_local0 = false
		end
		f0_local1 = f9_arg1.mouse
		if not f8_arg1.skipChangeTab then
			f8_arg0:ChangeIndex( f9_local0 )
		end
		f8_arg1.clickTabBtnAction( f9_arg0, f9_arg1, f9_local0 )
	end
	
end

LUI.H1MenuTab.ChangeIndex = function ( f10_arg0, f10_arg1 )
	assert( f10_arg0.props )
	assert( f10_arg1 > 0 )
	assert( f10_arg1 <= f10_arg0.props.tabCount )
	f10_arg0:closeChildren()
	f10_arg0.props.activeIndex = f10_arg1
	ConstructMenuTab( f10_arg0, f10_arg0.props )
end

LUI.H1MenuTab.Refresh = function ( f11_arg0 )
	assert( f11_arg0.props )
	assert( f11_arg0.props.activeIndex > 0 )
	assert( f11_arg0.props.activeIndex <= f11_arg0.props.tabCount )
	f11_arg0:closeChildren()
	ConstructMenuTab( f11_arg0, f11_arg0.props )
end

LUI.H1MenuTab.new = function ( f12_arg0 )
	assert( f12_arg0 )
	assert( f12_arg0.tabCount )
	assert( f12_arg0.clickTabBtnAction, "Require function clickTabBtnAction(self, event, index) to know what action doing tab!" )
	assert( f12_arg0.exclusiveController )
	if not f12_arg0 then
		f12_arg0 = {}
	end
	local f12_local0 = LUI.DeepCopy( f12_arg0 )
	f12_local0.width = f12_local0.width and f12_local0.width or LUI.H1MenuTab.width
	f12_local0.shoulderButtonWidth = f12_local0.shoulderButtonWidth and f12_local0.shoulderButtonWidth or LUI.H1MenuTab.shoulderButtonWidth
	f12_local0.shoulderButtonTextWidth = f12_local0.shoulderButtonTextWidth and f12_local0.shoulderButtonTextWidth or LUI.H1MenuTab.shoulderButtonTextWidth
	f12_local0.arrowHOffset = f12_local0.arrowHOffset and f12_local0.arrowHOffset or LUI.H1MenuTab.arrowHOffset
	f12_local0.arrowHOffsetTextButton = f12_local0.arrowHOffsetTextButton and f12_local0.arrowHOffsetTextButton or LUI.H1MenuTab.arrowHOffsetTextButton
	f12_local0.arrowBoxSize = f12_local0.arrowBoxSize and f12_local0.arrowBoxSize or LUI.H1MenuTab.arrowBoxSize
	f12_local0.tabChangeHeight = f12_local0.tabChangeHeight and f12_local0.tabChangeHeight or LUI.H1MenuTab.tabChangeHeight
	f12_local0.activeIndex = f12_local0.activeIndex and f12_local0.activeIndex or 1
	local f12_local1 = CoD.CreateState( nil, f12_local0.top, nil, nil, CoD.AnchorTypes.TopLeft )
	f12_local1.height = f12_local0.tabChangeHoldingElementHeight and f12_local0.tabChangeHoldingElementHeight or LUI.H1MenuTab.tabChangeHoldingElementHeight
	f12_local1.width = f12_local0.width
	local self = LUI.UIElement.new( f12_local1 )
	self:setClass( LUI.H1MenuTab )
	self.id = f12_arg0.id
	self.props = f12_local0
	ConstructMenuTab( self, f12_local0 )
	return self
end

LUI.H1MenuTab.build = function ( f13_arg0, f13_arg1, f13_arg2 )
	return LUI.H1MenuTab.new( f13_arg1 )
end

LUI.MenuBuilder.registerType( "h1_menu_tab", LUI.H1MenuTab.build )
LockTable( _M )
