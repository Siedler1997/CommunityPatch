
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

--Include briefings

IncludeLocals("briefing_prelude")
IncludeLocals("briefing_Major")
IncludeLocals("briefing_Atack")
IncludeLocals("briefing_Informer")
IncludeLocals("briefing_final")
IncludeLocals("briefing_Surrender")

--Include gameControl and other files

IncludeLocals("gameControl")

IncludeLocals("P1Spawn")
IncludeLocals("CityToPlayer")
IncludeLocals("TrickyNPC")
IncludeLocals("NpcNotVisited")
IncludeLocals("TowersQuest")
IncludeLocals("RandomEasyAttacks")
IncludeLocals("CampsArmies")
IncludeLocals("MainArmy1")
IncludeLocals("MainArmy2")
IncludeLocals("MainArmy3")
IncludeLocals("DefenseArmy")
IncludeLocals("Bombs")
IncludeLocals("quest_defeat")

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
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 8, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )

	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
	-- Set Colors
	
	Display.SetPlayerColorMapping(2, ENEMY_COLOR2)	
	Display.SetPlayerColorMapping(4, FRIENDLY_COLOR2)	
	Display.SetPlayerColorMapping(5, NPC_COLOR)	
	Display.SetPlayerColorMapping(7, ROBBERS_COLOR)	
	Display.SetPlayerColorMapping(8, KERBEROS_COLOR)		
	
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1, PLAYER_COLOR)
	else
		Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
	end
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Weathermachine     	,0 )	
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_PowerPlant      	,0 )
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast    	,0 ) 
	        Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather      	,0 ) 


	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(7, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(7)
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
	if GDB.GetValue("Game\\Campaign_Difficulty") < 2 then
		AddPeriodicSummer(10)	
	else
	    AddPeriodicSummer(600)
	    AddPeriodicRain(120)
	end
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

		CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

		String.Init("CM04_01_Revenge")

	--	resources
	
		if CP_Difficulty == 0 then
			GlobalMissionScripting.GiveResouces(1, 2000, 500, 500, 500, 500, 500)
		else
			GlobalMissionScripting.GiveResouces(1, 1000, 500, 500, 500, 500, 500)
		end

		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		StartChestQuest()

		--SetPlayerName(2, "Barbaren")
		SetPlayerName(2, String.Key("_Player2Name"))



	-- Set Music-Set
	
		LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = EUROPEMUSIC
		Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)
	
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(1, 2)
		end	
	
	--	start quest
		
	--	EnableDebugging()

		StartQuest1()
		Player1Spawn()
		NpcVisited=0
		SpawnAttacksStatus=0
        	CreateComplicatedNPC()
		DetectSpokenNPC()
		StartJob("ChangingNPC")
		MakeInvulnerable("Prison")
		MakeInvulnerable("Wolf1")
		MakeInvulnerable("Wolf2")
		MakeInvulnerable("Wolf3")
		MakeInvulnerable("Wolf4")
		MakeInvulnerable("Wolf5")
		MakeInvulnerable("CapTent5")
		CreateLowPowerBombs()
		createDefenseArmy1()
		createDefenseArmy2()
		createDefenseArmy3()
		createDefenseArmy4()
		createDefenseArmy5()
		createDefenseArmy6()
		startQuestDefeat()
		   
		if CP_Difficulty > 0 then
			if CP_Difficulty == 2 then
				GUI.SetTaxLevel(1)
				
				Logic.CreateEntity(Entities.PB_DarkTower3, 8800, 28640, 0, 2);
			else
				Logic.CreateEntity(Entities.PB_DarkTower2, 8800, 28640, 0, 2);
			end
			
			local vc2pos = GetPosition("vc_empty2") 	
			DestroyEntity("vc_empty2")
			Logic.CreateEntity(Entities.XD_RuinMonastery2,vc2pos.X,vc2pos.Y,270,0)
			
			RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
			--RaidersCreate({player = 7, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
			RaidersCreate({player = 7, pos = "bearpos3", revier = 1000, range = 3500, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
		else
			CreateRandomChests()
		end

		--Tools.ExploreArea(-1, -1, 900)
		--StartSimpleJob("GetMousePos")
	end

