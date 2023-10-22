setupArmyP7PlayerAttack = function()
	if IsExisting("SpawnGenerator") then
		ArmyP7PlayerAttack			=	{}

		-- Create robbers
		ArmyP7PlayerAttack.player 				= 	7
		ArmyP7PlayerAttack.id					= 	8
		ArmyP7PlayerAttack.strength				= 	3
		ArmyP7PlayerAttack.position				= 	GetPosition("P7DefendPos")
		ArmyP7PlayerAttack.rodeLength			= 	3000
	                                	
		-- Spawn parameter
		ArmyP7PlayerAttack.spawnTypes 		= 	{	{Entities.CU_BlackKnight_LeaderMace2, 8},
												{Entities.PU_LeaderPoleArm2, 4},
												{Entities.PU_LeaderBow2, 4} }
										
		ArmyP7PlayerAttack.spawnPos				= 	GetPosition("SpawnPos")
		ArmyP7PlayerAttack.spawnGenerator		= 	"SpawnGenerator"
		ArmyP7PlayerAttack.respawnTime			= 	300
		ArmyP7PlayerAttack.endless				= 	true
		ArmyP7PlayerAttack.refresh				= 	false
                                    	
		ArmyP7PlayerAttack.retreatStrength		= 	0
		ArmyP7PlayerAttack.baseDefenseRange		= 	1000
		ArmyP7PlayerAttack.outerDefenseRange	= 	2000
		ArmyP7PlayerAttack.Attack				= 	true
		ArmyP7PlayerAttack.AttackAllowed		= 	true
		ArmyP7PlayerAttack.AttackPos			=	GetPosition("LeoCheckpoint3")
		ArmyP7PlayerAttack.experiencePoints		=	CP_Difficulty

		-- Setup army
		SetupArmy(ArmyP7PlayerAttack)
	
		-- Army generator
		SetupAITroopSpawnGenerator("ArmyP7ArmyP7PlayerAttack", ArmyP7PlayerAttack)

		StartJob("ControlArmyP7PlayerAttack")
	end
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP7PlayerAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP7PlayerAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP7PlayerAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP7PlayerAttack = function()
	-------------------------------------------------------------------------------------------------------------------
	
		TickOffensiveAIController(ArmyP7PlayerAttack)
		
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
