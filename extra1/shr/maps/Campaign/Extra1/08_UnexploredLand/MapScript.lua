Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0

------------------------------------------------------------------------------
function InitDiplomacy()
    -- diplomacy
    SetHostile(1,2)
    SetHostile(1,7)
    SetHostile(8,2)
    SetHostile(8,7)
end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(0)
    AddClay(0)
    AddGold(0)
    AddSulfur(0)
    AddIron(0)
    AddWood(0)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 1 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			--ForbidTechnology(Technologies.UP2_Village)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(7)
		ResearchAllMilitaryTechsAddOn(8)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupMoorWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicWinter(300)
	AddPeriodicSummer(800)
	AddPeriodicWinter(200)
	
	StartWinter(10000000)
end
------------------------------------------------------------------------------
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(2, 2)		
		Display.SetPlayerColorMapping(4, 2)	
	else
		Display.SetPlayerColorMapping(2, 6)		
		Display.SetPlayerColorMapping(4, 6)	
	end

	Display.SetPlayerColorMapping(3,NPC_COLOR)
	if p1color ~= 5 then
		Display.SetPlayerColorMapping(5,FRIENDLY_COLOR1)
		Display.SetPlayerColorMapping(8,FRIENDLY_COLOR1)
	else
		Display.SetPlayerColorMapping(5,3)
		Display.SetPlayerColorMapping(8,3)
	end
	Display.SetPlayerColorMapping(7,ROBBERS_COLOR)

end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeLocals("army_bridges")
	IncludeLocals("army_DestroyHQ")
	IncludeLocals("army_nephilimsHQ")
	IncludeLocals("army_p8Defense")
	IncludeLocals("army_player")
	IncludeLocals("army_tribalCamps")
	IncludeLocals("army_robbers")

	IncludeLocals("briefing_bridges")
	IncludeLocals("briefing_cleanUpRuins")
	IncludeLocals("briefing_prelude")

	IncludeLocals("gameControl")

	IncludeLocals("npc_gate1")
	IncludeLocals("npc_gate2")
	IncludeLocals("npc_hq1")
	IncludeLocals("npc_hq2")
	IncludeLocals("npc_hq3")

	IncludeLocals("player_2")
	IncludeLocals("player_7")
	IncludeLocals("player_8")

	IncludeLocals("quest_bridges")
	IncludeLocals("quest_cleanUpRuins")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_gatekey1")
	IncludeLocals("quest_gatekey2")

	--Init String tables
	String.Init("CM02_08_UnexploredLand")
	
    -- debugging stuff

    --EnableDebugging()
    
   
	-- String
	String.Init("CM02_08_UnexploredLand")
	
	Cutscenes 							= {}
	Cutscenes[INTROCUTSCENE] 			= "INTRO"	
	Cutscenes[THRESHOLDONECUTSCENE] 	= "ATTACKSOLDIER"
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"

				
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Moor)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Moor
    
    LocalMusic.UseSet = DARKMOORMUSIC
	
	-- start
	StartCutscene(Cutscenes[INTROCUTSCENE],start1stChapter)
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		end

		SetEntityName(Logic.CreateEntity(Entities.CB_Bastille1, 23500, 14000, 90, 7), "RobberyTower1");
		SetEntityName(Logic.CreateEntity(Entities.CB_Bastille1, 46200, 65700, 270, 7), "RobberyTower2");
		
		SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 24100, 13900, 90, 7), "RobbersSpawnPos1");
		SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 45600, 65800, 270, 7), "RobbersSpawnPos2");
		
		Logic.CreateEntity(Entities.XD_LargeCampFire, 24400, 14000, 0, 7);
		Logic.CreateEntity(Entities.XD_LargeCampFire, 45300, 65800, 180, 7);

		local bossID1 = AI.Entity_CreateFormation(7,Entities.CU_LeaderOutlaw1,0,0,45500,65900,0,0,3,0)
		LookAt(bossID1, "ArmyMovePos0")
		local bossID2 = AI.Entity_CreateFormation(7,Entities.CU_LeaderOutlaw1,0,0,24200,14000,0,0,3,0)
		LookAt(bossID2, "NPCHQ3")
	end

	RaidersCreate({player = 7, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 7, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 7, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos1_wp3"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (3 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 7, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1", "rudelpos4_wp2"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (4 + CP_Difficulty), ramount = (7 + CP_Difficulty * 2)})
	
	RaidersCreate({player = 7, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 7, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end
