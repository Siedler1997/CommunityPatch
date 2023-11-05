--------------------------------------------------------------------------------
-- MapName: 	Flood
--
-- Author: 		Andreas Nitsche, Thorsten Knop
--
--------------------------------------------------------------------------------

-- 	Include main function

	Script.Load(Folders.MapTools.."Main.lua")
	Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")

	CP_Difficulty = 0

	--	globals
	
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("gameControl")
	
		IncludeLocals("player_1")
		IncludeLocals("player_3")
		IncludeLocals("player_4")
		IncludeLocals("player_8")
		
		IncludeLocals("army_attack1")
		IncludeLocals("army_attack2")
		IncludeLocals("army_attack3")
		IncludeLocals("army_bandits")
		IncludeLocals("army_barmeciaDefenders")
		IncludeLocals("army_cleycourtPatrol")
		
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_leo")
		IncludeLocals("quest_key")
		IncludeLocals("quest_AriDead")
		
		IncludeLocals("briefing_prelude")
		IncludeLocals("briefing_leoTributes")
		IncludeLocals("briefing_merchant1")
		IncludeLocals("briefing_merchant2")
		IncludeLocals("briefing_merchant3")
		IncludeLocals("briefing_key")
		IncludeLocals("briefing_ChestFound")

		IncludeLocals("Map_LocalInit")		--TF_Include!
		IncludeLocals("Cutscene_Control")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	--	1 human
	--	3 cleycourt
	--	4 barmecia
	--	5 merchants
	-- 	8 enemy

	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 1,	6, Diplomacy.Hostile	)
	Logic.SetDiplomacyState( 1,	8, Diplomacy.Hostile	)
	Logic.SetDiplomacyState( 8,	3, Diplomacy.Hostile	)

	Logic.SetDiplomacyState( 1, 3, Diplomacy.Neutral	)
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral	)
	Logic.SetDiplomacyState( 8, 5, Diplomacy.Neutral	)
	Logic.SetDiplomacyState( 8, 4, Diplomacy.Neutral	)
	Logic.SetDiplomacyState( 3,	4, Diplomacy.Neutral	)

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	--Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,NPC_COLOR)
	--Display.SetPlayerColorMapping(3,BARMECIA_COLOR)
	Display.SetPlayerColorMapping(4,CLEYCOURT_COLOR)
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR2)
	Display.SetPlayerColorMapping(6,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7,NPC_COLOR)
	Display.SetPlayerColorMapping(8,CLEYCOURT_COLOR)
		
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 3 then
		Display.SetPlayerColorMapping(3, 3)		
	else
		Display.SetPlayerColorMapping(3, 1)		
	end

end
	

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
--	GeneratePlayerResources(3)--(2)
		-- Give much resources
	Tools.GiveResouces(1, 400, 800, 800, 800, 400, 600)

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

-- -> Player_1.lua
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechs(3)	--No enemy, but has to survive the enemy attacks without help
		ResearchAllMilitaryTechs(4)
		ResearchAllMilitaryTechs(6)
		ResearchAllMilitaryTechs(8)
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

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	
	Logic.SetupGfxSet(1)
	
--	Logic.AddWeatherElement(1, 90, 1, 1, 10, 20)
	Logic.AddWeatherElement(2, 300000, 1, 2, 10, 20)
  
 
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition
 
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
		CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

		String.Init("CM01_07_Flood")

	-- Create NPCs
	
--		MapLocal_CreateNPCs()
		InitMapNPCs()
 
	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC

	-- set tribute counter
		
		uniqueTributeCounter = 0
			
	--	create all players

		createPlayer1()
		createPlayer3()
		createPlayer4()
		createPlayer8()

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
--		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Salim")
	
		
		StartChestQuest()



	--	entry point

	startQuestMoveToLeo()


-- DEBUGG
		
--		EnableDebugging()

	if CP_Difficulty == 0 then
		CreateRandomGoldChests()
		CreateRandomChests()
	else
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		else
			CreateRandomGoldChests()
			CreateRandomChests()
		end
		
		local vcpos3 = GetPosition("vc_empty3")
		DestroyEntity("vc_empty3")
		Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos3.X,vcpos3.Y,0,0)
	end

	RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (5 + CP_Difficulty * 2)})
	RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp2", "rudelpos2_wp3"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})

	RaidersCreate({player = 6, pos = "rudelpos2_wp1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})	
	
	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end
