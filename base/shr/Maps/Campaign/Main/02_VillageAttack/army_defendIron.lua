
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
	
		EnlargeArmy(armyDefendIron,troopDescription)

	end