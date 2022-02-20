local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.FriendsListItem = InheritFrom( LUI.UIBackgroundPanel )
LUI.FriendsListItem.Width = CoD.DesignGridHelper( 10, 0.5 )
LUI.FriendsListItem.Height = 54
LUI.FriendsListItem.IconSize = LUI.FriendsListItem.Height
LUI.FriendsListItem.TextPadding = 8
LUI.FriendsListItem.SetHighlight = function ( f1_arg0, f1_arg1 )
	f1_arg0.isSelected = f1_arg1
	if f1_arg1 then
		f1_arg0.playerCard:animateToState( "over" )
		f1_arg0.playerCard.border:animateToState( "focus" )
		f1_arg0.onlineDeco:hide()
	else
		f1_arg0.playerCard:animateToState( "default" )
		f1_arg0.playerCard.border:animateToState( "default" )
		if f1_arg0.data and f1_arg0.data.isOnline then
			f1_arg0.onlineDeco:show()
		end
	end
end

LUI.FriendsListItem.Refresh = function ( f2_arg0, f2_arg1 )
	f2_arg0.data = f2_arg1
	f2_arg0.playerCard:feedContent( f2_arg1 )
end

LUI.FriendsListItem.new = function ( f3_arg0 )
	local f3_local0 = 0.85
	local f3_local1 = CoD.CreateState( 17, 0, LUI.Playercard.Width * f3_local0 + 17, LUI.Playercard.Height * f3_local0, CoD.AnchorTypes.TopLeft )
	f3_local1.alpha = 1
	local self = LUI.UIButton.new( f3_local1 )
	self:registerAnimationState( "default", f3_local1 )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:setClass( LUI.FriendsListItem )
	self.controller = f3_arg0
	local f3_local3 = {
		alpha = 1,
		scale = -0.15
	}
	
	local playerCard = LUI.Playercard.new( f3_local3, {
		emblemDataSource = EmblemDataSource.Profile,
		controller = f3_arg0
	} )
	f3_local3.scale = -0.05
	playerCard:registerAnimationState( "over", f3_local3 )
	self:addElement( playerCard )
	self.playerCard = playerCard
	
	local f3_local5 = CoD.CreateState( nil, nil, 3, nil, CoD.AnchorTypes.TopBottomRight )
	f3_local5.material = RegisterMaterial( "h1_ui_social_deco_online" )
	f3_local5.width = 3
	
	local onlineDeco = LUI.UIImage.new( f3_local5 )
	playerCard:addElement( onlineDeco )
	self.onlineDeco = onlineDeco
	
	onlineDeco:hide()
	local f3_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f3_local7.material = RegisterMaterial( "h1_ui_btn_focused_stroke_square" )
	f3_local7.alpha = 0
	playerCard.border = LUI.UIImage.new( f3_local7 )
	playerCard.border:setup9SliceImage()
	playerCard.border:registerAnimationState( "focus", {
		alpha = 1
	} )
	playerCard:addElement( playerCard.border )
	return self
end

LockTable( _M )
