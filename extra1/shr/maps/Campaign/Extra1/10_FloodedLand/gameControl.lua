------------------------------------------------------------------------------
-- Introduction, search way to lower water..ask leonardo assistent
------------------------------------------------------------------------------
function start1stChapter()

	CreateChestOpener("Ari")
	CreateChestOpener("Mirai")
	CreateChestOpener("Dario")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Helias")
	CreateChestOpener("Quintos")
	CreateChestOpener("Mirai")
	if CP_Difficulty == 0 then
		CreateRandomGoldChests()
	end
	StartChestQuest()
	
	-- Setup AI
	CreatePlayer3()
	CreatePlayer4()
	CreatePlayer5()

	-- Spawn troops
	CreateArmyPatrol()
	CreateArmyBlockade1()
	
	StartCutscene(Cutscenes[INTROCUTSCENE],CreateBriefingPrelude)

	--CreateQuestBlockade()

	CreateNPCLeoAssistant()

	CreateNPCMiner()
	CreateNPCStables()

	-- lost if hq destroyed
	AddDefeatEntity("HQ")

	-- side quests
	start1stSubChapter()
	start2ndSubChapter() 
end
function end1stChapter()
	
	start2ndChapter()

end
------------------------------------------------------------------------------
--	rescue leonardo
------------------------------------------------------------------------------
function start2ndChapter()

	CreateQuestRescueLeo()

	CreateArmyBlockade2()

end
function end2ndChapter()

	ResolveBriefing(briefingNPCLeoAssistantBriefingShowPrison)

	start3rdChapter()

end
------------------------------------------------------------------------------
--	bring leo necessary resources
------------------------------------------------------------------------------
function start3rdChapter()

	CreateNPCLeonardo()

end
function end3rdChapter()

	if TalkedToNPC(NpcMiner) then
		ResolveBriefing(briefingNPCMinerBriefingShowMine)
		ResolveBriefing(briefingNPCMinerBriefingShowStones)
	end

	ArmyBlockade1AllowAttack()

	StartCutscene(Cutscenes[THRESHOLDONECUTSCENE],start4thChapter)

end
------------------------------------------------------------------------------
-- Destroy queen defense 
------------------------------------------------------------------------------
function start4thChapter()
	if CP_Difficulty > 0 then
		CreateArmyPlayerAttack()
		if CP_Difficulty == 2 then
			ResearchAllMilitaryTechsAddOn(2, true)
			ResearchAllMilitaryTechsAddOn(4, true)
			ResearchAllMilitaryTechsAddOn(5, true)	-- Friendly Cavalry
			ResearchAllMilitaryTechsAddOn(6, true)
		end
	end

	CreateArmyAmbush()
	CreateArmyBig1()
	CreateArmyBig2()
	CreateArmyStonePit()

	CreateBriefingQueenDefense()

	CreateQuestQueenDefense()

	CreateNPCMinerHelped()
	CreateNPCOutlook()

	start3rdSubChapter()

end
function end4thChapter()

	ResolveNPCOutlookBriefing()

	DestroyNPC(NPCOutlook)
	
	ResolveBriefing(briefingQueenDefenseQuest)

	StartCutscene(Cutscenes[THRESHOLTWOCUTSCENE],start5thChapter)
	

end

------------------------------------------------------------------------------
-- Queen
------------------------------------------------------------------------------
function start5thChapter()

	CreateArmyQueen()

	CreateBriefingQueen()

	CreateQuestQueen()

end
function end5thChapter()

	-- Stop enemy armies blockade
	SetNeutral(1,3)
	SetNeutral(1,4)
	
	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)
	
	
end


------------------------------------------------------------------------------
-- Robbers Tower
------------------------------------------------------------------------------
function start1stSubChapter()

	-- Create player
	CreatePlayer6()

	-- Create troops
	CreateArmyRobbers()

	-- Create quest
	CreateQuestRobbers()

	-- Info NPC
	CreateNPCHermit()

end
function end1stSubChapter()

	FoundKey = true

	if briefingNPCHermitBriefingShowRobbers ~= nil then

		ResolveBriefing(briefingNPCHermitBriefingShowRobbers)		
		
	end

end

------------------------------------------------------------------------------
-- Gate
------------------------------------------------------------------------------
function start2ndSubChapter()

	CreateQuestGate()

end
function end2ndSubChapter()

	if TalkedToNPC(NPCHermit) then

		ResolveBriefing(briefingNPCHermitBriefingShowGate)		
		
	end

end
------------------------------------------------------------------------------
-- Village Center
------------------------------------------------------------------------------
function start3rdSubChapter()

	CreateQuestGraveYard()

	CreateNPCGraveYard()
	CreateNPCGraveYardInfo()

end
function end3rdSubChapter()

	CreateNPCGraveYardHelped()

end