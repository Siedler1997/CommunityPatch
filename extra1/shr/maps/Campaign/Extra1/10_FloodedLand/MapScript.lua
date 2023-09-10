Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0
------------------------------------------------------------------------------
function InitDiplomacy()
	SetHostile(1,3)
	SetHostile(1,4)
	SetHostile(1,6)
	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	GlobalMissionScripting.GiveResouces(1, 1000, 1000, 1000, 1000, 1000, 1000)
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
		ResearchAnimalTechs(4, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(6, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(4)
		ResearchAllMilitaryTechsAddOn(5)	-- Friendly Cavalry
		ResearchAllMilitaryTechsAddOn(6)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupMoorWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	if GDB.GetValue("Game\\Campaign_Difficulty") < 2 then
	    AddPeriodicSummer(10)
    else
	    AddPeriodicSummer(600)
	    AddPeriodicRain(120)
    end
end

------------------------------------------------------------------------------
function InitPlayerColorMapping()

	Display.SetPlayerColorMapping(2,NPC_COLOR)
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR3)
	Display.SetPlayerColorMapping(6,ROBBERS_COLOR)
		
	if CP_Difficulty < 2 then
		Display.SetPlayerColorMapping(1, PLAYER_COLOR)
        Display.SetPlayerColorMapping(3, NEPHILIM_COLOR)
        Display.SetPlayerColorMapping(4, NEPHILIM_COLOR)
	else
		Display.SetPlayerColorMapping(1, NEPHILIM_COLOR)
		Display.SetPlayerColorMapping(3, ENEMY_COLOR1)
		Display.SetPlayerColorMapping(4, ENEMY_COLOR1)
	end
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeGlobals("MapEditorTools")
	IncludeLocals("army_ambush")
	IncludeLocals("army_playerattack")
	IncludeLocals("army_big1")
	IncludeLocals("army_big2")
	IncludeLocals("army_blockade1")
	IncludeLocals("army_blockade2")
	IncludeLocals("army_patrol")
	IncludeLocals("army_queen")
	IncludeLocals("army_robbers")
	IncludeLocals("army_stables")
	IncludeLocals("army_stonepit")

	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_queen")
	IncludeLocals("briefing_queenDefense")

	IncludeLocals("gameControl")

	IncludeLocals("npc_graveYard")
	IncludeLocals("npc_graveYardHelped")
	IncludeLocals("npc_graveYardInfo")
	IncludeLocals("npc_hermit")
	IncludeLocals("npc_leoassistant")
	IncludeLocals("npc_leonardo")
	IncludeLocals("npc_leohome")
	IncludeLocals("npc_miner")
	IncludeLocals("npc_minerHelped")
	IncludeLocals("npc_outlook")
	IncludeLocals("npc_stables")
	
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")

	IncludeLocals("quest_gate")
	IncludeLocals("quest_graveYard")
	IncludeLocals("quest_rescueLeo")
	IncludeLocals("quest_queen")
	IncludeLocals("quest_queenDefense")
	IncludeLocals("quest_robbers")

    -- debugging stuff

    --EnableDebugging()

	--Init NPC Merchant Offers
	Mission_InitMerchants()      
	-- String
	String.Init("CM02_10_FloodedLand")
	
	Cutscenes[INTROCUTSCENE] 			= "INTRO"	
	Cutscenes[THRESHOLDONECUTSCENE] 	= "BLOCKADE"
	Cutscenes[THRESHOLTWOCUTSCENE] 		= "EVILQUEEN"
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"
	
			
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLTWOCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])	


	LocalMusic.UseSet = DARKMOORMUSIC
	
	if CP_Difficulty == 2 then
		Display.SetPlayerColorMapping(1, 2)
	end	

	start1stChapter()

	local bossID1 = AI.Entity_CreateFormation(6,Entities.CU_LeaderOutlaw1,0,0,25700,39500,0,0,3,0)
	LookAt(bossID1, "LeoAssistant")
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			Display.SetPlayerColorMapping(3, ENEMY_COLOR1)
			Display.SetPlayerColorMapping(4, ENEMY_COLOR1)

			GUI.SetTaxLevel(1)

			ReplaceEntity("vc_player", Entities.CB_Grange)
		end

		SetEntityName(Logic.CreateEntity(Entities.CB_RobberyTower1, 53200, 25000, 90, 3), "NephilimBaseHQ");
		SetEntityName(Logic.CreateEntity(Entities.XD_ScriptEntity, 53800, 25100, 0, 3), "NephilimHQSpawnPos");
	end

	RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 6, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 3500, types = RaidersDefaultSets.Evelance, samount = (2 + CP_Difficulty), ramount = (8 + CP_Difficulty * 2)})
	
	RaidersCreate({player = 6, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos3", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos4", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBlackBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add Merchant offers here. 
function Mission_InitMerchants()
	mercenaryId = Logic.GetEntityIDByName("NPC_Merchant_1")
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_Barbarian_LeaderClub2, 3, ResourceType.Iron, 225, ResourceType.Wood, 175, ResourceType.Gold, 150)		
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderSword2, 3, ResourceType.Sulfur, 100, ResourceType.Iron, 150, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow2, 3, ResourceType.Iron, 75, ResourceType.Wood, 150, ResourceType.Gold, 150)
	if CP_Difficulty == 0 then
		Logic.AddMercenaryOffer(mercenaryId, Entities.PV_Cannon4, 2, ResourceType.Sulfur, 200, ResourceType.Iron, 250, ResourceType.Gold, 250)	
	else
		Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BlackKnight_LeaderMace2, 3, ResourceType.Iron, 250, ResourceType.Wood, 150, ResourceType.Gold, 175)		
	end	
end