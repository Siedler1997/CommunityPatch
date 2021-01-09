------------------------------------------------------------------------------------------------------------------------------------
function createArmyPatrol1()

	armyPatrol1 = {}

	troopsArmyPatrol1 = {
    	Entities.CU_Barbarian_LeaderClub1,
    	Entities.CU_BanditLeaderSword1,
    	Entities.CU_BanditLeaderBow1,
    	Entities.PV_Cannon1
    	}

	local strenghth = 4
	local experience = MEDIUM_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 2
		strenghth = strenghth + 3
	end

    createArmy(2,2,armyPatrol1,strenghth,"armyPatrol1",experience,troopsArmyPatrol1)

    armyPatrol1.rodeLength = 500

--	StartSimpleJob("controlArmyPatrol1")
	Patrol1JobId = StartSimpleJob("controlArmyPatrol1")

    end
------------------------------------------------------------------------------------------------------------------------------------

function controlArmyPatrol1()
	simpleDefendBehaviour(armyPatrol1)
end