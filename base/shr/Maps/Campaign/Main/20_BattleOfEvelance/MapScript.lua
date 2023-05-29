--------------------------------------------------------------------------------
-- MapName: 	CM_20_BattleOfEvelance
-- Author: 		Andreas Nitsche, Thomas Friedmann
--                                                                              
-- Quest: 	                                                                    
--                                                                              
----------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	Input.KeyBindDown (Keys.NumPad0, "Cheat_Trader1_Start()")
	Input.KeyBindDown (Keys.NumPad4, "Cheat_Trader3_Start()")


	-- Include main function
		Script.Load( "Data\\Script\\MapTools\\Main.lua" )

		CP_Difficulty = 0

	--	globals
	
		IncludeGlobals("MapEditorTools")
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("player_1")
		IncludeLocals("player_4")
		IncludeLocals("player_5")
		IncludeLocals("player_7")
		IncludeLocals("player_8")

		IncludeLocals("gameControl")
		IncludeLocals("tributeControl")
	
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_destroyOutpost")
		IncludeLocals("quest_destroyLionsDen")
		IncludeLocals("quest_trader1")
		IncludeLocals("quest_trader2")
		IncludeLocals("quest_trader3")
		IncludeLocals("quest_reinforcements")
		IncludeLocals("quest_wetCannons")
		IncludeLocals("quest_reachWeatherMachine")
		IncludeLocals("quest_rewards")
		IncludeLocals("quest_weatherMaker")
		
		IncludeLocals("army_attack1")
		IncludeLocals("army_attack2")
		IncludeLocals("army_attack3")
		IncludeLocals("army_minePatrol")
		IncludeLocals("army_defendDen")
		IncludeLocals("army_defendMines")
		IncludeLocals("army_kerberosdefense")
		
		IncludeLocals("briefing_prelude")
		IncludeLocals("briefing_trader1")
		IncludeLocals("briefing_trader2")
		IncludeLocals("briefing_trader3")
		IncludeLocals("briefing_explodingCannons")
		IncludeLocals("briefing_Trader2Paid")
		IncludeLocals("briefing_ReinforcementArrives")
		IncludeLocals("briefing_gatesOpen")
		IncludeLocals("briefing_weatherMachine")
		IncludeLocals("briefing_miner1")
		IncludeLocals("briefing_weatherMaker")

		IncludeLocals("Cutscene_Control")		--TF_Include!
		IncludeLocals("Map_LocalInit")			--TF_Include!


-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Hostile )

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
--function Tools.GiveResouces(_PlayerID, _gold, _clay,_wood, _stone,_iron,_sulfur)
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 2000, 1200, 2000, 1200, 1200, 1200)
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
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechs(3)
		ResearchAllMilitaryTechs(4)
		ResearchAllMilitaryTechs(5)
		ResearchAllMilitaryTechs(7)
		ResearchAllMilitaryTechs(8)
	end
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

		Display.SetPlayerColorMapping(2, NPC_COLOR)				-- NPCs
		Display.SetPlayerColorMapping(6, PLAYER_COLOR)			-- Player's walls

		Display.SetPlayerColorMapping(3, KERBEROS_COLOR)		-- Kerberos walls
		Display.SetPlayerColorMapping(4, KERBEROS_COLOR)		-- Kerberos Outpost
		Display.SetPlayerColorMapping(5, KERBEROS_COLOR)		-- Kerberos inner Castle
		Display.SetPlayerColorMapping(7, KERBEROS_COLOR)		-- Kerberos Dummy 1
		Display.SetPlayerColorMapping(8, KERBEROS_COLOR)		-- Kerberos Dummy 2

		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
			Display.SetPlayerColorMapping(6, ENEMY_COLOR1)
		end
