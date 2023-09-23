setuparmyAI2 = function()

	armyAI2 				= {}

	armyAI2.player 			        = 2
	armyAI2.id				= 1
	armyAI2.strength		        = 6
	armyAI2.position		        = GetPosition("armyAI2")
	armyAI2.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI2.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI2.spawnPos			= GetPosition("armyAI2")
	armyAI2.spawnGenerator		        = "spawnAI2"
	armyAI2.respawnTime			= 60*60
	armyAI2.maxSpawnAmount		        = 1
	armyAI2.endless				= true
	armyAI2.refresh				= false

	armyAI2.retreatStrength			= 1
	armyAI2.baseDefenseRange		= 3000
	armyAI2.outerDefenseRange		= 4200
	armyAI2.Attack				= false
	armyAI2.AttackAllowed			= false
	armyAI2.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI2)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI2", armyAI2)

	-- Control army
	StartJob("ControlarmyAI2")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI2 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI2",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI2 = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI2)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI2nd = function()

	armyAI2nd 				= {}

	armyAI2nd.player 			= 2
	armyAI2nd.id				= 2
	armyAI2nd.strength		        = 6
	armyAI2nd.position		        = GetPosition("armyAI2nd")
	armyAI2nd.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI2nd.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI2nd.spawnPos			= GetPosition("armyAI2nd")
	armyAI2nd.spawnGenerator		= "spawnAI2nd"
	armyAI2nd.respawnTime			= 60*60
	armyAI2nd.maxSpawnAmount		= 1
	armyAI2nd.endless			= true
	armyAI2nd.refresh			= false

	armyAI2nd.retreatStrength		= 1
	armyAI2nd.baseDefenseRange		= 3000
	armyAI2nd.outerDefenseRange		= 4200
	armyAI2nd.Attack			= false
	armyAI2nd.AttackAllowed			= false
	armyAI2nd.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI2nd)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI2nd", armyAI2nd)

	-- Control army
	StartJob("ControlarmyAI2nd")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI2nd"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI2nd = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI2nd",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI2nd = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI2nd)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI2st = function()

	armyAI2st 				= {}

	armyAI2st.player 			= 2
	armyAI2st.id				= 3
	armyAI2st.strength		        = 6
	armyAI2st.position		        = GetPosition("armyAI2st")
	armyAI2st.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI2st.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI2st.spawnPos			= GetPosition("armyAI2st")
	armyAI2st.spawnGenerator		= "player2"
	armyAI2st.respawnTime			= 60*60
	armyAI2st.maxSpawnAmount		= 1
	armyAI2st.endless			= true
	armyAI2st.refresh			= false

	armyAI2st.retreatStrength		= 1
	armyAI2st.baseDefenseRange		= 3000
	armyAI2st.outerDefenseRange		= 4200
	armyAI2st.Attack			= false
	armyAI2st.AttackAllowed			= false
	armyAI2st.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI2st)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI2st", armyAI2st)

	-- Control army
	StartJob("ControlarmyAI2st")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI2st"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI2st = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI2st",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI2st = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI2st)
		return false		
	end

