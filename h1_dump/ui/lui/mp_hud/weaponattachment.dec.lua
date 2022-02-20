local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function deriveUVType()
	local f1_local0 = 0
	local f1_local1 = Game.GetPlayerWeaponName()
	if string.find( f1_local1, "eotech" ) ~= nil then
		f1_local0 = 1
	elseif string.find( f1_local1, "l115a3scope" ) ~= nil or string.find( f1_local1, "l115a3vzscope" ) ~= nil or string.find( f1_local1, "usrscope" ) ~= nil or string.find( f1_local1, "usrvzscope" ) ~= nil then
		f1_local0 = 2
	end
	return f1_local0
end

function weaponChange_updateWeaponUVType( f2_arg0, f2_arg1 )
	local f2_local0 = deriveUVType()
	if f2_local0 ~= f2_arg0.WEAPON_UV_TYPE then
		if f2_arg0.WEAPON_UV_TYPE == 0 then
			
		elseif f2_arg0.WEAPON_UV_TYPE == 1 then
			weaponAttachUpdate_eotechReset( f2_arg0 )
		elseif f2_arg0.WEAPON_UV_TYPE == 2 then
			
		else
			
		end
		if f2_local0 == 0 then
			Game.EnableViewModelUVAnimTimeOverride( false )
		else
			Game.EnableViewModelUVAnimTimeOverride( true )
			Game.SetViewModelUVAnimTimeOverride( 0 )
		end
		f2_arg0.WEAPON_UV_TYPE = f2_local0
	end
end

function timer_updateWeaponAttachment( f3_arg0, f3_arg1 )
	if f3_arg0.WEAPON_UV_TYPE == -1 then
		weaponChange_updateWeaponUVType( f3_arg0, f3_arg1 )
	end
	if isEMPed() then
		if f3_arg0.WEAPON_UV_TYPE == 1 then
			weaponAttachUpdate_eotechEMP()
		elseif f3_arg0.WEAPON_UV_TYPE == 2 then
			weaponAttachUpdate_scopeKillsEMP()
		end
	elseif f3_arg0.WEAPON_UV_TYPE == 1 then
		weaponAttachUpdate_eotech( f3_arg0, f3_arg1 )
	elseif f3_arg0.WEAPON_UV_TYPE == 2 then
		weaponAttachUpdate_scopeKills( f3_arg0, f3_arg1 )
	end
end

function isEMPed()
	return Game.GetOmnvar( "ui_hud_emp_artifact" ) or Game.GetOmnvar( "ui_hud_static" ) > 0
end

f0_local0 = 24
f0_local1 = 31.25
function weaponAttachUpdate_eotech( f5_arg0, f5_arg1 )
	local f5_local0 = Game.GetWeaponDamageStats()
	local f5_local1 = Game.GetCrosshairTraceDistance()
	if f5_local1 == 0 then
		f5_local1 = f5_local0.minDamageRange
	end
	local f5_local2 = 0
	local f5_local3 = f5_local0.minDamageRange - f5_local0.maxDamageRange
	if f5_local3 ~= 0 then
		f5_local2 = 1 - LUI.clamp( (f5_local1 - f5_local0.maxDamageRange) / f5_local3, 0, 1 )
	end
	if f5_arg0.EOTECH_BAR_DISPLAY_PREV == nil then
		f5_arg0.EOTECH_BAR_DISPLAY_PREV = 0
	end
	local f5_local4 = (f5_local2 - f5_arg0.EOTECH_BAR_DISPLAY_PREV) * 0.25 + f5_arg0.EOTECH_BAR_DISPLAY_PREV
	Game.SetViewModelUVAnimTimeOverride( LUI.clamp( math.floor( f5_local4 * f0_local0 ) * f0_local1, f0_local1, f0_local1 * (f0_local0 - 1) ) )
	f5_arg0.EOTECH_BAR_DISPLAY_PREV = f5_local4
end

function weaponAttachUpdate_eotechReset( f6_arg0 )
	f6_arg0.EOTECH_BAR_DISPLAY_PREV = 0
end

function weaponAttachUpdate_eotechNewClient( f7_arg0 )
	weaponAttachUpdate_eotechReset( f7_arg0, event )
