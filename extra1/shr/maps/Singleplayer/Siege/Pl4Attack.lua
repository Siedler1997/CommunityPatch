createarmyAttack11 = function()

	armyAttack11					= {}

	armyAttack11.player 				= 4
	armyAttack11.id					= 1
	armyAttack11.strength				= 6
	armyAttack11.retreatStrength			= 1
	armyAttack11.position				= GetPosition("Pl4Attack1")
	armyAttack11.rodeLength				= 500
	armyAttack11.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderCavalry}

	armyAttack11.baseDefenseRange			= 2000
	armyAttack11.outerDefenseRange		        = 3000
	armyAttack11.AttackPos				= GetPosition("Pl4tg1")
	armyAttack11.AttackAllowed			= true

	armyAttack11.control				= {}
	armyAttack11.control.delay			= 60 * 13

	SetupArmy(armyAttack11)

	SetupAITroopGenerator("armyAttack11",armyAttack11)

	StartJob("ControlSpawnArmy11")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy11 = function()
		
	return Counter.Tick2("ControlSpawnArmy11",10)
	end


Action_ControlSpawnArmy11 = function()
	TickOffensiveAIController(armyAttack11)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack12 = function()

	armyAttack12					= {}

	armyAttack12.player 				= 4
	armyAttack12.id					= 2
	armyAttack12.strength				= 6
	armyAttack12.retreatStrength			= 1
	armyAttack12.position				= GetPosition("Pl4Attack2")
	armyAttack12.rodeLength				= 500
	armyAttack12.AllowedTypes 			= { UpgradeCategories.LeaderSword,
                                                            UpgradeCategories.LeaderPoleArm }

	armyAttack12.baseDefenseRange			= 2000
	armyAttack12.outerDefenseRange		        = 3000
	armyAttack12.AttackPos				= GetPosition("Pl4tg1")
	armyAttack12.AttackAllowed			= true

	armyAttack12.control				= {}
	armyAttack12.control.delay			= 60 * 9

	SetupArmy(armyAttack12)

	SetupAITroopGenerator("armyAttack12",armyAttack12)

	StartJob("ControlSpawnArmy12")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy12 = function()
		
	return Counter.Tick2("ControlSpawnArmy12",10)
	end


Action_ControlSpawnArmy12 = function()
	TickOffensiveAIController(armyAttack12)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack13 = function()

	armyAttack13					= {}

	armyAttack13.player 				= 4
	armyAttack13.id					= 3
	armyAttack13.strength				= 6
	armyAttack13.retreatStrength			= 1
	armyAttack13.position				= GetPosition("Pl4Attack3")
	armyAttack13.rodeLength				= 500
	armyAttack13.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle}

	armyAttack13.baseDefenseRange			= 2000
	armyAttack13.outerDefenseRange		        = 3000
	armyAttack13.AttackPos				= GetPosition("Pl4tg1")
	armyAttack13.AttackAllowed			= true

	armyAttack13.control				= {}
	armyAttack13.control.delay			= 60 * 10

	SetupArmy(armyAttack13)

	SetupAITroopGenerator("armyAttack13",armyAttack13)

	StartJob("ControlSpawnArmy13")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy13 = function()
		
	return Counter.Tick2("ControlSpawnArmy13",10)
	end


Action_ControlSpawnArmy13 = function()
	TickOffensiveAIController(armyAttack13)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack14 = function()

	armyAttack14					= {}

	armyAttack14.player 				= 4
	armyAttack14.id					= 4
	armyAttack14.strength				= 6
	armyAttack14.retreatStrength			= 1
	armyAttack14.position				= GetPosition("Pl4Attack4")
	armyAttack14.rodeLength				= 500
	armyAttack14.AllowedTypes 			= { Entities.PV_Cannon3 }

	armyAttack14.baseDefenseRange			= 2000
	armyAttack14.outerDefenseRange		        = 3000
	armyAttack14.AttackPos				= GetPosition("Pl4tg1")
	armyAttack14.AttackAllowed			= true

	armyAttack14.control				= {}
	armyAttack14.control.delay			= 60 * 11

	SetupArmy(armyAttack14)

	SetupAITroopGenerator("armyAttack14",armyAttack14)

	StartJob("ControlSpawnArmy14")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy14 = function()
		
	return Counter.Tick2("ControlSpawnArmy14",10)
	end


Action_ControlSpawnArmy14 = function()
	TickOffensiveAIController(armyAttack14)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack15 = function()

	armyAttack15					= {}

	armyAttack15.player 				= 4
	armyAttack15.id					= 5
	armyAttack15.strength				= 6
	armyAttack15.retreatStrength			= 1
	armyAttack15.position				= GetPosition("Pl4Attack5")
	armyAttack15.rodeLength				= 500
	armyAttack15.AllowedTypes 			= { Entities.PV_Cannon3 }

	armyAttack15.baseDefenseRange			= 2000
	armyAttack15.outerDefenseRange		        = 3000
	armyAttack15.AttackPos				= GetPosition("Pl4tg1")
	armyAttack15.AttackAllowed			= true

	armyAttack15.control				= {}
	armyAttack15.control.delay			= 60 * 14

	SetupArmy(armyAttack15)

	SetupAITroopGenerator("armyAttack15",armyAttack15)

	StartJob("ControlSpawnArmy15")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy15 = function()
		
	return Counter.Tick2("ControlSpawnArmy15",10)
	end


Action_ControlSpawnArmy15 = function()
	TickOffensiveAIController(armyAttack15)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack16 = function()

	armyAttack16					= {}

	armyAttack16.player 				= 4
	armyAttack16.id					= 6
	armyAttack16.strength				= 6
	armyAttack16.retreatStrength			= 1
	armyAttack16.position				= GetPosition("Pl4Attack6")
	armyAttack16.rodeLength				= 500
	armyAttack16.AllowedTypes 			= { UpgradeCategories.LeaderSword,
                                                            UpgradeCategories.LeaderPoleArm }

	armyAttack16.baseDefenseRange			= 2000
	armyAttack16.outerDefenseRange		        = 3000
	armyAttack16.AttackPos				= GetPosition("Pl4tg1")
	armyAttack16.AttackAllowed			= true

	armyAttack16.control				= {}
	armyAttack16.control.delay			= 60 * 10

	SetupArmy(armyAttack16)

	SetupAITroopGenerator("armyAttack16",armyAttack16)

	StartJob("ControlSpawnArmy16")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy16 = function()
		
	return Counter.Tick2("ControlSpawnArmy16",10)
	end


Action_ControlSpawnArmy16 = function()
	TickOffensiveAIController(armyAttack16)

	return false		
	end

