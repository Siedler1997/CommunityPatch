setupArmyP2Defense = function()

	ArmyP2Defense1		= {}
	ArmyP2Defense2		= {}

	initArmyP2Defense(ArmyP2Defense1, "ArmyP2Defense1", 8, "P2Defense1", 5000)
	initArmyP2Defense(ArmyP2Defense2, "ArmyP2Defense2", 9, "P2Defense2", 4000)

	StartJob("ControlArmyP2Defense")

end

initArmyP2Defense = function(_army, _name, _index, _pos, _defenseRange)

	_army.player 			= 	2
	_army.id				= 	_index
	_army.strength			= 	6
	_army.position			= 	GetPosition(_pos)
	_army.rodeLength		= 	_defenseRange
	
	if CP_Difficulty == 1 then
		_army.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm,
										UpgradeCategories.LeaderSword,
										UpgradeCategories.LeaderHeavyCavalry,
										Entities.PV_Cannon2,
										Entities.PV_Cannon3 }
	else
		_army.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm,
										UpgradeCategories.LeaderSword,
										UpgradeCategories.LeaderHeavyCavalry,
										Entities.PV_Cannon1,
										Entities.PV_Cannon2,
										Entities.PV_Cannon2,
										Entities.PV_Cannon3 }
	end

	_army.ignoreAttack		=	true

	-- Attack parameter
	_army.retreatStrength	= 	0

	_army.baseDefenseRange	= 	_defenseRange - 2000
	_army.outerDefenseRange	= 	_defenseRange
                                      	
	_army.Attack			= 	false
	_army.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopGenerator(_name, _army)
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyLeftFortress"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP2Defense1)
		TickOffensiveAIController(ArmyP2Defense2)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
