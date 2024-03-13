function CreateArmyEastVillageAttack()

	--use army 7-9

	-- Init army
	ArmyEastVillageAttack				= 	{}
	ArmyEastVillageAttack.spawnIndex	=	1
	ArmyEastVillageAttack.wait1			=	10*60
	ArmyEastVillageAttack.wait2			=	10*60

	ArmyEastVillageAttack.respawn		=	true

	CreateArmyEastVillageAttackByIndex(ArmyEastVillageAttack.spawnIndex)
	ArmyEastVillageAttack.spawnIndex = ArmyEastVillageAttack.spawnIndex + 1
					
		
	-- don't spawn all at same time
	StartSimpleJob("ControlArmyEastVillageAttack")
	StartSimpleJob("SpawnArmyEastVillageAttack")
	
end
		
function CreateArmyEastVillageAttackByIndex(_index)

	if _index>=4 then
		return
	end
	

	ArmyEastVillageAttack[_index]					=	{}
	ArmyEastVillageAttack[_index].player 			=	2
	ArmyEastVillageAttack[_index].id				=	6+_index
	ArmyEastVillageAttack[_index].strength			=	_index*2
	ArmyEastVillageAttack[_index].position			=	GetPosition("P2_Army_SouthEast_SpawnPoint")
	ArmyEastVillageAttack[_index].rodeLength		=	2000
	ArmyEastVillageAttack[_index].beAgressive		=	true
	
	SetupArmy(ArmyEastVillageAttack[_index])

	
	local troopDescription = {

		maxNumberOfSoldiers	= 16,
		minNumberOfSoldiers	= 0,
		experiencePoints 	= CP_Difficulty,
	}

	troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
	for i=1,_index do
		EnlargeArmy(ArmyEastVillageAttack[_index],troopDescription)
	end
	
	troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
	for i=1,_index do
		EnlargeArmy(ArmyEastVillageAttack[_index],troopDescription)
	end
					
end

function StopArmyEastVillageAttackRespawn()

	ArmyEastVillageAttack.respawn 	=	false

end

function IsArmyEastVillageAttackDead()

	if ArmyEastVillageAttack.spawnIndex < 4 or ArmyEastVillageAttack.respawn == true then
		return false
	end

	local isDead = true
		
	local i
	for i=1,3 do
		
		if IsAlive(ArmyEastVillageAttack[i]) then
			isDead = false
		end
	
	end

	return isDead

end

function SpawnArmyEastVillageAttack()

	if IsBriefingActive() or IsCutsceneActive() then
		return false
	end

	if ArmyEastVillageAttack.wait1 < 0 then
		
		if ArmyEastVillageAttack.wait2 == 0 then
			
			if AI.Army_SearchClosestEnemy(	ArmyEastVillageAttack[1].player,
											ArmyEastVillageAttack[1].id,
											ArmyEastVillageAttack[1].position.X,
											ArmyEastVillageAttack[1].position.Y,
											25000) ~= 0 then		

				CreateArmyEastVillageAttackByIndex(ArmyEastVillageAttack.spawnIndex)
				ArmyEastVillageAttack.spawnIndex = ArmyEastVillageAttack.spawnIndex + 1
	
			end
			
			return true
								
		else

			ArmyEastVillageAttack.wait2 = ArmyEastVillageAttack.wait2 - 1
			
		end
	
	elseif ArmyEastVillageAttack.wait1 == 0 then
		
		if AI.Army_SearchClosestEnemy(	ArmyEastVillageAttack[1].player,
										ArmyEastVillageAttack[1].id,
										ArmyEastVillageAttack[1].position.X,
										ArmyEastVillageAttack[1].position.Y,
										25000) ~= 0 then		
												
			CreateArmyEastVillageAttackByIndex(ArmyEastVillageAttack.spawnIndex)
			ArmyEastVillageAttack.spawnIndex = ArmyEastVillageAttack.spawnIndex + 1
		
			ArmyEastVillageAttack.wait1 = ArmyEastVillageAttack.wait1 - 1
			
		end


	else
	
		ArmyEastVillageAttack.wait1 = ArmyEastVillageAttack.wait1 - 1

	end
	
end

function ControlArmyEastVillageAttack()

	if IsBriefingActive() or IsCutsceneActive()  then

		return false

	elseif IsArmyEastVillageAttackDead() then

		return true

	end
	
    if Counter.Tick2("ControlArmyEastVillageAttack",2) then

		for i=1,3 do
			
			if ArmyEastVillageAttack[i] ~= nil then
				
				if 	i == 3 and 
					IsDead(ArmyEastVillageAttack[i]) and 
					ArmyEastVillageAttack.respawn == true then
				
					CreateArmyEastVillageAttackByIndex(i)
								
				else
				
					Advance(ArmyEastVillageAttack[i])
					
				end
				
			end
			
		end

	end	

end