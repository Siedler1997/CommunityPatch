setupArmyAI2 = function()

	ArmyAI2 				= {}

	ArmyAI2.player 			= 2
	ArmyAI2.id				= 1
	ArmyAI2.position		= GetPosition("AI2_ConcentratingArea")
	ArmyAI2.rodeLength		= 4200
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		ArmyAI2.strength	= 5
		ArmyAI2.spawnTypes 	= { { Entities.PU_LeaderPoleArm3, 8},
								{ Entities.PU_LeaderSword3, 8},
								{ Entities.PU_LeaderBow3, 8},
								{ Entities.PU_LeaderBow3, 8},
								{ Entities.PV_Cannon3, 0 } }
	else
		ArmyAI2.strength	= 8
		ArmyAI2.spawnTypes 	= { { Entities.PU_LeaderPoleArm4, 8},
								{ Entities.PU_LeaderPoleArm4, 8},
								{ Entities.PU_LeaderSword4, 8},
								{ Entities.PU_LeaderSword4, 8},
								{ Entities.PU_LeaderBow4, 8},
								{ Entities.PU_LeaderBow4, 8},
								{ Entities.PV_Cannon3, 0 },
								{ Entities.PV_Cannon3, 0 } }
	end

	ArmyAI2.spawnPos			= GetPosition("AI2_SpawnPos")
	ArmyAI2.spawnGenerator		= "HQ_AI2"
	ArmyAI2.respawnTime			= 60
	ArmyAI2.maxSpawnAmount		= 1
	ArmyAI2.endless				= true
	ArmyAI2.refresh				= false

	ArmyAI2.retreatStrength			= 2
	ArmyAI2.baseDefenseRange		= 2000
	ArmyAI2.outerDefenseRange		= 4200
	ArmyAI2.Attack					= false
	ArmyAI2.AttackAllowed			= false

	-- Setup army
	SetupArmy(ArmyAI2)
	
	-- Army generator
	SetupAITroopSpawnGenerator("AI2", ArmyAI2)

	-- Control army
	StartJob("ControlArmyAI2")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAI2 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyAI2",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAI2 = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAI2)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
