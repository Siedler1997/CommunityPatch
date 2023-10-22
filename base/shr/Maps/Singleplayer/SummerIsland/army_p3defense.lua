setupArmyP3Defense = function()

	ArmyP3Defense					= {}

	ArmyP3Defense.player 			= 	3
	ArmyP3Defense.id				= 	0
	ArmyP3Defense.strength			= 	6
	ArmyP3Defense.position			= 	GetPosition("P3Defense")
	ArmyP3Defense.rodeLength		= 	4500
	                                	
	ArmyP3Defense.AllowedTypes 		= 	{	
		Entities.PV_Cannon3
	}
	ArmyP3Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP3Defense.retreatStrength	= 	0

	ArmyP3Defense.baseDefenseRange	= 	4500
	ArmyP3Defense.outerDefenseRange	= 	4500
                                      	
	ArmyP3Defense.Attack			= 	false
	ArmyP3Defense.AttackAllowed		= 	false

	ArmyP3Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP3Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP3Defense", ArmyP3Defense)
	
	-- Control army
	StartJob("ControlArmyP3Defense")
	
	TimeLine.Enter("Allow Cannon4", TimeLine.Seconds + 30*60, "AllowArmyP3DefenseCannons")
	TimeLine.Enter("Increase Size P2A to 5/1", TimeLine.Seconds + 30*60, "IncreaseArmyP3DefenseSize")
	TimeLine.Enter("Increase Size P2A to 6/2", TimeLine.Seconds + 40*60, "IncreaseArmyP3DefenseSize")

end

AllowArmyP3DefenseCannons = function()

	table.insert(ArmyP3Defense.AllowedTypes, Entities.PV_Cannon4)

end

IncreaseArmyP3DefenseSize = function()

	ArmyP3Defense.strength = ArmyP3Defense.strength + 1

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP3Defense"
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
		TickOffensiveAIController(ArmyP3Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
