--------------------------------------------------------------------------------
-- MapName: 	Plague
--
-- Author: 		Andreas Nitsche, Thomas Friedmann
--
--------------------------------------------------------------------------------

-- 	Include main function

	Script.Load(Folders.MapTools.."Main.lua")

	CP_Difficulty = 0

	--	globals
	
		IncludeGlobals("MapEditorTools")
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("gameControl")
	
		IncludeLocals("player_1")
		IncludeLocals("player_2")
		IncludeLocals("player_3")
		IncludeLocals("player_4")
		IncludeLocals("player_6")
		IncludeLocals("player_7")
		IncludeLocals("player_8")
		
		IncludeLocals("quest_searchPilgrim")
		IncludeLocals("quest_searchHelias")
		IncludeLocals("quest_destroyCastle")
		IncludeLocals("quest_bandits")
		IncludeLocals("quest_hireTroops")
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_chestRun")
		IncludeLocals("quest_merchant1")
		IncludeLocals("quest_npcPilgrim")
		IncludeLocals("quest_stoneRun")
		
		IncludeLocals("briefing_prelude")
		IncludeLocals("briefing_pilgrim")
		IncludeLocals("briefing_helias")
		IncludeLocals("briefing_bandits")
		IncludeLocals("briefing_npc1")
		IncludeLocals("briefing_npc2")
		IncludeLocals("briefing_npc3")
		IncludeLocals("briefing_npcPilgrim")
		IncludeLocals("briefing_merchant1")
		IncludeLocals("briefing_banditsDeliverA")
		IncludeLocals("briefing_banditsDeliverB")
		IncludeLocals("briefing_banditsDeliverC")

		
		IncludeLocals("army_southernAssault")
		IncludeLocals("army_castleDefenders")
		IncludeLocals("army_firstLineDefenders")
		IncludeLocals("army_raiders")
		IncludeLocals("army_mainForce")
		IncludeLocals("army_supportA")
		IncludeLocals("army_supportB")
		IncludeLocals("army_supportC")
		
		IncludeLocals("Map_LocalInit")		--TF_Include!
		IncludeLocals("Cutscene_Control")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile	)
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile 	)
--	Logic.SetDiplomacyState( 6, 2, Diplomacy.Hostile 	)		-- is set when talked to banditLeader
--	Logic.SetDiplomacyState( 6, 3, Diplomacy.Hostile 	)
--	Logic.SetDiplomacyState( 6, 5, Diplomacy.Hostile 	)

	Logic.SetDiplomacyState( 1, 6, Diplomacy.Friendly 	)
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 1,	8, Diplomacy.Friendly 	)

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
	
	Display.SetPlayerColorMapping(2, MORTFICHET_COLOR)		-- Mortfichets army
	Display.SetPlayerColorMapping(3, MORTFICHET_COLOR)		-- Defenders of Morfichets Castle
	Display.SetPlayerColorMapping(5, MORTFICHET_COLOR)		-- Other tropps of Mortfichet
	
	Display.SetPlayerColorMapping(4, FRIENDLY_COLOR1)		-- Village with Pilgrim (Verino)
	Display.SetPlayerColorMapping(6, ARIS_ROBBERS)			-- Aris leader merchant and support troops that follow heroes

	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)			-- Pirates
	Display.SetPlayerColorMapping(8, FRIENDLY_COLOR2)		-- infected village
	
	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
	end

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	--	resources

		AddGold(400)
		AddIron(200)
		AddWood(500)
		AddClay(1000)
		AddStone(500)
		AddSulfur(0)

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(3)
		ResearchAllMilitaryTechs(5)
		ResearchAllMilitaryTechs(6)	--No enemy, but has to be an useful help troop
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
	
	Logic.AddWeatherElement(1, 600, 1, 1, 10, 20)
	Logic.AddWeatherElement(2,  60, 1, 2, 10, 20)
	Logic.AddWeatherElement(1, 300, 1, 1, 10, 20)
	Logic.AddWeatherElement(2, 150, 1, 2, 10, 20)
	Logic.AddWeatherElement(1, 500, 1, 1, 10, 20)
	Logic.AddWeatherElement(2,  90, 1, 2, 10, 20)
  
 
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
		
	-- Set Music-Set

		LocalMusic.UseSet = MEDITERANEANMUSIC

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	

		startQuestChestRun()

		StartChestQuest()

	--
		tributeCounter = 1
		
	--	default actions	
		
		String.Init("CM01_13_Plague_Txt")

		setup_Map13()

		Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)
		Logic.SetShareExplorationWithPlayerFlag(1, 8, 1)

	--	create all players

		createPlayer1()		
		createPlayer2()
		createPlayer3()
		createPlayer4()
		createPlayer6()
		createPlayer7()
		createPlayer8()

	--	entry point

		start1stCutscene()
		
		CreateRandomGoldChests()
		if CP_Difficulty == 0 then
			CreateRandomChests()
		else
			if CP_Difficulty == 2 then
				Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
				GUI.SetTaxLevel(1)
			end

			--DestroyEntity("vc_empty")

			ReplaceEntity("ChangeCannon3", Entities.PV_Cannon3)
			ReplaceEntity("vc_player", Entities.PB_VillageCenter1)

			local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_Tower2, 48, 0) }
			for i = 1, table.getn(towers1) do
				if IsExisting(towers1[i]) then
					ReplaceEntity(towers1[i], Entities.PB_Tower3)
				end
			end
			local towers2 = { Logic.GetPlayerEntities(3, Entities.PB_Tower2, 48, 0) }
			for i = 1, table.getn(towers2) do
				if IsExisting(towers2[i]) then
					ReplaceEntity(towers2[i], Entities.PB_Tower3)
				end
			end
			
			Logic.CreateEntity(Entities.PB_Tower3, 35500, 27800, 0, 2);
			Logic.CreateEntity(Entities.PB_Tower3, 40400, 27300, 0, 2);
			Logic.CreateEntity(Entities.PB_Tower3, 44900, 24000, 0, 2);
		end

		RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Mediterranean, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
		RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1})

		--Tools.ExploreArea(-1, -1, 900)
		--StartSimpleJob("GetMousePos")
end
