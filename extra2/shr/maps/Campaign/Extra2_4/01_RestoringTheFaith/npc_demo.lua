------- Demolition ---



CreateNPCDemo = function()

	
       	  
	-- setup table for npc
	local Npc 				= {}
	Npc.name 				= "Bombjack"
	Npc.callback				= entranceClearing	
	        
	-- create npc
	CreateNPC(Npc)
	     
end

entranceClearing = function()
		
		DisableNpcMarker("Bombjack")
		createBriefingDemo1()
		JobTributeSulf()
		local x,y=Tools.GetPosition("Bombjack")
		GUI.DestroyMinimapPulse(x,y)
				
end
	
	
TributeSulfPaid = function()
	
	createBriefingDemo2()
end

	
JobTributeSulf = function()
		local job = {}		
		job.Tribute = 2
		Logic.AddTribute(			1, 
							job.Tribute,
							0,
							0,
							string.format(XGUIEng.GetStringTableText("CM06_01_RestoringTheFaith/Demoboy"), 1000 + 1000 * 0.5 * CP_Difficulty),
							ResourceType.Sulfur, 
							(1000 + 1000 * 0.5 * CP_Difficulty) )			
		job.Callback = TributeSulfPaid
		SetupTributePaid(job)								
				

end

