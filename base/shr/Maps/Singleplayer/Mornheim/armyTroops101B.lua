
setupArmyTroops101B = function()

	-- define anchor

		armyTroops101B				= {}
	
		armyTroops101B.player 		= 3
		armyTroops101B.id			= 2
		armyTroops101B.strength		= 8
		armyTroops101B.position		= GetPosition("landingZoneA")
		armyTroops101B.rodeLength	= 1500
		
		SetupArmy(armyTroops101B)

	--	create army	
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			

		troopDescription.leaderType	= Entities.PU_LeaderSword3
	
		EnlargeArmy(armyTroops101B,troopDescription)
		EnlargeArmy(armyTroops101B,troopDescription)

		troopDescription.leaderType	= Entities.PU_LeaderBow3

		EnlargeArmy(armyTroops101B,troopDescription)

		troopDescription.leaderType	= Entities.PV_Cannon3
		troopDescription.leaderType	= Entities.PV_Cannon4

		EnlargeArmy(armyTroops101B,troopDescription)
	
	end
	