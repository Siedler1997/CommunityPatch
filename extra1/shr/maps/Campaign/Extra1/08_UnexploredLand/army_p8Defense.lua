function CreateArmyP8Defense()

	ArmyP8Defense	=	{}
	
	for i=1,2 do

		-- Init army
		ArmyP8Defense[i]					= 	{}
		ArmyP8Defense[i].player 			=	8
		ArmyP8Defense[i].id					=	0+i
		ArmyP8Defense[i].strength			=	5
		ArmyP8Defense[i].position			=	GetPosition("P8_DefensePoint"..i)
		ArmyP8Defense[i].rodeLength			=	3000
		ArmyP8Defense[i].retreatStrength	=	0
		ArmyP8Defense[i].baseDefenseRange	=	1000
		ArmyP8Defense[i].outerDefenseRange	=	2000
		ArmyP8Defense[i].AttackAllowed		=	false
		
		ArmyP8Defense[i].AllowedTypes		=	{ 	UpgradeCategories.LeaderBow,
													UpgradeCategories.LeaderSword,
													UpgradeCategories.LeaderPoleArm,
													UpgradeCategories.LeaderRifle,
													Entities.PV_Cannon3 }
													
		-- Spawn generator
		SetupAITroopGenerator("ArmyP8Defense"..i, ArmyP8Defense[i])

	end

	StartSimpleJob("ControlArmyP8Defense")

end

function ControlArmyP8Defense()

	if Counter.Tick2("ControlArmyP8Defense", 10) then
		
		for i=1,2 do
		
			TickOffensiveAIController(ArmyP8Defense[i])
		
		end
		
	end

end
