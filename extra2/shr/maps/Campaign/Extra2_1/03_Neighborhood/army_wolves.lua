function createArmyWolves()

	armyWolves = {}

	troopsArmyWolves = {
		Entities.CU_AggressiveWolf_White
    	}
		
    createArmy(2,2,armyWolves,7,"armySpawn1",CP_Difficulty,troopsArmyWolves)

	StartSimpleJob("controlArmyWolves")

    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyWolves()
	Advance(armyWolves)
end