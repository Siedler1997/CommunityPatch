----------------------------------------------------------------------------------------------------
-- Init table
LoadSaveGame = {}

----------------------------------------------------------------------------------------------------
-- Sort list

function LoadSaveGame.Sort(_leftName, _rightName)
    --reduce names to essential parts
    local leftName = LoadSaveGame_MinimizeName(Framework.GetSaveGameString(_leftName))
    local rightName = LoadSaveGame_MinimizeName(Framework.GetSaveGameString(_rightName))

    --check if it is an savegame with a normal slot
    local indexL = string.sub(_leftName, 1, 5) --cut "save_"
    if indexL == "save_" then indexL = "" else indexL = " " end --give normal savegames no ascending bonus
    local indexR = string.sub(_rightName, 1, 5)
    if indexR == "save_" then indexR = "" else indexR = " " end

    return indexL..string.upper(leftName) < indexR..string.upper(rightName)
end

----------------------------------------------------------------------------------------------------
-- Init load save game data

function LoadSaveGame.Init()

	-- Init save game table
	do
	
		-- Create table
		LoadSaveGame.SaveGameTable = nil
		LoadSaveGame.SaveGameTable = {}								
		
		-- Init table		
		LoadSaveGame.SaveGameTable.Number = 0
		LoadSaveGame.SaveGameTable.Array = nil
		LoadSaveGame.SaveGameTable.Array = {}

		-- Add save games
		for SaveGameIndex = 0, 1000, 1 do
			local SaveGameName = { Framework.GetSaveGameNames( SaveGameIndex, 1 ) }
			if SaveGameName[ 1 ] == 0 then
				break
			end
			
			-- Is valid
			if Framework.IsSaveGameValid(SaveGameName[2]) == true then
			
				LoadSaveGame.SaveGameTable.Array[ LoadSaveGame.SaveGameTable.Number + 1 ] = SaveGameName[ 2 ]
				LoadSaveGame.SaveGameTable.Number = LoadSaveGame.SaveGameTable.Number + 1
			end
		end
		
	end

	table.sort(LoadSaveGame.SaveGameTable.Array,LoadSaveGame.Sort)


	-- Init list box
	do
		LoadSaveGame.ListBox = nil
		LoadSaveGame.ListBox = {}	
		LoadSaveGame.ListBox.ElementsShown = 6									-- Elements in list box
		LoadSaveGame.ListBox.ElementsInList = LoadSaveGame.SaveGameTable.Number	-- Elements in list
		LoadSaveGame.ListBox.CurrentTopIndex = 0								-- Current top index
		LoadSaveGame.ListBox.CurrentSelectedIndex = 0							-- Current selected index
	
		-- Set start index to current save game	
		ListBoxHandler_SetSelected( LoadSaveGame.ListBox, 0 )
		ListBoxHandler_CenterOnSelected( LoadSaveGame.ListBox )
		
	end
	
	-- Init slider value
	LoadSaveGame_UpdateSliderValue()
	
end


----------------------------------------------------------------------------------------------------
-- Load Game done, close dialog and load game

function LoadSaveGame.Done()
	local Index = LoadSaveGame.ListBox.CurrentSelectedIndex
	local Name = LoadSaveGame.SaveGameTable.Array[ Index + 1 ]
	if Name ~= nil then
		Framework.LoadGame( Name )
		LoadScreen_Init( 1, Name )
	end	
end



----------------------------------------------------------------------------------------------------
-- Save game was clicked

function LoadSaveGame.OnName( _Index ) 
	local Index = LoadSaveGame.ListBox.CurrentTopIndex + _Index
	if Index >= 0 and Index < LoadSaveGame.ListBox.ElementsInList then
		ListBoxHandler_SetSelected( LoadSaveGame.ListBox, Index )
	end
end

----------------------------------------------------------------------------------------------------
-- Update save game name 

