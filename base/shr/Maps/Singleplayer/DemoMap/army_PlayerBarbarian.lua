createArmyBarbarianHorde = function()
	ArmyBarbarianHordeA					= {}

	ArmyBarbarianHordeA.player 			= 	gvMission.PlayerIDBarbarian
	ArmyBarbarianHordeA.id				= 	1
	ArmyBarbarianHordeA.position			= 	GetPosition("BarbarianHordeSpawn")
	ArmyBarbarianHordeA.rodeLength			= 	6000

  ArmyBarbarianHordeA.strength			= 	6	                                	
	ArmyBarbarianHordeA.spawnTypes 		= 	{	 {Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.PU_LeaderBow2, 4}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.PU_LeaderBow2, 4}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.CU_Barbarian_LeaderClub2, 6}, 
												{Entities.PU_LeaderBow2, 4}
												 }
    
	ArmyBarbarianHordeA.spawnPos          =   GetPosition("BarbarianHordeSpawn")
  ArmyBarbarianHordeA.respawnTime       =   60
  ArmyBarbarianHordeA.maxSpawnAmount    =   3
  ArmyBarbarianHordeA.pulse 						= true

	-- Attack parameter
	ArmyBarbarianHordeA.retreatStrength	= 	0

	ArmyBarbarianHordeA.baseDefenseRange	= 	3500
	ArmyBarbarianHordeA.outerDefenseRange	= 	6000
                                    
                                    
  ArmyBarbarianHordeA.refresh           = true
	ArmyBarbarianHordeA.AttackAllowed		= 	false  	
		-- Setup army
	SetupArmy(ArmyBarbarianHordeA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyBarbarianHordeASpawn", ArmyBarbarianHordeA)
	
	-- Control army
	StartJob("ControlArmyBarbarianHordeA")
		
	QuestBarbarianBastilleDestroyed = {}
	QuestBarbarianBastilleDestroyed.Targets = {"BarbarianHordeHQ"}
																	
	QuestBarbarianBastilleDestroyed.Callback = ArmyBarbarianHordeDestroyed
	SetupDestroy(QuestBarbarianBastilleDestroyed)
end


ArmyBarbarianHordeDestroyed = function()
	DestroyAITroopGenerator(ArmyBarbarianHordeA)
	Report("Bastille Destroyed!!!")
	return 1
end
-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyBarbarianHordeA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyBarbarianHordeA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyBarbarianHordeA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyBarbarianHordeA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------



	

	
