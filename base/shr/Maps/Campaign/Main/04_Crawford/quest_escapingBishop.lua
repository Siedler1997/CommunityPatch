
ESCAPE_WAIT_TIME = 2 * 60		-- delay when bishops starts to flee



createQuestEscapingBishop = function()

	escapingBishop = {}

	StartJob("ControlQuestEscapingBishop")

end







destroyQuestEscapingBishop = function()


end

	
	
	
	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlQuestEscapingBishop"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlQuestEscapingBishop = function()
	-------------------------------------------------------------------------------------------------------------------

		if escapingBishop.counter ~= nil then
							
			escapingBishop.counter = escapingBishop.counter -1
			
			Report("Escaping Bishop counter: "..escapingBishop.counter)
			
			if escapingBishop.counter <= 0 and IsBriefingActive() == false then
			
				return true
				
			end

			return false
		
		end


		if questBishop.talked == true then

			-- if player payed regent tribute first
			if 		regentQuest.solved == true 
			-- or both outposts are detroyed

				or
					(
						IsDead("tower1a")
					and	IsDead("tower2a")
					and	IsDead("tower1b")
					and	IsDead("tower2b")
					)
				then
			
				escapingBishop.counter = ESCAPE_WAIT_TIME
				
				Report("Start Escaping Bishop!")
				
			end

		end
		
		return false
		
	end





		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlQuestEscapingBishop = function()
	-------------------------------------------------------------------------------------------------------------------

		escapingBishopIsActive = true

		DisableNpcMarker("bishop")
		DisableNpcMarker("Guardian"..talkToGuard)

		Move("bishop","defTargetPoint6_OO3")
		Move("Guardian3","GuardPoint1")
		Move("Guardian4","GuardPoint2")
		
	-- open gate
		stonePosition = GetPosition("stone")
		--ReplaceEntity("stone", Entities.XD_WallStraightGate)

		
		if questBishop.tributePaid == false then
		
			Logic.RemoveTribute(GetHumanPlayer(), BISHOP_TRIBUTE_ID)
		
		else
			
			-- give player the tribute back that he paid to the bishop
			GlobalMissionScripting.GiveResouces(GetHumanPlayer(), 2000, 0, 0, 0, 0, 0)
		
		end


	-- start briefing
		MapLocal_CameraPositionBackup()		
		createBriefingEscapingBishop()
		
		
		--	2nd part of briefing	
		if IsBriefingActive() ~= true then
	
		    createBriefingEscapingBishop2()
			
		else
	
			FleeBriefing_Started = StartJob("DelayBriefingFlee")
	
		end
		
	return true	
		
	end



	
	----------------------------------------------------------------
	Condition_DelayBriefingFlee = function()                               
	----------------------------------------------------------------
		                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end
	
		return false
				                                                            
	end                                                             
	                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingFlee = function()                                  
	----------------------------------------------------------------
		                                                            
	    createBriefingEscapingBishop2()
	
		EndJob(FleeBriefing_Started)
	
	end
	
		
