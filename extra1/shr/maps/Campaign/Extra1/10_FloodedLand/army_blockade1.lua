function CreateArmyBlockade1()

	-- Init army
	ArmyBlockade1						= 	{}
	ArmyBlockade1.blockadeRemoved		=	false
	ArmyBlockade1.player 				=	3
	ArmyBlockade1.id					=	2
	ArmyBlockade1.strength				=	2
	if CP_Difficulty > 0 then
		if CP_Difficulty == 1 then
			ArmyBlockade1.strength = ArmyBlockade1.strength + 2
		else
			ArmyBlockade1.strength = ArmyBlockade1.strength * 3
		end
		ArmyBlockade1.toggleAttackTime	=	3 * 60
		ArmyBlockade1.respawnTime		=	3 * 60
	else
		ArmyBlockade1.toggleAttackTime	=	5 * 60
		ArmyBlockade1.respawnTime		=	5 * 60
	end
	ArmyBlockade1.position				=	GetPosition("ArmyBlockade1")
	ArmyBlockade1.rodeLength			=	2000
	ArmyBlockade1.retreatStrength		=	0
	ArmyBlockade1.baseDefenseRange		=	3000
	ArmyBlockade1.outerDefenseRange		=	3000
	ArmyBlockade1.maxSpawnAmount		= 	1
	ArmyBlockade1.AttackAllowed			=	false
	ArmyBlockade1.pulse					=	true
	ArmyBlockade1.spawnTypes			=	{ 	{ Entities.CU_Evil_LeaderBearman1, 16 },
												{ Entities.CU_Evil_LeaderSkirmisher1, 16 }}
												
	ArmyBlockade1.spawnPos				=	GetPosition("ArmyBlockade1")
	ArmyBlockade1.noEnemy				=	true
	ArmyBlockade1.noEnemyDistance		=	5000
	ArmyBlockade1.endless				=	true
	
	-- Spawn generator
	SetupAITroopSpawnGenerator("ArmyBlockade1", ArmyBlockade1)

	StartSimpleJob("ControlArmyBlockade1")

end

function ArmyBlockade1AllowAttack()

	ArmyBlockade1.blockadeRemoved = true

end

function ControlArmyBlockade1()

	ArmyBlockade1.toggleAttackTime = ArmyBlockade1.toggleAttackTime - 1

	if Counter.Tick2("ControlArmyBlockade1", 10) then
		
		if ArmyBlockade1.toggleAttackTime < 0 then
			
			if ArmyBlockade1.AttackAllowed == false and IsAlive(ArmyBlockade1) then
			
				if ArmyBlockade1.blockadeRemoved == true then
			
					ArmyBlockade1.AttackAllowed = true
				
				else
				
					ArmyBlockade1.outerDefenseRange = 25000
					ResetOffensiveAIController(ArmyBlockade1)
					
				end
			
				ArmyBlockade1.toggleAttackTime = 10*60 + GetRandom(5*60)
			
			else
			
				ArmyBlockade1.AttackAllowed = false
		
				ArmyBlockade1.toggleAttackTime = 5*60 + GetRandom(5*60)

				ArmyBlockade1.outerDefenseRange = 3000
				ResetOffensiveAIController(ArmyBlockade1)
				
			end			
		
	
		end
		
		
		TickOffensiveAIController(ArmyBlockade1)
		
	end

end
