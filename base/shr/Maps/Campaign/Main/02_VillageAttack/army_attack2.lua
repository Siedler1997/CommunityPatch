
ARMY2_START				= 10 * 60
ARMY2_START_DELAY 		= ARMY2_START 
						+ ARMY1_START_DELAY 
						+ ARMY1_DELAY


ARMY2_DELAY 			= 5 * 60

ARMY2_ATTACKS			= 1


createArmyAttack2 = function()

	--	set up

		armyAttack2						= {}
	
		armyAttack2.player 				= 2
		armyAttack2.id					= 5
		armyAttack2.strength			= 2
		armyAttack2.position			= GetPosition("tower2")			-- camp in south
		armyAttack2.rodeLength			= 0
		armyAttack2.control				= {}
		armyAttack2.control.delay		= ARMY2_START_DELAY
		armyAttack2.control.attack		= ARMY2_ATTACKS					-- Number of Attacks
		
		SetupArmy(armyAttack2)

	--	create 
		local experience = 0
		if CP_Difficulty == 1 then
			experience = HIGH_EXPERIENCE
		end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= experience,
		}			

		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderSword1
		else
			troopDescription.leaderType = Entities.PU_LeaderSword2
		end
		EnlargeArmy(armyAttack2,troopDescription)
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderPoleArm1
		else
			troopDescription.leaderType = Entities.PU_LeaderPoleArm2
		end
		EnlargeArmy(armyAttack2,troopDescription)


	--	job		
		
		-- StartJob("ControlArmyAttack2") -- started when quest starts

	--TF
		--		Tools.ExploreArea(GetPosition("tower2"), 1000)

	end






	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead("tower2") then
		
			if IsDead(armyAttack2) and armyAttack2.control.timerActive then
				
				MapLocal_StopCountDown(0)
				armyAttack2.control.timerActive = false
				
			end	
	
			return false
			
		end


		-- Stop Countdwon if army is dead

		if 	armyAttack2.control.attack == 0 and IsDead(armyAttack2) then

			MapLocal_StopCountDown(0)
			armyAttack2.control.timerActive = false

		end	


		
		if armyAttack2.control.delay > 0 then
		
			armyAttack2.control.delay = armyAttack2.control.delay -1		


			-- give warning message
			if armyAttack2.control.delay == 0 then

				MapLocal_StopCountDown(0)
				armyAttack2.control.timerActive = false
				
				if armyAttack2.control.attack == ARMY2_ATTACKS then
	
					if IsBriefingActive() ~= true then
				
						MapLocal_CameraPositionBackup()	 
						createBriefingRobber2Attack()
			
					else
			
						MapBriefingRobber2_Started = StartJob("DelayRobber2Briefing")
			
					end
				end

			end
	
			return false
			
		end
		
		return Counter.Tick2("ControlArmyAttack2",5)
		
	end







		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack2) then
		
			if armyAttack2.control.attack == 0 then
			
				Report("army2 defeated")
				
				return true
				
			end
				
			Retreat(armyAttack2)
						
			--	create further army
				local experience = 0
				if CP_Difficulty == 1 then
					experience = HIGH_EXPERIENCE
				end

				local troopDescription = {
				
					maxNumberOfSoldiers	= 4,
					minNumberOfSoldiers	= 0,
					experiencePoints 	= experience,
				}				

			-- define new attacking armies
				
				armyAttack2.control.attack = armyAttack2.control.attack -1
		
					Report("army2, Angriff Nr. "..armyAttack2.control.attack)

				if armyAttack2.control.attack >= 0 then
				
					if CP_Difficulty == 0 then
						troopDescription.leaderType = Entities.PU_LeaderSword1
					else
						troopDescription.leaderType = Entities.PU_LeaderSword2
					end
					EnlargeArmy(armyAttack2,troopDescription)
		
					if CP_Difficulty == 0 then
						troopDescription.leaderType = Entities.PU_LeaderPoleArm1
					else
						troopDescription.leaderType = Entities.PU_LeaderPoleArm2
					end
					EnlargeArmy(armyAttack2,troopDescription)

					--	time till next attack
				
					armyAttack2.control.delay = ARMY2_DELAY

					MapLocal_StartCountDown(armyAttack2.control.delay)
					armyAttack2.control.timerActive = true
					
				end		
	
		else
		
			Report("army2 advanced")
		
			Advance(armyAttack2)
			
		end

		return false
		
	end







	----------------------------------------------------------------
	Condition_DelayRobber2Briefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             



                                                                    
	----------------------------------------------------------------
	Action_DelayRobber2Briefing = function()                                  
	----------------------------------------------------------------
		                                                            
		MapLocal_CameraPositionBackup()	 
		
		createBriefingRobber2Attack()
	
		EndJob(MapBriefingRobber2_Started)

	end
	