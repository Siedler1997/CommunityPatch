createArmySpawn = function()

	armySpawn1					= {}

	armySpawn1.player 				= 3
	armySpawn1.id					= 1
	armySpawn1.strength				= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position				= GetPosition("spawn1")
	armySpawn1.rodeLength				= 500
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderSword, 
							UpgradeCategories.LeaderPoleArm }

	armySpawn1.baseDefenseRange			= 3000
	armySpawn1.outerDefenseRange		        = 10000
	armySpawn1.AttackPos				= GetPosition("spawn1")
	armySpawn1.AttackAllowed			= true

	armySpawn1.control				= {}
	armySpawn1.control.delay			= 60 * 13

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("armySpawn1",armySpawn1)

	StartJob("ControlSpawnArmies")



---------------------------------------------------------------------------------------------------



	armySpawn2					= {}

	armySpawn2.player 				= 4
	armySpawn2.id					= 1
	armySpawn2.strength				= 8
	armySpawn2.retreatStrength			= 3
	armySpawn2.position				= GetPosition("spawn2")
	armySpawn2.rodeLength				= 500
	armySpawn2.AllowedTypes 			= { UpgradeCategories.LeaderSword, 
							UpgradeCategories.LeaderPoleArm }

	armySpawn2.baseDefenseRange			= 3000
	armySpawn2.outerDefenseRange		        = 10000
	armySpawn2.AttackPos				= GetPosition("spawn2")
	armySpawn2.AttackAllowed			= true

	armySpawn2.control				= {}
	armySpawn2.control.delay			= 60 * 15

	SetupArmy(armySpawn2)

	SetupAITroopGenerator("armySpawn2",armySpawn2)





---------------------------------------------------------------------------------------------------


	


        armySpawn3					= {}

	armySpawn3.player 				= 3
	armySpawn3.id					= 2
	armySpawn3.strength				= 8
	armySpawn3.retreatStrength			= 3
	armySpawn3.position				= GetPosition("spawn3")
	armySpawn3.rodeLength				= 500
	armySpawn3.AllowedTypes 			= { UpgradeCategories.LeaderBow }

	armySpawn3.baseDefenseRange			= 3000
	armySpawn3.outerDefenseRange		        = 10000
	armySpawn3.AttackPos				= GetPosition("spawn3")
	armySpawn3.AttackAllowed			= true

	armySpawn3.control				= {}
	armySpawn3.control.delay			= 60 * 17

	SetupArmy(armySpawn3)

	SetupAITroopGenerator("armySpawn3",armySpawn3)




---------------------------------------------------------------------------------------------------



        armySpawn4					= {}

	armySpawn4.player 				= 4
	armySpawn4.id					= 2
	armySpawn4.strength				= 8
	armySpawn4.retreatStrength			= 3
	armySpawn4.position				= GetPosition("spawn4")
	armySpawn4.rodeLength				= 500
	armySpawn4.AllowedTypes 			= { UpgradeCategories.LeaderBow }

	armySpawn4.baseDefenseRange			= 3000
	armySpawn4.outerDefenseRange		        = 10000
	armySpawn4.AttackPos				= GetPosition("spawn4")
	armySpawn4.AttackAllowed			= true

	armySpawn4.control				= {}
	armySpawn4.control.delay			= 60 * 15

	SetupArmy(armySpawn4)

	SetupAITroopGenerator("armySpawn4",armySpawn4)


---------------------------------------------------------------------------------------------------



        armySpawn5					= {}

	armySpawn5.player 				= 2
	armySpawn5.id					= 1
	armySpawn5.strength				= 8
	armySpawn5.retreatStrength			= 3
	armySpawn5.position				= GetPosition("spawn5")
	armySpawn5.rodeLength				= 500
	armySpawn5.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderCavalry}

	armySpawn5.baseDefenseRange			= 20000
	armySpawn5.outerDefenseRange		        = 240000
	armySpawn5.AttackPos				= GetPosition("spawn5")
	armySpawn5.AttackAllowed			= true

	armySpawn5.control				= {}
	armySpawn5.control.delay			= 60 * 10

	SetupArmy(armySpawn5)

	SetupAITroopGenerator("armySpawn5",armySpawn5)


