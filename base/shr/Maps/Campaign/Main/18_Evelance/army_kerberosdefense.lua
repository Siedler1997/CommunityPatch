-- At Castle area SW of Kerberos' castle

setupArmyKerberosDefense = function()
                                        	
	ArmyKerberosDefense 					= 	{}
                                        	  	
	ArmyKerberosDefense.player 				= 	5
	ArmyKerberosDefense.id					= 	3
	ArmyKerberosDefense.strength			= 	8
	ArmyKerberosDefense.position			= 	GetPosition("KerberosDefenseSpawnPos")		-- in front of Outpost Castle
	ArmyKerberosDefense.rodeLength			= 	13000
	                                    	  	
	-- Spawn parameter    
	if CP_Difficulty == 0 then              	  	
		ArmyKerberosDefense.spawnTypes 			= 	{ 	{ Entities.CU_BlackKnight_LeaderMace2, 12},
														{ Entities.CU_BlackKnight_LeaderMace2, 12},
														{ Entities.CU_Barbarian_LeaderClub2, 12},
														{ Entities.PU_LeaderBow4, 	 8},
														{ Entities.PU_LeaderBow4, 	 8},
														{ Entities.PV_Cannon4, 0},
														{ Entities.PV_Cannon4, 0},
														{ Entities.PV_Cannon4, 0}, 
													}
	else
		ArmyKerberosDefense.spawnTypes 			= 	{ 	{ Entities.PU_LeaderSword4, 12},
														{ Entities.PU_LeaderSword4, 12},
														{ Entities.PU_LeaderPoleArm4, 12},
														{ Entities.PU_LeaderBow4, 	 8},
														{ Entities.PU_LeaderBow4, 	 8},
														{ Entities.PV_Cannon4, 0},
														{ Entities.PV_Cannon4, 0},
														{ Entities.PV_Cannon4, 0}, 
													}
	end
													
	ArmyKerberosDefense.spawnPos			= 	GetPosition("KerberosDefenseSpawnPos")
	ArmyKerberosDefense.spawnGenerator		= 	"KerberosDefenseOP"
	ArmyKerberosDefense.respawnTime			= 	30
	ArmyKerberosDefense.maxSpawnAmount		= 	1
	ArmyKerberosDefense.endless				= 	true
                                              	
	ArmyKerberosDefense.retreatStrength		= 	0
	ArmyKerberosDefense.baseDefenseRange	= 	1800			--10000
	ArmyKerberosDefense.outerDefenseRange	= 	13100			--10000
	ArmyKerberosDefense.Attack				= 	false
	ArmyKerberosDefense.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyKerberosDefense)
	
	-- Army generator
	SetupAITroopSpawnGenerator("KerberosDefense_Generator", ArmyKerberosDefense)

	local i
	for i=1,4 do
		
		ArmyKerberosDefense[i] = {}
		
		ArmyKerberosDefense[i].player 			= 	5
		ArmyKerberosDefense[i].id				= 	3 + i
		ArmyKerberosDefense[i].strength			= 	5
		ArmyKerberosDefense[i].position			= 	GetPosition("P5DefenseSpawnPos"..i)			-- in front of Bastilles
		ArmyKerberosDefense[i].rodeLength		= 	2000
		                                    	  	
		-- Spawn parameter                  	  	
		if CP_Difficulty == 0 then
			ArmyKerberosDefense[i].spawnTypes 		= 	{	{ Entities.PU_LeaderBow3, 8},
															{ Entities.CU_BlackKnight_LeaderMace2, 8},
															{ Entities.CU_Barbarian_LeaderClub2, 8},
															{ Entities.PV_Cannon3, 0},
															{ Entities.PV_Cannon3, 0}
														}
		else
			ArmyKerberosDefense[i].strength			= 8
			ArmyKerberosDefense[i].spawnTypes 		= 	{	{ Entities.PU_LeaderBow4, 8},
															{ Entities.PU_LeaderBow4, 8},
															{ Entities.PU_LeaderSword4, 8},
															{ Entities.PU_LeaderSword4, 8},
															{ Entities.PU_LeaderPoleArm4, 8},
															{ Entities.PU_LeaderPoleArm4, 8},
															{ Entities.PV_Cannon3, 0},
															{ Entities.PV_Cannon3, 0}
														}
		end
														
		ArmyKerberosDefense[i].spawnPos			= 	GetPosition("P5DefenseSpawnPos"..i)
		ArmyKerberosDefense[i].spawnGenerator	= 	"P5DefenseGenerator"..i
		ArmyKerberosDefense[i].respawnTime		= 	60
		ArmyKerberosDefense[i].maxSpawnAmount	= 	1
		ArmyKerberosDefense[i].endless			= 	true
	                                              	
		ArmyKerberosDefense[i].retreatStrength	= 	0
		ArmyKerberosDefense[i].baseDefenseRange	= 	2000
		ArmyKerberosDefense[i].outerDefenseRange= 	2000
		ArmyKerberosDefense[i].Attack			= 	false
		ArmyKerberosDefense[i].AttackAllowed	= 	false
	
	
		-- Setup army
		SetupArmy(ArmyKerberosDefense[i])
		
		-- Army generator
		SetupAITroopSpawnGenerator("P5DefenseGenerator"..i, ArmyKerberosDefense[i])
			
	end

	
	-- Control army
	StartJob("ControlArmyKerberosDefense")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyKerberosDefense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyKerberosDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyKerberosDefense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyKerberosDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyKerberosDefense)

		local i     
		for i=1,4 do		
		
			TickOffensiveAIController(ArmyKerberosDefense[i])
		
		end
		
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
