------------------------------------------------------------------------------------------------------------------------------------
ARMYONE_PREPARE_FOR_BATTLE_TIME = 10
------------------------------------------------------------------------------------------------------------------------------------
STATE_PREPARE             =   0
STATE_ADVANCE             =   1
STATE_OCCUPY              =   2
STATE_FINALIZE            =   3
STATE_REFRESH             =   4
ONEMINUTE                 =   12
------------------------------------------------------------------------------------------------------------------------------------
function createAssaultArmies()

	troopsArmyOne = {
        Entities.PU_LeaderHeavyCavalry2,
    	Entities.PU_LeaderSword4,
    	Entities.PU_LeaderPoleArm4,
    	Entities.PU_LeaderBow4,
    	Entities.PV_Cannon3
    	}

	troopsArmyTwo = {
        Entities.PU_LeaderSword4,
		Entities.PU_LeaderPoleArm4,
		Entities.PU_LeaderPoleArm4,
		Entities.PU_LeaderBow4,
		}

	local experience = HIGH_EXPERIENCE
	if CP_Difficulty == 0 then
		table.insert(troopsArmyOne, Entities.PV_Cannon2)
		table.insert(troopsArmyTwo, Entities.PU_LeaderPoleArm4)
	else
		experience = experience + 1
		table.insert(troopsArmyOne, Entities.PV_Cannon4)
		table.insert(troopsArmyOne, Entities.PU_LeaderRifle2)
		table.insert(troopsArmyTwo, Entities.PU_LeaderRifle2)
	end
    -- assault army one

	armyOne = {}

    createArmy(7,1,armyOne,6,"assaultOnePrepare",experience,troopsArmyOne)

	armyOne.control.state           = STATE_PREPARE
	armyOne.control.name            = "Army One"
	armyOne.control.prepareTime     = ONEMINUTE * 10
	armyOne.control.advanceTime     = ONEMINUTE * 4
	armyOne.control.occupyTime      = ONEMINUTE * 4
	armyOne.control.finalizeTime    = ONEMINUTE * 5
	armyOne.control.refreshTime     = ONEMINUTE * 3
	armyOne.control.preparePosition = GetPosition("assaultOnePrepare")
	armyOne.control.occupyPosition  = GetPosition("assaultOneOccupy")
	armyOne.control.delay           = armyOne.control.prepareTime
	armyOne.control.refreshCount    = 2

    StartSimpleJob("controlArmyOne")

    -- assault army two, using the same control entities like army one

    armyTwo = {}

    createArmy(7,2,armyTwo,6,"assaultOnePrepare",experience,troopsArmyTwo)

	armyTwo.control.state           = STATE_PREPARE
	armyTwo.control.name            = "Army Two"
	armyTwo.control.prepareTime     = ONEMINUTE * 10
	armyTwo.control.advanceTime     = ONEMINUTE * 4
	armyTwo.control.occupyTime      = ONEMINUTE * 4
	armyTwo.control.finalizeTime    = ONEMINUTE * 5
	armyTwo.control.refreshTime     = ONEMINUTE * 2
	armyTwo.control.preparePosition = GetPosition("assaultOnePrepare")
	armyTwo.control.occupyPosition  = GetPosition("assaultOneOccupy")
	armyTwo.control.delay           = armyTwo.control.prepareTime
	armyTwo.control.refreshCount    = 2

    StartSimpleJob("controlArmyTwo")

    -- assault army three

    armyThree = {}

    createArmy(7,3,armyThree,6,"assaultTwoPrepare",experience,troopsArmyTwo)

	armyThree.control.state           = STATE_PREPARE
	armyThree.control.name            = "Army Three"
	armyThree.control.prepareTime     = ONEMINUTE * 10
	armyThree.control.advanceTime     = ONEMINUTE * 4
	armyThree.control.occupyTime      = ONEMINUTE * 4
	armyThree.control.finalizeTime    = ONEMINUTE * 5
	armyThree.control.refreshTime     = ONEMINUTE * 2
	armyThree.control.preparePosition = GetPosition("assaultTwoPrepare")
	armyThree.control.occupyPosition  = GetPosition("assaultTwoOccupy")
	armyThree.control.delay           = armyThree.control.prepareTime
	armyThree.control.refreshCount    = 2

    StartSimpleJob("controlArmyThree")

    -- assault army four

    armyFour = {}

    createArmy(7,4,armyFour,6,"assaultTwoPrepare",experience,troopsArmyOne)

	armyFour.control.state           = STATE_PREPARE
	armyFour.control.name            = "Army Four"
	armyFour.control.prepareTime     = ONEMINUTE * 10
	armyFour.control.advanceTime     = ONEMINUTE * 5
	armyFour.control.occupyTime      = ONEMINUTE * 4
	armyFour.control.finalizeTime    = ONEMINUTE * 5
	armyFour.control.refreshTime     = ONEMINUTE * 2
	armyFour.control.preparePosition  = GetPosition("assaultTwoPrepare")
	armyFour.control.occupyPosition  = GetPosition("assaultTwoOccupy")
	armyFour.control.delay           = armyFour.control.prepareTime
	armyFour.control.refreshCount    = 2

    StartSimpleJob("controlArmyFour")

    -- start timer

    GUIQuestTools.ToggleStopWatch(ONEMINUTE * 10 * 5,1)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyOne()

    if Counter.Tick2("controlArmyOne",5) == false then
        return false
        end

    controlArmy(armyOne,troopsArmyOne)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyTwo()

    if Counter.Tick2("controlArmyTwo",5) == false then
        return false
        end

    controlArmy(armyTwo,troopsArmyOne)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyThree()

    if Counter.Tick2("controlArmyThree",5) == false then
        return false
        end

    controlArmy(armyThree,troopsArmyOne)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyFour()

    if Counter.Tick2("controlArmyFour",5) == false then
        return false
        end

    controlArmy(armyFour,troopsArmyOne)

    end
