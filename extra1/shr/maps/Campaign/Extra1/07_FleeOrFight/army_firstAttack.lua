
-- attackers at mission start

function CreateArmyFirstAttack()

	armyFirstAttack								=	{}
    armyFirstAttack.startAttackTime				=	5*60
                                    	
	for i=1,6 do
                                    	
		armyFirstAttack[i]						=	{}
		armyFirstAttack[i].player 				=	2
		-- id 1 - 4 used
		armyFirstAttack[i].id					= 	i
		armyFirstAttack[i].strength				=	3
		if CP_Difficulty > 0 then
			armyFirstAttack[i].strength = armyFirstAttack[i].strength * 2
		end

		if i == 1 or i == 6 then
			armyFirstAttack[i].position		=	GetPosition("P2_Army_South_SpawnPoint2")
		elseif i == 4 or i == 5 then
			armyFirstAttack[i].position		=	GetPosition("P2_Army_South_SpawnPoint1")
		else
			armyFirstAttack[i].position		=	GetPosition("P2_Army_West_SpawnPoint")
		end
		
		armyFirstAttack[i].rodeLength			=	2000
		armyFirstAttack[i].beAgressive			=	true
		
		armyFirstAttack[i].retreatStrength		=	0
		armyFirstAttack[i].baseDefenseRange		=	3000
		armyFirstAttack[i].outerDefenseRange	=	3000
		armyFirstAttack[i].AttackAllowed		=	false
		armyFirstAttack[i].pulse				=	false

		
		SetupArmy(armyFirstAttack[i])
		
	--	create army
		local troopDescription = {
		
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		if CP_Difficulty > 0 then
			troopDescription.experiencePoints = troopDescription.experiencePoints + 1
		end	
		for k = 1, (CP_Difficulty+1) do
			troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
			EnlargeArmy(armyFirstAttack[i],troopDescription)
			EnlargeArmy(armyFirstAttack[i],troopDescription)
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
			EnlargeArmy(armyFirstAttack[i],troopDescription)
		end

		-- set new position
		armyFirstAttack[i].position = GetPosition("P2_Army_FirstWave_AttackPoint"..i)		

	end

	StartSimpleJob("ControlFirstAttack")
	
end

function ControlFirstAttack()

	if IsBriefingActive() or IsCutsceneActive() then
		return false
	end

	armyFirstAttack.startAttackTime = armyFirstAttack.startAttackTime - 1

	if armyFirstAttack.startAttackTime < 0 then
		
		for i=1,6 do
			armyFirstAttack[i].AttackAllowed = true
		end
		
	end

	if Counter.Tick2("ControlFirstAttack",2) then

		local allDead = true

		local i                         	
		for i=1,6 do
			
			if IsAlive(armyFirstAttack[i]) then
				TickOffensiveAIController(armyFirstAttack[i])
				allDead = false
			end

		end

		return allDead

	end

end

function IsFirstAttackDead()

	for i=1,6 do
		
		if IsAlive(armyFirstAttack[i]) then
			return false
		end
		
	end	

	return true

end