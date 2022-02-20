LUI.ChallengesPreviewWidget = InheritFrom( LUI.UIElement )
LUI.ChallengesPreviewWidget.NearestChallengesLeft = 0
LUI.ChallengesPreviewWidget.RecentChallengesLeft = 450
LUI.ChallengesPreviewWidget.Classic = "category_attachment"
LUI.ChallengesPreviewWidget.Career = "category_career"
LUI.ChallengesPreviewWidget.Weapon = "category_weapons"
function buildChallengesRow( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		left = f1_arg1
	} )
	local self = LUI.UIText.new( {
		leftAnchor = true,
		topAnchor = true,
		height = 15,
		color = Colors.white,
		font = CoD.TextSettings.BodyFont.Font
	} )
	self:setText( f1_arg0 )
	self:addElement( self )
	self:addElement( LUI.UIImage.new( {
		topAnchor = true,
		top = 20,
		height = 2,
		width = 25,
		leftAnchor = true,
		material = RegisterMaterial( "white" ),
		color = Colors.mw1_green
	} ) )
	local self = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		topAnchor = true,
		width = 200,
		spacing = 10,
		top = OperatorMenuUtil.HeaderOffset
	} )
	if f1_arg2 == "nearest" then
		local f1_local3 = f1_arg4.nearestCompletionTotal
		for f1_local4 = 1, #f1_local3, 1 do
			local f1_local7 = GetChallengeData( f1_arg3, f1_local3[f1_local4].name )
			local f1_local8 = LUI.ChallengeCard.new( f1_arg3, f1_local7, false, f1_local7.Progress == 0 )
			if f1_local7.Progress > 0 then
				f1_arg5.addedTracker = f1_arg5.addedTracker + 1
			end
			f1_local8.id = "nearest_" .. f1_local4
			self:addElement( f1_local8 )
		end
	elseif f1_arg2 == "recent" then
		local f1_local3 = {}
		local f1_local4 = 0
		local f1_local5 = Engine.GetPlayerData( f1_arg3, CoD.StatsGroup.Common, "round", "challengeNumCompleted" )
		if f1_local5 > 19 then
			f1_local5 = 19
		end
		for f1_local6 = 0, f1_local5, 1 do
			local f1_local8 = Engine.GetPlayerData( f1_arg3, CoD.StatsGroup.Common, "round", "challengesCompleted", f1_local6 )
			if f1_local8 ~= 0 then
				local f1_local11 = GetChallengeData( f1_arg3, Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.ChallengeID, f1_local8, AllChallengesTable.Cols.Ref ) )
				f1_local3[f1_local4 + 1] = f1_local8
				f1_local4 = f1_local4 + 1
			end
		end
		local f1_local6 = ""
		local f1_local9 = ""
		local f1_local10 = ""
		if f1_local4 >= 3 then
			f1_local6 = f1_local3[f1_local4]
			f1_local9 = f1_local3[f1_local4 - 1]
			f1_local10 = f1_local3[f1_local4 - 2]
		elseif f1_local4 == 2 then
			f1_local6 = f1_local3[f1_local4]
			f1_local9 = f1_local3[f1_local4 - 1]
		elseif f1_local4 == 1 then
			f1_local6 = f1_local3[f1_local4]
		end
		local f1_local7 = {
			f1_local6,
			f1_local9,
			f1_local10
		}
		local f1_local8, f1_local12 = nil
		for f1_local11 = 1, #f1_local7, 1 do
			if f1_local7[f1_local11] == "" then
				f1_local8 = LUI.ChallengeCard.new( f1_arg3, nil, false, true )
			else
				f1_local8 = LUI.ChallengeCard.new( f1_arg3, GetChallengeData( f1_arg3, Engine.TableLookup( AllChallengesTable.File, AllChallengesTable.Cols.ChallengeID, f1_local7[f1_local11], AllChallengesTable.Cols.Ref ) ), false, false, true )
				f1_arg5.addedTracker = f1_arg5.addedTracker + 1
			end
			f1_local8.id = "recent" .. f1_local11
			self:addElement( f1_local8 )
		end
		if f1_local4 == 0 then
			self:registerAnimationState( "hide", {
				alpha = 0
			} )
			self:animateToState( "hide" )
		else
			self:addElement( self )
			return self
		end
	end
	self:addElement( self )
	return self
end

LUI.ChallengesPreviewWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		left = OperatorMenuUtil.LowerPreviewLeft,
		top = OperatorMenuUtil.LowerPreviewTop,
		width = OperatorMenuUtil.PreviewElementWidth,
		height = OperatorMenuUtil.PreviewElementHeight
	} )
	self:setClass( LUI.ChallengesPreviewWidget )
	self.addedTracker = 0
	self:addElement( buildChallengesRow( Engine.Localize( "@CHALLENGE_NEAREST_COMPLETION" ), LUI.ChallengesPreviewWidget.NearestChallengesLeft, "nearest", menu, controller, self ) )
	self:addElement( buildChallengesRow( Engine.Localize( "@CHALLENGE_RECENTLY_COMPLETED" ), LUI.ChallengesPreviewWidget.RecentChallengesLeft, "recent", menu, controller, self ) )
	if self.addedTracker == 0 then
		local self = LUI.UIText.new( {
			leftAnchor = true,
			left = 230,
			font = CoD.TextSettings.BodyFont.Font,
			height = 14,
			color = Colors.h1.light_grey,
			alpha = 0.5
		} )
		self:setText( Engine.Localize( "@LUA_MENU_NO_CHALLENGES_PROGRESS" ) )
		self:addElement( self )
	end
	self:registerAnimationState( "show", {
		alpha = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0
	} )
	self:animateToState( "hide" )
	return self
end