end

function weaponAttachUpdate_eotechEMP()
	Game.SetViewModelUVAnimTimeOverride( (f0_local0 + 1) * f0_local1 )
end

f0_local2 = 0
local f0_local3 = 1
local f0_local4 = 2
local f0_local5 = 3
local f0_local6 = 4
local f0_local7 = 5
local f0_local8 = 6
local f0_local9 = 7
local f0_local10 = 125
function omnvarScope_updateSniperScopeState( f9_arg0, f9_arg1 )
	f9_arg0.SCOPE_DISPLAY_STATE_NEW = f9_arg1.value
end

function weaponAttachUpdate_scopeKills( f10_arg0, f10_arg1 )
	if f10_arg0.SCOPE_DISPLAY_STATE == -1 then
		initScopeDisplayState( f10_arg0, 0, f0_local2, f0_local3, -1, 10 )
	end
	if f10_arg0.SCOPE_DISPLAY_STATE_NEW ~= -1 then
		initScopeDisplayStateByNum( f10_arg0, f10_arg0.SCOPE_DISPLAY_STATE_NEW )
		f10_arg0.SCOPE_DISPLAY_STATE_NEW = -1
	end
	if f10_arg0.SCOPE_STATE_FLASH_COUNT == -1 or f10_arg0.SCOPE_STATE_FLASH_COUNT > 0 then
		f10_arg0.SCOPE_STATE_UPDATES = f10_arg0.SCOPE_STATE_UPDATES + 1
		if f10_arg0.SCOPE_STATE_FLASH_PER <= f10_arg0.SCOPE_STATE_UPDATES then
			local f10_local0 = f10_arg0.SCOPE_STATE_FRAME_CURRENT
			local f10_local1 = f10_arg0.SCOPE_STATE_FRAME_A
			f10_arg0.SCOPE_STATE_FRAME_CURRENT = REG9 and f10_arg0.SCOPE_STATE_FRAME_B or f10_arg0.SCOPE_STATE_FRAME_A
			if f10_arg0.SCOPE_STATE_FLASH_COUNT ~= -1 then
				f10_arg0.SCOPE_STATE_FLASH_COUNT = f10_arg0.SCOPE_STATE_FLASH_COUNT - 1
			end
			f10_arg0.SCOPE_STATE_UPDATES = 0
		end
	elseif f10_arg0.SCOPE_STATE_FRAME_CURRENT ~= f10_arg0.SCOPE_STATE_FRAME_A then
		f10_arg0.SCOPE_STATE_FRAME_CURRENT = f10_arg0.SCOPE_STATE_FRAME_A
	end
	Game.SetViewModelUVAnimTimeOverride( f0_local10 * f10_arg0.SCOPE_STATE_FRAME_CURRENT )
end

function weaponAttachUpdate_scopeNewClient( f11_arg0 )
	forceScopeDisplayStateByNum( f11_arg0, Game.GetOmnvar( "weap_sniper_display_state" ) )
end

function forceScopeDisplayStateByNum( f12_arg0, f12_arg1 )
	initScopeDisplayStateByNum( f12_arg0, f12_arg1 )
	if f12_arg0.SCOPE_STATE_FLASH_COUNT ~= -1 then
		f12_arg0.SCOPE_STATE_FLASH_COUNT = 0
	end
end

function initScopeDisplayStateByNum( f13_arg0, f13_arg1 )
	if f13_arg1 == 0 then
		initScopeDisplayState( f13_arg0, f13_arg1, f0_local2, f0_local3, -1, 10 )
	elseif f13_arg1 == 1 then
		initScopeDisplayState( f13_arg0, f13_arg1, f0_local4, f0_local3, 10, 5 )
	elseif f13_arg1 == 2 then
		initScopeDisplayState( f13_arg0, f13_arg1, f0_local5, f0_local3, 10, 5 )
	elseif f13_arg1 == 3 then
		initScopeDisplayState( f13_arg0, f13_arg1, f0_local6, f0_local3, 10, 5 )
	elseif f13_arg1 == 4 then
		initScopeDisplayState( f13_arg0, f13_arg1, f0_local8, f0_local3, 10, 5 )
	end
