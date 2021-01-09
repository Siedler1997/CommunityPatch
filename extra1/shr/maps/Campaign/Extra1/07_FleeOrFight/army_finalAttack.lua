
function CreateArmyFinalAttack()

	-- Spawn also from outer points
	ArmyFinalAttack						= 	{}
	ArmyFinalAttack.spawnwait			=	3*60
	ArmyFinalAttack.spawnIndex			=	1
		
	StartSimpleJob("CreateArmyFinalAttackJob")
	
end

function CreateArmyFinalAttackByIndex(_index)
		
		ArmyFinalAttack[_index]				=	{}
		ArmyFinalAttack[_index].player 		=	5
		ArmyFinalAttack[_index].id			=	5+_index
		ArmyFinalAttack[_index].strength	=	4
		if CP_Difficulty == 1 then
			ArmyFinalAttack[_index].strength = ArmyFinalAttack[_index].strength * 2
		end
		ArmyFinalAttack[_index].beAgressive	=	true
		
		assert(_index<=3)
		
		if _index == 1 then

			ArmyFinalAttack[_index].position	=	GetPosition("P2_Army_RuinIsle_SpawnPoint")
			
		elseif _index >= 2 then
			
			ArmyFinalAttack[_index].position	=	GetPosition("P2_Army_MerchantIsle_SpawnPoint".._index-1)

		end
		
		ArmyFinalAttack[_index].rodeLength	=	3000
	
		SetupArmy(ArmyFinalAttack[_index])

		local troopDescription = {
	
			maxNumberOfSoldiers	= 16,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= HIGH_EXPERIENCE,
		}
		if CP_Difficulty == 1 then
			troopDescription.experiencePoints = troopDescription.experiencePoints + 1
		end
		for k = 1, (CP_Difficulty+1) do
			troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
			EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
			EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
			troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
			EnlargeArmy(ArmyFinalAttack[_index],troopDescription)
		end

end

function CreateArmyFinalAttackJob()

	ArmyFinalAttack.spawnwait = ArmyFinalAttack.spawnwait - 1
	if ArmyFinalAttack.spawnwait > 0 then
		
		return false
		
	elseif ArmyFinalAttack.spawnwait == 0 then
	
		-- Start attacking from main points 2 waves
		SpawnAllArmyAttackers()
		
	end


	if ArmyFinalAttack.spawnIndex > 3 then
	
		StartSimpleJob("ControlFinalAttack")
		return true
	end
	
	CreateArmyFinalAttackByIndex(ArmyFinalAttack.spawnIndex)
	ArmyFinalAttack.spawnIndex = ArmyFinalAttack.spawnIndex + 1
	
end

function IsArmyFinalAttackDead()

	if not IsArmyAttackersDead() or not IsFirstAttackDead() then
		return false
	end
	
	local i
	for i=1,3 do
	
		if ArmyFinalAttack[i] == nil or IsAlive(ArmyFinalAttack[i]) then
			return false
		end
		
	end

	return true

end

function ControlFinalAttack()

    if Counter.Tick2("ControlFinalAttack",3) then

		local i
		for i=1,3 do

			if ArmyFinalAttack[i] ~= nil then
				
				if Counter.Tick2("ControlFinalAttack"..i,15) then
				
					Retreat(ArmyFinalAttack[i])
					
				else
					
					FrontalAttack(ArmyFinalAttack[i])
										
				end
				
			end
				
		end

	end	

end