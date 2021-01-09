Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0
------------------------------------------------------------------------------
function InitDiplomacy()
    -- diplomacy
    SetHostile(1,2)
    SetHostile(7,2)
    SetFriendly(1,7)
end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources

    AddGold(500)
    AddStone(1200)
    AddSulfur(300)
    AddIron(300)
    AddWood(1600)
    AddClay(1600)

end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
	end
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

	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,ENEMY_COLOR1)
	Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(4,FRIENDLY_COLOR3)
	Display.SetPlayerColorMapping(5,FRIENDLY_COLOR2)
	Display.SetPlayerColorMapping(6,NPC_COLOR)
	
	-- Caravan color
	if BriefingCaravan2ShowStart == nil then
		Display.SetPlayerColorMapping(7,FRIENDLY_COLOR1)
	else
		Display.SetPlayerColorMapping(7,FRIENDLY_COLOR3)
	end
	
	Display.SetPlayerColorMapping(8,ENEMY_COLOR1)
		
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

	--Init NPC Merchant Offers
	Mission_InitMerchants()

	LocalMusic.UseSet = MEDITERANEANMUSIC

    -- debugging stuff
    
    --EnableDebugging()

	-- enable String text keys
	String.Init("CM02_04_TradingCaravans")

	-- start
	start1stChapter()	
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