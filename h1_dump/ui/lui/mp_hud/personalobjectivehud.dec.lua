local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function shouldAddPersonalObjectiveHud()
	local f1_local0 = GameX.GetGameMode()
	if f1_local0 == "sd" or f1_local0 == "ctf" or f1_local0 == "dd" or f1_local0 == "sab" then
		return true
	else
		
	end
end

function personalObjectiveHud()
	local self = LUI.UIImage.new()
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	local f2_local1 = GameX.GetGameMode()
	if f2_local1 == "ctf" then
		self.width = 50
		self.offset = 0
		self:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			height = 50,
			bottom = -45,
			left = 245 + self.offset,
			width = self.width,
			alpha = 0
		} )
		self:registerAnimationState( "CTF_Carried", {
			material = RegisterMaterial( "h1_hud_ctf_flag_possession" )
		} )
	elseif f2_local1 == "sd" or f2_local1 == "dd" or f2_local1 == "sab" then
		self.width = 50
		self.offset = 30
		self:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			height = 50,
			bottom = -37,
			left = 245 + self.offset,
			width = self.width,
			alpha = 0
		} )
		self:registerAnimationState( "BOMB_carried", {
			material = RegisterMaterial( "hud_suitcase_bomb" )
		} )
	end
	self.id = "personalObjectiveHud"
	self:animateToState( "default" )
	local f2_local2 = function ()
		local f3_local0 = nil
		local f3_local1 = Game.GetPlayerstateClientnum()
		if MLG.IsMLGSpectator() and Game.GetPlayerTeam( f3_local1 ) == Teams.axis then
			f3_local0 = Game.GetOmnvar( "ui_ctf_friendly_carrier_clientnum" )
		else
			f3_local0 = Game.GetOmnvar( "ui_ctf_enemy_carrier_clientnum" )
		end
		if f3_local1 ~= f3_local0 then
			self:animateToState( "hidden" )
		else
			self:animateToState( "visible" )
			self:animateToState( "CTF_Carried" )
		end
	end
	
	local f2_local3 = function ()
		if Game.GetOmnvar( "ui_carrying_bomb" ) and (not MLG.IsMLGSpectator() or MLG.IsFollowing()) then
			self:animateToState( "visible" )
			self:animateToState( "BOMB_carried" )
		else
			self:animateToState( "hidden" )
		end
	end
	
	local f2_local4 = function ()
		if MLG.IsMLGSpectator() then
			local f5_local0 = Game.GetPlayerScoreInfo( Game.GetPlayerstateClientnum() )
			local f5_local1, f5_local2, f5_local3, f5_local4 = GetTextDimensions( f5_local0.name, CoD.TextSettings.TitleFontSmallBold.Font, CoD.TextSettings.TitleFontSmallBold.Height )
			self:registerAnimationState( "move", {
				leftAnchor = true,
				rightAnchor = false,
				left = f5_local3 + 140 + self.offset,
				width = self.width
			} )
			self:animateToState( "move" )
		end
		local f5_local5 = GameX.GetGameMode()
		if f5_local5 == "ctf" then
			f2_local2()
		elseif f5_local5 == "sd" or f5_local5 == "dd" or f5_local5 == "sab" then
			f2_local3()
		else
			self:animateToState( "hidden" )
		end
	end
	
	self:registerOmnvarHandler( "ui_ctf_status_changed", f2_local2 )
	self:registerOmnvarHandler( "ui_carrying_bomb", f2_local3 )
	self:registerEventHandler( "playerstate_client_changed", f2_local4 )
	return self
end

LUI.MenuBuilder.registerType( "personalObjectiveHud", personalObjectiveHud )
LockTable( _M )
