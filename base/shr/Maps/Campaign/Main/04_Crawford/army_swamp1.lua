
createArmySwamp1 = function()

	--	set up

		armySwamp1					= {}
	
		armySwamp1.player 			= 6
		armySwamp1.id				= 1
		armySwamp1.strength			= 1
		armySwamp1.position			= GetPosition("attSpawnPoint1_SA")
		armySwamp1.rodeLength		= 1000
		
		SetupArmy(armySwamp1)

	--	create
		local soldiers = 4			
		if CP_Difficulty == 1 then
			soldiers = soldiers + 4
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.CU_BanditLeaderSword1
	
		EnlargeArmy(armySwamp1,troopDescription)

	end
