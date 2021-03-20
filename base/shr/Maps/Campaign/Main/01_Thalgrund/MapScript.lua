--------------------------------------------------------------------------------
-- MapName: 	Thalgrund
--
-- Author: 		Andreas Nitsche
--
--------------------------------------------------------------------------------

-- 	Include main function

	Script.Load(Folders.MapTools.."Main.lua")
	Script.Load(Folders.MapTools.."Ai\\Support.lua")
	Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")	--TF

	CP_Difficulty = 0
	
	--	globals
	
		IncludeGlobals("Information")
		
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("Cutscene_Control")

	
		IncludeLocals("gameControl")
	
		IncludeLocals("player_1")
		IncludeLocals("player_2")
		IncludeLocals("player_6")
		IncludeLocals("player_7")
		
		IncludeLocals("briefing_prelude")
		IncludeLocals("briefing_priest")
		IncludeLocals("briefing_establishBase")
		IncludeLocals("briefing_attackingBandits")
		IncludeLocals("briefing_hireTroops")
		IncludeLocals("briefing_leonardo")
		IncludeLocals("briefing_keymaster")
		IncludeLocals("briefing_gate")
		IncludeLocals("briefing_merchant")
		IncludeLocals("briefing_destroyGate")
		IncludeLocals("briefing_keymasterAppears")
		IncludeLocals("briefing_miner")
		IncludeLocals("briefing_minerGiveRing")
		IncludeLocals("briefing_ironMine")
		IncludeLocals("briefing_2ndVillage")
		IncludeLocals("briefing_robber1Attack")
		IncludeLocals("briefing_NPCRiver1")
				
		IncludeLocals("army_villageRaiders")
		IncludeLocals("army_bigBoss")
		IncludeLocals("army_attackingBandits")
		IncludeLocals("army_banditGroups")

		IncludeLocals("quest_reachArea")
		IncludeLocals("quest_merchant")
		IncludeLocals("quest_establishBase")
		IncludeLocals("quest_hireTroops")
		IncludeLocals("quest_leonardo")
		IncludeLocals("quest_gate")
		IncludeLocals("quest_rescueKeymaster")
		IncludeLocals("quest_miner")
		IncludeLocals("quest_minerGiveRing")
		IncludeLocals("quest_ring")
		IncludeLocals("quest_2ndVillage")
	
		IncludeLocals("Map_LocalInit")		--TF_Include!
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1,	8, Diplomacy.Friendly )

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
	
	Display.SetPlayerColorMapping(2, FRIENDLY_COLOR1)		-- East village
	Display.SetPlayerColorMapping(6, FRIENDLY_COLOR2)		-- West village

	Display.SetPlayerColorMapping(4, FRIENDLY_COLOR1)		-- NPCs; yellow
	Display.SetPlayerColorMapping(5, NPC_COLOR)				-- Gate
	Display.SetPlayerColorMapping(8, FRIENDLY_COLOR1)		-- NPCs; yellow
	Display.SetPlayerColorMapping(7, KERBEROS_COLOR)		-- Kerberos' units
		
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

--		GlobalMissionScripting.GiveResouces(playerId, 0, 200, 200, 200)

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	DisableExpanding(GetHumanPlayer())
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechs(7)
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
	
	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()
	
	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)

	end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	String.Init("CM01_01_Thalgrund_Txt")

	--	chest handling

		CreateChestOpener("Dario")
--		CreateChestOpener("Ari")
--		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Erec")
--		CreateChestOpener("Salim")
--		CreateChestOpener("Helias")
	
		CreateRandomGoldChests()
		
		StartChestQuest()
	

	-- setup map
	
		setup_Map01()

	--	create all players

		createPlayer1()
		createPlayer2()
		createPlayer6()
		createPlayer7()
		
	-- set start resource after Johannes reached
		
		StartResource = {}
		StartResource.money = 300
		StartResource.clay 	= 590
		StartResource.wood 	= 750
		StartResource.stone	= 525

 	-- Check if Gate-Quest is started
		GateQuest_Started 	= 0
		MapBriefing_Started	= 0

	-- Set Music-Set
		LocalMusic.UseSet = EUROPEMUSIC

	--	entry point

		StartBinkVideo("Intro") 

	-- Start Quests

		start1stQuest()		
		start2ndSubQuest()				
		
		if CP_Difficulty == 1 then
			local vcpos1 = GetPosition("vc_empty1")
			DestroyEntity("vc_empty1")
			Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos1.X,vcpos1.Y,90,0)
				
			local vcpos2 = GetPosition("vc_empty2")
			DestroyEntity("vc_empty2")
			Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos2.X,vcpos2.Y,0,0)
	
			local bosspos1 = GetPosition("Jail")
			local bossID1 = AI.Entity_CreateFormation(7,Entities.CU_VeteranCaptain,0,0,(bosspos1.X - 800),(bosspos1.Y - 1000),0,0,3,0)
			LookAt(bossID1, "gate")
		end

		--Tools.ExploreArea(-1, -1, 900)
	end



