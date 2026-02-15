setupArmyAttackPlayerA = function()
	ArmyAttackPlayerA					= {}

	ArmyAttackPlayerA.player 			= 	8
	ArmyAttackPlayerA.id				= 	2
	ArmyAttackPlayerA.strength			=	4 + 2*CP_Difficulty
	ArmyAttackPlayerA.position			= 	GetPosition("KI3_DefensePos")
	ArmyAttackPlayerA.rodeLength		= 	5000
	
	if CP_Difficulty < 2 then                               	
		ArmyAttackPlayerA.spawnTypes 		= { { Entities.PU_LeaderPoleArm2, 4},
												{ Entities.PU_LeaderSword2, 4},
												{ Entities.PU_LeaderBow2, 4},
												{ Entities.CU_BlackKnight_LeaderMace1, 4},
												{ Entities.PV_Cannon2, 4},
												{ Entities.PU_LeaderPoleArm2, 4} }
	else
		ArmyAttackPlayerA.spawnTypes 		= { { Entities.PU_LeaderPoleArm3, 6},
												{ Entities.PU_LeaderSword3, 6},
												{ Entities.PU_LeaderSword3, 6},
												{ Entities.PU_LeaderBow3, 6},
												{ Entities.PU_LeaderBow3, 6},
												{ Entities.CU_BlackKnight_LeaderMace2, 6},
												{ Entities.PV_Cannon4a, 1},
												{ Entities.PU_LeaderPoleArm3, 6} }
	end
    
	ArmyAttackPlayerA.respawnTime       =   60*(20-5*CP_Difficulty)
	ArmyAttackPlayerA.spawnPos          =   GetPosition("KI3_SpawnPos")
	ArmyAttackPlayerA.retreatStrength	= 	1
	ArmyAttackPlayerA.baseDefenseRange	= 	2000
	ArmyAttackPlayerA.outerDefenseRange	= 	2000
	-- Attack parameter
                                      	
	ArmyAttackPlayerA.AttackPos			=	GetPosition("KI3_AttackPos")

    ArmyAttackPlayerA.refresh           = false

	ArmyAttackPlayerA.Attack			= false
	ArmyAttackPlayerA.AttackAllowed		= false
    
    ArmyAttackPlayerA.endless = true
	ArmyAttackPlayerA.experiencePoints	=	CP_Difficulty

	-- Setup army
	SetupArmy(ArmyAttackPlayerA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("KI3_HQ", ArmyAttackPlayerA)
	
	-- Control army
	PlayerAttackControler = StartJob("ControlArmyAttackPlayerA")
	
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttackPlayerA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyAttackPlayerA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttackPlayerA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAttackPlayerA)
		return false		
	end
------------

function MakeArmyAttackPlayerAggressive()
	--ArmyAttackPlayerA.Attack = true
	ArmyAttackPlayerA.AttackAllowed = true
end