setupArmyRightFortress = function()

	ArmyRightFortress				= {}

	ArmyRightFortress.player 		= 8
	ArmyRightFortress.id			= 4
	ArmyRightFortress.strength		= 5 + CP_Difficulty
	ArmyRightFortress.position		= GetPosition("KI3_DefensePos")
	ArmyRightFortress.rodeLength	= 5000
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		ArmyRightFortress.spawnTypes 		= { { Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderSword1, 4},
												{ Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderBow1, 4},
												{ Entities.CU_BlackKnight_LeaderMace1, 4} }
	else
		if CP_Difficulty == 1 then
			ArmyRightFortress.spawnTypes 		= { { Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderSword2, 4},
													{ Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderBow2, 4},
													{ Entities.PU_LeaderSword2, 4},
													{ Entities.PU_LeaderBow2, 4},
													{ Entities.CU_BlackKnight_LeaderMace1, 4},
													{ Entities.PV_Cannon1, 1} }
		else
			ArmyRightFortress.spawnTypes 		= { { Entities.PU_LeaderPoleArm3, 6},
													{ Entities.PU_LeaderSword3, 6},
													{ Entities.PU_LeaderPoleArm3, 6},
													{ Entities.PU_LeaderBow3, 6},
													{ Entities.PU_LeaderSword3, 6},
													{ Entities.PU_LeaderBow3, 6},
													{ Entities.CU_BlackKnight_LeaderMace2, 6},
													{ Entities.PV_Cannon3a, 1} }
		end
	end

	ArmyRightFortress.spawnPos			= GetPosition("KI3_SpawnPos")
	ArmyRightFortress.spawnGenerator	= "KI3_HQ"
	ArmyRightFortress.respawnTime		= 60
	ArmyRightFortress.endless			= true
	ArmyRightFortress.experiencePoints	=	CP_Difficulty

	-- Setup army
	SetupArmy(ArmyRightFortress)
	
	-- Army generator
	SetupAITroopSpawnGenerator("RightFortress_Generator", ArmyRightFortress)
	
end