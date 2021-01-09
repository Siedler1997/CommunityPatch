------------------------------------------------------------------------------------------------------------------------------------
function createArmyAmbush1()

	armyAmbush1 = {}

	troopsArmyAmbush1 = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1,
    	Entities.PV_Cannon1
    	}
        
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end

    createArmy(2,4,armyAmbush1,7,"armyAmbush1",experience,troopsArmyAmbush1)

    armyAmbush1.rodeLength = 500

--	StartSimpleJob("controlArmyAmbush1")
	Ambush1JobId = StartSimpleJob("controlArmyAmbush1")
	
    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyAmbush1()
	simpleDefendBehaviour(armyAmbush1)
end