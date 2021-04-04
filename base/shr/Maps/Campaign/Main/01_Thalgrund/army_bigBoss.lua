
-- Defenders at robbers camp

createArmyBigBoss = function()

	--	big boss a

		armyBigBossA				= {}
	
		armyBigBossA.player 		= 7
		armyBigBossA.id				= 3
		armyBigBossA.strength		= 3
		armyBigBossA.position		= GetPosition("Jail")
		armyBigBossA.rodeLength		= 500
		
		SetupArmy(armyBigBossA)

	--	create army
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		--	create pike men
		
			if CP_Difficulty == 0 then
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
			else
				troopDescription.experiencePoints = HIGH_EXPERIENCE
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
			end
--			troopDescription.leaderType = Entities.PU_LeaderPoleArm1
			EnlargeArmy(armyBigBossA,troopDescription)
			EnlargeArmy(armyBigBossA,troopDescription)

		--	create bandit boss
			if CP_Difficulty == 0 then
				troopDescription.leaderType = Entities.CU_BanditLeaderBow1
			else
				troopDescription.experiencePoints = HIGH_EXPERIENCE
				troopDescription.leaderType = Entities.CU_BanditLeaderBow2
			end
			EnlargeArmy(armyBigBossA,troopDescription)

	--	start job
	
		StartJob("ControlArmyBigBossA")

end







-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyBigBossA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyBigBossA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyBigBossA",5)
		
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyBigBossA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyBigBossA) then

			return true
			
			end
		
		return false
		
	end
