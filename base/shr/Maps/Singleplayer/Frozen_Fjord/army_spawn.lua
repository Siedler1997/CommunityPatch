
-- North town

createArmySpawn = function()

	armySpawn1							= {}

	armySpawn1.player 					= 3
	armySpawn1.id						= 1
	armySpawn1.strength					= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position					= GetPosition("spawn1")
	armySpawn1.rodeLength				= 4000
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.BlackKnightLeaderMace1
										}

	armySpawn1.baseDefenseRange			= 5000
	armySpawn1.outerDefenseRange		= 8000
	armySpawn1.AttackPos				= GetPosition("spawn1")
	armySpawn1.AttackAllowed			= true

	armySpawn1.control					= {}
	armySpawn1.control.delay			= 60 * 45

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("armySpawn1",armySpawn1)

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
	return false		
	end
