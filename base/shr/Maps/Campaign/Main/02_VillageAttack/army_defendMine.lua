
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
		EnlargeArmy(armyDefendMine,troopDescription)

	end