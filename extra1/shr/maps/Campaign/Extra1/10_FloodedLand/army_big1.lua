function CreateArmyBig1()

	-- Init armies
	ArmyBig1							= {}
		       
	for i=1,2 do
		                    		
		ArmyBig1[i]						=	{}
		ArmyBig1[i].player 				=	3
		ArmyBig1[i].id					=	5+i
		ArmyBig1[i].strength			=	6
		if CP_Difficulty > 0 then
			ArmyBig1[i].strength = ArmyBig1[i].strength + 2
		end
		ArmyBig1[i].position			=	GetPosition("ArmyBig1")
		ArmyBig1[i].rodeLength			=	1000
		ArmyBig1[i].retreatStrength		=	0
		ArmyBig1[i].baseDefenseRange	=	1000
		ArmyBig1[i].outerDefenseRange	=	1000
		ArmyBig1[i].pulse				=	true
		ArmyBig1[i].AttackAllowed		=	false
		
		SetupArmy(ArmyBig1[i])

		local troopDescription = {
		
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}	
		if CP_Difficulty > 0 then
			troopDescription.experiencePoints = troopDescription.experiencePoints + 2
			troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
			EnlargeArmy(ArmyBig1[i],troopDescription)
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
			EnlargeArmy(ArmyBig1[i],troopDescription)
			ArmyBig1[i].respawnTime			=	60
			ArmyBig1[i].maxSpawnAmount		=	2
		else
			ArmyBig1[i].respawnTime			=	5*60
			ArmyBig1[i].maxSpawnAmount		=	1
		end			
		
		troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		EnlargeArmy(ArmyBig1[i],troopDescription)
		EnlargeArmy(ArmyBig1[i],troopDescription)
		EnlargeArmy(ArmyBig1[i],troopDescription)
	
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyBig1[i],troopDescription)
		EnlargeArmy(ArmyBig1[i],troopDescription)
		EnlargeArmy(ArmyBig1[i],troopDescription)

		ArmyBig1[i].spawnTypes			=	{ 	{ Entities.CU_Evil_LeaderBearman1, 16 },
												{ Entities.CU_Evil_LeaderSkirmisher1, 16 }}
													
		ArmyBig1[i].spawnPos			=	GetPosition("ArmyBig1")
		ArmyBig1[i].endless				=	true
		
		-- Spawn generator
		SetupAITroopSpawnGenerator("ArmyBig1_"..i, ArmyBig1[i])

	end

	StartSimpleJob("ControlArmyBig1")

end

function ArmyBig1ExtendRange()

	for i=1,2 do
		ArmyBig1[i].baseDefenseRange	=	5000
		ArmyBig1[i].outerDefenseRange	=	5000
		ResetOffensiveAIController(ArmyBig1[i])
	end

end

function ControlArmyBig1()

	if Counter.Tick2("ControlArmyBig1", 10) then
	
		if IsDead(ArmyBig1[1]) and IsDead(ArmyBig1[2]) then
			
			-- Destroy spawn generators
			DestroyAITroopGenerator(ArmyBig1[1])
			DestroyAITroopGenerator(ArmyBig1[2])
			
			return true
		end

		for i=1,2 do	
			TickOffensiveAIController(ArmyBig1[i])
		end
		
	end
end