---------------------------------------------------------------------------------------------------



        armySpawn6					= {}

	armySpawn6.player 				= 2
	armySpawn6.id					= 2
	armySpawn6.strength				= 8
	armySpawn6.retreatStrength			= 3
	armySpawn6.position				= GetPosition("spawn6")
	armySpawn6.rodeLength				= 1000
	armySpawn6.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle }

	armySpawn6.baseDefenseRange			= 20000
	armySpawn6.outerDefenseRange		        = 24000
	armySpawn6.AttackPos				= GetPosition("spawn6")
	armySpawn6.AttackAllowed			= true

	armySpawn6.control				= {}
	armySpawn6.control.delay			= 60 * 10

	SetupArmy(armySpawn6)

	SetupAITroopGenerator("armySpawn6",armySpawn6)


---------------------------------------------------------------------------------------------------


        armySpawn7					= {}

	armySpawn7.player 				= 5
	armySpawn7.id					= 1
	armySpawn7.strength				= 12
	armySpawn7.retreatStrength			= 3
	armySpawn7.position				= GetPosition("spawn7")
	armySpawn7.rodeLength				= 1000
	armySpawn7.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle }

	armySpawn7.baseDefenseRange			= 10000
	armySpawn7.outerDefenseRange		        = 14000
	armySpawn7.AttackPos				= GetPosition("spawn7")
	armySpawn7.AttackAllowed			= true

	armySpawn7.control				= {}
	armySpawn7.control.delay			= 60 * 10

	SetupArmy(armySpawn7)

	SetupAITroopGenerator("armySpawn7",armySpawn7)


---------------------------------------------------------------------------------------------------



        armySpawn8					= {}

	armySpawn8.player 				= 5
	armySpawn8.id					= 2
	armySpawn8.strength				= 12
	armySpawn8.retreatStrength			= 3
	armySpawn8.position				= GetPosition("spawn8")
	armySpawn8.rodeLength				= 1000
	armySpawn8.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
							UpgradeCategories.LeaderSword }

	armySpawn8.baseDefenseRange			= 10000
	armySpawn8.outerDefenseRange		        = 14000
	armySpawn8.AttackPos				= GetPosition("spawn8")
	armySpawn8.AttackAllowed			= true

	armySpawn8.control				= {}
	armySpawn8.control.delay			= 60 * 10

	SetupArmy(armySpawn8)

	SetupAITroopGenerator("armySpawn8",armySpawn8)



---------------------------------------------------------------------------------------------------



        armySpawn9					= {}

	armySpawn9.player 				= 5
	armySpawn9.id					= 3
	armySpawn9.strength				= 12
	armySpawn9.retreatStrength			= 3
	armySpawn9.position				= GetPosition("spawn9")
	armySpawn9.rodeLength				= 1000
	armySpawn9.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderCavalry }

	armySpawn9.baseDefenseRange			= 10000
	armySpawn9.outerDefenseRange		        = 14000
	armySpawn9.AttackPos				= GetPosition("spawn9")
	armySpawn9.AttackAllowed			= true

	armySpawn9.control				= {}
	armySpawn9.control.delay			= 60 * 10

	SetupArmy(armySpawn9)

	SetupAITroopGenerator("armySpawn9",armySpawn9)



---------------------------------------------------------------------------------------------------



	armySpawn10					= {}

	armySpawn10.player 				= 5
	armySpawn10.id					= 4
	armySpawn10.strength				= 12
	armySpawn10.retreatStrength			= 3
	armySpawn10.position				= GetPosition("spawn10")
	armySpawn10.rodeLength				= 1000
	armySpawn10.AllowedTypes 			= { Entities.PV_Cannon3 }

	armySpawn10.baseDefenseRange			= 10000
	armySpawn10.outerDefenseRange		        = 14000
	armySpawn10.AttackPos				= GetPosition("spawn10")
	armySpawn10.AttackAllowed			= true

	armySpawn10.control				= {}
	armySpawn10.control.delay			= 60 * 10

	SetupArmy(armySpawn10)

	SetupAITroopGenerator("armySpawn10",armySpawn10)


