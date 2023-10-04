
--	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
        Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
        Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- Set Colors
	
		Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
		Display.SetPlayerColorMapping(2, ROBBERS_COLOR)		
		Display.SetPlayerColorMapping(3, ENEMY_COLOR1)		
		Display.SetPlayerColorMapping(4, ENEMY_COLOR2)
		Display.SetPlayerColorMapping(5, ENEMY_COLOR1)
		Display.SetPlayerColorMapping(7, ENEMY_COLOR1)
		Display.SetPlayerColorMapping(6, ENEMY_COLOR2)			
		Display.SetPlayerColorMapping(8, NPC_COLOR)		
	
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
	
	ResearchAllMilitaryTechsAddOn(2)
	ResearchAllMilitaryTechsAddOn(3)
	ResearchAllMilitaryTechsAddOn(5)
	ResearchAllMilitaryTechsAddOn(7)
	
	ResearchAnimalTechs(2)
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
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 900, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 100, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 400, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 100, 1, 2, 5, 10)		-- Foggy with Rain
--	Logic.AddWeatherElement(3, 640, 1, 3, 5, 10)	-- Winter with Snow
--	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
--	Logic.AddWeatherElement(1, 60, 1, 1, 5, 10)		-- Sommer
--	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)	-- Foggy with Rain
	end

 
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition
 
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

--	IncludeLocals("Cutscene_Control")

	-- Load mission files
	String.Init("SP_rivercrossing")


	IncludeLocals("views")
	IncludeLocals("briefing_prelude")
	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")
	IncludeLocals("player_7")
	IncludeLocals("player_8")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_victory")
	IncludeLocals("army_spawn")
	IncludeLocals("army_defend")
        IncludeLocals("army_southernAssault")


	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	createPlayer7()
	createPlayer8()

	
	-- set player names
	
		Logic.SetPlayerName(1, String.MainKey.."_Player1Name")

	-- Set Music-Set

		LocalMusic.UseSet = HIGHLANDMUSIC

	-- Start time line

		TimeLine.Start()

	--	chest stuff
		
		--	the openers
		
			CreateChestOpener("braveheart")
	
	-- Start prelude

		--EnableDebugging()
		--AddGold(10000)
	
		start1stQuest()	
		
		RaidersCreate({player = 2, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 4, ramount = 10})
		RaidersCreate({player = 2, pos = "bearpos1", revier = 2000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 3})

		--StartSimpleJob("GetMousePos")
		--Tools.ExploreArea(-1, -1, 900)
end
