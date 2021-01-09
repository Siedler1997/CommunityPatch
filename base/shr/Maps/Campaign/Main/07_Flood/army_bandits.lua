
createArmyBandits = function()

	--	set up

		armyBandits1				= {}
	
		armyBandits1.player 		= 8
		armyBandits1.id				= 5
		armyBandits1.strength		= 3
		armyBandits1.position		= GetPosition("bandits")
		armyBandits1.rodeLength		= 3000
		
		SetupArmy(armyBandits1)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
			EnlargeArmy(armyBandits1,troopDescription)	
			troopDescription.leaderType = Entities.PU_LeaderSword1
			EnlargeArmy(armyBandits1,troopDescription)	
		else
			troopDescription.leaderType = Entities.PU_LeaderBow2
			EnlargeArmy(armyBandits1,troopDescription)	
			troopDescription.leaderType = Entities.PU_LeaderSword2
			EnlargeArmy(armyBandits1,troopDescription)	
		end
	end
	
	