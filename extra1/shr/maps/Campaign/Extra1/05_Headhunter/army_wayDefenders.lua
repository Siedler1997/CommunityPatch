------------------------------------------------------------------------------------------------------------------------------------
function createArmyWayDefenders()
	armyWayDefenders1 = {}
    armyWayDefenders2 = {}
    armyCamp1 = {}

	troopsDefenders = {
        Entities.CU_Evil_LeaderBearman1,
        Entities.CU_Evil_LeaderSkirmisher1,
    	}

    createArmy(2,4,armyWayDefenders1,2+2*CP_Difficulty,"armyWay1",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
    createArmy(2,5,armyWayDefenders2,2+2*CP_Difficulty,"armyWay2",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)
    createArmy(2,6,armyCamp1,4+2*CP_Difficulty,"armyCamp1",CP_Difficulty+1,troopsDefenders,12+CP_Difficulty*2)

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

    createArmy(2,7,armyCamp2,3 + 2 * CP_Difficulty,"armyCamp2",VERYHIGH_EXPERIENCE,troopsDefenders,16)

    armyCamp3 = {}

    createArmy(2,8,armyCamp3,3 + 2 * CP_Difficulty,"armyCamp3",VERYHIGH_EXPERIENCE,troopsDefenders,16)

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