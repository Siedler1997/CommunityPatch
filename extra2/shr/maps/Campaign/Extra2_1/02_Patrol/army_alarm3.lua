------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm3()

	armyAlarm3 = {}

	troopsArmyAlarm3 = {
		Entities.CU_AggressiveWolf
    	}
    
	local RandomPoint = GetRandom(4)+1
	
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAlarm3, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 2
		table.insert(troopsArmyAlarm3, Entities.CU_Barbarian_LeaderClub2)
	end

    createArmy(2,0,armyAlarm3,7,"spawnAlarm"..RandomPoint,experience,troopsArmyAlarm3)

	StartSimpleJob("controlArmyAlarm3")

    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm3()
	Advance(armyAlarm3)
end
