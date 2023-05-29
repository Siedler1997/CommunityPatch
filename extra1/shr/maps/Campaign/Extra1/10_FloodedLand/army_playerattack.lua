function CreateArmyPlayerAttack()

	ArmyPlayerAttack = {}
		
	ArmyPlayerAttack.player 			= 	3
	ArmyPlayerAttack.id				= 	0
	ArmyPlayerAttack.position			= 	GetPosition("NephilimHQSpawnPos")			-- in front of Bastilles
	ArmyPlayerAttack.rodeLength		= 	3000
		                                    	  	
	-- Spawn parameter                  	  	
	ArmyPlayerAttack.spawnTypes 		= 	{	{ Entities.CU_Evil_LeaderBearman1, 16},
												{ Entities.CU_Evil_LeaderSkirmisher1, 16}
											}
	if CP_Difficulty == 1 then
		ArmyPlayerAttack.strength			= 	6
		ArmyPlayerAttack.respawnTime		= 	15 * 60
	else
		ArmyPlayerAttack.strength			= 	8
		ArmyPlayerAttack.respawnTime		= 	10 * 60
	end
														
	ArmyPlayerAttack.spawnPos			= 	GetPosition("NephilimHQSpawnPos")
	ArmyPlayerAttack.spawnGenerator	= 	"NephilimBaseHQ"
	ArmyPlayerAttack.maxSpawnAmount	= 	6
	ArmyPlayerAttack.endless			= 	true
	ArmyPlayerAttack.refresh			= 	false
	                                              	
	ArmyPlayerAttack.retreatStrength	= 	0
	ArmyPlayerAttack.baseDefenseRange	= 	2000
	ArmyPlayerAttack.outerDefenseRange= 	2000
	ArmyPlayerAttack.Attack			= 	true
	ArmyPlayerAttack.AttackAllowed	= 	true
	ArmyPlayerAttack.AttackPos			=	GetPosition("HQ")
	ArmyPlayerAttack.experiencePoints	=	CP_Difficulty
	
	
	-- Setup army
	SetupArmy(ArmyPlayerAttack)
		
	-- Army generator
	SetupAITroopSpawnGenerator("NephilimBaseHQ", ArmyPlayerAttack)	
	
	-- Control army
	StartJob("ControlArmyPlayerAttack")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP7PlayerAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyPlayerAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyPlayerAttack",15)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyPlayerAttack = function()
	-------------------------------------------------------------------------------------------------------------------
	
		TickOffensiveAIController(ArmyPlayerAttack)
		
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------