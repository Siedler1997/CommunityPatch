------------------------------------------------------------------------------------------------------------------------------------
function createArmyDefender0()

	armyDefender0 = {}
	armyDefender2 = {}

	troopsDefender = { }
    
	if CP_Difficulty == 0 then
        table.insert(troopsDefender, Entities.CU_BanditLeaderSword1)
        table.insert(troopsDefender, Entities.CU_BanditLeaderSword1)
        table.insert(troopsDefender, Entities.CU_BanditLeaderBow1)
        createArmy(6,0,armyDefender0,1,"army0",CP_Difficulty,troopsDefender,4,1000)
        createArmy(6,8,armyDefender2,4,"army5",CP_Difficulty,troopsDefender,4,3000)
    else
        table.insert(troopsDefender, Entities.CU_BanditLeaderSword2)
        table.insert(troopsDefender, Entities.CU_BanditLeaderSword2)
        table.insert(troopsDefender, Entities.CU_BanditLeaderBow2)
        createArmy(6,0,armyDefender0,1,"army0",CP_Difficulty,troopsDefender,4+2*CP_Difficulty,1000)
        createArmy(6,8,armyDefender2,4,"army5",CP_Difficulty,troopsDefender,4+2*CP_Difficulty,3000)
    end

    delayTickerArmy0 = 5

    StartSimpleJob("controlArmyDefender0")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyDefender0()

    if delayTickerArmy0 > 0 then
        delayTickerArmy0 = delayTickerArmy0 -1
        return
        end

    simpleDefendBehaviour(armyDefender0)
    simpleDefendBehaviour(armyDefender2)

    end
------------------------------------------------------------------------------------------------------------------------------------
function createArmyDefender1()

	troopsDefender = {
        Entities.CU_Evil_LeaderBearman1
    	}

	armyDefender1 = {}
    
    createArmy(2,0,armyDefender1,1,"army1",CP_Difficulty,troopsDefender,8+CP_Difficulty*4,2000)

    armyDefender1.rodeLength = 2000
    
    delayTickerArmy1 = 5

    StartSimpleJob("controlArmyDefender1")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyDefender1()

    if delayTickerArmy1 > 0 then
        delayTickerArmy1 = delayTickerArmy1 -1
        return
        end

    Defend(armyDefender1)

    end
