ListPaging = {}
local f0_local0 = {
	AnimTime = 150
}
local f0_local1 = function ( f1_arg0 )
	f1_arg0.pagingData = {
		TopRow = 0,
		PageRows = 0,
		PageCols = 0,
		TotalRows = 0,
		OrigListTop = 0,
		Stride = 0,
		TotalItems = 0,
		TotalFocusableItems = 0,
		UseVisualFocused = false,
		IsVirtualized = false
	}
end

local f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f2_arg0:dispatchEventToRoot( {
		name = LUI.UIScrollIndicator.UpdateEvent,
		currentFocusIndex = getCurrentFocusableIndex( f2_arg0, f2_arg1, f2_arg2, f2_arg3 ),
		totalItemCount = f2_arg0.pagingData.UseVisualFocused and f2_arg0.pagingData.TotalItems or f2_arg0.pagingData.TotalFocusableItems,
		canScrollUp = f2_arg0.pagingData.TopRow > 1,
		canScrollDown = math.min( f2_arg0.pagingData.TotalItems, (f2_arg0.pagingData.TopRow + f2_arg0.pagingData.PageRows - 1) * f2_arg0.pagingData.PageCols ) < f2_arg0.pagingData.TotalItems
	} )
	if f2_arg0.listPagerScrollBar then
		f2_arg0.listPagerScrollBar:manualUpdate( f2_arg0.pagingData.TopRow - 1, f2_arg0.pagingData.PageRows, f2_arg0.pagingData.TotalRows, f2_arg0.pagingData.Stride )
	end
end

local f0_local3 = function ( f3_arg0 )
	if f3_arg0.streamingData == nil then
		return 
	end
	local f3_local0 = f3_arg0.pagingData
	if f3_arg0.streamTopRow ~= nil and f3_arg0.streamTopRow == f3_local0.TopRow then
		return 
	end
	f3_arg0.streamTopRow = f3_local0.TopRow
	local f3_local1 = f3_arg0.streamingCount
	local f3_local2 = f3_local1
	local f3_local3 = f3_local0.TopRow
	local f3_local4 = math.min( f3_local3 + math.min( f3_local0.PageRows, math.floor( f3_local2 / f3_local0.PageCols ) ), f3_local0.TotalRows )
	local f3_local5 = f3_local0.PageCols * (f3_local4 - f3_local3 + 1)
	local f3_local6 = true
	f3_local2 = f3_local2 - f3_local5
	local f3_local7 = 0
	while f3_local2 > 0 do
		local f3_local8 = f3_local4 < f3_local0.TotalRows
		local f3_local9 = f3_local3 > 1
		if f3_local8 == false and f3_local9 == false then
			break
		elseif f3_local6 and f3_local8 == false then
			f3_local6 = false
		end
		if f3_local6 == false and f3_local9 == false then
			f3_local6 = true
		end
		f3_local2 = f3_local2 - f3_local0.PageCols
		if f3_local2 <= 0 then
			if f3_local6 then
				f3_local7 = f3_local4 + 1
			else
				f3_local7 = f3_local3 - 1
			end
		end
		if f3_local6 then
			f3_local4 = f3_local4 + 1
		else
			f3_local3 = f3_local3 - 1
		end
		f3_local6 = f3_local6 == false
	end
	local f3_local8 = f3_arg0.streamingData
	f3_local2 = f3_local1
	for f3_local9 = f3_local3, f3_local4, 1 do
		for f3_local12 = 1, f3_local0.PageCols, 1 do
			f3_local2 = f3_local2 - 1
			if f3_local2 <= 0 then
				
			end
			local f3_local15 = (f3_local9 - 1) * f3_local0.PageCols + f3_local12
			if f3_local8[f3_local15] ~= nil then
				Engine.CacheMaterial( f3_local8[f3_local15] )
			end
		end
	end
	if f3_local7 ~= 0 then
		for f3_local9 = 1, f3_local0.PageCols, 1 do
			f3_local2 = f3_local2 - 1
			if f3_local2 <= 0 then
				break
			end
			local f3_local12 = f3_local0.PageCols * f3_local7 + f3_local9
			if f3_local8[f3_local12] ~= nil then
				Engine.CacheMaterial( f3_local8[f3_local12] )
			end
		end
	end
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	if f4_arg0.pagingItemData then
		f4_local0 = f4_arg0.pagingItemData
	else
		assert( f4_arg0.currentListData, "The virtualized element must have the entry 'currentListData'" )
		f4_local0 = f4_arg0.currentListData.pagingItemData
	end
	if f4_local0 then
		local f4_local1 = f4_local0.listRoot
		if f4_arg1.focusType ~= FocusType.MouseOver then
			local f4_local2 = math.max( 1, math.min( f4_local0.pagerRow - math.floor( (f4_local1.pagingData.PageRows - 1) / 2 ), f4_local1.pagingData.TotalRows - f4_local1.pagingData.PageRows + 1 ) )
			if f4_local2 ~= f4_local1.pagingData.TopRow then
				local f4_local3 = f4_arg1.duration
				if not f4_local3 then
					f4_local3 = f0_local0.AnimTime
				end
				local f4_local4 = f4_local2 + f4_local1.pagingData.PageRows - 1
				local f4_local5 = f4_local0.vlist
				local f4_local6 = 0
				local f4_local7 = f4_local5:getFirstChild()
				while f4_local7 ~= nil do
					f4_local6 = f4_local6 + 1
					local f4_local8 = 1
					if f4_local6 < f4_local2 or f4_local4 < f4_local6 then
						f4_local8 = 0
					end
					f4_local7:registerAnimationState( "page_alpha", {
						alpha = f4_local8
					} )
					f4_local7:animateToState( "page_alpha", f4_local3 )
					f4_local7.m_focusLockedByScrolling = f4_local8 == 0
					f4_local7 = f4_local7:getNextSibling()
				end
				f4_local1.pagingData.TopRow = f4_local2
				f4_local1:registerAnimationState( "page_move", {
					topAnchor = true,
					bottomAnchor = false,
					top = f4_local1.pagingData.OrigListTop + -f4_local1.pagingData.Stride * (f4_local2 - 1)
				} )
				f4_local1:animateToState( "page_move", f4_local3, false, false )
			end
		end
		f0_local3( f4_local1 )
		f0_local2( f4_local1, f4_local0.vlist, f4_local0.pagerRow, f4_local0.pagerCol )
	end
