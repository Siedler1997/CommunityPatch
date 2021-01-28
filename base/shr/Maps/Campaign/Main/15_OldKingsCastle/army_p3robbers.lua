setupArmyP3Robbers = function()

	ArmyP3Robbers = {}
	
	local i
	for i=1,5 do
		ArmyP3Robbers[i] = {}
		createRobbers(ArmyP3Robbers[i], i)
	end

	StartJob("ControlArmyP3Robbers")
end

createRobbers = function(_army, _index)

	-- Create robbers
	_army.player 			= 3
	_army.id				= _index
	_army.position			= GetPosition("Robbers".._index)
	_army.rodeLength		= 500
	
	if CP_Difficulty == 0 then
		_army.strength		= 3
		_army.spawnTypes 	= { {Entities.CU_BanditLeaderSword1, 12} }
	else
		_army.strength		= 5
		_army.spawnTypes 	= { {Entities.CU_BanditLeaderSword2, 12} }
	end

	-- Spawn parameter
									
	_army.spawnPos			= GetPosition("Robbers".._index)
	_army.spawnGenerator	= "RobberTower".._index
	_army.respawnTime		= 30
	_army.maxSpawnAmount	= 1
	_army.endless			= true
	_army.refresh			= false

	_army.retreatStrength	= 0
	_army.baseDefenseRange	= 500
	_army.outerDefenseRange	= 500
	_army.Attack			= false
	_army.AttackAllowed		= false

	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopSpawnGenerator("P3Robbers".._index, _army)

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP3Robbers = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP3Robbers",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP3Robbers = function()
	-------------------------------------------------------------------------------------------------------------------
		local i
		for i=1,5 do
			TickOffensiveAIController(ArmyP3Robbers[i])
		end
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
