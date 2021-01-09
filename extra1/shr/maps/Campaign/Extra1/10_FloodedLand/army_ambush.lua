function CreateArmyAmbush()

	-- Init armies
	ArmyAmbush								= {}
		       
	for i=1,2 do
		                    		
		ArmyAmbush[i]						=	{}
		ArmyAmbush[i].player 				=	3
		ArmyAmbush[i].id					=	3+i
		ArmyAmbush[i].strength				=	3
		if CP_Difficulty == 1 then
			ArmyAmbush[i].strength = ArmyAmbush[i].strength + 2
		end
		ArmyAmbush[i].position				=	GetPosition("ArmyAmbush"..i)
		ArmyAmbush[i].rodeLength			=	500
		ArmyAmbush[i].beAgressive			=	true
		
		ArmyAmbush[i].retreatStrength		=	0
		ArmyAmbush[i].baseDefenseRange		=	500
		ArmyAmbush[i].outerDefenseRange		=	500
		ArmyAmbush[i].AttackAllowed			=	false

		SetupArmy(ArmyAmbush[i])
		
		local troopDescription = {
		
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}	

		if CP_Difficulty == 1 then
			troopDescription.experiencePoints = troopDescription.experiencePoints + 1
			troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
			EnlargeArmy(ArmyAmbush[i],troopDescription)
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
			EnlargeArmy(ArmyAmbush[i],troopDescription)
		end		
		
		troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		EnlargeArmy(ArmyAmbush[i],troopDescription)
		EnlargeArmy(ArmyAmbush[i],troopDescription)
	
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyAmbush[i],troopDescription)

	end

	StartSimpleJob("ControlArmyAmbush")

	AmbushQuest				=	{}
	AmbushQuest.Serfs		=	true
	AmbushQuest.Heroes		=	true
	AmbushQuest.Leaders		=	true
	AmbushQuest.TargetName	=	"Ambush"
	AmbushQuest.Distance	=	2000
	AmbushQuest.Callback	=	StartAmbush

	SetupExpedition(AmbushQuest)

end

function StartAmbush()

 	ArmyAmbush[1].AttackAllowed = true 
	ArmyAmbush[2].AttackAllowed = true
	
	-- Extend range of big armies
	ArmyBig1ExtendRange()
	ArmyBig2ExtendRange()
	
end

function ControlArmyAmbush()

	if Counter.Tick2("ControlArmyAmbush", 10) then
	
		if IsDead(ArmyAmbush[1]) and IsDead(ArmyAmbush[2]) then
			return true
		end
		
		for i=1,2 do	
			TickOffensiveAIController(ArmyAmbush[i])
		end
		
	end
end