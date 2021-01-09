function CreateArmyFinalAttack()

		-- Init army
	ArmyFinalAttack						= 	{}
	ArmyFinalAttack.spawnIndex			=	1
	ArmyFinalAttack.wait				=	30
		
	CreateArmyFinalAttackByIndex(ArmyFinalAttack.spawnIndex)
	ArmyFinalAttack.spawnIndex = ArmyFinalAttack.spawnIndex + 1
	
	StartSimpleJob("CreateArmyFinalAttackJob")
	
end

function CreateArmyFinalAttackByIndex(_index)
		
		ArmyFinalAttack[_index]				=	{}
		ArmyFinalAttack[_index].player 		=	4
		ArmyFinalAttack[_index].id			=	4+_index
		ArmyFinalAttack[_index].strength	=	8
		ArmyFinalAttack[_index].position	=	GetPosition("EnemySpawn".._index)
		ArmyFinalAttack[_index].rodeLength	=	30000--5000
	
		SetupArmy(ArmyFinalAttack[_index])

		local experience = HIGH_EXPERIENCE
		if CP_Difficulty == 1 then
			experience = experience + 1
		end
		local troopDescription = {
	
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}
	
		troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
			
		troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		EnlargeArmy(ArmyFinalAttack[_index],troopDescription)

end

function CreateArmyFinalAttackJob()

	if ArmyFinalAttack.spawnIndex > 4 then
	
		StartSimpleJob("ControlFinalAttack")
		return true
	end
	
	CreateArmyFinalAttackByIndex(ArmyFinalAttack.spawnIndex)
	ArmyFinalAttack.spawnIndex = ArmyFinalAttack.spawnIndex + 1
	
end

function IsArmyFinalAttackDead()

	local i
	for i=1,4 do
	
		if IsAlive(ArmyFinalAttack[i]) or ArmyFinalAttack[i] == nil then
			return false
		end
		
	end

	return true

end

function ControlFinalAttack()

	ArmyFinalAttack.wait = ArmyFinalAttack.wait - 1

	if IsBriefingActive() or ArmyFinalAttack.wait > 0 then
		return false
	end

    if Counter.Tick2("ControlFinalAttack",10) then

		local i
		for i=1,4 do

			Advance(ArmyFinalAttack[i])
		
		end

	end	

end