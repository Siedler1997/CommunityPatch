function CreateQuestBuildUpCity()

	StartSimpleJob("QuestBuildUpCity")

	BuildUpQuestTowerCount =	Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower1) 
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower2)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower3)

end

-- time gone or 6 towers build
function QuestBuildUpCity()

	-- get amount of towers
	local currentTowerCount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower1) 
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower2)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower3)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_DarkTower1) 
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_DarkTower2)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_DarkTower3)

	local minutes = 30 - 5 * CP_Difficulty

	if Counter.Tick2("QuestBuildUpCity", minutes * 60) or currentTowerCount > BuildUpQuestTowerCount + 6	then
	
		end3rdChapter()
	
		return true
	
	end

end