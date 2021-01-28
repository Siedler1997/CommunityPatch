------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm1()

	armyAlarm1 = {}

	troopsArmyAlarm1 = {
    	Entities.CU_BanditLeaderSword2,
    	Entities.CU_BanditLeaderBow1
    	}
    
    local RandomPoint = GetRandom(2)+3
    
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAlarm1, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyAlarm1, Entities.PV_Cannon1)
    else
		experience = experience + 2
		table.insert(troopsArmyAlarm1, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyAlarm1, Entities.PV_Cannon2)
	end

    createArmy(2,8,armyAlarm1,7,"spawnAlarm"..RandomPoint,experience,troopsArmyAlarm1)

	StartSimpleJob("controlArmyAlarm1")

    end
    
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm1()
	Advance(armyAlarm1)
end