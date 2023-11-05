Script.Load( "Data\\Script\\MapTools\\Main.lua" )
IncludeLocals("player1")

CP_Difficulty = 0
------------------------------------------------------------------------------
function InitDiplomacy()
    -- diplomacy
    SetHostile(1,2)
    SetHostile(7,2)
    SetFriendly(1,7)
	
    SetHostile(1,8)
    SetHostile(7,8)
end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	GlobalMissionScripting.GiveResouces(1, 500, 1600, 1600, 1200, 300, 300)
end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 1 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(8)
	end
    createPlayer1()
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupSteppeWeatherGfxSet()
end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicSummer(10)
end
------------------------------------------------------------------------------
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	Display.SetPlayerColorMapping(2,NPC_COLOR)
	if p1color ~= 5 then
		Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)	
	else
		Display.SetPlayerColorMapping(3,6)
	end
	if p1color == 4 then
		Display.SetPlayerColorMapping(4,1)
	end
	if p1color ~= 3 then
		Display.SetPlayerColorMapping(5, 3)		
	else
		Display.SetPlayerColorMapping(5, 8)		
	end
	Display.SetPlayerColorMapping(6,CLEYCOURT_COLOR)
	
	-- Caravan color
	if BriefingCaravan2ShowStart == nil then
		if p1color ~= 5 then
			Display.SetPlayerColorMapping(7,FRIENDLY_COLOR1)	
		else
			Display.SetPlayerColorMapping(7,6)
		end
	else
		if p1color ~= 4 then
			Display.SetPlayerColorMapping(7,ENEMY_COLOR2)	
		else
			Display.SetPlayerColorMapping(7,1)
		end
	end
	
	Display.SetPlayerColorMapping(8,ROBBERS_COLOR)
end
------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeLocals("army_caravanAttack")
	IncludeLocals("army_one")
	IncludeLocals("army_patrol")
	IncludeLocals("army_three")
	IncludeLocals("army_two")
	IncludeLocals("army_defenses")

	IncludeLocals("briefing_caravan2")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_tradelord3")

	IncludeLocals("gameControl")

	IncludeLocals("npc_tradelord3")
	IncludeLocals("npc_riflemen")
	IncludeLocals("npc_motte")
	
	IncludeLocals("player_2")

	IncludeLocals("quest_caravan1")
	IncludeLocals("quest_caravan2")
	IncludeLocals("quest_caravanWP")
	IncludeLocals("quest_destroyTowers")
	
	--Init Cutscenes	
	Cutscenes[INTROCUTSCENE] 			= "INTRO"	
	Cutscenes[MISSIONCOMPLETECUTSCENE] 	= "MISSIONCOMPLETE"
	Cutscenes[THRESHOLDONECUTSCENE] 	= "TRADEATTACK"
			
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])
	
	ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS = table.getn(ScoutFoerster_SET_Pine)
	ScoutFoerster_gvScoutFoerster.treeSet = ScoutFoerster_SET_Pine

	--Init NPC Merchant Offers
	Mission_InitMerchants()

	LocalMusic.UseSet = MEDITERANEANMUSIC

    -- debugging stuff
    
    --EnableDebugging()

	-- enable String text keys
	String.Init("CM02_04_TradingCaravans")

	-- start
	start1stChapter()	

	local bosspos1 = GetPosition("P2_SpawnPoint_1")
	local boss1 = AI.Entity_CreateFormation(2,Entities.CU_LeaderOutlaw1,0,0,bosspos1.X,bosspos1.Y,0,0,3,0)
	LookAt(boss1, "Headquarter")
	local boss2 = AI.Entity_CreateFormation(2,Entities.CU_LeaderOutlaw1,0,0,53400,33900,0,0,3,0)
	LookAt(boss2, "Dario")
	local boss3 = AI.Entity_CreateFormation(2,Entities.CU_LeaderOutlaw1,0,0,40300,36200,0,0,3,0)
	LookAt(boss3, boss2)
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)

			--Logic.CreateEntity(Entities.XD_Rock7,49600,27700,0,0)
			
			Logic.CreateEntity(Entities.PV_Cannon3,40100,38900,70,2)
			Logic.CreateEntity(Entities.PV_Cannon3,39200,39100,110,2)

			ReplaceEntity("vc_player", Entities.CB_Grange)
		end

		for i = 1, 3 do
			ReplaceEntity("P4_TradeLord2_Gate"..i, Entities.XD_WallStraightGate_Closed)
		end
		--[[
		local vcpos = GetPosition("vc_empty")
		DestroyEntity("vc_empty")
		Logic.CreateEntity(Entities.XD_RuinResidence2,vcpos.X,vcpos.Y,0,0)
		--]]
		Logic.CreateEntity(Entities.PB_DarkTower3,39700,38900,0,2)
	end

	RaidersCreate({player = 8, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1", "rudelpos1_wp2"}, range = 3500, types = RaidersDefaultSets.Mediterranean, samount = (2 + CP_Difficulty), ramount = (5 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos2", revier = {"rudelpos2", "rudelpos2_wp1", "rudelpos2_wp2"}, range = 3500, types = RaidersDefaultSets.Mediterranean, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1", "rudelpos3_wp2"}, range = 3500, types = RaidersDefaultSets.Mediterranean, samount = (2 + CP_Difficulty), ramount = (5 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1", "rudelpos4_wp2", "rudelpos4_wp3"}, range = 3500, types = RaidersDefaultSets.Mediterranean, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})

	RaidersCreate({player = 8, pos = "bearpos1", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 8, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 8, pos = "bearpos3", revier = 1500, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})

	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add Merchant offers here. 
function
Mission_InitMerchants()
	
	mercenaryId = Logic.GetEntityIDByName("NPC_Merchant_1")
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Thief, 2, ResourceType.Sulfur, 150, ResourceType.Gold, 100)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderSword1, 3, ResourceType.Sulfur, 75, ResourceType.Iron, 150, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow1, 3, ResourceType.Iron, 75, ResourceType.Wood, 150, ResourceType.Gold, 150)
		
	mercenaryId = Logic.GetEntityIDByName("NPC_Merchant_2")
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderBow1, 3, ResourceType.Iron, 75, ResourceType.Wood, 150, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_BanditLeaderSword2, 3, ResourceType.Iron, 300, ResourceType.Sulfur, 150, ResourceType.Gold, 150)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PV_Cannon2, 3, ResourceType.Sulfur, 125, ResourceType.Iron, 175, ResourceType.Gold, 100)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PV_Cannon3, 2, ResourceType.Sulfur, 175, ResourceType.Iron, 225, ResourceType.Gold, 175)
	
end