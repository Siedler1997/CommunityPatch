---------------------------------------------------------------------------------------------
-- Creates a CaravanAttack army for steppe robbers
function CreateArmyCaravanAttack()

	-- Init army
	ArmyCaravanAttack				= {}
		
	ArmyCaravanAttack.player 		= 2
	ArmyCaravanAttack.id			= 5
	ArmyCaravanAttack.strength		= 2
	if CP_Difficulty > 0 then
		ArmyCaravanAttack.strength = ArmyCaravanAttack.strength * 3
	end
	ArmyCaravanAttack.position		= GetPosition("Caravan_WP1")
	ArmyCaravanAttack.rodeLength	= 4000
	ArmyCaravanAttack.workPos		=	{}

	SetupArmy(ArmyCaravanAttack)

	StartSimpleJob("ControlArmyCaravanAttack")

	ArmyCaravanAttack.spawnGeneratorId = StartSimpleJob("ArmyCaravanAttackRandomSpawn")

end
function ControlArmyCaravanAttack()

    if Counter.Tick2("ControlArmyCaravanAttack",10) then
	    
	    if IsAlive(ArmyCaravanAttack) then

			for i=1,3 do
			
				GlobalMissionScripting.GetEntityPosition(GetEntityId("Caravan_WP"..i),ArmyCaravanAttack.workPos)
			
				if Logic.GetPlayerEntitiesInArea(	7,
													Entities.PU_Travelling_Salesman,
													ArmyCaravanAttack.workPos.X,
													ArmyCaravanAttack.workPos.Y,
													4000,
													1) ~= 0 then
					
					ArmyCaravanAttack.position.X = ArmyCaravanAttack.workPos.X
					ArmyCaravanAttack.position.Y = ArmyCaravanAttack.workPos.Y
					
					Redeploy(ArmyCaravanAttack, ArmyCaravanAttack.position)
														
				end
				
			end

	    	Defend(ArmyCaravanAttack)
	    	
	    end

	end
	
end
function ArmyCaravanAttackRandomSpawn()
	local minutes = 7
	local experience = LOW_EXPERIENCE
	if CP_Difficulty > 0 then
		minutes = minutes - 4
		experience = experience + 2
	end
	if IsDead(ArmyCaravanAttack) then

		if Counter.Tick2("ArmyCaravanAttackRandomSpawn", minutes * 60) then
	
			-- set random army position
			local RandomPos 			= GetRandom(1,4)
			ArmyCaravanAttack.position	= GetPosition("P2_RandomSpawn_"..RandomPos)
		
			local troopDescription = {
		
				maxNumberOfSoldiers	= 12,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= experience,
			}
		
			troopDescription.leaderType = Entities.PU_LeaderCavalry2
			EnlargeArmy(ArmyCaravanAttack,troopDescription)
			EnlargeArmy(ArmyCaravanAttack,troopDescription)

			if CP_Difficulty > 0 then
				EnlargeArmy(ArmyCaravanAttack,troopDescription)
				EnlargeArmy(ArmyCaravanAttack,troopDescription)
				troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
				EnlargeArmy(ArmyCaravanAttack,troopDescription)
				EnlargeArmy(ArmyCaravanAttack,troopDescription)
			end
				
			Counter.SetLimit("ArmyCaravanAttackRandomSpawn", (60 * 1)+(GetRandom(1,60)))
	
			ArmyCaravanAttack.delay = 2
	
		end

	end

end
function DestroyArmyCaravanAttack()

	EndJob(ArmyCaravanAttack.spawnGeneratorId)

end