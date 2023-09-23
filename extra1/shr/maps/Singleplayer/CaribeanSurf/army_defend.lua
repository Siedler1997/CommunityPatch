createArmyDefend = function()

	armySpawn1							= {}

	armySpawn1.player 					= 3
	armySpawn1.id						= 6
	armySpawn1.strength					= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position					= GetPosition("production1")
	armySpawn1.rodeLength				= 2000
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
										UpgradeCategories.LeaderBow,
									--	Entities.PV_Cannon2
												
										}

	armySpawn1.baseDefenseRange			= 3000
	armySpawn1.outerDefenseRange		= 2000
	armySpawn1.AttackPos				= GetPosition("production1")
	armySpawn1.AttackAllowed			= false

	armySpawn1.control					= {}
	armySpawn1.control.delay			= 10 * 15

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("production1",armySpawn1)


	armySpawn2							= {}

	armySpawn2.player 					= 3
	armySpawn2.id						= 7
	armySpawn2.strength					= 8
	armySpawn2.retreatStrength			= 3
	armySpawn2.position					= GetPosition("production2")
	armySpawn2.rodeLength				= 2000
	armySpawn2.AllowedTypes 			= { --UpgradeCategories.LeaderPoleArm, 
									--	UpgradeCategories.LeaderSword,
									--	UpgradeCategories.LeaderBow,
										Entities.PV_Cannon2
												
										}

	armySpawn2.baseDefenseRange			= 3000
	armySpawn2.outerDefenseRange		= 2000
	armySpawn2.AttackPos				= GetPosition("production2")
	armySpawn2.AttackAllowed			= false

	armySpawn2.control					= {}
	armySpawn2.control.delay			= 10 * 15

	SetupArmy(armySpawn2)

	SetupAITroopGenerator("production2",armySpawn2)


	armySpawn3							= {}

	armySpawn3.player 					= 3
	armySpawn3.id						= 7
	armySpawn3.strength					= 8
	armySpawn3.retreatStrength			= 3
	armySpawn3.position					= GetPosition("base1_1")
	armySpawn3.rodeLength				= 2000
	armySpawn3.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
									--	UpgradeCategories.LeaderHeavyCavalry,
																					
										}

	armySpawn3.baseDefenseRange			= 3000
	armySpawn3.outerDefenseRange		= 2000
	armySpawn3.AttackPos				= GetPosition("base1_1")
	armySpawn3.AttackAllowed			= false

	armySpawn3.control					= {}
	armySpawn3.control.delay			= 10 * 15

	SetupArmy(armySpawn3)

	SetupAITroopGenerator("base1_1",armySpawn3)





--------------------------------------------------------------------------player 5
	armySpawn4							= {}

	armySpawn4.player 					= 5
	armySpawn4.id						= 0
	armySpawn4.strength					= 8
	armySpawn4.retreatStrength			= 3
	armySpawn4.position					= GetPosition("p_5_1")
	armySpawn4.rodeLength				= 2000
	armySpawn4.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
									--	UpgradeCategories.LeaderHeavyCavalry,
																					
										}

	armySpawn4.baseDefenseRange			= 3000
	armySpawn4.outerDefenseRange		= 2000
	armySpawn4.AttackPos				= GetPosition("p_5_1")
	armySpawn4.AttackAllowed			= true

	armySpawn4.control					= {}
	armySpawn4.control.delay			= 10 * 15

	SetupArmy(armySpawn4)

	SetupAITroopGenerator("p_5_1",armySpawn4)



	armySpawn5							= {}

	armySpawn5.player 					= 5
	armySpawn5.id						= 1
	armySpawn5.strength					= 8
	armySpawn5.retreatStrength			= 3
	armySpawn5.position					= GetPosition("p_5_2")
	armySpawn5.rodeLength				= 2000
	armySpawn5.AllowedTypes 			= { --UpgradeCategories.LeaderPoleArm, 
										--UpgradeCategories.LeaderSword,
										--UpgradeCategories.LeaderHeavyCavalry,
										Entities.PV_Cannon3,
																					
										}

	armySpawn5.baseDefenseRange			= 3000
	armySpawn5.outerDefenseRange		= 2000
	armySpawn5.AttackPos				= GetPosition("p_5_2")
	armySpawn5.AttackAllowed			= true

	armySpawn5.control					= {}
	armySpawn5.control.delay			= 10 * 15

	SetupArmy(armySpawn5)

	SetupAITroopGenerator("p_5_2",armySpawn5)


	armySpawn6							= {}

	armySpawn6.player 					= 5
	armySpawn6.id						= 2
	armySpawn6.strength					= 8
	armySpawn6.retreatStrength			= 3
	armySpawn6.position					= GetPosition("p_5_3")
	armySpawn6.rodeLength				= 2000
	armySpawn6.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
									--	UpgradeCategories.LeaderHeavyCavalry,
																					
										}

	armySpawn6.baseDefenseRange			= 3000
	armySpawn6.outerDefenseRange		= 2000
	armySpawn6.AttackPos				= GetPosition("p_5_3")
	armySpawn6.AttackAllowed			= true

	armySpawn6.control					= {}
	armySpawn6.control.delay			= 10 * 15

	SetupArmy(armySpawn6)

	SetupAITroopGenerator("p_5_3",armySpawn6)

	armySpawn7							= {}

	armySpawn7.player 					= 5
	armySpawn7.id						= 3
	armySpawn7.strength					= 8
	armySpawn7.retreatStrength			= 3
	armySpawn7.position					= GetPosition("p_5_4")
	armySpawn7.rodeLength				= 2000
	armySpawn7.AllowedTypes 			= {-- UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderBow,
										UpgradeCategories.LeaderHeavyCavalry,
										Entities.PV_Cannon3,
																					
										}

	armySpawn7.baseDefenseRange			= 3000
	armySpawn7.outerDefenseRange		= 2000
	armySpawn7.AttackPos				= GetPosition("p_5_4")
	armySpawn7.AttackAllowed			= true

	armySpawn7.control					= {}
	armySpawn7.control.delay			= 10 * 15

	SetupArmy(armySpawn7)

	SetupAITroopGenerator("p_5_4",armySpawn7)


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
	TickOffensiveAIController(armySpawn6)
	TickOffensiveAIController(armySpawn7)

	return false		
	end
