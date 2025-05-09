
----------------------------------------------------------------------------------------------------
-- UNFILED - SAVE GAMES - TO BE FILLED! OTHER FILES HAVE BEEN CHECKED OUT
----------------------------------------------------------------------------------------------------
-- Globals needed for savegames
MainWindow_SaveGame_SaveListOffset = 0
MainWindow_SaveGame_LoadListOffset = 0
MainWindow_SaveGame_MaximumSlots = 100
MainWindow_SaveGame_SlotOnScreen = 8
MainWindow_SaveGame_SaveGameName = nil
MainWindow_SaveGame_SaveGameDescOld = nil
MainWindow_SaveGame_SaveGameDescNew = nil


----------------------------------------------------------------------------------------------------
-- Sort

function MainWindow_SaveGames_Sort(_left, _right)

	return string.upper(_left.Desc) < string.upper(_right.Desc)

end

----------------------------------------------------------------------------------------------------
-- Generate load game name list

function
MainWindow_LoadGame_GenerateList()

	MainWindow_LoadGame_NameList = {}
	
	local Index = 0
	local SaveGame
	local SaveGameIndex = 1
	
	while true do
		
		SaveGame = { Framework.GetSaveGameNames(Index, 1) }
		if SaveGame[1] == 0 then
			break
		end
		
		if Framework.IsSaveGameValid(SaveGame[2]) == true then

			MainWindow_LoadGame_NameList[SaveGameIndex] = {}
			MainWindow_LoadGame_NameList[SaveGameIndex].Name = SaveGame[2]
			MainWindow_LoadGame_NameList[SaveGameIndex].Desc = Framework.GetSaveGameString( SaveGame[2] )

			local Name = string.gsub(SaveGame[2], "save_", "", 1)
			
			MainWindow_LoadGame_NameList[SaveGameIndex].Index = tonumber(Name)

			SaveGameIndex = SaveGameIndex + 1

		end
			
		Index = Index + 1
		
	end

	table.sort(MainWindow_LoadGame_NameList, MainWindow_SaveGames_Sort)

end

----------------------------------------------------------------------------------------------------
-- Generate Save game name list

function
MainWindow_SaveGame_GenerateList()

	MainWindow_SaveGame_NameList = {}
	
	local Index = 0
	local SaveGame
	
	while true do
		
		SaveGame = { Framework.GetSaveGameNames(Index, 1) }
		if SaveGame[1] == 0 then
			break
		end
		
		local Name = string.gsub(SaveGame[2], "save_", "", 1)
		
		local SaveGameIndex = tonumber(Name)
		
		if SaveGameIndex ~= nil and Framework.IsSaveGameValid(SaveGame[2]) == true then
		
			MainWindow_SaveGame_NameList[SaveGameIndex] = {}
			MainWindow_SaveGame_NameList[SaveGameIndex].Name = SaveGame[2]
			MainWindow_SaveGame_NameList[SaveGameIndex].Desc = Framework.GetSaveGameString( SaveGame[2] )
			MainWindow_SaveGame_NameList[SaveGameIndex].Index = SaveGameIndex
		
		end
	
		Index = Index + 1
			
	end

end
----------------------------------------------------------------------------------------------------
-- Tool to create save game description of current game

function MainWindow_SaveGame_CreateSaveGameDescription()
	-- Create description
	local Description = ""

	-- Get map
	local MapName = Framework.GetCurrentMapName()
	local MapType, CampaignName = Framework.GetCurrentMapTypeAndCampaignName()
	local MapNameString, MapDescString = Framework.GetMapNameAndDescription( MapName, MapType, CampaignName )

	local systemDateTime = Framework.GetSystemTimeDateString()
	local year = string.sub(systemDateTime,1,4)
	local month = string.sub(systemDateTime,6,7)
	local day = string.sub(systemDateTime,9,10) 
	local hours = string.sub(systemDateTime,12,13) 
	local minutes = string.sub(systemDateTime,15,16) 
	local seconds = string.sub(systemDateTime,18,19) 
	local newDateTimeString = ""
	local lang = XNetworkUbiCom.Tool_GetCurrentLanguageShortName()
	
	-- Map name to use
	local TempString = MapNameString
	if TempString == nil or TempString == "" then
		TempString= MapName
	end
	
	if lang == "de" then
		Description = day.."."..month.."."..year
	else
		Description = year.."-"..month.."-"..day
	end
	Description = Description..", "..hours..":"..minutes..":"..seconds.." - "..TempString

	-- Use it
	return Description
