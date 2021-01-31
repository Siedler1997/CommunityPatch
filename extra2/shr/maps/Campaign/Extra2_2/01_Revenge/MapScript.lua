
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

		Display.SetPlayerColorMapping(7, KERBEROS_COLOR)		
	
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


	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
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

	Logic.AddWeatherElement(1, 1000, 1, 1, 5, 10)	-- Sommer

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

		CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

		String.Init("CM04_01_Revenge")

	--	resources
	
		AddGold(2000)
		AddWood(500)
		AddClay(500)
		AddStone(500)
		AddIron(500)
		AddSulfur(500)


		CreateChestOpener("Dario")
		CreateChestOpener("Erec")
		CreateChestOpener("Helias")
		CreateChestOpener("Ari")
		CreateChestOpener("Pilgrim")
		CreateChestOpener("Salim")
	
		CreateRandomChests()
		StartChestQuest()

		--SetPlayerName(2, "Barbaren")
		SetPlayerName(2, String.Key("_Player2Name"))



	-- Set Music-Set

		LocalMusic.UseSet = EUROPEMUSIC
		Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)
	
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
		   
		if CP_Difficulty == 1 then
			local vc1pos = GetPosition("vc_empty1") 	
			local vc2pos = GetPosition("vc_empty2") 	

			DestroyEntity("vc_empty1")
			DestroyEntity("vc_empty2")
			--Logic.CreateEntity(Entities.XD_RuinMonastery1,vc1pos.X,vc1pos.Y,0,0)
			Logic.CreateEntity(Entities.XD_RuinTower2,vc2pos.X,vc2pos.Y,180,0)
		end

		--Tools.ExploreArea(-1, -1, 900)
	end

