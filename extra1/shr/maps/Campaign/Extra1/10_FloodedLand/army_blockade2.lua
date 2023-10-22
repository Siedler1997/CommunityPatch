function CreateArmyBlockade2()

	-- Init army
	ArmyBlockade2						=	{}
	ArmyBlockade2.player 				=	3
	ArmyBlockade2.id					=	3
	ArmyBlockade2.strength				=	2
	if CP_Difficulty > 0 then
		if CP_Difficulty == 1 then
			ArmyBlockade2.strength = ArmyBlockade2.strength + 2
		else
			ArmyBlockade2.strength = ArmyBlockade2.strength * 3
		end
		ArmyBlockade2.toggleAttackTime	=	3 * 60
		ArmyBlockade2.respawnTime		=	3 * 60
	else
		ArmyBlockade2.toggleAttackTime	=	5*60
		ArmyBlockade2.respawnTime		=	5*60
	end
	ArmyBlockade2.position				=	GetPosition("ArmyBlockade2")
	ArmyBlockade2.rodeLength			=	2000
	ArmyBlockade2.retreatStrength		=	0
	ArmyBlockade2.baseDefenseRange		=	3000
	ArmyBlockade2.outerDefenseRange		=	3000
	ArmyBlockade2.maxSpawnAmount		= 	1
	ArmyBlockade2.AttackAllowed			=	false
	ArmyBlockade2.pulse					=	true
	ArmyBlockade2.spawnTypes			=	{ 	{ Entities.CU_Evil_LeaderBearman1, 16 },
												{ Entities.CU_Evil_LeaderSkirmisher1, 16 }}
												
	ArmyBlockade2.spawnPos				=	GetPosition("ArmyBlockade2")
	ArmyBlockade2.endless				=	true
	ArmyBlockade2.experiencePoints		=	CP_Difficulty
	
	-- Spawn generator
	SetupAITroopSpawnGenerator("ArmyBlockade2", ArmyBlockade2)

	StartSimpleJob("ControlArmyBlockade2")

end

function ControlArmyBlockade2()

	ArmyBlockade2.toggleAttackTime = ArmyBlockade2.toggleAttackTime - 1

	if Counter.Tick2("ControlArmyBlockade2", 10) then
		
		if ArmyBlockade2.toggleAttackTime < 0 then
			
			if ArmyBlockade2.AttackAllowed == false and IsAlive(ArmyBlockade2) then
			
				ArmyBlockade2.AttackAllowed = true
			
				ArmyBlockade2.toggleAttackTime = 10*60 + GetRandom(5*60)
			
			else
			
				ArmyBlockade2.AttackAllowed = false
		
				ArmyBlockade2.toggleAttackTime = 5*60 + GetRandom(5*60)
				
			end			
		
		end
		
		
		TickOffensiveAIController(ArmyBlockade2)
		
	end

end