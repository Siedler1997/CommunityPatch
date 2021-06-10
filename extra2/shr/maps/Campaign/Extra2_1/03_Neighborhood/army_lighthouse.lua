------------------------------------------------------------------------------------------------------------------------------------
function createArmyLighthouse()

	armyLighthouse = {}

	troopsArmyLighthouse = {
    	Entities.CU_Barbarian_LeaderClub1
    	}
        
	local experience = LOW_EXPERIENCE
	if CP_Difficulty > 0 then
		experience = experience + 2
	end
    createArmy(2,1,armyLighthouse,2,"armyLighthouse",experience,troopsArmyLighthouse)

    armyLighthouse.rodeLength = 2000

    StartSimpleJob("controlArmyLighthouse")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyLighthouse()
	Advance(armyLighthouse)
end