createQuestRescueVillagers = function()

	local Quest = {}
	Quest.Gift = "RescueObject"
	
	Quest.ApproachPos = "VillagersRescuePos"
	Quest.ApproachRange = 600

	Quest.Callback = RescueVillagersDone
	
	SetupRescue(Quest)
end

RescueVillagersDone = function()

	-- Attach soldiers
	local i
	for i=1,3 do
		Tools.AttachSoldiersToLeader("RescueObject"..i, 12)
	end

	-- Quest done
	Logic.SetQuestType(
		1, 					
		3,
		MAINQUEST_OPEN +1,
		1
	)
	
--TK Disable Flüchtling
	DisableNpcMarker("Fugitive")
	DisableNpcMarker("Fugitive2")


	end4thQuest()

end