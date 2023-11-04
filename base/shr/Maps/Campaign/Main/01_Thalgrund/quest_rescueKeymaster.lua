
createQuestRescueKeymaster = function()

	keymaster = {}

	keymaster.position 	= GetPosition("PrisonCage")
	keymaster.id		= Logic.GetEntityIDByName("keymaster")
	keymaster.key		= 0

	StartJob("QuestRescueKeymaster")
	
end
	
	
	
destroyQuestRescueKeymaster = function()

end

	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestRescueKeymaster"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestRescueKeymaster = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local jailhouse = Logic.GetEntityIDByName("Jail")

		if IsExisting("PrisonCage") then
			return false		
		end
	
		-- destroy jail
		--SetHealth("Jail", 0)
		return true	
	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestRescueKeymaster = function()
	-------------------------------------------------------------------------------------------------------------------
	
		-- Delay if briefing is active
		if IsBriefingActive() then
			Keymaster_Started = StartJob("DelayBriefingKeymaster")
		else
			FreeKeymaster() 
		end
		return true
	end
		




	----------------------------------------------------------------
	Condition_DelayBriefingKeymaster = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end
		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingKeymaster = function()                                  
	----------------------------------------------------------------
		                                                            
		FreeKeymaster() 
		EndJob(Keymaster_Started)
	end



		
		
FreeKeymaster = function()		
		
		-- create an init keymaster
		--keymaster.id = CreateEntity(4, Entities.PU_LeaderPoleArm4, keymaster.position, "keymaster")
	
		local ID = GetID("keymaster")
		--Logic.RotateEntity(ID, 180)

		InitNPC("keymaster")
		SetNPCLookAtTarget("keymaster", 1)
		

		if GateQuest_Started == 1 then
			EnableNpcMarker(keymaster.id)

			createBriefingKeymasterAppears()

		-- Have freed keymaster after quest was started
			keymaster.key = 1
		
		else

			createBriefingKeymasterAppears2()
		-- Have freed keymaster before quest was started
			keymaster.key = 2
		end	

		if gateVisited == 1 then

			ResolveBriefing(briefingGate[page_gateKeeper])

		end

		return true
		
	end


	
