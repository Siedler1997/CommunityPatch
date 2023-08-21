createArmyDefend = function()
	local strength = 4 + CP_Difficulty*2
	local cannontype = Entities.PV_Cannon1
	if CP_Difficulty > 0 then	
		cannontype = Entities.PV_Cannon3
	end
	armyDef1					= {}

	armyDef1.player 				= 2
	armyDef1.id						= 0
	armyDef1.strength				= strength
	armyDef1.retreatStrength			= 2
	armyDef1.position				= GetPosition("adef_1")
	armyDef1.rodeLength				= 1000
	armyDef1.AllowedTypes 				= { 
											UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle,
											cannontype
										}

	armyDef1.baseDefenseRange		= 3000
	armyDef1.outerDefenseRange		= 2000
	armyDef1.AttackPos				= GetPosition("adef_1")
	armyDef1.AttackAllowed			= false

	armyDef1.control			= {}
	armyDef1.control.delay			= 20 * 15

	SetupArmy(armyDef1)

	SetupAITroopGenerator("adef_1",armyDef1)





	armyDef2					= {}

	armyDef2.player 				= 2
	armyDef2.id						= 1
	armyDef2.strength				= strength
	armyDef2.retreatStrength		= 2
	armyDef2.position				= GetPosition("adef_2")
	armyDef2.rodeLength				= 1000
	armyDef2.AllowedTypes 				= { 
											UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle,
											cannontype				
										}

	armyDef2.baseDefenseRange		= 3000
	armyDef2.outerDefenseRange		= 2000
	armyDef2.AttackPos				= GetPosition("adef_2")
	armyDef2.AttackAllowed			= false

	armyDef2.control			= {}
	armyDef2.control.delay			= 20 * 15

	SetupArmy(armyDef2)

	SetupAITroopGenerator("adef_2",armyDef2)



	armyDef3					= {}

	armyDef3.player 				= 2
	armyDef3.id						= 2
	armyDef3.strength				= strength
	armyDef3.retreatStrength		= 2
	armyDef3.position				= GetPosition("adef_3")
	armyDef3.rodeLength				= 1000
	armyDef3.AllowedTypes 				= { 
											UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderRifle,
											cannontype								
										}

	armyDef3.baseDefenseRange		= 3000
	armyDef3.outerDefenseRange		= 2000
	armyDef3.AttackPos				= GetPosition("adef_3")
	armyDef3.AttackAllowed			= false

	armyDef3.control			= {}
	armyDef3.control.delay			= 20 * 15

	SetupArmy(armyDef3)

	SetupAITroopGenerator("adef_3",armyDef3)

	
	
	
	
	armyDef4					= {}

	armyDef4.player 				= 2
	armyDef4.id						= 3
	armyDef4.strength				= strength
	armyDef4.retreatStrength		= 2
	armyDef4.position				= GetPosition("adef_4")
	armyDef4.rodeLength				= 1000
	armyDef4.AllowedTypes 				= { 
											UpgradeCategories.LeaderHeavyCavalry,	
											UpgradeCategories.LeaderCavalry	
										}

	armyDef4.baseDefenseRange		= 3000
	armyDef4.outerDefenseRange		= 2000
	armyDef4.AttackPos				= GetPosition("adef_4")
	armyDef4.AttackAllowed			= false

	armyDef4.control			= {}
	armyDef4.control.delay			= 20 * 15

	SetupArmy(armyDef4)

	SetupAITroopGenerator("adef_4",armyDef4)




	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
--	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)

	if CP_Difficulty > 0 then	
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)
		for i = 1, 3 do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
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
	TickOffensiveAIController(armyDef4)
	return false		
end