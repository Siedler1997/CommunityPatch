------------------------------------------------------------------------------------------------------------------------------------
function createArmyWayDefenders()
	armyWayDefenders1 = {}
    armyWayDefenders2 = {}
    armyCamp1 = {}

	troopsDefenders = {
        Entities.CU_Evil_LeaderBearman1,
        Entities.CU_Evil_LeaderSkirmisher1,
    	}

    if CP_Difficulty == 0 then
        createArmy(2,4,armyWayDefenders1,2,"armyWay1",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
        createArmy(2,5,armyWayDefenders2,2,"armyWay2",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
        createArmy(2,6,armyCamp1,4,"armyCamp1",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
    else
        createArmy(2,4,armyWayDefenders1,4,"armyWay1",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
        createArmy(2,5,armyWayDefenders2,4,"armyWay2",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
        createArmy(2,6,armyCamp1,7,"armyCamp1",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
    end

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
    local strength = 3
    if CP_Difficulty > 0 then
        strength = strength * 2
    end

    armyCamp2 = {}

    createArmy(2,7,armyCamp2,strength,"armyCamp2",VERYHIGH_EXPERIENCE,troopsDefenders,16)

    armyCamp3 = {}

    createArmy(2,8,armyCamp3,strength,"armyCamp3",VERYHIGH_EXPERIENCE,troopsDefenders,16)

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