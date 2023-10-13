setupArmyP2Defense = function()

	ArmyP2Defense1		= {}
--	ArmyP2Defense2		= {}
--	ArmyP2Defense3		= {}

	initArmyP2Defense(ArmyP2Defense1, "ArmyP2Defense1", 2, "P2Defense", 7000, true)
--	initArmyP2Defense(ArmyP2Defense2, "ArmyP2Defense2", 2, "AI1_ConcentratingArea2", 6000, true)
--	initArmyP2Defense(ArmyP2Defense3, "ArmyP2Defense3", 3, "P2HQDefensePos", 2000, false)

	StartJob("ControlArmyP2Defense")

end

initArmyP2Defense = function(_army, _name, _index, _pos, _defenseRange, _pulse)

	_army.player 			= 	2
	_army.id				= 	_index
	_army.strength			= 	4
	_army.position			= 	GetPosition(_pos)
	_army.rodeLength		= 	_defenseRange
	
	_army.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderPoleArm, 
									UpgradeCategories.LeaderSword, 
									UpgradeCategories.LeaderBow
								}
	_army.ignoreAttack		=	true

	-- Attack parameter
	_army.retreatStrength	= 	0

	_army.baseDefenseRange	= 	_defenseRange
	_army.outerDefenseRange	= 	_defenseRange
                                      	
	_army.Attack			= 	false
	_army.AttackAllowed		= 	false

	_army.pulse				=	_pulse

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
--		TickOffensiveAIController(ArmyP2Defense2)
--		TickOffensiveAIController(ArmyP2Defense3)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
