OperatorMenuUtil = {
	PreviewElementWidth = 877,
	PreviewElementHeight = 265,
	UpperPreviewTop = 90,
	UpperPreviewLeft = 270,
	LowerPreviewTop = 370,
	LowerPreviewLeft = 270,
	HeaderOffset = 30,
	PanelBaseName = "operator",
	ItemID = 0,
	DebugAddDebugInfoAndButtons = false,
	DebugDumpStatsInfoToTTY = false,
	DebugDumpWeaponStatFetchTimingsToTTY = false,
	UseWeaponStatsCFunc = true,
	DebugRenderModeDvarName = "OperatorMenuDebugRenderMode",
	DebugRenderCounterDvarName = "OperatorDebugRenderCounter",
	DebugColorArray = {
		{
			r = 1,
			g = 0,
			b = 0
		},
		{
			r = 0,
			g = 1,
			b = 0
		},
		{
			r = 0,
			g = 0,
			b = 1
		},
		{
			r = 1,
			g = 1,
			b = 0
		},
		{
			r = 1,
			g = 0,
			b = 1
		},
		{
			r = 0,
			g = 1,
			b = 1
		},
		{
			r = 1,
			g = 1,
			b = 1
		},
		{
			r = 0.5,
			g = 0.5,
			b = 0.5
		},
		{
			r = 0.5,
			g = 0,
			b = 0
		},
		{
			r = 0,
			g = 0.5,
			b = 0
		},
		{
			r = 0,
			g = 0,
			b = 0.5
		},
		{
			r = 0.5,
			g = 0.5,
			b = 0
		},
		{
			r = 0.5,
			g = 0,
			b = 0.5
		},
		{
			r = 0,
			g = 0.5,
			b = 0.5
		},
		{
			r = 0.25,
			g = 0.25,
			b = 0.25
		},
		{
			r = 0.13,
			g = 0.13,
			b = 0.13
		}
	},
	DebugColorIndex = 0,
	GetRandomString = function ( f1_arg0 )
		local f1_local0 = ""
		for f1_local1 = 1, f1_arg0, 1 do
			local f1_local4 = f1_local1
			f1_local0 = f1_local0 .. tostring( math.random( 0, 9 ) )
		end
		return f1_local0
	end,
	GetDebugRenderMode = function ()
		return Engine.GetDvarInt( OperatorMenuUtil.DebugRenderModeDvarName ) or 0
	end,
	IncrementDebugRenderMode = function ()
		local f3_local0 = OperatorMenuUtil.GetDebugRenderMode() + 1
		if f3_local0 > 2 then
			f3_local0 = 0
		end
		Engine.ExecNow( "set " .. tostring( OperatorMenuUtil.DebugRenderModeDvarName ) .. " " .. tostring( f3_local0 ) )
	end,
	ResetDebugRenderCounter = function ()
		Engine.ExecNow( "set " .. tostring( OperatorMenuUtil.DebugRenderCounterDvarName ) .. " 0" )
	end,
	GetDebugRenderCounter = function ()
		return Engine.GetDvarInt( OperatorMenuUtil.DebugRenderCounterDvarName ) or 0
	end,
	IncrementDebugRenderCounter = function ()
		Engine.ExecNow( "set " .. tostring( OperatorMenuUtil.DebugRenderCounterDvarName ) .. " " .. tostring( OperatorMenuUtil.GetDebugRenderCounter() + 1 ) )
	end,
	TimeInMSToTimeTable = function ( f7_arg0 )
		return os.date( "*t", f7_arg0 )
	end,
	InitPanels = function ( f8_arg0, f8_arg1 )
		OperatorMenuUtil.PanelBaseName = f8_arg0 or "operator"
		OperatorMenuUtil.ItemID = 0
		OperatorMenuUtil.DebugColorIndex = f8_arg1 % #OperatorMenuUtil.DebugColorArray
	end,
	FixupColor = function ( f9_arg0 )
		local f9_local0 = {
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		}
		if f9_arg0 then
			local f9_local1 = f9_arg0.red
			if not f9_local1 then
				f9_local1 = f9_arg0.r or 1
			end
			f9_local0.red = f9_local1
			f9_local1 = f9_arg0.green
			if not f9_local1 then
				f9_local1 = f9_arg0.g or 1
			end
			f9_local0.green = f9_local1
			f9_local1 = f9_arg0.blue
			if not f9_local1 then
				f9_local1 = f9_arg0.b or 1
			end
			f9_local0.blue = f9_local1
			f9_local1 = f9_arg0.alpha
			if not f9_local1 then
				f9_local1 = f9_arg0.a or 1
			end
			f9_local0.alpha = f9_local1
		end
		return f9_local0
	end,
	GetNextDebugColor = function ()
		local f10_local0 = OperatorMenuUtil.DebugColorIndex % #OperatorMenuUtil.DebugColorArray + 1
		OperatorMenuUtil.DebugColorIndex = (OperatorMenuUtil.DebugColorIndex + 1) % #OperatorMenuUtil.DebugColorArray
		return OperatorMenuUtil.DebugColorArray[f10_local0]
	end,
	GetNextItemIDString = function ( f11_arg0 )
		local f11_local0 = ""
		OperatorMenuUtil.ItemID = OperatorMenuUtil.ItemID + 1
		if f11_arg0 and f11_arg0 ~= "" then
			f11_local0 = tostring( OperatorMenuUtil.PanelBaseName ) .. "_" .. tostring( f11_arg0 ) .. "_" .. tostring( OperatorMenuUtil.ItemID )
		else
			f11_local0 = tostring( OperatorMenuUtil.PanelBaseName ) .. "_" .. tostring( OperatorMenuUtil.ItemID )
		end
		return f11_local0
	end,
	ButtonOverHandler = function ( f12_arg0, f12_arg1 )
		return MBh.AnimateToState( "focused" )
	end,
	ButtonUpHandler = function ( f13_arg0, f13_arg1 )
		return MBh.AnimateToState( "default" )
	end,
	GetPlayerCardData = function ( f14_arg0 )
		if Engine.IsDevelopmentBuild() and OperatorMenuUtil.DebugDumpStatsInfoToTTY == true then
			DebugPrint( "" )
			DebugPrint( "############################################################################################################" )
			DebugPrint( "OperatorMenuUtil.GetPlayerCardData: controller# = " .. tostring( f14_arg0 ) )
			DebugPrint( "############################################################################################################" )
			DebugPrint( "" )
		end
		local f14_local0 = {
			experience = 0,
			rank = 0,
			prestige = 0,
			clantag = "",
			gamertag = Engine.GetUsernameByController( f14_arg0 )
		}
		if Clan.IsEnabled() and Clan.AlreadyMember( f14_arg0 ) then
			f14_local0.clantag = "[" .. Clan.GetName( f14_arg0 ) .. "]"
		end
		if Engine.DoWeHaveStats( f14_arg0 ) == true then
			f14_local0.experience = Engine.GetPlayerDataMPXP( f14_arg0 )
			f14_local0.prestige = Engine.GetPlayerData( f14_arg0, CoD.StatsGroup.Ranked, "prestige" )
			f14_local0.rank = Lobby.GetRankForXP( f14_local0.experience, f14_local0.prestige )
		end
		if Engine.IsDevelopmentBuild() and OperatorMenuUtil.DebugDumpStatsInfoToTTY == true then
			DebugPrint( "" )
			DebugPrint( "DEBUG: Player Card Data for controller #" .. tostring( f14_arg0 ) .. ":" )
			DebugPrint( "DEBUG: playerCardData.experience = " .. tostring( f14_local0.experience ) )
			DebugPrint( "DEBUG: playerCardData.rank = " .. tostring( f14_local0.rank ) )
			DebugPrint( "DEBUG: playerCardData.prestige = " .. tostring( f14_local0.prestige ) )
			DebugPrint( "DEBUG: playerCardData.gamertag = "" .. tostring( f14_local0.gamertag ) .. """ )
			DebugPrint( "DEBUG: playerCardData.clantag = "" .. tostring( f14_local0.clantag ) .. """ )
			DebugPrint( "" )
		end
		return f14_local0
	end,
	UIItemDefAppendStateFullRect = function ( f15_arg0, f15_arg1 )
		if f15_arg0 then
			local f15_local0 = {}
			if f15_arg1 then
				f15_local0.topAnchor = f15_arg1.topAnchor
				f15_local0.bottomAnchor = f15_arg1.bottomAnchor
				f15_local0.leftAnchor = f15_arg1.leftAnchor
				f15_local0.rightAnchor = f15_arg1.rightAnchor
				f15_local0.left = f15_arg1.left
				if f15_arg1.width then
					f15_local0.width = f15_arg1.width
				else
					f15_local0.right = f15_arg1.right
				end
				f15_local0.top = f15_arg1.top
				if f15_arg1.height then
					f15_local0.height = f15_arg1.height
				else
					f15_local0.bottom = f15_arg1.bottom
				end
			else
				f15_local0.topAnchor = true
				f15_local0.bottomAnchor = true
				f15_local0.leftAnchor = true
				f15_local0.rightAnchor = true
				f15_local0.left = 0
				f15_local0.right = 0
				f15_local0.top = 0
				f15_local0.bottom = 0
			end
			LUI.Append( f15_arg0, f15_local0 )
		end
		return f15_arg0
	end,
	UIItemDefAppendStateTextRect = function ( f16_arg0, f16_arg1 )
		if f16_arg0 then
			local f16_local0 = {}
			if f16_arg1 then
				f16_local0.left = f16_arg1.left
				if f16_arg1.width then
					f16_local0.right = nil
					f16_local0.width = f16_arg1.width
				else
					f16_local0.right = f16_arg1.right
					f16_local0.width = nil
				end
			else
				f16_local0.left = 0
				f16_local0.right = 0
				f16_local0.width = nil
				f16_local0.height = nil
			end
			LUI.Append( f16_arg0, f16_local0 )
		end
		return f16_arg0
	end,
	UIItemDefAppendStateMaterial = function ( f17_arg0, f17_arg1 )
		if f17_arg0 then
			local f17_local0 = {}
			if f17_arg1 then
				f17_local0.material = f17_arg1
			else
				f17_local0.material = nil
			end
			LUI.Append( f17_arg0, f17_local0 )
		end
		return f17_arg0
	end,
	UIItemDefAppendStateColor = function ( f18_arg0, f18_arg1 )
		if f18_arg0 then
			local f18_local0 = {}
			if f18_arg1 then
				f18_local0.red = f18_arg1.red or f18_arg1.r
				f18_local0.green = f18_arg1.green or f18_arg1.g
				f18_local0.blue = f18_arg1.blue or f18_arg1.b
			else
				f18_local0.red = 0
				f18_local0.green = 0
				f18_local0.blue = 0
			end
			LUI.Append( f18_arg0, f18_local0 )
		end
		return f18_arg0
	end,
	UIItemDefAppendStateAlpha = function ( f19_arg0, f19_arg1 )
		if f19_arg0 then
			local f19_local0 = {}
			if f19_arg1 then
				f19_local0.alpha = f19_arg1
			else
				f19_local0.alpha = 0
			end
			LUI.Append( f19_arg0, f19_local0 )
		end
		return f19_arg0
	end,
	UIItemDefAppendStateLineWidth = function ( f20_arg0, f20_arg1 )
		if f20_arg0 then
			local f20_local0 = {}
			if alpha then
				f20_local0.lineWidth = f20_arg1
			else
				f20_local0.lineWidth = 1
			end
			LUI.Append( f20_arg0, f20_local0 )
		end
		return f20_arg0
	end,
	UIGetItemUIImageColorNext = function ( f21_arg0, f21_arg1 )
		return OperatorMenuUtil.UIGetItemUIImageColor( f21_arg0, f21_arg1, OperatorMenuUtil.GetNextDebugColor(), 1 )
	end,
	UIGetItemUIImageColor = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		local f22_local0 = {}
		OperatorMenuUtil.UIItemDefAppendStateFullRect( f22_local0, f22_arg1 )
		OperatorMenuUtil.UIItemDefAppendStateMaterial( f22_local0, RegisterMaterial( "white" ) )
		OperatorMenuUtil.UIItemDefAppendStateColor( f22_local0, f22_arg2 )
		OperatorMenuUtil.UIItemDefAppendStateAlpha( f22_local0, f22_arg3 )
		local self = LUI.UIImage.new( f22_local0 )
		self.id = f22_arg0 or OperatorMenuUtil.GetNextItemIDString( "image" )
		self:animateToState( "default" )
		return self
	end,
	UIGetItemUIImageNoStates = function ( f23_arg0 )
		local self = LUI.UIImage.new()
		self.id = f23_arg0 or OperatorMenuUtil.GetNextItemIDString( "image" )
		return self
	end,
	UIAddImageState = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
		local f24_local0 = {}
		OperatorMenuUtil.UIItemDefAppendStateFullRect( f24_local0, f24_arg2 )
		OperatorMenuUtil.UIItemDefAppendStateMaterial( f24_local0, f24_arg3 )
		OperatorMenuUtil.UIItemDefAppendStateAlpha( f24_local0, f24_arg4 )
		f24_arg0:registerAnimationState( f24_arg1, f24_local0 )
	end,
	UIGetItemUIImage = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		local f25_local0 = OperatorMenuUtil.UIGetItemUIImageNoStates( f25_arg0 )
		OperatorMenuUtil.UIAddImageState( f25_local0, "default", f25_arg1, f25_arg2, f25_arg3 )
		f25_local0:animateToState( "default" )
		return f25_local0
	end,
	UIGetItemUILine = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
		local f26_local0 = {}
		OperatorMenuUtil.UIItemDefAppendStateFullRect( f26_local0, f26_arg1 )
		OperatorMenuUtil.UIItemDefAppendStateMaterial( f26_local0, RegisterMaterial( "white" ) )
		OperatorMenuUtil.UIItemDefAppendStateColor( f26_local0, f26_arg2 )
		OperatorMenuUtil.UIItemDefAppendStateAlpha( f26_local0, f26_arg3 )
		OperatorMenuUtil.UIItemDefAppendStateLineWidth( f26_local0, f26_arg4 )
		local self = LUI.UILine.new( f26_local0 )
		self.id = f26_arg0 or OperatorMenuUtil.GetNextItemIDString( "line" )
		self:animateToState( "default" )
		return self
	end,
	UIGetItemUIPlayerCard = function ( f27_arg0, f27_arg1, f27_arg2 )
		local f27_local0 = OperatorMenuUtil.GetPlayerCardData( f27_arg2 )
		local f27_local1 = LUI.MenuBuilder.BuildRegisteredType( "playercard", {
			layoutName = "Normal",
			clantag = f27_local0.clantag,
			gamertag = f27_local0.gamertag,
			background = 0,
			rank = f27_local0.rank,
			prestige = f27_local0.prestige,
			patchEmblem = 0
		} )
		f27_local1.id = f27_arg0 or OperatorMenuUtil.GetNextItemIDString( "playercard" )
		local f27_local2 = {}
		OperatorMenuUtil.UIItemDefAppendStateFullRect( f27_local2, f27_arg1 )
		f27_local1:registerAnimationState( "default", f27_local2 )
		f27_local1:animateToState( "default" )
		return f27_local1
	end,
	UIGetItemUITimer = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		local self = LUI.UITimer.new( f28_arg2, {
			name = f28_arg1
		}, nil, f28_arg3, nil, false, false )
		self.id = f28_arg0 or OperatorMenuUtil.GetNextItemIDString( "timer" )
		return self
	end,
	UIGetItemUIButtonNoStates = function ( f29_arg0 )
		local self = LUI.UIButton.new()
		self.id = f29_arg0 or OperatorMenuUtil.GetNextItemIDString( "button" )
		return self
	end,
	UIGetItemUIButtonDebug = function ( f30_arg0, f30_arg1, f30_arg2 )
		local f30_local0 = OperatorMenuUtil.UIGetItemUIButtonNoStates( f30_arg0 )
		local f30_local1 = {}
		OperatorMenuUtil.UIItemDefAppendStateFullRect( f30_local1, f30_arg1 )
		OperatorMenuUtil.UIItemDefAppendStateMaterial( f30_local1, RegisterMaterial( "white" ) )
		OperatorMenuUtil.UIItemDefAppendStateColor( f30_local1, {
			r = 0.5,
			g = 0.5,
			b = 0.5
		} )
		OperatorMenuUtil.UIItemDefAppendStateAlpha( f30_local1, 1 )
		f30_local0:registerAnimationState( "default", f30_local1 )
		local f30_local2 = {}
		OperatorMenuUtil.UIItemDefAppendStateFullRect( f30_local2, f30_arg1 )
		OperatorMenuUtil.UIItemDefAppendStateMaterial( f30_local2, RegisterMaterial( "white" ) )
		OperatorMenuUtil.UIItemDefAppendStateColor( f30_local2, {
			r = 1,
			g = 1,
			b = 1
		} )
		OperatorMenuUtil.UIItemDefAppendStateAlpha( f30_local2, 1 )
		f30_local0:registerAnimationState( "focused", f30_local2 )
		f30_local0:registerEventHandler( "button_action", f30_arg2 )
		f30_local0:registerEventHandler( "button_over", OperatorMenuUtil.ButtonOverHandler )
		f30_local0:registerEventHandler( "button_up", OperatorMenuUtil.ButtonUpHandler )
		f30_local0:animateToState( "default" )
		return f30_local0
	end,
	UIItemAddWireframe = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
		if f31_arg1 then
			if not f31_arg3 then
				f31_arg3 = {
					r = 1,
					g = 1,
					b = 1
				}
			end
			if not f31_arg4 then
				f31_arg4 = {
					r = 0.09,
					g = 0.09,
					b = 0.09
				}
			end
			local f31_local0 = nil
			if f31_arg1.width then
				f31_local0 = f31_arg1.width
			elseif f31_arg1.left then
				f31_local0 = f31_arg1.right - f31_arg1.left
			else
				f31_local0 = 0
			end
			local f31_local1 = nil
			if f31_arg1.height then
				f31_local1 = f31_arg1.height
			elseif f31_arg1.bottom then
				f31_local1 = f31_arg1.bottom - f31_arg1.top
			else
				f31_local1 = 0
			end
			local f31_local2 = -(f31_local0 / 2)
			local f31_local3 = -(f31_local1 / 2)
			local f31_local4 = f31_arg2 or 1
			local f31_local5 = {
				left = f31_local2,
				right = f31_local2 + f31_local0,
				top = f31_local3,
				bottom = f31_local3 + f31_local1
			}
			local f31_local6 = {
				left = f31_local2 + f31_local4,
				right = f31_local2 + f31_local0 - f31_local4,
				top = f31_local3 + f31_local4,
				bottom = f31_local3 + f31_local1 - f31_local4
			}
			f31_arg0:addElement( OperatorMenuUtil.UIGetItemUIImageColor( nil, f31_local5, f31_arg3, 1 ) )
			f31_arg0:addElement( OperatorMenuUtil.UIGetItemUIImageColor( nil, f31_local6, f31_arg4, 1 ) )
		end
	end,
	UIGetItemUIElement = function ( menu, controller )
		local self = LUI.UIElement.new( controller )
		self.id = menu or OperatorMenuUtil.GetNextItemIDString( "element" )
		if Engine.IsDevelopmentBuild() and OperatorMenuUtil.DebugAddDebugInfoAndButtons == true then
			local f32_local1 = OperatorMenuUtil.GetDebugRenderMode()
			if f32_local1 == 1 then
				OperatorMenuUtil.UIItemAddWireframe( self, controller )
			elseif f32_local1 == 2 then
				self:addElement( OperatorMenuUtil.UIGetItemUIImageColorNext( nil, {
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					left = 0,
					right = 0,
					top = 0,
					bottom = 0
				} ) )
			end
		end
		self:animateToState( "default" )
		return self
	end,
	UIGetItemUIVerticalList = function ( menu, controller )
		local self = LUI.UIVerticalList.new( controller )
		self.id = menu or OperatorMenuUtil.GetNextItemIDString( "verticallist" )
		if Engine.IsDevelopmentBuild() and OperatorMenuUtil.DebugAddDebugInfoAndButtons == true then
			local f33_local1 = OperatorMenuUtil.GetDebugRenderMode()
			if f33_local1 == 1 then
				OperatorMenuUtil.UIItemAddWireframe( self, controller )
			elseif f33_local1 == 2 then
				self:addElement( OperatorMenuUtil.UIGetItemUIImageColorNext( nil, {
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					left = 0,
					right = 0,
					top = 0,
					bottom = 0
				} ) )
			end
		end
		return self
	end,
	UIGetItemUIText = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4, f34_arg5, f34_arg6, f34_arg7 )
		if not f34_arg3 then
			f34_arg3 = CoD.TextStyle.None
		end
		local f34_local0 = 1
		local f34_local1 = 1
		local f34_local2 = 1
		local f34_local3 = 1
		if f34_arg5 then
			f34_local0 = f34_arg5.r or f34_arg5.red or 1
		end
		if f34_arg5 then
			f34_local1 = f34_arg5.g or f34_arg5.green or 1
		end
		if f34_arg5 then
			f34_local2 = f34_arg5.b or f34_arg5.blue or 1
		end
		if f34_arg6 then
			f34_local3 = f34_arg6
		end
		local f34_local4 = {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			height = f34_arg4.Height,
			font = f34_arg4.Font,
			red = f34_local0,
			green = f34_local1,
			blue = f34_local2,
			alpha = f34_local3,
			glowColor = nil
		}
		if f34_arg7 then
			f34_local4.alignment = f34_arg7
		end
		if f34_arg1 then
			if f34_arg1.top then
				f34_local4.top = f34_arg1.top
			end
			if f34_arg1.height then
				f34_local4.height = f34_arg1.height
			end
		end
		local self = LUI.UIText.new( f34_local4 )
		self.id = f34_arg0 or OperatorMenuUtil.GetNextItemIDString( "text" )
		self:setTextStyle( f34_arg3 )
		self:setText( f34_arg2 )
		self:animateToState( "default" )
		return self
	end
}
