function CreateQuestBuildUpCity()
	BuildUpQuestTime = (25 - 5 * CP_Difficulty) * 60
	BuildUpQuestTowerCount =	6 + Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower1) 
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower2)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower3)

	StartSimpleJob("QuestBuildUpCity")
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

	BuildUpQuestTime = BuildUpQuestTime - 1
	
	--Message("Time: " .. BuildUpQuestTime .. " - Towers: " .. currentTowerCount .. "/" .. BuildUpQuestTowerCount)
	if BuildUpQuestTime <= 0 or (currentTowerCount > BuildUpQuestTowerCount) then
		end3rdChapter()
		--Message("Quest done!")
		return true
	end
end