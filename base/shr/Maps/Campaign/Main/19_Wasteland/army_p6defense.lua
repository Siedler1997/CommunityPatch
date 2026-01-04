setupArmyP6Defense = function()

	ArmyP6Defense					= {}

	ArmyP6Defense.player 			= 	6
	ArmyP6Defense.id				= 	0
	ArmyP6Defense.strength			= 	8
	ArmyP6Defense.position			= 	GetPosition("P6Defense")
	ArmyP6Defense.rodeLength		= 	4000
	                                	
	ArmyP6Defense.AllowedTypes 		= 	{	
		UpgradeCategories.LeaderCavalry, 
		UpgradeCategories.LeaderHeavyCavalry, 
		UpgradeCategories.LeaderHeavyCavalry
	}
	ArmyP6Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP6Defense.retreatStrength	= 	0

	ArmyP6Defense.baseDefenseRange	= 	4000
	ArmyP6Defense.outerDefenseRange	= 	4000
                                      	
	ArmyP6Defense.Attack			= 	false
	ArmyP6Defense.AttackAllowed		= 	false

	ArmyP6Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP6Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP6Defense", ArmyP6Defense)

end