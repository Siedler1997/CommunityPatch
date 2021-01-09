createQuestTributeToRed = function()

	if TributeToRedExists ~= true then
		TributeToRedExists = true
		-- Fill tribute paid table
		local Job = {}
		Job.Tribute = 010
    	
		local value = 2000
		if CP_Difficulty == 1 then
			value = value * 1.5
		end
		local text = string.format(XGUIEng.GetStringTableText("CM01_12_Kaloix/tribute_ToRed"), value)

		-- Create tribute
		Logic.AddTribute(	gvMission.PlayerID, 
							Job.Tribute,
							0,
							0,
							text, 
							ResourceType.Gold, 
							value )
    	
		
		Job.Callback = end6thSubQuest
    	
    	
		-- Create tribute paid Job
		SetupTributePaid(Job)
	end
	

end
