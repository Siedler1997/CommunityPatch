
createArmyDefendIron = function()

	--	set up

		armyDefendIron				= {}
	
		armyDefendIron.player 		= 3
		armyDefendIron.id			= 6
		armyDefendIron.strength		= 1
		armyDefendIron.position		= GetPosition("defendIron")
		armyDefendIron.rodeLength	= 400
		
		SetupArmy(armyDefendIron)

	--	create 
		local soldiers = 4 + 2 * CP_Difficulty
		local etype1 = Entities.CU_BanditLeaderSword1
		if CP_Difficulty > 0 then
			etype1 = Entities.CU_BanditLeaderSword2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= CP_Difficulty,
		}			

		troopDescription.leaderType = etyp1
		EnlargeArmy(armyDefendIron,troopDescription)

	end