setuppl6army = function()

	pl6army 				= {}

	pl6army.player 			        = 6
	pl6army.id				= 1
	pl6army.strength		        = 5
	pl6army.position		        = GetPosition("pl6army")
	pl6army.rodeLength		        = 500
	
	-- Spawn parameter
	pl6army.spawnTypes 			= { { Entities.PU_LeaderPoleArm1, 4},
						    { Entities.PU_LeaderSword1, 4},
						    { Entities.PU_LeaderBow1, 4} }
	pl6army.spawnPos			= GetPosition("pl6army")
	pl6army.spawnGenerator		        = "Hqpl6"
	pl6army.respawnTime			= 60*4
	pl6army.maxSpawnAmount		        = 1
	pl6army.endless				= true
	pl6army.refresh				= false

	pl6army.retreatStrength			= 2
	pl6army.baseDefenseRange		= 2000
	pl6army.outerDefenseRange		= 3200
	pl6army.Attack				= false
	pl6army.AttackAllowed			= false
	pl6army.experiencePoints			= MEDIUM_EXPERIENCE

	-- Setup army
	SetupArmy(pl6army)
	
	-- Army generator
	SetupAITroopSpawnGenerator("pl6army", pl6army)

	-- Control army
	StartJob("Controlpl6army")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Controlpl6army"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Controlpl6army = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("Controlpl6army",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_Controlpl6army = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(pl6army)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------