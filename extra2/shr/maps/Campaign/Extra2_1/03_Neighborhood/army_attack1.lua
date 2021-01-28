------------------------------------------------------------------------------------------------------------------------------------
function createArmyAttack1()

	armyAttack1 = {}

	troopsArmyAttack1 = {
    	Entities.CU_BanditLeaderSword2,
    	Entities.CU_BanditLeaderBow1
    	}
        
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyAttack1, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troopsArmyAttack1, Entities.PV_Cannon1)
	else
		experience = experience + 2
		table.insert(troopsArmyAttack1, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troopsArmyAttack1, Entities.PV_Cannon2)
	end
    createArmy(2,1,armyAttack1,7,"armySpawn1",experience,troopsArmyAttack1)

--	armyAttack1.rodeLength = 500

	StartSimpleJob("controlArmyAttack1")
--	Attack1JobId = StartSimpleJob("controlArmyAttack1")
	
    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAttack1()
	Advance(armyAttack1)
end