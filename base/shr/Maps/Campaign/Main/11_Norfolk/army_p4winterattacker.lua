setupArmyP4WinterAttacker = function()

	ArmyP4WinterAttacker1	= {}

	initArmyP4WinterAttacker(ArmyP4WinterAttacker1, "ArmyP4WinterAttacker1", 6, "P4_WinterGather", 3000)

	StartJob("ControlArmyP4WinterAttacker")
	
	SetupArmyP4WinterGather(ArmyP4WinterAttacker1)
	SetupArmyP4WinterGather(ArmyP4Attacker)
	SetupArmyP4WinterGather(ArmyP4Defense1)
	
	P4WinterAttackGathered = true

--	TimeLine.Enter("Start P4 WinterAttack", TimeLine.Seconds + 600, "StartArmyP4WinterAttacker")
end

SetupArmyP4WinterGather = function(_army)

	_army.AttackAllowed = false

	_army.retreatStrength = 0
	
	_army.strength = 4
	
	_army.baseDefenseRange	= 	1
	_army.outerDefenseRange	= 	1000
	
	_army.position	= GetPosition("P4_WinterGather")
	_army.AttackPos	= GetPosition("P4_WinterAttack")


end

SetupArmyP4WinterAttack = function(_army)

	_army.retreatStrength = 0
	
	_army.strength = 1
	
	DestroyAITroopGenerator (_army)
	
	_army.baseDefenseRange	= 	1000
	_army.outerDefenseRange	= 	3000
	
	_army.position	= GetPosition("P4_WinterGather")
	_army.AttackPos	= GetPosition("P4_WinterAttack")

	_army.AttackAllowed = true

end

StartArmyP4WinterAttacker = function()

--Report ("Winter4Attack!!")

	SetupArmyP2WinterAttack(ArmyP4WinterAttacker1)
	SetupArmyP2WinterAttack(ArmyP4Attacker)
	SetupArmyP2WinterAttack(ArmyP4Defense1)
	

	-- Begin attack
	
end



initArmyP4WinterAttacker = function(_army, _name, _index, _pos, _defenseRange)

	_army.player 			= 	4
	_army.id				= 	_index
	_army.strength			= 	8
	_army.position			= 	GetPosition(_pos)
	_army.rodeLength		= 	_defenseRange
	_army.beAgressive		=	true
	
	if CP_Difficulty == 1 then
		_army.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderBarbarian,
										UpgradeCategories.LeaderBarbarian,
										UpgradeCategories.LeaderBarbarian,
										UpgradeCategories.LeaderBow }
	else
		_army.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderBarbarian }
	end

	-- Attack parameter
	_army.retreatStrength	= 	0

	_army.baseDefenseRange	= 	_defenseRange - 2000
	_army.outerDefenseRange	= 	_defenseRange
                                      	
	_army.Attack			= 	false
	_army.AttackPos			=	GetPosition(_pos)
	_army.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopGenerator(_name, _army)
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP4WinterAttacker"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP4WinterAttacker = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP4WinterAttacker",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP4WinterAttacker = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP4WinterAttacker1)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
