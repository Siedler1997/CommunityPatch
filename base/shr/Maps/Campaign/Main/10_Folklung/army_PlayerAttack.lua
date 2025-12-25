createArmyAttackPlayerA = function()
	ArmyAttackPlayerA					= {}

	ArmyAttackPlayerA.player 			= 	gvMission.PlayerIDBesieger
	ArmyAttackPlayerA.id				= 	1
	ArmyAttackPlayerA.position			= 	GetPosition("ArmyAttackPlayer")
	ArmyAttackPlayerA.rodeLength			= 	1000
	
	if CP_Difficulty == 0 then
		ArmyAttackPlayerA.strength			= 	7	                                	
		ArmyAttackPlayerA.spawnTypes 		= 	{	 {Entities.CU_Barbarian_LeaderClub1, 4}	,
														{Entities.CU_Barbarian_LeaderClub1, 4},
														{Entities.CU_Barbarian_LeaderClub1, 4},
														{Entities.CU_Barbarian_LeaderClub1, 4},
														{Entities.CU_Barbarian_LeaderClub1, 4},
														{Entities.PU_LeaderBow1, 4},
														{Entities.PU_LeaderBow1, 4}	 }
		ArmyAttackPlayerA.respawnTime       =   80
	else
		local soldiers = 4 + CP_Difficulty * 2
		ArmyAttackPlayerA.strength			= 	8	                                	
		ArmyAttackPlayerA.spawnTypes 		= 	{	 {Entities.CU_Barbarian_LeaderClub2, soldiers}, 
													{Entities.CU_Barbarian_LeaderClub2, soldiers}, 
													{Entities.CU_Barbarian_LeaderClub2, soldiers}, 
													{Entities.CU_Barbarian_LeaderClub2, soldiers},
													{Entities.CU_Barbarian_LeaderClub2, soldiers}, 
													{Entities.CU_Barbarian_LeaderClub2, soldiers},
													 }
		if CP_Difficulty == 1 then
			table.insert(ArmyAttackPlayerA.spawnTypes, {Entities.PU_LeaderBow2, 4})
			table.insert(ArmyAttackPlayerA.spawnTypes, {Entities.PU_LeaderBow2, 4})
		else
			table.insert(ArmyAttackPlayerA.spawnTypes, {Entities.PU_LeaderBow2a, soldiers})
			table.insert(ArmyAttackPlayerA.spawnTypes, {Entities.PU_LeaderBow2a, soldiers})
		end
		ArmyAttackPlayerA.respawnTime       =   60
	end
    
	ArmyAttackPlayerA.spawnPos          =   GetPosition("ArmyAttackPlayer")
	-- Attack parameter
	ArmyAttackPlayerA.retreatStrength	= 	1

	ArmyAttackPlayerA.baseDefenseRange	= 	2000
	ArmyAttackPlayerA.outerDefenseRange	= 	2000
                                      	
	ArmyAttackPlayerA.AttackPos			=	GetPosition("ArmyAttackPlayerAttackPoint")

    ArmyAttackPlayerA.refresh           = false

	if CP_Difficulty == 2 then
		ArmyAttackPlayerA.Attack			= false
		ArmyAttackPlayerA.AttackAllowed		= false
	else
		ArmyAttackPlayerA.Attack			= true
		ArmyAttackPlayerA.AttackAllowed		= true
	end
    
    ArmyAttackPlayerA.endless = true
	ArmyAttackPlayerA.experiencePoints	=	CP_Difficulty

	-- Setup army
	SetupArmy(ArmyAttackPlayerA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyAttackPlayerASpawn", ArmyAttackPlayerA)
	
	-- Control army
	PlayerAttackControler = StartJob("ControlArmyAttackPlayerA")
	
	QuestBastilleDestroyed = {}
	QuestBastilleDestroyed.Targets = {"BastillePlayerAttack1"}
																	
	QuestBastilleDestroyed.Callback = ArmyPlayerAttackDestroyed
	SetupDestroy(QuestBastilleDestroyed)
end

function MakeArmyAttackPlayerAggressive()
	ArmyAttackPlayerA.Attack = true
	ArmyAttackPlayerA.AttackAllowed = true
end

ArmyPlayerAttackDestroyed = function()
	if ArmyAttackPlayerA ~= nil then
		DestroyAITroopGenerator(ArmyAttackPlayerA)
		EndJob(PlayerAttackControler)
		ArmyAttackPlayerA = nil
	end
	Report("Bastille2 Destroyed")
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttackPlayerA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyAttackPlayerA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttackPlayerA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAttackPlayerA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------


DisableArmyPlayerAttack	= function()
	if ArmyAttackPlayerA ~= nil then
		DestroyAITroopGenerator(ArmyAttackPlayerA)
		EndJob(PlayerAttackControler)
		ArmyAttackPlayerA = nil
	end
end