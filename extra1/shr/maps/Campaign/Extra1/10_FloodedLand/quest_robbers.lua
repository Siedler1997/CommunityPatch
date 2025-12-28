function CreateQuestRobbers()

	StartSimpleJob("QuestRobbers")
	
	ChestPosition = GetPosition("RobberyTower")

end

function QuestRobbers()
	if IsDead("RobberyTower") and not IsBriefingActive() then
		local isDarkChest = false
		if CP_Difficulty > 0 then
			isDarkChest = true
		end
		
		CreateChest(ChestPosition, RobbersChestOpened, isDarkChest)
		
		return true
	end
end

function RobbersChestOpened()

	SpokenMessage(String.Key("M_RobbersChestOpened"))
	
	
	end1stSubChapter()
	
end