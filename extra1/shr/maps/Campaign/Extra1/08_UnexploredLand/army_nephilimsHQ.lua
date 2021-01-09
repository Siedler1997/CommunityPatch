function CreateArmyNephilimsHQ()

	ArmyNephilimsHQ	=	{}

	for i=1,2 do

		-- Init army
		ArmyNephilimsHQ[i]						= 	{}
		ArmyNephilimsHQ[i].player 				=	2
		ArmyNephilimsHQ[i].id					=	0+i
		
		if i>2 then
			ArmyNephilimsHQ[i].strength				=	4
		else
			ArmyNephilimsHQ[i].strength				=	4
		end
		if CP_Difficulty == 1 then
			ArmyTribalCamps[i].strength = ArmyTribalCamps[i].strength * 2
		end
					
		ArmyNephilimsHQ[i].position				=	GetPosition("NephilimMoveOutDefensePos")
		ArmyNephilimsHQ[i].rodeLength			=	3000
		ArmyNephilimsHQ[i].retreatStrength		=	0
		ArmyNephilimsHQ[i].baseDefenseRange		=	3000
		ArmyNephilimsHQ[i].outerDefenseRange	=	3000
		ArmyNephilimsHQ[i].AttackAllowed		=	false
		ArmyNephilimsHQ[i].pulse				=	true
		
		ArmyNephilimsHQ[i].spawnTypes			=	{ 	{ Entities.CU_Evil_LeaderBearman1, 16 },
														{ Entities.CU_Evil_LeaderSkirmisher1, 16 },
														{ Entities.CU_Evil_LeaderBearman1, 16 },
														{ Entities.CU_Evil_LeaderBearman1, 16 },
														{ Entities.CU_Evil_LeaderSkirmisher1, 16 } }

		local index = math.mod(i,2)+1
													
		ArmyNephilimsHQ[i].spawnGenerator		=	"Nephilim_HQ_Tower"..index
		ArmyNephilimsHQ[i].spawnPos				=	GetPosition("Nephilim_HQSpawnPos"..index)
		if CP_Difficulty == 0 then
			ArmyNephilimsHQ[i].respawnTime			=	60
			ArmyNephilimsHQ[i].maxSpawnAmount		=	1
		else
			ArmyNephilimsHQ[i].respawnTime			=	45
			ArmyNephilimsHQ[i].maxSpawnAmount		=	2
		end
		ArmyNephilimsHQ[i].endless				=	true
		
		-- Spawn generator
		SetupAITroopSpawnGenerator("ArmyNephilimsHQ"..i, ArmyNephilimsHQ[i])

	end

	StartSimpleJob("ControlArmyNephilimsHQ")

end

function MoveOutArmyNephilimsHQAttack()

	for i=1,2 do
	
		ArmyNephilimsHQ[i].position	=	GetPosition("NephilimMoveOutDefensePos")
		ResetOffensiveAIController(ArmyNephilimsHQ[i])
		
	end

end

function ControlArmyNephilimsHQ()

	if Counter.Tick2("ControlArmyNephilimsHQ", 10) then

		for i=1,2 do
	
			TickOffensiveAIController(ArmyNephilimsHQ[i])
			
		end
	
	end

end