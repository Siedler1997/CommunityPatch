
-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

IncludeLocals("GameControl")
IncludeLocals("briefing_intro")
IncludeLocals("npc_dario")
IncludeLocals("npc_drake")
IncludeLocals("npc_helios")
IncludeLocals("quest_Chapter1")
IncludeLocals("quest_Chapter2")
IncludeLocals("quest_Chapter3")
IncludeLocals("quest_Chapter4")
IncludeLocals("army_barbguards")
IncludeLocals("army_templars")
IncludeLocals("player_3")
IncludeLocals("player_8")


-- Logic.SetShareExplorationWithPlayerFlag(1, 4, 1) -----unde 4 este ID-ul playerului cu care vrei sa ai shared exploration


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++i++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 8, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 2, 8, Diplomacy.Hostile )
	--Logic.SetDiplomacyState( 8, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Neutral )


end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_PowerPlant     ,0 )

	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(4)
		ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(6)
		ResearchAllMilitaryTechsAddOn(7)
		ResearchAllMilitaryTechsAddOn(8)
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
	WeatherSets_SetupNormal(4, 0, 1)
	WeatherSets_SetupRain(5, 1, 1)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(1, 700, 1, 1, 5, 10)	-- Sommer
	--Logic.AddWeatherElement(2, 100, 1, 2, 5, 10)	-- Foggy with Rain

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mission_InitPlayerColorMapping()
	Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)
	Display.SetPlayerColorMapping(3, EVIL_GOVERNOR_COLOR)
	Display.SetPlayerColorMapping(4, EVIL_GOVERNOR_COLOR)
	Display.SetPlayerColorMapping(5, ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7, FRIENDLY_COLOR3)
	Display.SetPlayerColorMapping(8, 3)
	
	--Display.SetPlayerColorMapping(4, 3)
	--Display.SetPlayerColorMapping(7, 6)
	--4,7
	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
		--Display.SetPlayerColorMapping(8, 16)
	end
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	CreateChestOpener("Dario")

	StartChestQuest()


	createPlayer3()
	createPlayer8()
	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
	-- Load mission files
	String.Init("CM06_03_DivineAnger")

	-- debugging stuff
	--EnableDebugging()
	--Game.GameTimeReset()

		--test()

	-- Set Music-Set
	
		LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
		LocalMusic.UseSet = EUROPEMUSIC
	
	--	start quest

	StartCutscene(Cutscenes[INTROCUTSCENE],Start1stChapter)
	
	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, 2)
	end	

	
	-- SetPlayerName(2, "Vargs Barbaren")
	SetPlayerName(2, String.Key("_Player2Name"))
	-- SetPlayerName(8, "Ordens Truppen")
	SetPlayerName(8, String.Key("_Player8Name"))
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			
			--ReplaceEntity("keep", Entities.PB_Headquarters1)
		end

		local towers1 = { Logic.GetPlayerEntities(2, Entities.PB_DarkTower2, 10, 0) }
		for i = 2, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				ReplaceEntity(towers1[i], Entities.PB_DarkTower3)
			end
		end

		GlobalMissionScripting.GiveResouces(1, 1000, 1000, 1000, 800, 500, 150)
	else
		CreateRandomChests()

		GlobalMissionScripting.GiveResouces(1, 1500, 1500, 2000, 2000, 1500, 1000)
	end

	RaidersCreate({player = 5, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 5, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 4000, types = RaidersDefaultSets.Europe, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 5, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 5, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	
	for i = 1, 2 do
		local deadpos1 = GetPosition("burningtown")
		local deadID1 = AI.Entity_CreateFormation(5,Entities.CU_Barbarian_LeaderClub1,0,0,deadpos1.X,deadpos1.Y,0,0,CP_Difficulty+1,0)
		SetEntityName(deadID1, "deadBarb"..i)
		Move("deadBarb"..i, "deadBarbPos"..i)
		--LookAt("deadBarb1", "p8hq")
	end
	--LookAt(deadID1, "p2")
	for i = 1, 2 do
		local deadpos1 = GetPosition("burningtown")
		local deadID1 = AI.Entity_CreateFormation(5,Entities.CU_AggressiveWolf_Black,0,0,deadpos1.X,deadpos1.Y,0,0,CP_Difficulty+1,0)
		SetEntityName(deadID1, "deadWolf"..i)
		Move("deadWolf"..i, "deadWolfPos"..i)
		--LookAt(deadID1, "p2")
	end
	--LookAt("deadWolf2", "keep1")
	for i = 1, 4 do
		local deadpos1 = GetPosition("burningtown")
		local deadID1 = AI.Entity_CreateFormation(5,Entities.CU_BanditLeaderSword1,0,0,deadpos1.X,deadpos1.Y,0,0,CP_Difficulty+1,0)
		SetEntityName(deadID1, "deadBanditAxe"..i)
		--LookAt(deadID1, "keep1")
		Move("deadBanditAxe"..i, "deadBanditAxePos"..i)
	end
	local deadpos1 = GetPosition("burningtown")
	local deadID1 = AI.Entity_CreateFormation(5,Entities.CU_BanditLeaderBow1,0,0,deadpos1.X,deadpos1.Y,0,0,CP_Difficulty+1,0)
	SetEntityName(deadID1, "deadBanditBow")
	Move("deadBanditBow", "deadBanditBowPos")
	--LookAt(deadID1, "keep1")

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end

----------------------------------------------------------------------------------------------
