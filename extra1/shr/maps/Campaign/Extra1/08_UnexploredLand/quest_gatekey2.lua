function CreateQuestGate2Key()

	StartSimpleJob("QuestGate2Key")
	
	ChestPosition2 = GetPosition("Nephilim_Tribal_CampTower2")

end

function QuestGate2Key()
	if IsDead("Nephilim_Tribal_CampTower2") and not IsBriefingActive() then
		local isDarkChest = false
		if CP_Difficulty > 0 then
			isDarkChest = true
		end

		CreateChest(ChestPosition2, Gate2KeyChestOpened, isDarkChest)
		
		return true
	end
end

function Gate2KeyChestOpened()

	SpokenMessage(String.Key("M_Gate2KeyChestOpened"))
	-- Message("You found a gate key! ! Not a string key !")

	if NPCGate2BriefingShowTower ~= nil then
		
		ResolveBriefing(NPCGate2BriefingShowTower)
		
	end
	
	KeyForGate2Found = true
	
end