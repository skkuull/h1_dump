local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
useBarStrings = {
	"MP_CAPTURING_CRATE",
	"MP_JOINING_COOP_SS"
}
function useBarInternal()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 180,
		height = 0,
		left = 0,
		right = 0
	} )
	self.id = "useBarInternal"
	local f1_local1 = function ( f2_arg0, f2_arg1 )
		local f2_local0 = ""
		if useBarStrings[f2_arg1] then
			f2_local0 = Engine.Localize( useBarStrings[f2_arg1] )
		end
		f2_arg0:setText( f2_local0 )
	end
	
	local f1_local2 = CoD.TextSettings.BodyFont
	local self = LUI.UIText.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = 0,
		right = 0,
		height = f1_local2.Height,
		alignment = LUI.Alignment.Center,
		font = f1_local2.Font
	} )
	self.id = "titleText"
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerOmnvarHandler( "ui_use_bar_text", function ( f3_arg0, f3_arg1 )
		f1_local1( f3_arg0, f3_arg1.value )
	end )
	f1_local1( self, Game.GetOmnvar( "ui_use_bar_text" ) )
	self:addElement( self )
	local f1_local4 = LUI.MenuBuilder.BuildRegisteredType( "progressBar" )
	f1_local4:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		top = f1_local2.Height + 5,
		right = 0,
		height = 0
	} )
	f1_local4:animateToState( "default" )
	self:addElement( f1_local4 )
	self:registerEventHandler( "update_end_time", function ( element, event )
		local f4_local0 = Game.GetOmnvar( "ui_use_bar_end_time" )
		if f4_local0 > 0 then
			local f4_local1 = Game.GetOmnvar( "ui_use_bar_start_time" )
			local f4_local2 = Game.GetTime()
			f1_local4:completeIn( f4_local0 - f4_local2, (f4_local2 - f4_local1) / (f4_local0 - f4_local1) )
		end
	end )
	self:registerEventHandler( "fold", function ( element, event )
		f1_local4:fold()
	end )
	self:registerEventHandler( "folded", function ( element, event )
		self:dispatchEventToParent( {
			name = "instance_folded"
		} )
	end )
	return self
end

function useBar()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "useBar"
	local f7_local1 = function ()
		if self.useBar then
			self.useBar:close()
			self.useBar = nil
		end
	end
	
	local f7_local2 = function ( f9_arg0, f9_arg1 )
		local f9_local0 = Game.GetOmnvar( "ui_use_bar_end_time" )
		if f9_local0 > 0 then
			if not self.useBar then
				self.useBar = useBarInternal()
				self:addElement( self.useBar )
			end
			self.useBar.endTime = f9_local0
			self.useBar:processEvent( {
				name = "update_end_time",
				value = f9_local0
			} )
		elseif self.useBar then
			if self.useBar.endTime <= (f9_arg1.timeModified or 0) then
				self.useBar:processEvent( {
					name = "fold"
				} )
			else
				f7_local1()
			end
		end
	end
	
	self:registerEventHandler( "instance_folded", f7_local1 )
	self:registerOmnvarHandler( "ui_use_bar_end_time", f7_local2 )
	f7_local2( self, {} )
	return self
end

LUI.MenuBuilder.registerType( "useBar", useBar )
LockTable( _M )
