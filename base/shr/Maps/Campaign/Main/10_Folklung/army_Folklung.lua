createArmyFolklungA = function()
	ArmyFolklungA					= {}

	ArmyFolklungA.player 			= 	gvMission.PlayerIDFolklung
	ArmyFolklungA.id				= 	3
	ArmyFolklungA.strength			= 	7
	ArmyFolklungA.rodeLength			= 	8000
	                                	
	ArmyFolklungA.spawnTypes 		= 	{	 {Entities.PU_LeaderSword3, 8},
											 {Entities.PU_LeaderSword3, 8},
											 {Entities.PU_LeaderSword3, 8},
											 {Entities.PU_LeaderSword3, 8},
											 {Entities.PU_LeaderSword3, 8},
											 {Entities.PU_LeaderPoleArm3, 8},
											 {Entities.PU_LeaderBow3, 8}
										}

  ArmyFolklungA.endless = true
    
	-- Attack parameter
	ArmyFolklungA.retreatStrength	= 	1
	ArmyFolklungA.baseDefenseRange	= 	1000
	ArmyFolklungA.outerDefenseRange	= 	8000
	ArmyFolklungA.spawnPos          =   GetPosition("FolklungSpawn")
  ArmyFolklungA.respawnTime       =   20
  ArmyFolklungA.maxSpawnAmount    =   1

	if Logic.GetWeatherState() == 1 then
	    SetSummerFolklungA()
	    WeatherFolklungJob = StartJob("WinterFolklung")
	else
	    SetWinterFolklungA()
	    WeatherFolklungJob = StartJob("SummerFolklung")
	end
	-- Setup army
	SetupArmy(ArmyFolklungA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyFolklungASpawn", ArmyFolklungA)
	
	-- Control army
	StartJob("ControlArmyFolklungA")
end

ArmyFolklungASetDefensive = function()
	if WeatherFolklungJob ~= 0 then
		EndJob(WeatherFolklungJob)
		WeatherFolklungJob = 0
	end
	if ArmyFolklungA ~= nil then
		ArmyFolklungA.refresh           = false
		ArmyFolklungA.AttackAllowed		= 	true
		
		ArmyFolklungA.retreatStrength	= 	1
		ArmyFolklungA.baseDefenseRange	= 	1000
		ArmyFolklungA.outerDefenseRange	= 	8000
		ArmyFolklungA.position			= 	GetPosition("FolklungSpawn")
		ArmyFolklungA.strength			= 	6
		SetupArmy(ArmyFolklungA)
		Retreat(ArmyFolklungA)
	end
end

SetWinterFolklungA = function()
  ArmyFolklungA.position			= 	GetPosition("BattlepointB")
	ArmyFolklungA.baseDefenseRange	= 	3000
	ArmyFolklungA.outerDefenseRange	= 	5000
	Retreat(ArmyFolklungA)
end

SetSummerFolklungA = function()
  ArmyFolklungA.position			= 	GetPosition("FolklungSpawn")
	ArmyFolklungA.baseDefenseRange	= 	1000
	ArmyFolklungA.outerDefenseRange	= 	8000
	Retreat(ArmyFolklungA)
end



Condition_SummerFolklung = function()
	return Logic.GetWeatherState() == 1
end

Action_SummerFolklung = function()
    SetSummerFolklungA()
    Report("StartJob WinterFolklung")
    WeatherFolklungJob = StartJob("WinterFolklung")
	return 1
end



Condition_WinterFolklung = function()
	return Logic.GetWeatherState() == 3
end

Action_WinterFolklung = function()
    SetWinterFolklungA()
    Report("StartJob SummerFolklung")
    WeatherFolklungJob = StartJob("SummerFolklung")
	return 1
end



-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Condition_ControlArmyFolklungA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyFolklungA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyFolklungA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFolklungA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyFolklungA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
