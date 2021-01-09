
createQuestIron = function()
JobTributeIron()
end


JobTributeIron = function()
		local job = {}		
		job.Tribute = 3
		Logic.AddTribute(			1, 
							job.Tribute,
							0,
							0,
							string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/IronMan"), 1000 + 1000 * 0.5 * CP_Difficulty),
							ResourceType.Iron, 
							(1000 + 1000 * 0.5 * CP_Difficulty) )			
		job.Callback = TributeIronPaid
		SetupTributePaid(job)								
				

end


TributeIronPaid = function()
	
	createBriefingIronPaid()
end