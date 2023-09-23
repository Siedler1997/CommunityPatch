createarmyAttack5 = function()

	armyAttack5					= {}

	armyAttack5.player 				= 3
	armyAttack5.id					= 5
	armyAttack5.strength				= 7
	armyAttack5.retreatStrength			= 1
	armyAttack5.position				= GetPosition("Pl3Attack1")
	armyAttack5.rodeLength				= 500
	armyAttack5.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderCavalry}

	armyAttack5.baseDefenseRange			= 2000
	armyAttack5.outerDefenseRange		        = 3000
	armyAttack5.AttackPos				= GetPosition("Pl3tg1")
	armyAttack5.AttackAllowed			= true

	armyAttack5.control				= {}
	armyAttack5.control.delay			= 60 * 14

	SetupArmy(armyAttack5)

	SetupAITroopGenerator("armyAttack5",armyAttack5)

	StartJob("ControlSpawnArmy5")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy5 = function()
		
	return Counter.Tick2("ControlSpawnArmy5",10)
	end


Action_ControlSpawnArmy5 = function()
	TickOffensiveAIController(armyAttack5)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack6 = function()

	armyAttack6					= {}

	armyAttack6.player 				= 3
	armyAttack6.id					= 6
	armyAttack6.strength				= 7
	armyAttack6.retreatStrength			= 1
	armyAttack6.position				= GetPosition("Pl3Attack2")
	armyAttack6.rodeLength				= 500
	armyAttack6.AllowedTypes 			= { UpgradeCategories.LeaderSword,
                                                            UpgradeCategories.LeaderPoleArm }

	armyAttack6.baseDefenseRange			= 2000
	armyAttack6.outerDefenseRange		        = 3000
	armyAttack6.AttackPos				= GetPosition("Pl3tg1")
	armyAttack6.AttackAllowed			= true

	armyAttack6.control				= {}
	armyAttack6.control.delay			= 60 * 5

	SetupArmy(armyAttack6)

	SetupAITroopGenerator("armyAttack6",armyAttack6)

	StartJob("ControlSpawnArmy6")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy6 = function()
		
	return Counter.Tick2("ControlSpawnArmy6",10)
	end


Action_ControlSpawnArmy6 = function()
	TickOffensiveAIController(armyAttack6)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack7 = function()

	armyAttack7					= {}

	armyAttack7.player 				= 3
	armyAttack7.id					= 7
	armyAttack7.strength				= 7
	armyAttack7.retreatStrength			= 1
	armyAttack7.position				= GetPosition("Pl3Attack3")
	armyAttack7.rodeLength				= 500
	armyAttack7.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle}

	armyAttack7.baseDefenseRange			= 2000
	armyAttack7.outerDefenseRange		        = 3000
	armyAttack7.AttackPos				= GetPosition("Pl3tg2")
	armyAttack7.AttackAllowed			= true

	armyAttack7.control				= {}
	armyAttack7.control.delay			= 60 * 16

	SetupArmy(armyAttack7)

	SetupAITroopGenerator("armyAttack7",armyAttack7)

	StartJob("ControlSpawnArmy7")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy7 = function()
	
	return Counter.Tick2("ControlSpawnArmy7",10)
	end


Action_ControlSpawnArmy7 = function()
	TickOffensiveAIController(armyAttack7)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack8 = function()

	armyAttack8					= {}

	armyAttack8.player 				= 3
	armyAttack8.id					= 8
	armyAttack8.strength				= 7
	armyAttack8.retreatStrength			= 1
	armyAttack8.position				= GetPosition("Pl3Attack4")
	armyAttack8.rodeLength				= 500
	armyAttack8.AllowedTypes 			= { Entities.PV_Cannon4 }

	armyAttack8.baseDefenseRange			= 2000
	armyAttack8.outerDefenseRange		        = 3000
	armyAttack8.AttackPos				= GetPosition("Pl3tg2")
	armyAttack8.AttackAllowed			= true

	armyAttack8.control				= {}
	armyAttack8.control.delay			= 60 * 15

	SetupArmy(armyAttack8)

	SetupAITroopGenerator("armyAttack8",armyAttack8)

	StartJob("ControlSpawnArmy8")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy8 = function()
		
	return Counter.Tick2("ControlSpawnArmy8",10)
	end


Action_ControlSpawnArmy8 = function()
	TickOffensiveAIController(armyAttack8)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack9 = function()

	armyAttack9					= {}

	armyAttack9.player 				= 3
	armyAttack9.id					= 4
	armyAttack9.strength				= 7
	armyAttack9.retreatStrength			= 1
	armyAttack9.position				= GetPosition("Pl3Attack5")
	armyAttack9.rodeLength				= 500
	armyAttack9.AllowedTypes 			= { Entities.PV_Cannon4 }

	armyAttack9.baseDefenseRange			= 2000
	armyAttack9.outerDefenseRange		        = 3000
	armyAttack9.AttackPos				= GetPosition("Pl3tg1")
	armyAttack9.AttackAllowed			= true

	armyAttack9.control				= {}
	armyAttack9.control.delay			= 60 * 16

	SetupArmy(armyAttack9)

	SetupAITroopGenerator("armyAttack9",armyAttack9)

	StartJob("ControlSpawnArmy9")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy9 = function()
	
	return Counter.Tick2("ControlSpawnArmy9",10)
	end


Action_ControlSpawnArmy9 = function()
	TickOffensiveAIController(armyAttack9)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack10 = function()

	armyAttack10					= {}

	armyAttack10.player 				= 3
	armyAttack10.id					= 3
	armyAttack10.strength				= 7
	armyAttack10.retreatStrength			= 1
	armyAttack10.position				= GetPosition("Pl3Attack6")
	armyAttack10.rodeLength				= 500
	armyAttack10.AllowedTypes 			= { UpgradeCategories.LeaderSword,
                                                            UpgradeCategories.LeaderPoleArm }

	armyAttack10.baseDefenseRange			= 2000
	armyAttack10.outerDefenseRange		        = 3000
	armyAttack10.AttackPos				= GetPosition("Pl3tg2")
	armyAttack10.AttackAllowed			= true

	armyAttack10.control				= {}
	armyAttack10.control.delay			= 60 * 16

	SetupArmy(armyAttack10)

	SetupAITroopGenerator("armyAttack10",armyAttack10)

	StartJob("ControlSpawnArmy10")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy10 = function()
		
	return Counter.Tick2("ControlSpawnArmy10",10)
	end


Action_ControlSpawnArmy10 = function()
	TickOffensiveAIController(armyAttack10)

	return false		
	end

