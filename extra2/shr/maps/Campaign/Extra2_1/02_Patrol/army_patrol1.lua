------------------------------------------------------------------------------------------------------------------------------------
function createArmyPatrol1()

	armyPatrol1 = {}

	troopsArmyPatrol1 = { }

	local strenghth = 4 + CP_Difficulty
	if CP_Difficulty < 2 then
		table.insert(troopsArmyPatrol1, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyPatrol1, Entities.CU_BanditLeaderSword1)
		table.insert(troopsArmyPatrol1, Entities.CU_BanditLeaderBow1)
		table.insert(troopsArmyPatrol1, Entities.PV_Cannon1)
	else
		table.insert(troopsArmyPatrol1, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyPatrol1, Entities.CU_BanditLeaderSword2)
		table.insert(troopsArmyPatrol1, Entities.CU_BanditLeaderBow2)
		table.insert(troopsArmyPatrol1, Entities.PV_Cannon3a)
	end

    createArmy(2,2,armyPatrol1,strenghth,"armyPatrol1",CP_Difficulty,troopsArmyPatrol1)

    armyPatrol1.rodeLength = 500

--	StartSimpleJob("controlArmyPatrol1")
	Patrol1JobId = StartSimpleJob("controlArmyPatrol1")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyPatrol1()
	simpleDefendBehaviour(armyPatrol1)
end