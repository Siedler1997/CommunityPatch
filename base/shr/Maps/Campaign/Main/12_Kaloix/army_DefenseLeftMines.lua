setupArmyDefenseLeftMines = function()

	armyDefenseLeftMines		= {}

	armyDefenseLeftMines.player 			= 7
	armyDefenseLeftMines.id					= 1
	armyDefenseLeftMines.position			= GetPosition("DefenceLeftMinesPos")
	armyDefenseLeftMines.rodeLength			= 2500

	if CP_Difficulty == 0 then
		armyDefenseLeftMines.strength = 3
		armyDefenseLeftMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow1, 4},
													{ Entities.CU_BanditLeaderSword1, 4},
													{ Entities.CU_BanditLeaderSword1, 4} }
	else
		armyDefenseLeftMines.strength = 4
		armyDefenseLeftMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow2, 8},
													{ Entities.CU_BanditLeaderSword2, 8},
													{ Entities.CU_BanditLeaderSword2, 8} }
	end
	armyDefenseLeftMines.spawnPos			= GetPosition("DefenceLeftMinesSpawn")
	armyDefenseLeftMines.spawnGenerator		= "DefenceLeftMinesHQ"
	armyDefenseLeftMines.respawnTime		= 60
	armyDefenseLeftMines.endless			= false
	armyDefenseLeftMines.noEnemy 			= true
	armyDefenseLeftMines.noEnemyDistance 	= 2000
	armyDefenseLeftMines.maxSpawnAmount 	= 1
	armyDefenseLeftMines.experiencePoints	=	CP_Difficulty
	-- Setup army
	SetupArmy(armyDefenseLeftMines)
	
	-- Army generator
	SetupAITroopSpawnGenerator("DefenseLeftMines_Generator", armyDefenseLeftMines)
	
end