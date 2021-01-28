------------------------------------------------------------------------------------------------------------------------------------
function createArmyBlockade()

	armyBlockade = {}

	troopsArmyBlockade = {
    	Entities.CU_BanditLeaderBow1,
    	Entities.CU_BanditLeaderBow1
    	}

	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyBlockade, Entities.CU_Barbarian_LeaderClub1)
    else
		experience = experience + 2
		table.insert(troopsArmyBlockade, Entities.CU_Barbarian_LeaderClub2)
	end

    createArmy(2,1,armyBlockade,7,"armyBlockade",experience,troopsArmyBlockade)

    armyBlockade.rodeLength = 1000

    StartSimpleJob("controlArmyDefender")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyDefender()
	simpleDefendBehaviour(armyBlockade)
end