end


----------------------------------------------------------------------------------------------------
-- Save button saved

function
MainWindow_SaveGame_DoSaveGame( _Slot )

	-- Index
	local Index = MainWindow_SaveGame_SaveListOffset + _Slot

	local SaveGameName
	if MainWindow_SaveGame_NameList[Index+1] ~= nil then

		SaveGameName = "save_" .. MainWindow_SaveGame_NameList[Index+1].Index

	else

	-- Create save game name
		SaveGameName = "save_" .. ( Index + 1 )
	end
	
	-- Init name
	MainWindow_SaveGame_SaveGameName = nil
	MainWindow_SaveGame_SaveGameDescOld = nil
	MainWindow_SaveGame_SaveGameDescNew = nil

	
	-- Create description
	local Description = MainWindow_SaveGame_CreateSaveGameDescription()
	

	-- Check if savegame alredy used -> overwrite box
	if MainWindow_SaveGame_NameList[Index+1] ~= nil then
			
		-- Yeap: use name
		MainWindow_SaveGame_SaveGameName = SaveGameName
		MainWindow_SaveGame_SaveGameDescOld = MainWindow_SaveGame_NameList[Index+1].Desc
		MainWindow_SaveGame_SaveGameDescNew = Description
		GUIAction_ToggleMenu( "MainMenuBoxOverwriteWindow", 1 )
		return
	
	end
			
	
	-- Not used: save
	local success = Framework.SaveGame( SaveGameName, Description )
    if success then
	    GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/GUI_GameSaved" ) )
    end

	GUIAction_ToggleMenu( XGUIEng.GetWidgetID("MainMenuWindow"),0)

end

----------------------------------------------------------------------------------------------------
-- Do overwrite

function
MainWindow_SaveGame_DoOverwriteSaveGame()

	if MainWindow_SaveGame_SaveGameName ~= nil then
		
		local success = Framework.SaveGame( MainWindow_SaveGame_SaveGameName, MainWindow_SaveGame_SaveGameDescNew )
	    if success then
		    GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/GUI_GameSaved" ) )
        end
	
		GUIAction_ToggleMenu( XGUIEng.GetWidgetID("MainMenuWindow"),0)
	
		MainWindow_SaveGame_SaveGameName = nil
		MainWindow_SaveGame_SaveGameDescOld = nil
		MainWindow_SaveGame_SaveGameDescNew = nil
		
	end
	
end

----------------------------------------------------------------------------------------------------
-- Update overwrite savegame name

function
MainWindow_SaveGame_DoOverwriteUpdateButton()

	local Text = ""
	
	if MainWindow_SaveGame_SaveGameDescOld ~= nil then
		Text = MainWindow_SaveGame_SaveGameDescOld
	end
	
	XGUIEng.SetText( XGUIEng.GetCurrentWidgetID(), Text )

end


----------------------------------------------------------------------------------------------------
-- Update save game button by Zedeg

function MainWindow_SaveGame_UpdateButton(_slot)
    local Index = MainWindow_SaveGame_SaveListOffset+_slot
    local name = Index+1 .." - "..XGUIEng.GetStringTableText"IngameMenu/SaveGame_EmptySlot"
    local disableState = 0
    if MainWindow_SaveGame_NameList[Index+1] ~= nil then
        name = MainWindow_SaveGame_NameList[Index+1].Index.." - "..MainWindow_SaveGame_NameList[Index+1].Desc
    end
    if XNetwork ~= nil and XNetwork.Manager_DoesExist() == 1 then
        disableState = 1
    end
    name = string.gsub(name, "- 20", " @color:255,255,255 - 20")
    XGUIEng.SetText(XGUIEng.GetCurrentWidgetID(), name)
    XGUIEng.DisableButton(XGUIEng.GetCurrentWidgetID(), disableState)
