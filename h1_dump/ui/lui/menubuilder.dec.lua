local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setUseStencil( true )
	return self
end

f0_local1 = function ( menu, controller )
	local self = LUI.UIElement.new( controller.defAnimState )
	local f2_local1 = nil
	if controller then
		f2_local1 = controller.compassType
	end
	self:setupMinimap( f2_local1 )
	return self
end

f0_local2 = function ( menu, controller )
	local self = LUI.UIElement.new( controller.defAnimState )
	local f3_local1 = nil
	if controller then
		f3_local1 = controller.compassType
	end
	self:setupMinimapIcons( f3_local1 )
	return self
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if not LUI.UIElement.setupCompass then
		return LUI.UIImage.new( f4_arg0, f4_arg1 )
	else
		local self = LUI.UIElement.new()
		self:setupCompass()
		return self
	end
end

local f0_local4 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setupUIBindText( controller.dataSource, controller.textFormat, controller.param1 or 0 )
	self:setClass( LUI.UIText )
	return self
end

local f0_local5 = function ( menu, controller )
	local self = LUI.UIImage.new()
	self:setupUIBindImage( controller.dataSource, controller.param1 or 0 )
	return self
end

local f0_local6 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( controller.dataSource, controller.param1 or 0 )
	return self
end

local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg2 and f8_arg2.textStyle then
		f8_arg0:setTextStyle( f8_arg2.textStyle )
	end
end

function buildOwnerDraw( menu, controller )
	local self = LUI.UIElement.new( controller.defAnimState )
	self:setupOwnerdraw( controller.ownerDraw, controller.ownerDrawTextScale, controller.ownerDrawTextStyle )
	return self
end

function buildTextEdit( menu, controller )
	local self = LUI.UIElement.new()
	self:setupTextEdit( controller.max_length, controller.password_field )
	return self
end

function buildContentServerImage( menu, controller )
	local self = LUI.UIElement.new( controller.defAnimState )
	self:setupContentServerImage()
	self.setFileId = function ( f12_arg0, f12_arg1, f12_arg2 )
		f12_arg0.m_fileId = f12_arg1 or ""
		f12_arg0.m_waitingForDownload = true
		f12_arg0.m_thumbName = f12_arg2 or ""
	end
	
	self:setFileId( controller.file_id, controller.thumbName )
	return self
end

function buildEntityContainer( menu, controller )
	local self = LUI.UIElement.new()
	local f13_local1 = -1
	local f13_local2 = 0
	local f13_local3 = 0
	local f13_local4 = 0
	if controller.entityNum then
		f13_local1 = controller.entityNum
	end
	if controller.offsetX then
		f13_local2 = controller.offsetX
	end
	if controller.offsetY then
		f13_local3 = controller.offsetY
	end
	if controller.offsetZ then
		f13_local4 = controller.offsetZ
	end
	if controller.tag then
		self:setupEntityContainer( f13_local1, f13_local2, f13_local3, f13_local4, controller.tag )
	else
		self:setupEntityContainer( f13_local1, f13_local2, f13_local3, f13_local4 )
	end
	if controller.clampToEdge then
		self:setEntityContainerClamp( true )
	end
	if controller.scaleWithDistance then
		self:setEntityContainerScale( true )
	end
	if controller.transferRotation then
		local f13_local5 = 0
		local f13_local6 = 0
		local f13_local7 = 0
		if controller.pitchOffset then
			f13_local5 = controller.pitchOffset
		end
		if controller.yawOffset then
			f13_local6 = controller.yawOffset
		end
		if controller.rollOffset then
			f13_local7 = controller.rollOffset
		end
		self:setEntityContainerTransferRotation( true, f13_local5, f13_local6, f13_local7 )
	end
	return self
end

