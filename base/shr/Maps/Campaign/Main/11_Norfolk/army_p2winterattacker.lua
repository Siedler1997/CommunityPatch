setupArmyP2WinterAttacker = function()
--Report ("BuildUpWinterAttacker")
	ArmyP2WinterAttacker1	= {}
	ArmyP2WinterAttacker2	= {}
	ArmyP2WinterAttacker3	= {}

	initArmyP2WinterAttacker(ArmyP2WinterAttacker1, "ArmyP2WinterAttacker1", 5, "pos1", 3000)
	initArmyP2WinterAttacker(ArmyP2WinterAttacker2, "ArmyP2WinterAttacker2", 6, "pos2", 3000)
	initArmyP2WinterAttacker(ArmyP2WinterAttacker3, "ArmyP2WinterAttacker3", 7, "pos3", 3000)

	StartJob("ControlArmyP2WinterAttacker")
	
	SetupArmyP2WinterGather(ArmyP2WinterAttacker1)
	SetupArmyP2WinterGather(ArmyP2WinterAttacker2)
	SetupArmyP2WinterGather(ArmyP2WinterAttacker3)
	SetupArmyP2WinterGather(ArmyP2Defense1)
	SetupArmyP2WinterGather(ArmyP2Defense2)
	SetupArmyP2WinterGather(ArmyP2Attacker)
	
	P2WinterAttackGathered = true

	TimeLine.Enter("Start P2 Winter Attack", TimeLine.Seconds + WinterAttackCountdown, "startNorfolkWinterAttack")
end

SetupArmyP2WinterGather = function(_army)

	_army.AttackAllowed = false

	_army.retreatStrength = 0
	
	_army.strength = 4

	if CP_Difficulty > 0 then
		_army.strength = _army.strength + 2
	end

	_army.baseDefenseRange	= 	1
	_army.outerDefenseRange	= 	1500

	
	_army.position	= GetPosition("P2_WinterGather")
	_army.AttackPos	= GetPosition("P2_WinterAttack")


end

SetupArmyP2WinterAttack = function(_army)

	_army.retreatStrength = 0
	
	_army.strength = 1
	
	DestroyAITroopGenerator (_army)
	
	_army.baseDefenseRange	= 	1000
	_army.outerDefenseRange	= 	3000
	
	_army.position	= GetPosition("P2_WinterGather")
	_army.AttackPos	= GetPosition("P2_WinterAttack")

	_army.AttackAllowed = true

	_army.beAgressive = true

end


StartArmyP2WinterAttacker = function()
--Report ("WinterAttack!!")

	SetupArmyP2WinterAttack(ArmyP2WinterAttacker1)
	SetupArmyP2WinterAttack(ArmyP2WinterAttacker2)
	SetupArmyP2WinterAttack(ArmyP2WinterAttacker3)
	SetupArmyP2WinterAttack(ArmyP2Defense1)
	SetupArmyP2WinterAttack(ArmyP2Defense2)
	SetupArmyP2WinterAttack(ArmyP2Attacker)
	-- Begin attack
	
end

initArmyP2WinterAttacker = function(_army, _name, _index, _pos, _defenseRange)

	_army.player 			= 	2
	_army.id				= 	_index
	_army.strength			= 	4
	_army.position			= 	GetPosition("P2_WinterGather")
	_army.rodeLength		= 	_defenseRange
	_army.beAgressive		=	true
	
	if CP_Difficulty > 0 then
		_army.strength = _army.strength + 2
		_army.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
										UpgradeCategories.LeaderHeavyCavalry,
										Entities.PV_Cannon2,
										Entities.PV_Cannon3,
										Entities.PV_Cannon4
									}
	else
		_army.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderPoleArm, 
										UpgradeCategories.LeaderSword,
										Entities.PV_Cannon1,
										Entities.PV_Cannon2,
										Entities.PV_Cannon2,
										Entities.PV_Cannon3,
										Entities.PV_Cannon4
									}
	end

	-- Attack parameter
	_army.retreatStrength	= 	0

	_army.baseDefenseRange	= 	_defenseRange - 2000
	_army.outerDefenseRange	= 	_defenseRange
                                      	
	_army.Attack			= 	false
	_army.AttackPos			=	GetPosition("P2_WinterAttack")
	_army.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopGenerator(_name, _army)
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2WinterAttacker"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2WinterAttacker = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2WinterAttacker",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2WinterAttacker = function()
	-------------------------------------------------------------------------------------------------------------------
		if WinterAttackAttackRunning == true then
			FrontalAttack(ArmyP2WinterAttacker1)
			FrontalAttack(ArmyP2WinterAttacker2)
			FrontalAttack(ArmyP2WinterAttacker3)
			FrontalAttack(ArmyP2Defense1)
			FrontalAttack(ArmyP2Defense2)
			FrontalAttack(ArmyP2Attacker)
		else
			TickOffensiveAIController(ArmyP2WinterAttacker1)
			TickOffensiveAIController(ArmyP2WinterAttacker2)
			TickOffensiveAIController(ArmyP2WinterAttacker3)
		end
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
