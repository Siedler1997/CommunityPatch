------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm2()

	armyAlarm2 = {}

	troopsArmyAlarm2 = {
		Entities.CU_AggressiveWolf
    	}
    
    local RandomPoint = GetRandom(2)+2
    
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAlarm2, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 2
		table.insert(troopsArmyAlarm2, Entities.CU_Barbarian_LeaderClub2)
	end

    createArmy(2,9,armyAlarm2,7,"spawnAlarm"..RandomPoint,experience,troopsArmyAlarm2)

	StartSimpleJob("controlArmyAlarm2")
    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm2()
	Advance(armyAlarm2)
end