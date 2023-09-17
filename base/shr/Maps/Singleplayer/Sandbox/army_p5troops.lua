setupArmyP5Troops = function()

	ArmyP5Troops = {}
	
	local i
	for i=1,6 do
		ArmyP5Troops[i] = {}
		createTroops(ArmyP5Troops[i], i)
	end

	StartJob("ControlArmyP5Troops")
end

createTroops = function(_army, _index)

	-- Create Troops
	_army.player 			= 	5
	_army.id				= 	_index
	_army.strength			= 	7-_index
	_army.position			= 	GetPosition("ArmySpawnPos".._index)
	_army.rodeLength		= 	500
	                          	
	-- Spawn parameter        	
	_army.spawnTypes 		= 	{ 
		{Entities.CU_BlackKnight_LeaderMace2, 12}, 
		{Entities.CU_BlackKnight_LeaderMace2, 12}, 
		{Entities.CU_BlackKnight_LeaderMace2, 12}, 
		{Entities.PU_LeaderBow3, 12} 
	}
										
	_army.spawnPos			= 	GetPosition("ArmySpawnPos".._index)
	_army.spawnGenerator	= 	"ArmyGenerator".._index
	_army.respawnTime		= 	60
	_army.maxSpawnAmount	= 	1
	_army.endless			= 	true
	_army.refresh			= 	false
                              	
	_army.retreatStrength	= 	0
	_army.baseDefenseRange	= 	500
	_army.outerDefenseRange	= 	500
	_army.Attack			= 	false
	_army.AttackAllowed		= 	false
	_army.pulse				=	true
	_army.experiencePoints	=	2

	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopSpawnGenerator("P5Troops".._index, _army)

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP5Troops = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP5Troops",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP5Troops = function()
	-------------------------------------------------------------------------------------------------------------------
		local i
		for i=1,6 do
			TickOffensiveAIController(ArmyP5Troops[i])
		end
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
