------------------------------------------------------------------------------
-- Big City under Attack
------------------------------------------------------------------------------
function start1stChapter()

	-- Chests
	CreateRandomGoldChest(GetPosition("Chest"))
	CreateChestOpener("Ari")
	CreateChestOpener("Mirai")
	CreateChestOpener("Dario")
	CreateChestOpener("Pilgrim")
	StartChestQuest()
	
	-- Setup AI
	CreatePlayer2()
	CreatePlayer4()

	-- Spawn troops
	CreateArmyFirstAttack()
	CreateArmyCityDefense()
	
	StartCutscene(Cutscenes[INTROCUTSCENE],CreateBriefingPrelude)
	
	CreateQuestMirai()
	CreateQuestKillFirstAttackers()
	
	-- lost if hq destroyed
	AddDefeatEntity("HQ")
	
	--InitFog
	
	--Fog willl be enabled in cutscene
	CreateDynamicFog("LeftFog",0)
	
	CreateDynamicFog("MiddleFog", 0)
	CreateDynamicFog("RightFog", 0)

end
function end1stChapter()
	
	start2ndChapter()

end
------------------------------------------------------------------------------
-- Introduce Mirai and rescue city
------------------------------------------------------------------------------
function start2ndChapter()

	-- Create mirai entity and let her attack
	Attack(	CreateEntity(5, Entities.PU_Hero11, GetPosition("MiraiSpawn"), "Mirai"),
			"FirstAttackSpawn2")
	MakeInvulnerable("Mirai")
	
	Logic.SetShareExplorationWithPlayerFlag(1,5,1)
	
	CreateBriefingMirai()

	CreatePlayer5()
	CreateArmyMirai()	

	CreateQuestRescueCity()

end
function end2ndChapter()

	MakeVulnerable("Mirai")
	
	CitywallsPlayercolor = true
	InitPlayerColorMapping()

	-- remove names
	SetPlayerName(2,nil)
	SetPlayerName(4,nil)


	Display.SetPlayerColorMapping(3,GetPlayerPreferredColor())

	ResolveBriefing(briefingPreludeRescueCityQuest)
	ResolveBriefing(briefingPreludeShowIronMine)

	start3rdChapter()
	
end

------------------------------------------------------------------------------
-- Build up big city defense
------------------------------------------------------------------------------
function start3rdChapter()

	StartCutscene(Cutscenes[THRESHOLDONECUTSCENE],CreateBriefingDefend)
	
	Logic.ChangeAllEntitiesPlayerID(2, 1)
	CreateQuestBuildUpCity()

end
function end3rdChapter()

	start4thChapter()

end

------------------------------------------------------------------------------
-- First Attackers Wave appear
------------------------------------------------------------------------------
function start4thChapter()

	-- fog banks spawn together with army
	ChangeDynamicFog("MiddleFog", 7, 8)

	SetPlayerName(4, String.MainKey.."_Player4_2Name")
	--SetPlayerName(4,"Nebelvolk")
	
	Player4IsNephilim = true
	InitPlayerColorMapping()
		
	CreateArmyAttackers()

	CreateBriefingAttackers()

	CreateQuestFirstAttackersWave()

end
function end4thChapter()

	start5thChapter()
	
end
------------------------------------------------------------------------------
-- They will come back
------------------------------------------------------------------------------
function start5thChapter()

	-- fog banks spawn together with army
	ChangeDynamicFog("RightFog", 5, 8)
	ChangeDynamicFog("LeftFog", 6, 8)

	CreateArmyAttackers2()
	
	CreateBriefingAttackersGone()

	CreateQuestDefend()

end
function end5thChapter()

	--Disable QuestInformation
	GUIQuestTools.DisableQuestInformation()

	ResolveBriefing(briefingAttackersQuest)

	CreateBriefingRiflemen()

	start6thChapter()
	
end
------------------------------------------------------------------------------
-- Destroy Nephilim
------------------------------------------------------------------------------
function start6thChapter()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(4, true)
		ResearchAllMilitaryTechsAddOn(5, true)
		ResearchAllMilitaryTechsAddOn(6, true)
	end

	StartRain(60 * 1000)

	CreateArmyFinalAttack()

	--AnSu: A cutscene will be startet thru this briefing. See briefing_finalAttack.lua
	CreateBriefingFinalAttack()

	CreateQuestFinalAttack()

end
function end6thChapter()

	StartRain(1)
	
	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)

end