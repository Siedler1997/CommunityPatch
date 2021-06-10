------------------------------------------------------------------------------------------------------------------------------------
function createDefenderArmies()
	armyDefender1 = {}
	armyDefender2 = {}
	armyDefender3 = {}
	armyDefender4 = {}
	armyDefender5 = {}
	armyDefender6 = {}

	troopsDefender = {
        Entities.PU_LeaderBow4
    	}

	if CP_Difficulty == 0 then
		table.insert(troopsDefender, Entities.PU_LeaderSword3)
		table.insert(troopsDefender, Entities.PU_LeaderPoleArm2)
		table.insert(troopsDefender, Entities.PV_Cannon2)
    elseif CP_Difficulty == 1 then
		table.insert(troopsDefender, Entities.PU_LeaderSword3)
		table.insert(troopsDefender, Entities.PU_LeaderPoleArm3)
		table.insert(troopsDefender, Entities.PV_Cannon3)
    else
		table.insert(troopsDefender, Entities.PU_LeaderSword4)
		table.insert(troopsDefender, Entities.PU_LeaderPoleArm4)
		table.insert(troopsDefender, Entities.PV_Cannon3)
    end

    createArmy(2,1,armyDefender1,3,"army1",(MEDIUM_EXPERIENCE + CP_Difficulty),troopsDefender)
    createArmy(2,2,armyDefender2,4,"army2",(MEDIUM_EXPERIENCE + CP_Difficulty),troopsDefender)
    createArmy(2,3,armyDefender3,4,"army3",(LOW_EXPERIENCE + CP_Difficulty),troopsDefender)
    createArmy(2,4,armyDefender4,7,"army4",(LOW_EXPERIENCE + CP_Difficulty),troopsDefender)
    createArmy(2,5,armyDefender5,5,"army5",(LOW_EXPERIENCE + CP_Difficulty),troopsDefender)
    createArmy(2,6,armyDefender6,4,"army6",(LOW_EXPERIENCE + CP_Difficulty),troopsDefender)

    armyDefender4.rodeLength = 1000
    armyDefender5.rodeLength = 1000
    armyDefender6.rodeLength = 1000

    delayTicker = 10

    StartSimpleJob("controlArmy")

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlArmy()

    if delayTicker > 0 then
        delayTicker = delayTicker -1
        return
        end

    simpleDefendBehaviour(armyDefender1)
    simpleDefendBehaviour(armyDefender2)
    simpleDefendBehaviour(armyDefender3)
    simpleDefendBehaviour(armyDefender4)
    simpleDefendBehaviour(armyDefender5)
    simpleDefendBehaviour(armyDefender6)

    if IsDead("spawny1") == false then

		local troopDescription = {
		    maxNumberOfSoldiers         = 8,
			minNumberOfSoldiers	        = 0,
			experiencePoints 	        = MEDIUM_EXPERIENCE,
			leaderType                  = Entities.PU_LeaderSword3,
			position                    = GetPosition("spawny1")
		}
        local randomnum = GetRandom(1, 100)
	    if CP_Difficulty > 0 then
            troopDescription.experiencePoints = VERYHIGH_EXPERIENCE
			if randomnum <= 20 then
                troopDescription.leaderType = Entities.PV_Cannon3
            elseif randomnum <= 40 then
                troopDescription.leaderType = Entities.PU_LeaderBow4
            elseif randomnum <= 70 then
                troopDescription.leaderType = Entities.PU_LeaderSword4
            else
                troopDescription.leaderType = Entities.PU_LeaderPoleArm4
            end
        else
			if randomnum <= 20 then
                troopDescription.leaderType = Entities.PV_Cannon2
            elseif randomnum <= 40 then
                troopDescription.leaderType = Entities.PU_LeaderBow4
            elseif randomnum <= 70 then
                troopDescription.leaderType = Entities.PU_LeaderSword3
            else
                troopDescription.leaderType = Entities.PU_LeaderPoleArm2
            end
        end

        if IsWeak(armyDefender4) then
            EnlargeArmy(armyDefender4,troopDescription)
            end

        if IsWeak(armyDefender5) then
            EnlargeArmy(armyDefender5,troopDescription)
            end

        if IsWeak(armyDefender6) then
            EnlargeArmy(armyDefender6,troopDescription)
            end
        end

    end
