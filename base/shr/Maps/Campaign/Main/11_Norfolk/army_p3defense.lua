setupArmyP3Defense = function()

	ArmyP3Defense1		= {}
	ArmyP3Defense2		= {}

	initArmyP3Defense(ArmyP3Defense1, "ArmyP3Defense1", 1, "Concentrating_Area", 7000, 4)
	initArmyP3Defense(ArmyP3Defense2, "ArmyP3Defense2", 2, "Concentrating_Area2", 3500, 3)

	StartJob("ControlArmyP3Defense")

end

initArmyP3Defense = function(_army, _name, _index, _pos, _defenseRange, _strength)

	_army.player 			= 	3
	_army.id				= 	_index
	_army.strength			= 	_strength
	_army.position			= 	GetPosition(_pos)
	_army.rodeLength		= 	_defenseRange
	
	_army.AllowedTypes 		= 	{	UpgradeCategories.LeaderBow	}
	_army.ignoreAttack		=	true

	-- Attack parameter
	_army.retreatStrength	= 	0

	_army.baseDefenseRange	= 	_defenseRange
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
	Condition_ControlArmyP3Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP3Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP3Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP3Defense1)
		TickOffensiveAIController(ArmyP3Defense2)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
