createArmyDefend = function()

	armyDef1					= {}

	armyDef1.player 				= 3
	armyDef1.id					= 0
	armyDef1.strength				= 6
	armyDef1.retreatStrength			= 2
	armyDef1.position				= GetPosition("adef_1")
	armyDef1.rodeLength				= 1000
	armyDef1.AllowedTypes 				= { UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
										UpgradeCategories.LeaderBow,
									--	Entities.PV_Cannon2
												
										}


	armyDef1.baseDefenseRange		= 3000
	armyDef1.outerDefenseRange		= 2000
	armyDef1.AttackPos			= GetPosition("adef_1")
	armyDef1.AttackAllowed			= false

	armyDef1.control			= {}
	armyDef1.control.delay			= 10 * 15

	SetupArmy(armyDef1)

	SetupAITroopGenerator("adef_1",armyDef1)





	armyDef2					= {}

	armyDef2.player 				= 3
	armyDef2.id					= 1
	armyDef2.strength				= 6
	armyDef2.retreatStrength			= 2
	armyDef2.position				= GetPosition("adef_2")
	armyDef2.rodeLength				= 1000
	armyDef2.AllowedTypes 				= { --UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
									--	UpgradeCategories.LeaderBow,
										UpgradeCategories.LeaderRifle
												
										}


	armyDef2.baseDefenseRange		= 3000
	armyDef2.outerDefenseRange		= 2000
	armyDef2.AttackPos			= GetPosition("adef_2")
	armyDef2.AttackAllowed			= false

	armyDef2.control			= {}
	armyDef2.control.delay			= 10 * 15

	SetupArmy(armyDef2)

	SetupAITroopGenerator("adef_2",armyDef2)



	armyDef3					= {}

	armyDef3.player 				= 3
	armyDef3.id					= 2
	armyDef3.strength				= 6
	armyDef3.retreatStrength			= 2
	armyDef3.position				= GetPosition("adef_3")
	armyDef3.rodeLength				= 1000
	armyDef3.AllowedTypes 				= {
										Entities.PV_Cannon3,
										Entities.PV_Cannon4
												
										}

	if CP_Difficulty == 0 then
		table.insert(armyDef3.AllowedTypes, Entities.PV_Cannon2)
	end

	armyDef3.baseDefenseRange		= 3000
	armyDef3.outerDefenseRange		= 2000
	armyDef3.AttackPos			= GetPosition("adef_3")
	armyDef3.AttackAllowed			= false

	armyDef3.control			= {}
	armyDef3.control.delay			= 10 * 15

	SetupArmy(armyDef3)

	SetupAITroopGenerator("adef_3",armyDef3)


	for i=1,2,1 do

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 3)

	end

	if CP_Difficulty > 0 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 3)
		for i = 1, 3 do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
		end
	end

	StartJob("ControlSpawnArmies")	

	end

	
-----------------------------------------------------------------------------------------------------------------------
Condition_ControlSpawnArmies = function()
	if armyDef1.control.delay > 0 then
		armyDef1.control.delay = armyDef1.control.delay -1
		return false
		end		
	return Counter.Tick2("ControlSpawnArmies",20)
	end
Action_ControlSpawnArmies = function()

	TickOffensiveAIController(armyDef1)
	TickOffensiveAIController(armyDef2)
	TickOffensiveAIController(armyDef3)


	return false		
	end
