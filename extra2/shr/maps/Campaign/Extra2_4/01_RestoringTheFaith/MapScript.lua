
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

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
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 7, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 3, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 7, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 8, 6, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )


	
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_PowerPlant, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)

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

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(6, true)
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
	
end

----------------------------------------------------------------------------
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())

    Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)
    Display.SetPlayerColorMapping(3, MORTFICHET_COLOR)
    Display.SetPlayerColorMapping(5, ROBBERS_COLOR)
    Display.SetPlayerColorMapping(6, ENEMY_COLOR2)
    Display.SetPlayerColorMapping(7, ARIS_ROBBERS)
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	local leaderBpos = GetPosition("LeaderB")
	DestroyEntity("LeaderB")
	local newLeaderB = AI.Entity_CreateFormation(2,Entities.CU_VeteranLieutenant,0,0,leaderBpos.X,leaderBpos.Y,0,0,CP_Difficulty+1,0)
    SetEntityName(newLeaderB, "LeaderB")
	LookAt("LeaderB", "Dario")

	String.Init("CM06_01_RestoringTheFaith")
	--	flags

	biserica = 0
	brother  = 0
	preputz  = 0
	bulache	 = 0

--	locals

	IncludeLocals("gameControl")
		
	IncludeLocals("army_barbGuards")
	IncludeLocals("army_Bombs")
	IncludeLocals("army_bridge")
	IncludeLocals("army_defenses")
	IncludeLocals("army_raiders")
	IncludeLocals("army_templarHero")
	IncludeLocals("army_templars")
		
	IncludeLocals("npc_brother")
	IncludeLocals("npc_sister")
	IncludeLocals("npc_traitor")
	IncludeLocals("npc_pietrar")
	IncludeLocals("npc_demo")
	IncludeLocals("npc_mayor_chapter2")
	IncludeLocals("npc_templarHero")
	--IncludeLocals("npc_geologist")
		
	IncludeLocals("quest_captureleader")
	IncludeLocals("quest_cathedral")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_victory")
	IncludeLocals("quest_buildupmoor")
	IncludeLocals("quest_buildupplateau")
	IncludeLocals("quest_iron")
		
		
	IncludeLocals("briefing_intro")
	IncludeLocals("briefing_pietrar")
	IncludeLocals("briefing_traitor")
	IncludeLocals("briefing_traitorAppears")
	IncludeLocals("briefing_sister")
	IncludeLocals("briefing_sistersaved")
	IncludeLocals("briefing_mayor_chapter2")
	IncludeLocals("briefing_leaderBarb")
	IncludeLocals("briefing_demo2")
	IncludeLocals("briefing_ironpaid")
	IncludeLocals("briefing_churchleft")
	--IncludeLocals("briefing_geologist")
		
-- 	Set Music-Set

	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = EUROPEMUSIC
--	Chests
	CreateChestOpener("Dario")
	StartChestQuest()
	
--	Start Control

	Start1stChapter()
		
--	Players
	
	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
						    	
	--EnableDebugging()

	--SetPlayerName(2, "Barbar Raiders")
	SetPlayerName(2, String.Key("_Player2Name"))

	
	if CP_Difficulty > 0 then
		GlobalMissionScripting.GiveResouces(1, 1000, 1000, 500, 1500, 1000, 150)

		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			
			Logic.CreateEntity(Entities.PB_DarkTower3, 20000, 47300, 0, 2);
			Logic.CreateEntity(Entities.PB_DarkTower3, 25200, 46700, 0, 2);
		else
			CreateRandomChests()

			Logic.CreateEntity(Entities.PB_DarkTower2, 20000, 47300, 0, 2);
			Logic.CreateEntity(Entities.PB_DarkTower2, 25200, 46700, 0, 2);
		end
	else
		GlobalMissionScripting.GiveResouces(1, 1500, 2000, 500, 3000, 3000, 500)

		CreateRandomChests()
	end
	
	RaidersCreate({player = 5, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (2 + CP_Difficulty), ramount = (8 + CP_Difficulty * 2)})
	RaidersCreate({player = 5, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 5, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end


