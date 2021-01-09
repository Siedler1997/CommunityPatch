function CreateArmyAttackers()

	-- Init army
	ArmyAttackers				= {}

	CreateArmyAttackersEx(1,"P2_Army_West_SpawnPoint")
	CreateArmyAttackersEx(2,"P2_Army_South_SpawnPoint1")
	CreateArmyAttackersEx(3,"P2_Army_South_SpawnPoint2")
	CreateArmyAttackersEx(4,"P2_Army_SouthEast_SpawnPoint")

	-- don't spawn all at same time
	StartSimpleJob("ControlArmyAttackers")

end

function CreateArmyAttackersEx(_Index,_Pos)

	ArmyAttackers[_Index]				=	{}
	ArmyAttackers[_Index].player 		=	5
	ArmyAttackers[_Index].id			=	1+_Index
	ArmyAttackers[_Index].position		=	GetPosition(_Pos)
	ArmyAttackers[_Index].strength		=	4
	ArmyAttackers[_Index].rodeLength	=	2000
	ArmyAttackers[_Index].respawnCount	=	0
	ArmyAttackers[_Index].beAgressive	=	true

	if CP_Difficulty == 1 then
		ArmyAttackers[_Index].strength = ArmyAttackers[_Index].strength * 1.5
	end
	
	SetupArmy(ArmyAttackers[_Index])
		
end

function SpawnAllArmyAttackers()

	for i=1,4 do

		if AI.Army_SearchClosestEnemy(	ArmyAttackers[i].player,
										ArmyAttackers[i].id,
										ArmyAttackers[i].position.X,
										ArmyAttackers[i].position.Y,
										26000) ~= 0 then
		
			ArmyAttackers[i].respawnCount = ArmyAttackers[i].respawnCount + 1
		
		end
		
	end

end
		
function SpawnArmyAttackers(_index)

	local troopDescription = {

		maxNumberOfSoldiers	= 16,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
	}

	if CP_Difficulty == 1 then
		troopDescription.experiencePoints = troopDescription.experiencePoints + 1
	end	

	troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	if CP_Difficulty == 1 then
		EnlargeArmy(ArmyAttackers[_index],troopDescription)
	end

	troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	EnlargeArmy(ArmyAttackers[_index],troopDescription)
	if CP_Difficulty == 1 then
		EnlargeArmy(ArmyAttackers[_index],troopDescription)
	end
					
end

function IsArmyAttackersDead()

	for i=1,4 do
		
		if IsAlive(ArmyAttackers[i]) or ArmyAttackers[i].respawnCount > 0 then
			return false
		end
		
	end

	return true

end


function ControlArmyAttackers()

    if Counter.Tick2("ControlArmyAttackers",3) then

		local armySpawned = false
		
		for i=1,4 do
			
			if IsAlive(ArmyAttackers[i]) then
			
				if Counter.Tick2("ControlArmyAttackers"..i,15) then
			
					Retreat(ArmyAttackers[i])
			
				else
					
					FrontalAttack(ArmyAttackers[i])
						
				end

			elseif armySpawned == false and IsDead(ArmyAttackers[i]) and ArmyAttackers[i].respawnCount > 0 then
				
				armySpawned = true
			
				SpawnArmyAttackers(i)
				
				ArmyAttackers[i].respawnCount = ArmyAttackers[i].respawnCount - 1
				
				Redeploy(ArmyAttackers[i], ArmyAttackers[i].position)
				
			end
						
		end

	end	

end