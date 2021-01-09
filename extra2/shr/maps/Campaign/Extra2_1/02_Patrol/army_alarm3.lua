------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm3()

	armyAlarm3 = {}

	troopsArmyAlarm3 = {
    	Entities.CU_Barbarian_LeaderClub1,
		Entities.CU_AggressiveWolf
    	}
    
	local RandomPoint = GetRandom(4)+1
	
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end

    createArmy(2,0,armyAlarm3,7,"spawnAlarm"..RandomPoint,experience,troopsArmyAlarm3)

	StartSimpleJob("controlArmyAlarm3")

    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm3()
	Advance(armyAlarm3)
end
