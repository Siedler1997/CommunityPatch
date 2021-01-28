
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
		local experience = LOW_EXPERIENCE
		local etype = Entities.CU_BanditLeaderSword1
		if CP_Difficulty == 1 then
			soldiers = soldiers + 4
			experience = HIGH_EXPERIENCE
			etype = Entities.CU_BanditLeaderSword2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
			leaderType			= etype
		}			
	
		EnlargeArmy(armySwamp1,troopDescription)

	end
