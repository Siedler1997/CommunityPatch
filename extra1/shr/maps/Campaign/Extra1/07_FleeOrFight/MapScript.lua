Script.Load( "Data\\Script\\MapTools\\Main.lua" )
IncludeLocals("player_1")

CP_Difficulty = 0
------------------------------------------------------------------------------
function InitDiplomacy()

	SetHostile(1,2)
	SetHostile(1,5)
	SetHostile(3,2)
	SetHostile(3,5)
	SetHostile(7,2)
	SetHostile(7,5)

	SetFriendly(1,3)
	SetFriendly(1,4)
	SetFriendly(1,7)
	SetHostile(1,8)

	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	GlobalMissionScripting.GiveResouces(1, 500, 500, 1000, 1000, 500, 0)
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
		ResearchAnimalTechs(3, animalTech2)
		ResearchAnimalTechs(5, animalTech2)
		ResearchAnimalTechs(8, animalTech2)

		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(5)
		ResearchAllMilitaryTechsAddOn(8)
	end
	CreatePlayer1()
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupHighlandWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()

	AddPeriodicSummer(120)
	AddPeriodicRain(30)
	AddPeriodicSummer(240)
	AddPeriodicRain(60)

end
------------------------------------------------------------------------------
function InitPlayerColorMapping()
	local p1color = GetPlayerPreferredColor()
	Display.SetPlayerColorMapping(1, p1color)
	if p1color ~= 2 then
		Display.SetPlayerColorMapping(2, 2)		
		Display.SetPlayerColorMapping(5, 2)	
	else
		Display.SetPlayerColorMapping(2, 6)		
		Display.SetPlayerColorMapping(5, 6)	
	end
	if p1color ~= 5 then
		Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)
		Display.SetPlayerColorMapping(4,FRIENDLY_COLOR1)
	else
		Display.SetPlayerColorMapping(3,8)
		Display.SetPlayerColorMapping(4,8)
	end
	Display.SetPlayerColorMapping(6,NPC_COLOR)
	Display.SetPlayerColorMapping(7, p1color)
	Display.SetPlayerColorMapping(8,ROBBERS_COLOR)
	
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

	-- load scripts
	IncludeLocals("army_attackers")
	IncludeLocals("army_eastVillageAttack")
	IncludeLocals("army_finalAttack")
	IncludeLocals("army_firstAttack")
	IncludeLocals("army_graveyardAttack")
	IncludeLocals("army_merchantAttack")
	IncludeLocals("army_p3Defense")
	IncludeLocals("army_player")
	IncludeLocals("army_reinforcement")
	IncludeLocals("army_ruinsAttack")

	IncludeLocals("briefing_finalAttack")
	IncludeLocals("briefing_prelude")

	IncludeLocals("gameControl")

	IncludeLocals("npc_eastVillage")
	IncludeLocals("npc_headquarter")
	IncludeLocals("npc_hermit")
	IncludeLocals("npc_johannes")
	IncludeLocals("npc_ruins")
	IncludeLocals("npc_firesignal3")
	
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_5")

	IncludeLocals("quest_bridge")
	IncludeLocals("quest_destroyEastBridge")
	IncludeLocals("quest_rescueSerfs")
	IncludeLocals("quest_surviveFinalAttack")
	IncludeLocals("quest_winter")
	IncludeLocals("quest_showlastattackers")
	
	
	LocalMusic.UseSet = HIGHLANDMUSIC
    -- debugging stuff

	--EnableDebugging()
	--Game.GameTimeReset()

	--Init NPC Merchant Offers
	Mission_InitMerchants()       
        
	-- String
	String.Init("CM02_07_FleeOrFight")
	
	Cutscenes = {}
	Cutscenes[INTROCUTSCENE] = "INTRO"	
	Cutscenes[THRESHOLDONECUTSCENE] = "SUPPORTFIREON"
	Cutscenes[THRESHOLTWOCUTSCENE] = "WINTERATTACK"
	Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"
	
			
	IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLDONECUTSCENE])	
	IncludeLocals("Cutscene_" .. Cutscenes[THRESHOLTWOCUTSCENE])	
	IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])
	
	-- start
	StartCutscene(Cutscenes[INTROCUTSCENE],start1stChapter)
	
	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
		end
		--[[
        local vcpos1 = GetPosition("vc_empty1")
        DestroyEntity("vc_empty1")
        Logic.CreateEntity(Entities.XD_RuinHouse2,vcpos1.X,vcpos1.Y,0,0)

        local vcpos2 = GetPosition("vc_empty2")
        DestroyEntity("vc_empty2")
        Logic.CreateEntity(Entities.XD_RuinResidence2,vcpos2.X,vcpos2.Y,0,0)
		--]]
	end

	RaidersCreate({player = 8, pos = "rudelpos1", revier = 2000, range = 3500, types = RaidersDefaultSets.Highland, samount = (2 + CP_Difficulty), ramount = (5 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos2", revier = 2000, range = 3500, types = RaidersDefaultSets.Highland, samount = (2 + CP_Difficulty), ramount = (5 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos3", revier = {"rudelpos3", "rudelpos3_wp1"}, range = 3500, types = RaidersDefaultSets.Highland, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 8, pos = "rudelpos4", revier = {"rudelpos4", "rudelpos4_wp1", "rudelpos4_wp1"}, range = 4000, types = RaidersDefaultSets.Highland, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	
	RaidersCreate({player = 8, pos = "bearpos1", revier = 2000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 8, pos = "bearpos2", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 8, pos = "bearpos3", revier = 1000, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	
	gvGUI.BonusHeroId = GetEntityId("Yuki")

	--StartSimpleJob("GetMousePos")
	--Tools.ExploreArea(-1, -1, 900)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Add Merchant offers here. 
function
Mission_InitMerchants()
	
	mercenaryId = Logic.GetEntityIDByName("NPC_Merchant_1")
	Logic.AddMercenaryOffer(mercenaryId, Entities.PU_Thief, 2, ResourceType.Sulfur, 150, ResourceType.Gold, 100)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PV_Cannon2, 4, ResourceType.Sulfur, 155, ResourceType.Iron, 175, ResourceType.Gold, 100)
	Logic.AddMercenaryOffer(mercenaryId, Entities.PV_Cannon3, 2, ResourceType.Sulfur, 195, ResourceType.Iron, 225, ResourceType.Gold, 175)
		
	mercenaryId = Logic.GetEntityIDByName("NPC_Merchant_2")
	Logic.AddMercenaryOffer(mercenaryId, Entities.CU_Barbarian_LeaderClub2, 8, ResourceType.Iron, 225, ResourceType.Wood, 175, ResourceType.Gold, 150)
end