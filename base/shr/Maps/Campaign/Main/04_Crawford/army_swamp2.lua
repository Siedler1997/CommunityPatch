
createArmySwamp2 = function()

	--	set up

		ArmySwamp2					= {}
	
		ArmySwamp2.player 			= 6
		ArmySwamp2.id				= 2
		ArmySwamp2.strength			= 1
		if CP_Difficulty == 2 then
			ArmySwamp2.strength = ArmySwamp2.strength + 1
		end
		ArmySwamp2.position			= GetPosition("attSpawnPoint2_SA")
		ArmySwamp2.rodeLength		= 2200
		
		SetupArmy(ArmySwamp2)

	--	create 
		local soldiers = 4
		local experience = LOW_EXPERIENCE
		local etype = Entities.CU_BanditLeaderBow1
		if CP_Difficulty > 0 then
			soldiers = soldiers + 4
			experience = HIGH_EXPERIENCE
			etype = Entities.CU_BanditLeaderBow2
		end
		local troopDescription = {
		
			maxNumberOfSoldiers	= soldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
			leaderType			= etype
		}			
	
		EnlargeArmy(ArmySwamp2,troopDescription)

		if CP_Difficulty == 2 then
			troopDescription.leaderType = Entities.CU_BanditLeaderSword2
			EnlargeArmy(ArmySwamp2,troopDescription)
		end

	end
