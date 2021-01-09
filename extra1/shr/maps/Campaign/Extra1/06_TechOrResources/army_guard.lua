------------------------------------------------------------------------------------------------------------------------------------
function createGuardArmies()

	armySeven = {}

	troopsGuard = {
    	Entities.PU_LeaderBow4,
    	Entities.PU_LeaderBow4,
    	Entities.PU_LeaderBow4,
    	Entities.PV_Cannon3
    	}

    
	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 1
		table.insert(troopsGuard, Entities.PU_LeaderRifle2)
	end

    createArmy(7,7,armySeven,8,"guards",experience,troopsGuard)

    armySeven.rodeLength = 500

    StartSimpleJob("controlArmySeven")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmySeven()

    simpleDefendBehaviour(armySeven)

    end
