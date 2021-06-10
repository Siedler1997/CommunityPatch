------------------------------------------------------------------------------
-- Introduction, select HQ
------------------------------------------------------------------------------
function start1stChapter()

	Logic.SetShareExplorationWithPlayerFlag(1,8,1)

    Logic.SetPlayerPaysLeaderFlag(1,0)

	CreateChestOpener("Ari")
	CreateChestOpener("Headhunter")
	CreateChestOpener("Dario")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Helias")
	CreateChestOpener("Yuki")
	StartChestQuest()
	
	-- Setup AI
	CreatePlayer2()
	CreatePlayer8()

	-- Spawn troops
	CreateArmyP8Defense()
	CreateArmyTribalCamps()
	CreateArmyPlayer()
	CreateArmyBridges()

	-- briefing
	CreateBriefingPrelude()

	start1stSubChapter()
	start2ndSubChapter()

	CreateNPCHQ1()
	CreateNPCHQ2()
	CreateNPCHQ3()

	CreateQuestDefeat()
	
	-- Difficulty stuff
	
	if CP_Difficulty > 0 then
		CreatePlayer7()
		CreateArmyRobbers()
	end

end
function end1stChapter()
    Logic.SetPlayerPaysLeaderFlag(1,1)
	
	ResolveBriefing(briefingPreludeShowHQ1)
	ResolveBriefing(briefingPreludeShowHQ2)
	ResolveBriefing(briefingPreludeShowHQ3)
	ResolveBriefing(briefingPreludeQuestSelectHQQuest)

	ChangePlayer("PlayerHQ",1)
	
	DestroyNPCHQ1()
	DestroyNPCHQ2()
	DestroyNPCHQ3()

	StopQuestDefeat()
	
	AddDefeatEntity("PlayerHQ")
	
	-- Will set diplomacy to player 8 to neutral after 10 minutes
	StartArmyTribalCampsAttack()
	
	-- Stop winter
	StartWinter(1)

	-- Let nephilims attack player 5 (other hqs)
	SetHostile(2,5)

	start2ndChapter()

end
------------------------------------------------------------------------------
-- build bridges
------------------------------------------------------------------------------
function start2ndChapter()
	
	CreateDelayedBriefingBridges()
	
	CreateQuestBridges()

end
function end2ndChapter()

	ResolveBriefing(briefingBridgesQuest)

	StartCutscene(Cutscenes[THRESHOLDONECUTSCENE], start3rdChapter)
				
end

------------------------------------------------------------------------------
-- clean up ruins
------------------------------------------------------------------------------
function start3rdChapter()

	CreateArmyNephilimsHQ()

	CreateBriefingCleanUpRuins()

	CreateQuestCleanUpRuins()

	-- open gate and move army to new position
	ReplaceEntity("NephilimMainGate", Entities.XD_WallStraightGate)

	StartArmyBridgesAttack()

end
	
function end3rdChapter()

	ResolveBriefing(briefingCleanUpRuinsQuest)

	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE], Victory)
	
end

------------------------------------------------------------------------------
-- gate 1
------------------------------------------------------------------------------
function start1stSubChapter()

	CreateQuestGate1Key()

	CreateNPCGate1()

end
function end1stSubChapter()

	ReplaceEntity("Gate1", Entities.XD_DarkWallStraightGate)

	MoveAndVanish("NPC_Gate1", GetPosition("P8_DefensePoint1"))

end
------------------------------------------------------------------------------
-- gate 2
------------------------------------------------------------------------------
function start2ndSubChapter()

	CreateQuestGate2Key()

	CreateNPCGate2()

end
function end2ndSubChapter()

	ReplaceEntity("Gate2", Entities.XD_DarkWallStraightGate)

	MoveAndVanish("NPC_Gate2", GetPosition("P8_DefensePoint1"))

end