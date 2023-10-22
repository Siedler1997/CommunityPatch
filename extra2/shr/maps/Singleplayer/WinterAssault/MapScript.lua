
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("gameControl")
IncludeLocals("quest_defeat")
IncludeLocals("quest_victory")
IncludeLocals("briefing_prelude")
IncludeLocals("CaravanDetection")
IncludeLocals("SpawnGroups")
IncludeLocals("briefing_Destroy")
IncludeLocals("briefing_Merchant")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )


	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Tower		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Stables		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Tactics		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Strategies		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.UP2_Headquarter	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_PulledBarrel	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.UP1_Tower		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.UP2_Tower		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_EnhancedGunPowder	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_BlisteringCannonballs, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Mercenaries	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_StandingArmy	, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Tactics		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Strategies		, 0)

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Construction	, 3)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Alchemy 		, 3)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_Literacy		, 3)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_GearWheel	, 3)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.GT_ChainBlock		, 3)
	
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_UpgradeRifle1		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Outpost		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Barracks		, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Archery		, 0)

	ResearchTechnology(Technologies.T_UpgradeSword1)
	ResearchTechnology(Technologies.T_UpgradeSpear1)
	ResearchTechnology(Technologies.T_UpgradeBow1)

	ResearchAllMilitaryTechsAddOn(2)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	Display.SetRenderUseGfxSets(1)
	

	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
	WeatherSets_SetupRain(5, 1, 1)
	WeatherSets_SetupSnow(6, 0, 0)
	WeatherSets_SetupSnow(7, 1, 0)
	WeatherSets_SetupSnow(8, 1, 1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()


	Logic.AddWeatherElement(1, 10, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(2, 60, 1, 5, 5, 10)	-- Foggy with Rain and Snow
	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 600, 1, 6, 5, 10)	-- Winter
	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 60, 1, 8, 5, 10)	-- Winter with Rain and Snow
	Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)	-- Winter with Rain
	Logic.AddWeatherElement(1, 10, 1, 1, 5, 10)	-- Sommer


end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
 	-- set player colors
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color == 2 then
		Display.SetPlayerColorMapping(2, 6)		
	end
	if p1color == 4 then
		Display.SetPlayerColorMapping(4, 3)		
	end
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

		String.Init("SP_Winter_Assault")

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()
	
	--	exploring
	
	--	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)

	--	resources
		GlobalMissionScripting.GiveResouces(1, 5000, 2000, 1500, 2000, 5000, 1500)
	
	--	Variables
	
		OneBuildingDown=0


		--SetPlayerName(2, "Barbaren")
		SetPlayerName(2, String.Key("_Player2Name"))


	-- 	Set Music-Set

		LocalMusic.UseSet = DARKMOORMUSIC
	
	--	start quest
	
		start1stChapter()

	--	Debug

	--	EnableDebugging()
   	--	Game.GameTimeReset()
		    
	   --Tools.ExploreArea(-1, -1, 900)
	end

