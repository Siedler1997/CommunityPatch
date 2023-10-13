createArmySpawn = function()

	armySpawn1							= {}

	armySpawn1.player 					= 2
	armySpawn1.id						= 1
	armySpawn1.strength					= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position					= GetPosition("spawn1")
	armySpawn1.rodeLength				= 4000
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow
										}

	armySpawn1.baseDefenseRange			= 5000
	armySpawn1.outerDefenseRange		= 8000
	armySpawn1.AttackPos				= GetPosition("spawn1")
	armySpawn1.AttackAllowed			= true

	armySpawn1.control					= {}
	armySpawn1.control.delay			= 60 * 28

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("armySpawn1",armySpawn1)


	armySpawn2							= {}

	armySpawn2.player 					= 5
	armySpawn2.id						= 1
	armySpawn2.strength					= 8
	armySpawn2.retreatStrength			= 3
	armySpawn2.position					= GetPosition("spawn2")
	armySpawn2.rodeLength				= 4000
	armySpawn2.AllowedTypes 			= { 
		UpgradeCategories.LeaderHeavyCavalry,
		UpgradeCategories.LeaderHeavyCavalry,
		UpgradeCategories.LeaderCavalry
										}

	armySpawn2.baseDefenseRange			= 5000
	armySpawn2.outerDefenseRange		= 8000
	armySpawn2.AttackPos				= GetPosition("spawn2")
	armySpawn2.AttackAllowed			= true

	armySpawn2.control					= {}
	armySpawn2.control.delay			= 60 * 22

	SetupArmy(armySpawn2)

	SetupAITroopGenerator("armySpawn2",armySpawn2)


	StartJob("ControlSpawnArmies")	

	end

	
-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmies = function()
	if armySpawn1.control.delay > 0 then
		armySpawn1.control.delay = armySpawn1.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies",20)
	end
Action_ControlSpawnArmies = function()
	TickOffensiveAIController(armySpawn1)
	TickOffensiveAIController(armySpawn2)
	return false		
	end
