------------------------------------------------------------------------------------------------------------------------------------
function createArmyDefender()

	armyDefender = {}

	troopsArmyDefender = { }
        
	if CP_Difficulty == 0 then
		table.insert(troopsArmyDefender, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyDefender, Entities.CU_BanditLeaderSword1)
		table.insert(troopsArmyDefender, Entities.CU_BanditLeaderBow1)
		table.insert(troopsArmyDefender, Entities.PV_Cannon1)
	else
		table.insert(troopsArmyDefender, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyDefender, Entities.CU_BanditLeaderSword2)
		table.insert(troopsArmyDefender, Entities.CU_BanditLeaderBow2)
		if CP_Difficulty == 1 then
			table.insert(troopsArmyDefender, Entities.PV_Cannon2)
		else
			table.insert(troopsArmyDefender, Entities.PV_Cannon3)
		end
	end

    createArmy(2,1,armyDefender,7,"armyDefender",CP_Difficulty,troopsArmyDefender)

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