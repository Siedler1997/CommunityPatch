Script.Load( "Data\\Script\\MapTools\\Main.lua" )

CP_Difficulty = 0
TIMER_WINTER = 10 * 60

IncludeLocals("gameControl")
IncludeLocals("player2")
IncludeLocals("player4")
IncludeLocals("player5")
IncludeLocals("player7")
IncludeLocals("army_tools")
IncludeLocals("army_barbarianAttack")
IncludeLocals("army_wolvesAttack")
IncludeLocals("army_outpost")
IncludeLocals("army_wolves")
IncludeLocals("army_vargWolves")
IncludeLocals("briefing_prelude")
IncludeLocals("briefing_shepherd")
IncludeLocals("briefing_winter")
IncludeLocals("briefing_winterEnd")
IncludeLocals("briefing_miner")
IncludeLocals("briefing_wolves")
IncludeLocals("briefing_wolvesEnd")
IncludeLocals("briefing_leonardo")
IncludeLocals("briefing_farmer")
IncludeLocals("briefing_varg")
IncludeLocals("briefing_vargWolves")
IncludeLocals("quest_winter")
IncludeLocals("quest_rescueSheep")
IncludeLocals("quest_wolves")
IncludeLocals("quest_varg")
IncludeLocals("quest_vargWolves")
IncludeLocals("quest_victory")
IncludeLocals("weather")

--Include cutscenes
Cutscenes = {}
Cutscenes[INTROCUTSCENE] = "INTRO"
Cutscenes[MISSIONCOMPLETECUTSCENE] = "MISSIONCOMPLETE"

IncludeLocals("Cutscene_" .. Cutscenes[INTROCUTSCENE])
IncludeLocals("Cutscene_" .. Cutscenes[MISSIONCOMPLETECUTSCENE])

------------------------------------------------------------------------------
function InitDiplomacy()
	SetHostile(1,2)
	SetHostile(1,6)
	SetHostile(1,7)
	SetHostile(2,7)
	SetFriendly(1,3)
	SetNeutral(1,5)
	SetNeutral(1,8)
	end
------------------------------------------------------------------------------
function InitResources()
    -- set some resources
	if GDB.GetValue("Game\\Campaign_Difficulty") == 0 then
		GlobalMissionScripting.GiveResouces(1, 1000, 1000, 1000, 1000, 1000, 1000)
	else
		GlobalMissionScripting.GiveResouces(1, 500, 500, 500, 500, 500, 500)
	end
end
------------------------------------------------------------------------------
function InitTechnologies()
	if GDB.GetValue("Game\\Campaign_Difficulty") > 0 then
		local animalTech2 = false
		if GDB.GetValue("Game\\Campaign_Difficulty") == 2 then
			ForbidTechnology(Technologies.T_AdjustTaxes, 1)
			animalTech2 = true
		end
		ResearchAnimalTechs(2, animalTech2)
		ResearchAnimalTechs(6, animalTech2)
		ResearchAnimalTechs(7, animalTech2)
		ResearchAllMilitaryTechsAddOn(2)
		ResearchAllMilitaryTechsAddOn(6)
		ResearchAllMilitaryTechsAddOn(7)
	end
end
------------------------------------------------------------------------------
function InitWeatherGfxSets()
	SetupHighlandWeatherGfxSet()
    end
------------------------------------------------------------------------------
function InitWeather()
	AddPeriodicSummer(10)
end

------------------------------------------------------------------------------
function InitPlayerColorMapping()
	Display.SetPlayerColorMapping(2,BARBARIAN_COLOR)
	Display.SetPlayerColorMapping(3,ARIS_ROBBERS)
	Display.SetPlayerColorMapping(4,15)
	Display.SetPlayerColorMapping(5,6)
	Display.SetPlayerColorMapping(6,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(7,ROBBERS_COLOR)
	Display.SetPlayerColorMapping(8,15)

	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())
end

------------------------------------------------------------------------------
function FirstMapAction()
	CP_Difficulty = GDB.GetValue("Game\\Campaign_Difficulty")

    -- debugging stuff
	-- EnableDebugging()
	--Game.GameTimeReset()
	
	-- Text Tool String
	String.Init("CM03_04_WolfsLair")
	
	LocalMusic.SetBriefing = LocalMusic.SetBriefingOld
	LocalMusic.UseSet = HIGHLANDMUSIC
	
	createPlayer2()
	createPlayer4()
	createPlayer5()
	createPlayer7()
	
	startChapterOne()

	if CP_Difficulty > 0 then
		if CP_Difficulty == 2 then
			GUI.SetTaxLevel(1)
			
			for i = 1, 4 do
				ChangePlayer("p1_tower"..i, 6)
			end
			ReplaceEntity("p1_tower1", Entities.CB_DestroyAbleRuinSmallTower1)
			Logic.SetModelAndAnimSet(GetEntityId("p1_tower1" ),Models.XD_RuinSmallTower2)
			ReplaceEntity("p1_tower2", Entities.CB_DestroyAbleRuinSmallTower1)
			Logic.SetModelAndAnimSet(GetEntityId("p1_tower2" ),Models.XD_RuinSmallTower2)
			ReplaceEntity("p1_tower3", Entities.CB_DestroyAbleRuinSmallTower3)
			Logic.SetModelAndAnimSet(GetEntityId("p1_tower3" ),Models.XD_RuinSmallTower4)
			ReplaceEntity("p1_tower4", Entities.CB_DestroyAbleRuinSmallTower3)
			Logic.SetModelAndAnimSet(GetEntityId("p1_tower4" ),Models.XD_RuinSmallTower4)
		end
		--TIMER_WINTER = TIMER_WINTER - 60 * 2
		--[[
        local vcpos = GetPosition("vc_empty")
        DestroyEntity("vc_empty")
        Logic.CreateEntity(Entities.XD_RuinMonastery2,vcpos.X,vcpos.Y,90,0)
		--]]
	end
	RaidersCreate({player = 6, pos = "rudelpos1", revier = {"rudelpos1", "rudelpos1_wp1"}, range = 4000, types = RaidersDefaultSets.Highland, samount = (2 + CP_Difficulty), ramount = (6 + CP_Difficulty * 2)})
	RaidersCreate({player = 6, pos = "bearpos1", revier = {"bearpos1", "bearpos1_wp1"}, range = 4000, types = { Entities.CU_AggressivePolarBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	RaidersCreate({player = 6, pos = "bearpos2", revier = 1500, range = 4000, types = { Entities.CU_AggressiveBear }, samount = 1, ramount = 1, experience = CP_Difficulty+1})
	
	--Tools.ExploreArea(-1, -1, 900)
	--StartSimpleJob("GetMousePos")
end