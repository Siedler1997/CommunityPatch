
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
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 7, Diplomacy.Hostile )
	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- Set Colors
		Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
		Display.SetPlayerColorMapping(2, ROBBERS_COLOR)		
		Display.SetPlayerColorMapping(3, ROBBERS_COLOR)		
		Display.SetPlayerColorMapping(4, ROBBERS_COLOR)
		Display.SetPlayerColorMapping(5, KERBEROS_COLOR)
--		Display.SetPlayerColorMapping(6, black)		
		Display.SetPlayerColorMapping(6, ROBBERS_COLOR)	
		Display.SetPlayerColorMapping(7, 4)	
		Display.SetPlayerColorMapping(8, NPC_COLOR)		
	
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	--ResearchTechnology(Technologies.T_LeatherMailArmor)
	--ResearchTechnology(Technologies.T_SoftArcherArmor)

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)
    Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 0)
	
	ResearchAllMilitaryTechsAddOn(5)
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
	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)	-- Sommer
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

	IncludeLocals("Cutscene_Control")

	-- Load mission files
	String.Init("SP_caraibeansurf")

	IncludeLocals("army_Assault")
	IncludeLocals("army_defend")
	IncludeLocals("army_spawn")
    
	IncludeLocals("briefing_bandits2prison")
	IncludeLocals("briefing_cave2")
	IncludeLocals("briefing_minesBuild")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_Q2")
	IncludeLocals("briefing_salim")
	IncludeLocals("briefing_salimNotFound")
	IncludeLocals("briefing_tower")

	IncludeLocals("gameControl")

	IncludeLocals("npc_2")
	IncludeLocals("npc_3")
	IncludeLocals("npc_bandits1")
	IncludeLocals("npc_erec")
	IncludeLocals("npc_erecAfterSalim")
	IncludeLocals("npc_leo2")
	IncludeLocals("npc_leo")
	IncludeLocals("npc_pirateLeader")

	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_8")
	
	IncludeLocals("quest_buildmines")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_destroyAttackers")
	IncludeLocals("quest_killPirates1")
	IncludeLocals("quest_killPirates2")
	IncludeLocals("quest_killPirates3")
	IncludeLocals("quest_rescueSalim2")
	IncludeLocals("quest_rescueSalim")
	IncludeLocals("quest_teleport1")
	IncludeLocals("quest_teleport2")
	IncludeLocals("quest_victory")

	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer5()
	createPlayer8()

	
	-- set player names
	
		Logic.SetPlayerName(1, String.MainKey.."_Player1Name")
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Pine)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Pine

	-- Set Music-Set

		LocalMusic.UseSet = MEDITERANEANMUSIC

	-- Start time line

		TimeLine.Start()

	--	chest stuff
		
	--	the openers
		
	CreateChestOpener("Dario")
	
	-- Start prelude

	--EnableDebugging()
	
	start1stQuest()	

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end
