local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
LUI.Playercard = {}
LUI.Playercard.Width = 273.33
LUI.Playercard.Height = 60
LUI.Playercard.CallingCard = {}
LUI.Playercard.CallingCard.Aspect = 3.56
LUI.Playercard.CallingCard.Width = LUI.Playercard.Height * LUI.Playercard.CallingCard.Aspect
LUI.Playercard.CallingCard.Height = LUI.Playercard.Height
LUI.Playercard.build = function ( f1_arg0, f1_arg1, f1_arg2 )
	return LUI.Playercard.new()
end

LUI.Playercard.new = function ( f2_arg0, f2_arg1 )
	if f2_arg0 == nil then
		f2_arg0 = CoD.CreateState( 0, 0, nil, nil, CoD.AnchorTypes.TopLeft )
	end
	f2_arg0.width = LUI.Playercard.Width
	f2_arg0.height = LUI.Playercard.Height
	local self = LUI.UIElement.new( f2_arg0 )
	local f2_local1 = CoD.CreateState( nil, 0, 0, nil, CoD.AnchorTypes.TopRight )
	f2_local1.width = LUI.Playercard.CallingCard.Width
	f2_local1.height = LUI.Playercard.CallingCard.Height
	local self = LUI.UIElement.new( f2_local1 )
	self.id = "backgroundContainer"
	self:setUseStencil( true )
	self:addElement( self )
	local f2_local3 = CoD.CreateState( nil, nil, nil, nil, CoD.AnchorTypes.None )
	f2_local3.width = LUI.Playercard.Height
	f2_local3.height = LUI.Playercard.Height
	f2_local3.material = RegisterMaterial( "h1_ui_loader_emblem" )
	self:addElement( LUI.UIImage.new( f2_local3 ) )
	local f2_local4 = CoD.CreateState( nil, 0, 0, nil, CoD.AnchorTypes.TopRight )
	f2_local4.width = LUI.Playercard.CallingCard.Width
	f2_local4.height = LUI.Playercard.CallingCard.Height
	self.background = LUI.UIImage.new( f2_local4 )
	self.background.id = "background"
	self:addElement( self.background )
	local f2_local5 = CoD.CreateState( 0, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
	f2_local5.width = 75
	f2_local5.material = RegisterMaterial( "h1_ui_playercard_wedge" )
	f2_local5.color = Colors.white
	self.wedge = LUI.UIImage.new( f2_local5 )
	self.wedge.state = f2_local5
	self:addElement( self.wedge )
	local f2_local6 = CoD.CreateState( 0, 0, nil, 0, CoD.AnchorTypes.TopBottomLeft )
	f2_local6.width = LUI.Playercard.Height
	f2_local6.material = RegisterMaterial( "white" )
	self.emblemBacking = LUI.UIImage.new( f2_local6 )
	self.emblemBacking.state = f2_local6
	self:addElement( self.emblemBacking )
	local f2_local7 = CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All )
	f2_local7.material = RegisterMaterial( "white" )
	self.emblem = LUI.UIImage.new( f2_local7 )
	self.emblem.state = f2_local7
	self.emblemBacking:addElement( self.emblem )
	local f2_local8 = CoD.CreateState( 30, nil, nil, -4, CoD.AnchorTypes.BottomLeft )
	f2_local8.width = 100
	f2_local8.height = 16.5
	f2_local8.material = RegisterMaterial( "black" )
	f2_local8.alpha = 0
	self.gamertagBackground = LUI.UIImage.new( f2_local8 )
	self.gamertagBackground.state = f2_local8
	self:addElement( self.gamertagBackground )
	local f2_local9 = CoD.CreateState( 32, nil, 0, -6, CoD.AnchorTypes.BottomLeftRight )
	f2_local9.height = 10.5
	f2_local9.font = CoD.TextSettings.Font21.Font
	f2_local9.alignment = LUI.Alignment.Left
	f2_local9.color = Colors.white
	if Engine.IsPC() then
		f2_local9.rightAnchor = false
		f2_local9.right = f2_local9.left + 170
	end
	self.gamertag = LUI.UIText.new( f2_local9 )
	self.gamertag.state = f2_local9
	self:addElement( self.gamertag )
	if Engine.IsPC() and self.gamertag.setupAutoScaleText then
		self.gamertag:setupAutoScaleText()
	end
	if not Engine.GetOnlineGame() then
		local f2_local10 = CoD.CreateState( 0, nil, nil, -6, CoD.AnchorTypes.BottomLeft )
		f2_local10.height = 10.5
		f2_local10.width = 30
		f2_local10.font = CoD.TextSettings.Font21.Font
		f2_local10.alignment = LUI.Alignment.Center
		f2_local10.color = Colors.mp.aar_score_gold
		self.rank = LUI.UIText.new( f2_local10 )
		self.rank.id = "rank"
		self:addElement( self.rank )
		local f2_local11 = CoD.CreateState( 2, nil, nil, -24, CoD.AnchorTypes.BottomLeft )
		f2_local11.width = 26
		f2_local11.height = 26
		f2_local11.material = RegisterMaterial( "white" )
		self.rankIcon = LUI.UIImage.new( f2_local11 )
		self.rankIcon.state = f2_local11
		self:addElement( self.rankIcon )
	end
	self.feedContent = LUI.Playercard.FeedContent
	self:registerEventHandler( "update_playercard", function ( element, event )
		element:feedContent( event )
	end )
	if not Engine.InFrontend() then
		self:registerEventHandler( "update_playercard_for_clientnum", function ( element, event )
			assert( event.clientNum )
			local f4_local0 = event.clientNum
			if f4_local0 >= 0 then
				local f4_local1 = Game.GetPlayerCard( f4_local0 )
				local f4_local2 = Game.GetPlayerScoreInfo( f4_local0 )
				if f4_local1 and f4_local2 then
					element:feedContent( {
						name = "update_playercard",
						gamertag = f4_local2.name,
						rank = f4_local2.rank,
						prestige = f4_local2.prestige,
						background = f4_local1.background,
						emblem = f4_local1.patch,
						xuid = f4_local1.xuid
					} )
				end
			end
		end )
	end
	if f2_arg1 ~= nil then
		self:feedContent( f2_arg1 )
	end
	return self
