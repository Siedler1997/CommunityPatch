setupArmyRobbers = function()

	ArmyRobbers1 = {}
	ArmyRobbers2 = {}
	ArmyRobbers3 = {}
	ArmyRobbers4 = {}

	createRobbers(ArmyRobbers1, 2, 1, 3800)
	createRobbers(ArmyRobbers2, 2, 2, 1500)
	createRobbers(ArmyRobbers3, 2, 3, 3500)
	createRobbers(ArmyRobbers4, 4, 4, 3500)

	StartJob("ControlArmyRobbers")
end

createRobbers = function(_army, _strength, _index, _defenseRange)

	-- Create robbers
	_army.player 			= 3
	_army.id				= _index
	_army.position			= GetPosition("Robbers".._index)
	_army.rodeLength		= _defenseRange
	
	-- Spawn parameter
	_army.spawnTypes 	= { { Entities.CU_BanditLeaderSword2, 8},
							{ Entities.CU_BanditLeaderBow2, 8} }

	if CP_Difficulty == 0 then
		_army.strength	= _strength
	else
		_army.strength	= _strength * 1.5
		table.insert(_army.spawnTypes, { Entities.CU_BanditLeaderSword2, 8})
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
