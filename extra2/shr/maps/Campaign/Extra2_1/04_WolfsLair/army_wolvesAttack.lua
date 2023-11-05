MAX_WOLVES_SPAWN_COUNT = 1000

ARMY_WOLVES_COUNT = 2

BRIEFING_WOLVES = 0

------------------------------------------------------------------------------------------------------------------------------------
function createWolvesAttack()

	-- Init army
	ArmyWolvesAttack			= {}
		
	local iw
	for iw=1,ARMY_WOLVES_COUNT do
		
		ArmyWolvesAttack[iw]				=	{}
		ArmyWolvesAttack[iw].player 		=	7
		ArmyWolvesAttack[iw].id				=	2+iw
		ArmyWolvesAttack[iw].strength		=	8
		ArmyWolvesAttack[iw].position		=	GetPosition("armyWolves1")
		ArmyWolvesAttack[iw].rodeLength		=	500
		ArmyWolvesAttack[iw].spawnCount		=	2
--		ArmyWolvesAttack[iw].delay			=	(iw*3)+1*60 + GetRandom(1*60)
		ArmyWolvesAttack[iw].delay			=	iw
	
		SetupArmy(ArmyWolvesAttack[iw])
	
	end

	StartSimpleJob("ControlWolvesAttack")
--	StartSimpleJob("ShowArmyWolvesAttackQuestInformation")
	
end

------------------------------------------------------------------------------------------------------------------------------------
function IsArmyWolvesAttackDead()

	if ArmyWolvesAttack[1].spawnCount == 7 then
		if BRIEFING_WOLVES == 0 then
			if TOWER_WOLVES == 0 then
				createBriefingWolves()
			end
		end
	end

	local isDead = true
	
	local iw
	for iw=1,ARMY_WOLVES_COUNT do
		
		if IsAlive(ArmyWolvesAttack[iw]) or ArmyWolvesAttack[iw].spawnCount < MAX_WOLVES_SPAWN_COUNT then
			isDead = false
		end
	
	end

	return isDead

end

------------------------------------------------------------------------------------------------------------------------------------
function ControlWolvesAttack()

	if IsBriefingActive() then
		return false
	end

	for iw=1,ARMY_WOLVES_COUNT do
		
		if IsDead(ArmyWolvesAttack[iw]) then
			
			if ArmyWolvesAttack[iw].delay < 0 then
				
				-- Spawn limit reached
				if ArmyWolvesAttack[iw].spawnCount < MAX_WOLVES_SPAWN_COUNT then
	
					-- set random army position
					local RandomPos 			= GetRandom(1,2)
					ArmyWolvesAttack[iw].position	= GetPosition("armyWolves"..RandomPos)
				
					local troopDescription = {
				
						maxNumberOfSoldiers	= 9,
						minNumberOfSoldiers	= 0,
						experiencePoints 	= CP_Difficulty,
					}
				
					troopDescription.leaderType = Entities.CU_AggressiveWolf_Grey

					for k=1,ArmyWolvesAttack[iw].spawnCount do
						
						-- if spawn count is greater than 3
						if k < 9 then
							if IsExisting("towerWolves"..RandomPos) then
								EnlargeArmy(ArmyWolvesAttack[iw],troopDescription)
							end
						end
						
					end
						
					Redeploy(ArmyWolvesAttack[iw], ArmyWolvesAttack[iw].position)
					
					ArmyWolvesAttack[iw].spawnCount = ArmyWolvesAttack[iw].spawnCount + 1
					ArmyWolvesAttack[iw].delay = (iw*3)+6*60 + GetRandom(4*60)
			
				end
		
			else
			
				ArmyWolvesAttack[iw].delay = ArmyWolvesAttack[iw].delay - 1
			
			end
		
		end
		
	end
	
    if Counter.Tick2("ControlWolvesAttack",10) then

		for iw=1,ARMY_WOLVES_COUNT do
	
			Advance(ArmyWolvesAttack[iw])

		end

	end	

	return IsArmyWolvesAttackDead()

end