function CreateArmyStonePit()

	-- Init armies
	ArmyStonePit					=	{}
	ArmyStonePit.player 			=	4
	ArmyStonePit.id					=	5
	ArmyStonePit.strength			=	4
	if CP_Difficulty == 1 then
		ArmyStonePit.strength = ArmyStonePit.strength + 2
	elseif CP_Difficulty == 2 then
		ArmyStonePit.strength = ArmyStonePit.strength * 2
	end
	ArmyStonePit.position			=	GetPosition("ArmyStonePit")
	ArmyStonePit.rodeLength			=	2000
	ArmyStonePit.retreatStrength	=	0
	ArmyStonePit.baseDefenseRange	=	2000
	ArmyStonePit.outerDefenseRange	=	2000
	ArmyStonePit.pulse				=	true
	ArmyStonePit.AttackAllowed		=	false
	
	SetupArmy(ArmyStonePit)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 16,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}	
	if CP_Difficulty > 0 then
		troopDescription.experiencePoints = troopDescription.experiencePoints + 2
		troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		EnlargeArmy(ArmyStonePit,troopDescription)
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyStonePit,troopDescription)
	end			
	
	troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
	EnlargeArmy(ArmyStonePit,troopDescription)
	EnlargeArmy(ArmyStonePit,troopDescription)

	troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
	EnlargeArmy(ArmyStonePit,troopDescription)
	EnlargeArmy(ArmyStonePit,troopDescription)

	StartSimpleJob("ControlArmyStonePit")

end

function ControlArmyStonePit()

	if Counter.Tick2("ControlArmyStonePit", 10) then
	
		if IsDead(ArmyStonePit) then
			return true
		end

		TickOffensiveAIController(ArmyStonePit)
		
	end
end