function createArmyWolves()

	armyWolves = {}

	troopsArmyWolves = {
		Entities.CU_AggressiveWolf
    	}
		
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end
    createArmy(2,2,armyWolves,7,"armySpawn1",experience,troopsArmyWolves)

	StartSimpleJob("controlArmyWolves")

    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyWolves()
	Advance(armyWolves)
end