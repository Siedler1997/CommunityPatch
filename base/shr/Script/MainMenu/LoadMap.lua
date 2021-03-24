----------------------------------------------------------------------------------------------------
-- Init table
LoadMap = {}

----------------------------------------------------------------------------------------------------
-- Sort maps

function LoadMap.Sort(_left,_right)
	local stringLeft
	local stringRight

	if _left.MapNameString ~= nil and _left.MapNameString ~= "" then
		stringLeft = string.lower(_left.MapNameString)
	else
		stringLeft = string.lower(_left.Name)
	end
	if _right.MapNameString ~= nil and _right.MapNameString ~= "" then
		stringRight = string.lower(_right.MapNameString)
	else
		stringRight = string.lower(_right.Name)
	end
	
	return LoadMap_MinimizeName(stringLeft) < LoadMap_MinimizeName(stringRight)
end

----------------------------------------------------------------------------------------------------
-- Load maps, sort and copy to list
function LoadMap.LoadMapsSortAndAddToMainList(_MapType)
		
	local MPTable = {}
	MapListHandler_Init(MPTable)
	
	MapListHandler_AddMaps( MPTable, _MapType )		-- Add maps of type

	table.sort(MPTable.MapArray, LoadMap.Sort)

	-- copy to maps
	LoadMap.MapTable.NumberOfMaps = LoadMap.MapTable.NumberOfMaps + MPTable.NumberOfMaps

	local i
	for i = 1, MPTable.NumberOfMaps do
	
		table.insert( LoadMap.MapTable.MapArray, MPTable.MapArray[i] )
	
	end
	
end
----------------------------------------------------------------------------------------------------
-- Init load map data

function LoadMap.Init()
		
	-- Init map table
	do
		LoadMap.MapTable = nil
		LoadMap.MapTable = {}								-- Create table
		MapListHandler_Init( LoadMap.MapTable )				-- Init table
--		MapListHandler_AddMaps( LoadMap.MapTable, -1, "Main" )	-- Add campaign maps
		MapListHandler_AddMaps( LoadMap.MapTable, 0 )		-- Add single player maps
		MapListHandler_AddMaps( LoadMap.MapTable, 1 )		-- Add user maps
		MapListHandler_AddMaps( LoadMap.MapTable, 3, nil, false )-- Add external maps SP Maps

		table.sort(LoadMap.MapTable.MapArray, LoadMap.Sort)

		local MPTable = {}
		MapListHandler_Init(MPTable)
		
		MapListHandler_AddMaps( MPTable, 3, nil, true )-- Add external maps MP Maps
		MapListHandler_AddMaps( MPTable, 2, nil, true)-- Add multi player maps    
	
		table.sort(MPTable.MapArray, LoadMap.Sort)
	
		-- copy to maps
		LoadMap.MapTable.NumberOfMaps = LoadMap.MapTable.NumberOfMaps + MPTable.NumberOfMaps
	
		local i
		for i = 1, MPTable.NumberOfMaps do
		
			table.insert( LoadMap.MapTable.MapArray, MPTable.MapArray[i] )
		
		end

	end

	-- Init list box
	do
		LoadMap.ListBox = nil
		LoadMap.ListBox = {}	
		LoadMap.ListBox.ElementsShown = 6								-- Elements in list box
		LoadMap.ListBox.ElementsInList = LoadMap.MapTable.NumberOfMaps	-- Elements in list
		LoadMap.ListBox.CurrentTopIndex = 0								-- Current top index
		LoadMap.ListBox.CurrentSelectedIndex = 0						-- Current selected index
	
		-- Set start index to current map	
		local MapIndex = MapListHandler_GetMapIndex( LoadMap.MapTable, Framework.GetCurrentMapName() )
		ListBoxHandler_SetSelected( LoadMap.ListBox, MapIndex )
		ListBoxHandler_CenterOnSelected( LoadMap.ListBox )
		
		-- Update map preview
		LoadMap.UpdateMapPreview()
		
		-- Update map description
		LoadMap.UpdateMapDescription()
		LoadMap.UpdateMapTitle()
	end
	
	-- Init slider value
	LoadMap_UpdateSliderValue()
	
