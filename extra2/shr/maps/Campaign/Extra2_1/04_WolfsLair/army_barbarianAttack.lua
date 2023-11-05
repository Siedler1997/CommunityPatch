MAX_SPAWN_COUNT = 1000

ARMY_COUNT = 4

------------------------------------------------------------------------------------------------------------------------------------
function createBarbarianAttack()

	-- Init army
	ArmyBarbarianAttack			= {}
		
	local i
	for i=1,ARMY_COUNT do
		
		ArmyBarbarianAttack[i]				=	{}
		ArmyBarbarianAttack[i].player 		=	2
		ArmyBarbarianAttack[i].id			=	4+i
		ArmyBarbarianAttack[i].strength		=	8
		ArmyBarbarianAttack[i].position		=	GetPosition("armySpawn1")
		ArmyBarbarianAttack[i].rodeLength	=	500
		ArmyBarbarianAttack[i].spawnCount	=	0
		ArmyBarbarianAttack[i].delay		=	(i*3)+2*60 + GetRandom(1*60)
	
		SetupArmy(ArmyBarbarianAttack[i])
	
	end

	StartSimpleJob("ControlBarbarianAttack")
	
--	StartSimpleJob("ShowArmyBarbarianAttackQuestInformation")
	
end

------------------------------------------------------------------------------------------------------------------------------------
function IsArmyBarbarianAttackDead()

	local isDead = true
	
	local i
	for i=1,ARMY_COUNT do
		
		if IsAlive(ArmyBarbarianAttack[i]) or ArmyBarbarianAttack[i].spawnCount < MAX_SPAWN_COUNT then
			isDead = false
		end
	
	end

	return isDead

end

------------------------------------------------------------------------------------------------------------------------------------
function ControlBarbarianAttack()

	if IsBriefingActive() then
		return false
	end

	for i=1,ARMY_COUNT do
		
		if IsDead(ArmyBarbarianAttack[i]) then
			
			if ArmyBarbarianAttack[i].delay < 0 then
				
				-- Spawn limit reached
				if ArmyBarbarianAttack[i].spawnCount < MAX_SPAWN_COUNT then
	
					-- set random army position
					local RandomPos 			= GetRandom(1,4)
					ArmyBarbarianAttack[i].position	= GetPosition("armySpawn"..RandomPos)
				
					local troopDescription = {
				
						maxNumberOfSoldiers	= 9,
						minNumberOfSoldiers	= 0,
						experiencePoints 	= CP_Difficulty,
					}
						
					local troopLeaderType = {}
					
					if CP_Difficulty == 0 then
						troopLeaderType[1] = Entities.CU_Barbarian_LeaderClub1
						troopLeaderType[2] = Entities.CU_BanditLeaderSword1
						troopLeaderType[3] = Entities.CU_BanditLeaderBow1
						troopLeaderType[4] = Entities.PV_Cannon2
					else
						troopLeaderType[1] = Entities.CU_Barbarian_LeaderClub2
						troopLeaderType[2] = Entities.CU_BanditLeaderSword2
						troopLeaderType[3] = Entities.CU_BanditLeaderBow2
						troopLeaderType[4] = Entities.PV_Cannon3
					end

					for j=1,ArmyBarbarianAttack[i].spawnCount do
						
						-- if spawn count is greater than 8
						if j < 9 then
							if IsExisting("towerSpawn"..RandomPos) then
								troopDescription.leaderType = troopLeaderType[GetRandom(1,4)]
								EnlargeArmy(ArmyBarbarianAttack[i],troopDescription)
							end
						end
						
					end
					
					
						
					Redeploy(ArmyBarbarianAttack[i], ArmyBarbarianAttack[i].position)
									
--					Report("Spawned Army Attackers "..i.." with "..((ArmyBarbarianAttack[i].spawnCount+1)*2).." Leaders")
					
					ArmyBarbarianAttack[i].spawnCount = ArmyBarbarianAttack[i].spawnCount + 1
					ArmyBarbarianAttack[i].delay = (i*3)+4*60 + GetRandom(2*60)
			
				end
		
			else
			
				ArmyBarbarianAttack[i].delay = ArmyBarbarianAttack[i].delay - 1
			
			end
		
		end
		
	end
	
    if Counter.Tick2("ControlBarbarianAttack",10) then

		for i=1,ARMY_COUNT do
	
			Advance(ArmyBarbarianAttack[i])
	
--			Report("Next Attack Delay: "..ArmyBarbarianAttack[i].delay)

		end

	end	

	return IsArmyBarbarianAttackDead()

end
