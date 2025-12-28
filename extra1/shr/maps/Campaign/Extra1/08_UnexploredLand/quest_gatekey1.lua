function CreateQuestGate1Key()

	StartSimpleJob("QuestGate1Key")
	
	ChestPosition = GetPosition("Nephilim_Tribal_CampTower1")

end

function QuestGate1Key()
	if IsDead("Nephilim_Tribal_CampTower1") and not IsBriefingActive() then
		local isDarkChest = false
		if CP_Difficulty > 0 then
			isDarkChest = true
		end
		
		CreateChest(ChestPosition, Gate1KeyChestOpened, isDarkChest)
		
		return true
	end
end

function Gate1KeyChestOpened()

	SpokenMessage(String.Key("M_Gate1KeyChestOpened"))
	-- Message("You found a gate key! ! Not a string key !")

	if NPCGate1BriefingShowTower ~= nil then
		
		ResolveBriefing(NPCGate1BriefingShowTower)
		
	end
	
	KeyForGate1Found = true
	
end