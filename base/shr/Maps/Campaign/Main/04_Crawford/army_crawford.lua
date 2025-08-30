createArmyCrawfordA = function()

	ArmyCrawfordA					= {}

	ArmyCrawfordA.player 			= 	4
	ArmyCrawfordA.id				= 	4
	ArmyCrawfordA.strength			= 	4
	ArmyCrawfordA.position			= 	GetPosition("tower1")
	ArmyCrawfordA.rodeLength		= 	8000
	
	ArmyCrawfordA.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm,
											UpgradeCategories.LeaderPoleArm,
											UpgradeCategories.LeaderBow}

	-- Attack parameter
	ArmyCrawfordA.retreatStrength	= 	1

	ArmyCrawfordA.baseDefenseRange	= 	1000
	ArmyCrawfordA.outerDefenseRange	= 	1000
	
	-- Setup army
	SetupArmy(ArmyCrawfordA)
	
	-- Army generator
	SetupAITroopGenerator("ArmyCrawfordASpawn", ArmyCrawfordA)
	
	StartJob("ControlArmyCrawfordA")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Condition_ControlArmyCrawfordA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCrawfordA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyCrawfordA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCrawfordA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyCrawfordA)
		return false		
	end


-----------------------------------------------------------------------------------------------------------------------
createArmyCrawfordB = function()

	ArmyCrawfordB					= {}

	ArmyCrawfordB.player 			= 	4
	ArmyCrawfordB.id				= 	5
	ArmyCrawfordB.strength			= 	4
	ArmyCrawfordB.position			= 	GetPosition("tower2")
	ArmyCrawfordB.rodeLength		= 	8000
	
	ArmyCrawfordB.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm,
											UpgradeCategories.LeaderPoleArm,
											UpgradeCategories.LeaderBow}

	-- Attack parameter
	ArmyCrawfordB.retreatStrength	= 	1

	ArmyCrawfordB.baseDefenseRange	= 	1000
	ArmyCrawfordB.outerDefenseRange	= 	1000
	
	-- Setup army
	SetupArmy(ArmyCrawfordB)
	
	-- Army generator
	SetupAITroopGenerator("ArmyCrawfordBSpawn", ArmyCrawfordB)
	
	StartJob("ControlArmyCrawfordB")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Condition_ControlArmyCrawfordB"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCrawfordB = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyCrawfordB",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCrawfordB = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyCrawfordB)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------