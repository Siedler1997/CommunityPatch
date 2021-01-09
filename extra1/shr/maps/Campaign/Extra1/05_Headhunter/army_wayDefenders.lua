------------------------------------------------------------------------------------------------------------------------------------
function createArmyWayDefenders()

	troopsDefenders = {
        Entities.CU_Evil_LeaderBearman1,
        Entities.CU_Evil_LeaderSkirmisher1,
    	}
    local experience = MEDIUM_EXPERIENCE
    if CP_Difficulty == 1 then
        MEDIUM_EXPERIENCE = MEDIUM_EXPERIENCE + 2
    end
	armyWayDefenders1 = {}
    createArmy(2,4,armyWayDefenders1,2,"armyWay1",experience,troopsDefenders)

    armyWayDefenders2 = {}
    createArmy(2,5,armyWayDefenders2,2,"armyWay2",experience,troopsDefenders)

    armyCamp1 = {}
    createArmy(2,6,armyCamp1,4,"armyCamp1",experience,troopsDefenders)

    StartSimpleJob("controlArmyWayDefenders")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyWayDefenders()

    if IsDead(armyWayDefenders1) == false then
        simpleDefendBehaviour(armyWayDefenders1)
        end

    if IsDead(armyWayDefenders2) == false then
        simpleDefendBehaviour(armyWayDefenders2)
        end

    if IsDead(armyCamp1) == false then
        simpleDefendBehaviour(armyCamp1)
        end

    end
------------------------------------------------------------------------------------------------------------------------------------
function createArmyCamps()

    armyCamp2 = {}

    createArmy(2,7,armyCamp2,3,"armyCamp2",VERYHIGH_EXPERIENCE,troopsDefenders)

    armyCamp3 = {}

    createArmy(2,8,armyCamp3,3,"armyCamp3",VERYHIGH_EXPERIENCE,troopsDefenders)

    delayArmyAdvancing = 10

    StartSimpleJob("controlArmyCamp2")

    StartSimpleJob("controlArmyCamp3")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyCamp2()

    if IsDead(armyCamp2) == false then
        simpleDefendBehaviour(armyCamp2)
        end

    end

   ------------------------------------------------------------------------------------------------------------------------------------
function controlArmyCamp3()

    if delayArmyAdvancing > 0 then

        delayArmyAdvancing = delayArmyAdvancing -1

        return false

        end

    delayArmyAdvancing = 10

    if IsDead(armyCamp3) == false then

        Advance(armyCamp3)

        end

    end