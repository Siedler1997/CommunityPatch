---------------------------------------------------------------------------------------------
-- Creates the armies for steppe robbery outposts
CreateArmiesBanditsDefense = function()
                                        	
	ArmyBanditsDefense 					= 	{}

	local i
	for i=1,3 do
		
		ArmyBanditsDefense[i] = {}
		
		ArmyBanditsDefense[i].player 			= 	2
		ArmyBanditsDefense[i].id				= 	0 + i
		ArmyBanditsDefense[i].strength			= 	6
		ArmyBanditsDefense[i].position			= 	GetPosition("P2_SpawnPoint_"..i)			-- in front of Bastilles
		ArmyBanditsDefense[i].rodeLength		= 	2000
		                                    	  	
		-- Spawn parameter                  	  	
		if CP_Difficulty == 0 then
			ArmyBanditsDefense[i].spawnTypes 		= 	{	{ Entities.PU_LeaderSword3, 4},
															{ Entities.PU_LeaderPoleArm3, 4},
															{ Entities.PU_LeaderBow3, 8},
															{ Entities.PU_LeaderBow3, 8},
															{ Entities.PV_Cannon3, 0} ,
															{ Entities.PV_Cannon3, 0} 
														}
			ArmyBanditsDefense[i].respawnTime		= 	60
			ArmyBanditsDefense[i].maxSpawnAmount	= 	1
		else
			ArmyBanditsDefense[i].strength			= 8
			ArmyBanditsDefense[i].spawnTypes 		= 	{	{ Entities.PU_LeaderSword3, 8},
															{ Entities.PU_LeaderSword3, 8},
															{ Entities.PU_LeaderPoleArm3, 8},
															{ Entities.PU_LeaderRifle1, 4},
															{ Entities.PU_LeaderBow3, 8},
															{ Entities.PU_LeaderBow3, 8},
															{ Entities.PV_Cannon3, 0} ,
															{ Entities.PV_Cannon3, 0} 
														}
			ArmyBanditsDefense[i].respawnTime		= 	45
			ArmyBanditsDefense[i].maxSpawnAmount	= 	2
		end

		ArmyBanditsDefense[i].endless			= 	true
		ArmyBanditsDefense[i].spawnPos			= 	GetPosition("P2_SpawnPoint_"..i)
		ArmyBanditsDefense[i].spawnGenerator	= 	"P2_RobberyTower_"..i
	                                              	
		ArmyBanditsDefense[i].retreatStrength	= 	0
		ArmyBanditsDefense[i].baseDefenseRange	= 	2000
		ArmyBanditsDefense[i].outerDefenseRange= 	2000
		ArmyBanditsDefense[i].Attack			= 	false
		ArmyBanditsDefense[i].AttackAllowed	= 	false
	
	
		-- Setup army
		SetupArmy(ArmyBanditsDefense[i])
		
		-- Army generator
		SetupAITroopSpawnGenerator("P2_SpawnPoint_"..i, ArmyBanditsDefense[i])
			
	end

	
	-- Control army
	StartJob("ControlArmyBanditsDefense")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyBanditsDefense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyBanditsDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyBanditsDefense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyBanditsDefense = function()
	-------------------------------------------------------------------------------------------------------------------
		local i     
		for i=1,3 do		
		
			TickOffensiveAIController(ArmyBanditsDefense[i])
		
		end
		
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
