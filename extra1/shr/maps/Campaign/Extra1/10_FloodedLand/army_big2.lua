function CreateArmyBig2()

	-- Init armies
	ArmyBig2							= {}
		       
	for i=1,2 do
		                    		
		ArmyBig2[i]						=	{}
		ArmyBig2[i].player 				=	3
		ArmyBig2[i].id					=	7+i
		ArmyBig2[i].strength			=	6
		if CP_Difficulty == 1 then
			ArmyBig2[i].strength = ArmyBig2[i].strength + 2
		end
		ArmyBig2[i].position			=	GetPosition("ArmyBig2")
		ArmyBig2[i].rodeLength			=	1000
		ArmyBig2[i].retreatStrength		=	0
		ArmyBig2[i].baseDefenseRange	=	1000
		ArmyBig2[i].outerDefenseRange	=	1000
		ArmyBig2[i].pulse				=	true
		ArmyBig2[i].AttackAllowed		=	false
		
		SetupArmy(ArmyBig2[i])

		local troopDescription = {
		
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}		
		if CP_Difficulty == 1 then
			troopDescription.experiencePoints = troopDescription.experiencePoints + 2
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
			EnlargeArmy(ArmyBig2[i],troopDescription)
			EnlargeArmy(ArmyBig2[i],troopDescription)
			ArmyBig2[i].respawnTime			=	60
			ArmyBig2[i].maxSpawnAmount		=	2
		else
			ArmyBig2[i].respawnTime			=	5*60
			ArmyBig2[i].maxSpawnAmount		=	1
		end		
		
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyBig2[i],troopDescription)
		EnlargeArmy(ArmyBig2[i],troopDescription)
		EnlargeArmy(ArmyBig2[i],troopDescription)
		EnlargeArmy(ArmyBig2[i],troopDescription)
		EnlargeArmy(ArmyBig2[i],troopDescription)
		EnlargeArmy(ArmyBig2[i],troopDescription)

		ArmyBig2[i].spawnTypes			=	{ { Entities.CU_Evil_LeaderSkirmisher1, 16 }}
													
		ArmyBig2[i].spawnPos			=	GetPosition("ArmyBig2")
		ArmyBig2[i].endless				=	true
		
		-- Spawn generator
		SetupAITroopSpawnGenerator("ArmyBig2_"..i, ArmyBig2[i])
		
	end

	StartSimpleJob("ControlArmyBig2")

end

function ArmyBig2ExtendRange()

	for i=1,2 do
		ArmyBig2[i].baseDefenseRange	=	5000
		ArmyBig2[i].outerDefenseRange	=	5000
		ResetOffensiveAIController(ArmyBig2[i])
	end

end

function ControlArmyBig2()

	if Counter.Tick2("ControlArmyBig2", 10) then
	
		if IsDead(ArmyBig2[1]) and IsDead(ArmyBig2[2]) then

			-- Destroy spawn generators
			DestroyAITroopGenerator(ArmyBig2[1])
			DestroyAITroopGenerator(ArmyBig2[2])
			
			return true
		end

		for i=1,2 do	
			TickOffensiveAIController(ArmyBig2[i])
		end
		
	end
end