function LoadSaveGame.UpdateName( _Index ) 

	local Index = LoadSaveGame.ListBox.CurrentTopIndex + _Index
	
	local Name = ""
	
	if Index >= 0 and Index < LoadSaveGame.ListBox.ElementsInList then
		Name = LoadSaveGame.SaveGameTable.Array[ Index + 1 ]
		
		local Desc = Framework.GetSaveGameString( Name )
		if Desc ~= nil and Desc ~= "" then
			Name = Desc
		end
	end
	
	XGUIEng.SetText( XGUIEng.GetCurrentWidgetID(), Name )
	
	local HighLightFlag = 0
	if Index == LoadSaveGame.ListBox.CurrentSelectedIndex then
		HighLightFlag = 1
	end
	XGUIEng.HighLightButton( XGUIEng.GetCurrentWidgetID(), HighLightFlag )
	
end

----------------------------------------------------------------------------------------------------
-- Go up in list

function LoadSaveGame.Button_Action_Up()

	LoadSaveGame.ListBox.CurrentTopIndex = LoadSaveGame.ListBox.CurrentTopIndex - 1
	ListBoxHandler_ValidateTopIndex( LoadSaveGame.ListBox )
		
	LoadSaveGame_UpdateSliderValue()
	
end

----------------------------------------------------------------------------------------------------
-- Go down in list

function LoadSaveGame.Button_Action_Down()

	LoadSaveGame.ListBox.CurrentTopIndex = LoadSaveGame.ListBox.CurrentTopIndex + 1
	ListBoxHandler_ValidateTopIndex( LoadSaveGame.ListBox )
	
	LoadSaveGame_UpdateSliderValue()
	
end

----------------------------------------------------------------------------------------------------
-- Update up button

function LoadSaveGame.Button_Update_Up()
	local DisableState = 0
	if LoadSaveGame.ListBox.CurrentTopIndex == 0 then
		DisableState = 1 
	end
	XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), DisableState )
end

----------------------------------------------------------------------------------------------------
-- Update down button

function LoadSaveGame.Button_Update_Down()
	local DisableState = 0
	if LoadSaveGame.ListBox.CurrentTopIndex >= LoadSaveGame.ListBox.ElementsInList - LoadSaveGame.ListBox.ElementsShown then
		DisableState = 1 
	end
	XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), DisableState )
end

----------------------------------------------------------------------------------------------------
-- Slider moved

function LoadSaveGame_OnSliderMoved( _Value, _WidgetID )
	local ElementsInListMinusElementsOnScreen = LoadSaveGame.ListBox.ElementsInList - LoadSaveGame.ListBox.ElementsShown
	local Index = math.floor( ( _Value * ElementsInListMinusElementsOnScreen ) / 100 )
	LoadSaveGame.ListBox.CurrentTopIndex = Index 
	ListBoxHandler_ValidateTopIndex( LoadSaveGame.ListBox )
end

----------------------------------------------------------------------------------------------------
-- Update slider value

function LoadSaveGame_UpdateSliderValue()
	local ElementsInListMinusElementsOnScreen = LoadSaveGame.ListBox.ElementsInList - LoadSaveGame.ListBox.ElementsShown
	local Value = math.ceil( ( LoadSaveGame.ListBox.CurrentTopIndex * 100 ) / ElementsInListMinusElementsOnScreen )
	XGUIEng.SetCustomScrollBarSliderValue( "SPM30_SaveGameSlider", Value )
end

----------------------------------------------------------------------------------------------------
-- Removes all colours, double planks, plank at start, quotation marks, and planks at end
-- By Zedeg

function LoadSaveGame_MinimizeName(_string)
    _string = string.gsub(string.gsub(string.gsub(string.gsub(_string, "@color:%d+,%d+,%d+,%d+", ""), "@color:%d+,%d+,%d+", ""), " +", " "), "\"", "")
	while string.sub(_string, 1, 1) == " " do
		_string = string.sub(_string, 2)
	end
	while string.sub(_string, string.len(_string)) == " " do
		_string = string.sub(_string, 1, string.len(_string)-1)
	end
    return _string
end
