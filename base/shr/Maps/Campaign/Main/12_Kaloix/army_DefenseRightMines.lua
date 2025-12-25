setupArmyDefenseRightMines = function()

	armyDefenseRightMines					= {}

	armyDefenseRightMines.player 			= 7
	armyDefenseRightMines.id				= 2
	armyDefenseRightMines.position			= GetPosition("DefenceRightMinesPos")
	armyDefenseRightMines.rodeLength			= 2000
	armyDefenseRightMines.strength = 3+CP_Difficulty
	
	local soldiers = 4 + CP_Difficulty * 2
	if CP_Difficulty == 0 then
		armyDefenseRightMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow1, soldiers},
													{ Entities.CU_BanditLeaderSword1, soldiers},
													{ Entities.CU_BanditLeaderSword1, soldiers} }
	else
		armyDefenseRightMines.spawnTypes 		= { { Entities.CU_BanditLeaderBow2, soldiers},
													{ Entities.CU_BanditLeaderSword2, soldiers},
													{ Entities.CU_BanditLeaderSword2, soldiers} }
	end

	armyDefenseRightMines.spawnPos			= GetPosition("DefenceRightMinesSpawn")
	armyDefenseRightMines.spawnGenerator	= "DefenceRightMinesHQ"
	armyDefenseRightMines.respawnTime		= 60
	armyDefenseRightMines.endless			= false
	armyDefenseRightMines.noEnemy 		= true
	armyDefenseRightMines.noEnemyDistance 	= 2000
	armyDefenseRightMines.maxSpawnAmount = 1
	armyDefenseRightMines.experiencePoints	=	CP_Difficulty


	-- Setup army
	SetupArmy(armyDefenseRightMines)
	
	-- Army generator
	SetupAITroopSpawnGenerator("DefenseRightMines_Generator", armyDefenseRightMines)
	
end

