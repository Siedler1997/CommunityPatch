------------------------------------------------------------------------------------------------------------------------------------
function createArmyAlarm1()

	armyAlarm1 = {}

	troopsArmyAlarm1 = { }
    
    local RandomPoint = GetRandom(1,4)
    
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAlarm1, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyAlarm1, Entities.CU_BanditLeaderSword1)
		table.insert(troopsArmyAlarm1, Entities.CU_BanditLeaderBow1)
		table.insert(troopsArmyAlarm1, Entities.PV_Cannon1)
    else
		table.insert(troopsArmyAlarm1, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyAlarm1, Entities.CU_BanditLeaderSword2)
		table.insert(troopsArmyAlarm1, Entities.CU_BanditLeaderBow2)
		if CP_Difficulty == 1 then
			table.insert(troopsArmyAlarm1, Entities.PV_Cannon2)
		else
			table.insert(troopsArmyAlarm1, Entities.PV_Cannon3)
		end
	end

    createArmy(2,8,armyAlarm1,7,"spawnAlarm"..RandomPoint,CP_Difficulty,troopsArmyAlarm1)

	StartSimpleJob("controlArmyAlarm1")

    end
    
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAlarm1()
	Advance(armyAlarm1)
end