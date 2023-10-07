--------------------------------------------------------------------------------
-- MapName: Old Kings Castle
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

--	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Hostile )
	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- Set Colors
		local p1color = GetPlayerPreferredColor()
		Display.SetPlayerColorMapping(1, p1color)
		
		if p1color == 1 then
			Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		
			Display.SetPlayerColorMapping(4, BARMECIA_COLOR)	
		elseif p1color == 2 then
			Display.SetPlayerColorMapping(2, ENEMY_COLOR2)		
			Display.SetPlayerColorMapping(4, BARMECIA_COLOR)	
		else
			Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		
			Display.SetPlayerColorMapping(4, PLAYER_FRIEND_COLOR)	
		end

		--Display.SetPlayerColorMapping(2, ENEMY_COLOR1)		
		--Display.SetPlayerColorMapping(3, BARMECIA_COLOR)		
		Display.SetPlayerColorMapping(3, NPC_COLOR)		
		Display.SetPlayerColorMapping(8, ROBBERS_COLOR)	
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechs(2, true)
	ResearchAllMilitaryTechs(4, true)
	ResearchAllMilitaryTechs(8)
	
	ResearchAnimalTechs(8)
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

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)	-- Foggy with Rain
	Logic.AddWeatherElement(1, 280, 1, 1, 5, 10)	-- Sommer
	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(3, 640, 1, 3, 5, 10)	-- Winter with Snow
	Logic.AddWeatherElement(2, 60, 1, 2, 5, 10)		-- Foggy with Rain
	Logic.AddWeatherElement(1, 60, 1, 1, 5, 10)		-- Sommer
	Logic.AddWeatherElement(2, 180, 1, 2, 5, 10)	-- Foggy with Rain
	end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	IncludeLocals("Cutscene_Control")

	-- Load mission files
	String.Init("SP01_08_PeacefulLand")

	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_merchant1")
	IncludeLocals("briefing_merchant2")
	IncludeLocals("briefing_merchant3")
	IncludeLocals("gameControl")
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_4")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_victory")
	IncludeLocals("army_spawn")
	IncludeLocals("army_play")
	IncludeLocals("army_friend")

	createPlayer1()
	createPlayer2()
	createPlayer4()

	
	-- set player names
	
		Logic.SetPlayerName(2, String.MainKey.."_Player2Name")

	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC

	-- Start time line

		TimeLine.Start()

	--	chest stuff
		
		--	the openers
		
			CreateChestOpener("Dario")
			CreateChestOpener("Pilgrim")
	
	-- Start prelude

		--EnableDebugging()
	
		start1stQuest()	
		
		RaidersCreate({player = 8, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2", "rudelpos1_wp3", "rudelpos1_wp4"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 12})
		RaidersCreate({player = 8, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2", "rudelpos2_wp3"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 8, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1", "rudelpos3_wp2", "rudelpos3_wp3"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 10})
		RaidersCreate({player = 8, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1", "rudelpos4_wp2"}, range = 3500, types = RaidersDefaultSets.Europe, samount = 2, ramount = 8})
		RaidersCreate({player = 8, pos = "bearpos1", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})
		RaidersCreate({player = 8, pos = "bearpos2", revier = 3000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = 2})

		--Tools.ExploreArea(-1, -1, 900)
		--StartSimpleJob("GetMousePos")
end
