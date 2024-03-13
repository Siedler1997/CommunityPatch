------------------------------------------------------------------------------
-- Introduction, rescue serfs
------------------------------------------------------------------------------
function start1stChapter()
	Logic.SetShareExplorationWithPlayerFlag(1,4,1)
	Logic.SetShareExplorationWithPlayerFlag(1,7,1)

	AddDefeatEntity("P1_Headquarter")
	AddDefeatEntity("P3_EastVillage_HQ")
	
    Logic.SetPlayerPaysLeaderFlag(1,0)

	CreateChestOpener("Ari")
	CreateChestOpener("Salim")
	CreateChestOpener("Dario")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Helias")
	CreateChestOpener("Drake")
	CreateChestOpener("Yuki")
	StartChestQuest()
	
	-- Setup AI
	CreatePlayer2()
	CreatePlayer3()
	CreatePlayer5()

	-- Spawn troops
	CreateArmyFirstAttack()
	CreateArmyPlayer()
	CreateArmyP3Defense()
	
	-- briefing
	CreateBriefingPrelude()

	CreateQuestRescueSerfs()

	CreateNPCHeadquarters()
end

function end1stChapter()
	
	ResolveBriefing(briefingPreludeRescueSerfs)
	
	start2ndChapter()

end
------------------------------------------------------------------------------
-- Spoke with east village npc
------------------------------------------------------------------------------
function start2ndChapter()
	
	CreateArmyEastVillageAttack()
	CreateArmyGraveYardAttack()
	CreateArmyMerchantAttack()
	CreateArmyRuinsAttack()
	CreateArmyAttackers()
	
	CreateNPCEastVillage()

	start1stSubChapter()
	
end
function end2ndChapter()

	ResolveBriefing(NPCHeadquartersBriefingShowNPC)
	
	-- remove from diplomacy window
	SetPlayerName(3)
	
	-- east village joins player
	Logic.ChangeAllEntitiesPlayerID(3, 1)
	
	start3rdChapter()
				
end

------------------------------------------------------------------------------
-- wait for winter
------------------------------------------------------------------------------
function start3rdChapter()

	start2ndSubChapter()

	-- fire signals
	CreateQuestSignalFires()
end
	
function end3rdChapter()

	StartCutscene(Cutscenes[THRESHOLTWOCUTSCENE],start4thChapter)
		
end

------------------------------------------------------------------------------
-- final attack
------------------------------------------------------------------------------
function start4thChapter()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(3, true)
		ResearchAllMilitaryTechsAddOn(5, true)
		ResearchAllMilitaryTechsAddOn(8, true)
	end

	CreateArmyFinalAttack()
	
	if AllFireSignalsBurning == true then
	
		CreateArmyReinforcement()
	
	else

		DestroyNPCHermit()
		DestroyNPCJohannes()
		DestroyNPCFireSignal3()
		DestroyNPCRuins()
			
		GUIQuestTools.DisableQuestInformation()
			
		if NPCEastVillageBriefingShowNPCs ~= nil then
			ResolveBriefing(NPCEastVillageBriefingShowNPCs)
		end
			
	end

	CreateBriefingFinalAttack(AllFireSignalsBurning)

	CreateQuestSurviveFinalAttack()

	CreateQuestShowLastAttackers()

end
function end4thChapter()

	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)
	
end

------------------------------------------------------------------------------
-- build Bridge
------------------------------------------------------------------------------
function start1stSubChapter()

	CreateQuestBridge()

end
function end1stSubChapter()

	ResolveBriefing(NPCHeadquartersBriefingShowBridge)
	
end

------------------------------------------------------------------------------
-- destroy east Bridge
------------------------------------------------------------------------------
function start2ndSubChapter()

	CreateQuestDestroyEastBridge()

end
function end2ndSubChapter()

	if NPCEastVillageBriefingShowEastBridge ~= nil then
		ResolveBriefing(NPCEastVillageBriefingShowEastBridge)
	end
	
	-- stop respawn
	StopArmyEastVillageAttackRespawn()
	
end