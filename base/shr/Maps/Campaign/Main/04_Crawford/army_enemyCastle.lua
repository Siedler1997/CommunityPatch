
createArmyEnemyCastle = function()
		local experience = MEDIUM_EXPERIENCE
		if CP_Difficulty > 0 then
			experience = experience + 2
		end

	--	dynamic one
	--	-----------

	--	set up

		armyEnemyCastle						= {}
	
		armyEnemyCastle.player 				= 5
		armyEnemyCastle.id					= 5
		armyEnemyCastle.strength			= 8
		armyEnemyCastle.position			= GetPosition("enemyCastle")
		armyEnemyCastle.rodeLength			= 3500
		armyEnemyCastle.control				= {}
		armyEnemyCastle.control.behaviour	= 0				
		armyEnemyCastle.control.advancing	= 0
		
		
		SetupArmy(armyEnemyCastle)

	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 2,
			experiencePoints 	= experience,
		}				
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PV_Cannon1
		elseif CP_Difficulty == 1 then
			troopDescription.leaderType = Entities.PV_Cannon2
		else
			troopDescription.leaderType = Entities.PV_Cannon3
		end			
		EnlargeArmy(armyEnemyCastle,troopDescription)
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
		else
			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
		end				
		EnlargeArmy(armyEnemyCastle,troopDescription)
		EnlargeArmy(armyEnemyCastle,troopDescription)
		EnlargeArmy(armyEnemyCastle,troopDescription)
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
		elseif CP_Difficulty == 1 then
			troopDescription.leaderType = Entities.PU_LeaderBow2
		else
			troopDescription.leaderType = Entities.PU_LeaderBow3
		end
		EnlargeArmy(armyEnemyCastle,troopDescription)
		EnlargeArmy(armyEnemyCastle,troopDescription)
		EnlargeArmy(armyEnemyCastle,troopDescription)			
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PV_Cannon1
		else
			troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
		end			
		EnlargeArmy(armyEnemyCastle,troopDescription)

	--	job		
		
		StartJob("ControlArmyEnemyCastle")

	--	static one
	--	----------

	--	set up

		armyDefendEnemyCastle				= {}
	
		armyDefendEnemyCastle.player 		= 5
		armyDefendEnemyCastle.id			= 6
		armyDefendEnemyCastle.strength		= 3
		if CP_Difficulty > 0 then
			armyDefendEnemyCastle.strength = armyDefendEnemyCastle.strength + 3
		end
		armyDefendEnemyCastle.position		= GetPosition("enemyCastle")
		armyDefendEnemyCastle.rodeLength	= 3000
		
		SetupArmy(armyDefendEnemyCastle)

	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 2,
			experiencePoints 	= experience,
		}				

		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
		else
			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
		end					
		EnlargeArmy(armyDefendEnemyCastle,troopDescription)
		
		if CP_Difficulty > 0 then
			EnlargeArmy(armyDefendEnemyCastle,troopDescription)
			if CP_Difficulty == 1 then
				troopDescription.leaderType = Entities.PU_LeaderBow2	
			else
				troopDescription.leaderType = Entities.PU_LeaderBow3
			end
			EnlargeArmy(armyDefendEnemyCastle,troopDescription)				
			EnlargeArmy(armyDefendEnemyCastle,troopDescription)
		end
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1
		else
			troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
		end		
		EnlargeArmy(armyDefendEnemyCastle,troopDescription)			
		EnlargeArmy(armyDefendEnemyCastle,troopDescription)

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyEnemyCastle"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyEnemyCastle = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyEnemyCastle = function()
	-------------------------------------------------------------------------------------------------------------------

		if Logic.GetRandom(100) > 95 then
		
			if armyEnemyCastle.control.behaviour == 0 then
		
				armyEnemyCastle.control.behaviour = 1
				
				armyEnemyCastle.control.advancing = 0
						
				end
				
			end

		if armyEnemyCastle.control.behaviour == 1 then
		
			armyEnemyCastle.control.advancing = armyEnemyCastle.control.advancing +1
			
			if armyEnemyCastle.control.advancing == 130 then
			
				armyEnemyCastle.control.behaviour = 0
				
				Retreat(armyEnemyCastle)

				return false
				
				end
			
			Advance(armyEnemyCastle)
									
			end

		return false
		
		end
	