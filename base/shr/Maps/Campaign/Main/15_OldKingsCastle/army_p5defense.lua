setupArmyP5Defense = function()

	ArmyP5Defense					= {}

	ArmyP5Defense.player 			= 	5
	ArmyP5Defense.id				= 	2
	ArmyP5Defense.strength			= 	8
	ArmyP5Defense.position			= 	GetPosition("AI2_ConcentratingArea")
	ArmyP5Defense.rodeLength		= 	4500
	                                	
	ArmyP5Defense.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow }

	if CP_Difficulty == 0 then
		table.insert(ArmyP5Attack.AllowedTypes, Entities.PV_Cannon2)
	else
		table.insert(ArmyP5Attack.AllowedTypes, Entities.PV_Cannon4a)
	end

	ArmyP5Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP5Defense.retreatStrength	= 	0

	ArmyP5Defense.baseDefenseRange	= 	4500
	ArmyP5Defense.outerDefenseRange	= 	7000
                                      	
	ArmyP5Defense.Attack			= 	false
	ArmyP5Defense.AttackAllowed		= 	false

	ArmyP5Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP5Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP5Defense", ArmyP5Defense)
	
	-- Control army
	StartJob("ControlArmyP5Defense")
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP5Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP5Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP5Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP5Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP5Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
