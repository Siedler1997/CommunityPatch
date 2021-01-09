Script.Load( "Data\\Script\\MapTools\\Main.lua" )

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

	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
    AddStone(1000)
    AddClay(500)
    AddGold(500)
    AddSulfur(0)
    AddIron(500)
    AddWood(1000)
    end
------------------------------------------------------------------------------
function InitTechnologies()
	
	-- Forbid market
	ForbidTechnology(Technologies.UP1_Market)
	ResearchTechnology(Technologies.GT_Mercenaries)
	ResearchTechnology(Technologies.GT_Construction)
	ResearchTechnology(Technologies.GT_Alchemy)
	ResearchTechnology(Technologies.GT_Literacy)
	ResearchTechnology(Technologies.GT_Mathematics)
	ResearchTechnology(Technologies.GT_Binocular)
	ResearchTechnology(Technologies.T_ThiefSabotage)

	if GDB.GetValue("Game\\Campaign_Difficulty") == 1 then
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(3)
		ResearchAllMilitaryTechsAddOn(5)
	else
		ResearchTechnology(Technologies.GT_StandingArmy)	
		ResearchTechnology(Technologies.GT_GearWheel)
		ResearchTechnology(Technologies.GT_Matchlock)
	end
		
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

	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,NEPHILIM_COLOR)
	Display.SetPlayerColorMapping(3,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(4,FRIENDLY_COLOR1)
	Display.SetPlayerColorMapping(5,NEPHILIM_COLOR)
	Display.SetPlayerColorMapping(6,NPC_COLOR)
	Display.SetPlayerColorMapping(7,PLAYER_COLOR)
	Display.SetPlayerColorMapping(8,NPC_COLOR)
		
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