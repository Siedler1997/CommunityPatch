setupArmyCenterOutpost = function()

	ArmyCenterOutpost		= {}

	ArmyCenterOutpost.player 			= 8
	ArmyCenterOutpost.id				= 1
	ArmyCenterOutpost.strength			= 4
	ArmyCenterOutpost.position			= GetPosition("KI2_SpawnPos")
	ArmyCenterOutpost.rodeLength		= 2500
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		ArmyCenterOutpost.spawnTypes 		= { { Entities.PU_LeaderCavalry2, 3},
													{ Entities.PU_LeaderHeavyCavalry2, 3},
													{ Entities.PU_LeaderBow3, 12},
													{ Entities.CU_BlackKnight_LeaderMace2, 12},
													{ Entities.PV_Cannon3a, 0} }
	else
		if CP_Difficulty == 1 then
			ArmyCenterOutpost.strength			= 6
		else
			ArmyCenterOutpost.strength			= 8
		end

		ArmyCenterOutpost.spawnTypes 		= { { Entities.PU_LeaderCavalry2, 3},
													{ Entities.PU_LeaderHeavyCavalry2, 3},
													{ Entities.PU_LeaderBow4, 12},
													{ Entities.PU_LeaderPoleArm4, 12},
													{ Entities.PU_LeaderSword4, 12},
													{ Entities.CU_BlackKnight_LeaderMace2, 12},
													{ Entities.PU_LeaderSword4, 12},
													{ Entities.PV_Cannon3a, 0} }
	end
	ArmyCenterOutpost.spawnPos			= GetPosition("KI2_SpawnPos")
	ArmyCenterOutpost.spawnGenerator	= "KI2_Outpost"
	ArmyCenterOutpost.respawnTime		= 120
	ArmyCenterOutpost.endless			= true

	-- Attack parameter
	ArmyCenterOutpost.retreatStrength	= 0

	ArmyCenterOutpost.baseDefenseRange	= 2000
	ArmyCenterOutpost.outerDefenseRange	= 4000

	ArmyCenterOutpost.Attack				= false
	ArmyCenterOutpost.AttackPos			= GetPosition("KI2_SpawnPos")
	ArmyCenterOutpost.AttackAllowed		= false
	ArmyCenterOutpost.experiencePoints	=	CP_Difficulty


	-- Setup army
	SetupArmy(ArmyCenterOutpost)
	
	-- Army generator
	SetupAITroopSpawnGenerator("CenterOutpost_Generator", ArmyCenterOutpost)
	
	-- Control army
	StartJob("ControlArmyCenterOutpost")
end

--[[
StartCenterOutpost_Attack = function()
	-- Begin attack
	--ArmyCenterOutpost.Attack = true
	ArmyCenterOutpost.AttackAllowed = true
end
--]]
-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyLeftFortress"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCenterOutpost = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyCenterOutpost",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCenterOutpost = function()
	-------------------------------------------------------------------------------------------------------------------
		local currentWeatherState = Logic.GetWeatherState()
		if currentWeatherState == 3 or buildUpDone == true then
			--ArmyCenterOutpost.Attack = true
			ArmyCenterOutpost.AttackAllowed = true
		else
			--ArmyCenterOutpost.Attack = false
			ArmyCenterOutpost.AttackAllowed = false
		end
		TickOffensiveAIController(ArmyCenterOutpost)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
