-- at small Castle in NorthEast; end-boss defenders

DESPAIR_RESPAWN = 3 * 60
if CP_Difficulty == 0 then
	DESPAIR_RESPAWN = DESPAIR_RESPAWN - 30
end

setupArmyDespair = function()

	ArmyDespair 					=	{}
                                	 	
	ArmyDespair.player 				=	5
	ArmyDespair.id					=	2
	ArmyDespair.strength			=	5
	ArmyDespair.position			=	GetPosition("DespairSpawn")
	ArmyDespair.rodeLength			=	2500
	
	-- Spawn parameter
	if CP_Difficulty == 0 then
		ArmyDespair.spawnTypes 			=	{ 	{ Entities.CU_BlackKnight_LeaderMace2, 4},
												{ Entities.PU_LeaderBow4, 4},
												{ Entities.PV_Cannon3a, 0},
												{ Entities.CU_Barbarian_LeaderClub2, 12},
												{ Entities.PU_LeaderBow4, 12} }
	else
		ArmyDespair.strength			=	8
		ArmyDespair.spawnTypes 		= 	{	{ Entities.PU_LeaderBow4, 8},
											{ Entities.PU_LeaderBow4, 8},
											{ Entities.PU_LeaderSword4, 8},
											{ Entities.PU_LeaderSword4, 8},
											{ Entities.PU_LeaderPoleArm4, 8},
											{ Entities.PU_LeaderPoleArm4, 8},
											{ Entities.PV_Cannon3a, 0},
											{ Entities.PV_Cannon3a, 0}
										}
	end
	ArmyDespair.spawnPos			=	GetPosition("DespairSpawn")
	ArmyDespair.spawnGenerator		=	"DespairHQ"
	ArmyDespair.respawnTime			=	DESPAIR_RESPAWN
	ArmyDespair.maxSpawnAmount		=	1
	ArmyDespair.endless				=	true
	ArmyDespair.refresh				=	false

	ArmyDespair.retreatStrength		=	2
	ArmyDespair.baseDefenseRange	=	2500	--2500
	ArmyDespair.outerDefenseRange	=	7000	--2500
	ArmyDespair.Attack				=	false
	ArmyDespair.AttackAllowed		=	false
	ArmyDespair.experiencePoints	=	CP_Difficulty

	-- Setup army
	SetupArmy(ArmyDespair)
	
	-- Army generator
	SetupAITroopSpawnGenerator("Despair_Generator", ArmyDespair)

	-- Control army
	StartJob("ControlArmyDespair")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyDespair"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDespair = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyDespair",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDespair = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyDespair)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
