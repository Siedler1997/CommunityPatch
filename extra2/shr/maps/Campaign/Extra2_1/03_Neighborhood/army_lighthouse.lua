------------------------------------------------------------------------------------------------------------------------------------
function createArmyLighthouse()

	armyLighthouse = {}

	troopsArmyLighthouse = {
    	Entities.CU_Barbarian_LeaderClub1
    	}
        
    createArmy(2,1,armyLighthouse,2,"armyLighthouse",CP_Difficulty,troopsArmyLighthouse)

    armyLighthouse.rodeLength = 2000

    StartSimpleJob("controlArmyLighthouse")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyLighthouse()
	Advance(armyLighthouse)
end