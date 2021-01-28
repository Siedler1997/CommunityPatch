-- At Castle area SW of Kerberos' castle

setupArmyKerberosDefense = function()
                                        	
	ArmyKerberosDefense 					= 	{}

	local i
	for i=1,4 do
		
		ArmyKerberosDefense[i] = {}
		
		ArmyKerberosDefense[i].player 			= 	7
		ArmyKerberosDefense[i].id				= 	5 + i
		ArmyKerberosDefense[i].strength			= 	6
		ArmyKerberosDefense[i].position			= 	GetPosition("tower_spawn"..i)			-- in front of Bastilles
		ArmyKerberosDefense[i].rodeLength		= 	2000
		                                    	  	
		-- Spawn parameter                  	  	
		if CP_Difficulty == 0 then
			ArmyKerberosDefense[i].spawnTypes 		= 	{	{ Entities.CU_BlackKnight_LeaderMace2, 8},
															{ Entities.CU_BlackKnight_LeaderMace2, 8},
															{ Entities.CU_BlackKnight_LeaderMace2, 8},
															{ Entities.CU_Barbarian_LeaderClub2, 8},
															{ Entities.PU_LeaderBow4, 8},
															{ Entities.PV_Cannon1, 0} 
														}
		else
			ArmyKerberosDefense[i].strength			= 8
			ArmyKerberosDefense[i].spawnTypes 		= 	{	{ Entities.PU_LeaderSword4, 8},
															{ Entities.PU_LeaderSword4, 8},
															{ Entities.PU_LeaderPoleArm4, 8},
															{ Entities.PU_LeaderPoleArm4, 8},
															{ Entities.PU_LeaderBow4, 8},
															{ Entities.PU_LeaderBow4, 8},
															{ Entities.PV_Cannon3, 0} ,
															{ Entities.PV_Cannon3, 0} 
														}
		end
														
		ArmyKerberosDefense[i].spawnPos			= 	GetPosition("tower_spawn"..i)
		ArmyKerberosDefense[i].spawnGenerator	= 	"big_tower"..i
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
		local i     
		for i=1,4 do		
		
			TickOffensiveAIController(ArmyKerberosDefense[i])
		
		end
		
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
