-------------------------------------------------------------------------------
-- MapName: 	Village Attack
--
-- Author: 		Andreas Nitsche, Thomas Friedmann
--
--------------------------------------------------------------------------------

-- 	Include main function

	Script.Load(Folders.MapTools.."Main.lua")
	Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")	--TF

	CP_Difficulty = 0

	--	globals
	
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("Cutscene_Control")

		IncludeLocals("gameControl")
	
		IncludeLocals("player_1")
		IncludeLocals("player_2")
		IncludeLocals("player_3")
		IncludeLocals("player_4")
		IncludeLocals("player_5")
		
		IncludeLocals("quest_hireTroops")
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_rescueLeonardo")
		IncludeLocals("quest_defendCastle")
		IncludeLocals("quest_merchant")
		IncludeLocals("quest_defendVillage1")
		IncludeLocals("quest_searchMayor1")
		
		IncludeLocals("briefing_defendCastle")
		IncludeLocals("briefing_erecsArrival")
		IncludeLocals("briefing_moveToCastle")
		IncludeLocals("briefing_supportVillage1")
		IncludeLocals("briefing_leonardoDialog")
		IncludeLocals("briefing_FreeLeonardoHint")
		IncludeLocals("briefing_mayorDialog")
		IncludeLocals("briefing_merchantDialog")
		IncludeLocals("briefing_searchMayor1")
		IncludeLocals("briefing_supportVillageGoOn")
		IncludeLocals("briefing_robber1Attack")
		IncludeLocals("briefing_robber2Attack")
		IncludeLocals("briefing_VillageArmyComes")
		
		IncludeLocals("army_attack1")
		IncludeLocals("army_attack2")
		IncludeLocals("army_cave1")
		IncludeLocals("army_cave2")
		IncludeLocals("army_defendMine")
		IncludeLocals("army_defendRoute")
		IncludeLocals("army_defendIron")
		IncludeLocals("army_defendCamps")
		IncludeLocals("army_siege")
		IncludeLocals("army_erec")
	
	
		IncludeLocals("Map_LocalInit")		--TF_Include!
		

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile	)
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 1,	4, Diplomacy.Friendly 	)
	Logic.SetDiplomacyState( 1,	5, Diplomacy.Friendly 	)

	Logic.SetDiplomacyState( 2, 3, Diplomacy.Friendly 	)

	Logic.SetDiplomacyState( 4,	5, Diplomacy.Friendly 	)
	Logic.SetDiplomacyState( 4,	2, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 4,	3, Diplomacy.Hostile 	)

	Logic.SetDiplomacyState( 5,	2, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 5,	3, Diplomacy.Hostile 	)

	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

	
		Display.SetPlayerColorMapping(2, KERBEROS_COLOR)		-- Robbers
		Display.SetPlayerColorMapping(3, ROBBERS_COLOR)			-- Attackers from Cave

		Display.SetPlayerColorMapping(4, FRIENDLY_COLOR1)		-- Oberkirch
		Display.SetPlayerColorMapping(5, FRIENDLY_COLOR2)		-- Unterbach

		Display.SetPlayerColorMapping(7, PLAYER_COLOR)			-- VC in palyer's village

		Display.SetPlayerColorMapping(8, NPC_COLOR)				-- Trader

		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
			Display.SetPlayerColorMapping(7, ENEMY_COLOR1)
		end
		
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
		end

		ResearchAllMilitaryTechs(2)
		ResearchAllMilitaryTechs(3)
		ResearchAllMilitaryTechs(4)	--No enemy, but has to survive the cave-attack without help
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
	
	Logic.AddWeatherElement(1, 3000, 1, 1, 5, 10)
	Logic.AddWeatherElement(2,   60, 1, 2, 5, 10)
  
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

	--	chest handling

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
--		CreateChestOpener("Ari")
--		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Salim")
--		CreateChestOpener("Helias")
	
		
		StartChestQuest()
		
	--	default actions	
		
		String.Init("CM01_02_VillageAttack_Txt")

		setup_Map02()

	--	create all players

		createPlayer1()
		createPlayer2()
		createPlayer3()
		createPlayer4()
		createPlayer5()

	-- Set Music-Set
		LocalMusic.UseSet = EUROPEMUSIC

	--	entry point

		startQuestMoveToCastle()

		CreateRandomGoldChests()
		if CP_Difficulty == 0 then
			
		else
			local addWolves = 0
			if CP_Difficulty == 2 then
				Display.SetPlayerColorMapping(1, ENEMY_COLOR1)
				Display.SetPlayerColorMapping(7, ENEMY_COLOR1)
				GUI.SetTaxLevel(1)
			
				addWolves = addWolves + 2

				LocalMusic.SetBattle = LocalMusic.SetEvilBattle
			end

			local bosspos1 = GetPosition("guard1")
			local bossID1 = AI.Entity_CreateFormation(2,Entities.CU_VeteranCaptain,0,0,(bosspos1.X - 500),(bosspos1.Y - 450),0,0,3,0)
			LookAt(bossID1, "MinerClayMine")
		
			local bosspos2 = GetPosition("tower2")
			local bossID2 = AI.Entity_CreateFormation(2,Entities.CU_VeteranCaptain,0,0,(bosspos2.X + 1000),(bosspos2.Y + 600),0,0,3,0)
			LookAt(bossID2, "defendRoute")

			RaidersCreate({player = 3, pos = "rudelpos1", revier = 2000, range = 5000, samount = (2 + addWolves), ramount = (10 + addWolves)})
			RaidersCreate({player = 3, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 4000, samount = (2 + addWolves), ramount = (6 + addWolves)})
			RaidersCreate({player = 3, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 4000, samount = (3 + addWolves), ramount = (8 + addWolves)})
		end

		--Tools.ExploreArea(-1, -1, 900)
		--StartSimpleHiResJob("GetDarioPos")
	end

--[[
function GetDarioPos()
	local pos = GetPosition("Dario")
	Message("X: " .. pos.X .. "   Y: " .. pos.Y)
end
--]]