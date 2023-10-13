createArmyDefendBase = function()
	ArmyDefendBase =  {}
	ArmyDefendBase.player 			= 	gvMission.PlayerIDBesieger
	ArmyDefendBase.id				= 	5
	ArmyDefendBase.strength			= 	8
	ArmyDefendBase.rodeLength			= 	5000
	                                	
	ArmyDefendBase.spawnTypes 		= 	{	{Entities.PU_LeaderBow2, 4},
											{Entities.PU_LeaderBow2, 4} }

	if CP_Difficulty == 0 then
		table.insert(ArmyDefendBase.spawnTypes, {Entities.CU_Barbarian_LeaderClub1, 4})
		table.insert(ArmyDefendBase.spawnTypes, {Entities.CU_Barbarian_LeaderClub1, 4})
	else
		table.insert(ArmyDefendBase.spawnTypes, {Entities.CU_Barbarian_LeaderClub2, 8})
		table.insert(ArmyDefendBase.spawnTypes, {Entities.CU_Barbarian_LeaderClub2, 8})
		table.insert(ArmyDefendBase.spawnTypes, {Entities.PV_Cannon1, 4})
	end

  ArmyDefendBase.endless = true
    
	-- Attack parameter
	ArmyDefendBase.retreatStrength	= 	1
	ArmyDefendBase.baseDefenseRange	= 	1000
	ArmyDefendBase.outerDefenseRange	= 	5000
	ArmyDefendBase.spawnPos          =   GetPosition("BesiegerASpawn")
  ArmyDefendBase.respawnTime       =   100
  ArmyDefendBase.maxSpawnAmount    =   8
	ArmyDefendBase.experiencePoints	=	CP_Difficulty

	ArmyDefendBase.position			= 	GetPosition("P5TerritoryCenter")
	-- Setup army
	SetupArmy(ArmyDefendBase)
	
	-- Army generator
	SetupAITroopSpawnGenerator("BesiegerASpawn", ArmyDefendBase)
	
	-- Control army
	DefendBaseControl = StartJob("ControlArmyDefendBase")
end

DisableArmyDefendBase = function()
	if ArmyDefendBase ~= nil then
		DestroyAITroopGenerator(ArmyDefendBase)
		EndJob(DefendBaseControl)
		ArmyDefendBase = nil
	end
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Condition_ControlArmyDefendBase"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefendBase = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyDefendBase",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefendBase = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyDefendBase)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