m_types_build = {
	UIElement = LUI.UIElement.build,
	UIText = LUI.UIText.build,
	UIBindText = f0_local4,
	UIBindImage = f0_local5,
	UIIntWatch = f0_local6,
	UIImage = LUI.UIImage.build,
	UILitImage = LUI.UILitImage.build,
	UIButton = LUI.UIButton.build,
	UITimer = LUI.UITimer.build,
	UIStencil = f0_local0,
	UIVerticalList = LUI.UIVerticalList.build,
	UIVerticalScrollbar = LUI.UIVerticalScrollbar.build,
	UIHorizontalList = LUI.UIHorizontalList.build,
	UIGrid = LUI.UIGrid.build,
	UICountdown = LUI.UICountdown.build,
	UILongCountdown = LUI.UILongCountdown.build,
	UIBindButton = LUI.UIBindButton.build,
	UIBackgroundPanel = LUI.UIBackgroundPanel.build,
	UIScrollIndicator = LUI.UIScrollIndicator.build,
	UIBorder = LUI.UIBorder.build,
	UILine = LUI.UILine.build,
	UIProgressBar = LUI.UIProgressBar.build,
	UIMinimap = f0_local1,
	UIMinimapIcons = f0_local2,
	UICompass = f0_local3,
	UIOwnerdraw = buildOwnerDraw,
	UITextEdit = buildTextEdit,
	UIEntityContainer = buildEntityContainer,
	ContentServerImage = buildContentServerImage
}
m_types_postbuild = {
	UIText = LUI.UIText.postbuild,
	UICountdown = LUI.UICountdown.postbuild,
	UIBindText = f0_local7,
	UIButton = LUI.UIButton.postbuild,
	UIGenericButton = LUI.UIButton.postbuild
}
m_popups = {}
m_definitions = {}
m_debugData = {
	lastRequestedMenu = {},
	currentDef = {},
	definitionStack = {}
}
baseAssert = assert
local f0_local8 = function ( f14_arg0, f14_arg1 )
	m_debugData.currentDef = f14_arg0
	m_debugData.definitionStack[#m_debugData.definitionStack + 1] = {
		type = f14_arg0.type,
		id = f14_arg0.id,
		childNum = f14_arg1
	}
end

