createArmySpawn = function()

	armySpawn1					= {}

	armySpawn1.player 				= 5
	armySpawn1.id					= 1
	armySpawn1.strength				= 8
	armySpawn1.retreatStrength			= 3
	armySpawn1.position				= GetPosition("spawn1")
	armySpawn1.rodeLength				= 10000
	armySpawn1.AllowedTypes 			= { UpgradeCategories.LeaderSword, 
							UpgradeCategories.LeaderPoleArm }

	armySpawn1.baseDefenseRange			= 20000
	armySpawn1.outerDefenseRange		        = 24000
	armySpawn1.AttackPos				= GetPosition("spawn1")
	armySpawn1.AttackAllowed			= true

	armySpawn1.control				= {}
	armySpawn1.control.delay			= 60 * 24

	SetupArmy(armySpawn1)

	SetupAITroopGenerator("armySpawn1",armySpawn1)



        armySpawn3					= {}

	armySpawn3.player 				= 3
	armySpawn3.id					= 2
	armySpawn3.strength				= 8
	armySpawn3.retreatStrength			= 3
	armySpawn3.position				= GetPosition("spawn3")
	armySpawn3.rodeLength				= 1000
	armySpawn3.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
							UpgradeCategories.LeaderSword,
							UpgradeCategories.LeaderBow }

	armySpawn3.baseDefenseRange			= 20000
	armySpawn3.outerDefenseRange		        = 24000
	armySpawn3.AttackPos				= GetPosition("spawn3")
	armySpawn3.AttackAllowed			= true

	armySpawn3.control				= {}
	armySpawn3.control.delay			= 60 * 18

	SetupArmy(armySpawn3)

	SetupAITroopGenerator("armySpawn3",armySpawn3)



	armySpawn2					= {}

	armySpawn2.player 				= 5
	armySpawn2.id					= 1
	armySpawn2.strength				= 8
	armySpawn2.retreatStrength			= 3
	armySpawn2.position				= GetPosition("spawn2")
	armySpawn2.rodeLength				= 1000
	armySpawn2.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry }

	armySpawn2.baseDefenseRange			= 2000
	armySpawn2.outerDefenseRange		        = 4000
	armySpawn2.AttackPos				= GetPosition("spawn2")
	armySpawn2.AttackAllowed			= true

	armySpawn2.control				= {}
	armySpawn2.control.delay			= 60 * 22

	SetupArmy(armySpawn2)

	SetupAITroopGenerator("armySpawn2",armySpawn2)


	StartJob("ControlSpawnArmies")	



        armySpawn4					= {}

	armySpawn4.player 				= 4
	armySpawn4.id					= 1
	armySpawn4.strength				= 8
	armySpawn4.retreatStrength			= 3
	armySpawn4.position				= GetPosition("spawn4")
	armySpawn4.rodeLength				= 1000
	armySpawn4.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry }

	armySpawn4.baseDefenseRange			= 20000
	armySpawn4.outerDefenseRange		        = 24000
	armySpawn4.AttackPos				= GetPosition("spawn4")
	armySpawn4.AttackAllowed			= true

	armySpawn4.control				= {}
	armySpawn4.control.delay			= 60 * 28

	SetupArmy(armySpawn4)

	SetupAITroopGenerator("armySpawn4",armySpawn4)



        armySpawn5					= {}

	armySpawn5.player 				= 3
	armySpawn5.id					= 1
	armySpawn5.strength				= 8
	armySpawn5.retreatStrength			= 3
	armySpawn5.position				= GetPosition("spawn5")
	armySpawn5.rodeLength				= 500
	armySpawn5.AllowedTypes 			= { UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle }

	armySpawn5.baseDefenseRange			= 1000
	armySpawn5.outerDefenseRange		        = 3000
	armySpawn5.AttackPos				= GetPosition("spawn5")
	armySpawn5.AttackAllowed			= true

	armySpawn5.control				= {}
	armySpawn5.control.delay			= 60 * 35

	SetupArmy(armySpawn5)

	SetupAITroopGenerator("armySpawn5",armySpawn5)



        armySpawn6					= {}

	armySpawn6.player 				= 2
	armySpawn6.id					= 6
	armySpawn6.strength				= 8
	armySpawn6.retreatStrength			= 3
	armySpawn6.position				= GetPosition("spawn6")
	armySpawn6.rodeLength				= 1000
	armySpawn6.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry }

	armySpawn6.baseDefenseRange			= 20000
	armySpawn6.outerDefenseRange		        = 24000
	armySpawn6.AttackPos				= GetPosition("spawn6")
	armySpawn6.AttackAllowed			= true

	armySpawn6.control				= {}
	armySpawn6.control.delay			= 60 * 28

	SetupArmy(armySpawn6)

	SetupAITroopGenerator("armySpawn6",armySpawn6)


        armySpawn7					= {}

	armySpawn7.player 				= 2
	armySpawn7.id					= 2
	armySpawn7.strength				= 8
	armySpawn7.retreatStrength			= 3
	armySpawn7.position				= GetPosition("spawn7")
	armySpawn7.rodeLength				= 4000
	armySpawn7.AllowedTypes 			= { UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle }

	armySpawn7.baseDefenseRange			= 20000
	armySpawn7.outerDefenseRange		        = 24000
	armySpawn7.AttackPos				= GetPosition("spawn7")
	armySpawn7.AttackAllowed			= true

	armySpawn7.control				= {}
	armySpawn7.control.delay			= 60 * 28

	SetupArmy(armySpawn7)

	SetupAITroopGenerator("armySpawn7",armySpawn7)


        armySpawn8					= {}

	armySpawn8.player 				= 2
	armySpawn8.id					= 3
	armySpawn8.strength				= 8
	armySpawn8.retreatStrength			= 3
	armySpawn8.position				= GetPosition("spawn8")
	armySpawn8.rodeLength				= 1000
	armySpawn8.AllowedTypes 			= { UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle }

	armySpawn8.baseDefenseRange			= 20000
	armySpawn8.outerDefenseRange		        = 24000
	armySpawn8.AttackPos				= GetPosition("spawn8")
	armySpawn8.AttackAllowed			= true

	armySpawn8.control				= {}
	armySpawn8.control.delay			= 60 * 28

	SetupArmy(armySpawn8)

	SetupAITroopGenerator("armySpawn8",armySpawn8)



        armySpawn9					= {}

	armySpawn9.player 				= 2
	armySpawn9.id					= 4
	armySpawn9.strength				= 8
	armySpawn9.retreatStrength			= 3
	armySpawn9.position				= GetPosition("spawn9")
	armySpawn9.rodeLength				= 1000
	armySpawn9.AllowedTypes 			= { UpgradeCategories.LeaderHeavyCavalry }

	armySpawn9.baseDefenseRange			= 20000
	armySpawn9.outerDefenseRange		        = 24000
	armySpawn9.AttackPos				= GetPosition("spawn9")
	armySpawn9.AttackAllowed			= true

	armySpawn9.control				= {}
	armySpawn9.control.delay			= 60 * 28

	SetupArmy(armySpawn9)

	SetupAITroopGenerator("armySpawn9",armySpawn9)



	armySpawn10					= {}

	armySpawn10.player 				= 2
	armySpawn10.id					= 5
	armySpawn10.strength				= 8
	armySpawn10.retreatStrength			= 3
	armySpawn10.position				= GetPosition("spawn10")
	armySpawn10.rodeLength				= 1000
	armySpawn10.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
							UpgradeCategories.LeaderSword }

	armySpawn10.baseDefenseRange			= 20000
	armySpawn10.outerDefenseRange		        = 24000
	armySpawn10.AttackPos				= GetPosition("spawn10")
	armySpawn10.AttackAllowed			= true

	armySpawn10.control				= {}
	armySpawn10.control.delay			= 60 * 28

	SetupArmy(armySpawn10)

	SetupAITroopGenerator("armySpawn10",armySpawn10)





	armySpawn11					= {}

	armySpawn11.player 				= 2
	armySpawn11.id					= 8
	armySpawn11.strength				= 8
	armySpawn11.retreatStrength			= 3
	armySpawn11.position				= GetPosition("spawn11")
	armySpawn11.rodeLength				= 500
	armySpawn11.AllowedTypes 			= { Entities.PV_Cannon3,
							    Entities.PV_Cannon3,
							    Entities.PV_Cannon4 }

	armySpawn11.baseDefenseRange			= 3000
	armySpawn11.outerDefenseRange		        = 5000
	armySpawn11.AttackPos				= GetPosition("spawn11")
	armySpawn11.AttackAllowed			= true

	armySpawn11.control				= {}
	armySpawn11.control.delay			= 60 * 28

	SetupArmy(armySpawn11)

	SetupAITroopGenerator("armySpawn11",armySpawn11)



	armySpawn12					= {}

	armySpawn12.player 				= 2
	armySpawn12.id					= 7
	armySpawn12.strength				= 8
	armySpawn12.retreatStrength			= 3
	armySpawn12.position				= GetPosition("spawn12")
	armySpawn12.rodeLength				= 500
	armySpawn12.AllowedTypes 			= { Entities.PV_Cannon3,
							    Entities.PV_Cannon3,
							    Entities.PV_Cannon4 }

	armySpawn12.baseDefenseRange			= 3000
	armySpawn12.outerDefenseRange		        = 5000
	armySpawn12.AttackPos				= GetPosition("spawn12")
	armySpawn12.AttackAllowed			= true

	armySpawn12.control				= {}
	armySpawn12.control.delay			= 60 * 28

	SetupArmy(armySpawn12)

	SetupAITroopGenerator("armySpawn12",armySpawn12)



	armySpawn13					= {}

	armySpawn13.player 				= 5
	armySpawn13.id					= 1
	armySpawn13.strength				= 8
	armySpawn13.retreatStrength			= 3
	armySpawn13.position				= GetPosition("spawn13")
	armySpawn13.rodeLength				= 1000
	armySpawn13.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle }

	armySpawn13.baseDefenseRange			= 20000
	armySpawn13.outerDefenseRange		        = 24000
	armySpawn13.AttackPos				= GetPosition("spawn13")
	armySpawn13.AttackAllowed			= true

	armySpawn13.control				= {}
	armySpawn13.control.delay			= 60 * 38

	SetupArmy(armySpawn13)

	SetupAITroopGenerator("armySpawn13",armySpawn13)



	armySpawn14					= {}

	armySpawn14.player 				= 2
	armySpawn14.id					= 1
	armySpawn14.strength				= 8
	armySpawn14.retreatStrength			= 3
	armySpawn14.position				= GetPosition("spawn14")
	armySpawn14.rodeLength				= 10000
	armySpawn14.AllowedTypes 			= { UpgradeCategories.LeaderSword, 
							    UpgradeCategories.LeaderPoleArm }

	armySpawn14.baseDefenseRange			= 20000
	armySpawn14.outerDefenseRange		        = 24000
	armySpawn14.AttackPos				= GetPosition("spawn14")
	armySpawn14.AttackAllowed			= true

	armySpawn14.control				= {}
	armySpawn14.control.delay			= 60 * 28

	SetupArmy(armySpawn14)

	SetupAITroopGenerator("armySpawn14",armySpawn14)





	armySpawn15					= {}

	armySpawn15.player 				= 4
	armySpawn15.id					= 8
	armySpawn15.strength				= 8
	armySpawn15.retreatStrength			= 3
	armySpawn15.position				= GetPosition("spawn15")
	armySpawn15.rodeLength				= 1000
	armySpawn15.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
							    UpgradeCategories.LeaderSword }

	armySpawn15.baseDefenseRange			= 5000
	armySpawn15.outerDefenseRange		        = 6000
	armySpawn15.AttackPos				= GetPosition("spawn15")
	armySpawn15.AttackAllowed			= true

	armySpawn15.control				= {}
	armySpawn15.control.delay			= 60 * 38

	SetupArmy(armySpawn15)

	SetupAITroopGenerator("armySpawn15",armySpawn15)





	armySpawn16					= {}

	armySpawn16.player 				= 4
	armySpawn16.id					= 7
	armySpawn16.strength				= 8
	armySpawn16.retreatStrength			= 3
	armySpawn16.position				= GetPosition("spawn16")
	armySpawn16.rodeLength				= 1000
	armySpawn16.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle }

	armySpawn16.baseDefenseRange			= 5000
	armySpawn16.outerDefenseRange		        = 6000
	armySpawn16.AttackPos				= GetPosition("spawn16")
	armySpawn16.AttackAllowed			= true

	armySpawn16.control				= {}
	armySpawn16.control.delay			= 60 * 15

	SetupArmy(armySpawn16)

	SetupAITroopGenerator("armySpawn16",armySpawn16)






	armySpawn17					= {}

	armySpawn17.player 				= 4
	armySpawn17.id					= 6
	armySpawn17.strength				= 8
	armySpawn17.retreatStrength			= 3
	armySpawn17.position				= GetPosition("spawn17")
	armySpawn17.rodeLength				= 500
	armySpawn17.AllowedTypes 			= { Entities.PV_Cannon1,
							    Entities.PV_Cannon2,
							    Entities.PV_Cannon3,
							    Entities.PV_Cannon4 }

	armySpawn17.baseDefenseRange			= 4000
	armySpawn17.outerDefenseRange		        = 6000
	armySpawn17.AttackPos				= GetPosition("spawn17")
	armySpawn17.AttackAllowed			= true

	armySpawn17.control				= {}
	armySpawn17.control.delay			= 60 * 28

	SetupArmy(armySpawn17)

	SetupAITroopGenerator("armySpawn17",armySpawn17)




	armySpawn18					= {}

	armySpawn18.player 				= 4
	armySpawn18.id					= 5
	armySpawn18.strength				= 8
	armySpawn18.retreatStrength			= 3
	armySpawn18.position				= GetPosition("spawn18")
	armySpawn18.rodeLength				= 1000
	armySpawn18.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, 
							    UpgradeCategories.LeaderSword }

	armySpawn18.baseDefenseRange			= 5000
	armySpawn18.outerDefenseRange		        = 6000
	armySpawn18.AttackPos				= GetPosition("spawn18")
	armySpawn18.AttackAllowed			= true

	armySpawn18.control				= {}
	armySpawn18.control.delay			= 60 * 38

	SetupArmy(armySpawn18)

	SetupAITroopGenerator("armySpawn18",armySpawn18)




	armySpawn19					= {}

	armySpawn19.player 				= 4
	armySpawn19.id					= 4
	armySpawn19.strength				= 8
	armySpawn19.retreatStrength			= 3
	armySpawn19.position				= GetPosition("spawn19")
	armySpawn19.rodeLength				= 1000
	armySpawn19.AllowedTypes 			= { UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderRifle }

	armySpawn19.baseDefenseRange			= 5000
	armySpawn19.outerDefenseRange		        = 6000
	armySpawn19.AttackPos				= GetPosition("spawn19")
	armySpawn19.AttackAllowed			= true

	armySpawn19.control				= {}
	armySpawn19.control.delay			= 60 * 15

	SetupArmy(armySpawn19)

	SetupAITroopGenerator("armySpawn19",armySpawn19)




	end


	
-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmies = function()
	if armySpawn1.control.delay > 0 then
		armySpawn1.control.delay = armySpawn1.control.delay - 1
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
        TickOffensiveAIController(armySpawn8)
        TickOffensiveAIController(armySpawn9)
        TickOffensiveAIController(armySpawn10)
        TickOffensiveAIController(armySpawn11)
        TickOffensiveAIController(armySpawn12)
        TickOffensiveAIController(armySpawn13)
        TickOffensiveAIController(armySpawn14)
        TickOffensiveAIController(armySpawn15)
        TickOffensiveAIController(armySpawn16)
        TickOffensiveAIController(armySpawn17)
        TickOffensiveAIController(armySpawn18)
        TickOffensiveAIController(armySpawn19)


	return false		
	end
