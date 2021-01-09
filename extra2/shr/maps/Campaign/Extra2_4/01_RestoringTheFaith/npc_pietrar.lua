CreateNPCPietrar = function()
       	  
	-- setup table for npc
	local Npc 				= {}
	Npc.name 				= "pietrar"
	Npc.callback				= sulfar	
	        
	-- create npc
	CreateNPC(Npc)
	     
end

sulfar = function()

		DisableNpcMarker("pietrar")
				createBriefingPietrar()
				JobTribute()
				
end
	TributePaid1 = function()
	
	BriefingBombs()
	end
	
	JobTribute = function()
				local job = {}		
				job.Tribute = 1
				Logic.AddTribute(			1, 
									job.Tribute,
									0,
									0,
									string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/pietrar"), (500 + 500 * 0.6 * CP_Difficulty)),
									ResourceType.Gold, 
									(500 + 500 * 0.6 * CP_Difficulty) )			
				job.Callback = TributePaid1
				SetupTributePaid(job)								
				

	end