------------------------------------------------------------------------------------------------------------------------------------
function createArmyPatrol2()

	armyPatrol2 = {}

	troopsArmyPatrol2 = { }

	if CP_Difficulty < 2 then
		table.insert(troopsArmyPatrol2, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyPatrol2, Entities.CU_BanditLeaderSword1)
		table.insert(troopsArmyPatrol2, Entities.CU_BanditLeaderBow1)
		table.insert(troopsArmyPatrol2, Entities.PV_Cannon1)
	else
		table.insert(troopsArmyPatrol2, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyPatrol2, Entities.CU_BanditLeaderSword2)
		table.insert(troopsArmyPatrol2, Entities.CU_BanditLeaderBow2)
		table.insert(troopsArmyPatrol2, Entities.PV_Cannon3a)
	end

    createArmy(2,3,armyPatrol2,7,"armyPatrol2",CP_Difficulty,troopsArmyPatrol2)

    armyPatrol2.rodeLength = 500

--	StartSimpleJob("controlArmyPatrol2")
	Patrol2JobId = StartSimpleJob("controlArmyPatrol2")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyPatrol2()
	simpleDefendBehaviour(armyPatrol2)
end