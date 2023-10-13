------------------------------------------------------------------------------------------------------------------------------------
function createArmyAttack1()

	armyAttack1 = {}

	troopsArmyAttack1 = { }
        
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAttack1, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyAttack1, Entities.CU_BanditLeaderSword1)
		table.insert(troopsArmyAttack1, Entities.CU_BanditLeaderBow1)
		table.insert(troopsArmyAttack1, Entities.PV_Cannon1)
	else
		table.insert(troopsArmyAttack1, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyAttack1, Entities.CU_BanditLeaderSword2)
		table.insert(troopsArmyAttack1, Entities.CU_BanditLeaderBow2)
		if CP_Difficulty == 1 then
			table.insert(troopsArmyAttack1, Entities.PV_Cannon2)
		else
			table.insert(troopsArmyAttack1, Entities.PV_Cannon3)
		end
	end
    createArmy(2,1,armyAttack1,7,"armySpawn1",CP_Difficulty,troopsArmyAttack1)

--	armyAttack1.rodeLength = 500

	StartSimpleJob("controlArmyAttack1")
--	Attack1JobId = StartSimpleJob("controlArmyAttack1")
	
    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAttack1()
	Advance(armyAttack1)
end