end

LUI.Playercard.AnimatedTableToFunc = function ( f5_arg0 )
	local f5_local0 = LUI.Playercard[f5_arg0]
	local f5_local1
	if f5_local0 then
		f5_local1 = f5_local0.new
		if not f5_local1 then
		
		else
			return f5_local1
		end
	end
	f5_local1 = nil
end

LUI.Playercard.CreateAnimatedCallingCard = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = LUI.Playercard.AnimatedTableToFunc( f6_arg0 )
	if f6_local0 then
		local f6_local1 = f6_local0()
		if f6_local1 then
			local f6_local2 = CoD.CreateState( f6_arg2, f6_arg3, nil, nil, CoD.AnchorTypes.None )
			f6_local2.width = LUI.Playercard.CallingCard.Width
			f6_local2.height = LUI.Playercard.CallingCard.Height
			if f6_arg1 ~= nil then
				f6_local2.scale = f6_arg1 / LUI.Playercard.Height - 1
			end
			local self = LUI.UIElement.new( f6_local2 )
			self:setUseStencil( true )
			self:addElement( f6_local1 )
			return self
		end
	end
	return nil
end

LUI.Playercard.FeedContent = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0
	if f7_local0.gamertag and f7_arg1.gamertag then
		f7_local0.gamertag:setText( f7_arg1.gamertag )
		local f7_local1, f7_local2, f7_local3, f7_local4 = GetTextDimensions( f7_arg1.gamertag, f7_local0.gamertag.state.font, f7_local0.gamertag.state.height )
		f7_local0.gamertagBackground.state.alpha = 0.6
		f7_local0.gamertagBackground.state.width = f7_local3 - f7_local1 + 4
		if Engine.IsPC() then
			f7_local0.gamertagBackground.state.width = f7_local0.gamertagBackground.state.width + 4
		end
		f7_local0.gamertagBackground:registerAnimationState( "update", f7_local0.gamertagBackground.state )
		f7_local0.gamertagBackground:animateToState( "update" )
	end
	if f7_local0.rank and f7_arg1.rank then
		f7_local0.rank:setText( Rank.GetRankDisplay( f7_arg1.rank ) )
	end
	if f7_local0.rankIcon and f7_arg1.rank then
		f7_local0.rankIcon:setImage( RegisterMaterial( Rank.GetRankIcon( f7_arg1.rank, f7_arg1.prestige or 0, f7_arg1.rankIcons ) ) )
	end
	if f7_local0.background and f7_arg1.background and f7_local0.backgroundImage ~= f7_arg1.background then
		f7_local0.backgroundImage = f7_arg1.background
		f7_local0.background:closeChildren()
		local f7_local1 = Engine.TableLookupByRow( CallingCardTable.File, tonumber( f7_arg1.background ), CallingCardTable.Cols.AnimatedTable )
		if f7_local1 ~= nil and f7_local1 ~= "" then
			local f7_local2 = LUI.Playercard.CreateAnimatedCallingCard( f7_local1 )
			if f7_local2 then
				f7_local0.background:addElement( f7_local2 )
				f7_local0.background:setImage( RegisterMaterial( "black" ) )
			end
		else
			local f7_local2 = Engine.TableLookupByRow( CallingCardTable.File, tonumber( f7_arg1.background ), CallingCardTable.Cols.Image )
			if f7_local2 and f7_local2 ~= "" then
				f7_local0.background:animateToState( "default" )
				local f7_local3 = RegisterMaterial( f7_local2 )
				Engine.CacheMaterial( f7_local3 )
				f7_local0.background:setImage( f7_local3 )
			end
		end
	end
	if f7_arg1.background then
		local f7_local1 = {
			r = tonumber( Engine.TableLookupByRow( CallingCardTable.File, tonumber( f7_arg1.background ), CallingCardTable.Cols.WedgeR ) )
		}
		if f7_local1.r ~= nil then
			f7_local1.r = f7_local1.r / 255
			f7_local1.g = tonumber( Engine.TableLookupByRow( CallingCardTable.File, tonumber( f7_arg1.background ), CallingCardTable.Cols.WedgeG ) ) / 255
			f7_local1.b = tonumber( Engine.TableLookupByRow( CallingCardTable.File, tonumber( f7_arg1.background ), CallingCardTable.Cols.WedgeB ) ) / 255
		else
			f7_local1 = Colors.black
		end
		if f7_local0.wedge then
			f7_local0.wedge.state.color = f7_local1
			f7_local0.wedge:registerAnimationState( "default", f7_local0.wedge.state )
			f7_local0.wedge:animateToState( "default" )
		end
		if f7_local0.emblemBacking then
			f7_local0.emblemBacking.state.color = f7_local1
			f7_local0.emblemBacking:registerAnimationState( "default", f7_local0.emblemBacking.state )
			f7_local0.emblemBacking:animateToState( "default" )
		end
	end
	if f7_local0.emblem and f7_arg1.emblem then
		local f7_local1 = Engine.TableLookupByRow( EmblemIconTable.File, tonumber( f7_arg1.emblem ), EmblemIconTable.Cols.Image )
		if f7_local1 and f7_local1 ~= "" then
			local f7_local2 = RegisterMaterial( f7_local1 )
			Engine.CacheMaterial( f7_local2 )
			f7_local0.emblem:setImage( f7_local2 )
		end
	end
end

LUI.MenuBuilder.registerType( "playercard", LUI.Playercard.build )
LockTable( _M )
