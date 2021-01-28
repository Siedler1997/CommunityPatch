
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
	
		EnlargeArmy(armyDefendMine,troopDescription)

	end