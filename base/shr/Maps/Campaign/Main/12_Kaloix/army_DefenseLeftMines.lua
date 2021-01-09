setupArmyDefenseLeftMines = function()

	armyDefenseLeftMines		= {}

	armyDefenseLeftMines.player 			= 7
	armyDefenseLeftMines.id					= 1
	armyDefenseLeftMines.strength			= 3
	armyDefenseLeftMines.position			= GetPosition("DefenceLeftMinesPos")
	armyDefenseLeftMines.rodeLength			= 2500

	if CP_Difficulty == 0 then
		armyDefenseLeftMines.spawnTypes 		= { { Entities.PU_LeaderPoleArm1, 4},
													{ Entities.PU_LeaderSword1, 4},
													{ Entities.PU_LeaderPoleArm1, 4},
													{ Entities.PU_LeaderPoleArm1, 4},
													{ Entities.PU_LeaderSword1, 4},
													{ Entities.PU_LeaderHeavyCavalry1, 4},
													{ Entities.PU_LeaderHeavyCavalry1, 4},
													{ Entities.PU_LeaderHeavyCavalry2, 4} }
	else
		armyDefenseLeftMines.spawnTypes 		= { { Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderSword2, 4},
													{ Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderSword2, 4},
													{ Entities.PU_LeaderHeavyCavalry1, 4},
													{ Entities.PU_LeaderHeavyCavalry1, 4},
													{ Entities.PU_LeaderHeavyCavalry2, 4} }
	end
	armyDefenseLeftMines.spawnPos			= GetPosition("DefenceLeftMinesSpawn")
	armyDefenseLeftMines.spawnGenerator		= "DefenceLeftMinesHQ"
	armyDefenseLeftMines.respawnTime		= 60
	armyDefenseLeftMines.endless			= false
	armyDefenseLeftMines.noEnemy 			= true
	armyDefenseLeftMines.noEnemyDistance 	= 2000
	armyDefenseLeftMines.maxSpawnAmount 	= 1
	-- Setup army
	SetupArmy(armyDefenseLeftMines)
	
	-- Army generator
	SetupAITroopSpawnGenerator("DefenseLeftMines_Generator", armyDefenseLeftMines)
	
end