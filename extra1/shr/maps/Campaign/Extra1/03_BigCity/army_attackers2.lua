MAX_ATTACKER_SPAWN_COUNT = 4

ARMY_ATTACKERS2_ARMY_COUNT = 4

function CreateArmyAttackers2()

	-- Init army
	ArmyAttackers2			= {}
		
	local i
	for i=1,ARMY_ATTACKERS2_ARMY_COUNT do
		
		ArmyAttackers2[i]				=	{}
		ArmyAttackers2[i].player 		=	4
		ArmyAttackers2[i].id			=	4+i
		ArmyAttackers2[i].strength		=	8
		ArmyAttackers2[i].position		=	GetPosition("EnemySpawn1")
		ArmyAttackers2[i].rodeLength	=	500
		ArmyAttackers2[i].spawnCount	=	0
		ArmyAttackers2[i].delay			=	(i*3)+3*60 + GetRandom(5*60)
	
		SetupArmy(ArmyAttackers2[i])
	
	end

	StartSimpleJob("ControlAttackers2")
	StartSimpleJob("ShowArmyAttackers2QuestInformation")
	
end

function ShowArmyAttackers2QuestInformation()

	--Activate and Update QuestInformation
	if not IsBriefingActive() then
	
		UpdateAmountOfAttacker2WavesInQuestInformation()
		return true
	
	end

end

function IsArmyAttackers2Dead()

	local isDead = true
	
	local i
	for i=1,ARMY_ATTACKERS2_ARMY_COUNT do
		
		if IsAlive(ArmyAttackers2[i]) or ArmyAttackers2[i].spawnCount < MAX_ATTACKER_SPAWN_COUNT then
			isDead = false
		end
	
	end

	return isDead

end

function ControlAttackers2()

	if IsBriefingActive() then
		return false
	end

	for i=1,ARMY_ATTACKERS2_ARMY_COUNT do
		
		if IsDead(ArmyAttackers2[i]) then
			
			if ArmyAttackers2[i].delay < 0 then
				
				-- Spawn limit reached
				if ArmyAttackers2[i].spawnCount < MAX_ATTACKER_SPAWN_COUNT then
	
					-- set random army position
					local RandomPos 			= GetRandom(1,4)
					ArmyAttackers2[i].position	= GetPosition("EnemySpawn"..RandomPos)
				
					local experience = LOW_EXPERIENCE
					if CP_Difficulty > 0 then
						experience = experience + 2
					end

					local troopDescription = {
				
						maxNumberOfSoldiers	= 16,
						minNumberOfSoldiers	= 0,
						experiencePoints 	= experience,
					}
				
					troopDescription.leaderType = Entities.CU_Evil_LeaderBearman1
					EnlargeArmy(ArmyAttackers2[i],troopDescription)
	
					for j=1,ArmyAttackers2[i].spawnCount do
						
						-- if spawn count is greater than 3
						if j < 4 then
							EnlargeArmy(ArmyAttackers2[i],troopDescription)
						end
						
					end		
			
					troopDescription.leaderType = Entities.CU_Evil_LeaderSkirmisher1
					EnlargeArmy(ArmyAttackers2[i],troopDescription)
	
					for j=1,ArmyAttackers2[i].spawnCount do
						
						-- if spawn count is greater than 3
						if j < 4 then
							EnlargeArmy(ArmyAttackers2[i],troopDescription)
						end
						
					end		
						
					Redeploy(ArmyAttackers2[i], ArmyAttackers2[i].position)
									
					Report("Spawned Army Attackers "..i.." with "..((ArmyAttackers2[i].spawnCount+1)*2).." Leaders")
					
					ArmyAttackers2[i].spawnCount = ArmyAttackers2[i].spawnCount + 1
					ArmyAttackers2[i].delay = 3*60 + GetRandom(2*60)
					
					UpdateAmountOfAttacker2WavesInQuestInformation()					
			
				end
		
			else
			
				ArmyAttackers2[i].delay = ArmyAttackers2[i].delay - 1
			
			end
		
		end
		
	end
	
    if Counter.Tick2("ControlAttackers2",10) then

		for i=1,ARMY_ATTACKERS2_ARMY_COUNT do
	
			Advance(ArmyAttackers2[i])
	
			Report("Next Attack Delay: "..ArmyAttackers2[i].delay)

		end

	end	

	return IsArmyAttackers2Dead()

end

function UpdateAmountOfAttacker2WavesInQuestInformation()

	local ArmyWaveCount = 0
	
	for i=1,ARMY_ATTACKERS2_ARMY_COUNT do
		if ArmyAttackers2[i].spawnCount > ArmyWaveCount then
			ArmyWaveCount = ArmyAttackers2[i].spawnCount
		end
	end
	
	if ArmyWaveCount > 0 and ShowAttacker2QuestInfo == nil then
		GUIQuestTools.StartQuestInformation("Nephilim", "CM02_03_BigCity/QI_armyAttackers2", 1, 1)
		ShowAttacker2QuestInfo = true
	end
	
	GUIQuestTools.UpdateQuestInformationString(ArmyWaveCount .. "/" .. MAX_ATTACKER_SPAWN_COUNT)
	
end

