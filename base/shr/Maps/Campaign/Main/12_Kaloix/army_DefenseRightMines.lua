setupArmyDefenseRightMines = function()

	armyDefenseRightMines					= {}

	armyDefenseRightMines.player 			= 7
	armyDefenseRightMines.id				= 2
	armyDefenseRightMines.strength			= 2
	armyDefenseRightMines.position			= GetPosition("DefenceRightMinesPos")
	armyDefenseRightMines.rodeLength			= 2000
	if CP_Difficulty == 0 then
		armyDefenseRightMines.spawnTypes 		= { { Entities.PU_LeaderPoleArm1, 4},
													{ Entities.PU_LeaderSword1, 4},
													{ Entities.PU_LeaderBow1, 4},
													{ Entities.PU_LeaderPoleArm1, 4},
													{ Entities.PU_LeaderBow1, 4} }
	else
		armyDefenseRightMines.spawnTypes 		= { { Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderSword2, 4},
													{ Entities.PU_LeaderBow2, 4},
													{ Entities.PU_LeaderPoleArm2, 4},
													{ Entities.PU_LeaderBow2, 4} }
	end
	armyDefenseRightMines.spawnPos			= GetPosition("DefenceRightMinesSpawn")
	armyDefenseRightMines.spawnGenerator	= "DefenceRightMinesHQ"
	armyDefenseRightMines.respawnTime		= 60
	armyDefenseRightMines.endless			= false
	armyDefenseRightMines.noEnemy 		= true
	armyDefenseRightMines.noEnemyDistance 	= 2000
	armyDefenseRightMines.maxSpawnAmount = 1


	-- Setup army
	SetupArmy(armyDefenseRightMines)
	
	-- Army generator
	SetupAITroopSpawnGenerator("DefenseRightMines_Generator", armyDefenseRightMines)
	
end

