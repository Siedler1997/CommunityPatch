

createArmySpawn = function()

	armySpawn1							= {}

	armySpawn1.player 					= 2
	armySpawn1.id						= 1
	armySpawn1.strength					= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position					= GetPosition("player2")
	armySpawn1.rodeLength				= 9000
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderCavalry,
											UpgradeCategories.LeaderRifle
										}

	armySpawn1.baseDefenseRange			= 9000
	armySpawn1.outerDefenseRange		= 9000
	armySpawn1.AttackAllowed			= false
	armySpawn1.pulse					=	true

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("armySpawn1",armySpawn1)

	StartJob("ControlSpawnArmies")	

	end

	
-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmies = function()
	return Counter.Tick2("ControlSpawnArmies",20)
	end
Action_ControlSpawnArmies = function()
	TickOffensiveAIController(armySpawn1)
	return false		
	end
