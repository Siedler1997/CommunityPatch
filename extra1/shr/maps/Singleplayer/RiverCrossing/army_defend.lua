createArmyDefend = function()

	armySpawn1							= {}

	armySpawn1.player 					= 3
	armySpawn1.id						= 9
	armySpawn1.strength					= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position					= GetPosition("p3_base")
	armySpawn1.rodeLength				= 2000
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
				
										}

	armySpawn1.baseDefenseRange			= 3000
	armySpawn1.outerDefenseRange		= 2000
	armySpawn1.AttackPos				= GetPosition("p3_base")
	armySpawn1.AttackAllowed			= false

	armySpawn1.control					= {}
	armySpawn1.control.delay			= 30 * 15

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("armySpawn1",armySpawn1)


	armySpawn2							= {}

	armySpawn2.player 					= 4
	armySpawn2.id						= 5
	armySpawn2.strength					= 8
	armySpawn2.retreatStrength			= 3
	armySpawn2.position					= GetPosition("p4_base1")
	armySpawn2.rodeLength				= 2000
	armySpawn2.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
								UpgradeCategories.LeaderBow,
								UpgradeCategories.LeaderCavalry,
								UpgradeCategories.LeaderRifle
										}

	armySpawn2.baseDefenseRange			= 5000
	armySpawn2.outerDefenseRange		= 3000
	armySpawn2.AttackPos				= GetPosition("p4_base1")
	armySpawn2.AttackAllowed			= false

	armySpawn2.control					= {}
	armySpawn2.control.delay			= 40 * 15

	SetupArmy(armySpawn2)

	SetupAITroopGenerator("armySpawn2",armySpawn2)

	armySpawn3							= {}

	armySpawn3.player 					= 6
	armySpawn3.id						= 5
	armySpawn3.strength					= 8
	armySpawn3.retreatStrength			= 3
	armySpawn3.position					= GetPosition("p4_base2")
	armySpawn3.rodeLength				= 5000
	armySpawn3.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle
										}

	armySpawn3.baseDefenseRange			= 500
	armySpawn3.outerDefenseRange		= 500
	armySpawn3.AttackPos				= GetPosition("p4_base2")
	armySpawn3.AttackAllowed			= false

	armySpawn3.control					= {}
	armySpawn3.control.delay			= 50 * 15

	SetupArmy(armySpawn3)

	SetupAITroopGenerator("armySpawn3",armySpawn3)


	armySpawn4							= {}

	armySpawn4.player 					= 7
	armySpawn4.id						= 5
	armySpawn4.strength					= 8
	armySpawn4.retreatStrength			= 3
	armySpawn4.position					= GetPosition("p5_prod1")
	armySpawn4.rodeLength				= 2000
	armySpawn4.AllowedTypes 			= { --UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle
										--	Entities.PV_Cannon2
										}

	armySpawn4.baseDefenseRange			= 3000
	armySpawn4.outerDefenseRange		= 2000
	armySpawn4.AttackPos				= GetPosition("p5_prod1")
	armySpawn4.AttackAllowed			= false

	armySpawn4.control					= {}
	armySpawn4.control.delay			= 60 * 15

	SetupArmy(armySpawn4)

	SetupAITroopGenerator("armySpawn4",armySpawn4)


	armySpawn5							= {}

	armySpawn5.player 					= 5
	armySpawn5.id						= 1
	armySpawn5.strength					= 8
	armySpawn5.retreatStrength			= 3
	armySpawn5.position					= GetPosition("p5_prod2")
	armySpawn5.rodeLength				= 2000
	armySpawn5.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle,
											Entities.PV_Cannon4
										}

	armySpawn5.baseDefenseRange			= 3000
	armySpawn5.outerDefenseRange		= 2000
	armySpawn5.AttackPos				= GetPosition("p5_prod2")
	armySpawn5.AttackAllowed			= false

	armySpawn5.control					= {}
	armySpawn5.control.delay			= 60 * 15

	SetupArmy(armySpawn5)

	SetupAITroopGenerator("armySpawn5",armySpawn5)


	armySpawn6							= {}

	armySpawn6.player 					= 5
	armySpawn6.id						= 7
	armySpawn6.strength					= 8
	armySpawn6.retreatStrength			= 3
	armySpawn6.position					= GetPosition("p5_prod3")
	armySpawn6.rodeLength				= 2000
	armySpawn6.AllowedTypes 			= { --UpgradeCategories.LeaderPoleArm, 
										--	UpgradeCategories.LeaderSword,
										--	UpgradeCategories.LeaderBow,
											Entities.PV_Cannon4,
											LeaderHeavyCavalry
										}

	armySpawn6.baseDefenseRange			= 3000
	armySpawn6.outerDefenseRange		= 2000
	armySpawn6.AttackPos				= GetPosition("p5_prod3")
	armySpawn6.AttackAllowed			= false

	armySpawn6.control					= {}
	armySpawn6.control.delay			= 60 * 15

	SetupArmy(armySpawn6)

	SetupAITroopGenerator("armySpawn6",armySpawn6)


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
	TickOffensiveAIController(armySpawn3)
	TickOffensiveAIController(armySpawn4)
	TickOffensiveAIController(armySpawn5)
--	TickOffensiveAIController(armySpawn6)
	return false		
	end