---------------------------------------------------------------------------------------------------




	armySpawn11					= {}

	armySpawn11.player 				= 6
	armySpawn11.id					= 1
	armySpawn11.strength				= 12
	armySpawn11.retreatStrength			= 3
	armySpawn11.position				= GetPosition("spawn11")
	armySpawn11.rodeLength				= 1000
	armySpawn11.AllowedTypes 			= { Entities.PV_Cannon4 }

	armySpawn11.baseDefenseRange			= 10000
	armySpawn11.outerDefenseRange		        = 14000
	armySpawn11.AttackPos				= GetPosition("spawn11")
	armySpawn11.AttackAllowed			= true

	armySpawn11.control				= {}
	armySpawn11.control.delay			= 60 * 10

	SetupArmy(armySpawn11)

	SetupAITroopGenerator("armySpawn11",armySpawn11)



---------------------------------------------------------------------------------------------------



	armySpawn12					= {}

	armySpawn12.player 				= 6
	armySpawn12.id					= 2
	armySpawn12.strength				= 12
	armySpawn12.retreatStrength			= 3
	armySpawn12.position				= GetPosition("spawn12")
	armySpawn12.rodeLength				= 1000
	armySpawn12.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle }

	armySpawn12.baseDefenseRange			= 10000
	armySpawn12.outerDefenseRange		        = 14000
	armySpawn12.AttackPos				= GetPosition("spawn12")
	armySpawn12.AttackAllowed			= true

	armySpawn12.control				= {}
	armySpawn12.control.delay			= 60 * 10

	SetupArmy(armySpawn12)

	SetupAITroopGenerator("armySpawn12",armySpawn12)


---------------------------------------------------------------------------------------------------



	armySpawn13					= {}

	armySpawn13.player 				= 6
	armySpawn13.id					= 3
	armySpawn13.strength				= 12
	armySpawn13.retreatStrength			= 3
	armySpawn13.position				= GetPosition("spawn13")
	armySpawn13.rodeLength				= 1000
	armySpawn13.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderCavalry }

	armySpawn13.baseDefenseRange			= 10000
	armySpawn13.outerDefenseRange		        = 14000
	armySpawn13.AttackPos				= GetPosition("spawn13")
	armySpawn13.AttackAllowed			= true

	armySpawn13.control				= {}
	armySpawn13.control.delay			= 60 * 10

	SetupArmy(armySpawn13)

	SetupAITroopGenerator("armySpawn13",armySpawn13)


---------------------------------------------------------------------------------------------------



	armySpawn14					= {}

	armySpawn14.player 				= 6
	armySpawn14.id					= 4
	armySpawn14.strength				= 12
	armySpawn14.retreatStrength			= 3
	armySpawn14.position				= GetPosition("spawn14")
	armySpawn14.rodeLength				= 1000
	armySpawn14.AllowedTypes 			= { UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderPoleArm }

	armySpawn14.baseDefenseRange			= 10000
	armySpawn14.outerDefenseRange		        = 14000
	armySpawn14.AttackPos				= GetPosition("spawn14")
	armySpawn14.AttackAllowed			= true

	armySpawn14.control				= {}
	armySpawn14.control.delay			= 60 * 10

	SetupArmy(armySpawn14)

	SetupAITroopGenerator("armySpawn14",armySpawn14)




	end


-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmies = function()
	if armySpawn1.control.delay > 0 then
		armySpawn1.control.delay = armySpawn1.control.delay - 1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies",1)
	end


Action_ControlSpawnArmies = function()
	TickOffensiveAIController(armySpawn1)
	TickOffensiveAIController(armySpawn2)
        TickOffensiveAIController(armySpawn3)
        TickOffensiveAIController(armySpawn4)
        TickOffensiveAIController(armySpawn5)
        TickOffensiveAIController(armySpawn6)
        TickOffensiveAIController(armySpawn7)
        TickOffensiveAIController(armySpawn8)
        TickOffensiveAIController(armySpawn9)
        TickOffensiveAIController(armySpawn10)
        TickOffensiveAIController(armySpawn11)
        TickOffensiveAIController(armySpawn12)
        TickOffensiveAIController(armySpawn13)
        TickOffensiveAIController(armySpawn14)




	return false		
	end
