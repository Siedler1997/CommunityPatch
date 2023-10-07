
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

	IncludeGlobals("MapEditorTools")
	IncludeLocals("gameControl")
	
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_5")
	IncludeLocals("player_8")
	
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_merchant1")
	
	IncludeLocals("army_tools")
	IncludeLocals("army_defend")
	IncludeLocals("army_spawn")
	
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_victory")
	IncludeLocals("quest_viking")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )		-- North
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )		-- Other side of fjord
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )		-- robbers on small island

	Logic.SetDiplomacyState( 1, 4, Diplomacy.Neutral )
	
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()

	-- Set Colors
		local p1color = GetPlayerPreferredColor()
		Display.SetPlayerColorMapping(1, p1color)
		if p1color ~= 2 then
			Display.SetPlayerColorMapping(2, ENEMY_COLOR1)	
			Display.SetPlayerColorMapping(6, ENEMY_COLOR1)	
			Display.SetPlayerColorMapping(8, ENEMY_COLOR1)		
		else
			Display.SetPlayerColorMapping(2, ENEMY_COLOR2)	
			Display.SetPlayerColorMapping(6, ENEMY_COLOR2)		
			Display.SetPlayerColorMapping(8, ENEMY_COLOR2)		
		end

		Display.SetPlayerColorMapping(3, BARBARIAN_COLOR)	
		--Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		
		--Display.SetPlayerColorMapping(3, ENEMY_COLOR2)		
		Display.SetPlayerColorMapping(4, NPC_COLOR)		
		Display.SetPlayerColorMapping(5, ROBBERS_COLOR)		

		--Display.SetPlayerColorMapping(8, ENEMY_COLOR1)		

	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechs(2)
	ResearchAllMilitaryTechs(3)
	ResearchAllMilitaryTechs(5, true)
	ResearchAllMilitaryTechs(6, true)
	ResearchAllMilitaryTechs(7)
	ResearchAllMilitaryTechs(8)

	--ResearchAnimalTechs(5)
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
	Logic.AddWeatherElement(2, 140, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 320, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(2, 60, 1, 5, 5, 10)		-- Foggy with Rain and Snow
	Logic.AddWeatherElement(2, 60, 1, 4, 5, 10)		-- Foggy with Snow
	Logic.AddWeatherElement(3, 320, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 120, 1, 6, 5, 10)		-- Winter
	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(3, 90, 1, 8, 5, 10)		-- Winter with Rain and Snow
	Logic.AddWeatherElement(3, 60, 1, 7, 5, 10)		-- Winter with Rain
	Logic.AddWeatherElement(2, 90, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(1, 300, 1, 1, 5, 10)		-- Sommer
	Logic.AddWeatherElement(2, 130, 1, 2, 5, 10)	-- Foggy with Rain

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("SP01_04_FrozenFjord")

	mainQuestCount = 1
	uniqueTributeCount = 1
	
	armyPlayer2Count = 1
	armyPlayer3Count = 1

	--	create players
	
		createPlayer1()
		createPlayer2()
		createPlayer3()
		createPlayer5()
		createPlayer8()

	
	-- set player names
	
		Logic.SetPlayerName(GetHumanPlayer(), String.MainKey.."_Player1Name")
		Logic.SetPlayerName(2, String.MainKey.."_Player2Name")
		Logic.SetPlayerName(3, String.MainKey.."_Player3Name")
		--Logic.SetPlayerName(4, String.MainKey.."_Player4Name")
		Logic.SetPlayerName(5, String.MainKey.."_Player5Name")



	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Ari")
	
		CreateRandomGoldChests()
		CreateRandomChests()
	
		StartChestQuest()
	

	-- music set
	
       LocalMusic.UseSet = HIGHLANDMUSIC 

	--	exploring
	
		--	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
	
	--	start quest
	
		RaidersCreate({player = 5, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, types = RaidersDefaultSets.Highland, samount = 2, ramount = 10})
		RaidersCreate({player = 5, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 3500, types = RaidersDefaultSets.Highland, samount = 2, ramount = 10})

		create1stQuest()
		
		--Tools.ExploreArea(-1, -1, 900)
--	EnableDebugging()

		    	
end
