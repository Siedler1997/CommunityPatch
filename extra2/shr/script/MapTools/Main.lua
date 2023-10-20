-- Load support file
Script.Load(Folders.MapTools.."Ai\\Support.lua")

-- Load mission script libs
IncludeGlobals("Quests")
IncludeGlobals("Comfort")
IncludeGlobals("NPC")
IncludeGlobals("Information")
IncludeGlobals("PlayerColors")
IncludeGlobals("CutsceneNames")
IncludeGlobals("DynamicFog")
IncludeGlobals("Extra2Comfort")

function GameCallback_OnGameStart() 	

	-- Include global tool script functions
	IncludeGlobals("GlobalMissionScripts" )

	-- Load trigger conditions
	IncludeGlobals("Conditions" )
	
	-- Load String table tool
	IncludeGlobals("String")
	
	
	-- Load timer functions
	IncludeGlobals("Counter" )
	
	-- Load explore functions
	IncludeGlobals("Explore" )
	
	-- Load weather sets
	IncludeGlobals("WeatherSets" )

	--preload all models
	Display.LoadAllModels()

	--Stop the music still played by the main menu
	Music.Stop()

	-- Global mission initializing
	GlobalMissionScripting.OnGameStart()

	-- Init mission main data table
	gvMission = {}
	gvMission.PlayerID = GUI.GetPlayerID()
	
	--Set Human Player flag
	Logic.PlayerSetIsHumanFlag( gvMission.PlayerID, 1 )
	Logic.PlayerSetGameStateToPlaying( gvMission.PlayerID )			

	-- Reset the camera
	Camera.RotSetAngle(315)		

	-- Init diplomacy
	if Mission_InitDiplomacy ~= nil then
		Mission_InitDiplomacy()
	elseif InitDiplomacy ~= nil then
		InitDiplomacy()
	end
	
	-- Init resources
	if Mission_InitResources ~= nil then
		Mission_InitResources()
	elseif InitResources ~= nil then
		InitResources()
	end

	-- Init technologies
	if Mission_InitTechnologies ~= nil then
		Mission_InitTechnologies()
	elseif InitTechnologies ~= nil then
		InitTechnologies()
	end

	-- Init ai of mission
	if Mission_InitAI ~= nil then
		Mission_InitAI()
	end
	
	--Setup weather gfx sets for all maps is needed for the weathermachine
	Mission_InitWeatherGfxSetsForAllMaps()
	
	-- Setup weather gfx sets
	if InitWeatherGfxSets ~= nil then
		InitWeatherGfxSets()
	elseif Mission_InitWeatherGfxSets ~= nil then
		Mission_InitWeatherGfxSets()
	end

	-- Init weather periods
	if InitWeather ~= nil then
		InitWeather()
	elseif Mission_InitWeather ~= nil then
		Mission_InitWeather()
	end


	if Mission_InitPlayerColorMapping ~= nil then
		Mission_InitPlayerColorMapping()
	elseif InitPlayerColorMapping ~= nil then
		InitPlayerColorMapping()
	end
		

	-- Tribute Jingle sound
	SetupTributeJingle()
	
	-- Init scout forester
	ScoutFoerster_Init(ScoutFoerster_SET_Fir, {Gold=50});

	-- Call first action
	if Mission_FirstMapAction ~= nil then
		Mission_FirstMapAction()
	else
		FirstMapAction()
	end
	
	
	--Temp: Disable Weathermachine on all maps
	--Logic.SetTechnologyState(1,Technologies.B_Weathermachine,0)
	
	
end

function Mission_OnSaveGameLoaded()
	--first re init gfx sets for all maps
	Mission_InitWeatherGfxSetsForAllMaps()
	
	-- Re init weather gfx sets in the map script (can overwrite Mission_InitWeatherGfxSetsForAllMaps)
	if InitWeatherGfxSets ~= nil then
		InitWeatherGfxSets()
	elseif Mission_InitWeatherGfxSets ~= nil then
		Mission_InitWeatherGfxSets()
	end

	if Mission_InitPlayerColorMapping ~= nil then
		Mission_InitPlayerColorMapping()
	elseif InitPlayerColorMapping ~= nil then
		InitPlayerColorMapping()
	end

	LocalMusic.LastBattleMusicStarted = 0
	
	MainWindow_LoadGame_Done()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()
	
	-- Init with gfx set 1
	Logic.SetupGfxSet(1)
	
	-- Only summer weather period
	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Dummy function to allow tribute in maps
function GameCallback_FulfillTribute(_PlayerID, _TributeID )
	-- Tribute is allowed
	return 1
end