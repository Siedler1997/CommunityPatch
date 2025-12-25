setupArmyRobbers = function()

	ArmyRobbers1 = {}
	ArmyRobbers2 = {}
	ArmyRobbers3 = {}
	ArmyRobbers4 = {}

	createRobbers(ArmyRobbers1, 3+CP_Difficulty, 1, 3800)
	createRobbers(ArmyRobbers2, 3+CP_Difficulty, 2, 1500)
	createRobbers(ArmyRobbers3, 3+CP_Difficulty, 3, 3500)
	createRobbers(ArmyRobbers4, 5+CP_Difficulty, 4, 3500)

	StartJob("ControlArmyRobbers")
end

createRobbers = function(_army, _strength, _index, _defenseRange)

	-- Create robbers
	_army.player 			= 3
	_army.id				= _index
	_army.position			= GetPosition("Robbers".._index)
	_army.rodeLength		= _defenseRange
	
	-- Spawn parameter
	local soldiers = 4 + CP_Difficulty * 2
	if CP_Difficulty == 0 then
		_army.spawnTypes 	= { { Entities.CU_BanditLeaderSword1, soldiers},
								{ Entities.CU_BanditLeaderSword1, soldiers},
								{ Entities.CU_BanditLeaderBow1, soldiers} }
	else
		_army.spawnTypes 	= { { Entities.CU_BanditLeaderSword2, soldiers},
								{ Entities.CU_BanditLeaderSword2, soldiers},
								{ Entities.CU_BanditLeaderBow2, soldiers} }
	end
									
	_army.spawnPos			= GetPosition("Robbers".._index)
	_army.spawnGenerator	= "RobberTower".._index
	_army.respawnTime		= 120
	_army.maxSpawnAmount	= 1
	_army.endless			= true
	_army.refresh			= false

	_army.retreatStrength	= 0
	_army.baseDefenseRange	= _defenseRange
	_army.outerDefenseRange	= _defenseRange
	_army.Attack			= false
	_army.AttackAllowed		= false
	_army.experiencePoints	=	CP_Difficulty

	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopSpawnGenerator("Robbers".._index, _army)

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRobbers = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyRobbers",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRobbers = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyRobbers1)
		TickOffensiveAIController(ArmyRobbers2)
		TickOffensiveAIController(ArmyRobbers3)
		TickOffensiveAIController(ArmyRobbers4)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
