createArmyFortress = function()

	ArmyFortressMainDefense					= {}
	ArmyFortressMainDefense.player 			= 	gvMission.PlayerIDFortress
	ArmyFortressMainDefense.id				= 	1
	ArmyFortressMainDefense.position			= 	GetPosition("FortressMainDefense")
	ArmyFortressMainDefense.rodeLength			= 	6000
  ArmyFortressMainDefense.strength			= 	4	                                	
	ArmyFortressMainDefense.spawnTypes 		= 	{	 {Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.PU_LeaderRifle1, 4}
												 }
  ArmyFortressMainDefense.spawnPos          =   GetPosition("FortressMainDefenseSpawn")
  ArmyFortressMainDefense.respawnTime       =   60
  ArmyFortressMainDefense.maxSpawnAmount    =   2
  ArmyFortressMainDefense.pulse 						= true
	-- Attack parameter
	ArmyFortressMainDefense.retreatStrength	= 	0
	ArmyFortressMainDefense.baseDefenseRange	= 	4000
	ArmyFortressMainDefense.outerDefenseRange	= 	5500
  ArmyFortressMainDefense.refresh           = true
	ArmyFortressMainDefense.AttackAllowed		= 	false  	


	ArmyFortressLeftDefense					= {}
	ArmyFortressLeftDefense.player 			= 	gvMission.PlayerIDFortress
	ArmyFortressLeftDefense.id				= 	2
	ArmyFortressLeftDefense.position			= 	GetPosition("FortressLeftDefense")
	ArmyFortressLeftDefense.rodeLength			= 	6000
  ArmyFortressLeftDefense.strength			= 	4	                                	
	ArmyFortressLeftDefense.spawnTypes 		= 	{	 {Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.PU_LeaderRifle1, 4}
												 }
	ArmyFortressLeftDefense.spawnPos          =   GetPosition("FortressMainDefenseSpawn")
  ArmyFortressLeftDefense.respawnTime       =   70
  ArmyFortressLeftDefense.maxSpawnAmount    =   2
  ArmyFortressLeftDefense.pulse 						= true
	-- Attack parameter
	ArmyFortressLeftDefense.retreatStrength	= 	0
	ArmyFortressLeftDefense.baseDefenseRange	= 	3500
	ArmyFortressLeftDefense.outerDefenseRange	= 	4200
  ArmyFortressLeftDefense.refresh           = true
	ArmyFortressLeftDefense.AttackAllowed		= 	false  	



	ArmyFortressRightDefense					= {}
	ArmyFortressRightDefense.player 			= 	gvMission.PlayerIDFortress
	ArmyFortressRightDefense.id				= 	3
	ArmyFortressRightDefense.position			= 	GetPosition("FortressRightDefense")
	ArmyFortressRightDefense.rodeLength			= 	6000
  ArmyFortressRightDefense.strength			= 	6	                                	
	ArmyFortressRightDefense.spawnTypes 		= 	{	 {Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.CU_BlackKnight_LeaderMace2, 8}, 
												{Entities.PU_LeaderBow3, 8},
												{Entities.PV_Cannon3, 0},
												{Entities.PU_LeaderRifle1, 4}
												 }
	ArmyFortressRightDefense.spawnPos          =   GetPosition("FortressMainDefenseSpawn")
  ArmyFortressRightDefense.respawnTime       =   75
  ArmyFortressRightDefense.maxSpawnAmount    =   2
  ArmyFortressRightDefense.pulse 						= true
	-- Attack parameter
	ArmyFortressRightDefense.retreatStrength	= 	0
	ArmyFortressRightDefense.baseDefenseRange	= 	4000
	ArmyFortressRightDefense.outerDefenseRange	= 	5000
  ArmyFortressRightDefense.refresh           = true
	ArmyFortressRightDefense.AttackAllowed		= 	false  	



	-- Setup armies
	SetupArmy(ArmyFortressMainDefense)
	SetupArmy(ArmyFortressLeftDefense)
	SetupArmy(ArmyFortressRightDefense)
	
	
	-- Control armies
	StartJob("ControlArmyFortressMainDefense")
	StartJob("ControlArmyFortressLeftDefense")
	StartJob("ControlArmyFortressRightDefense")	

	EnableTroopGenerators()

	QuestMainEnemyDestroyed = {}
	QuestMainEnemyDestroyed.Targets = {"KerberosHQ"}
																	
	QuestMainEnemyDestroyed.Callback = MainEnemyDestroyed
	SetupDestroy(QuestMainEnemyDestroyed)
end


MainEnemyDestroyed = function()
	DestroyAITroopGenerator(ArmyFortressMainDefense)
	DestroyAITroopGenerator(ArmyFortressLeftDefense)
	DestroyAITroopGenerator(ArmyFortressRightDefense)
	Report("Maries' castle is kaputt.... Ohhhh....")
	return 1
end


-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyFortressMainDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyFortressMainDefense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFortressMainDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyFortressMainDefense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------

	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyFortressLeftDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyFortressLeftDefense",9)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFortressLeftDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyFortressLeftDefense)
		return false		
	end
	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyFortressRightDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyFortressRightDefense",11)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFortressRightDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyFortressRightDefense)
		return false		
	end



GiveTimeToNextWinter = function()
	if Logic.GetWeatherState() == 3 then
		StartJob("SummerMary")
	else
		StartJob("WinterMary")
	end
end



Condition_SummerMary = function()
	return Logic.GetWeatherState() == 1
end

Action_SummerMary = function()
  StartJob("WinterMary")
	return 1
end


Condition_WinterMary = function()
	return Logic.GetWeatherState() == 3
end

Action_WinterMary = function()
  Report("Wintereinbruch - Böse Sache das... ;-)")
  Logic.SetDiplomacyState(gvMission.PlayerID, gvMission.PlayerIDFortress, Diplomacy.Hostile)
	return 1
end


EnableTroopGenerators = function()
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyFortressMainDefenseSpawn", ArmyFortressMainDefense)
	SetupAITroopSpawnGenerator("ArmyFortressLeftDefenseSpawn", ArmyFortressLeftDefense)
	SetupAITroopSpawnGenerator("ArmyFortressRightDefenseSpawn", ArmyFortressRightDefense)
end

	
