------------------------------------------------------------------------------------------------------------------------------------
function createArmyBridge()

	troopsDefender = {
        Entities.CU_Evil_LeaderBearman1,
    	}

	armyBridge = {}

	if CP_Difficulty == 0 then
        createArmy(2,4,armyBridge,8,"army3",VERYLOW_EXPERIENCE,troopsDefender,9,1000)
    else
		table.insert(troopsDefender, Entities.CU_Evil_LeaderBearman1)
		table.insert(troopsDefender, Entities.CU_Evil_LeaderBearman1)
		table.insert(troopsDefender, Entities.CU_Evil_LeaderSkirmisher1)
        createArmy(2,4,armyBridge,8,"army3",VERYHIGH_EXPERIENCE,troopsDefender,16,1000)
    end

    delayTickerArmy3 = 5

    StartSimpleJob("controlArmyBridge")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyBridge()

    if delayTickerArmy3 > 0 then

        delayTickerArmy3 = delayTickerArmy3 -1

        return

        end

    delayTickerArmy3 = 5

    if IsDead(armyBridge) then

        local position = GetPosition("bridge")

        local entities,bridgeId = Logic.GetEntitiesInArea(Entities.PB_Bridge3,position.X,position.Y,5000,1,8)

        if bridgeId ~= nil and Logic.IsConstructionComplete(bridgeId) == 1 then

            endChapterFive()

            return true

            end

        end

    Advance(armyBridge)

    end