end

----------------------------------------------------------------------------------------------------

function
MainWindow_SaveGame_ScrollUpButton()
	MainWindow_SaveGame_SaveListOffset = MainWindow_SaveGame_SaveListOffset - MainWindow_SaveGame_SlotOnScreen / 2
	if MainWindow_SaveGame_SaveListOffset < 0 then
		MainWindow_SaveGame_SaveListOffset = 0
	end
end

----------------------------------------------------------------------------------------------------

function
MainWindow_SaveGame_ScrollDownButton()
	MainWindow_SaveGame_SaveListOffset = MainWindow_SaveGame_SaveListOffset + MainWindow_SaveGame_SlotOnScreen / 2
	if MainWindow_SaveGame_SaveListOffset > ( MainWindow_SaveGame_MaximumSlots - MainWindow_SaveGame_SlotOnScreen ) then
		MainWindow_SaveGame_SaveListOffset = MainWindow_SaveGame_MaximumSlots - MainWindow_SaveGame_SlotOnScreen
	end
end

----------------------------------------------------------------------------------------------------
-- Loads the selected savegame (Triggerfix by mcb)
function MainWindow_LoadGame_DoLoadGame( _Slot )
	Trigger.DisableTriggerSystem(1)
	local Index = MainWindow_SaveGame_LoadListOffset + _Slot
	
	if Index < table.getn(MainWindow_LoadGame_NameList) then
		Framework.LoadGame( MainWindow_LoadGame_NameList[Index+1].Name )
	end
	GUIAction_ToggleMenu( XGUIEng.GetWidgetID("MainMenuWindow"),0)
end

----------------------------------------------------------------------------------------------------

function
MainWindow_LoadGame_Done()

	GUI.AddNote( XGUIEng.GetStringTableText( "InGameMessages/GUI_GameLoaded" ) )

end

----------------------------------------------------------------------------------------------------
-- Update load game button by Zedeg
function MainWindow_LoadGame_UpdateButton(_slot)
    local Index = MainWindow_SaveGame_LoadListOffset+_slot
    local name = ""
    local disableState = 0
    if Index < table.getn(MainWindow_LoadGame_NameList) then
        if MainWindow_LoadGame_NameList[Index+1].Index ~= nil then
            name = MainWindow_LoadGame_NameList[Index+1].Index.." - "..MainWindow_LoadGame_NameList[Index+1].Desc
        else
            name = MainWindow_LoadGame_NameList[Index+1].Desc
        end
    else
        disableState = 1
    end
    if XNetwork ~= nil and XNetwork.Manager_DoesExist() == 1 then
        disableState = 1
    end
    name = string.gsub(name, "- 20", " @color:255,255,255 - 20")
    XGUIEng.SetText(XGUIEng.GetCurrentWidgetID(), name)
    XGUIEng.DisableButton(XGUIEng.GetCurrentWidgetID(), disableState)
end

----------------------------------------------------------------------------------------------------

function
MainWindow_LoadGame_ScrollUpButton()
	MainWindow_SaveGame_LoadListOffset = MainWindow_SaveGame_LoadListOffset - MainWindow_SaveGame_SlotOnScreen / 2
	if MainWindow_SaveGame_LoadListOffset < 0 then
		MainWindow_SaveGame_LoadListOffset = 0
	end
end

----------------------------------------------------------------------------------------------------

function
MainWindow_LoadGame_ScrollDownButton()
	MainWindow_SaveGame_LoadListOffset = MainWindow_SaveGame_LoadListOffset + MainWindow_SaveGame_SlotOnScreen / 2
	if MainWindow_SaveGame_LoadListOffset > ( MainWindow_SaveGame_MaximumSlots - MainWindow_SaveGame_SlotOnScreen + 1 ) then
		MainWindow_SaveGame_LoadListOffset = MainWindow_SaveGame_MaximumSlots - MainWindow_SaveGame_SlotOnScreen + 1
	end
end

----------------------------------------------------------------------------------------------------

