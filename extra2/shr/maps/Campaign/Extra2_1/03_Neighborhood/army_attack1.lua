------------------------------------------------------------------------------------------------------------------------------------
function createArmyAttack1()

	armyAttack1 = {}

	troopsArmyAttack1 = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1,
    	Entities.PV_Cannon1
    	}
        
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
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