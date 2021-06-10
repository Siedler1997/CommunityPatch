setupArmyRightFortress = function()

	ArmyRightFortress				= {}

	ArmyRightFortress.player 		= 5
	ArmyRightFortress.id			= 8
	ArmyRightFortress.strength		= 5
	ArmyRightFortress.position		= GetPosition("KI3_DefensePos")
	ArmyRightFortress.rodeLength	= 5000
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		ArmyRightFortress.spawnTypes 		= { { Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderSword1, 4},
												{ Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderBow1, 4},
												{ Entities.PU_LeaderSword1, 4} }
	else
		ArmyRightFortress.strength		= 7
		ArmyRightFortress.spawnTypes 		= { { Entities.PU_LeaderPoleArm2, 4},
												{ Entities.PU_LeaderSword2, 4},
												{ Entities.PU_LeaderPoleArm2, 4},
												{ Entities.PU_LeaderBow2, 4},
												{ Entities.PU_LeaderSword2, 4},
												{ Entities.PU_LeaderBow2, 4} }
		
		if CP_Difficulty == 1 then
			table.insert(ArmyRightFortress.spawnTypes, { Entities.PV_Cannon1, 1})
		else
			table.insert(ArmyRightFortress.spawnTypes, { Entities.PV_Cannon3, 1})
		end
	end

	ArmyRightFortress.spawnPos			= GetPosition("KI3_SpawnPos")
	ArmyRightFortress.spawnGenerator	= "KI3_HQ"
	ArmyRightFortress.respawnTime		= 60
	ArmyRightFortress.endless			= true

	-- Setup army
	SetupArmy(ArmyRightFortress)
	
	-- Army generator
	SetupAITroopSpawnGenerator("RightFortress_Generator", ArmyRightFortress)
	
end