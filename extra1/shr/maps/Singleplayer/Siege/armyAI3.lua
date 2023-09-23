setuparmyAI3 = function()

	armyAI3 				= {}

	armyAI3.player 			        = 3
	armyAI3.id				= 1
	armyAI3.strength		        = 8
	armyAI3.position		        = GetPosition("armyAI3")
	armyAI3.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI3.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI3.spawnPos			= GetPosition("armyAI3")
	armyAI3.spawnGenerator		        = "spawnAI3"
	armyAI3.respawnTime			= 60*60
	armyAI3.maxSpawnAmount		        = 1
	armyAI3.endless				= true
	armyAI3.refresh				= false

	armyAI3.retreatStrength			= 1
	armyAI3.baseDefenseRange		= 3000
	armyAI3.outerDefenseRange		= 4200
	armyAI3.Attack				= false
	armyAI3.AttackAllowed			= false
	armyAI3.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI3)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI3", armyAI3)

	-- Control army
	StartJob("ControlarmyAI3")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI3 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI3",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI3 = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI3)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI3nd = function()

	armyAI3nd 				= {}

	armyAI3nd.player 			= 3
	armyAI3nd.id				= 2
	armyAI3nd.strength		        = 8
	armyAI3nd.position		        = GetPosition("armyAI3nd")
	armyAI3nd.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI3nd.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI3nd.spawnPos			= GetPosition("armyAI3nd")
	armyAI3nd.spawnGenerator		= "spawnAI3nd"
	armyAI3nd.respawnTime			= 60*60
	armyAI3nd.maxSpawnAmount		= 1
	armyAI3nd.endless			= true
	armyAI3nd.refresh			= false

	armyAI3nd.retreatStrength		= 1
	armyAI3nd.baseDefenseRange		= 3000
	armyAI3nd.outerDefenseRange		= 4200
	armyAI3nd.Attack			= false
	armyAI3nd.AttackAllowed			= false
	armyAI3nd.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI3nd)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI3nd", armyAI3nd)

	-- Control army
	StartJob("ControlarmyAI3nd")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI3nd"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI3nd = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI3nd",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI3nd = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI3nd)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI3rd = function()

	armyAI3rd 				= {}

	armyAI3rd.player 			= 3
	armyAI3rd.id				= 3
	armyAI3rd.strength		        = 8
	armyAI3rd.position		        = GetPosition("armyAI3rd")
	armyAI3rd.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI3rd.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI3rd.spawnPos			= GetPosition("armyAI3rd")
	armyAI3rd.spawnGenerator		= "spawnAI3rd"
	armyAI3rd.respawnTime			= 60*60
	armyAI3rd.maxSpawnAmount		= 1
	armyAI3rd.endless			= true
	armyAI3rd.refresh			= false

	armyAI3rd.retreatStrength		= 1
	armyAI3rd.baseDefenseRange		= 3000
	armyAI3rd.outerDefenseRange		= 4200
	armyAI3rd.Attack			= false
	armyAI3rd.AttackAllowed			= false
	armyAI3rd.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI3rd)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI3rd", armyAI3rd)

	-- Control army
	StartJob("ControlarmyAI3rd")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI3rd"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI3rd = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI3rd",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI3rd = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI3rd)
		return false		
	end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI3th = function()

	armyAI3th 				= {}

	armyAI3th.player 			= 3
	armyAI3th.id				= 4
	armyAI3th.strength		        = 8
	armyAI3th.position		        = GetPosition("armyAI3th")
	armyAI3th.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI3th.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI3th.spawnPos			= GetPosition("armyAI3th")
	armyAI3th.spawnGenerator		= "spawnAI3th"
	armyAI3th.respawnTime			= 60*60
	armyAI3th.maxSpawnAmount		= 1
	armyAI3th.endless			= true
	armyAI3th.refresh			= false

	armyAI3th.retreatStrength		= 1
	armyAI3th.baseDefenseRange		= 3000
	armyAI3th.outerDefenseRange		= 4200
	armyAI3th.Attack			= false
	armyAI3th.AttackAllowed			= false
	armyAI3th.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI3th)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI3th", armyAI3th)

	-- Control army
	StartJob("ControlarmyAI3th")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI3th"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI3th = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI3th",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI3th = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI3th)
		return false		
	end


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


setuparmyAI3st = function()

	armyAI3st 				= {}

	armyAI3st.player 			= 3
	armyAI3st.id				= 5
	armyAI3st.strength		        = 8
	armyAI3st.position		        = GetPosition("armyAI3st")
	armyAI3st.rodeLength		        = 1000
	
	-- Spawn parameter
	armyAI3st.spawnTypes 			= { { Entities.PU_LeaderPoleArm3, 8},
						    { Entities.PU_LeaderSword3, 8},
						    { Entities.PU_LeaderBow3, 8},
						    { Entities.PU_LeaderRifle1, 8},
						    { Entities.PV_Cannon3,0} 
                                                                                     }
	armyAI3st.spawnPos			= GetPosition("armyAI3st")
	armyAI3st.spawnGenerator		= "player3"
	armyAI3st.respawnTime			= 60*60
	armyAI3st.maxSpawnAmount		= 1
	armyAI3st.endless			= true
	armyAI3st.refresh			= false

	armyAI3st.retreatStrength		= 1
	armyAI3st.baseDefenseRange		= 3000
	armyAI3st.outerDefenseRange		= 4200
	armyAI3st.Attack			= false
	armyAI3st.AttackAllowed			= false
	armyAI3st.experiencePoints		=	HIGH_EXPERIENCE

	-- Setup army
	SetupArmy(armyAI3st)
	
	-- Army generator
	SetupAITroopSpawnGenerator("armyAI3st", armyAI3st)

	-- Control army
	StartJob("ControlarmyAI3st")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyAI3st"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyAI3st = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyAI3st",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyAI3st = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyAI3st)
		return false		
	end