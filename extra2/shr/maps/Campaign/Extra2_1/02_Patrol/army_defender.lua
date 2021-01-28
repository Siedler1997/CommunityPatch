------------------------------------------------------------------------------------------------------------------------------------
function createArmyDefender()

	armyDefender = {}

	troopsArmyDefender = {
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1
    	}
        
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyDefender, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyDefender, Entities.PV_Cannon1)
	else
		experience = experience + 2
		table.insert(troopsArmyDefender, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyDefender, Entities.PV_Cannon3)
	end

    createArmy(2,1,armyDefender,7,"armyDefender",experience,troopsArmyDefender)

    armyDefender.rodeLength = 500

    StartSimpleJob("controlArmyDefender")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyDefender()
	
	simpleDefendBehaviour(armyDefender)
	
	if Counter.Tick2("controlArmyDefender", 10) then
		if IsWeak(armyDefender) then
			
			EndJob(Patrol1JobId)
			Redeploy(armyPatrol1,GetPosition("redeploy1"))
			Defend(armyPatrol1)
			EndJob(Patrol2JobId)
			Redeploy(armyPatrol2,GetPosition("redeploy2"))
			Defend(armyPatrol2)
			
			createArmyReplenishment()
			
			return true
		end
	end
end