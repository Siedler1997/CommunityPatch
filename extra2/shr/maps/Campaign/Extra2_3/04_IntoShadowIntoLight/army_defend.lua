createArmyDefend = function()

	armyDef1					= {}   ----------bridge 4

	armyDef1.player 				= 6
	armyDef1.id					= 0
	armyDef1.strength				= 2
	armyDef1.retreatStrength			= 1
	armyDef1.position				= GetPosition("p6_1")
	armyDef1.rodeLength				= 1000
	armyDef1.AllowedTypes 				= { 			UpgradeCategories.LeaderBow,
										
							  }


	armyDef1.baseDefenseRange		= 1000
	armyDef1.outerDefenseRange		= 1000
	armyDef1.AttackPos			= GetPosition("p6_1")
	armyDef1.AttackAllowed			= false

	armyDef1.control			= {}
	armyDef1.control.delay			= 20 * 15

	SetupArmy(armyDef1)

	SetupAITroopGenerator("p6_1",armyDef1)

	
	
	armyDef2					= {}       --------------bridge 5

	armyDef2.player 				= 6
	armyDef2.id					= 1
	armyDef2.strength				= 2
	armyDef2.retreatStrength			= 1
	armyDef2.position				= GetPosition("p6_2")
	armyDef2.rodeLength				= 1000
	armyDef2.AllowedTypes 				= { 			UpgradeCategories.LeaderHeavyCavalry,
								UpgradeCategories.LeaderSword,
								UpgradeCategories.LeaderCavalry,
										
							  }


	armyDef2.baseDefenseRange		= 1000
	armyDef2.outerDefenseRange		= 1000
	armyDef2.AttackPos			= GetPosition("p6_2")
	armyDef2.AttackAllowed			= false

	armyDef2.control			= {}
	armyDef2.control.delay			= 20 * 15

	SetupArmy(armyDef2)

	SetupAITroopGenerator("p6_2",armyDef2)


	armyDef3					= {}       --------------bridge 2_1

	armyDef3.player 				= 2
	armyDef3.id					= 7
	armyDef3.strength				= 3
	armyDef3.retreatStrength			= 1
	armyDef3.position				= GetPosition("p2spw_2")
	armyDef3.rodeLength				= 1000
	armyDef3.AllowedTypes 				= { 			UpgradeCategories.LeaderHeavyCavalry,
								UpgradeCategories.LeaderSword,
								UpgradeCategories.LeaderCavalry,
										
							  }


	armyDef3.baseDefenseRange		= 1000
	armyDef3.outerDefenseRange		= 1000
	armyDef3.AttackPos			= GetPosition("p2spw_2")
	armyDef3.AttackAllowed			= false

	armyDef3.control			= {}
	armyDef3.control.delay			= 20 * 15

	SetupArmy(armyDef3)

	SetupAITroopGenerator("p2spw",armyDef3)

	
	armyDef4					= {}       --------------bridge 2_2

	armyDef4.player 				= 2
	armyDef4.id					= 6
	armyDef4.strength				= 3
	armyDef4.retreatStrength			= 1
	armyDef4.position				= GetPosition("p2spw_1")
	armyDef4.rodeLength				= 1000
	armyDef4.AllowedTypes 				= { 	UpgradeCategories.LeaderBow,
								UpgradeCategories.LeaderRifle,
								Entities.PV_Cannon2,
										
							  }


	armyDef4.baseDefenseRange		= 1000
	armyDef4.outerDefenseRange		= 1000
	armyDef4.AttackPos			= GetPosition("p2spw_1")
	armyDef4.AttackAllowed			= false

	armyDef4.control			= {}
	armyDef4.control.delay			= 20 * 15

	SetupArmy(armyDef4)

	SetupAITroopGenerator("p2spw_1",armyDef4)

	
	armyDef5					= {}       --------------bridge 2_2

	armyDef5.player 				= 4
	armyDef5.id					= 8
	armyDef5.strength				= 3
	armyDef5.retreatStrength			= 1
	armyDef5.position				= GetPosition("p4_1")
	armyDef5.rodeLength				= 1000
	armyDef5.AllowedTypes 				= { 	UpgradeCategories.LeaderBow,
							        UpgradeCategories.LeaderRifle,
																										
							  }


	armyDef5.baseDefenseRange		= 1000
	armyDef5.outerDefenseRange		= 1000
	armyDef5.AttackPos			= GetPosition("p4_1")
	armyDef5.AttackAllowed			= false

	armyDef5.control			= {}
	armyDef5.control.delay			= 20 * 15

	SetupArmy(armyDef5)

	SetupAITroopGenerator("p4_1",armyDef5)

	armyDef6					= {}       --------------gates1

	armyDef6.player 				= 5
	armyDef6.id					= 8
	armyDef6.strength				= 4
	armyDef6.retreatStrength			= 1
	armyDef6.position				= GetPosition("p5_4_1")
	armyDef6.rodeLength				= 1000
	armyDef6.AllowedTypes 				= { 	UpgradeCategories.LeaderBow,
								UpgradeCategories.LeaderRifle,
								UpgradeCategories.LeaderSword,
								UpgradeCategories.LeaderPoleArm,
							  }


	armyDef6.baseDefenseRange		= 1000
	armyDef6.outerDefenseRange		= 1000
	armyDef6.AttackPos			= GetPosition("p5_4_1")
	armyDef6.AttackAllowed			= false

	armyDef6.control			= {}
	armyDef6.control.delay			= 20 * 15

	SetupArmy(armyDef6)

	SetupAITroopGenerator("p5_4_1",armyDef6)


	





	StartJob("ControlSpawnArmies1")	
	StartJob("ControlSpawnArmies2")
	StartJob("ControlSpawnArmies3")
	StartJob("ControlSpawnArmies4")
	StartJob("ControlSpawnArmies5")
	StartJob("ControlSpawnArmies6")

	end