end



----------------------------------------------------------------------------------------------------
-- Load Game done, close dialog and load game

function LoadMap.Done()
	
	local MapIndex = LoadMap.ListBox.CurrentSelectedIndex
	local Name = LoadMap.MapTable.MapArray[ MapIndex+1 ].Name
	if Name ~= nil then

		-- Start game		
		local MapType = LoadMap.MapTable.MapArray[ MapIndex+1 ].Type
		local CampaignIndex = LoadMap.MapTable.MapArray[ MapIndex+1 ].CampaignIndex
		Framework.StartMap( Name, MapType, CampaignIndex )
		LoadScreen_Init( 0, Name, MapType, CampaignIndex )
	
	end	
	
end



----------------------------------------------------------------------------------------------------
-- Map name was clicked

function LoadMap.OnMapName( _Index ) 
	local MapIndex = LoadMap.ListBox.CurrentTopIndex + _Index
	if MapIndex >= 0 and MapIndex < LoadMap.ListBox.ElementsInList then
		ListBoxHandler_SetSelected( LoadMap.ListBox, MapIndex )
		LoadMap.UpdateMapPreview()
		LoadMap.UpdateMapDescription()
		LoadMap.UpdateMapTitle()
	end
end

----------------------------------------------------------------------------------------------------
-- Update map name 

function LoadMap.UpdateMapName( _Index ) 

	local MapIndex = LoadMap.ListBox.CurrentTopIndex + _Index
	local Name = ""
	if MapIndex >= 0 and MapIndex < LoadMap.ListBox.ElementsInList then
		if LoadMap.MapTable.MapArray[ MapIndex+1 ].MapNameString ~= "" then
			Name = LoadMap.MapTable.MapArray[ MapIndex+1 ].MapNameString
		else
			Name = LoadMap.MapTable.MapArray[ MapIndex+1 ].Name
		end
	end
	XGUIEng.SetText( XGUIEng.GetCurrentWidgetID(), Name )
	
	local HighLightFlag = 0
	if MapIndex == LoadMap.ListBox.CurrentSelectedIndex then
		HighLightFlag = 1
	end
	XGUIEng.HighLightButton( XGUIEng.GetCurrentWidgetID(), HighLightFlag )
	
end

----------------------------------------------------------------------------------------------------
-- Go up in list

function LoadMap.Button_Action_Up()

	LoadMap.ListBox.CurrentTopIndex = LoadMap.ListBox.CurrentTopIndex - 1
	ListBoxHandler_ValidateTopIndex( LoadMap.ListBox )
		
	LoadMap_UpdateSliderValue()
	
end

----------------------------------------------------------------------------------------------------
-- Go down in list

function LoadMap.Button_Action_Down()

	LoadMap.ListBox.CurrentTopIndex = LoadMap.ListBox.CurrentTopIndex + 1
	ListBoxHandler_ValidateTopIndex( LoadMap.ListBox )
	
	LoadMap_UpdateSliderValue()
	
end

----------------------------------------------------------------------------------------------------
-- Update up button

function LoadMap.Button_Update_Up()
	local DisableState = 0
	if LoadMap.ListBox.CurrentTopIndex == 0 then
		DisableState = 1 
	end
	XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), DisableState )
end

----------------------------------------------------------------------------------------------------
-- Update down button

function LoadMap.Button_Update_Down()
	local DisableState = 0
	if LoadMap.ListBox.CurrentTopIndex >= LoadMap.ListBox.ElementsInList - LoadMap.ListBox.ElementsShown then
		DisableState = 1 
	end
	XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), DisableState )
end

----------------------------------------------------------------------------------------------------
-- Slider moved

