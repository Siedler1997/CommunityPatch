
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
		local etype1 = Entities.CU_BlackKnight_LeaderMace1
		local etype2 = Entities.PU_LeaderBow2
		if CP_Difficulty == 2 then
			soldiers = 8
			etype1 = Entities.CU_BlackKnight_LeaderMace2
			etype2 = Entities.PU_LeaderBow2a
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= CP_Difficulty,
		}			

		troopDescription.leaderType = etype1
		EnlargeArmy(armyDefendCamp1,troopDescription)

		troopDescription.leaderType = etype2
		EnlargeArmy(armyDefendCamp1,troopDescription)

	end
