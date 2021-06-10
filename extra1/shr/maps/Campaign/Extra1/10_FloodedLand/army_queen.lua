function CreateArmyQueen()

	-- Init armies
	ArmyQueen								= {}
		       
	for i=1,2 do
		                    		
		ArmyQueen[i]						=	{}
		ArmyQueen[i].player 				=	4
		ArmyQueen[i].id						=	1+i
		ArmyQueen[i].strength				=	6
		if CP_Difficulty > 0 then
			ArmyQueen[i].strength = ArmyQueen[i].strength + 2
		end
		ArmyQueen[i].position				=	GetPosition("Queen")
		ArmyQueen[i].rodeLength				=	800
		ArmyQueen[i].retreatStrength		=	0
		ArmyQueen[i].baseDefenseRange		=	4000
		ArmyQueen[i].outerDefenseRange		=	4000
		ArmyQueen[i].AttackAllowed			=	true

		SetupArmy(ArmyQueen[i])

		local troopDescription = {
		
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= HIGH_EXPERIENCE,
		}	
		if CP_Difficulty > 0 then
			troopDescription.experiencePoints = troopDescription.experiencePoints + 1
			troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
			EnlargeArmy(ArmyQueen[i],troopDescription)
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
			EnlargeArmy(ArmyQueen[i],troopDescription)
		end			
		
		troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		EnlargeArmy(ArmyQueen[i],troopDescription)
		EnlargeArmy(ArmyQueen[i],troopDescription)
		EnlargeArmy(ArmyQueen[i],troopDescription)
	
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyQueen[i],troopDescription)
		EnlargeArmy(ArmyQueen[i],troopDescription)
		EnlargeArmy(ArmyQueen[i],troopDescription)

	end

	-- Create Queen
	CreateEntity(4, Entities.CU_Evil_Queen, GetPosition("Queen"), "QueenNPC")
	--make her inculnerable until here troops die
	MakeInvulnerable("QueenNPC")
	
	AI.Entity_ConnectUnemployedLeaderToArmy(ArmyQueen[1].player, ArmyQueen[1].id, 1)

	StartSimpleJob("ControlArmyQueen")

end

function ControlArmyQueen()

	if IsBriefingActive() or IsCutsceneActive() then
		return false
	end

	if Counter.Tick2("ControlArmyQueen", 10) then
	
		--try to use special ability
		GUI.SettlerCircularAttack(GetID("QueenNPC"))
		Sound.PlayGUISound(Sounds.AOVoicesHero12_HERO12_poisonrange_rnd_02)
	
		if IsDead(ArmyQueen[1]) and IsDead(ArmyQueen[2]) then			
			return true
		end
		
		
		--Make Evil Queen  vulnerable when she is the last leader
		if GetNumberOfLeaders(ArmyQueen[1]) == 1 
		and IsDead(ArmyQueen[2]) then		
			MakeVulnerable ("QueenNPC")
		end
		
	
		for i=1,2 do	
			TickOffensiveAIController(ArmyQueen[i])
		end
		
	end
	
	
end