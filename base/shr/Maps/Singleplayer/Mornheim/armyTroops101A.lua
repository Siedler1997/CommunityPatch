
setupArmyTroops101A = function()

	-- define army

		armyTroops101A				= {}
	
		armyTroops101A.player 		= 3
		armyTroops101A.id			= 1
		armyTroops101A.strength		= 8
		armyTroops101A.position		= GetPosition("player3")
		armyTroops101A.rodeLength	= 4000

		SetupArmy(armyTroops101A)

	--	create army	
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderPoleArm3
	
		EnlargeArmy(armyTroops101A,troopDescription)
		EnlargeArmy(armyTroops101A,troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderBow3

		EnlargeArmy(armyTroops101A,troopDescription)
		EnlargeArmy(armyTroops101A,troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderSword3

		EnlargeArmy(armyTroops101A,troopDescription)
		EnlargeArmy(armyTroops101A,troopDescription)

		troopDescription.leaderType = Entities.PV_Cannon3

		EnlargeArmy(armyTroops101A,troopDescription)
	
	end
	