------------------------------------------------------------------------------------------------------------------------------------
function createDefendArmies()

    timeCreateDefendingArmies = 60 * 5

	armyEight = {}
	armyNine = {}

	troopsDefendA = {
        Entities.PU_LeaderHeavyCavalry2,
    	Entities.PU_LeaderSword4,
    	Entities.PU_LeaderPoleArm4,
    	Entities.PU_LeaderBow4,
    	Entities.PV_Cannon3
    	}

	if CP_Difficulty == 0 then
		table.insert(troopsDefendA, Entities.PV_Cannon2)
	else
		table.insert(troopsDefendA, Entities.PV_Cannon4)
		table.insert(troopsDefendA, Entities.PU_LeaderRifle2)
	end

    StartSimpleJob("controlCreateDefendingArmies")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlCreateDefendingArmies()

    if timeCreateDefendingArmies > 0 then
        timeCreateDefendingArmies = timeCreateDefendingArmies -1
        return false
        end

    
	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 1 then
		experience = experience + 1
	end

    createArmy(7,8,armyEight,8,"defendArea1",experience,troopsDefendA)
    StartSimpleJob("controlArmyEight")

    createArmy(7,9,armyNine,8,"defendArea2",experience,troopsDefendA)
    StartSimpleJob("controlArmyNine")

    return true

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyEight()
    simpleDefendBehaviour(armyEight)
    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyNine()
    simpleDefendBehaviour(armyNine)
    end
