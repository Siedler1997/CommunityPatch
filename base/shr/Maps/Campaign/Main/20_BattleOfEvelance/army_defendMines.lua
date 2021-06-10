
createArmyDefendMines = function()

	--	set up

		armyDefendMines					= {}
	
		armyDefendMines.player 			= 7
		armyDefendMines.id				= 0
		armyDefendMines.position		= GetPosition("defendMines")
		armyDefendMines.rodeLength		= 1000
		

	--	create 
		local experience = 0
		if CP_Difficulty > 0 then
			armyDefendMines.strength = 3
			experience = experience + 3
		else
			armyDefendMines.strength		= 1
		end
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}			

		troopDescription.leaderType = Entities.PU_LeaderBow2
		EnlargeArmy(armyDefendMines,troopDescription)

		if CP_Difficulty > 0 then
			troopDescription.leaderType = Entities.PU_LeaderSword2
			EnlargeArmy(armyDefendMines,troopDescription)
			troopDescription.leaderType = Entities.PU_LeaderPoleArm2
			EnlargeArmy(armyDefendMines,troopDescription)
		end

		SetupArmy(armyDefendMines)

	end
