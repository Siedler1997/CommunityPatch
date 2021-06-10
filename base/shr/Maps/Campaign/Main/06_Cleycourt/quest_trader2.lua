createQuestTrader2 = function()

	-- Fill tribute paid table
	local Job = {}
	Job.Tribute = 010

	-- Create tribute
	Logic.AddTribute(	1, 
						Job.Tribute,
						0,
						0,
						"CM01_06_Cleycourt_txt/tribute_Trader2a", 
						ResourceType.Wood,
						500 )

	
	Job.Callback = createQuestTrader2b


	-- Create tribute paid Job
	SetupTributePaid(Job)


end

createQuestTrader2b = function()
	Tools.GiveResouces(1, 0, 0,0,0,500,0)
	
	if CP_Difficulty < 2 then
		-- Fill tribute paid table
		local Job = {}
		Job.Tribute = 011

		-- Create tribute
		Logic.AddTribute(	1, 
							Job.Tribute,
							0,
							0,
							"CM01_06_Cleycourt_txt/tribute_Trader2b", 
							ResourceType.Wood,
							1000 )

	
		Job.Callback = createQuestTrader2c


		-- Create tribute paid Job
		SetupTributePaid(Job)
	end

end

createQuestTrader2c = function()

	Tools.GiveResouces(1, 0, 0,0,0,1000,0)
	createBriefingTrader2End()
	
end
	