-------------------------------------------
createArmydef7 = function()

	armyDef7					= {}       --------------bridge 2_2

	armyDef7.player 				= 5
	armyDef7.id					= 7
	armyDef7.strength				= 3
	armyDef7.retreatStrength			= 1
	armyDef7.position				= GetPosition("detect_point")
	armyDef7.rodeLength				= 1000
	armyDef7.AllowedTypes 				= { 	UpgradeCategories.LeaderCavalry,
								
							  }


	armyDef7.baseDefenseRange		= 1000
	armyDef7.outerDefenseRange		= 1000
	armyDef7.AttackPos			= GetPosition("detect_point")
	armyDef7.AttackAllowed			= false

	armyDef7.control			= {}
	armyDef7.control.delay			= 20 * 15

	SetupArmy(armyDef7)

	SetupAITroopGenerator("detect_point",armyDef7)

	StartJob("ControlSpawnArmies7")


end

	
-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmies1 = function()
	if armyDef1.control.delay > 0 then
		armyDef1.control.delay = armyDef1.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies1",20)
	end
Action_ControlSpawnArmies1 = function()

	TickOffensiveAIController(armyDef1)

	return false		
	end

Condition_ControlSpawnArmies2 = function()
	if armyDef2.control.delay > 0 then
		armyDef2.control.delay = armyDef2.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies2",20)
	end
Action_ControlSpawnArmies2 = function()

	TickOffensiveAIController(armyDef2)

	return false		
	end

Condition_ControlSpawnArmies3 = function()
	if armyDef3.control.delay > 0 then
		armyDef3.control.delay = armyDef3.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies3",20)
	end
Action_ControlSpawnArmies3 = function()

	TickOffensiveAIController(armyDef3)

	return false		
	end

Condition_ControlSpawnArmies4 = function()
	if armyDef4.control.delay > 0 then
		armyDef4.control.delay = armyDef4.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies4",20)
	end
Action_ControlSpawnArmies4 = function()

	TickOffensiveAIController(armyDef4)

	return false		
	end

Condition_ControlSpawnArmies5 = function()
	if armyDef5.control.delay > 0 then
		armyDef5.control.delay = armyDef5.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies5",20)
	end
Action_ControlSpawnArmies5 = function()

	TickOffensiveAIController(armyDef5)

	return false		
	end

Condition_ControlSpawnArmies6 = function()
	if armyDef6.control.delay > 0 then
		armyDef6.control.delay = armyDef6.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies6",20)
	end
Action_ControlSpawnArmies6 = function()

	TickOffensiveAIController(armyDef6)

	return false		
	end

Condition_ControlSpawnArmies7 = function()
	if armyDef7.control.delay > 0 then
		armyDef7.control.delay = armyDef7.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies7",20)
	end
Action_ControlSpawnArmies7 = function()

	TickOffensiveAIController(armyDef7)

	return false		
	end