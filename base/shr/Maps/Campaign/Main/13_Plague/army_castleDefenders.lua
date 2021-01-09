
createArmyCastleDefenders = function()

	-------------------------------------------------------------------------------defender1
	--	set up

		armyCastleDefendersA						= {}
	
		armyCastleDefendersA.player 				= 3
		armyCastleDefendersA.id						= 2
		armyCastleDefendersA.strength				= 5
		armyCastleDefendersA.position				= GetPosition("defender1")
		armyCastleDefendersA.rodeLength				= 500
		
		SetupArmy(armyCastleDefendersA)

	--	create
			
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}	
	
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PV_Cannon2
			EnlargeArmy(armyCastleDefendersA,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderBow3
			EnlargeArmy(armyCastleDefendersA,troopDescription)
			EnlargeArmy(armyCastleDefendersA,troopDescription)
		else
			troopDescription.experiencePoints = VERYHIGH_EXPERIENCE

			troopDescription.leaderType = Entities.PV_Cannon3
			EnlargeArmy(armyCastleDefendersA,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderBow4
			EnlargeArmy(armyCastleDefendersA,troopDescription)
			EnlargeArmy(armyCastleDefendersA,troopDescription)
		end
	
		troopDescription.leaderType = Entities.PV_Cannon4
	
		EnlargeArmy(armyCastleDefendersA,troopDescription)
		EnlargeArmy(armyCastleDefendersA,troopDescription)

	-------------------------------------------------------------------------------defender2
	--	set up

		armyCastleDefendersB						= {}
	
		armyCastleDefendersB.player 				= 3
		armyCastleDefendersB.id						= 3
		armyCastleDefendersB.strength				= 2
		armyCastleDefendersB.position				= GetPosition("defender2")
		armyCastleDefendersB.rodeLength				= 500
		
		SetupArmy(armyCastleDefendersB)

	--	create
			
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}	
	

		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow3
			EnlargeArmy(armyCastleDefendersB,troopDescription)
			EnlargeArmy(armyCastleDefendersB,troopDescription)
			EnlargeArmy(armyCastleDefendersB,troopDescription)
		else
			troopDescription.experiencePoints = VERYHIGH_EXPERIENCE

			troopDescription.leaderType = Entities.PU_LeaderBow4
			EnlargeArmy(armyCastleDefendersB,troopDescription)
			EnlargeArmy(armyCastleDefendersB,troopDescription)
			EnlargeArmy(armyCastleDefendersB,troopDescription)
		end

	-------------------------------------------------------------------------------defender3
	--	set up

		armyCastleDefendersC						= {}
	
		armyCastleDefendersC.player 				= 3
		armyCastleDefendersC.id						= 4
		armyCastleDefendersC.strength				= 2
		armyCastleDefendersC.position				= GetPosition("defender3")
		armyCastleDefendersC.rodeLength				= 500
		
		SetupArmy(armyCastleDefendersC)

	--	create
			
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}	
	
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow3
			EnlargeArmy(armyCastleDefendersC,troopDescription)
			EnlargeArmy(armyCastleDefendersC,troopDescription)
			EnlargeArmy(armyCastleDefendersC,troopDescription)
		else
			troopDescription.experiencePoints = VERYHIGH_EXPERIENCE

			troopDescription.leaderType = Entities.PU_LeaderBow4
			EnlargeArmy(armyCastleDefendersC,troopDescription)
			EnlargeArmy(armyCastleDefendersC,troopDescription)
			EnlargeArmy(armyCastleDefendersC,troopDescription)
		end

	-------------------------------------------------------------------------------defender4
	--	set up

		armyCastleDefendersD						= {}
	
		armyCastleDefendersD.player 				= 3
		armyCastleDefendersD.id						= 5
		armyCastleDefendersD.strength				= 4
		armyCastleDefendersD.position				= GetPosition("defender4")
		armyCastleDefendersD.rodeLength				= 500
		armyCastleDefendersD.control				= {}
		armyCastleDefendersD.control.mode			= 1
		
		SetupArmy(armyCastleDefendersD)

	--	create
			
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 3,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		if CP_Difficulty == 1 then
			troopDescription.experiencePoints = VERYHIGH_EXPERIENCE
		end
	
		troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
	
		EnlargeArmy(armyCastleDefendersD,troopDescription)
		EnlargeArmy(armyCastleDefendersD,troopDescription)
		EnlargeArmy(armyCastleDefendersD,troopDescription)
		EnlargeArmy(armyCastleDefendersD,troopDescription)
		
		StartJob("ControlArmyCastleDefendersD")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCastleDefendersD"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCastleDefendersD = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyCastleDefendersD",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCastleDefendersD = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyCastleDefendersD) then

			return true
			
			end

		if armyCastleDefendersD.control.mode == 1 then

			Defend(armyCastleDefendersD)
			
			if Logic.GetRandom(100) > 90 then
			
				armyCastleDefendersD.control.mode = 2
	
				return false
			
				end

			end
				
		if armyCastleDefendersD.control.mode == 2 then
		
			FrontalAttack(armyCastleDefendersD)
			
			if Logic.GetRandom(100) > 90 then
			
				armyCastleDefendersD.control.mode = 3

				return false
				
				end
				
			end
			
		if armyCastleDefendersD.control.mode == 3 then
		
			Redeploy(armyCastleDefendersD,GetPosition("defender4"),1000)
						
			armyCastleDefendersD.control.mode = 1
		
			return false
				
			end

		return false
			
		end