end

function initScopeDisplayState( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5 )
	f14_arg0.SCOPE_DISPLAY_STATE = f14_arg1
	f14_arg0.SCOPE_STATE_FRAME_A = f14_arg2
	f14_arg0.SCOPE_STATE_FRAME_B = f14_arg3
	f14_arg0.SCOPE_STATE_FLASH_COUNT = f14_arg4
	f14_arg0.SCOPE_STATE_FLASH_PER = f14_arg5
	f14_arg0.SCOPE_STATE_FRAME_CURRENT = f14_arg2
	f14_arg0.SCOPE_STATE_UPDATES = 0
	Game.SetViewModelUVAnimTimeOverride( f0_local10 * f14_arg0.SCOPE_STATE_FRAME_CURRENT )
end

function weaponAttachUpdate_scopeKillsEMP()
	Game.SetViewModelUVAnimTimeOverride( f0_local9 * f0_local10 )
end

function weaponAttachmentProcessing_init( f16_arg0 )
	f16_arg0.WEAPON_UV_TYPE = -1
	f16_arg0.EOTECH_BAR_DISPLAY_PREV = nil
	f16_arg0.SCOPE_DISPLAY_STATE = -1
	f16_arg0.SCOPE_STATE_FRAME_A = f0_local2
	f16_arg0.SCOPE_STATE_FRAME_B = f0_local3
	f16_arg0.SCOPE_STATE_FRAME_CURRENT = f16_arg0.SCOPE_STATE_FRAME_A
	f16_arg0.SCOPE_STATE_FLASH_COUNT = -1
	f16_arg0.SCOPE_STATE_FLASH_PER = 10
	f16_arg0.SCOPE_STATE_UPDATES = 0
	f16_arg0.SCOPE_DISPLAY_STATE_NEW = -1
end

function clientChanged_updateAttachmentState( f17_arg0, f17_arg1 )
	weaponAttachmentProcessing_init( f17_arg0 )
	weaponAttachUpdate_eotechNewClient( f17_arg0 )
	weaponAttachUpdate_scopeNewClient( f17_arg0 )
	weaponChange_updateWeaponUVType( f17_arg0, f17_arg1 )
end

function weaponAttachmentProcessing()
	local self = LUI.UIElement.new()
	self.id = "weapAttachment"
	self:registerEventHandler( "update_weapon_attachment", timer_updateWeaponAttachment )
	self:addElement( LUI.UITimer.new( 50, "update_weapon_attachment" ) )
	self:registerEventHandler( "weapon_change", weaponChange_updateWeaponUVType )
	self:registerOmnvarHandler( "weap_sniper_display_state", omnvarScope_updateSniperScopeState )
	self:registerEventHandler( "playerstate_client_changed", clientChanged_updateAttachmentState )
	weaponAttachmentProcessing_init( self )
	return self
end

local f0_local11 = function ()
	if Game.InKillCam() then
		if Game.IsKillCamEntityActive() then
			return false
		end
	elseif Game.IsSpectatorCameraActive() then
		return false
	end
	return true
end

function blurTargetChanged( f20_arg0, f20_arg1 )
	if f0_local11() then
		Game.StartBlur( Game.GetOmnvar( "blur_target" ), Game.GetOmnvar( "blur_duration_ms" ) )
	else
		Game.StartBlur( 0, 0 )
	end
end

function blurClientChanged( f21_arg0, f21_arg1 )
	if f0_local11() then
		Game.StartBlur( Game.GetOmnvar( "blur_target" ), 0 )
	else
		Game.StartBlur( 0, 0 )
	end
end

function blurProcessing()
	local self = LUI.UIElement.new()
	self.id = "blurUpdater"
	self:registerOmnvarHandler( "blur_target", blurTargetChanged )
	self:registerEventHandler( "playerstate_client_changed", blurClientChanged )
	self:registerEventHandler( "camera_client_changed", blurClientChanged )
	return self
end

LUI.MenuBuilder.registerType( "weaponAttachmentProcessing", weaponAttachmentProcessing )
LUI.MenuBuilder.registerType( "blurProcessing", blurProcessing )
LockTable( _M )