local f0_local9 = function ()
	m_debugData.definitionStack[#m_debugData.definitionStack] = nil
end

local f0_local10 = function ()
	for f16_local4, f16_local5 in ipairs( m_debugData.definitionStack ) do
		local f16_local3 = f16_local4 .. ") type: " .. f16_local5.type
		if f16_local5.id then
			f16_local3 = f16_local3 .. " id: " .. f16_local5.id
		end
		if f16_local5.childNum then
			f16_local3 = f16_local3 .. " childNum: " .. f16_local5.childNum
		end
		DebugPrint( f16_local3 )
	end
	DebugPrint( "Current itemDef: " )
	defPrint( m_debugData.currentDef )
end

local f0_local11 = function ( f17_arg0, f17_arg1, ... )
	if not f17_arg0 then
		if type( f17_arg1 ) == "string" then
			DebugPrint( "Error: " .. string.format( f17_arg1, ... ) )
		end
		DebugPrint( "Error Making Menu: " .. tostring( m_debugData.lastRequestedMenu[#m_debugData.lastRequestedMenu] ) )
		f0_local10()
		if type( f17_arg1 ) == "string" then
			baseAssert( f17_arg0, "Assert : " .. f17_arg1, ... )
		else
			baseAssert( f17_arg0, ... )
		end
	end
end

function defPrint( f18_arg0, f18_arg1 )
	if not f18_arg1 then
		f18_arg1 = 0
	end
	for f18_local4, f18_local5 in pairs( f18_arg0 ) do
		local f18_local6 = string.rep( "  ", f18_arg1 ) .. f18_local4 .. ": "
		if type( f18_local5 ) == "table" then
			DebugPrint( f18_local6 )
			defPrint( f18_local5, f18_arg1 + 1 )
		else
			DebugPrint( f18_local6 .. tostring( f18_local5 ) )
		end
		local f18_local3 = getmetatable( f18_arg0 )
		if f18_local3 and f18_local3.__index then
			DebugPrint( f18_local6 .. "__index" )
			defPrint( f18_local3.__index, f18_arg1 + 1 )
		end
	end
end

assert = f0_local11
function registerDef( f19_arg0, f19_arg1 )
	assert( m_definitions[f19_arg0] == nil, "This type has already been registered! " .. f19_arg0 )
	assert( m_types_build[f19_arg0] == nil, "This type is a basic element type that has been registered! " .. f19_arg0 )
	assert( type( f19_arg1 ) == "function", "Attempting to register old style type definition!  See wiki for info on how to update your def.  def = " .. f19_arg0 )
	m_definitions[f19_arg0] = f19_arg1
end

function registerPopupDef( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
	assert( m_popups[f20_arg0] == nil, "This popup has already been registered! " .. f20_arg0 )
	m_popups[f20_arg0] = {
		priority = f20_arg2 or LUI.UIRoot.childPriorities.modal,
		immediateProcessing = not f20_arg3
	}
	registerDef( f20_arg0, f20_arg1 )
end

function registerType( f21_arg0, f21_arg1 )
	assert( m_definitions[f21_arg0] == nil, "This type has already been registered! " .. f21_arg0 )
	assert( m_types_build[f21_arg0] == nil, "This type is a basic element type that has been registered! " .. f21_arg0 )
	assert( type( f21_arg1 ) == "function", "The buildFunction for this type is not a function!  typeName = " .. f21_arg0 )
	m_types_build[f21_arg0] = f21_arg1
end

function registerPopupType( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
	assert( m_popups[f22_arg0] == nil, "This popup has already been registered! " .. f22_arg0 )
	m_popups[f22_arg0] = {
		priority = f22_arg2 or LUI.UIRoot.childPriorities.modal,
		immediateProcessing = not f22_arg3
	}
	registerType( f22_arg0, f22_arg1 )
end

function getPopupData( f23_arg0 )
	return m_popups[f23_arg0]
end

g_keyWordList = hashset( {
	"properties",
	"children",
	"childrenFeeder",
	"states",
	"id",
	"type",
	"handlers"
} )
function validateName( f24_arg0 )
	if g_keyWordList[f24_arg0] then
		assert( false, "It appears that you are using the keyword '" .. f24_arg0 .. "' as a member name, are you sure this is set up correctly?" )
	end
end

function prepareStates( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
	if f25_arg1.states then
		assert( f25_arg1.states.default, "No default state provided for element definition" )
		for f25_local3, f25_local4 in pairs( f25_arg1.states ) do
			validateName( f25_local3 )
			f25_local4 = LUI.UIElement.buildState( f25_local4, f25_arg1, f25_arg2 )
			if f25_arg1.debug or f25_arg2 and f25_arg2.debug then
				DebugPrint( "Printing out formatted state:" )
				defPrint( builtState )
			end
			f25_arg0:registerAnimationState( f25_local3, f25_local4 )
			if not (f25_local3 ~= "default" or f25_arg3 and f25_arg4) or f25_local4.animateOnRefresh then
				f25_arg0:animateToStateInC( f25_local3 )
			end
		end
	end
end

function buildChildren( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	assert( not f26_arg2.type, "It appears that the children list is not a list but instead is a single element definition." )
	for f26_local3, f26_local4 in ipairs( f26_arg2 ) do
		local f26_local5 = buildItems( f26_local4, f26_arg1, f26_arg0, f26_local3, f26_arg3 )
		f26_local5:close()
		f26_arg0:addElement( f26_local5 )
	end
	f26_arg0:processEvent( {
		name = "update_navigation"
	} )
end

local f0_local12 = function ( f27_arg0, f27_arg1 )
	if type( f27_arg0 ) == "table" and f27_arg0.isProperty then
		return f27_arg0.func( f27_arg1 )
	else
		return f27_arg0
	end
end

function buildItems( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4 )
	assert( f28_arg0.type, "No type in itemDef!" )
	f0_local8( f28_arg0, f28_arg3 )
	Memory.CheckLow()
	local f28_local0 = f28_arg4 or f28_arg0.disabled
	if m_definitions[f28_arg0.type] then
		local f28_local1 = nil
		if type( m_definitions[f28_arg0.type] ) == "function" then
			f28_local1 = m_definitions[f28_arg0.type]()
		else
			f28_local1 = m_definitions[f28_arg0.type]
		end
		f28_arg0.type = nil
		if not f28_local1.properties then
			f28_local1.properties = {}
		end
		if f28_arg0.properties and f28_local1.properties then
			for f28_local5, f28_local6 in pairs( f28_arg0.properties ) do
				validateName( f28_local5 )
				f28_local1.properties[f28_local5] = f28_local6
			end
			f28_arg0.properties = nil
		end
		for f28_local5, f28_local6 in pairs( f28_arg0 ) do
			f28_local1[f28_local5] = f28_local6
		end
		f28_local2 = buildItems( f28_local1, f28_arg1, f28_arg2, f28_local0 )
		if f28_local2 and f28_local2.properties then
			f28_local2.m_ownerController = f28_local2.properties.exclusiveController
		end
		f0_local9()
		return f28_local2
	else
		assert( m_types_build[f28_arg0.type], "Unknown type for element definition: " .. f28_arg0.type )
		local f28_local1 = f28_arg0.properties or f28_arg1
		if f28_local1 then
			for f28_local5, f28_local6 in pairs( f28_local1 ) do
				validateName( f28_local5 )
				if type( f28_local6 ) == "table" and f28_local6.isProperty then
					f28_local1[f28_local5] = f28_local6.func( f28_arg1 )
				end
			end
		end
		local f28_local2 = nil
		local f28_local3 = true
		if f28_arg2 and f28_arg0.id then
			f28_local2 = f28_arg2:getChildById( f28_arg0.id )
		end
		if not f28_local2 then
			f28_local3 = false
			f28_local2 = m_types_build[f28_arg0.type]( f28_arg0, f28_local1, f28_arg3 )
			assert( f28_local2, "registerType " .. f28_arg0.type .. " must return a UI Element." )
		end
		f28_local2._marked = true
		f28_local2._fromMenuBuilder = true
		f28_local2._isRefresh = f28_local3
		if f28_arg1 and f28_arg1.exclusiveController and not f28_local1.exclusiveController then
			f28_local1.exclusiveController = f28_arg1.exclusiveController
		end
		if f28_local1 then
			f28_local2.m_ownerController = f28_local1.exclusiveController
		end
		if not (not f28_local1 or not f28_local1.debug) or f28_arg0.debug then
			DebugPrint( "Printing out item Props:" )
			defPrint( f28_local1 )
			DebugPrint( "Printing out item Def:" )
			defPrint( f28_arg0 )
			f28_local1.debug = nil
			f28_arg0.debug = nil
		end
		if f28_arg0.focusable == true or f28_arg0.focusable == nil and f28_local2.focusable then
			f28_local2:makeFocusable()
		elseif f28_arg0.focusable == false then
			f28_local2:makeNotFocusable()
		end
		if f28_arg0.handleMouseMove == false then
			f28_local2:setHandleMouseMove( false )
		end
		if f28_arg0.handleMouseButton == false then
			f28_local2:setHandleMouseButton( false )
		end
		if f28_arg0.ignoreMouseFocus then
			f28_local2:makeFocusable()
			f28_local2.m_ignoreMouseFocus = true
		end
		if f28_arg0.useGameTime ~= nil then
			f28_local2:setUseGameTime( f28_arg0.useGameTime )
		end
		f28_local2.m_outsideParentList = f28_local2.m_outsideParentList or false
		f28_local2.m_requireFocusType = f28_arg0.requireFocusType
		if f28_arg0.childrenFeeder then
			local f28_local4 = f28_arg0.childrenFeeder
			if type( f28_local4 ) == "table" and f28_local4.isProperty then
				f28_local4 = f28_arg0.childrenFeeder.func( f28_local1 )
			end
			assert( type( f28_local4 ) == "function", "Feeders must be a function or referenced by the MBh.Property helper" )
			f28_arg0.children = f28_local4( f28_local1 )
			f28_local2.childrenFeeder = f28_local4
			f28_local2:registerEventHandler( "menu_refresh", HandleMenuRefresh )
		end
		if f28_arg0.children then
			for f28_local7, f28_local8 in ipairs( f28_arg0.children ) do
				if f28_local8.disabledFunc then
					f28_local2:registerEventHandler( "menu_refresh", HandleMenuRefresh )
					f28_local2.children = f28_arg0.children
					break
				end
			end
		end
		if f28_arg0.id then
			f28_local2.id = f28_arg0.id
		end
		if f28_arg0.listDefaultFocus then
			f28_local2.listDefaultFocus = true
		end
		assert( not f28_arg0.additionalHandlers, "The additional_handlers must be specified inside the 'properties' tables, not in the main definition" )
		prepareStates( f28_local2, f28_arg0, f28_local1, f28_local3, f28_local0 )
		if f28_arg0.handlers then
			for f28_local7, f28_local8 in pairs( f28_arg0.handlers ) do
				if f28_local7 == "omnvar_update" then
					assert( type( f28_local8 ) == "table", "omnvar_update should be a table of handlers for specific omnvars" )
					local f28_local9 = f28_local2:getRootParent()
					f28_local9 = f28_local9.eventCatcher
					for f28_local13, f28_local14 in pairs( f28_local8 ) do
						f28_local9:registerOmnvarHandler( f28_local2, f28_local13, f0_local12( f28_local14, f28_local1 ) )
					end
				end
				if f28_local7 == "dvar_update" then
					assert( type( f28_local8 ) == "table", "dvar_update should be a table of handlers for specific dvars" )
					local f28_local9 = f28_local2:getRootParent()
					f28_local9 = f28_local9.eventCatcher
					for f28_local13, f28_local14 in pairs( f28_local8 ) do
						f28_local9:registerDvarHandler( f28_local2, f28_local13, f0_local12( f28_local14, f28_local1 ) )
					end
				end
				f28_local2:registerEventHandler( f28_local7, f0_local12( f28_local8, f28_local1 ) )
			end
		else
			f28_arg0.handlers = {}
		end
		if f28_local1 and f28_local1.additional_handlers then
			assert( not f28_local1.additional_handlers.omnvar_update, "Omnvar_update events don't support being an 'additional_handler'" )
			assert( not f28_local1.additional_handlers.dvar_update, "Dvar_update events don't support being an 'additional_handler'" )
			for f28_local7, f28_local8 in pairs( f28_local1.additional_handlers ) do
				if not (not f28_local3 or not f28_arg0.handlers[f28_local7]) or not f28_local3 then
					f28_local2:addEventHandler( f28_local7, f28_local8 )
				end
			end
			f28_local1.additional_handlers = nil
		end
		f28_local2.properties = f28_local1
		if f28_arg0.children then
			buildChildren( f28_local2, f28_local1, f28_arg0.children, f28_local0 )
		end
		if f28_local2.disabledStateChange then
			if f28_local2.disabled then
				f28_local2:processEvent( {
					name = "disable"
				} )
			else
				f28_local2:processEvent( {
					name = "enable"
				} )
			end
		end
		if f28_local2.locked then
			f28_local2:processEvent( {
				name = "lock"
			} )
		end
		if f28_arg0.isSignInMenu then
			f28_local2.isSignInMenu = f28_arg0.isSignInMenu
		end
		if m_types_postbuild[f28_arg0.type] ~= nil then
			m_types_postbuild[f28_arg0.type]( f28_local2, f28_arg0, f28_local1 )
		end
		f0_local9()
		return f28_local2
	end
end

function buildMenu( f29_arg0, f29_arg1 )
	m_debugData.lastRequestedMenu[#m_debugData.lastRequestedMenu + 1] = f29_arg0
	m_debugData.definitionStack = {}
	if not f29_arg1 then
		f29_arg1 = {}
	end
	local f29_local0 = buildItems( {
		type = f29_arg0,
		properties = f29_arg1
	}, {}, nil )
	m_debugData.lastRequestedMenu[#m_debugData.lastRequestedMenu] = nil
	return f29_local0
end

function unmarkChildren( f30_arg0 )
	local f30_local0 = f30_arg0:getFirstChild()
	while f30_local0 ~= nil do
		local f30_local1 = f30_local0:getNextSibling()
		f30_local0._marked = false
		unmarkChildren( f30_local0 )
		f30_local0 = f30_local1
	end
end

function closeUnmarkedChildren( f31_arg0 )
	local f31_local0 = f31_arg0:getFirstChild()
	while f31_local0 ~= nil do
		local f31_local1 = f31_local0:getNextSibling()
		if f31_local0._fromMenuBuilder and not f31_local0._marked then
			f31_local0:close()
		else
			closeUnmarkedChildren( f31_local0 )
		end
		f31_local0 = f31_local1
	end
end

function HandleMenuRefresh( f32_arg0, f32_arg1 )
	m_debugData.lastRequestedMenu[#m_debugData.lastRequestedMenu + 1] = f32_arg0.builtByNewBuilder
	unmarkChildren( f32_arg0 )
	local f32_local0 = f32_arg0.children
	if f32_arg0.childrenFeeder then
		f32_local0 = f32_arg0.childrenFeeder( f32_arg0.properties )
	end
	local f32_local1 = f32_arg0:getAllFocusedChildren()
	if #f32_local1 > 0 then
		f32_arg0:saveState()
	end
	m_debugData.definitionStack = {}
	buildChildren( f32_arg0, f32_arg0.properties, f32_local0 )
	closeUnmarkedChildren( f32_arg0 )
	if #f32_local1 > 0 then
		local f32_local2, f32_local3 = f32_arg0:restoreState( true )
		if f32_local3 == 0 then
			f32_arg0:clearSavedState()
			f32_arg0:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	f32_arg0:processEvent( {
		name = "element_refresh",
		dispatchChildren = true
	} )
	m_debugData.lastRequestedMenu[#m_debugData.lastRequestedMenu] = nil
end

function BuildAddChild( f33_arg0, f33_arg1 )
	local f33_local0 = nil
	if type( f33_arg1 ) == "table" then
		f33_local0 = buildItems( f33_arg1, f33_arg0.properties or {}, f33_arg0 )
	else
		f33_local0 = f33_arg1
	end
	f33_arg0:addElement( f33_local0 )
	return f33_local0
end

function BuildRegisteredType( f34_arg0, f34_arg1 )
	assert( type( f34_arg0 ) == "string" )
	assert( m_types_build[f34_arg0], "Could not find a constructor for " .. f34_arg0 .. "." .. (m_definitions[f34_arg0] and " Use 'LUI.MenuBuilder.BuildAddChild' to build elements registered using the deprecated MenuBuilder" or "") )
	return m_types_build[f34_arg0]( nil, f34_arg1 )
end

LockTable( _M )
