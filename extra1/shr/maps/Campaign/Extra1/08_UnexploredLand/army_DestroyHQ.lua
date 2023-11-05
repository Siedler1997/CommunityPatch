function CreateArmyDestroyHQ(_index)

	if ArmyDestroyHQ == nil then
		
		ArmyDestroyHQ =	{}

		StartSimpleJob("ArmyDestroyHQControl")
	
	end
	
	ArmyDestroyHQ[_index] 					= {}
	ArmyDestroyHQ[_index].player 			=	2
	-- id 1 - 4 used
	ArmyDestroyHQ[_index].id				= 	6+_index
	if CP_Difficulty == 0 then
		ArmyDestroyHQ[_index].strength			=	2+GetRandom(0,1)
	elseif CP_Difficulty == 1 then
		ArmyDestroyHQ[_index].strength			=	4
	else
		ArmyDestroyHQ[_index].strength			=	6
	end
	ArmyDestroyHQ[_index].position			=	GetPosition("HQ".._index.."EnemyPos")
	ArmyDestroyHQ[_index].rodeLength		=	4000
	ArmyDestroyHQ[_index].retreatStrength	=	0
	ArmyDestroyHQ[_index].baseDefenseRange	=	4000
	ArmyDestroyHQ[_index].outerDefenseRange	=	4000
	ArmyDestroyHQ[_index].AttackAllowed		=	false
	ArmyDestroyHQ[_index].pulse				=	true
	
	SetupArmy(ArmyDestroyHQ[_index])
	
	--	create army
			
	local troopDescription = {
		
		maxNumberOfSoldiers	= 16,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= CP_Difficulty,
	}	

	for i=1,ArmyDestroyHQ[_index].strength do

		if GetRandom(0,1) == 0 then
			troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		else
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		end
	
		EnlargeArmy(ArmyDestroyHQ[_index],troopDescription)
	
	end

end

function ArmyDestroyHQControl()

	if Counter.Tick2("ArmyDestroyHQControl",10) then
		
		local allDead = true
		
		for i=1,3 do
			
			if ArmyDestroyHQ[i] ~= nil and IsAlive(ArmyDestroyHQ[i]) then
				
				TickOffensiveAIController(ArmyDestroyHQ[i])
				allDead = false
				
			end
			
		end
		
		return allDead
		
	end

end