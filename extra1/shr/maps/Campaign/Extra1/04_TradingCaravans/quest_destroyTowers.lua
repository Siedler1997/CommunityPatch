---------------------------------------------------------------
function CreateQuestDestroyTowers()

	local Quest =	{}
	Quest.Targets = { "P2_RobberyTower_1" }
	Quest.Position = GetPosition("P2_RobberyTower_1")
	Quest.Callback = DestroyTowerDone
			
	SetupDestroy(Quest)

	local Quest2 =	{}
	Quest2.Targets = { "P2_RobberyTower_2" }
	Quest2.Position = GetPosition("P2_RobberyTower_2")
	Quest2.Callback = DestroyTowerDone
			
	SetupDestroy(Quest2)
			
	local Quest3 =	{}
	Quest3.Targets = { "P2_RobberyTower_3" }
	Quest3.Position = GetPosition("P2_RobberyTower_3")
	Quest3.Callback = DestroyTowerDone
	
	SetupDestroy(Quest3)
	
	TowerDestroyedCounter = 0
	
end

function DestroyTowerDone(_quest)
	TowerDestroyedCounter = TowerDestroyedCounter + 1

	if TowerDestroyedCounter == 3 then
		CreateEntity(6, Entities.CU_MinerIdle, _quest.Position, "NPCMotte")
		end1stSubChapter()
	else
		local isDarkChest = false
		if CP_Difficulty > 0 then
			isDarkChest = true
		end
		CreateRandomGoldChest(_quest.Position, isDarkChest)
	end
end