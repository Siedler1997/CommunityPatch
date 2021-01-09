----------------------------------------------------------------------------------------------------
-- Single player menu page ids:
--
-- 00: Single player main menu screen
-- 10: Camapign screen
-- 20: Custom map screen
-- 30: Load map screen
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------
-- Table containing ALL multiplayer menu stuff
SPMenu = {}
SPMenu.CampaignMaps= {}
SPMenu.CampaignMaps[1] = "01_Thalgrund"
SPMenu.CampaignMaps[2] = "02_VillageAttack"
SPMenu.CampaignMaps[3] = "04_Crawford"
SPMenu.CampaignMaps[4] = "06_Cleycourt"
SPMenu.CampaignMaps[5] = "07_Flood"
SPMenu.CampaignMaps[6] = "08_Barmecia"
SPMenu.CampaignMaps[7] = "10_Folklung"
SPMenu.CampaignMaps[8] = "11_Norfolk"
SPMenu.CampaignMaps[9] = "12_Kaloix"
SPMenu.CampaignMaps[10] = "13_Plague"
SPMenu.CampaignMaps[11] = "15_OldKingsCastle"
SPMenu.CampaignMaps[12] = "17_CloudyMountains"
SPMenu.CampaignMaps[13] = "18_Evelance"
SPMenu.CampaignMaps[14] = "19_Wasteland"
SPMenu.CampaignMaps[15] = "20_BattleOfEvelance"

SPMenu.CurrentCampaignMap = "00_Tutorial"

----------------------------------------------------------------------------------------------------
-- Show campaign screen

function SPMenu.S00_ToCampaignMenu()
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget("SPMenu10", 1)
	SPMenu.S10_UpdateCampaignMaps()
end

----------------------------------------------------------------------------------------------------
-- Show custom map screen

function
SPMenu.S00_ToCustomMap()

	-- Show screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget("SPMenu20", 1)
end

----------------------------------------------------------------------------------------------------
-- Show savegame screen

function
SPMenu.S00_ToLoadSaveGame()
	
	-- Show screen	
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget("SPMenu30", 1)

end


----------------------------------------------------------------------------------------------------
-- 10 - campaign screen
----------------------------------------------------------------------------------------------------
-- Check map cheat - entered in campaign menu

function
SPMenu.S10_CheckMapCheat( _Message, _MapName )

	local StringKeyName = "Cheats/WonMap_" .. _MapName
	local Cheat = XGUIEng.GetStringTableText( StringKeyName )
	
	if Cheat == nil or Cheat == "" then
		return
	end
	
	if _Message ~= Cheat then
		return
	end

	local GDBKeyName = 	"Game\\Campaign01\\WonMap_" .. _MapName
	GDB.SetValue( GDBKeyName, 1 )
	SPMenu.S10_UpdateCampaignMaps()
	
	Sound.PlayGUISound( Sounds.Misc_Chat, 0 )	
	
end

----------------------------------------------------------------------------------------------------
-- Cheat string input callback
 
function 
SPGame_S10_ApplicationCallback_ChatStringInputDone( _Message, _WidgetID )

	-- Check map cheats
	local AmountOfMaps = table.getn(SPMenu.CampaignMaps)
	
	for i=1,AmountOfMaps,1
	do
		SPMenu.S10_CheckMapCheat( _Message, SPMenu.CampaignMaps[i] )
	end
	
		
end

