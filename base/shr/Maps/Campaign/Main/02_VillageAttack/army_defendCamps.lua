
createArmyDefendCamps = function()

	--	set up

		armyDefendCamp1					= {}
	
		armyDefendCamp1.player 			= 2
		armyDefendCamp1.id				= 7
		armyDefendCamp1.strength		= 2
		armyDefendCamp1.position		= GetPosition("guard1")
		armyDefendCamp1.rodeLength		= 500
		
		SetupArmy(armyDefendCamp1)

	--	create 
		local soldiers = 4
		local experience = 0
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty == 1 then
			soldiers = 8
			experience = 2
			etype = Entities.CU_BanditLeaderSword2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}			

		troopDescription.leaderType = etype
		EnlargeArmy(armyDefendCamp1,troopDescription)

		troopDescription.leaderType = etype
		EnlargeArmy(armyDefendCamp1,troopDescription)

	end
