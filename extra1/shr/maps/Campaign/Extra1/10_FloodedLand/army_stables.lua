function CreateArmyStables()

	-- Init army
	ArmyStables						= 	{}
	ArmyStables.player 				=	5
	ArmyStables.id					=	1
	ArmyStables.strength			=	4
	ArmyStables.position			=	GetPosition("ArmyStablePos")
	ArmyStables.rodeLength			=	2000
	ArmyStables.retreatStrength		=	0
	ArmyStables.baseDefenseRange	=	6000
	ArmyStables.outerDefenseRange	=	6000
	ArmyStables.AttackAllowed		=	false
	
	ArmyStables.AllowedTypes		=	{	UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.Cavalry
										}
												
	-- Spawn generator
	SetupAITroopGenerator("ArmyStables", ArmyStables)

	StartSimpleJob("ControlArmyStables")

end

function ControlArmyStables()

	if Counter.Tick2("ControlArmyStables", 10) then
		
		TickOffensiveAIController(ArmyStables)
		
	end

end
