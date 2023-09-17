createArmyRobbers = function()
	ArmyRobbersA					= {}

	ArmyRobbersA.player 			= 	gvMission.PlayerIDRuinRobbers
	ArmyRobbersA.id				= 	1
	ArmyRobbersA.position			= 	GetPosition("RobbersArmyA")
	ArmyRobbersA.rodeLength			= 	1000

  ArmyRobbersA.strength			= 	4	                                	
	ArmyRobbersA.spawnTypes 		= 	{	 {Entities.CU_BanditLeaderBow2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6},
												{Entities.CU_BanditLeaderSword2, 6}
												 }
    
	ArmyRobbersA.spawnPos          =   GetPosition("RobbersArmyASpawn")
  ArmyRobbersA.maxSpawnAmount    =   4
  ArmyRobbersA.pulse 						= true
  ArmyRobbersA.retreatStrength  = 0
  ArmyRobbersA.respawnTime				= 40

	-- Attack parameter
	
	ArmyRobbersA.baseDefenseRange	= 	1000
	ArmyRobbersA.outerDefenseRange	= 	1000
                                    
                                    
	ArmyRobbersA.AttackAllowed		= 	false  	
		
	ArmyRobbersB					= {}

	ArmyRobbersB.player 			= 	gvMission.PlayerIDRuinRobbers
	ArmyRobbersB.id						= 	2
	ArmyRobbersB.position			= 	GetPosition("RobbersArmyB")
	ArmyRobbersB.rodeLength		= 	1000

  ArmyRobbersB.strength			= 	3	                                	
	ArmyRobbersB.spawnTypes 		= 	{	 {Entities.CU_BanditLeaderBow2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6}, 
												{Entities.CU_BanditLeaderSword2, 6}
												 }
    
	ArmyRobbersB.spawnPos          =   GetPosition("RobbersArmyBSpawn")
  ArmyRobbersB.maxSpawnAmount    =   3
  ArmyRobbersB.pulse 						= true
  ArmyRobbersB.retreatStrength  = 0
  ArmyRobbersB.respawnTime				= 40

	-- Attack parameter
	
	ArmyRobbersB.baseDefenseRange	= 	1000
	ArmyRobbersB.outerDefenseRange	= 	1000
                                    
                                    
	ArmyRobbersB.AttackAllowed		= 	false  	
		
	RobbersAQuest = {}	
	RobbersAQuest.Heroes = true
	RobbersAQuest.Leaders = true
	RobbersAQuest.Serfs = true
 	RobbersAQuest.TargetName = "RobbersArmyA"
	RobbersAQuest.Distance = 1000
	RobbersAQuest.Callback = EnableArmyRobbersA
	
	SetupExpedition(RobbersAQuest)
	
	RobbersBQuest = {}	
	RobbersBQuest.Heroes 	= true
	RobbersBQuest.Leaders = true
	RobbersBQuest.Serfs 	= true
 	RobbersBQuest.TargetName = "RobbersArmyB"
	RobbersBQuest.Distance = 1000
	RobbersBQuest.Callback = EnableArmyRobbersB
	
	SetupExpedition(RobbersBQuest)
end

EnableArmyRobbersA = function()
	-- Setup army
	CreateEntity(gvMission.PlayerIDRuinRobbers, Entities.CU_LeaderOutlaw1, GetPosition("RobbersArmyASpawn"), "DummyEntity")
	SetupArmy(ArmyRobbersA)
	-- Army generator
	SetupAITroopSpawnGenerator("RobbersArmyASpawn", ArmyRobbersA)
	StartJob("ControlArmyRobbersA")
	DestroyEntity("DummyEntity")
	return 1
end


EnableArmyRobbersB = function()
	CreateEntity(gvMission.PlayerIDRuinRobbers, Entities.CU_LeaderOutlaw1, GetPosition("RobbersArmyBSpawn"), "DummyEntity")
	-- Setup army
	SetupArmy(ArmyRobbersB)
	-- Army generator
	SetupAITroopSpawnGenerator("RobbersArmyBSpawn", ArmyRobbersB)
	StartJob("ControlArmyRobbersB")
	DestroyEntity("DummyEntity")
	return 1
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRobbersA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyRobbersA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRobbersA = function()
	-------------------------------------------------------------------------------------------------------------------
		if IsDead(ArmyRobbersA) then
			RobbersAKilled = true
			return 1
		end
		TickOffensiveAIController(ArmyRobbersA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------

	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRobbersB = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyRobbersB",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRobbersB = function()
	-------------------------------------------------------------------------------------------------------------------
		if IsDead(ArmyRobbersB) then
			RobbersBKilled = true
			return 1
		end
		TickOffensiveAIController(ArmyRobbersB)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------




	

	
