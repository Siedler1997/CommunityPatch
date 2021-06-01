setupArmyDefenseRightMines = function()

	armyDefenseRightMines					= {}

	armyDefenseRightMines.player 			= 7
	armyDefenseRightMines.id				= 2
	armyDefenseRightMines.position			= GetPosition("DefenceRightMinesPos")
	armyDefenseRightMines.rodeLength			= 2000

	if CP_Difficulty == 0 then
		armyDefenseRightMines.strength = 2
		armyDefenseRightMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow1, 4},
													{ Entities.CU_BanditLeaderSword1, 4},
													{ Entities.CU_BanditLeaderSword1, 4} }
	else
		armyDefenseRightMines.strength = 3
		armyDefenseRightMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow2, 8},
													{ Entities.CU_BanditLeaderSword2, 8},
													{ Entities.CU_BanditLeaderSword2, 8} }
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

