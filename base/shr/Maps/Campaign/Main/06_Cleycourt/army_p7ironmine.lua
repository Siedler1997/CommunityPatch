setupArmyP7IronMine = function()

	ArmyP7IronMine			=	{}

	-- Create robbers
	ArmyP7IronMine.player 				= 	7
	ArmyP7IronMine.id					= 	9
	ArmyP7IronMine.strength				= 	3
	ArmyP7IronMine.position				= 	GetPosition("P7DefendPos")
	ArmyP7IronMine.rodeLength			= 	3000
	ArmyP7IronMine.respawnTime			=	180 - 30*CP_Difficulty
	                                	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		ArmyP7IronMine.spawnTypes 		= 	{	{Entities.CU_BlackKnight_LeaderMace1, 4},
												{Entities.PU_LeaderPoleArm1, 4},
												{Entities.PU_LeaderBow1, 4} }
		ArmyP7IronMine.maxSpawnAmount	= 	1
	elseif CP_Difficulty == 0 then
		ArmyP7IronMine.spawnTypes 		= 	{	{Entities.CU_BlackKnight_LeaderMace1, 4},
												{Entities.PU_LeaderPoleArm2, 4},
												{Entities.PU_LeaderBow2, 4} }
		ArmyP7IronMine.maxSpawnAmount	= 	1
	else
		ArmyP7IronMine.spawnTypes 		= 	{	{Entities.CU_BlackKnight_LeaderMace2, 8},
												{Entities.PU_LeaderPoleArm2a, 8},
												{Entities.PU_LeaderBow2a, 8} }
		ArmyP7IronMine.maxSpawnAmount	= 	2
	end
										
	ArmyP7IronMine.spawnPos				= 	GetPosition("SpawnPos")
	ArmyP7IronMine.spawnGenerator		= 	"SpawnGenerator"
	ArmyP7IronMine.endless				= 	true
	ArmyP7IronMine.refresh				= 	false
                                    	
	ArmyP7IronMine.retreatStrength		= 	0
	ArmyP7IronMine.baseDefenseRange		= 	1000
	ArmyP7IronMine.outerDefenseRange	= 	2000
	ArmyP7IronMine.Attack				= 	false
	ArmyP7IronMine.AttackAllowed		= 	false
	ArmyP7IronMine.experiencePoints		=	CP_Difficulty

	-- Setup army
	SetupArmy(ArmyP7IronMine)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyP7IronMine", ArmyP7IronMine)

	StartJob("ControlArmyP7IronMine")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP7IronMine"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP7IronMine = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP7IronMine",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP7IronMine = function()
	-------------------------------------------------------------------------------------------------------------------
	
		TickOffensiveAIController(ArmyP7IronMine)
		
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
