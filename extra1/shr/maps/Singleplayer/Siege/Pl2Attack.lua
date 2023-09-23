createarmyAttack1 = function()

	armyAttack1					= {}

	armyAttack1.player 				= 2
	armyAttack1.id					= 5
	armyAttack1.strength				= 5
	armyAttack1.retreatStrength			= 1
	armyAttack1.position				= GetPosition("Pl2Attack1")
	armyAttack1.rodeLength				= 500
	armyAttack1.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderCavalry}

	armyAttack1.baseDefenseRange			= 2000
	armyAttack1.outerDefenseRange		        = 3000
	armyAttack1.AttackPos				= GetPosition("Pl2tg2")
	armyAttack1.AttackAllowed			= true

	armyAttack1.control				= {}
	armyAttack1.control.delay			= 60 * 13

	SetupArmy(armyAttack1)

	SetupAITroopGenerator("armyAttack1",armyAttack1)

	StartJob("ControlSpawnArmy1")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy1 = function()
		
	return Counter.Tick2("ControlSpawnArmy1",10)
	end


Action_ControlSpawnArmy1 = function()
	TickOffensiveAIController(armyAttack1)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack2 = function()

	armyAttack2					= {}

	armyAttack2.player 				= 2
	armyAttack2.id					= 6
	armyAttack2.strength				= 5
	armyAttack2.retreatStrength			= 1
	armyAttack2.position				= GetPosition("Pl2Attack2")
	armyAttack2.rodeLength				= 500
	armyAttack2.AllowedTypes 			= { UpgradeCategories.LeaderSword,
                                                            UpgradeCategories.LeaderPoleArm }

	armyAttack2.baseDefenseRange			= 2000
	armyAttack2.outerDefenseRange		        = 3000
	armyAttack2.AttackPos				= GetPosition("Pl2tg2")
	armyAttack2.AttackAllowed			= true

	armyAttack2.control				= {}
	armyAttack2.control.delay			= 60 * 15

	SetupArmy(armyAttack2)

	SetupAITroopGenerator("armyAttack2",armyAttack2)

	StartJob("ControlSpawnArmy2")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy2 = function()
		
	return Counter.Tick2("ControlSpawnArmy2",10)
	end


Action_ControlSpawnArmy2 = function()
	TickOffensiveAIController(armyAttack2)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack3 = function()

	armyAttack3					= {}

	armyAttack3.player 				= 2
	armyAttack3.id					= 7
	armyAttack3.strength				= 5
	armyAttack3.retreatStrength			= 1
	armyAttack3.position				= GetPosition("Pl2Attack3")
	armyAttack3.rodeLength				= 500
	armyAttack3.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle}

	armyAttack3.baseDefenseRange			= 2000
	armyAttack3.outerDefenseRange		        = 3000
	armyAttack3.AttackPos				= GetPosition("Pl2tg1")
	armyAttack3.AttackAllowed			= true

	armyAttack3.control				= {}
	armyAttack3.control.delay			= 60 * 7

	SetupArmy(armyAttack3)

	SetupAITroopGenerator("armyAttack3",armyAttack3)

	StartJob("ControlSpawnArmy3")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy3 = function()
		
	return Counter.Tick2("ControlSpawnArmy3",10)
	end


Action_ControlSpawnArmy3 = function()
	TickOffensiveAIController(armyAttack3)

	return false		
	end

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

createarmyAttack4 = function()

	armyAttack4					= {}

	armyAttack4.player 				= 2
	armyAttack4.id					= 8
	armyAttack4.strength				= 5
	armyAttack4.retreatStrength			= 1
	armyAttack4.position				= GetPosition("Pl2Attack4")
	armyAttack4.rodeLength				= 500
	armyAttack4.AllowedTypes 			= { Entities.PV_Cannon2 }

	armyAttack4.baseDefenseRange			= 2000
	armyAttack4.outerDefenseRange		        = 3000
	armyAttack4.AttackPos				= GetPosition("Pl2tg1")
	armyAttack4.AttackAllowed			= true

	armyAttack4.control				= {}
	armyAttack4.control.delay			= 60 * 9

	SetupArmy(armyAttack4)

	SetupAITroopGenerator("armyAttack4",armyAttack4)

	StartJob("ControlSpawnArmy4")


end

-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmy4 = function()
		
	return Counter.Tick2("ControlSpawnArmy4",10)
	end


Action_ControlSpawnArmy4 = function()
	TickOffensiveAIController(armyAttack4)

	return false		
	end

