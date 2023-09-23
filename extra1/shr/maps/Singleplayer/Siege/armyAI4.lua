setuparmyAI4 = function()

	armyAI4 				= {}

	armyAI4.player 			        = 4
	armyAI4.id				= 1
	armyAI4.strength		        = 7
	armyAI4.position		        = GetPosition("armyAI4")
	armyAI4.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI4.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI4.spawnPos			= GetPosition("armyAI4")
	armyAI4.spawnGenerator		        = "spawnAI4"
	armyAI4.respawnTime			= 60*60
	armyAI4.maxSpawnAmount		        = 1
	armyAI4.endless				= true
	armyAI4.refresh				= false

	armyAI4.retreatStrength			= 1
	armyAI4.baseDefenseRange		= 3000
	armyAI4.outerDefenseRange		= 4200
	armyAI4.Attack				= false
	armyAI4.AttackAllowed			= false
	armyAI4.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI4)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI4", armyAI4)

	-- Control army
	StartJob("ControlarmyAI4")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI4"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI4 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI4",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI4 = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI4)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI4nd = function()

	armyAI4nd 				= {}

	armyAI4nd.player 			= 4
	armyAI4nd.id				= 2
	armyAI4nd.strength		        = 7
	armyAI4nd.position		        = GetPosition("armyAI4nd")
	armyAI4nd.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI4nd.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI4nd.spawnPos			= GetPosition("armyAI4nd")
	armyAI4nd.spawnGenerator		= "spawnAI4nd"
	armyAI4nd.respawnTime			= 60*60
	armyAI4nd.maxSpawnAmount		= 1
	armyAI4nd.endless			= true
	armyAI4nd.refresh			= false

	armyAI4nd.retreatStrength		= 1
	armyAI4nd.baseDefenseRange		= 3000
	armyAI4nd.outerDefenseRange		= 4200
	armyAI4nd.Attack			= false
	armyAI4nd.AttackAllowed			= false
	armyAI4nd.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI4nd)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI4nd", armyAI4nd)

	-- Control army
	StartJob("ControlarmyAI4nd")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI4nd"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI4nd = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI4nd",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI4nd = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI4nd)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI4rd = function()

	armyAI4rd 				= {}

	armyAI4rd.player 			= 4
	armyAI4rd.id				= 3
	armyAI4rd.strength		        = 7
	armyAI4rd.position		        = GetPosition("armyAI4rd")
	armyAI4rd.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI4rd.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI4rd.spawnPos			= GetPosition("armyAI4rd")
	armyAI4rd.spawnGenerator		= "spawnAI4rd"
	armyAI4rd.respawnTime			= 60*60
	armyAI4rd.maxSpawnAmount		= 1
	armyAI4rd.endless			= true
	armyAI4rd.refresh			= false

	armyAI4rd.retreatStrength		= 1
	armyAI4rd.baseDefenseRange		= 3000
	armyAI4rd.outerDefenseRange		= 4200
	armyAI4rd.Attack			= false
	armyAI4rd.AttackAllowed			= false
	armyAI4rd.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI4rd)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI4rd", armyAI4rd)

	-- Control army
	StartJob("ControlarmyAI4rd")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI4rd"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI4rd = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI4rd",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI4rd = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI4rd)
		return false		
	end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI4th = function()

	armyAI4th 				= {}

	armyAI4th.player 			= 4
	armyAI4th.id				= 4
	armyAI4th.strength		        = 7
	armyAI4th.position		        = GetPosition("armyAI4th")
	armyAI4th.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI4th.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI4th.spawnPos			= GetPosition("armyAI4th")
	armyAI4th.spawnGenerator		= "spawnAI4th"
	armyAI4th.respawnTime			= 60*60
	armyAI4th.maxSpawnAmount		= 1
	armyAI4th.endless			= true
	armyAI4th.refresh			= false

	armyAI4th.retreatStrength		= 1
	armyAI4th.baseDefenseRange		= 3000
	armyAI4th.outerDefenseRange		= 4200
	armyAI4th.Attack			= false
	armyAI4th.AttackAllowed			= false
	armyAI4th.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI4th)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI4th", armyAI4th)

	-- Control army
	StartJob("ControlarmyAI4th")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI4th"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI4th = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI4th",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI4th = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI4th)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI4st = function()

	armyAI4st 				= {}

	armyAI4st.player 			= 4
	armyAI4st.id				= 5
	armyAI4st.strength		        = 7
	armyAI4st.position		        = GetPosition("armyAI4st")
	armyAI4st.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI4st.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI4st.spawnPos			= GetPosition("armyAI4st")
	armyAI4st.spawnGenerator		= "player4"
	armyAI4st.respawnTime			= 60*60
	armyAI4st.maxSpawnAmount		= 1
	armyAI4st.endless			= true
	armyAI4st.refresh			= false

	armyAI4st.retreatStrength		= 1
	armyAI4st.baseDefenseRange		= 3000
	armyAI4st.outerDefenseRange		= 4200
	armyAI4st.Attack			= false
	armyAI4st.AttackAllowed			= false
	armyAI4st.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI4st)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI4st", armyAI4st)

	-- Control army
	StartJob("ControlarmyAI4st")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI4st"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI4st = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI4st",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI4st = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI4st)
		return false		
	end