function LoadMap_OnSliderMoved( _Value, _WidgetID )
	local ElementsInListMinusElementsOnScreen = LoadMap.ListBox.ElementsInList - LoadMap.ListBox.ElementsShown
	local Index = math.floor( ( _Value * ElementsInListMinusElementsOnScreen ) / 100 )
	LoadMap.ListBox.CurrentTopIndex = Index 
	ListBoxHandler_ValidateTopIndex( LoadMap.ListBox )
end

----------------------------------------------------------------------------------------------------
-- Update slider value

function LoadMap_UpdateSliderValue()
	local ElementsInListMinusElementsOnScreen = LoadMap.ListBox.ElementsInList - LoadMap.ListBox.ElementsShown
	local Value = math.ceil( ( LoadMap.ListBox.CurrentTopIndex * 100 ) / ElementsInListMinusElementsOnScreen )
	XGUIEng.SetCustomScrollBarSliderValue( "SPM20_MapNameSlider", Value )
end

----------------------------------------------------------------------------------------------------
-- Update map preview widget

function LoadMap.UpdateMapPreview()

	-- Init name
	local TextureName = ""
	
	-- Get preview texture name
	do
		
		-- Get selected map
		local MapName = LoadMap.MapTable.MapArray[ LoadMap.ListBox.CurrentSelectedIndex+1 ].Name
		local MapType = LoadMap.MapTable.MapArray[ LoadMap.ListBox.CurrentSelectedIndex+1 ].Type
		local MapIndex = LoadMap.MapTable.MapArray[ LoadMap.ListBox.CurrentSelectedIndex+1 ].CampaignIndex
		
		-- Get texture name
		TextureName = Framework.GetMapPreviewMapTextureName( MapName, MapType, MapIndex )
		
	end
	
	-- Set texture
	XGUIEng.SetMaterialTexture( "SPM20_MapPreview", 1, TextureName )

end

----------------------------------------------------------------------------------------------------
-- Update map name

function
LoadMap.UpdateMapDescription()

	-- Get description
	local MapDesc = LoadMap.MapTable.MapArray[ LoadMap.ListBox.CurrentSelectedIndex+1 ].MapDescString

	-- Set text	
	XGUIEng.SetText( "SPM20_MapDescription", MapDesc )

end
----------------------------------------------------------------------------------------------------
-- Update map name Title

function
LoadMap.UpdateMapTitle()

	-- Get description
	local MapTitle = LoadMap.MapTable.MapArray[ LoadMap.ListBox.CurrentSelectedIndex+1 ].MapNameString

	-- Set text	
	XGUIEng.SetText( "SPM20_MapTitle", MapTitle )

end


----------------------------------------------------------------------------------------------------
-- Map list handler
----------------------------------------------------------------------------------------------------
-- Init

function MapListHandler_Init( _MapHandler )

	-- Init number of maps
	_MapHandler.NumberOfMaps = 0
	
	-- Init map table
	_MapHandler.MapArray = nil
	_MapHandler.MapArray = {}
		
end

----------------------------------------------------------------------------------------------------
-- Add maps to list

