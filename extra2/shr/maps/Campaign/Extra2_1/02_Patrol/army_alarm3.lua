------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm3()

	armyAlarm3 = {}

	troopsArmyAlarm3 = {
		Entities.CU_AggressiveWolf_White
    	}
    
	local RandomPoint = GetRandom(1,4)
	
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAlarm3, Entities.CU_Barbarian_LeaderClub1)
	else
		table.insert(troopsArmyAlarm3, Entities.CU_Barbarian_LeaderClub2)
	end

    createArmy(2,0,armyAlarm3,7,"spawnAlarm"..RandomPoint,CP_Difficulty,troopsArmyAlarm3)

	StartSimpleJob("controlArmyAlarm3")

    end

------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm3()
	Advance(armyAlarm3)
end
