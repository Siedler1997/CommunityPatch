createArmyCoastBandits = function()
	ArmyCoastBanditsA					= {}

	ArmyCoastBanditsA.player 			= 	gvMission.PlayerIDCoastBandits
	ArmyCoastBanditsA.id				= 	1
	ArmyCoastBanditsA.position			= 	GetPosition("CoastBanditsCenter")
	ArmyCoastBanditsA.rodeLength			= 	2500

  ArmyCoastBanditsA.strength			= 	4	                                	
	ArmyCoastBanditsA.spawnTypes 		= 	{	 {Entities.CU_BanditLeaderSword2, 6}, 
												{Entities.CU_BanditLeaderBow2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6},
												{Entities.CU_BanditLeaderSword2, 6}, 
												{Entities.CU_BanditLeaderBow2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6}, 
												{Entities.CU_BanditLeaderBow2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6}, 
												{Entities.CU_BanditLeaderBow2, 6}, 
												 }
    
	ArmyCoastBanditsA.spawnPos          =   GetPosition("CoastBanditsSpawn")
  ArmyCoastBanditsA.respawnTime       =   90
  ArmyCoastBanditsA.maxSpawnAmount    =   2

	-- Attack parameter
	ArmyCoastBanditsA.retreatStrength	= 	0

	ArmyCoastBanditsA.baseDefenseRange	= 	2000
	ArmyCoastBanditsA.outerDefenseRange	= 	2500
                                    
                                    
  ArmyCoastBanditsA.refresh           = true
	ArmyCoastBanditsA.AttackAllowed		= 	false  	
	ArmyCoastBanditsA.pulse						= true
		-- Setup army
	SetupArmy(ArmyCoastBanditsA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyCoastBanditsASpawn", ArmyCoastBanditsA)
	
	-- Control army
	CoastBanditsControler = StartJob("ControlArmyCoastBanditsA")
		
	QuestCoastBanditsBastilleDestroyed = {}
	QuestCoastBanditsBastilleDestroyed.Targets = {"CoastBanditsHQ"}
																	
	QuestCoastBanditsBastilleDestroyed.Callback = ArmyCoastBanditsDestroyed
	SetupDestroy(QuestCoastBanditsBastilleDestroyed)
end


ArmyCoastBanditsDestroyed = function()
	DestroyAITroopGenerator(ArmyCoastBanditsA)
	Report("Bastille Destroyed")
	return 1
end
-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCoastBanditsA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyCoastBanditsA",8)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCoastBanditsA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyCoastBanditsA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------



	

	
