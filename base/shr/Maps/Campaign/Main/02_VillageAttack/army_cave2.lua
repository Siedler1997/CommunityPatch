
createArmyCave2 = function()

	--	set up

		armyCave2					= {}
	
		armyCave2.player 			= 2
		armyCave2.id				= 2
		armyCave2.strength			= 8
		armyCave2.position			= GetPosition("cave2")
		armyCave2.rodeLength		= 0
		armyCave2.control			= {}
		armyCave2.control.delay		= 60 * 5
		
		MapLocal_StartCountDown(armyCave2.control.delay+1)

		SetupArmy(armyCave2)
		
		StartJob("ControlArmyCave2")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCave2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCave2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyCave2.control.delay > 0 then
		
			armyCave2.control.delay = armyCave2.control.delay -1		
		
			Report("Cave2 army attack starts in "..armyCave2.control.delay.." seconds!")
		
			return false

		elseif armyCave2.control.delay == 0 then
		
			armyCave2.control.delay = -1
		
			local troopDescription = {
				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 4 + 2 * CP_Difficulty,
				experiencePoints 	= CP_Difficulty
			}	
			
			if CP_Difficulty == 0 then
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1 
			else
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
			end
			EnlargeArmy(armyCave2,troopDescription)
			EnlargeArmy(armyCave2,troopDescription)
			EnlargeArmy(armyCave2,troopDescription)
			EnlargeArmy(armyCave2,troopDescription)

			if CP_Difficulty == 0 then
				troopDescription.leaderType = Entities.PU_LeaderPoleArm2 
				EnlargeArmy(armyCave2,troopDescription)
				EnlargeArmy(armyCave2,troopDescription)
				troopDescription.leaderType = Entities.PU_LeaderSword2
				EnlargeArmy(armyCave2,troopDescription)
				EnlargeArmy(armyCave2,troopDescription)
			elseif CP_Difficulty == 1 then
				troopDescription.leaderType = Entities.PU_LeaderPoleArm2a
				EnlargeArmy(armyCave2,troopDescription)
				EnlargeArmy(armyCave2,troopDescription)
				troopDescription.leaderType = Entities.PU_LeaderSword2a
				EnlargeArmy(armyCave2,troopDescription)
				EnlargeArmy(armyCave2,troopDescription)
			else
				troopDescription.leaderType = Entities.PU_LeaderPoleArm3
				EnlargeArmy(armyCave2,troopDescription)
				EnlargeArmy(armyCave2,troopDescription)
				troopDescription.leaderType = Entities.PU_LeaderSword3
				EnlargeArmy(armyCave2,troopDescription)
				troopDescription.experiencePoints = VERYHIGH_EXPERIENCE
				troopDescription.leaderType = Entities.CU_VeteranCaptain
				EnlargeArmy(armyCave2,troopDescription)
			end
	
		-- 	Stop Countdown
			MapLocal_StopCountDown(0)

			
			end
		
		return Counter.Tick2("ControlArmyCave2",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCave2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyCave2) then

			endQuestErecsArrival()	
		
			return true
				
			end
				
		FrontalAttack(armyCave2)

		return false
		
		end
