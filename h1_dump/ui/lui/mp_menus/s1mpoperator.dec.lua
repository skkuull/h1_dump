local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function traverseChallengeTable( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = 0
	local f1_local2 = 0
	local f1_local3 = {}
	local f1_local4 = 0
	local f1_local5 = 0
	local f1_local6 = {}
	local f1_local7 = 0
	local f1_local8 = 0
	local f1_local9 = {}
	local f1_local10 = 0
	local f1_local11 = 0
	local f1_local12 = {}
	local f1_local13 = {
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		}
	}
	local f1_local14 = {
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		}
	}
	local f1_local15 = {
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		}
	}
	local f1_local16 = {
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		}
	}
	local f1_local17 = {
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		},
		{
			progress = -1,
			name = ""
		}
	}
	local f1_local18 = 1
	local f1_local19 = {
		AllChallengesTable.Cols.Target1,
		AllChallengesTable.Cols.Target2,
		AllChallengesTable.Cols.Target3,
		AllChallengesTable.Cols.Target4,
		AllChallengesTable.Cols.Target5,
		AllChallengesTable.Cols.Target6,
		AllChallengesTable.Cols.Target7,
		AllChallengesTable.Cols.Target8,
		AllChallengesTable.Cols.Target9
	}
	while Engine.TableLookupByRow( AllChallengesTable.File, f1_local18, AllChallengesTable.Cols.Ref ) ~= "" do
		local f1_local20 = Engine.TableLookupByRow( AllChallengesTable.File, f1_local18, AllChallengesTable.Cols.Category )
		if f1_local20 == "category_career" or f1_local20 == "category_attachment" or f1_local20 == "category_weapons" or f1_local20 == "category_dlc" then
			local f1_local21 = Engine.TableLookupByRow( AllChallengesTable.File, f1_local18, AllChallengesTable.Cols.Filter )
			local f1_local22 = Engine.TableLookupByRow( AllChallengesTable.File, f1_local18, AllChallengesTable.Cols.Ref )
			local f1_local23 = {
				Progress = GetChallengeProgress( f1_arg0, f1_local22 ),
				Target = GetChallengeTarget( f1_local22, math.min( GetChallengeTierCount( f1_local22 ), GetChallengeState( f1_arg0, f1_local22 ) ) )
			}
			local f1_local24 = nil
			for f1_local25 = 1, #f1_local19, 1 do
				local f1_local28 = Engine.TableLookupByRow( AllChallengesTable.File, f1_local18, f1_local19[f1_local25] )
				if f1_local28 ~= "" then
					if f1_local28 == nil then
						break
					end
					f1_local24 = f1_local28
				end
			end
			local f1_local25 = f1_local23.Progress / f1_local24
			if f1_local20 == "category_career" then
				f1_local2 = f1_local2 + 1
				f1_local1 = f1_local1 + f1_local25
				if f1_local3[f1_local21] == nil then
					f1_local3[f1_local21] = {
						progress = 0,
						count = 0,
						subName = f1_local21
					}
				end
				f1_local3[f1_local21].progress = f1_local3[f1_local21].progress + f1_local25
				f1_local3[f1_local21].count = f1_local3[f1_local21].count + 1
			elseif f1_local20 == "category_attachment" then
				f1_local5 = f1_local5 + 1
				f1_local4 = f1_local4 + f1_local25
				if f1_local6[f1_local21] == nil then
					f1_local6[f1_local21] = {
						progress = 0,
						count = 0,
						subName = f1_local21
					}
				end
				f1_local6[f1_local21].progress = f1_local6[f1_local21].progress + f1_local25
				f1_local6[f1_local21].count = f1_local6[f1_local21].count + 1
			elseif f1_local20 == "category_weapons" then
				f1_local8 = f1_local8 + 1
				f1_local7 = f1_local7 + f1_local25
				if f1_local9[f1_local21] == nil then
					f1_local9[f1_local21] = {
						progress = 0,
						count = 0,
						subName = f1_local21
					}
				end
				f1_local9[f1_local21].progress = f1_local9[f1_local21].progress + f1_local25
				f1_local9[f1_local21].count = f1_local9[f1_local21].count + 1
			elseif f1_local20 == "category_dlc" then
				f1_local11 = f1_local11 + 1
				f1_local10 = f1_local10 + f1_local25
				if f1_local12[f1_local21] == nil then
					f1_local12[f1_local21] = {
						progress = 0,
						count = 0,
						subName = f1_local21
					}
				end
				f1_local12[f1_local21].progress = f1_local12[f1_local21].progress + f1_local25
				f1_local12[f1_local21].count = f1_local12[f1_local21].count + 1
			end
			local f1_local26 = nil
			if f1_local20 == "category_attachment" then
				f1_local26 = f1_local13
			elseif f1_local20 == "category_career" then
				f1_local26 = f1_local14
			elseif f1_local20 == "category_weapons" then
				f1_local26 = f1_local15
			elseif f1_local20 == "category_dlc" then
				f1_local26 = f1_local16
			end
			local f1_local27 = f1_local23.Progress / f1_local23.Target
			if f1_local27 < 1 and 0 < f1_local27 then
				local f1_local29 = {
					progress = f1_local27,
					name = f1_local22
				}
				if f1_local26[1].progress < f1_local27 then
					f1_local26[3] = f1_local26[2]
					f1_local26[2] = f1_local26[1]
					f1_local26[1] = f1_local29
				elseif f1_local26[2].progress < f1_local27 then
					f1_local26[3] = f1_local26[2]
					f1_local26[2] = f1_local29
				elseif f1_local26[3].progress < f1_local27 then
					f1_local26[3] = f1_local29
				end
				local f1_local30 = {
					progress = f1_local27,
					name = f1_local22
				}
				if f1_local17[1].progress < f1_local27 then
					f1_local17[3] = f1_local17[2]
					f1_local17[2] = f1_local17[1]
					f1_local17[1] = f1_local30
				elseif f1_local17[2].progress < f1_local27 then
					f1_local17[3] = f1_local17[2]
					f1_local17[2] = f1_local30
				elseif f1_local17[3].progress < f1_local27 then
					f1_local17[3] = f1_local30
				end
			end
			if f1_local0[f1_local21] == nil then
				f1_local0[f1_local21] = {}
			end
			table.insert( f1_local0[f1_local21], f1_local22 )
		end
		f1_local18 = f1_local18 + 1
	end
	local f1_local20 = ChallengeCategoryNavTable.File
	local f1_local21 = {}
	local f1_local22 = {}
	local f1_local31 = {}
	local f1_local32 = {}
	local f1_local33 = 1
	local f1_local34 = 1
	local f1_local35 = 1
	local f1_local23 = 1
	local f1_local24 = 0
	while Engine.TableLookupByRow( f1_local20, f1_local24, ChallengeCategoryNavTable.Cols.Ref ) ~= "" do
		local f1_local25 = Engine.TableLookupByRow( ChallengeCategoryNavTable.File, f1_local24, ChallengeCategoryNavTable.Cols.Parent )
		local f1_local26 = Engine.TableLookupByRow( ChallengeCategoryNavTable.File, f1_local24, ChallengeCategoryNavTable.Cols.Filter )
		local f1_local27 = Engine.TableLookupByRow( ChallengeCategoryNavTable.File, f1_local24, ChallengeCategoryNavTable.Cols.Ref )
		if f1_local27 ~= nil and f1_local27 ~= "" then
			if category == Career and f1_local25 == "category_career" then
				f1_local22[f1_local34] = f1_local26
				f1_local34 = f1_local34 + 1
			elseif category == Classic and f1_local25 == "category_attachment" then
				f1_local21[f1_local33] = f1_local26
				f1_local33 = f1_local33 + 1
			elseif category == Weapon and f1_local25 == "category_weapons" then
				f1_local31[f1_local35] = f1_local26
				f1_local35 = f1_local35 + 1
			elseif category == Weapon and f1_local25 == "category_dlc" then
				f1_local32[f1_local23] = f1_local26
				f1_local23 = f1_local23 + 1
			end
		end
		f1_local24 = f1_local24 + 1
	end
	f1_local0.classicSubCategories = f1_local21
	f1_local0.careerSubCategories = f1_local22
	f1_local0.weaponSubCategories = f1_local31
	f1_local0.dlcSubCategories = f1_local32
	if f1_local2 == 0 then
		f1_local0.careerTotalProgress = 0
	else
		f1_local0.careerTotalProgress = f1_local1 / f1_local2
	end
	f1_local0.careerSubsProgress = f1_local3
	if f1_local5 == 0 then
		f1_local0.classicTotalProgress = 0
	else
		f1_local0.classicTotalProgress = f1_local4 / f1_local5
	end
	f1_local0.classicSubsProgress = f1_local6
	if f1_local8 == 0 then
		f1_local0.weaponsTotalProgress = 0
	else
		f1_local0.weaponsTotalProgress = f1_local7 / f1_local8
	end
	f1_local0.weaponSubsProgress = f1_local9
	if f1_local11 == 0 then
		f1_local0.dlcTotalProgress = 0
	else
		f1_local0.dlcTotalProgress = f1_local10 / f1_local11
	end
	f1_local0.dlcSubsProgress = f1_local12
	f1_local0.nearestCompletionClassic = f1_local13
	f1_local0.nearestCompletionCareer = f1_local14
	f1_local0.nearestCompletionWeapon = f1_local15
	f1_local0.nearestCompletionDLC = f1_local16
	f1_local0.nearestCompletionTotal = f1_local17
	return f1_local0
