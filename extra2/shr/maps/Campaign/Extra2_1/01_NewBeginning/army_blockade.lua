------------------------------------------------------------------------------------------------------------------------------------
function createArmyBlockade()

	armyBlockade = {}

	troopsArmyBlockade = { }

	if CP_Difficulty == 0 then
		table.insert(troopsArmyBlockade, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyBlockade, Entities.CU_BanditLeaderBow1)
    else
		table.insert(troopsArmyBlockade, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyBlockade, Entities.CU_BanditLeaderBow2)
	end

    createArmy(2,1,armyBlockade,7,"armyBlockade",CP_Difficulty,troopsArmyBlockade)

    armyBlockade.rodeLength = 1000

    StartSimpleJob("controlArmyDefender")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyDefender()
	simpleDefendBehaviour(armyBlockade)
end