end

function getCurrentFocusableIndex( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = 0
	local f5_local1 = (f5_arg2 - 1) * f5_arg0.pagingData.PageCols + f5_arg3
	local f5_local2 = f5_arg0 ~= f5_arg1
	local f5_local3 = f5_arg1:getFirstChild()
	local f5_local4 = 0
	if f5_arg0.pagingData.IsVirtualized and f5_local3 then
		local f5_local5 = f5_local3
		if f5_local2 then
			f5_local5 = f5_local3:getFirstChild()
		end
		if f5_local5 and f5_local5.currentListData and f5_local5.currentListData.pagingItemData then
			f5_local4 = f5_local5.currentListData.pagingItemData.index - 1
			while f5_local3 ~= nil do
				local f5_local5 = f5_local3
				if f5_local2 then
					f5_local5 = f5_local5:getFirstChild()
					while f5_local5 ~= nil do
						f5_local4 = f5_local4 + 1
						if f5_local1 < f5_local4 then
							break
						end
						if f5_local5.m_focusable or f5_arg0.pagingData.UseVisualFocused then
						
						elseif f5_local2 then
							f5_local5 = f5_local5:getNextSibling()
						end
						if f5_arg0.pagingData.IsVirtualized then
							if f5_local5.currentListData and f5_local5.currentListData.pagingItemData then
								f5_local0 = f5_local5.currentListData.pagingItemData.index
							end
							elseif f5_local2 then
								f5_local5 = f5_local5:getNextSibling()
						end
						f5_local0 = f5_local0 + 1
					end
					if f5_local1 < f5_local4 then
						
					end
					f5_local3 = f5_local3:getNextSibling()
				end
			end
			return math.max( 1, f5_local0 )
		end
	end
end

ListPaging.BaseInit = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6, f6_arg7 )
	f6_arg0.pagingData.TopRow = 1
	f6_arg0.pagingData.PageRows = f6_arg2
	f6_arg0.pagingData.TotalRows = 0
	f6_arg0.pagingData.TotalItems = 0
	f6_arg0.pagingData.TotalFocusableItems = 0
	f6_arg0.pagingData.UseVisualFocused = f6_arg4
	local f6_local0, f6_local1, f6_local2, f6_local3 = f6_arg0:getLocalRect()
	f6_arg0.pagingData.OrigListTop = f6_local1
	local f6_local4 = true
	f6_arg0.pagingData.Stride = 0
	local f6_local5 = 0
	if f6_arg1.properties == nil then
		f6_arg1.properties = {}
	end
	f6_arg1.properties.autoScrollTime = f0_local0.AnimTime
	local f6_local6 = f6_arg0 ~= f6_arg1
	local f6_local7 = f6_arg1:getFirstChild()
	local f6_local8 = 0
	while f6_local7 ~= nil do
		f6_local8 = f6_local8 + 1
		f6_arg0.pagingData.TotalRows = math.max( f6_arg0.pagingData.TotalRows, f6_local8 )
		local f6_local9 = true
		if f6_arg2 < f6_local8 then
			f6_local7:registerAnimationState( "page_hidden", {
				alpha = 0
			} )
			f6_local7:animateToState( "page_hidden", 0 )
			f6_local9 = false
		end
		f6_local7.m_focusLockedByScrolling = not f6_local9
		local f6_local10 = f6_local7
		if f6_local6 then
			f6_local10 = f6_local10:getFirstChild()
		end
		local f6_local11 = 0
		while f6_local10 ~= nil do
			f6_local11 = f6_local11 + 1
			local self = "gain_focus"
			if f6_arg4 then
				self = "visual_focused"
			end
			f6_local10:addEventHandler( self, f0_local4 )
			if f6_local4 then
				f6_local4 = false
				local f6_local13, f6_local14, f6_local15, f6_local16 = f6_local10:getLocalRect()
				local f6_local17 = f6_arg1:getAnimationStateInC( f6_arg1:getAnimationStateName() )
				local f6_local18 = f6_arg0.pagingData
				local f6_local19 = f6_local17.spacing
				if not f6_local19 then
					f6_local19 = 0
				end
				f6_local18.Stride = f6_local16 + f6_local19
				f6_local18 = f6_local15 - f6_local13
				if f6_local18 == 0 then
					f6_local18 = f6_local17.right - f6_local17.left
				end
				f6_local5 = f6_local18 * f6_arg0.pagingData.PageCols
				if f6_arg0.hSpacing then
					f6_local5 = f6_local5 + f6_arg0.hSpacing * (f6_arg0.pagingData.PageCols - 1)
				end
			end
			if not f6_arg0.pagingData.IsVirtualized then
			
			elseif f6_local6 then
				f6_local10 = f6_local10:getNextSibling()
			end
			f6_local10.pagingItemData = {
				pagerRow = f6_local8,
				pagerCol = f6_local11,
				vlist = f6_arg1,
				listRoot = f6_arg0
			}
			if f6_local10.m_focusable then
				f6_arg0.pagingData.TotalFocusableItems = f6_arg0.pagingData.TotalFocusableItems + 1
			end
			f6_arg0.pagingData.TotalItems = f6_arg0.pagingData.TotalItems + 1
		end
		f6_arg0.listHeight = f6_arg0.pagingData.Stride * math.min( f6_arg0.pagingData.TotalRows, f6_arg0.pagingData.PageRows )
		f6_local7 = f6_local7:getNextSibling()
	end
	if not f6_arg6 then
		f6_arg6 = {}
	end
	if f6_arg6.enabled == nil then
		f6_arg6.enabled = true
	end
	if f6_arg6.enabled == true then
		if not f6_arg6 then
			f6_arg6 = {}
		end
		local f6_local9 = f6_arg6.containerWidth
		if not f6_local9 then
			f6_local9 = f6_local5
		end
		f6_arg6.containerWidth = f6_local9
		f6_local9 = f6_arg6.containerHeight
		if not f6_local9 then
			f6_local9 = 32
		end
		f6_arg6.containerHeight = f6_local9
		f6_local9 = f6_local1 + f6_arg0.pagingData.Stride * f6_arg2 - 8
		if f6_arg3 ~= nil then
			f6_local9 = f6_local9 + f6_arg3
		end
		local f6_local10 = f6_local0
		if f6_arg6.left_offset then
			f6_local10 = f6_local10 + f6_arg6.left_offset
		end
		if f6_arg6.center then
			f6_local10 = f6_local10 + f6_arg6.containerWidth / 4
		end
		local f6_local11 = nil
		if not f6_arg5 then
			f6_local11 = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				top = f6_local9,
				left = f6_local10,
				width = f6_arg6.containerWidth,
				height = f6_arg6.containerHeight
			}
		elseif f6_arg6 then
			f6_local11 = f6_arg6.scrollState
		end
		if f6_arg0.listPagerScrollIndicator ~= nil then
			f6_arg0.listPagerScrollIndicator:close()
		end
		f6_arg6.listRoot = f6_arg0
		local self = LUI.UIScrollIndicator.new( f6_local11, f6_arg6 )
		if not f6_arg5 then
			f6_arg5 = f6_arg0:getParent()
		end
		f6_arg5:addElement( self )
		f6_arg0.listPagerScrollIndicator = self
	end
	if f6_arg7 then
		if f6_arg0.pagingData.TotalItems <= f6_arg0.pagingData.PageCols * f6_arg0.pagingData.PageRows then
			f6_arg7:close()
		else
			f6_arg0.listPagerScrollBar = f6_arg7
		end
	end
	f0_local2( f6_arg0, f6_arg1, 1, 1 )
