function CreateArmyBridges()

	ArmyBridges						=	{}

	ArmyBridges.bridgeBuild			=	{}

	-- Init army
	ArmyBridges.player 				=	8
	ArmyBridges.id					=	3
	ArmyBridges.strength			=	8
	ArmyBridges.position			=	GetPosition("ArmyMovePos0")
	ArmyBridges.rodeLength			=	3000
	ArmyBridges.retreatStrength		=	3
	ArmyBridges.baseDefenseRange	=	2000
	ArmyBridges.outerDefenseRange	=	3000
	ArmyBridges.AttackAllowed		=	false
	
	ArmyBridges.AllowedTypes		=	{ 	UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderSword,
											UpgradeCategories.LeaderPoleArm,
											UpgradeCategories.LeaderRifle,
											Entities.PV_Cannon3 }
												
	-- Spawn generator
	SetupAITroopGenerator("ArmyBridges", ArmyBridges)

	StartSimpleJob("ControlArmyBridges")

end

function StartArmyBridgesAttack()
	
	ArmyBridges.AttackAllowed = true
	
end

function RedeployArmyBridges(_bridgeIndex)

	ArmyBridges.bridgeBuild[_bridgeIndex] = true

	local index = 0

	for i=1,NECESSARY_BRIDGE_COUNT do
		
		if ArmyBridges.bridgeBuild[i] ~= true then
			break
		end
		
		index = index + 1
		
	end

	ArmyBridges.position = GetPosition("ArmyMovePos"..index)
	ResetOffensiveAIController(ArmyBridges)
end

function ControlArmyBridges()

	if Counter.Tick2("ControlArmyBridges", 10) then
		
		TickOffensiveAIController(ArmyBridges)
		
	end

end
