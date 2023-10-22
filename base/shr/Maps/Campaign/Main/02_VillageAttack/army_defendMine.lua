
createArmyDefendMine = function()

	--	set up

		armyDefendMine				= {}
	
		armyDefendMine.player 		= 3
		armyDefendMine.id			= 2
		armyDefendMine.strength		= 1
		armyDefendMine.position		= GetPosition("defendMine")
		armyDefendMine.rodeLength	= 350
		
		SetupArmy(armyDefendMine)

	--	create 
		local soldiers = 4 + 2 * CP_Difficulty
		local experience = 0
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty > 0 then
			experience = 2
			etype = Entities.CU_BanditLeaderSword2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}			

		troopDescription.leaderType = etype
	
		EnlargeArmy(armyDefendMine,troopDescription)

	end