end

ListPaging.InitGrid = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6 )
	f0_local1( f7_arg0 )
	f7_arg0.pagingData.IsVirtualized = false
	f7_arg0.pagingData.PageCols = f7_arg0.width
	ListPaging.BaseInit( f7_arg0, f7_arg0.vlist, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6 )
end

ListPaging.InitList = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7 )
	f0_local1( f8_arg0 )
	f8_arg0.pagingData.IsVirtualized = false
	f8_arg0.pagingData.PageCols = 1
	if f8_arg7 then
		local f8_local0 = f8_arg0:getAnimationStateInC( "default" )
		local f8_local1, f8_local2, f8_local3, f8_local4 = f8_arg0:getLocalRect()
		local f8_local5 = f8_local3 - f8_local1
		local f8_local6 = f8_arg0:getFirstChild()
		local f8_local6, f8_local7, f8_local8, f8_local9 = f8_local6:getLocalRect()
		local f8_local10 = f8_local9 - f8_local7
		local f8_local11 = f8_arg1
		local f8_local12 = f8_local10 * f8_local11 + f8_local0.spacing * (f8_local11 - 1)
		local f8_local13 = f8_arg0:getParent()
		if not f8_arg0.pagingMask then
			f8_arg0.pagingMask = LUI.UIElement.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				left = f8_local1,
				top = f8_local2,
				width = f8_local5,
				height = f8_local12
			} )
			f8_arg0.pagingMask:setUseStencil( true )
			f8_arg0.pagingMask.id = "list_mask_id"
			f8_arg0.pagingMask.listTop = f8_local2
			f8_arg0.pagingMask.listBot = f8_local2 + f8_local12
			f8_local13:removeElement( f8_arg0 )
			f8_arg0.pagingMask:addElement( f8_arg0 )
			f8_local13:addElement( f8_arg0.pagingMask )
		else
			f8_local13 = f8_arg0.pagingMask:getParent()
			f8_local1, f8_local2, f8_local3, f8_local4 = f8_arg0.pagingMask:getLocalRect()
		end
		f8_local0.left = 0
		f8_local0.top = 0
		f8_local0.right = f8_local5
		f8_local0.bottom = f8_local12
		f8_arg0:registerAnimationState( "default", f8_local0 )
		f8_arg0:animateToState( "default" )
		f8_arg4 = f8_local13
		f8_arg5.scrollState = {
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			left = f8_local1 + f8_local5 / 4,
			top = f8_local2 + f8_local12 + (f8_arg2 or 0),
			width = f8_local5,
			height = f8_arg5.containerHeight or 32
		}
	end
	ListPaging.BaseInit( f8_arg0, f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6 )
