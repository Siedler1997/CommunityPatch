
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 8, Diplomacy.Hostile )
	--Logic.SetDiplomacyState( 2, 7, Diplomacy.Neutral )
	--Logic.SetDiplomacyState( 3, 7, Diplomacy.Hostile )
	--Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	--Logic.SetDiplomacyState( 2, 3, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 3, 6, Diplomacy.Neutral )
	--Logic.SetDiplomacyState( 7, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 8, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 5, Diplomacy.Hostile )


	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP1_Tavern, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_MasterBuilderWorkshop, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.UP2_Tower, 0 )

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		--ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(4)
		--ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(6)
		ResearchAllMilitaryTechsAddOn(7)
		ResearchAllMilitaryTechsAddOn(8)
	end

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
	
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
	WeatherSets_SetupNormal(4, 0, 1)
	WeatherSets_SetupRain(5, 1, 1)
	WeatherSets_SetupSnow(6, 0, 0)
	WeatherSets_SetupSnow(7, 1, 0)
	WeatherSets_SetupSnow(8, 1, 1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	--Logic.AddWeatherElement(2, 140, 1, 2, 5, 10)	-- Foggy with Rain
	--Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
	--Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)	-- Foggy with Rain
	--Logic.AddWeatherElement(2, 60, 1, 5, 5, 10)	-- Foggy with Rain and Snow
	--Logic.AddWeatherElement(2, 60, 1, 4, 5, 10)	-- Foggy with Snow
	--Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	--Logic.AddWeatherElement(3, 120, 1, 6, 5, 10)	-- Winter
	--Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)	-- Winter with Snow
	--Logic.AddWeatherElement(3, 90, 1, 8, 5, 10)	-- Winter with Rain and Snow
	--Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)	-- Winter with Rain
	--Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)	-- Foggy with Rain
	--Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)	-- Sommer
	--Logic.AddWeatherElement(2, 130, 1, 2, 5, 10)	-- Foggy with Rain

end
	
-- First Map Action

	function Mission_FirstMapAction()

	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	String.Init("CM06_02_DefendingTheDryMoat")
	--	flags

		

	--	locals

		IncludeLocals("gameControl")
		
		

		
		IncludeLocals("npc_mayor")
		IncludeLocals("npc_templar")
		IncludeLocals("npc_drake")

		
		IncludeLocals("quest_ChapterI")
		IncludeLocals("quest_ChapterII")
		IncludeLocals("quest_ChapterIII")
		IncludeLocals("quest_ChapterIV")
		
		
		IncludeLocals("briefing_intro")
		IncludeLocals("briefing_mayor")
		IncludeLocals("briefing_templar")
		IncludeLocals("briefing_drake")
		IncludeLocals("briefing_dario")


		IncludeLocals("army_player")
		IncludeLocals("army_battle")
		IncludeLocals("army_control")
		

		timer = 960
	 	capture = 0

	--	resources
	
		AddGold(1500)
		AddWood(5000)
		AddClay(2000)
		AddStone(3000)
		AddIron(3000)
		AddSulfur(500)
	
	-- 	Set Music-Set

		LocalMusic.UseSet = EVELANCEMUSIC
	--	Chests
		--CreateChestOpener("Dario")
		--CreateRandomChests()
		--StartChestQuest()

	--	Start Control

		Start1stChapter()
		
	--	Players
	
		--IncludeLocals("player_1")
		--IncludeLocals("player_2")
		--IncludeLocals("player_3")
		--IncludeLocals("player_4")
						    	
		-- debugging stuff
		--EnableDebugging()
		--Game.GameTimeReset()


		--SetPlayerName(5, "Naerbor Landarbeiter")
		SetPlayerName(5, String.Key("_Player5Name"))
		--SetPlayerName(2, "Eindringende Barbaren")
		SetPlayerName(2, String.Key("_Player2Name"))
		
		Tools.ExploreArea(-1, -1, 900)
end
