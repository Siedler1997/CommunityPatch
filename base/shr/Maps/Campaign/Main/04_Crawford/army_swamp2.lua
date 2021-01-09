
createArmySwamp2 = function()

	--	set up

		ArmySwamp2					= {}
	
		ArmySwamp2.player 			= 6
		ArmySwamp2.id				= 2
		ArmySwamp2.strength			= 1
		ArmySwamp2.position			= GetPosition("attSpawnPoint2_SA")
		ArmySwamp2.rodeLength		= 2200
		
		SetupArmy(ArmySwamp2)

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
	
		EnlargeArmy(ArmySwamp2,troopDescription)

	end
