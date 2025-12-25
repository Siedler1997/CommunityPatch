setupArmyDefenseLeftMines = function()

	armyDefenseLeftMines		= {}

	armyDefenseLeftMines.player 			= 7
	armyDefenseLeftMines.id					= 1
	armyDefenseLeftMines.position			= GetPosition("DefenceLeftMinesPos")
	armyDefenseLeftMines.rodeLength			= 2500
	armyDefenseLeftMines.strength = 3+CP_Difficulty
	
	local soldiers = 4 + CP_Difficulty * 2
	if CP_Difficulty == 0 then
		armyDefenseLeftMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow1, soldiers},
													{ Entities.CU_BanditLeaderSword1, soldiers},
													{ Entities.CU_BanditLeaderSword1, soldiers} }
	else
		armyDefenseLeftMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow2, soldiers},
													{ Entities.CU_BanditLeaderSword2, soldiers},
													{ Entities.CU_BanditLeaderSword2, soldiers} }
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