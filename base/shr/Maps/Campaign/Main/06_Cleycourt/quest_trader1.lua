createQuestTrader1 = function()

	-- Fill tribute paid table
	local Job = {}
	Job.Tribute = 001

	-- Create tribute
	Logic.AddTribute(	1, 
						Job.Tribute,
						0,
						0,
						"CM01_06_Cleycourt_txt/tribute_trader1a", 
						ResourceType.Gold,
						500 )

	
	Job.Callback = createQuestTrader1b


	-- Create tribute paid Job
	SetupTributePaid(Job)


end

createQuestTrader1b = function()
	Tools.GiveResouces(1, 0, 0,0,0,500,0)

	if CP_Difficulty < 2 then
		-- Fill tribute paid table
		local Job = {}
		Job.Tribute = 002

		-- Create tribute
		Logic.AddTribute(	1, 
							Job.Tribute,
							0,
							0,
							"CM01_06_Cleycourt_txt/tribute_trader1b", 
							ResourceType.Gold,
							1000 )

	
		Job.Callback = createQuestTrader1c


		-- Create tribute paid Job
		SetupTributePaid(Job)
	end

end

createQuestTrader1c = function()

	Tools.GiveResouces(1, 0, 0,0,0,1000,0)
	createBriefingTrader1End()
	
end
	
