setupArmyP5Defense = function()

	ArmyP5Defense					= {}

	ArmyP5Defense.player 			= 	5
	ArmyP5Defense.id				= 	0
	ArmyP5Defense.strength			= 	8
	ArmyP5Defense.position			= 	GetPosition("P5Defense")
	ArmyP5Defense.rodeLength		= 	4000
	                                	
	ArmyP5Defense.AllowedTypes 		= 	{	
		Entities.PV_Cannon3,
		Entities.PV_Cannon3,
		Entities.PV_Cannon4
	}
	ArmyP5Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP5Defense.retreatStrength	= 	0

	ArmyP5Defense.baseDefenseRange	= 	4000
	ArmyP5Defense.outerDefenseRange	= 	4000
                                      	
	ArmyP5Defense.Attack			= 	false
	ArmyP5Defense.AttackAllowed		= 	false

	ArmyP5Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP5Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP5Defense", ArmyP5Defense)

end