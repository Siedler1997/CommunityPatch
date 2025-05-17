setupArmyP3Defense = function()
                                    	
	ArmyP3Defense1						=	{}
	                                	
	ArmyP3Defense1.player 				= 	3
	ArmyP3Defense1.id					= 	1
	ArmyP3Defense1.strength				= 	4
	ArmyP3Defense1.position				= 	GetPosition("P3Defense")
	ArmyP3Defense1.rodeLength			= 	2500
	                                	
	ArmyP3Defense1.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword, 
												UpgradeCategories.LeaderBow,
												Entities.PV_Cannon3,
												Entities.PV_Cannon3,
												UpgradeCategories.LeaderRifle
											}
                                    	
	-- Attack parameter             	
	ArmyP3Defense1.retreatStrength		= 	0

	ArmyP3Defense1.baseDefenseRange		= 	2500
	ArmyP3Defense1.outerDefenseRange	= 	2500
                                      	
	ArmyP3Defense1.Attack				= 	false
	ArmyP3Defense1.AttackAllowed		= 	false

	ArmyP3Defense1.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP3Defense1)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP3Defense1", ArmyP3Defense1)	
	
	ArmyP3Defense2						=	{}

	ArmyP3Defense2.player 				= 	3
	ArmyP3Defense2.id					= 	2
	ArmyP3Defense2.strength				= 	4
	ArmyP3Defense2.position				= 	GetPosition("P3Defense")
	ArmyP3Defense2.rodeLength			= 	2500
	                                	
	ArmyP3Defense2.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderBow, 
												Entities.PV_Cannon3,
												Entities.PV_Cannon3,
												UpgradeCategories.LeaderRifle
											}   	

	-- Attack parameter
	ArmyP3Defense2.retreatStrength		= 	3

	ArmyP3Defense2.baseDefenseRange		= 	2500
	ArmyP3Defense2.outerDefenseRange	= 	3500
                                      	
	ArmyP3Defense2.Attack				= 	false
	ArmyP3Defense2.AttackAllowed		= 	false

	ArmyP3Defense2.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP3Defense2)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP3Defense2", ArmyP3Defense2)

	StartJob("ControlArmyP3Defense")

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