end

function OnClansAction( f2_arg0, f2_arg1 )
	if Engine.IsAnyUserUGCRestricted() or Engine.IsChatRestricted() then
		LUI.FlowManager.RequestAddMenu( f2_arg0, "user_generated_content_restriction_popup", true, f2_arg1.controller )
	else
		LUI.FlowManager.RequestAddMenu( f2_arg0, "ClansMenu", true, f2_arg1.controller )
	end
end

f0_local0 = function ( f3_arg0, f3_arg1 )
	f3_arg0:dispatchEventToRoot( {
		name = "set_button_info_text",
		text = "",
		immediate = true
	} )
	if f3_arg0.id == "medals" then
		f3_arg0.menu.medalsPreview:animateToState( "show" )
	elseif f3_arg0.id == "challenges" then
		f3_arg0.menu.challengesPreview:animateToState( "show" )
	elseif f3_arg0.id == "prestige" then
		f3_arg0.menu.prestigePreview:animateToState( "show" )
	end
end

f0_local1 = function ( f4_arg0, f4_arg1 )
	if f4_arg0.id == "medals" then
		f4_arg0.menu.medalsPreview:animateToState( "hide" )
	elseif f4_arg0.id == "challenges" then
		f4_arg0.menu.challengesPreview:animateToState( "hide" )
	elseif f4_arg0.id == "prestige" then
		f4_arg0.menu.prestigePreview:animateToState( "hide" )
	end
