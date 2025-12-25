function CreateArmyP3Defense()

	-- Init army
	ArmyP3Defense						= 	{}
	ArmyP3Defense.player 				=	3
	ArmyP3Defense.id					=	1
	ArmyP3Defense.strength				=	6
	ArmyP3Defense.position				=	GetPosition("P3_EastVillage_Defend_SpawnPoint2")
	ArmyP3Defense.rodeLength			=	3000
	ArmyP3Defense.retreatStrength		=	0
	ArmyP3Defense.baseDefenseRange		=	3000
	ArmyP3Defense.outerDefenseRange		=	4000
	ArmyP3Defense.AttackAllowed			=	false
	
	ArmyP3Defense.AllowedTypes			=	{ UpgradeCategories.LeaderBow, UpgradeCategories.LeaderRifle }
												
	-- Spawn generator
	SetupAITroopGenerator("ArmyP3Defense", ArmyP3Defense)

	StartSimpleJob("ControlArmyP3Defense")

end

function ControlArmyP3Defense()

	if Counter.Tick2("ControlArmyP3Defense", 10) then
		
		TickOffensiveAIController(ArmyP3Defense)
		
	end

end
