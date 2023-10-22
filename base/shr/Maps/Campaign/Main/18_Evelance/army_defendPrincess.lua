
setupArmyDefendPrincess = function()

	armyDefendPrincess = {}
		
	armyDefendPrincess.player 			= 	5
	armyDefendPrincess.id				= 	9
	armyDefendPrincess.strength			= 	6
	armyDefendPrincess.position			= 	GetPosition("PrincessDefend")			-- in front of Bastilles
	armyDefendPrincess.rodeLength		= 	2000
		                                    	  	
	-- Spawn parameter                  	  	
	if CP_Difficulty == 0 then
		armyDefendPrincess.spawnTypes 		= 	{	{ Entities.PU_LeaderBow4, 8},
													{ Entities.CU_BlackKnight_LeaderMace2, 8},
													{ Entities.CU_BlackKnight_LeaderMace2, 8},
													{ Entities.CU_Barbarian_LeaderClub2, 8},
													{ Entities.CU_Barbarian_LeaderClub2, 8},
													{ Entities.PV_Cannon3a, 0}
												}
	else
		armyDefendPrincess.strength			= 8
		armyDefendPrincess.spawnTypes 		= 	{	{ Entities.PU_LeaderBow4, 8},
													{ Entities.PU_LeaderBow4, 8},
													{ Entities.PU_LeaderSword4, 8},
													{ Entities.PU_LeaderSword4, 8},
													{ Entities.PU_LeaderPoleArm4, 8},
													{ Entities.PU_LeaderPoleArm4, 8},
													{ Entities.PV_Cannon3a, 0},
													{ Entities.PV_Cannon3a, 0}
												}
	end
														
	armyDefendPrincess.spawnPos			= 	GetPosition("PrincessDefend")
	armyDefendPrincess.spawnGenerator	= 	"Prison"
	armyDefendPrincess.respawnTime		= 	60
	armyDefendPrincess.maxSpawnAmount	= 	1
	armyDefendPrincess.endless			= 	true
	                                              	
	armyDefendPrincess.retreatStrength	= 	0
	armyDefendPrincess.baseDefenseRange	= 	2000
	armyDefendPrincess.outerDefenseRange= 	2000
	armyDefendPrincess.Attack			= 	false
	armyDefendPrincess.AttackAllowed	= 	false
	armyDefendPrincess.experiencePoints	=	CP_Difficulty
	
	
	-- Setup army
	SetupArmy(armyDefendPrincess)
		
	-- Army generator
	SetupAITroopSpawnGenerator("Prison", armyDefendPrincess)	
	
	-- Control army
	StartJob("ControlArmyDefendPrincess")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyDefendPrincess"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefendPrincess = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyDefendPrincess",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefendPrincess = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyDefendPrincess)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