end

function OperatorMenu( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.MenuTemplate.new( f5_arg0, {
		menu_title = "@LUA_MENU_BARRACKS_CAPS"
	} )
	f5_local0:SetBreadCrumb( Engine.ToUpperCase( Engine.Localize( "@PLATFORM_PLAY_ONLINE" ) ) )
	local f5_local1 = traverseChallengeTable( f5_local0.exclusiveController )
	if Engine.GetOnlineGame() then
		local f5_local2 = {}
		local f5_local3 = 0
		local f5_local4 = f5_local0:AddButton( "@LUA_MENU_COMBAT_RECORD", "CombatRecordItemListDetails" )
		f5_local4.id = "combat_record"
		f5_local3 = f5_local3 + 1
		f5_local2[f5_local3] = f5_local4
		local f5_local5 = f5_local0:AddButton( "@LUA_MP_FRONTEND_MEDALS", "CombatRecordMedalsDetails" )
		f5_local5.id = "medals"
		f5_local3 = f5_local3 + 1
		f5_local2[f5_local3] = f5_local5
		if IsPublicMatch() then
			local f5_local6 = {
				showLockOnDisable = true
			}
			local f5_local7, f5_local8, f5_local9 = Engine.GetItemLockStateByItemRef( f5_arg1.exclusiveController, "feature_challenges" )
			local f5_local10 = f5_local7 == "Locked"
			if f5_local10 then
				f5_local6.desc_text = f5_local9
			end
			local f5_local11 = f5_local0:AddButton( "@LUA_MENU_CHALLENGES", function ( f6_arg0, f6_arg1 )
				LUI.FlowManager.RequestAddMenu( f6_arg0, "ChallengeCategoryMenu", true, f6_arg1.controller, false, {
					dataBlob = f5_local1
				} )
			end, f5_local10, nil, nil, f5_local6 )
			f5_local11.id = "challenges"
			f5_local3 = f5_local3 + 1
			f5_local2[f5_local3] = f5_local11
		end
		if Engine.GetDvarInt( "dw_leaderboard_show" ) == 1 then
			local f5_local6 = f5_local0:AddButton( "@LUA_MENU_LEADERBOARD", "OpLeaderboardMain" )
			f5_local6.id = "leaderboards"
			f5_local3 = f5_local3 + 1
			f5_local2[f5_local3] = f5_local6
		end
		local f5_local6 = f5_arg1.exclusiveController
		if not f5_local6 then
			f5_local6 = Engine.GetFirstActiveController()
		end
		local f5_local7 = CombatRecord.GetRankInfo( f5_local6 )
		if not IsPrivateMatch() then
			local f5_local8 = f5_local0:AddButton( "@MPUI_PRESTIGE", "PrestigeMenu" )
			f5_local8.id = "prestige"
			f5_local3 = f5_local3 + 1
			f5_local2[f5_local3] = f5_local8
		end
		f5_local0:AddMenuDescription( 3 )
		local f5_local8 = 200
		local f5_local9 = 90
		local f5_local10 = LUI.CombatRecordPreviewWidget.new( f5_local6 )
		f5_local0.combatRecordPreview = f5_local10
		f5_local0:addElement( f5_local10 )
		for f5_local11 = 1, f5_local3, 1 do
			f5_local2[f5_local11]:registerEventHandler( "button_over", f0_local0 )
			f5_local2[f5_local11]:registerEventHandler( "button_up", f0_local1 )
			f5_local2[f5_local11].menu = f5_local0
		end
	end
	local f5_local2 = LUI.CombatRecordPreviewWidget.new( f5_local0.exclusiveController )
	f5_local0.combatRecordPreview = f5_local2
	f5_local0:addElement( f5_local2 )
	local f5_local3 = LUI.MedalsPreviewWidget.new( f5_local0.exclusiveController )
	f5_local0.medalsPreview = f5_local3
	f5_local0:addElement( f5_local3 )
	local f5_local4 = LUI.ChallengesPreviewWidget.new( f5_local0.exclusiveController, f5_local1 )
	f5_local0.challengesPreview = f5_local4
	f5_local0:addElement( f5_local4 )
	local f5_local5 = LUI.PrestigePreviewWidget.new( f5_local0.exclusiveController )
	f5_local0.prestigePreview = f5_local5
	f5_local0:addElement( f5_local5 )
	f5_local0:AddBackButton()
	f5_local0:AddCurrencyInfoPanel()
	return f5_local0
end

LUI.MenuBuilder.registerType( "OperatorMenu", OperatorMenu )
VLobby.InitMenuMode( "OperatorMenu", VirtualLobbyModes.LUI_MODE_OBSCURED )
LockTable( _M )