function SPMenu.S10_UpdateCampaignMaps()

	XGUIEng.ShowAllSubWidgets( "SPM10_CampaignMaps", 0 )
	XGUIEng.ShowWidget( "Campaign01_00_Tutorial" , 1 )
	
	local GDBKeyName_Difficulty = "Game\\Campaign_Difficulty"
	if GDB.GetValue(GDBKeyName_Difficulty) == 0 then
		GDB.SetValue(GDBKeyName_Difficulty, 0)
	end

	local AmountOfMaps = table.getn(SPMenu.CampaignMaps)
	local latestMap = 0
	
	for i=1,AmountOfMaps,1
	do
		if i <= 1 then
			local CampaignContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[i]
			XGUIEng.ShowWidget( CampaignContainerNamer , 1 )

			local HideCampaignContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[i] .. "_flag"
			XGUIEng.ShowWidget( HideCampaignContainerNamer , 0 )
		else
			local GDBKeyName = 	"Game\\Campaign01\\WonMap_" .. SPMenu.CampaignMaps[i-1]
			if GDB.GetValue( GDBKeyName) == 1 then		
				local CampaignContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[i]
				XGUIEng.ShowWidget( CampaignContainerNamer , 1 )	

				local HideCampaignContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[i] .. "_flag"
				XGUIEng.ShowWidget( HideCampaignContainerNamer , 0 )

				latestMap = i		
			end
		end
		
	end

	if latestMap <= 1 then 
			latestMap = 1
		end	
	local LatestCampainContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[latestMap] .. "_flag"
	XGUIEng.ShowWidget( LatestCampainContainerNamer , 1 )	

	-- set selected map to latest Campaign Map	
	SPMenu.CurrentCampaignMap = SPMenu.CampaignMaps[latestMap]

	-- display map info of latest Campain Map
	SPMenu.S10_UpdateMapDescription(SPMenu.CampaignMaps[latestMap])
	SPMenu.S10_UpdateMapTitle(SPMenu.CampaignMaps[latestMap])
	
	-- Hilight Button for latest Campaign Map
	local DisableHilightContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[latestMap] .. "_BG"
	XGUIEng.HighLightButton( DisableHilightContainerNamer, 1 )
end     




function SPMenu.UpdateCampaignMap(_MapName)
	-- Switch off all HiLights for all maps
	local AmountOfMaps = table.getn(SPMenu.CampaignMaps)
	for i=1,AmountOfMaps,1
	do

		local DisableHilightContainerNamer = "Campaign01_" .. SPMenu.CampaignMaps[i] .. "_BG"
		XGUIEng.HighLightButton( DisableHilightContainerNamer, 0 )
		
	end
	
	-- 00_Tutorial Hilight aus
	XGUIEng.HighLightButton( "Campaign01_00_Tutorial1_BG", 0 )  
	-- Hilight Selected Map
	local HilightBG = "Campaign01_" .. _MapName .. "_BG"
	XGUIEng.HighLightButton( HilightBG, 1 )

	SPMenu.S10_UpdateMapDescription(_MapName)
	SPMenu.S10_UpdateMapTitle(_MapName)
	
	SPMenu.CurrentCampaignMap = _MapName
end

function SPMenu.StartCampaignMap()
	
	Framework.StartMap( SPMenu.CurrentCampaignMap, -1, "Main" )
	LoadScreen_Init( 0, SPMenu.CurrentCampaignMap, -1, "Main" )
	
end

----------------------------------------------------------------------------------------------------
-- Update map name

function
SPMenu.S10_UpdateMapDescription(_MapName)

--	local MapNameString, MapDescString = Framework.GetMapNameAndDescription( MapName, _MapType, _CampaignName )
	local MapNameString, MapDescString = Framework.GetMapNameAndDescription( _MapName, -1, "Main" )

	-- Set text	
	XGUIEng.SetText( "SPM10_MapDetailsDescription", MapDescString )

end
----------------------------------------------------------------------------------------------------
-- Update map name Title

function
SPMenu.S10_UpdateMapTitle(_MapName)

	local MapNameString, MapDescString = Framework.GetMapNameAndDescription( _MapName, -1, "Main" )

	-- Set text	
	XGUIEng.SetText( "SPM10_MapDetailsTitle", MapNameString )

end


----------------------------------------------------------------------------------------------------
-- General GUI functions
----------------------------------------------------------------------------------------------------
-- SP canceled

function SPMenu.GEN_Button_Cancel()
		
	-- To start menu
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "StartMenu00", 1 )


end


----------------------------------------------------------------------------------------------------
--Updates the difficulty of all campaign maps

function SPMenu.S10_UpdateCampaignDifficulty(_NewState)
	if _NewState ~= nil then
		GDB.SetValue("Game\\Campaign_Difficulty", _NewState)
	end
end

----------------------------------------------------------------------------------------------------
-- Update difficulty buttons

function SPMenu.S10_UpdateDifficultyButtons(_Difficulty)
	local HighLightFlag = 0
	local GDBKeyName_Difficulty = "Game\\Campaign_Difficulty"
	if GDB.GetValue(GDBKeyName_Difficulty) == _Difficulty then
		HighLightFlag = 1
	end

	XGUIEng.HighLightButton(XGUIEng.GetCurrentWidgetID(), HighLightFlag)
end