
startQuestStoneRun = function()

	stonePosition1 = GetPosition("stone1")
	stonePosition2 = GetPosition("stone2")
	stonePosition3 = GetPosition("stone3")

	StartJob("QuestStone1")
	StartJob("QuestStone2")
	StartJob("QuestStone3")

end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestStone1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestStone1 = function()
	-------------------------------------------------------------------------------------------------------------------
					
		return IsDead("stone1") 
		
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestStone1 = function()
	-------------------------------------------------------------------------------------------------------------------
		local isDarkChest = false
		local chestGoodAmmount = 2000-CP_Difficulty*500
		if CP_Difficulty > 0 then
			isDarkChest = true
		end

		CreateChest(stonePosition1, (function() chestGenericCallback(chestGoodAmmount, ResourceType.Gold) end), isDarkChest)
		
		return true
		
	end	

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestStone2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestStone2 = function()
	-------------------------------------------------------------------------------------------------------------------
					
		return IsDead("stone2") 
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestStone2 = function()
	-------------------------------------------------------------------------------------------------------------------
		local isDarkChest = false
		local chestGoodAmmount = 2000-CP_Difficulty*500
		if CP_Difficulty > 0 then
			isDarkChest = true
		end

		CreateChest(stonePosition2, (function() chestGenericCallback(chestGoodAmmount, ResourceType.Gold) end), isDarkChest)
		
		return true
		
		end	

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestStone3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestStone3 = function()
	-------------------------------------------------------------------------------------------------------------------
					
		return IsDead("stone3") 
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestStone3 = function()
	-------------------------------------------------------------------------------------------------------------------
		local isDarkChest = false
		local chestGoodAmmount = 2000-CP_Difficulty*500
		if CP_Difficulty > 0 then
			isDarkChest = true
		end

		CreateChest(stonePosition3, (function() chestGenericCallback(chestGoodAmmount, ResourceType.Iron) end), isDarkChest)
		
		return true
		
		end	