end



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()

	--	set up all players

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupEvelance(1)
	WeatherSets_SetupEvelanceRain(2)
	WeatherSets_SetupEvelanceSnow(3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	
--	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)
--	Logic.AddWeatherElement(2, 500, 1, 2, 5, 10)
  
 
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
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		String.Init("CM01_20_BattleOfEvelance_Txt")

		CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")


	-- Set Music-Set
		LocalMusic.UseSet = EVELANCEMUSIC

	--	chest handling

		CreateChestOpener("dario")
		CreateChestOpener("erec")
		CreateChestOpener("helias")
		CreateChestOpener("ari")
		CreateChestOpener("pilgrim")
		CreateChestOpener("salim")
	
		
		StartChestQuest()


	-- Create players
		createPlayer1()
		--createPlayer4()
		createPlayer5()
		createPlayer7()
		createPlayer8()
		Logic.SetDiplomacyState( 1, 5, Diplomacy.Friendly )

	-- Start prelude

		CreateRandomGoldChests()	
		if CP_Difficulty == 0 then
			CreateRandomChests()

			DestroyEntity("hard_rock")
		else
			if CP_Difficulty == 2 then
				Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
				Display.SetPlayerColorMapping(6, ENEMY_COLOR1)
				GUI.SetTaxLevel(1)
			end

			if CP_Difficulty == 1 then
				DestroyEntity("hard_rock")
			end
			--[[
			local vcpos = GetPosition("vc_empty")
			DestroyEntity("vc_empty")
			Logic.CreateEntity(Entities.XD_RuinMonastery1,vcpos.X,vcpos.Y,0,0)
			--]]
			local towers1 = { Logic.GetPlayerEntities(1, Entities.PB_Tower3, 48, 0) }
			for i = 2, table.getn(towers1) do
				ReplaceEntity(towers1[i], Entities.PB_Tower2)
			end

			Logic.CreateEntity(Entities.PB_DarkTower3, 23600, 24400, 0, 4);
			Logic.CreateEntity(Entities.PB_DarkTower3, 25200, 24500, 0, 4);
			Logic.CreateEntity(Entities.PB_DarkTower3, 27200, 25000, 0, 4);
			Logic.CreateEntity(Entities.PB_DarkTower3, 26400, 25300, 0, 4);
			Logic.CreateEntity(Entities.PB_DarkTower3, 36300, 25200, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 36700, 24300, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 45700, 26200, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 40100, 22000, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 42000, 31900, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 43600, 33500, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 40700, 37300, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 40200, 35400, 0, 5);
			Logic.CreateEntity(Entities.PB_DarkTower3, 36100, 32200, 0, 5);
			
			for i = 1, 3 do
				local bosspos3 = GetPosition("tower_spawn"..i)
				local bossID3 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,bosspos3.X,(bosspos3.Y - 100),0,0,3,0)
				LookAt(bossID3, "supportA")
			end
			local bosspos4 = GetPosition("tower_spawn4")
			local bossID4 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,bosspos4.X,(bosspos4.Y + 300),0,0,3,0)
			LookAt(bossID4, "dario")
			
			local bosspos5 = GetPosition("army1")
			local bossID5 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos5.X + 250),(bosspos5.Y + 300),0,0,3,0)
			LookAt(bossID5, "tower_spawn1")
			local bossID6 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos5.X + 250),bosspos5.Y,0,0,3,0)
			LookAt(bossID6, "tower_spawn1")
			
			local bosspos7 = GetPosition("defend1")
			local bossID7 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos7.X + 100),(bosspos7.Y + 100),0,0,3,0)
			LookAt(bossID7, "tower_spawn1")
			local bossID8 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos7.X + 100),(bosspos7.Y - 350),0,0,3,0)
			LookAt(bossID8, "tower_spawn1")
		end

		RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
		RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (3 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})

		RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1})
		RaidersCreate({player = 7, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1})
		RaidersCreate({player = 7, pos = "bearpos3", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1})

		StartCutscene("Intro", startQuestDestroyOutpost)

		--StartSimpleJob("GetMousePos")
		--Tools.ExploreArea(-1, -1, 900)
		--CP_ActivateEvilMod(1, 1, 1)
		--ResearchTechnology( Technologies.GT_Tactics, 1 );
end
