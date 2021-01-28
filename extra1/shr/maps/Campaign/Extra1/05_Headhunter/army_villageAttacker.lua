SPAWN = 1
ATTACK = 2
ONEMINUTE = 60
------------------------------------------------------------------------------------------------------------------------------------
function createArmyVillageAttackers()
    local time1 = 15
    local time2 = 20
    if CP_Difficulty == 1 then
        time1 = time1 - 5
        time2 = time2 - 5
    end

	troopsAttacker = {
        Entities.CU_Evil_LeaderBearman1,
        Entities.CU_Evil_LeaderSkirmisher1,
    	}

	armyVillageAttackers1 = {}
	armyVillageAttackers1.info                  = {}
	armyVillageAttackers1.info.spawnDelay       = GetRandom(ONEMINUTE*time1)+ONEMINUTE*time2
	armyVillageAttackers1.info.spawnTime        = armyVillageAttackers1.info.spawnDelay
	armyVillageAttackers1.info.state            = SPAWN
	armyVillageAttackers1.info.id               = 1
	armyVillageAttackers1.info.spawnPosition    = "s_army1"

	armyVillageAttackers2 = {}
	armyVillageAttackers2.info                  = {}
	armyVillageAttackers2.info.spawnDelay       = GetRandom(ONEMINUTE*time1)+ONEMINUTE*time2
	armyVillageAttackers2.info.spawnTime        = armyVillageAttackers2.info.spawnDelay
	armyVillageAttackers2.info.state            = SPAWN
	armyVillageAttackers2.info.id               = 2
	armyVillageAttackers2.info.spawnPosition    = "s_army2"

	armyVillageAttackers3 = {}
	armyVillageAttackers3.info                  = {}
	armyVillageAttackers3.info.spawnDelay       = GetRandom(ONEMINUTE*time1)+ONEMINUTE*time2
	armyVillageAttackers3.info.spawnTime        = armyVillageAttackers3.info.spawnDelay
	armyVillageAttackers3.info.state            = SPAWN
	armyVillageAttackers3.info.id               = 3
	armyVillageAttackers3.info.spawnPosition    = "s_army3"

    StartSimpleJob("controlArmyVillageAttackers")

--    GUIQuestTools.ToggleStopWatch(armyVillageAttackers1.info.spawnDelay,1)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyVillageAttackers()

    controlArmyAttack(armyVillageAttackers1)
    controlArmyAttack(armyVillageAttackers2)
    controlArmyAttack(armyVillageAttackers3)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmyAttack(_army)

    --  spawn

        if _army.info.state == SPAWN then

            Report("Spawn ".._army.info.spawnTime)

            if _army.info.spawnTime > 0 then

                _army.info.spawnTime = _army.info.spawnTime -1

                return false

                end

            Report("Spawn NOW!")
            
            if CP_Difficulty == 0 then
                createArmy(2,_army.info.id,_army,2,_army.info.spawnPosition,MEDIUM_EXPERIENCE,troopsAttacker)
            else
                createArmy(2,_army.info.id,_army,4,_army.info.spawnPosition,VERYHIGH_EXPERIENCE,troopsAttacker)
            end
            _army.info.state = ATTACK

            return false

            end

    --  attack

        if _army.info.state == ATTACK then

            if IsDead(_army) then

                Report("IsDead")

               	_army.info.spawnTime = _army.info.spawnDelay

               	_army.info.spawnDelay = _army.info.spawnDelay - time2

               	if _army.info.spawnDelay < ONEMINUTE * 3 then

               	    return true

               	    end

            	_army.info.state = SPAWN

                return false

                end

            Report("Advance")

            Advance(_army)

            return false

            end

    end
