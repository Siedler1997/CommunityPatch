------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm2()

	armyAlarm2 = {}

	troopsArmyAlarm2 = {
		Entities.CU_AggressiveWolf_White
    	}
    
    local RandomPoint = GetRandom(1,4)
    
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAlarm2, Entities.CU_Barbarian_LeaderClub1)
	else
		table.insert(troopsArmyAlarm2, Entities.CU_Barbarian_LeaderClub2)
	end

    createArmy(2,9,armyAlarm2,7,"spawnAlarm"..RandomPoint,CP_Difficulty,troopsArmyAlarm2)

	StartSimpleJob("controlArmyAlarm2")
    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm2()
	Advance(armyAlarm2)
end