end

ListPaging.InitVirtualizedList = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5, f9_arg6 )
	f9_arg0:registerEventHandler( "virtualized_list_populated", function ( element, event )
		if event.ListData then
			f0_local1( element )
			element.pagingData.IsVirtualized = true
			element.pagingData.PageCols = 1
			if not element.listPagerScrollIndicator then
				ListPaging.BaseInit( element, element, f9_arg1, f9_arg2, f9_arg3, f9_arg4, f9_arg5, f9_arg6 )
			end
			element.pagingData.TotalItems = #event.ListData
			element.pagingData.TotalFocusableItems = element.pagingData.TotalItems
			for f10_local0 = 1, element.pagingData.TotalItems, 1 do
				event.ListData[f10_local0].pagingItemData = {
					index = f10_local0,
					pagerRow = f10_local0,
					pagerCol = 1,
					vlist = element,
					listRoot = element
				}
			end
			f0_local2( element, element, event.focusedRow or 1, event.focusedCol or 1 )
		end
	end )
end

ListPaging.InitStreaming = function ( f11_arg0, f11_arg1, f11_arg2 )
	f11_arg0.streamingData = f11_arg1
	f11_arg0.streamingCount = f11_arg2
end

ListPaging.Reset = function ( f12_arg0 )
	if f12_arg0.pagingData ~= nil then
		if f12_arg0.pagingMask ~= nil then
			f12_arg0:setTopBottom( true, false, f12_arg0.pagingMask.listTop, f12_arg0.pagingMask.listBot )
		else
			f12_arg0:setTopBottom( true, false, f12_arg0.pagingData.OrigListTop, f12_arg0.pagingData.OrigListTop + f12_arg0.listHeight )
		end
		f12_arg0:animateToState( "default" )
	end
end

