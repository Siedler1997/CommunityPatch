setupArmyP4Defense = function()

	ArmyP4Defense					= {}

	ArmyP4Defense.player 			= 	4
	ArmyP4Defense.id				= 	0
	ArmyP4Defense.strength			= 	8
	ArmyP4Defense.position			= 	GetPosition("RainVillageMarker")
	ArmyP4Defense.rodeLength		= 	4000
	                                	
	ArmyP4Defense.AllowedTypes 		= 	{	
		UpgradeCategories.LeaderSword, 
		UpgradeCategories.LeaderBow
	}
	ArmyP4Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP4Defense.retreatStrength	= 	0

	ArmyP4Defense.baseDefenseRange	= 	4000
	ArmyP4Defense.outerDefenseRange	= 	4000
                                      	
	ArmyP4Defense.Attack			= 	false
	ArmyP4Defense.AttackAllowed		= 	false

	ArmyP4Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP4Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP4Defense", ArmyP4Defense)

end