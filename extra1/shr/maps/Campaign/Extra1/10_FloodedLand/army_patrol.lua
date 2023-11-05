function CreateArmyPatrol()

	-- Init army
	ArmyPatrol						= 	{}
	ArmyPatrol.player 				=	3
	ArmyPatrol.id					=	1
	ArmyPatrol.strength				=	6
	if CP_Difficulty > 0 then
		ArmyPatrol.strength = ArmyPatrol.strength + 2
	end
	ArmyPatrol.position				=	GetPosition("ArmyPatrolling")
	ArmyPatrol.rodeLength			=	5000
	ArmyPatrol.beAgressive			=	true
	
	ArmyPatrol.retreatStrength		=	0
	ArmyPatrol.baseDefenseRange		=	5000
	ArmyPatrol.outerDefenseRange	=	5000
	ArmyPatrol.AttackAllowed		=	false
	ArmyPatrol.pulse				=	true
	
	ArmyPatrol.patrolPointTime		=	3*60
	
	SetupArmy(ArmyPatrol)
	
				
	local troopDescription = {
	
		maxNumberOfSoldiers	= 16,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}	
	if CP_Difficulty > 0 then
		troopDescription.experiencePoints = troopDescription.experiencePoints + 2
		troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		EnlargeArmy(ArmyPatrol,troopDescription)
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyPatrol,troopDescription)
	end				
	
	troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)

	troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)
	EnlargeArmy(ArmyPatrol,troopDescription)


	StartSimpleJob("ControlArmyPatrol")

end

function ControlArmyPatrol()

	ArmyPatrol.patrolPointTime = ArmyPatrol.patrolPointTime - 1

	if Counter.Tick2("ControlArmyPatrol", 10) then

		if IsDead(ArmyPatrol) then
			return true
		end
	
		if ArmyPatrol.patrolPointTime < 0 and (GetClosestEntity(ArmyPatrol, ArmyPatrol.outerDefenseRange+1000) == 0) then
			
			local RandomPoint = GetRandom(1,7)
			
			ArmyPatrol.position	=	GetPosition("PatrolPoint"..RandomPoint)
			
			Redeploy(ArmyPatrol, ArmyPatrol.position)
			
			Report("Patrolling to point "..RandomPoint)
			
			ArmyPatrol.patrolPointTime = 3*60
			
		end
	
		TickOffensiveAIController(ArmyPatrol)
	
	end
end