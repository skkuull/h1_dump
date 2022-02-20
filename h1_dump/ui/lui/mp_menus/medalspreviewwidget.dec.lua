LUI.MedalsPreviewWidget = InheritFrom( LUI.UIElement )
LUI.MedalsPreviewWidget.TopMedalsLeft = 0
LUI.MedalsPreviewWidget.RecentMedalsLeft = 437
LUI.MedalsPreviewWidget.CardWidth = 105
LUI.MedalsPreviewWidget.CardHeight = 150
function buildMedalsRow( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
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
		spacing = 15,
		top = OperatorMenuUtil.HeaderOffset + 10
	} )
	local f1_local3 = 0
	local f1_local4 = 0
	if f1_arg2 == "recent" then
		for f1_local5 = 0, 2, 1 do
			local f1_local8 = Engine.GetPlayerData( f1_arg3, CoD.StatsGroup.Common, "recentAwards", f1_local5 )
			local f1_local9 = {
				medalTitle = Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f1_local8, CombatRecord.AwardsTable.Cols.Title ),
				medalMaterial = Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f1_local8, CombatRecord.AwardsTable.Cols.Icon ),
				medalName = f1_local8
			}
			local f1_local10 = f1_local8 == "none"
			if not f1_local10 then
				f1_local3 = f1_local3 + 1
				f1_arg4.totalMedals = f1_arg4.totalMedals + 1
			end
			local f1_local11 = LUI.MedalCard.new( f1_arg3, f1_local9, false, f1_local10 )
			f1_local11.id = f1_arg2 .. "_" .. f1_local5
			self:addElement( f1_local11 )
		end
		if f1_local3 == 0 then
			self:registerAnimationState( "hidden", {
				alpha = 0
			} )
			self:animateToState( "hidden" )
		else
			self:addElement( self )
			return self, f1_local3, f1_local4
		end
	elseif f1_arg2 == "top" then
		local f1_local5 = 0
		local f1_local6 = {
			{
				score = 0,
				name = ""
			},
			{
				score = 0,
				name = ""
			},
			{
				score = 0,
				name = ""
			}
		}
		while Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f1_local5, CombatRecord.AwardsTable.Cols.ReferenceName ) ~= "" do
			if Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f1_local5, CombatRecord.AwardsTable.Cols.IsMedal ) == "1" then
				local f1_local12 = Engine.TableLookupByRow( CombatRecord.AwardsTable.File, f1_local5, CombatRecord.AwardsTable.Cols.ReferenceName )
				local f1_local8 = Engine.GetPlayerData( f1_arg3, CoD.StatsGroup.Common, "awards", f1_local12 )
				local f1_local13 = {
					score = f1_local8,
					name = f1_local12
				}
				if f1_local6[1].score < f1_local8 then
					f1_local6[3] = f1_local6[2]
					f1_local6[2] = f1_local6[1]
					f1_local6[1] = f1_local13
				elseif f1_local6[2].score < f1_local8 then
					f1_local6[3] = f1_local6[2]
					f1_local6[2] = f1_local13
				elseif f1_local6[3].score < f1_local8 then
					f1_local6[3] = f1_local13
				end
			end
			f1_local5 = f1_local5 + 1
		end
		for f1_local7 = 1, #f1_local6, 1 do
			local f1_local14 = f1_local6[f1_local7]
			local f1_local11 = {
				medalTitle = Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f1_local14.name, CombatRecord.AwardsTable.Cols.Title ),
				medalMaterial = Engine.TableLookup( CombatRecord.AwardsTable.File, CombatRecord.AwardsTable.Cols.ReferenceName, f1_local14.name, CombatRecord.AwardsTable.Cols.Icon ),
				medalName = f1_local14.name
			}
			local f1_local15 = f1_local14.name == ""
			local f1_local16 = LUI.MedalCard.new( f1_arg3, f1_local11, false, f1_local15 )
			if not f1_local15 then
				f1_local4 = f1_local4 + 1
				f1_arg4.totalMedals = f1_arg4.totalMedals + 1
			end
			f1_local16.id = f1_arg2 .. "_" .. f1_local7
			self:addElement( f1_local16 )
		end
		if f1_local4 == 0 then
			self:registerAnimationState( "hidden", {
				alpha = 0
			} )
			self:animateToState( "hidden" )
		else
			self:addElement( self )
			return self, f1_local3, f1_local4
		end
	end
	self:addElement( self )
	return self, f1_local3, f1_local4
end

LUI.MedalsPreviewWidget.new = function ( f2_arg0 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		left = OperatorMenuUtil.LowerPreviewLeft,
		top = OperatorMenuUtil.LowerPreviewTop,
		width = OperatorMenuUtil.PreviewElementWidth,
		height = OperatorMenuUtil.PreviewElementHeight
	} )
	self:setClass( LUI.MedalsPreviewWidget )
	self.totalMedals = 0
	self:addElement( buildMedalsRow( Engine.Localize( "@LUA_MENU_RECENT_MEDALS" ), LUI.MedalsPreviewWidget.RecentMedalsLeft, "recent", f2_arg0, self ) )
	self:addElement( buildMedalsRow( Engine.Localize( "@LUA_MENU_TOP_MEDALS" ), LUI.MedalsPreviewWidget.TopMedalsLeft, "top", f2_arg0, self ) )
	if self.totalMedals == 0 then
		local self = LUI.UIText.new( {
			leftAnchor = true,
			left = 230,
			font = CoD.TextSettings.BodyFont.Font,
			height = 14,
			color = Colors.h1.light_grey,
			alpha = 0.5
		} )
		self:setText( Engine.Localize( "@LUA_MENU_NO_MEDALS" ) )
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