function MapListHandler_AddMaps( _MapHandler, _MapType, _CampaignName, _MultiplayerOnly, _LadderOnly )

	-- Get number of maps
	local NumberOfMaps = Framework.GetNumberOfMaps( _MapType, _CampaignName )
	if NumberOfMaps == 0 then
		return
	end
	
	-- Add all maps
	for i=1, NumberOfMaps, 1 do
	
		-- Get map data
		local MapNameNumber, MapName = Framework.GetMapNames( i - 1, 1, _MapType, _CampaignName )		
	
		local MultiplayerMap,maxPlayers, mpFlags = Framework.GetMapMultiplayerInformation(MapName, _MapType, _CampaignName)
		MultiplayerMap = MultiplayerMap == 1
	
		if 	_MultiplayerOnly == nil 
			or 
			(_MultiplayerOnly and MultiplayerMap)
			or
			(not _MultiplayerOnly and not MultiplayerMap) then
			
			if _LadderOnly ~= true or not MultiplayerMap or ( math.mod(mpFlags,128) >= 64 ) then
								
				local MapNameString, MapDescString = Framework.GetMapNameAndDescription( MapName, _MapType, _CampaignName )
		
				-- Get counter
				local Counter = _MapHandler.NumberOfMaps
				
				-- Create sub table
				_MapHandler.MapArray[ Counter+1 ] = nil
				_MapHandler.MapArray[ Counter+1 ] = {}
				
				-- Fill sub table
				_MapHandler.MapArray[ Counter+1 ].Name = MapName
				_MapHandler.MapArray[ Counter+1 ].Type = _MapType
				_MapHandler.MapArray[ Counter+1 ].CampaignIndex = _CampaignName
				
				if _MapType == -1 and MapNameString ~= "" then
					local TempName = "*" .. MapNameString
					_MapHandler.MapArray[ Counter+1 ].MapNameString = TempName
				else
					_MapHandler.MapArray[ Counter+1 ].MapNameString = MapNameString
				end
				
				_MapHandler.MapArray[ Counter+1 ].MapDescString = MapDescString
				
				-- Increment counter
				_MapHandler.NumberOfMaps = Counter + 1
				
			end
		
		end
	
	end
	
end

----------------------------------------------------------------------------------------------------
-- Get map index

function MapListHandler_GetMapIndex( _MapHandler, _MapName )

	-- Get number of maps
	local NumberOfMaps = _MapHandler.NumberOfMaps
	if NumberOfMaps == 0 then
		return -1
	end
	
	-- For all maps
	for i=0, NumberOfMaps-1, 1 do
		
		-- Wanted map?
		if _MapHandler.MapArray[ i+1 ].Name == _MapName then
		
			-- Return it!
			return i
			
		end
		
	end
	
	-- Not found!
	return -1
	
end



----------------------------------------------------------------------------------------------------
-- List box handler
----------------------------------------------------------------------------------------------------
-- Set index of selected element

function ListBoxHandler_SetSelected( _ListBoxHandler, _Index )

	-- Validate index
	if _Index < 0 then
		_Index = 0
	end
	if _Index >= _ListBoxHandler.ElementsInList then
		_Index = _ListBoxHandler.ElementsInList - 1 
	end
	
	-- Set selected
	_ListBoxHandler.CurrentSelectedIndex = _Index

end

----------------------------------------------------------------------------------------------------
-- Center list box on selected

function ListBoxHandler_CenterOnSelected( _ListBoxHandler )

	-- Set top index
	_ListBoxHandler.CurrentTopIndex = math.floor( _ListBoxHandler.CurrentSelectedIndex - _ListBoxHandler.ElementsShown / 2 + 1 )
	
	-- Validate top index
	ListBoxHandler_ValidateTopIndex( _ListBoxHandler )
		
end

----------------------------------------------------------------------------------------------------
-- Validate top index

function ListBoxHandler_ValidateTopIndex( _ListBoxHandler )

	-- Validate top index
	if _ListBoxHandler.CurrentTopIndex > _ListBoxHandler.ElementsInList - _ListBoxHandler.ElementsShown then
		_ListBoxHandler.CurrentTopIndex = _ListBoxHandler.ElementsInList - _ListBoxHandler.ElementsShown
	end
	if _ListBoxHandler.CurrentTopIndex < 0 then
		_ListBoxHandler.CurrentTopIndex = 0
	end
		
end

----------------------------------------------------------------------------------------------------
-- Removes all colours, double planks, plank at start, quotation marks, and planks at end
-- by Zedeg

function LoadMap_MinimizeName(_string)
    _string = string.gsub(string.gsub(string.gsub(string.gsub(_string, "@color:%d+,%d+,%d+,%d+", ""), "@color:%d+,%d+,%d+", ""), "  ", " "), "\"", "")
    while string.sub(_string, 1, 1) == " " do
		_string = string.sub(_string, 2)
	end
	while string.sub(_string, string.len(_string)) == " " do
		_string = string.sub(_string, 1, string.len(_string)-1)
	end
    return _string
end