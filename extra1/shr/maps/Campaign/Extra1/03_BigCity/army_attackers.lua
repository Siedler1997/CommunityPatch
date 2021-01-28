function CreateArmyAttackers()

	-- Init army
	ArmyAttackers				= {}
	ArmyAttackers.spawnIndex	=	1
	ArmyAttackers.wait			=	40
	ArmyAttackers.retreat		=	300

	CreateArmyAttackersByIndex(ArmyAttackers.spawnIndex)
	ArmyAttackers.spawnIndex = ArmyAttackers.spawnIndex + 1
	
	-- don't spawn all at same time
	StartSimpleJob("CreateArmyAttackersJob")

end
		
function CreateArmyAttackersByIndex(_index)

	ArmyAttackers[_index]					=	{}
	ArmyAttackers[_index].player 			=	4
	ArmyAttackers[_index].id				=	4+_index
	ArmyAttackers[_index].strength			=	8
	ArmyAttackers[_index].position			=	GetPosition("EnemySpawn1")
	ArmyAttackers[_index].rodeLength		=	2000
	
	ArmyAttackers[_index].retreatStrength	=	0
	ArmyAttackers[_index].baseDefenseRange	=	3000
	ArmyAttackers[_index].outerDefenseRange	=	3000
	ArmyAttackers[_index].pulse				=	false
	ArmyAttackers[_index].AttackAllowed		=	false

	SetupArmy(ArmyAttackers[_index])
	
	local soldiers = 12
	local experience = LOW_EXPERIENCE
	if CP_Difficulty == 1 then
		soldiers = soldiers + 4
		experience = experience + 2
	end
	
	local troopDescription = {

		maxNumberOfSoldiers	= soldiers,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= experience,
	}

	troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)

	troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	
					
end



function CreateArmyAttackersJob()

	if ArmyAttackers.spawnIndex > 4 then
	
		StartSimpleJob("ControlAttackers")
		return true
	end
	
	CreateArmyAttackersByIndex(ArmyAttackers.spawnIndex)
	ArmyAttackers.spawnIndex = ArmyAttackers.spawnIndex + 1
	
end

function IsArmyAttackersDead()

	local isDead = true
	
	local i
	for i=1,3 do
		
		if IsAlive(ArmyAttackers[i]) or ArmyAttackers[i] == nil then
			isDead = false
		end
	
	end

	return isDead

end

function ControlAttackers()

	ArmyAttackers.wait = ArmyAttackers.wait - 1

	if IsBriefingActive() or ArmyAttackers.wait > 0 then

		for i=1,4 do
			TickOffensiveAIController(ArmyAttackers[i])
		end

		return false
	end

	local isDead = true
	
	local i
	for i=1,3 do
		
		if IsAlive(ArmyAttackers[i]) then
			isDead = false
		end
	
	end
	

	if isDead then
		-- Army attackers 2 continues with attacking
		return true
	end
	
	
    if Counter.Tick2("ControlAttackers",10) then

		for i=1,4 do

			if ArmyAttackers.retreat < 0 then

				if ArmyAttackers[i].retreating ~= true then
					
					ArmyAttackers[i].position 	= 	GetPosition("EnemySpawn1")
					ArmyAttackers[i].pulse		=	false
					
					ArmyAttackers[i].retreating = 	true
										
					ResetOffensiveAIController(ArmyAttackers[i])
															
					Report("ArmyAttackers"..i.." retreat")
															
				end
		
				-- Get bear man leader
				
				local count, id = Logic.GetPlayerEntities(4, Entities.CU_Evil_LeaderBearman1, 1)
				Tools.RemoveEntityInFog(1, id)
				
				-- Get bow man leader
				
				count, id = Logic.GetPlayerEntities(4, Entities.CU_Evil_LeaderSkirmisher1, 1)
				Tools.RemoveEntityInFog(1, id)
				
			else

				if ArmyAttackers[i].redeployed ~= true then
	
					ArmyAttackers[i].position 	= 	GetPosition("IronMinePos")
					ArmyAttackers[i].pulse		=	true
					
					ArmyAttackers[i].redeployed = 	true
	
					ResetOffensiveAIController(ArmyAttackers[i])
	
					Report("ArmyAttackers"..i.." start attacking")
	
				end				

			end

			TickOffensiveAIController(ArmyAttackers[i])
		end

	end	

	ArmyAttackers.retreat = ArmyAttackers.retreat -1

end