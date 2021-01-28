
-- robbers at treasure chests

createArmyRaiders = function()

	--	set up

		armyRaiders							= {}
	
		armyRaiders.player 					= 7
		armyRaiders.id						= 0
		armyRaiders.strength				= 8
		armyRaiders.position				= GetPosition("spawnRaiders")
		armyRaiders.rodeLength				= 200
		
		SetupArmy(armyRaiders)

	--	create 
		local etype = Entities.CU_BlackKnight_LeaderMace1
		if CP_Difficulty == 1 then
			etype = Entities.CU_BlackKnight_LeaderMace2
		end

		local troopDescription = {
			leaderType 			= etype,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 8,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		
	--	start controlling job		
		
		StartJob("ControlArmyRaiders")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyRaiders"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRaiders = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRaiders = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyRaiders) then
		
			return true
				
			end

		FrontalAttack(armyRaiders)

		return false
		
		end
	
