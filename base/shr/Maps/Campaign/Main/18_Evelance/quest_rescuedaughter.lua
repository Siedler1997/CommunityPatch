createQuestRescueDaughter = function()

	-- Destroy quest
	RescueDaughterQuest = {}
	
	--"Sorry Dario but the princess is in another castle:P"
	if CP_Difficulty == 2 then
		RescueDaughterQuest.Target 		= "P5DefenseGenerator1"
		RescueDaughterQuest.SpawnPos 	= GetPosition("P5DefenseSpawnPos1")
	else
		RescueDaughterQuest.Target 		= "Prison"
		RescueDaughterQuest.SpawnPos 	= GetPosition("PrincessSpawn")
	end
	
	RescueDaughterQuest.Callback 	= PrisonDestroyed
	
	SetupDestroy(RescueDaughterQuest)

end



PrisonDestroyed = function()

	-- Spawn princess
	CreateEntity(2, Entities.CU_Princess, RescueDaughterQuest.SpawnPos, "Princess")
	
	SpokenMessage(String.MainKey.."Message_PrincessFreed")
	
	-- Is princess dead mission is lost
	ProtectPrincessJob = StartJob("ProtectPrincess")
	
	-- Princess will follow heroes
	InitNPCLookAt("Princess")
	EnableNpcMarker("Princess")

end


-------------------------------------------------------------------------------------------------------
-- Princess must survive
-------------------------------------------------------------------------------------------------------
Condition_ProtectPrincess = function()
	

	-- refresh health of Pincess
	local PrincessID = GetID("Princess")
	
	if Tools.IsEntityAlive(PrincessID) ~= false then
	
		local princessHealth = Logic.GetEntityMaxHealth(PrincessID)
		Logic.HealEntity(PrincessID, (princessHealth / 50))

	end
	
	return IsDead("Princess")

end


Action_ProtectPrincess = function()
	Defeat()
	return true
end
-------------------------------------------------------------------------------------------------------
