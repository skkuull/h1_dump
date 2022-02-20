local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.MPLobbyMap = InheritFrom( LUI.UIElement )
LUI.MPLobbyMap.TitleHeight = GenericButtonSettings.Styles.FlatButton.height
LUI.MPLobbyMap.BorderGrey = {
	r = 0.5,
	g = 0.5,
	b = 0.5
}
LUI.MPLobbyMap.LabelTextHeight = 16
LUI.MPLobbyMap.SubLabelTextHeight = 12
LUI.MPLobbyMap.NumberTextHeight = 29
LUI.MPLobbyMap.TextHorizontalOffset = 8
LUI.MPLobbyMap.TextVerticalOffset = 6
LUI.MPLobbyMap.SubTextBgVerticalOffset = 27
LUI.MPLobbyMap.SetMapImage = function ( f1_arg0, f1_arg1 )
	f1_arg1 = f1_arg1 .. "_vote"
	if f1_arg0.image.materialName ~= f1_arg1 then
		local f1_local0 = RegisterMaterial( f1_arg1 )
		local f1_local1, f1_local2 = GetMaterialDimensions( f1_local0 )
		f1_arg0:registerAnimationState( "updateDimensions", {
			leftAnchor = true,
			topAnchor = true,
			height = LUI.MPLobbyMapVote.Height,
			width = LUI.MPLobbyMapVote.Height * f1_local1 / f1_local2
		} )
		f1_arg0:animateToState( "updateDimensions" )
		f1_arg0.image:registerAnimationState( "updateImage", {
			material = f1_local0
		} )
		f1_arg0.image:animateToState( "updateImage" )
		f1_arg0.image.materialName = f1_arg1
	end
end

LUI.MPLobbyMap.Refresh = function ( f2_arg0, f2_arg1 )
	f2_arg0.title:setText( Lobby.GetMapName() )
	if not f2_arg0.isVote then
		f2_arg0:SetMapImage( Lobby.GetMapImage() )
		local f2_local0 = Lobby.GameTypeNameAbbreviated()
		f2_arg0.headerText:setText( f2_local0 )
		local f2_local1, f2_local2, f2_local3, f2_local4 = GetTextDimensions( f2_local0, CoD.TextSettings.Font18.Font, CoD.TextSettings.Font18.Height )
		f2_arg0.headerElement:registerAnimationState( "update", {
			leftAnchor = true,
			topAnchor = true,
			width = f2_local3 - f2_local1 + 42,
			height = 27,
			top = -36
		} )
		f2_arg0.headerElement:animateToState( "update" )
	end
end

LUI.MPLobbyMap.SetHeaderToVotedState = function ( f3_arg0 )
	f3_arg0.headerText:setText( Engine.Localize( "@MP_VOTE_NEXTMAP" ) )
	f3_arg0.headerText:registerAnimationState( "voted", {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 9,
		height = CoD.TextSettings.Font18.Height,
		font = CoD.TextSettings.Font18.Font,
		alignment = LUI.Alignment.Center,
		left = -29,
		color = Colors.white
	} )
	f3_arg0.headerText:animateToState( "voted" )
	f3_arg0.headerTriangle:show()
end

LUI.MPLobbyMap.new = function ( f4_arg0, f4_arg1, f4_arg2 )
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true
	} )
	self:setClass( LUI.MPLobbyMap )
	self.id = "lobby_map_container"
	local f4_local1 = nil
	if f4_arg2 then
		f4_local1 = -36
	else
		f4_local1 = -69
	end
	local f4_local2 = nil
	if f4_arg2 then
		f4_local2 = Engine.Localize( "@LUA_MENU_VOTE_FOR_NEXT_MAP" )
	else
		f4_local2 = Lobby.GameTypeNameAbbreviated()
	end
	local f4_local3 = 42
	local f4_local4, f4_local5, f4_local6, f4_local7 = GetTextDimensions( f4_local2, CoD.TextSettings.Font18.Font, CoD.TextSettings.Font18.Height )
	local headerElement = LUI.UIElement.new( {
		leftAnchor = true,
		topAnchor = true,
		width = f4_local6 - f4_local4 + f4_local3,
		height = 27,
		top = f4_local1
	} )
	local f4_local9 = RegisterMaterial( bgMaterial )
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "h1_deco_container_bg_loading" ),
		alpha = 0.8
	} )
	local f4_local11 = {
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 9,
		height = CoD.TextSettings.Font18.Height,
		font = CoD.TextSettings.Font18.Font,
		alignment = LUI.Alignment.Center,
		color = Colors.white
	}
	if Engine.IsAsianLanguage() or Engine.IsRightToLeftLanguage() then
		f4_local11.top = 7
	end
	local headerText = LUI.UIText.new( f4_local11 )
	headerText:setTextStyle( CoD.TextStyle.ForceUpperCase )
	headerText:setText( f4_local2 )
	headerElement:addElement( self )
	headerElement:addElement( headerText )
	self.headerText = headerText
	
	local f4_local13 = CoD.CreateState( nil, 5, -19, nil, CoD.AnchorTypes.TopRight )
	f4_local13.width = 16
	f4_local13.height = f4_local13.width
	f4_local13.material = RegisterMaterial( "h1_deco_double_triangle" )
	f4_local13.color = {
		r = 0.36,
		g = 0.36,
		b = 0.36
	}
	
	local headerTriangle = LUI.UIImage.new( f4_local13 )
	headerTriangle:hide()
	headerElement:addElement( headerTriangle )
	self.headerTriangle = headerTriangle
	
	self.isVote = f4_arg2
	self:addElement( headerElement )
	self.headerElement = headerElement
	
	self.image = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( self.image )
	self.image:registerAnimationState( "hidden", {
		alpha = 0
	} )
	if f4_arg2 then
		self.image:animateToState( "hidden" )
	end
	self.title = LUI.UIText.new( {
		leftAnchor = true,
		bottomAnchor = true,
		height = LUI.MPLobbyMap.LabelTextHeight,
		left = LUI.MPLobbyMap.TextHorizontalOffset,
		bottom = -LUI.MPLobbyMap.TextVerticalOffset,
		font = LUI.MPLobbyMapVoteButton.Font.Font,
		color = Colors.white,
		alignment = LUI.HorizontalAlignment.Left
	} )
	self.title:setTextStyle( CoD.TextStyle.ForceUpperCase )
	self:addElement( self.title )
	self.title:registerAnimationState( "hidden", {
		alpha = 0
	} )
	if f4_arg2 then
		self.title:animateToState( "hidden" )
	end
	local f4_local15 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f4_local15.borderThickness = 2
	f4_local15.alpha = 0.25
	f4_local15.color = LUI.MPLobbyMap.BorderGrey
	self.border = LUI.UIBorder.new( f4_local15 )
	self:addElement( self.border )
	self.border:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self.border:animateToState( "hidden" )
	local self = LUI.UITimer.new( 200, "refresh" )
	self.id = "MPLobbyMap_refresh_timer"
	self:registerEventHandler( "refresh", LUI.MPLobbyMap.Refresh )
	self:addElement( self )
	return self
end

LockTable( _M )
