
createArmySwamp1 = function()

	--	set up

		armySwamp1					= {}
	
		armySwamp1.player 			= 6
		armySwamp1.id				= 1
		armySwamp1.strength			= 1
		if CP_Difficulty == 2 then
			armySwamp1.strength = armySwamp1.strength + 1
		end
		armySwamp1.position			= GetPosition("attSpawnPoint1_SA")
		armySwamp1.rodeLength		= 1000
		
		SetupArmy(armySwamp1)

	--	create
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty == 2 then
			etype = Entities.CU_BanditLeaderSword2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4 + 2 * CP_Difficulty,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= CP_Difficulty,
			leaderType			= etype
		}			
	
		EnlargeArmy(armySwamp1,troopDescription)

		if CP_Difficulty == 2 then
			troopDescription.leaderType = Entities.CU_BanditLeaderBow2
			EnlargeArmy(armySwamp1,troopDescription)
		end
	end
