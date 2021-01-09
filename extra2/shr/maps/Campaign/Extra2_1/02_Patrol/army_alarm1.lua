------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm1()

	armyAlarm1 = {}

	troopsArmyAlarm1 = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1,
    	Entities.PV_Cannon1
    	}
    
    local RandomPoint = GetRandom(2)+3
    
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end

    createArmy(2,8,armyAlarm1,7,"spawnAlarm"..RandomPoint,experience,troopsArmyAlarm1)

	StartSimpleJob("controlArmyAlarm1")

    end
    
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm1()
	Advance(armyAlarm1)
end