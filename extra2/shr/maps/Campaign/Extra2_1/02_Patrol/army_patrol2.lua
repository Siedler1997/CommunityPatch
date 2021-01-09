------------------------------------------------------------------------------------------------------------------------------------
function createArmyPatrol2()

	armyPatrol2 = {}

	troopsArmyPatrol2 = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1,
    	Entities.PV_Cannon1
    	}

	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
	end

    createArmy(2,3,armyPatrol2,7,"armyPatrol2",experience,troopsArmyPatrol2)

    armyPatrol2.rodeLength = 500

--	StartSimpleJob("controlArmyPatrol2")
	Patrol2JobId = StartSimpleJob("controlArmyPatrol2")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyPatrol2()
	simpleDefendBehaviour(armyPatrol2)
end