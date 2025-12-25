------------------------------------------------------------------------------------------------------------------------------------
function createArmyStone()

	troopsDefender = {
        Entities.CU_Evil_LeaderBearman1,
    	}

	armyStone = {}
    
	if CP_Difficulty == 0 then
        createArmy(2,3,armyStone,4,"army2",CP_Difficulty,troopsDefender,8,2000)
    else
		table.insert(troopsDefender, Entities.CU_Evil_LeaderBearman1)
		table.insert(troopsDefender, Entities.CU_Evil_LeaderBearman1)
		table.insert(troopsDefender, Entities.CU_Evil_LeaderBearman1)
		table.insert(troopsDefender, Entities.CU_Evil_LeaderSkirmisher1)
        createArmy(2,3,armyStone,4,"army2",CP_Difficulty,troopsDefender,8+CP_Difficulty*4,2000)
    end

    delayTickerArmyStone = 5

    StartSimpleJob("controlArmyStone")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyStone()

    if delayTickerArmyStone > 0 then
        delayTickerArmyStone = delayTickerArmyStone -1
        return
        end

    delayTickerArmyStone = 5

    simpleDefendBehaviour(armyStone)

    end
